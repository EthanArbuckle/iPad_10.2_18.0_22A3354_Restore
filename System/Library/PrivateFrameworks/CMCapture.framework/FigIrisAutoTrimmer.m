@implementation FigIrisAutoTrimmer

- (uint64_t)_findClosestIndexToTimestamp:(uint64_t)a3 fromIndex:(double)a4 limitIndex:
{
  uint64_t v5;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;

  if (!a1)
    return 0;
  v5 = a2;
  if (a2 < a3)
    v8 = 1;
  else
    v8 = -1;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 184), "objectAtIndexedSubscript:", a2), "timestamp");
  if (v8 + v5 < 0)
    return v5;
  v10 = vabdd_f64(v9, a4);
  v11 = v8 - a3;
  v12 = v5;
  do
  {
    if (v8 + v5 >= (unint64_t)objc_msgSend(*(id *)(a1 + 184), "count"))
      break;
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 184), "objectAtIndexedSubscript:", v8 + v5), "timestamp");
    v14 = vabdd_f64(v13, a4);
    if (v14 <= v10)
      v12 = v8 + v5;
    if (!(v11 + v5))
      break;
    if (v14 > v10)
      break;
    v15 = 2 * v8 + v5;
    v5 += v8;
    v10 = v14;
  }
  while ((v15 & 0x8000000000000000) == 0);
  return v12;
}

- (void)processISPMotionData:(id)a3 forHostTime:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  CMTime *v6;
  CMTime *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFDictionary *v10;
  double Seconds;
  uint64_t v12;
  double *v13;
  int v14;
  double v15;
  double v16;
  float64x2_t *v17;
  double v18;
  CMTime time;
  float32x2_t v20;
  uint64_t v21;
  float64x2_t v22[330];
  uint64_t v23;
  _QWORD v24[2];

  v4 = MEMORY[0x1E0C80A78](self, a2, a3, a4);
  v24[1] = *MEMORY[0x1E0C80C00];
  if (!v5)
  {
    fig_log_get_emitter();
LABEL_16:
    FigDebugAssert3();
    return;
  }
  v7 = v6;
  v8 = v4;
  v9 = *MEMORY[0x1E0D06B68];
  v23 = *MEMORY[0x1E0D06B68];
  v24[0] = v5;
  v10 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  bzero(v22, 0x14A0uLL);
  v20 = 0;
  v21 = 0;
  if (FigMotionGetMotionDataFromISP(v10, v22, 0, 110, (int *)&v21 + 1, &v20, 0, 0, 0))
  {
    fig_log_get_emitter();
    goto LABEL_16;
  }
  if (SHIDWORD(v21) < 1)
  {
    ++processISPMotionData_forHostTime__missingFrames;
    -[__CFDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v9);
    FigMotionHardwareAvailable();
  }
  else
  {
    processISPMotionData_forHostTime__missingFrames = 0;
    time = *v7;
    Seconds = CMTimeGetSeconds(&time);
    if (SHIDWORD(v21) >= 1)
    {
      v12 = 0;
      v13 = &v22[0].f64[1];
      v14 = -1;
      v15 = INFINITY;
      do
      {
        v16 = vabdd_f64(*v13, Seconds);
        if (v16 >= v15)
        {
          if (v15 < 0.005)
            break;
        }
        else
        {
          v15 = v16;
          v14 = v12;
        }
        ++v12;
        v13 += 6;
      }
      while (HIDWORD(v21) != v12);
      if (v14 != -1)
      {
        v17 = &v22[3 * v14];
        v18 = v17->f64[1];
        time = *v7;
        -[FigIrisAutoTrimmer _processMotionSample:gravity:motionTimestamp:frameTimestamp:metadata:](v8, (uint64_t)&v17[1], (uint64_t)&v20, (__int128 *)&time.value, v10, v18);
      }
    }
  }
}

- (void)_processMotionSample:(uint64_t)a3 gravity:(__int128 *)a4 motionTimestamp:(void *)a5 frameTimestamp:(double)a6 metadata:
{
  unint64_t v12;
  uint64_t v13;
  FigIrisAutoTrimmerMotionSample *v14;
  FigIrisAutoTrimmerMotionSample *v15;
  FigIrisAutoTrimmerMotionSample *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v12 = *(_QWORD *)(a1 + 256) - 1;
    if (objc_msgSend(*(id *)(a1 + 184), "count") > v12)
      objc_msgSend(*(id *)(a1 + 184), "removeObjectsInRange:", 0, objc_msgSend(*(id *)(a1 + 184), "count") - v12);
    if (objc_msgSend(*(id *)(a1 + 184), "count"))
      v13 = objc_msgSend(*(id *)(a1 + 184), "objectAtIndexedSubscript:", -[FigIrisAutoTrimmer _findClosestIndexToTimestamp:fromIndex:limitIndex:](a1, objc_msgSend(*(id *)(a1 + 184), "count") - 1, 0, a6 + -0.0666666667));
    else
      v13 = 0;
    v14 = [FigIrisAutoTrimmerMotionSample alloc];
    v28 = *a4;
    v29 = *((_QWORD *)a4 + 2);
    v15 = -[FigIrisAutoTrimmerMotionSample initWithAttitude:gravity:motionTimestamp:frameTimestamp:previousSample:](v14, "initWithAttitude:gravity:motionTimestamp:frameTimestamp:previousSample:", a2, a3, &v28, v13, a6);
    v16 = v15;
    if (*(_QWORD *)(a1 + 160))
    {
      -[FigIrisAutoTrimmerMotionSample prepareIntermediates:](v15, "prepareIntermediates:", *(_QWORD *)(a1 + 192));
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v17 = *(void **)(a1 + 160);
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v25 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
            v23 = objc_msgSend(a5, "objectForKeyedSubscript:", v22);
            if (v23)
              -[NSMutableDictionary setObject:forKeyedSubscript:](-[FigIrisAutoTrimmerMotionSample intermediateCalculations](v16, "intermediateCalculations"), "setObject:forKeyedSubscript:", v23, v22);
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
        }
        while (v19);
      }
    }
    objc_msgSend(*(id *)(a1 + 184), "addObject:", v16);

  }
}

- (void)startMotionProcessing
{
  self->_motionAvailable = 1;
}

