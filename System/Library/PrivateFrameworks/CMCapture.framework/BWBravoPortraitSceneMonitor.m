@implementation BWBravoPortraitSceneMonitor

+ (void)initialize
{
  objc_opt_class();
}

- (BWBravoPortraitSceneMonitor)initWithTuningParameters:(id)a3 attachDebugFrameStatistics:(BOOL)a4
{
  BWBravoPortraitSceneMonitor *v5;
  BWBravoPortraitSceneMonitor *v6;
  float v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BWBravoPortraitSceneMonitor;
  v5 = -[BWBravoPortraitSceneMonitor init](&v9, sel_init, a3, a4);
  v6 = v5;
  if (v5)
  {
    *(int32x2_t *)&v5->_backgroundShiftSumFiltered = vdup_n_s32(0x7FC00000u);
    v5->_subjectTooCloseMonitoringEnabled = 1;
    v5->_subjectTooCloseWideFocusDistanceThreshold = (float)(int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooCloseFocusDistanceThreshold")), "intValue");
    v6->_subjectTooCloseWideFocusDistanceHysteresisLag = 5.0;
    v6->_subjectTooFarMonitoringEnabled = 1;
    v6->_subjectTooFarFocusDistanceThreshold = (float)(int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooFarFocusDistanceThreshold")), "intValue");
    v6->_subjectTooFarFocusDistanceHysteresisLag = 20.0;
    v6->_subjectTooFarFocusDistanceInfinityThreshold = (float)(int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooFarFocusDistanceInfinityThreshold")), "intValue");
    v6->_subjectTooFarUseTeleForFocusDistance = 1;
    *(_OWORD *)&v6->_subjectTooFarBackgroundShiftSumTooLowThreshold = xmmword_1A32B2410;
    v6->_sceneTooDarkMonitoringEnabled = 1;
    *(_OWORD *)&v6->_sceneTooDarkGainThreshold = xmmword_1A32B2420;
    v6->_stageFaceNumberOfFramesSinceLastFaceThreshold = 6;
    v6->_stageFaceMonitoringEnabled = 1;
    v6->_stageTooFarFocusDistanceThreshold = (float)(int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StageTooFarFocusDistanceThreshold")), "intValue");
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StageTooFarBackgroundShiftSumNoFacesThreshold")), "floatValue");
    v6->_stageTooFarBackgroundShiftSumNoFacesThreshold = v7;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWBravoPortraitSceneMonitor;
  -[BWBravoPortraitSceneMonitor dealloc](&v3, sel_dealloc);
}

- (void)setAutoFocusInProgress:(BOOL)a3 focusLocked:(BOOL)a4 oneShotFocusScanInProgress:(BOOL)a5
{
  if (a3)
  {
    *(_WORD *)&self->_oneShotFocusScanInProgress = 0;
  }
  else if (a4)
  {
    *(_WORD *)&self->_oneShotFocusScanInProgress = 256;
    self->_numFramesSinceFocusLocked = 0;
  }
  else if (a5)
  {
    *(_WORD *)&self->_oneShotFocusScanInProgress = 1;
  }
}

- (void)focusScanDidComplete
{
  if (self->_oneShotFocusScanInProgress)
  {
    *(_WORD *)&self->_oneShotFocusScanInProgress = 256;
    self->_numFramesSinceFocusLocked = 0;
  }
}

- (void)setSDOFBackgroundShiftSum:(float)a3 invalidShiftRatio:(float)a4 closeCanonicalDisparityAverage:(float)a5 faceCanonicalDisparityAverages:(id)a6 erodedForegroundRatio:(float)a7 foregroundRatio:(float)a8 occluded:(BOOL)a9 faces:(id)a10 personSegmentationRatio:(float)a11
{
  float v14;
  float v15;
  NSArray *v16;
  int lastFocusingMethod;

  v14 = 1.0;
  v15 = 0.35;
  if (self->_aeStableAfterStartStreaming
    && self->_focusStableAfterStartStreaming
    && !self->_oneShotFocusScanInProgress
    && !self->_focusLocked)
  {
    lastFocusingMethod = self->_lastFocusingMethod;
    if (self->_focusAdjusting)
    {
      if (lastFocusingMethod != 1)
      {
        if (lastFocusingMethod == 2)
        {
          v14 = 0.2;
          v15 = 0.06;
        }
        else
        {
          v14 = 0.15;
          v15 = 0.025;
        }
        goto LABEL_5;
      }
    }
    else
    {
      v14 = 0.15;
      v15 = 0.025;
      if (lastFocusingMethod != 1 || self->_numFramesSinceFocusBecameStable > 2)
        goto LABEL_5;
    }
    v15 = 0.25;
    v14 = 1.0;
  }
LABEL_5:
  self->_backgroundShiftSumFiltered = BWModifiedMovingAverage(a3, self->_backgroundShiftSumFiltered, v15);
  self->_invalidShiftRatioFiltered = BWModifiedMovingAverage(a4, self->_invalidShiftRatioFiltered, v14);

  v16 = (NSArray *)objc_msgSend(a10, "copy");
  self->_stageMostRecentFaces = v16;
  self->_stageFaceHasBeenSeen |= -[NSArray count](v16, "count") != 0;
}

- (BOOL)resolveSDOFStatusWithSampleBuffer:(opaqueCMSampleBuffer *)a3 frameStatisticsByPortType:(id)a4 sceneFlags:(unint64_t)a5 flashOrTorchWillBeActive:(BOOL)a6 digitalFlashWillFire:(BOOL)a7 thermalPressureLevel:(int)a8 peakPowerPressureLevel:(int)a9 effectStatus:(int *)a10 stagePreviewStatus:(int *)a11
{
  _BOOL4 v11;
  CFTypeRef v15;
  void *v16;
  uint64_t v17;
  void *v18;
  float invalidShiftRatioFiltered;
  float backgroundShiftSumFiltered;
  int numFramesSinceFocusLocked;
  _BOOL8 v22;
  float subjectTooFarBackgroundShiftRollOffInvalidShiftRatioStart;
  float subjectTooFarBackgroundShiftRollOffInvalidShiftRatioEnd;
  float v25;
  float v27;
  void *v28;
  void *v29;
  uint64_t v30;
  _BOOL4 v31;
  int v32;
  uint64_t v33;
  int v34;
  int v35;
  int v36;
  int lastFocusingMethod;
  int v39;
  int v40;
  int numFramesSinceAEBecameStable;
  _BOOL4 v42;
  BOOL v43;
  unint64_t v44;
  int v45;
  _BOOL4 v46;
  int v47;
  int subjectTooCloseLastWideFocusPosition;
  _BOOL4 subjectIsTooClose;
  float v50;
  float subjectTooCloseWideFocusDistanceThreshold;
  int v52;
  int subjectTooFarLastTeleFocusPosition;
  void *v54;
  float v55;
  float subjectTooFarFocusDistanceThreshold;
  float subjectTooFarFocusDistanceHysteresisLag;
  float v58;
  float v59;
  BOOL *p_stageSubjectTooFarDistanceThresholdReached;
  float stageTooFarFocusDistanceThreshold;
  float subjectTooFarBackgroundShiftSumTooLowThreshold;
  float v63;
  int subjectTooFarBackgroundShiftTooLowNumFrames;
  float stageTooFarBackgroundShiftSumNoFacesThreshold;
  float v66;
  int stageTooFarBackgroundShiftTooLowNumFrames;
  double v68;
  float v69;
  int v70;
  float v71;
  float sceneTooDarkGainThreshold;
  _BOOL4 v74;
  BOOL *p_sceneIsTooDark;
  float sceneTooDarkInvalidShiftRatioThreshold;
  BOOL v77;
  int stageFaceNumberOfFramesSinceLastFace;
  char v79;
  int v80;
  int v81;
  _BOOL4 v83;
  _BOOL4 portraitSceneMonitoringRequiresStageThresholds;
  void *v85;

  v11 = a6;
  v15 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v15)
    return (char)v15;
  v16 = (void *)v15;
  v17 = *MEMORY[0x1E0D05A18];
  v85 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A18]);
  v18 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A30]);
  invalidShiftRatioFiltered = self->_invalidShiftRatioFiltered;
  backgroundShiftSumFiltered = self->_backgroundShiftSumFiltered;
  if (self->_focusLocked)
  {
    numFramesSinceFocusLocked = self->_numFramesSinceFocusLocked;
    self->_numFramesSinceFocusLocked = numFramesSinceFocusLocked + 1;
    v22 = numFramesSinceFocusLocked > 9;
  }
  else
  {
    v22 = 0;
  }
  portraitSceneMonitoringRequiresStageThresholds = self->_portraitSceneMonitoringRequiresStageThresholds;
  CMSetAttachment(a3, CFSTR("SDOFFocusLocked"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v22), 1u);
  subjectTooFarBackgroundShiftRollOffInvalidShiftRatioStart = self->_subjectTooFarBackgroundShiftRollOffInvalidShiftRatioStart;
  subjectTooFarBackgroundShiftRollOffInvalidShiftRatioEnd = self->_subjectTooFarBackgroundShiftRollOffInvalidShiftRatioEnd;
  v25 = 1.0;
  if (subjectTooFarBackgroundShiftRollOffInvalidShiftRatioStart < 1.0
    && subjectTooFarBackgroundShiftRollOffInvalidShiftRatioEnd > subjectTooFarBackgroundShiftRollOffInvalidShiftRatioStart)
  {
    v27 = (float)(invalidShiftRatioFiltered
                / (float)(subjectTooFarBackgroundShiftRollOffInvalidShiftRatioStart
                        - subjectTooFarBackgroundShiftRollOffInvalidShiftRatioEnd))
        + (float)(subjectTooFarBackgroundShiftRollOffInvalidShiftRatioEnd
                / (float)(subjectTooFarBackgroundShiftRollOffInvalidShiftRatioEnd
                        - subjectTooFarBackgroundShiftRollOffInvalidShiftRatioStart));
    if (v27 <= 1.0)
      v25 = v27;
    if (v25 < 0.0)
      v25 = 0.0;
    backgroundShiftSumFiltered = backgroundShiftSumFiltered * v25;
  }
  v28 = (void *)objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D06ED8]), "objectForKeyedSubscript:", v17);
  v29 = v28;
  v30 = *MEMORY[0x1E0D067D0];
  v83 = v11;
  if (v28)
    v31 = objc_msgSend((id)objc_msgSend(v28, "objectForKeyedSubscript:", v30), "intValue") != 4;
  else
    v31 = 0;
  v32 = objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", v30), "intValue");
  v33 = *MEMORY[0x1E0D06AB8];
  v34 = objc_msgSend((id)objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0D06AB8]), "intValue");
  v35 = objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", v33), "intValue");
  if (v32 != 4)
    v31 = 1;
  if (v31)
  {
    v36 = 0;
    if (v35 == 1 || v34 == 1)
      lastFocusingMethod = 1;
    else
      lastFocusingMethod = 2;
    v39 = lastFocusingMethod;
  }
  else
  {
    lastFocusingMethod = self->_lastFocusingMethod;
    v39 = 0;
    if (self->_focusAdjusting)
      v36 = 0;
    else
      v36 = self->_numFramesSinceFocusBecameStable + 1;
  }
  if (self->_aeStableAfterStartStreaming)
  {
    if (self->_focusStableAfterStartStreaming)
    {
      self->_focusAdjusting = v31;
      self->_lastFocusingMethod = lastFocusingMethod;
      self->_numFramesSinceFocusBecameStable = v36;
      if (v39 == 1)
        goto LABEL_57;
      goto LABEL_55;
    }
    v42 = 1;
    if (!v31)
      goto LABEL_40;
LABEL_52:
    v46 = (unint64_t)objc_msgSend(a4, "frameCount") > 0x1F;
    goto LABEL_53;
  }
  v40 = objc_msgSend((id)objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0D067A0]), "BOOLValue");
  if (objc_msgSend(v85, "aeStable") && v40)
  {
    numFramesSinceAEBecameStable = self->_numFramesSinceAEBecameStable;
    if (numFramesSinceAEBecameStable <= 4)
    {
      v42 = (unint64_t)objc_msgSend(a4, "frameCount") > 0x13;
      numFramesSinceAEBecameStable = self->_numFramesSinceAEBecameStable;
    }
    else
    {
      v42 = 1;
    }
    v45 = numFramesSinceAEBecameStable + 1;
  }
  else
  {
    v44 = objc_msgSend(a4, "frameCount");
    v45 = 0;
    v42 = v44 > 0x13;
  }
  self->_numFramesSinceAEBecameStable = v45;
  if (v31)
    goto LABEL_52;
