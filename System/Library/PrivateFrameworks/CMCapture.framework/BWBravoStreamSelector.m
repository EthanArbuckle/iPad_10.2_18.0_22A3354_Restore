@implementation BWBravoStreamSelector

- (float)wideToSuperWideFocusDistance
{
  return self->_wideToSuperWideFocusDistance;
}

- (float)superWideToWideFocusDistance
{
  return self->_superWideToWideFocusDistance;
}

- (BWBravoStreamSelector)initWithStreamSelectionAttributes:(id)a3 wideStream:(id)a4 teleStream:(id)a5 superWideStream:(id)a6 cameraCalibrationValid:(BOOL)a7
{
  char *v11;
  int v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  float v17;
  float v18;
  void *v19;
  float v20;
  float v21;
  int v22;
  int v23;
  int v24;
  void *v25;
  float v26;
  float v27;
  void *v28;
  float v29;
  float v30;
  float v31;
  int v32;
  int v33;
  int v34;
  int v35;
  float v36;
  BOOL v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  objc_super v45;

  v45.receiver = self;
  v45.super_class = (Class)BWBravoStreamSelector;
  v11 = -[BWBravoStreamSelector init](&v45, sel_init, a3, a4, a5, a6, a7);
  if (v11)
  {
    *((_QWORD *)v11 + 1) = a4;
    *((_QWORD *)v11 + 2) = a5;
    *((_QWORD *)v11 + 3) = a6;
    *(_OWORD *)(v11 + 168) = xmmword_1A32A20E0;
    *(_OWORD *)(v11 + 184) = *(_OWORD *)(v11 + 168);
    *((_DWORD *)v11 + 50) = 0;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("minFocusDistanceChange")), "floatValue");
    *((_DWORD *)v11 + 88) = v12;
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if (a4 && a5)
    {
      objc_msgSend(v13, "addObject:", objc_msgSend(a4, "portType"));
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("wideToTeleFocusDistance")), "floatValue");
      *((_DWORD *)v11 + 15) = v14;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("teleToWideFocusDistance")), "floatValue");
      *((_DWORD *)v11 + 14) = v15;
      v16 = (void *)objc_msgSend(a5, "stream");
      objc_msgSend((id)objc_msgSend(v16, "getPropertyIfSupported:error:", *MEMORY[0x1E0D076B0], 0), "floatValue");
      v18 = v17;
      v19 = (void *)objc_msgSend(a5, "stream");
      objc_msgSend((id)objc_msgSend(v19, "getPropertyIfSupported:error:", *MEMORY[0x1E0D076A8], 0), "floatValue");
      if (v18 > v20)
        v20 = v18;
      v21 = v20 * 1.1;
      if (v21 > 0.0)
      {
        *((float *)v11 + 14) = v21 - (float)(*((float *)v11 + 15) - *((float *)v11 + 14));
        *((float *)v11 + 15) = v21;
      }
    }
    v22 = objc_msgSend(a6, "hasFocus");
    if (a4 && v22)
    {
      objc_msgSend(v13, "addObject:", objc_msgSend(a6, "portType"));
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("superWideMaximumAETargetOffset")), "floatValue");
      *((_DWORD *)v11 + 21) = v23;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("superWideMaximumAETargetOffsetHysteresisLag")), "floatValue");
      *((_DWORD *)v11 + 22) = v24;
      *((_DWORD *)v11 + 24) = 10;
      v11[100] = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("superWideAllowedInAutoFlashScenes")), "BOOLValue");
      v25 = (void *)objc_msgSend(a4, "stream");
      objc_msgSend((id)objc_msgSend(v25, "getPropertyIfSupported:error:", *MEMORY[0x1E0D076B0], 0), "floatValue");
      v27 = v26;
      v28 = (void *)objc_msgSend(a4, "stream");
      objc_msgSend((id)objc_msgSend(v28, "getPropertyIfSupported:error:", *MEMORY[0x1E0D076A8], 0), "floatValue");
      if (v27 > v29)
        v29 = v27;
      v30 = v29 * 1.1;
      if (v30 == 0.0)
        v30 = 12.0;
      *((float *)v11 + 19) = v30;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("superWideToWideHysteresisLag")), "floatValue");
      *((float *)v11 + 20) = v31 + *((float *)v11 + 19);
      v11[380] = 1;
      *((_DWORD *)v11 + 104) = 1000;
    }
    *((_QWORD *)v11 + 40) = objc_msgSend(v13, "copy");
    *((_QWORD *)v11 + 41) = objc_msgSend(v13, "copy");
    *((_DWORD *)v11 + 78) = 0;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("gainHysteresisLag")), "floatValue");
    *((_DWORD *)v11 + 9) = v32;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("minLuxLevelChange")), "floatValue");
    *((_DWORD *)v11 + 84) = v33;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("maxLuxLevelForSceneChangeMonitoring")), "floatValue");
    *((_DWORD *)v11 + 85) = v34;
    *((_DWORD *)v11 + 16) = 2;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("minTeleToWideEITThresholdPercentage")), "floatValue");
    *((_DWORD *)v11 + 12) = v35;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("maxTeleToWideEITThresholdPercentage")), "floatValue");
    *((float *)v11 + 13) = v36;
    v37 = v36 > 0.0 && *((float *)v11 + 12) > 0.0;
    v11[40] = v37;
    *((_DWORD *)v11 + 17) = 2;
    v11[72] = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("teleSwitchBasedOnExposureAndFocusTargetOffsetEnabled")), "BOOLValue");
    *((_QWORD *)v11 + 53) = 0x3FB333333F4CCCCDLL;
    v38 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("digitalFlash"));
    objc_msgSend((id)objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("minTeleToWideEITThreshold")), "doubleValue");
    *((_QWORD *)v11 + 13) = v39;
    objc_msgSend((id)objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("maxTeleToWideEITThreshold")), "doubleValue");
    *((_QWORD *)v11 + 14) = v40;
    objc_msgSend((id)objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("minTeleToWideEITThresholdWithHumansPresent")), "doubleValue");
    *((_QWORD *)v11 + 15) = v41;
    objc_msgSend((id)objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("maxTeleToWideEITThresholdWithHumansPresent")), "doubleValue");
    *((_QWORD *)v11 + 16) = v42;
    *((_DWORD *)v11 + 34) = 2;
    objc_msgSend((id)objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("minEITPercentageChange")), "doubleValue");
    *((_QWORD *)v11 + 43) = v43;
    v11[140] = 0;
    v11[248] = 0;
    v11[141] = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("autoFocusRecommendedMasterPortTypeEnabled")), "BOOLValue");
    v11[142] = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("autoFocusRecommendedMasterPortTypeEnabled")), "BOOLValue");
    *((_DWORD *)v11 + 36) = 2;
  }
  return (BWBravoStreamSelector *)v11;
}

