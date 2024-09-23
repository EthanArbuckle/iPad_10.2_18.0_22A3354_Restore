@implementation ARPlaneEstimationTechnique

- (ARPlaneEstimationTechnique)initWithTrackingTechnique:(id)a3
{
  id v5;
  ARPlaneEstimationTechnique *v6;
  ARPlaneEstimationTechnique *v7;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *semaphoreResult;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  ARPlaneEstimationTechnique *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ARPlaneEstimationTechnique;
  v6 = -[ARTechnique init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_worldTrackingTechnique, a3);
    -[ARWorldTrackingTechnique addObserver:](v7->_worldTrackingTechnique, "addObserver:", v7);
    v8 = dispatch_semaphore_create(1);
    semaphoreResult = v7->_semaphoreResult;
    v7->_semaphoreResult = (OS_dispatch_semaphore *)v8;

    _ARLogTechnique();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v16 = v12;
      v17 = 2048;
      v18 = v7;
      v19 = 2048;
      v20 = v5;
      _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_INFO, "%{public}@ <%p>: initialized with world tracking technique (%p)", buf, 0x20u);

    }
  }

  return v7;
}

- (void)dealloc
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  ARPlaneEstimationTechnique *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _ARLogTechnique();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v8 = v5;
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: dealloc", buf, 0x16u);

  }
  v6.receiver = self;
  v6.super_class = (Class)ARPlaneEstimationTechnique;
  -[ARPlaneEstimationTechnique dealloc](&v6, sel_dealloc);
}

- (id)resultDataClasses
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

- (BOOL)reconfigurableFrom:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[ARPlaneEstimationTechnique worldTrackingTechnique](self, "worldTrackingTechnique");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "worldTrackingTechnique");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "reconfigurableFrom:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)reconfigureFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = v8;
    -[ARPlaneEstimationTechnique worldTrackingTechnique](self, "worldTrackingTechnique");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", self);

    objc_msgSend(v4, "worldTrackingTechnique");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:", self);

    objc_msgSend(v4, "worldTrackingTechnique");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARPlaneEstimationTechnique setWorldTrackingTechnique:](self, "setWorldTrackingTechnique:", v7);

  }
}

- (void)siblingTechniquesDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  +[ARTechnique techniqueOfClass:inArray:](ARTechnique, "techniqueOfClass:inArray:", objc_opt_class(), v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[ARPlaneEstimationTechnique worldTrackingTechnique](self, "worldTrackingTechnique");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", self);

    objc_msgSend(v4, "addObserver:", self);
    -[ARPlaneEstimationTechnique setWorldTrackingTechnique:](self, "setWorldTrackingTechnique:", v4);
  }

}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  ARWorldTrackingTechnique *worldTrackingTechnique;
  void *v10;
  ARPlaneData *planeResultData;
  ARRawSceneUnderstandingData *rawSceneUnderstandingData;
  void *v13;
  char v14;
  void *v15;
  id v16;

  v16 = a4;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v16, "anchorsToRemove");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    worldTrackingTechnique = self->_worldTrackingTechnique;
    objc_msgSend(v16, "anchorsToRemove");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARWorldTrackingTechnique removePlanesByUUIDs:](worldTrackingTechnique, "removePlanesByUUIDs:", v10);

  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphoreResult, 0xFFFFFFFFFFFFFFFFLL);
  if (self->_planeResultData)
  {
    objc_msgSend(v6, "addObject:");
    planeResultData = self->_planeResultData;
    self->_planeResultData = 0;

  }
  if (self->_rawSceneUnderstandingData)
  {
    objc_msgSend(v6, "addObject:");
    rawSceneUnderstandingData = self->_rawSceneUnderstandingData;
    self->_rawSceneUnderstandingData = 0;

  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphoreResult);
  -[ARTechnique delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[ARTechnique delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "technique:didOutputResultData:timestamp:context:", self, v6, v16, a3);

  }
}

- (void)technique:(id)a3 didDetectPlane:(id)a4 timestamp:(double)a5
{
  ARPlaneData *v6;
  ARPlaneData *planeResultData;
  ARPlaneData *v8;

  v6 = (ARPlaneData *)a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphoreResult, 0xFFFFFFFFFFFFFFFFLL);
  planeResultData = self->_planeResultData;
  self->_planeResultData = v6;
  v8 = v6;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphoreResult);
}

- (void)technique:(id)a3 didOutputSceneUnderstandingData:(id)a4 timestamp:(double)a5
{
  ARRawSceneUnderstandingData *v6;
  ARRawSceneUnderstandingData *rawSceneUnderstandingData;
  ARRawSceneUnderstandingData *v8;

  v6 = (ARRawSceneUnderstandingData *)a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphoreResult, 0xFFFFFFFFFFFFFFFFLL);
  rawSceneUnderstandingData = self->_rawSceneUnderstandingData;
  self->_rawSceneUnderstandingData = v6;
  v8 = v6;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphoreResult);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ARPlaneEstimationTechnique;
  if (-[ARTechnique isEqual:](&v10, sel_isEqual_, v4))
  {
    v5 = v4;
    -[ARPlaneEstimationTechnique worldTrackingTechnique](self, "worldTrackingTechnique");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "worldTrackingTechnique");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6 == v7;

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
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v7.receiver = self;
  v7.super_class = (Class)ARPlaneEstimationTechnique;
  -[ARTechnique _fullDescription](&v7, sel__fullDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("Plane Result Data: %@\n"), self->_planeResultData);
  objc_msgSend(v5, "appendFormat:", CFSTR("Scene Understanding Data: %@\n"), self->_rawSceneUnderstandingData);
  return v5;
}

