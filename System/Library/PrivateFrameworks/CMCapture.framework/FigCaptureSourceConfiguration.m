@implementation FigCaptureSourceConfiguration

- (OpaqueFigCaptureSource)source
{
  return self->_source;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  OpaqueFigCaptureSource *v5;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend((id)v4, "setSourceID:", -[FigCaptureSourceConfiguration sourceID](self, "sourceID"));
  v5 = -[FigCaptureSourceConfiguration source](self, "source");
  if (v5)
    v5 = (OpaqueFigCaptureSource *)CFRetain(v5);
  *(_QWORD *)(v4 + 16) = v5;
  *(_DWORD *)(v4 + 24) = -[FigCaptureSourceConfiguration sourceType](self, "sourceType");
  if (self)
  {
    if (-[FigCaptureSourceConfiguration sourceType](self, "sourceType") == 1)
    {
      objc_msgSend((id)v4, "setRequiredFormat:", -[FigCaptureSourceConfiguration requiredFormat](self, "requiredFormat"));
      -[FigCaptureSourceConfiguration requiredMaxFrameRate](self, "requiredMaxFrameRate");
      objc_msgSend((id)v4, "setRequiredMaxFrameRate:");
      -[FigCaptureSourceConfiguration requiredMinFrameRate](self, "requiredMinFrameRate");
      objc_msgSend((id)v4, "setRequiredMinFrameRate:");
      -[FigCaptureSourceConfiguration maxFrameRateClientOverride](self, "maxFrameRateClientOverride");
      objc_msgSend((id)v4, "setMaxFrameRateClientOverride:");
      -[FigCaptureSourceConfiguration maxGainClientOverride](self, "maxGainClientOverride");
      objc_msgSend((id)v4, "setMaxGainClientOverride:");
      -[FigCaptureSourceConfiguration videoZoomFactor](self, "videoZoomFactor");
      objc_msgSend((id)v4, "setVideoZoomFactor:");
      objc_msgSend((id)v4, "setFallbackPrimaryConstituentDeviceTypes:", -[FigCaptureSourceConfiguration fallbackPrimaryConstituentDeviceTypes](self, "fallbackPrimaryConstituentDeviceTypes"));
      -[FigCaptureSourceConfiguration videoZoomRampAcceleration](self, "videoZoomRampAcceleration");
      objc_msgSend((id)v4, "setVideoZoomRampAcceleration:");
      objc_msgSend((id)v4, "setImageControlMode:", -[FigCaptureSourceConfiguration imageControlMode](self, "imageControlMode"));
      objc_msgSend((id)v4, "setApplyMaxExposureDurationFrameworkOverrideWhenAvailable:", -[FigCaptureSourceConfiguration applyMaxExposureDurationFrameworkOverrideWhenAvailable](self, "applyMaxExposureDurationFrameworkOverrideWhenAvailable"));
      -[FigCaptureSourceConfiguration maxExposureDurationClientOverride](self, "maxExposureDurationClientOverride");
      v7 = v9;
      v8 = v10;
      objc_msgSend((id)v4, "setMaxExposureDurationClientOverride:", &v7);
      objc_msgSend((id)v4, "setFaceDetectionConfiguration:", -[FigCaptureSourceConfiguration faceDetectionConfiguration](self, "faceDetectionConfiguration"));
      objc_msgSend((id)v4, "setSensorHDREnabled:", -[FigCaptureSourceConfiguration sensorHDREnabled](self, "sensorHDREnabled"));
      objc_msgSend((id)v4, "setHighlightRecoveryEnabled:", -[FigCaptureSourceConfiguration highlightRecoveryEnabled](self, "highlightRecoveryEnabled"));
      objc_msgSend((id)v4, "setColorSpace:", -[FigCaptureSourceConfiguration colorSpace](self, "colorSpace"));
      objc_msgSend((id)v4, "setDepthDataDeliveryEnabled:", -[FigCaptureSourceConfiguration depthDataDeliveryEnabled](self, "depthDataDeliveryEnabled"));
      objc_msgSend((id)v4, "setDepthDataFormat:", -[FigCaptureSourceConfiguration depthDataFormat](self, "depthDataFormat"));
      -[FigCaptureSourceConfiguration depthDataMaxFrameRate](self, "depthDataMaxFrameRate");
      objc_msgSend((id)v4, "setDepthDataMaxFrameRate:");
      objc_msgSend((id)v4, "setLowLightVideoCaptureEnabled:", -[FigCaptureSourceConfiguration lowLightVideoCaptureEnabled](self, "lowLightVideoCaptureEnabled"));
      objc_msgSend((id)v4, "setSpatialOverCaptureEnabled:", -[FigCaptureSourceConfiguration spatialOverCaptureEnabled](self, "spatialOverCaptureEnabled"));
      objc_msgSend((id)v4, "setNonDestructiveCropEnabled:", -[FigCaptureSourceConfiguration nonDestructiveCropEnabled](self, "nonDestructiveCropEnabled"));
      -[FigCaptureSourceConfiguration normalizedNonDestructiveCropSize](self, "normalizedNonDestructiveCropSize");
      objc_msgSend((id)v4, "setNormalizedNonDestructiveCropSize:");
      objc_msgSend((id)v4, "setGeometricDistortionCorrectionEnabled:", -[FigCaptureSourceConfiguration geometricDistortionCorrectionEnabled](self, "geometricDistortionCorrectionEnabled"));
      objc_msgSend((id)v4, "setVariableFrameRateVideoCaptureEnabled:", -[FigCaptureSourceConfiguration variableFrameRateVideoCaptureEnabled](self, "variableFrameRateVideoCaptureEnabled"));
      objc_msgSend((id)v4, "setVideoStabilizationStrength:", -[FigCaptureSourceConfiguration videoStabilizationStrength](self, "videoStabilizationStrength"));
      objc_msgSend((id)v4, "setCinematicFramingEnabled:", -[FigCaptureSourceConfiguration cinematicFramingEnabled](self, "cinematicFramingEnabled"));
      objc_msgSend((id)v4, "setCinematicFramingSupported:", -[FigCaptureSourceConfiguration isCinematicFramingSupported](self, "isCinematicFramingSupported"));
      objc_msgSend((id)v4, "setCinematicFramingControlMode:", -[FigCaptureSourceConfiguration cinematicFramingControlMode](self, "cinematicFramingControlMode"));
      objc_msgSend((id)v4, "setBackgroundBlurSupported:", -[FigCaptureSourceConfiguration isBackgroundBlurSupported](self, "isBackgroundBlurSupported"));
      objc_msgSend((id)v4, "setBackgroundBlurEnabled:", -[FigCaptureSourceConfiguration backgroundBlurEnabled](self, "backgroundBlurEnabled"));
      objc_msgSend((id)v4, "setStudioLightingSupported:", -[FigCaptureSourceConfiguration isStudioLightingSupported](self, "isStudioLightingSupported"));
      objc_msgSend((id)v4, "setStudioLightingEnabled:", -[FigCaptureSourceConfiguration studioLightingEnabled](self, "studioLightingEnabled"));
      objc_msgSend((id)v4, "setReactionEffectsSupported:", -[FigCaptureSourceConfiguration reactionEffectsSupported](self, "reactionEffectsSupported"));
      objc_msgSend((id)v4, "setReactionEffectsEnabled:", -[FigCaptureSourceConfiguration reactionEffectsEnabled](self, "reactionEffectsEnabled"));
      objc_msgSend((id)v4, "setBackgroundReplacementSupported:", -[FigCaptureSourceConfiguration isBackgroundReplacementSupported](self, "isBackgroundReplacementSupported"));
      objc_msgSend((id)v4, "setBackgroundReplacementEnabled:", -[FigCaptureSourceConfiguration backgroundReplacementEnabled](self, "backgroundReplacementEnabled"));
      objc_msgSend((id)v4, "setFaceDrivenAEAFMode:", -[FigCaptureSourceConfiguration faceDrivenAEAFMode](self, "faceDrivenAEAFMode"));
      objc_msgSend((id)v4, "setFaceDrivenAEAFEnabledByDefault:", -[FigCaptureSourceConfiguration faceDrivenAEAFEnabledByDefault](self, "faceDrivenAEAFEnabledByDefault"));
      objc_msgSend((id)v4, "setDeskCamEnabled:", -[FigCaptureSourceConfiguration deskCamEnabled](self, "deskCamEnabled"));
      objc_msgSend((id)v4, "setManualCinematicFramingEnabled:", -[FigCaptureSourceConfiguration manualCinematicFramingEnabled](self, "manualCinematicFramingEnabled"));
      -[FigCaptureSourceConfiguration manualFramingPanningAngleX](self, "manualFramingPanningAngleX");
      objc_msgSend((id)v4, "setManualFramingPanningAngleX:");
      -[FigCaptureSourceConfiguration manualFramingPanningAngleY](self, "manualFramingPanningAngleY");
      objc_msgSend((id)v4, "setManualFramingPanningAngleY:");
      -[FigCaptureSourceConfiguration manualFramingDefaultZoomFactor](self, "manualFramingDefaultZoomFactor");
      objc_msgSend((id)v4, "setManualFramingDefaultZoomFactor:");
      objc_msgSend((id)v4, "setGazeSelectionEnabled:", -[FigCaptureSourceConfiguration gazeSelectionEnabled](self, "gazeSelectionEnabled"));
      objc_msgSend((id)v4, "setDockedTrackingEnabled:", -[FigCaptureSourceConfiguration isDockedTrackingEnabled](self, "isDockedTrackingEnabled"));
      objc_msgSend((id)v4, "setClientExpectsCameraMountedInLandscapeOrientation:", -[FigCaptureSourceConfiguration clientExpectsCameraMountedInLandscapeOrientation](self, "clientExpectsCameraMountedInLandscapeOrientation"));
    }
    else if (-[FigCaptureSourceConfiguration sourceType](self, "sourceType") == 2)
    {
      objc_msgSend((id)v4, "setClientOSVersionSupportsDecoupledIO:", -[FigCaptureSourceConfiguration clientOSVersionSupportsDecoupledIO](self, "clientOSVersionSupportsDecoupledIO"));
      objc_msgSend((id)v4, "setClientAudioClockDeviceUID:", -[FigCaptureSourceConfiguration clientAudioClockDeviceUID](self, "clientAudioClockDeviceUID"));
    }
  }
  return (id)v4;
}