LABEL_40:
  if (lastFocusingMethod == 2)
  {
    v43 = v36 <= 3;
  }
  else if (lastFocusingMethod)
  {
    v43 = v36 <= 1;
  }
  else
  {
    v43 = v36 <= 43;
  }
  v46 = !v43;
LABEL_53:
  LOBYTE(v15) = 0;
  self->_focusAdjusting = v31;
  self->_lastFocusingMethod = lastFocusingMethod;
  self->_numFramesSinceFocusBecameStable = v36;
  self->_aeStableAfterStartStreaming = v42;
  self->_focusStableAfterStartStreaming = v46;
  if (!v42 || !v46 || v39 == 1)
    return (char)v15;
LABEL_55:
  if (lastFocusingMethod == 1 && v36 < 3)
    goto LABEL_57;
  if (self->_oneShotFocusScanInProgress)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_57:
    LOBYTE(v15) = 0;
    return (char)v15;
  }
  if (!v22)
  {
    if (self->_subjectTooCloseMonitoringEnabled)
    {
      v47 = objc_msgSend(v85, "focusPosition");
      subjectTooCloseLastWideFocusPosition = self->_subjectTooCloseLastWideFocusPosition;
      self->_subjectTooCloseLastWideFocusPosition = objc_msgSend(v85, "focusPosition");
      if (v47 != subjectTooCloseLastWideFocusPosition)
      {
        subjectIsTooClose = self->_subjectIsTooClose;
        objc_msgSend(v85, "focusDistance");
        subjectTooCloseWideFocusDistanceThreshold = self->_subjectTooCloseWideFocusDistanceThreshold;
        if (subjectIsTooClose)
        {
          if (v50 >= (float)(subjectTooCloseWideFocusDistanceThreshold
                            + self->_subjectTooCloseWideFocusDistanceHysteresisLag))
          {
            self->_subjectIsTooClose = 0;
            if (self->_lastSDOFEffectStatus == 4 && self->_sceneIsTooDark)
              self->_sceneIsTooDark = 0;
          }
        }
        else if (v50 <= subjectTooCloseWideFocusDistanceThreshold)
        {
          self->_subjectIsTooClose = 1;
        }
      }
    }
    if (self->_subjectTooFarMonitoringEnabled)
    {
      v52 = objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D06970]), "intValue");
      subjectTooFarLastTeleFocusPosition = self->_subjectTooFarLastTeleFocusPosition;
      self->_subjectTooFarLastTeleFocusPosition = v52;
      if (v52 != subjectTooFarLastTeleFocusPosition)
      {
        if (self->_subjectTooFarUseTeleForFocusDistance)
          v54 = v18;
        else
          v54 = v85;
        objc_msgSend(v54, "focusDistance");
        subjectTooFarFocusDistanceThreshold = self->_subjectTooFarFocusDistanceThreshold;
        if (self->_subjectTooFarDistanceThresholdReached)
        {
          subjectTooFarFocusDistanceHysteresisLag = self->_subjectTooFarFocusDistanceHysteresisLag;
          v58 = subjectTooFarFocusDistanceThreshold - subjectTooFarFocusDistanceHysteresisLag;
          v59 = self->_stageTooFarFocusDistanceThreshold - subjectTooFarFocusDistanceHysteresisLag;
          if (v55 <= v58)
            self->_subjectTooFarDistanceThresholdReached = 0;
          if (v55 > v59)
            goto LABEL_87;
          p_stageSubjectTooFarDistanceThresholdReached = &self->_stageSubjectTooFarDistanceThresholdReached;
        }
        else
        {
          stageTooFarFocusDistanceThreshold = self->_stageTooFarFocusDistanceThreshold;
          if (v55 >= subjectTooFarFocusDistanceThreshold)
          {
            self->_subjectTooFarDistanceThresholdReached = 1;
            if (self->_subjectTooFarBackgroundShiftSumIsTooLow)
              self->_subjectTooFarBackgroundShiftSumIsTooLow = 0;
          }
          if (v55 < stageTooFarFocusDistanceThreshold)
            goto LABEL_87;
          self->_stageSubjectTooFarDistanceThresholdReached = 1;
          if (self->_subjectTooFarBackgroundShiftSumIsTooLow)
            self->_subjectTooFarBackgroundShiftSumIsTooLow = 0;
          p_stageSubjectTooFarDistanceThresholdReached = &self->_stageTooFarBackgroundShiftSumNoFacesIsTooLow;
          if (!self->_stageTooFarBackgroundShiftSumNoFacesIsTooLow)
            goto LABEL_87;
        }
        *p_stageSubjectTooFarDistanceThresholdReached = 0;
      }
