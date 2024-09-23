@implementation AR2DSkeletonDetectionPostProcessingTechnique

- (ABPK2DDetectionResult)abpkPrevious3DSkeleton
{
  ABPK2DDetectionResult *v3;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_previous3DSkeletonSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v3 = self->_abpkPrevious3DSkeleton;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_previous3DSkeletonSemaphore);
  return v3;
}

- (void)prepare:(BOOL)a3
{
  OS_dispatch_queue *v4;
  OS_dispatch_queue *processingQueue;
  OS_dispatch_semaphore *v6;
  OS_dispatch_semaphore *previous3DSkeletonSemaphore;
  void *v8;
  float v9;
  ABPK2DDetectionPostprocess *v10;
  ABPK2DDetectionPostprocess *postprocess2d;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  AR2DSkeletonDetectionPostProcessingTechnique *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  self->_deterministic = a3;
  if (!self->_postprocess2d)
  {
    ARCreateFixedPriorityDispatchQueue("com.apple.arkit.humanposepostprocessing");
    v4 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    processingQueue = self->_processingQueue;
    self->_processingQueue = v4;

    v6 = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
    previous3DSkeletonSemaphore = self->_previous3DSkeletonSemaphore;
    self->_previous3DSkeletonSemaphore = v6;

    self->_use3DSupportSkeletonForExtrapolation = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.bodyTracking.useSupport3DSkeleton"));
    self->_shouldPush3DSupportSkeleton = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.bodytracking.pushProjected3DSkeleton"));
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF7828]), "initWithAlgorithmMode:", 1);
    +[ARKitUserDefaults floatForKey:](ARKitUserDefaults, "floatForKey:", CFSTR("com.apple.arkit.bodytracking.extrapolationTimeLimitSeconds"));
    objc_msgSend(MEMORY[0x1E0CF7830], "get2DDetectionPostProcessWithNetworkConfig:use3DSkeletonForExtrapolation:shouldPush3DSupportSkeleton:withExtrapolationTime:", v8, self->_use3DSupportSkeletonForExtrapolation, self->_shouldPush3DSupportSkeleton, v9);
    v10 = (ABPK2DDetectionPostprocess *)objc_claimAutoreleasedReturnValue();
    postprocess2d = self->_postprocess2d;
    self->_postprocess2d = v10;

    if (!self->_postprocess2d)
    {
      _ARLogGeneral();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543618;
        v18 = v14;
        v19 = 2048;
        v20 = self;
        _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Initialization of 2d post-processing algorithm failed", (uint8_t *)&v17, 0x16u);

      }
      -[ARTechnique delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      ARErrorWithCodeAndUserInfo(151, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "technique:didFailWithError:", self, v16);

    }
  }
}

- (double)requiredTimeInterval
{
  int v2;
  double result;

  v2 = ARIsANEVersionEqualOrPriorToH12();
  result = 0.001;
  if (v2)
    return 0.007;
  return result;
}

- (id)processData:(id)a3
{
  id v4;
  id v5;
  NSObject *processingQueue;
  _QWORD block[4];
  id v9;
  id v10;
  id location;
  objc_super v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)AR2DSkeletonDetectionPostProcessingTechnique;
    v5 = -[ARImageBasedTechnique processData:](&v12, sel_processData_, v4);
    objc_initWeak(&location, self);
    processingQueue = self->_processingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__AR2DSkeletonDetectionPostProcessingTechnique_processData___block_invoke;
    block[3] = &unk_1E6675660;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    dispatch_async(processingQueue, block);
    if (self->_deterministic)
      dispatch_sync((dispatch_queue_t)self->_processingQueue, &__block_literal_global_93);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __60__AR2DSkeletonDetectionPostProcessingTechnique_processData___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_process2DSkeletonRawEspressoResultInBackground:", *(_QWORD *)(a1 + 32));

}