- (BOOL)isBusy
{
  intptr_t v3;

  v3 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphoreResult, 0);
  if (!v3)
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphoreResult);
  return v3 != 0;
}

+ (id)detectPlanes:(unint64_t)a3 withFrame:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  CV3DSurfaceDetectionDefaultParameters();
  CV3DSurfaceDetectionCreateWithArgs();
  objc_msgSend(v6, "camera");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "referenceFeaturePoints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "referenceOriginTransform");
  objc_msgSend(a1, "_detectPlanesWithDetector:types:camera:referenceFeaturePoints:referenceOriginTransform:", 0, a3, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  CV3DSurfaceDetectionRelease();
  return v9;
}

+ (id)_detectPlanesWithDetector:(simd_float4)a3 types:(simd_float4)a4 camera:(uint64_t)a5 referenceFeaturePoints:(uint64_t)a6 referenceOriginTransform:(uint64_t)a7
{
  id v12;
  id v13;
  simd_float4 v14;
  simd_float4 v15;
  simd_float4 v16;
  simd_float4 v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  simd_float4 v22;
  simd_float4 v23;
  simd_float4 v24;
  simd_float4 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t i;
  float *v36;
  double *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  float *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  simd_float4 v56;
  simd_float4 v57;
  simd_float4 v58;
  simd_float4 v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  simd_float4 v64;
  simd_float4 v65;
  simd_float4 v66;
  simd_float4 v67;
  simd_float4x4 v68;
  __n128 v69;
  __n128 v70;
  __n128 v71;
  __n128 v72;
  _QWORD v73[2];
  uint64_t (*v74)();
  void *v75;
  void *v76;
  simd_float4x4 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  float64x2_t v83;
  uint64_t v84;
  void *__p;
  void *v86;
  uint64_t v87;
  simd_float4x4 v88;
  _OWORD v89[5];
  float64x2_t v90;
  uint64_t v91;
  simd_float4x4 v92;
  double v93;
  void **p_p;
  simd_float4x4 v95;
  simd_float4x4 v96;

  v68.columns[2] = a3;
  v68.columns[3] = a4;
  v68.columns[0] = a1;
  v68.columns[1] = a2;
  v12 = a9;
  v13 = a10;
  objc_msgSend(v12, "transform");
  v64 = v15;
  v65 = v14;
  v66 = v17;
  v67 = v16;
  *(double *)v18.i64 = ARRenderingToVisionCoordinateTransform();
  v62 = v19;
  v63 = v18;
  v60 = v21;
  v61 = v20;
  *(double *)v22.i64 = ARVisionCameraToRenderingCoordinateTransform();
  v56 = v23;
  v57 = v22;
  v58 = v25;
  v59 = v24;
  v95 = __invert_f4(v68);
  v26 = 0;
  v92.columns[0] = v65;
  v92.columns[1] = v64;
  v92.columns[2] = v67;
  v92.columns[3] = v66;
  do
  {
    v88.columns[v26] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v95.columns[0], COERCE_FLOAT(*(_OWORD *)&v92.columns[v26])), (float32x4_t)v95.columns[1], *(float32x2_t *)v92.columns[v26].f32, 1), (float32x4_t)v95.columns[2], (float32x4_t)v92.columns[v26], 2), (float32x4_t)v95.columns[3], (float32x4_t)v92.columns[v26], 3);
    ++v26;
  }
  while (v26 != 4);
  v27 = 0;
  v92 = v88;
  do
  {
    v88.columns[v27] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v63, COERCE_FLOAT(*(_OWORD *)&v92.columns[v27])), v62, *(float32x2_t *)v92.columns[v27].f32, 1), v61, (float32x4_t)v92.columns[v27], 2), v60, (float32x4_t)v92.columns[v27], 3);
    ++v27;
  }
  while (v27 != 4);
  v28 = 0;
  v29 = (float32x4_t)v88.columns[0];
  v30 = (float32x4_t)v88.columns[1];
  v31 = (float32x4_t)v88.columns[2];
  v32 = (float32x4_t)v88.columns[3];
  v92.columns[0] = v57;
  v92.columns[1] = v56;
  v92.columns[2] = v59;
  v92.columns[3] = v58;
  do
  {
    v88.columns[v28] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, COERCE_FLOAT(*(_OWORD *)&v92.columns[v28])), v30, *(float32x2_t *)v92.columns[v28].f32, 1), v31, (float32x4_t)v92.columns[v28], 2), v32, (float32x4_t)v92.columns[v28], 3);
    ++v28;
  }
  while (v28 != 4);
  v96 = __invert_f4(v88);
  v71 = (__n128)v96.columns[1];
  v72 = (__n128)v96.columns[0];
  v69 = (__n128)v96.columns[3];
  v70 = (__n128)v96.columns[2];
  std::vector<CV3DSurfaceDetectionPoint3D>::vector(&v92, objc_msgSend(v13, "count"));
  v33 = 0;
  v34 = 0;
  for (i = 0; i < objc_msgSend(v13, "count", *(_OWORD *)&v56, *(_OWORD *)&v57, *(_OWORD *)&v58, *(_OWORD *)&v59); ++i)
  {
    v36 = (float *)(objc_msgSend(v13, "points") + v34);
    v37 = (double *)(v92.columns[0].i64[0] + v33);
    *v37 = (float)-v36[2];
    v37[1] = (float)-*v36;
    v37[2] = v36[1];
    v34 += 16;
    v33 += 24;
  }
  v88.columns[0].i64[0] = v92.columns[0].i64[0];
  v38 = objc_msgSend(v13, "count");
  v88.columns[0].i64[1] = 0;
  v88.columns[1].i64[0] = v38;
  __p = 0;
  v86 = 0;
  v87 = 0;
  if (objc_msgSend(v13, "vergenceAngleCosines"))
  {
    v39 = objc_msgSend(v13, "count");
    std::vector<double>::reserve(&__p, v39);
    v40 = objc_msgSend(v13, "vergenceAngleCosines");
    p_p = &__p;
    if (v39)
    {
      v41 = (float *)v40;
      v42 = 4 * v39;
      do
      {
        v93 = *v41;
        std::back_insert_iterator<std::vector<double>>::operator=[abi:ne180100]((uint64_t *)&p_p, &v93);
        ++v41;
        v42 -= 4;
      }
      while (v42);
    }
    v88.columns[0].i64[1] = (uint64_t)__p;
  }
  objc_msgSend(v13, "count");
  kdebug_trace();
  objc_msgSend(v12, "principalPoint");
  v44 = v43;
  objc_msgSend(v12, "principalPoint");
  v46 = v45;
  objc_msgSend(v12, "focalLength");
  v48 = v47;
  objc_msgSend(v12, "focalLength");
  v50 = v49;
  objc_msgSend(v12, "imageResolution");
  v52 = v51;
  objc_msgSend(v12, "imageResolution");
  v88.columns[1].i64[1] = v48;
  v88.columns[2].i64[0] = v50;
  v88.columns[2].i64[1] = v44;
  v88.columns[3].i64[0] = v46;
  v88.columns[3].i32[2] = v52;
  v88.columns[3].i32[3] = v53;
  ARMatrix4x4ColumnMajorRotationAndTranslation((uint64_t)v89 + 8, &v90, v72, v71, v70, v69);
  LODWORD(v89[0]) = ARSurfaceOrientationForPlaneDetectionType(a8);
  v82 = v89[4];
  v83 = v90;
  v84 = v91;
  v80 = v89[2];
  v81 = v89[3];
  v77 = v88;
  v78 = v89[0];
  v79 = v89[1];
  v54 = (void *)CV3DSurfaceDetectionSingleShotSurfaces();
  kdebug_trace();
  v73[0] = MEMORY[0x1E0C809B0];
  v73[1] = 3221225472;
  v74 = __117__ARPlaneEstimationTechnique__detectPlanesWithDetector_types_camera_referenceFeaturePoints_referenceOriginTransform___block_invoke;
  v75 = &__block_descriptor_40_e5_v8__0l;
  v76 = v54;
  if (v54)
  {
    +[ARPlaneData anchorForDetectionResult:](ARPlaneData, "anchorForDetectionResult:", v54);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
  }
  ((void (*)(_QWORD *))v74)(v73);
  if (__p)
  {
    v86 = __p;
    operator delete(__p);
  }
  if (v92.columns[0].i64[0])
  {
    v92.columns[0].i64[1] = v92.columns[0].i64[0];
    operator delete((void *)v92.columns[0].i64[0]);
  }

  return v54;
}

uint64_t __117__ARPlaneEstimationTechnique__detectPlanesWithDetector_types_camera_referenceFeaturePoints_referenceOriginTransform___block_invoke()
{
  return CV3DSurfaceDetectionResultRelease();
}

- (ARWorldTrackingTechnique)worldTrackingTechnique
{
  return self->_worldTrackingTechnique;
}

- (void)setWorldTrackingTechnique:(id)a3
{
  objc_storeStrong((id *)&self->_worldTrackingTechnique, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_worldTrackingTechnique, 0);
  objc_storeStrong((id *)&self->_rawSceneUnderstandingData, 0);
  objc_storeStrong((id *)&self->_planeResultData, 0);
  objc_storeStrong((id *)&self->_semaphoreResult, 0);
}

@end
