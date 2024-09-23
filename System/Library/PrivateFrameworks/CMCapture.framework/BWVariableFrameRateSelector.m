@implementation BWVariableFrameRateSelector

+ (void)initialize
{
  objc_opt_class();
}

- (BWVariableFrameRateSelector)initWithPortTypes:(id)a3 forParameters:(id)a4 frameRateSwitchBasedOnMotionDisabled:(BOOL)a5
{
  BWVariableFrameRateSelector *v8;
  BWVariableFrameRateSelector *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BWVariableFrameRateSelector;
  v8 = -[BWVariableFrameRateSelector init](&v11, sel_init);
  v9 = v8;
  if (v8)
    -[BWVariableFrameRateSelector _loadDefaultsWithPortTypes:forParameters:frameRateSwitchBasedOnMotionDisabled:]((uint64_t)v8, a3, a4, a5);
  return v9;
}

- (uint64_t)_loadDefaultsWithPortTypes:(void *)a3 forParameters:(char)a4 frameRateSwitchBasedOnMotionDisabled:
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v7 = result;
    *(_QWORD *)(result + 12) = 0x3C88CE7000000000;
    *(_DWORD *)(result + 24) = 1014672602;
    if (!*(_QWORD *)(result + 32))
      *(_QWORD *)(result + 32) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (!*(_QWORD *)(v7 + 400))
      *(_QWORD *)(v7 + 400) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v16 = a4;
    if (!*(_QWORD *)(v7 + 392))
      *(_QWORD *)(v7 + 392) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *(_DWORD *)(v7 + 488) = 0;
    *(_QWORD *)(v7 + 48) = 0;
    if (!*(_QWORD *)(v7 + 40))
      *(_QWORD *)(v7 + 40) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(a2);
          v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          v13 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", v12);
          v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          if (v13)
          {
            v15 = v14;
            if (objc_msgSend((id)objc_msgSend(v13, "portType"), "isEqualToString:", v12))
            {
              -[BWVariableFrameRateSelector _updateAEMaxGainDictionary:withAEMaxGain:forPortType:](v7, v15, (void *)objc_msgSend(v13, "aeMaxGain"));
              -[BWVariableFrameRateSelector _updatemotionThreshold:forPortType:](v7, objc_msgSend(v13, "motionThreshold"), v12);
              objc_msgSend(*(id *)(v7 + 32), "setObject:forKeyedSubscript:", v15, v12);
            }
          }
        }
        v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }
    *(_WORD *)(v7 + 57) = 256;
    BWSmartCameraSceneInitialize(v7 + 64, 1, 1, 1, (uint64_t)"VFR MotionX Low", 0.9, 0.0, 0.5);
    BWSmartCameraSceneInitialize(v7 + 104, 1, 55, 3, (uint64_t)"VFR MotionX High", 0.9, 0.0, 0.5);
    BWSmartCameraSceneInitialize(v7 + 144, 1, 1, 1, (uint64_t)"VFR Device Motion Low", 0.001, 0.004, 0.5);
    BWSmartCameraSceneInitialize(v7 + 184, 1, 55, 1, (uint64_t)"VFR Device Motion High", 0.998, 0.004, 0.5);
    BWSmartCameraSceneInitialize(v7 + 224, 1, 8, 1, (uint64_t)"VFR AE Limits Reached", 0.9, 0.0, 0.5);
    BWSmartCameraSceneInitialize(v7 + 264, 1, 10, 1, (uint64_t)"VFR Zoom requested", 0.9, 0.0, 1.0);
    BWSmartCameraSceneInitialize(v7 + 304, 1, 25, 5, (uint64_t)"VFR Flicker detected", 0.9, 0.0, 0.5);
    result = BWSmartCameraSceneInitialize(v7 + 344, 1, 15, 600, (uint64_t)"VFR water detected", 0.45, 0.05, 0.5);
    *(_BYTE *)(v7 + 472) = 0;
    *(_DWORD *)(v7 + 536) = 0;
    *(_BYTE *)(v7 + 473) = v16 ^ 1;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWVariableFrameRateSelector;
  -[BWVariableFrameRateSelector dealloc](&v3, sel_dealloc);
}