LABEL_87:
      subjectTooFarBackgroundShiftSumTooLowThreshold = self->_subjectTooFarBackgroundShiftSumTooLowThreshold;
      if (self->_subjectTooFarBackgroundShiftSumIsTooLow)
      {
        if (backgroundShiftSumFiltered > (float)(subjectTooFarBackgroundShiftSumTooLowThreshold
                                                + self->_subjectTooFarBackgroundShiftSumTooLowHysteresisLag))
        {
          objc_msgSend(v18, "focusDistance");
          if (v63 < self->_subjectTooFarFocusDistanceInfinityThreshold
            || (subjectTooFarBackgroundShiftTooLowNumFrames = self->_subjectTooFarBackgroundShiftTooLowNumFrames,
                subjectTooFarBackgroundShiftTooLowNumFrames > 5))
          {
            self->_subjectTooFarBackgroundShiftSumIsTooLow = 0;
            self->_subjectTooFarBackgroundShiftTooLowNumFrames = 0;
          }
          else
          {
            self->_subjectTooFarBackgroundShiftTooLowNumFrames = subjectTooFarBackgroundShiftTooLowNumFrames + 1;
          }
        }
      }
      else if (backgroundShiftSumFiltered < subjectTooFarBackgroundShiftSumTooLowThreshold)
      {
        self->_subjectTooFarBackgroundShiftSumIsTooLow = 1;
      }
    }
  }
  if (portraitSceneMonitoringRequiresStageThresholds)
  {
    stageTooFarBackgroundShiftSumNoFacesThreshold = self->_stageTooFarBackgroundShiftSumNoFacesThreshold;
    if (self->_stageTooFarBackgroundShiftSumNoFacesIsTooLow)
    {
      if (backgroundShiftSumFiltered > (float)(stageTooFarBackgroundShiftSumNoFacesThreshold
                                              + self->_subjectTooFarBackgroundShiftSumTooLowHysteresisLag))
      {
        objc_msgSend(v18, "focusDistance");
        if (v66 < self->_subjectTooFarFocusDistanceInfinityThreshold
          || (stageTooFarBackgroundShiftTooLowNumFrames = self->_stageTooFarBackgroundShiftTooLowNumFrames,
              stageTooFarBackgroundShiftTooLowNumFrames > 5))
        {
          self->_stageTooFarBackgroundShiftSumNoFacesIsTooLow = 0;
          self->_stageTooFarBackgroundShiftTooLowNumFrames = 0;
        }
        else
        {
          self->_stageTooFarBackgroundShiftTooLowNumFrames = stageTooFarBackgroundShiftTooLowNumFrames + 1;
        }
      }
    }
    else if (backgroundShiftSumFiltered < stageTooFarBackgroundShiftSumNoFacesThreshold)
    {
      self->_stageTooFarBackgroundShiftSumNoFacesIsTooLow = 1;
    }
  }
  if (!self->_sceneTooDarkMonitoringEnabled)
    goto LABEL_125;
  objc_msgSend(v18, "integrationTime");
  v69 = v68;
  if (v69 <= 0.0)
    v70 = 1;
  else
    v70 = llroundf(1.0 / v69);
  objc_msgSend(v18, "gain");
  sceneTooDarkGainThreshold = self->_sceneTooDarkGainThreshold;
  if (self->_sceneTooDarkExposureThresholdReached)
    sceneTooDarkGainThreshold = sceneTooDarkGainThreshold / self->_sceneTooDarkGainHysteresisLag;
  v74 = v71 >= sceneTooDarkGainThreshold && v70 < 61;
  self->_sceneTooDarkExposureThresholdReached = v74;
  p_sceneIsTooDark = &self->_sceneIsTooDark;
  if (!v74)
    goto LABEL_124;
  sceneTooDarkInvalidShiftRatioThreshold = self->_sceneTooDarkInvalidShiftRatioThreshold;
  if (self->_sceneIsTooDark)
  {
    if (invalidShiftRatioFiltered < (float)(sceneTooDarkInvalidShiftRatioThreshold
                                           - self->_sceneTooDarkInvalidShiftRatioHysteresisLag))
      goto LABEL_124;
  }
  else
  {
    if (invalidShiftRatioFiltered <= sceneTooDarkInvalidShiftRatioThreshold)
      goto LABEL_125;
    *p_sceneIsTooDark = 1;
  }
  if (v83)
  {
    self->_sceneIsTooDark = 0;
    self->_subjectIsTooClose = 0;
    self->_subjectTooFarDistanceThresholdReached = 0;
    p_sceneIsTooDark = &self->_stageTooFarBackgroundShiftSumNoFacesIsTooLow;
    self->_subjectTooFarBackgroundShiftSumIsTooLow = 0;
LABEL_124:
    *p_sceneIsTooDark = 0;
  }
