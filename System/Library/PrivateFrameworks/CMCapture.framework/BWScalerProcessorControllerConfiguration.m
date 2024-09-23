@implementation BWScalerProcessorControllerConfiguration

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWScalerProcessorControllerConfiguration;
  -[BWStillImageProcessorControllerConfiguration dealloc](&v3, sel_dealloc);
}

- (NSDictionary)mainImageDownscalingFactorByAttachedMediaKey
{
  return self->_mainImageDownscalingFactorByAttachedMediaKey;
}

- (void)setMainImageDownscalingFactorByAttachedMediaKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BWMemoryAnalyticsPayload)memoryAnalyticsPayload
{
  return self->_memoryAnalyticsPayload;
}

- (void)setMemoryAnalyticsPayload:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

@end