- (void)processSampleBuffer:(opaqueCMSampleBuffer *)a3 frameStatistics:(id)a4 currentFrameRate:(float)a5 aeMaxGain:(float)a6 zoomInProgress:(BOOL)a7 mostRecentInferenceResult:(id)a8
{
  _BOOL4 v9;
  os_unfair_lock_s *p_smartCameraLock;
  _BOOL4 confident;

  v9 = a7;
  p_smartCameraLock = &self->_smartCameraLock;
  os_unfair_lock_lock(&self->_smartCameraLock);

  self->_mostRecentInferenceResult = (BWInferenceResult *)a8;
  os_unfair_lock_unlock(p_smartCameraLock);
  os_unfair_lock_lock(&self->_variableFrameRateInfoLock);
  BWSmartCameraSceneUpdateWithConfidence((uint64_t)&self->_zoomRequest, (float)v9);
  confident = self->_zoomRequest.confident;
  self->_zoomInProgress = confident;
  if (!confident)
    -[BWVariableFrameRateSelector _updateSuggestedFrameRateFromFrameStatistics:sampleBuffer:currentFrameRate:aeMaxGain:]((uint64_t)self, a4, a3, a5);
  os_unfair_lock_unlock(&self->_variableFrameRateInfoLock);
}

- (uint64_t)_updateSuggestedFrameRateFromFrameStatistics:(uint64_t)result sampleBuffer:(void *)a2 currentFrameRate:(CMAttachmentBearerRef)target aeMaxGain:(float)a4
{
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  float v14;
  double v15;
  unsigned __int8 v16;
  int v17;
  unsigned int v18;
  float v19;
  int v20;
  _BOOL4 v23;
  int v24;
  int v25;
  float v26;
  unsigned int v27;
  int v28;
  int v29;
  _BOOL4 v31;
  int v32;
  double v33;
  double v34;
  float v35;
  float v36;
  char v37;
  double v38;
  double v39;
  float v40;
  float v41;
  float v42;
  float v43;
  int v44;
  float v45;
  double v46;
  double v47;
  float v48;
  double v49;
  int v51;
  float v52;
  double v53;
  _BOOL4 v54;
  float v55;
  float v56;
  float v57;
  int v58;
  void *v59;

  if (!result)
    return result;
  v7 = result;
  v8 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v9 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v10 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D07710]);
  v11 = (void *)CMGetAttachment(target, v8, 0);
  objc_msgSend(a2, "integrationTime");
  v13 = v12;
  objc_msgSend(a2, "gain");
  v15 = v13 * v14;
  v16 = -[BWVariableFrameRateSelector _getSceneStabilityFromSampleBuffer:currentFrameRate:portType:]((char *)v7, target, (uint64_t)v10, a4);
  BWSmartCameraSceneUpdateWithConfidence(v7 + 224, (float)objc_msgSend(a2, "aeLimitsReached"));
  v17 = *(unsigned __int8 *)(v7 + 225);
  v18 = -[BWVariableFrameRateSelector _waterSceneDetected]((os_unfair_lock_s *)v7);
  v59 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06CE8]);
  v19 = -[BWVariableFrameRateSelector _frameRateForFrameStatistics:portType:]((float *)v7, a2);
  v20 = *(_DWORD *)(v7 + 12);
  v23 = v19 == 60.0 && v20 == 0 || v20 == 2;
  v24 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D05A30]);
  *(_BYTE *)(v7 + 532) = v16;
  *(_BYTE *)(v7 + 533) = v17;
  *(_BYTE *)(v7 + 534) = v18;
  if (v23)
    v25 = 2;
  else
    v25 = 1;
  *(_DWORD *)(v7 + 496) = v25;
  objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06978]), "floatValue");
  v27 = vcvtps_s32_f32(v26) & 0x7FFFFFFE;
  *(_DWORD *)(v7 + 536) = v27;
  v28 = 1114636288;
  if (!v23)
  {
    v31 = v19 < 60.0 && v20 == 0;
    if (v20 != 1 && !v31)
      goto LABEL_28;
    if (v17)
      v32 = v24;
    else
      v32 = 1;
    if (a4 == 30.0 && !v32 && v27 >= 0x19)
    {
      objc_msgSend(a2, "integrationTime");
      v34 = v33;
      objc_msgSend(a2, "gain");
      v29 = 0;
      v36 = v34 * v35;
      *(float *)(v7 + 384) = v36;
      *(_DWORD *)(v7 + 492) = 6;
      *(_QWORD *)(v7 + 500) = 0x41C0000041F00000;
      v28 = 1103101952;
LABEL_49:
      *(_DWORD *)(v7 + 8) = v28;
      goto LABEL_50;
    }
    objc_msgSend((id)v7, "getAEMaxGainForPortType:suggestedFrameRate:", v10, 30.0);
    v44 = *(_DWORD *)(v7 + 492);
    if (v44 == 6)
    {
      v45 = v43;
      if (v15 <= (float)(flt_1A32B11C0[v43 > 255.0] * *(float *)(v7 + 384)))
      {
LABEL_68:
        v29 = 0;
        *(_DWORD *)(v7 + 492) = 4;
        *(float *)(v7 + 500) = a4;
        goto LABEL_69;
      }
      objc_msgSend(a2, "integrationTime");
      v47 = v46;
      objc_msgSend(a2, "gain");
      if (*(int *)(v7 + 536) > 29)
        goto LABEL_28;
      v49 = v48;
      if (1.0 / v47 < 30.0 || v45 * 0.97 < v49)
        goto LABEL_28;
      v44 = *(_DWORD *)(v7 + 492);
    }
    if (v19 == a4 && v44 == 4 && *(float *)(v7 + 8) == v19)
      goto LABEL_28;
    goto LABEL_68;
  }
  if (v18)
  {
    if (a4 != 60.0 || *(_DWORD *)(v7 + 492) != 8 || *(float *)(v7 + 8) != 60.0)
    {
      v29 = 0;
      *(_DWORD *)(v7 + 492) = 8;
      *(float *)(v7 + 500) = a4;
LABEL_48:
      *(_DWORD *)(v7 + 504) = v28;
      goto LABEL_49;
    }
    goto LABEL_28;
  }
  v37 = v16 ^ 1;
  if (a4 != 60.0)
    v37 = 1;
  if ((v37 & 1) != 0 || !*(_BYTE *)(v7 + 473))
  {
    if (v17)
    {
      objc_msgSend(a2, "integrationTime");
      v39 = v38;
      objc_msgSend(a2, "gain");
      v41 = v39 * v40;
      *(float *)(v7 + 384) = v41;
      if (a4 != 30.0 || *(_DWORD *)(v7 + 492) != 3 || *(float *)(v7 + 8) != 30.0)
      {
        v29 = 0;
        *(_DWORD *)(v7 + 492) = 3;
        *(float *)(v7 + 500) = a4;
        v28 = 1106247680;
        goto LABEL_48;
      }
      goto LABEL_28;
    }
    if (a4 == 24.0)
    {
      v29 = 0;
      *(_DWORD *)(v7 + 492) = 7;
      *(_QWORD *)(v7 + 500) = 0x41F0000041C00000;
      v28 = 1106247680;
      goto LABEL_49;
    }
    if (a4 != 30.0 || v27 > 0x3B)
    {
      v29 = 2 * (v27 > 0x3B);
      goto LABEL_50;
    }
    v51 = *(_DWORD *)(v7 + 492);
    if (v51 == 1)
      goto LABEL_83;
    if (v51 == 3)
    {
      v52 = *(float *)(v7 + 384) * 0.95;
      if (v15 > v52)
        goto LABEL_28;
    }
    objc_msgSend(a2, "integrationTime");
    if (v53 <= *(float *)(v7 + 24))
    {
LABEL_83:
      v58 = 2;
    }
    else
    {
      v54 = -[BWVariableFrameRateSelector _switchBackTo60AsFlickerFrequencyIsDetected:](v7, v59);
      objc_msgSend((id)v7, "getAEMaxGainForPortType:suggestedFrameRate:", v10, 60.0);
      if (!v54)
        goto LABEL_28;
      v56 = v55;
      objc_msgSend(a2, "gain");
      if (v56 * 0.97 <= v57)
        goto LABEL_28;
      v58 = 5;
    }
    if (v19 == 30.0 && *(_DWORD *)(v7 + 492) == v58 && *(float *)(v7 + 8) == 30.0)
    {
LABEL_28:
      v29 = 0;
      goto LABEL_50;
    }
    v29 = 0;
    *(_DWORD *)(v7 + 492) = v58;
    *(_DWORD *)(v7 + 500) = 1106247680;
LABEL_69:
    *(float *)(v7 + 504) = v19;
    *(float *)(v7 + 8) = v19;
    goto LABEL_50;
  }
  if (*(_DWORD *)(v7 + 492) != 1 || *(float *)(v7 + 8) != 60.0)
  {
    v29 = 1;
    *(_DWORD *)(v7 + 492) = 1;
    *(_QWORD *)(v7 + 500) = 0x4270000042700000;
    v28 = 1114636288;
    goto LABEL_49;
  }
  v29 = 1;
