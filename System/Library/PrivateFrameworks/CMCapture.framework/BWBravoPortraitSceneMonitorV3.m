@implementation BWBravoPortraitSceneMonitorV3

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

- (BOOL)resolveSDOFStatusWithSampleBuffer:(opaqueCMSampleBuffer *)a3 frameStatisticsByPortType:(id)a4 sceneFlags:(unint64_t)a5 flashOrTorchWillBeActive:(BOOL)a6 digitalFlashWillFire:(BOOL)a7 thermalPressureLevel:(int)a8 peakPowerPressureLevel:(int)a9 effectStatus:(int *)a10 stagePreviewStatus:(int *)a11
{
  _BOOL4 v11;
  _BOOL4 v12;
  __int16 v13;
  _BOOL4 portraitSceneMonitoringRequiresStageThresholds;
  void *v18;
  void *v19;
  float v20;
  float v21;
  float v22;
  void *v23;
  int v24;
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
  uint64_t v60;
  int v61;
  _BOOL4 subjectIsTooFarForStageDigitalFlash;
  float v63;
  _BOOL4 v64;
  int autoSuggestMaxPeakPowerPressureLevel;
  int autoSuggestMaxThermalPressureLevel;
  unsigned int v69;

  v69 = 0;
  v11 = a7;
  v12 = a6;
  v13 = a5;
  portraitSceneMonitoringRequiresStageThresholds = self->_portraitSceneMonitoringRequiresStageThresholds;
  v18 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v19 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]));
  objc_msgSend(v19, "focusDistance");
  v21 = v20;
  if (self->_subjectTooCloseMonitoringForcingWideLens)
    objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A18]), "focusDistance");
  v22 = v20;
  v23 = (void *)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F10]);
  self->_jasperDistanceAtFocus = BWModifiedMovingAverage((float)(int)objc_msgSend((id)objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D07D50]), "intValue"), self->_jasperDistanceAtFocus, self->_jasperDistanceAtFocusSmoothingFactor);
  v24 = objc_msgSend(v19, "afStatus");
  v25 = objc_msgSend(v19, "afStatus") == 4 || objc_msgSend(v19, "afStatus") == 3;
  v26 = v24 == 4;
  objc_msgSend(v19, "focusingMethod");
  if (!FigCaptureStreamFocusingMethodIsPhaseDetectionBased())
    v25 = v26;
  v27 = self->_focusHasBeenAttainedAfterStart || v25;
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
  if (v25)
    v30 = self->_numFramesSinceFocusBecameStable + 1;
  else
    v30 = 0;
  self->_numFramesSinceFocusBecameStable = v30;
  sceneTooDarkGainThresholdHard = self->_sceneTooDarkGainThresholdHard;
  if ((sceneTooDarkGainThresholdHard == 0.0
     || (objc_msgSend(v19, "gain"),
         sceneTooDarkGainThresholdHard = self->_sceneTooDarkGainThresholdHard,
         v32 <= sceneTooDarkGainThresholdHard))
    && (sceneTooDarkGainThresholdHard != 0.0 || (objc_msgSend(v19, "gain"), v33 <= self->_sceneTooDarkGainThreshold)))
  {
    v34 = 40;
  }
  else
  {
    self->_numberOfFramesWithStableFocusThreshold = 0;
    self->_deliveryOfShiftsHasStarted = 1;
    v34 = 4;
  }
  if (!self->_focusIsStationaryBeyondThreshold && v25)
  {
    if (self->_numFramesSinceFocusBecameStable <= self->_numberOfFramesWithStableFocusThreshold)
    {
LABEL_30:
      v36 = 0;
      goto LABEL_33;
    }
  }
  else if (!self->_focusIsStationaryBeyondThreshold)
  {
    goto LABEL_30;
  }
  v36 = self->_numFramesSinceFocusFirstAttainedStability > v34;
