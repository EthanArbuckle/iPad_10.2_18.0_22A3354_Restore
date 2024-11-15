@implementation BWUBProcessorControllerConfiguration

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWUBProcessorControllerConfiguration;
  -[BWStillImageProcessorControllerConfiguration dealloc](&v3, sel_dealloc);
}

- (BWVideoFormat)inputFormat
{
  return self->_inputFormat;
}

- (void)setInputFormat:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (BWVideoFormat)outputFormat
{
  return self->_outputFormat;
}

- (void)setOutputFormat:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (BOOL)quadraSupportEnabled
{
  return self->_quadraSupportEnabled;
}

- (void)setQuadraSupportEnabled:(BOOL)a3
{
  self->_quadraSupportEnabled = a3;
}

- (BOOL)fusionEnabled
{
  return self->_fusionEnabled;
}

- (void)setFusionEnabled:(BOOL)a3
{
  self->_fusionEnabled = a3;
}

- (BOOL)lowLightFusionEnabled
{
  return self->_lowLightFusionEnabled;
}

- (void)setLowLightFusionEnabled:(BOOL)a3
{
  self->_lowLightFusionEnabled = a3;
}

- (BOOL)deepFusionEnabled
{
  return self->_deepFusionEnabled;
}

- (void)setDeepFusionEnabled:(BOOL)a3
{
  self->_deepFusionEnabled = a3;
}

- (BWVideoFormat)deepFusionInputFormat
{
  return self->_deepFusionInputFormat;
}

- (void)setDeepFusionInputFormat:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (BOOL)deepFusionWaitForProcessingToFinish
{
  return self->_deepFusionWaitForProcessingToFinish;
}

- (void)setDeepFusionWaitForProcessingToFinish:(BOOL)a3
{
  self->_deepFusionWaitForProcessingToFinish = a3;
}

- (BOOL)depthDataDeliveryEnabled
{
  return self->_depthDataDeliveryEnabled;
}

- (void)setDepthDataDeliveryEnabled:(BOOL)a3
{
  self->_depthDataDeliveryEnabled = a3;
}

- (BOOL)alwaysAllowModifyingInputBuffers
{
  return self->_alwaysAllowModifyingInputBuffers;
}

- (void)setAlwaysAllowModifyingInputBuffers:(BOOL)a3
{
  self->_alwaysAllowModifyingInputBuffers = a3;
}

- (unsigned)figThreadPriority
{
  return self->_figThreadPriority;
}

- (void)setFigThreadPriority:(unsigned int)a3
{
  self->_figThreadPriority = a3;
}

- (int)greenGhostMitigationVersion
{
  return self->_greenGhostMitigationVersion;
}

- (void)setGreenGhostMitigationVersion:(int)a3
{
  self->_greenGhostMitigationVersion = a3;
}

- (BOOL)demosaicedRawEnabled
{
  return self->_demosaicedRawEnabled;
}

- (void)setDemosaicedRawEnabled:(BOOL)a3
{
  self->_demosaicedRawEnabled = a3;
}

- (unsigned)demosaicedRawPixelFormat
{
  return self->_demosaicedRawPixelFormat;
}

- (void)setDemosaicedRawPixelFormat:(unsigned int)a3
{
  self->_demosaicedRawPixelFormat = a3;
}

- (NSDictionary)rawColorCalibrationsByPortType
{
  return self->_rawColorCalibrationsByPortType;
}

- (void)setRawColorCalibrationsByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSDictionary)rawLensShadingCorrectionCoefficientsByPortType
{
  return self->_rawLensShadingCorrectionCoefficientsByPortType;
}

- (void)setRawLensShadingCorrectionCoefficientsByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (float)gainMapMainImageDownscalingFactor
{
  return self->_gainMapMainImageDownscalingFactor;
}

- (void)setGainMapMainImageDownscalingFactor:(float)a3
{
  self->_gainMapMainImageDownscalingFactor = a3;
}

@end
