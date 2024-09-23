@implementation ARWorldAlignmentTechnique

- (ARWorldAlignmentTechnique)initWithAlignment:(int64_t)a3
{
  return -[ARWorldAlignmentTechnique initWithAlignment:cameraPosition:](self, "initWithAlignment:cameraPosition:", a3, 1);
}

- (ARWorldAlignmentTechnique)initWithAlignment:(int64_t)a3 cameraPosition:(int64_t)a4
{
  ARWorldAlignmentTechnique *v6;
  ARWorldAlignmentTechnique *v7;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *dataSemaphore;
  ARTimeKeyedList *v10;
  ARTimeKeyedList *deviceOrientationDataByTime;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ARWorldAlignmentTechnique;
  v6 = -[ARTechnique init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_alignment = a3;
    v6->_cameraPosition = a4;
    v8 = dispatch_semaphore_create(1);
    dataSemaphore = v7->_dataSemaphore;
    v7->_dataSemaphore = (OS_dispatch_semaphore *)v8;

    v10 = -[ARTimeKeyedList initWithMaxSize:]([ARTimeKeyedList alloc], "initWithMaxSize:", 10);
    deviceOrientationDataByTime = v7->_deviceOrientationDataByTime;
    v7->_deviceOrientationDataByTime = v10;

  }
  return v7;
}

- (unint64_t)optionalSensorDataTypes
{
  return 8;
}

- (id)resultDataClasses
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

