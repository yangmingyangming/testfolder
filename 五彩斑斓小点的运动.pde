Ball[] ball=new Ball[100];
void setup()
{
  size(800, 800);
  for (int i=0; i<ball.length; i++)
  {
    ball[i]=new Ball(new PVector(random(0, width), random(0, height)), random(5, 10));
  }
}
void draw()
{
  noStroke();
  fill(0, 50);
  rect(0, 0, width, height);
  for (int i=0; i<ball.length; i++)
  {
    ball[i].update();
    ball[i].display();
    ball[i].check();
  }
}
class Ball
{
  PVector loc;
  float vx=0, vy=0;
  float r;
  float angle=0;
  float R, G, B;
  Ball(PVector loc, float r)
  {
    this.r=r;
    R=map(loc.x, 0, width, 0, 255);
    G=map(loc.x, 0, width, 255, 0);
    B=map(loc.y, 0, height, 0, 255);
  }
  void update()
  {
    angle +=0.02*noise(0.001*loc.x, 0.001*loc.y);
    vx=2*sin(angle);
    vy=2*cos(angle);
    loc.x+=vx;
    loc.y+=vy;
  }
  void display()
  {
    noStroke();
    fill(R, G, B);
    ellipse(loc.x, loc.y, r, r);
  }
  void check()
  {
    if (loc.x<0) loc.x= width;
    if (loc.x>width) loc.x=0;
    if (loc.y<0) loc.y=height;
    if (loc.y>height) loc.y=0;
  }
}
