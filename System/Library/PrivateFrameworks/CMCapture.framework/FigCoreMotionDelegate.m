@implementation FigCoreMotionDelegate

- (BOOL)managingGravity
{
  return self->manageGravity;
}

- (void)didUpdateAcceleration:(id)a3 time:(double)a4
{
  float var2;
  float var1;
  float var0;
  _opaque_pthread_mutex_t *p_ringMutex;
  uint64_t accelRingIndex;
  float *v11;

  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  p_ringMutex = &self->ringMutex;
  if (!pthread_mutex_lock(&self->ringMutex))
  {
    accelRingIndex = self->accelRingIndex;
    self->accelRingIndex = (accelRingIndex + 1);
    self->accelRingTime[accelRingIndex] = a4;
    v11 = (float *)((char *)self + 4 * accelRingIndex);
    v11[22] = var0;
    v11[278] = var1;
    v11[534] = var2;
    pthread_mutex_unlock(p_ringMutex);
  }
}

- (int)getVectorX:(float *)a3 y:(float *)a4 z:(float *)a5 forTimeStamp:(double)a6
{
  FigCoreMotionDelegate *v10;
  _opaque_pthread_mutex_t *p_ringMutex;
  int v12;
  float v13;
  float v14;
  float v15;
  float v16;
  uint64_t v17;
  double *accelRingTime;
  double v19;
  double v20;
  float v21;
  float v22;
  float v23;

  v10 = self;
  p_ringMutex = &self->ringMutex;
  v12 = pthread_mutex_lock(&self->ringMutex);
  v13 = 0.0;
  v14 = 0.0;
  v15 = 0.0;
  v16 = 0.0;
  if (!v12)
  {
    v17 = 0;
    accelRingTime = v10->accelRingTime;
    v19 = a6 + 0.0333333351;
    do
    {
      v20 = accelRingTime[v17];
      if (v20 != 0.0)
      {
        v21 = v19 - v20;
        v22 = expf(-(float)((float)(v21 * 15.0) * (float)(v21 * 15.0)));
        v13 = v13 + (float)(v22 * v10->accelRingX[0]);
        v14 = v14 + (float)(v22 * v10->accelRingY[0]);
        v15 = v15 + (float)(v22 * v10->accelRingZ[0]);
        v16 = v16 + v22;
      }
      ++v17;
      v10 = (FigCoreMotionDelegate *)((char *)v10 + 4);
    }
    while (v17 != 256);
    pthread_mutex_unlock(p_ringMutex);
  }
  v23 = 1.0 / v16;
  if (v16 <= 0.0)
    v23 = v16;
  *a3 = v13 * v23;
  *a4 = v14 * v23;
  *a5 = v15 * v23;
  return v12;
}

