@implementation FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration)initWithCoder:(id)a3
{
  FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *v4;
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
  objc_super v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[4];
  _QWORD v22[4];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[3];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration;
  v4 = -[FigCaptureBaseStillImageSinkPipelineConfiguration initWithCoder:](&v17, sel_initWithCoder_);
  if (v4)
  {
    v4->_stillImageSinkPipelineProcessingMode = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("stillImageSinkPipelineProcessingMode"));
    v4->_pipelineStagePriority = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("pipelineStagePriority"));
    v4->_inferencePriority = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("inferencePriority"));
    v4->_deviceType = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("deviceType"));
    v4->_rawSensorDimensions.height = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("rawSensorDimensionsHeight"));
    v4->_rawSensorDimensions.width = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("rawSensorDimensionsWidth"));
    v4->_outputStillImageDimensions.width = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("outputStillImageDimensionsWidth"));
    v4->_outputStillImageDimensions.height = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("outputStillImageDimensionsHeight"));
    v5 = (void *)MEMORY[0x1E0C99E60];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    v4->_sensorIDStringsByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2)), CFSTR("sensorIDStringsByPortType"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v25[2] = objc_opt_class();
    v4->_baseZoomFactorsByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3)), CFSTR("baseZoomFactorsByPortType"));
    v4->_redEyeReductionVersion = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("redEyeReductionVersion"));
    v4->_semanticRenderingVersion = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("semanticRenderingVersion"));
    v4->_semanticDevelopmentVersion = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("semanticDevelopmentVersion"));
    v4->_semanticStyleRenderingEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("semanticStyleRenderingEnabled"));
    v7 = (void *)MEMORY[0x1E0C99E60];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v4->_portTypesWithGeometricDistortionCorrectionEnabled = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2)), CFSTR("portTypesWithGeometricDistortionCorrectionEnabled"));
    v8 = (void *)MEMORY[0x1E0C99E60];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v4->_portTypesWithIntelligentDistortionCorrectionEnabled = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v8, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2)), CFSTR("portTypesWithIntelligentDistortionCorrectionEnabled"));
    v4->_dcProcessorVersion = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("dcProcessorVersion"));
    v4->_gdcInDCProcessorSupported = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("gdcInDCProcessorSupported"));
    v4->_gdcInDCProcessorOutputCropDimensions.width = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("gdcInDCProcessorOutputCropDimensionsWidth"));
    v4->_gdcInDCProcessorOutputCropDimensions.height = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("gdcInDCProcessorOutputCropDimensionsHeight"));
    v4->_greenGhostMitigationVersion = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("greenGhostMitigationVersion"));
    v4->_deepZoomVersion = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("deepZoomVersion"));
    v4->_demosaicedRawPixelFormat = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("demosaicedRawPixelFormat"));
    v9 = (void *)MEMORY[0x1E0C99E60];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v22[2] = objc_opt_class();
    v22[3] = objc_opt_class();
    v4->_rawColorCalibrationsByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v9, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4)), CFSTR("rawColorCalibrationsByPortType"));
    v10 = (void *)MEMORY[0x1E0C99E60];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    v21[3] = objc_opt_class();
    v4->_rawLensShadingCorrectionCoefficientsByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v10, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4)), CFSTR("rawLensShadingCorrectionCoefficientsByPortType"));
    v4->_deferredProcessingSupported = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("deferredProcessingSupported"));
    v4->_adjustablePortraitLightingEffectStrengthSupported = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("adjustablePortraitLightingEffectStrengthSupported"));
    v4->_deepFusionSupported = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("deepFusionSupported"));
    v4->_deepFusionEnhancedResolutionDimensions.width = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("deepFusionEnhancedResolutionDimensionsWidth"));
    v4->_deepFusionEnhancedResolutionDimensions.height = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("deepFusionEnhancedResolutionDimensionsHeight"));
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
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v20[2] = objc_opt_class();
    v20[3] = objc_opt_class();
    v20[4] = objc_opt_class();
    v4->_enabledSemanticSegmentationMatteURNs = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v13, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 5)), CFSTR("enabledSemanticSegmentationMatteURNs"));
    v14 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v19[3] = objc_opt_class();
    v19[4] = objc_opt_class();
    v4->_supportedSemanticSegmentationMatteURNs = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 5)), CFSTR("supportedSemanticSegmentationMatteURNs"));
    v4->_maxLossyCompressionLevel = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("maxLossyCompressionLevel"));
    v15 = (void *)MEMORY[0x1E0C99E60];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    v18[3] = objc_opt_class();
    v18[4] = objc_opt_class();
    v4->_cameraInfoByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v15, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 5)), CFSTR("cameraInfoByPortType"));
    v4->_highQualityPhotoCaptureForVideoFormatEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("highQualityPhotoCaptureForVideoFormatEnabled"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration;
  -[FigCaptureBaseStillImageSinkPipelineConfiguration encodeWithCoder:](&v7, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeInt32:forKey:", self->_stillImageSinkPipelineProcessingMode, CFSTR("stillImageSinkPipelineProcessingMode"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_pipelineStagePriority, CFSTR("pipelineStagePriority"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_inferencePriority, CFSTR("inferencePriority"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_deviceType, CFSTR("deviceType"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_rawSensorDimensions.height, CFSTR("rawSensorDimensionsHeight"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_rawSensorDimensions.width, CFSTR("rawSensorDimensionsWidth"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_outputStillImageDimensions.width, CFSTR("outputStillImageDimensionsWidth"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_outputStillImageDimensions.height, CFSTR("outputStillImageDimensionsHeight"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_sensorIDStringsByPortType, CFSTR("sensorIDStringsByPortType"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_baseZoomFactorsByPortType, CFSTR("baseZoomFactorsByPortType"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_redEyeReductionVersion, CFSTR("redEyeReductionVersion"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_semanticRenderingVersion, CFSTR("semanticRenderingVersion"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_semanticDevelopmentVersion, CFSTR("semanticDevelopmentVersion"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_semanticStyleRenderingEnabled, CFSTR("semanticStyleRenderingEnabled"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_portTypesWithGeometricDistortionCorrectionEnabled, CFSTR("portTypesWithGeometricDistortionCorrectionEnabled"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_portTypesWithIntelligentDistortionCorrectionEnabled, CFSTR("portTypesWithIntelligentDistortionCorrectionEnabled"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_dcProcessorVersion, CFSTR("dcProcessorVersion"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_gdcInDCProcessorSupported, CFSTR("gdcInDCProcessorSupported"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_gdcInDCProcessorOutputCropDimensions.width, CFSTR("gdcInDCProcessorOutputCropDimensionsWidth"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_gdcInDCProcessorOutputCropDimensions.height, CFSTR("gdcInDCProcessorOutputCropDimensionsHeight"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_greenGhostMitigationVersion, CFSTR("greenGhostMitigationVersion"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_deepZoomVersion, CFSTR("deepZoomVersion"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_demosaicedRawPixelFormat, CFSTR("demosaicedRawPixelFormat"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_rawColorCalibrationsByPortType, CFSTR("rawColorCalibrationsByPortType"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_rawLensShadingCorrectionCoefficientsByPortType, CFSTR("rawLensShadingCorrectionCoefficientsByPortType"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_deferredProcessingSupported, CFSTR("deferredProcessingSupported"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_adjustablePortraitLightingEffectStrengthSupported, CFSTR("adjustablePortraitLightingEffectStrengthSupported"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_deepFusionSupported, CFSTR("deepFusionSupported"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_deepFusionEnhancedResolutionDimensions.width, CFSTR("deepFusionEnhancedResolutionDimensionsWidth"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_deepFusionEnhancedResolutionDimensions.height, CFSTR("deepFusionEnhancedResolutionDimensionsHeight"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_learnedNRSupported, CFSTR("learnedNRSupported"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_responsiveShutterSupported, CFSTR("responsiveShutterSupported"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_responsiveShutterEnabled, CFSTR("responsiveShutterEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_fastCapturePrioritizationEnabled, CFSTR("fastCapturePrioritizationEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_captureTimePhotosCurationSupported, CFSTR("captureTimePhotosCurationSupported"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_depthDataType, CFSTR("depthDataType"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_pearlModuleType, CFSTR("pearlModuleType"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_sifrStillImageCaptureEnabledIfAvailable, CFSTR("sifrStillImageCaptureEnabledIfAvailable"));
  *(float *)&v5 = self->_gainMapMainImageDownscalingFactor;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("gainMapMainImageDownscalingFactor"), v5);
  *(float *)&v6 = self->_ubInferenceMainImageDownscalingFactor;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("ubInferenceMainImageDownscalingFactor"), v6);
  objc_msgSend(a3, "encodeObject:forKey:", self->_enabledSemanticSegmentationMatteURNs, CFSTR("enabledSemanticSegmentationMatteURNs"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_supportedSemanticSegmentationMatteURNs, CFSTR("supportedSemanticSegmentationMatteURNs"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_maxLossyCompressionLevel, CFSTR("maxLossyCompressionLevel"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_cameraInfoByPortType, CFSTR("cameraInfoByPortType"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_highQualityPhotoCaptureForVideoFormatEnabled, CFSTR("highQualityPhotoCaptureForVideoFormatEnabled"));
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
  unint64_t v15;
  int v16;
  unint64_t v17;
  NSDictionary *v18;
  NSDictionary *v19;
  int v20;
  int v21;
  int v22;
  int v23;
  NSArray *v24;
  NSArray *v25;
  int v26;
  int v27;
  unint64_t v28;
  int v29;
  int v30;
  unsigned int v31;
  NSDictionary *v32;
  NSDictionary *v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  NSArray *v51;
  NSArray *v52;
  int v53;
  NSDictionary *v54;
  BOOL v55;
  objc_super v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  if (a3 == self)
  {
    LOBYTE(v9) = 1;
    return v9;
  }
  v58 = v6;
  v59 = v5;
  v60 = v3;
  v61 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_21;
  v57.receiver = self;
  v57.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration;
  v9 = -[FigCaptureBaseStillImageSinkPipelineConfiguration isEqual:](&v57, sel_isEqual_, a3);
  if (v9)
  {
    v10 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration stillImageSinkPipelineProcessingMode](self, "stillImageSinkPipelineProcessingMode");
    if (v10 != objc_msgSend(a3, "stillImageSinkPipelineProcessingMode"))
      goto LABEL_21;
    v11 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration pipelineStagePriority](self, "pipelineStagePriority");
    if (v11 != objc_msgSend(a3, "pipelineStagePriority"))
      goto LABEL_21;
    v12 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration inferencePriority](self, "inferencePriority");
    if (v12 != objc_msgSend(a3, "inferencePriority"))
      goto LABEL_21;
    v13 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration deviceType](self, "deviceType");
    if (v13 != objc_msgSend(a3, "deviceType"))
      goto LABEL_21;
    v9 = FigCaptureVideoDimensionsAreEqual(-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration rawSensorDimensions](self, "rawSensorDimensions"), objc_msgSend(a3, "rawSensorDimensions"));
    if (v9)
    {
      v14 = (int)-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration rawSensorDimensions](self, "rawSensorDimensions");
      if (v14 != objc_msgSend(a3, "rawSensorDimensions"))
        goto LABEL_21;
      v15 = (unint64_t)-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration rawSensorDimensions](self, "rawSensorDimensions") >> 32;
      if ((_DWORD)v15 != (unint64_t)objc_msgSend(a3, "rawSensorDimensions") >> 32)
        goto LABEL_21;
      v16 = (int)-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration outputStillImageDimensions](self, "outputStillImageDimensions");
      if (v16 != objc_msgSend(a3, "outputStillImageDimensions"))
        goto LABEL_21;
      v17 = (unint64_t)-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration outputStillImageDimensions](self, "outputStillImageDimensions") >> 32;
      if ((_DWORD)v17 != (unint64_t)objc_msgSend(a3, "outputStillImageDimensions") >> 32)
        goto LABEL_21;
      v18 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration sensorIDStringsByPortType](self, "sensorIDStringsByPortType");
      if (v18 == (NSDictionary *)objc_msgSend(a3, "sensorIDStringsByPortType")
        || (v9 = -[NSDictionary isEqual:](-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration sensorIDStringsByPortType](self, "sensorIDStringsByPortType"), "isEqual:", objc_msgSend(a3, "sensorIDStringsByPortType"))) != 0)
      {
        v19 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration baseZoomFactorsByPortType](self, "baseZoomFactorsByPortType");
        if (v19 == (NSDictionary *)objc_msgSend(a3, "baseZoomFactorsByPortType")
          || (v9 = -[NSDictionary isEqual:](-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration baseZoomFactorsByPortType](self, "baseZoomFactorsByPortType"), "isEqual:", objc_msgSend(a3, "baseZoomFactorsByPortType"))) != 0)
        {
          v20 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration redEyeReductionVersion](self, "redEyeReductionVersion");
          if (v20 != objc_msgSend(a3, "redEyeReductionVersion"))
            goto LABEL_21;
          v21 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration semanticRenderingVersion](self, "semanticRenderingVersion");
          if (v21 != objc_msgSend(a3, "semanticRenderingVersion"))
            goto LABEL_21;
          v22 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration semanticDevelopmentVersion](self, "semanticDevelopmentVersion");
          if (v22 != objc_msgSend(a3, "semanticDevelopmentVersion"))
            goto LABEL_21;
          v23 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration semanticStyleRenderingEnabled](self, "semanticStyleRenderingEnabled");
          if (v23 != objc_msgSend(a3, "semanticStyleRenderingEnabled"))
            goto LABEL_21;
          v24 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration portTypesWithGeometricDistortionCorrectionEnabled](self, "portTypesWithGeometricDistortionCorrectionEnabled");
          if (v24 == (NSArray *)objc_msgSend(a3, "portTypesWithGeometricDistortionCorrectionEnabled")
            || (v9 = -[NSArray isEqual:](-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration portTypesWithGeometricDistortionCorrectionEnabled](self, "portTypesWithGeometricDistortionCorrectionEnabled"), "isEqual:", objc_msgSend(a3, "portTypesWithGeometricDistortionCorrectionEnabled"))) != 0)
          {
            v25 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration portTypesWithIntelligentDistortionCorrectionEnabled](self, "portTypesWithIntelligentDistortionCorrectionEnabled");
            if (v25 == (NSArray *)objc_msgSend(a3, "portTypesWithIntelligentDistortionCorrectionEnabled")
              || (v9 = -[NSArray isEqual:](-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration portTypesWithIntelligentDistortionCorrectionEnabled](self, "portTypesWithIntelligentDistortionCorrectionEnabled"), "isEqual:", objc_msgSend(a3, "portTypesWithIntelligentDistortionCorrectionEnabled"))) != 0)
            {
              v26 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration dcProcessorVersion](self, "dcProcessorVersion");
              if (v26 != objc_msgSend(a3, "dcProcessorVersion"))
                goto LABEL_21;
              v27 = (int)-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration gdcInDCProcessorOutputCropDimensions](self, "gdcInDCProcessorOutputCropDimensions");
              if (v27 != objc_msgSend(a3, "gdcInDCProcessorOutputCropDimensions"))
                goto LABEL_21;
              v28 = (unint64_t)-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration gdcInDCProcessorOutputCropDimensions](self, "gdcInDCProcessorOutputCropDimensions") >> 32;
              if ((_DWORD)v28 != (unint64_t)objc_msgSend(a3, "gdcInDCProcessorOutputCropDimensions") >> 32)
                goto LABEL_21;
              v29 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration greenGhostMitigationVersion](self, "greenGhostMitigationVersion");
              if (v29 != objc_msgSend(a3, "greenGhostMitigationVersion"))
                goto LABEL_21;
              v30 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration deepZoomVersion](self, "deepZoomVersion");
              if (v30 != objc_msgSend(a3, "deepZoomVersion"))
                goto LABEL_21;
              v31 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration demosaicedRawPixelFormat](self, "demosaicedRawPixelFormat");
              if (v31 != objc_msgSend(a3, "demosaicedRawPixelFormat"))
                goto LABEL_21;
              v32 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration rawColorCalibrationsByPortType](self, "rawColorCalibrationsByPortType");
              if (v32 == (NSDictionary *)objc_msgSend(a3, "rawColorCalibrationsByPortType")
                || (v9 = -[NSDictionary isEqual:](-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration rawColorCalibrationsByPortType](self, "rawColorCalibrationsByPortType"), "isEqual:", objc_msgSend(a3, "rawColorCalibrationsByPortType"))) != 0)
              {
                v33 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration rawLensShadingCorrectionCoefficientsByPortType](self, "rawLensShadingCorrectionCoefficientsByPortType");
                if (v33 == (NSDictionary *)objc_msgSend(a3, "rawLensShadingCorrectionCoefficientsByPortType")
                  || (v9 = -[NSDictionary isEqual:](-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration rawLensShadingCorrectionCoefficientsByPortType](self, "rawLensShadingCorrectionCoefficientsByPortType"), "isEqual:", objc_msgSend(a3, "rawLensShadingCorrectionCoefficientsByPortType"))) != 0)
                {
                  v34 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration deferredProcessingSupported](self, "deferredProcessingSupported");
                  if (v34 != objc_msgSend(a3, "deferredProcessingSupported"))
                    goto LABEL_21;
                  v35 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration adjustablePortraitLightingEffectStrengthSupported](self, "adjustablePortraitLightingEffectStrengthSupported");
                  if (v35 != objc_msgSend(a3, "adjustablePortraitLightingEffectStrengthSupported"))
                    goto LABEL_21;
                  v36 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration deepFusionSupported](self, "deepFusionSupported");
                  if (v36 != objc_msgSend(a3, "deepFusionSupported"))
                    goto LABEL_21;
                  v9 = FigCaptureVideoDimensionsAreEqual(-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration deepFusionEnhancedResolutionDimensions](self, "deepFusionEnhancedResolutionDimensions"), objc_msgSend(a3, "deepFusionEnhancedResolutionDimensions"));
                  if (!v9)
                    return v9;
                  v37 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration learnedNRSupported](self, "learnedNRSupported");
                  if (v37 != objc_msgSend(a3, "learnedNRSupported"))
                    goto LABEL_21;
                  v38 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration responsiveShutterSupported](self, "responsiveShutterSupported");
                  if (v38 != objc_msgSend(a3, "responsiveShutterSupported"))
                    goto LABEL_21;
                  v39 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration responsiveShutterEnabled](self, "responsiveShutterEnabled");
                  if (v39 != objc_msgSend(a3, "responsiveShutterEnabled"))
                    goto LABEL_21;
                  v40 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration fastCapturePrioritizationEnabled](self, "fastCapturePrioritizationEnabled");
                  if (v40 != objc_msgSend(a3, "fastCapturePrioritizationEnabled"))
                    goto LABEL_21;
                  v41 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration captureTimePhotosCurationSupported](self, "captureTimePhotosCurationSupported");
                  if (v41 != objc_msgSend(a3, "captureTimePhotosCurationSupported"))
                    goto LABEL_21;
                  v42 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration depthDataType](self, "depthDataType");
                  if (v42 != objc_msgSend(a3, "depthDataType"))
                    goto LABEL_21;
                  v43 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration pearlModuleType](self, "pearlModuleType");
                  if (v43 != objc_msgSend(a3, "pearlModuleType"))
                    goto LABEL_21;
                  v44 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration sifrStillImageCaptureEnabledIfAvailable](self, "sifrStillImageCaptureEnabledIfAvailable");
                  if (v44 != objc_msgSend(a3, "sifrStillImageCaptureEnabledIfAvailable"))
                    goto LABEL_21;
                  -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration gainMapMainImageDownscalingFactor](self, "gainMapMainImageDownscalingFactor");
                  v46 = v45;
                  objc_msgSend(a3, "gainMapMainImageDownscalingFactor");
                  if (v46 != v47)
                    goto LABEL_21;
                  -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration ubInferenceMainImageDownscalingFactor](self, "ubInferenceMainImageDownscalingFactor");
                  v49 = v48;
                  objc_msgSend(a3, "ubInferenceMainImageDownscalingFactor");
                  if (v49 != v50)
                    goto LABEL_21;
                  v51 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration enabledSemanticSegmentationMatteURNs](self, "enabledSemanticSegmentationMatteURNs");
                  if (v51 == (NSArray *)objc_msgSend(a3, "enabledSemanticSegmentationMatteURNs")
                    || (v9 = -[NSArray isEqual:](-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration enabledSemanticSegmentationMatteURNs](self, "enabledSemanticSegmentationMatteURNs"), "isEqual:", objc_msgSend(a3, "enabledSemanticSegmentationMatteURNs"))) != 0)
                  {
                    v52 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration supportedSemanticSegmentationMatteURNs](self, "supportedSemanticSegmentationMatteURNs");
                    if (v52 == (NSArray *)objc_msgSend(a3, "supportedSemanticSegmentationMatteURNs")
                      || (v9 = -[NSArray isEqual:](-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration supportedSemanticSegmentationMatteURNs](self, "supportedSemanticSegmentationMatteURNs"), "isEqual:", objc_msgSend(a3, "supportedSemanticSegmentationMatteURNs"))) != 0)
                    {
                      v53 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration maxLossyCompressionLevel](self, "maxLossyCompressionLevel");
                      if (v53 == objc_msgSend(a3, "maxLossyCompressionLevel"))
                      {
                        v54 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration cameraInfoByPortType](self, "cameraInfoByPortType");
                        if (v54 == (NSDictionary *)objc_msgSend(a3, "cameraInfoByPortType")
                          || (v9 = -[NSDictionary isEqual:](-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration cameraInfoByPortType](self, "cameraInfoByPortType"), "isEqual:", objc_msgSend(a3, "cameraInfoByPortType"))) != 0)
                        {
                          v55 = -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration highQualityPhotoCaptureForVideoFormatEnabled](self, "highQualityPhotoCaptureForVideoFormatEnabled");
                          LOBYTE(v9) = v55 ^ objc_msgSend(a3, "highQualityPhotoCaptureForVideoFormatEnabled") ^ 1;
                        }
                        return v9;
                      }