LABEL_33:
  self->_focusIsStationaryBeyondThreshold = v36;
  if (v29)
    goto LABEL_82;
  self->_subjectIsTooFar = 0;
  if (self->_subjectTooFarMonitoringEnabled)
  {
    subjectTooFarFocusDistanceThreshold = self->_subjectTooFarFocusDistanceThreshold;
    if (self->_subjectTooFarDistanceThresholdReached)
    {
      if (v21 <= (float)(subjectTooFarFocusDistanceThreshold - self->_subjectTooFarDistanceThresholdHysteresis))
      {
        self->_subjectTooFarDistanceThresholdReached = 0;
        goto LABEL_53;
      }
    }
    else
    {
      if (v21 < subjectTooFarFocusDistanceThreshold)
        goto LABEL_53;
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
LABEL_45:
        self->_backgroundShiftSumTooLowThresholdReached = v40;
        goto LABEL_48;
      }
      v40 = 1;
    }
    else
    {
      if (backgroundShiftSumSmoothed < subjectTooFarBackgroundShiftSumTooLowThreshold)
      {
        v40 = 1;
        goto LABEL_45;
      }
      v40 = 0;
    }
LABEL_48:
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
LABEL_53:
  self->_subjectIsTooFarForStage = 0;
  if (!self->_stageTooFarMonitoringEnabled)
    goto LABEL_72;
  stageTooFarFocusDistanceThreshold = self->_stageTooFarFocusDistanceThreshold;
  if (self->_stageTooFarDistanceThresholdReached)
  {
    if (v21 <= (float)(stageTooFarFocusDistanceThreshold - self->_stageTooFarDistanceThresholdHysteresis))
    {
      self->_stageTooFarDistanceThresholdReached = 0;
      goto LABEL_72;
    }
  }
  else
  {
    if (v21 < stageTooFarFocusDistanceThreshold)
      goto LABEL_72;
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
LABEL_64:
      self->_stageBackgroundShiftSumTooLowThresholdReached = v46;
      goto LABEL_67;
    }
    v46 = 1;
  }
  else
  {
    if (v44 < stageTooFarBackgroundShiftSumTooLowThreshold)
    {
      v46 = 1;
      goto LABEL_64;
    }
    v46 = 0;
  }
LABEL_67:
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
LABEL_72:
  if (self->_subjectTooCloseMonitoringEnabled && v25)
  {
    subjectTooCloseFocusDistanceThreshold = self->_subjectTooCloseFocusDistanceThreshold;
    if (self->_subjectIsTooClose)
    {
      if (v22 < (float)(subjectTooCloseFocusDistanceThreshold + self->_subjectTooCloseHysteresis))
        goto LABEL_82;
      v51 = 0;
    }
    else
    {
      if (v22 > subjectTooCloseFocusDistanceThreshold)
        goto LABEL_82;
      v51 = 1;
    }
    self->_subjectIsTooClose = v51;
  }
LABEL_82:
  if (!self->_sceneTooDarkMonitoringEnabled)
    goto LABEL_90;
  objc_msgSend(v19, "gain");
  if ((v13 & 0x800) == 0 && v52 < self->_sceneTooDarkGainThreshold)
  {
    if (!self->_sceneIsTooDark)
      goto LABEL_90;
LABEL_89:
    self->_sceneIsTooDark = 0;
    goto LABEL_90;
  }
  v53 = (float)objc_msgSend(v19, "aeAverage");
  v54 = v53 / (float)objc_msgSend(v19, "aeTarget");
  sceneTooDarkAEAverageAETargetFractionThreshold = self->_sceneTooDarkAEAverageAETargetFractionThreshold;
  if (self->_sceneIsTooDark)
  {
    if (v54 <= (float)(sceneTooDarkAEAverageAETargetFractionThreshold
                      * self->_sceneTooDarkAEAverageAETargetFractionThresholdHysteresisLag))
      goto LABEL_90;
    goto LABEL_89;
  }
  if (v54 < sceneTooDarkAEAverageAETargetFractionThreshold)
    self->_sceneIsTooDark = 1;
