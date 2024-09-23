@implementation AXElementActionDropDescriptor

- (CGPoint)fixedScreenSpacePoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_fixedScreenSpacePoint.x;
  y = self->_fixedScreenSpacePoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setFixedScreenSpacePoint:(CGPoint)a3
{
  self->_fixedScreenSpacePoint = a3;
}

- (CGPoint)contextSpacePoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_contextSpacePoint.x;
  y = self->_contextSpacePoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setContextSpacePoint:(CGPoint)a3
{
  self->_contextSpacePoint = a3;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (void)setContextID:(unsigned int)a3
{
  self->_contextID = a3;
}

@end