- (id)processData:(id)a3
{
  id v4;
  ARTimeKeyedList *deviceOrientationDataByTime;
  id v6;
  void *v7;
  double v8;
  double v9;

  v4 = a3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_dataSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    deviceOrientationDataByTime = self->_deviceOrientationDataByTime;
    v6 = v4;
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v6, "timestamp");
    v9 = v8;

    -[ARTimeKeyedList appendObject:forTime:](deviceOrientationDataByTime, "appendObject:forTime:", v7, v9);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_dataSemaphore);
  return v4;
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int imageMirrored;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t *v21;
  uint64_t v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD *v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];
  _QWORD v35[2];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  ARWorldAlignmentTechnique *v39;
  uint64_t v40;
  void *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "resultDataOfClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_dataSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  imageMirrored = self->_imageMirrored;
  objc_msgSend(v6, "imageData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isMirrored");

  if (imageMirrored != v11)
  {
    objc_msgSend(v6, "imageData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    self->_imageMirrored = objc_msgSend(v12, "isMirrored");

    self->_deviceOrientationReferenced = 0;
    self->_trackingReferenced = 0;
  }
  v31 = 0;
  -[ARWorldAlignmentTechnique _handleTrackingStateChanges:initialized:relocalized:](self, "_handleTrackingStateChanges:initialized:relocalized:", v8, (char *)&v31 + 1, &v31);
  objc_msgSend(v8, "worldTrackingState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "reason");

  if (v14 == 1)
  {

    v8 = 0;
  }
  -[ARTimeKeyedList nearestObjectForTime:](self->_deviceOrientationDataByTime, "nearestObjectForTime:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && !self->_deviceOrientationReferenced)
  {
    -[ARWorldAlignmentTechnique _referenceDeviceOrientation:](self, "_referenceDeviceOrientation:", v15);
    v16 = 1;
  }
  else
  {
    v16 = 0;
  }
  if (!(_BYTE)v31 || !self->_relocalizedAlignmentData)
  {
    if (v15)
    {
      if (v8)
      {
        if (!self->_trackingReferenced || HIBYTE(v31))
        {
          -[ARWorldAlignmentTechnique _referenceTrackingAlignmentWithPoseData:deviceOrientation:](self, "_referenceTrackingAlignmentWithPoseData:deviceOrientation:", v8, v15);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v27;
          if (HIBYTE(v31) && self->_trackingReferenced)
          {
            objc_msgSend(v27, "setSessionShouldResumeCameraPositionAndHeading:", 1);
          }
          else if (v16)
          {
            objc_msgSend(v27, "setReferenceOriginChanged:", 0);
          }
          v41 = v19;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          self->_trackingReferenced = 1;
          goto LABEL_41;
        }
        if (-[ARWorldAlignmentTechnique alignment](self, "alignment") == 1)
        {
          -[ARWorldAlignmentTechnique _updateHeadingAlignmentWithPoseData:deviceOrientation:timestamp:](self, "_updateHeadingAlignmentWithPoseData:deviceOrientation:timestamp:", v8, v15, a3);
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v18;
          if (!v18)
          {
            v17 = (void *)MEMORY[0x1E0C9AA60];
            goto LABEL_41;
          }
          v40 = v18;
          v20 = (void *)MEMORY[0x1E0C99D20];
          v21 = &v40;
          goto LABEL_40;
        }
LABEL_21:
        v17 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_42;
      }
      -[ARWorldAlignmentTechnique _deviceOrientationPoseDataFromDeviceOrientation:](self, "_deviceOrientationPoseDataFromDeviceOrientation:", v15);
      v22 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v22;
      if (self->_trackingReferenced)
      {
        _ARLogTechnique_8();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          v24 = (objc_class *)objc_opt_class();
          NSStringFromClass(v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v37 = v25;
          v38 = 2048;
          v39 = self;
          _os_log_impl(&dword_1B3A68000, v23, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: World Tracking Reference Cleared", buf, 0x16u);

        }
        self->_trackingReferenced = 0;
        v26 = (void *)objc_opt_new();
        objc_msgSend(v26, "setWorldAlignmentReset:", 1);
        objc_msgSend(v26, "setReferenceOriginChanged:", 1);
        if (v14 == 1)
          objc_msgSend(v26, "setSessionShouldResumeCameraPositionAndHeading:", 1);
        else
          objc_msgSend(v26, "setSessionShouldResumeCameraPosition:", 1);
        v35[0] = v19;
        v35[1] = v26;
        v28 = (void *)MEMORY[0x1E0C99D20];
        v29 = v35;
        goto LABEL_37;
      }
      if (v16)
      {
        v26 = (void *)objc_opt_new();
        objc_msgSend(v26, "setWorldAlignmentReset:", 1);
        v34[0] = v19;
        v34[1] = v26;
        v28 = (void *)MEMORY[0x1E0C99D20];
        v29 = v34;
LABEL_37:
        objc_msgSend(v28, "arrayWithObjects:count:", v29, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_41:
        goto LABEL_42;
      }
      v33 = v22;
      v20 = (void *)MEMORY[0x1E0C99D20];
      v21 = &v33;
    }
    else
    {
      if (v14 != 1 || self->_trackingReferenced)
        goto LABEL_21;
      v19 = (void *)objc_opt_new();
      v32 = v19;
      v20 = (void *)MEMORY[0x1E0C99D20];
      v21 = (uint64_t *)&v32;
    }
LABEL_40:
    objc_msgSend(v20, "arrayWithObjects:count:", v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_41;
  }
  v42[0] = self->_relocalizedAlignmentData;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  self->_trackingReferenced = 1;
LABEL_42:

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_dataSemaphore);
  -[ARTechnique delegate](self, "delegate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "technique:didOutputResultData:timestamp:context:", self, v17, v6, a3);

}

- (id)predictedResultDataAtTimestamp:(double)a3 context:(id)a4
{
  CMMotionManager *motionManager;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  CMMotionManager *v15;
  void *v16;
  void *v17;
  id v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  ARWorldAlignmentTechnique *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  double v28;
  __int16 v29;
  CMMotionManager *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_dataSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (!self->_deviceOrientationReferenced
    || self->_trackingReferenced
    || -[ARWorldAlignmentTechnique alignment](self, "alignment") == 2)
  {
    goto LABEL_14;
  }
  motionManager = self->_motionManager;
  if (!motionManager
    || !-[CMMotionManager isPredictedDeviceMotionAvailable](motionManager, "isPredictedDeviceMotionAvailable"))
  {
LABEL_12:
    -[ARTimeKeyedList nearestObjectForTime:](self->_deviceOrientationDataByTime, "nearestObjectForTime:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_13;
LABEL_14:
    v17 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_15;
  }
  kdebug_trace();
  -[ARWorldAlignmentTechnique motionManager](self, "motionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v7, "predictedDeviceMotionAtTimestamp:error:", &v19, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v19;

  objc_msgSend(v8, "timestamp");
  CFAbsoluteTimeGetCurrent();
  kdebug_trace();
  if (!v8)
  {
    _ARLogSensor_5();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = self->_motionManager;
      *(_DWORD *)buf = 138544386;
      v22 = v13;
      v23 = 2048;
      v24 = self;
      v25 = 2112;
      v26 = v14;
      v27 = 2048;
      v28 = a3;
      v29 = 2048;
      v30 = v15;
      _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error(%@) Failed to get device motion prediction at timestamp (%f) from motion manager (%p)", buf, 0x34u);

    }
    goto LABEL_12;
  }
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setDeviceMotion:", v8);

  if (!v10)
    goto LABEL_12;
LABEL_13:
  -[ARWorldAlignmentTechnique _deviceOrientationPoseDataFromDeviceOrientation:](self, "_deviceOrientationPoseDataFromDeviceOrientation:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_dataSemaphore);
  return v17;
}

- (void)_referenceDeviceOrientation:(id)a3
{
  id v4;
  __n128 v5;
  __n128 v6;
  __n128 v7;
  __int128 v8;
  float v9;
  float v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  objc_class *v18;
  __int128 v19;
  _OWORD v20[4];
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  ARWorldAlignmentTechnique *v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[ARWorldAlignmentTechnique alignment](self, "alignment") == 1 && !self->_relocalizing)
  {
    if (self->_cameraPosition == 2)
    {
      self->_deviceOrientationAlignmentAngle = 3.1416;
      _ARLogTechnique_8();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        goto LABEL_11;
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v16;
      v24 = 2048;
      v25 = self;
      v26 = 2048;
      v27 = 180.0;
    }
    else
    {
      self->_deviceOrientationAlignmentAngle = 0.0;
      _ARLogTechnique_8();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        goto LABEL_11;
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v16;
      v24 = 2048;
      v25 = self;
      v26 = 2048;
      v27 = 0.0;
    }
    goto LABEL_10;
  }
  if (v4)
  {
    objc_msgSend(v4, "rotationMatrix");
  }
  else
  {
    v21 = 0;
    memset(v20, 0, sizeof(v20));
  }
  v5.n128_f64[0] = ARCameraToWorldTransformFromCMRotationMatrix((double *)v20, self->_cameraPosition, self->_imageMirrored);
  *(double *)&v8 = AREulerAnglesFromMatrix(v5, v6, v7);
  v19 = v8;
  v9 = *((float *)&v8 + 1);
  v10 = -*((float *)&v8 + 1);
  self->_deviceOrientationAlignmentAngle = -*((float *)&v8 + 1);
  _ARLogTechnique_8();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v23 = v13;
    v24 = 2048;
    v25 = self;
    v26 = 2048;
    v27 = *(float *)&v19 * 0.318309886 * 180.0;
    v28 = 2048;
    v29 = v9 * 0.318309886 * 180.0;
    v30 = 2048;
    v31 = *((float *)&v19 + 2) * 0.318309886 * 180.0;
    _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Device Orientation Referenced at (%0.2f° %0.2f° %0.2f°)", buf, 0x34u);

  }
  _ARLogTechnique_8();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v16;
    v24 = 2048;
    v25 = self;
    v26 = 2048;
    v27 = v10 * 0.318309886 * 180.0;
LABEL_10:
    _os_log_impl(&dword_1B3A68000, v14, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Device Orientation Alignment (%0.2f°)", buf, 0x20u);

  }
LABEL_11:

  self->_deviceOrientationReferenced = 1;
}

- (float)_trackingAlignmentAngleForPoseData:(id)a3 deviceOrientation:(id)a4
{
  id v6;
  __n128 v7;
  __n128 v8;
  __n128 v9;
  float32x4_t v10;
  __n128 v11;
  __n128 v12;
  __n128 v13;
  float32x4_t v14;
  float v15;
  float32x4_t v17;
  _OWORD v18[4];
  uint64_t v19;

  v6 = a3;
  if (a4)
  {
    objc_msgSend(a4, "rotationMatrix");
  }
  else
  {
    v19 = 0;
    memset(v18, 0, sizeof(v18));
  }
  v7.n128_f64[0] = ARCameraToWorldTransformFromCMRotationMatrix((double *)v18, self->_cameraPosition, self->_imageMirrored);
  *(double *)v10.i64 = AREulerAnglesFromMatrix(v7, v8, v9);
  v17 = v10;
  objc_msgSend(v6, "cameraTransform");
  *(double *)v14.i64 = AREulerAnglesFromMatrix(v11, v12, v13);
  v15 = COERCE_FLOAT(vsubq_f32(v14, v17).i32[1]) - self->_deviceOrientationAlignmentAngle;

  return v15;
}

- (id)_referenceTrackingAlignmentWithPoseData:(id)a3 deviceOrientation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;
  double v10;
  __int128 v11;
  __float2 v12;
  float32x4_t v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  __n128 v17;
  __n128 v18;
  __n128 v19;
  __n128 v20;
  void *v21;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  ARWorldAlignmentTechnique *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setReferenceOriginChanged:", 1);
  v9 = -[ARWorldAlignmentTechnique alignment](self, "alignment");
  LODWORD(v10) = 0;
  if (v9 != 16)
    -[ARWorldAlignmentTechnique _trackingAlignmentAngleForPoseData:deviceOrientation:](self, "_trackingAlignmentAngleForPoseData:deviceOrientation:", v6, v7, v10);
  self->_trackingAlignmentAngle = *(float *)&v10;
  objc_msgSend(v6, "cameraTransform");
  *(_OWORD *)self->_trackingAlignmentTranslation = v11;
  v12 = __sincosf_stret(self->_trackingAlignmentAngle * 0.5);
  v13 = vmulq_n_f32((float32x4_t)xmmword_1B3BDFDD0, v12.__sinval);
  v13.i32[3] = LODWORD(v12.__cosval);
  simd_matrix4x4(v13);
  ARMatrix4x4FromRotationAndTranslation();
  objc_msgSend(v8, "setWorldAlignmentTransform:");
  _ARLogTechnique_8();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "worldAlignmentTransform");
    ARMatrix4x4Description(0, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v24 = v16;
    v25 = 2048;
    v26 = self;
    v27 = 2112;
    v28 = v21;
    _os_log_impl(&dword_1B3A68000, v14, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: World Tracking Referenced: %@", buf, 0x20u);

  }
  return v8;
}

- (id)_updateHeadingAlignmentWithPoseData:(id)a3 deviceOrientation:(id)a4 timestamp:(double)a5
{
  float v7;
  float v8;
  float trackingAlignmentAngle;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  BOOL v15;
  float v16;
  void *v17;
  __float2 v18;
  float32x4_t v19;

  v7 = a5 - self->_lastHeadingUpdateTimestamp;
  -[ARWorldAlignmentTechnique _trackingAlignmentAngleForPoseData:deviceOrientation:](self, "_trackingAlignmentAngleForPoseData:deviceOrientation:", a3, a4);
  trackingAlignmentAngle = self->_trackingAlignmentAngle;
  v10 = vabds_f32(v8, trackingAlignmentAngle);
  v11 = (float)(4.0 / sqrtf(v7)) + 2.0;
  v12 = v10 + -6.28318531;
  v13 = fabsf(v12);
  if (v10 > 3.14159265)
    v10 = v13;
  if (v11 * 3.14159265 / 180.0 >= v10)
  {
    v17 = 0;
  }
  else
  {
    self->_lastHeadingUpdateTimestamp = a5;
    if (v10 <= 0.523598776)
    {
      v14 = v10 * 0.125;
      v15 = v8 <= trackingAlignmentAngle;
      v8 = trackingAlignmentAngle - v14;
      v16 = trackingAlignmentAngle + v14;
      if (!v15)
        v8 = v16;
    }
    self->_trackingAlignmentAngle = v8;
    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "setReferenceOriginChanged:", 0);
    v18 = __sincosf_stret(self->_trackingAlignmentAngle * 0.5);
    v19 = vmulq_n_f32((float32x4_t)xmmword_1B3BDFDD0, v18.__sinval);
    v19.i32[3] = LODWORD(v18.__cosval);
    simd_matrix4x4(v19);
    ARMatrix4x4FromRotationAndTranslation();
    objc_msgSend(v17, "setWorldAlignmentTransform:");
  }
  return v17;
}

- (id)_deviceOrientationPoseDataFromDeviceOrientation:(id)a3
{
  id v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  __float2 v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[4];
  uint64_t v24;
  _OWORD v25[4];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "rotationMatrix");
  }
  else
  {
    v24 = 0;
    memset(v23, 0, sizeof(v23));
  }
  *(double *)&v6 = ARCameraToWorldTransformFromCMRotationMatrix((double *)v23, self->_cameraPosition, self->_imageMirrored);
  v21 = v7;
  v22 = v6;
  v19 = v9;
  v20 = v8;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v5, "timestamp");
  objc_msgSend(v10, "setTimestamp:");
  v11 = __sincosf_stret(self->_deviceOrientationAlignmentAngle * 0.5);
  v12 = vmulq_n_f32((float32x4_t)xmmword_1B3BDFDD0, v11.__sinval);
  v12.i32[3] = LODWORD(v11.__cosval);
  *(double *)v13.i64 = simd_matrix4x4(v12);
  v17 = 0;
  v25[0] = v22;
  v25[1] = v21;
  v25[2] = v20;
  v25[3] = v19;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  do
  {
    *(__int128 *)((char *)&v26 + v17 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v13, COERCE_FLOAT(v25[v17])), v14, *(float32x2_t *)&v25[v17], 1), v15, (float32x4_t)v25[v17], 2), v16, (float32x4_t)v25[v17], 3);
    ++v17;
  }
  while (v17 != 4);
  objc_msgSend(v10, "setCameraTransform:", *(double *)&v26, *(double *)&v27, *(double *)&v28, *(double *)&v29);

  return v10;
}