LABEL_90:
  v56 = self->_backgroundShiftSumSmoothed;
  stageTooFarBackgroundShiftSumNoFacesThreshold = self->_stageTooFarBackgroundShiftSumNoFacesThreshold;
  if (self->_stageTooFarBackgroundShiftSumNoFacesIsTooLow)
  {
    if (v56 > (float)(stageTooFarBackgroundShiftSumNoFacesThreshold
                     * self->_stageTooFarBackGroundShiftSumIsTooLowHysteresis))
    {
      v58 = 0;
LABEL_95:
      self->_stageTooFarBackgroundShiftSumNoFacesIsTooLow = v58;
      goto LABEL_98;
    }
    v58 = 1;
  }
  else
  {
    if (v56 < stageTooFarBackgroundShiftSumNoFacesThreshold)
    {
      v58 = 1;
      goto LABEL_95;
    }
    v58 = 0;
  }
LABEL_98:
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
LABEL_111:
    v69 = v60;
    goto LABEL_112;
  }
  if (!portraitSceneMonitoringRequiresStageThresholds)
  {
    if (!self->_subjectIsTooFar)
      goto LABEL_166;
    goto LABEL_109;
  }
  if (!stageFaceHasBeenSeen)
  {
    if (!v58)
      goto LABEL_166;
LABEL_110:
    v60 = 3;
    goto LABEL_111;
  }
  if (self->_subjectIsTooFarForStage)
  {
LABEL_109:
    if (v11)
      goto LABEL_166;
    goto LABEL_110;
  }
LABEL_166:
  v60 = 1;
  v69 = 1;
  if (stageFaceHasBeenSeen)
  {
    v61 = 2;
    goto LABEL_113;
  }
LABEL_112:
  self->_stageFaceHasBeenSeen = 0;
  v61 = 1;
LABEL_113:
  if (self->_sceneIsTooDark && !v12 && !v11)
  {
    v60 = 5;
LABEL_120:
    v69 = v60;
    v61 = 1;
    subjectIsTooFarForStageDigitalFlash = 1;
    goto LABEL_121;
  }
  subjectIsTooFarForStageDigitalFlash = 0;
  if (self->_sceneIsTooDark && v12)
  {
    v60 = 1;
    goto LABEL_120;
  }
LABEL_121:
  if (v11)
  {
    if (portraitSceneMonitoringRequiresStageThresholds)
    {
      if (self->_subjectIsTooFarForStageDigitalFlash)
        v60 = 3;
      else
        v60 = v60;
      subjectIsTooFarForStageDigitalFlash = self->_subjectIsTooFarForStageDigitalFlash;
      if (self->_subjectIsTooFarForStageDigitalFlash)
        v61 = 1;
    }
    else if (self->_subjectIsTooFarDigitalFlash)
    {
      v60 = 3;
    }
    else
    {
      v60 = v60;
    }
    v69 = v60;
    objc_msgSend(v19, "gain");
    if (v63 >= self->_sceneTooDarkGainThresholdHard)
    {
      v61 = 1;
      CMSetAttachment(a3, CFSTR("BWShallowDepthOfFieldEffectPreviewStatusOverride"), &unk_1E49F8190, 1u);
      subjectIsTooFarForStageDigitalFlash = 1;
    }
  }
  if (!self->_stageSegmentationMonitoringEnabled)
    goto LABEL_142;
  if ((_DWORD)v60 != 1)
  {
    if ((_DWORD)v60 != 3)
      goto LABEL_140;
    v69 = 1;
  }
  v60 = 1;
  if (self->_personSegmentationStatusEnabled)
    v61 = 2;
  else
    v61 = 1;
LABEL_140:
  if (subjectIsTooFarForStageDigitalFlash)
    v61 = 1;
