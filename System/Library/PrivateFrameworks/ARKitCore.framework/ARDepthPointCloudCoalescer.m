@implementation ARDepthPointCloudCoalescer

- (ARDepthPointCloudCoalescer)init
{
  ARDepthPointCloudCoalescer *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ARDepthPointCloudCoalescer;
  v2 = -[ARDepthPointCloudCoalescer init](&v5, sel_init);
  v2->_aggregatorLock._os_unfair_lock_opaque = 0;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setAggregationSize:", 4);
  objc_msgSend(v3, "setMaxPointCloudAge:", 0.5);
  -[ARDepthPointCloudCoalescer setAggregationParameters:](v2, "setAggregationParameters:", v3);

  return v2;
}

- (ADAggregationParameters)aggregationParameters
{
  return (ADAggregationParameters *)(id)-[ADAggregationParameters copy](self->_aggregationParameters, "copy");
}

- (void)setAggregationParameters:(id)a3
{
  id v4;
  ADAggregationParameters *v5;
  ADAggregationParameters *aggregationParameters;
  uint64_t v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  ADPointCloudAggregator *aggregator;
  int v12;
  void *v13;
  __int16 v14;
  ARDepthPointCloudCoalescer *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "ar_isEqualToParameters:", self->_aggregationParameters) & 1) == 0)
  {
    v5 = (ADAggregationParameters *)objc_msgSend(v4, "copy");
    aggregationParameters = self->_aggregationParameters;
    self->_aggregationParameters = v5;

    v7 = +[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", CFSTR("com.apple.arkit.jasper.aggregationBankCount"));
    if (v7 >= 1)
      -[ADAggregationParameters setAggregationSize:](self->_aggregationParameters, "setAggregationSize:", v7);
    _ARLogGeneral_12();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2048;
      v15 = self;
      _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: The aggregation parameters changed, deleting the aggregator", (uint8_t *)&v12, 0x16u);

    }
    os_unfair_lock_lock(&self->_aggregatorLock);
    aggregator = self->_aggregator;
    self->_aggregator = 0;

    os_unfair_lock_unlock(&self->_aggregatorLock);
  }

}

- (id)_createModifiedParametersIfNecessary:(id)a3
{
  uint64_t v4;
  int v5;
  ADAggregationParameters *aggregationParameters;
  ADAggregationParameters *v7;

  v4 = aggregationSizeForPointCloud(a3);
  v5 = -[ADAggregationParameters aggregationSize](self->_aggregationParameters, "aggregationSize");
  aggregationParameters = self->_aggregationParameters;
  if (v5 == (_DWORD)v4)
  {
    v7 = aggregationParameters;
  }
  else
  {
    v7 = (ADAggregationParameters *)-[ADAggregationParameters copy](aggregationParameters, "copy");
    -[ADAggregationParameters setAggregationSize:](v7, "setAggregationSize:", v4);
  }
  return v7;
}

