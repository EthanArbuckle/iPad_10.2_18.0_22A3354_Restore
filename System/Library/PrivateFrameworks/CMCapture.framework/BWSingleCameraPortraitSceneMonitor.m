@implementation BWSingleCameraPortraitSceneMonitor

+ (void)initialize
{
  objc_opt_class();
}

- (BWSingleCameraPortraitSceneMonitor)initWithTuningParameters:(id)a3 attachDebugFrameStatistics:(BOOL)a4
{
  BWSingleCameraPortraitSceneMonitor *v5;
  BWSingleCameraPortraitSceneMonitor *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BWSingleCameraPortraitSceneMonitor;
  v5 = -[BWSingleCameraPortraitSceneMonitor init](&v12, sel_init, a3, a4);
  v6 = v5;
  if (v5)
  {
    v5->_useAPSFocusDistance = 0;
    v5->_subjectTooCloseMonitoringEnabled = 1;
    v7 = (float)(int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooCloseFocusDistanceThreshold")), "intValue");
    if (v6->_useAPSFocusDistance)
      v8 = 10.0;
    else
      v8 = 5.0;
    v6->_subjectTooCloseFocusDistanceThreshold = v7;
    v6->_subjectTooCloseFocusDistanceHysteresisLag = v8;
    v6->_subjectTooFarMonitoringEnabled = 1;
    v9 = (float)(int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TooFarFocusDistanceThreshold")), "intValue");
    if (v6->_useAPSFocusDistance)
      v10 = 10.0;
    else
      v10 = 5.0;
    v6->_subjectTooFarFocusDistanceThreshold = v9;
    v6->_subjectTooFarFocusDistanceHysteresisLag = v10;
    v6->_sceneTooDarkMonitoringEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("EnableLowLightGating")), "BOOLValue");
    v6->_stageFaceNumberOfFramesSinceLastFaceThreshold = 6;
    v6->_enabled = 1;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWSingleCameraPortraitSceneMonitor;
  -[BWSingleCameraPortraitSceneMonitor dealloc](&v3, sel_dealloc);
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
  int v16;
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
  self->_numFacesDetectedFiltered = BWModifiedMovingAverage((float)(unint64_t)objc_msgSend(a10, "count"), self->_numFacesDetectedFiltered, 0.33);
  v16 = objc_msgSend(a10, "count");
  self->_stageMostRecentFacesCount = v16;
  self->_stageFaceHasBeenSeen |= v16 > 0;
}

- (BOOL)resolveSDOFStatusWithSampleBuffer:(opaqueCMSampleBuffer *)a3 frameStatisticsByPortType:(id)a4 sceneFlags:(unint64_t)a5 flashOrTorchWillBeActive:(BOOL)a6 digitalFlashWillFire:(BOOL)a7 thermalPressureLevel:(int)a8 peakPowerPressureLevel:(int)a9 effectStatus:(int *)a10 stagePreviewStatus:(int *)a11
{
  void *v15;
  void *v16;
  void *v17;
  int numFramesSinceFocusLocked;
  _BOOL8 v19;
  int v20;
  int v21;
  int v22;
  float v23;
  float v24;
  int v25;
  int v26;
  BOOL v27;
  int v28;
  int lastFocusingMethod;
  int v30;
  int numFramesSinceAEBecameStable;
  _BOOL4 v32;
  unint64_t v33;
  int v34;
  _BOOL4 v35;
  BOOL v36;
  _BOOL4 useAPSFocusDistance;
  int subjectTooCloseLastFocusPosition;
  float subjectTooCloseFocusDistanceThreshold;
  int subjectTooFarLastFocusPosition;
  float subjectTooFarFocusDistanceThreshold;
  BOOL v43;
  _BOOL4 v44;
  _BOOL4 v45;
  int numberOfFramesSinceLastFace;
  BOOL v48;
  unsigned int v49;

  if (self->_enabled)
  {
    v49 = a5;
    v15 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    if (!v15)
      return (char)v15;
    v16 = v15;
    v17 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]));
    v48 = a6;
    if (self->_focusLocked)
    {
      numFramesSinceFocusLocked = self->_numFramesSinceFocusLocked;
      self->_numFramesSinceFocusLocked = numFramesSinceFocusLocked + 1;
      v19 = numFramesSinceFocusLocked > 9;
    }
    else
    {
      v19 = 0;
    }
    CMSetAttachment(a3, CFSTR("SDOFFocusLocked"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v19), 1u);
    v22 = objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D06C30]), "intValue");
    if (self->_useAPSFocusDistance)
      v23 = -[BWSingleCameraPortraitSceneMonitor _focusDistanceFromAPSMetadata:]((uint64_t)self, v16);
    else
      -[BWSingleCameraPortraitSceneMonitor _focusDistanceFromFacesAttachedToSampleBuffer:]((uint64_t)self, a3);
    v24 = v23;
    self->_lastFocusDistance = v23;
    v25 = objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D067D0]), "intValue");
    v26 = objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D06AB8]), "intValue");
    v27 = v25 != 4;
    if (v25 == 4)
    {
      lastFocusingMethod = self->_lastFocusingMethod;
      v30 = 0;
      if (self->_focusAdjusting)
        v28 = 0;
      else
        v28 = self->_numFramesSinceFocusBecameStable + 1;
    }
    else
    {
      v28 = 0;
      if (v26 == 1)
        lastFocusingMethod = 1;
      else
        lastFocusingMethod = 2;
      v30 = lastFocusingMethod;
    }
    if (self->_aeStableAfterStartStreaming)
    {
      if (self->_focusStableAfterStartStreaming)
      {
        self->_focusAdjusting = v27;
        self->_lastFocusingMethod = lastFocusingMethod;
        self->_numFramesSinceFocusBecameStable = v28;
        if (v30 == 1)
        {
LABEL_49:
          LOBYTE(v15) = 0;
          return (char)v15;
        }
        goto LABEL_47;
      }
      v32 = 1;
    }
    else
    {
      if (objc_msgSend(v17, "aeStable"))
      {
        numFramesSinceAEBecameStable = self->_numFramesSinceAEBecameStable;
        if (numFramesSinceAEBecameStable <= 4)
        {
          v32 = (unint64_t)objc_msgSend(a4, "frameCount") > 0x13;
          numFramesSinceAEBecameStable = self->_numFramesSinceAEBecameStable;
        }
        else
        {
          v32 = 1;
        }
        v34 = numFramesSinceAEBecameStable + 1;
      }
      else
      {
        v33 = objc_msgSend(a4, "frameCount");
        v34 = 0;
        v32 = v33 > 0x13;
      }
      self->_numFramesSinceAEBecameStable = v34;
    }
    if (v25 == 4)
    {
      if (lastFocusingMethod == 2)
      {
        v36 = v28 <= 3;
      }
      else if (lastFocusingMethod)
      {
        v36 = v28 <= 1;
      }
      else
      {
        v36 = v28 <= 43;
      }
      v35 = !v36;
    }
    else
    {
      v35 = (unint64_t)objc_msgSend(a4, "frameCount") > 0x1F;
    }
    LOBYTE(v15) = 0;
    self->_focusAdjusting = v27;
    self->_lastFocusingMethod = lastFocusingMethod;
    self->_numFramesSinceFocusBecameStable = v28;
    self->_aeStableAfterStartStreaming = v32;
    self->_focusStableAfterStartStreaming = v35;
    if (!v32 || !v35 || v30 == 1)
      return (char)v15;