LABEL_142:
  if (!self->_autoSuggestEnabled)
  {
    if (!self->_focusIsStationaryBeyondThreshold || !self->_deliveryOfShiftsHasStarted)
    {
      v60 = 0;
      v61 = 0;
      v69 = 0;
    }
    goto LABEL_157;
  }
  v64 = -[BWPortraitAutoSuggest runAutoSuggestionWithSampleBuffer:portraitSceneMonitorStatus:](self->_autoSuggestMonitor, "runAutoSuggestionWithSampleBuffer:portraitSceneMonitorStatus:", a3, &v69);
  autoSuggestMaxThermalPressureLevel = self->_autoSuggestMaxThermalPressureLevel;
  autoSuggestMaxPeakPowerPressureLevel = self->_autoSuggestMaxPeakPowerPressureLevel;
  if (autoSuggestMaxThermalPressureLevel >= a8 && autoSuggestMaxPeakPowerPressureLevel >= a9
    || v69 > 0xE
    || ((1 << v69) & 0x7A02) == 0)
  {
    goto LABEL_145;
  }
  if (autoSuggestMaxThermalPressureLevel < a8)
  {
    v60 = 6;
    goto LABEL_156;
  }
  if (autoSuggestMaxPeakPowerPressureLevel >= a9)
  {
LABEL_145:
    if (!v64)
      return v64;
    v60 = v69;
    goto LABEL_157;
  }
  v60 = 15;
LABEL_156:
  v69 = v60;
  if (!v64)
  {
    LOBYTE(v64) = 0;
    return v64;
  }
LABEL_157:
  CMSetAttachment(a3, CFSTR("SDOFEffectStatus"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v60), 1u);
  if (a10)
    *a10 = v69;
  if (a11)
    *a11 = v61;
  LOBYTE(v64) = 1;
  return v64;
}

- (float)zoomFactorForTuningParameters
{
  return self->_zoomFactorForTuningParameters;
}

- (float)focusDistanceToMaxAllowedFocusDistanceRatio
{
  return 0.0;
}

- (BOOL)portraitSceneMonitoringRequiresStageThresholds
{
  return self->_portraitSceneMonitoringRequiresStageThresholds;
}