LABEL_21:
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
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration;
  -[FigCaptureBaseStillImageSinkPipelineConfiguration dealloc](&v3, sel_dealloc);
}

- (int)stillImageSinkPipelineProcessingMode
{
  return self->_stillImageSinkPipelineProcessingMode;
}

- (void)setStillImageSinkPipelineProcessingMode:(int)a3
{
  self->_stillImageSinkPipelineProcessingMode = a3;
}

- (unsigned)pipelineStagePriority
{
  return self->_pipelineStagePriority;
}

- (void)setPipelineStagePriority:(unsigned int)a3
{
  self->_pipelineStagePriority = a3;
}

- (unsigned)inferencePriority
{
  return self->_inferencePriority;
}

- (void)setInferencePriority:(unsigned int)a3
{
  self->_inferencePriority = a3;
}

- (int)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int)a3
{
  self->_deviceType = a3;
}

- (BOOL)deviceHasFlash
{
  return self->_deviceHasFlash;
}

- (void)setDeviceHasFlash:(BOOL)a3
{
  self->_deviceHasFlash = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)rawSensorDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_rawSensorDimensions;
}

- (void)setRawSensorDimensions:(id)a3
{
  self->_rawSensorDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- ($2825F4736939C4A6D3AD43837233062D)outputStillImageDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_outputStillImageDimensions;
}

