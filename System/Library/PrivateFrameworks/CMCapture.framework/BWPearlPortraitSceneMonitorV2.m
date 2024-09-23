@implementation BWPearlPortraitSceneMonitorV2

+ (void)initialize
{
  objc_opt_class();
}

- (BWPearlPortraitSceneMonitorV2)initWithTuningParameters:(id)a3 attachDebugFrameStatistics:(BOOL)a4 portraitAutoSuggestEnabled:(BOOL)a5 shallowDepthOfFieldEnabled:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  char *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  float v19;
  BWPortraitAutoSuggest *v20;
  objc_super v22;

  v6 = a6;
  v7 = a5;
  v22.receiver = self;
  v22.super_class = (Class)BWPearlPortraitSceneMonitorV2;
  v9 = -[BWPearlPortraitSceneMonitorV2 init](&v22, sel_init, a3, a4);
  if (v9)
  {
    *((_DWORD *)v9 + 6) = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NumberOfFramesToStayEnabledThreshold")), "unsignedIntValue");
    *((_WORD *)v9 + 14) = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooBrightLuxLevelThreshold")), "unsignedIntValue");
    *((_WORD *)v9 + 15) = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooBrightMaxLuxLevelThreshold")), "unsignedIntValue");
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooBrightDepthQualityThreshold")), "floatValue");
    *((_DWORD *)v9 + 8) = v10;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("DepthQualityKCount")), "floatValue");
    *((_DWORD *)v9 + 9) = v11;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooCloseDepthDistanceValue")), "floatValue");
    *((_DWORD *)v9 + 10) = v12;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooFarDepthDistanceValue")), "floatValue");
    *((_DWORD *)v9 + 11) = v13;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooBrightTooFarDepthDistanceValue")), "floatValue");
    *((_DWORD *)v9 + 12) = v14;
    *((_DWORD *)v9 + 13) = 3;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StageTooBrightDepthQualityThreshold")), "floatValue");
    *((_DWORD *)v9 + 14) = v15;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StageTooCloseDistanceThreshold")), "floatValue");
    *((_DWORD *)v9 + 15) = v16;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StageTooFarDistanceThreshold")), "floatValue");
    *((_DWORD *)v9 + 16) = v17;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StageBackgroundTooFarDepthQualityThreshold")), "floatValue");
    *((_DWORD *)v9 + 17) = v18;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StageBackgroundTooFarLuxLevelThreshold")), "floatValue");
    *((_WORD *)v9 + 36) = (int)v19;
    *((_DWORD *)v9 + 19) = 6;
    v9[137] = 0;
    *((_DWORD *)v9 + 36) = 1036831949;
    *((_DWORD *)v9 + 2) = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NumberOfFramesToWaitForAEAndLTMToStabilize")), "unsignedIntValue");
    *(_QWORD *)(v9 + 12) = 0x3DCCCCCD3CCCCCCDLL;
    *((_QWORD *)v9 + 19) = 0x200000002;
    v9[124] = v7;
    if (!v7)
    {
LABEL_5:
      objc_msgSend(v9, "setShallowDepthOfFieldRenderingEnabled:", v6);
      *((_DWORD *)v9 + 20) = 2143289344;
      return (BWPearlPortraitSceneMonitorV2 *)v9;
    }
    v20 = -[BWPortraitAutoSuggest initWithTuningParameters:]([BWPortraitAutoSuggest alloc], "initWithTuningParameters:", a3);
    *((_QWORD *)v9 + 16) = v20;
    if (v20)
    {
      -[BWPortraitAutoSuggest setPortTypeIsFFC:](v20, "setPortTypeIsFFC:", 1);
      goto LABEL_5;
    }
  }
  return (BWPearlPortraitSceneMonitorV2 *)v9;
}

- (void)dealloc
{
  objc_super v3;

  -[BWPortraitAutoSuggest dealloc](self->_autoSuggestMonitor, "dealloc");
  v3.receiver = self;
  v3.super_class = (Class)BWPearlPortraitSceneMonitorV2;
  -[BWPearlPortraitSceneMonitorV2 dealloc](&v3, sel_dealloc);
}

