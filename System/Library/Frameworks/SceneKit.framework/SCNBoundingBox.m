@implementation SCNBoundingBox

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bbox %p - min:[%f %f %f] max:[%f %f %f]"), self, self->min.x, self->min.y, self->min.z, self->max.x, self->max.y, self->max.z);
}

- (SCNVector3)min
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->min.x;
  y = self->min.y;
  z = self->min.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setMin:(SCNVector3)a3
{
  self->min = a3;
}

- (SCNVector3)max
{
  float x;
  float y;
  float z;
  SCNVector3 result;

  x = self->max.x;
  y = self->max.y;
  z = self->max.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setMax:(SCNVector3)a3
{
  self->max = a3;
}

@end