LABEL_125:
  if (self->_stageFaceMonitoringEnabled)
  {
    if (-[NSArray count](self->_stageMostRecentFaces, "count"))
    {
      self->_stageFaceNumberOfFramesSinceLastFace = 0;
      v77 = 1;
    }
    else
    {
      stageFaceNumberOfFramesSinceLastFace = self->_stageFaceNumberOfFramesSinceLastFace;
      self->_stageFaceNumberOfFramesSinceLastFace = stageFaceNumberOfFramesSinceLastFace + 1;
      v77 = self->_stageFaceHasBeenSeen
         && stageFaceNumberOfFramesSinceLastFace < self->_stageFaceNumberOfFramesSinceLastFaceThreshold;
    }
    self->_stageFaceDetected = v77;
  }
  if (self->_subjectIsTooClose)
  {
    v79 = 0;
    v80 = 4;
  }
  else if (self->_sceneIsTooDark)
  {
    v79 = 0;
    v80 = 5;
  }
  else if (self->_subjectTooFarDistanceThresholdReached && self->_subjectTooFarBackgroundShiftSumIsTooLow
         || portraitSceneMonitoringRequiresStageThresholds
         && !self->_stageFaceDetected
         && self->_stageTooFarBackgroundShiftSumNoFacesIsTooLow)
  {
    v79 = 0;
    v80 = 3;
  }
  else
  {
    v79 = 1;
    v80 = 1;
  }
  if (self->_stageFaceMonitoringEnabled)
  {
    if (!self->_stageFaceDetected)
      v79 = 0;
    if ((v79 & 1) != 0)
    {
      v81 = 2;
    }
    else
    {
      self->_stageFaceHasBeenSeen = 0;
      v81 = 1;
    }
  }
  else
  {
    v81 = 0;
  }
  self->_lastSDOFEffectStatus = v80;
  if (a10)
    *a10 = v80;
  if (a11)
    *a11 = v81;
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