- (BOOL)shallowDepthOfFieldRenderingEnabled
{
  return self->_shallowDepthOfFieldRenderingEnabled;
}

- (void)setShallowDepthOfFieldRenderingEnabled:(BOOL)a3
{
  self->_shallowDepthOfFieldRenderingEnabled = a3;
  -[BWPortraitAutoSuggest setShallowDepthOfFieldRenderingEnabled:](self->_autoSuggestMonitor, "setShallowDepthOfFieldRenderingEnabled:");
}

- (void)setSDOFBackgroundShiftSum:(float)a3 invalidShiftRatio:(float)a4 closeCanonicalDisparityAverage:(float)a5 faceCanonicalDisparityAverages:(id)a6 erodedForegroundRatio:(float)a7 foregroundRatio:(float)a8 occluded:(BOOL)a9 faces:(id)a10 personSegmentationRatio:(float)a11
{
  float v18;
  BOOL v19;
  float v20;
  float v21;
  _BOOL4 v22;
  float v23;
  _BOOL4 v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  BOOL v31;
  double v32;
  float closeDepthDistanceAverage;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  self->_stageDepthQuality = 1.0 - a4;
  v18 = BWModifiedMovingAverage(a11, self->_personSegmentationRatioSmoothed, 0.35);
  self->_personSegmentationRatioSmoothed = v18;
  if (self->_personSegmentationStatusEnabled)
    v19 = v18 >= self->_personSegmentationRatioThreshold;
  else
    v19 = self->_personSegmentationRatioThreshold * 1.2 <= v18;
  self->_personSegmentationStatusEnabled = v19;
  if (self->_portraitSceneMonitoringRequiresStageThresholds
    || self->_numberOfFramesSinceLastFace > self->_sdofNumberOfFramesSinceLastFaceThreshold)
  {
    v20 = 1.0 / a5;
    if (a5 <= 0.0001)
      v20 = 10000.0;
    self->_closeDepthDistanceAverage = v20;
  }
  else if (objc_msgSend(a6, "count"))
  {
    self->_closeDepthDistanceAverage = 1000.0;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v26 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v35 != v28)
            objc_enumerationMutation(a6);
          v30 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v30, "floatValue");
          v31 = *(float *)&v32 <= 0.0001;
          LODWORD(v32) = 953267991;
          if (!v31)
            objc_msgSend(v30, "floatValue", v32);
          closeDepthDistanceAverage = 1.0 / *(float *)&v32;
          if (closeDepthDistanceAverage >= self->_closeDepthDistanceAverage)
            closeDepthDistanceAverage = self->_closeDepthDistanceAverage;
          self->_closeDepthDistanceAverage = closeDepthDistanceAverage;
        }
        v27 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v27);
    }
  }
  v21 = a7 / (float)(fmaxf(a8, 0.0001) + self->_sdofDepthQualityKCount);
  v22 = v21 <= 0.0;
  v23 = 1.0;
  v24 = v21 < 1.0 || v21 <= 0.0;
  if (v21 >= 1.0)
    v22 = 1;
  if (v24)
    v23 = 0.0;
  if (v22)
    v21 = v23;
  self->_sdofDepthQuality = v21;
  self->_sdofDepthQualityFiltered = BWModifiedMovingAverage(v21, self->_sdofDepthQualityFiltered, self->_sdofDepthQualitySmoothingFactor);
  self->_depthSensorOccluded = a9;
  v25 = objc_msgSend(a10, "count");
  self->_stageMostRecentFacesCount = v25;
  self->_stageFaceHasBeenSeen |= v25 > 0;
}