- (void)setVitalityScoringSmartCameraPipelineVersion:(id)a3
{
  unsigned int v3;
  float v4;

  self->_vitalityScoringSmartCameraPipelineVersion = ($1D54FF943ED39CD641379A9C294BD6F7)a3;
  if (a3.var0 >= 4u)
  {
    if (a3.var0 == 4)
    {
      v3 = 2;
      v4 = 0.86;
    }
    else if (a3.var0 == 5 && (*(_DWORD *)&a3.var0 & 0xFFFF0000) == 0)
    {
      v3 = 3;
      v4 = 0.728;
    }
    else
    {
      v3 = 4;
      v4 = 0.468;
    }
  }
  else
  {
    v3 = 1;
    v4 = 0.629;
  }
  self->_vitalityScoringVersion = v3;
  self->_vitalityDocumentThreshold = v4;
}

- (void)setVitalityScoringEnabled:(BOOL)a3
{
  self->_vitalityScoringEnabled = a3;
}

- (void)setVideoFrameRate:(double)a3
{
  self->_motionSampleRate = a3;
  -[FigIrisAutoTrimmer _updateStorageStats]((uint64_t)self);
}

- (double)_updateStorageStats
{
  double v2;
  double result;
  CMTime v4;

  if (a1)
  {
    v2 = *(double *)(a1 + 248);
    v4 = *(CMTime *)(a1 + 204);
    *(_QWORD *)(a1 + 232) = vcvtmd_s64_f64(v2 * CMTimeGetSeconds(&v4));
    result = *(double *)(a1 + 248) * (*(double *)(a1 + 240) + 0.266666667);
    *(_QWORD *)(a1 + 256) = vcvtpd_u64_f64(result);
  }
  return result;
}

- (void)setMaxHoldDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_maxHoldDuration.flags = a3->var3;
  *(_OWORD *)(&self->_intermediateLoggingEnabled + 4) = v3;
  -[FigIrisAutoTrimmer _updateStorageStats]((uint64_t)self);
}

- (void)setBufferHistorySeconds:(double)a3
{
  self->_bufferHistorySeconds = a3;
  -[FigIrisAutoTrimmer _updateStorageStats]((uint64_t)self);
}

- (FigIrisAutoTrimmer)init
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  CFPropertyListRef v5;
  const void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FigIrisAutoTrimmer;
  v2 = -[FigIrisAutoTrimmer init](&v9, sel_init);
  v3 = (uint64_t)v2;
  if (v2)
  {
    v2[56] = 0;
    v4 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)(v2 + 204) = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)(v2 + 220) = *(_QWORD *)(v4 + 16);
    *((_OWORD *)v2 + 15) = xmmword_1A32B21E0;
    *((_QWORD *)v2 + 32) = 68;
    *((_QWORD *)v2 + 29) = 68;
    *((_DWORD *)v2 + 34) = 4;
    *((_QWORD *)v2 + 23) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *((_QWORD *)v2 + 32));
    *(_DWORD *)(v3 + 268) = -1082130432;
    v5 = CFPreferencesCopyAppValue(CFSTR("iris_autotrim_svm"), CFSTR("com.apple.coremedia"));
    if (v5)
    {
      v6 = v5;
      v7 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v5);
      if (v7)
        -[FigIrisAutoTrimmer _initSVM:fromFile:](v3, v7);
      CFRelease(v6);
    }
  }
  return (FigIrisAutoTrimmer *)v3;
}

+ (void)initialize
{
  uint64_t v2;
  uint64_t v3;

  if ((id)objc_opt_class() == a1)
  {
    FigGetCFPreferenceDoubleWithDefault();
    sMotionThreshold = v2;
    FigGetCFPreferenceDoubleWithDefault();
    sBadAccelThreshold = v3;
    sEnableAllLoggingNoTrim = FigGetCFPreferenceNumberWithDefault();
  }
}

- (void)_initSVM:(uint64_t)a1 fromFile:(void *)a2
{
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const void *v14;
  const void *v15;

  if (a1)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", CFSTR("nVectors"), CFSTR("nParams"), CFSTR("Rho"), CFSTR("ParamNames"), CFSTR("Normalization"), CFSTR("Vectors"), 0);
    if (objc_msgSend((id)objc_msgSend(a2, "allKeys"), "isEqualToArray:", &unk_1E4A01A78))
    {
      *(_QWORD *)(a1 + 160) = (id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("ParamNames"));
      return;
    }
    if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("KernelType")))
    {
      if (objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("KernelType")), "isEqualToString:", CFSTR("Linear")))
      {
        *(_DWORD *)(a1 + 140) = 0;
      }
      else
      {
        if (!objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("KernelType")), "isEqualToString:", CFSTR("RBF")))return;
        *(_DWORD *)(a1 + 140) = 1;
        objc_msgSend(v4, "addObject:", CFSTR("Gamma"));
      }
      objc_msgSend(v4, "minusSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(a2, "allKeys")));
      if (!objc_msgSend(v4, "count"))
      {
        *(_DWORD *)(a1 + 144) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("nVectors")), "intValue");
        *(_DWORD *)(a1 + 148) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("nParams")), "intValue");
        objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("Rho")), "floatValue");
        *(_DWORD *)(a1 + 152) = v5;
        if (*(_DWORD *)(a1 + 140) == 1)
        {
          objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("Gamma")), "floatValue");
          *(_DWORD *)(a1 + 156) = v6;
        }
        *(_QWORD *)(a1 + 160) = (id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("ParamNames"));
        *(_QWORD *)(a1 + 168) = (id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("Normalization"));
        *(_QWORD *)(a1 + 176) = (id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("Vectors"));
        v7 = *(int *)(a1 + 148);
        v8 = *(_DWORD *)(a1 + 144) * v7;
        v9 = objc_msgSend(*(id *)(a1 + 160), "count");
        v10 = *(int *)(a1 + 148);
        v11 = objc_msgSend(*(id *)(a1 + 168), "length");
        v12 = objc_msgSend(*(id *)(a1 + 176), "length");
        v13 = *(void **)(a1 + 160);
        if (v12 == 4 * v8 && v11 == 8 * v7 && v9 == v10 - 1)
        {
          *(_QWORD *)(a1 + 192) = objc_msgSend(v13, "count");
        }
        else
        {
          if (v13)
          {
            CFRelease(v13);
            *(_QWORD *)(a1 + 160) = 0;
          }
          v14 = *(const void **)(a1 + 168);
          if (v14)
          {
            CFRelease(v14);
            *(_QWORD *)(a1 + 168) = 0;
          }
          v15 = *(const void **)(a1 + 176);
          if (v15)
          {
            CFRelease(v15);
            *(_QWORD *)(a1 + 176) = 0;
          }
        }
      }
    }
  }
}

