@implementation BWDeferredPipelineParameters

- (int)pearlModuleType
{
  return self->_pearlModuleType;
}

- (int)distortionCorrectionVersion
{
  return self->_distortionCorrectionVersion;
}

- (int)deepZoomVersion
{
  return self->_deepZoomVersion;
}

- (int)stillImageGDCSourceMode
{
  return self->_stillImageGDCSourceMode;
}

- (void)setSemanticRenderingVersion:(int)a3
{
  self->_semanticRenderingVersion = a3;
}

- (void)setQuadraProcessingSupportEnabled:(BOOL)a3
{
  self->_quadraProcessingSupportEnabled = a3;
}

- (void)setPearlModuleType:(int)a3
{
  self->_pearlModuleType = a3;
}

- (void)setNrfVersion:(int)a3
{
  self->_nrfVersion = a3;
}

- (void)setNoiseReductionAndFusionScheme:(int)a3
{
  self->_noiseReductionAndFusionScheme = a3;
}

- (void)setIntelligentDistortionCorrectionEnabled:(BOOL)a3
{
  self->_intelligentDistortionCorrectionEnabled = a3;
}

- (void)setGeometricDistortionCorrectionEnabled:(BOOL)a3
{
  self->_geometricDistortionCorrectionEnabled = a3;
}

- (void)setGenerateInferencesForSemanticProcessingIfNeeded:(BOOL)a3
{
  self->_generateInferencesForSemanticProcessingIfNeeded = a3;
}

- (void)setDistortionCorrectionVersion:(int)a3
{
  self->_distortionCorrectionVersion = a3;
}

- (void)setDeepZoomVersion:(int)a3
{
  self->_deepZoomVersion = a3;
}

- (void)setDeepZoomMode:(int)a3
{
  self->_deepZoomMode = a3;
}

- (void)setContinuousZoomWithDepthSupported:(BOOL)a3
{
  self->_continuousZoomWithDepthSupported = a3;
}

- (void)setCanProcessEnhancedResolution:(BOOL)a3
{
  self->_canProcessEnhancedResolution = a3;
}

- (int)semanticRenderingVersion
{
  return self->_semanticRenderingVersion;
}

- (BOOL)quadraProcessingSupportEnabled
{
  return self->_quadraProcessingSupportEnabled;
}

- (int)nrfVersion
{
  return self->_nrfVersion;
}

- (int)noiseReductionAndFusionScheme
{
  return self->_noiseReductionAndFusionScheme;
}

- (BOOL)intelligentDistortionCorrectionEnabled
{
  return self->_intelligentDistortionCorrectionEnabled;
}

- (BOOL)geometricDistortionCorrectionEnabled
{
  return self->_geometricDistortionCorrectionEnabled;
}

- (BOOL)generateInferencesForSemanticProcessingIfNeeded
{
  return self->_generateInferencesForSemanticProcessingIfNeeded;
}

- (int)deepZoomMode
{
  return self->_deepZoomMode;
}

- (BOOL)dcProcessingWithDepthSupported
{
  return self->_dcProcessingWithDepthSupported;
}

- (BOOL)continuousZoomWithDepthSupported
{
  return self->_continuousZoomWithDepthSupported;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWDeferredPipelineParameters;
  -[BWDeferredPipelineParameters dealloc](&v3, sel_dealloc);
}