LABEL_47:
    if (lastFocusingMethod == 1 && v28 < 3 || self->_oneShotFocusScanInProgress)
      goto LABEL_49;
    useAPSFocusDistance = self->_useAPSFocusDistance;
    if (!self->_useAPSFocusDistance || !v19)
    {
      if (self->_subjectTooCloseMonitoringEnabled)
      {
        subjectTooCloseLastFocusPosition = self->_subjectTooCloseLastFocusPosition;
        self->_subjectTooCloseLastFocusPosition = v22;
        if (!useAPSFocusDistance || v22 != subjectTooCloseLastFocusPosition)
        {
          subjectTooCloseFocusDistanceThreshold = self->_subjectTooCloseFocusDistanceThreshold;
          if (self->_subjectIsTooClose)
          {
            if (v24 >= (float)(subjectTooCloseFocusDistanceThreshold + self->_subjectTooCloseFocusDistanceHysteresisLag))
            {
              self->_subjectIsTooClose = 0;
              if (self->_lastSDOFEffectStatus == 4 && self->_sceneIsTooDark)
                self->_sceneIsTooDark = 0;
            }
          }
          else if (v24 <= subjectTooCloseFocusDistanceThreshold)
          {
            self->_subjectIsTooClose = 1;
          }
        }
      }
      if (self->_subjectTooFarMonitoringEnabled)
      {
        subjectTooFarLastFocusPosition = self->_subjectTooFarLastFocusPosition;
        self->_subjectTooFarLastFocusPosition = v22;
        if (!useAPSFocusDistance || v22 != subjectTooFarLastFocusPosition)
        {
          subjectTooFarFocusDistanceThreshold = self->_subjectTooFarFocusDistanceThreshold;
          if (self->_subjectTooFarDistanceThresholdReached)
          {
            if (v24 > (float)(subjectTooFarFocusDistanceThreshold - self->_subjectTooFarFocusDistanceHysteresisLag))
              goto LABEL_75;
            v43 = 0;
          }
          else
          {
            if (v24 < subjectTooFarFocusDistanceThreshold)
              goto LABEL_75;
            v43 = 1;
          }
          self->_subjectTooFarDistanceThresholdReached = v43;
        }
      }
    }
