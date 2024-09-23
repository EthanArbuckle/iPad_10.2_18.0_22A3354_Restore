@implementation GKSphereObstacle

- (GKSphereObstacle)init
{
  double v3;

  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("initWithRadius: is the destignated initialize for GKSphereObstacle.  Use that instead"));
  LODWORD(v3) = 0;
  return -[GKSphereObstacle initWithRadius:](self, "initWithRadius:", v3);
}

+ (GKSphereObstacle)obstacleWithRadius:(float)radius
{
  GKSphereObstacle *v4;
  double v5;

  v4 = [GKSphereObstacle alloc];
  *(float *)&v5 = radius;
  return -[GKSphereObstacle initWithRadius:](v4, "initWithRadius:", v5);
}

- (GKSphereObstacle)initWithRadius:(float)radius
{
  GKSphereObstacle *v4;
  double v5;
  GKSphereObstacle *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKSphereObstacle;
  v4 = -[GKSphereObstacle init](&v8, sel_init);
  v6 = v4;
  if (v4)
  {
    *(float *)&v5 = radius;
    -[GKSphereObstacle setRadius:](v4, "setRadius:", v5);
    -[GKSphereObstacle setPosition:](v6, "setPosition:", 0.0);
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

- (void)setPosition:(vector_float3)position
{
  __int128 v3;

  *(_QWORD *)&self->_obstacle.center.x = v3;
  self->_obstacle.center.z = *((float *)&v3 + 2);
}

- (vector_float3)position
{
  vector_float3 result;

  result.i64[1] = (uint64_t)a2;
  result.i64[0] = (uint64_t)self;
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
