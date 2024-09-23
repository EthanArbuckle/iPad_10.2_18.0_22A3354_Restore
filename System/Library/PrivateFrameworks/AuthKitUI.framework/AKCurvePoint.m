@implementation AKCurvePoint

+ (id)pointWithX:(double)a3 y:(double)a4
{
  return -[AKCurvePoint initWithX:y:]([AKCurvePoint alloc], "initWithX:y:", a3, a4);
}

- (AKCurvePoint)initWithX:(double)a3 y:(double)a4
{
  AKCurvePoint *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKCurvePoint;
  result = -[AKCurvePoint init](&v7, sel_init);
  if (result)
  {
    result->_x = a3;
    result->_y = a4;
  }
  return result;
}

- (void)setCGPoint:(CGPoint)a3
{
  *(CGPoint *)&self->_x = a3;
}

- (CGPoint)CGPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_x;
  y = self->_y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)x
{
  return self->_x;
}

- (void)setX:(double)a3
{
  self->_x = a3;
}

- (double)y
{
  return self->_y;
}

- (void)setY:(double)a3
{
  self->_y = a3;
}

- (CGPoint)leftTangentPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_leftTangentPoint.x;
  y = self->_leftTangentPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLeftTangentPoint:(CGPoint)a3
{
  self->_leftTangentPoint = a3;
}

- (CGPoint)rightTangentPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_rightTangentPoint.x;
  y = self->_rightTangentPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setRightTangentPoint:(CGPoint)a3
{
  self->_rightTangentPoint = a3;
}

- (double)roundness
{
  return self->_roundness;
}

- (void)setRoundness:(double)a3
{
  self->_roundness = a3;
}

- (double)smoothness
{
  return self->_smoothness;
}

- (void)setSmoothness:(double)a3
{
  self->_smoothness = a3;
}

@end