- (FigCoreMotionDelegate)initWithAccelerometer:(BOOL)a3 gravityZ:(BOOL)a4 fusedMotion:(BOOL)a5 accelUpdateInterval:(float)a6 fusedMotionUpdateInterval:(float)a7 motionCallbackThreadPriority:(id)a8
{
  FigCoreMotionDelegate *v14;
  FigCoreMotionDelegate *v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)FigCoreMotionDelegate;
  v14 = -[FigCoreMotionDelegate init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->copyingAllData = 0;
    v14->dLatestTimestamp = -1.0;
    v16 = mach_absolute_time();
    v17 = dword_1ECFE9E50;
    if (!dword_1ECFE9E50)
    {
      mach_timebase_info((mach_timebase_info_t)&MachTimeToMicroseconds_sTimebaseInfo);
      v17 = dword_1ECFE9E50;
    }
    v15->dStartOfLogging = (double)(v16 * MachTimeToMicroseconds_sTimebaseInfo / v17 / 0x3E8) / 1000000.0
                         + 2.0;
    v15->dGyroUpdateInterval = a7;
    v15->currentQuaternion.w = 1.0;
    v15->currentQuaternion.x = 0.0;
    *(_OWORD *)&v15->currentQuaternion.y = 0u;
    v15->previousQuaternion.w = 1.0;
    *(_QWORD *)&v15->velocity.x = 0;
    v15->velocity.z = 0.0;
    v15->previousQuaternion.x = 0.0;
    *(_OWORD *)&v15->previousQuaternion.y = 0u;
    v15->velocity.timestamp = -1.0;
    *(_QWORD *)&v15->position.x = 0;
    v15->position.z = 0.0;
    v15->position.timestamp = -1.0;
    v15->computingPosition = 0;
    v15->manageAccel = a3;
    v15->manageGravity = a4;
    v15->manageFusedMotion = a5;
    pthread_mutex_init(&v15->ringMutex, 0);
    v15->dataSemaphore = (OpaqueFigSemaphore *)FigSemaphoreCreate();
    *(_OWORD *)&v15->latestMotionDataTime = 0u;
    if (v15->manageFusedMotion || v15->manageAccel)
    {
      MEMORY[0x1A858C99C](&readUserDefaultsOnce_sReadFigCoreMotionDelegateUserDefaultsOnce, readUserDefaults);
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA5670]), "initUsingGyroOnlySensorFusion");
      v15->motionManager = (CMMotionManager *)v18;
      if (v18)
      {
        if (a8)
        {
          v19 = (void *)v18;
          objc_msgSend(a8, "unsignedIntValue");
          objc_msgSend(v19, "setMotionThreadPriority:", FigThreadGetMachThreadPriorityValue());
        }
        if (v15->manageAccel)
          -[CMMotionManager setAccelerometerDataCallback:info:interval:](v15->motionManager, "setAccelerometerDataCallback:info:interval:", accelerometerDataCallback, v15, a6);
        if (v15->manageFusedMotion
          && -[CMMotionManager isDeviceMotionAvailable](v15->motionManager, "isDeviceMotionAvailable"))
        {
          -[CMMotionManager setDeviceMotionCallback:info:interval:fsync:](v15->motionManager, "setDeviceMotionCallback:info:interval:fsync:", deviceMotionCallback, v15, 1, v15->dGyroUpdateInterval);
        }
      }
    }
  }
  return v15;
}

- (void)updateDeviceCallback:(BOOL)a3 fusedMotionUpdateInterval:(float)a4
{
  CMMotionManager *motionManager;
  uint64_t (*v7)(uint64_t, void *);
  CMMotionManager *v8;
  FigCoreMotionDelegate *v9;
  uint64_t v10;

  motionManager = self->motionManager;
  if (motionManager)
  {
    self->manageFusedMotion = a3;
    if (-[CMMotionManager isDeviceMotionAvailable](motionManager, "isDeviceMotionAvailable"))
    {
      if (self->manageFusedMotion)
      {
        self->dGyroUpdateInterval = a4;
        v7 = deviceMotionCallback;
        v8 = self->motionManager;
        v9 = self;
        v10 = 1;
      }
      else
      {
        v8 = self->motionManager;
        v7 = 0;
        v9 = 0;
        v10 = 0;
      }
      -[CMMotionManager setDeviceMotionCallback:info:interval:fsync:](v8, "setDeviceMotionCallback:info:interval:fsync:", v7, v9, v10);
    }
  }
}

- (void)updateGyroInterval:(float)a3
{
  CMMotionManager *motionManager;

  motionManager = self->motionManager;
  if (motionManager)
    -[CMMotionManager setGyroDataCallback:info:interval:](motionManager, "setGyroDataCallback:info:interval:", 0, self, a3);
}

- (FigCoreMotionDelegate)init
{
  double v2;
  double v3;

  LODWORD(v2) = 1023969417;
  LODWORD(v3) = 1000593162;
  return -[FigCoreMotionDelegate initWithAccelerometer:gravityZ:fusedMotion:accelUpdateInterval:fusedMotionUpdateInterval:motionCallbackThreadPriority:](self, "initWithAccelerometer:gravityZ:fusedMotion:accelUpdateInterval:fusedMotionUpdateInterval:motionCallbackThreadPriority:", 1, 1, 1, 0, v2, v3);
}

- (void)dealloc
{
  objc_super v3;

  if (self->manageFusedMotion
    && -[CMMotionManager isDeviceMotionAvailable](self->motionManager, "isDeviceMotionAvailable"))
  {
    -[CMMotionManager setDeviceMotionCallback:info:interval:fsync:](self->motionManager, "setDeviceMotionCallback:info:interval:fsync:", 0, 0, 0, 0.0);
  }
  if (self->manageAccel)
    -[CMMotionManager setAccelerometerDataCallback:info:interval:](self->motionManager, "setAccelerometerDataCallback:info:interval:", 0, 0, 0.0);

  pthread_mutex_destroy(&self->ringMutex);
  if (self->dataSemaphore)
    FigSemaphoreDestroy();
  v3.receiver = self;
  v3.super_class = (Class)FigCoreMotionDelegate;
  -[FigCoreMotionDelegate dealloc](&v3, sel_dealloc);
}

