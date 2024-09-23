@implementation BWBravoPortraitSceneMonitorV2

+ (void)initialize
{
  objc_opt_class();
}

- (BWBravoPortraitSceneMonitorV2)initWithTuningParameters:(id)a3 attachDebugFrameStatistics:(BOOL)a4
{
  BWBravoPortraitSceneMonitorV2 *v5;
  BWBravoPortraitSceneMonitorV2 *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BWBravoPortraitSceneMonitorV2;
  v5 = -[BWBravoPortraitSceneMonitorV2 init](&v17, sel_init, a3, a4);
  v6 = v5;
  if (v5)
  {
    v5->_numberOfFramesWithStableFocusThreshold = 3;
    v5->_subjectTooCloseMonitoringEnabled = 1;
    v5->_subjectTooCloseMonitoringForcingWideLens = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ForceWideLensForTooCloseGating")), "BOOLValue");
    v6->_subjectTooCloseFocusDistanceThreshold = (float)(int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooCloseFocusDistanceThreshold")), "intValue");
    v6->_subjectTooCloseHysteresis = 2.0;
    v6->_subjectTooFarMonitoringEnabled = 1;
    v6->_subjectTooFarFocusDistanceThreshold = (float)(int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooFarFocusDistanceThreshold")), "intValue");
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("BackgroundShiftSumTooLowThreshold")), "floatValue");
    v6->_subjectTooFarBackgroundShiftSumTooLowThreshold = v7;
    v6->_subjectTooFarDistanceThresholdReached = 0;
    v6->_subjectTooFarDistanceThresholdHysteresis = 10.0;
    v6->_backgroundShiftSumTooLowThresholdReached = 0;
    v6->_subjectTooFarBackGroundShiftSumIsTooLowHysteresis = 1.1;
    *(_WORD *)&v6->_subjectIsTooFarDigitalFlash = 0;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooFarJasperDistanceThreshold")), "floatValue");
    v6->_subjectTooFarDigitalFlashThreshold = v8;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StageTooFarJasperDistanceThreshold")), "floatValue");
    v6->_stageTooFarDigitalFlashThreshold = v9;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooDarkGainThresholdHard")), "floatValue");
    v6->_sceneTooDarkGainThresholdHard = v10;
    v6->_jasperDistanceAtFocus = 0.0;
    v6->_jasperDistanceAtFocusSmoothingFactor = 0.05;
    v6->_backgroundShiftSumSmoothingTrendUpdateFactor = 0.025;
    *(_QWORD *)&v6->_backgroundShiftSumSmoothingTrend = 0x3D8F5C2900000000;
    v6->_invalidShiftRatioSmoothingFactor = 0.025;
    v6->_sceneTooDarkMonitoringEnabled = 1;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooDarkGainThreshold")), "floatValue");
    v6->_sceneTooDarkGainThreshold = v11;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooDarkAEAverageAETargetFractionThreshold")), "floatValue");
    v6->_sceneTooDarkAEAverageAETargetFractionThreshold = v12;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooDarkAEAverageAETargetFractionThresholdHysteresisLag")), "floatValue");
    v6->_sceneTooDarkAEAverageAETargetFractionThresholdHysteresisLag = v13;
    v6->_stageFaceMonitoringEnabled = 1;
    v6->_stageTooFarMonitoringEnabled = 1;
    v6->_stageTooFarFocusDistanceThreshold = (float)(int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StageTooFarFocusDistanceThreshold")), "intValue");
    v6->_stageTooFarDistanceThresholdReached = 0;
    v6->_stageTooFarDistanceThresholdHysteresis = 10.0;
    v6->_stageBackgroundShiftSumTooLowThresholdReached = 0;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StageBackgroundShiftSumTooLowThreshold")), "floatValue");
    v6->_stageTooFarBackgroundShiftSumTooLowThreshold = v14;
    v6->_stageTooFarBackgroundShiftSumNoFacesIsTooLow = 0;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StageTooFarBackgroundShiftSumNoFacesThreshold")), "floatValue");
    v6->_stageTooFarBackgroundShiftSumNoFacesThreshold = v15;
    v6->_stageFaceNumberOfFramesSinceLastFaceThreshold = 6;
    v6->_stageTooFarBackGroundShiftSumIsTooLowHysteresis = 1.15;
    v6->_deliveryOfShiftsHasStarted = 0;
    v6->_sceneIsTooDark = 0;
    v6->_subjectIsTooClose = 0;
    v6->_focusHasBeenAttainedAfterStart = 0;
    v6->_numFramesSinceFocusFirstAttainedStability = 0;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWBravoPortraitSceneMonitorV2;
  -[BWBravoPortraitSceneMonitorV2 dealloc](&v3, sel_dealloc);
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
  self->_focusIsStationaryBeyondThreshold = 0;
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
  BOOL v16;
  NSArray *v17;
  int v18;

  self->_invalidShiftRatioSmoothed = BWModifiedMovingAverage(a4, self->_invalidShiftRatioSmoothed, self->_invalidShiftRatioSmoothingFactor);
  -[BWBravoPortraitSceneMonitorV3 doubleExponentialSmoothing:smoothValue:trendValue:dataFactor:trendFactor:]((uint64_t)self, &self->_backgroundShiftSumSmoothed, &self->_backgroundShiftSumSmoothingTrend, a3, self->_backgroundShiftSumSmoothingFactor, self->_backgroundShiftSumSmoothingTrendUpdateFactor);
  v16 = a4 < 0.9 || self->_deliveryOfShiftsHasStarted;
  self->_deliveryOfShiftsHasStarted = v16;

  v17 = (NSArray *)objc_msgSend(a10, "copy");
  self->_stageMostRecentFaces = v17;
  self->_stageFaceHasBeenSeen |= -[NSArray count](v17, "count") != 0;
  if (-[NSArray count](self->_stageMostRecentFaces, "count"))
    v18 = 0;
  else
    v18 = self->_stageFaceNumberOfFramesSinceLastFace + 1;
  self->_stageFaceNumberOfFramesSinceLastFace = v18;
}

- (BOOL)resolveSDOFStatusWithSampleBuffer:(opaqueCMSampleBuffer *)a3 frameStatisticsByPortType:(id)a4 sceneFlags:(unint64_t)a5 flashOrTorchWillBeActive:(BOOL)a6 digitalFlashWillFire:(BOOL)a7 thermalPressureLevel:(int)a8 peakPowerPressureLevel:(int)a9 effectStatus:(int *)a10 stagePreviewStatus:(int *)a11
{
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 portraitSceneMonitoringRequiresStageThresholds;
  void *v17;
  void *v18;
  float v19;
  float v20;
  float v21;
  void *v22;
  int v23;
  _BOOL4 v24;
  _BOOL4 v25;
  _BOOL4 v26;
  _BOOL4 v27;
  int numFramesSinceFocusLocked;
  _BOOL8 v29;
  int v30;
  float sceneTooDarkGainThresholdHard;
  float v32;
  float v33;
  int v34;
  BOOL v36;
  float subjectTooFarFocusDistanceThreshold;
  float backgroundShiftSumSmoothed;
  float subjectTooFarBackgroundShiftSumTooLowThreshold;
  BOOL v40;
  float jasperDistanceAtFocus;
  float subjectTooFarDigitalFlashThreshold;
  float stageTooFarFocusDistanceThreshold;
  float v44;
  float stageTooFarBackgroundShiftSumTooLowThreshold;
  BOOL v46;
  float v47;
  float stageTooFarDigitalFlashThreshold;
  float subjectTooCloseFocusDistanceThreshold;
  BOOL v51;
  float v52;
  float v53;
  float v54;
  float sceneTooDarkAEAverageAETargetFractionThreshold;
  float v56;
  float stageTooFarBackgroundShiftSumNoFacesThreshold;
  _BOOL4 v58;
  _BOOL4 stageFaceHasBeenSeen;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  float v68;
  int v70;
  char v71;

  v11 = a7;
  v12 = a6;
  portraitSceneMonitoringRequiresStageThresholds = self->_portraitSceneMonitoringRequiresStageThresholds;
  v17 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v18 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]));
  objc_msgSend(v18, "focusDistance");
  v20 = v19;
  if (self->_subjectTooCloseMonitoringForcingWideLens)
    objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A18]), "focusDistance");
  v21 = v19;
  v22 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F10]);
  self->_jasperDistanceAtFocus = BWModifiedMovingAverage((float)(int)objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0D07D50]), "intValue"), self->_jasperDistanceAtFocus, self->_jasperDistanceAtFocusSmoothingFactor);
  v23 = objc_msgSend(v18, "afStatus");
  v24 = objc_msgSend(v18, "afStatus") == 4 || objc_msgSend(v18, "afStatus") == 3;
  v25 = v23 == 4;
  objc_msgSend(v18, "focusingMethod");
  if (FigCaptureStreamFocusingMethodIsPhaseDetectionBased())
    v26 = v24;
  else
    v26 = v25;
  v27 = self->_focusHasBeenAttainedAfterStart || v26;
  self->_focusHasBeenAttainedAfterStart = v27;
  if (v27)
    ++self->_numFramesSinceFocusFirstAttainedStability;
  if (self->_focusLocked)
  {
    numFramesSinceFocusLocked = self->_numFramesSinceFocusLocked;
    self->_numFramesSinceFocusLocked = numFramesSinceFocusLocked + 1;
    v29 = numFramesSinceFocusLocked > 8;
  }
  else
  {
    v29 = 0;
  }
  CMSetAttachment(a3, CFSTR("SDOFFocusLocked"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v29), 1u);
  if (v26)
    v30 = self->_numFramesSinceFocusBecameStable + 1;
  else
    v30 = 0;
  self->_numFramesSinceFocusBecameStable = v30;
  sceneTooDarkGainThresholdHard = self->_sceneTooDarkGainThresholdHard;
  if ((sceneTooDarkGainThresholdHard == 0.0
     || (objc_msgSend(v18, "gain"),
         sceneTooDarkGainThresholdHard = self->_sceneTooDarkGainThresholdHard,
         v32 <= sceneTooDarkGainThresholdHard))
    && (sceneTooDarkGainThresholdHard != 0.0 || (objc_msgSend(v18, "gain"), v33 <= self->_sceneTooDarkGainThreshold)))
  {
    v34 = 40;
  }
  else
  {
    self->_numberOfFramesWithStableFocusThreshold = 0;
    self->_deliveryOfShiftsHasStarted = 1;
    v34 = 4;
  }
  if (!self->_focusIsStationaryBeyondThreshold && v26)
  {
    if (self->_numFramesSinceFocusBecameStable <= self->_numberOfFramesWithStableFocusThreshold)
    {
LABEL_31:
      v36 = 0;
      goto LABEL_34;
    }
  }
  else if (!self->_focusIsStationaryBeyondThreshold)
  {
    goto LABEL_31;
  }
  v36 = self->_numFramesSinceFocusFirstAttainedStability > v34;