- (void)setRequiredMinFrameRate:(float)a3
{
  self->_requiredMinFrameRate = a3;
}

- (void)setRequiredMaxFrameRate:(float)a3
{
  self->_requiredMaxFrameRate = a3;
}

- (void)setNormalizedNonDestructiveCropSize:(CGSize)a3
{
  self->_normalizedNonDestructiveCropSize = a3;
}

- (void)setNonDestructiveCropEnabled:(BOOL)a3
{
  self->_nonDestructiveCropEnabled = a3;
}

- (void)setSourceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setSpatialOverCaptureEnabled:(BOOL)a3
{
  self->_spatialOverCaptureEnabled = a3;
}

- (void)setClientExpectsCameraMountedInLandscapeOrientation:(BOOL)a3
{
  self->_clientExpectsCameraMountedInLandscapeOrientation = a3;
}

- (void)setApplyMaxExposureDurationFrameworkOverrideWhenAvailable:(BOOL)a3
{
  self->_applyMaxExposureDurationFrameworkOverrideWhenAvailable = a3;
}

- (void)setRequiredFormat:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (void)setMaxFrameRateClientOverride:(float)a3
{
  self->_maxFrameRateClientOverride = a3;
}

- (void)setDepthDataFormat:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (void)setDepthDataDeliveryEnabled:(BOOL)a3
{
  self->_depthDataDeliveryEnabled = a3;
}

- (void)setVideoZoomRampAcceleration:(float)a3
{
  self->_videoZoomRampAcceleration = a3;
}

- (void)setVideoZoomFactor:(float)a3
{
  self->_videoZoomFactor = a3;
}

- (void)setVideoStabilizationStrength:(int)a3
{
  self->_videoStabilizationStrength = a3;
}

- (void)setVariableFrameRateVideoCaptureEnabled:(BOOL)a3
{
  self->_variableFrameRateVideoCaptureEnabled = a3;
}

- (void)setStudioLightingSupported:(BOOL)a3
{
  self->_studioLightingSupported = a3;
}

- (void)setReactionEffectsSupported:(BOOL)a3
{
  self->_reactionEffectsSupported = a3;
}

- (void)setMaxExposureDurationClientOverride:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_maxExposureDurationClientOverride.epoch = a3->var3;
  *(_OWORD *)&self->_maxExposureDurationClientOverride.value = v3;
}

- (void)setLowLightVideoCaptureEnabled:(BOOL)a3
{
  self->_lowLightVideoCaptureEnabled = a3;
}

- (void)setHighlightRecoveryEnabled:(BOOL)a3
{
  self->_highlightRecoveryEnabled = a3;
}

- (void)setGeometricDistortionCorrectionEnabled:(BOOL)a3
{
  self->_geometricDistortionCorrectionEnabled = a3;
}

- (void)setGazeSelectionEnabled:(BOOL)a3
{
  self->_gazeSelectionEnabled = a3;
}

- (void)setFallbackPrimaryConstituentDeviceTypes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (void)setFaceDrivenAEAFMode:(int)a3
{
  self->_faceDrivenAEAFMode = a3;
}

- (void)setFaceDrivenAEAFEnabledByDefault:(BOOL)a3
{
  self->_faceDrivenAEAFEnabledByDefault = a3;
}

- (void)setFaceDetectionConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setDepthDataMaxFrameRate:(float)a3
{
  self->_depthDataMaxFrameRate = a3;
}

- (void)setColorSpace:(int)a3
{
  self->_colorSpace = a3;
}

- (void)setCinematicFramingSupported:(BOOL)a3
{
  self->_cinematicFramingSupported = a3;
}

- (void)setBackgroundBlurSupported:(BOOL)a3
{
  self->_backgroundBlurSupported = a3;
}