- (void)addDepthPointCloudData:(id)a3
{
  id v4;
  os_unfair_lock_s *p_aggregatorLock;
  ADPointCloudAggregator *aggregator;
  void *v7;
  int v8;
  int v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  ADPointCloudAggregator *v14;
  ADPointCloudAggregator *v15;
  ADPointCloudAggregator *v16;
  NSObject *v17;
  objc_class *v18;
  id v19;
  ADPointCloudAggregator *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  ADPointCloudAggregator *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  int v35;
  id v36;
  __int16 v37;
  ARDepthPointCloudCoalescer *v38;
  __int16 v39;
  ADPointCloudAggregator *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_aggregatorLock = &self->_aggregatorLock;
  os_unfair_lock_lock(&self->_aggregatorLock);
  aggregator = self->_aggregator;
  if (!aggregator
    || (-[ADPointCloudAggregator aggregationParameters](aggregator, "aggregationParameters"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "aggregationSize"),
        v9 = aggregationSizeForPointCloud(v4),
        v7,
        v8 != v9))
  {
    -[ARDepthPointCloudCoalescer _createModifiedParametersIfNecessary:](self, "_createModifiedParametersIfNecessary:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _ARLogGeneral_12();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = self->_aggregator;
      v35 = 138543874;
      v36 = v13;
      v37 = 2048;
      v38 = self;
      v39 = 2048;
      v40 = v14;
      _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_INFO, "%{public}@ <%p>: About to create a new ADPointCloudAggregator; old: (%p)",
        (uint8_t *)&v35,
        0x20u);

    }
    v15 = (ADPointCloudAggregator *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCE20]), "initWithAggregationParameters:", v10);
    v16 = self->_aggregator;
    self->_aggregator = v15;

    _ARLogGeneral_12();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = self->_aggregator;
      -[ADPointCloudAggregator aggregationParameters](v20, "aggregationParameters");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "aggregationSize");
      -[ADPointCloudAggregator aggregationParameters](self->_aggregator, "aggregationParameters");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "maxPointCloudAge");
      v35 = 138544386;
      v36 = v19;
      v37 = 2048;
      v38 = self;
      v39 = 2048;
      v40 = v20;
      v41 = 1024;
      v42 = v22;
      v43 = 2048;
      v44 = v24;
      _os_log_impl(&dword_1B3A68000, v17, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Created a new ADPointCloudAggregator (%p) with Size:%u Age:%lf", (uint8_t *)&v35, 0x30u);

    }
  }
  objc_msgSend(v4, "timestamp");
  objc_msgSend(v4, "pointCloud");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "length");
  kdebug_trace();

  v26 = self->_aggregator;
  objc_msgSend(v4, "pointCloud");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v29 = v28;
  v30 = (void *)MEMORY[0x1E0CFCE20];
  objc_msgSend(v4, "visionCameraTransform");
  objc_msgSend(v30, "transformMetersToMillimiters:");
  -[ADPointCloudAggregator pushPointCloud:timestamp:worldToCameraTransform:](v26, "pushPointCloud:timestamp:worldToCameraTransform:", v27, v29, v31, v32, v33, v34);

  kdebug_trace();
  os_unfair_lock_unlock(p_aggregatorLock);

}

- (id)depthPointCloudWithPose:(id)a3 imageData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  id v14;
  objc_class *v15;
  id v16;
  objc_class *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  NSObject *v26;
  objc_class *v27;
  id v28;
  objc_class *v29;
  id v30;
  objc_class *v31;
  void *v32;
  NSObject *v33;
  objc_class *v34;
  id v35;
  void *v36;
  ADPointCloudAggregator *aggregator;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v43;
  __int128 v44;
  os_unfair_lock_t lock;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  ARDepthPointCloudCoalescer *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  uint64_t v54;
  simd_float4x4 v55;
  simd_float4x4 v56;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  lock = &self->_aggregatorLock;
  os_unfair_lock_lock(&self->_aggregatorLock);
  -[ADPointCloudAggregator aggregationParameters](self->_aggregator, "aggregationParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "aggregationSize");
  CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v7, "pixelBuffer"));
  CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v7, "pixelBuffer"));
  objc_msgSend(v7, "timestamp");
  kdebug_trace();
  objc_msgSend(v7, "calibrationData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0CFCDC0]);
    objc_msgSend(v10, "ar_initWithImageData:calibrationData:", v7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_8;
    _ARLogGeneral_12();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v47 = v14;
      v48 = 2048;
      v49 = self;
      v50 = 2114;
      v51 = v16;
      v52 = 2114;
      v53 = v18;
      _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: failed to create %{public}@ from calibration data, using last known %{public}@ calibration", buf, 0x2Au);

    }
  }
  objc_msgSend(v7, "adCameraCalibration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v20)
  {
LABEL_13:
    _ARLogGeneral_12();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cameraType");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v47 = v35;
      v48 = 2048;
      v49 = self;
      v50 = 2114;
      v51 = v36;
      _os_log_impl(&dword_1B3A68000, v33, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not update aggregator calibration for image: %{public}@", buf, 0x20u);

    }
    v11 = 0;
    if (v6)
      goto LABEL_9;
LABEL_16:
    v43 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 48);
    v44 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 32);
    goto LABEL_17;
  }
  v21 = (void *)MEMORY[0x1E0CFCDC0];
  objc_msgSend(v7, "adCameraCalibration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "ar_calibrationWithImageData:adCalibrationData:", v7, v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    _ARLogGeneral_12();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v47 = v28;
      v48 = 2048;
      v49 = self;
      v50 = 2114;
      v51 = v30;
      v52 = 2114;
      v53 = v32;
      _os_log_impl(&dword_1B3A68000, v26, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: failed to create %{public}@ from calibration data, using last known %{public}@ calibration", buf, 0x2Au);

    }
    goto LABEL_13;
  }