- (void)didUpdateGravity:(id)a3 time:(double)a4
{
  float var2;
  float var1;
  float var0;
  _opaque_pthread_mutex_t *p_ringMutex;
  uint64_t accelRingIndex;
  double v11;
  float v12;
  float *v13;
  double v14;
  float v15;
  double v16;
  float v17;

  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  p_ringMutex = &self->ringMutex;
  if (!pthread_mutex_lock(&self->ringMutex))
  {
    accelRingIndex = self->accelRingIndex;
    self->accelRingIndex = (accelRingIndex + 1);
    self->accelRingTime[accelRingIndex] = a4;
    v11 = var0;
    if (var0 > 1.0)
      v11 = 1.0;
    if (v11 <= -1.0)
      v11 = -1.0;
    v12 = v11;
    v13 = (float *)((char *)self + 4 * accelRingIndex);
    v13[22] = v12;
    v14 = var1;
    if (var1 > 1.0)
      v14 = 1.0;
    if (v14 <= -1.0)
      v14 = -1.0;
    v15 = v14;
    v13[278] = v15;
    v16 = var2;
    if (var2 > 1.0)
      v16 = 1.0;
    if (v16 <= -1.0)
      v16 = -1.0;
    v17 = v16;
    v13[534] = v17;
    self->latestGravityDataTime = a4;
    pthread_mutex_unlock(p_ringMutex);
  }
}

- (int)getGravityX:(float *)a3 y:(float *)a4 z:(float *)a5 forTimeStamp:(double)latestGravityDataTime
{
  FigCoreMotionDelegate *v10;
  _opaque_pthread_mutex_t *p_ringMutex;
  int v12;
  float v13;
  uint64_t v14;
  int v15;
  double *accelRingTime;
  float v17;
  float v18;
  float v19;
  double v20;
  BOOL v21;
  double v22;

  v10 = self;
  p_ringMutex = &self->ringMutex;
  v12 = pthread_mutex_lock(&self->ringMutex);
  if (v12)
    goto LABEL_2;
  if (latestGravityDataTime < 0.0)
    latestGravityDataTime = v10->latestGravityDataTime;
  v14 = 0;
  v15 = 0;
  accelRingTime = v10->accelRingTime;
  v17 = 0.0;
  v18 = 0.0;
  v19 = 0.0;
  do
  {
    v20 = accelRingTime[v14];
    v21 = v20 == 0.0;
    v22 = vabdd_f64(v20, latestGravityDataTime);
    if (!v21 && v22 < 0.5)
    {
      v19 = v19 + v10->accelRingX[0];
      v18 = v18 + v10->accelRingY[0];
      v17 = v17 + v10->accelRingZ[0];
      ++v15;
    }
    ++v14;
    v10 = (FigCoreMotionDelegate *)((char *)v10 + 4);
  }
  while (v14 != 256);
  pthread_mutex_unlock(p_ringMutex);
  if (!v15)
  {
LABEL_2:
    *a3 = 0.0;
    *a4 = 0.0;
    v13 = 0.0;
  }
  else
  {
    *a3 = v19 / (float)v15;
    *a4 = v18 / (float)v15;
    v13 = v17 / (float)v15;
  }
  *a5 = v13;
  return v12;
}