LABEL_34:
  self->_focusIsStationaryBeyondThreshold = v36;
  if (v29)
    goto LABEL_83;
  self->_subjectIsTooFar = 0;
  if (self->_subjectTooFarMonitoringEnabled)
  {
    subjectTooFarFocusDistanceThreshold = self->_subjectTooFarFocusDistanceThreshold;
    if (self->_subjectTooFarDistanceThresholdReached)
    {
      if (v20 <= (float)(subjectTooFarFocusDistanceThreshold - self->_subjectTooFarDistanceThresholdHysteresis))
      {
        self->_subjectTooFarDistanceThresholdReached = 0;
        goto LABEL_54;
      }
    }
    else
    {
      if (v20 < subjectTooFarFocusDistanceThreshold)
        goto LABEL_54;
      self->_subjectTooFarDistanceThresholdReached = 1;
    }
    backgroundShiftSumSmoothed = self->_backgroundShiftSumSmoothed;
    subjectTooFarBackgroundShiftSumTooLowThreshold = self->_subjectTooFarBackgroundShiftSumTooLowThreshold;
    if (self->_backgroundShiftSumTooLowThresholdReached)
    {
      if (backgroundShiftSumSmoothed > (float)(subjectTooFarBackgroundShiftSumTooLowThreshold
                                              * self->_subjectTooFarBackGroundShiftSumIsTooLowHysteresis))
      {
        v40 = 0;
LABEL_46:
        self->_backgroundShiftSumTooLowThresholdReached = v40;
        goto LABEL_49;
      }
      v40 = 1;
    }
    else
    {
      if (backgroundShiftSumSmoothed < subjectTooFarBackgroundShiftSumTooLowThreshold)
      {
        v40 = 1;
        goto LABEL_46;
      }
      v40 = 0;
    }
LABEL_49:
    self->_subjectIsTooFar = v40;
    jasperDistanceAtFocus = self->_jasperDistanceAtFocus;
    subjectTooFarDigitalFlashThreshold = self->_subjectTooFarDigitalFlashThreshold;
    if (jasperDistanceAtFocus <= subjectTooFarDigitalFlashThreshold)
    {
      if (self->_subjectIsTooFarDigitalFlash
        && jasperDistanceAtFocus <= (float)(subjectTooFarDigitalFlashThreshold
                                          - self->_stageTooFarDistanceThresholdHysteresis))
      {
        self->_subjectIsTooFarDigitalFlash = 0;
      }
    }
    else
    {
      self->_subjectIsTooFarDigitalFlash = 1;
    }
  }