- (void)dealloc
{
  NSMutableArray *motionSamples;
  NSArray *svmKeys;
  NSData *svmNormalization;
  NSData *svmVectors;
  objc_super v7;

  motionSamples = self->_motionSamples;
  if (motionSamples)
  {
    CFRelease(motionSamples);
    self->_motionSamples = 0;
  }
  svmKeys = self->_svmKeys;
  if (svmKeys)
  {
    CFRelease(svmKeys);
    self->_svmKeys = 0;
  }
  svmNormalization = self->_svmNormalization;
  if (svmNormalization)
  {
    CFRelease(svmNormalization);
    self->_svmNormalization = 0;
  }
  svmVectors = self->_svmVectors;
  if (svmVectors)
  {
    CFRelease(svmVectors);
    self->_svmVectors = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)FigIrisAutoTrimmer;
  -[FigIrisAutoTrimmer dealloc](&v7, sel_dealloc);
}

- (void)stopMotionProcessing
{
  self->_motionAvailable = 0;
}

- (void)processInferences:(id)a3 forHostTime:(id *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15;

  v15 = *a4;
  if (-[FigIrisAutoTrimmer _checkSamplesContainHostTime:]((uint64_t)self, (CMTime *)&v15))
  {
    v7 = -[NSMutableArray count](self->_motionSamples, "count");
    v15 = *a4;
    v8 = -[FigIrisAutoTrimmer _findClosestIndexToHostTime:fromIndex:limitIndex:]((uint64_t)self, (CMTime *)&v15, v7 - 1, 0);
    objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v8), "setInferences:", a3);
    v9 = 0;
    do
    {
      v10 = v9;
      v11 = v8 + v9;
      v12 = v8 + v9 - 1;
      if (v8 + v9 < 2)
        break;
      v13 = objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v8 + v9 - 1), "inferences");
      v9 = v10 - 1;
    }
    while (!v13);
    if (v11 < v8)
    {
      do
        objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v8 + v10), "setInferences:", objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v12), "inferences"));
      while (!__CFADD__(v10++, 1));
    }
  }
}

- (uint64_t)_checkSamplesContainHostTime:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  int32_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double Seconds;
  CMTime *v11;
  CMTime *v12;
  CMTime *p_rhs;
  void *v14;
  void *v15;
  CMTime v16;
  CMTime time;
  _QWORD v18[3];
  _BYTE v19[24];
  CMTime v20;
  CMTime rhs;
  CMTime v22;
  CMTime time1;
  CMTime time2;

  if (!result)
    return result;
  v3 = result;
  result = objc_msgSend(*(id *)(result + 184), "count");
  if (!result)
    return result;
  v4 = (void *)objc_msgSend(*(id *)(v3 + 184), "firstObject");
  if (v4)
    objc_msgSend(v4, "originatingFrameTime");
  else
    memset(&time2, 0, sizeof(time2));
  time1 = *a2;
  v5 = CMTimeCompare(&time1, &time2);
  v6 = *(void **)(v3 + 184);
  if (v5 < 0)
  {
    v8 = (void *)objc_msgSend(v6, "firstObject");
    if (v8)
      objc_msgSend(v8, "originatingFrameTime");
    else
      memset(&rhs, 0, sizeof(rhs));
    time1 = *a2;
    v11 = &v22;
    v12 = &v22;
    p_rhs = &rhs;
  }
  else
  {
    v7 = (void *)objc_msgSend(v6, "lastObject");
    if (v7)
      objc_msgSend(v7, "originatingFrameTime");
    else
      memset(&v20, 0, sizeof(v20));
    time1 = *a2;
    if (CMTimeCompare(&time1, &v20) < 1)
    {
      Seconds = 0.0;
      goto LABEL_21;
    }
    v9 = (void *)objc_msgSend(*(id *)(v3 + 184), "lastObject");
    if (v9)
      objc_msgSend(v9, "originatingFrameTime");
    else
      memset(v18, 0, sizeof(v18));
    time1 = *a2;
    v11 = (CMTime *)v19;
    v12 = (CMTime *)v19;
    p_rhs = (CMTime *)v18;
  }
  CMTimeSubtract(v12, &time1, p_rhs);
  Seconds = CMTimeGetSeconds(v11);
LABEL_21:
  if (fabs(Seconds) <= 0.5 / *(double *)(v3 + 248))
    return 1;
  time1 = *a2;
  v14 = (void *)objc_msgSend(*(id *)(v3 + 184), "firstObject", CMTimeGetSeconds(&time1));
  if (v14)
    objc_msgSend(v14, "originatingFrameTime");
  else
    memset(&time, 0, sizeof(time));
  v15 = (void *)objc_msgSend(*(id *)(v3 + 184), "lastObject", CMTimeGetSeconds(&time));
  if (v15)
    objc_msgSend(v15, "originatingFrameTime");
  else
    memset(&v16, 0, sizeof(v16));
  CMTimeGetSeconds(&v16);
  return 0;
}