LABEL_75:
    if (self->_sceneTooDarkMonitoringEnabled)
      self->_sceneIsTooDark = !v48 & (v49 >> 5);
    if (self->_numFacesDetectedFiltered < 0.5)
      goto LABEL_78;
    if (self->_subjectIsTooClose)
    {
      v44 = 0;
      v21 = 4;
    }
    else
    {
      if (self->_subjectTooFarDistanceThresholdReached)
      {
LABEL_78:
        v44 = 0;
        v21 = 3;
        goto LABEL_81;
      }
      v44 = !self->_sceneIsTooDark;
      if (self->_sceneIsTooDark)
        v21 = 5;
      else
        v21 = 1;
    }
LABEL_81:
    self->_lastSDOFEffectStatus = v21;
    if (self->_stageMostRecentFacesCount < 1)
    {
      numberOfFramesSinceLastFace = self->_numberOfFramesSinceLastFace;
      self->_numberOfFramesSinceLastFace = numberOfFramesSinceLastFace + 1;
      if (!self->_stageFaceHasBeenSeen)
      {
        self->_stageFaceDetected = 0;
        goto LABEL_92;
      }
      v45 = numberOfFramesSinceLastFace < self->_stageFaceNumberOfFramesSinceLastFaceThreshold;
    }
    else
    {
      self->_numberOfFramesSinceLastFace = 0;
      v45 = 1;
    }
    self->_stageFaceDetected = v45;
    if (v44 && v45)
    {
      v21 = 1;
      v20 = 2;
      goto LABEL_6;
    }
LABEL_92:
    self->_stageFaceHasBeenSeen = 0;
    v20 = 1;
    goto LABEL_6;
  }
  v20 = 0;
  v21 = 1;
LABEL_6:
  if (a10)
    *a10 = v21;
  if (a11)
    *a11 = v20;
  LOBYTE(v15) = 1;
  return (char)v15;
}

- (float)_focusDistanceFromAPSMetadata:(uint64_t)a1
{
  float v3;
  float v4;
  float v5;

  if (!a1)
    return 0.0;
  objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06A88]), "floatValue");
  if (v3 == 0.0)
  {
    v4 = *(float *)(a1 + 88);
    v5 = v4;
  }
  else
  {
    v5 = 150.0;
    if (v3 <= 150.0 && v3 >= 0.0)
      v5 = v3;
    v4 = *(float *)(a1 + 88);
  }
  if (v4 == 0.0)
    return v5;
  else
    return (float)(v5 + v4) * 0.5;
}