- (void)_process2DSkeletonRawEspressoResultInBackground:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  size_t Width;
  void *v14;
  size_t Height;
  void *v16;
  size_t v17;
  void *v18;
  size_t v19;
  void *v20;
  ABPK2DDetectionPostprocess *postprocess2d;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  AR2DSkeletonDetectionPostProcessingTechnique *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ARLogGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v7;
    v31 = 2048;
    v32 = self;
    _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Process 2D Skeleton Raw Espresso Result In Background", buf, 0x16u);

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  v8 = objc_msgSend(v4, "rotationNeeded");
  objc_msgSend(v4, "inputImageData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timestamp");
  v11 = v10;
  objc_msgSend(v9, "timestamp");
  kdebug_trace();
  objc_msgSend(v4, "inputImageData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  Width = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v12, "pixelBuffer"));
  objc_msgSend(v4, "inputImageData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  Height = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v14, "pixelBuffer"));

  objc_msgSend(v4, "imageDataForNeuralNetwork");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v16, "pixelBuffer"));
  objc_msgSend(v4, "imageDataForNeuralNetwork");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v18, "pixelBuffer"));

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF7878]), "initWithType:inputResolution:outputResolution:", 1, (double)Width, (double)Height, (double)v17, (double)v19);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_previous3DSkeletonSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  postprocess2d = self->_postprocess2d;
  objc_msgSend(v9, "timestamp");
  LODWORD(postprocess2d) = -[ABPK2DDetectionPostprocess extract2DSkeletonfromBuffers:withImagePreProcessingParams:atTimestamp:previousSkeleton3D:](postprocess2d, "extract2DSkeletonfromBuffers:withImagePreProcessingParams:atTimestamp:previousSkeleton3D:", v4, v20, self->_abpkPrevious3DSkeleton);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_previous3DSkeletonSemaphore);
  if ((_DWORD)postprocess2d == -6661)
  {
    v22 = (void *)objc_opt_new();
    objc_msgSend(v22, "setTimestamp:", v11);
    v28 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageBasedTechnique pushResultData:forTimestamp:](self, "pushResultData:forTimestamp:", v23, v11);
  }
  else
  {
    -[ABPK2DDetectionPostprocess getRaw2DDetectionResultforRotation:croppedRect:](self->_postprocess2d, "getRaw2DDetectionResultforRotation:croppedRect:", v8, 0.0, 0.0, 1.0, 1.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABPK2DDetectionPostprocess get2DDetectionResultforRotation:croppedRect:](self->_postprocess2d, "get2DDetectionResultforRotation:croppedRect:", v8, 0.0, 0.0, 1.0, 1.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_opt_new();
    objc_msgSend(v24, "setTimestamp:", v11);
    objc_msgSend(v24, "setTrackedDetectionResult:", v23);
    objc_msgSend(v24, "setRawDetectionResult:", v22);
    if (self->_shouldPush3DSupportSkeleton)
    {
      -[ABPK2DDetectionPostprocess getAligned3DSkeleton](self->_postprocess2d, "getAligned3DSkeleton");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setAlignedDetectionResult:", v25);

    }
    v27 = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARImageBasedTechnique pushResultData:forTimestamp:](self, "pushResultData:forTimestamp:", v26, v11);

    objc_msgSend(v9, "timestamp");
    kdebug_trace();

  }
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  float32x4_t v11;
  __int128 v12;
  float32x4_t v13;
  unint64_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  uint64_t v23;
  float v24;
  __float2 v25;
  void *v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  float32x2_t v30;
  uint64_t v31;
  uint64_t i;
  __CFString *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  float32x2_t *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  float v47;
  float32x4_t v48;
  float32x4_t v49;
  double v50;
  float32x2_t v51;
  float32x2_t *v52;
  float32x2_t *v53;
  int64_t v54;
  unint64_t v55;
  unint64_t v56;
  char *v57;
  int64_t v58;
  unint64_t v59;
  unint64_t v60;
  char *v61;
  float32x2_t *v62;
  char *v63;
  char *v64;
  float32x2_t v65;
  int64_t v66;
  unint64_t v67;
  unint64_t v68;
  char *v69;
  char *v70;
  char *v71;
  char *v72;
  uint64_t v73;
  char *v74;
  char *v75;
  char *v76;
  uint64_t v77;
  ABPK2DDetectionResult *abpkPrevious3DSkeleton;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  ABPK2DDetectionResult *v86;
  ABPK2DDetectionResult *v87;
  ABPK2DDetectionResult *v88;
  void *v89;
  id v91;
  void *v92;
  int v93;
  int v94;
  float32x2_t v95;
  float32x4_t v96;
  float32x4_t v97;
  float32x4_t v98;
  float32x4_t v99;
  float32x4_t v100;
  void *v101;
  id obja[2];
  void *obj;
  float32x4_t v104;
  float32x4_t v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  objc_super v110;
  _OWORD v111[4];
  void *__p[2];
  _OWORD v113[3];
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v91 = a4;
  v110.receiver = self;
  v110.super_class = (Class)AR2DSkeletonDetectionPostProcessingTechnique;
  -[ARImageBasedTechnique requestResultDataAtTimestamp:context:](&v110, sel_requestResultDataAtTimestamp_context_, a3);
  objc_msgSend(v91, "resultDataOfClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v92, "resultDataOfClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v101
    || (objc_msgSend(v101, "retargetedSkeletons"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count") == 0,
        v7,
        v8))
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_previous3DSkeletonSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    abpkPrevious3DSkeleton = self->_abpkPrevious3DSkeleton;
    self->_abpkPrevious3DSkeleton = 0;

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_previous3DSkeletonSemaphore);
    goto LABEL_83;
  }
  objc_msgSend(v101, "retargetedSkeletons");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v101, "cameraIntrinsics");
  v104 = v11;
  objc_msgSend(v101, "cameraIntrinsics");
  *(_OWORD *)obja = v12;
  objc_msgSend(v101, "cameraIntrinsics");
  v99 = v13;
  objc_msgSend(v10, "visionTransform");
  v14 = 0;
  v16 = *(float32x4_t *)obja;
  v15 = v104;
  v15.i32[3] = 0;
  v16.i32[3] = 0;
  v17 = v99;
  v17.i32[3] = 0;
  v111[0] = v18;
  v111[1] = v19;
  v111[2] = v20;
  v111[3] = v21;
  do
  {
    *(float32x4_t *)&__p[v14 / 8] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v15, COERCE_FLOAT(v111[v14 / 0x10])), v16, *(float32x2_t *)&v111[v14 / 0x10], 1), v17, (float32x4_t)v111[v14 / 0x10], 2), (float32x4_t)xmmword_1B3BDFD50, (float32x4_t)v111[v14 / 0x10], 3);
    v14 += 16;
  }
  while (v14 != 64);
  v98 = (float32x4_t)v113[0];
  v100 = *(float32x4_t *)__p;
  v96 = (float32x4_t)v113[2];
  v97 = (float32x4_t)v113[1];
  objc_msgSend(v10, "liftedSkeletonData");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "skeletonDetectionResult2D");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "rotation");

  v24 = (float)-(float)v23 * 3.14159265 / 180.0;
  v25 = __sincosf_stret(v24);
  +[ARSkeletonDefinition defaultBody2DSkeletonDefinition](ARSkeletonDefinition, "defaultBody2DSkeletonDefinition");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "jointCount");

  __p[0] = 0;
  __p[1] = 0;
  *(_QWORD *)&v113[0] = 0;
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE7reserveEm(__p, v27);
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  +[ARSkeletonDefinition defaultBody2DSkeletonDefinition](ARSkeletonDefinition, "defaultBody2DSkeletonDefinition");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "jointNames");
  obj = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
  if (!v29)
  {
    v93 = 1;
    v94 = 1;
    goto LABEL_72;
  }
  v30.f32[0] = -v25.__sinval;
  v30.i32[1] = LODWORD(v25.__cosval);
  v95 = v30;
  v31 = *(_QWORD *)v107;
  v93 = 1;
  v94 = 1;
  __asm { FMOV            V10.2S, #-1.0 }
  do
  {
    for (i = 0; i != v29; ++i)
    {
      if (*(_QWORD *)v107 != v31)
        objc_enumerationMutation(obj);
      v38 = (__CFString *)*(id *)(*((_QWORD *)&v106 + 1) + 8 * i);
      if (-[__CFString isEqualToString:](v38, "isEqualToString:", CFSTR("root")))
      {

        v38 = CFSTR("hips_joint");
      }
      +[ARSkeletonDefinition defaultBody3DSkeletonDefinition](ARSkeletonDefinition, "defaultBody3DSkeletonDefinition");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "jointNames");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "indexOfObject:", v38);

      if (v41 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v105 = *(float32x4_t *)(objc_msgSend(v10, "jointModelTransforms") + (v41 << 6) + 48);
        objc_msgSend(v10, "estimatedScaleFactor");
        v44 = v43;
        objc_msgSend(v101, "imageResolution");
        v46 = v45;
        objc_msgSend(v101, "imageResolution");
        v47 = v44;
        v48 = vmulq_n_f32(v105, v47);
        v49 = vaddq_f32(v96, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v100, v48.f32[0]), v98, *(float32x2_t *)v48.f32, 1), v97, v48, 2));
        v49.i64[0] = vdivq_f32(v49, (float32x4_t)vdupq_laneq_s32((int32x4_t)v49, 2)).u64[0];
        v49.f32[0] = v49.f32[0] / v46 + -0.5;
        *(float *)&v50 = v49.f32[1] / v50 + -0.5;
        v51 = vadd_f32(vmla_n_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v25.__sinval), LODWORD(v25.__cosval)), v49.f32[0]), v95, *(float *)&v50), (float32x2_t)0x3F0000003F000000);
        v52 = (float32x2_t *)__p[1];
        if (__p[1] >= (void *)*(_QWORD *)&v113[0])
        {
          v54 = ((char *)__p[1] - (char *)__p[0]) >> 3;
          if ((unint64_t)(v54 + 1) >> 61)
            std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
          v55 = (uint64_t)(*(_QWORD *)&v113[0] - (unint64_t)__p[0]) >> 2;
          if (v55 <= v54 + 1)
            v55 = v54 + 1;
          if (*(_QWORD *)&v113[0] - (unint64_t)__p[0] >= 0x7FFFFFFFFFFFFFF8)
            v56 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v56 = v55;
          if (v56)
            v57 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cva::Matrix<unsigned int,2u,1u,false>>>((uint64_t)v113, v56);
          else
            v57 = 0;
          v62 = (float32x2_t *)&v57[8 * v54];
          *v62 = v51;
          v53 = v62 + 1;
          v64 = (char *)__p[0];
          v63 = (char *)__p[1];
          if (__p[1] != __p[0])
          {
            do
            {
              v65 = *(float32x2_t *)(v63 - 8);
              v63 -= 8;
              v62[-1] = v65;
              --v62;
            }
            while (v63 != v64);
            v63 = (char *)__p[0];
          }
          __p[0] = v62;
          __p[1] = v53;
          *(_QWORD *)&v113[0] = &v57[8 * v56];
          if (v63)
            operator delete(v63);
        }
        else
        {
          *(float32x2_t *)__p[1] = v51;
          v53 = v52 + 1;
        }
        goto LABEL_66;
      }
      if (-[__CFString isEqualToString:](v38, "isEqualToString:", CFSTR("right_ear_joint")))
      {
        v42 = (float32x2_t *)__p[1];
        if (__p[1] >= (void *)*(_QWORD *)&v113[0])
        {
          v58 = ((char *)__p[1] - (char *)__p[0]) >> 3;
          if ((unint64_t)(v58 + 1) >> 61)
            std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
          v59 = (uint64_t)(*(_QWORD *)&v113[0] - (unint64_t)__p[0]) >> 2;
          if (v59 <= v58 + 1)
            v59 = v58 + 1;
          if (*(_QWORD *)&v113[0] - (unint64_t)__p[0] >= 0x7FFFFFFFFFFFFFF8)
            v60 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v60 = v59;
          if (v60)
            v61 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cva::Matrix<unsigned int,2u,1u,false>>>((uint64_t)v113, v60);
          else
            v61 = 0;
          v70 = &v61[8 * v58];
          *(float32x2_t *)v70 = _D10;
          v53 = (float32x2_t *)(v70 + 8);
          v72 = (char *)__p[0];
          v71 = (char *)__p[1];
          if (__p[1] != __p[0])
          {
            do
            {
              v73 = *((_QWORD *)v71 - 1);
              v71 -= 8;
              *((_QWORD *)v70 - 1) = v73;
              v70 -= 8;
            }
            while (v71 != v72);
            v71 = (char *)__p[0];
          }
          __p[0] = v70;
          __p[1] = v53;
          *(_QWORD *)&v113[0] = &v61[8 * v60];
          if (v71)
            operator delete(v71);
          v94 = 0;
          goto LABEL_66;
        }
        v94 = 0;
      }
      else
      {
        if (!-[__CFString isEqualToString:](v38, "isEqualToString:", CFSTR("left_ear_joint")))
          goto LABEL_67;
        v42 = (float32x2_t *)__p[1];
        if (__p[1] >= (void *)*(_QWORD *)&v113[0])
        {
          v66 = ((char *)__p[1] - (char *)__p[0]) >> 3;
          if ((unint64_t)(v66 + 1) >> 61)
            std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
          v67 = (uint64_t)(*(_QWORD *)&v113[0] - (unint64_t)__p[0]) >> 2;
          if (v67 <= v66 + 1)
            v67 = v66 + 1;
          if (*(_QWORD *)&v113[0] - (unint64_t)__p[0] >= 0x7FFFFFFFFFFFFFF8)
            v68 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v68 = v67;
          if (v68)
            v69 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cva::Matrix<unsigned int,2u,1u,false>>>((uint64_t)v113, v68);
          else
            v69 = 0;
          v74 = &v69[8 * v66];
          *(float32x2_t *)v74 = _D10;
          v53 = (float32x2_t *)(v74 + 8);
          v76 = (char *)__p[0];
          v75 = (char *)__p[1];
          if (__p[1] != __p[0])
          {
            do
            {
              v77 = *((_QWORD *)v75 - 1);
              v75 -= 8;
              *((_QWORD *)v74 - 1) = v77;
              v74 -= 8;
            }
            while (v75 != v76);
            v75 = (char *)__p[0];
          }
          __p[0] = v74;
          __p[1] = v53;
          *(_QWORD *)&v113[0] = &v69[8 * v68];
          if (v75)
            operator delete(v75);
          v93 = 0;
          goto LABEL_66;
        }
        v93 = 0;
      }
      *v42 = _D10;
      v53 = v42 + 1;