- (int)getFusedVectorX:(float *)a3 y:(float *)a4 z:(float *)a5 forTimeStamp:(double)a6
{
  _opaque_pthread_mutex_t *p_ringMutex;
  int v12;
  float v13;
  float v14;
  float v15;
  float v16;
  uint64_t v17;
  double *fusedRingTime;
  double v19;
  float *p_z;
  float v21;
  float v22;
  float v23;

  p_ringMutex = &self->ringMutex;
  v12 = pthread_mutex_lock(&self->ringMutex);
  v13 = 0.0;
  v14 = 0.0;
  v15 = 0.0;
  v16 = 0.0;
  if (!v12)
  {
    v17 = 0;
    fusedRingTime = self->fusedRingTime;
    v19 = a6 + 0.0333333351;
    p_z = &self->fusedRingAccel[0].z;
    do
    {
      if (*fusedRingTime != 0.0)
      {
        v21 = v19 - *fusedRingTime;
        v22 = expf(-(float)((float)(v21 * 15.0) * (float)(v21 * 15.0)));
        v13 = v13 + (float)(v22 * p_z[v17 - 2]);
        v14 = v14 + (float)(v22 * p_z[v17 - 1]);
        v15 = v15 + (float)(v22 * p_z[v17]);
        v16 = v16 + v22;
      }
      v17 += 3;
      ++fusedRingTime;
    }
    while (v17 != 768);
    pthread_mutex_unlock(p_ringMutex);
  }
  v23 = 1.0 / v16;
  if (v16 <= 0.0)
    v23 = v16;
  *a3 = v13 * v23;
  *a4 = v14 * v23;
  *a5 = v15 * v23;
  return v12;
}

- (void)didUpdateFusedMotionWithDeviceMotion:(id *)a3 time:(double)a4 ifsync:(BOOL)a5
{
  double dLatestTimestamp;
  uint64_t fusedRingIndex;
  char *v10;
  uint64_t v11;
  char *v12;
  __int128 v13;
  char *v14;

  dLatestTimestamp = self->dLatestTimestamp;
  if (dLatestTimestamp > 0.0 && a4 - dLatestTimestamp > self->dGyroUpdateInterval * 3.1 && self->dStartOfLogging < a4)
    low_freq_error_logging_0();
  self->dLatestTimestamp = a4;
  if (!pthread_mutex_lock(&self->ringMutex))
  {
    fusedRingIndex = self->fusedRingIndex;
    self->fusedRingIndex = (fusedRingIndex + 1);
    self->fusedRingTime[fusedRingIndex] = a4;
    self->fusedRingDoingBiasEstimation[fusedRingIndex] = a3->var6;
    v10 = (char *)self + 12 * (int)fusedRingIndex;
    v11 = *(_QWORD *)&a3->var1.var0;
    *((_DWORD *)v10 + 1882) = LODWORD(a3->var1.var2);
    *((_QWORD *)v10 + 940) = v11;
    v12 = (char *)self + 32 * fusedRingIndex;
    v13 = *(_OWORD *)&a3->var0.var0;
    *((_OWORD *)v12 + 663) = *(_OWORD *)&a3->var0.var2;
    *((_OWORD *)v12 + 662) = v13;
    if (self->computingPosition)
    {
      -[FigCoreMotionDelegate didUpdatePositionWithAcceleration:forTimeStamp:](self, "didUpdatePositionWithAcceleration:forTimeStamp:", &a3->var1, a4);
      v14 = (char *)self + 12 * (int)fusedRingIndex;
      *((_QWORD *)v14 + 2348) = *(_QWORD *)&self->position.x;
      *((_DWORD *)v14 + 4698) = LODWORD(self->position.z);
    }
    self->latestMotionDataTime = a4;
    pthread_mutex_unlock(&self->ringMutex);
  }
}

- (void)didUpdatePositionWithAcceleration:(id *)a3 forTimeStamp:(double)a4
{
  double timestamp;

  timestamp = self->position.timestamp;
  if (timestamp == -1.0)
  {
    self->velocity.timestamp = a4;
    self->position.timestamp = -2.0;
  }
  else
  {
    -[FigCoreMotionDelegate didUpdateVelocityWithAcceleration:forTimeStamp:](self, "didUpdateVelocityWithAcceleration:forTimeStamp:", a3, a4);
    if (timestamp == -2.0)
      self->position.timestamp = a4;
    else
      -[FigCoreMotionDelegate didUpdatePositionWithTimeStamp:](self, "didUpdatePositionWithTimeStamp:", a4);
  }
}

- (void)didUpdateVelocityWithAcceleration:(id *)a3 forTimeStamp:(double)a4
{
  double timestamp;
  double v5;

  timestamp = self->velocity.timestamp;
  if (timestamp < a4)
  {
    v5 = a4 - timestamp;
    *(float32x2_t *)&self->velocity.x = vcvt_f32_f64(vmlaq_n_f64(vcvtq_f64_f32(*(float32x2_t *)&self->velocity.x), vcvtq_f64_f32(vmul_f32(*(float32x2_t *)&a3->var0, (float32x2_t)vdup_n_s32(0x411CF5C3u))), v5));
    *(float *)&v5 = self->velocity.z + (float)(a3->var2 * 9.81) * v5;
    self->velocity.z = *(float *)&v5;
    self->velocity.timestamp = a4;
  }
}

