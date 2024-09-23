@implementation AVCaptureInputPort

- (void)_updateStudioLightingUnavailableReasonsWithDevice:(id)a3 deviceInput:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isStudioLightActive") & 1) != 0)
  {
LABEL_2:
    v6 = 0;
    goto LABEL_3;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = (void *)objc_msgSend(a3, "formats", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    v6 = 1;
LABEL_9:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v11)
        objc_enumerationMutation(v8);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12), "isStudioLightSupported") & 1) != 0)
        goto LABEL_2;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v10)
          goto LABEL_9;
        goto LABEL_3;
      }
    }
  }
  v6 = 1;
LABEL_3:
  if (objc_msgSend(a4, "isStudioLightingAllowed"))
    v7 = v6;
  else
    v7 = v6 | 4;
  +[AVCaptureDevice setControlCenterVideoEffectUnavailableReasonsForVideoEffect:reasons:](AVCaptureDevice, "setControlCenterVideoEffectUnavailableReasonsForVideoEffect:reasons:", CFSTR("AVControlCenterVideoEffectStudioLighting"), v7);
}

- (void)_updateBackgroundBlurUnavailableReasonsWithDevice:(id)a3 deviceInput:(id)a4
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isBackgroundBlurActive") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = (void *)objc_msgSend(a3, "formats", 0);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      v6 = 1;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "isBackgroundBlurSupported") & 1) != 0)
          {
            if (objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isBackgroundBlurSupported"))
              v6 = 0;
            else
              v6 = 2;
            goto LABEL_16;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v9)
          continue;
        break;
      }
    }
    else
    {
      v6 = 1;
    }
  }
LABEL_16:
  if (objc_msgSend(a4, "isBackgroundBlurAllowed"))
    v12 = v6;
  else
    v12 = v6 | 4;
  +[AVCaptureDevice setControlCenterVideoEffectUnavailableReasonsForVideoEffect:reasons:](AVCaptureDevice, "setControlCenterVideoEffectUnavailableReasonsForVideoEffect:reasons:", CFSTR("AVControlCenterVideoEffectBackgroundBlur"), v12);
}

- (AVCaptureDeviceType)sourceDeviceType
{
  return self->_internal->sourceDeviceType;
}

