@implementation ARSLAMState

- (ARSLAMState)initWithSLAMState:(CV3DSLAMStateContext *)a3
{
  ARSLAMState *v4;
  ARSLAMState *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ARSLAMState;
  v4 = -[ARSLAMState init](&v7, sel_init);
  if (!v4)
    goto LABEL_5;
  if (ARMinVergenceAngleCosineDefault_onceToken != -1)
    dispatch_once(&ARMinVergenceAngleCosineDefault_onceToken, &__block_literal_global_110);
  *(_QWORD *)&v4->_minVergenceAngleCosine = ARMinVergenceAngleCosineDefault_sMinVergenceAngleCosine;
  if (!-[ARSLAMState setSLAMState:](v4, "setSLAMState:", a3))
    v5 = 0;
  else
LABEL_5:
    v5 = v4;

  return v5;
}

- (BOOL)setSLAMState:(CV3DSLAMStateContext *)a3
{
  int Timestamp;
  int v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  ARSLAMState *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_slamState)
  {
    CV3DSLAMStateRelease();
    self->_timestamp = 0.0;
    self->_slamState = 0;
  }
  Timestamp = CV3DSLAMStateGetTimestamp();
  v6 = *MEMORY[0x1E0CFCA08];
  if (Timestamp == *MEMORY[0x1E0CFCA08])
  {
    self->_slamState = a3;
    self->_timestamp = 0.0;
    CV3DSLAMStateRetain();
  }
  else
  {
    _ARLogGeneral_39();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCV3DSLAMReturn(Timestamp);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v13 = v9;
      v14 = 2048;
      v15 = self;
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to get timestamp for SLAM state: %{public}@", buf, 0x20u);

    }
  }
  return Timestamp == v6;
}

- (void)dealloc
{
  objc_super v3;

  CV3DSLAMStateRelease();
  v3.receiver = self;
  v3.super_class = (Class)ARSLAMState;
  -[ARSLAMState dealloc](&v3, sel_dealloc);
}

- (unsigned)slamMode
{
  return CV3DSLAMStateGetSLAMMode();
}

- (unsigned)visualSLAMState
{
  return CV3DSLAMStateGetVisualSLAMState();
}

- (int)trackingState
{
  CV3DSLAMStateGetStatus();
  return 1;
}

- (ARPointCloud)pointCloud
{
  int v3;
  unsigned int v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int PointCloud;
  ARPointCloud *v10;
  int v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  ARSLAMState *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = -[ARSLAMState trackingState](self, "trackingState");
  if (v3)
  {
    v4 = v3;
    _ARLogGeneral_39();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCV3DVIOTrackingState(v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v7;
      v19 = 2048;
      v20 = self;
      v21 = 2114;
      v22 = v8;
      _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Point cloud rejected because tracking state is %{public}@", (uint8_t *)&v17, 0x20u);

    }
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v5 = objc_claimAutoreleasedReturnValue();
  PointCloud = CV3DSLAMStateGetPointCloud();
  if (PointCloud != *MEMORY[0x1E0CFCA08])
  {
    v11 = PointCloud;
    _ARLogGeneral_39();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCV3DSLAMReturn(v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v14;
      v19 = 2048;
      v20 = self;
      v21 = 2114;
      v22 = v15;
      _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to retrieve point cloud from SLAM state: %{public}@", (uint8_t *)&v17, 0x20u);

    }
    goto LABEL_9;
  }
  v10 = -[ARPointCloud initWithCV3DPointData:minVergenceAngleCosine:]([ARPointCloud alloc], "initWithCV3DPointData:minVergenceAngleCosine:", v5, self->_minVergenceAngleCosine);
LABEL_10:

  return v10;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARSLAMState timestamp](self, "timestamp");
  objc_msgSend(v6, "appendFormat:", CFSTR(" timestamp=%f"), v7);
  LODWORD(v5) = -[ARSLAMState slamMode](self, "slamMode");
  NSStringFromCV3DSLAMMode((int)v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" mode=%@"), v8);

  if ((_DWORD)v5 == *MEMORY[0x1E0CFC9D8])
  {
    NSStringFromCV3DVisualSLAMState(-[ARSLAMState visualSLAMState](self, "visualSLAMState"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" visualSLAMState=%@"), v9);

    objc_msgSend(v6, "appendFormat:", CFSTR(" visualSLAMTransitions=%i"), CV3DSLAMStateGetNumberOfVOToVIOStateTransitions());
  }
  NSStringFromCV3DVIOTrackingState(-[ARSLAMState trackingState](self, "trackingState"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" trackingState=%@"), v10);

  CV3DSLAMStateNumReinit();
  objc_msgSend(v6, "appendFormat:", CFSTR(" reinitCount=%i"), 0);
  CV3DSLAMStateIsPoseLocked();
  objc_msgSend(v6, "appendFormat:", CFSTR(" poseLocked=%@"), CFSTR("no"));
  v11 = (void *)CV3DSLAMStateCopyCurrentTrackingCameraIds();
  v12 = (void *)CV3DSLAMStateCopyCameraFrameRates();
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" cameras={%@}"), v13);

  objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" frameRates={%@}"), v14);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

