@implementation ADRansacLineResult

- (ADRansacLineResult)initWithSlope:(float)a3 intercept:(float)a4
{
  ADRansacLineResult *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ADRansacLineResult;
  result = -[ADRansacLineResult init](&v7, sel_init);
  if (result)
  {
    result->_slope = a3;
    result->_intercept = a4;
  }
  return result;
}

- (float)slope
{
  return self->_slope;
}

- (void)setSlope:(float)a3
{
  self->_slope = a3;
}

- (float)intercept
{
  return self->_intercept;
}

- (void)setIntercept:(float)a3
{
  self->_intercept = a3;
}

@end
