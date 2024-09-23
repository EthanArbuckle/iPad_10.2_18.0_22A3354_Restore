@implementation BWVideoDepthSampleBufferPropagator

- (BWVideoDepthSampleBufferPropagator)initWithVideoRequirements:(id)a3 cloneRequirements:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWVideoDepthSampleBufferPropagator;
  return -[BWInferenceSampleBufferPropagator initWithVideoRequirements:cloneRequirements:metadataRequirements:](&v5, sel_initWithVideoRequirements_cloneRequirements_metadataRequirements_, a3, a4, 0);
}

- (BOOL)allowsAsyncPropagation
{
  return 1;
}

@end