- (id)figCaptureSourceConfigurationForSessionPreset:(id)a3
{
  char isKindOfClass;
  AVCaptureInputPortInternal *internal;
  AVCaptureInput *input;
  void *v8;
  id v9;
  uint64_t v10;
  AVCaptureInput *v11;
  double v12;
  double v13;
  double v14;
  _BOOL8 v15;
  _BOOL8 v16;
  _BOOL8 v17;
  _BOOL8 v18;
  double v19;
  float v20;
  float v21;
  float v22;
  double v23;
  float v24;
  double v25;
  int v26;
  uint64_t v27;
  _BOOL8 v28;
  _BOOL8 v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  float v35;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  internal = self->_internal;
  input = internal->input;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = self->_internal->input;
      v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D03C18]), "initWithSourceType:", 4);
      objc_msgSend(v9, "setSourceID:", -[AVCaptureInput sourceID](v11, "sourceID"));
      return v9;
    }
    return 0;
  }
  v8 = (void *)-[AVCaptureInput device](internal->input, "device");
  if (!objc_msgSend(v8, "isConnected"))
    return 0;
  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D03C18]), "initWithSource:", objc_msgSend(v8, "figCaptureSource"));
  objc_msgSend(v9, "setSourceID:", self->_internal->sourceID);
  if ((objc_msgSend(v8, "hasMediaType:", *MEMORY[0x1E0CF2B90]) & 1) == 0
    && (objc_msgSend(v8, "hasMediaType:", CFSTR("pcld")) & 1) == 0
    && !objc_msgSend(v8, "hasMediaType:", *MEMORY[0x1E0CF2B80]))
  {
LABEL_89:
    if (objc_msgSend(v8, "hasMediaType:", *MEMORY[0x1E0CF2B70]))
    {
      objc_msgSend(v9, "setDepthDataDeliveryEnabled:", objc_msgSend(v8, "_isDepthDataDeliveryEnabled"));
      objc_msgSend(v9, "setDepthDataFormat:", objc_msgSend((id)objc_msgSend(v8, "activeDepthDataFormat"), "figCaptureSourceDepthDataFormat"));
      v49 = 0;
      v50 = 0;
      v35 = 0.0;
      v51 = 0;
      if (v8)
      {
        objc_msgSend(v8, "activeDepthDataMinFrameDuration");
        if ((BYTE4(v50) & 0x1D) == 1)
          v35 = (float)(int)v50 / (float)v49;
      }
      *(float *)&v34 = v35;
      objc_msgSend(v9, "setDepthDataMaxFrameRate:", v34);
    }
    if (objc_msgSend(v8, "hasMediaType:", *MEMORY[0x1E0CF2B68]))
    {
      objc_msgSend(v9, "setClientOSVersionSupportsDecoupledIO:", AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureMicrophoneUsesDecoupledIO")));
      objc_msgSend(v9, "setClientAudioClockDeviceUID:", objc_msgSend(v8, "clientAudioClockDeviceUID"));
    }
    return v9;
  }
  objc_msgSend(v8, "_setCenterStageAllowed:", -[AVCaptureInput isCenterStageAllowed](input, "isCenterStageAllowed"));
  objc_msgSend(v8, "_setBackgroundBlurAllowed:", -[AVCaptureInput isBackgroundBlurAllowed](input, "isBackgroundBlurAllowed"));
  objc_msgSend(v8, "_setStudioLightingAllowed:", -[AVCaptureInput isStudioLightingAllowed](input, "isStudioLightingAllowed"));
  objc_msgSend(v8, "_setReactionEffectsAllowed:", -[AVCaptureInput reactionEffectsAllowed](input, "reactionEffectsAllowed"));
  objc_msgSend(v8, "_setBackgroundReplacementAllowed:", -[AVCaptureInput isBackgroundReplacementAllowed](input, "isBackgroundReplacementAllowed"));
  objc_msgSend(v9, "setCinematicFramingSupported:", objc_msgSend((id)objc_msgSend(v8, "activeFormat"), "isCenterStageSupported"));
  if (objc_msgSend(v8, "isCenterStageActive")
    && -[AVCaptureInput isCenterStageAllowed](input, "isCenterStageAllowed"))
  {
    objc_msgSend(v9, "setCinematicFramingEnabled:", 1);
    objc_msgSend(v9, "setCinematicFramingControlMode:", +[AVCaptureDevice centerStageControlMode](AVCaptureDevice, "centerStageControlMode"));
    v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "activeFormat"), "figCaptureSourceVideoFormat"), "cinematicFramingFormat");
  }
  else if (objc_msgSend(v8, "isGeometricDistortionCorrectionEnabled")
         && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "activeFormat"), "figCaptureSourceVideoFormat"), "geometricDistortionCorrectionFormat"))
  {
    v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "activeFormat"), "figCaptureSourceVideoFormat"), "geometricDistortionCorrectionFormat");
  }
  else
  {
    v10 = objc_msgSend((id)objc_msgSend(v8, "activeFormat"), "figCaptureSourceVideoFormat");
  }
  objc_msgSend(v9, "setRequiredFormat:", v10);
  -[AVCaptureInputPort _updateCenterStageUnavailableReasonsWithDevice:deviceInput:](self, "_updateCenterStageUnavailableReasonsWithDevice:deviceInput:", v8, input);
  if (objc_msgSend((id)objc_msgSend(v8, "deviceType"), "isEqualToString:", CFSTR("AVCaptureDeviceTypeDeskViewCamera")))
  {
    objc_msgSend(v9, "setDeskCamEnabled:", 1);
    objc_msgSend(v9, "setRequiredFormat:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "activeFormat"), "figCaptureSourceVideoFormat"), "cinematicFramingFormat"));
  }
  if (objc_msgSend(v8, "isManualFramingEnabled"))
  {
    objc_msgSend(v9, "setManualCinematicFramingEnabled:", 1);
    objc_msgSend(v9, "setRequiredFormat:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "activeFormat"), "figCaptureSourceVideoFormat"), "cinematicFramingFormat"));
    objc_msgSend(v8, "manualFramingPanningAngleX");
    objc_msgSend(v9, "setManualFramingPanningAngleX:");
    objc_msgSend(v8, "manualFramingPanningAngleY");
    objc_msgSend(v9, "setManualFramingPanningAngleY:");
    objc_msgSend(v8, "manualFramingDefaultZoomFactor");
    objc_msgSend(v9, "setManualFramingDefaultZoomFactor:");
  }
  if (!objc_msgSend(v9, "requiredFormat"))
    objc_msgSend(v9, "setRequiredFormat:", objc_msgSend((id)objc_msgSend(v8, "activeFormat"), "figCaptureSourceVideoFormat"));
  if (objc_msgSend(v9, "requiredFormat"))
  {
    objc_msgSend(v9, "setGazeSelectionEnabled:", objc_msgSend(v8, "isGazeSelectionEnabled"));
    if (objc_msgSend(v8, "isDockedTrackingEnabled"))
      objc_msgSend(v9, "setDockedTrackingEnabled:", 1);
    v49 = 0;
    v50 = 0;
    v51 = 0;
    if (v8)
    {
      objc_msgSend(v8, "activeVideoMinFrameDuration");
      *(float *)&v13 = (float)(int)v50 / (float)v49;
      objc_msgSend(v9, "setRequiredMaxFrameRate:", v13);
      v46 = 0;
      v47 = 0;
      v48 = 0;
      objc_msgSend(v8, "activeVideoMaxFrameDuration");
    }
    else
    {
      LODWORD(v12) = 2143289344;
      objc_msgSend(v9, "setRequiredMaxFrameRate:", v12);
      v46 = 0;
      v47 = 0;
      v48 = 0;
    }
    *(float *)&v14 = (float)0 / (float)0;
    objc_msgSend(v9, "setRequiredMinFrameRate:", v14);
    if (objc_msgSend((id)objc_msgSend(v8, "activeFormat"), "isBackgroundBlurSupported"))
      v15 = +[AVCaptureDevice isEligibleForBackgroundBlur](AVCaptureDevice, "isEligibleForBackgroundBlur");
    else
      v15 = 0;
    objc_msgSend(v9, "setBackgroundBlurSupported:", v15);
    if (objc_msgSend(v8, "isBackgroundBlurActive")
      && -[AVCaptureInput isBackgroundBlurAllowed](input, "isBackgroundBlurAllowed"))
    {
      objc_msgSend(v9, "setBackgroundBlurEnabled:", objc_msgSend(v8, "isBackgroundBlurActive"));
    }
    -[AVCaptureInputPort _updateBackgroundBlurUnavailableReasonsWithDevice:deviceInput:](self, "_updateBackgroundBlurUnavailableReasonsWithDevice:deviceInput:", v8, input);
    if (objc_msgSend((id)objc_msgSend(v8, "activeFormat"), "isStudioLightSupported"))
      v16 = +[AVCaptureDevice isEligibleForStudioLighting](AVCaptureDevice, "isEligibleForStudioLighting");
    else
      v16 = 0;
    objc_msgSend(v9, "setStudioLightingSupported:", v16);
    if (objc_msgSend(v8, "isStudioLightActive")
      && -[AVCaptureInput isStudioLightingAllowed](input, "isStudioLightingAllowed"))
    {
      objc_msgSend(v9, "setStudioLightingEnabled:", objc_msgSend(v8, "isStudioLightActive"));
    }
    -[AVCaptureInputPort _updateStudioLightingUnavailableReasonsWithDevice:deviceInput:](self, "_updateStudioLightingUnavailableReasonsWithDevice:deviceInput:", v8, input);
    if (objc_msgSend((id)objc_msgSend(v8, "activeFormat"), "reactionEffectsSupported"))
      v17 = +[AVCaptureDevice isEligibleForReactionEffects](AVCaptureDevice, "isEligibleForReactionEffects");
    else
      v17 = 0;
    objc_msgSend(v9, "setReactionEffectsSupported:", v17);
    if (objc_msgSend(v8, "canPerformReactionEffects")
      && -[AVCaptureInput reactionEffectsAllowed](input, "reactionEffectsAllowed"))
    {
      objc_msgSend(v9, "setReactionEffectsEnabled:", objc_msgSend(v8, "canPerformReactionEffects"));
    }
    -[AVCaptureInputPort _updateReactionEffectsUnavailableReasonsWithDevice:deviceInput:](self, "_updateReactionEffectsUnavailableReasonsWithDevice:deviceInput:", v8, input);
    if (objc_msgSend((id)objc_msgSend(v8, "activeFormat"), "isBackgroundReplacementSupported"))
      v18 = +[AVCaptureDevice isEligibleForBackgroundReplacement](AVCaptureDevice, "isEligibleForBackgroundReplacement");
    else
      v18 = 0;
    objc_msgSend(v9, "setBackgroundReplacementSupported:", v18);
    if (objc_msgSend(v8, "isBackgroundReplacementActive")
      && -[AVCaptureInput isBackgroundReplacementAllowed](input, "isBackgroundReplacementAllowed"))
    {
      objc_msgSend(v9, "setBackgroundReplacementEnabled:", objc_msgSend(v8, "isBackgroundReplacementActive"));
    }
    -[AVCaptureInputPort _updateBackgroundReplacementUnavailableReasonsWithDevice:deviceInput:](self, "_updateBackgroundReplacementUnavailableReasonsWithDevice:deviceInput:", v8, input);
    objc_msgSend(v9, "setFaceDrivenAEAFMode:", objc_msgSend(v8, "faceDrivenAEAFMode"));
    objc_msgSend(v9, "setFaceDrivenAEAFEnabledByDefault:", AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureFaceDrivenAEAFOnByDefault")));
    objc_msgSend((id)objc_msgSend(v9, "requiredFormat"), "maxSupportedFrameRate");
    v20 = *(float *)&v19;
    if (input)
    {
      -[AVCaptureInput videoMinFrameDurationOverride](input, "videoMinFrameDurationOverride");
      if ((v44 & 0x100000000) != 0)
      {
        -[AVCaptureInput videoMinFrameDurationOverride](input, "videoMinFrameDurationOverride");
        -[AVCaptureInput videoMinFrameDurationOverride](input, "videoMinFrameDurationOverride");
        v20 = (float)v42 / (float)v41;
        objc_msgSend((id)objc_msgSend(v9, "requiredFormat"), "maxSupportedFrameRate");
        if (v20 > v21)
        {
          objc_msgSend((id)objc_msgSend(v9, "requiredFormat"), "maxSupportedFrameRate");
          v20 = v22;
        }
        objc_msgSend(v9, "requiredMaxFrameRate");
        if (*(float *)&v23 > v20)
        {
          *(float *)&v23 = v20;
          objc_msgSend(v9, "setRequiredMaxFrameRate:", v23);
        }
        objc_msgSend(v9, "requiredMinFrameRate");
        if (*(float *)&v19 > v20)
        {
          *(float *)&v19 = v20;
          objc_msgSend(v9, "setRequiredMinFrameRate:", v19);
        }
      }
    }
    else
    {
      v43 = 0;
      v44 = 0;
      v45 = 0;
    }
    *(float *)&v19 = v20;
    objc_msgSend(v9, "setMaxFrameRateClientOverride:", v19);
    -[AVCaptureInput maxGainOverride](input, "maxGainOverride");
    if (v24 >= 1.0)
      objc_msgSend(v9, "setMaxGainClientOverride:");
    objc_msgSend(v8, "videoZoomRampAcceleration");
    objc_msgSend(v9, "setVideoZoomRampAcceleration:");
    objc_msgSend(v8, "videoZoomFactor");
    *(float *)&v25 = v25;
    objc_msgSend(v9, "setVideoZoomFactor:", v25);
    objc_msgSend(v9, "setFallbackPrimaryConstituentDeviceTypes:", objc_msgSend(v8, "fallbackPrimaryConstituentDevicesAsDeviceTypes"));
    v26 = objc_msgSend(a3, "isEqualToString:", CFSTR("AVCaptureSessionPresetInputPriority"));
    if ((-[AVCaptureInput unifiedAutoExposureDefaultsEnabled](input, "unifiedAutoExposureDefaultsEnabled") & 1) != 0
      || objc_msgSend(v8, "appliesSessionPresetMaxIntegrationTimeOverrideToActiveFormat"))
    {
      v27 = 1;
      if (v8)
      {
LABEL_66:
        objc_msgSend(v8, "activeMaxExposureDurationClientOverride");
LABEL_69:
        v37 = v39;
        v38 = v40;
        objc_msgSend(v9, "setMaxExposureDurationClientOverride:", &v37);
        objc_msgSend(v9, "setApplyMaxExposureDurationFrameworkOverrideWhenAvailable:", v27);
        if (objc_msgSend(v8, "isVideoHDREnabled"))
          v28 = !AVCaptureColorSpaceIsHDR(objc_msgSend(v8, "activeColorSpace"));
        else
          v28 = 0;
        if (objc_msgSend((id)objc_msgSend(v9, "requiredFormat"), "isSIFRSupported"))
        {
          v29 = v28 || AVCaptureColorSpaceIsHDR(objc_msgSend(v8, "activeColorSpace"));
          objc_msgSend(v9, "setHighlightRecoveryEnabled:", v29);
        }
        else
        {
          objc_msgSend(v9, "setSensorHDREnabled:", v28);
        }
        objc_msgSend(v9, "setColorSpace:", objc_msgSend(v8, "activeColorSpace"));
        if ((objc_msgSend(v8, "automaticallyAdjustsImageControlMode") & 1) == 0)
          objc_msgSend(v9, "setImageControlMode:", objc_msgSend(v8, "imageControlMode"));
        v30 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        if (objc_msgSend(v8, "isEyeDetectionSupported"))
        {
          v31 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "eyeDetectionEnabled"));
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0D04A08]);
        }
        if (objc_msgSend(v8, "isEyeClosedDetectionSupported"))
        {
          v32 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "eyeClosedDetectionEnabled"));
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0D04A00]);
        }
        if (objc_msgSend(v8, "isSmileDetectionSupported"))
        {
          v33 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "smileDetectionEnabled"));
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v33, *MEMORY[0x1E0D04A10]);
        }
        if (objc_msgSend(v30, "count"))
          objc_msgSend(v9, "setFaceDetectionConfiguration:", v30);
        objc_msgSend(v9, "setLowLightVideoCaptureEnabled:", objc_msgSend(v8, "isLowLightVideoCaptureEnabled"));
        objc_msgSend(v9, "setSpatialOverCaptureEnabled:", objc_msgSend(v8, "isSpatialOverCaptureEnabled"));
        objc_msgSend(v9, "setNonDestructiveCropEnabled:", objc_msgSend(v8, "isNonDestructiveCropEnabled"));
        objc_msgSend(v8, "normalizedNonDestructiveCropSize");
        objc_msgSend(v9, "setNormalizedNonDestructiveCropSize:");
        objc_msgSend(v9, "setGeometricDistortionCorrectionEnabled:", objc_msgSend(v8, "isGeometricDistortionCorrectionEnabled"));
        objc_msgSend(v9, "setVariableFrameRateVideoCaptureEnabled:", objc_msgSend(v8, "isVariableFrameRateVideoCaptureEnabled"));
        objc_msgSend(v9, "setVideoStabilizationStrength:", objc_msgSend(v8, "videoStabilizationStrength"));
        goto LABEL_89;
      }
    }
    else
    {
      v27 = v26 ^ 1u;
      if (v8)
        goto LABEL_66;
    }
    v39 = 0uLL;
    v40 = 0;
    goto LABEL_69;
  }
  return v9;
}

