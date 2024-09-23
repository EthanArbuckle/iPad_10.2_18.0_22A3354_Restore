@implementation AXPIFingerEventTouchInfo

- (CGPoint)normalizedLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_normalizedLocation.x;
  y = self->_normalizedLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setNormalizedLocation:(CGPoint)a3
{
  self->_normalizedLocation = a3;
}

- (double)force
{
  return self->_force;
}

- (void)setForce:(double)a3
{
  self->_force = a3;
}

- (NSValue)location3D
{
  return self->_location3D;
}

- (void)setLocation3D:(id)a3
{
  objc_storeStrong((id *)&self->_location3D, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location3D, 0);
}

@end
