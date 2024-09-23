@implementation BWNondisruptiveSwitchingFormatSelector

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWNondisruptiveSwitchingFormatSelector;
  -[BWNondisruptiveSwitchingFormatSelector dealloc](&v3, sel_dealloc);
}

- (void)setVideoStabilizationStrength:(int)a3
{
  self->_videoStabilizationStrength = a3;
  -[BWNondisruptiveSwitchingFormatSelector _updateQuadraSubPixelSwitchingParametersWithVideoStabilizationStrength:imageControlMode:stillImageDigitalFlashMode:isStationary:quadraSubPixelSwitchingParametersChangedOut:]((uint64_t)self, a3, 1, 0, 0, 0);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWNondisruptiveSwitchingFormatSelector)initWithPortType:(id)a3 quadraSubPixelSwitchingParameters:(id)a4 baseZoomFactor:(float)a5 zoomFactorToNondisruptiveSwitchingFormatIndexSIFRBinned:(id)a6 zoomFactorToNondisruptiveSwitchingFormatIndexSIFRNonBinned:(id)a7 ultraHighResolutionNondisruptiveStreamingFormatIndex:(int)a8 mainFormatSIFRBinningFactor:(int)a9
{
  BWNondisruptiveSwitchingFormatSelector *v16;
  BWNondisruptiveSwitchingFormatSelector *v17;
  NSDictionary *v18;
  NSArray *v19;
  NSArray *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)BWNondisruptiveSwitchingFormatSelector;
  v16 = -[BWNondisruptiveSwitchingFormatSelector init](&v22, sel_init);
  v17 = v16;
  if (v16)
  {
    if ((unint64_t)a6 | (unint64_t)a7)
    {
      v16->_portType = (NSString *)a3;
      v16->_baseZoomFactor = a5;
      v16->_zoomFactorToNondisruptiveSwitchingFormatIndexSIFRBinned = (NSDictionary *)a6;
      v17->_zoomFactorToNondisruptiveSwitchingFormatIndexSIFRNonBinned = (NSDictionary *)a7;
      v17->_ultraHighResolutionNondisruptiveStreamingFormatIndex = a8;
      v17->_mainFormatSIFRBinningFactor = a9;
      v17->_lastNondisruptiveSwitchingFormatIndex = -1;
      v18 = (NSDictionary *)a4;
      v17->_quadraSubPixelSwitchingParameters = v18;
      if (v18)
      {
        v19 = -[NSDictionary allKeys](v18, "allKeys");
        v17->_quadraSubPixelSceneMonitoringForActionCameraEnabled = -[NSArray count](-[NSArray filteredArrayUsingPredicate:](v19, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self BEGINSWITH %@"), CFSTR("ActionCamera"))), "count") != 0;
        v20 = -[NSDictionary allKeys](v17->_quadraSubPixelSwitchingParameters, "allKeys");
        v17->_quadraSubPixelSceneMonitoringForDigitalFlashEnabled = -[NSArray count](-[NSArray filteredArrayUsingPredicate:](v20, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self BEGINSWITH %@"), CFSTR("DigitalFlash"))), "count") != 0;
        -[NSDictionary objectForKeyedSubscript:](v17->_quadraSubPixelSwitchingParameters, "objectForKeyedSubscript:", CFSTR("Video"));
        v17->_quadraSubPixelSceneMonitoringForVideoEnabled = 0;
        v17->_quadraSubPixelSceneMonitoringForPhotoEnabled = -[NSDictionary objectForKeyedSubscript:](v17->_quadraSubPixelSwitchingParameters, "objectForKeyedSubscript:", CFSTR("Photo")) != 0;
      }
    }
    else
    {
      FigDebugAssert3();

      return 0;
    }
  }
  return v17;
}

- (uint64_t)_updateQuadraSubPixelSwitchingParametersWithVideoStabilizationStrength:(int)a3 imageControlMode:(int)a4 stillImageDigitalFlashMode:(int)a5 isStationary:(char *)a6 quadraSubPixelSwitchingParametersChangedOut:
{
  uint64_t v7;
  __CFString *v8;
  char v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  _BYTE *v19;
  float v20;
  float v21;
  char v22;
  float v23;

  if (result)
  {
    v7 = result;
    if (!*(_QWORD *)(result + 56))
      goto LABEL_37;
    if (a2 == 3)
    {
      v8 = CFSTR("ActionCameraHighStrength");
    }
    else if (a2 == 4)
    {
      v8 = CFSTR("ActionCameraUltraStrength");
    }
    else if (a4 != 1 || a5)
    {
      if (a4 != 2 || a5)
      {
        if (a4 != 1 || a5 != 1)
        {
          v9 = a5;
          if (a4 != 2)
            v9 = 0;
          v10 = CFSTR("Video");
          if (!a3)
            v10 = CFSTR("Photo");
          v8 = (v9 & 1) != 0 ? CFSTR("DigitalFlashMaxTripod") : (__CFString *)v10;
        }
        else
        {
          v8 = CFSTR("DigitalFlashMinTripod");
        }
      }
      else
      {
        v8 = CFSTR("DigitalFlashMaxHandheld");
      }
    }
    else
    {
      v8 = CFSTR("DigitalFlashMinHandheld");
    }
    result = -[__CFString isEqualToString:](v8, "isEqualToString:", *(_QWORD *)(result + 208));
    if ((result & 1) != 0
      || (v11 = *(_QWORD *)(v7 + 208),
          *(_QWORD *)(v7 + 208) = v8,
          v12 = (void *)objc_msgSend(*(id *)(v7 + 56), "objectForKeyedSubscript:", v8),
          result = objc_msgSend(v12, "isEqualToDictionary:", objc_msgSend(*(id *)(v7 + 56), "objectForKeyedSubscript:", v11)), (result & 1) != 0))
    {
LABEL_37:
      v22 = 0;
      if (!a6)
        return result;
    }
    else
    {
      if (objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("NormalizedSNRThreshold")))
      {
        objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("NormalizedSNRThreshold")), "floatValue");
        v14 = v13;
        objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("NormalizedSNRHysteresisLag")), "floatValue");
        BWSmartCameraSceneInitialize(v7 + 64, 1, 10, 2, (uint64_t)"Quadra SubPixel - Scene(Normalized SNR)", v14, v15, 0.9);
      }
      else
      {
        *(_BYTE *)(v7 + 64) = 0;
      }
      if (objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("LuxLevelThreshold")))
      {
        objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("LuxLevelThreshold")), "floatValue");
        v17 = v16;
        objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("LuxLevelHysteresisLag")), "floatValue");
        BWSmartCameraSceneInitialize(v7 + 104, 1, 10, 2, (uint64_t)"Quadra SubPixel - Scene(Lux Level)", v17, v18, 0.9);
      }
      else
      {
        *(_BYTE *)(v7 + 104) = 0;
      }
      result = objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("GainThreshold"));
      v19 = (_BYTE *)(v7 + 144);
      if (result)
      {
        objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("GainThreshold")), "floatValue");
        v21 = v20;
        objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("GainHysteresisLag")), "floatValue");
        v22 = 1;
        result = BWSmartCameraSceneInitialize((uint64_t)v19, 1, 10, 2, (uint64_t)"Quadra SubPixel - Scene(Gain)", v21, v23, 0.9);
        if (!a6)
          return result;
      }
      else
      {
        *v19 = 0;
        v22 = 1;
        if (!a6)
          return result;
      }
    }
    *a6 = v22;
  }
  return result;
}

