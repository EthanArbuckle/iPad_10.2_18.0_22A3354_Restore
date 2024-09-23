@implementation BWDeviceMotionActivityDetector

- (BOOL)isStationary
{
  BOOL stationary;

  pthread_mutex_lock((pthread_mutex_t *)self->_ringMutex);
  if (self->_newMotionDataAvailable)
  {
    -[BWDeviceMotionActivityDetector _detectIfStationary]((uint64_t)self);
    self->_newMotionDataAvailable = 0;
  }
  stationary = self->_stationary;
  pthread_mutex_unlock((pthread_mutex_t *)self->_ringMutex);
  return stationary;
}

- (void)_detectIfStationary
{
  uint64_t v2;
  double v3;
  uint64_t *v4;
  uint64_t v5;
  __int128 *v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  long double v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  BOOL v16;
  uint64_t v17;
  float v18;
  double v19;
  float v20;
  float v21;
  float v22;
  float v23;
  uint64_t i;
  uint64_t v25;
  double v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  int v32;
  float v33;
  float v34;
  float v35;
  float v36;
  double v37;
  float32x2_t v38;
  float v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  FigSimpleMutexCheckIsLockedOnThisThread();
  v52 = 0u;
  v53 = 0u;
  v2 = *(_QWORD *)(a1 + 8);
  if (!v2)
    goto LABEL_8;
  v2 = *(_QWORD *)(v2 + 8);
  if (!v2)
    goto LABEL_8;
  if ((*(_DWORD *)(v2 + 20) + *(_DWORD *)(v2 + 24) - *(_DWORD *)(v2 + 16)) % *(_DWORD *)(v2 + 24) < 2)
    goto LABEL_7;
  mach_absolute_time();
  v3 = (double)(FigHostTimeToNanoseconds() / 1000) / 1000000.0;
  v4 = *(uint64_t **)(a1 + 8);
  if (v3 - *(double *)(-[BWRingBuffer lastElement](v4[1]) + 8) > 1.0
    || -[BWMotionSampleRingBuffer duration]((uint64_t)v4) < 0.5)
  {
    goto LABEL_7;
  }
  if (!*(_BYTE *)(a1 + 25))
  {
    LODWORD(v2) = *(_BYTE *)(a1 + 24) != 0;
    goto LABEL_8;
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v13 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (!v13)
  {
LABEL_7:
    LODWORD(v2) = 0;
    goto LABEL_8;
  }
  v14 = v13;
  v15 = 0;
  v16 = 0;
  v17 = *(_QWORD *)v49;
  v18 = 0.0;
  v19 = 0.0;
  v20 = 0.0;
  v21 = 0.0;
  v22 = 0.0;
  v23 = 0.0;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v49 != v17)
        objc_enumerationMutation(v4);
      v25 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
      v26 = *(double *)(v25 + 8);
      v27 = *(_OWORD *)(v25 + 32);
      v46 = *(_OWORD *)(v25 + 16);
      v47 = v27;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v39 = 0.0;
      v38 = 0;
      if (v16)
      {
        v42 = v46;
        v43 = v47;
        v40 = v52;
        v41 = v53;
        *(_QWORD *)&v44 = FigMotionMultiplyByInverseOfQuaternion((double *)&v42, (uint64_t *)&v40);
        *((_QWORD *)&v44 + 1) = v28;
        *(_QWORD *)&v45 = v29;
        *((_QWORD *)&v45 + 1) = v30;
        *(float *)&v31 = FigMotionRotationRateFromDeltaQuaternion((double *)&v44, &v38, v26 - v19);
        if (v32)
        {
          v16 = 1;
          continue;
        }
        v33 = (float)((float)(v38.f32[0] * v38.f32[0]) + (float)(v38.f32[1] * v38.f32[1])) + (float)(v39 * v39);
        if (*(_BYTE *)(a1 + 26))
        {
          v21 = v21 + v38.f32[0];
          v20 = v20 + v38.f32[1];
          v18 = v18 + v39;
        }
        else
        {
          v34 = sqrtf(v33);
          if (v34 >= 0.1)
            goto LABEL_7;
          v23 = v23 + v34;
        }
        v22 = v22 + v33;
        ++v15;
        v16 = 1;
      }
      else
      {
        v16 = *(double *)(-[BWRingBuffer lastElement](*(_QWORD *)(*(_QWORD *)(a1 + 8) + 8)) + 8) - v26 < 1.0;
      }
      v31 = *(double *)&v46;
      v52 = v46;
      v53 = v47;
      v19 = v26;
    }
    v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v48, v54, 16, v31);
  }
  while (v14);
  if (!v15)
    goto LABEL_7;
  v35 = (float)v15;
  if (*(_BYTE *)(a1 + 26))
  {
    v36 = (float)((float)(v18 / v35) * (float)(v18 / v35))
        + (float)((float)((float)(v20 / v35) * (float)(v20 / v35)) + (float)((float)(v21 / v35) * (float)(v21 / v35)));
    v37 = (float)((float)(v22 / v35) - v36);
    if (v37 < 0.00004225)
    {
      if (!*(_BYTE *)(a1 + 28))
        goto LABEL_17;
LABEL_10:
      v5 = *(_QWORD *)(a1 + 8);
      if (v5)
      {
        v6 = (__int128 *)-[BWRingBuffer lastElement](*(_QWORD *)(v5 + 8));
        if (v6)
        {
          v7 = *v6;
          v8 = v6[1];
          *(_OWORD *)(a1 + 72) = v6[2];
          *(_OWORD *)(a1 + 56) = v8;
          *(_OWORD *)(a1 + 40) = v7;
        }
      }
LABEL_17:
      LOBYTE(v2) = 1;
      goto LABEL_43;
    }
    LODWORD(v2) = v36 < 0.00000625;
    if (v37 >= 0.000121)
      LODWORD(v2) = 0;
  }
  else
  {
    LODWORD(v2) = (float)(v23 / v35) < 0.005;
  }
