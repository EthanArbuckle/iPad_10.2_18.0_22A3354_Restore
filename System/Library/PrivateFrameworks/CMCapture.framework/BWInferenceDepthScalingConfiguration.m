@implementation BWInferenceDepthScalingConfiguration

- (BWInferenceDepthScalingConfiguration)initWithflipX:(BOOL)a3 clampMin:(id)a4 clampMax:(id)a5 NANValue:(id)a6 allowUpsampling:(BOOL)a7 concurrencyWidth:(unint64_t)a8
{
  BWInferenceDepthScalingConfiguration *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BWInferenceDepthScalingConfiguration;
  result = -[BWInferenceDepthScalingConfiguration init](&v15, sel_init);
  if (result)
  {
    result->_flipX = a3;
    result->_clampMin = (NSNumber *)a4;
    result->_clampMax = (NSNumber *)a5;
    result->_NANValue = (NSNumber *)a6;
    result->_allowUpsampling = a7;
    result->_concurrencyWidth = a8;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BWInferenceDepthScalingConfiguration;
  -[BWInferenceDepthScalingConfiguration dealloc](&v2, sel_dealloc);
}

- (NSNumber)NANValue
{
  return self->_NANValue;
}

- (BOOL)flipX
{
  return self->_flipX;
}

- (NSNumber)clampMax
{
  return self->_clampMax;
}

- (NSNumber)clampMin
{
  return self->_clampMin;
}

- (unint64_t)concurrencyWidth
{
  return self->_concurrencyWidth;
}

- (BOOL)allowUpsampling
{
  return self->_allowUpsampling;
}

@end
