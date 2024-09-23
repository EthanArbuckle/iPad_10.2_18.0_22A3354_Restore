@implementation AR3DSkeletonRegistrationTechnique

- (void)prepare:(BOOL)a3
{
  id v4;
  void *v5;
  ARWorldTrackingPoseData *v6;
  ARWorldTrackingPoseData *currentWorldTrackingPose;

  if (!*(_QWORD *)&self->_btrts.__fill_)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CF7860]);
    v5 = *(void **)&self->_btrts.__fill_;
    *(_QWORD *)&self->_btrts.__fill_ = v4;

  }
  if (!self->_currentWorldTrackingPose)
  {
    v6 = (ARWorldTrackingPoseData *)objc_alloc_init(MEMORY[0x1E0CF7868]);
    currentWorldTrackingPose = self->_currentWorldTrackingPose;
    self->_currentWorldTrackingPose = v6;

  }
  -[AR3DSkeletonRegistrationTechnique resetState](self, "resetState", a3);
}

- (void)resetState
{
  std::__shared_weak_count *v3;
  unint64_t *v4;
  unint64_t v5;
  uint64_t i;
  _QWORD *v7;
  __int128 v8;

  self->_is_tracking = 0;
  self->_last_btr_poses_idx = -1;
  _ZNSt3__115allocate_sharedB8ne180100IN5arkit3btr15ScaleCorrectionENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v8);
  std::shared_ptr<arkit::KeyMapBuffer<void const*,std::vector<unsigned char>>>::operator=[abi:ne180100]((uint64_t)&self->_scaler, &v8);
  v3 = (std::__shared_weak_count *)*((_QWORD *)&v8 + 1);
  if (*((_QWORD *)&v8 + 1))
  {
    v4 = (unint64_t *)(*((_QWORD *)&v8 + 1) + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  for (i = 488; i != 3008; i += 504)
  {
    v7 = (_QWORD *)((char *)&self->_last_btr_poses + i);
    *v7 = 0;
    v7[1] = 0;
  }
  self->_estimatedScale = 1.0;
  -[ARWorldTrackingPoseData resetState](self->_currentWorldTrackingPose, "resetState");
}

- (id)processResultData:(id)a3 timestamp:(double)a4 context:(id)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  void *tie;

  v6 = a3;
  v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", &__block_literal_global_99);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  tie = self->_btrts.__tie_;
  self->_btrts.__tie_ = v8;

  return v6;
}