- (BOOL)isEnabled
{
  return self->_internal->enabled;
}

- (AVMediaType)mediaType
{
  return self->_internal->mediaType;
}

- (AVCaptureInput)input
{
  return self->_internal->input;
}

- (int)changeSeed
{
  return self->_internal->changeSeed;
}

+ (void)initialize
{
  objc_opt_class();
}

- (id)sourceID
{
  return self->_internal->sourceID;
}

- (void)_setFormatDescription:(opaqueCMFormatDescription *)a3
{
  AVCaptureInputPortInternal *internal;
  opaqueCMFormatDescription *formatDescription;

  internal = self->_internal;
  formatDescription = internal->formatDescription;
  if (formatDescription != a3)
  {
    internal->formatDescription = a3;
    if (a3)
      CFRetain(a3);
    if (formatDescription)
      CFRelease(formatDescription);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVCaptureInputPortFormatDescriptionDidChangeNotification"), self);
  }
}

+ (AVCaptureInputPort)portWithInput:(id)a3 mediaType:(id)a4 formatDescription:(opaqueCMFormatDescription *)a5 enabled:(BOOL)a6 sourceDeviceType:(id)a7 sourceDevicePosition:(int64_t)a8
{
  return (AVCaptureInputPort *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:", a3, a4, a5, a6, a7, a8);
}

- (id)_initWithInput:(id)a3 mediaType:(id)a4 formatDescription:(opaqueCMFormatDescription *)a5 enabled:(BOOL)a6 sourceDeviceType:(id)a7 sourceDevicePosition:(int64_t)a8
{
  AVCaptureInputPort *v14;
  AVCaptureInputPortInternal *v15;
  void *v16;
  int IsLaunchPrewarmingEnabled;
  objc_class *v18;
  NSString *v19;
  uint64_t v20;
  opaqueCMFormatDescription *v21;
  id v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)AVCaptureInputPort;
  v14 = -[AVCaptureInputPort init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_alloc_init(AVCaptureInputPortInternal);
    v14->_internal = v15;
    if (v15)
    {
      v15->input = (AVCaptureInput *)a3;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = (void *)objc_msgSend(a3, "device");
        IsLaunchPrewarmingEnabled = AVCaptureSessionIsLaunchPrewarmingEnabled();
        v23 = objc_alloc(MEMORY[0x1E0CB3940]);
        v18 = (objc_class *)objc_opt_class();
        v19 = NSStringFromClass(v18);
        if (IsLaunchPrewarmingEnabled)
          v20 = objc_msgSend(v23, "initWithFormat:", CFSTR("<%@ %@>"), v19, objc_msgSend(v16, "deviceType"));
        else
          v20 = objc_msgSend(v23, "initWithFormat:", CFSTR("<%@ %p>"), v19, v16);
        v14->_internal->sourceID = (NSString *)v20;
        v14->_internal->sourceDeviceType = (NSString *)a7;
        v14->_internal->sourceDevicePosition = a8;
      }
      v14->_internal->mediaType = (NSString *)objc_msgSend(a4, "copy");
      if (a5)
        v21 = (opaqueCMFormatDescription *)CFRetain(a5);
      else
        v21 = 0;
      v14->_internal->formatDescription = v21;
      v14->_internal->enabled = a6;
      -[AVCaptureInputPort _setClock:](v14, "_setClock:", objc_msgSend(a3, "clock"));
    }
    else
    {

      return 0;
    }
  }
  return v14;
}