LABEL_50:
  v42 = *(float *)(v7 + 8);
  if (v42 == 0.0 && (v42 != a4 || *(_DWORD *)(v7 + 492)))
  {
    *(_DWORD *)(v7 + 492) = 0;
    *(float *)(v7 + 500) = a4;
    *(float *)(v7 + 504) = a4;
    *(float *)(v7 + 8) = a4;
  }
  if (*(_BYTE *)(v7 + 473))
    *(_DWORD *)(v7 + 52) = v29;
  return objc_msgSend(*(id *)(v7 + 40), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v7 + 492)), 0x1E495A538);
}

- (void)addAttachmentsToSamplebuffer:(opaqueCMSampleBuffer *)a3
{
  os_unfair_lock_s *p_variableFrameRateInfoLock;
  void *v6;
  void *v7;
  uint64_t v8;

  p_variableFrameRateInfoLock = &self->_variableFrameRateInfoLock;
  os_unfair_lock_lock(&self->_variableFrameRateInfoLock);
  v6 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v7 = (void *)CMGetAttachment(a3, CFSTR("VariableFrameRateInfo"), 0);
  if (!v7)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    CMSetAttachment(a3, CFSTR("VariableFrameRateInfo"), self->_variableFrameRateInfo, 1u);
  }
  objc_msgSend(v7, "addEntriesFromDictionary:", self->_variableFrameRateInfo);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_frameRateConversionStatus);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D088B0]);
  os_unfair_lock_unlock(p_variableFrameRateInfoLock);
}