uint64_t __73__AR3DSkeletonRegistrationTechnique_processResultData_timestamp_context___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  id v6;
  __int128 v7;
  float32x4_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  double v28;
  float32x4_t v29;
  void *v30;
  void *v31;
  double v32;
  float v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  float32x4_t v37;
  void *v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  AR3DSkeletonRegistrationTechnique *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
  v34 = *MEMORY[0x1E0C83FF0];
  v35 = v7;
  v8 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48);
  v36 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 32);
  v37 = v8;
  v33 = -1.0;
  objc_msgSend(v6, "imageData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timestamp");
  kdebug_trace();

  objc_msgSend(v6, "resultDataOfClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "resultDataOfClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "detectedSkeletons");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 981668463;
  objc_msgSend(v15, "createResultScaledByFactor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  _ARLogGeneral();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = v20;
    v42 = 2048;
    v43 = self;
    _os_log_impl(&dword_1B3A68000, v18, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Estimating camera pose and scale", buf, 0x16u);

  }
  objc_msgSend(v6, "imageData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[AR3DSkeletonRegistrationTechnique _estimateCameraPoseFromMatchingImageData:to3DData:worldTrackingPose:pCameraFromBody:depthData:pScaleOut:](self, "_estimateCameraPoseFromMatchingImageData:to3DData:worldTrackingPose:pCameraFromBody:depthData:pScaleOut:", v21, v17, self->_btrts.__tie_, &v34, v13, &v33);

  objc_msgSend(v6, "imageData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "timestamp");
  kdebug_trace();

  _ARLogGeneral();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = v26;
    v42 = 2048;
    v43 = self;
    _os_log_impl(&dword_1B3A68000, v24, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Creating result", buf, 0x16u);

  }
  if (v22)
  {
    self->_last_detection_timestamp = a3;
    self->_is_tracking = 1;
    if (v33 > 0.0)
      self->_estimatedScale = v33;
    v27 = (void *)objc_opt_new();
    objc_msgSend(v27, "setTimestamp:", a3);
    *(float *)&v28 = self->_estimatedScale;
    objc_msgSend(v27, "setEstimatedScaleFactor:", v28);
    v29 = vmulq_n_f32(v37, self->_estimatedScale);
    v29.i32[3] = 1.0;
    v37 = v29;
    objc_msgSend(v27, "setVisionTransform:", *(double *)&v34, *(double *)&v35, *(double *)&v36);
    -[ARTechnique delegate](self, "delegate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "technique:didOutputResultData:timestamp:context:", self, v31, v6, a3);
  }
  else
  {
    if (self->_is_tracking && a3 - self->_last_detection_timestamp > 1.0)
      -[AR3DSkeletonRegistrationTechnique resetState](self, "resetState");
    v27 = (void *)objc_opt_new();
    LODWORD(v32) = -1.0;
    objc_msgSend(v27, "setEstimatedScaleFactor:", v32);
    objc_msgSend(v27, "setTimestamp:", a3);
    -[ARTechnique delegate](self, "delegate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "technique:didOutputResultData:timestamp:context:", self, v31, v6, a3);
  }

}

- (BOOL)reconfigurableFrom:(id)a3
{
  return 0;
}

- (BOOL)_estimateCameraPoseFromMatchingImageData:(id)a3 to3DData:(id)a4 worldTrackingPose:(id)a5 pCameraFromBody:(id *)a6 depthData:(id)a7 pScaleOut:(float *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  objc_class *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  objc_class *v41;
  void *v42;
  BOOL v43;
  objc_class *v45;
  void *v46;
  objc_class *v47;
  void *v48;
  uint64_t v49;
  const void *v50;
  void *v51;
  uint64_t v52;
  unint64_t v53;
  void *v59;
  double v60;
  double v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  void *v66;
  BOOL v67;
  NSObject *v68;
  objc_class *v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  double v75;
  void *v76;
  uint64_t v77;
  BOOL v78;
  double v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 *v87;
  uint64_t i;
  char *v89;
  __int128 v90;
  __int128 v91;
  uint64_t v92;
  _BOOL4 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  float v98;
  int last_btr_poses_idx;
  void *v100;
  void *v101;
  array<arkit::btr::RegistrationData, 5UL> *p_last_btr_poses;
  _OWORD v104[4];
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _BYTE buf[32];
  __int128 v113;
  __int128 v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (!v13)
  {
    _ARLogTechnique();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v34;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = self;
      _os_log_impl(&dword_1B3A68000, v32, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Missing image data.", buf, 0x16u);

    }
    goto LABEL_21;
  }
  if (!v14)
  {
    _ARLogTechnique();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v36;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = self;
      _os_log_impl(&dword_1B3A68000, v32, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Missing lifted data.", buf, 0x16u);

    }
    goto LABEL_21;
  }
  if (!v15)
  {
    _ARLogTechnique();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v38;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = self;
      _os_log_impl(&dword_1B3A68000, v32, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Missing currentWorldTrackingPose", buf, 0x16u);

    }
    goto LABEL_21;
  }
  if (self->_is_tracking
    || (objc_msgSend(v15, "worldTrackingState"),
        v39 = (void *)objc_claimAutoreleasedReturnValue(),
        v40 = objc_msgSend(v39, "vioTrackingState"),
        v39,
        !v40))
  {
    v110 = 0u;
    v111 = 0u;
    v109 = 0u;
    objc_msgSend(v13, "cameraIntrinsics");
    DWORD2(v109) = v17;
    DWORD2(v110) = v18;
    *(_QWORD *)&v109 = v19;
    *(_QWORD *)&v110 = v20;
    DWORD2(v111) = v21;
    *(_QWORD *)&v111 = v22;
    objc_msgSend(v14, "skeletonDetectionResult2D");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      objc_msgSend(v23, "liftingData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        if ((ARIsANEVersionEqualOrPriorToH12() & 1) != 0)
        {
          v100 = *(void **)&self->_btrts.__fill_;
          objc_msgSend(v13, "imageResolution");
          v27 = v26;
          v29 = v28;
          objc_msgSend(v24, "liftingData");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "estimateCameraPoseFromMatchingwithImageIntrinsics:imageResolution:joints2d:jointsLifted3D:jointsLifted3DCount:", objc_msgSend(v30, "rotatedJoints"), objc_msgSend(v14, "joints"), objc_msgSend(v14, "jointCount"), *(double *)&v109, *(double *)&v110, *(double *)&v111, v27, v29);
          v31 = objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v49 = objc_msgSend(v24, "jointCount");
          objc_msgSend(v24, "liftingData");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = (const void *)objc_msgSend(v101, "rotatedJoints");
          objc_msgSend(v24, "liftingData");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v51, "rotatedJoints");
          memset(buf, 0, 24);
          _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(buf, v50, v52 + 8 * v49, (v52 + 8 * v49 - (uint64_t)v50) >> 3);

          v53 = 0;
          __asm { FMOV            V8.2S, #-1.0 }
          while (objc_msgSend(v24, "jointCount") > v53)
          {
            if (!*(_DWORD *)(objc_msgSend(v24, "jointTrackingStates") + 4 * v53))
              *(_QWORD *)(*(_QWORD *)buf + 8 * v53) = _D8;
            ++v53;
          }
          v59 = *(void **)&self->_btrts.__fill_;
          objc_msgSend(v13, "imageResolution");
          objc_msgSend(v59, "estimateCameraPoseFromMatchingwithImageIntrinsics:imageResolution:joints2d:jointsLifted3D:jointsLifted3DCount:", *(_QWORD *)buf, objc_msgSend(v14, "joints"), objc_msgSend(v14, "jointCount"), *(double *)&v109, *(double *)&v110, *(double *)&v111, v60, v61);
          v31 = objc_claimAutoreleasedReturnValue();
          if (*(_QWORD *)buf)
          {
            *(_QWORD *)&buf[8] = *(_QWORD *)buf;
            operator delete(*(void **)buf);
          }
        }
        if (v31 && -[NSObject registrationValid](v31, "registrationValid"))
        {
          -[NSObject cameraFromBodyPose](v31, "cameraFromBodyPose");
          *(_OWORD *)a6 = v62;
          *((_OWORD *)a6 + 1) = v63;
          *((_OWORD *)a6 + 2) = v64;
          *((_OWORD *)a6 + 3) = v65;
          if (-[AR3DSkeletonRegistrationTechnique automaticSkeletonScaleEstimationEnabled](self, "automaticSkeletonScaleEstimationEnabled"))
          {
            objc_msgSend(v15, "worldTrackingState");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = objc_msgSend(v66, "vioTrackingState") == 0;

            if (v67)
            {
              self->_last_btr_poses_idx = (self->_last_btr_poses_idx + 1) % 5;
              -[NSObject cameraFromBodyPose](v31, "cameraFromBodyPose");
              *(_OWORD *)buf = v71;
              *(_OWORD *)&buf[16] = v72;
              v113 = v73;
              v114 = v74;
              last_btr_poses_idx = self->_last_btr_poses_idx;
              objc_msgSend(v13, "timestamp");
              p_last_btr_poses = &self->_last_btr_poses;
              objc_msgSend(v15, "worldTrackingState");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              v77 = objc_msgSend(v76, "state");

              v78 = objc_msgSend(v15, "worldMappingStatus") != 3 && objc_msgSend(v15, "worldMappingStatus") != 2;
              if (v77 == 2 || v78)
              {
                objc_msgSend(v15, "timestamp");
                v80 = 0;
                while (1)
                {
                  v81 = (uint64_t)p_last_btr_poses + v80 * 504;
                  if (vabdd_f64(p_last_btr_poses->__elems_[v80].timestamp_obj, v79) < 0.0085)
                    break;
                  if (++v80 == 5)
                    goto LABEL_62;
                }
                objc_msgSend(v15, "visionCameraTransform");
                v82 = 0;
                v104[0] = v83;
                v104[1] = v84;
                v104[2] = v85;
                v104[3] = v86;
                v105 = xmmword_1B3C0B710;
                v106 = unk_1B3C0B720;
                v107 = xmmword_1B3C0B730;
                v108 = unk_1B3C0B740;
                v87 = &v105;
                do
                {
                  for (i = 0; i != 4; ++i)
                    LODWORD(v87[i]) = *((_DWORD *)&v104[i] + (v82 & 3));
                  ++v82;
                  v87 = (__int128 *)((char *)v87 + 4);
                }
                while (v82 != 3);
                v89 = (char *)p_last_btr_poses + v80 * 504;
                v90 = v106;
                *(_OWORD *)(v89 + 420) = v105;
                *(_OWORD *)(v89 + 436) = v90;
                v91 = v108;
                *(_OWORD *)(v89 + 452) = v107;
                *(_OWORD *)(v89 + 468) = v91;
                objc_msgSend(v15, "timestamp");
                *((_QWORD *)v89 + 62) = v92;
                if (ARDeviceSupportsJasper())
                {
                  v93 = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.bodytracking.useAppleDepthForScale"));
                  v94 = *(_OWORD *)a6;
                  v95 = *((_OWORD *)a6 + 1);
                  v96 = *((_OWORD *)a6 + 2);
                  v97 = *((_OWORD *)a6 + 3);
                  if (v93)
                    -[AR3DSkeletonRegistrationTechnique _estimateScaleFromDepthData:imageData:cameraPoseFromBody:skeleton:](self, "_estimateScaleFromDepthData:imageData:cameraPoseFromBody:skeleton:", v16, v13, v14, *(double *)&v94, *(double *)&v95, *(double *)&v96, *(double *)&v97);
                  else
                    -[AR3DSkeletonRegistrationTechnique _estimateScaleFromJasperCloud:cameraPoseFromBody:skeleton:](self, "_estimateScaleFromJasperCloud:cameraPoseFromBody:skeleton:", v13, v14, *(double *)&v94, *(double *)&v95, *(double *)&v96, *(double *)&v97);
                }
                else
                {
                  *(_QWORD *)&v105 = 13;
                  v98 = arkit::btr::ScaleCorrection::EstimateScale((uint64_t)self->_scaler.__ptr_, v81, (float *)&v105);
                }
                *a8 = v98;
              }
            }
            else
            {
              _ARLogTechnique();
              v68 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
              {
                v69 = (objc_class *)objc_opt_class();
                NSStringFromClass(v69);
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v70;
                *(_WORD *)&buf[12] = 2048;
                *(_QWORD *)&buf[14] = self;
                _os_log_impl(&dword_1B3A68000, v68, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Scale estimation skip (tracking not nominal", buf, 0x16u);

              }
            }
          }
LABEL_62:
          v43 = 1;
          goto LABEL_42;
        }
      }
      else
      {
        _ARLogTechnique();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          v47 = (objc_class *)objc_opt_class();
          NSStringFromClass(v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v48;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = self;
          _os_log_impl(&dword_1B3A68000, v31, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Missing lifting data", buf, 0x16u);

        }
      }
    }
    else
    {
      _ARLogTechnique();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v45 = (objc_class *)objc_opt_class();
        NSStringFromClass(v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v46;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = self;
        _os_log_impl(&dword_1B3A68000, v31, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Missing 2D joints", buf, 0x16u);

      }
    }
    v43 = 0;
LABEL_42:

    goto LABEL_22;
  }
  _ARLogTechnique();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    v41 = (objc_class *)objc_opt_class();
    NSStringFromClass(v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v42;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl(&dword_1B3A68000, v32, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Tracking state not nominal", buf, 0x16u);

  }
LABEL_21:

  v43 = 0;
LABEL_22:

  return v43;
}

- (float)_estimateScaleFromDepthData:(__n128)a3 imageData:(__n128)a4 cameraPoseFromBody:(__n128)a5 skeleton:(uint64_t)a6
{
  id v12;
  id v13;
  id v14;
  float v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  float v34;

  v12 = a7;
  v13 = a8;
  v14 = a9;
  v15 = 1.0;
  if ((objc_msgSend(a1, "automaticSkeletonScaleEstimationEnabled") & 1) != 0)
  {
    v15 = -1.0;
    if (v12)
    {
      v16 = objc_msgSend(v12, "depthBuffer");
      if (v14)
      {
        if (v13 && v16)
        {
          v17 = objc_alloc(MEMORY[0x1E0CF7858]);
          v18 = objc_msgSend(v14, "joints");
          v19 = objc_msgSend(v14, "jointCount");
          objc_msgSend(v14, "skeletonDetectionResult2D");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(v17, "initWithJoints:numberOfJoints:referenceDetectionResult:", v18, v19, v20);

          v22 = (void *)a1[474];
          v23 = objc_msgSend(v12, "depthBuffer");
          v24 = objc_msgSend(v12, "confidenceBuffer");
          objc_msgSend(v13, "timestamp");
          v26 = v25;
          objc_msgSend(v13, "imageResolution");
          v28 = v27;
          v30 = v29;
          objc_msgSend(v13, "cameraIntrinsics");
          objc_msgSend(v22, "estimateScaleFromDepthData:depthConfidenceData:timestamp:imageResolution:imageIntrinsics:cameraFromBodyPose:liftingResult:", v23, v24, v21, v26, v28, v30, v31, v32, v33, *(_OWORD *)&a2, *(_OWORD *)&a3, *(_OWORD *)&a4, *(_OWORD *)&a5);
          v15 = v34;

        }
      }
    }
  }

  return v15;
}

- (float)_estimateScaleFromJasperCloud:(double)a3 cameraPoseFromBody:(double)a4 skeleton:(double)a5
{
  id v10;
  id v11;
  float v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  float v24;

  v10 = a7;
  v11 = a8;
  v12 = -1.0;
  if (v10)
  {
    objc_msgSend(v10, "pointCloud");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v10, "pointCloud");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "depthPointCloud");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        if (v15)
        {
          v16 = objc_alloc(MEMORY[0x1E0CF7858]);
          v17 = objc_msgSend(v11, "joints");
          v18 = objc_msgSend(v11, "jointCount");
          objc_msgSend(v11, "skeletonDetectionResult2D");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v16, "initWithJoints:numberOfJoints:referenceDetectionResult:", v17, v18, v19);

          v21 = *(void **)(a1 + 3792);
          objc_msgSend(v10, "pointCloud");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "depthPointCloud");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "estimateScaleFromJasperCloud:cameraFromBodyPose:liftingResult:", v23, v20, a2, a3, a4, a5);
          v12 = v24;

        }
      }
    }
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  _BOOL4 v6;
  int v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AR3DSkeletonRegistrationTechnique;
  if (-[ARTechnique isEqual:](&v9, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = -[AR3DSkeletonRegistrationTechnique automaticSkeletonScaleEstimationEnabled](self, "automaticSkeletonScaleEstimationEnabled");
    v7 = v6 ^ objc_msgSend(v5, "automaticSkeletonScaleEstimationEnabled") ^ 1;

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)automaticSkeletonScaleEstimationEnabled
{
  return (BOOL)self->_abpkRegistration;
}

- (void)setAutomaticSkeletonScaleEstimationEnabled:(BOOL)a3
{
  LOBYTE(self->_abpkRegistration) = a3;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_storeStrong((id *)&self->_currentWorldTrackingPose, 0);
  objc_storeStrong((id *)&self->_btrts.__fill_, 0);
  objc_storeStrong(&self->_btrts.__tie_, 0);
  v3 = MEMORY[0x1E0DE4F48];
  v4 = *MEMORY[0x1E0DE4F48];
  self->_btrf.__tie_ = (void *)*MEMORY[0x1E0DE4F48];
  v5 = *(void **)(v3 + 24);
  *(void **)((char *)&self->_btrf.__tie_ + *(_QWORD *)(v4 - 24)) = v5;
  MEMORY[0x1B5E2D450](&self->_btrf.__fill_);
  std::ostream::~ostream();
  MEMORY[0x1B5E2D57C](&self->_btrts.__sb_.__om_);
  *(_QWORD *)&self->_dumps_dir.__r_.var0 = v4;
  *(_QWORD *)((char *)&self->_dumps_dir.__r_.var0 + *(_QWORD *)(v4 - 24)) = v5;
  MEMORY[0x1B5E2D450](&self->_dumps_dir.var0);
  std::ostream::~ostream();
  MEMORY[0x1B5E2D57C](&self->_btrf.__sb_.__om_);
  if (*((char *)&self->_dumps_dir.__r_.__value_.var0.__l + 23) < 0)
    operator delete(self->_dumps_dir.__r_.__value_.var0.__l.__data_);
  std::shared_ptr<arkit::KeyMapBuffer<void const*,std::vector<unsigned char>>>::~shared_ptr[abi:ne180100]((uint64_t)&self->_scaler);
}

- (id).cxx_construct
{
  uint64_t v3;
  array<arkit::btr::RegistrationData, 5UL> *p_last_btr_poses;
  char *v5;
  _OWORD *m_data;
  _OWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  std::ios_base *v12;
  std::ios_base *v13;

  v3 = 0;
  self->_scaler.__ptr_ = 0;
  self->_scaler.__cntrl_ = 0;
  p_last_btr_poses = &self->_last_btr_poses;
  do
  {
    v5 = (char *)p_last_btr_poses + v3 * 504;
    *((_DWORD *)v5 + 88) = 0;
    m_data = (_OWORD *)p_last_btr_poses->__elems_[v3].cam_from_obj.m_data;
    *((_OWORD *)v5 + 20) = 0uLL;
    *((_OWORD *)v5 + 21) = 0uLL;
    *((_OWORD *)v5 + 18) = 0uLL;
    *((_OWORD *)v5 + 19) = 0uLL;
    *((_OWORD *)v5 + 16) = 0uLL;
    *((_OWORD *)v5 + 17) = 0uLL;
    *((_OWORD *)v5 + 14) = 0uLL;
    *((_OWORD *)v5 + 15) = 0uLL;
    *((_OWORD *)v5 + 12) = 0uLL;
    *((_OWORD *)v5 + 13) = 0uLL;
    *((_OWORD *)v5 + 10) = 0uLL;
    *((_OWORD *)v5 + 11) = 0uLL;
    *((_OWORD *)v5 + 8) = 0uLL;
    *((_OWORD *)v5 + 9) = 0uLL;
    *((_OWORD *)v5 + 6) = 0uLL;
    *((_OWORD *)v5 + 7) = 0uLL;
    *((_OWORD *)v5 + 4) = 0uLL;
    *((_OWORD *)v5 + 5) = 0uLL;
    *((_OWORD *)v5 + 2) = 0uLL;
    *((_OWORD *)v5 + 3) = 0uLL;
    *(_OWORD *)v5 = 0uLL;
    *((_OWORD *)v5 + 1) = 0uLL;
    *m_data = xmmword_1B3C0B710;
    m_data[1] = unk_1B3C0B720;
    m_data[2] = xmmword_1B3C0B730;
    m_data[3] = unk_1B3C0B740;
    v7 = (_OWORD *)p_last_btr_poses->__elems_[v3].cam_from_vio.m_data;
    *v7 = xmmword_1B3C0B710;
    v7[1] = unk_1B3C0B720;
    v7[2] = xmmword_1B3C0B730;
    v7[3] = unk_1B3C0B740;
    ++v3;
    *((_QWORD *)v5 + 61) = 0;
    *((_QWORD *)v5 + 62) = 0;
  }
  while (v3 != 5);
  *(_OWORD *)&self->_dumps_dir.__r_.__value_.var0.__l.__size_ = 0uLL;
  self->_dumps_dir.__r_.__value_.var0.__l.__data_ = 0;
  v8 = MEMORY[0x1E0DE4FB0];
  v9 = MEMORY[0x1E0DE4FB0] + 64;
  *(_QWORD *)&self->_btrf.__sb_.__om_ = MEMORY[0x1E0DE4FB0] + 64;
  v10 = *(_QWORD **)(MEMORY[0x1E0DE4F48] + 8);
  v11 = *(void **)(MEMORY[0x1E0DE4F48] + 16);
  *(_QWORD *)&self->_dumps_dir.__r_.var0 = v10;
  *(_QWORD *)((char *)&self->_dumps_dir.__r_.var0 + *(v10 - 3)) = v11;
  v12 = (std::ios_base *)((char *)&self->_dumps_dir.__r_.var0
                        + *(_QWORD *)(*(_QWORD *)&self->_dumps_dir.__r_.var0 - 24));
  std::ios_base::init(v12, &self->_dumps_dir.var0);
  v12[1].__vftable = 0;
  v12[1].__fmtflags_ = -1;
  *(_QWORD *)&self->_dumps_dir.__r_.var0 = v8 + 24;
  *(_QWORD *)&self->_btrf.__sb_.__om_ = v9;
  MEMORY[0x1B5E2D444](&self->_dumps_dir.var0);
  *(_QWORD *)&self->_btrts.__sb_.__om_ = v8 + 64;
  self->_btrf.__tie_ = v10;
  *(void **)((char *)&self->_btrf.__tie_ + *(v10 - 3)) = v11;
  v13 = (std::ios_base *)((char *)&self->_btrf.__tie_ + *((_QWORD *)self->_btrf.__tie_ - 3));
  std::ios_base::init(v13, &self->_btrf.__fill_);
  v13[1].__vftable = 0;
  v13[1].__fmtflags_ = -1;
  self->_btrf.__tie_ = (void *)(v8 + 24);
  *(_QWORD *)&self->_btrts.__sb_.__om_ = v8 + 64;
  MEMORY[0x1B5E2D444](&self->_btrf.__fill_);
  return self;
}

@end
