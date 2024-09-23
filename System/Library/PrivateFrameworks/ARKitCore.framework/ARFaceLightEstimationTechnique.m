@implementation ARFaceLightEstimationTechnique

- (ARFaceLightEstimationTechnique)init
{
  ARFaceLightEstimationTechnique *v2;
  dispatch_semaphore_t v3;
  OS_dispatch_semaphore *resultSemaphore;
  float v5;
  uint64_t v6;
  OS_dispatch_queue *lightEstimationQueue;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *estimatingSemaphore;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ARFaceLightEstimationTechnique;
  v2 = -[ARTechnique init](&v11, sel_init);
  if (v2)
  {
    v3 = dispatch_semaphore_create(1);
    resultSemaphore = v2->_resultSemaphore;
    v2->_resultSemaphore = (OS_dispatch_semaphore *)v3;

    v2->_lightIntensity = 1.0;
    v2->_temperature = 6500.0;
    +[ARFaceLightEstimationTechnique _computeShSmoothingAlpha:](ARFaceLightEstimationTechnique, "_computeShSmoothingAlpha:", 0.0166666675);
    v2->_shSmoothingAlpha = v5;
    ARCreateFixedPriorityDispatchQueue("com.apple.arkit.technique.faceLightEstimation");
    v6 = objc_claimAutoreleasedReturnValue();
    lightEstimationQueue = v2->_lightEstimationQueue;
    v2->_lightEstimationQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_semaphore_create(1);
    estimatingSemaphore = v2->_estimatingSemaphore;
    v2->_estimatingSemaphore = (OS_dispatch_semaphore *)v8;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ARFaceLightEstimationTechnique;
  -[ARFaceLightEstimationTechnique dealloc](&v2, sel_dealloc);
}

- (unint64_t)requiredSensorDataTypes
{
  return 1;
}

+ (float)_computeShSmoothingAlpha:(double)a3
{
  return 1.0 - exp(a3 / -0.191625923);
}

- (id)processData:(id)a3
{
  id v4;
  id v5;
  arkit *v6;
  float v7;
  float v8;
  float v9;
  float v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    v6 = (arkit *)objc_msgSend(v5, "temperature");
    self->_temperature = arkit::mapColorTemperature(v6, v7);
    objc_msgSend(v5, "exposureTargetOffset");
    v11 = ARMapExposureOffset(v8);
    self->_lightIntensity = arkit::ExponentialSmoother<float>::step((uint64_t)&self->_smoother, &v11, 1.0 / (float)objc_msgSend(v5, "captureFramesPerSecond"), 0.016667, 0.2);
    +[ARFaceLightEstimationTechnique _computeShSmoothingAlpha:](ARFaceLightEstimationTechnique, "_computeShSmoothingAlpha:", (float)(1.0 / (float)objc_msgSend(v5, "captureFramesPerSecond")));
    self->_shSmoothingAlpha = v9;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);

  }
  return v4;
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  id v6;
  void *v7;
  __CVBuffer *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  uint64_t i;
  void *v17;
  float32x4_t v18;
  float32x4_t v19;
  float v20;
  id v21;
  ARDirectionalLightEstimate *lastLightEstimate;
  int v23;
  int v24;
  CVPixelBufferRef v25;
  float lightIntensity;
  id v27;
  OS_dispatch_semaphore *v28;
  NSObject *lightEstimationQueue;
  OS_dispatch_semaphore *v30;
  id v31;
  void *v32;
  ARDirectionalLightEstimate *v33;
  ARLightEstimate *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD block[4];
  id v41;
  OS_dispatch_semaphore *v42;
  id v43[3];
  float v44;
  id location;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "imageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (__CVBuffer *)objc_msgSend(v7, "pixelBuffer");

  objc_msgSend(v6, "resultDataOfClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v39 = v10;
  objc_msgSend(v10, "trackedFaces");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v47;
    v15 = INFINITY;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v47 != v14)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v17, "transform");
        v19 = vmulq_f32(v18, v18);
        v20 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v19, 2), vaddq_f32(v19, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v19.f32, 1))).f32[0]);
        if (v20 < v15 && objc_msgSend(v17, "isValid"))
        {
          v21 = v17;

          v15 = v20;
          v12 = v21;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v13);
  }

  if ((objc_msgSend(v12, "isValid") & 1) == 0)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    lastLightEstimate = self->_lastLightEstimate;
    if (lastLightEstimate)
      -[ARDirectionalLightEstimate setConfidenceRating:](lastLightEstimate, "setConfidenceRating:", 0.0);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);
  }
  v23 = objc_msgSend(v12, "isValid");
  if (v8)
    v24 = v23;
  else
    v24 = 0;
  if (v24 == 1 && !dispatch_semaphore_wait((dispatch_semaphore_t)self->_estimatingSemaphore, 0))
  {
    kdebug_trace();
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    v25 = CVPixelBufferRetain(v8);
    lightIntensity = self->_lightIntensity;
    v27 = v12;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);
    objc_initWeak(&location, self);
    v28 = self->_estimatingSemaphore;
    lightEstimationQueue = self->_lightEstimationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__ARFaceLightEstimationTechnique_requestResultDataAtTimestamp_context___block_invoke;
    block[3] = &unk_1E6674DE8;
    objc_copyWeak(v43, &location);
    v43[1] = v25;
    v44 = lightIntensity;
    v43[2] = *(id *)&a3;
    v41 = v27;
    v42 = v28;
    v30 = v28;
    v31 = v27;
    dispatch_async(lightEstimationQueue, block);

    objc_destroyWeak(v43);
    objc_destroyWeak(&location);
  }
  v32 = (void *)objc_opt_new();
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v33 = self->_lastLightEstimate;
  if (v33)
    v34 = (ARLightEstimate *)-[ARDirectionalLightEstimate copy](v33, "copy");
  else
    v34 = -[ARLightEstimate initWithAmbientIntensity:temperature:]([ARLightEstimate alloc], "initWithAmbientIntensity:temperature:", self->_lightIntensity * 1000.0, self->_temperature);
  objc_msgSend(v32, "setLightEstimate:", v34);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);
  -[ARTechnique delegate](self, "delegate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_opt_respondsToSelector();

  if ((v36 & 1) != 0)
  {
    -[ARTechnique delegate](self, "delegate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "technique:didOutputResultData:timestamp:context:", self, v38, v6, a3);

  }
}

intptr_t __71__ARFaceLightEstimationTechnique_requestResultDataAtTimestamp_context___block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  LODWORD(v3) = *(_DWORD *)(a1 + 72);
  objc_msgSend(WeakRetained, "_processFaceDataInBackground:pixelBuffer:lightIntensity:timestamp:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), v3, *(double *)(a1 + 64));

  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 56));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_processFaceDataInBackground:(id)a3 pixelBuffer:(__CVBuffer *)a4 lightIntensity:(float)a5 timestamp:(double)a6
{
  id v10;
  void *v11;
  float shSmoothingAlpha;
  float v13;
  uint64_t i;
  float32x4_t v15;
  uint64_t v16;
  float v17;
  float v18;
  ARDirectionalLightEstimate *v19;
  ARDirectionalLightEstimate *v20;
  ARDirectionalLightEstimate *lastLightEstimate;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  _OWORD v25[2];
  int v26;
  __int128 v27;
  __int128 v28;
  int v29;
  float v30[9];
  float v31;
  _DWORD v32[2];
  BOOL v33;
  char v34;
  uint64_t v35;
  char v36;
  _QWORD v37[12];
  uint64_t v38;
  std::__shared_weak_count *v39;

  v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lightEstimationQueue);
  v11 = (void *)objc_opt_class();
  if (v11)
  {
    objc_msgSend(v11, "_transformFaceTrackingData:", v10);
  }
  else
  {
    v38 = 0;
    v39 = 0;
  }
  CVPixelBufferLockBaseAddress(a4, 1uLL);
  arkit::wrap(a4, v37);
  v35 = 0x3F19999A00000032;
  v36 = 1;
  v33 = -[ARTechnique powerUsage](self, "powerUsage") == 0;
  v34 = 1;
  shSmoothingAlpha = self->_shSmoothingAlpha;
  v32[1] = -1130113270;
  *(float *)v32 = shSmoothingAlpha;
  arkit::FacialLightEstimation::estimateLight((uint64_t)&self->_faceLightEstimator, (uint64_t)v32, v38, (uint64_t)v37, (uint64_t)v30);
  CVPixelBufferUnlockBaseAddress(a4, 1uLL);
  v13 = v30[0] * v30[0];
  for (i = 1; i != 9; i += 4)
  {
    v15 = vmulq_f32(*(float32x4_t *)&v30[i], *(float32x4_t *)&v30[i]);
    v13 = (float)((float)((float)(v13 + v15.f32[0]) + v15.f32[1]) + v15.f32[2]) + v15.f32[3];
  }
  v16 = 0;
  v17 = (float)(a5 * 4.0) * (float)(1.0 / sqrtf(v13));
  v29 = 0;
  v27 = 0u;
  v28 = 0u;
  do
  {
    *(float *)((char *)&v27 + v16 * 4) = v17 * v30[v16];
    ++v16;
  }
  while (v16 != 9);
  kdebug_trace();
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v18 = v31;
  if (v31 > 0.0)
  {
    v19 = [ARDirectionalLightEstimate alloc];
    v25[0] = v27;
    v25[1] = v28;
    v26 = v29;
    v20 = -[ARDirectionalLightEstimate initWithSphericalHarmonics:ambientIntensity:temperature:](v19, "initWithSphericalHarmonics:ambientIntensity:temperature:", v25, (float)(a5 * 1000.0), self->_temperature);
    lastLightEstimate = self->_lastLightEstimate;
    self->_lastLightEstimate = v20;

    -[ARDirectionalLightEstimate setTimestamp:](self->_lastLightEstimate, "setTimestamp:", a6);
  }
  -[ARDirectionalLightEstimate setConfidenceRating:](self->_lastLightEstimate, "setConfidenceRating:", v18);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);
  v22 = v39;
  if (v39)
  {
    p_shared_owners = (unint64_t *)&v39->__shared_owners_;
    do
      v24 = __ldaxr(p_shared_owners);
    while (__stlxr(v24 - 1, p_shared_owners));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }

}

