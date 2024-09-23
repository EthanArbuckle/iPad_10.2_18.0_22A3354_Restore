@implementation BWNRFProcessorControllerConfiguration

- (void)setOutputFormat:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (BOOL)demosaicedRawEnabled
{
  return self->_demosaicedRawEnabled;
}

- (void)setSwfrEnabled:(BOOL)a3
{
  self->_swfrEnabled = a3;
}

- (void)setSemanticRenderingVersion:(int)a3
{
  self->_semanticRenderingVersion = a3;
}

- (void)setRawLensShadingCorrectionCoefficientsByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (void)setRawColorCalibrationsByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (void)setQuadraSupportEnabled:(BOOL)a3
{
  self->_quadraSupportEnabled = a3;
}

- (void)setInputFormat:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (void)setGreenGhostMitigationVersion:(int)a3
{
  self->_greenGhostMitigationVersion = a3;
}

- (void)setGainMapMainImageDownscalingFactor:(float)a3
{
  self->_gainMapMainImageDownscalingFactor = a3;
}

- (void)setFusionEnabled:(BOOL)a3
{
  self->_fusionEnabled = a3;
}

- (void)setFigThreadPriority:(unsigned int)a3
{
  self->_figThreadPriority = a3;
}

- (void)setDepthDataDeliveryEnabled:(BOOL)a3
{
  self->_depthDataDeliveryEnabled = a3;
}

- (void)setDemosaicedRawPixelFormat:(unsigned int)a3
{
  self->_demosaicedRawPixelFormat = a3;
}

- (void)setDemosaicedRawEnabled:(BOOL)a3
{
  self->_demosaicedRawEnabled = a3;
}

- (void)setDeepFusionWaitForProcessingToFinish:(BOOL)a3
{
  self->_deepFusionWaitForProcessingToFinish = a3;
}

- (void)setDeepFusionInputFormat:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (void)setDeepFusionEnabled:(BOOL)a3
{
  self->_deepFusionEnabled = a3;
}

- (void)setCmiResourceEnabled:(BOOL)a3
{
  self->_cmiResourceEnabled = a3;
}

- (void)setAlwaysAllowModifyingInputBuffers:(BOOL)a3
{
  self->_alwaysAllowModifyingInputBuffers = a3;
}

- (void)setRawNightModeEnabled:(BOOL)a3
{
  self->_rawNightModeEnabled = a3;
}

- (void)setLowLightFusionEnabled:(BOOL)a3
{
  self->_lowLightFusionEnabled = a3;
}

- (BWVideoFormat)outputFormat
{
  return self->_outputFormat;
}

- (BOOL)rawNightModeEnabled
{
  return self->_rawNightModeEnabled;
}

- (BOOL)lowLightFusionEnabled
{
  return self->_lowLightFusionEnabled;
}

- (BWVideoFormat)inputFormat
{
  return self->_inputFormat;
}

- (BOOL)fusionEnabled
{
  return self->_fusionEnabled;
}

- (BOOL)deepFusionEnabled
{
  return self->_deepFusionEnabled;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWNRFProcessorControllerConfiguration;
  -[BWStillImageProcessorControllerConfiguration dealloc](&v3, sel_dealloc);
}

- (NSDictionary)dimensionsByQSubResolutionFlavor
{
  return self->_dimensionsByQSubResolutionFlavor;
}

- (void)setDimensionsByQSubResolutionFlavor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (BOOL)cmiResourceEnabled
{
  return self->_cmiResourceEnabled;
}

- (BOOL)quadraSupportEnabled
{
  return self->_quadraSupportEnabled;
}

- (int)semanticRenderingVersion
{
  return self->_semanticRenderingVersion;
}

- (BWVideoFormat)rawNightModeInputFormat
{
  return self->_rawNightModeInputFormat;
}

- (void)setRawNightModeInputFormat:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (BWVideoFormat)deepFusionInputFormat
{
  return self->_deepFusionInputFormat;
}

- (BOOL)deepFusionWaitForProcessingToFinish
{
  return self->_deepFusionWaitForProcessingToFinish;
}

- (BOOL)swfrEnabled
{
  return self->_swfrEnabled;
}

- (unsigned)learnedNRMode
{
  return self->_learnedNRMode;
}

- (void)setLearnedNRMode:(unsigned int)a3
{
  self->_learnedNRMode = a3;
}

- (BWVideoFormat)learnedNRInputFormat
{
  return self->_learnedNRInputFormat;
}

- (void)setLearnedNRInputFormat:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (BOOL)depthDataDeliveryEnabled
{
  return self->_depthDataDeliveryEnabled;
}

- (BOOL)alwaysAllowModifyingInputBuffers
{
  return self->_alwaysAllowModifyingInputBuffers;
}

- (unsigned)figThreadPriority
{
  return self->_figThreadPriority;
}

- (int)greenGhostMitigationVersion
{
  return self->_greenGhostMitigationVersion;
}

- (unsigned)demosaicedRawPixelFormat
{
  return self->_demosaicedRawPixelFormat;
}

- (NSDictionary)rawColorCalibrationsByPortType
{
  return self->_rawColorCalibrationsByPortType;
}

- (NSDictionary)rawLensShadingCorrectionCoefficientsByPortType
{
  return self->_rawLensShadingCorrectionCoefficientsByPortType;
}

- (float)gainMapMainImageDownscalingFactor
{
  return self->_gainMapMainImageDownscalingFactor;
}

@end