- (uint64_t)_findClosestIndexToHostTime:(uint64_t)a3 fromIndex:(uint64_t)a4 limitIndex:
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CMTime v12;
  CMTime time1;
  CMTime v14;
  CMTime v15;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  CMTime v19;

  if (result)
  {
    v5 = a3;
    v7 = result;
    if (a3 < a4)
      v8 = 1;
    else
      v8 = -1;
    memset(&v19, 0, sizeof(v19));
    v9 = (void *)objc_msgSend(*(id *)(result + 184), "objectAtIndexedSubscript:");
    if (v9)
      objc_msgSend(v9, "originatingFrameTime");
    else
      memset(&lhs, 0, sizeof(lhs));
    rhs = *a2;
    CMTimeSubtract(&time, &lhs, &rhs);
    CMTimeAbsoluteValue(&v19, &time);
    if (v8 + v5 >= 0)
    {
      while (v8 + v5 < (unint64_t)objc_msgSend(*(id *)(v7 + 184), "count"))
      {
        memset(&rhs, 0, sizeof(rhs));
        v10 = (void *)objc_msgSend(*(id *)(v7 + 184), "objectAtIndexedSubscript:", v8 + v5);
        if (v10)
          objc_msgSend(v10, "originatingFrameTime");
        else
          memset(&v14, 0, sizeof(v14));
        time1 = *a2;
        CMTimeSubtract(&v15, &v14, &time1);
        CMTimeAbsoluteValue(&rhs, &v15);
        time1 = rhs;
        v12 = v19;
        if (CMTimeCompare(&time1, &v12) >= 1)
          break;
        v19 = rhs;
        result = v5 + v8;
        if (v8 - a4 + v5)
        {
          v11 = 2 * v8 + v5;
          v5 += v8;
          if ((v11 & 0x8000000000000000) == 0)
            continue;
        }
        return result;
      }
    }
    return v5;
  }
  return result;
}

- (void)processCountOfVisibleVitalityObjects:(int)a3 forHostTime:(id *)a4
{
  uint64_t v7;
  void *v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;

  if (a3 >= 1 && (a4->var2 & 1) != 0)
  {
    v9 = *a4;
    if (-[FigIrisAutoTrimmer _checkSamplesContainHostTime:]((uint64_t)self, (CMTime *)&v9))
    {
      v7 = -[NSMutableArray count](self->_motionSamples, "count");
      v9 = *a4;
      v8 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", -[FigIrisAutoTrimmer _findClosestIndexToHostTime:fromIndex:limitIndex:]((uint64_t)self, (CMTime *)&v9, v7 - 1, 0));
      objc_msgSend(v8, "setVitalityObjectCount:", objc_msgSend(v8, "vitalityObjectCount") + a3);
    }
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)beginTrimmingForStillImageHostPTS:(SEL)a3 minimumPTS:(id *)a4
{
  void *v9;
  void *v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  char *v12;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  int64_t var3;
  uint64_t v33;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v34;
  CMTime v35;
  CMTime time2;
  CMTime time1;

  self->_haveCaptureMotionDelta = 0;
  *retstr = *a4;
  v9 = (void *)-[NSMutableArray lastObject](self->_motionSamples, "lastObject");
  v10 = v9;
  if (!v9 || (objc_msgSend(v9, "cmTimestamp"), time2 = (CMTime)*a4, CMTimeCompare(&time1, &time2) < 0))
  {
    objc_msgSend(v10, "timestamp");
    if (v31 >= -[FigIrisAutoTrimmer _timeoutThreshold]((uint64_t)self))
    {
LABEL_19:
      v33 = MEMORY[0x1E0CA2E18];
      *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
      var3 = *(_QWORD *)(v33 + 16);
      goto LABEL_20;
    }
LABEL_18:
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&a5->var0;
    var3 = a5->var3;
LABEL_20:
    retstr->var3 = var3;
    goto LABEL_21;
  }
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[NSMutableArray count](self->_motionSamples, "count");
  v12 = (char *)&result[-1].var3 + 7;
  if ((uint64_t)result < 1)
    goto LABEL_18;
  v13 = result;
  while (1)
  {
    v13 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)((char *)v13 - 1);
    v14 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v13);
    v15 = v14;
    memset(&time2, 0, sizeof(time2));
    if (v14)
      objc_msgSend(v14, "cmTimestamp");
    v35 = time2;
    v34 = *a5;
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&v35, (CMTime *)&v34);
    if ((result & 0x80000000) != 0)
      break;
    if (self->_haveCaptureMotionDelta)
    {
      v35 = time2;
      v34 = *a4;
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&v35, (CMTime *)&v34);
      if ((result & 0x80000000) != 0)
      {
        v16 = -[FigIrisAutoTrimmer _findClosestIndexToOffset:atLeastOneFromIndex:limitIndex:]((uint64_t)self, (unint64_t)v13, 0, 0.266666667);
        v17 = -[FigIrisAutoTrimmer _findClosestIndexToOffset:atLeastOneFromIndex:limitIndex:]((uint64_t)self, (unint64_t)v13, (uint64_t)v12, 0.133333333);
        result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[FigIrisAutoTrimmer _shouldCut:withLookahead:withLookback:]((uint64_t)self, v15, (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v16), (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v17));
        if ((result & 1) != 0)
          break;
        *(CMTime *)retstr = time2;
      }
    }
    else
    {
      v35 = time2;
      v34 = *a4;
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&v35, (CMTime *)&v34);
      if ((int)result <= 0)
      {
        objc_msgSend((id)-[NSMutableArray lastObject](self->_motionSamples, "lastObject"), "timestamp");
        v19 = v18;
        result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)objc_msgSend(v15, "timestamp");
        if (v19 - v20 < 0.0333333333)
          goto LABEL_19;
        v21 = -[FigIrisAutoTrimmer _findClosestIndexToOffset:atLeastOneFromIndex:limitIndex:]((uint64_t)self, (unint64_t)v13, 0, 0.0666666667);
        v22 = -[FigIrisAutoTrimmer _findClosestIndexToOffset:atLeastOneFromIndex:limitIndex:]((uint64_t)self, (unint64_t)v13, (uint64_t)v12, 0.0333333333);
        objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v22), "attitudeRelativeTo:", -[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v21));
        self->_captureMotionDelta.w = v23;
        self->_captureMotionDelta.x = v24;
        self->_captureMotionDelta.y = v25;
        self->_captureMotionDelta.z = v26;
        objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v22), "timestamp");
        v28 = v27;
        objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v21), "timestamp");
        self->_captureMotionDeltaPeriod = v28 - v29;
        self->_haveCaptureMotionDelta = 1;
        *(CMTime *)retstr = time2;
        result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)objc_msgSend(v15, "timestamp");
        self->_lastCheckedTimestamp = v30;
        self->_lastStatus = 4;
      }
    }
    if ((uint64_t)v13 <= 0)
      goto LABEL_18;
  }