- (void)_setClock:(OpaqueCMClock *)a3
{
  AVCaptureInputPortInternal *internal;
  AVCaptureInputPortInternal *v6;
  OpaqueCMClock *clock;

  internal = self->_internal;
  objc_sync_enter(internal);
  if (self->_internal->clock != a3)
  {
    -[AVCaptureInputPort willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("clock"));
    v6 = self->_internal;
    clock = v6->clock;
    v6->clock = a3;
    if (a3)
      CFRetain(a3);
    if (clock)
      CFRelease(clock);
    -[AVCaptureInputPort didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("clock"));
  }
  objc_sync_exit(internal);
}

- (BOOL)sourcesFromConstituentDevice
{
  void *v3;
  NSString *v4;
  NSString *v5;
  uint64_t v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (void *)-[AVCaptureInput device](self->_internal->input, "device");
    v4 = -[AVCaptureInputPort mediaType](self, "mediaType");
    if (v4 == (NSString *)*MEMORY[0x1E0CF2B68])
    {
      v6 = objc_msgSend(v3, "position");
      v5 = -[AVCaptureInputPort sourceDevicePosition](self, "sourceDevicePosition");
      goto LABEL_7;
    }
    LODWORD(v5) = objc_msgSend(v3, "isVirtualDevice");
    if ((_DWORD)v5)
    {
      v6 = objc_msgSend(v3, "deviceType");
      v5 = -[AVCaptureInputPort sourceDeviceType](self, "sourceDeviceType");
LABEL_7:
      LOBYTE(v5) = v6 != (_QWORD)v5;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return (char)v5;
}

- (CMFormatDescriptionRef)formatDescription
{
  CMFormatDescriptionRef result;
  CFTypeRef v3;

  result = self->_internal->formatDescription;
  if (result)
  {
    v3 = CFRetain(result);
    return (CMFormatDescriptionRef)CFAutorelease(v3);
  }
  return result;
}

- (AVCaptureDevicePosition)sourceDevicePosition
{
  return self->_internal->sourceDevicePosition;
}

- (void)_updateReactionEffectsUnavailableReasonsWithDevice:(id)a3 deviceInput:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "canPerformReactionEffects") & 1) != 0)
  {
LABEL_2:
    v6 = 0;
    goto LABEL_3;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = (void *)objc_msgSend(a3, "formats", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    v6 = 1;
LABEL_9:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v11)
        objc_enumerationMutation(v8);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12), "reactionEffectsSupported") & 1) != 0)
        goto LABEL_2;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v10)
          goto LABEL_9;
        goto LABEL_3;
      }
    }
  }
  v6 = 1;