- (void)setReactionEffectsEnabled:(BOOL)a3
{
  self->_reactionEffectsEnabled = a3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSString *v9;
  int v10;
  void *v11;
  uint64_t v12;
  int v13;
  FigCaptureSourceVideoFormat *v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  int v33;
  int v34;
  NSDictionary *v35;
  int v36;
  int v37;
  int v38;
  int v39;
  FigCaptureSourceDepthDataFormat *v40;
  float v41;
  float v42;
  float v43;
  int v44;
  int v45;
  int v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  int v53;
  int v54;
  int v55;
  int v56;
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
  int v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  NSString *v82;
  NSDictionary *v83;
  uint64_t v84;
  int v85;
  NSDictionary *v86;
  uint64_t v87;
  int v88;
  NSDictionary *v89;
  uint64_t v90;
  int v91;
  CMTime v93;
  CMTime time1;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;

  if (a3 == self)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    v95 = v6;
    v96 = v5;
    v97 = v3;
    v98 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_71;
    v9 = -[FigCaptureSourceConfiguration sourceID](self, "sourceID");
    if (v9 == (NSString *)objc_msgSend(a3, "sourceID")
      || (v10 = -[NSString isEqual:](-[FigCaptureSourceConfiguration sourceID](self, "sourceID"), "isEqual:", objc_msgSend(a3, "sourceID"))) != 0)
    {
      if (!self->_source
        || ((v11 = (void *)objc_msgSend((id)-[FigCaptureSourceConfiguration _sourceAttributes]((uint64_t)self), "objectForKeyedSubscript:", CFSTR("UniqueID")), !a3)? (v12 = 0): (v12 = objc_msgSend((id)-[FigCaptureSourceConfiguration _sourceAttributes]((uint64_t)a3), "objectForKeyedSubscript:", CFSTR("UniqueID"))), (v10 = objc_msgSend(v11, "isEqual:", v12)) != 0))
      {
        v13 = -[FigCaptureSourceConfiguration _sourceToken]((uint64_t)self);
        if (v13 != -[FigCaptureSourceConfiguration _sourceToken]((uint64_t)a3))
          goto LABEL_71;
        if (-[FigCaptureSourceConfiguration sourceType](self, "sourceType") != 1)
          goto LABEL_66;
        if (!a3)
        {
          -[FigCaptureSourceConfiguration sourceType](self, "sourceType");
LABEL_79:
          LOBYTE(v10) = 1;
          return v10;
        }
        if (objc_msgSend(a3, "sourceType") != 1)
        {
LABEL_66:
          v80 = -[FigCaptureSourceConfiguration sourceType](self, "sourceType");
          if (!a3)
            goto LABEL_79;
          if (v80 != 2)
            goto LABEL_79;
          if (objc_msgSend(a3, "sourceType") != 2)
            goto LABEL_79;
          v81 = -[FigCaptureSourceConfiguration clientOSVersionSupportsDecoupledIO](self, "clientOSVersionSupportsDecoupledIO");
          if (v81 == objc_msgSend(a3, "clientOSVersionSupportsDecoupledIO"))
          {
            v82 = -[FigCaptureSourceConfiguration clientAudioClockDeviceUID](self, "clientAudioClockDeviceUID");
            if (v82 == (NSString *)objc_msgSend(a3, "clientAudioClockDeviceUID"))
              goto LABEL_79;
          }
          goto LABEL_71;
        }
        v14 = -[FigCaptureSourceConfiguration requiredFormat](self, "requiredFormat");
        if (v14 == (FigCaptureSourceVideoFormat *)objc_msgSend(a3, "requiredFormat")
          || (v10 = -[FigCaptureSourceFormat isEqual:](-[FigCaptureSourceConfiguration requiredFormat](self, "requiredFormat"), "isEqual:", objc_msgSend(a3, "requiredFormat"))) != 0)
        {
          -[FigCaptureSourceConfiguration requiredMaxFrameRate](self, "requiredMaxFrameRate");
          v16 = v15;
          objc_msgSend(a3, "requiredMaxFrameRate");
          if (v16 != v17)
            goto LABEL_71;
          -[FigCaptureSourceConfiguration requiredMinFrameRate](self, "requiredMinFrameRate");
          v19 = v18;
          objc_msgSend(a3, "requiredMinFrameRate");
          if (v19 != v20)
            goto LABEL_71;
          -[FigCaptureSourceConfiguration maxFrameRateClientOverride](self, "maxFrameRateClientOverride");
          v22 = v21;
          objc_msgSend(a3, "maxFrameRateClientOverride");
          if (v22 != v23)
            goto LABEL_71;
          -[FigCaptureSourceConfiguration maxGainClientOverride](self, "maxGainClientOverride");
          v25 = v24;
          objc_msgSend(a3, "maxGainClientOverride");
          if (v25 != v26)
            goto LABEL_71;
          -[FigCaptureSourceConfiguration videoZoomFactor](self, "videoZoomFactor");
          v28 = v27;
          objc_msgSend(a3, "videoZoomFactor");
          if (v28 != v29)
            goto LABEL_71;
          if (!-[FigCaptureSourceConfiguration fallbackPrimaryConstituentDeviceTypes](self, "fallbackPrimaryConstituentDeviceTypes")&& !objc_msgSend(a3, "fallbackPrimaryConstituentDeviceTypes")|| (v10 = -[NSArray isEqualToArray:](-[FigCaptureSourceConfiguration fallbackPrimaryConstituentDeviceTypes](self, "fallbackPrimaryConstituentDeviceTypes"), "isEqualToArray:", objc_msgSend(a3, "fallbackPrimaryConstituentDeviceTypes"))) != 0)
          {
            -[FigCaptureSourceConfiguration videoZoomRampAcceleration](self, "videoZoomRampAcceleration");
            v31 = v30;
            objc_msgSend(a3, "videoZoomRampAcceleration");
            if (v31 != v32)
              goto LABEL_71;
            v33 = -[FigCaptureSourceConfiguration imageControlMode](self, "imageControlMode");
            if (v33 != objc_msgSend(a3, "imageControlMode"))
              goto LABEL_71;
            v34 = -[FigCaptureSourceConfiguration applyMaxExposureDurationFrameworkOverrideWhenAvailable](self, "applyMaxExposureDurationFrameworkOverrideWhenAvailable");
            if (v34 != objc_msgSend(a3, "applyMaxExposureDurationFrameworkOverrideWhenAvailable"))
              goto LABEL_71;
            -[FigCaptureSourceConfiguration maxExposureDurationClientOverride](self, "maxExposureDurationClientOverride");
            objc_msgSend(a3, "maxExposureDurationClientOverride");
            if (CMTimeCompare(&time1, &v93))
              goto LABEL_71;
            v35 = -[FigCaptureSourceConfiguration faceDetectionConfiguration](self, "faceDetectionConfiguration");
            if (v35 != (NSDictionary *)objc_msgSend(a3, "faceDetectionConfiguration")
              && (-[NSDictionary isEqual:](-[FigCaptureSourceConfiguration faceDetectionConfiguration](self, "faceDetectionConfiguration"), "isEqual:", objc_msgSend(a3, "faceDetectionConfiguration")) & 1) == 0)
            {
              v83 = -[FigCaptureSourceConfiguration faceDetectionConfiguration](self, "faceDetectionConfiguration");
              v84 = *MEMORY[0x1E0D06520];
              v85 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v83, "objectForKeyedSubscript:", *MEMORY[0x1E0D06520]), "BOOLValue");
              if (v85 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "faceDetectionConfiguration"), "objectForKeyedSubscript:", v84), "BOOLValue"))goto LABEL_71;
              v86 = -[FigCaptureSourceConfiguration faceDetectionConfiguration](self, "faceDetectionConfiguration");
              v87 = *MEMORY[0x1E0D06518];
              v88 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v86, "objectForKeyedSubscript:", *MEMORY[0x1E0D06518]), "BOOLValue");
              if (v88 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "faceDetectionConfiguration"), "objectForKeyedSubscript:", v87), "BOOLValue"))goto LABEL_71;
              v89 = -[FigCaptureSourceConfiguration faceDetectionConfiguration](self, "faceDetectionConfiguration");
              v90 = *MEMORY[0x1E0D06530];
              v91 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v89, "objectForKeyedSubscript:", *MEMORY[0x1E0D06530]), "BOOLValue");
              if (v91 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "faceDetectionConfiguration"), "objectForKeyedSubscript:", v90), "BOOLValue"))goto LABEL_71;
            }
            v36 = -[FigCaptureSourceConfiguration sensorHDREnabled](self, "sensorHDREnabled");
            if (v36 != objc_msgSend(a3, "sensorHDREnabled"))
              goto LABEL_71;
            v37 = -[FigCaptureSourceConfiguration highlightRecoveryEnabled](self, "highlightRecoveryEnabled");
            if (v37 != objc_msgSend(a3, "highlightRecoveryEnabled"))
              goto LABEL_71;
            v38 = -[FigCaptureSourceConfiguration colorSpace](self, "colorSpace");
            if (v38 != objc_msgSend(a3, "colorSpace"))
              goto LABEL_71;
            v39 = -[FigCaptureSourceConfiguration depthDataDeliveryEnabled](self, "depthDataDeliveryEnabled");
            if (v39 != objc_msgSend(a3, "depthDataDeliveryEnabled"))
              goto LABEL_71;
            v40 = -[FigCaptureSourceConfiguration depthDataFormat](self, "depthDataFormat");
            if (v40 == (FigCaptureSourceDepthDataFormat *)objc_msgSend(a3, "depthDataFormat")
              || (v10 = -[FigCaptureSourceFormat isEqual:](-[FigCaptureSourceConfiguration depthDataFormat](self, "depthDataFormat"), "isEqual:", objc_msgSend(a3, "depthDataFormat"))) != 0)
            {
              -[FigCaptureSourceConfiguration depthDataMaxFrameRate](self, "depthDataMaxFrameRate");
              v42 = v41;
              objc_msgSend(a3, "depthDataMaxFrameRate");
              if (v42 == v43)
              {
                v44 = -[FigCaptureSourceConfiguration lowLightVideoCaptureEnabled](self, "lowLightVideoCaptureEnabled");
                if (v44 == objc_msgSend(a3, "lowLightVideoCaptureEnabled"))
                {
                  v45 = -[FigCaptureSourceConfiguration spatialOverCaptureEnabled](self, "spatialOverCaptureEnabled");
                  if (v45 == objc_msgSend(a3, "spatialOverCaptureEnabled"))
                  {
                    v46 = -[FigCaptureSourceConfiguration nonDestructiveCropEnabled](self, "nonDestructiveCropEnabled");
                    if (v46 == objc_msgSend(a3, "nonDestructiveCropEnabled"))
                    {
                      -[FigCaptureSourceConfiguration normalizedNonDestructiveCropSize](self, "normalizedNonDestructiveCropSize");
                      v48 = v47;
                      objc_msgSend(a3, "normalizedNonDestructiveCropSize");
                      if (v48 == v49)
                      {
                        -[FigCaptureSourceConfiguration normalizedNonDestructiveCropSize](self, "normalizedNonDestructiveCropSize");
                        v51 = v50;
                        objc_msgSend(a3, "normalizedNonDestructiveCropSize");
                        if (v51 == v52)
                        {
                          v53 = -[FigCaptureSourceConfiguration geometricDistortionCorrectionEnabled](self, "geometricDistortionCorrectionEnabled");
                          if (v53 == objc_msgSend(a3, "geometricDistortionCorrectionEnabled"))
                          {
                            v54 = -[FigCaptureSourceConfiguration variableFrameRateVideoCaptureEnabled](self, "variableFrameRateVideoCaptureEnabled");
                            if (v54 == objc_msgSend(a3, "variableFrameRateVideoCaptureEnabled"))
                            {
                              v55 = -[FigCaptureSourceConfiguration videoStabilizationStrength](self, "videoStabilizationStrength");
                              if (v55 == objc_msgSend(a3, "videoStabilizationStrength"))
                              {
                                v56 = -[FigCaptureSourceConfiguration cinematicFramingEnabled](self, "cinematicFramingEnabled");
                                if (v56 == objc_msgSend(a3, "cinematicFramingEnabled"))
                                {
                                  v57 = -[FigCaptureSourceConfiguration isCinematicFramingSupported](self, "isCinematicFramingSupported");
                                  if (v57 == objc_msgSend(a3, "isCinematicFramingSupported"))
                                  {
                                    v58 = -[FigCaptureSourceConfiguration cinematicFramingControlMode](self, "cinematicFramingControlMode");
                                    if (v58 == objc_msgSend(a3, "cinematicFramingControlMode"))
                                    {
                                      v59 = -[FigCaptureSourceConfiguration isBackgroundBlurSupported](self, "isBackgroundBlurSupported");
                                      if (v59 == objc_msgSend(a3, "isBackgroundBlurSupported"))
                                      {
                                        v60 = -[FigCaptureSourceConfiguration backgroundBlurEnabled](self, "backgroundBlurEnabled");
                                        if (v60 == objc_msgSend(a3, "backgroundBlurEnabled"))
                                        {
                                          v61 = -[FigCaptureSourceConfiguration isStudioLightingSupported](self, "isStudioLightingSupported");
                                          if (v61 == objc_msgSend(a3, "isStudioLightingSupported"))
                                          {
                                            v62 = -[FigCaptureSourceConfiguration studioLightingEnabled](self, "studioLightingEnabled");
                                            if (v62 == objc_msgSend(a3, "studioLightingEnabled"))
                                            {
                                              v63 = -[FigCaptureSourceConfiguration reactionEffectsSupported](self, "reactionEffectsSupported");
                                              if (v63 == objc_msgSend(a3, "reactionEffectsSupported"))
                                              {
                                                v64 = -[FigCaptureSourceConfiguration reactionEffectsEnabled](self, "reactionEffectsEnabled");
                                                if (v64 == objc_msgSend(a3, "reactionEffectsEnabled"))
                                                {
                                                  v65 = -[FigCaptureSourceConfiguration isBackgroundReplacementSupported](self, "isBackgroundReplacementSupported");
                                                  if (v65 == objc_msgSend(a3, "isBackgroundReplacementSupported"))
                                                  {
                                                    v66 = -[FigCaptureSourceConfiguration backgroundReplacementEnabled](self, "backgroundReplacementEnabled");
                                                    if (v66 == objc_msgSend(a3, "backgroundReplacementEnabled"))
                                                    {
                                                      v67 = -[FigCaptureSourceConfiguration faceDrivenAEAFMode](self, "faceDrivenAEAFMode");
                                                      if (v67 == objc_msgSend(a3, "faceDrivenAEAFMode"))
                                                      {
                                                        v68 = -[FigCaptureSourceConfiguration faceDrivenAEAFEnabledByDefault](self, "faceDrivenAEAFEnabledByDefault");
                                                        if (v68 == objc_msgSend(a3, "faceDrivenAEAFEnabledByDefault"))
                                                        {
                                                          v69 = -[FigCaptureSourceConfiguration deskCamEnabled](self, "deskCamEnabled");
                                                          if (v69 == objc_msgSend(a3, "deskCamEnabled"))
                                                          {
                                                            v70 = -[FigCaptureSourceConfiguration manualCinematicFramingEnabled](self, "manualCinematicFramingEnabled");
                                                            if (v70 == objc_msgSend(a3, "manualCinematicFramingEnabled"))
                                                            {
                                                              -[FigCaptureSourceConfiguration manualFramingPanningAngleX](self, "manualFramingPanningAngleX");
                                                              v72 = v71;
                                                              objc_msgSend(a3, "manualFramingPanningAngleX");
                                                              if (v72 == v73)
                                                              {
                                                                -[FigCaptureSourceConfiguration manualFramingPanningAngleY](self, "manualFramingPanningAngleY");
                                                                v75 = v74;
                                                                objc_msgSend(a3, "manualFramingPanningAngleY");
                                                                if (v75 == v76)
                                                                {
                                                                  v77 = -[FigCaptureSourceConfiguration gazeSelectionEnabled](self, "gazeSelectionEnabled");
                                                                  if (v77 == objc_msgSend(a3, "gazeSelectionEnabled"))
                                                                  {
                                                                    v78 = -[FigCaptureSourceConfiguration isDockedTrackingEnabled](self, "isDockedTrackingEnabled");
                                                                    if (v78 == objc_msgSend(a3, "isDockedTrackingEnabled"))
                                                                    {
                                                                      v79 = -[FigCaptureSourceConfiguration clientExpectsCameraMountedInLandscapeOrientation](self, "clientExpectsCameraMountedInLandscapeOrientation");
                                                                      if (v79 == objc_msgSend(a3, "clientExpectsCameraMountedInLandscapeOrientation"))goto LABEL_79;
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
                          }
                        }
                      }
                    }
                  }
                }
              }
LABEL_71:
              LOBYTE(v10) = 0;
            }
          }
        }
      }
    }
  }
  return v10;
}

- (FigCaptureSourceVideoFormat)requiredFormat
{
  return self->_requiredFormat;
}

- (int)sourceType
{
  int result;

  result = self->_sourceType;
  if (!result)
  {
    result = objc_msgSend((id)objc_msgSend((id)-[FigCaptureSourceConfiguration _sourceAttributes]((uint64_t)self), "objectForKeyedSubscript:", CFSTR("SourceType")), "intValue");
    self->_sourceType = result;
  }
  return result;
}

- (NSString)sourceID
{
  return self->_sourceID;
}

- (BOOL)depthDataDeliveryEnabled
{
  return self->_depthDataDeliveryEnabled;
}

- (int)imageControlMode
{
  return self->_imageControlMode;
}

- (BOOL)cinematicFramingEnabled
{
  return self->_cinematicFramingEnabled;
}

- (CGSize)normalizedNonDestructiveCropSize
{
  double width;
  double height;
  CGSize result;

  width = self->_normalizedNonDestructiveCropSize.width;
  height = self->_normalizedNonDestructiveCropSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (float)requiredMaxFrameRate
{
  return self->_requiredMaxFrameRate;
}

- (BOOL)manualCinematicFramingEnabled
{
  return self->_manualCinematicFramingEnabled;
}

- (BOOL)spatialOverCaptureEnabled
{
  return self->_spatialOverCaptureEnabled;
}

- (FigCaptureSourceDepthDataFormat)depthDataFormat
{
  return self->_depthDataFormat;
}

- (float)requiredMinFrameRate
{
  return self->_requiredMinFrameRate;
}

- (float)maxFrameRateClientOverride
{
  return self->_maxFrameRateClientOverride;
}

- (float)maxGainClientOverride
{
  return self->_maxGainClientOverride;
}

- (float)videoZoomFactor
{
  return self->_videoZoomFactor;
}

- (int)videoStabilizationStrength
{
  return self->_videoStabilizationStrength;
}

- (BOOL)studioLightingEnabled
{
  return self->_studioLightingEnabled;
}

- (BOOL)backgroundBlurEnabled
{
  return self->_backgroundBlurEnabled;
}

- (BOOL)clientExpectsCameraMountedInLandscapeOrientation
{
  return self->_clientExpectsCameraMountedInLandscapeOrientation;
}

- (BOOL)geometricDistortionCorrectionEnabled
{
  return self->_geometricDistortionCorrectionEnabled;
}

- (BOOL)isStudioLightingSupported
{
  return self->_studioLightingSupported;
}

- (BOOL)isBackgroundBlurSupported
{
  return self->_backgroundBlurSupported;
}

- (BOOL)reactionEffectsEnabled
{
  return self->_reactionEffectsEnabled;
}

- (BOOL)deskCamEnabled
{
  return self->_deskCamEnabled;
}

- (BOOL)variableFrameRateVideoCaptureEnabled
{
  return self->_variableFrameRateVideoCaptureEnabled;
}

- (BOOL)highlightRecoveryEnabled
{
  return self->_highlightRecoveryEnabled;
}

- (int)colorSpace
{
  return self->_colorSpace;
}

- (BOOL)reactionEffectsSupported
{
  return self->_reactionEffectsSupported;
}

- (BOOL)sensorHDREnabled
{
  return self->_sensorHDREnabled;
}

- (BOOL)lowLightVideoCaptureEnabled
{
  return self->_lowLightVideoCaptureEnabled;
}

- (BOOL)applyMaxExposureDurationFrameworkOverrideWhenAvailable
{
  return self->_applyMaxExposureDurationFrameworkOverrideWhenAvailable;
}

- (BOOL)gazeSelectionEnabled
{
  return self->_gazeSelectionEnabled;
}

- (BOOL)nonDestructiveCropEnabled
{
  return self->_nonDestructiveCropEnabled;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxExposureDurationClientOverride
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- (BOOL)isCinematicFramingSupported
{
  return self->_cinematicFramingSupported;
}

- (int)faceDrivenAEAFMode
{
  return self->_faceDrivenAEAFMode;
}

- (BOOL)faceDrivenAEAFEnabledByDefault
{
  return self->_faceDrivenAEAFEnabledByDefault;
}

- (float)depthDataMaxFrameRate
{
  return self->_depthDataMaxFrameRate;
}

- (float)videoZoomRampAcceleration
{
  return self->_videoZoomRampAcceleration;
}

- (float)manualFramingPanningAngleY
{
  return self->_manualFramingPanningAngleY;
}

- (float)manualFramingPanningAngleX
{
  return self->_manualFramingPanningAngleX;
}

- (BOOL)isDockedTrackingEnabled
{
  return self->_dockedTrackingEnabled;
}

- (int)cinematicFramingControlMode
{
  return self->_cinematicFramingControlMode;
}

- (NSString)description
{
  FigCaptureSourceVideoFormat *v4;
  void *v5;
  float v6;
  double v7;
  float v8;
  double v9;
  float v10;
  double v11;
  float v12;
  unint64_t v13;
  const char *v14;
  float v15;
  float v16;
  _BOOL4 nonDestructiveCropEnabled;
  double height;
  signed int videoStabilizationStrength;

  if (self && -[FigCaptureSourceConfiguration sourceType](self, "sourceType") == 2)
    return (NSString *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("SRC:%@"), +[FigCaptureSourceConfiguration stringForSourceDeviceType:](FigCaptureSourceConfiguration, "stringForSourceDeviceType:", -[FigCaptureSourceConfiguration sourceDeviceType](self, "sourceDeviceType")));
  v4 = -[FigCaptureSourceConfiguration requiredFormat](self, "requiredFormat");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("SRC:%@ %@ %@/%dx%d"), +[FigCaptureSourceConfiguration stringForSourceDeviceType:](FigCaptureSourceConfiguration, "stringForSourceDeviceType:", -[FigCaptureSourceConfiguration sourceDeviceType](self, "sourceDeviceType")), +[FigCaptureSourceConfiguration stringForSourcePosition:](FigCaptureSourceConfiguration, "stringForSourcePosition:", -[FigCaptureSourceConfiguration sourcePosition](self, "sourcePosition")), BWStringForOSType(-[FigCaptureSourceFormat format](v4, "format")), -[FigCaptureSourceFormat dimensions](v4, "dimensions"), (unint64_t)-[FigCaptureSourceFormat dimensions](v4, "dimensions") >> 32);
  -[FigCaptureSourceConfiguration requiredMinFrameRate](self, "requiredMinFrameRate");
  v7 = v6;
  -[FigCaptureSourceConfiguration requiredMaxFrameRate](self, "requiredMaxFrameRate");
  v9 = v8;
  -[FigCaptureSourceConfiguration maxFrameRateClientOverride](self, "maxFrameRateClientOverride");
  v11 = v10;
  -[FigCaptureSourceConfiguration videoZoomFactor](self, "videoZoomFactor");
  objc_msgSend(v5, "appendFormat:", CFSTR(", %.0f-%.0f(max:%.0f), Z:%.2f, ICM:%d"), *(_QWORD *)&v7, *(_QWORD *)&v9, *(_QWORD *)&v11, v12, -[FigCaptureSourceConfiguration imageControlMode](self, "imageControlMode"));
  if (-[NSArray count](-[FigCaptureSourceConfiguration fallbackPrimaryConstituentDeviceTypes](self, "fallbackPrimaryConstituentDeviceTypes"), "count"))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR(", FallbackDeviceTypes:"));
    if (-[NSArray count](-[FigCaptureSourceConfiguration fallbackPrimaryConstituentDeviceTypes](self, "fallbackPrimaryConstituentDeviceTypes"), "count"))
    {
      v13 = 0;
      do
      {
        if (v13)
          v14 = ", ";
        else
          v14 = " ";
        objc_msgSend(v5, "appendFormat:", CFSTR("%s%d"), v14, objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[FigCaptureSourceConfiguration fallbackPrimaryConstituentDeviceTypes](self, "fallbackPrimaryConstituentDeviceTypes"), "objectAtIndexedSubscript:", v13++), "intValue"));
      }
      while (-[NSArray count](-[FigCaptureSourceConfiguration fallbackPrimaryConstituentDeviceTypes](self, "fallbackPrimaryConstituentDeviceTypes"), "count") > v13);
    }
  }
  -[FigCaptureSourceConfiguration maxGainClientOverride](self, "maxGainClientOverride");
  if (v15 > 0.0)
  {
    -[FigCaptureSourceConfiguration maxGainClientOverride](self, "maxGainClientOverride");
    objc_msgSend(v5, "appendFormat:", CFSTR(", MaxGain: %.0f"), v16);
  }
  if (self->_faceDetectionConfiguration)
    objc_msgSend(v5, "appendFormat:", CFSTR(", (FD E:%d B:%d S:%d)"), objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[FigCaptureSourceConfiguration faceDetectionConfiguration](self, "faceDetectionConfiguration"), "objectForKeyedSubscript:", CFSTR("EyeDetectionEnabled")), "BOOLValue"), objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[FigCaptureSourceConfiguration faceDetectionConfiguration](self, "faceDetectionConfiguration"), "objectForKeyedSubscript:", CFSTR("BlinkDetectionEnabled")), "BOOLValue"), objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[FigCaptureSourceConfiguration faceDetectionConfiguration](self, "faceDetectionConfiguration"), "objectForKeyedSubscript:",
                        CFSTR("SmileDetectionEnabled")),
                      "BOOLValue"));
  if (self->_sensorHDREnabled)
    objc_msgSend(v5, "appendString:", CFSTR(", QHDR/SHDR:1"));
  if (self->_highlightRecoveryEnabled)
    objc_msgSend(v5, "appendString:", CFSTR(", HR:1"));
  if (self->_colorSpace)
    objc_msgSend(v5, "appendFormat:", CFSTR(", ColorSpace:%d"), self->_colorSpace);
  if (self->_depthDataDeliveryEnabled)
    objc_msgSend(v5, "appendFormat:", CFSTR(", Depth:1 %@/%dx%d"), BWStringForOSType(-[FigCaptureSourceFormat format](self->_depthDataFormat, "format")), -[FigCaptureSourceFormat dimensions](self->_depthDataFormat, "dimensions"), (unint64_t)-[FigCaptureSourceFormat dimensions](self->_depthDataFormat, "dimensions") >> 32);
  if (self->_lowLightVideoCaptureEnabled)
    objc_msgSend(v5, "appendString:", CFSTR(", LowLight:1"));
  nonDestructiveCropEnabled = self->_nonDestructiveCropEnabled;
  if (!self->_spatialOverCaptureEnabled)
  {
    if (!self->_nonDestructiveCropEnabled)
      goto LABEL_29;
    nonDestructiveCropEnabled = 1;
  }
  objc_msgSend(v5, "appendFormat:", CFSTR(", SpatialOverCapture:%d, NonDestructiveCropEnabled:%d"), self->_spatialOverCaptureEnabled, nonDestructiveCropEnabled);
LABEL_29:
  height = self->_normalizedNonDestructiveCropSize.height;
  if (self->_normalizedNonDestructiveCropSize.width > 0.0 || height > 0.0)
    objc_msgSend(v5, "appendFormat:", CFSTR(", NormalizedNonDestructiveCropSize:%fx%f"), *(_QWORD *)&self->_normalizedNonDestructiveCropSize.width, *(_QWORD *)&height);
  if (self->_geometricDistortionCorrectionEnabled)
    objc_msgSend(v5, "appendString:", CFSTR(", GDC:1"));
  if (self->_variableFrameRateVideoCaptureEnabled)
    objc_msgSend(v5, "appendString:", CFSTR(", VFR:1"));
  videoStabilizationStrength = self->_videoStabilizationStrength;
  if (videoStabilizationStrength >= 2)
    objc_msgSend(v5, "appendFormat:", CFSTR(", StabilizationStrength:%@"), FigCaptureVideoStabilizationStrengthToString(videoStabilizationStrength));
  if (self->_cinematicFramingEnabled)
    objc_msgSend(v5, "appendFormat:", CFSTR(", CinematicFraming:1(CtrlMode:%d)"), self->_cinematicFramingControlMode);
  if (self->_backgroundBlurEnabled)
    objc_msgSend(v5, "appendString:", CFSTR(", BackgroundBlur:1"));
  if (self->_deskCamEnabled)
    objc_msgSend(v5, "appendString:", CFSTR(", DeskCam:1"));
  if (self->_studioLightingEnabled)
    objc_msgSend(v5, "appendString:", CFSTR(", studioLighting:1"));
  if (self->_reactionEffectsEnabled)
    objc_msgSend(v5, "appendString:", CFSTR(", reactionEffects:1"));
  if (self->_backgroundReplacementEnabled)
    objc_msgSend(v5, "appendString:", CFSTR(", backgroundReplacement:1"));
  if (self->_manualCinematicFramingEnabled)
  {
    objc_msgSend(v5, "appendString:", CFSTR(", MF:1"));
    objc_msgSend(v5, "appendFormat:", CFSTR(", PAngles x:%f,y:%f, DZF:%.3f"), self->_manualFramingPanningAngleX, self->_manualFramingPanningAngleY, *(_QWORD *)&self->_manualFramingDefaultZoomFactor);
  }
  if (self->_dockedTrackingEnabled)
    objc_msgSend(v5, "appendString:", CFSTR(", DTE:1"));
  if (self->_gazeSelectionEnabled)
    objc_msgSend(v5, "appendFormat:", CFSTR(", GS: %d"), 1);
  objc_msgSend(v5, "appendFormat:", CFSTR(", FaceDrivenAEAFMode:%d"), self->_faceDrivenAEAFMode);
  objc_msgSend(v5, "appendFormat:", CFSTR(", FaceDrivenAEAFEnabledByDefault:%d"), self->_faceDrivenAEAFEnabledByDefault);
  if (self->_clientExpectsCameraMountedInLandscapeOrientation)
    objc_msgSend(v5, "appendFormat:", CFSTR(", cameraMountedInLandscape: YES"));
  return (NSString *)v5;
}

- (NSDictionary)faceDetectionConfiguration
{
  return self->_faceDetectionConfiguration;
}

- (NSArray)fallbackPrimaryConstituentDeviceTypes
{
  return self->_fallbackPrimaryConstituentDeviceTypes;
}

- (int)sourcePosition
{
  return objc_msgSend((id)objc_msgSend((id)-[FigCaptureSourceConfiguration _sourceAttributes]((uint64_t)self), "objectForKeyedSubscript:", CFSTR("Position")), "intValue");
}

+ (id)stringForSourceDeviceType:(int)a3
{
  return (id)BWStringFromCaptureDeviceType(a3);
}

+ (id)stringForSourcePosition:(int)a3
{
  if (a3 > 2)
    return &stru_1E4928818;
  else
    return *(&off_1E4923C40 + a3);
}

- (void)setStudioLightingEnabled:(BOOL)a3
{
  self->_studioLightingEnabled = a3;
}

- (void)setBackgroundBlurEnabled:(BOOL)a3
{
  self->_backgroundBlurEnabled = a3;
}

- (double)manualFramingDefaultZoomFactor
{
  return self->_manualFramingDefaultZoomFactor;
}

- (void)setSensorHDREnabled:(BOOL)a3
{
  self->_sensorHDREnabled = a3;
}

- (void)setMaxGainClientOverride:(float)a3
{
  self->_maxGainClientOverride = a3;
}

- (void)setManualFramingPanningAngleY:(float)a3
{
  self->_manualFramingPanningAngleY = a3;
}

- (void)setManualFramingPanningAngleX:(float)a3
{
  self->_manualFramingPanningAngleX = a3;
}

- (void)setManualFramingDefaultZoomFactor:(double)a3
{
  self->_manualFramingDefaultZoomFactor = a3;
}

- (void)setManualCinematicFramingEnabled:(BOOL)a3
{
  self->_manualCinematicFramingEnabled = a3;
}

- (void)setImageControlMode:(int)a3
{
  self->_imageControlMode = a3;
}

- (void)setDockedTrackingEnabled:(BOOL)a3
{
  self->_dockedTrackingEnabled = a3;
}

- (void)setDeskCamEnabled:(BOOL)a3
{
  self->_deskCamEnabled = a3;
}

- (void)setCinematicFramingEnabled:(BOOL)a3
{
  self->_cinematicFramingEnabled = a3;
}

- (void)setCinematicFramingControlMode:(int)a3
{
  self->_cinematicFramingControlMode = a3;
}

- (NSString)clientAudioClockDeviceUID
{
  return self->_clientAudioClockDeviceUID;
}

- (BOOL)clientOSVersionSupportsDecoupledIO
{
  return self->_clientOSVersionSupportsDecoupledIO;
}

- (void)setClientOSVersionSupportsDecoupledIO:(BOOL)a3
{
  self->_clientOSVersionSupportsDecoupledIO = a3;
}

- (void)setClientAudioClockDeviceUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 248);
}

- (int)sourceDeviceType
{
  return objc_msgSend((id)objc_msgSend((id)-[FigCaptureSourceConfiguration _sourceAttributes]((uint64_t)self), "objectForKeyedSubscript:", CFSTR("DeviceType")), "intValue");
}

- (uint64_t)_sourceAttributes
{
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, const __CFString *, _QWORD, uint64_t);

  if (result)
  {
    v1 = result + 32;
    if (!*(_QWORD *)(result + 32))
    {
      v2 = *(_QWORD *)(result + 16);
      if (v2)
      {
        v3 = *(void (**)(uint64_t, const __CFString *, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                             + 8)
                                                                                 + 48);
        if (v3)
          v3(v2, CFSTR("AttributesDictionary"), *MEMORY[0x1E0C9AE00], v1);
      }
    }
    return *(_QWORD *)v1;
  }
  return result;
}

- (void)setSmartCameraEnabled:(BOOL)a3
{
  self->_smartCameraEnabled = a3;
}

- (FigCaptureSourceConfiguration)initWithXPCEncoding:(id)a3
{
  uint64_t v3;
  FigCaptureSourceConfiguration *v5;
  int int64;
  OpaqueFigCaptureSource *v7;
  const char *string;
  uint64_t v9;
  OpaqueFigCaptureSource *source;
  unsigned int (*v11)(OpaqueFigCaptureSource *, const __CFString *, _QWORD, void **);
  uint64_t v12;
  OpaqueFigCaptureSource *v13;
  void (*v14)(OpaqueFigCaptureSource *, const __CFString *, uint64_t, id *);
  id v15;
  const char *v16;
  void *FormatByUniqueID;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  void *v24;
  xpc_object_t value;
  size_t v26;
  float v27;
  const char *v28;
  void *v29;
  float v30;
  double v31;
  double v32;
  float v33;
  float v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  objc_super v39;

  if (!a3)
  {

    return 0;
  }
  v39.receiver = self;
  v39.super_class = (Class)FigCaptureSourceConfiguration;
  v5 = -[FigCaptureSourceConfiguration init](&v39, sel_init);
  if (!v5)
    return v5;
  FigXPCMessageCopyCFString();
  v5->_sourceType = xpc_dictionary_get_int64(a3, "sourceType");
  int64 = xpc_dictionary_get_int64(a3, "sourceToken");
  if (int64)
  {
    v7 = (OpaqueFigCaptureSource *)FigCaptureSourceServerCopySourceForToken(int64);
    v5->_source = v7;
    if (!v7)
    {
      fig_log_get_emitter();
      v36 = v3;
      LODWORD(v35) = 0;
      FigDebugAssert3();
    }
  }
  if (!v5->_source && (v5->_sourceType - 1) <= 1)
  {
LABEL_20:

    return 0;
  }
  if (-[FigCaptureSourceConfiguration sourceType](v5, "sourceType", v35, v36) == 1)
  {
    string = xpc_dictionary_get_string(a3, "requiredFormatUniqueID");
    if (string)
    {
      v9 = (uint64_t)string;
      v38 = 0;
      source = v5->_source;
      v11 = *(unsigned int (**)(OpaqueFigCaptureSource *, const __CFString *, _QWORD, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
      if (!v11 || (v12 = *MEMORY[0x1E0C9AE00], v11(source, CFSTR("Formats"), *MEMORY[0x1E0C9AE00], &v38)))
      {
        fig_log_get_emitter();
      }
      else
      {
        v37 = 0;
        v13 = v5->_source;
        v14 = *(void (**)(OpaqueFigCaptureSource *, const __CFString *, uint64_t, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                                 + 48);
        if (v14)
        {
          v14(v13, CFSTR("AttributesDictionary"), v12, &v37);
          v15 = v37;
        }
        else
        {
          v15 = 0;
        }
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("NonLocalizedName"));
        FormatByUniqueID = fcsc_findFormatByUniqueID(v9, v38);
        v5->_requiredFormat = (FigCaptureSourceVideoFormat *)FormatByUniqueID;

        if (FormatByUniqueID)
        {
          v19 = xpc_dictionary_get_double(a3, "requiredMaxFrameRate");
          v5->_requiredMaxFrameRate = v19;
          v20 = xpc_dictionary_get_double(a3, "requiredMinFrameRate");
          v5->_requiredMinFrameRate = v20;
          v21 = xpc_dictionary_get_double(a3, "maxFrameRateClientOverrideKey");
          v5->_maxFrameRateClientOverride = v21;
          v22 = xpc_dictionary_get_double(a3, "maxGainClientOverride");
          v5->_maxGainClientOverride = v22;
          v23 = xpc_dictionary_get_double(a3, "videoZoomFactor");
          v5->_videoZoomFactor = v23;
          v24 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          value = xpc_dictionary_get_value(a3, "fallbackPrimaryConstituentDeviceTypes");
          if (xpc_array_get_count(value))
          {
            v26 = 0;
            do
              objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", xpc_array_get_int64(value, v26++)));
            while (xpc_array_get_count(value) > v26);
          }
          v5->_fallbackPrimaryConstituentDeviceTypes = (NSArray *)objc_msgSend(v24, "copy");
          v27 = xpc_dictionary_get_double(a3, "videoZoomRampAcceleration");
          v5->_videoZoomRampAcceleration = v27;
          v5->_imageControlMode = xpc_dictionary_get_int64(a3, "imageControlMode");
          v5->_applyMaxExposureDurationFrameworkOverrideWhenAvailable = xpc_dictionary_get_BOOL(a3, "applyMaxExposureDurationFrameworkOverrideWhenAvailable");
          FigXPCMessageGetCMTime();
          v5->_sensorHDREnabled = xpc_dictionary_get_BOOL(a3, "sensorHDREnabled");
          v5->_highlightRecoveryEnabled = xpc_dictionary_get_BOOL(a3, "highlightRecoveryEnabled");
          v5->_colorSpace = xpc_dictionary_get_int64(a3, "colorSpace");
          v5->_depthDataDeliveryEnabled = xpc_dictionary_get_BOOL(a3, "depthDataDeliveryEnabled");
          FigXPCMessageCopyCFDictionary();
          v28 = xpc_dictionary_get_string(a3, "depthDataFormatUniqueID");
          if (!v28
            || (v29 = fcsc_findFormatByUniqueID((uint64_t)v28, -[FigCaptureSourceVideoFormat supportedDepthDataFormats](v5->_requiredFormat, "supportedDepthDataFormats")), v5->_depthDataFormat = (FigCaptureSourceDepthDataFormat *)v29, v29))
          {
            v30 = xpc_dictionary_get_double(a3, "depthDataMaxFrameRate");
            v5->_depthDataMaxFrameRate = v30;
            v5->_lowLightVideoCaptureEnabled = xpc_dictionary_get_BOOL(a3, "lowLightVideoCaptureEnabled");
            v5->_spatialOverCaptureEnabled = xpc_dictionary_get_BOOL(a3, "spatialOverCaptureEnabled");
            v5->_nonDestructiveCropEnabled = xpc_dictionary_get_BOOL(a3, "nonDestructiveCropEnabled");
            v31 = xpc_dictionary_get_double(a3, "normalizedNonDestructiveCropSizeWidth");
            v32 = xpc_dictionary_get_double(a3, "normalizedNonDestructiveCropSizeHeight");
            if (v31 > 0.0 && v32 > 0.0)
            {
              v5->_normalizedNonDestructiveCropSize.width = v31;
              v5->_normalizedNonDestructiveCropSize.height = v32;
            }
            v5->_geometricDistortionCorrectionEnabled = xpc_dictionary_get_BOOL(a3, "geometricDistortionCorrectionEnabled");
            v5->_variableFrameRateVideoCaptureEnabled = xpc_dictionary_get_BOOL(a3, "variableFrameRateVideoCaptureEnabled");
            v5->_videoStabilizationStrength = xpc_dictionary_get_int64(a3, "videoStabilizationStrength");
            v5->_cinematicFramingEnabled = xpc_dictionary_get_BOOL(a3, "cinematicFramingEnabled");
            v5->_cinematicFramingSupported = xpc_dictionary_get_BOOL(a3, "cinematicFramingSupported");
            v5->_cinematicFramingControlMode = xpc_dictionary_get_int64(a3, "cinematicFramingControlMode");
            v5->_backgroundBlurSupported = xpc_dictionary_get_BOOL(a3, "backgroundBlurSupported");
            v5->_backgroundBlurEnabled = xpc_dictionary_get_BOOL(a3, "backgroundBlurEnabled");
            v5->_studioLightingSupported = xpc_dictionary_get_BOOL(a3, "studioLightingSupported");
            v5->_studioLightingEnabled = xpc_dictionary_get_BOOL(a3, "studioLightingEnabled");
            v5->_reactionEffectsSupported = xpc_dictionary_get_BOOL(a3, "reactionEffectsSupported");
            v5->_reactionEffectsEnabled = xpc_dictionary_get_BOOL(a3, "reactionEffectsEnabled");
            v5->_backgroundReplacementSupported = xpc_dictionary_get_BOOL(a3, "backgroundReplacementSupported");
            v5->_backgroundReplacementEnabled = xpc_dictionary_get_BOOL(a3, "backgroundReplacementEnabled");
            v5->_faceDrivenAEAFMode = xpc_dictionary_get_int64(a3, "faceDrivenAEAFMode");
            v5->_faceDrivenAEAFEnabledByDefault = xpc_dictionary_get_BOOL(a3, "faceDrivenAEAFEnabledByDefault");
            v5->_deskCamEnabled = xpc_dictionary_get_BOOL(a3, "deskCamEnabled");
            v5->_manualCinematicFramingEnabled = xpc_dictionary_get_BOOL(a3, "manualFramingEnabled");
            v33 = xpc_dictionary_get_double(a3, "manualFramingPanningAngleX");
            v5->_manualFramingPanningAngleX = v33;
            v34 = xpc_dictionary_get_double(a3, "manualFramingPanningAngleY");
            v5->_manualFramingPanningAngleY = v34;
            v5->_manualFramingDefaultZoomFactor = xpc_dictionary_get_double(a3, "manualFramingDefaultZoomFactor");
            v5->_gazeSelectionEnabled = xpc_dictionary_get_BOOL(a3, "gazeSelectionEnabled");
            v5->_dockedTrackingEnabled = xpc_dictionary_get_BOOL(a3, "dockedTrackingEnabled");
            v5->_clientExpectsCameraMountedInLandscapeOrientation = xpc_dictionary_get_BOOL(a3, "clientExpectsCameraMountedInLandscapeOrientation");
            return v5;
          }
        }
        fig_log_get_emitter();
      }
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    goto LABEL_20;
  }
  if (-[FigCaptureSourceConfiguration sourceType](v5, "sourceType") == 2)
  {
    v5->_clientOSVersionSupportsDecoupledIO = xpc_dictionary_get_BOOL(a3, "clientOSVersionSupportsDecoupledIO");
    v16 = xpc_dictionary_get_string(a3, "clientAudioClockDeviceUID");
    if (v16)
      v5->_clientAudioClockDeviceUID = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v16);
  }
  return v5;
}

- (BOOL)smartCameraEnabled
{
  return self->_smartCameraEnabled;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  int v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  xpc_object_t v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  xpc_object_t v16;
  float v17;
  FigCaptureSourceDepthDataFormat *v18;
  float v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float v24;
  float v25;
  double v26;
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = xpc_dictionary_create(0, 0, 0);
  -[FigCaptureSourceConfiguration sourceID](self, "sourceID");
  FigXPCMessageSetCFString();
  v4 = -[FigCaptureSourceConfiguration _sourceToken]((uint64_t)self);
  xpc_dictionary_set_int64(v3, "sourceToken", v4);
  xpc_dictionary_set_int64(v3, "sourceType", -[FigCaptureSourceConfiguration sourceType](self, "sourceType"));
  if (self)
  {
    if (-[FigCaptureSourceConfiguration sourceType](self, "sourceType") == 1)
    {
      xpc_dictionary_set_string(v3, "requiredFormatUniqueID", -[NSString UTF8String](-[FigCaptureSourceFormat uniqueID](-[FigCaptureSourceConfiguration requiredFormat](self, "requiredFormat"), "uniqueID"), "UTF8String"));
      -[FigCaptureSourceConfiguration requiredMaxFrameRate](self, "requiredMaxFrameRate");
      xpc_dictionary_set_double(v3, "requiredMaxFrameRate", v5);
      -[FigCaptureSourceConfiguration requiredMinFrameRate](self, "requiredMinFrameRate");
      xpc_dictionary_set_double(v3, "requiredMinFrameRate", v6);
      -[FigCaptureSourceConfiguration maxFrameRateClientOverride](self, "maxFrameRateClientOverride");
      xpc_dictionary_set_double(v3, "maxFrameRateClientOverrideKey", v7);
      -[FigCaptureSourceConfiguration maxGainClientOverride](self, "maxGainClientOverride");
      xpc_dictionary_set_double(v3, "maxGainClientOverride", v8);
      -[FigCaptureSourceConfiguration videoZoomFactor](self, "videoZoomFactor");
      xpc_dictionary_set_double(v3, "videoZoomFactor", v9);
      v10 = xpc_array_create(0, 0);
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v11 = -[FigCaptureSourceConfiguration fallbackPrimaryConstituentDeviceTypes](self, "fallbackPrimaryConstituentDeviceTypes");
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v30 != v14)
              objc_enumerationMutation(v11);
            v16 = xpc_int64_create((int)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "intValue"));
            xpc_array_append_value(v10, v16);
            xpc_release(v16);
          }
          v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v13);
      }
      xpc_dictionary_set_value(v3, "fallbackPrimaryConstituentDeviceTypes", v10);
      xpc_release(v10);
      -[FigCaptureSourceConfiguration videoZoomRampAcceleration](self, "videoZoomRampAcceleration");
      xpc_dictionary_set_double(v3, "videoZoomRampAcceleration", v17);
      xpc_dictionary_set_int64(v3, "imageControlMode", -[FigCaptureSourceConfiguration imageControlMode](self, "imageControlMode"));
      xpc_dictionary_set_BOOL(v3, "applyMaxExposureDurationFrameworkOverrideWhenAvailable", -[FigCaptureSourceConfiguration applyMaxExposureDurationFrameworkOverrideWhenAvailable](self, "applyMaxExposureDurationFrameworkOverrideWhenAvailable"));
      -[FigCaptureSourceConfiguration maxExposureDurationClientOverride](self, "maxExposureDurationClientOverride");
      if ((v28 & 1) != 0)
      {
        -[FigCaptureSourceConfiguration maxExposureDurationClientOverride](self, "maxExposureDurationClientOverride");
        FigXPCMessageSetCMTime();
      }
      xpc_dictionary_set_BOOL(v3, "sensorHDREnabled", -[FigCaptureSourceConfiguration sensorHDREnabled](self, "sensorHDREnabled"));
      xpc_dictionary_set_BOOL(v3, "highlightRecoveryEnabled", -[FigCaptureSourceConfiguration highlightRecoveryEnabled](self, "highlightRecoveryEnabled"));
      xpc_dictionary_set_int64(v3, "colorSpace", -[FigCaptureSourceConfiguration colorSpace](self, "colorSpace"));
      xpc_dictionary_set_BOOL(v3, "depthDataDeliveryEnabled", -[FigCaptureSourceConfiguration depthDataDeliveryEnabled](self, "depthDataDeliveryEnabled"));
      FigXPCMessageSetCFDictionary();
      v18 = -[FigCaptureSourceConfiguration depthDataFormat](self, "depthDataFormat");
      if (v18)
        xpc_dictionary_set_string(v3, "depthDataFormatUniqueID", -[NSString UTF8String](-[FigCaptureSourceFormat uniqueID](v18, "uniqueID"), "UTF8String"));
      -[FigCaptureSourceConfiguration depthDataMaxFrameRate](self, "depthDataMaxFrameRate");
      xpc_dictionary_set_double(v3, "depthDataMaxFrameRate", v19);
      if (-[FigCaptureSourceConfiguration lowLightVideoCaptureEnabled](self, "lowLightVideoCaptureEnabled"))
        xpc_dictionary_set_BOOL(v3, "lowLightVideoCaptureEnabled", -[FigCaptureSourceConfiguration lowLightVideoCaptureEnabled](self, "lowLightVideoCaptureEnabled"));
      if (-[FigCaptureSourceConfiguration spatialOverCaptureEnabled](self, "spatialOverCaptureEnabled"))
        xpc_dictionary_set_BOOL(v3, "spatialOverCaptureEnabled", -[FigCaptureSourceConfiguration spatialOverCaptureEnabled](self, "spatialOverCaptureEnabled"));
      if (-[FigCaptureSourceConfiguration nonDestructiveCropEnabled](self, "nonDestructiveCropEnabled"))
        xpc_dictionary_set_BOOL(v3, "nonDestructiveCropEnabled", -[FigCaptureSourceConfiguration nonDestructiveCropEnabled](self, "nonDestructiveCropEnabled"));
      -[FigCaptureSourceConfiguration normalizedNonDestructiveCropSize](self, "normalizedNonDestructiveCropSize");
      if (v20 > 0.0
        || (-[FigCaptureSourceConfiguration normalizedNonDestructiveCropSize](self, "normalizedNonDestructiveCropSize"),
            v21 > 0.0))
      {
        -[FigCaptureSourceConfiguration normalizedNonDestructiveCropSize](self, "normalizedNonDestructiveCropSize");
        xpc_dictionary_set_double(v3, "normalizedNonDestructiveCropSizeWidth", v22);
        -[FigCaptureSourceConfiguration normalizedNonDestructiveCropSize](self, "normalizedNonDestructiveCropSize");
        xpc_dictionary_set_double(v3, "normalizedNonDestructiveCropSizeHeight", v23);
      }
      if (-[FigCaptureSourceConfiguration geometricDistortionCorrectionEnabled](self, "geometricDistortionCorrectionEnabled"))
      {
        xpc_dictionary_set_BOOL(v3, "geometricDistortionCorrectionEnabled", -[FigCaptureSourceConfiguration geometricDistortionCorrectionEnabled](self, "geometricDistortionCorrectionEnabled"));
      }
      if (-[FigCaptureSourceConfiguration variableFrameRateVideoCaptureEnabled](self, "variableFrameRateVideoCaptureEnabled"))
      {
        xpc_dictionary_set_BOOL(v3, "variableFrameRateVideoCaptureEnabled", -[FigCaptureSourceConfiguration variableFrameRateVideoCaptureEnabled](self, "variableFrameRateVideoCaptureEnabled"));
      }
      if (-[FigCaptureSourceConfiguration videoStabilizationStrength](self, "videoStabilizationStrength"))
        xpc_dictionary_set_int64(v3, "videoStabilizationStrength", -[FigCaptureSourceConfiguration videoStabilizationStrength](self, "videoStabilizationStrength"));
      xpc_dictionary_set_BOOL(v3, "cinematicFramingSupported", -[FigCaptureSourceConfiguration isCinematicFramingSupported](self, "isCinematicFramingSupported"));
      if (-[FigCaptureSourceConfiguration cinematicFramingEnabled](self, "cinematicFramingEnabled"))
      {
        xpc_dictionary_set_BOOL(v3, "cinematicFramingEnabled", -[FigCaptureSourceConfiguration cinematicFramingEnabled](self, "cinematicFramingEnabled"));
        xpc_dictionary_set_int64(v3, "cinematicFramingControlMode", -[FigCaptureSourceConfiguration cinematicFramingControlMode](self, "cinematicFramingControlMode"));
      }
      xpc_dictionary_set_BOOL(v3, "backgroundBlurSupported", -[FigCaptureSourceConfiguration isBackgroundBlurSupported](self, "isBackgroundBlurSupported"));
      xpc_dictionary_set_BOOL(v3, "backgroundBlurEnabled", -[FigCaptureSourceConfiguration backgroundBlurEnabled](self, "backgroundBlurEnabled"));
      xpc_dictionary_set_BOOL(v3, "studioLightingSupported", -[FigCaptureSourceConfiguration isStudioLightingSupported](self, "isStudioLightingSupported"));
      xpc_dictionary_set_BOOL(v3, "studioLightingEnabled", -[FigCaptureSourceConfiguration studioLightingEnabled](self, "studioLightingEnabled"));
      xpc_dictionary_set_BOOL(v3, "reactionEffectsSupported", -[FigCaptureSourceConfiguration reactionEffectsSupported](self, "reactionEffectsSupported"));
      xpc_dictionary_set_BOOL(v3, "reactionEffectsEnabled", -[FigCaptureSourceConfiguration reactionEffectsEnabled](self, "reactionEffectsEnabled"));
      xpc_dictionary_set_BOOL(v3, "backgroundReplacementSupported", -[FigCaptureSourceConfiguration isBackgroundReplacementSupported](self, "isBackgroundReplacementSupported"));
      xpc_dictionary_set_BOOL(v3, "backgroundReplacementEnabled", -[FigCaptureSourceConfiguration backgroundReplacementEnabled](self, "backgroundReplacementEnabled"));
      xpc_dictionary_set_int64(v3, "faceDrivenAEAFMode", -[FigCaptureSourceConfiguration faceDrivenAEAFMode](self, "faceDrivenAEAFMode"));
      xpc_dictionary_set_BOOL(v3, "faceDrivenAEAFEnabledByDefault", -[FigCaptureSourceConfiguration faceDrivenAEAFEnabledByDefault](self, "faceDrivenAEAFEnabledByDefault"));
      xpc_dictionary_set_BOOL(v3, "deskCamEnabled", -[FigCaptureSourceConfiguration deskCamEnabled](self, "deskCamEnabled"));
      if (-[FigCaptureSourceConfiguration manualCinematicFramingEnabled](self, "manualCinematicFramingEnabled"))
        xpc_dictionary_set_BOOL(v3, "manualFramingEnabled", -[FigCaptureSourceConfiguration manualCinematicFramingEnabled](self, "manualCinematicFramingEnabled"));
      -[FigCaptureSourceConfiguration manualFramingPanningAngleX](self, "manualFramingPanningAngleX");
      xpc_dictionary_set_double(v3, "manualFramingPanningAngleX", v24);
      -[FigCaptureSourceConfiguration manualFramingPanningAngleY](self, "manualFramingPanningAngleY");
      xpc_dictionary_set_double(v3, "manualFramingPanningAngleY", v25);
      -[FigCaptureSourceConfiguration manualFramingDefaultZoomFactor](self, "manualFramingDefaultZoomFactor");
      xpc_dictionary_set_double(v3, "manualFramingDefaultZoomFactor", v26);
      if (-[FigCaptureSourceConfiguration gazeSelectionEnabled](self, "gazeSelectionEnabled"))
        xpc_dictionary_set_BOOL(v3, "gazeSelectionEnabled", -[FigCaptureSourceConfiguration gazeSelectionEnabled](self, "gazeSelectionEnabled"));
      if (-[FigCaptureSourceConfiguration isDockedTrackingEnabled](self, "isDockedTrackingEnabled"))
        xpc_dictionary_set_BOOL(v3, "dockedTrackingEnabled", -[FigCaptureSourceConfiguration isDockedTrackingEnabled](self, "isDockedTrackingEnabled"));
      xpc_dictionary_set_BOOL(v3, "clientExpectsCameraMountedInLandscapeOrientation", -[FigCaptureSourceConfiguration clientExpectsCameraMountedInLandscapeOrientation](self, "clientExpectsCameraMountedInLandscapeOrientation"));
    }
    else if (-[FigCaptureSourceConfiguration sourceType](self, "sourceType") == 2)
    {
      xpc_dictionary_set_BOOL(v3, "clientOSVersionSupportsDecoupledIO", -[FigCaptureSourceConfiguration clientOSVersionSupportsDecoupledIO](self, "clientOSVersionSupportsDecoupledIO"));
      if (-[FigCaptureSourceConfiguration clientAudioClockDeviceUID](self, "clientAudioClockDeviceUID"))
        xpc_dictionary_set_string(v3, "clientAudioClockDeviceUID", -[NSString UTF8String](-[FigCaptureSourceConfiguration clientAudioClockDeviceUID](self, "clientAudioClockDeviceUID"), "UTF8String"));
    }
  }
  return v3;
}