- (uint64_t)_focusDistanceFromFacesAttachedToSampleBuffer:(uint64_t)result
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  double x;
  double y;
  double height;
  double width;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  double v17;
  float v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  CGSize v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  void *v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  void *v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  _QWORD *v41;
  void *v42;
  _QWORD *v43;
  void *v44;
  float v45;
  void *v46;
  char v47;
  _QWORD *v48;
  void *v49;
  char v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  _BOOL4 v55;
  double v56;
  CMAttachmentBearerRef targeta;
  uint64_t v58;
  CGRect v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  CGRect rect;
  _BYTE v65[128];
  uint64_t v66;
  CGRect v67;

  v66 = *MEMORY[0x1E0C80C00];
  v58 = result;
  if (!result)
    return result;
  targeta = target;
  v2 = (void *)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06998]);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
  v4 = MEMORY[0x1E0C9D648];
  x = *MEMORY[0x1E0C9D648];
  y = *(double *)(MEMORY[0x1E0C9D648] + 8);
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = 0;
  if (v3)
  {
    v10 = *(_QWORD *)v61;
    v11 = *MEMORY[0x1E0D06A48];
    v12 = *MEMORY[0x1E0D06D58];
    v13 = 0.0;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v61 != v10)
          objc_enumerationMutation(v2);
        v15 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "objectForKeyedSubscript:", v11, targeta);
        if (v16)
        {
          memset(&rect, 0, sizeof(rect));
          CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v15, "objectForKeyedSubscript:", v12), &rect);
          v17 = rect.size.width <= rect.size.height ? rect.size.height : rect.size.width;
          v18 = v17;
          if (v13 < v18)
          {
            x = rect.origin.x;
            y = rect.origin.y;
            height = rect.size.height;
            width = rect.size.width;
            v13 = v18;
            v9 = (void *)v16;
          }
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
    }
    while (v3);
  }
  v19 = (void *)CMGetAttachment(targeta, (CFStringRef)*MEMORY[0x1E0D05DD0], 0);
  rect.origin.x = 0.0;
  *(_QWORD *)&rect.origin.y = &rect;
  *(_QWORD *)&rect.size.width = 0x2020000000;
  v20 = (_QWORD *)getkCVAFaceTracking_TrackedFacesArraySymbolLoc_ptr_0;
  *(_QWORD *)&rect.size.height = getkCVAFaceTracking_TrackedFacesArraySymbolLoc_ptr_0;
  if (!getkCVAFaceTracking_TrackedFacesArraySymbolLoc_ptr_0)
  {
    v21 = (void *)AppleCVALibrary_1();
    v20 = dlsym(v21, "kCVAFaceTracking_TrackedFacesArray");
    *(_QWORD *)(*(_QWORD *)&rect.origin.y + 24) = v20;
    getkCVAFaceTracking_TrackedFacesArraySymbolLoc_ptr_0 = (uint64_t)v20;
  }
  _Block_object_dispose(&rect, 8);
  if (!v20)
    -[BWSingleCameraPortraitSceneMonitor _focusDistanceFromFacesAttachedToSampleBuffer:].cold.1();
  v22 = (void *)objc_msgSend(v19, "objectForKeyedSubscript:", *v20);
  v23 = *(CGSize *)(v4 + 16);
  v59.origin = *(CGPoint *)v4;
  v59.size = v23;
  v24 = (void *)objc_msgSend(v22, "firstObject");
  rect.origin.x = 0.0;
  *(_QWORD *)&rect.origin.y = &rect;
  *(_QWORD *)&rect.size.width = 0x2020000000;
  v25 = (_QWORD *)getkCVAFaceTracking_SmoothDataSymbolLoc_ptr_0;
  *(_QWORD *)&rect.size.height = getkCVAFaceTracking_SmoothDataSymbolLoc_ptr_0;
  if (!getkCVAFaceTracking_SmoothDataSymbolLoc_ptr_0)
  {
    v26 = (void *)AppleCVALibrary_1();
    v25 = dlsym(v26, "kCVAFaceTracking_SmoothData");
    *(_QWORD *)(*(_QWORD *)&rect.origin.y + 24) = v25;
    getkCVAFaceTracking_SmoothDataSymbolLoc_ptr_0 = (uint64_t)v25;
  }
  _Block_object_dispose(&rect, 8);
  if (!v25)
    -[BWSingleCameraPortraitSceneMonitor _focusDistanceFromFacesAttachedToSampleBuffer:].cold.2();
  v27 = (void *)objc_msgSend(v24, "objectForKeyedSubscript:", *v25);
  rect.origin.x = 0.0;
  *(_QWORD *)&rect.origin.y = &rect;
  *(_QWORD *)&rect.size.width = 0x2020000000;
  v28 = (_QWORD *)getkCVAFaceTracking_PoseSymbolLoc_ptr;
  *(_QWORD *)&rect.size.height = getkCVAFaceTracking_PoseSymbolLoc_ptr;
  if (!getkCVAFaceTracking_PoseSymbolLoc_ptr)
  {
    v29 = (void *)AppleCVALibrary_1();
    v28 = dlsym(v29, "kCVAFaceTracking_Pose");
    *(_QWORD *)(*(_QWORD *)&rect.origin.y + 24) = v28;
    getkCVAFaceTracking_PoseSymbolLoc_ptr = (uint64_t)v28;
  }
  _Block_object_dispose(&rect, 8);
  if (!v28)
    -[BWSingleCameraPortraitSceneMonitor _focusDistanceFromFacesAttachedToSampleBuffer:].cold.3();
  v30 = (void *)objc_msgSend(v27, "objectForKeyedSubscript:", *v28);
  rect.origin.x = 0.0;
  *(_QWORD *)&rect.origin.y = &rect;
  *(_QWORD *)&rect.size.width = 0x2020000000;
  v31 = (_QWORD *)getkCVAFaceTracking_TranslationSymbolLoc_ptr_0;
  *(_QWORD *)&rect.size.height = getkCVAFaceTracking_TranslationSymbolLoc_ptr_0;
  if (!getkCVAFaceTracking_TranslationSymbolLoc_ptr_0)
  {
    v32 = (void *)AppleCVALibrary_1();
    v31 = dlsym(v32, "kCVAFaceTracking_Translation");
    *(_QWORD *)(*(_QWORD *)&rect.origin.y + 24) = v31;
    getkCVAFaceTracking_TranslationSymbolLoc_ptr_0 = (uint64_t)v31;
  }
  _Block_object_dispose(&rect, 8);
  if (!v31)
    -[BWSingleCameraPortraitSceneMonitor _focusDistanceFromFacesAttachedToSampleBuffer:].cold.4();
  v33 = (void *)objc_msgSend(v30, "objectForKeyedSubscript:", *v31);
  v34 = v33;
  if (v33)
  {
    objc_msgSend((id)objc_msgSend(v33, "objectAtIndexedSubscript:", 0), "floatValue");
    v36 = v35;
    objc_msgSend((id)objc_msgSend(v34, "objectAtIndexedSubscript:", 1), "floatValue");
    v38 = v37;
    objc_msgSend((id)objc_msgSend(v34, "objectAtIndexedSubscript:", 2), "floatValue");
    v40 = v39;
    rect.origin.x = 0.0;
    *(_QWORD *)&rect.origin.y = &rect;
    *(_QWORD *)&rect.size.width = 0x2020000000;
    v41 = (_QWORD *)getkCVAFaceTracking_FaceIDSymbolLoc_ptr;
    *(_QWORD *)&rect.size.height = getkCVAFaceTracking_FaceIDSymbolLoc_ptr;
    if (!getkCVAFaceTracking_FaceIDSymbolLoc_ptr)
    {
      v42 = (void *)AppleCVALibrary_1();
      v41 = dlsym(v42, "kCVAFaceTracking_FaceID");
      *(_QWORD *)(*(_QWORD *)&rect.origin.y + 24) = v41;
      getkCVAFaceTracking_FaceIDSymbolLoc_ptr = (uint64_t)v41;
    }
    _Block_object_dispose(&rect, 8);
    if (!v41)
      -[BWSingleCameraPortraitSceneMonitor _focusDistanceFromFacesAttachedToSampleBuffer:].cold.5();
    v34 = (void *)objc_msgSend(v24, "objectForKeyedSubscript:", *v41);
    rect.origin.x = 0.0;
    *(_QWORD *)&rect.origin.y = &rect;
    *(_QWORD *)&rect.size.width = 0x2020000000;
    v43 = (_QWORD *)getkCVAFaceTracking_DetectedFaceRectSymbolLoc_ptr_1;
    *(_QWORD *)&rect.size.height = getkCVAFaceTracking_DetectedFaceRectSymbolLoc_ptr_1;
    if (!getkCVAFaceTracking_DetectedFaceRectSymbolLoc_ptr_1)
    {
      v44 = (void *)AppleCVALibrary_1();
      v43 = dlsym(v44, "kCVAFaceTracking_DetectedFaceRect");
      *(_QWORD *)(*(_QWORD *)&rect.origin.y + 24) = v43;
      getkCVAFaceTracking_DetectedFaceRectSymbolLoc_ptr_1 = (uint64_t)v43;
    }
    _Block_object_dispose(&rect, 8);
    if (!v43)
      -[BWSingleCameraPortraitSceneMonitor _focusDistanceFromFacesAttachedToSampleBuffer:].cold.6();
    CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v24, "objectForKeyedSubscript:", *v43), &v59);
    v45 = sqrtf((float)((float)(v38 * v38) + (float)(v36 * v36)) + (float)(v40 * v40)) / 10.0;
    if (!v9)
      goto LABEL_44;