- (BWFigVideoCaptureStream)slaveStreamBlockingFocusAndExposureStability
{
  return self->_slaveStreamBlockingFocusAndExposureStability;
}

- (NSArray)eligibleFallbackPortTypes
{
  os_unfair_lock_s *p_eligibleFallbackPortTypesLock;
  NSArray *v4;

  p_eligibleFallbackPortTypesLock = &self->_eligibleFallbackPortTypesLock;
  os_unfair_lock_lock(&self->_eligibleFallbackPortTypesLock);
  v4 = self->_eligibleFallbackPortTypes;
  os_unfair_lock_unlock(p_eligibleFallbackPortTypesLock);
  return v4;
}

- (void)setTeleMaxAEGain:(float)a3
{
  if (self->_teleMaxAEGain < a3)
    self->_sceneChangeDetected = 1;
  self->_teleMaxAEGain = a3;
}

- (void)resetWithZoomFactor:(float)a3 currentMasterStream:(id)a4
{
  BWFigVideoCaptureStream *teleStream;
  float v7;
  float v8;

  self->_currentMasterStream = (BWFigVideoCaptureStream *)a4;
  self->_recommendedMasterStream = (BWFigVideoCaptureStream *)a4;
  self->_preferredMasterStreamIgnoringEligibleFallbackPortTypes = (BWFigVideoCaptureStream *)a4;
  self->_previousZoomFactor = a3;
  self->_timeOfLastZoomFactorChange = 0;
  self->_resetSceneChangeMonitoring = 0;
  *(_QWORD *)&self->_teleMaxGainReachedCounter = 0;
  self->_timeOfLastFocusModeChange = 0;
  self->_timeOfLastExposureModeChange = 0;
  self->_waitingForSlaveFocusAfterZoomChange = 0;
  teleStream = self->_teleStream;
  if (teleStream && (-[BWFigVideoCaptureStream baseZoomFactor](teleStream, "baseZoomFactor"), v7 <= a3)
    || self->_superWideStream
    && (-[BWFigVideoCaptureStream baseZoomFactor](self->_wideStream, "baseZoomFactor"), v8 <= a3))
  {
    self->_sceneChangeDetected = 1;
  }
}

- (void)focusModeDidChange
{
  self->_timeOfLastFocusModeChange = mach_absolute_time();
}

- (void)exposureModeDidChange
{
  self->_timeOfLastExposureModeChange = mach_absolute_time();
}

- (uint64_t)_updateStateWithFrameStatisticsByPortType:(void *)a3 detectedObjects:
{
  uint64_t v4;
  void *v5;
  float v6;
  int v7;
  double v8;
  void *v9;
  uint64_t v10;
  int v11;

  if (result)
  {
    v4 = result;
    result = *(_QWORD *)(result + 16);
    if (result)
    {
      v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend((id)result, "portType"));
      objc_msgSend(v5, "gain");
      if (v6 >= *(float *)(v4 + 32))
        v7 = *(_DWORD *)(v4 + 300) + 1;
      else
        v7 = 0;
      *(_DWORD *)(v4 + 300) = v7;
      result = objc_msgSend(v5, "aeLimitsReached");
      if ((result & 1) != 0
        || (result = objc_msgSend(v5, "eit"), v8 >= (float)((float)(*(float *)(v4 + 44) * *(float *)(v4 + 52)) / 100.0)))
      {
        ++*(_DWORD *)(v4 + 304);
        if (!a3)
        {
LABEL_14:
          *(_DWORD *)(v4 + 308) = 0;
          return result;
        }
LABEL_12:
        v9 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D064A0]);
        v10 = *MEMORY[0x1E0D064D0];
        v11 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D064D0]), "count");
        result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D06498]), "objectForKeyedSubscript:", v10), "count");
        if ((int)result + v11 >= 1)
        {
          ++*(_DWORD *)(v4 + 308);
          return result;
        }
        goto LABEL_14;
      }
      *(_DWORD *)(v4 + 304) = 0;
    }
    if (!a3)
      goto LABEL_14;
    goto LABEL_12;
  }
  return result;
}

- (void)setEligibleFallbackPortTypes:(id)a3
{
  os_unfair_lock_s *p_eligibleFallbackPortTypesLock;

  p_eligibleFallbackPortTypesLock = &self->_eligibleFallbackPortTypesLock;
  os_unfair_lock_lock(&self->_eligibleFallbackPortTypesLock);

  self->_eligibleFallbackPortTypes = (NSArray *)objc_msgSend(a3, "copy");
  os_unfair_lock_unlock(p_eligibleFallbackPortTypesLock);
}

- (BWFigVideoCaptureStream)preferredMasterStreamIgnoringEligibleFallbackPortTypes
{
  return self->_preferredMasterStreamIgnoringEligibleFallbackPortTypes;
}

- (int)lastSelectionReason
{
  return self->_lastSelectionReason;
}