LABEL_3:
  if (objc_msgSend(a4, "reactionEffectsAllowed"))
    v7 = v6;
  else
    v7 = v6 | 4;
  +[AVCaptureDevice setControlCenterVideoEffectUnavailableReasonsForVideoEffect:reasons:](AVCaptureDevice, "setControlCenterVideoEffectUnavailableReasonsForVideoEffect:reasons:", CFSTR("AVControlCenterVideoEffectReactions"), v7);
}

- (void)_updateCenterStageUnavailableReasonsWithDevice:(id)a3 deviceInput:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isCenterStageActive") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    if (objc_msgSend(a3, "isGeometricDistortionCorrectionSupported"))
    {
      if (objc_msgSend(a3, "isGeometricDistortionCorrectionEnabled"))
        v7 = 0;
      else
        v7 = 16;
    }
    else
    {
      v7 = 0;
    }
    v15 = 0u;
    v16 = 0u;
    if (objc_msgSend(a3, "_isDepthDataDeliveryEnabled"))
      v8 = v7 | 8;
    else
      v8 = v7;
    v17 = 0uLL;
    v18 = 0uLL;
    v9 = (void *)objc_msgSend(a3, "formats", (_QWORD)v15);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "isCenterStageSupported") & 1) != 0)
          {
            if (objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isCenterStageSupported"))
              v6 = v8;
            else
              v6 = v8 | 2;
            goto LABEL_23;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v11)
          continue;
        break;
      }
    }
    v6 = v8 | 1;
  }