- (BWDeferredPipelineParameters)initWithCoder:(id)a3
{
  BWDeferredPipelineParameters *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)BWDeferredPipelineParameters;
  v4 = -[BWDeferredPipelineParameters init](&v8, sel_init);
  if (v4)
  {
    v4->_rawSensorDimensions.width = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("rawSensorDimensionsWidth"));
    v4->_rawSensorDimensions.height = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("rawSensorDimensionsHeight"));
    v5 = (void *)MEMORY[0x1E0C99E60];
    v10[0] = objc_opt_class();
    v10[1] = objc_opt_class();
    v10[2] = objc_opt_class();
    v4->_dimensionsByQSubResolutionFlavorByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3)), CFSTR("dimensionsByQSubResolutionFlavorByPortType"));
    v4->_nrfVersion = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("nrfVersion"));
    v4->_noiseReductionAndFusionScheme = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("noiseReductionAndFusionScheme"));
    v4->_distortionCorrectionVersion = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("distortionCorrectionVersion"));
    v4->_intelligentDistortionCorrectionEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("intelligentDistortionCorrectionEnabled"));
    v4->_geometricDistortionCorrectionEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("geometricDistortionCorrectionEnabled"));
    v4->_dcProcessingWithDepthSupported = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("dcProcessingWithDepthSupported"));
    v4->_stillImageGDCSourceMode = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("stillImageGDCSourceMode"));
    v4->_deepZoomVersion = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("deepZoomVersion"));
    v4->_deepZoomMode = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("deepZoomMode"));
    v4->_semanticRenderingVersion = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("semanticRenderingVersion"));
    v4->_smartStyleRenderingVersion = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("SmartStyleRenderingVersion"));
    v4->_smartStyleReversibilityEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("SmartStyleReversibilityEnabled"));
    v4->_smartStyleLinearThumbnailDimensions.width = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("smartStyleLinearThumbnailWidth"));
    v4->_smartStyleLinearThumbnailDimensions.height = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("smartStyleLinearThumbnailHeight"));
    v4->_smartStyleStyledThumbnailDimensions.width = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("smartStyleStyledThumbnailWidth"));
    v4->_smartStyleStyledThumbnailDimensions.height = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("smartStyleStyledThumbnailHeight"));
    v4->_generateInferencesForSemanticProcessingIfNeeded = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("generateInferencesForSemanticProcessingIfNeeded"));
    v4->_quadraProcessingSupportEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("quadraProcessingSupportEnabled"));
    v4->_canProcessEnhancedResolution = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("canProcessEnhancedResolution"));
    v4->_continuousZoomWithDepthSupported = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("continuousZoomWithDepthSupported"));
    v4->_pearlModuleType = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("PearlModuleType"));
    v4->_sfhrMode = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("sfhrMode"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v9[0] = objc_opt_class();
    v9[1] = objc_opt_class();
    v9[2] = objc_opt_class();
    if (!CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3)), CFSTR("sensorCenterOffset")), &v4->_sensorCenterOffset))v4->_sensorCenterOffset = (CGPoint)*MEMORY[0x1E0C9D538];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt32:forKey:", self->_rawSensorDimensions.width, CFSTR("rawSensorDimensionsWidth"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_rawSensorDimensions.height, CFSTR("rawSensorDimensionsHeight"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_dimensionsByQSubResolutionFlavorByPortType, CFSTR("dimensionsByQSubResolutionFlavorByPortType"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_nrfVersion, CFSTR("nrfVersion"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_noiseReductionAndFusionScheme, CFSTR("noiseReductionAndFusionScheme"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_distortionCorrectionVersion, CFSTR("distortionCorrectionVersion"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_intelligentDistortionCorrectionEnabled, CFSTR("intelligentDistortionCorrectionEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_geometricDistortionCorrectionEnabled, CFSTR("geometricDistortionCorrectionEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_dcProcessingWithDepthSupported, CFSTR("dcProcessingWithDepthSupported"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_stillImageGDCSourceMode, CFSTR("stillImageGDCSourceMode"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_deepZoomVersion, CFSTR("deepZoomVersion"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_deepZoomMode, CFSTR("deepZoomMode"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_semanticRenderingVersion, CFSTR("semanticRenderingVersion"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_smartStyleRenderingVersion, CFSTR("SmartStyleRenderingVersion"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_smartStyleReversibilityEnabled, CFSTR("SmartStyleReversibilityEnabled"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_smartStyleLinearThumbnailDimensions.width, CFSTR("smartStyleLinearThumbnailWidth"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_smartStyleLinearThumbnailDimensions.height, CFSTR("smartStyleLinearThumbnailHeight"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_smartStyleStyledThumbnailDimensions.width, CFSTR("smartStyleStyledThumbnailWidth"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_smartStyleStyledThumbnailDimensions.height, CFSTR("smartStyleStyledThumbnailHeight"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_generateInferencesForSemanticProcessingIfNeeded, CFSTR("generateInferencesForSemanticProcessingIfNeeded"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_quadraProcessingSupportEnabled, CFSTR("quadraProcessingSupportEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_canProcessEnhancedResolution, CFSTR("canProcessEnhancedResolution"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_continuousZoomWithDepthSupported, CFSTR("continuousZoomWithDepthSupported"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_pearlModuleType, CFSTR("PearlModuleType"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_sfhrMode, CFSTR("sfhrMode"));
  objc_msgSend(a3, "encodeObject:forKey:", CGPointCreateDictionaryRepresentation(self->_sensorCenterOffset), CFSTR("sensorCenterOffset"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setRawSensorDimensions:", *(_QWORD *)&self->_rawSensorDimensions);
  objc_msgSend(v4, "setDimensionsByQSubResolutionFlavorByPortType:", self->_dimensionsByQSubResolutionFlavorByPortType);
  objc_msgSend(v4, "setNrfVersion:", self->_nrfVersion);
  objc_msgSend(v4, "setNoiseReductionAndFusionScheme:", self->_noiseReductionAndFusionScheme);
  objc_msgSend(v4, "setDistortionCorrectionVersion:", self->_distortionCorrectionVersion);
  objc_msgSend(v4, "setIntelligentDistortionCorrectionEnabled:", self->_intelligentDistortionCorrectionEnabled);
  objc_msgSend(v4, "setGeometricDistortionCorrectionEnabled:", self->_geometricDistortionCorrectionEnabled);
  objc_msgSend(v4, "setDcProcessingWithDepthSupported:", self->_dcProcessingWithDepthSupported);
  objc_msgSend(v4, "setStillImageGDCSourceMode:", self->_stillImageGDCSourceMode);
  objc_msgSend(v4, "setDeepZoomVersion:", self->_deepZoomVersion);
  objc_msgSend(v4, "setDeepZoomMode:", self->_deepZoomMode);
  objc_msgSend(v4, "setSemanticRenderingVersion:", self->_semanticRenderingVersion);
  objc_msgSend(v4, "setSmartStyleRenderingVersion:", self->_smartStyleRenderingVersion);
  objc_msgSend(v4, "setSmartStyleReversibilityEnabled:", self->_smartStyleReversibilityEnabled);
  objc_msgSend(v4, "setSmartStyleLinearThumbnailDimensions:", *(_QWORD *)&self->_smartStyleLinearThumbnailDimensions);
  objc_msgSend(v4, "setSmartStyleStyledThumbnailDimensions:", *(_QWORD *)&self->_smartStyleStyledThumbnailDimensions);
  objc_msgSend(v4, "setGenerateInferencesForSemanticProcessingIfNeeded:", self->_generateInferencesForSemanticProcessingIfNeeded);
  objc_msgSend(v4, "setQuadraProcessingSupportEnabled:", self->_quadraProcessingSupportEnabled);
  objc_msgSend(v4, "setCanProcessEnhancedResolution:", self->_canProcessEnhancedResolution);
  objc_msgSend(v4, "setContinuousZoomWithDepthSupported:", self->_continuousZoomWithDepthSupported);
  objc_msgSend(v4, "setPearlModuleType:", self->_pearlModuleType);
  objc_msgSend(v4, "setSfhrMode:", self->_sfhrMode);
  return v4;
}

- (char)_initWithLegacyCaptureSettings:(void *)a1
{
  char *v3;
  int v4;
  objc_super v6;

  if (!a1)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)BWDeferredPipelineParameters;
  v3 = (char *)objc_msgSendSuper2(&v6, sel_init);
  if (v3)
  {
    v4 = -[FigCaptureCameraParameters nrfVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "nrfVersion");
    if ((objc_msgSend(a2, "captureFlags") & 4) != 0 || v4 <= 2)
      *((_DWORD *)v3 + 6) = v4;
    *((_DWORD *)v3 + 7) = 4;
    *((_DWORD *)v3 + 8) = objc_msgSend((id)objc_msgSend(a2, "metadata"), "intelligentDistortionCorrectionVersion");
    v3[36] = objc_msgSend((id)objc_msgSend(a2, "metadata"), "intelligentDistortionCorrectionEnabled");
    v3[37] = objc_msgSend((id)objc_msgSend(a2, "metadata"), "geometricDistortionCorrectionEnabled");
    v3[38] = 0;
    *((_DWORD *)v3 + 10) = 0;
    *((_DWORD *)v3 + 11) = objc_msgSend((id)objc_msgSend(a2, "metadata"), "deepZoomVersion");
    *(_QWORD *)(v3 + 52) = 0;
    v3[60] = 0;
    *((_QWORD *)v3 + 8) = 0;
    *((_QWORD *)v3 + 9) = 0;
    v3[80] = 0;
    v3[81] = *((_DWORD *)v3 + 6) > 2;
    v3[82] = (objc_msgSend(a2, "captureFlags") & 0x200000000) != 0;
    *((_DWORD *)v3 + 22) = *((_DWORD *)v3 + 6) > 3;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v11;
  unint64_t v12;
  NSDictionary *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  unint64_t v28;
  int v29;
  unint64_t v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  unsigned int v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  if (a3 == self)
  {
    LOBYTE(v14) = 1;
    return v14;
  }
  v38 = v5;
  v39 = v4;
  v40 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_29;
  v11 = (int)-[BWDeferredPipelineParameters rawSensorDimensions](self, "rawSensorDimensions");
  if (v11 != objc_msgSend(a3, "rawSensorDimensions"))
    goto LABEL_29;
  v12 = (unint64_t)-[BWDeferredPipelineParameters rawSensorDimensions](self, "rawSensorDimensions") >> 32;
  if ((_DWORD)v12 != (unint64_t)objc_msgSend(a3, "rawSensorDimensions") >> 32)
    goto LABEL_29;
  v13 = -[BWDeferredPipelineParameters dimensionsByQSubResolutionFlavorByPortType](self, "dimensionsByQSubResolutionFlavorByPortType");
  if (v13 == (NSDictionary *)objc_msgSend(a3, "dimensionsByQSubResolutionFlavorByPortType")
    || (v14 = -[NSDictionary isEqual:](-[BWDeferredPipelineParameters dimensionsByQSubResolutionFlavorByPortType](self, "dimensionsByQSubResolutionFlavorByPortType"), "isEqual:", objc_msgSend(a3, "dimensionsByQSubResolutionFlavorByPortType"))) != 0)
  {
    v15 = -[BWDeferredPipelineParameters nrfVersion](self, "nrfVersion", v6, v38, v39, v40, v7, v8);
    if (v15 == objc_msgSend(a3, "nrfVersion"))
    {
      v16 = -[BWDeferredPipelineParameters noiseReductionAndFusionScheme](self, "noiseReductionAndFusionScheme");
      if (v16 == objc_msgSend(a3, "noiseReductionAndFusionScheme"))
      {
        v17 = -[BWDeferredPipelineParameters distortionCorrectionVersion](self, "distortionCorrectionVersion");
        if (v17 == objc_msgSend(a3, "distortionCorrectionVersion"))
        {
          v18 = -[BWDeferredPipelineParameters intelligentDistortionCorrectionEnabled](self, "intelligentDistortionCorrectionEnabled");
          if (v18 == objc_msgSend(a3, "intelligentDistortionCorrectionEnabled"))
          {
            v19 = -[BWDeferredPipelineParameters geometricDistortionCorrectionEnabled](self, "geometricDistortionCorrectionEnabled");
            if (v19 == objc_msgSend(a3, "geometricDistortionCorrectionEnabled"))
            {
              v20 = -[BWDeferredPipelineParameters dcProcessingWithDepthSupported](self, "dcProcessingWithDepthSupported");
              if (v20 == objc_msgSend(a3, "dcProcessingWithDepthSupported"))
              {
                v21 = -[BWDeferredPipelineParameters stillImageGDCSourceMode](self, "stillImageGDCSourceMode");
                if (v21 == objc_msgSend(a3, "stillImageGDCSourceMode"))
                {
                  v22 = -[BWDeferredPipelineParameters deepZoomVersion](self, "deepZoomVersion");
                  if (v22 == objc_msgSend(a3, "deepZoomVersion"))
                  {
                    v23 = -[BWDeferredPipelineParameters deepZoomMode](self, "deepZoomMode");
                    if (v23 == objc_msgSend(a3, "deepZoomMode"))
                    {
                      v24 = -[BWDeferredPipelineParameters semanticRenderingVersion](self, "semanticRenderingVersion");
                      if (v24 == objc_msgSend(a3, "semanticRenderingVersion"))
                      {
                        v25 = -[BWDeferredPipelineParameters smartStyleRenderingVersion](self, "smartStyleRenderingVersion");
                        if (v25 == objc_msgSend(a3, "smartStyleRenderingVersion"))
                        {
                          v26 = -[BWDeferredPipelineParameters smartStyleReversibilityEnabled](self, "smartStyleReversibilityEnabled");
                          if (v26 == objc_msgSend(a3, "smartStyleReversibilityEnabled"))
                          {
                            v27 = (int)-[BWDeferredPipelineParameters smartStyleLinearThumbnailDimensions](self, "smartStyleLinearThumbnailDimensions");
                            if (v27 == objc_msgSend(a3, "smartStyleLinearThumbnailDimensions"))
                            {
                              v28 = (unint64_t)-[BWDeferredPipelineParameters smartStyleLinearThumbnailDimensions](self, "smartStyleLinearThumbnailDimensions") >> 32;
                              if ((_DWORD)v28 == (unint64_t)objc_msgSend(a3, "smartStyleLinearThumbnailDimensions") >> 32)
                              {
                                v29 = (int)-[BWDeferredPipelineParameters smartStyleStyledThumbnailDimensions](self, "smartStyleStyledThumbnailDimensions");
                                if (v29 == objc_msgSend(a3, "smartStyleStyledThumbnailDimensions"))
                                {
                                  v30 = (unint64_t)-[BWDeferredPipelineParameters smartStyleStyledThumbnailDimensions](self, "smartStyleStyledThumbnailDimensions") >> 32;
                                  if ((_DWORD)v30 == (unint64_t)objc_msgSend(a3, "smartStyleStyledThumbnailDimensions") >> 32)
                                  {
                                    v31 = -[BWDeferredPipelineParameters generateInferencesForSemanticProcessingIfNeeded](self, "generateInferencesForSemanticProcessingIfNeeded");
                                    if (v31 == objc_msgSend(a3, "generateInferencesForSemanticProcessingIfNeeded"))
                                    {
                                      v32 = -[BWDeferredPipelineParameters quadraProcessingSupportEnabled](self, "quadraProcessingSupportEnabled");
                                      if (v32 == objc_msgSend(a3, "quadraProcessingSupportEnabled"))
                                      {
                                        v33 = -[BWDeferredPipelineParameters canProcessEnhancedResolution](self, "canProcessEnhancedResolution");
                                        if (v33 == objc_msgSend(a3, "canProcessEnhancedResolution"))
                                        {
                                          v34 = -[BWDeferredPipelineParameters continuousZoomWithDepthSupported](self, "continuousZoomWithDepthSupported");
                                          if (v34 == objc_msgSend(a3, "continuousZoomWithDepthSupported"))
                                          {
                                            v35 = -[BWDeferredPipelineParameters pearlModuleType](self, "pearlModuleType");
                                            if (v35 == objc_msgSend(a3, "pearlModuleType"))
                                            {
                                              v36 = -[BWDeferredPipelineParameters sfhrMode](self, "sfhrMode");
                                              LOBYTE(v14) = v36 == objc_msgSend(a3, "sfhrMode");
                                              return v14;
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
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_29:
    LOBYTE(v14) = 0;
  }
  return v14;
}

- (BOOL)areCompatibleWith:(id)a3
{
  int v5;
  unint64_t v6;
  NSDictionary *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  unint64_t v18;
  int v19;
  unint64_t v20;
  unsigned int v21;

  if (a3 == self)
  {
    LOBYTE(v8) = 1;
    return v8;
  }
  v5 = (int)-[BWDeferredPipelineParameters rawSensorDimensions](self, "rawSensorDimensions");
  if (v5 != objc_msgSend(a3, "rawSensorDimensions"))
    goto LABEL_41;
  v6 = (unint64_t)-[BWDeferredPipelineParameters rawSensorDimensions](self, "rawSensorDimensions") >> 32;
  if ((_DWORD)v6 != (unint64_t)objc_msgSend(a3, "rawSensorDimensions") >> 32)
    goto LABEL_41;
  v7 = -[BWDeferredPipelineParameters dimensionsByQSubResolutionFlavorByPortType](self, "dimensionsByQSubResolutionFlavorByPortType");
  if (v7 == (NSDictionary *)objc_msgSend(a3, "dimensionsByQSubResolutionFlavorByPortType")
    || (v8 = -[NSDictionary isEqual:](-[BWDeferredPipelineParameters dimensionsByQSubResolutionFlavorByPortType](self, "dimensionsByQSubResolutionFlavorByPortType"), "isEqual:", objc_msgSend(a3, "dimensionsByQSubResolutionFlavorByPortType"))) != 0)
  {
    v9 = -[BWDeferredPipelineParameters nrfVersion](self, "nrfVersion");
    if (v9 != objc_msgSend(a3, "nrfVersion"))
      goto LABEL_41;
    v10 = -[BWDeferredPipelineParameters noiseReductionAndFusionScheme](self, "noiseReductionAndFusionScheme");
    if (v10 != objc_msgSend(a3, "noiseReductionAndFusionScheme"))
      goto LABEL_41;
    v11 = -[BWDeferredPipelineParameters distortionCorrectionVersion](self, "distortionCorrectionVersion");
    if (v11 != objc_msgSend(a3, "distortionCorrectionVersion"))
      goto LABEL_41;
    v12 = -[BWDeferredPipelineParameters stillImageGDCSourceMode](self, "stillImageGDCSourceMode");
    if (v12 != objc_msgSend(a3, "stillImageGDCSourceMode"))
      goto LABEL_41;
    v13 = -[BWDeferredPipelineParameters semanticRenderingVersion](self, "semanticRenderingVersion");
    if (v13 != objc_msgSend(a3, "semanticRenderingVersion"))
      goto LABEL_41;
    if ((!objc_msgSend(a3, "intelligentDistortionCorrectionEnabled")
       || (v8 = -[BWDeferredPipelineParameters intelligentDistortionCorrectionEnabled](self, "intelligentDistortionCorrectionEnabled")) != 0)&& (!objc_msgSend(a3, "geometricDistortionCorrectionEnabled")|| (v8 = -[BWDeferredPipelineParameters geometricDistortionCorrectionEnabled](self, "geometricDistortionCorrectionEnabled")) != 0)&& (!objc_msgSend(a3, "dcProcessingWithDepthSupported")|| (v8 = -[BWDeferredPipelineParameters dcProcessingWithDepthSupported](self, "dcProcessingWithDepthSupported")) != 0)&& (!objc_msgSend(a3, "continuousZoomWithDepthSupported")|| (v8 = -[BWDeferredPipelineParameters continuousZoomWithDepthSupported](self, "continuousZoomWithDepthSupported")) != 0)&& (!objc_msgSend(a3, "pearlModuleType")|| (v8 = -[BWDeferredPipelineParameters pearlModuleType](self, "pearlModuleType")) != 0))
    {
      if (objc_msgSend(a3, "deepZoomMode"))
      {
        v14 = -[BWDeferredPipelineParameters deepZoomVersion](self, "deepZoomVersion");
        if (v14 != objc_msgSend(a3, "deepZoomVersion"))
          goto LABEL_41;
        v15 = -[BWDeferredPipelineParameters deepZoomMode](self, "deepZoomMode");
        if (v15 != objc_msgSend(a3, "deepZoomMode"))
          goto LABEL_41;
      }
      if (objc_msgSend(a3, "smartStyleRenderingVersion"))
      {
        v16 = -[BWDeferredPipelineParameters smartStyleRenderingVersion](self, "smartStyleRenderingVersion");
        if (v16 != objc_msgSend(a3, "smartStyleRenderingVersion"))
          goto LABEL_41;
        if (objc_msgSend(a3, "smartStyleReversibilityEnabled"))
        {
          v8 = -[BWDeferredPipelineParameters smartStyleReversibilityEnabled](self, "smartStyleReversibilityEnabled");
          if (!v8)
            return v8;
        }
        v17 = (int)-[BWDeferredPipelineParameters smartStyleLinearThumbnailDimensions](self, "smartStyleLinearThumbnailDimensions");
        if (v17 != objc_msgSend(a3, "smartStyleLinearThumbnailDimensions"))
          goto LABEL_41;
        v18 = (unint64_t)-[BWDeferredPipelineParameters smartStyleLinearThumbnailDimensions](self, "smartStyleLinearThumbnailDimensions") >> 32;
        if ((_DWORD)v18 != (unint64_t)objc_msgSend(a3, "smartStyleLinearThumbnailDimensions") >> 32)
          goto LABEL_41;
        v19 = (int)-[BWDeferredPipelineParameters smartStyleStyledThumbnailDimensions](self, "smartStyleStyledThumbnailDimensions");
        if (v19 != objc_msgSend(a3, "smartStyleStyledThumbnailDimensions"))
          goto LABEL_41;
        v20 = (unint64_t)-[BWDeferredPipelineParameters smartStyleStyledThumbnailDimensions](self, "smartStyleStyledThumbnailDimensions") >> 32;
        if ((_DWORD)v20 != (unint64_t)objc_msgSend(a3, "smartStyleStyledThumbnailDimensions") >> 32)
          goto LABEL_41;
      }
      if ((!objc_msgSend(a3, "generateInferencesForSemanticProcessingIfNeeded")
         || (v8 = -[BWDeferredPipelineParameters generateInferencesForSemanticProcessingIfNeeded](self, "generateInferencesForSemanticProcessingIfNeeded")) != 0)&& (!objc_msgSend(a3, "quadraProcessingSupportEnabled")|| (v8 = -[BWDeferredPipelineParameters quadraProcessingSupportEnabled](self, "quadraProcessingSupportEnabled")) != 0)&& (!objc_msgSend(a3, "canProcessEnhancedResolution")|| (v8 = -[BWDeferredPipelineParameters canProcessEnhancedResolution](self, "canProcessEnhancedResolution")) != 0))
      {
        if (!objc_msgSend(a3, "sfhrMode")
          || (v21 = -[BWDeferredPipelineParameters sfhrMode](self, "sfhrMode"),
              v21 == objc_msgSend(a3, "sfhrMode")))
        {
          LOBYTE(v8) = 1;
          return v8;
        }
LABEL_41:
        LOBYTE(v8) = 0;
      }
    }
  }
  return v8;
}

- (id)description
{
  NSDictionary *dimensionsByQSubResolutionFlavorByPortType;
  _BOOL4 geometricDistortionCorrectionEnabled;
  _BOOL4 dcProcessingWithDepthSupported;
  _BOOL4 generateInferencesForSemanticProcessingIfNeeded;
  _BOOL4 quadraProcessingSupportEnabled;
  _BOOL4 canProcessEnhancedResolution;
  _BOOL4 continuousZoomWithDepthSupported;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  _BOOL4 intelligentDistortionCorrectionEnabled;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rawSensorDimensions:%@"), BWStringFromDimensions(*(_QWORD *)&self->_rawSensorDimensions));
  dimensionsByQSubResolutionFlavorByPortType = self->_dimensionsByQSubResolutionFlavorByPortType;
  if (dimensionsByQSubResolutionFlavorByPortType)
    v29 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", dimensionsByQSubResolutionFlavorByPortType.count:%lu"), -[NSDictionary count](dimensionsByQSubResolutionFlavorByPortType, "count"));
  else
    v29 = &stru_1E4928818;
  v28 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", nrfVersion:%d"), self->_nrfVersion);
  v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", noiseReductionAndFusionScheme:%d"), self->_noiseReductionAndFusionScheme);
  if (self->_distortionCorrectionVersion)
    v26 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", dcProcessorVersion:%d"), self->_distortionCorrectionVersion);
  else
    v26 = &stru_1E4928818;
  intelligentDistortionCorrectionEnabled = self->_intelligentDistortionCorrectionEnabled;
  geometricDistortionCorrectionEnabled = self->_geometricDistortionCorrectionEnabled;
  dcProcessingWithDepthSupported = self->_dcProcessingWithDepthSupported;
  v25 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", gdcSourceMode:%d"), self->_stillImageGDCSourceMode);
  if (self->_deepZoomVersion)
    v23 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", deepZoomVersion:%d"), self->_deepZoomVersion);
  else
    v23 = &stru_1E4928818;
  if (self->_deepZoomMode)
    v22 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", deepZoomMode:%d"), self->_deepZoomMode);
  else
    v22 = &stru_1E4928818;
  if (self->_semanticRenderingVersion)
    v21 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", semanticRenderingVersion:%d"), self->_semanticRenderingVersion);
  else
    v21 = &stru_1E4928818;
  if (self->_smartStyleRenderingVersion)
    v20 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", smartStyleRenderingVersion:%d"), self->_smartStyleRenderingVersion);
  else
    v20 = &stru_1E4928818;
  if (self->_smartStyleReversibilityEnabled)
    v19 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", smartStyleReversibilityEnabled:%d"), 1);
  else
    v19 = &stru_1E4928818;
  generateInferencesForSemanticProcessingIfNeeded = self->_generateInferencesForSemanticProcessingIfNeeded;
  quadraProcessingSupportEnabled = self->_quadraProcessingSupportEnabled;
  canProcessEnhancedResolution = self->_canProcessEnhancedResolution;
  continuousZoomWithDepthSupported = self->_continuousZoomWithDepthSupported;
  v10 = &stru_1E4928818;
  if (self->_pearlModuleType)
    v11 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", pearlModuleType %d"), self->_pearlModuleType);
  else
    v11 = &stru_1E4928818;
  if (continuousZoomWithDepthSupported)
    v12 = CFSTR(", continuousZoomWithDepthSupported:1");
  else
    v12 = &stru_1E4928818;
  if (canProcessEnhancedResolution)
    v13 = CFSTR(", canProcessEnhancedResolution:1");
  else
    v13 = &stru_1E4928818;
  if (quadraProcessingSupportEnabled)
    v14 = CFSTR(", quadraProcessingSupportEnabled:1");
  else
    v14 = &stru_1E4928818;
  if (generateInferencesForSemanticProcessingIfNeeded)
    v15 = CFSTR(", generateInferencesForSemanticProcessingIfNeeded:1");
  else
    v15 = &stru_1E4928818;
  if (dcProcessingWithDepthSupported)
    v16 = CFSTR(", dcProcessingWithDepth:1");
  else
    v16 = &stru_1E4928818;
  if (geometricDistortionCorrectionEnabled)
    v17 = CFSTR(", gdcEnabled:1");
  else
    v17 = &stru_1E4928818;
  if (intelligentDistortionCorrectionEnabled)
    v10 = CFSTR(", idcEnabled:1");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p>: %@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@"), objc_opt_class(), self, v30, v29, v28, v27, v26, v10, v17, v16, v25, v23, v22, v21, v20, v19,
               v15,
               v14,
               v13,
               v12,
               v11);
}

- ($2825F4736939C4A6D3AD43837233062D)rawSensorDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_rawSensorDimensions;
}

- (void)setRawSensorDimensions:(id)a3
{
  self->_rawSensorDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (NSDictionary)dimensionsByQSubResolutionFlavorByPortType
{
  return self->_dimensionsByQSubResolutionFlavorByPortType;
}

- (void)setDimensionsByQSubResolutionFlavorByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)setDcProcessingWithDepthSupported:(BOOL)a3
{
  self->_dcProcessingWithDepthSupported = a3;
}

- (void)setStillImageGDCSourceMode:(int)a3
{
  self->_stillImageGDCSourceMode = a3;
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

- (BOOL)canProcessEnhancedResolution
{
  return self->_canProcessEnhancedResolution;
}

- (unsigned)sfhrMode
{
  return self->_sfhrMode;
}

- (void)setSfhrMode:(unsigned int)a3
{
  self->_sfhrMode = a3;
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

- (void)setSensorCenterOffset:(CGPoint)a3
{
  self->_sensorCenterOffset = a3;
}

@end