LABEL_54:
  if (!self->_stageTooFarMonitoringEnabled)
    goto LABEL_73;
  self->_subjectIsTooFarForStage = 0;
  stageTooFarFocusDistanceThreshold = self->_stageTooFarFocusDistanceThreshold;
  if (self->_stageTooFarDistanceThresholdReached)
  {
    if (v20 <= (float)(stageTooFarFocusDistanceThreshold - self->_stageTooFarDistanceThresholdHysteresis))
    {
      self->_stageTooFarDistanceThresholdReached = 0;
      goto LABEL_73;
    }
  }
  else
  {
    if (v20 < stageTooFarFocusDistanceThreshold)
      goto LABEL_73;
    self->_stageTooFarDistanceThresholdReached = 1;
  }
  v44 = self->_backgroundShiftSumSmoothed;
  stageTooFarBackgroundShiftSumTooLowThreshold = self->_stageTooFarBackgroundShiftSumTooLowThreshold;
  if (self->_stageBackgroundShiftSumTooLowThresholdReached)
  {
    if (v44 > (float)(stageTooFarBackgroundShiftSumTooLowThreshold
                     * self->_stageTooFarBackGroundShiftSumIsTooLowHysteresis))
    {
      v46 = 0;
LABEL_65:
      self->_stageBackgroundShiftSumTooLowThresholdReached = v46;
      goto LABEL_68;
    }
    v46 = 1;
  }
  else
  {
    if (v44 < stageTooFarBackgroundShiftSumTooLowThreshold)
    {
      v46 = 1;
      goto LABEL_65;
    }
    v46 = 0;
  }