LABEL_21:
  if ((retstr->var2 & 1) != 0 && !self->_haveCaptureMotionDelta)
  {
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&a5->var0;
    retstr->var3 = a5->var3;
  }
  return result;
}

- (double)_timeoutThreshold
{
  double Host;
  CMTime v4;

  if (!a1)
    return 0.0;
  if ((*(_BYTE *)(a1 + 216) & 1) == 0)
    return -INFINITY;
  Host = -[FigIrisAutoTrimmer _getHostTime](a1);
  v4 = *(CMTime *)(a1 + 204);
  return Host - CMTimeGetSeconds(&v4);
}

- (uint64_t)_findClosestIndexToOffset:(uint64_t)a3 atLeastOneFromIndex:(double)a4 limitIndex:
{
  unint64_t v4;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  double v12;

  if (!a1)
    return 0;
  v4 = a2;
  if ((a2 & 0x8000000000000000) == 0)
  {
    v8 = objc_msgSend(*(id *)(a1 + 184), "count");
    if (v4 != a3 && v8 > v4)
    {
      if ((uint64_t)v4 < a3)
        v9 = 1;
      else
        v9 = -1;
      v10 = v9 + v4;
      if ((uint64_t)(v9 + v4) < 0)
      {
        return -1;
      }
      else
      {
        v11 = objc_msgSend(*(id *)(a1 + 184), "count");
        if (v10 != a3 && v10 < v11)
        {
          objc_msgSend((id)objc_msgSend(*(id *)(a1 + 184), "objectAtIndexedSubscript:", v4), "timestamp");
          return -[FigIrisAutoTrimmer _findClosestIndexToTimestamp:fromIndex:limitIndex:](a1, v9 + v4, a3, v12 + a4 * (double)v9);
        }
        v4 += v9;
      }
    }
  }
  return v4;
}

- (BOOL)_shouldCut:(void *)a3 withLookahead:(void *)a4 withLookback:
{
  if (!a1)
    return 0;
  if (sEnableAllLoggingNoTrim || *(_QWORD *)(a1 + 176) || *(_BYTE *)(a1 + 200))
  {
    objc_msgSend(a2, "prepareIntermediates:", *(_QWORD *)(a1 + 192));
    -[FigIrisAutoTrimmer _isUnstable:withLookback:](a1, a2, a4);
    -[FigIrisAutoTrimmer _shouldCutUnstable:withLookahead:](a1, a2, a3);
    *(_QWORD *)(a1 + 192) = objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "count");
    if (sEnableAllLoggingNoTrim)
      return 0;
  }
  if (*(_QWORD *)(a1 + 176))
    return -[FigIrisAutoTrimmer _shouldCutSVM:](a1, a2);
  if (!-[FigIrisAutoTrimmer _isUnstable:withLookback:](a1, a2, a4))
    return 0;
  return -[FigIrisAutoTrimmer _shouldCutUnstable:withLookahead:](a1, a2, a3);
}

- (BOOL)trimmingActive
{
  return self->_haveCaptureMotionDelta;
}

- (int)emissionStatusForHostPTS:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  double v8;
  void *v9;
  int64_t v10;
  int lastStatus;
  void *v12;
  void *v13;
  double v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  void *v20;
  void *v21;
  double v22;
  CMTime v24;
  _QWORD v25[5];
  CMTime time2;
  CMTime time1;
  CMTime v28;
  CMTime v29;
  CMTime lhs;
  CMTime rhs;
  CMTime time;
  CMTime v33;

  v33 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E30];
  if (!self->_haveCaptureMotionDelta)
    return 4;
  v5 = -[FigIrisAutoTrimmer _findClosestIndexToOffset:atLeastOneFromIndex:limitIndex:]((uint64_t)self, -[NSMutableArray count](self->_motionSamples, "count") - 1, -[NSMutableArray count](self->_motionSamples, "count") + ~self->_maxHoldFrames, 0.333333333);
  v6 = v5;
  do
  {
    if (v6-- < 1)
    {
      v10 = 0;
      goto LABEL_11;
    }
    objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v6), "timestamp");
  }
  while (v8 > self->_lastCheckedTimestamp);
  v9 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v6);
  v10 = v6 + 1;
  if (v9)
    objc_msgSend(v9, "cmTimestamp");
  else
    memset(&rhs, 0, sizeof(rhs));
  lhs = (CMTime)*a3;
  CMTimeSubtract(&time, &lhs, &rhs);
  CMTimeAbsoluteValue(&v33, &time);