- (BWBravoPortraitSceneMonitorV3)initWithTuningParameters:(id)a3 zoomFactor:(float)a4 portraitAutoSuggestEnabled:(BOOL)a5 shallowDepthOfFieldEnabled:(BOOL)a6 attachDebugFrameStatistics:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL4 v8;
  BWBravoPortraitSceneMonitorV3 *v11;
  BWBravoPortraitSceneMonitorV3 *v12;
  BWPortraitAutoSuggest *v13;
  objc_super v15;

  v7 = a6;
  v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BWBravoPortraitSceneMonitorV3;
  v11 = -[BWBravoPortraitSceneMonitorV3 init](&v15, sel_init, a3, a5, a6, a7);
  v12 = v11;
  if (v11)
  {
    v11->_numberOfFramesWithStableFocusThreshold = 3;
    v11->_subjectTooCloseMonitoringEnabled = 1;
    v11->_subjectTooCloseMonitoringForcingWideLens = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ForceWideLensForTooCloseGating")), "BOOLValue");
    v12->_subjectTooCloseHysteresis = 2.0;
    v12->_subjectTooFarMonitoringEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SubjectTooFarMonitoringEnabled")), "BOOLValue");
    v12->_subjectTooFarDistanceThresholdReached = 0;
    v12->_subjectTooFarDistanceThresholdHysteresis = 10.0;
    v12->_backgroundShiftSumTooLowThresholdReached = 0;
    *(_WORD *)&v12->_subjectIsTooFarDigitalFlash = 0;
    *(_QWORD *)&v12->_subjectTooFarBackGroundShiftSumIsTooLowHysteresis = 1066192077;
    v12->_jasperDistanceAtFocusSmoothingFactor = 0.05;
    v12->_backgroundShiftSumSmoothingTrendUpdateFactor = 0.025;
    *(_QWORD *)&v12->_backgroundShiftSumSmoothingTrend = 0x3D8F5C2900000000;
    v12->_invalidShiftRatioSmoothingFactor = 0.025;
    v12->_sceneTooDarkMonitoringEnabled = 1;
    v12->_stageFaceMonitoringEnabled = 1;
    v12->_stageTooFarMonitoringEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SubjectTooFarMonitoringEnabled")), "BOOLValue");
    v12->_stageTooFarDistanceThresholdReached = 0;
    v12->_stageTooFarDistanceThresholdHysteresis = 10.0;
    v12->_stageBackgroundShiftSumTooLowThresholdReached = 0;
    v12->_stageTooFarBackgroundShiftSumNoFacesIsTooLow = 0;
    v12->_stageFaceNumberOfFramesSinceLastFaceThreshold = 6;
    v12->_stageTooFarBackGroundShiftSumIsTooLowHysteresis = 1.15;
    v12->_stageSegmentationMonitoringEnabled = 0;
    v12->_personSegmentationRatioThreshold = 0.1;
    *(_QWORD *)&v12->_autoSuggestMaxThermalPressureLevel = 0x200000002;
    -[BWBravoPortraitSceneMonitorV3 updateTuningParameters:zoomFactor:](v12, "updateTuningParameters:zoomFactor:", a3, COERCE_DOUBLE(LODWORD(a4) | 0x200000000));
    v12->_deliveryOfShiftsHasStarted = 0;
    v12->_sceneIsTooDark = 0;
    v12->_subjectIsTooClose = 0;
    v12->_focusHasBeenAttainedAfterStart = 0;
    v12->_numFramesSinceFocusFirstAttainedStability = 0;
    v12->_autoSuggestEnabled = v8;
    if (!v8)
    {
LABEL_5:
      v12->_focusIsStationaryBeyondThreshold = 0;
      -[BWBravoPortraitSceneMonitorV3 setShallowDepthOfFieldRenderingEnabled:](v12, "setShallowDepthOfFieldRenderingEnabled:", v7);
      return v12;
    }
    v13 = -[BWPortraitAutoSuggest initWithTuningParameters:]([BWPortraitAutoSuggest alloc], "initWithTuningParameters:", a3);
    v12->_autoSuggestMonitor = v13;
    if (v13)
    {
      -[BWPortraitAutoSuggest setPortTypeIsFFC:](v13, "setPortTypeIsFFC:", 0);
      goto LABEL_5;
    }
  }
  return v12;
}

- (void)updateTuningParameters:(id)a3 zoomFactor:(float)a4
{
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;

  if (a3)
  {
    if (a4 != 0.0)
    {
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooCloseFocusDistanceThreshold")), "floatValue");
      self->_subjectTooCloseFocusDistanceThreshold = v7;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooFarFocusDistanceThreshold")), "floatValue");
      self->_subjectTooFarFocusDistanceThreshold = v8;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("BackgroundShiftSumTooLowThreshold")), "floatValue");
      self->_subjectTooFarBackgroundShiftSumTooLowThreshold = v9;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooFarJasperDistanceThreshold")), "floatValue");
      self->_subjectTooFarDigitalFlashThreshold = v10;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StageTooFarJasperDistanceThreshold")), "floatValue");
      self->_stageTooFarDigitalFlashThreshold = v11;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooDarkGainThresholdHard")), "floatValue");
      self->_sceneTooDarkGainThresholdHard = v12;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooDarkGainThreshold")), "floatValue");
      self->_sceneTooDarkGainThreshold = v13;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooDarkAEAverageAETargetFractionThreshold")), "floatValue");
      self->_sceneTooDarkAEAverageAETargetFractionThreshold = v14;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooDarkAEAverageAETargetFractionThresholdHysteresisLag")), "floatValue");
      self->_sceneTooDarkAEAverageAETargetFractionThresholdHysteresisLag = v15;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StageTooFarFocusDistanceThreshold")), "floatValue");
      self->_stageTooFarFocusDistanceThreshold = v16;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StageBackgroundShiftSumTooLowThreshold")), "floatValue");
      self->_stageTooFarBackgroundShiftSumTooLowThreshold = v17;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StageTooFarBackgroundShiftSumNoFacesThreshold")), "floatValue");
      self->_stageTooFarBackgroundShiftSumNoFacesThreshold = v18;
      self->_zoomFactorForTuningParameters = a4;
    }
  }
}