+ (shared_ptr<arkit::FaceTrackingData>)_transformFaceTrackingData:(id)a3
{
  _QWORD *v3;
  _QWORD *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  float32x4_t v10;
  float32x4_t v11;
  int32x4_t v12;
  float32x2_t v13;
  float32x2_t v14;
  float32x4_t v15;
  uint64_t v16;
  float32x4_t v17;
  int32x4_t v18;
  float32x2_t v19;
  float32x2_t v20;
  float32x4_t v21;
  BOOL v22;
  char *v23;
  char *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  _BYTE *v31;
  _BYTE *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  FaceTrackingData *v36;
  __shared_weak_count *v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  _QWORD *v41;
  id v42;
  float32x4_t v43;
  float32x4_t v44;
  __int128 v45[2];
  void *__p;
  char *v47;
  char *v48;
  shared_ptr<arkit::FaceTrackingData> result;
  simd_float3x3 v50;
  simd_float4x4 v51;
  simd_float4x4 v52;

  v4 = v3;
  v42 = a3;
  v5 = objc_msgSend(v42, "vertexCount");
  v6 = objc_msgSend(v42, "imageVertices");
  v7 = objc_msgSend(v42, "vertices");
  v8 = objc_msgSend(v42, "normals");
  v41 = v4;
  objc_msgSend(v42, "transform");
  v52 = __invert_f4(v51);
  v38 = (float32x4_t)v52.columns[0];
  v39 = (float32x4_t)v52.columns[1];
  v43 = (float32x4_t)v52.columns[2];
  v40 = (float32x4_t)v52.columns[3];
  __p = 0;
  v47 = 0;
  v48 = 0;
  std::vector<arkit::Landmark>::reserve((char **)&__p, v5);
  if (v5)
  {
    v9 = 0;
    v10 = vaddq_f32(v40, vmlaq_f32(vmlaq_f32(vmulq_f32(v38, (float32x4_t)0), (float32x4_t)0, v39), (float32x4_t)0, v43));
    v44 = v10;
    do
    {
      v11 = *(float32x4_t *)(v8 + 16 * v9);
      v12 = (int32x4_t)vmulq_f32(v11, v11);
      v12.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v12, 2), vadd_f32(*(float32x2_t *)v12.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v12.i8, 1))).u32[0];
      v13 = vrsqrte_f32((float32x2_t)v12.u32[0]);
      v14 = vmul_f32(v13, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v13, v13)));
      v15 = vmulq_n_f32(v11, vmul_f32(v14, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v14, v14))).f32[0]);
      if ((_DWORD)v9 == 859 || (_DWORD)v9 == 431)
        v15 = vnegq_f32(v15);
      v16 = *(_QWORD *)(v6 + 8 * v9);
      v17 = vsubq_f32(v10, *(float32x4_t *)(v7 + 16 * v9));
      v18 = (int32x4_t)vmulq_f32(v17, v17);
      v18.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v18, 2), vadd_f32(*(float32x2_t *)v18.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v18.i8, 1))).u32[0];
      v19 = vrsqrte_f32((float32x2_t)v18.u32[0]);
      v20 = vmul_f32(v19, vrsqrts_f32((float32x2_t)v18.u32[0], vmul_f32(v19, v19)));
      v21 = vmulq_f32(vmulq_n_f32(v17, vmul_f32(v20, vrsqrts_f32((float32x2_t)v18.u32[0], vmul_f32(v20, v20))).f32[0]), v15);
      v22 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v21, 2), vaddq_f32(v21, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v21.f32, 1))).f32[0] > 0.34202;
      v23 = v47;
      if (v47 >= v48)
      {
        v25 = 0xAAAAAAAAAAAAAAABLL * ((v47 - (_BYTE *)__p) >> 2);
        v26 = v25 + 1;
        if (v25 + 1 > 0x1555555555555555)
          std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
        if (0x5555555555555556 * ((v48 - (_BYTE *)__p) >> 2) > v26)
          v26 = 0x5555555555555556 * ((v48 - (_BYTE *)__p) >> 2);
        if (0xAAAAAAAAAAAAAAABLL * ((v48 - (_BYTE *)__p) >> 2) >= 0xAAAAAAAAAAAAAAALL)
          v27 = 0x1555555555555555;
        else
          v27 = v26;
        v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cva::Matrix<float,3u,1u,false>>>((uint64_t)&v48, v27);
        v30 = &v28[12 * v25];
        *(_QWORD *)v30 = v16;
        v30[8] = v22;
        v32 = __p;
        v31 = v47;
        v33 = v30;
        if (v47 != __p)
        {
          do
          {
            v34 = *(_QWORD *)(v31 - 12);
            v31 -= 12;
            *(_QWORD *)(v33 - 12) = v34;
            v33 -= 12;
            v33[8] = v31[8];
          }
          while (v31 != v32);
          v31 = __p;
        }
        v24 = v30 + 12;
        __p = v33;
        v47 = v30 + 12;
        v48 = &v28[12 * v29];
        if (v31)
          operator delete(v31);
        v10 = v44;
      }
      else
      {
        *(_QWORD *)v47 = v16;
        v23[8] = v22;
        v24 = v23 + 12;
      }
      v47 = v24;
      ++v9;
    }
    while (v9 != v5);
  }
  *(double *)v50.columns[0].i64 = ARMatrix3x3FromMatrix4x4(objc_msgSend(v42, "transform", *(_OWORD *)&v38, *(_OWORD *)&v39, *(_OWORD *)&v40));
  ARCVAMatrixFromMatrix(v50, (uint64_t)v45);
  v35 = operator new();
  arkit::FaceTrackingData::FaceTrackingData(v35, v45, (uint64_t *)&__p);
  std::shared_ptr<arkit::FaceTrackingData>::shared_ptr[abi:ne180100]<arkit::FaceTrackingData,void>(v41, v35);
  if (__p)
  {
    v47 = (char *)__p;
    operator delete(__p);
  }

  result.var1 = v37;
  result.var0 = v36;
  return result;
}

