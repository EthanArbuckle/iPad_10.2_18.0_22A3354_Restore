@implementation FigCapturePhotonicEngineSinkPipelineConfiguration

- (BOOL)sifrStillImageCaptureEnabledIfAvailable
{
  return self->_sifrStillImageCaptureEnabledIfAvailable;
}

- (NSDictionary)sensorIDStringsByPortType
{
  return self->_sensorIDStringsByPortType;
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (BOOL)gdcInDCProcessorSupported
{
  return self->_gdcInDCProcessorSupported;
}

- (BOOL)deepFusionSupported
{
  return self->_deepFusionSupported;
}

- (int)depthDataType
{
  return self->_depthDataType;
}

- (BOOL)softISPSupported
{
  return self->_softISPSupported;
}

- (void)setSifrStillImageCaptureEnabledIfAvailable:(BOOL)a3
{
  self->_sifrStillImageCaptureEnabledIfAvailable = a3;
}

- (void)setSwfrVersion:(int)a3
{
  self->_swfrVersion = a3;
}

- (void)setSupportedSemanticSegmentationMatteURNs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 360);
}

- (void)setStillImageSinkPipelineProcessingMode:(int)a3
{
  self->_stillImageSinkPipelineProcessingMode = a3;
}

- (void)setStillImageGDCSourceMode:(int)a3
{
  self->_stillImageGDCSourceMode = a3;
}

- (void)setSoftISPSupported:(BOOL)a3
{
  self->_softISPSupported = a3;
}

- (void)setSensorRawPixelFormat:(unsigned int)a3
{
  self->_sensorRawPixelFormat = a3;
}

- (void)setSensorIDStringsByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (void)setSensorCenterOffset:(CGPoint)a3
{
  self->_sensorCenterOffset = a3;
}

- (void)setSemanticStyleRenderingEnabled:(BOOL)a3
{
  self->_semanticStyleRenderingEnabled = a3;
}

- (void)setSemanticRenderingVersion:(int)a3
{
  self->_semanticRenderingVersion = a3;
}

- (void)setSemanticDevelopmentVersion:(int)a3
{
  self->_semanticDevelopmentVersion = a3;
}

- (void)setResponsiveShutterSupported:(BOOL)a3
{
  self->_responsiveShutterSupported = a3;
}

- (void)setResponsiveShutterEnabled:(BOOL)a3
{
  self->_responsiveShutterEnabled = a3;
}

- (void)setRedEyeReductionVersion:(int)a3
{
  self->_redEyeReductionVersion = a3;
}

- (void)setRawSensorDimensions:(id)a3
{
  self->_rawSensorDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setQuadraProcessingSupportEnabled:(BOOL)a3
{
  self->_quadraProcessingSupportEnabled = a3;
}

- (void)setPortTypesWithRawNightModeEnabled:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 400);
}

- (void)setPortTypesWithIntelligentDistortionCorrectionEnabled:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 232);
}

- (void)setPortTypesWithGeometricDistortionCorrectionEnabled:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (void)setPipelineStagePriority:(unsigned int)a3
{
  self->_pipelineStagePriority = a3;
}

- (void)setPearlModuleType:(int)a3
{
  self->_pearlModuleType = a3;
}

- (void)setModuleCalibrationByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 424);
}

- (void)setMaxLossyCompressionLevel:(int)a3
{
  self->_maxLossyCompressionLevel = a3;
}

- (void)setLearnedNRSupported:(BOOL)a3
{
  self->_learnedNRSupported = a3;
}

- (void)setInferencePriority:(unsigned int)a3
{
  self->_inferencePriority = a3;
}

- (void)setHighQualityPhotoCaptureForVideoFormatEnabled:(BOOL)a3
{
  self->_highQualityPhotoCaptureForVideoFormatEnabled = a3;
}

- (void)setGreenGhostMitigationVersion:(int)a3
{
  self->_greenGhostMitigationVersion = a3;
}

- (void)setGenerateInferencesForSemanticProcessingIfNeeded:(BOOL)a3
{
  self->_generateInferencesForSemanticProcessingIfNeeded = a3;
}

- (void)setGdcInDCProcessorSupported:(BOOL)a3
{
  self->_gdcInDCProcessorSupported = a3;
}

- (void)setGainMapMainImageDownscalingFactor:(float)a3
{
  self->_gainMapMainImageDownscalingFactor = a3;
}

- (void)setFastCapturePrioritizationEnabled:(BOOL)a3
{
  self->_fastCapturePrioritizationEnabled = a3;
}

- (void)setEnabledSemanticSegmentationMatteURNs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 352);
}

- (void)setDeviceType:(int)a3
{
  self->_deviceType = a3;
}

- (void)setDeviceHasFlash:(BOOL)a3
{
  self->_deviceHasFlash = a3;
}

- (void)setDepthWithDeepFusionSupported:(BOOL)a3
{
  self->_depthWithDeepFusionSupported = a3;
}

- (void)setDepthDataType:(int)a3
{
  self->_depthDataType = a3;
}

- (void)setDeferredProcessingSupported:(BOOL)a3
{
  self->_deferredProcessingSupported = a3;
}

- (void)setDeepZoomVersion:(int)a3
{
  self->_deepZoomVersion = a3;
}

- (void)setDeepZoomMode:(int)a3
{
  self->_deepZoomMode = a3;
}

- (void)setDeepFusionSupported:(BOOL)a3
{
  self->_deepFusionSupported = a3;
}

- (void)setDeepFusionEnhancedResolutionDimensions:(id)a3
{
  self->_deepFusionEnhancedResolutionDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setDcProcessorVersion:(int)a3
{
  self->_dcProcessorVersion = a3;
}

- (void)setDcProcessingWithDepthSupported:(BOOL)a3
{
  self->_dcProcessingWithDepthSupported = a3;
}

- (void)setContinuousZoomWithDepthSupported:(BOOL)a3
{
  self->_continuousZoomWithDepthSupported = a3;
}

- (void)setConstantColorVersion:(int)a3
{
  self->_constantColorVersion = a3;
}

- (void)setConstantColorSaturationBoostEnabled:(BOOL)a3
{
  self->_constantColorSaturationBoostEnabled = a3;
}

- (void)setConstantColorConfidenceMapDimensions:(id)a3
{
  self->_constantColorConfidenceMapDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setConstantColorClippingRecoveryEnabled:(BOOL)a3
{
  self->_constantColorClippingRecoveryEnabled = a3;
}

- (void)setCaptureTimePhotosCurationSupported:(BOOL)a3
{
  self->_captureTimePhotosCurationSupported = a3;
}

- (void)setCameraInfoByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 416);
}

- (void)setBaseZoomFactorsByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (void)setAdjustablePortraitLightingEffectStrengthSupported:(BOOL)a3
{
  self->_adjustablePortraitLightingEffectStrengthSupported = a3;
}

- (void)setUbInferenceMainImageDownscalingFactor:(float)a3
{
  self->_ubInferenceMainImageDownscalingFactor = a3;
}

- (int)stillImageSinkPipelineProcessingMode
{
  return self->_stillImageSinkPipelineProcessingMode;
}

- (int)constantColorVersion
{
  return self->_constantColorVersion;
}

- (NSArray)enabledSemanticSegmentationMatteURNs
{
  return self->_enabledSemanticSegmentationMatteURNs;
}

- (NSArray)supportedSemanticSegmentationMatteURNs
{
  return self->_supportedSemanticSegmentationMatteURNs;
}

- (BOOL)continuousZoomWithDepthSupported
{
  return self->_continuousZoomWithDepthSupported;
}

- (int)swfrVersion
{
  return self->_swfrVersion;
}

- (int)pearlModuleType
{
  return self->_pearlModuleType;
}

- (float)gainMapMainImageDownscalingFactor
{
  return self->_gainMapMainImageDownscalingFactor;
}

