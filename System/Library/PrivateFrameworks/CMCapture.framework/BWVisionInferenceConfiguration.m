@implementation BWVisionInferenceConfiguration

- (void)setShouldPreventRequestForSampleBuffer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWVisionInferenceConfiguration;
  -[BWInferenceConfiguration dealloc](&v3, sel_dealloc);
}

- (id)shouldPreventRequestForSampleBuffer
{
  return self->_shouldPreventRequestForSampleBuffer;
}

- (BOOL)reuseUpstreamFaceObservations
{
  return self->_reuseUpstreamFaceObservations;
}

- (void)setReuseUpstreamFaceObservations:(BOOL)a3
{
  self->_reuseUpstreamFaceObservations = a3;
}

- (BOOL)suppressTimeOutFailure
{
  return self->_suppressTimeOutFailure;
}

- (void)setSuppressTimeOutFailure:(BOOL)a3
{
  self->_suppressTimeOutFailure = a3;
}

@end
