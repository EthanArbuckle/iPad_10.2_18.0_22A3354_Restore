@implementation HKSleepSomnogramConnection

- (HKSleepSomnogramConnection)initWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CGFloat v6;
  CGFloat v7;
  HKSleepSomnogramConnection *result;
  objc_super v9;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)HKSleepSomnogramConnection;
  result = -[HKSleepSomnogramConnection init](&v9, sel_init);
  if (result)
  {
    result->_startPoint.x = v7;
    result->_startPoint.y = v6;
    result->_endPoint.x = x;
    result->_endPoint.y = y;
  }
  return result;
}

- (CGPoint)startPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_startPoint.x;
  y = self->_startPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setStartPoint:(CGPoint)a3
{
  self->_startPoint = a3;
}

- (CGPoint)endPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_endPoint.x;
  y = self->_endPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setEndPoint:(CGPoint)a3
{
  self->_endPoint = a3;
}

@end