LABEL_8:
  -[ADPointCloudAggregator setColorCameraCalibration:](self->_aggregator, "setColorCameraCalibration:", v11);
  objc_msgSend(v11, "cameraToPlatformTransform");
  ARMatrix4x4FromMatrix4x3();
  v56 = __invert_f4(v55);
  -[ADPointCloudAggregator setJasperToCameraTransform:](self->_aggregator, "setJasperToCameraTransform:", *(double *)v56.columns[0].i64, *(double *)v56.columns[1].i64, *(double *)v56.columns[2].i64, *(double *)v56.columns[3].i64);
  if (!v6)
    goto LABEL_16;
LABEL_9:
  v23 = (void *)MEMORY[0x1E0CFCE20];
  objc_msgSend(v6, "visionCameraTransform");
  objc_msgSend(v23, "transformMetersToMillimiters:");
  v43 = v25;
  v44 = v24;
LABEL_17:
  aggregator = self->_aggregator;
  objc_msgSend(v6, "timestamp", v43, v44);
  -[ADPointCloudAggregator aggregateForTime:worldToCameraTransform:](aggregator, "aggregateForTime:worldToCameraTransform:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADPointCloudAggregator jasperToCameraTransform](self->_aggregator, "jasperToCameraTransform");
  -[ADPointCloudAggregator jasperToCameraTransform](self->_aggregator, "jasperToCameraTransform");
  -[ADPointCloudAggregator jasperToCameraTransform](self->_aggregator, "jasperToCameraTransform");
  kdebug_trace();
  -[ADPointCloudAggregator jasperToCameraTransform](self->_aggregator, "jasperToCameraTransform");
  -[ADPointCloudAggregator jasperToCameraTransform](self->_aggregator, "jasperToCameraTransform");
  -[ADPointCloudAggregator jasperToCameraTransform](self->_aggregator, "jasperToCameraTransform");
  kdebug_trace();
  -[ADPointCloudAggregator jasperToCameraTransform](self->_aggregator, "jasperToCameraTransform");
  -[ADPointCloudAggregator jasperToCameraTransform](self->_aggregator, "jasperToCameraTransform");
  -[ADPointCloudAggregator jasperToCameraTransform](self->_aggregator, "jasperToCameraTransform");
  kdebug_trace();
  -[ADPointCloudAggregator jasperToCameraTransform](self->_aggregator, "jasperToCameraTransform");
  -[ADPointCloudAggregator jasperToCameraTransform](self->_aggregator, "jasperToCameraTransform");
  -[ADPointCloudAggregator jasperToCameraTransform](self->_aggregator, "jasperToCameraTransform");
  kdebug_trace();
  -[ADPointCloudAggregator colorCameraCalibration](self->_aggregator, "colorCameraCalibration");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "intrinsicMatrix");
  -[ADPointCloudAggregator colorCameraCalibration](self->_aggregator, "colorCameraCalibration");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "intrinsicMatrix");
  -[ADPointCloudAggregator colorCameraCalibration](self->_aggregator, "colorCameraCalibration");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "intrinsicMatrix");
  kdebug_trace();

  objc_msgSend(v38, "length");
  kdebug_trace();

  os_unfair_lock_unlock(lock);
  return v38;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregator, 0);
  objc_storeStrong((id *)&self->_aggregationParameters, 0);
}

@end