LABEL_68:
  self->_subjectIsTooFarForStage = v46;
  v47 = self->_jasperDistanceAtFocus;
  stageTooFarDigitalFlashThreshold = self->_stageTooFarDigitalFlashThreshold;
  if (v47 <= stageTooFarDigitalFlashThreshold)
  {
    if (self->_subjectIsTooFarForStageDigitalFlash
      && v47 <= (float)(stageTooFarDigitalFlashThreshold - self->_subjectTooFarDistanceThresholdHysteresis))
    {
      self->_subjectIsTooFarForStageDigitalFlash = 0;
    }
  }
  else
  {
    self->_subjectIsTooFarForStageDigitalFlash = 1;
  }
LABEL_73:
  if (self->_subjectTooCloseMonitoringEnabled && v26)
  {
    subjectTooCloseFocusDistanceThreshold = self->_subjectTooCloseFocusDistanceThreshold;
    if (self->_subjectIsTooClose)
    {
      if (v21 < (float)(subjectTooCloseFocusDistanceThreshold + self->_subjectTooCloseHysteresis))
        goto LABEL_83;
      v51 = 0;
    }
    else
    {
      if (v21 > subjectTooCloseFocusDistanceThreshold)
        goto LABEL_83;
      v51 = 1;
    }
    self->_subjectIsTooClose = v51;
  }
LABEL_83:
  if (!self->_sceneTooDarkMonitoringEnabled)
    goto LABEL_88;
  objc_msgSend(v18, "gain");
  if (v52 < self->_sceneTooDarkGainThreshold)
  {
LABEL_87:
    self->_sceneIsTooDark = 0;
    goto LABEL_88;
  }
  v53 = (float)objc_msgSend(v18, "aeAverage");
  v54 = v53 / (float)objc_msgSend(v18, "aeTarget");
  sceneTooDarkAEAverageAETargetFractionThreshold = self->_sceneTooDarkAEAverageAETargetFractionThreshold;
  if (self->_sceneIsTooDark)
  {
    if (v54 <= (float)(sceneTooDarkAEAverageAETargetFractionThreshold
                      * self->_sceneTooDarkAEAverageAETargetFractionThresholdHysteresisLag))
      goto LABEL_88;
    goto LABEL_87;
  }
  if (v54 < sceneTooDarkAEAverageAETargetFractionThreshold)
    self->_sceneIsTooDark = 1;