LABEL_23:
  if (objc_msgSend(a4, "isCenterStageAllowed"))
    v14 = v6;
  else
    v14 = v6 | 4;
  +[AVCaptureDevice setControlCenterVideoEffectUnavailableReasonsForVideoEffect:reasons:](AVCaptureDevice, "setControlCenterVideoEffectUnavailableReasonsForVideoEffect:reasons:", CFSTR("AVControlCenterVideoEffectCenterStage"), v14);
}

- (CMClockRef)clock
{
  AVCaptureInputPortInternal *internal;
  OpaqueCMClock *clock;
  CFTypeRef v5;
  OpaqueCMClock *v6;

  internal = self->_internal;
  objc_sync_enter(internal);
  clock = self->_internal->clock;
  if (clock)
  {
    v5 = CFRetain(clock);
    v6 = (OpaqueCMClock *)CFAutorelease(v5);
  }
  else
  {
    v6 = 0;
  }
  objc_sync_exit(internal);
  return v6;
}

- (void)bumpChangeSeed
{
  -[AVCaptureInputPort willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("changeSeed"));
  ++self->_internal->changeSeed;
  -[AVCaptureInputPort didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("changeSeed"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureInputPort;
  -[AVCaptureInputPort dealloc](&v3, sel_dealloc);
}

- (void)setOwner:(id)a3
{
  self->_internal->input = (AVCaptureInput *)a3;
}

- (id)description
{
  AVCaptureInputPort *v2;
  opaqueCMFormatDescription *formatDescription;
  FourCharCode MediaSubType;
  CFArrayRef Identifiers;
  AVCaptureInput *input;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  objc_class *v24;
  NSString *v25;
  objc_class *v26;
  NSString *v27;
  AVCaptureInput *v28;
  uint64_t v29;
  const char *v30;
  const __CFString *v32;
  const __CFString *v33;
  AVCaptureInputPort *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v2 = self;
  v44 = *MEMORY[0x1E0C80C00];
  formatDescription = self->_internal->formatDescription;
  if (formatDescription)
  {
    MediaSubType = CMFormatDescriptionGetMediaSubType(formatDescription);
    if (-[NSString isEqualToString:](v2->_internal->mediaType, "isEqualToString:", *MEMORY[0x1E0CF2B78]))
      Identifiers = CMMetadataFormatDescriptionGetIdentifiers(v2->_internal->formatDescription);
    else
      Identifiers = 0;
  }
  else
  {
    Identifiers = 0;
    MediaSubType = 808464432;
  }
  v38 = bswap32(MediaSubType);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    input = v2->_internal->input;
    v7 = objc_msgSend((id)-[AVCaptureInput device](input, "device"), "deviceType");
    v8 = objc_msgSend((id)-[AVCaptureInput device](input, "device"), "position");
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  v9 = 0x1E0CB3000uLL;
  if (-[AVCaptureInputPort sourceDeviceType](v2, "sourceDeviceType") == (AVCaptureDeviceType)v7)
    v10 = &stru_1E421DB28;
  else
    v10 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@"), AVCaptureDeviceTypeToString(-[AVCaptureInputPort sourceDeviceType](v2, "sourceDeviceType")));
  if (-[AVCaptureInputPort sourceDevicePosition](v2, "sourceDevicePosition") == v8)
  {
    v11 = &stru_1E421DB28;
    if (!Identifiers)
      goto LABEL_38;
  }
  else
  {
    v11 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@"), AVCaptureDevicePositionToString(-[AVCaptureInputPort sourceDevicePosition](v2, "sourceDevicePosition")));
    if (!Identifiers)
      goto LABEL_38;
  }
  if (-[__CFArray count](Identifiers, "count"))
  {
    v12 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR(" ("));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v13 = -[__CFArray countByEnumeratingWithState:objects:count:](Identifiers, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (!v13)
      goto LABEL_39;
    v14 = v13;
    v32 = v11;
    v33 = v10;
    v34 = v2;
    v15 = *(_QWORD *)v40;
    v16 = *MEMORY[0x1E0CF2BC8];
    v17 = *MEMORY[0x1E0CF2BD0];
    v37 = *MEMORY[0x1E0CF2BB8];
    v35 = *MEMORY[0x1E0CF2BD8];
    v36 = *MEMORY[0x1E0CF2BC0];
    while (1)
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v40 != v15)
          objc_enumerationMutation(Identifiers);
        v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v18);
        if (objc_msgSend(v19, "isEqualToString:", v16))
        {
          v20 = v12;
          v21 = CFSTR("face,");
LABEL_32:
          -[__CFString appendString:](v20, "appendString:", v21);
          goto LABEL_33;
        }
        if (objc_msgSend(v19, "isEqualToString:", v17))
        {
          v20 = v12;
          v21 = CFSTR("body,");
          goto LABEL_32;
        }
        if (objc_msgSend(v19, "isEqualToString:", v37))
        {
          v20 = v12;
          v21 = CFSTR("cat,");
          goto LABEL_32;
        }
        if (objc_msgSend(v19, "isEqualToString:", v36))
        {
          v20 = v12;
          v21 = CFSTR("dog,");
          goto LABEL_32;
        }
        if (objc_msgSend(v19, "isEqualToString:", v35))
        {
          v20 = v12;
          v21 = CFSTR("saliency,");
          goto LABEL_32;
        }
        -[__CFString appendFormat:](v12, "appendFormat:", CFSTR("%@,"), v19);
LABEL_33:
        -[__CFString replaceCharactersInRange:withString:](v12, "replaceCharactersInRange:withString:", -[__CFString length](v12, "length") - 1, 1, CFSTR(")"));
        ++v18;
      }
      while (v14 != v18);
      v22 = -[__CFArray countByEnumeratingWithState:objects:count:](Identifiers, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      v14 = v22;
      if (!v22)
      {
        v10 = v33;
        v2 = v34;
        v9 = 0x1E0CB3000;
        v11 = v32;
        goto LABEL_39;
      }
    }
  }