- (void)setShallowDepthOfFieldRenderingEnabled:(BOOL)a3
{
  -[BWPortraitAutoSuggest setShallowDepthOfFieldRenderingEnabled:](self->_autoSuggestMonitor, "setShallowDepthOfFieldRenderingEnabled:", a3);
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  -[BWPortraitAutoSuggest dealloc](self->_autoSuggestMonitor, "dealloc");
  v3.receiver = self;
  v3.super_class = (Class)BWBravoPortraitSceneMonitorV3;
  -[BWBravoPortraitSceneMonitorV3 dealloc](&v3, sel_dealloc);
}

- (BOOL)shallowDepthOfFieldRenderingEnabled
{
  return -[BWPortraitAutoSuggest shallowDepthOfFieldRenderingEnabled](self->_autoSuggestMonitor, "shallowDepthOfFieldRenderingEnabled");
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
  float v16;
  BOOL v17;
  BOOL v19;
  NSArray *v20;
  int v21;

  self->_invalidShiftRatioSmoothed = BWModifiedMovingAverage(a4, self->_invalidShiftRatioSmoothed, self->_invalidShiftRatioSmoothingFactor);
  v16 = BWModifiedMovingAverage(a11, self->_personSegmentationRatioSmoothed, 0.35);
  self->_personSegmentationRatioSmoothed = v16;
  if (self->_personSegmentationStatusEnabled)
    v17 = v16 >= self->_personSegmentationRatioThreshold;
  else
    v17 = self->_personSegmentationRatioThreshold * 1.2 <= v16;
  self->_personSegmentationStatusEnabled = v17;
  -[BWBravoPortraitSceneMonitorV3 doubleExponentialSmoothing:smoothValue:trendValue:dataFactor:trendFactor:]((uint64_t)self, &self->_backgroundShiftSumSmoothed, &self->_backgroundShiftSumSmoothingTrend, a3, self->_backgroundShiftSumSmoothingFactor, self->_backgroundShiftSumSmoothingTrendUpdateFactor);
  v19 = a4 < 0.9 || self->_deliveryOfShiftsHasStarted;
  self->_deliveryOfShiftsHasStarted = v19;

  v20 = (NSArray *)objc_msgSend(a10, "copy");
  self->_stageMostRecentFaces = v20;
  self->_stageFaceHasBeenSeen |= -[NSArray count](v20, "count") != 0;
  if (-[NSArray count](self->_stageMostRecentFaces, "count"))
    v21 = 0;
  else
    v21 = self->_stageFaceNumberOfFramesSinceLastFace + 1;
  self->_stageFaceNumberOfFramesSinceLastFace = v21;
}

- (float)doubleExponentialSmoothing:(float *)a3 smoothValue:(float)result trendValue:(float)a5 dataFactor:(float)a6 trendFactor:
{
  float v6;

  if (a1)
  {
    result = (float)(result * a5) + (1.0 - a5) * (float)(*a2 + *a3);
    v6 = (float)((float)(result - *a2) * a6) + (1.0 - a6) * *a3;
    *a3 = v6;
    *a2 = result;
  }
  return result;
}

- (void)setPortraitSceneMonitoringRequiresStageThresholds:(BOOL)a3
{
  self->_portraitSceneMonitoringRequiresStageThresholds = a3;
}

@end
