@implementation BWPearlPortraitSceneMonitor

+ (void)initialize
{
  objc_opt_class();
}

- (BWPearlPortraitSceneMonitor)initWithTuningParameters:(id)a3 attachDebugFrameStatistics:(BOOL)a4
{
  char *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  float v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BWPearlPortraitSceneMonitor;
  v5 = -[BWPearlPortraitSceneMonitor init](&v17, sel_init, a3, a4);
  if (v5)
  {
    *((_DWORD *)v5 + 6) = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NumberOfFramesToStayEnabledThreshold")), "unsignedIntValue");
    *((_WORD *)v5 + 14) = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooBrightLuxLevelThreshold")), "unsignedIntValue");
    *((_WORD *)v5 + 15) = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooBrightMaxLuxLevelThreshold")), "unsignedIntValue");
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooBrightDepthQualityThreshold")), "floatValue");
    *((_DWORD *)v5 + 8) = v6;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("DepthQualityKCount")), "floatValue");
    *((_DWORD *)v5 + 9) = v7;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooCloseDepthDistanceValue")), "floatValue");
    *((_DWORD *)v5 + 10) = v8;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooFarDepthDistanceValue")), "floatValue");
    *((_DWORD *)v5 + 11) = v9;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooBrightTooFarDepthDistanceValue")), "floatValue");
    *((_DWORD *)v5 + 12) = v10;
    *((_DWORD *)v5 + 13) = 3;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StageTooBrightDepthQualityThreshold")), "floatValue");
    *((_DWORD *)v5 + 14) = v11;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StageTooCloseDistanceThreshold")), "floatValue");
    *((_DWORD *)v5 + 15) = v12;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StageTooFarDistanceThreshold")), "floatValue");
    *((_DWORD *)v5 + 16) = v13;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StageBackgroundTooFarDepthQualityThreshold")), "floatValue");
    *((_DWORD *)v5 + 17) = v14;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StageBackgroundTooFarLuxLevelThreshold")), "floatValue");
    *((_WORD *)v5 + 36) = (int)v15;
    *((_DWORD *)v5 + 19) = 6;
    *((_DWORD *)v5 + 2) = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NumberOfFramesToWaitForAEAndLTMToStabilize")), "unsignedIntValue");
    *(_QWORD *)(v5 + 12) = 0x3DCCCCCD3CCCCCCDLL;
  }
  return (BWPearlPortraitSceneMonitor *)v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BWPearlPortraitSceneMonitor;
  -[BWPearlPortraitSceneMonitor dealloc](&v2, sel_dealloc);
}

- (void)setSDOFBackgroundShiftSum:(float)a3 invalidShiftRatio:(float)a4 closeCanonicalDisparityAverage:(float)a5 faceCanonicalDisparityAverages:(id)a6 erodedForegroundRatio:(float)a7 foregroundRatio:(float)a8 occluded:(BOOL)a9 faces:(id)a10 personSegmentationRatio:(float)a11
{
  float v16;
  float v17;
  _BOOL4 v18;
  float v19;
  _BOOL4 v20;
  int v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  BOOL v28;
  double v29;
  float closeDepthDistanceAverage;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  self->_stageDepthQuality = 1.0 - a4;
  if (self->_portraitSceneMonitoringRequiresStageThresholds
    || self->_numberOfFramesSinceLastFace > self->_sdofNumberOfFramesSinceLastFaceThreshold)
  {
    v16 = 1.0 / a5;
    if (a5 <= 0.0001)
      v16 = 10000.0;
    self->_closeDepthDistanceAverage = v16;
  }
  else if (objc_msgSend(a6, "count"))
  {
    self->_closeDepthDistanceAverage = 1000.0;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v23 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v32 != v25)
            objc_enumerationMutation(a6);
          v27 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v27, "floatValue");
          v28 = *(float *)&v29 <= 0.0001;
          LODWORD(v29) = 953267991;
          if (!v28)
            objc_msgSend(v27, "floatValue", v29);
          closeDepthDistanceAverage = 1.0 / *(float *)&v29;
          if (closeDepthDistanceAverage >= self->_closeDepthDistanceAverage)
            closeDepthDistanceAverage = self->_closeDepthDistanceAverage;
          self->_closeDepthDistanceAverage = closeDepthDistanceAverage;
        }
        v24 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v24);
    }
  }
  v17 = a7 / (float)(fmaxf(a8, 0.0001) + self->_sdofDepthQualityKCount);
  v18 = v17 <= 0.0;
  v19 = 1.0;
  v20 = v17 < 1.0 || v17 <= 0.0;
  if (v17 >= 1.0)
    v18 = 1;
  if (v20)
    v19 = 0.0;
  if (v18)
    v17 = v19;
  self->_sdofDepthQuality = v17;
  self->_sdofDepthQualityFiltered = BWModifiedMovingAverage(v17, self->_sdofDepthQualityFiltered, self->_sdofDepthQualitySmoothingFactor);
  self->_depthSensorOccluded = a9;
  v21 = objc_msgSend(a10, "count");
  self->_stageMostRecentFacesCount = v21;
  self->_stageFaceHasBeenSeen |= v21 > 0;
}

