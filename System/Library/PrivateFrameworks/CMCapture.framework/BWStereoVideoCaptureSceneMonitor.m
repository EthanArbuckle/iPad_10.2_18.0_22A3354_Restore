@implementation BWStereoVideoCaptureSceneMonitor

+ (void)initialize
{
  objc_opt_class();
}

- (BWStereoVideoCaptureSceneMonitor)initWithTuningParametersByPortType:(id)a3 attachDebugFrameStatistics:(BOOL)a4
{
  char *v5;
  char *v6;
  uint64_t v7;
  float v8;
  int v9;
  int v10;
  double v11;
  double v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BWStereoVideoCaptureSceneMonitor;
  v5 = -[BWStereoVideoCaptureSceneMonitor init](&v14, sel_init, a3, a4);
  v6 = v5;
  if (v5)
  {
    *(_WORD *)(v5 + 9) = 257;
    v7 = *MEMORY[0x1E0D05A18];
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A18]), "objectForKeyedSubscript:", CFSTR("TooDarkNormalizedSNRThreshold")), "floatValue");
    if (v8 == 0.0)
      v8 = 1.1755e-38;
    *((float *)v6 + 6) = v8;
    v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v7), "objectForKeyedSubscript:", CFSTR("TooDarkLuxLevelThreshold")), "intValue");
    if (v9)
      v10 = v9;
    else
      v10 = 75;
    *((_DWORD *)v6 + 7) = v10;
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v7), "objectForKeyedSubscript:", CFSTR("TooCloseFocusDistanceThreshold")), "doubleValue");
    if (v11 == 0.0)
      v11 = 40.0;
    *((double *)v6 + 4) = v11;
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v7), "objectForKeyedSubscript:", CFSTR("MinimumValidFocusDistance")), "doubleValue");
    if (v12 == 0.0)
      v12 = 20.0;
    *((double *)v6 + 2) = v12;
    *(int64x2_t *)(v6 + 40) = vdupq_n_s64(0x7FF0000000000000uLL);
  }
  return (BWStereoVideoCaptureSceneMonitor *)v6;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BWStereoVideoCaptureSceneMonitor;
  -[BWStereoVideoCaptureSceneMonitor dealloc](&v2, sel_dealloc);
}

- (void)setAutoFocusInProgress:(BOOL)a3 focusLocked:(BOOL)a4 oneShotFocusScanInProgress:(BOOL)a5
{
  if (a3 || a4 || a5)
    self->_oneShotFocusScanInProgress = !a3 && !a4;
}

- (void)focusScanDidComplete
{
  if (self->_oneShotFocusScanInProgress)
    self->_oneShotFocusScanInProgress = 0;
}

- (BOOL)resolveStereoVideoCaptureStatusWithFrameStatistics:(id)a3 sceneFlags:(unint64_t)a4 stereoVideoCaptureStatusOut:(int *)a5
{
  _BOOL4 oneShotFocusScanInProgress;
  int v7;
  void *v10;
  float v11;
  float v12;
  int v13;
  void *v14;
  float v15;
  float v16;
  float normalizedSNRThreshold;
  int luxLevelThreshold;
  double lastSuperWideFocusDistance;
  double focusDistanceThreshold;
  _BOOL4 subjectIsTooClose;
  _BOOL4 v23;
  int v24;
  int v25;
  int v26;

  oneShotFocusScanInProgress = self->_oneShotFocusScanInProgress;
  if (self->_oneShotFocusScanInProgress)
    return !oneShotFocusScanInProgress;
  v7 = a4;
  v10 = (void *)objc_msgSend(a3, "portType");
  if (!objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D05A18]))
  {
    v14 = (void *)objc_msgSend(a3, "portType");
    if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D05A28]))
    {
      if (self->_subjectTooCloseMonitoringEnabled)
      {
        objc_msgSend(a3, "focusDistance");
        self->_lastSuperWideFocusDistance = v15;
        if (v15 <= 0.0)
          self->_lastSuperWideFocusDistance = INFINITY;
      }
    }
    goto LABEL_29;
  }
  if (self->_sceneTooDarkMonitoringEnabled)
  {
    objc_msgSend(a3, "normalizedSNR");
    v12 = v11;
    v13 = objc_msgSend(a3, "luxLevel");
  }
  else
  {
    v13 = -1;
    v12 = 1.1755e-38;
  }
  if (self->_subjectTooCloseMonitoringEnabled)
  {
    objc_msgSend(a3, "focusDistance");
    self->_lastWideFocusDistance = v16;
    if (v16 <= 0.0)
      self->_lastWideFocusDistance = INFINITY;
  }
  normalizedSNRThreshold = self->_normalizedSNRThreshold;
  if (normalizedSNRThreshold > 1.1755e-38 && v12 > 1.1755e-38)
  {
    if (self->_sceneIsTooDark || v12 > normalizedSNRThreshold)
    {
      if (self->_sceneIsTooDark && v12 > (float)(normalizedSNRThreshold + (float)(normalizedSNRThreshold / 5.0)))
        goto LABEL_26;
      goto LABEL_29;
    }
LABEL_28:
    self->_sceneIsTooDark = 1;
    goto LABEL_29;
  }
  if (v13 == -1)
    goto LABEL_29;
  luxLevelThreshold = self->_luxLevelThreshold;
  if (!self->_sceneIsTooDark)
  {
    if (v13 > luxLevelThreshold)
      goto LABEL_29;
    goto LABEL_28;
  }
  if (v13 > luxLevelThreshold / 5 + luxLevelThreshold)
LABEL_26:
    self->_sceneIsTooDark = 0;
LABEL_29:
  lastSuperWideFocusDistance = self->_lastSuperWideFocusDistance;
  focusDistanceThreshold = self->_focusDistanceThreshold;
  if (self->_lastWideFocusDistance < lastSuperWideFocusDistance)
    lastSuperWideFocusDistance = self->_lastWideFocusDistance;
  subjectIsTooClose = self->_subjectIsTooClose;
  if (self->_subjectIsTooClose)
  {
    v23 = 0;
    if (lastSuperWideFocusDistance <= focusDistanceThreshold * 1.2)
      goto LABEL_34;
    goto LABEL_33;
  }
  v23 = 1;
  if (lastSuperWideFocusDistance <= focusDistanceThreshold)
  {
LABEL_33:
    self->_subjectIsTooClose = v23;
    v23 = subjectIsTooClose;
  }
LABEL_34:
  if (a5)
  {
    v24 = 2 * self->_sceneIsTooDark;
    if ((v7 & 0x4000000) != 0)
      v25 = 2;
    else
      v25 = 2 * self->_sceneIsTooDark;
    if ((v7 & 0x8000000) != 0)
      v25 = 3;
    if (self->_sceneTooDarkMonitoringEnabled)
      v24 = v25;
    if (v23)
      v26 = v24;
    else
      v26 = v24 | 4;
    *a5 = v26;
  }
  return !oneShotFocusScanInProgress;
}

@end