- (void)didUpdatePositionWithTimeStamp:(double)a3
{
  double timestamp;
  double v4;

  timestamp = self->position.timestamp;
  if (timestamp < a3 && self->velocity.timestamp <= a3)
  {
    v4 = a3 - timestamp;
    *(float32x2_t *)&self->position.x = vcvt_f32_f64(vmlaq_n_f64(vcvtq_f64_f32(*(float32x2_t *)&self->position.x), vcvtq_f64_f32(*(float32x2_t *)&self->velocity.x), v4));
    *(float *)&v4 = self->position.z + self->velocity.z * v4;
    self->position.z = *(float *)&v4;
    self->position.timestamp = a3;
  }
}

- (id)copyAllFusedMotionData
{
  void *v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 256);
  if (!pthread_mutex_lock(&self->ringMutex))
  {
    for (i = 0; i != 256; ++i)
    {
      v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->fusedRingTime[(i + self->fusedRingIndex)]);
      v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->fusedRingDoingBiasEstimation[(i + self->fusedRingIndex)]);
      v7 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &self->fusedRingAccel[(i + self->fusedRingIndex)], 12);
      v8 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &self->fusedRingQuaternion[(i + self->fusedRingIndex)], 32);
      objc_msgSend(v3, "insertObject:atIndex:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v5, v6, v7, v8, 0), i);
    }
    pthread_mutex_unlock(&self->ringMutex);
  }
  return v3;
}

- (id)copyNewFusedMotionData
{
  void *v3;
  double v4;
  int v5;
  int v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _opaque_pthread_mutex_t *p_ringMutex;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 256);
  v4 = 0.0;
  if (!pthread_mutex_lock(&self->ringMutex))
  {
    p_ringMutex = &self->ringMutex;
    v5 = 0;
    v6 = 0;
    do
    {
      v7 = self->fusedRingTime[(v5 + self->fusedRingIndex)];
      if (v7 > self->dLatestFusedMotionCopied)
      {
        if (v7 > v4)
          v4 = self->fusedRingTime[(v5 + self->fusedRingIndex)];
        v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
        v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->fusedRingDoingBiasEstimation[(v5 + self->fusedRingIndex)]);
        v10 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &self->fusedRingQuaternion[(v5 + self->fusedRingIndex)], 32);
        objc_msgSend(v3, "insertObject:atIndex:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v8, v9, v10, 0, p_ringMutex), v6++);
      }
      ++v5;
    }
    while (v5 != 256);
    pthread_mutex_unlock(p_ringMutex);
  }
  if (v4 > self->dLatestFusedMotionCopied)
    self->dLatestFusedMotionCopied = v4;
  return v3;
}

- (id)copyFusedMotionData:(double)a3 endTime:(double)a4 timeoutValue:(double)a5 errOut:(int *)a6
{
  void *v10;
  _opaque_pthread_mutex_t *p_ringMutex;
  int v12;
  int v14;
  int v15;
  uint64_t v16;
  double v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 256);
  if (v10)
  {
    if (a3 < 0.0)
      a3 = 0.0;
    if (a4 < 0.0)
      a4 = 1.79769313e308;
    p_ringMutex = &self->ringMutex;
    v12 = pthread_mutex_lock(&self->ringMutex);
    if (self->latestMotionDataTime < a4)
    {
      pthread_mutex_unlock(&self->ringMutex);
      if (self->dataSemaphore)
        FigSemaphoreWaitRelative();
      pthread_mutex_lock(&self->ringMutex);
    }
    if (!v12)
    {
      v14 = 0;
      v15 = 0;
      do
      {
        v16 = (v14 + LOBYTE(self->fusedRingIndex));
        v17 = self->fusedRingTime[v16];
        if (v17 >= a3 && v17 <= a4)
        {
          v19 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
          v20 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->fusedRingDoingBiasEstimation[v16]);
          v21 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &self->fusedRingQuaternion[v16], 32);
          v22 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v19, v20, v21, 0);
          if (v19)
            v23 = v20 == 0;
          else
            v23 = 1;
          if (!v23 && v21 != 0 && v22 != 0)
            objc_msgSend(v10, "insertObject:atIndex:", v22, v15++);
        }
        ++v14;
      }
      while (v14 != 256);
      if (v15)
      {
        pthread_mutex_unlock(&self->ringMutex);
        v12 = 0;
        goto LABEL_14;
      }
      v12 = -1;
      p_ringMutex = &self->ringMutex;
    }
    pthread_mutex_unlock(p_ringMutex);
  }
  else
  {
    v12 = -1;
  }

  v10 = 0;