LABEL_37:
    v46 = *(void **)(v58 + 96);
    if (v46)
    {
      v47 = objc_msgSend((id)objc_msgSend(v46, "detectionID"), "isEqual:", v9);
      v48 = *(_QWORD **)(v58 + 96);
      if ((v47 & 1) != 0)
      {
        if (v48)
        {
LABEL_43:
          objc_msgSend(v48, "setDetectionRect:", x, y, width, height, targeta);
          goto LABEL_44;
        }
      }
      else
      {

        *(_QWORD *)(v58 + 96) = 0;
      }
    }
    v48 = -[BWTrackedFace initWithDetectionID:]([BWTrackedFace alloc], v9);
    *(_QWORD *)(v58 + 96) = v48;
    goto LABEL_43;
  }
  v45 = 0.0;
  if (v9)
    goto LABEL_37;
LABEL_44:
  if (v34)
  {
    v49 = *(void **)(v58 + 96);
    if (v49)
    {
      v50 = objc_msgSend((id)objc_msgSend(v49, "trackingID"), "isEqual:", v34);
      v49 = *(void **)(v58 + 96);
      if ((v50 & 1) == 0)
      {
        objc_msgSend(v49, "detectionRect");
        v67.origin.x = v51;
        v67.origin.y = v52;
        v67.size.width = v53;
        v67.size.height = v54;
        v55 = CGRectContainsRect(v59, v67);
        v49 = *(void **)(v58 + 96);
        if (v55)
        {
          objc_msgSend(v49, "setTrackingID:", v34);
          v49 = *(void **)(v58 + 96);
        }
      }
    }
    if (objc_msgSend(v34, "isEqual:", objc_msgSend(v49, "trackingID", targeta)))
    {
      *(float *)&v56 = v45;
      objc_msgSend(*(id *)(v58 + 96), "setTrackingDistance:", v56);
      objc_msgSend(*(id *)(v58 + 96), "setTrackingRect:", v59.origin.x, v59.origin.y, v59.size.width, v59.size.height);
    }
  }
  return objc_msgSend(*(id *)(v58 + 96), "distance", targeta);
}