- ($06E035DAA80D7DA92D7AC3530BEA5F2A)selectionConfiguration
{
  os_unfair_lock_s *p_pendingSelectionConfigurationLock;
  unint64_t restrictedSelectionConditions;
  int64_t selectionBehavior;
  int64_t v6;
  unint64_t v7;
  $06E035DAA80D7DA92D7AC3530BEA5F2A result;

  p_pendingSelectionConfigurationLock = &self->_pendingSelectionConfigurationLock;
  os_unfair_lock_lock(&self->_pendingSelectionConfigurationLock);
  selectionBehavior = self->_pendingSelectionConfiguration.selectionBehavior;
  restrictedSelectionConditions = self->_pendingSelectionConfiguration.restrictedSelectionConditions;
  os_unfair_lock_unlock(p_pendingSelectionConfigurationLock);
  v6 = selectionBehavior;
  v7 = restrictedSelectionConditions;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (uint64_t)_selectionBehaviorAllowsSwitchOverTo:(void *)a3 forFrameStatisticsByPortType:(_BYTE *)a4 zoomFactor:blockedByExposureFocusStability:debugOverlayInfo:
{
  uint64_t v7;
  int v8;
  int v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  int v14;
  char v15;
  _BOOL4 v16;
  void *v17;
  int v18;

  if (!result)
    return result;
  v7 = result;
  v8 = -[BWBravoStreamSelector _exposureAndFocusStableForSwitchOverTo:forFrameStatisticsByPortType:debugOverlayInfo:](result, (uint64_t)a2, a3);
  v9 = -[BWBravoStreamSelector _exposureAllowsSwitchToRecommendedMasterStream:frameStatisticsByPortType:](v7, (uint64_t)a2, a3);
  v10 = v9
     && *(void **)(v7 + 16) == a2
     && *(_BYTE *)(v7 + 72)
     && (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(a2, "portType")), "filteredLogicalFocusLensPositionStep") < 4;
  v11 = *(_QWORD *)(v7 + 168);
  if (v11 != 2)
  {
    if (v11 == 1)
    {
      mach_absolute_time();
      v12 = FigHostTimeToNanoseconds();
      if (*(uint64_t *)(v7 + 256) > 0 && v12 < 200000000)
        v14 = v9;
      else
        v14 = 0;
      result = v14 | v8 | v10;
      v15 = (v14 | v8 | v10) ^ 1;
      if (!a4)
        return result;
    }
    else
    {
      v15 = 0;
      result = 0;
      if (!a4)
        return result;
    }
LABEL_23:
    *a4 = v15;
    return result;
  }
  v16 = -[BWBravoStreamSelector _conditionsAllowSwitchToRecommendedMasterStream:debugOverlayInfo:](v7, a2);
  v17 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(a2, "portType"));
  if (objc_msgSend(a2, "hasFocus"))
    v18 = -[BWBravoStreamSelector _focusIsStable:](v7, v17);
  else
    v18 = 1;
  result = v9 & v16 & v18;
  v15 = v16 & (result ^ 1);
  *(_BYTE *)(v7 + 296) = v15;
  if (a4)
    goto LABEL_23;
  return result;
}

- (uint64_t)_exposureAllowsSwitchToRecommendedMasterStream:(void *)a3 frameStatisticsByPortType:
{
  uint64_t v4;
  int v5;
  float v6;

  if (result)
  {
    v4 = result;
    if (*(_QWORD *)(result + 16) == a2 || *(_QWORD *)(result + 24) == a2)
    {
      v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(*(id *)(result + 152), "portType")), "aeTarget");
      v6 = (float)(int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(*(id *)(v4 + 152), "portType")), "aeAverage");
      return (float)(*(float *)(v4 + 424) * (float)v5) <= v6 && (float)(*(float *)(v4 + 428) * (float)v5) >= v6;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (uint64_t)_exposureAndFocusStableForSwitchOverTo:(uint64_t)a1 forFrameStatisticsByPortType:(uint64_t)a2 debugOverlayInfo:(void *)a3
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;

  if (!a1)
    return 0;
  v6 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 24), "portType"));
  v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 8), "portType"));
  v8 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 16), "portType"));
  v9 = objc_msgSend(v7, "aeStable");
  v10 = objc_msgSend(v8, "aeStable");
  v11 = -[BWBravoStreamSelector _focusIsStable:](a1, v6);
  v12 = -[BWBravoStreamSelector _focusIsStable:](a1, v7);
  v13 = -[BWBravoStreamSelector _focusIsStable:](a1, v8);
  v14 = *(_QWORD *)(a1 + 152);
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 8);
  if (v14 == v15)
  {
    if (v16 == a2)
    {
      return v12 & v11;
    }
    else if (*(_QWORD *)(a1 + 16) == a2)
    {
      return v10 & v13 & v12;
    }
    else if (v14 == a2)
    {
      return v11;
    }
    else
    {
      return 0;
    }
  }
  else if (v14 == v16)
  {
    if (*(_QWORD *)(a1 + 16) == a2)
    {
      return v9 & v10 & v12 & v13;
    }
    else if (v15 != a2)
    {
      if (v14 == a2)
        return v12;
      else
        return 0;
    }
  }
  else if (v16 == a2)
  {
    return v12;
  }
  else if (v15 != a2)
  {
    if (*(_QWORD *)(a1 + 16) == a2)
      v17 = v10;
    else
      v17 = 0;
    return v17 & v13;
  }
  return v11;
}

- (uint64_t)_updateSuperWideFocusIsStableOnceWithFrameStatisticsByPortType:(uint64_t)result
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  _OWORD *v6;
  OpaqueCMClock *v7;
  int v8;
  OpaqueCMClock *HostTimeClock;
  CMTime time2;
  CMTime lhs;
  CMTime time1;
  CMTime rhs;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (result)
  {
    v2 = result;
    if (!*(_BYTE *)(result + 420))
    {
      v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(*(id *)(result + 24), "portType"));
      v4 = v3;
      if (!*(_BYTE *)(v2 + 412))
      {
        if (v3)
        {
          objc_msgSend(v3, "pts");
          if ((v15 & 0x100000000) != 0)
          {
            v6 = (_OWORD *)(v2 + 384);
            if ((*(_BYTE *)(v2 + 396) & 1) != 0)
            {
              v8 = *(_DWORD *)(v2 + 408);
              if (v8 != objc_msgSend(v4, "logicalFocusLensPosition")
                || (HostTimeClock = CMClockGetHostTimeClock(),
                    CMClockGetTime(&lhs, HostTimeClock),
                    *(_OWORD *)&rhs.value = *v6,
                    rhs.epoch = *(_QWORD *)(v2 + 400),
                    CMTimeSubtract(&time1, &lhs, &rhs),
                    CMTimeMake(&time2, *(unsigned int *)(v2 + 416), 1000),
                    CMTimeCompare(&time1, &time2) >= 1))
              {
                *(_BYTE *)(v2 + 412) = 1;
              }
            }
            else
            {
              v7 = CMClockGetHostTimeClock();
              CMClockGetTime(&rhs, v7);
              *v6 = *(_OWORD *)&rhs.value;
              *(_QWORD *)(v2 + 400) = rhs.epoch;
            }
          }
        }
        else
        {
          v14 = 0;
          v15 = 0;
          v16 = 0;
        }
      }
      result = objc_msgSend(v4, "logicalFocusLensPosition");
      *(_DWORD *)(v2 + 408) = result;
      v5 = *(_BYTE *)(v2 + 412);
      if (v5)
      {
        result = objc_msgSend(v4, "afStationaryCount");
        v5 = (int)result > 1;
      }
      *(_BYTE *)(v2 + 420) = v5;
    }
  }
  return result;
}