- ($2825F4736939C4A6D3AD43837233062D)deepFusionEnhancedResolutionDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_deepFusionEnhancedResolutionDimensions;
}

- ($2825F4736939C4A6D3AD43837233062D)constantColorConfidenceMapDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_constantColorConfidenceMapDimensions;
}

- (NSArray)portTypesWithGeometricDistortionCorrectionEnabled
{
  return self->_portTypesWithGeometricDistortionCorrectionEnabled;
}

- (NSArray)portTypesWithIntelligentDistortionCorrectionEnabled
{
  return self->_portTypesWithIntelligentDistortionCorrectionEnabled;
}

- (float)ubInferenceMainImageDownscalingFactor
{
  return self->_ubInferenceMainImageDownscalingFactor;
}

- (BOOL)semanticStyleRenderingEnabled
{
  return self->_semanticStyleRenderingEnabled;
}

- ($2825F4736939C4A6D3AD43837233062D)rawSensorDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_rawSensorDimensions;
}

- (unsigned)pipelineStagePriority
{
  return self->_pipelineStagePriority;
}

- (int)maxLossyCompressionLevel
{
  return self->_maxLossyCompressionLevel;
}

- (int)greenGhostMitigationVersion
{
  return self->_greenGhostMitigationVersion;
}

- (BOOL)generateInferencesForSemanticProcessingIfNeeded
{
  return self->_generateInferencesForSemanticProcessingIfNeeded;
}

- (BOOL)responsiveShutterSupported
{
  return self->_responsiveShutterSupported;
}

- (BOOL)ultraHighResolutionProcessingEnabled
{
  return self->_ultraHighResolutionProcessingEnabled;
}

- (BOOL)responsiveShutterEnabled
{
  return self->_responsiveShutterEnabled;
}

- (BOOL)fastCapturePrioritizationEnabled
{
  return self->_fastCapturePrioritizationEnabled;
}

- (int)deviceType
{
  return self->_deviceType;
}

- (int)stillImageGDCSourceMode
{
  return self->_stillImageGDCSourceMode;
}

- (unsigned)sensorRawPixelFormat
{
  return self->_sensorRawPixelFormat;
}

- (CGPoint)sensorCenterOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_sensorCenterOffset.x;
  y = self->_sensorCenterOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (int)semanticRenderingVersion
{
  return self->_semanticRenderingVersion;
}

- (int)semanticDevelopmentVersion
{
  return self->_semanticDevelopmentVersion;
}

- (int)redEyeReductionVersion
{
  return self->_redEyeReductionVersion;
}

- (NSDictionary)rawLensShadingCorrectionCoefficientsByPortType
{
  return self->_rawLensShadingCorrectionCoefficientsByPortType;
}

- (NSDictionary)rawColorCalibrationsByPortType
{
  return self->_rawColorCalibrationsByPortType;
}

- (BOOL)quadraProcessingSupportEnabled
{
  return self->_quadraProcessingSupportEnabled;
}

- (NSArray)portTypesWithRawNightModeEnabled
{
  return self->_portTypesWithRawNightModeEnabled;
}

- ($2825F4736939C4A6D3AD43837233062D)outputStillImageDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_outputStillImageDimensions;
}

- (NSDictionary)moduleCalibrationByPortType
{
  return self->_moduleCalibrationByPortType;
}

- (BOOL)learnedNRSupported
{
  return self->_learnedNRSupported;
}

- (unsigned)inferencePriority
{
  return self->_inferencePriority;
}

- (BOOL)highQualityPhotoCaptureForVideoFormatEnabled
{
  return self->_highQualityPhotoCaptureForVideoFormatEnabled;
}

- ($2825F4736939C4A6D3AD43837233062D)gdcInDCProcessorOutputCropDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_gdcInDCProcessorOutputCropDimensions;
}

- ($2825F4736939C4A6D3AD43837233062D)downgradedDeepFusionEnhancedResolutionDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_downgradedDeepFusionEnhancedResolutionDimensions;
}

- (BOOL)deviceHasFlash
{
  return self->_deviceHasFlash;
}

- (BOOL)depthWithDeepFusionSupported
{
  return self->_depthWithDeepFusionSupported;
}

- (BOOL)deferredProcessingSupported
{
  return self->_deferredProcessingSupported;
}

- (int)deepZoomVersion
{
  return self->_deepZoomVersion;
}

- (int)deepZoomMode
{
  return self->_deepZoomMode;
}

- (BOOL)constantColorSaturationBoostEnabled
{
  return self->_constantColorSaturationBoostEnabled;
}

- (BOOL)constantColorClippingRecoveryEnabled
{
  return self->_constantColorClippingRecoveryEnabled;
}

- (BOOL)captureTimePhotosCurationSupported
{
  return self->_captureTimePhotosCurationSupported;
}

- (int)dcProcessorVersion
{
  return self->_dcProcessorVersion;
}

- (BOOL)dcProcessingWithDepthSupported
{
  return self->_dcProcessingWithDepthSupported;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCapturePhotonicEngineSinkPipelineConfiguration;
  -[FigCaptureBaseStillImageSinkPipelineConfiguration dealloc](&v3, sel_dealloc);
}

- (void)setUltraHighResolutionProcessingEnabled:(BOOL)a3
{
  self->_ultraHighResolutionProcessingEnabled = a3;
}