- (BOOL)resolveSDOFStatusWithSampleBuffer:(opaqueCMSampleBuffer *)a3 frameStatisticsByPortType:(id)a4 sceneFlags:(unint64_t)a5 flashOrTorchWillBeActive:(BOOL)a6 digitalFlashWillFire:(BOOL)a7 thermalPressureLevel:(int)a8 peakPowerPressureLevel:(int)a9 effectStatus:(int *)a10 stagePreviewStatus:(int *)a11
{
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int sdofNumFramesSinceAEBecameStable;
  _BOOL4 v20;
  int v21;
  float v22;
  _BOOL4 autoSuggestEnabled;
  int v24;
  int v25;
  float closeDepthDistanceAverage;
  float stageTooFarDepthDistanceThreshold;
  float sdofTooFarDepthDistanceThreshold;
  int numberOfFramesToStayEnabledThreshold;
  int v30;
  _BOOL4 v31;
  int numberOfFramesSinceLastFace;
  int v33;
  int autoSuggestMaxPeakPowerPressureLevel;
  int autoSuggestMaxThermalPressureLevel;
  int v36;
  float sdofDepthQualityFiltered;
  unsigned int v39;

  v15 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v15)
    return (char)v15;
  v16 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]));
  v17 = v16;
  if (self->_aeStableAfterStartStreaming)
    goto LABEL_11;
  v18 = objc_msgSend(v16, "aeStable");
  if (v18
    && (sdofNumFramesSinceAEBecameStable = self->_sdofNumFramesSinceAEBecameStable,
        sdofNumFramesSinceAEBecameStable >= self->_numberOfFramesToWaitForAEAndLTMToStabilize))
  {
    v20 = 1;
    self->_aeStableAfterStartStreaming = 1;
  }
  else
  {
    v20 = (unint64_t)objc_msgSend(a4, "frameCount") > 0x13;
    self->_aeStableAfterStartStreaming = v20;
    if (!v18)
    {
      v21 = 0;
      goto LABEL_10;
    }
    sdofNumFramesSinceAEBecameStable = self->_sdofNumFramesSinceAEBecameStable;
  }
  v21 = sdofNumFramesSinceAEBecameStable + 1;
LABEL_10:
  self->_sdofNumFramesSinceAEBecameStable = v21;
  if (!v20)
    goto LABEL_66;
LABEL_11:
  v22 = BWModifiedMovingAverage((float)objc_msgSend(v17, "luxLevel"), self->_luxLevelFiltered, self->_luxLevelSmoothingFactor);
  self->_luxLevelFiltered = v22;
  autoSuggestEnabled = self->_autoSuggestEnabled;
  if (self->_autoSuggestEnabled)
  {
LABEL_12:
    v24 = 1;
    v39 = 1;
    v25 = 1;
    goto LABEL_23;
  }
  closeDepthDistanceAverage = self->_closeDepthDistanceAverage;
  if (self->_portraitSceneMonitoringRequiresStageThresholds)
  {
    if (closeDepthDistanceAverage >= self->_stageTooCloseDepthDistanceThreshold)
    {
      stageTooFarDepthDistanceThreshold = self->_stageTooFarDepthDistanceThreshold;
      goto LABEL_16;
    }
  }
  else if (closeDepthDistanceAverage >= self->_sdofTooCloseDepthDistanceThreshold)
  {
    sdofTooFarDepthDistanceThreshold = self->_sdofTooFarDepthDistanceThreshold;
    if (closeDepthDistanceAverage > sdofTooFarDepthDistanceThreshold)
    {
LABEL_21:
      v24 = 0;
      v25 = 3;
      goto LABEL_22;
    }
    LOWORD(sdofTooFarDepthDistanceThreshold) = self->_sdofTooBrightLuxLevelThreshold;
    sdofDepthQualityFiltered = (float)LODWORD(sdofTooFarDepthDistanceThreshold);
    if (v22 <= sdofDepthQualityFiltered
      || (sdofDepthQualityFiltered = self->_sdofDepthQualityFiltered,
          sdofDepthQualityFiltered >= self->_sdofTooBrightDepthQualityMinThreshold))
    {
      LOWORD(sdofDepthQualityFiltered) = self->_sdofTooBrightMaxLuxLevelThreshold;
      if (v22 <= (float)LODWORD(sdofDepthQualityFiltered))
        goto LABEL_12;
    }
    stageTooFarDepthDistanceThreshold = self->_sdofTooBrightTooFarDepthDistanceThreshold;
LABEL_16:
    if (closeDepthDistanceAverage <= stageTooFarDepthDistanceThreshold)
      goto LABEL_12;
    goto LABEL_21;
  }
  v24 = 0;
  v25 = 4;