LABEL_38:
  v12 = &stru_1E421DB28;
LABEL_39:
  v23 = *(void **)(v9 + 2368);
  v24 = (objc_class *)objc_opt_class();
  v25 = NSStringFromClass(v24);
  v26 = (objc_class *)objc_opt_class();
  v27 = NSStringFromClass(v26);
  v28 = v2->_internal->input;
  v29 = -[AVCaptureInputPort mediaType](v2, "mediaType");
  if (v2->_internal->enabled)
    v30 = "enabled";
  else
    v30 = "disabled";
  return (id)objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@: %p (%@: %p)%@%@ %@ %.4s%@ %s>"), v25, v2, v27, v28, v10, v11, v29, &v38, v12, v30);
}

- (void)setEnabled:(BOOL)enabled
{
  AVCaptureInputPortInternal *internal;

  internal = self->_internal;
  if (internal->enabled != enabled)
  {
    internal->enabled = enabled;
    -[AVCaptureInputPort bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (void)_updateBackgroundReplacementUnavailableReasonsWithDevice:(id)a3 deviceInput:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isBackgroundReplacementActive") & 1) != 0)
  {
LABEL_2:
    v6 = 0;
    goto LABEL_3;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = (void *)objc_msgSend(a3, "formats", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    v6 = 1;
LABEL_9:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v11)
        objc_enumerationMutation(v8);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12), "isBackgroundReplacementSupported") & 1) != 0)
        goto LABEL_2;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v10)
          goto LABEL_9;
        goto LABEL_3;
      }
    }
  }
  v6 = 1;
LABEL_3:
  if (objc_msgSend(a4, "isBackgroundReplacementAllowed"))
    v7 = v6;
  else
    v7 = v6 | 4;
  +[AVCaptureDevice setControlCenterVideoEffectUnavailableReasonsForVideoEffect:reasons:](AVCaptureDevice, "setControlCenterVideoEffectUnavailableReasonsForVideoEffect:reasons:", CFSTR("AVControlCenterVideoEffectBackgroundReplacement"), v7);
}

- (id)valueForUndefinedKey:(id)a3
{
  objc_super v6;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("clock")))
    return -[AVCaptureInputPort clock](self, "clock");
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureInputPort;
  return -[AVCaptureInputPort valueForUndefinedKey:](&v6, sel_valueForUndefinedKey_, a3);
}

+ (BOOL)automaticallyNotifiesObserversOfClock
{
  return 0;
}

@end
