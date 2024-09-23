@implementation ARGeoTrackingTechniqueState

- (ARGeoTrackingTechniqueState)initWithResetCount:(int64_t)a3
{
  ARGeoTrackingTechniqueState *v4;
  ARGeoTrackingTechniqueState *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  int64_t resetCount;
  uint64_t v11;
  NSMutableArray *resultDatas;
  __int128 v13;
  ARCircularArray *v19;
  ARCircularArray *vioPoseCircularBuffer;
  ARCircularArray *v21;
  ARCircularArray *deviceMotionCircularBuffer;
  ARLocationData *lastLocationProcessedForFusion;
  _OWORD var20[3];
  objc_super v26;
  _BYTE buf[24];
  int64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)ARGeoTrackingTechniqueState;
  v4 = -[ARGeoTrackingTechniqueState init](&v26, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_resetCount = a3;
    if (_ARLogTechnique_onceToken_20 != -1)
      dispatch_once(&_ARLogTechnique_onceToken_20, &__block_literal_global_120);
    v6 = (void *)_ARLogTechnique_logObj_20;
    if (os_log_type_enabled((os_log_t)_ARLogTechnique_logObj_20, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      resetCount = v5->_resetCount;
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v5;
      *(_WORD *)&buf[22] = 2048;
      v28 = resetCount;
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Geo tracking has reset! Count=%ld", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    resultDatas = v5->_resultDatas;
    v5->_resultDatas = (NSMutableArray *)v11;

    -[ARGeoTrackingTechniqueState setLastCMDeviceMotion:](v5, "setLastCMDeviceMotion:", 0);
    -[ARGeoTrackingTechniqueState setLastCLLocation:](v5, "setLastCLLocation:", 0);
    v5->_enuFromVIOLock._os_unfair_lock_opaque = 0;
    v13 = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 16);
    var20[0] = *MEMORY[0x1E0C83FD8];
    var20[1] = v13;
    var20[2] = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 32);
    -[ARGeoTrackingTechniqueState setEnuFromVIO:](v5, "setEnuFromVIO:", var20);
    -[ARGeoTrackingTechniqueState setEnuOrigin:](v5, "setEnuOrigin:", 0);
    v5->_poseOkCount = 0;
    v5->_lastVLExecutionTimestamp = -1.0;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v5->_firstVLExecutionAttemptTimestamp = _Q0;
    -[ARGeoTrackingTechniqueState setVLHandle:](v5, "setVLHandle:", 0);
    *(_DWORD *)&v5->_hasStartedAvailabilityCheck = 0;
    -[ARGeoTrackingTechniqueState setTrackingState:](v5, "setTrackingState:", 1);
    -[ARGeoTrackingTechniqueState setTrackingAccuracy:](v5, "setTrackingAccuracy:", 0);
    -[ARGeoTrackingTechniqueState setConsensusAverageFilter:](v5, "setConsensusAverageFilter:", 0);
    -[ARGeoTrackingTechniqueState setGradualCorrectionFilter:](v5, "setGradualCorrectionFilter:", 0);
    v5->_lastGradualCorrectionTime = 0.0;
    -[ARGeoTrackingTechniqueState setFailureReasons:](v5, "setFailureReasons:", 1024);
    *(_OWORD *)&v5->_lastPoseOriginTimestamp = 0u;
    *(_OWORD *)&v5->_lastLoggedFailureReasons = 0u;
    v19 = -[ARCircularArray initWithCapacity:]([ARCircularArray alloc], "initWithCapacity:", 30);
    vioPoseCircularBuffer = v5->_vioPoseCircularBuffer;
    v5->_vioPoseCircularBuffer = v19;

    v5->_vioPoseBufferLock._os_unfair_lock_opaque = 0;
    v21 = -[ARCircularArray initWithCapacity:]([ARCircularArray alloc], "initWithCapacity:", 50);
    deviceMotionCircularBuffer = v5->_deviceMotionCircularBuffer;
    v5->_deviceMotionCircularBuffer = v21;

    v5->_deviceMotionBufferLock._os_unfair_lock_opaque = 0;
    lastLocationProcessedForFusion = v5->_lastLocationProcessedForFusion;
    v5->_lastLocationProcessedForFusion = 0;

    *(_QWORD *)v5->_lastLoggedVioPosition = 0;
    *(_QWORD *)&v5->_lastLoggedVioPosition[8] = 0;
    *(_OWORD *)&v5->_lastLoggedVioPosition[16] = 0u;
    v5->_lastLoggedVioTimestamp = -1.0;
  }
  return v5;
}