- (void)setOutputStillImageDimensions:(id)a3
{
  self->_outputStillImageDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (NSDictionary)sensorIDStringsByPortType
{
  return self->_sensorIDStringsByPortType;
}

- (void)setSensorIDStringsByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSDictionary)baseZoomFactorsByPortType
{
  return self->_baseZoomFactorsByPortType;
}

- (void)setBaseZoomFactorsByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (int)redEyeReductionVersion
{
  return self->_redEyeReductionVersion;
}

- (void)setRedEyeReductionVersion:(int)a3
{
  self->_redEyeReductionVersion = a3;
}

- (int)semanticRenderingVersion
{
  return self->_semanticRenderingVersion;
}

- (void)setSemanticRenderingVersion:(int)a3
{
  self->_semanticRenderingVersion = a3;
}

- (int)semanticDevelopmentVersion
{
  return self->_semanticDevelopmentVersion;
}

- (void)setSemanticDevelopmentVersion:(int)a3
{
  self->_semanticDevelopmentVersion = a3;
}

- (BOOL)semanticStyleRenderingEnabled
{
  return self->_semanticStyleRenderingEnabled;
}

- (void)setSemanticStyleRenderingEnabled:(BOOL)a3
{
  self->_semanticStyleRenderingEnabled = a3;
}