- (uint64_t)_focusIsStable:(uint64_t)a1
{
  uint64_t result;
  unsigned int v5;

  result = 0;
  if (!a1 || !a2)
    return result;
  if (objc_msgSend(a2, "afStatus") != 4)
  {
    if ((objc_msgSend(a2, "logicalFocusLensPositionStep") & 0x80000000) != 0)
    {
      v5 = objc_msgSend(a2, "focusPositionStep");
      if ((v5 & 0x80000000) != 0)
      {
LABEL_9:
        objc_msgSend(a2, "focusingMethod");
        result = FigCaptureStreamFocusingMethodIsPhaseDetectionBased();
        if (!(_DWORD)result)
          return result;
        if ((objc_msgSend((id)objc_msgSend(a2, "portType"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 24), "portType")) & 1) == 0&& (!*(_BYTE *)(a1 + 248) || objc_msgSend(a2, "afStatus") != 3))
        {
          return 0;
        }
        return !objc_msgSend((id)objc_msgSend(a2, "portType"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 24), "portType"))|| !*(_BYTE *)(a1 + 380)|| *(_BYTE *)(a1 + 420) != 0;
      }
    }
    else
    {
      v5 = objc_msgSend(a2, "logicalFocusLensPositionStep");
      if ((v5 & 0x80000000) != 0)
        goto LABEL_9;
    }
    if (v5 >= *(_DWORD *)(a1 + 144))
      goto LABEL_9;
  }
  return !objc_msgSend((id)objc_msgSend(a2, "portType"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 24), "portType"))|| !*(_BYTE *)(a1 + 380)|| *(_BYTE *)(a1 + 420) != 0;
}

- (BOOL)superWideAutoSwitchingSupported
{
  return self->_wideToSuperWideFocusDistance != 0.0;
}

- (void)setTeleMaxEIT:(float)a3
{
  if (self->_teleMaxEIT < a3)
    self->_sceneChangeDetected = 1;
  self->_teleMaxEIT = a3;
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

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWBravoStreamSelector;
  -[BWBravoStreamSelector dealloc](&v3, sel_dealloc);
}

- (float)teleMaxAEGain
{
  return self->_teleMaxAEGain;
}

- (float)teleMaxEIT
{
  return self->_teleMaxEIT;
}

- (void)setSelectionConfiguration:(id)a3
{
  int64_t selectionBehavior;
  unint64_t restrictedSelectionConditions;

  selectionBehavior = self->_pendingSelectionConfiguration.selectionBehavior;
  if (a3.var0 != selectionBehavior)
  {
    self->_waitingForSlaveFocusAfterZoomChange = 0;
LABEL_5:
    if (a3.var0 != 2)
    {
LABEL_18:
      self->_pendingSelectionConfiguration = ($30301DB2717890DD193FABC42FD37CDA)a3;
      return;
    }
    if (selectionBehavior == 2)
    {
      restrictedSelectionConditions = self->_pendingSelectionConfiguration.restrictedSelectionConditions;
      if ((a3.var1 & 2) == 0)
      {
LABEL_12:
        if ((a3.var1 & 4) != 0 && (restrictedSelectionConditions & 4) == 0)
          self->_timeOfLastExposureModeChange = 0;
        if ((a3.var1 & 1) != 0 && (restrictedSelectionConditions & 1) == 0)
          self->_timeOfLastZoomFactorChange = 0;
        goto LABEL_18;
      }
    }
    else
    {
      LOBYTE(restrictedSelectionConditions) = 0;
      if ((a3.var1 & 2) == 0)
        goto LABEL_12;
    }
    if ((restrictedSelectionConditions & 2) == 0)
      self->_timeOfLastFocusModeChange = 0;
    goto LABEL_12;
  }
  if (a3.var1 != self->_pendingSelectionConfiguration.restrictedSelectionConditions)
    goto LABEL_5;
}