- (float)getAEMaxGainForPortType:(id)a3 suggestedFrameRate:(double)a4
{
  void *v5;
  float result;

  v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_vfrAEMaxGainsByPortType, "objectForKeyedSubscript:", a3);
  objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), (int)a4)), "floatValue");
  return result;
}

- (float)suggestedFrameRate
{
  return self->_suggestedFrameRate;
}

- (uint64_t)_updatemotionThreshold:(uint64_t)a3 forPortType:
{
  uint64_t v5;

  if (result)
  {
    v5 = result;
    objc_msgSend(*(id *)(result + 392), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2), a3);
    return objc_msgSend(*(id *)(v5 + 400), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2), a3);
  }
  return result;
}

- (uint64_t)_updateAEMaxGainDictionary:(uint64_t)result withAEMaxGain:(void *)a2 forPortType:(void *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    result = objc_msgSend(&unk_1E4A008F0, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (result)
    {
      v5 = result;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(&unk_1E4A008F0);
          v8 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7);
          objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v8), "floatValue");
          objc_msgSend(a2, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), v8);
          ++v7;
        }
        while (v5 != v7);
        result = objc_msgSend(&unk_1E4A008F0, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        v5 = result;
      }
      while (result);
    }
  }
  return result;
}

- (char)_updateMotionDataFromSampleBuffer:(char *)result
{
  char *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float64x2_t v7;
  _QWORD *v9;
  float64x2_t v10;
  uint64_t v13;
  int64x2_t v14;
  float64_t v15;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  int8x16_t v30;

  if (result)
  {
    v2 = result;
    result = (char *)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06B68]);
    if (result)
    {
      v3 = result;
      v4 = objc_msgSend(result, "bytes");
      result = (char *)objc_msgSend(v3, "length");
      v5 = *(int *)(v4 + 4);
      if (result == (char *)(40 * (int)v5 + 8))
      {
        if ((int)v5 >= 1)
        {
          v6 = 0;
          _Q1 = *(float64x2_t *)(v2 + 408);
          v7 = *(float64x2_t *)(v2 + 424);
          v9 = (_QWORD *)(v4 + 28);
          v10 = (float64x2_t)vdupq_n_s64(0x3E10000000000000uLL);
          do
          {
            _Q3 = _Q1;
            _Q2 = v7;
            v13 = *(v9 - 1);
            v14.i64[0] = (int)*v9;
            v14.i64[1] = (int)HIDWORD(*v9);
            v7 = vmulq_f64(vcvtq_f64_s64(v14), v10);
            v14.i64[0] = (int)v13;
            v14.i64[1] = SHIDWORD(v13);
            _Q1 = vmulq_f64(vcvtq_f64_s64(v14), v10);
            v6 += 2;
            v9 += 10;
          }
          while (v6 < v5);
          v15 = -_Q3.f64[1];
          _D6 = _Q1.f64[1];
          _D7 = v7.f64[1];
          __asm
          {
            FMLA            D16, D6, V2.D[1]
            FMLS            D16, D7, V3.D[1]
            FMLS            D16, D1, V2.D[0]
            FMLS            D17, D6, V2.D[0]
            FMLS            D17, D1, V2.D[1]
          }
          *((_QWORD *)v2 + 57) = _D16;
          *((_QWORD *)v2 + 58) = _D17;
          v27 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&_Q2.f64[0], 0);
          v27.f64[0] = -_Q2.f64[1];
          v28 = vmlaq_laneq_f64(vmulq_n_f64(v27, v7.f64[0]), _Q3, _Q1, 1);
          v29 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&_Q3.f64[0], 0);
          v29.f64[0] = v15;
          v30 = (int8x16_t)vmlaq_n_f64(vmlaq_laneq_f64(v28, _Q2, v7, 1), v29, _Q1.f64[0]);
          *(float64x2_t *)(v2 + 424) = v7;
          *(int8x16_t *)(v2 + 440) = vextq_s8(v30, v30, 8uLL);
          *(float64x2_t *)(v2 + 408) = _Q1;
        }
      }
      else
      {
        fig_log_get_emitter();
        return (char *)FigDebugAssert3();
      }
    }
  }
  return result;
}