- (void)enuFromVIO
{
  os_unfair_lock_s *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v4 = (os_unfair_lock_s *)(a1 + 8);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  v5 = *(_OWORD *)(a1 + 336);
  a2[4] = *(_OWORD *)(a1 + 320);
  a2[5] = v5;
  v6 = *(_OWORD *)(a1 + 368);
  a2[6] = *(_OWORD *)(a1 + 352);
  a2[7] = v6;
  v7 = *(_OWORD *)(a1 + 272);
  *a2 = *(_OWORD *)(a1 + 256);
  a2[1] = v7;
  v8 = *(_OWORD *)(a1 + 304);
  a2[2] = *(_OWORD *)(a1 + 288);
  a2[3] = v8;
  os_unfair_lock_unlock(v4);
}

- (void)setEnuFromVIO:(__int128 *)a3
{
  os_unfair_lock_s *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v5 = (os_unfair_lock_s *)(a1 + 8);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  v6 = *a3;
  v7 = a3[1];
  v8 = a3[3];
  *(_OWORD *)(a1 + 288) = a3[2];
  *(_OWORD *)(a1 + 304) = v8;
  *(_OWORD *)(a1 + 256) = v6;
  *(_OWORD *)(a1 + 272) = v7;
  v9 = a3[4];
  v10 = a3[5];
  v11 = a3[7];
  *(_OWORD *)(a1 + 352) = a3[6];
  *(_OWORD *)(a1 + 368) = v11;
  *(_OWORD *)(a1 + 320) = v9;
  *(_OWORD *)(a1 + 336) = v10;
  os_unfair_lock_unlock(v5);
}

- (void)setEnuFromVIOTranslation:(ARGeoTrackingTechniqueState *)self
{
  __int128 *v2;
  os_unfair_lock_s *p_enuFromVIOLock;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v6 = v2[1];
  v7 = *v2;
  p_enuFromVIOLock = &self->_enuFromVIOLock;
  os_unfair_lock_lock(&self->_enuFromVIOLock);
  *(_QWORD *)&v5 = v6;
  *((_QWORD *)&v5 + 1) = 1.0;
  *(_OWORD *)&self[1]._gradualCorrectionFilter = v7;
  *(_OWORD *)&self[1]._resetCount = v5;
  os_unfair_lock_unlock(p_enuFromVIOLock);
}

- (void)setEnuFromVIORotation:(uint64_t)a3
{
  os_unfair_lock_s *v5;
  uint64_t i;
  __int128 v7;
  os_unfair_lock_s *v8;

  v5 = a1 + 2;
  os_unfair_lock_lock(a1 + 2);
  for (i = 0; i != 24; i += 8)
  {
    v7 = *(_OWORD *)(a3 + i * 4 + 16);
    v8 = &a1[i + 64];
    *(_OWORD *)&v8->_os_unfair_lock_opaque = *(_OWORD *)(a3 + i * 4);
    *(_OWORD *)&v8[4]._os_unfair_lock_opaque = v7;
  }
  os_unfair_lock_unlock(v5);
}

- (void)addFailureReason:(int64_t)a3
{
  -[ARGeoTrackingTechniqueState setFailureReasons:](self, "setFailureReasons:", -[ARGeoTrackingTechniqueState failureReasons](self, "failureReasons") | a3);
}

- (void)removeFailureReason:(int64_t)a3
{
  -[ARGeoTrackingTechniqueState setFailureReasons:](self, "setFailureReasons:", -[ARGeoTrackingTechniqueState failureReasons](self, "failureReasons") & ~a3);
}

- (BOOL)VLHasExecuted
{
  double v2;

  -[ARGeoTrackingTechniqueState lastVLExecutionTimestamp](self, "lastVLExecutionTimestamp");
  return v2 > 0.0;
}

+ (id)_findClosestDataToTimestamp:(double)a3 inBuffer:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v18;
    v10 = 1.79769313e308;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "timestamp");
        v14 = vabdd_f64(a3, v13);
        if (v14 < v10)
        {
          v15 = v12;

          v10 = v14;
          v8 = v15;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)findClosestVioPoseToTimestamp:(double)a3
{
  os_unfair_lock_s *p_vioPoseBufferLock;
  void *v6;

  p_vioPoseBufferLock = &self->_vioPoseBufferLock;
  os_unfair_lock_lock(&self->_vioPoseBufferLock);
  objc_msgSend((id)objc_opt_class(), "_findClosestDataToTimestamp:inBuffer:", self->_vioPoseCircularBuffer, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_vioPoseBufferLock);
  return v6;
}