- (int)dcProcessorVersion
{
  return self->_dcProcessorVersion;
}

- (void)setDcProcessorVersion:(int)a3
{
  self->_dcProcessorVersion = a3;
}

- (NSArray)portTypesWithGeometricDistortionCorrectionEnabled
{
  return self->_portTypesWithGeometricDistortionCorrectionEnabled;
}

- (void)setPortTypesWithGeometricDistortionCorrectionEnabled:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (NSArray)portTypesWithIntelligentDistortionCorrectionEnabled
{
  return self->_portTypesWithIntelligentDistortionCorrectionEnabled;
}

- (void)setPortTypesWithIntelligentDistortionCorrectionEnabled:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (BOOL)gdcInDCProcessorSupported
{
  return self->_gdcInDCProcessorSupported;
}

- (void)setGdcInDCProcessorSupported:(BOOL)a3
{
  self->_gdcInDCProcessorSupported = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)gdcInDCProcessorOutputCropDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_gdcInDCProcessorOutputCropDimensions;
}

- (void)setGdcInDCProcessorOutputCropDimensions:(id)a3
{
  self->_gdcInDCProcessorOutputCropDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (int)greenGhostMitigationVersion
{
  return self->_greenGhostMitigationVersion;
}

- (void)setGreenGhostMitigationVersion:(int)a3
{
  self->_greenGhostMitigationVersion = a3;
}

- (int)deepZoomVersion
{
  return self->_deepZoomVersion;
}

- (void)setDeepZoomVersion:(int)a3
{
  self->_deepZoomVersion = a3;
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
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

- (NSDictionary)rawLensShadingCorrectionCoefficientsByPortType
{
  return self->_rawLensShadingCorrectionCoefficientsByPortType;
}

- (void)setRawLensShadingCorrectionCoefficientsByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (BOOL)deferredProcessingSupported
{
  return self->_deferredProcessingSupported;
}

- (void)setDeferredProcessingSupported:(BOOL)a3
{
  self->_deferredProcessingSupported = a3;
}

- (BOOL)adjustablePortraitLightingEffectStrengthSupported
{
  return self->_adjustablePortraitLightingEffectStrengthSupported;
}

- (void)setAdjustablePortraitLightingEffectStrengthSupported:(BOOL)a3
{
  self->_adjustablePortraitLightingEffectStrengthSupported = a3;
}

- (BOOL)deepFusionSupported
{
  return self->_deepFusionSupported;
}

- (void)setDeepFusionSupported:(BOOL)a3
{
  self->_deepFusionSupported = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)deepFusionEnhancedResolutionDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_deepFusionEnhancedResolutionDimensions;
}

- (void)setDeepFusionEnhancedResolutionDimensions:(id)a3
{
  self->_deepFusionEnhancedResolutionDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (BOOL)learnedNRSupported
{
  return self->_learnedNRSupported;
}

- (void)setLearnedNRSupported:(BOOL)a3
{
  self->_learnedNRSupported = a3;
}

- (BOOL)responsiveShutterSupported
{
  return self->_responsiveShutterSupported;
}

- (void)setResponsiveShutterSupported:(BOOL)a3
{
  self->_responsiveShutterSupported = a3;
}

- (BOOL)responsiveShutterEnabled
{
  return self->_responsiveShutterEnabled;
}

- (void)setResponsiveShutterEnabled:(BOOL)a3
{
  self->_responsiveShutterEnabled = a3;
}

- (BOOL)fastCapturePrioritizationEnabled
{
  return self->_fastCapturePrioritizationEnabled;
}

- (void)setFastCapturePrioritizationEnabled:(BOOL)a3
{
  self->_fastCapturePrioritizationEnabled = a3;
}

- (BOOL)captureTimePhotosCurationSupported
{
  return self->_captureTimePhotosCurationSupported;
}

- (void)setCaptureTimePhotosCurationSupported:(BOOL)a3
{
  self->_captureTimePhotosCurationSupported = a3;
}

- (int)depthDataType
{
  return self->_depthDataType;
}

- (void)setDepthDataType:(int)a3
{
  self->_depthDataType = a3;
}

- (int)pearlModuleType
{
  return self->_pearlModuleType;
}

- (void)setPearlModuleType:(int)a3
{
  self->_pearlModuleType = a3;
}

- (BOOL)sifrStillImageCaptureEnabledIfAvailable
{
  return self->_sifrStillImageCaptureEnabledIfAvailable;
}

- (void)setSifrStillImageCaptureEnabledIfAvailable:(BOOL)a3
{
  self->_sifrStillImageCaptureEnabledIfAvailable = a3;
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

- (BOOL)highQualityPhotoCaptureForVideoFormatEnabled
{
  return self->_highQualityPhotoCaptureForVideoFormatEnabled;
}

- (void)setHighQualityPhotoCaptureForVideoFormatEnabled:(BOOL)a3
{
  self->_highQualityPhotoCaptureForVideoFormatEnabled = a3;
}

- (float)gainMapMainImageDownscalingFactor
{
  return self->_gainMapMainImageDownscalingFactor;
}

- (void)setGainMapMainImageDownscalingFactor:(float)a3
{
  self->_gainMapMainImageDownscalingFactor = a3;
}

- (float)ubInferenceMainImageDownscalingFactor
{
  return self->_ubInferenceMainImageDownscalingFactor;
}

- (void)setUbInferenceMainImageDownscalingFactor:(float)a3
{
  self->_ubInferenceMainImageDownscalingFactor = a3;
}

- (NSArray)enabledSemanticSegmentationMatteURNs
{
  return self->_enabledSemanticSegmentationMatteURNs;
}

- (void)setEnabledSemanticSegmentationMatteURNs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 264);
}

- (NSArray)supportedSemanticSegmentationMatteURNs
{
  return self->_supportedSemanticSegmentationMatteURNs;
}

- (void)setSupportedSemanticSegmentationMatteURNs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 272);
}

- (int)maxLossyCompressionLevel
{
  return self->_maxLossyCompressionLevel;
}

- (void)setMaxLossyCompressionLevel:(int)a3
{
  self->_maxLossyCompressionLevel = a3;
}

@end