LABEL_66:
      __p[1] = v53;
LABEL_67:

    }
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
  }
  while (v29);
LABEL_72:

  std::vector<unsigned int>::vector((std::vector<unsigned int> *)v111, ((char *)__p[1] - (char *)__p[0]) >> 3);
  if ((uint64_t)(*((_QWORD *)&v111[0] + 1) - *(_QWORD *)&v111[0]) >= 1)
    memset_pattern16(*(void **)&v111[0], &unk_1B3C0B410, 4* (((*((_QWORD *)&v111[0] + 1) - *(_QWORD *)&v111[0]) >> 2)- (*((_QWORD *)&v111[0] + 1) - *(_QWORD *)&v111[0] > 3uLL))+ 4);
  +[ARSkeletonDefinition defaultBody2DSkeletonDefinition](ARSkeletonDefinition, "defaultBody2DSkeletonDefinition");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "jointNames");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v80, "indexOfObject:", CFSTR("right_ear_joint"));

  +[ARSkeletonDefinition defaultBody2DSkeletonDefinition](ARSkeletonDefinition, "defaultBody2DSkeletonDefinition");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "jointNames");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = objc_msgSend(v83, "indexOfObject:", CFSTR("left_ear_joint"));

  v85 = *(_QWORD *)&v111[0];
  if (v81 != 0x7FFFFFFFFFFFFFFFLL)
    *(_DWORD *)(*(_QWORD *)&v111[0] + 4 * v81) = v94;
  if (v84 != 0x7FFFFFFFFFFFFFFFLL)
    *(_DWORD *)(v85 + 4 * v84) = v93;
  *(_DWORD *)(v85 + 4 * v84) = v93;
  v86 = (ABPK2DDetectionResult *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF7838]), "initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:", 0.0, 0.0, 1.0, 1.0);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_previous3DSkeletonSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v87 = self->_abpkPrevious3DSkeleton;
  self->_abpkPrevious3DSkeleton = v86;
  v88 = v86;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_previous3DSkeletonSemaphore);
  if (*(_QWORD *)&v111[0])
  {
    *((_QWORD *)&v111[0] + 1) = *(_QWORD *)&v111[0];
    operator delete(*(void **)&v111[0]);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

LABEL_83:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abpkPrevious3DSkeleton, 0);
  objc_storeStrong((id *)&self->_postprocess2d, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_previous3DSkeletonSemaphore, 0);
}

@end