- (void).cxx_destruct
{
  FacialLightEstimation *p_faceLightEstimator;
  unint64_t *begin;
  int *v5;
  int *v6;

  p_faceLightEstimator = &self->_faceLightEstimator;
  begin = self->_faceLightEstimator.m_inliers.__begin_;
  if (begin)
  {
    p_faceLightEstimator->m_inliers.__end_ = begin;
    operator delete(begin);
  }
  std::shared_ptr<arkit::KeyMapBuffer<void const*,std::vector<unsigned char>>>::~shared_ptr[abi:ne180100]((uint64_t)&p_faceLightEstimator->m_precomputedFaceData);
  free(p_faceLightEstimator->m_validRtfs.m_data);
  v5 = p_faceLightEstimator->m_sampleIndices_all.__begin_;
  if (v5)
  {
    p_faceLightEstimator->m_sampleIndices_all.__end_ = v5;
    operator delete(v5);
  }
  v6 = p_faceLightEstimator->m_validChromaSampleIDS.__begin_;
  if (v6)
  {
    p_faceLightEstimator->m_validChromaSampleIDS.__end_ = v6;
    operator delete(v6);
  }
  free(p_faceLightEstimator->m_validSampleIntensities.m_data);
  objc_storeStrong((id *)&self->_estimatingSemaphore, 0);
  objc_storeStrong((id *)&self->_lightEstimationQueue, 0);
  objc_storeStrong((id *)&self->_lastLightEstimate, 0);
  objc_storeStrong((id *)&self->_resultSemaphore, 0);
}

- (id).cxx_construct
{
  self->_smoother.state.var0.__null_state_ = 0;
  self->_smoother.state.__engaged_ = 0;
  arkit::FacialLightEstimation::FacialLightEstimation((arkit::FacialLightEstimation *)&self->_faceLightEstimator);
  return self;
}

@end