LABEL_11:
  if (v10 >= v5)
  {
LABEL_26:
    v21 = (void *)-[NSMutableArray lastObject](self->_motionSamples, "lastObject", v24.value, *(_QWORD *)&v24.timescale, v24.epoch);
    if (v21
      && (objc_msgSend(v21, "timestamp"), v22 >= -[FigIrisAutoTrimmer _timeoutThreshold]((uint64_t)self))
      && self->_motionAvailable)
    {
      return 5;
    }
    else
    {
      lastStatus = 4;
      self->_lastStatus = 4;
    }
  }
  else
  {
    while (1)
    {
      v12 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v10, v24.value, *(_QWORD *)&v24.timescale, v24.epoch);
      v13 = v12;
      memset(&lhs, 0, sizeof(lhs));
      if (v12)
        objc_msgSend(v12, "cmTimestamp");
      else
        memset(&v28, 0, sizeof(v28));
      time1 = (CMTime)*a3;
      CMTimeSubtract(&v29, &time1, &v28);
      CMTimeAbsoluteValue(&lhs, &v29);
      time1 = lhs;
      time2 = v33;
      if (CMTimeCompare(&time1, &time2) > 0)
        break;
      v33 = lhs;
      objc_msgSend(v13, "timestamp");
      self->_lastCheckedTimestamp = v14;
      v15 = -[FigIrisAutoTrimmer _findClosestIndexToOffset:atLeastOneFromIndex:limitIndex:]((uint64_t)self, v10, -[NSMutableArray count](self->_motionSamples, "count") - 1, 0.0666666667);
      if (v10 != v15)
        -[NSMutableArray count](self->_motionSamples, "count");
      v16 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v15);
      v17 = -[FigIrisAutoTrimmer _findClosestIndexToOffset:atLeastOneFromIndex:limitIndex:]((uint64_t)self, v15, -[NSMutableArray count](self->_motionSamples, "count") - 1, 0.266666667);
      v18 = -[FigIrisAutoTrimmer _findClosestIndexToOffset:atLeastOneFromIndex:limitIndex:]((uint64_t)self, v15, 0, 0.133333333);
      v19 = -[FigIrisAutoTrimmer _shouldCut:withLookahead:withLookback:]((uint64_t)self, v16, (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v17), (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v18));
      if (objc_msgSend(v16, "intermediateCalculations"))
      {
        v20 = (void *)objc_msgSend(v16, "intermediateCalculations");
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __47__FigIrisAutoTrimmer_emissionStatusForHostPTS___block_invoke;
        v25[3] = &unk_1E4926730;
        v25[4] = v13;
        objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v25);
        objc_msgSend((id)objc_msgSend(v16, "intermediateCalculations"), "removeAllObjects");
      }
      if (v19)
      {
        lastStatus = 1;
        self->_lastStatus = 1;
        time1 = (CMTime)*a3;
        self->_lastCheckedTimestamp = CMTimeGetSeconds(&time1);
        return lastStatus;
      }
      self->_lastStatus = 4;
      if (v13)
        objc_msgSend(v13, "cmTimestamp");
      else
        memset(&v24, 0, sizeof(v24));
      time1 = (CMTime)*a3;
      if (CMTimeCompare(&v24, &time1) > 0)
        break;
      if (++v10 >= v5)
        goto LABEL_26;
    }
    lastStatus = self->_lastStatus;
    if ((lastStatus & 0xFFFFFFFB) != 1)
    {
      lhs = v33;
      CMTimeGetSeconds(&lhs);
    }
  }
  return lastStatus;
}

uint64_t __47__FigIrisAutoTrimmer_emissionStatusForHostPTS___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "intermediateCalculations"), "objectForKeyedSubscript:", a2))
    __47__FigIrisAutoTrimmer_emissionStatusForHostPTS___block_invoke_cold_1();
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "intermediateCalculations"), "setObject:forKeyedSubscript:", a3, a2);
}

- (float)computeVitalityScoreForStillImageHostPTS:(id *)a3 movieRange:(id *)a4
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  float v11;
  double v13;
  CMTime v14;
  CMTime time1;
  CMTimeRange range;
  CMTime v17;

  memset(&v17, 0, sizeof(v17));
  v6 = *(_OWORD *)&a4->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&range.start.epoch = v6;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a4->var1.var1;
  CMTimeRangeGetEnd(&v17, &range);
  if (!-[NSMutableArray count](self->_motionSamples, "count"))
  {
LABEL_17:
    -[NSMutableArray count](self->_motionSamples, "count", v14.value, *(_QWORD *)&v14.timescale, v14.epoch);
    return 1.0;
  }
  v7 = 0;
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    v9 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v7, v14.value, *(_QWORD *)&v14.timescale, v14.epoch, time1.value, *(_QWORD *)&time1.timescale, time1.epoch);
    if (v9)
      objc_msgSend(v9, "originatingFrameTime");
    else
      memset(&time1, 0, sizeof(time1));
    *(_OWORD *)&range.start.value = *(_OWORD *)&a4->var0.var0;
    range.start.epoch = a4->var0.var3;
    if ((CMTimeCompare(&time1, &range.start) & 0x80000000) == 0)
      break;
LABEL_13:
    if (++v7 >= (unint64_t)-[NSMutableArray count](self->_motionSamples, "count", v14.value, *(_QWORD *)&v14.timescale, v14.epoch))
    {
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_17;
LABEL_20:
      v7 = -[NSMutableArray count](self->_motionSamples, "count", v14.value, *(_QWORD *)&v14.timescale, v14.epoch);
      goto LABEL_21;
    }
  }
  v10 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v7);
  if (v10)
    objc_msgSend(v10, "originatingFrameTime");
  else
    memset(&v14, 0, sizeof(v14));
  range.start = v17;
  if (CMTimeCompare(&v14, &range.start) < 0)
  {
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      v8 = v7;
    goto LABEL_13;
  }
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_17;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_20;
LABEL_21:
  v11 = 1.0;
  if (v8 < v7)
  {
    v11 = -[FigIrisAutoTrimmer _computeVitalityFrom:to:]((uint64_t)self, v8, v7);
    if (self->_intermediateLoggingEnabled)
    {
      do
      {
        objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v8, v14.value, *(_QWORD *)&v14.timescale, v14.epoch), "prepareIntermediates:", self->_estimatedIntermediatesCount);
        *(float *)&v13 = v11;
        objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v8++), "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13), CFSTR("vitality"));
      }
      while (v7 != v8);
    }
  }
  return v11;
}

- (float)_computeVitalityFrom:(uint64_t)a3 to:
{
  uint64_t v4;
  float v6;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;

  if (!a1)
    return 0.0;
  v4 = a2;
  v6 = 1.0;
  if (*(float *)(a1 + 268) >= 0.0 && a2 < a3)
  {
    v8 = a2;
    while ((int)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 184), "objectAtIndexedSubscript:", v8), "vitalityObjectCount") <= 0)
    {
      if (a3 == ++v8)
      {
        v9 = 0;
        v10 = *MEMORY[0x1E0D07960];
        v11 = *MEMORY[0x1E0D07918];
        v12 = 0.0;
        do
        {
          v13 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 184), "objectAtIndexedSubscript:", v4), "inferences");
          if (v13)
          {
            v14 = *(unsigned __int16 *)(a1 + 276);
            v15 = v11;
            if (v14 >= 5)
            {
              if (v14 != 5 || (v15 = v11, *(_WORD *)(a1 + 278)))
                v15 = v10;
            }
            v16 = (void *)objc_msgSend(v13, "objectForKeyedSubscript:", v15);
            if (v16)
            {
              objc_msgSend(v16, "floatValue");
              v12 = v12 + v17;
              ++v9;
            }
          }
          ++v4;
        }
        while (a3 != v4);
        if (v9)
        {
          v18 = *(float *)(a1 + 268);
          v19 = v18 - (float)(v12 / (float)v9);
          v20 = fabsf(v18);
          v21 = fabsf(v18 + -1.0);
          if (v20 > v21)
            v21 = v20;
          return (float)((float)(v19 / v21) * 0.5) + 0.5;
        }
        return v6;
      }
    }
  }
  return v6;
}