LABEL_14:
  *a6 = v12;
  return v10;
}

- (int)updateCurrentQuaternionForTimeStamp:(double)a3
{
  _opaque_pthread_mutex_t *p_ringMutex;
  int v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  char *v11;

  p_ringMutex = &self->ringMutex;
  if (pthread_mutex_lock(&self->ringMutex))
    return -2;
  v7 = 0;
  LODWORD(v8) = -1;
  v9 = 1.0;
  do
  {
    v10 = vabdd_f64(self->fusedRingTime[v7], a3);
    if (v10 >= v9)
      v8 = v8;
    else
      v8 = v7;
    if (v10 < v9)
      v9 = v10;
    ++v7;
  }
  while (v7 != 256);
  if (v9 > 0.011)
  {
    if ((v8 & 0x80000000) == 0)
      low_freq_error_logging_0();
    low_freq_error_logging_0();
  }
  if ((v8 & 0x80000000) != 0)
  {
    low_freq_error_logging_0();
    v6 = -1;
  }
  else
  {
    v6 = 0;
    v11 = (char *)self + 32 * v8;
    *(_OWORD *)&self->currentQuaternion.w = *((_OWORD *)v11 + 662);
    *(_OWORD *)&self->currentQuaternion.y = *((_OWORD *)v11 + 663);
  }
  pthread_mutex_unlock(p_ringMutex);
  return v6;
}

- (int)updateCurrentQuaternionForTimeStamps:(double)a3 withEnd:(double)a4
{
  _opaque_pthread_mutex_t *p_ringMutex;
  int v8;
  __int128 v9;
  __int128 v11;
  __int128 v12;

  p_ringMutex = &self->ringMutex;
  if (pthread_mutex_lock(&self->ringMutex))
    return -2;
  v11 = 0u;
  v12 = 0u;
  v8 = FigMotionComputeAverageQuaternionForTimePeriod((uint64_t)self->fusedRingTime, &self->fusedRingQuaternion[0].w, &v11, a3, a4);
  if (v8)
  {
    low_freq_error_logging_0();
  }
  else
  {
    v9 = v12;
    *(_OWORD *)&self->currentQuaternion.w = v11;
    *(_OWORD *)&self->currentQuaternion.y = v9;
  }
  pthread_mutex_unlock(p_ringMutex);
  return v8;
}

- (void)getCurrentQuaternion:(id *)a3
{
  *($2FED4CF3216092304D4513EB121F1E87 *)a3 = self->currentQuaternion;
}

- (void)getCurrentDeltaQuaternion:(id *)a3
{
  double w;
  double x;
  double y;
  double z;
  double v7;
  double v8;
  double v9;
  double v10;

  w = self->previousQuaternion.w;
  x = self->previousQuaternion.x;
  y = self->previousQuaternion.y;
  z = self->previousQuaternion.z;
  v7 = self->currentQuaternion.x;
  v8 = self->currentQuaternion.w;
  v9 = self->currentQuaternion.z;
  v10 = self->currentQuaternion.y;
  a3->var0 = x * v7 + w * v8 + y * v10 + z * v9;
  a3->var1 = w * v7 - x * v8 - y * v9 + z * v10;
  a3->var2 = w * v10 - y * v8 - z * v7 + x * v9;
  a3->var3 = w * v9 - z * v8 - x * v10 + y * v7;
  self->previousQuaternion = self->currentQuaternion;
}

