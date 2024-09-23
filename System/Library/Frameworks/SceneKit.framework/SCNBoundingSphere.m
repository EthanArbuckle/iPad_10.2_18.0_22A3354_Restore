@implementation SCNBoundingSphere

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bsphere %p - center:[%f %f %f] radius:%f"), self, self->center.x, self->center.y, self->center.z, *(_QWORD *)&self->radius);
}

- (SCNVector3)center
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->center.x;
  y = self->center.y;
  z = self->center.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCenter:(SCNVector3)a3
{
  self->center = a3;
}

- (double)radius
{
  return self->radius;
}

- (void)setRadius:(double)a3
{
  self->radius = a3;
}

@end