- (unsigned)vitalityScoringVersion
{
  return self->_vitalityScoringVersion;
}

- (uint64_t)_directionalWeightForSample:(uint64_t)result
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  long double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;
  float v18;
  float v19;
  double v20;
  float v21;
  double v22;
  float v23;
  double v24;
  float v25;

  if (result)
  {
    v3 = result;
    objc_msgSend(a2, "accel");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v10 = sqrt(v6 * v6 + v4 * v4 + v8 * v8);
    v11 = acos(*(long double *)(v3 + 16));
    v12 = v11 + v11;
    if (v12 > 3.14159265)
      v12 = v12 + -6.28318531;
    v13 = fabs(v12) / *(double *)(v3 + 48);
    if (objc_msgSend(a2, "intermediateCalculations"))
    {
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10 < 0.0001), CFSTR("noAccel"));
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13), CFSTR("captureRate"));
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13 > *(double *)&sMotionThreshold), CFSTR("usingCaptureDP"));
    }
    if (v10 >= 0.0001)
    {
      if (v13 <= *(double *)&sMotionThreshold)
      {
        objc_msgSend(a2, "gravity");
        v14 = v17;
        objc_msgSend(a2, "gravity");
        v15 = v18;
        objc_msgSend(a2, "gravity");
        v16 = v19;
      }
      else
      {
        v14 = *(double *)(v3 + 24);
        v15 = *(double *)(v3 + 32);
        v16 = *(double *)(v3 + 40);
      }
      v20 = (v7 * v15 + v14 * v5 + v16 * v9) / (v10 * sqrt(v15 * v15 + v14 * v14 + v16 * v16));
      result = objc_msgSend(a2, "intermediateCalculations");
      if (result)
      {
        objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v7 * *(double *)(v3 + 32) + *(double *)(v3 + 24) * v5 + *(double *)(v3 + 40) * v9)/ (v10* sqrt(*(double *)(v3 + 32) * *(double *)(v3 + 32)+ *(double *)(v3 + 24) * *(double *)(v3 + 24)+ *(double *)(v3 + 40) * *(double *)(v3 + 40)))), CFSTR("captureDP"));
        objc_msgSend(a2, "gravity");
        v22 = v21;
        objc_msgSend(a2, "gravity");
        v24 = v23;
        objc_msgSend(a2, "gravity");
        objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v7 * v24 + v22 * v5 + v25 * v9) / (v10 * sqrt(v24 * v24 + v22 * v22 + v25 * v25))), CFSTR("gravityDP"));
        return objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20), CFSTR("weightDP"));
      }
    }
    else
    {
      result = objc_msgSend(a2, "intermediateCalculations");
      if (result)
      {
        objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", &unk_1E49FBA00, CFSTR("captureDP"));
        objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", &unk_1E49FBA00, CFSTR("gravityDP"));
        return objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.735294118), CFSTR("weightDP"));
      }
    }
  }
  return result;
}

- (BOOL)_isUnstable:(void *)a3 withLookback:
{
  uint64_t v5;
  long double v6;
  long double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  long double v12;
  long double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  long double v20;
  double v21;
  double v22;
  double v23;
  long double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;

  if (result)
  {
    v5 = result;
    objc_msgSend(a2, "delta");
    v7 = acos(v6);
    v8 = v7 + v7;
    if (v8 > 3.14159265)
      v8 = v8 + -6.28318531;
    v9 = fabs(v8);
    objc_msgSend(a2, "deltaPeriod");
    v11 = v9 / v10;
    objc_msgSend(a3, "delta");
    v13 = acos(v12);
    v14 = v13 + v13;
    if (v14 > 3.14159265)
      v14 = v14 + -6.28318531;
    v15 = fabs(v14);
    objc_msgSend(a3, "deltaPeriod");
    v17 = v15 / v16;
    if (v15 / v16 >= v11)
      v18 = v11;
    else
      v18 = v15 / v16;
    objc_msgSend(a2, "accel");
    v20 = v19;
    -[FigIrisAutoTrimmer _directionalWeightForSample:](v5, a2);
    v22 = v21;
    v23 = 1.0 / (v18 * 1.5 + 1.0);
    v24 = acos(v20);
    v25 = v24 + v24;
    if (v25 > 3.14159265)
      v25 = v25 + -6.28318531;
    v26 = fabs(v25);
    objc_msgSend(a2, "deltaPeriod");
    v28 = v23 * (v22 * (v26 / v27));
    objc_msgSend(a2, "timestamp");
    if (objc_msgSend(a2, "intermediateCalculations"))
    {
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17), CFSTR("deltaMagnitudeLookback"));
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11), CFSTR("deltaMagnitudeSample"));
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18), CFSTR("deltaMagnitude"));
      v29 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(a2, "deltaPeriod");
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(v29, "numberWithDouble:", v26 / v30), CFSTR("accelMagnitude"));
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22), CFSTR("dirWeight"));
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23), CFSTR("speedWeight"));
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28), CFSTR("weightedAccelMagnitude"));
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v28 > *(double *)&sBadAccelThreshold), CFSTR("unstable"));
    }
    return v28 > *(double *)&sBadAccelThreshold;
  }
  return result;
}