- (void)getCurrentAttitudeRoll:(double *)a3 pitch:(double *)a4 yaw:(double *)a5
{
  $2FED4CF3216092304D4513EB121F1E87 *p_currentQuaternion;

  p_currentQuaternion = &self->currentQuaternion;
  *a3 = rollFromQuaternion(&self->currentQuaternion.w);
  *a4 = asin(self->currentQuaternion.w * (self->currentQuaternion.x + self->currentQuaternion.x)+ self->currentQuaternion.y * (self->currentQuaternion.z + self->currentQuaternion.z));
  *a5 = yawFromQuaternion(&p_currentQuaternion->w);
}

- (void)getCurrentDeltaAttitudeRoll:(double *)a3 pitch:(double *)a4 yaw:(double *)a5
{
  __int128 v8;
  double v9;
  __int128 v10;
  double v11;
  double v12;
  __int128 v13;
  __int128 v14;

  v13 = 0u;
  v14 = 0u;
  -[FigCoreMotionDelegate getCurrentDeltaQuaternion:](self, "getCurrentDeltaQuaternion:", &v13);
  v8 = v14;
  v9 = *((double *)&v14 + 1) + *((double *)&v14 + 1);
  v10 = v13;
  v11 = *((double *)&v13 + 1) + *((double *)&v13 + 1);
  v12 = 1.0 - *((double *)&v13 + 1) * (*((double *)&v13 + 1) + *((double *)&v13 + 1));
  *a3 = -atan2(*((double *)&v13 + 1) * (*((double *)&v14 + 1) + *((double *)&v14 + 1))- *(double *)&v13 * (*(double *)&v14 + *(double *)&v14), v12 - *(double *)&v14 * (*(double *)&v14 + *(double *)&v14));
  *a4 = asin(v11 * *(double *)&v10 + *(double *)&v8 * v9);
  *a5 = -atan2(*((double *)&v10 + 1) * (*(double *)&v8 + *(double *)&v8) - *(double *)&v10 * v9, v12 - *((double *)&v8 + 1) * v9);
}

- (void)getPositionX:(float *)a3 y:(float *)a4 z:(float *)a5 forTimeStamp:(double)a6
{
  float *p_z;
  _opaque_pthread_mutex_t *p_ringMutex;
  float v13;
  float v14;
  float v15;
  float v16;
  uint64_t v17;
  double *fusedRingTime;
  double v19;
  double v20;
  float v21;
  float v22;
  float v23;
  float v24;

  p_z = &self->fusedRingPosition[0].z;
  if (self->computingPosition)
  {
    p_ringMutex = &self->ringMutex;
    v13 = 0.0;
    v14 = 0.0;
    v15 = 0.0;
    v16 = 0.0;
    if (!pthread_mutex_lock(&self->ringMutex))
    {
      v17 = 0;
      fusedRingTime = self->fusedRingTime;
      v19 = a6 + 0.0333333351;
      do
      {
        v20 = fusedRingTime[v17];
        if (v20 != 0.0)
        {
          v21 = v19 - v20;
          v22 = expf(-(float)((float)(v21 * 15.0) * (float)(v21 * 15.0)));
          v16 = v16 + (float)(v22 * *(p_z - 2));
          v13 = v13 + (float)(v22 * *(p_z - 1));
          v14 = v14 + (float)(v22 * *p_z);
          v15 = v15 + v22;
        }
        ++v17;
        p_z += 3;
      }
      while (v17 != 256);
      pthread_mutex_unlock(p_ringMutex);
    }
    v23 = 1.0 / v15;
    if (v15 <= 0.0)
      v23 = v15;
    *a3 = v16 * v23;
    *a4 = v13 * v23;
    v24 = v14 * v23;
  }
  else
  {
    *a3 = 0.0;
    *a4 = 0.0;
    v24 = 0.0;
  }
  *a5 = v24;
}

- (int)getLatestMotionDataTime:(double *)a3
{
  _opaque_pthread_mutex_t *p_ringMutex;
  int v6;

  p_ringMutex = &self->ringMutex;
  v6 = pthread_mutex_lock(&self->ringMutex);
  if (!v6)
  {
    *a3 = self->latestMotionDataTime;
    pthread_mutex_unlock(p_ringMutex);
  }
  return v6;
}

- (BOOL)managingFusedMotion
{
  return self->manageFusedMotion;
}

- (BOOL)managingAccel
{
  return self->manageAccel;
}

- (BOOL)isCopyingAllData
{
  return self->copyingAllData;
}

@end