- (int)formatIndexForZoomFactor:(float)lastZoomFactor frameStatistics:(id)a4 imageControlMode:(int)a5 stillImageDigitalFlashMode:(int)a6 isStationary:(BOOL)a7 isSecondaryStream:(BOOL)a8 binnedSIFROnSecondaryStreamAllowed:(BOOL)a9 ignoreZoomFactorAndQuadraSubPixelSceneMonitoring:(BOOL)a10 ultraHighResolutionZeroShutterLagEnabled:(BOOL)a11
{
  _BOOL4 v16;
  BOOL v17;
  BOOL v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int ultraHighResolutionNondisruptiveStreamingFormatIndex;
  float v25;
  uint64_t i;
  void *v27;
  float v28;
  float v30;
  int v31;
  int v32;
  BOOL v33;
  float v35;
  _BOOL4 v37;
  _BOOL4 quadraSubPixelSceneMonitoringForActionCameraEnabled;
  _BOOL4 quadraSubPixelSceneMonitoringForVideoEnabled;
  BOOL v40;
  int v41;
  BOOL v42;
  int v43;
  _BOOL4 v44;
  int v45;
  _BOOL4 v46;
  float v47;
  float v48;
  double v49;
  void *v50;
  _BOOL4 v53;
  id v54;
  char v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (a10 && self->_lastZoomFactor != 0.0)
    lastZoomFactor = self->_lastZoomFactor;
  v16 = self->_mainFormatSIFRBinningFactor == 2;
  v17 = self->_mainFormatSIFRBinningFactor == 2 || !a8;
  v18 = v17 || !a9;
  v53 = a7;
  if (!v18)
    v16 = -[NSDictionary count](self->_zoomFactorToNondisruptiveSwitchingFormatIndexSIFRBinned, "count", a4, *(_QWORD *)&a5, *(_QWORD *)&a6, a7, a8, a9) != 0;
  v54 = a4;
  v17 = !v16;
  v19 = 32;
  if (!v17)
    v19 = 24;
  v20 = *(Class *)((char *)&self->super.isa + v19);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v57;
    ultraHighResolutionNondisruptiveStreamingFormatIndex = -1;
    v25 = 0.0;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v57 != v23)
          objc_enumerationMutation(v20);
        v27 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend(v27, "floatValue");
        if (v28 <= lastZoomFactor && v28 > v25)
        {
          ultraHighResolutionNondisruptiveStreamingFormatIndex = objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", v27), "intValue");
          objc_msgSend(v27, "floatValue");
          v25 = v30;
        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    }
    while (v22);
    if (!a11)
      goto LABEL_37;
  }
  else
  {
    ultraHighResolutionNondisruptiveStreamingFormatIndex = -1;
    v25 = 0.0;
    if (!a11)
    {
LABEL_37:
      v31 = a5;
      v32 = v53;
      v33 = a10;
      goto LABEL_38;
    }
  }
  if (a8)
    goto LABEL_37;
  v31 = a5;
  v32 = v53;
  v33 = a10;
  if (v25 <= self->_baseZoomFactor && self->_ultraHighResolutionNondisruptiveStreamingFormatIndex != -1 && a6 == 0)
    ultraHighResolutionNondisruptiveStreamingFormatIndex = self->_ultraHighResolutionNondisruptiveStreamingFormatIndex;