- (BOOL)_shouldCutUnstable:(void *)a3 withLookahead:
{
  long double v5;
  long double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  long double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  unint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;

  if (result)
  {
    objc_msgSend(a3, "attitudeRelativeTo:", a2);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = acos(v5);
    v14 = v13 + v13;
    if (v14 > 3.14159265)
      v14 = v14 + -6.28318531;
    v15 = fabs(v14);
    objc_msgSend(a3, "timestamp");
    v17 = v16;
    objc_msgSend(a2, "timestamp");
    v19 = vabdd_f64(v17, v18);
    v20 = 0.0;
    if (v19 <= 0.0001)
      v21 = 0.0;
    else
      v21 = v15 / v19;
    objc_msgSend(a3, "timestamp");
    objc_msgSend(a2, "timestamp");
    objc_msgSend(a2, "accel");
    v26 = sqrt(v10 * v10 + v8 * v8 + v12 * v12);
    if (v26 >= 0.00001)
    {
      v27 = sqrt(v24 * v24 + v23 * v23 + v25 * v25);
      if (v27 >= 0.00001)
        v20 = (v10 * v24 + v8 * v23 + v12 * v25) / (v26 * v27);
    }
    if (*(_QWORD *)&v6 >> 63 == v22 >> 63)
      v28 = v20;
    else
      v28 = -v20;
    if (objc_msgSend(a2, "intermediateCalculations"))
    {
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15), CFSTR("aheadAngle"));
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21 * v28), CFSTR("aheadAccComp"));
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28), CFSTR("accelConsistency"));
    }
    return v21 * v28 > 0.47;
  }
  return result;
}

- (BOOL)_shouldCutSVM:(_BOOL8)result
{
  uint64_t v3;
  uint64_t v4;
  const float *v5;
  vDSP_Length v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  int v12;
  uint64_t v13;
  int *v14;
  float *v15;
  int v16;
  uint64_t v17;
  float *v18;
  const float *v19;
  int v20;
  uint64_t v21;
  float *v22;
  vDSP_Length v23;
  float *v24;
  _QWORD v25[2];
  float __B;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = objc_msgSend(*(id *)(result + 168), "bytes");
    v5 = (const float *)objc_msgSend(*(id *)(v3 + 176), "bytes");
    v25[1] = v25;
    v6 = *(int *)(v3 + 148) - 1;
    v7 = (4 * v6 + 15) & 0xFFFFFFFFFFFFFFF0;
    if (objc_msgSend(*(id *)(v3 + 160), "count"))
    {
      v8 = 0;
      do
      {
        v9 = objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "objectForKeyedSubscript:", objc_msgSend(*(id *)(v3 + 160), "objectAtIndexedSubscript:", v8));
        v10 = 0;
        if (v9)
        {
          v11 = (void *)v9;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v11, "floatValue");
            v10 = v12;
          }
        }
        *(_DWORD *)((char *)v25 + 4 * v8++ - v7) = v10;
      }
      while (objc_msgSend(*(id *)(v3 + 160), "count") > v8);
    }
    vDSP_vma((const float *)((char *)v25 - v7), 1, (const float *)(v4 + 8), 2, (const float *)(v4 + 12), 2, (float *)((char *)v25 - v7), 1, v6);
    v14 = (int *)(v3 + 144);
    v13 = *(unsigned int *)(v3 + 144);
    v15 = (float *)((char *)v25 - ((4 * v13 + 15) & 0x7FFFFFFF0));
    v16 = *(_DWORD *)(v3 + 140);
    if (v16 == 1)
    {
      v19 = (const float *)((char *)v25 - ((4 * v13 + 15) & 0x7FFFFFFF0));
      v20 = *v14;
      if (*v14 < 1)
      {
        v23 = v20;
      }
      else
      {
        v25[0] = v25;
        v21 = 0;
        v22 = (float *)v19;
        do
        {
          vDSP_distancesq(&v5[*(_DWORD *)(v3 + 148) * (int)v21++ + 1], 1, (const float *)((char *)v25 - v7), 1, v22, v6);
          v20 = *(_DWORD *)(v3 + 144);
          ++v22;
        }
        while (v21 < v20);
        v23 = v20;
      }
      __B = -*(float *)(v3 + 156);
      v24 = (float *)((char *)v25 - ((4 * v20 + 15) & 0x7FFFFFFF0));
      vDSP_vsmul(v19, 1, &__B, v24, 1, v23);
      vvexpf(v15, v24, (const int *)(v3 + 144));
      LODWORD(v13) = *(_DWORD *)(v3 + 144);
    }
    else if (!v16 && (int)v13 >= 1)
    {
      v17 = 0;
      v18 = (float *)((char *)v25 - ((4 * *(unsigned int *)(v3 + 144) + 15) & 0x7FFFFFFF0));
      do
      {
        vDSP_dotpr(&v5[*(_DWORD *)(v3 + 148) * (int)v17++ + 1], 1, (const float *)((char *)v25 - v7), 1, v18, v6);
        v13 = *(int *)(v3 + 144);
        ++v18;
      }
      while (v17 < v13);
    }
    __B = 0.0;
    vDSP_dotpr(v5, *(int *)(v3 + 148), v15, 1, &__B, (int)v13);
    return __B > *(float *)(v3 + 152);
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxHoldDuration
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[8].var2;
  retstr->var3 = *(int64_t *)((char *)&self[9].var0 + 4);
  return self;
}

- (double)bufferHistorySeconds
{
  return self->_bufferHistorySeconds;
}

- (double)videoFrameRate
{
  return self->_motionSampleRate;
}

- (BOOL)intermediateLoggingEnabled
{
  return self->_intermediateLoggingEnabled;
}

- (void)setIntermediateLoggingEnabled:(BOOL)a3
{
  self->_intermediateLoggingEnabled = a3;
}

- (BOOL)vitalityScoringEnabled
{
  return self->_vitalityScoringEnabled;
}

- ($2ACC23B9A21F50F5CC728381CA870116)vitalityScoringSmartCameraPipelineVersion
{
  return ($2ACC23B9A21F50F5CC728381CA870116)(*(unsigned int *)&self->_vitalityScoringSmartCameraPipelineVersion.major | ((unint64_t)self->_vitalityScoringSmartCameraPipelineVersion.patch << 32));
}

- (Float64)_getHostTime
{
  OpaqueCMClock *HostTimeClock;
  CMTime v3;
  CMTime v4;

  if (!a1)
    return 0.0;
  memset(&v4, 0, sizeof(v4));
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v4, HostTimeClock);
  v3 = v4;
  return CMTimeGetSeconds(&v3);
}

- (id)exportMotionSamples
{
  return self->_motionSamples;
}

void __47__FigIrisAutoTrimmer_emissionStatusForHostPTS___block_invoke_cold_1()
{
  __assert_rtn("-[FigIrisAutoTrimmer emissionStatusForHostPTS:]_block_invoke", "FigIrisAutoTrimmer.m", 544, "sample.intermediateCalculations[key] == nil");
}

@end