- (BOOL)_switchBackTo60AsFlickerFrequencyIsDetected:(_BOOL8)result
{
  uint64_t v3;
  float v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  float v9;
  _BOOL4 v10;

  if (result)
  {
    v3 = result;
    v4 = 0.0;
    if (objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D070B0]), "intValue")
       - 1 <= 1)
    {
      v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D070A8]);
      if (objc_msgSend(v5, "count"))
      {
        v6 = (void *)objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D070A0]), "floatValue");
        v8 = v7;
        objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D07098]), "floatValue");
        if (v9 >= 39321.0)
        {
          v10 = v8 > 60.0;
          if (v8 >= 65.0)
            v10 = 0;
          v4 = (float)v10;
        }
      }
    }
    BWSmartCameraSceneUpdateWithConfidence(v3 + 304, v4);
    return *(_BYTE *)(v3 + 305) != 0;
  }
  return result;
}

- (float)_frameRateForFrameStatistics:(float *)a1 portType:(void *)a2
{
  float v4;
  float v5;
  double v6;
  double v7;
  float v8;
  BOOL v9;
  float result;
  double v11;
  double v12;

  if (!a1)
    return 0.0;
  objc_msgSend(a1, "getAEMaxGainForPortType:suggestedFrameRate:", 60.0);
  v5 = v4;
  objc_msgSend(a2, "integrationTime");
  if (v6 <= a1[4] * 0.97 || (objc_msgSend(a2, "integrationTime"), v7 >= a1[4] * 1.03))
  {
    objc_msgSend(a2, "integrationTime");
    v12 = v11;
    result = 30.0;
    if (v12 <= a1[4])
      return 60.0;
  }
  else
  {
    objc_msgSend(a2, "gain");
    v9 = v8 < v5;
    result = 60.0;
    if (!v9)
      return 30.0;
  }
  return result;
}

