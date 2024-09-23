@implementation BWActionCameraSceneMonitor

+ (void)initialize
{
  objc_opt_class();
}

- (BWActionCameraSceneMonitor)initWithTuningParametersByPortType:(id)a3 videoStabilizationStrength:(int)a4 bravoTelephotoEnabled:(BOOL)a5 attachDebugFrameStatistics:(BOOL)a6
{
  _BOOL4 v7;
  BWActionCameraSceneMonitor *v10;
  BWActionCameraSceneMonitor *v11;
  NSDictionary *v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  void *v21;
  BOOL v22;
  unsigned int v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  objc_super v32;

  if (a4 <= 2)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return 0;
  }
  v7 = a5;
  v32.receiver = self;
  v32.super_class = (Class)BWActionCameraSceneMonitor;
  v10 = -[BWActionCameraSceneMonitor init](&v32, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_sceneTooDarkMonitoringEnabled = 1;
    v12 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (a4 == 4)
    {
      v24 = *MEMORY[0x1E0D05A28];
      v25 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A28]), "objectForKeyedSubscript:", CFSTR("UltraStrength")), "objectForKeyedSubscript:", CFSTR("TooDarkLuxLevelThreshold")), "intValue");
      if (v25)
        v26 = v25;
      else
        v26 = 185;
      -[NSDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v26), v24);
      v27 = *MEMORY[0x1E0D05A18];
      v28 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A18]), "objectForKeyedSubscript:", CFSTR("UltraStrength")), "objectForKeyedSubscript:", CFSTR("TooDarkLuxLevelThreshold")), "intValue");
      if (v28)
        v29 = v28;
      else
        v29 = 24;
      -[NSDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v29), v27);
      v19 = *MEMORY[0x1E0D05A30];
      v20 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A30]), "objectForKeyedSubscript:", CFSTR("UltraStrength")), "objectForKeyedSubscript:", CFSTR("TooDarkLuxLevelThreshold")), "intValue");
      v21 = (void *)MEMORY[0x1E0CB37E8];
      v22 = v20 == 0;
      v23 = 650;
    }
    else
    {
      if (a4 != 3)
        goto LABEL_23;
      v13 = *MEMORY[0x1E0D05A28];
      v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A28]), "objectForKeyedSubscript:", CFSTR("HighStrength")), "objectForKeyedSubscript:", CFSTR("TooDarkLuxLevelThreshold")), "intValue");
      if (v14)
        v15 = v14;
      else
        v15 = 100;
      -[NSDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15), v13);
      v16 = *MEMORY[0x1E0D05A18];
      v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A18]), "objectForKeyedSubscript:", CFSTR("HighStrength")), "objectForKeyedSubscript:", CFSTR("TooDarkLuxLevelThreshold")), "intValue");
      if (v17)
        v18 = v17;
      else
        v18 = 10;
      -[NSDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18), v16);
      v19 = *MEMORY[0x1E0D05A30];
      v20 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A30]), "objectForKeyedSubscript:", CFSTR("HighStrength")), "objectForKeyedSubscript:", CFSTR("TooDarkLuxLevelThreshold")), "intValue");
      v21 = (void *)MEMORY[0x1E0CB37E8];
      v22 = v20 == 0;
      v23 = 300;
    }
    if (v22)
      v30 = v23;
    else
      v30 = v20;
    -[NSDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", objc_msgSend(v21, "numberWithInt:", v30), v19);
LABEL_23:
    if (v7)
      -[NSDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D05A30]);
    v11->_luxThresholdsByPortType = v12;
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWActionCameraSceneMonitor;
  -[BWActionCameraSceneMonitor dealloc](&v3, sel_dealloc);
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

- (BOOL)resolveSDOFStatusWithSampleBuffer:(opaqueCMSampleBuffer *)a3 frameStatisticsByPortType:(id)a4 sceneFlags:(unint64_t)a5 flashOrTorchWillBeActive:(BOOL)a6 digitalFlashWillFire:(BOOL)a7 thermalPressureLevel:(int)a8 peakPowerPressureLevel:(int)a9 effectStatus:(int *)a10 stagePreviewStatus:(int *)a11
{
  uint64_t v13;
  void *v14;
  unsigned int v15;
  _BOOL4 oneShotFocusScanInProgress;
  signed int v17;
  BOOL v18;
  int v19;

  v13 = objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  v14 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", v13);
  v15 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_luxThresholdsByPortType, "objectForKeyedSubscript:", v13), "intValue");
  oneShotFocusScanInProgress = self->_oneShotFocusScanInProgress;
  if (self->_oneShotFocusScanInProgress)
    return !oneShotFocusScanInProgress;
  if (self->_sceneTooDarkMonitoringEnabled)
  {
    v17 = v15;
    if (!self->_sceneIsTooDark)
    {
      if (objc_msgSend(v14, "luxLevel") <= v15)
      {
        v18 = 1;
        goto LABEL_10;
      }
      if (!self->_sceneIsTooDark)
        goto LABEL_11;
    }
    if (objc_msgSend(v14, "luxLevel") > v17 / 5 + v17)
    {
      v18 = 0;
LABEL_10:
      self->_sceneIsTooDark = v18;
    }
  }
LABEL_11:
  if (a10)
  {
    if (self->_sceneIsTooDark)
      v19 = 5;
    else
      v19 = 0;
    *a10 = v19;
  }
  if (a11)
    *a11 = 0;
  return !oneShotFocusScanInProgress;
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
