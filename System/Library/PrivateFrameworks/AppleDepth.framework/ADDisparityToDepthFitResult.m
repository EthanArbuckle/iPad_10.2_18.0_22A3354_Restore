@implementation ADDisparityToDepthFitResult

- (ADDisparityToDepthFitResult)initWithDisparityToDepthMultiplier:(float)a3 disparityToDepthOffset:(float)a4
{
  ADDisparityToDepthFitResult *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ADDisparityToDepthFitResult;
  result = -[ADDisparityToDepthFitResult init](&v7, sel_init);
  if (result)
  {
    result->_disparityToDepthMultiplier = a3;
    result->_disparityToDepthOffset = a4;
  }
  return result;
}

- (float)disparityToDepthMultiplier
{
  return self->_disparityToDepthMultiplier;
}

- (float)disparityToDepthOffset
{
  return self->_disparityToDepthOffset;
}

@end