- (NSDictionary)tracingEntry
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  unint64_t v13;
  simd_float4 v14;
  unint64_t v15;
  simd_float4 v16;
  simd_float4 v17;
  simd_float4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *CameraTrackRatiosPerCamera;
  void *v27;
  void *v28;
  const __CFString *v29;
  simd_float4 v31;
  float32x4_t v32;
  simd_float4 v33;
  float32x4_t v34;
  simd_float4 v35;
  float32x4_t v36;
  simd_float4 v37;
  float32x4_t v38;
  simd_float4 v39;
  simd_float4 v40;
  simd_float4 v41;
  simd_float4 v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  _QWORD v47[4];
  _QWORD v48[4];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[5];
  double v53[12];
  simd_float4x4 v54;
  simd_float4x4 v55;

  v53[9] = *(double *)MEMORY[0x1E0C80C00];
  ARQATraceableDefaultEntryForResultData(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  LODWORD(v3) = -[ARSLAMState slamMode](self, "slamMode");
  NSStringFromCV3DSLAMMode((int)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("mode"));

  NSStringFromCV3DVIOTrackingState(-[ARSLAMState trackingState](self, "trackingState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("trackingState"));

  if ((_DWORD)v3 == *MEMORY[0x1E0CFC9D8])
  {
    NSStringFromCV3DVisualSLAMState(-[ARSLAMState visualSLAMState](self, "visualSLAMState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("visualSLAMState"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CV3DSLAMStateGetNumberOfVOToVIOStateTransitions());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("visualSLAMTransitions"));

  }
  memset(v53, 0, 72);
  memset(&v52[2], 0, 24);
  if (CV3DSLAMStateGetPoseInCameraFrame() == *MEMORY[0x1E0CFCA08])
  {
    *(double *)v54.columns[0].i64 = ARMatrix4x4MakeRowMajorTransform(v53);
    v55 = __invert_f4(v54);
    v35 = v55.columns[1];
    v37 = v55.columns[0];
    v31 = v55.columns[3];
    v33 = v55.columns[2];
    *(double *)v9.i64 = ARVisionToRenderingCoordinateTransform();
    v13 = 0;
    v39 = v37;
    v40 = v35;
    v41 = v33;
    v42 = v31;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v43 + v13) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v9, COERCE_FLOAT(*(_OWORD *)((char *)&v39 + v13))), v10, *(float32x2_t *)&v39.f32[v13 / 4], 1), v11, *(float32x4_t *)((char *)&v39 + v13), 2), v12, *(float32x4_t *)((char *)&v39 + v13), 3);
      v13 += 16;
    }
    while (v13 != 64);
    v36 = v44;
    v38 = v43;
    v32 = v46;
    v34 = v45;
    *(double *)v14.i64 = ARRenderingToVisionCoordinateTransform();
    v15 = 0;
    v39 = v14;
    v40 = v16;
    v41 = v17;
    v42 = v18;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v43 + v15) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v38, COERCE_FLOAT(*(_OWORD *)((char *)&v39 + v15))), v36, *(float32x2_t *)&v39.f32[v15 / 4], 1), v34, *(float32x4_t *)((char *)&v39 + v15), 2), v32, *(float32x4_t *)((char *)&v39 + v15), 3);
      v15 += 16;
    }
    while (v15 != 64);
    +[ARQAHelper arrayWithMatrix4x4:](ARQAHelper, "arrayWithMatrix4x4:", *(double *)v43.i64, *(double *)v44.i64, *(double *)v45.i64, *(double *)v46.i64);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("cameraPose"));

  }
  v39.i32[0] = 0;
  CV3DSLAMStateGetMapSize();
  CV3DSLAMStateWasTrackingMap();
  v51[0] = CFSTR("size");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), v39.u32[0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = CFSTR("tracking");
  v52[0] = v20;
  v52[1] = CFSTR("no");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("map"));

  CV3DSLAMStateIsInitFinished();
  CV3DSLAMStateNumReinit();
  v49[0] = CFSTR("finished");
  v49[1] = CFSTR("reinitCount");
  v50[0] = CFSTR("no");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("initialization"));

  v24 = (void *)CV3DSLAMStateCopyCurrentTrackingCameraIds();
  v25 = (void *)CV3DSLAMStateCopyCameraFrameRates();
  CameraTrackRatiosPerCamera = (void *)CV3DSLAMStateGetCameraTrackRatiosPerCamera();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("cameraIDs"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("frameRates"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CameraTrackRatiosPerCamera, CFSTR("trackRatios"));
  CV3DSLAMStateRelocalizationEvent();
  v43.i64[0] = 0;
  CV3DSLAMStateGetRelocalizationTimestamp();
  CV3DSLAMStateIsGlobalRelocalization();
  CV3DSLAMStateRelocalizationSucceeded();
  v48[0] = CFSTR("no");
  v47[0] = CFSTR("event");
  v47[1] = CFSTR("timestamp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)v43.i64);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v27;
  v48[2] = CFSTR("no");
  v47[2] = CFSTR("global");
  v47[3] = CFSTR("success");
  v48[3] = CFSTR("no");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("relocalization"));

  if (CV3DSLAMStateShouldUseVisualSLAM())
    v29 = CFSTR("yes");
  else
    v29 = CFSTR("no");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, CFSTR("useVisualSLAM"));

  return (NSDictionary *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const __CFData *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  ARSLAMState *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ARSLAMState slamState](self, "slamState");
  v5 = (const __CFData *)CV3DSLAMStateSerializeToData();
  if (v5 && (v6 = v5, CFDataGetLength(v5)))
  {
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("slamState"));
  }
  else
  {
    _ARLogGeneral_39();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2048;
      v12 = self;
      _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to serialize SLAM state", (uint8_t *)&v9, 0x16u);

    }
  }

}

- (ARSLAMState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  ARSLAMState *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  ARSLAMState *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("slamState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    _ARLogGeneral_39();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v10;
      v17 = 2048;
      v18 = self;
      _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to deserialize SLAM state", buf, 0x16u);

    }
    goto LABEL_9;
  }
  v6 = CV3DSLAMStateCreateFromData();
  if (!v6)
  {
    _ARLogGeneral_39();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2048;
      v18 = self;
      _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create SLAM state from data", buf, 0x16u);

    }
LABEL_9:

    v7 = 0;
    goto LABEL_10;
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __29__ARSLAMState_initWithCoder___block_invoke;
  v14[3] = &__block_descriptor_40_e5_v8__0l;
  v14[4] = v6;
  self = -[ARSLAMState initWithSLAMState:](self, "initWithSLAMState:", v6);
  ((void (*)(_QWORD *))__29__ARSLAMState_initWithCoder___block_invoke)(v14);
  v7 = self;
LABEL_10:

  return v7;
}

uint64_t __29__ARSLAMState_initWithCoder___block_invoke()
{
  return CV3DSLAMStateRelease();
}

- (double)timestamp
{
  return self->_timestamp;
}

- (CV3DSLAMStateContext)slamState
{
  return self->_slamState;
}

@end
