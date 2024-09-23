@implementation BWDeepFusionProcessorControllerConfiguration

- ($2825F4736939C4A6D3AD43837233062D)maxOutputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_maxOutputDimensions;
}

- (int)stillImageFusionScheme
{
  return self->_stillImageFusionScheme;
}

- (void)setStillImageFusionScheme:(int)a3
{
  self->_stillImageFusionScheme = a3;
}

- (void)setSemanticRenderingVersion:(int)a3
{
  self->_semanticRenderingVersion = a3;
}

- (void)setRawLensShadingCorrectionCoefficientsByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (void)setRawColorCalibrationsByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (void)setQuadraSupportEnabled:(BOOL)a3
{
  self->_quadraSupportEnabled = a3;
}

- (void)setMaxOutputDimensions:(id)a3
{
  self->_maxOutputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setMaxInputDimensions:(id)a3
{
  self->_maxInputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setDelayPrepareAndCacheBuffers:(BOOL)a3
{
  self->_delayPrepareAndCacheBuffers = a3;
}

- (void)setCmiResourceEnabled:(BOOL)a3
{
  self->_cmiResourceEnabled = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)maxInputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_maxInputDimensions;
}

- (BOOL)delayPrepareAndCacheBuffers
{
  return self->_delayPrepareAndCacheBuffers;
}

- (BOOL)cmiResourceEnabled
{
  return self->_cmiResourceEnabled;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWDeepFusionProcessorControllerConfiguration;
  -[BWStillImageProcessorControllerConfiguration dealloc](&v3, sel_dealloc);
}

- (BOOL)quadraSupportEnabled
{
  return self->_quadraSupportEnabled;
}

- (int)semanticRenderingVersion
{
  return self->_semanticRenderingVersion;
}

- (NSDictionary)rawColorCalibrationsByPortType
{
  return self->_rawColorCalibrationsByPortType;
}

- (NSDictionary)rawLensShadingCorrectionCoefficientsByPortType
{
  return self->_rawLensShadingCorrectionCoefficientsByPortType;
}

@end
