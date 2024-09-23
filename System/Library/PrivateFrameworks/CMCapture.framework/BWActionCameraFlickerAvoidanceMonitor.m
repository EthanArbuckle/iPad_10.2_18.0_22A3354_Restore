@implementation BWActionCameraFlickerAvoidanceMonitor

+ (void)initialize
{
  objc_opt_class();
}

- (BWActionCameraFlickerAvoidanceMonitor)initWithDefaultMaxExposureDurationFrameworkOverrideByPortType:(id)a3
{
  BWActionCameraFlickerAvoidanceMonitor *v5;
  BWActionCameraFlickerAvoidanceMonitor *v6;
  objc_super v8;

  if (a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)BWActionCameraFlickerAvoidanceMonitor;
    v5 = -[BWActionCameraFlickerAvoidanceMonitor init](&v8, sel_init);
    v6 = v5;
    if (v5)
    {
      *(_QWORD *)&v5->_confidenceThreshold = 0x2710000088B8;
      v5->_frameRateAware = 1;
      v5->_defaultMaxExposureDurationFrameworkOverrideByPortType = (NSDictionary *)objc_msgSend(a3, "copy");
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWActionCameraFlickerAvoidanceMonitor;
  -[BWActionCameraFlickerAvoidanceMonitor dealloc](&v3, sel_dealloc);
}

- (BOOL)detectFlickerWithSampleBuffer:(opaqueCMSampleBuffer *)a3 fromCaptureStreamWithPortType:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  float v9;
  float v10;
  int v11;
  void *v13;
  int v14;
  float v15;
  float v16;
  int confidenceThreshold;
  int v19;
  int v20;
  float v21;
  _BOOL4 v22;
  CMTime time;

  v6 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v7 = objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06CE8]);
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06978]), "floatValue");
    v10 = -[BWActionCameraFlickerAvoidanceMonitor _updateCurrentFrameRateWithFrameRate:]((uint64_t)self, v9);
    v11 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D070B0]), "intValue");
    if (v11 > 3 || v11 == 0)
    {
LABEL_18:
      LOBYTE(v7) = 0;
      return v7;
    }
    if (v11 > 2)
      goto LABEL_15;
    v13 = (void *)objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D070A8]), "firstObject");
    v14 = objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D07098]), "intValue");
    objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D070A0]), "floatValue");
    v16 = v15;
    confidenceThreshold = self->_confidenceThreshold - self->_confidenceHysteresis;
    if (!self->_flickerFrequency && !self->_frameRateCompatibleFlickerFrequency)
      confidenceThreshold = self->_confidenceThreshold;
    if (v14 < confidenceThreshold || v15 < 49.0)
    {
LABEL_15:
      v19 = 0;
    }
    else
    {
      v20 = llroundf(v15);
      CMTimeMakeFromDictionary(&time, (CFDictionaryRef)-[NSDictionary objectForKeyedSubscript:](self->_defaultMaxExposureDurationFrameworkOverrideByPortType, "objectForKeyedSubscript:", a4));
      v21 = CMTimeGetSeconds(&time) * (double)v20;
      v22 = self->_frameRateAware && vabds_f32(v16 / v10, roundf(v16 / v10)) <= 0.03;
      if (v21 < 0.5 && !v22)
      {
        v19 = 0;
LABEL_17:
        self->_frameRateCompatibleFlickerFrequency = v19;
        if (v20 != self->_flickerFrequency)
        {
          self->_flickerFrequency = v20;
          LOBYTE(v7) = 1;
          return v7;
        }
        goto LABEL_18;
      }
      if (v21 >= 0.5 || !self->_frameRateAware)
        v19 = 0;
      else
        v19 = v20;
    }
    v20 = 0;
    goto LABEL_17;
  }
  return v7;
}

- (float)_updateCurrentFrameRateWithFrameRate:(uint64_t)a1
{
  float v2;
  int *v3;
  int v4;

  if (!a1)
    return 0.0;
  v2 = *(float *)(a1 + 28);
  if (v2 == 0.0)
  {
    *(float *)(a1 + 28) = a2;
    v3 = (int *)(a1 + 32);
LABEL_12:
    *v3 = 0;
    return a2;
  }
  v3 = (int *)(a1 + 32);
  if (vabds_f32(a2, v2) < 1.0)
    goto LABEL_11;
  v4 = v2 < a2 ? *v3 + 1 : *v3 - 1;
  *v3 = v4;
  if (v4 < 0)
    v4 = -v4;
  if (v4 >= 3)
  {
LABEL_11:
    *(float *)(a1 + 28) = a2;
    goto LABEL_12;
  }
  return v2;
}

- (int)flickerFrequency
{
  return self->_flickerFrequency;
}

- (void)setFlickerFrequency:(int)a3
{
  self->_flickerFrequency = a3;
}

@end