- (float)focusDistanceToMaxAllowedFocusDistanceRatio
{
  return self->_lastFocusDistance / self->_subjectTooFarFocusDistanceThreshold;
}

- (BOOL)portraitSceneMonitoringRequiresStageThresholds
{
  return self->_portraitSceneMonitoringRequiresStageThresholds;
}

- (void)setPortraitSceneMonitoringRequiresStageThresholds:(BOOL)a3
{
  self->_portraitSceneMonitoringRequiresStageThresholds = a3;
}

- (void)_focusDistanceFromFacesAttachedToSampleBuffer:.cold.1()
{
  uint64_t v0;
  void *v1;

  v1 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_TrackedFacesArray(void)");
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BWSingleCameraPortraitSceneMonitor.m"), 26, CFSTR("%s"), OUTLINED_FUNCTION_0());
  __break(1u);
}

- (void)_focusDistanceFromFacesAttachedToSampleBuffer:.cold.2()
{
  uint64_t v0;
  void *v1;

  v1 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_SmoothData(void)");
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BWSingleCameraPortraitSceneMonitor.m"), 30, CFSTR("%s"), OUTLINED_FUNCTION_0());
  __break(1u);
}

- (void)_focusDistanceFromFacesAttachedToSampleBuffer:.cold.3()
{
  uint64_t v0;
  void *v1;

  v1 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_Pose(void)");
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BWSingleCameraPortraitSceneMonitor.m"), 32, CFSTR("%s"), OUTLINED_FUNCTION_0());
  __break(1u);
}

- (void)_focusDistanceFromFacesAttachedToSampleBuffer:.cold.4()
{
  uint64_t v0;
  void *v1;

  v1 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_Translation(void)");
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BWSingleCameraPortraitSceneMonitor.m"), 34, CFSTR("%s"), OUTLINED_FUNCTION_0());
  __break(1u);
}

- (void)_focusDistanceFromFacesAttachedToSampleBuffer:.cold.5()
{
  uint64_t v0;
  void *v1;

  v1 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_FaceID(void)");
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BWSingleCameraPortraitSceneMonitor.m"), 28, CFSTR("%s"), OUTLINED_FUNCTION_0());
  __break(1u);
}

- (void)_focusDistanceFromFacesAttachedToSampleBuffer:.cold.6()
{
  uint64_t v0;
  void *v1;

  v1 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_DetectedFaceRect(void)");
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BWSingleCameraPortraitSceneMonitor.m"), 36, CFSTR("%s"), OUTLINED_FUNCTION_0());
  __break(1u);
}

@end