- (id)recommendMasterStreamUsingCurrentMasterStream:(id)a3 frameStatisticsByPortType:(id)a4 zoomFactor:(float)a5 isAutoFlashScene:(BOOL)a6 digitalFlashMode:(int)a7 detectedObjects:(id)a8 cameraControlsStatisticsMasterStream:(id)a9
{
  os_unfair_lock_s *p_pendingSelectionConfigurationLock;
  BWFigVideoCaptureStream *wideStream;
  BWFigVideoCaptureStream **p_wideStream;
  float previousZoomFactor;
  float v21;
  float v22;
  BWFigVideoCaptureStream *teleStream;
  float v24;
  float v25;
  float v26;
  NSString *v27;
  BWFigVideoCaptureStream *v28;
  unint64_t v29;
  BWFigVideoCaptureStream *v30;
  BWFigVideoCaptureStream *v31;
  int v32;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v34;
  NSObject *v35;
  int v37;
  int v38;
  int lastSelectionReason;
  int v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  p_pendingSelectionConfigurationLock = &self->_pendingSelectionConfigurationLock;
  os_unfair_lock_lock(&self->_pendingSelectionConfigurationLock);
  self->_selectionConfiguration = self->_pendingSelectionConfiguration;
  os_unfair_lock_unlock(p_pendingSelectionConfigurationLock);
  if (self->_previousZoomFactor != a5)
  {
    self->_timeOfLastZoomFactorChange = mach_absolute_time();
    if (self->_selectionConfiguration.selectionBehavior == 2
      && (self->_selectionConfiguration.restrictedSelectionConditions & 1) == 0)
    {
      if (self->_superWideStream)
      {
        p_wideStream = &self->_wideStream;
        wideStream = self->_wideStream;
        if (wideStream != a3)
        {
          previousZoomFactor = self->_previousZoomFactor;
          -[BWFigVideoCaptureStream baseZoomFactor](wideStream, "baseZoomFactor");
          if (previousZoomFactor < v21)
          {
            -[BWFigVideoCaptureStream baseZoomFactor](*p_wideStream, "baseZoomFactor");
            if (v22 <= a5)
              goto LABEL_12;
          }
        }
      }
      p_wideStream = &self->_teleStream;
      teleStream = self->_teleStream;
      if (teleStream)
      {
        if (teleStream != a3)
        {
          v24 = self->_previousZoomFactor;
          -[BWFigVideoCaptureStream baseZoomFactor](teleStream, "baseZoomFactor");
          if (v24 < v25)
          {
            -[BWFigVideoCaptureStream baseZoomFactor](*p_wideStream, "baseZoomFactor");
            if (v26 <= a5)
            {
LABEL_12:
              v27 = -[BWFigVideoCaptureStream portType](*p_wideStream, "portType");
              self->_timeOfLastPortTypeMadeEligibleByZoom = self->_timeOfLastZoomFactorChange;
              self->_lastPortTypeMadeEligibleByZoom = v27;
            }
          }
        }
      }
    }
  }
  if (self->_superWideWaitForStableFocusOnce)
    -[BWBravoStreamSelector _updateSuperWideFocusIsStableOnceWithFrameStatisticsByPortType:]((uint64_t)self, a4);
  -[BWBravoStreamSelector _updateSceneChangeMonitorWithFrameStatisticsByPortType:fromMasterStream:zoomFactor:digitalFlashMode:debugOverlayInfo:]((uint64_t)self, a4, a3, a7, a5);
  -[BWBravoStreamSelector _updateStateWithFrameStatisticsByPortType:detectedObjects:]((uint64_t)self, a4, a8);
  self->_currentMasterStream = (BWFigVideoCaptureStream *)a3;
  lastSelectionReason = self->_lastSelectionReason;
  if (self->_selectionConfiguration.selectionBehavior == 3)
    goto LABEL_52;
  v41[0] = 0;
  v28 = (BWFigVideoCaptureStream *)-[BWBravoStreamSelector _preferredMasterStreamForFrameStatisticsByPortType:zoomFactor:isAutoFlashScene:digitalFlashMode:debugOverlayInfo:ignoreEligibleFallbackPortTypes:requiresFocusExposeStabilityOut:selectionReasonOut:]((uint64_t)self, a4, a6, a7, 0, 0, v41, &lastSelectionReason, a5);
  v29 = -[NSArray count](self->_eligibleFallbackPortTypes, "count");
  v30 = v28;
  if (v29 < -[NSArray count](self->_supportedFallbackPortTypes, "count"))
    v30 = (BWFigVideoCaptureStream *)-[BWBravoStreamSelector _preferredMasterStreamForFrameStatisticsByPortType:zoomFactor:isAutoFlashScene:digitalFlashMode:debugOverlayInfo:ignoreEligibleFallbackPortTypes:requiresFocusExposeStabilityOut:selectionReasonOut:]((uint64_t)self, a4, a6, a7, 0, 1, 0, 0, a5);
  v31 = 0;
  if (v28 == a3 || !v41[0])
    goto LABEL_26;
  if (v28 == self->_teleStream && !self->_sceneChangeDetected)
  {
LABEL_52:
    v31 = 0;
    goto LABEL_40;
  }
  LOBYTE(v40) = 0;
  v32 = -[BWBravoStreamSelector _selectionBehaviorAllowsSwitchOverTo:forFrameStatisticsByPortType:zoomFactor:blockedByExposureFocusStability:debugOverlayInfo:]((uint64_t)self, v28, a4, &v40);
  v31 = 0;
  if ((v32 & 1) == 0
    && (_BYTE)v40
    && (v31 = v28, v28 == self->_teleStream)
    && (v31 = v28, a9)
    && (v31 = v28, self->_superWideStream == a3)
    && (v31 = v28, self->_wideStream == a9))
  {
    v37 = -[BWBravoStreamSelector _selectionBehaviorAllowsSwitchOverTo:forFrameStatisticsByPortType:zoomFactor:blockedByExposureFocusStability:debugOverlayInfo:]((uint64_t)self, a9, a4, &v40);
    if ((_BYTE)v40)
      v38 = v37;
    else
      v38 = 1;
    if (v38)
      v31 = v28;
    else
      v31 = (BWFigVideoCaptureStream *)a9;
    v28 = (BWFigVideoCaptureStream *)a9;
    if ((v37 & 1) == 0)
      goto LABEL_40;
  }
  else if (!v32)
  {
    goto LABEL_40;
  }
LABEL_26:
  if (v28 != self->_recommendedMasterStream)
  {
    if (dword_1EE6BE6B8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    self->_timeOfLastZoomFactorChange = 0;
    self->_timeOfLastFocusModeChange = 0;
    self->_timeOfLastExposureModeChange = 0;
    self->_recommendedMasterStream = v28;
LABEL_35:
    self->_lastSelectionReason = lastSelectionReason;
    goto LABEL_36;
  }
  if (lastSelectionReason == 1
    && !self->_lastSelectionReason
    && v28 != -[NSArray firstObject](self->_lastPotentialMasterStreams, "firstObject"))
  {
    if (dword_1EE6BE6B8)
    {
      v34 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    goto LABEL_35;
  }
LABEL_36:
  if (v30 != self->_preferredMasterStreamIgnoringEligibleFallbackPortTypes)
  {
    if (dword_1EE6BE6B8)
    {
      v35 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    self->_preferredMasterStreamIgnoringEligibleFallbackPortTypes = v30;
  }
LABEL_40:
  self->_previousZoomFactor = a5;
  self->_slaveStreamBlockingFocusAndExposureStability = v31;
  return self->_recommendedMasterStream;
}

- (uint64_t)_updateSceneChangeMonitorWithFrameStatisticsByPortType:(uint64_t)result fromMasterStream:(void *)a2 zoomFactor:(void *)a3 digitalFlashMode:(int)a4 debugOverlayInfo:(float)a5
{
  uint64_t v8;
  void *v9;
  int v10;
  double v11;
  double v12;
  float v13;
  float v14;
  BOOL v15;
  float v16;
  int v17;
  float v18;
  float v19;
  float v20;
  BOOL v21;

  if (!result)
    return result;
  v8 = result;
  v9 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(a3, "portType"));
  v10 = objc_msgSend(v9, "luxLevel");
  objc_msgSend(v9, "eit");
  v12 = v11;
  result = objc_msgSend(v9, "focusDistance");
  v14 = v13;
  if (*(void **)(v8 + 8) == a3 && *(_QWORD *)(v8 + 152) == *(_QWORD *)(v8 + 16))
    *(_BYTE *)(v8 + 356) = 1;
  if (*(_BYTE *)(v8 + 356))
  {
    if (*(float *)(v8 + 252) == a5)
    {
      v16 = *(float *)(v8 + 340);
      v15 = v16 > 0.0 && v16 < (float)v10;
    }
    else
    {
      v15 = 1;
    }
    *(_BYTE *)(v8 + 357) = v15;
    *(_DWORD *)(v8 + 360) = v10;
    *(double *)(v8 + 368) = v12;
    *(float *)(v8 + 376) = v14;
    *(_BYTE *)(v8 + 356) = 0;
    return result;
  }
  if (*(_BYTE *)(v8 + 357))
    return result;
  if (*(void **)(v8 + 152) != a3)
  {
    *(_DWORD *)(v8 + 360) = v10;
    *(double *)(v8 + 368) = v12;
    *(float *)(v8 + 376) = v13;
    return result;
  }
  if (*(float *)(v8 + 252) != a5)
  {
LABEL_17:
    *(_BYTE *)(v8 + 357) = 1;
    return result;
  }
  if ((int)objc_msgSend(v9, "afStationaryCount") >= 2)
    *(_BYTE *)(v8 + 357) = vabds_f32(*(float *)(v8 + 376), v14) > *(float *)(v8 + 352);
  result = objc_msgSend(v9, "aeStable");
  if (!*(_BYTE *)(v8 + 357) && (_DWORD)result)
  {
    v17 = *(_DWORD *)(v8 + 360);
    v18 = *(float *)(v8 + 336);
    if (v10 >= v17)
    {
      v19 = (float)v10;
      if ((float)(v18 * (float)v17) < (float)v10)
        goto LABEL_17;
      v20 = *(float *)(v8 + 340);
      if (v20 <= 0.0)
      {
        v21 = 0;
        goto LABEL_25;
      }
    }
    else
    {
      v19 = (float)v17;
      v20 = v18 * (float)v10;
    }
    v21 = v20 < v19;
LABEL_25:
    *(_BYTE *)(v8 + 357) = v21;
    if (!a4
      || v21
      || fabs((*(double *)(v8 + 368) - v12) / ((v12 + *(double *)(v8 + 368)) * 0.5)) < *(double *)(v8 + 344))
    {
      return result;
    }
    goto LABEL_17;
  }
  return result;
}

- (void)_preferredMasterStreamForFrameStatisticsByPortType:(char)a3 zoomFactor:(int)a4 isAutoFlashScene:(void *)a5 digitalFlashMode:(int)a6 debugOverlayInfo:(_BYTE *)a7 ignoreEligibleFallbackPortTypes:(int *)a8 requiresFocusExposeStabilityOut:(float)a9 selectionReasonOut:
{
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  float v20;
  void *v21;
  float v22;
  void *v23;
  float v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  double v36;
  double v37;
  int v38;
  void *v39;
  int v40;
  float v41;
  char v42;
  char v43;
  int v44;
  int v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  long double v52;
  uint64_t v53;
  double v54;
  uint64_t v55;
  _BOOL4 v56;
  float v57;
  float v58;
  void *v59;
  void *v60;
  void *v61;
  char v62;
  float v63;
  float v64;
  float v65;
  char v66;
  int *v67;
  BOOL v68;
  float v69;
  double v70;
  float v71;
  void *v72;
  double v73;
  char v74;
  int v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  void *v80;
  int v81;
  int v82;
  float v84;
  int v85;
  int v86;
  int *v87;
  _BYTE *v88;
  char v93;
  _QWORD v94[7];

  if (!a1)
    return 0;
  v14 = 152;
  if (a6)
    v14 = 240;
  v15 = *(void **)(a1 + v14);
  v16 = (void *)objc_msgSend((id)a1, "eligibleFallbackPortTypes");
  v17 = v16;
  if (a6)
    v17 = *(void **)(a1 + 328);
  v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = *(void **)(a1 + 16);
  if (v19)
  {
    objc_msgSend(v19, "baseZoomFactor");
    if (v20 <= a9)
      objc_msgSend(v18, "addObject:", *(_QWORD *)(a1 + 16));
  }
  v21 = *(void **)(a1 + 8);
  if (v21)
  {
    objc_msgSend(v21, "baseZoomFactor");
    if (v22 <= a9
      && (!objc_msgSend(v18, "count")
       || objc_msgSend(v17, "containsObject:", objc_msgSend(*(id *)(a1 + 8), "portType"))))
    {
      objc_msgSend(v18, "addObject:", *(_QWORD *)(a1 + 8));
    }
  }
  v23 = *(void **)(a1 + 24);
  if (v23)
  {
    objc_msgSend(v23, "baseZoomFactor");
    if (v24 <= a9
      && (!objc_msgSend(v18, "count")
       || objc_msgSend(v17, "containsObject:", objc_msgSend(*(id *)(a1 + 24), "portType"))))
    {
      objc_msgSend(v18, "addObject:", *(_QWORD *)(a1 + 24));
    }
  }
  v25 = objc_msgSend(v18, "containsObject:", v15);
  v26 = v15;
  if (!objc_msgSend(v18, "count"))
    goto LABEL_100;
  if ((unint64_t)objc_msgSend(v18, "count") > 1)
  {
    if (v25 && *(_QWORD *)(a1 + 168) == 2)
    {
      v94[0] = MEMORY[0x1E0C809B0];
      v94[1] = 3221225472;
      v94[2] = __221__BWBravoStreamSelector__preferredMasterStreamForFrameStatisticsByPortType_zoomFactor_isAutoFlashScene_digitalFlashMode_debugOverlayInfo_ignoreEligibleFallbackPortTypes_requiresFocusExposeStabilityOut_selectionReasonOut___block_invoke;
      v94[3] = &unk_1E491EBE0;
      v94[4] = v15;
      v94[5] = a1;
      v94[6] = a5;
      objc_msgSend(v18, "filterUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v94));
    }
    if (!*(_QWORD *)(a1 + 16) || !objc_msgSend(v18, "containsObject:"))
      goto LABEL_69;
    v27 = *(void **)(a1 + 16);
    if (v15 == v27)
    {
      if ((-[BWBravoStreamSelector _telephotoLimitsReachedForFrameStatisticsByPortType:debugOverlayInfo:](a1, a2) & 1) != 0)
        goto LABEL_69;
LABEL_52:
      v26 = *(void **)(a1 + 16);
      if (!a4)
        goto LABEL_100;
      v46 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 16), "portType"));
      objc_msgSend(v46, "eit");
      if (*(_BYTE *)(a1 + 140))
      {
        v48 = 1.0;
        if (objc_msgSend(v46, "aeTarget") && objc_msgSend(v46, "aeAverage"))
        {
          v49 = (double)objc_msgSend(v46, "aeTarget");
          v48 = v49 / (double)objc_msgSend(v46, "aeAverage");
        }
        objc_msgSend(v46, "eit");
        v51 = v48 * v50;
        objc_msgSend(v46, "exposureBias");
        v47 = v51 / exp2(v52);
      }
      v53 = 112;
      if (a4 == 1)
        v53 = 104;
      v54 = *(double *)(a1 + v53);
      v55 = 128;
      if (a4 == 1)
        v55 = 120;
      v56 = v47 < *(double *)(a1 + v55) || *(_DWORD *)(a1 + 308) <= *(_DWORD *)(a1 + 136);
      if (v47 < v54 && v56)
      {
        v26 = *(void **)(a1 + 16);
        if (!a7)
          goto LABEL_102;
        goto LABEL_101;
      }
LABEL_69:
      if (!*(_QWORD *)(a1 + 8) || !objc_msgSend(v18, "containsObject:"))
      {
LABEL_95:
        v26 = v15;
        if (*(_QWORD *)(a1 + 24))
        {
          v26 = v15;
          if (objc_msgSend(v18, "containsObject:"))
          {
            v26 = *(void **)(a1 + 24);
            if (!a7)
              goto LABEL_102;
LABEL_101:
            *a7 = v25;
            goto LABEL_102;
          }
        }
LABEL_100:
        if (!a7)
          goto LABEL_102;
        goto LABEL_101;
      }
      if ((objc_msgSend(v17, "containsObject:", objc_msgSend(*(id *)(a1 + 24), "portType")) & 1) == 0)
      {
LABEL_99:
        v26 = *(void **)(a1 + 8);
        goto LABEL_100;
      }
      v57 = *(float *)(a1 + 76);
      v58 = *(float *)(a1 + 84) / *(float *)(a1 + 88);
      if (v15 == *(void **)(a1 + 24)
        && objc_msgSend(v16, "containsObject:", objc_msgSend(v15, "portType")))
      {
        v57 = *(float *)(a1 + 80);
        v58 = *(float *)(a1 + 84);
      }
      v59 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 24), "portType"));
      v60 = v59;
      if (*(_BYTE *)(a1 + 142))
      {
        v61 = (void *)objc_msgSend(v59, "afRecommendedMasterPortType");
        v62 = objc_msgSend(v61, "isEqualToString:", *MEMORY[0x1E0D05A28]);
      }
      else
      {
        objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 8), "portType")), "focusDistance");
        v64 = v63;
        objc_msgSend(v60, "focusDistance");
        v62 = v65 > 0.0 && (v64 < v57 || v65 < v57);
      }
      v66 = a3 ^ 1;
      if (a4)
        v66 = 0;
      if ((v66 & 1) == 0 && *(_BYTE *)(a1 + 100))
      {
        v67 = a8;
        *(_DWORD *)(a1 + 92) = 0;
        v68 = 1;
        goto LABEL_94;
      }
      v93 = v62;
      v69 = (float)objc_msgSend(v60, "aeTarget");
      v71 = v69 / (float)objc_msgSend(v60, "aeAverage");
      v67 = a8;
      if (v71 <= v58)
      {
        *(_DWORD *)(a1 + 92) = 0;
        v68 = 1;
        v72 = a5;
        if (!a5)
        {
LABEL_93:
          v62 = v93;
LABEL_94:
          v74 = v62 & v68;
          a8 = v67;
          if ((v74 & 1) != 0)
            goto LABEL_95;
          goto LABEL_99;
        }
      }
      else
      {
        v72 = a5;
        if (v15 == *(void **)(a1 + 24))
        {
          v85 = *(_DWORD *)(a1 + 92);
          v86 = *(_DWORD *)(a1 + 96);
          *(_DWORD *)(a1 + 92) = v85 + 1;
          v68 = v85 < v86;
          if (!a5)
            goto LABEL_93;
        }
        else
        {
          v68 = 0;
          *(_DWORD *)(a1 + 92) = 0;
          if (!a5)
            goto LABEL_93;
        }
      }
      *(float *)&v70 = v58;
      objc_msgSend(v72, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v70), CFSTR("SuperWideAERatioThreshold"));
      *(float *)&v73 = v71;
      objc_msgSend(v72, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v73), CFSTR("SuperWideAERatio"));
      goto LABEL_93;
    }
    v87 = a8;
    v28 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(v27, "portType"));
    v29 = v28;
    v30 = *(float *)(a1 + 36);
    if (v30 == 0.0)
      v31 = 3.4028e38;
    else
      v31 = *(float *)(a1 + 32) / v30;
    objc_msgSend(v28, "gain");
    v33 = v32;
    v34 = *(float *)(a1 + 48);
    v88 = a7;
    if (v34 == 0.0)
      v35 = 3.4028e38;
    else
      v35 = (float)(v34 * *(float *)(a1 + 44)) / 100.0;
    objc_msgSend(v29, "eit");
    v37 = v36;
    v38 = -[BWBravoStreamSelector _exposureAllowsSwitchToRecommendedMasterStream:frameStatisticsByPortType:](a1, *(_QWORD *)(a1 + 16), a2);
    if (*(_BYTE *)(a1 + 141))
    {
      v39 = (void *)objc_msgSend(v29, "afRecommendedMasterPortType");
      v40 = objc_msgSend(v39, "isEqualToString:", *MEMORY[0x1E0D05A30]);
    }
    else
    {
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 8), "portType")), "focusDistance");
      if (v41 > 0.0)
      {
        a8 = v87;
        if (v41 >= *(float *)(a1 + 60))
        {
          if (objc_msgSend(v17, "containsObject:", objc_msgSend(*(id *)(a1 + 24), "portType")))
          {
            objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 24), "portType")), "focusDistance");
            v40 = v84 >= *(float *)(a1 + 76);
          }
          else
          {
            v40 = 1;
          }
        }
        else
        {
          v40 = 0;
        }