LABEL_38:
  v35 = self->_lastZoomFactor;
  v37 = v35 != 0.0
     && lastZoomFactor != v35
     && ultraHighResolutionNondisruptiveStreamingFormatIndex != self->_lastNondisruptiveSwitchingFormatIndex;
  self->_lastZoomFactor = lastZoomFactor;
  if (!v33)
  {
    quadraSubPixelSceneMonitoringForActionCameraEnabled = self->_quadraSubPixelSceneMonitoringForActionCameraEnabled;
    if (self->_quadraSubPixelSceneMonitoringForActionCameraEnabled)
      quadraSubPixelSceneMonitoringForActionCameraEnabled = self->_videoStabilizationStrength > 2;
    quadraSubPixelSceneMonitoringForVideoEnabled = 0;
    if (a6)
      v40 = !self->_quadraSubPixelSceneMonitoringForDigitalFlashEnabled;
    else
      v40 = 1;
    v41 = !v40;
    if ((v31 - 4) >= 0xFFFFFFFD && !quadraSubPixelSceneMonitoringForActionCameraEnabled && (v41 & 1) == 0)
      quadraSubPixelSceneMonitoringForVideoEnabled = self->_quadraSubPixelSceneMonitoringForVideoEnabled;
    if (v31)
      v42 = 1;
    else
      v42 = !self->_quadraSubPixelSceneMonitoringForPhotoEnabled;
    v43 = !v42;
    v44 = !v42 && a6 == 0;
    if (v44 && !v37)
      v44 = self->_lastDigitalFlashMode != 0;
    if (v41)
      v45 = self->_lastDigitalFlashMode != a6 || self->_lastStationary != v32 || v37;
    else
      v45 = 0;
    self->_lastDigitalFlashMode = a6;
    self->_lastStationary = v32;
    if (v54
      && v25 > self->_baseZoomFactor
      && (quadraSubPixelSceneMonitoringForActionCameraEnabled | v43 | v41 | quadraSubPixelSceneMonitoringForVideoEnabled) == 1)
    {
      v46 = 0;
      v55 = 0;
      if ((v44 | v45) == 1)
      {
        -[BWNondisruptiveSwitchingFormatSelector _updateQuadraSubPixelSwitchingParametersWithVideoStabilizationStrength:imageControlMode:stillImageDigitalFlashMode:isStationary:quadraSubPixelSwitchingParametersChangedOut:]((uint64_t)self, self->_videoStabilizationStrength, v31, a6, v32, &v55);
        v46 = v55 != 0;
      }
      if (v37 || v46)
      {
        self->_quadraSubPixelSceneBasedOnNormalizedSNR.confident = 0;
        BWSmartCameraSceneUpdateResetTemporalHysteresisAndFiltering(&self->_quadraSubPixelSceneBasedOnNormalizedSNR.enabled);
        self->_quadraSubPixelSceneBasedOnLuxLevel.confident = 0;
        BWSmartCameraSceneUpdateResetTemporalHysteresisAndFiltering(&self->_quadraSubPixelSceneBasedOnLuxLevel.enabled);
        self->_quadraSubPixelSceneBasedOnGain.confident = 0;
        BWSmartCameraSceneUpdateResetTemporalHysteresisAndFiltering(&self->_quadraSubPixelSceneBasedOnGain.enabled);
      }
      objc_msgSend(v54, "normalizedQsumSNR");
      BWSmartCameraSceneUpdateWithConfidence((uint64_t)&self->_quadraSubPixelSceneBasedOnNormalizedSNR, v47);
      BWSmartCameraSceneUpdateWithConfidence((uint64_t)&self->_quadraSubPixelSceneBasedOnLuxLevel, (float)objc_msgSend(v54, "luxLevel"));
      objc_msgSend(v54, "gain");
      BWSmartCameraSceneUpdateWithConfidence((uint64_t)&self->_quadraSubPixelSceneBasedOnGain, v48);
      if (self->_quadraSubPixelSceneBasedOnNormalizedSNR.enabled
        && !self->_quadraSubPixelSceneBasedOnNormalizedSNR.confident
        || self->_quadraSubPixelSceneBasedOnLuxLevel.enabled && !self->_quadraSubPixelSceneBasedOnLuxLevel.confident
        || self->_quadraSubPixelSceneBasedOnGain.enabled && self->_quadraSubPixelSceneBasedOnGain.confident)
      {
        *(float *)&v49 = self->_baseZoomFactor;
        v50 = (void *)objc_msgSend(v20, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v49));
        if (v50)
          ultraHighResolutionNondisruptiveStreamingFormatIndex = objc_msgSend(v50, "intValue");
        else
          ultraHighResolutionNondisruptiveStreamingFormatIndex = -1;
      }
    }
  }
  self->_lastNondisruptiveSwitchingFormatIndex = ultraHighResolutionNondisruptiveStreamingFormatIndex;
  return ultraHighResolutionNondisruptiveStreamingFormatIndex;
}

@end