LABEL_8:
  if (*(_BYTE *)(a1 + 28))
  {
    if ((_DWORD)v2)
      goto LABEL_10;
    if (*(double *)(a1 + 48) == 0.0)
    {
      LOBYTE(v2) = 0;
    }
    else
    {
      v9 = *(_QWORD *)(a1 + 8);
      if (v9)
      {
        v10 = -[BWRingBuffer lastElement](*(_QWORD *)(v9 + 8));
        if (v10)
        {
          v11 = FigMotionMultiplyByInverseOfQuaternion((double *)(v10 + 16), (uint64_t *)(a1 + 56));
          v12 = acos(v11);
          if ((v12 + v12) * 57.2957795 < *(double *)(a1 + 32))
            goto LABEL_17;
        }
      }
      LOBYTE(v2) = 0;
      *(_OWORD *)(a1 + 56) = 0u;
      *(_OWORD *)(a1 + 72) = 0u;
      *(_OWORD *)(a1 + 40) = 0u;
    }
  }
LABEL_43:
  *(_BYTE *)(a1 + 24) = v2;
}

- (void)setDirectionalMotionDetectionEnabled:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  pthread_mutex_lock((pthread_mutex_t *)self->_ringMutex);
  if (self->_directionalMotionDetectionEnabled != v3)
  {
    self->_directionalMotionDetectionEnabled = v3;
    self->_directionalMotionDetectionAngularRotationThreshold = 2.0;
    *(_OWORD *)&self->_directionalMotionDetectionReferenceDirection.doingBiasEstimation = 0u;
    *(_OWORD *)&self->_directionalMotionDetectionReferenceDirection.quaternion.w = 0u;
    *(_OWORD *)&self->_directionalMotionDetectionReferenceDirection.quaternion.y = 0u;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_ringMutex);
}

- (void)processSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  int v8;
  float64x2_t v9[330];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06B68]);
    bzero(v9, 0x14A0uLL);
    v8 = 0;
    if (v6)
    {
      if (FigMotionGetMotionDataFromISP((CFDictionaryRef)v5, v9, 0, 110, &v8, 0, 0, 0, 0))
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      else
      {
        if (!self->_motionMetadataStatusChecked)
        {
          self->_motionMetadataStatusChecked = 1;
          self->_robustMethodEnabled = objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D06B70]) != 0;
        }
        pthread_mutex_lock((pthread_mutex_t *)self->_ringMutex);
        v7 = v8;
        if (v8)
        {
          self->_newMotionDataAvailable = 1;
          -[BWMotionSampleRingBuffer addMotionDataToRingBuffer:withSampleCount:]((uint64_t)self->_motionDataRingBuffer, v9[0].f64, v7);
        }
        pthread_mutex_unlock((pthread_mutex_t *)self->_ringMutex);
      }
    }
  }
}

- (BWDeviceMotionActivityDetector)init
{
  BWDeviceMotionActivityDetector *v2;
  BWMotionSampleRingBuffer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWDeviceMotionActivityDetector;
  v2 = -[BWDeviceMotionActivityDetector init](&v5, sel_init);
  if (v2)
  {
    v2->_ringMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v3 = (BWMotionSampleRingBuffer *)-[BWMotionSampleRingBuffer initWithMaxDuration:]([BWMotionSampleRingBuffer alloc], 1.0);
    v2->_motionDataRingBuffer = v3;
    if (!v3)
    {

      return 0;
    }
  }
  return v2;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  FigSimpleMutexDestroy();

  v3.receiver = self;
  v3.super_class = (Class)BWDeviceMotionActivityDetector;
  -[BWDeviceMotionActivityDetector dealloc](&v3, sel_dealloc);
}

- (BOOL)isDirectionalMotionDetectionEnabled
{
  BOOL directionalMotionDetectionEnabled;

  pthread_mutex_lock((pthread_mutex_t *)self->_ringMutex);
  directionalMotionDetectionEnabled = self->_directionalMotionDetectionEnabled;
  pthread_mutex_unlock((pthread_mutex_t *)self->_ringMutex);
  return directionalMotionDetectionEnabled;
}

@end