- (void)addVioPoseData:(id)a3
{
  id v4;
  ARGeoTrackingTechniqueStatePose *v5;
  double v6;
  double v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  ARGeoTrackingTechniqueStatePose *v12;
  id v13;
  float64x2_t v14[8];

  v4 = a3;
  v5 = [ARGeoTrackingTechniqueStatePose alloc];
  objc_msgSend(v4, "timestamp");
  v7 = v6;
  objc_msgSend(v4, "visionCameraTransform");
  ARMatrix4x4FloatToDouble(v14, v8, v9, v10, v11);
  v12 = -[ARGeoTrackingTechniqueStatePose initWithTimestamp:transform:fused:heading:](v5, "initWithTimestamp:transform:fused:heading:", v14, 0, v7, 0.0);
  os_unfair_lock_lock(&self->_vioPoseBufferLock);
  v13 = -[ARCircularArray addObject:](self->_vioPoseCircularBuffer, "addObject:", v12);
  os_unfair_lock_unlock(&self->_vioPoseBufferLock);

}

- (id)findClosestDeviceMotionDataToTimestamp:(double)a3
{
  os_unfair_lock_s *p_deviceMotionBufferLock;
  void *v6;

  p_deviceMotionBufferLock = &self->_deviceMotionBufferLock;
  os_unfair_lock_lock(&self->_deviceMotionBufferLock);
  objc_msgSend((id)objc_opt_class(), "_findClosestDataToTimestamp:inBuffer:", self->_deviceMotionCircularBuffer, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_deviceMotionBufferLock);
  return v6;
}

