@implementation CRKExponentialGrowthFunction

- (CRKExponentialGrowthFunction)initWithGrowthRate:(double)a3
{
  CRKExponentialGrowthFunction *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRKExponentialGrowthFunction;
  result = -[CRKExponentialGrowthFunction init](&v5, sel_init);
  if (result)
    result->_growthRate = a3;
  return result;
}

- (double)evaluateWithValue:(double)a3
{
  double v4;

  -[CRKExponentialGrowthFunction growthRate](self, "growthRate");
  return v4 * a3;
}

- (double)growthRate
{
  return self->_growthRate;
}

@end