- (void)_handleTrackingStateChanges:(id)a3 initialized:(BOOL *)a4 relocalized:(BOOL *)a5
{
  id v8;
  void *v9;
  int64_t v10;
  void *v11;
  ARWorldAlignmentData *v12;
  ARWorldAlignmentData *relocalizedAlignmentData;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double lastMajorRelocalizationTimestamp;
  void *v19;
  double v20;
  _QWORD v21[9];

  v8 = a3;
  objc_msgSend(v8, "worldTrackingState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "reason");

  if (v8 && self->_lastTrackingStateReason != v10)
  {
    if (v10 == 1)
    {
      self->_relocalizing = 1;
      if (self->_lastTrackingStateReason != 4)
      {
        memset(&v21[1], 0, 24);
        memset(&v21[5], 0, 24);
        v11 = (void *)objc_opt_new();
        v21[0] = 0x3FF0000000000000;
        v21[4] = 0x3FF0000000000000;
        v21[8] = 0x3FF0000000000000;
        objc_msgSend(v11, "setRotationMatrix:", v21);
        -[ARWorldAlignmentTechnique _referenceDeviceOrientation:](self, "_referenceDeviceOrientation:", v11);
        -[ARWorldAlignmentTechnique _referenceTrackingAlignmentWithPoseData:deviceOrientation:](self, "_referenceTrackingAlignmentWithPoseData:deviceOrientation:", v8, v11);
        v12 = (ARWorldAlignmentData *)objc_claimAutoreleasedReturnValue();
        relocalizedAlignmentData = self->_relocalizedAlignmentData;
        self->_relocalizedAlignmentData = v12;

      }
      -[ARTimeKeyedList clear](self->_deviceOrientationDataByTime, "clear");
      self->_deviceOrientationReferenced = 0;
    }
    else
    {
      objc_msgSend(v8, "worldTrackingState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "majorRelocalization"))
      {

      }
      else
      {
        objc_msgSend(v8, "worldTrackingState");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastMajorRelocalizationTimestamp");
        v17 = v16;
        lastMajorRelocalizationTimestamp = self->_lastMajorRelocalizationTimestamp;

        if (v17 <= lastMajorRelocalizationTimestamp)
        {
          if (a4 && self->_lastTrackingStateReason == 1)
            *a4 = 1;
          goto LABEL_13;
        }
      }
      if (a5)
        *a5 = 1;
      self->_relocalizing = 0;
      objc_msgSend(v8, "worldTrackingState");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastMajorRelocalizationTimestamp");
      self->_lastMajorRelocalizationTimestamp = v20;

    }
LABEL_13:
    self->_lastTrackingStateReason = v10;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  int64_t v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ARWorldAlignmentTechnique;
  if (-[ARTechnique isEqual:](&v10, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = -[ARWorldAlignmentTechnique alignment](self, "alignment");
    if (v6 == objc_msgSend(v5, "alignment"))
    {
      v7 = -[ARWorldAlignmentTechnique cameraPosition](self, "cameraPosition");
      v8 = v7 == objc_msgSend(v5, "cameraPosition");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_fullDescription
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v12.receiver = self;
  v12.super_class = (Class)ARWorldAlignmentTechnique;
  -[ARTechnique _fullDescription](&v12, sel__fullDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_relocalizing)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("\tRelocalizing %@\n"), v6);
  if (self->_trackingReferenced)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("\tTrackingReferenced %@\n"), v7);
  objc_msgSend(v5, "appendFormat:", CFSTR("\tLatestTrakingStateReason %ld\n"), self->_lastTrackingStateReason);
  -[ARTimeKeyedList description](self->_deviceOrientationDataByTime, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t\t"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\tOrientationData %@\n"), v10);

  return v5;
}

- (BOOL)isBusy
{
  intptr_t v3;

  v3 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_dataSemaphore, 0);
  if (!v3)
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_dataSemaphore);
  return v3 != 0;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- (CMMotionManager)motionManager
{
  return self->_motionManager;
}

- (void)setMotionManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_dataSemaphore, 0);
  objc_storeStrong((id *)&self->_relocalizedAlignmentData, 0);
  objc_storeStrong((id *)&self->_deviceOrientationDataByTime, 0);
}

@end