- (void)addDeviceMotionData:(id)a3
{
  id v4;
  ARGeoTrackingTechniqueStatePose *v5;
  double v6;
  double v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  void *v12;
  double v13;
  ARGeoTrackingTechniqueStatePose *v14;
  id v15;
  float64x2_t v16[8];

  v4 = a3;
  v5 = [ARGeoTrackingTechniqueStatePose alloc];
  objc_msgSend(v4, "timestamp");
  v7 = v6;
  objc_msgSend(v4, "rotationMatrixENU");
  objc_msgSend(v4, "deviceMotion", ARMatrix4x4FloatToDouble(v16, v8, v9, v10, v11).f64[0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "heading");
  v14 = -[ARGeoTrackingTechniqueStatePose initWithTimestamp:transform:fused:heading:](v5, "initWithTimestamp:transform:fused:heading:", v16, 0, v7, v13 * 3.14159265 / 180.0);

  os_unfair_lock_lock(&self->_deviceMotionBufferLock);
  v15 = -[ARCircularArray addObject:](self->_deviceMotionCircularBuffer, "addObject:", v14);
  os_unfair_lock_unlock(&self->_deviceMotionBufferLock);

}

- (VLLocalizer)VLHandle
{
  return self->_VLHandle;
}

- (void)setVLHandle:(id)a3
{
  objc_storeStrong((id *)&self->_VLHandle, a3);
}

- (ARDeviceOrientationData)lastCMDeviceMotion
{
  return (ARDeviceOrientationData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLastCMDeviceMotion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (ARLocationData)lastCLLocation
{
  return (ARLocationData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastCLLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (double)lastVLExecutionTimestamp
{
  return self->_lastVLExecutionTimestamp;
}

- (void)setLastVLExecutionTimestamp:(double)a3
{
  self->_lastVLExecutionTimestamp = a3;
}

- (int64_t)trackingState
{
  return self->_trackingState;
}

- (void)setTrackingState:(int64_t)a3
{
  self->_trackingState = a3;
}

- (int64_t)trackingAccuracy
{
  return self->_trackingAccuracy;
}

- (void)setTrackingAccuracy:(int64_t)a3
{
  self->_trackingAccuracy = a3;
}

- (int64_t)failureReasons
{
  return self->_failureReasons;
}

- (void)setFailureReasons:(int64_t)a3
{
  self->_failureReasons = a3;
}

- (ARGeoTrackingConsensusAndAverageFilter)consensusAverageFilter
{
  return self->_consensusAverageFilter;
}

- (void)setConsensusAverageFilter:(id)a3
{
  objc_storeStrong((id *)&self->_consensusAverageFilter, a3);
}

- (ARGeoTrackingGradualCorrectionFilter)gradualCorrectionFilter
{
  return self->_gradualCorrectionFilter;
}

- (void)setGradualCorrectionFilter:(id)a3
{
  objc_storeStrong((id *)&self->_gradualCorrectionFilter, a3);
}

- (ARLocationData)enuOrigin
{
  return (ARLocationData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setEnuOrigin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (int64_t)resetCount
{
  return self->_resetCount;
}

- (void)setResetCount:(int64_t)a3
{
  self->_resetCount = a3;
}

- (NSMutableArray)resultDatas
{
  return self->_resultDatas;
}

- (void)setResultDatas:(id)a3
{
  objc_storeStrong((id *)&self->_resultDatas, a3);
}

- (int)poseOkCount
{
  return self->_poseOkCount;
}

- (void)setPoseOkCount:(int)a3
{
  self->_poseOkCount = a3;
}

- (double)firstVLExecutionAttemptTimestamp
{
  return self->_firstVLExecutionAttemptTimestamp;
}

- (void)setFirstVLExecutionAttemptTimestamp:(double)a3
{
  self->_firstVLExecutionAttemptTimestamp = a3;
}

- (double)lastVLExecutionAttemptTimestamp
{
  return self->_lastVLExecutionAttemptTimestamp;
}

- (void)setLastVLExecutionAttemptTimestamp:(double)a3
{
  self->_lastVLExecutionAttemptTimestamp = a3;
}

- (BOOL)hasStartedAvailabilityCheck
{
  return self->_hasStartedAvailabilityCheck;
}

- (void)setHasStartedAvailabilityCheck:(BOOL)a3
{
  self->_hasStartedAvailabilityCheck = a3;
}

- (BOOL)hasReturnedAvailabilityCheck
{
  return self->_hasReturnedAvailabilityCheck;
}

- (void)setHasReturnedAvailabilityCheck:(BOOL)a3
{
  self->_hasReturnedAvailabilityCheck = a3;
}

- (BOOL)hasStartedLocalization
{
  return self->_hasStartedLocalization;
}

- (void)setHasStartedLocalization:(BOOL)a3
{
  self->_hasStartedLocalization = a3;
}

- (BOOL)hasReturnedLocalization
{
  return self->_hasReturnedLocalization;
}

- (void)setHasReturnedLocalization:(BOOL)a3
{
  self->_hasReturnedLocalization = a3;
}

- (double)lastGradualCorrectionTime
{
  return self->_lastGradualCorrectionTime;
}

- (void)setLastGradualCorrectionTime:(double)a3
{
  self->_lastGradualCorrectionTime = a3;
}

- (int64_t)lastLoggedFailureReasons
{
  return self->_lastLoggedFailureReasons;
}

- (void)setLastLoggedFailureReasons:(int64_t)a3
{
  self->_lastLoggedFailureReasons = a3;
}

- (int64_t)failureLogCount
{
  return self->_failureLogCount;
}

- (void)setFailureLogCount:(int64_t)a3
{
  self->_failureLogCount = a3;
}

- (double)lastPoseOriginTimestamp
{
  return self->_lastPoseOriginTimestamp;
}

- (void)setLastPoseOriginTimestamp:(double)a3
{
  self->_lastPoseOriginTimestamp = a3;
}

- (double)firstRequestResultTimestamp
{
  return self->_firstRequestResultTimestamp;
}

- (void)setFirstRequestResultTimestamp:(double)a3
{
  self->_firstRequestResultTimestamp = a3;
}

- (__n128)lastLoggedVioPosition
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a1 + 224);
  v3 = *(_OWORD *)(a1 + 240);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (void)setLastLoggedVioPosition:(ARGeoTrackingTechniqueState *)self
{
  _OWORD *v2;
  __int128 v3;

  v3 = v2[1];
  *(_OWORD *)self->_lastLoggedVioPosition = *v2;
  *(_OWORD *)&self->_lastLoggedVioPosition[16] = v3;
}

- (double)lastLoggedVioTimestamp
{
  return self->_lastLoggedVioTimestamp;
}

- (void)setLastLoggedVioTimestamp:(double)a3
{
  self->_lastLoggedVioTimestamp = a3;
}

- (ARCircularArray)vioPoseCircularBuffer
{
  return self->_vioPoseCircularBuffer;
}

- (void)setVioPoseCircularBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_vioPoseCircularBuffer, a3);
}

- (ARCircularArray)deviceMotionCircularBuffer
{
  return self->_deviceMotionCircularBuffer;
}

- (void)setDeviceMotionCircularBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_deviceMotionCircularBuffer, a3);
}

- (ARLocationData)lastLocationProcessedForFusion
{
  return self->_lastLocationProcessedForFusion;
}

- (void)setLastLocationProcessedForFusion:(id)a3
{
  objc_storeStrong((id *)&self->_lastLocationProcessedForFusion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLocationProcessedForFusion, 0);
  objc_storeStrong((id *)&self->_deviceMotionCircularBuffer, 0);
  objc_storeStrong((id *)&self->_vioPoseCircularBuffer, 0);
  objc_storeStrong((id *)&self->_resultDatas, 0);
  objc_storeStrong((id *)&self->_enuOrigin, 0);
  objc_storeStrong((id *)&self->_gradualCorrectionFilter, 0);
  objc_storeStrong((id *)&self->_consensusAverageFilter, 0);
  objc_storeStrong((id *)&self->_lastCLLocation, 0);
  objc_storeStrong((id *)&self->_lastCMDeviceMotion, 0);
  objc_storeStrong((id *)&self->_VLHandle, 0);
}

@end