LABEL_88:
  v56 = self->_backgroundShiftSumSmoothed;
  stageTooFarBackgroundShiftSumNoFacesThreshold = self->_stageTooFarBackgroundShiftSumNoFacesThreshold;
  if (self->_stageTooFarBackgroundShiftSumNoFacesIsTooLow)
  {
    if (v56 > (float)(stageTooFarBackgroundShiftSumNoFacesThreshold
                     * self->_stageTooFarBackGroundShiftSumIsTooLowHysteresis))
    {
      v58 = 0;
LABEL_93:
      self->_stageTooFarBackgroundShiftSumNoFacesIsTooLow = v58;
      goto LABEL_96;
    }
    v58 = 1;
  }
  else
  {
    if (v56 < stageTooFarBackgroundShiftSumNoFacesThreshold)
    {
      v58 = 1;
      goto LABEL_93;
    }
    v58 = 0;
  }
LABEL_96:
  self->_subjectIsTooFarForStageNoFaces = v58;
  if (self->_stageFaceMonitoringEnabled)
  {
    stageFaceHasBeenSeen = self->_stageFaceHasBeenSeen;
    if (self->_stageFaceHasBeenSeen)
      stageFaceHasBeenSeen = self->_stageFaceNumberOfFramesSinceLastFace < self->_stageFaceNumberOfFramesSinceLastFaceThreshold;
  }
  else
  {
    stageFaceHasBeenSeen = 1;
  }
  if (self->_subjectIsTooClose)
  {
    v60 = 4;
    goto LABEL_102;
  }
  if (portraitSceneMonitoringRequiresStageThresholds)
  {
    if (stageFaceHasBeenSeen)
    {
      v61 = 2;
      v60 = 1;
      if (!self->_subjectIsTooFarForStage || v11)
        goto LABEL_103;
      v60 = 3;
    }
    else if (v58)
    {
      v60 = 3;
    }
    else
    {
      v60 = 1;
    }
    goto LABEL_102;
  }
  v70 = !self->_subjectIsTooFar || v11;
  v71 = v70 & stageFaceHasBeenSeen;
  if (v70)
    v60 = 1;
  else
    v60 = 3;
  if ((v71 & 1) == 0)
  {
LABEL_102:
    self->_stageFaceHasBeenSeen = 0;
    v61 = 1;
    goto LABEL_103;
  }
  v61 = 2;
  v60 = 1;
LABEL_103:
  if (v12)
    v62 = 1;
  else
    v62 = v61;
  if (v12)
    v63 = 1;
  else
    v63 = v60;
  v64 = !self->_sceneIsTooDark || v12;
  v65 = v64 | v11;
  if (self->_sceneIsTooDark)
  {
    v61 = v62;
    v60 = v63;
  }
  if (v65)
    v66 = v61;
  else
    v66 = 1;
  if (v65)
    v67 = v60;
  else
    v67 = 5;
  if (v11)
  {
    if (portraitSceneMonitoringRequiresStageThresholds)
    {
      v67 = self->_subjectIsTooFarForStageDigitalFlash ? 3 : v60;
      v66 = self->_subjectIsTooFarForStageDigitalFlash ? 1 : v61;
    }
    else
    {
      v67 = self->_subjectIsTooFarDigitalFlash ? 3 : v60;
      v66 = v61;
    }
    objc_msgSend(v18, "gain");
    if (v68 >= self->_sceneTooDarkGainThresholdHard)
    {
      v66 = 1;
      CMSetAttachment(a3, CFSTR("BWShallowDepthOfFieldEffectPreviewStatusOverride"), &unk_1E49F8FE8, 1u);
    }
  }
  if (!self->_focusIsStationaryBeyondThreshold || !self->_deliveryOfShiftsHasStarted)
  {
    v66 = 0;
    v67 = 0;
  }
  if (a10)
    *a10 = v67;
  if (a11)
    *a11 = v66;
  return 1;
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