- (void)setDemosaicedRawPixelFormat:(unsigned int)a3
{
  self->_demosaicedRawPixelFormat = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigCapturePhotonicEngineSinkPipelineConfiguration)initWithCoder:(id)a3
{
  FigCapturePhotonicEngineSinkPipelineConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;
  _QWORD v21[2];
  _QWORD v22[3];
  uint64_t v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[4];
  _QWORD v28[4];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[3];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)FigCapturePhotonicEngineSinkPipelineConfiguration;
  v4 = -[FigCaptureBaseStillImageSinkPipelineConfiguration initWithCoder:](&v20, sel_initWithCoder_);
  if (v4)
  {
    v4->_stillImageSinkPipelineProcessingMode = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("stillImageSinkPipelineProcessingMode"));
    v4->_pipelineStagePriority = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("pipelineStagePriority"));
    v4->_inferencePriority = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("inferencePriority"));
    v4->_deviceType = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("deviceType"));
    v4->_devicePosition = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("devicePosition"));
    v4->_rawSensorDimensions.height = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("rawSensorDimensionsHeight"));
    v4->_rawSensorDimensions.width = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("rawSensorDimensionsWidth"));
    v4->_sensorCenterOffset.x = (double)(int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("sensorCenterOffsetX"));
    v4->_sensorCenterOffset.y = (double)(int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("sensorCenterOffsetY"));
    v4->_outputStillImageDimensions.width = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("outputStillImageDimensionsWidth"));
    v4->_outputStillImageDimensions.height = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("outputStillImageDimensionsHeight"));
    v5 = (void *)MEMORY[0x1E0C99E60];
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    v4->_sensorIDStringsByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2)), CFSTR("sensorIDStringsByPortType"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    v31[2] = objc_opt_class();
    v4->_baseZoomFactorsByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3)), CFSTR("baseZoomFactorsByPortType"));
    v4->_swfrVersion = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("swfrVersion"));
    v4->_redEyeReductionVersion = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("redEyeReductionVersion"));
    v4->_semanticRenderingVersion = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("semanticRenderingVersion"));
    v4->_semanticDevelopmentVersion = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("semanticDevelopmentVersion"));
    v4->_semanticStyleRenderingEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("semanticStyleRenderingEnabled"));
    v4->_smartStyleRenderingVersion = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("smartStyleRenderingVersion"));
    v4->_smartStyleReversibilityEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("smartStyleReversibilityEnabled"));
    v4->_smartStyleLinearThumbnailDimensions.width = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("smartStyleLinearThumbnailWidth"));
    v4->_smartStyleLinearThumbnailDimensions.height = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("smartStyleLinearThumbnailHeight"));
    v4->_smartStyleStyledThumbnailDimensions.width = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("smartStyleStyledThumbnailWidth"));
    v4->_smartStyleStyledThumbnailDimensions.height = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("smartStyleStyledThumbnailHeight"));
    v4->_constantColorVersion = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("constantColorVersion"));
    v4->_constantColorConfidenceMapDimensions.width = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("constantColorConfidenceMapDimensionsWidth"));
    v4->_constantColorConfidenceMapDimensions.height = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("constantColorConfidenceMapDimensionsHeight"));
    v4->_constantColorClippingRecoveryEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("constantColorClippingRecoveryEnabled"));
    v4->_constantColorSaturationBoostEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("constantColorSaturationBoostEnabled"));
    v4->_generateInferencesForSemanticProcessingIfNeeded = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("generateInferencesForSemanticProcessingIfNeeded"));
    v7 = (void *)MEMORY[0x1E0C99E60];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v4->_portTypesWithGeometricDistortionCorrectionEnabled = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2)), CFSTR("portTypesWithGeometricDistortionCorrectionEnabled"));
    v8 = (void *)MEMORY[0x1E0C99E60];
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    v4->_portTypesWithIntelligentDistortionCorrectionEnabled = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v8, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2)), CFSTR("portTypesWithIntelligentDistortionCorrectionEnabled"));
    v4->_dcProcessorVersion = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("dcProcessorVersion"));
    v4->_gdcInDCProcessorSupported = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("gdcInDCProcessorSupported"));
    v4->_gdcInDCProcessorOutputCropDimensions.width = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("gdcInDCProcessorOutputCropDimensionsWidth"));
    v4->_gdcInDCProcessorOutputCropDimensions.height = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("gdcInDCProcessorOutputCropDimensionsHeight"));
    v4->_dcProcessingWithDepthSupported = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("dcProcessingWithDepthSupported"));
    v4->_stillImageGDCSourceMode = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("stillImageGDCSourceMode"));
    v4->_greenGhostMitigationVersion = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("greenGhostMitigationVersion"));
    v4->_deepZoomVersion = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("deepZoomVersion"));
    v4->_deepZoomMode = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("deepZoomMode"));
    v4->_demosaicedRawPixelFormat = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("demosaicedRawPixelFormat"));
    v9 = (void *)MEMORY[0x1E0C99E60];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    v28[2] = objc_opt_class();
    v28[3] = objc_opt_class();
    v4->_rawColorCalibrationsByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v9, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4)), CFSTR("rawColorCalibrationsByPortType"));
    v10 = (void *)MEMORY[0x1E0C99E60];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v27[2] = objc_opt_class();
    v27[3] = objc_opt_class();
    v4->_rawLensShadingCorrectionCoefficientsByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v10, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4)), CFSTR("rawLensShadingCorrectionCoefficientsByPortType"));
    v4->_deferredProcessingSupported = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("deferredProcessingSupported"));
    v4->_continuousZoomWithDepthSupported = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("continuousZoomWithDepthSupported"));
    v4->_adjustablePortraitLightingEffectStrengthSupported = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("adjustablePortraitLightingEffectStrengthSupported"));
    v4->_deepFusionSupported = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("deepFusionSupported"));
    v4->_depthWithDeepFusionSupported = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("depthWithDeepFusionSupported"));
    v4->_deepFusionEnhancedResolutionDimensions.width = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("deepFusionEnhancedResolutionDimensionsWidth"));
    v4->_deepFusionEnhancedResolutionDimensions.height = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("DeepFusionEnhancedResolutionDimensionsHeight"));
    v4->_downgradedDeepFusionEnhancedResolutionDimensions.width = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("wasDeepFusionEnhancedResolutionDimensionsWidth"));
    v4->_downgradedDeepFusionEnhancedResolutionDimensions.height = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("wasDeepFusionEnhancedResolutionDimensionsHeight"));
    v4->_learnedNRSupported = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("learnedNRSupported"));
    v4->_responsiveShutterSupported = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("responsiveShutterSupported"));
    v4->_responsiveShutterEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("responsiveShutterEnabled"));
    v4->_fastCapturePrioritizationEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("fastCapturePrioritizationEnabled"));
    v4->_captureTimePhotosCurationSupported = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("captureTimePhotosCurationSupported"));
    v4->_depthDataType = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("depthDataType"));
    v4->_pearlModuleType = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("pearlModuleType"));
    v4->_sifrStillImageCaptureEnabledIfAvailable = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("sifrStillImageCaptureEnabledIfAvailable"));
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("gainMapMainImageDownscalingFactor"));
    v4->_gainMapMainImageDownscalingFactor = v11;
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("ubInferenceMainImageDownscalingFactor"));
    v4->_ubInferenceMainImageDownscalingFactor = v12;
    v13 = (void *)MEMORY[0x1E0C99E60];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    v26[2] = objc_opt_class();
    v26[3] = objc_opt_class();
    v26[4] = objc_opt_class();
    v4->_enabledSemanticSegmentationMatteURNs = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v13, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 5)), CFSTR("enabledSemanticSegmentationMatteURNs"));
    v14 = (void *)MEMORY[0x1E0C99E60];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v25[2] = objc_opt_class();
    v25[3] = objc_opt_class();
    v25[4] = objc_opt_class();
    v4->_supportedSemanticSegmentationMatteURNs = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 5)), CFSTR("supportedSemanticSegmentationMatteURNs"));
    v4->_maxLossyCompressionLevel = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("maxLossyCompressionLevel"));
    v15 = (void *)MEMORY[0x1E0C99E60];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v24[2] = objc_opt_class();
    v24[3] = objc_opt_class();
    v24[4] = objc_opt_class();
    v4->_cameraInfoByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v15, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 5)), CFSTR("cameraInfoByPortType"));
    v16 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    v4->_moduleCalibrationByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v16, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1)), CFSTR("moduleCalibrationByPortType"));
    v4->_highQualityPhotoCaptureForVideoFormatEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("highQualityPhotoCaptureForVideoFormatEnabled"));
    v4->_softISPSupported = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("softISPSupported"));
    v4->_sensorRawPixelFormat = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("sensorRawPixelFormat"));
    v4->_quadraProcessingSupportEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("quadraProcessingSupportEnabled"));
    v17 = (void *)MEMORY[0x1E0C99E60];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v22[2] = objc_opt_class();
    v4->_dimensionsByQSubResolutionFlavorByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v17, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3)), CFSTR("dimensionsByQSubResolutionFlavorByPortType"));
    v4->_ultraHighResolutionProcessingEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("ultraHighResolutionProcessingEnabled"));
    v4->_sfhrMode = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("sfhrMode"));
    v18 = (void *)MEMORY[0x1E0C99E60];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v4->_portTypesWithRawNightModeEnabled = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v18, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2)), CFSTR("portTypesWithRawNightModeEnabled"));
    v4->_stereoPhotoOutputDimensions.width = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("stereoPhotoOutputDimensionsWidth"));
    v4->_stereoPhotoOutputDimensions.height = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("stereoPhotoOutputDimensionsHeight"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  FigCapturePhotonicEngineSinkPipelineConfiguration *v4;
  double v5;
  double v6;
  objc_super v7;

  v4 = self;
  v7.receiver = self;
  v7.super_class = (Class)FigCapturePhotonicEngineSinkPipelineConfiguration;
  -[FigCaptureBaseStillImageSinkPipelineConfiguration encodeWithCoder:](&v7, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_stillImageSinkPipelineProcessingMode, CFSTR("stillImageSinkPipelineProcessingMode"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_pipelineStagePriority, CFSTR("pipelineStagePriority"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_inferencePriority, CFSTR("inferencePriority"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_deviceType, CFSTR("deviceType"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_devicePosition, CFSTR("devicePosition"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_rawSensorDimensions.height, CFSTR("rawSensorDimensionsHeight"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_rawSensorDimensions.width, CFSTR("rawSensorDimensionsWidth"));
  objc_msgSend(a3, "encodeInt32:forKey:", (int)v4->_sensorCenterOffset.x, CFSTR("sensorCenterOffsetX"));
  objc_msgSend(a3, "encodeInt32:forKey:", (int)v4->_sensorCenterOffset.y, CFSTR("sensorCenterOffsetY"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_outputStillImageDimensions.width, CFSTR("outputStillImageDimensionsWidth"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_outputStillImageDimensions.height, CFSTR("outputStillImageDimensionsHeight"));
  objc_msgSend(a3, "encodeObject:forKey:", v4->_sensorIDStringsByPortType, CFSTR("sensorIDStringsByPortType"));
  objc_msgSend(a3, "encodeObject:forKey:", v4->_baseZoomFactorsByPortType, CFSTR("baseZoomFactorsByPortType"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_swfrVersion, CFSTR("swfrVersion"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_redEyeReductionVersion, CFSTR("redEyeReductionVersion"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_semanticRenderingVersion, CFSTR("semanticRenderingVersion"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_semanticDevelopmentVersion, CFSTR("semanticDevelopmentVersion"));
  objc_msgSend(a3, "encodeBool:forKey:", v4->_semanticStyleRenderingEnabled, CFSTR("semanticStyleRenderingEnabled"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_smartStyleRenderingVersion, CFSTR("smartStyleRenderingVersion"));
  objc_msgSend(a3, "encodeBool:forKey:", v4->_smartStyleReversibilityEnabled, CFSTR("smartStyleReversibilityEnabled"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_smartStyleLinearThumbnailDimensions.width, CFSTR("smartStyleLinearThumbnailWidth"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_smartStyleLinearThumbnailDimensions.height, CFSTR("smartStyleLinearThumbnailHeight"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_smartStyleStyledThumbnailDimensions.width, CFSTR("smartStyleStyledThumbnailWidth"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_smartStyleStyledThumbnailDimensions.height, CFSTR("smartStyleStyledThumbnailHeight"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_constantColorVersion, CFSTR("constantColorVersion"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_constantColorConfidenceMapDimensions.width, CFSTR("constantColorConfidenceMapDimensionsWidth"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_constantColorConfidenceMapDimensions.height, CFSTR("constantColorConfidenceMapDimensionsHeight"));
  objc_msgSend(a3, "encodeBool:forKey:", v4->_constantColorClippingRecoveryEnabled, CFSTR("constantColorClippingRecoveryEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", v4->_constantColorSaturationBoostEnabled, CFSTR("constantColorSaturationBoostEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", v4->_generateInferencesForSemanticProcessingIfNeeded, CFSTR("generateInferencesForSemanticProcessingIfNeeded"));
  objc_msgSend(a3, "encodeObject:forKey:", v4->_portTypesWithGeometricDistortionCorrectionEnabled, CFSTR("portTypesWithGeometricDistortionCorrectionEnabled"));
  objc_msgSend(a3, "encodeObject:forKey:", v4->_portTypesWithIntelligentDistortionCorrectionEnabled, CFSTR("portTypesWithIntelligentDistortionCorrectionEnabled"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_dcProcessorVersion, CFSTR("dcProcessorVersion"));
  objc_msgSend(a3, "encodeBool:forKey:", v4->_gdcInDCProcessorSupported, CFSTR("gdcInDCProcessorSupported"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_gdcInDCProcessorOutputCropDimensions.width, CFSTR("gdcInDCProcessorOutputCropDimensionsWidth"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_gdcInDCProcessorOutputCropDimensions.height, CFSTR("gdcInDCProcessorOutputCropDimensionsHeight"));
  objc_msgSend(a3, "encodeBool:forKey:", v4->_dcProcessingWithDepthSupported, CFSTR("dcProcessingWithDepthSupported"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_stillImageGDCSourceMode, CFSTR("stillImageGDCSourceMode"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_greenGhostMitigationVersion, CFSTR("greenGhostMitigationVersion"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_deepZoomVersion, CFSTR("deepZoomVersion"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_deepZoomMode, CFSTR("deepZoomMode"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_demosaicedRawPixelFormat, CFSTR("demosaicedRawPixelFormat"));
  objc_msgSend(a3, "encodeObject:forKey:", v4->_rawColorCalibrationsByPortType, CFSTR("rawColorCalibrationsByPortType"));
  objc_msgSend(a3, "encodeObject:forKey:", v4->_rawLensShadingCorrectionCoefficientsByPortType, CFSTR("rawLensShadingCorrectionCoefficientsByPortType"));
  objc_msgSend(a3, "encodeBool:forKey:", v4->_deferredProcessingSupported, CFSTR("deferredProcessingSupported"));
  objc_msgSend(a3, "encodeBool:forKey:", v4->_continuousZoomWithDepthSupported, CFSTR("continuousZoomWithDepthSupported"));
  objc_msgSend(a3, "encodeBool:forKey:", v4->_adjustablePortraitLightingEffectStrengthSupported, CFSTR("adjustablePortraitLightingEffectStrengthSupported"));
  objc_msgSend(a3, "encodeBool:forKey:", v4->_deepFusionSupported, CFSTR("deepFusionSupported"));
  objc_msgSend(a3, "encodeBool:forKey:", v4->_depthWithDeepFusionSupported, CFSTR("depthWithDeepFusionSupported"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_deepFusionEnhancedResolutionDimensions.width, CFSTR("deepFusionEnhancedResolutionDimensionsWidth"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_deepFusionEnhancedResolutionDimensions.height, CFSTR("DeepFusionEnhancedResolutionDimensionsHeight"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_downgradedDeepFusionEnhancedResolutionDimensions.width, CFSTR("wasDeepFusionEnhancedResolutionDimensionsWidth"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_downgradedDeepFusionEnhancedResolutionDimensions.height, CFSTR("wasDeepFusionEnhancedResolutionDimensionsHeight"));
  objc_msgSend(a3, "encodeBool:forKey:", v4->_learnedNRSupported, CFSTR("learnedNRSupported"));
  objc_msgSend(a3, "encodeBool:forKey:", v4->_responsiveShutterSupported, CFSTR("responsiveShutterSupported"));
  objc_msgSend(a3, "encodeBool:forKey:", v4->_responsiveShutterEnabled, CFSTR("responsiveShutterEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", v4->_fastCapturePrioritizationEnabled, CFSTR("fastCapturePrioritizationEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", v4->_captureTimePhotosCurationSupported, CFSTR("captureTimePhotosCurationSupported"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_depthDataType, CFSTR("depthDataType"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_pearlModuleType, CFSTR("pearlModuleType"));
  objc_msgSend(a3, "encodeBool:forKey:", v4->_sifrStillImageCaptureEnabledIfAvailable, CFSTR("sifrStillImageCaptureEnabledIfAvailable"));
  *(float *)&v5 = v4->_gainMapMainImageDownscalingFactor;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("gainMapMainImageDownscalingFactor"), v5);
  *(float *)&v6 = v4->_ubInferenceMainImageDownscalingFactor;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("ubInferenceMainImageDownscalingFactor"), v6);
  objc_msgSend(a3, "encodeObject:forKey:", v4->_enabledSemanticSegmentationMatteURNs, CFSTR("enabledSemanticSegmentationMatteURNs"));
  objc_msgSend(a3, "encodeObject:forKey:", v4->_supportedSemanticSegmentationMatteURNs, CFSTR("supportedSemanticSegmentationMatteURNs"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_maxLossyCompressionLevel, CFSTR("maxLossyCompressionLevel"));
  objc_msgSend(a3, "encodeObject:forKey:", v4->_cameraInfoByPortType, CFSTR("cameraInfoByPortType"));
  objc_msgSend(a3, "encodeObject:forKey:", v4->_moduleCalibrationByPortType, CFSTR("moduleCalibrationByPortType"));
  objc_msgSend(a3, "encodeBool:forKey:", v4->_highQualityPhotoCaptureForVideoFormatEnabled, CFSTR("highQualityPhotoCaptureForVideoFormatEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", v4->_softISPSupported, CFSTR("softISPSupported"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_sensorRawPixelFormat, CFSTR("sensorRawPixelFormat"));
  objc_msgSend(a3, "encodeBool:forKey:", v4->_quadraProcessingSupportEnabled, CFSTR("quadraProcessingSupportEnabled"));
  objc_msgSend(a3, "encodeObject:forKey:", v4->_dimensionsByQSubResolutionFlavorByPortType, CFSTR("dimensionsByQSubResolutionFlavorByPortType"));
  objc_msgSend(a3, "encodeBool:forKey:", v4->_ultraHighResolutionProcessingEnabled, CFSTR("ultraHighResolutionProcessingEnabled"));
  objc_msgSend(a3, "encodeInt32:forKey:", v4->_sfhrMode, CFSTR("sfhrMode"));
  objc_msgSend(a3, "encodeObject:forKey:", v4->_portTypesWithRawNightModeEnabled, CFSTR("portTypesWithRawNightModeEnabled"));
  v4 = (FigCapturePhotonicEngineSinkPipelineConfiguration *)((char *)v4 + 408);
  objc_msgSend(a3, "encodeInt32:forKey:", LODWORD(v4->super.super.isa), CFSTR("stereoPhotoOutputDimensionsWidth"));
  objc_msgSend(a3, "encodeInt32:forKey:", HIDWORD(v4->super.super.isa), CFSTR("stereoPhotoOutputDimensionsHeight"));
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int v23;
  unint64_t v24;
  NSDictionary *v25;
  NSDictionary *v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  unint64_t v35;
  int v36;
  unint64_t v37;
  int v38;
  int v39;
  unint64_t v40;
  int v41;
  int v42;
  int v43;
  NSArray *v44;
  NSArray *v45;
  int v46;
  int v47;
  unint64_t v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  unsigned int v54;
  NSDictionary *v55;
  NSDictionary *v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  NSArray *v76;
  NSArray *v77;
  int v78;
  NSDictionary *v79;
  NSDictionary *v80;
  int v81;
  int v82;
  unsigned int v83;
  int v84;
  NSDictionary *v85;
  int v86;
  unsigned int v87;
  NSArray *v88;
  objc_super v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;

  if (a3 == self)
  {
    LOBYTE(v9) = 1;
    return v9;
  }
  v91 = v6;
  v92 = v5;
  v93 = v3;
  v94 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_37;
  v90.receiver = self;
  v90.super_class = (Class)FigCapturePhotonicEngineSinkPipelineConfiguration;
  v9 = -[FigCaptureBaseStillImageSinkPipelineConfiguration isEqual:](&v90, sel_isEqual_, a3);
  if (v9)
  {
    v10 = -[FigCapturePhotonicEngineSinkPipelineConfiguration stillImageSinkPipelineProcessingMode](self, "stillImageSinkPipelineProcessingMode");
    if (v10 != objc_msgSend(a3, "stillImageSinkPipelineProcessingMode"))
      goto LABEL_37;
    v11 = -[FigCapturePhotonicEngineSinkPipelineConfiguration pipelineStagePriority](self, "pipelineStagePriority");
    if (v11 != objc_msgSend(a3, "pipelineStagePriority"))
      goto LABEL_37;
    v12 = -[FigCapturePhotonicEngineSinkPipelineConfiguration inferencePriority](self, "inferencePriority");
    if (v12 != objc_msgSend(a3, "inferencePriority"))
      goto LABEL_37;
    v13 = -[FigCapturePhotonicEngineSinkPipelineConfiguration deviceType](self, "deviceType");
    if (v13 != objc_msgSend(a3, "deviceType"))
      goto LABEL_37;
    v14 = -[FigCapturePhotonicEngineSinkPipelineConfiguration devicePosition](self, "devicePosition");
    if (v14 != objc_msgSend(a3, "devicePosition"))
      goto LABEL_37;
    v9 = FigCaptureVideoDimensionsAreEqual(-[FigCapturePhotonicEngineSinkPipelineConfiguration rawSensorDimensions](self, "rawSensorDimensions"), objc_msgSend(a3, "rawSensorDimensions"));
    if (v9)
    {
      v15 = (int)-[FigCapturePhotonicEngineSinkPipelineConfiguration rawSensorDimensions](self, "rawSensorDimensions");
      if (v15 != objc_msgSend(a3, "rawSensorDimensions"))
        goto LABEL_37;
      v16 = (unint64_t)-[FigCapturePhotonicEngineSinkPipelineConfiguration rawSensorDimensions](self, "rawSensorDimensions") >> 32;
      if ((_DWORD)v16 != (unint64_t)objc_msgSend(a3, "rawSensorDimensions") >> 32)
        goto LABEL_37;
      -[FigCapturePhotonicEngineSinkPipelineConfiguration sensorCenterOffset](self, "sensorCenterOffset");
      v18 = v17;
      objc_msgSend(a3, "sensorCenterOffset");
      if (v18 != v19)
        goto LABEL_37;
      -[FigCapturePhotonicEngineSinkPipelineConfiguration sensorCenterOffset](self, "sensorCenterOffset");
      v21 = v20;
      objc_msgSend(a3, "sensorCenterOffset");
      if (v21 != v22)
        goto LABEL_37;
      v23 = (int)-[FigCapturePhotonicEngineSinkPipelineConfiguration outputStillImageDimensions](self, "outputStillImageDimensions");
      if (v23 != objc_msgSend(a3, "outputStillImageDimensions"))
        goto LABEL_37;
      v24 = (unint64_t)-[FigCapturePhotonicEngineSinkPipelineConfiguration outputStillImageDimensions](self, "outputStillImageDimensions") >> 32;
      if ((_DWORD)v24 != (unint64_t)objc_msgSend(a3, "outputStillImageDimensions") >> 32)
        goto LABEL_37;
      v25 = -[FigCapturePhotonicEngineSinkPipelineConfiguration sensorIDStringsByPortType](self, "sensorIDStringsByPortType");
      if (v25 == (NSDictionary *)objc_msgSend(a3, "sensorIDStringsByPortType")
        || (v9 = -[NSDictionary isEqual:](-[FigCapturePhotonicEngineSinkPipelineConfiguration sensorIDStringsByPortType](self, "sensorIDStringsByPortType"), "isEqual:", objc_msgSend(a3, "sensorIDStringsByPortType"))) != 0)
      {
        v26 = -[FigCapturePhotonicEngineSinkPipelineConfiguration baseZoomFactorsByPortType](self, "baseZoomFactorsByPortType");
        if (v26 == (NSDictionary *)objc_msgSend(a3, "baseZoomFactorsByPortType")
          || (v9 = -[NSDictionary isEqual:](-[FigCapturePhotonicEngineSinkPipelineConfiguration baseZoomFactorsByPortType](self, "baseZoomFactorsByPortType"), "isEqual:", objc_msgSend(a3, "baseZoomFactorsByPortType"))) != 0)
        {
          v27 = -[FigCapturePhotonicEngineSinkPipelineConfiguration swfrVersion](self, "swfrVersion");
          if (v27 != objc_msgSend(a3, "swfrVersion"))
            goto LABEL_37;
          v28 = -[FigCapturePhotonicEngineSinkPipelineConfiguration redEyeReductionVersion](self, "redEyeReductionVersion");
          if (v28 != objc_msgSend(a3, "redEyeReductionVersion"))
            goto LABEL_37;
          v29 = -[FigCapturePhotonicEngineSinkPipelineConfiguration semanticRenderingVersion](self, "semanticRenderingVersion");
          if (v29 != objc_msgSend(a3, "semanticRenderingVersion"))
            goto LABEL_37;
          v30 = -[FigCapturePhotonicEngineSinkPipelineConfiguration semanticDevelopmentVersion](self, "semanticDevelopmentVersion");
          if (v30 != objc_msgSend(a3, "semanticDevelopmentVersion"))
            goto LABEL_37;
          v31 = -[FigCapturePhotonicEngineSinkPipelineConfiguration semanticStyleRenderingEnabled](self, "semanticStyleRenderingEnabled");
          if (v31 != objc_msgSend(a3, "semanticStyleRenderingEnabled"))
            goto LABEL_37;
          v32 = -[FigCapturePhotonicEngineSinkPipelineConfiguration smartStyleRenderingVersion](self, "smartStyleRenderingVersion");
          if (v32 != objc_msgSend(a3, "smartStyleRenderingVersion"))
            goto LABEL_37;
          v33 = -[FigCapturePhotonicEngineSinkPipelineConfiguration smartStyleReversibilityEnabled](self, "smartStyleReversibilityEnabled");
          if (v33 != objc_msgSend(a3, "smartStyleReversibilityEnabled"))
            goto LABEL_37;
          v34 = (int)-[FigCapturePhotonicEngineSinkPipelineConfiguration smartStyleLinearThumbnailDimensions](self, "smartStyleLinearThumbnailDimensions");
          if (v34 != objc_msgSend(a3, "smartStyleLinearThumbnailDimensions"))
            goto LABEL_37;
          v35 = (unint64_t)-[FigCapturePhotonicEngineSinkPipelineConfiguration smartStyleLinearThumbnailDimensions](self, "smartStyleLinearThumbnailDimensions") >> 32;
          if ((_DWORD)v35 != (unint64_t)objc_msgSend(a3, "smartStyleLinearThumbnailDimensions") >> 32)
            goto LABEL_37;
          v36 = (int)-[FigCapturePhotonicEngineSinkPipelineConfiguration smartStyleStyledThumbnailDimensions](self, "smartStyleStyledThumbnailDimensions");
          if (v36 != objc_msgSend(a3, "smartStyleStyledThumbnailDimensions"))
            goto LABEL_37;
          v37 = (unint64_t)-[FigCapturePhotonicEngineSinkPipelineConfiguration smartStyleStyledThumbnailDimensions](self, "smartStyleStyledThumbnailDimensions") >> 32;
          if ((_DWORD)v37 != (unint64_t)objc_msgSend(a3, "smartStyleStyledThumbnailDimensions") >> 32)
            goto LABEL_37;
          v38 = -[FigCapturePhotonicEngineSinkPipelineConfiguration constantColorVersion](self, "constantColorVersion");
          if (v38 != objc_msgSend(a3, "constantColorVersion"))
            goto LABEL_37;
          v39 = (int)-[FigCapturePhotonicEngineSinkPipelineConfiguration constantColorConfidenceMapDimensions](self, "constantColorConfidenceMapDimensions");
          if (v39 != objc_msgSend(a3, "constantColorConfidenceMapDimensions"))
            goto LABEL_37;
          v40 = (unint64_t)-[FigCapturePhotonicEngineSinkPipelineConfiguration constantColorConfidenceMapDimensions](self, "constantColorConfidenceMapDimensions") >> 32;
          if ((_DWORD)v40 != (unint64_t)objc_msgSend(a3, "constantColorConfidenceMapDimensions") >> 32)
            goto LABEL_37;
          v41 = -[FigCapturePhotonicEngineSinkPipelineConfiguration constantColorClippingRecoveryEnabled](self, "constantColorClippingRecoveryEnabled");
          if (v41 != objc_msgSend(a3, "constantColorClippingRecoveryEnabled"))
            goto LABEL_37;
          v42 = -[FigCapturePhotonicEngineSinkPipelineConfiguration constantColorSaturationBoostEnabled](self, "constantColorSaturationBoostEnabled");
          if (v42 != objc_msgSend(a3, "constantColorSaturationBoostEnabled"))
            goto LABEL_37;
          v43 = -[FigCapturePhotonicEngineSinkPipelineConfiguration generateInferencesForSemanticProcessingIfNeeded](self, "generateInferencesForSemanticProcessingIfNeeded");
          if (v43 != objc_msgSend(a3, "generateInferencesForSemanticProcessingIfNeeded"))
            goto LABEL_37;
          v44 = -[FigCapturePhotonicEngineSinkPipelineConfiguration portTypesWithGeometricDistortionCorrectionEnabled](self, "portTypesWithGeometricDistortionCorrectionEnabled");
          if (v44 == (NSArray *)objc_msgSend(a3, "portTypesWithGeometricDistortionCorrectionEnabled")
            || (v9 = -[NSArray isEqual:](-[FigCapturePhotonicEngineSinkPipelineConfiguration portTypesWithGeometricDistortionCorrectionEnabled](self, "portTypesWithGeometricDistortionCorrectionEnabled"), "isEqual:", objc_msgSend(a3, "portTypesWithGeometricDistortionCorrectionEnabled"))) != 0)
          {
            v45 = -[FigCapturePhotonicEngineSinkPipelineConfiguration portTypesWithIntelligentDistortionCorrectionEnabled](self, "portTypesWithIntelligentDistortionCorrectionEnabled");
            if (v45 == (NSArray *)objc_msgSend(a3, "portTypesWithIntelligentDistortionCorrectionEnabled")
              || (v9 = -[NSArray isEqual:](-[FigCapturePhotonicEngineSinkPipelineConfiguration portTypesWithIntelligentDistortionCorrectionEnabled](self, "portTypesWithIntelligentDistortionCorrectionEnabled"), "isEqual:", objc_msgSend(a3, "portTypesWithIntelligentDistortionCorrectionEnabled"))) != 0)
            {
              v46 = -[FigCapturePhotonicEngineSinkPipelineConfiguration dcProcessorVersion](self, "dcProcessorVersion");
              if (v46 != objc_msgSend(a3, "dcProcessorVersion"))
                goto LABEL_37;
              v47 = (int)-[FigCapturePhotonicEngineSinkPipelineConfiguration gdcInDCProcessorOutputCropDimensions](self, "gdcInDCProcessorOutputCropDimensions");
              if (v47 != objc_msgSend(a3, "gdcInDCProcessorOutputCropDimensions"))
                goto LABEL_37;
              v48 = (unint64_t)-[FigCapturePhotonicEngineSinkPipelineConfiguration gdcInDCProcessorOutputCropDimensions](self, "gdcInDCProcessorOutputCropDimensions") >> 32;
              if ((_DWORD)v48 != (unint64_t)objc_msgSend(a3, "gdcInDCProcessorOutputCropDimensions") >> 32)
                goto LABEL_37;
              v49 = -[FigCapturePhotonicEngineSinkPipelineConfiguration dcProcessingWithDepthSupported](self, "dcProcessingWithDepthSupported");
              if (v49 != objc_msgSend(a3, "dcProcessingWithDepthSupported"))
                goto LABEL_37;
              v50 = -[FigCapturePhotonicEngineSinkPipelineConfiguration stillImageGDCSourceMode](self, "stillImageGDCSourceMode");
              if (v50 != objc_msgSend(a3, "stillImageGDCSourceMode"))
                goto LABEL_37;
              v51 = -[FigCapturePhotonicEngineSinkPipelineConfiguration greenGhostMitigationVersion](self, "greenGhostMitigationVersion");
              if (v51 != objc_msgSend(a3, "greenGhostMitigationVersion"))
                goto LABEL_37;
              v52 = -[FigCapturePhotonicEngineSinkPipelineConfiguration deepZoomVersion](self, "deepZoomVersion");
              if (v52 != objc_msgSend(a3, "deepZoomVersion"))
                goto LABEL_37;
              v53 = -[FigCapturePhotonicEngineSinkPipelineConfiguration deepZoomMode](self, "deepZoomMode");
              if (v53 != objc_msgSend(a3, "deepZoomMode"))
                goto LABEL_37;
              v54 = -[FigCapturePhotonicEngineSinkPipelineConfiguration demosaicedRawPixelFormat](self, "demosaicedRawPixelFormat");
              if (v54 != objc_msgSend(a3, "demosaicedRawPixelFormat"))
                goto LABEL_37;
              v55 = -[FigCapturePhotonicEngineSinkPipelineConfiguration rawColorCalibrationsByPortType](self, "rawColorCalibrationsByPortType");
              if (v55 == (NSDictionary *)objc_msgSend(a3, "rawColorCalibrationsByPortType")
                || (v9 = -[NSDictionary isEqual:](-[FigCapturePhotonicEngineSinkPipelineConfiguration rawColorCalibrationsByPortType](self, "rawColorCalibrationsByPortType"), "isEqual:", objc_msgSend(a3, "rawColorCalibrationsByPortType"))) != 0)
              {
                v56 = -[FigCapturePhotonicEngineSinkPipelineConfiguration rawLensShadingCorrectionCoefficientsByPortType](self, "rawLensShadingCorrectionCoefficientsByPortType");
                if (v56 == (NSDictionary *)objc_msgSend(a3, "rawLensShadingCorrectionCoefficientsByPortType")
                  || (v9 = -[NSDictionary isEqual:](-[FigCapturePhotonicEngineSinkPipelineConfiguration rawLensShadingCorrectionCoefficientsByPortType](self, "rawLensShadingCorrectionCoefficientsByPortType"), "isEqual:", objc_msgSend(a3, "rawLensShadingCorrectionCoefficientsByPortType"))) != 0)
                {
                  v57 = -[FigCapturePhotonicEngineSinkPipelineConfiguration deferredProcessingSupported](self, "deferredProcessingSupported");
                  if (v57 != objc_msgSend(a3, "deferredProcessingSupported"))
                    goto LABEL_37;
                  v58 = -[FigCapturePhotonicEngineSinkPipelineConfiguration continuousZoomWithDepthSupported](self, "continuousZoomWithDepthSupported");
                  if (v58 != objc_msgSend(a3, "continuousZoomWithDepthSupported"))
                    goto LABEL_37;
                  v59 = -[FigCapturePhotonicEngineSinkPipelineConfiguration adjustablePortraitLightingEffectStrengthSupported](self, "adjustablePortraitLightingEffectStrengthSupported");
                  if (v59 != objc_msgSend(a3, "adjustablePortraitLightingEffectStrengthSupported"))
                    goto LABEL_37;
                  v60 = -[FigCapturePhotonicEngineSinkPipelineConfiguration deepFusionSupported](self, "deepFusionSupported");
                  if (v60 != objc_msgSend(a3, "deepFusionSupported"))
                    goto LABEL_37;
                  v61 = -[FigCapturePhotonicEngineSinkPipelineConfiguration depthWithDeepFusionSupported](self, "depthWithDeepFusionSupported");
                  if (v61 != objc_msgSend(a3, "depthWithDeepFusionSupported"))
                    goto LABEL_37;
                  v9 = FigCaptureVideoDimensionsAreEqual(-[FigCapturePhotonicEngineSinkPipelineConfiguration deepFusionEnhancedResolutionDimensions](self, "deepFusionEnhancedResolutionDimensions"), objc_msgSend(a3, "deepFusionEnhancedResolutionDimensions"));
                  if (!v9)
                    return v9;
                  v9 = FigCaptureVideoDimensionsAreEqual(-[FigCapturePhotonicEngineSinkPipelineConfiguration downgradedDeepFusionEnhancedResolutionDimensions](self, "downgradedDeepFusionEnhancedResolutionDimensions"), objc_msgSend(a3, "downgradedDeepFusionEnhancedResolutionDimensions"));
                  if (!v9)
                    return v9;
                  v62 = -[FigCapturePhotonicEngineSinkPipelineConfiguration learnedNRSupported](self, "learnedNRSupported");
                  if (v62 != objc_msgSend(a3, "learnedNRSupported"))
                    goto LABEL_37;
                  v63 = -[FigCapturePhotonicEngineSinkPipelineConfiguration responsiveShutterSupported](self, "responsiveShutterSupported");
                  if (v63 != objc_msgSend(a3, "responsiveShutterSupported"))
                    goto LABEL_37;
                  v64 = -[FigCapturePhotonicEngineSinkPipelineConfiguration responsiveShutterEnabled](self, "responsiveShutterEnabled");
                  if (v64 != objc_msgSend(a3, "responsiveShutterEnabled"))
                    goto LABEL_37;
                  v65 = -[FigCapturePhotonicEngineSinkPipelineConfiguration fastCapturePrioritizationEnabled](self, "fastCapturePrioritizationEnabled");
                  if (v65 != objc_msgSend(a3, "fastCapturePrioritizationEnabled"))
                    goto LABEL_37;
                  v66 = -[FigCapturePhotonicEngineSinkPipelineConfiguration captureTimePhotosCurationSupported](self, "captureTimePhotosCurationSupported");
                  if (v66 != objc_msgSend(a3, "captureTimePhotosCurationSupported"))
                    goto LABEL_37;
                  v67 = -[FigCapturePhotonicEngineSinkPipelineConfiguration depthDataType](self, "depthDataType");
                  if (v67 != objc_msgSend(a3, "depthDataType"))
                    goto LABEL_37;
                  v68 = -[FigCapturePhotonicEngineSinkPipelineConfiguration pearlModuleType](self, "pearlModuleType");
                  if (v68 != objc_msgSend(a3, "pearlModuleType"))
                    goto LABEL_37;
                  v69 = -[FigCapturePhotonicEngineSinkPipelineConfiguration sifrStillImageCaptureEnabledIfAvailable](self, "sifrStillImageCaptureEnabledIfAvailable");
                  if (v69 != objc_msgSend(a3, "sifrStillImageCaptureEnabledIfAvailable"))
                    goto LABEL_37;
                  -[FigCapturePhotonicEngineSinkPipelineConfiguration gainMapMainImageDownscalingFactor](self, "gainMapMainImageDownscalingFactor");
                  v71 = v70;
                  objc_msgSend(a3, "gainMapMainImageDownscalingFactor");
                  if (v71 != v72)
                    goto LABEL_37;
                  -[FigCapturePhotonicEngineSinkPipelineConfiguration ubInferenceMainImageDownscalingFactor](self, "ubInferenceMainImageDownscalingFactor");
                  v74 = v73;
                  objc_msgSend(a3, "ubInferenceMainImageDownscalingFactor");
                  if (v74 != v75)
                    goto LABEL_37;
                  v76 = -[FigCapturePhotonicEngineSinkPipelineConfiguration enabledSemanticSegmentationMatteURNs](self, "enabledSemanticSegmentationMatteURNs");
                  if (v76 == (NSArray *)objc_msgSend(a3, "enabledSemanticSegmentationMatteURNs")
                    || (v9 = -[NSArray isEqual:](-[FigCapturePhotonicEngineSinkPipelineConfiguration enabledSemanticSegmentationMatteURNs](self, "enabledSemanticSegmentationMatteURNs"), "isEqual:", objc_msgSend(a3, "enabledSemanticSegmentationMatteURNs"))) != 0)
                  {
                    v77 = -[FigCapturePhotonicEngineSinkPipelineConfiguration supportedSemanticSegmentationMatteURNs](self, "supportedSemanticSegmentationMatteURNs");
                    if (v77 == (NSArray *)objc_msgSend(a3, "supportedSemanticSegmentationMatteURNs")
                      || (v9 = -[NSArray isEqual:](-[FigCapturePhotonicEngineSinkPipelineConfiguration supportedSemanticSegmentationMatteURNs](self, "supportedSemanticSegmentationMatteURNs"), "isEqual:", objc_msgSend(a3, "supportedSemanticSegmentationMatteURNs"))) != 0)
                    {
                      v78 = -[FigCapturePhotonicEngineSinkPipelineConfiguration maxLossyCompressionLevel](self, "maxLossyCompressionLevel");
                      if (v78 != objc_msgSend(a3, "maxLossyCompressionLevel"))
                        goto LABEL_37;
                      v79 = -[FigCapturePhotonicEngineSinkPipelineConfiguration cameraInfoByPortType](self, "cameraInfoByPortType");
                      if (v79 == (NSDictionary *)objc_msgSend(a3, "cameraInfoByPortType")
                        || (v9 = -[NSDictionary isEqual:](-[FigCapturePhotonicEngineSinkPipelineConfiguration cameraInfoByPortType](self, "cameraInfoByPortType"), "isEqual:", objc_msgSend(a3, "cameraInfoByPortType"))) != 0)
                      {
                        v80 = -[FigCapturePhotonicEngineSinkPipelineConfiguration moduleCalibrationByPortType](self, "moduleCalibrationByPortType");
                        if (v80 == (NSDictionary *)objc_msgSend(a3, "moduleCalibrationByPortType")
                          || (v9 = -[NSDictionary isEqual:](-[FigCapturePhotonicEngineSinkPipelineConfiguration moduleCalibrationByPortType](self, "moduleCalibrationByPortType"), "isEqual:", objc_msgSend(a3, "moduleCalibrationByPortType"))) != 0)
                        {
                          v81 = -[FigCapturePhotonicEngineSinkPipelineConfiguration highQualityPhotoCaptureForVideoFormatEnabled](self, "highQualityPhotoCaptureForVideoFormatEnabled");
                          if (v81 == objc_msgSend(a3, "highQualityPhotoCaptureForVideoFormatEnabled"))
                          {
                            v82 = -[FigCapturePhotonicEngineSinkPipelineConfiguration softISPSupported](self, "softISPSupported");
                            if (v82 == objc_msgSend(a3, "softISPSupported"))
                            {
                              v83 = -[FigCapturePhotonicEngineSinkPipelineConfiguration sensorRawPixelFormat](self, "sensorRawPixelFormat");
                              if (v83 == objc_msgSend(a3, "sensorRawPixelFormat"))
                              {
                                v84 = -[FigCapturePhotonicEngineSinkPipelineConfiguration quadraProcessingSupportEnabled](self, "quadraProcessingSupportEnabled");
                                if (v84 == objc_msgSend(a3, "quadraProcessingSupportEnabled"))
                                {
                                  v85 = -[FigCapturePhotonicEngineSinkPipelineConfiguration dimensionsByQSubResolutionFlavorByPortType](self, "dimensionsByQSubResolutionFlavorByPortType");
                                  if (v85 != (NSDictionary *)objc_msgSend(a3, "dimensionsByQSubResolutionFlavorByPortType"))
                                  {
                                    v9 = -[NSDictionary isEqual:](-[FigCapturePhotonicEngineSinkPipelineConfiguration dimensionsByQSubResolutionFlavorByPortType](self, "dimensionsByQSubResolutionFlavorByPortType"), "isEqual:", objc_msgSend(a3, "dimensionsByQSubResolutionFlavorByPortType"));
                                    if (!v9)
                                      return v9;
                                  }
                                  v86 = -[FigCapturePhotonicEngineSinkPipelineConfiguration ultraHighResolutionProcessingEnabled](self, "ultraHighResolutionProcessingEnabled");
                                  if (v86 == objc_msgSend(a3, "ultraHighResolutionProcessingEnabled"))
                                  {
                                    v87 = -[FigCapturePhotonicEngineSinkPipelineConfiguration sfhrMode](self, "sfhrMode");
                                    if (v87 == objc_msgSend(a3, "sfhrMode"))
                                    {
                                      v88 = -[FigCapturePhotonicEngineSinkPipelineConfiguration portTypesWithRawNightModeEnabled](self, "portTypesWithRawNightModeEnabled");
                                      if (v88 == (NSArray *)objc_msgSend(a3, "portTypesWithRawNightModeEnabled")
                                        || (v9 = -[NSArray isEqual:](-[FigCapturePhotonicEngineSinkPipelineConfiguration portTypesWithRawNightModeEnabled](self, "portTypesWithRawNightModeEnabled"), "isEqual:", objc_msgSend(a3, "portTypesWithRawNightModeEnabled"))) != 0)
                                      {
                                        LOBYTE(v9) = FigCaptureVideoDimensionsAreEqual(-[FigCapturePhotonicEngineSinkPipelineConfiguration stereoPhotoOutputDimensions](self, "stereoPhotoOutputDimensions"), objc_msgSend(a3, "stereoPhotoOutputDimensions"));
                                      }
                                      return v9;
                                    }
                                  }
                                }
                              }
                            }
                          }
LABEL_37:
                          LOBYTE(v9) = 0;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v9;
}

- (int)devicePosition
{
  return self->_devicePosition;
}

- (void)setDevicePosition:(int)a3
{
  self->_devicePosition = a3;
}

- (void)setOutputStillImageDimensions:(id)a3
{
  self->_outputStillImageDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (NSDictionary)baseZoomFactorsByPortType
{
  return self->_baseZoomFactorsByPortType;
}

- (int)smartStyleRenderingVersion
{
  return self->_smartStyleRenderingVersion;
}

- (void)setSmartStyleRenderingVersion:(int)a3
{
  self->_smartStyleRenderingVersion = a3;
}

- (BOOL)smartStyleReversibilityEnabled
{
  return self->_smartStyleReversibilityEnabled;
}

- (void)setSmartStyleReversibilityEnabled:(BOOL)a3
{
  self->_smartStyleReversibilityEnabled = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)smartStyleLinearThumbnailDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_smartStyleLinearThumbnailDimensions;
}

- (void)setSmartStyleLinearThumbnailDimensions:(id)a3
{
  self->_smartStyleLinearThumbnailDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- ($2825F4736939C4A6D3AD43837233062D)smartStyleStyledThumbnailDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_smartStyleStyledThumbnailDimensions;
}

- (void)setSmartStyleStyledThumbnailDimensions:(id)a3
{
  self->_smartStyleStyledThumbnailDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setGdcInDCProcessorOutputCropDimensions:(id)a3
{
  self->_gdcInDCProcessorOutputCropDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (unsigned)demosaicedRawPixelFormat
{
  return self->_demosaicedRawPixelFormat;
}

- (void)setRawColorCalibrationsByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 280);
}

- (void)setRawLensShadingCorrectionCoefficientsByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

- (BOOL)adjustablePortraitLightingEffectStrengthSupported
{
  return self->_adjustablePortraitLightingEffectStrengthSupported;
}

- (void)setDowngradedDeepFusionEnhancedResolutionDimensions:(id)a3
{
  self->_downgradedDeepFusionEnhancedResolutionDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (NSDictionary)dimensionsByQSubResolutionFlavorByPortType
{
  return self->_dimensionsByQSubResolutionFlavorByPortType;
}

- (void)setDimensionsByQSubResolutionFlavorByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 384);
}

- (unsigned)sfhrMode
{
  return self->_sfhrMode;
}

- (void)setSfhrMode:(unsigned int)a3
{
  self->_sfhrMode = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)stereoPhotoOutputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_stereoPhotoOutputDimensions;
}

- (void)setStereoPhotoOutputDimensions:(id)a3
{
  self->_stereoPhotoOutputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

@end