- (void)setHasSetVideoZoomFactorOnCaptureSource:(BOOL)a3
{
  self->_hasSetVideoZoomFactorOnCaptureSource = a3;
}

- (BOOL)hasSetVideoZoomFactorOnCaptureSource
{
  return self->_hasSetVideoZoomFactorOnCaptureSource;
}

- (void)dealloc
{
  OpaqueFigCaptureSource *source;
  objc_super v4;

  source = self->_source;
  if (source)
    CFRelease(source);

  v4.receiver = self;
  v4.super_class = (Class)FigCaptureSourceConfiguration;
  -[FigCaptureSourceConfiguration dealloc](&v4, sel_dealloc);
}

- (uint64_t)_sourceToken
{
  uint64_t v1;
  void (*v2)(uint64_t, const __CFString *, _QWORD, id *);
  id v3;
  uint64_t v4;
  id v6;

  if (!a1)
    return 0;
  v6 = 0;
  v1 = *(_QWORD *)(a1 + 16);
  if (v1
    && (v2 = *(void (**)(uint64_t, const __CFString *, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                              + 48)) != 0)
  {
    v2(v1, CFSTR("SourceToken"), *MEMORY[0x1E0C9AE00], &v6);
    v3 = v6;
  }
  else
  {
    v3 = 0;
  }
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)bravoShiftMitigationEnabled
{
  OpaqueFigCaptureSource *v3;
  void (*v4)(OpaqueFigCaptureSource *, const __CFString *, _QWORD, id *);
  id v5;
  unsigned int v6;
  unsigned int v7;
  BOOL v8;
  float v9;
  int v10;
  float v11;
  id v13;

  v13 = 0;
  v3 = -[FigCaptureSourceConfiguration source](self, "source");
  v4 = *(void (**)(OpaqueFigCaptureSource *, const __CFString *, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                         + 48);
  if (v4)
  {
    v4(v3, CFSTR("AttributesDictionary"), *MEMORY[0x1E0C9AE00], &v13);
    v5 = v13;
  }
  else
  {
    v5 = 0;
  }
  v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DeviceType")), "intValue");
  v7 = (v6 > 9) | (0xEFu >> v6);

  v8 = -[FigCaptureSourceConfiguration spatialOverCaptureEnabled](self, "spatialOverCaptureEnabled");
  -[FigCaptureSourceVideoFormat maxContinuousZoomFactorForDepthDataDelivery](-[FigCaptureSourceConfiguration requiredFormat](self, "requiredFormat"), "maxContinuousZoomFactorForDepthDataDelivery");
  LOBYTE(v10) = v7 ^ 1;
  if ((v7 & 1) == 0 && !v8)
  {
    v11 = v9;
    v10 = !-[FigCaptureSourceConfiguration depthDataDeliveryEnabled](self, "depthDataDeliveryEnabled");
    if (v11 != 0.0)
      LOBYTE(v10) = 1;
  }
  return v10 & 1;
}

- (FigCaptureSourceConfiguration)initWithSource:(OpaqueFigCaptureSource *)a3
{
  FigCaptureSourceConfiguration *v4;
  OpaqueFigCaptureSource *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FigCaptureSourceConfiguration;
  v4 = -[FigCaptureSourceConfiguration init](&v7, sel_init);
  if (v4)
  {
    if (a3)
      v5 = (OpaqueFigCaptureSource *)CFRetain(a3);
    else
      v5 = 0;
    v4->_source = v5;
  }
  return v4;
}

- (FigCaptureSourceConfiguration)initWithSourceType:(int)a3
{
  FigCaptureSourceConfiguration *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FigCaptureSourceConfiguration;
  result = -[FigCaptureSourceConfiguration init](&v5, sel_init);
  if (result)
    result->_sourceType = a3;
  return result;
}

+ (id)stringForSourceType:(int)a3
{
  return (id)FigCaptureSourceTypeNameMap[a3];
}

+ (int)sourceTypeForString:(id)a3
{
  uint64_t v4;

  v4 = 1;
  while (objc_msgSend(a3, "caseInsensitiveCompare:", FigCaptureSourceTypeNameMap[v4]))
  {
    if (++v4 == 6)
    {
      LODWORD(v4) = 0;
      return v4;
    }
  }
  return v4;
}

- (BOOL)isBackgroundReplacementSupported
{
  return self->_backgroundReplacementSupported;
}

- (void)setBackgroundReplacementSupported:(BOOL)a3
{
  self->_backgroundReplacementSupported = a3;
}

- (BOOL)backgroundReplacementEnabled
{
  return self->_backgroundReplacementEnabled;
}

- (void)setBackgroundReplacementEnabled:(BOOL)a3
{
  self->_backgroundReplacementEnabled = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)deskCamOutputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_deskCamOutputDimensions;
}

- (void)setDeskCamOutputDimensions:(id)a3
{
  self->_deskCamOutputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

@end