LABEL_22:
  v39 = v25;
LABEL_23:
  if (self->_depthSensorOccluded)
  {
    v25 = 4;
    v39 = 4;
  }
  else if (v24)
  {
    self->_numberOfDisabledFramesInARow = 0;
    v25 = 1;
    goto LABEL_29;
  }
  numberOfFramesToStayEnabledThreshold = self->_numberOfFramesToStayEnabledThreshold;
  v30 = self->_numberOfDisabledFramesInARow + 1;
  self->_numberOfDisabledFramesInARow = v30;
  if (v30 < numberOfFramesToStayEnabledThreshold)
  {
    v25 = 1;
    v39 = 1;
  }
LABEL_29:
  if (self->_stageMostRecentFacesCount < 1)
  {
    numberOfFramesSinceLastFace = self->_numberOfFramesSinceLastFace;
    self->_numberOfFramesSinceLastFace = numberOfFramesSinceLastFace + 1;
    if (!self->_stageFaceHasBeenSeen)
    {
      self->_stageFaceDetected = 0;
      goto LABEL_39;
    }
    v31 = numberOfFramesSinceLastFace < self->_stageFaceNumberOfFramesSinceLastFaceThreshold;
  }
  else
  {
    self->_numberOfFramesSinceLastFace = 0;
    v31 = 1;
  }
  self->_stageFaceDetected = v31;
  if (v31 && v25 == 1)
  {
    if (!self->_stageSegmentationMonitoringEnabled)
    {
      v33 = 2;
      if (!autoSuggestEnabled)
        goto LABEL_60;
LABEL_49:
      LODWORD(v15) = -[BWPortraitAutoSuggest runAutoSuggestionWithSampleBuffer:portraitSceneMonitorStatus:](self->_autoSuggestMonitor, "runAutoSuggestionWithSampleBuffer:portraitSceneMonitorStatus:", a3, &v39);
      autoSuggestMaxThermalPressureLevel = self->_autoSuggestMaxThermalPressureLevel;
      autoSuggestMaxPeakPowerPressureLevel = self->_autoSuggestMaxPeakPowerPressureLevel;
      if ((autoSuggestMaxThermalPressureLevel < a8 || autoSuggestMaxPeakPowerPressureLevel < a9)
        && v39 <= 0xE
        && ((1 << v39) & 0x7A02) != 0)
      {
        if (autoSuggestMaxThermalPressureLevel < a8)
        {
          v36 = 6;
          goto LABEL_59;
        }
        if (autoSuggestMaxPeakPowerPressureLevel < a9)
        {
          v36 = 15;
LABEL_59:
          v39 = v36;
          if ((v15 & 1) != 0)
            goto LABEL_60;
LABEL_66:
          LOBYTE(v15) = 0;
          return (char)v15;
        }
      }
      if (!(_DWORD)v15)
        return (char)v15;
      goto LABEL_60;
    }
LABEL_43:
    if (self->_personSegmentationStatusEnabled)
      v33 = 2;
    else
      v33 = 1;
    if (!autoSuggestEnabled)
      goto LABEL_60;
    goto LABEL_49;
  }
LABEL_39:
  self->_stageFaceHasBeenSeen = 0;
  if (self->_stageSegmentationMonitoringEnabled)
  {
    if (v25 == 1)
      goto LABEL_43;
    if (v25 == 3)
    {
      v39 = 1;
      goto LABEL_43;
    }
  }
  v33 = 1;
  if (autoSuggestEnabled)
    goto LABEL_49;
LABEL_60:
  if (a10)
    *a10 = v39;
  if (a11)
    *a11 = v33;
  LOBYTE(v15) = 1;
  return (char)v15;
}

- (float)focusDistanceToMaxAllowedFocusDistanceRatio
{
  return 0.0;
}

- (BOOL)portraitSceneMonitoringRequiresStageThresholds
{
  return self->_portraitSceneMonitoringRequiresStageThresholds;
}

- (void)setPortraitSceneMonitoringRequiresStageThresholds:(BOOL)a3
{
  self->_portraitSceneMonitoringRequiresStageThresholds = a3;
}

@end
