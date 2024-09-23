@implementation GKCircleObstacle

- (GKCircleObstacle)init
{
  double v3;

  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("initWithRadius: is the destignated initialize for GKCircleObstacle.  Use that instead"));
  LODWORD(v3) = 0;
  return -[GKCircleObstacle initWithRadius:](self, "initWithRadius:", v3);
}

+ (GKCircleObstacle)obstacleWithRadius:(float)radius
{
  GKCircleObstacle *v4;
  double v5;

  v4 = [GKCircleObstacle alloc];
  *(float *)&v5 = radius;
  return -[GKCircleObstacle initWithRadius:](v4, "initWithRadius:", v5);
}

- (GKCircleObstacle)initWithRadius:(float)radius
{
  GKCircleObstacle *v4;
  double v5;
  GKCircleObstacle *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKCircleObstacle;
  v4 = -[GKCircleObstacle init](&v8, sel_init);
  v6 = v4;
  if (v4)
  {
    *(float *)&v5 = radius;
    -[GKCircleObstacle setRadius:](v4, "setRadius:", v5);
    -[GKCircleObstacle setPosition:](v6, "setPosition:", 0.0);
  }
  return v6;
}

- (void)setRadius:(float)radius
{
  self->_obstacle.radius = radius;
}

- (float)radius
{
  return self->_obstacle.radius;
}

- (void)setPosition:(vector_float2)position
{
  LODWORD(self->_obstacle.center.x) = position.i32[0];
  self->_obstacle.center.y = 0.0;
  LODWORD(self->_obstacle.center.z) = position.i32[1];
}

- (vector_float2)position
{
  vector_float2 result;

  result.i32[0] = LODWORD(self->_obstacle.center.x);
  result.i32[1] = LODWORD(self->_obstacle.center.z);
  return result;
}

- (Obstacle)obstacle
{
  return (Obstacle *)&self->_obstacle;
}

- (id).cxx_construct
{
  int v2;

  *((_QWORD *)self + 1) = &off_24F04ED68;
  *((_DWORD *)self + 4) = 1065353216;
  v2 = dword_25591E708;
  *(_QWORD *)((char *)self + 20) = _static_vec3_zero;
  *((_DWORD *)self + 7) = v2;
  return self;
}

@end