LABEL_42:
        if (*(_BYTE *)(a1 + 40))
        {
          if (v37 < v35)
            v42 = v40;
          else
            v42 = 0;
          v43 = v42 & v38;
          a7 = v88;
          if ((v43 & 1) == 0)
            goto LABEL_69;
        }
        else
        {
          if (v33 < v31)
            v44 = v40;
          else
            v44 = 0;
          v45 = v44 & v38;
          a7 = v88;
          if (v45 != 1)
            goto LABEL_69;
        }
        goto LABEL_52;
      }
      v40 = 0;
    }
    a8 = v87;
    goto LABEL_42;
  }
  v26 = (void *)objc_msgSend(v18, "firstObject");
  if (a7)
    goto LABEL_101;
LABEL_102:
  if (a8)
  {
    if (a6)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot compute selection reason when ignoreEligibleFallbackPortTypes is YES.")), 0));
    if ((objc_msgSend(*(id *)(a1 + 232), "isEqualToArray:", v17) & 1) != 0)
    {
      v75 = 0;
      v76 = 0;
    }
    else
    {
      v77 = objc_msgSend(v26, "portType");
      v78 = objc_msgSend(v15, "portType");
      if (objc_msgSend(v17, "containsObject:", v77))
        v75 = objc_msgSend(*(id *)(a1 + 232), "containsObject:", v77) ^ 1;
      else
        v75 = 0;
      if (objc_msgSend(*(id *)(a1 + 232), "containsObject:", v78))
        v76 = objc_msgSend(v17, "containsObject:", v78) ^ 1;
      else
        v76 = 0;

      *(_QWORD *)(a1 + 232) = v17;
    }
    if ((objc_msgSend(*(id *)(a1 + 224), "isEqualToArray:", v18) & 1) != 0)
    {
      v79 = 1;
LABEL_127:
      *a8 = v79;
      return v26;
    }
    if (*(_QWORD *)(a1 + 224) || v26 == v15)
    {
      if (v26 == (void *)objc_msgSend(v18, "firstObject"))
        v81 = v75;
      else
        v81 = 1;
      v82 = v81 | v76;
      v80 = *(void **)(a1 + 224);
      if (v82 != 1)
      {
        v79 = 0;
LABEL_126:

        *(_QWORD *)(a1 + 224) = v18;
        goto LABEL_127;
      }
    }
    else
    {
      v80 = 0;
    }
    if (((v80 != 0) & (v75 | v76)) != 0)
      v79 = 2;
    else
      v79 = 1;
    goto LABEL_126;
  }
  return v26;
}