- (uint64_t)_updateSmartSceneFromSampleBuffer:(uint64_t)a3 currentFrameRate:(float)a4 portType:
{
  uint64_t v6;
  uint64_t v7;
  float v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int8x16_t v13;
  double v14;
  int8x16_t v15;
  double v16;
  float64x2_t v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float v24;
  double v25;
  float v26;
  float v27;
  uint64_t v28;
  double v29;

  if (result)
  {
    v6 = result;
    *(_DWORD *)(result + 388) = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06CA8]), "intValue");
    v7 = 400;
    if (a4 > 24.0)
      v7 = 392;
    if (*(_DWORD *)(v6 + 388) >= (int)objc_msgSend((id)objc_msgSend(*(id *)(v6 + v7), "objectForKeyedSubscript:", a3), "intValue"))v8 = 0.0;
    else
      v8 = 1.0;
    v9 = *(double *)(v6 + 440);
    v10 = *(double *)(v6 + 448);
    v11 = *(double *)(v6 + 456);
    v12 = *(double *)(v6 + 464);
    v14 = atan2(v11 * v12 + v9 * v10 + v11 * v12 + v9 * v10, (v11 * v11 + v10 * v10) * -2.0 + 1.0);
    *(double *)v15.i64 = v9 * v11 - v12 * v10 + v9 * v11 - v12 * v10;
    if (fabs(*(double *)v15.i64) >= 1.0)
    {
      v13.i64[0] = 0x3FF921FB54442D18;
      v17.f64[0] = NAN;
      v17.f64[1] = NAN;
      *(_QWORD *)&v16 = vbslq_s8((int8x16_t)vnegq_f64(v17), v13, v15).u64[0];
    }
    else
    {
      v16 = asin(*(long double *)v15.i64);
    }
    v29 = v16;
    v18 = atan2(v10 * v11 + v9 * v12 + v10 * v11 + v9 * v12, (v12 * v12 + v11 * v11) * -2.0 + 1.0);
    BWSmartCameraSceneUpdateWithConfidence(v6 + 64, v8);
    BWSmartCameraSceneUpdateWithConfidence(v6 + 104, v8);
    v19 = v6 + 144;
    v20 = fabs(v14);
    v21 = fabs(v29);
    v22 = fabs(v18);
    if (v20 <= v21)
    {
      if (v21 <= v22)
        v25 = v22;
      else
        v25 = v21;
      v26 = 1.0 - v25;
      BWSmartCameraSceneUpdateWithConfidence(v19, v26);
      v20 = v21;
      if (v21 > v22)
      {
LABEL_21:
        v27 = 1.0 - v20;
        result = BWSmartCameraSceneUpdateWithConfidence(v6 + 184, v27);
        if (a4 > 24.0)
        {
          if (*(_BYTE *)(v6 + 58))
          {
            if (*(_BYTE *)(v6 + 185) || !*(_BYTE *)(v6 + 57))
            {
              v28 = 105;
LABEL_34:
              *(_BYTE *)(v6 + 56) = *(_BYTE *)(v6 + v28);
              return result;
            }
          }
          else if (!*(_BYTE *)(v6 + 57))
          {
            return result;
          }
          v28 = 185;
          goto LABEL_34;
        }
        if (*(_BYTE *)(v6 + 58))
        {
          if (*(_BYTE *)(v6 + 145) || !*(_BYTE *)(v6 + 57))
          {
            v28 = 65;
            goto LABEL_34;
          }
        }
        else if (!*(_BYTE *)(v6 + 57))
        {
          return result;
        }
        v28 = 145;
        goto LABEL_34;
      }
    }
    else
    {
      if (v20 <= v22)
        v23 = v22;
      else
        v23 = v20;
      v24 = 1.0 - v23;
      BWSmartCameraSceneUpdateWithConfidence(v19, v24);
      if (v20 > v22)
        goto LABEL_21;
    }
    v20 = v22;
    goto LABEL_21;
  }
  return result;
}

- (char)_getSceneStabilityFromSampleBuffer:(uint64_t)a3 currentFrameRate:(float)a4 portType:
{
  uint64_t v7;

  if (result)
  {
    v7 = (uint64_t)result;
    -[BWVariableFrameRateSelector _updateMotionDataFromSampleBuffer:](result, a2);
    -[BWVariableFrameRateSelector _updateSmartSceneFromSampleBuffer:currentFrameRate:portType:](v7, a2, a3, a4);
    return (char *)(*(_BYTE *)(v7 + 56) != 0);
  }
  return result;
}

- (os_unfair_lock_s)_waterSceneDetected
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;
  id v3;
  void *v4;
  float v5;

  if (result)
  {
    v1 = result;
    v2 = result + 122;
    os_unfair_lock_lock(result + 122);
    v3 = *(id *)&v1[120]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v2);
    result = (os_unfair_lock_s *)objc_msgSend(v3, "isValid");
    if ((_DWORD)result)
    {
      v4 = (void *)objc_msgSend(v3, "inferences");
      objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D07968]), "floatValue");
      BWSmartCameraSceneUpdateWithConfidence((uint64_t)&v1[86], v5);
      return (os_unfair_lock_s *)(BYTE1(v1[86]._os_unfair_lock_opaque) != 0);
    }
  }
  return result;
}

@end