- (BOOL)resolveSDOFStatusWithSampleBuffer:(opaqueCMSampleBuffer *)a3 frameStatisticsByPortType:(id)a4 sceneFlags:(unint64_t)a5 flashOrTorchWillBeActive:(BOOL)a6 digitalFlashWillFire:(BOOL)a7 thermalPressureLevel:(int)a8 peakPowerPressureLevel:(int)a9 effectStatus:(int *)a10 stagePreviewStatus:(int *)a11
{
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int sdofNumFramesSinceAEBecameStable;
  _BOOL4 v18;
  int v19;
  float v20;
  float closeDepthDistanceAverage;
  uint64_t v22;
  int v23;
  int numberOfFramesToStayEnabledThreshold;
  int v25;
  BOOL v26;
  int numberOfFramesSinceLastFace;
  int v28;
  float sdofTooFarDepthDistanceThreshold;
  float sdofDepthQualityFiltered;

  v13 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v13)
    return (char)v13;
  v14 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]));
  v15 = v14;
  if (!self->_aeStableAfterStartStreaming)
  {
    v16 = objc_msgSend(v14, "aeStable");
    if (v16
      && (sdofNumFramesSinceAEBecameStable = self->_sdofNumFramesSinceAEBecameStable,
          sdofNumFramesSinceAEBecameStable >= self->_numberOfFramesToWaitForAEAndLTMToStabilize))
    {
      v18 = 1;
      self->_aeStableAfterStartStreaming = 1;
    }
    else
    {
      v18 = (unint64_t)objc_msgSend(a4, "frameCount") > 0x13;
      self->_aeStableAfterStartStreaming = v18;
      if (!v16)
      {
        v19 = 0;
        goto LABEL_10;
      }
      sdofNumFramesSinceAEBecameStable = self->_sdofNumFramesSinceAEBecameStable;
    }
    v19 = sdofNumFramesSinceAEBecameStable + 1;
LABEL_10:
    self->_sdofNumFramesSinceAEBecameStable = v19;
    if (!v18)
    {
      LOBYTE(v13) = 0;
      return (char)v13;
    }
  }
  v20 = BWModifiedMovingAverage((float)objc_msgSend(v15, "luxLevel"), self->_luxLevelFiltered, self->_luxLevelSmoothingFactor);
  self->_luxLevelFiltered = v20;
  closeDepthDistanceAverage = self->_closeDepthDistanceAverage;
  if (self->_portraitSceneMonitoringRequiresStageThresholds)
  {
    if (closeDepthDistanceAverage >= self->_stageTooCloseDepthDistanceThreshold)
    {
      v22 = 64;
      goto LABEL_14;
    }
LABEL_18:
    v23 = 4;
    goto LABEL_19;
  }
  if (closeDepthDistanceAverage < self->_sdofTooCloseDepthDistanceThreshold)
    goto LABEL_18;
  sdofTooFarDepthDistanceThreshold = self->_sdofTooFarDepthDistanceThreshold;
  if (closeDepthDistanceAverage > sdofTooFarDepthDistanceThreshold)
  {
    v23 = 3;
    goto LABEL_19;
  }
  LOWORD(sdofTooFarDepthDistanceThreshold) = self->_sdofTooBrightLuxLevelThreshold;
  sdofDepthQualityFiltered = (float)LODWORD(sdofTooFarDepthDistanceThreshold);
  if (v20 <= sdofDepthQualityFiltered
    || (sdofDepthQualityFiltered = self->_sdofDepthQualityFiltered,
        sdofDepthQualityFiltered >= self->_sdofTooBrightDepthQualityMinThreshold))
  {
    LOWORD(sdofDepthQualityFiltered) = self->_sdofTooBrightMaxLuxLevelThreshold;
    if (v20 <= (float)LODWORD(sdofDepthQualityFiltered))
    {
      v23 = 1;
      goto LABEL_19;
    }
  }
  v22 = 48;
LABEL_14:
  if (closeDepthDistanceAverage <= *(float *)((char *)&self->super.isa + v22))
    v23 = 1;
  else
    v23 = 3;
LABEL_19:
  if (self->_depthSensorOccluded)
    v23 = 4;
  if (v23 == 1)
  {
    self->_numberOfDisabledFramesInARow = 0;
  }
  else
  {
    numberOfFramesToStayEnabledThreshold = self->_numberOfFramesToStayEnabledThreshold;
    v25 = self->_numberOfDisabledFramesInARow + 1;
    self->_numberOfDisabledFramesInARow = v25;
    if (v25 < numberOfFramesToStayEnabledThreshold)
      v23 = 1;
  }
  if (self->_stageMostRecentFacesCount < 1)
  {
    numberOfFramesSinceLastFace = self->_numberOfFramesSinceLastFace;
    self->_numberOfFramesSinceLastFace = numberOfFramesSinceLastFace + 1;
    if (!self->_stageFaceHasBeenSeen)
    {
      self->_stageFaceDetected = 0;
      goto LABEL_36;
    }
    v26 = numberOfFramesSinceLastFace < self->_stageFaceNumberOfFramesSinceLastFaceThreshold;
  }
  else
  {
    self->_numberOfFramesSinceLastFace = 0;
    v26 = 1;
  }
  self->_stageFaceDetected = v26;
  if (v23 == 1 && v26)
  {
    v28 = 2;
    if (!a10)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_36:
  self->_stageFaceHasBeenSeen = 0;
  v28 = 1;
  if (a10)
LABEL_37:
    *a10 = v23;
LABEL_38:
  if (a11)
    *a11 = v28;
  LOBYTE(v13) = 1;
  return (char)v13;
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