- (id)preferredMasterPortTypeForFrameStatisticsByPortType:(id)a3 zoomFactor:(float)a4
{
  return (id)objc_msgSend(-[BWBravoStreamSelector _preferredMasterStreamForFrameStatisticsByPortType:zoomFactor:isAutoFlashScene:digitalFlashMode:debugOverlayInfo:ignoreEligibleFallbackPortTypes:requiresFocusExposeStabilityOut:selectionReasonOut:]((uint64_t)self, a3, 0, 0, 0, 1, 0, 0, a4), "portType");
}

BOOL __221__BWBravoStreamSelector__preferredMasterStreamForFrameStatisticsByPortType_zoomFactor_isAutoFlashScene_digitalFlashMode_debugOverlayInfo_ignoreEligibleFallbackPortTypes_requiresFocusExposeStabilityOut_selectionReasonOut___block_invoke(uint64_t a1, void *a2)
{
  return *(void **)(a1 + 32) == a2
      || -[BWBravoStreamSelector _conditionsAllowSwitchToRecommendedMasterStream:debugOverlayInfo:](*(_QWORD *)(a1 + 40), a2);
}

- (BOOL)_conditionsAllowSwitchToRecommendedMasterStream:(_BOOL8)result debugOverlayInfo:(void *)a2
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (result)
  {
    v3 = result;
    mach_absolute_time();
    if ((*(_BYTE *)(v3 + 176) & 1) != 0)
    {
      v4 = FigHostTimeToNanoseconds();
      if (*(uint64_t *)(v3 + 256) >= 1 && v4 < 1000000000)
        return 1;
    }
    else if (*(_QWORD *)(v3 + 272))
    {
      if (FigHostTimeToNanoseconds() <= 999999999)
      {
        if ((objc_msgSend(*(id *)(v3 + 272), "isEqualToString:", objc_msgSend(a2, "portType")) & 1) != 0)
          return 1;
      }
      else
      {
        *(_QWORD *)(v3 + 264) = 0;
        *(_QWORD *)(v3 + 272) = 0;
      }
    }
    v6 = *(_QWORD *)(v3 + 176);
    if ((v6 & 2) != 0)
    {
      v7 = FigHostTimeToNanoseconds();
      if (*(uint64_t *)(v3 + 280) >= 1 && v7 < 4000000000)
        return 1;
      v6 = *(_QWORD *)(v3 + 176);
    }
    if ((v6 & 4) != 0)
    {
      v8 = FigHostTimeToNanoseconds();
      return *(uint64_t *)(v3 + 288) > 0 && v8 < 1000000000;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)_telephotoLimitsReachedForFrameStatisticsByPortType:(uint64_t)result debugOverlayInfo:(void *)a2
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  float v9;
  float v10;

  if (result)
  {
    v2 = result;
    v3 = *(_DWORD *)(result + 300);
    v4 = *(_DWORD *)(result + 304);
    v5 = *(_DWORD *)(result + 64);
    v6 = *(_DWORD *)(result + 68);
    if (*(_BYTE *)(result + 141))
    {
      v7 = (void *)objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(*(id *)(result + 16), "portType")), "afRecommendedMasterPortType");
      result = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D05A30]) ^ 1;
    }
    else
    {
      v8 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", objc_msgSend(*(id *)(result + 8), "portType"));
      objc_msgSend(v8, "focusDistance");
      if (v9 <= 0.0)
      {
        result = 0;
      }
      else
      {
        objc_msgSend(v8, "focusDistance");
        result = v10 < *(float *)(v2 + 56);
      }
    }
    if (*(_BYTE *)(v2 + 40))
    {
      if (v4 <= v6)
        return result;
    }
    else if (v3 <= v5)
    {
      return result;
    }
    return 1;
  }
  return result;
}

- (BOOL)telephotoLimitsReachedForFrameStatisticsByPortType:(id)a3
{
  return -[BWBravoStreamSelector _telephotoLimitsReachedForFrameStatisticsByPortType:debugOverlayInfo:]((uint64_t)self, a3);
}

- (BWFigVideoCaptureStream)recommendedMasterStream
{
  return self->_recommendedMasterStream;
}

@end
