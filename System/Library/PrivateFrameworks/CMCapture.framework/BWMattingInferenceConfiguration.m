@implementation BWMattingInferenceConfiguration

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWMattingInferenceConfiguration;
  -[BWInferenceConfiguration dealloc](&v3, sel_dealloc);
}

- (float)mainImageDownscalingFactor
{
  return self->_mainImageDownscalingFactor;
}

- (void)setMainImageDownscalingFactor:(float)a3
{
  self->_mainImageDownscalingFactor = a3;
}

- (BOOL)refinedDepthDeliveryEnabled
{
  return self->_refinedDepthDeliveryEnabled;
}

- (void)setRefinedDepthDeliveryEnabled:(BOOL)a3
{
  self->_refinedDepthDeliveryEnabled = a3;
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (void)setMetalCommandQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSDictionary)sdofRenderingTuningParameters
{
  return self->_sdofRenderingTuningParameters;
}

- (void)setSdofRenderingTuningParameters:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
