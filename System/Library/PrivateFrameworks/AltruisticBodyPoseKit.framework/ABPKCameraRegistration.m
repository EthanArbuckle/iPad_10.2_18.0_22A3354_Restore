@implementation ABPKCameraRegistration

- (ABPKCameraRegistration)init
{
  NSObject *v3;
  objc_super v5;
  uint8_t buf[16];

  __ABPKLogSharedInstance();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v3, OS_LOG_TYPE_DEBUG, " ABPKCameraRegistration: Initializing ", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)ABPKCameraRegistration;
  return -[ABPKCameraRegistration init](&v5, sel_init);
}

- (ABPKRegistrationData)estimateCameraPoseFromMatchingwithImageIntrinsics:(__n128)a3 imageResolution:(__n128)a4 joints2d:(float64_t)a5 jointsLifted3D:(float64_t)a6 jointsLifted3DCount:(uint64_t)a7
{
  NSObject *v14;
  NSObject *v15;
  uint64_t *v16;
  float64x2_t v22;
  float32x2_t v23;
  uint64_t *v24;
  uint64_t *v25;
  float32x2_t v26;
  float32x2_t v27;
  uint64_t v28;
  float32x2_t v29;
  float64x2_t v30;
  double v31;
  double v32;
  _QWORD *v33;
  float32x2_t v34;
  float32x2_t v35;
  float64x2_t v36;
  __int128 v37;
  __int128 v38;
  NSObject *v39;
  NSObject *v40;
  ABPKRegistrationData *v41;
  NSObject *v42;
  ABPKRegistrationData *v43;
  uint8_t v47[16];
  uint8_t buf[8];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  void *v53;
  void *v54;
  void *__p;
  void *v56;
  _OWORD v57[4];
  char *v58;
  char *v59;
  uint64_t *v60;
  _QWORD *v61[2];
  __n128 v62;
  __n128 v63;
  __n128 v64;

  v62 = a2;
  v63 = a3;
  v64 = a4;
  __ABPKLogSharedInstance();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v14, OS_LOG_TYPE_DEBUG, " ABPKCameraRegistration: Estimating camera pose ", buf, 2u);
  }

  __ABPKLogSharedInstance();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v15, OS_LOG_TYPE_DEBUG, " \t Retargetting 2d keypoints to lifting skeleton type ", buf, 2u);
  }

  v61[0] = 0;
  v61[1] = 0;
  v60 = (uint64_t *)v61;
  *(_QWORD *)buf = 0x800000000;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  *(_QWORD *)buf = 0x700000001;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  *(_QWORD *)buf = 0xD00000002;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  *(_QWORD *)buf = 0xE00000003;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  *(_QWORD *)buf = 0xF00000004;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  *(_QWORD *)buf = 0xA00000005;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  *(_QWORD *)buf = 0xB00000006;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  *(_QWORD *)buf = 0xC00000007;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  *(_QWORD *)buf = 0x100000008;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  *(_QWORD *)buf = 0x200000009;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  *(_QWORD *)buf = 0x30000000ALL;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  *(_QWORD *)buf = 0x40000000BLL;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  *(_QWORD *)buf = 0x50000000CLL;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  *(_QWORD *)buf = 0x60000000DLL;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEEC2Em(&v58, 0x10uLL);
  v16 = v60;
  __asm { FMOV            V8.2S, #-1.0 }
  if (v60 != (uint64_t *)v61)
  {
    v22.f64[0] = a5;
    v22.f64[1] = a6;
    do
    {
      v23 = a8[*((int *)v16 + 7)];
      if (v23.f32[0] < 0.0 || v23.f32[1] < 0.0)
        *(double *)&v58[8 * *((int *)v16 + 8)] = _D8;
      else
        *(float32x2_t *)&v58[8 * *((int *)v16 + 8)] = vcvt_f32_f64(vmulq_f64(v22, vcvtq_f64_f32(v23)));
      v24 = (uint64_t *)v16[1];
      if (v24)
      {
        do
        {
          v25 = v24;
          v24 = (uint64_t *)*v24;
        }
        while (v24);
      }
      else
      {
        do
        {
          v25 = (uint64_t *)v16[2];
          _ZF = *v25 == (_QWORD)v16;
          v16 = v25;
        }
        while (!_ZF);
      }
      v16 = v25;
    }
    while (v25 != (uint64_t *)v61);
  }
  if (determineDeviceANEVersionPriorOrEqualToH12())
  {
    *(float32x2_t *)v58 = vmul_f32(vadd_f32(*(float32x2_t *)(v58 + 32), *(float32x2_t *)(v58 + 8)), (float32x2_t)0x3F0000003F000000);
    v26 = *(float32x2_t *)(v58 + 64);
    v27 = vmul_f32(vadd_f32(v26, *(float32x2_t *)(v58 + 56)), (float32x2_t)0x3F0000003F000000);
    *(float *)&v28 = vmlas_n_f32(-v27.f32[0], 2.0, v26.f32[0]);
    v26.f32[0] = v27.f32[1] * -0.6 + v26.f32[1] * 1.6;
    HIDWORD(v28) = v26.i32[0];
    *((_QWORD *)v58 + 9) = v28;
  }
  else
  {
    v29 = a8[16];
    v30.f64[0] = a5;
    v30.f64[1] = a6;
    v31 = COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(v30, vcvtq_f64_f32(v29))));
    if (v29.f32[1] < 0.0)
      v31 = _D8;
    if (v29.f32[0] >= 0.0)
      v32 = v31;
    else
      v32 = _D8;
    v33 = v58;
    *((double *)v58 + 9) = v32;
    v35 = (float32x2_t)v33[7];
    v34 = (float32x2_t)v33[8];
    if (v35.f32[0] >= 0.0 && v34.f32[0] >= 0.0 && v34.f32[1] >= 0.0)
    {
      v36 = vcvtq_f64_f32(vsub_f32(v35, v34));
      *(float *)v36.f64 = sqrt(vaddvq_f64(vmulq_f64(v36, v36)));
      *(float *)v36.f64 = v34.f32[1] + *(float *)v36.f64 * -0.5;
      v34.i32[1] = LODWORD(v36.f64[0]);
    }
    v33[9] = v34;
  }
  v37 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 16);
  v57[0] = *MEMORY[0x24BDAEE00];
  v57[1] = v37;
  v38 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 48);
  v57[2] = *(_OWORD *)(MEMORY[0x24BDAEE00] + 32);
  v57[3] = v38;
  __ABPKLogSharedInstance();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v39, OS_LOG_TYPE_DEBUG, " \t Performing registration ", buf, 2u);
  }

  btr::BodyRegistration::RegisterBody(a1 + 16, (uint64_t)v58, (v59 - v58) >> 3, a9, a10, (uint64_t)v57, 1, (float32x2_t *)&v62, (uint64_t)buf);
  if (*(_DWORD *)buf)
  {
    __ABPKLogSharedInstance();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v47 = 0;
      _os_log_impl(&dword_210836000, v40, OS_LOG_TYPE_ERROR, " \t\t Registration Failed ", v47, 2u);
    }

    v41 = 0;
  }
  else
  {
    __ABPKLogSharedInstance();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v47 = 0;
      _os_log_impl(&dword_210836000, v42, OS_LOG_TYPE_DEBUG, " \t Creating result type ", v47, 2u);
    }

    v43 = [ABPKRegistrationData alloc];
    v41 = -[ABPKRegistrationData initWithImagePoints:imagePointsCount:jointsLifted3D:jointsLifted3DCount:cameraIntrinsics:imageDimensions:cameraFromBodyPose:registrationValid:](v43, "initWithImagePoints:imagePointsCount:jointsLifted3D:jointsLifted3DCount:cameraIntrinsics:imageDimensions:cameraFromBodyPose:registrationValid:", v62.n128_f64[0], v63.n128_f64[0], v64.n128_f64[0], a5, a6, v49, v50, v51, v52);
  }
  if (__p)
  {
    v56 = __p;
    operator delete(__p);
  }
  if (v53)
  {
    v54 = v53;
    operator delete(v53);
  }
  if (v58)
  {
    v59 = v58;
    operator delete(v58);
  }
  std::__tree<unsigned char>::destroy((uint64_t)&v60, v61[0]);
  return v41;
}

- (id)runCameraRegistrationWithImageIntrinsics:(__n128)a3 imageResolution:(__n128)a4 liftingResult:(float64_t)a5
{
  id v9;
  NSObject *v10;
  ABPKResultRegistration *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  float64x2_t v17;
  float32x2_t v18;
  float32x2_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  float32x2_t v23;
  float32x2_t *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  const Correspondences2d3d *v28;
  NSObject *v29;
  double v30;
  double v31;
  NSObject *v32;
  NSObject *v33;
  float64x2_t *v34;
  double v35;
  uint64_t v36;
  float64x2_t v37;
  float v38;
  double *v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  unsigned int v44;
  id v45;
  id v47;
  unsigned int v49;
  unsigned int v51;
  float64x2_t v52;
  double v53;
  uint8_t buf[16];
  uint64_t v55;
  float64x2_t v56[5];
  float64x2_t v57;
  CameraPoseInfo v58;
  uint64_t v59;
  _OWORD v60[3];
  _QWORD v61[2];
  double *v62[2];
  uint8_t v63[4];
  _QWORD v64[9];

  *(_QWORD *)((char *)&v64[6] + 4) = *MEMORY[0x24BDAC8D0];
  v60[0] = a2;
  v60[1] = a3;
  v60[2] = a4;
  v9 = a8;
  objc_msgSend((id)a1, "_startRunCameraRegistrationSignpost");
  __ABPKLogSharedInstance();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v10, OS_LOG_TYPE_DEBUG, " ABPKCameraRegistration: Run camera registration ", buf, 2u);
  }

  v11 = objc_alloc_init(ABPKResultRegistration);
  v12 = *(void **)(a1 + 352);
  *(_QWORD *)(a1 + 352) = v11;

  objc_msgSend(v9, "skeletonDetectionResult2D");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "liftingData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE6resizeEm(a1 + 360, (unint64_t)objc_msgSend(v14, "liftingData3DElementCount") >> 1);

  if (*(_QWORD *)(a1 + 368) != *(_QWORD *)(a1 + 360))
  {
    v15 = 0;
    v16 = 0;
    v17.f64[0] = a5;
    v17.f64[1] = a6;
    v18 = vcvt_f32_s32(vmovn_s64(vcvtq_s64_f64(v17)));
    v19 = (float32x2_t)vdup_n_s32(0x447A0000u);
    do
    {
      objc_msgSend(v13, "liftingData");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = *(_DWORD *)(objc_msgSend(v20, "unnormalizedLiftingData3D") + v15);
      objc_msgSend(v13, "liftingData");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = *(_DWORD *)(objc_msgSend(v21, "unnormalizedLiftingData3D") + v15 + 4);

      *(float32x2_t *)(*(_QWORD *)(a1 + 360) + v15) = vdiv_f32(vmul_f32((float32x2_t)__PAIR64__(v49, v51), v18), v19);
      ++v16;
      v15 += 8;
    }
    while (v16 < (uint64_t)(*(_QWORD *)(a1 + 368) - *(_QWORD *)(a1 + 360)) >> 3);
  }
  objc_msgSend(*(id *)(a1 + 352), "setJoints2d:");
  v58.transform.m_data[15] = 0.0;
  v58.transform.m_data[14] = 0.0;
  v59 = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)&v58.transform.m_data[14], objc_msgSend(v9, "jointCount"));
  v22 = 0;
  v23 = (float32x2_t)vdup_n_s32(0x447A0000u);
  while (objc_msgSend(v9, "jointCount") > v22)
  {
    v24 = (float32x2_t *)(objc_msgSend(v9, "joints") + 16 * v22);
    *(float32x2_t *)&v25 = vdiv_f32(*v24, v23);
    *((float *)&v25 + 2) = v24[1].f32[0] / 1000.0;
    *(_OWORD *)(*(_QWORD *)&v58.transform.m_data[14] + 16 * v22++) = v25;
  }
  v26 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 16);
  *(_OWORD *)&v58.transform.m_data[5] = *MEMORY[0x24BDAEE00];
  *(_OWORD *)&v58.transform.m_data[7] = v26;
  v27 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 48);
  *(_OWORD *)&v58.transform.m_data[9] = *(_OWORD *)(MEMORY[0x24BDAEE00] + 32);
  *(_OWORD *)&v58.transform.m_data[11] = v27;
  *(_OWORD *)&v58.camera_matrix.m_data[6] = *(_OWORD *)&v58.transform.m_data[5];
  *(_OWORD *)&v58.camera_matrix.m_data[8] = v26;
  *(_OWORD *)&v58.transform.m_data[1] = *(_OWORD *)&v58.transform.m_data[9];
  *(_OWORD *)&v58.transform.m_data[3] = v27;
  btr::BodyRegistration::RegisterBody(a1 + 16, *(_QWORD *)(a1 + 360), (uint64_t)(*(_QWORD *)(a1 + 368) - *(_QWORD *)(a1 + 360)) >> 3, *(uint64_t *)&v58.transform.m_data[14], (uint64_t)(*(_QWORD *)&v58.transform.m_data[15] - *(_QWORD *)&v58.transform.m_data[14]) >> 4, (uint64_t)&v58.transform.m_data[5], 1, (float32x2_t *)v60, (uint64_t)buf);
  if (*(_DWORD *)buf)
  {
    __ABPKLogSharedInstance();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v63 = 0;
      _os_log_impl(&dword_210836000, v29, OS_LOG_TYPE_DEFAULT, " \t\t Registration Failed ", v63, 2u);
    }

    objc_msgSend(*(id *)(a1 + 352), "setSuccess:", 0, &v58.camera_matrix.m_data[6]);
  }
  else
  {
    v47 = v9;
    v30 = btr::ComputeReprojectionAvg((btr *)&v55, &v58, v28);
    v31 = btr::ComputeTotalBoneLength((uint64_t *)&v58.camera_matrix.m_data[3]);
    __ABPKLogSharedInstance();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v63 = 134217984;
      *(double *)v64 = v30;
      _os_log_impl(&dword_210836000, v32, OS_LOG_TYPE_DEBUG, " \t\t Reprojection err evg[pixels]: %f ", v63, 0xCu);
    }

    __ABPKLogSharedInstance();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v63 = 134217984;
      *(double *)v64 = v31;
      _os_log_impl(&dword_210836000, v33, OS_LOG_TYPE_DEBUG, " \t\t Bones length: %f) ", v63, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 352), "setCameraFromBodyPose:", COERCE_DOUBLE(vcvt_f32_f64(v56[0])), COERCE_DOUBLE(vcvt_f32_f64(v56[2])), COERCE_DOUBLE(vcvt_f32_f64(v56[4])), COERCE_DOUBLE(vcvt_f32_f64(v57)), &v58.camera_matrix.m_data[6]);
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm(a1 + 384, 0x10uLL);
    v34 = *(float64x2_t **)&v58.camera_matrix.m_data[3];
    v35 = v58.camera_matrix.m_data[4];
    if (*(_QWORD *)&v58.camera_matrix.m_data[3] != *(_QWORD *)&v58.camera_matrix.m_data[4])
    {
      v36 = 0;
      do
      {
        v37 = *v34;
        *(float32x2_t *)&v37.f64[0] = vcvt_f32_f64(*v34);
        v38 = v34[1].f64[0];
        *(float *)&v37.f64[1] = v38;
        *(float64x2_t *)(*(_QWORD *)(a1 + 384) + v36) = v37;
        v36 += 16;
        v34 = (float64x2_t *)((char *)v34 + 24);
      }
      while (v34 != *(float64x2_t **)&v35);
    }
    objc_msgSend(*(id *)(a1 + 352), "setJoints3dWrtBody:", *(_QWORD *)(a1 + 384));
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm(a1 + 408, 0x10uLL);
    v39 = *(double **)&v58.camera_matrix.m_data[3];
    v40 = v58.camera_matrix.m_data[4];
    if (*(_QWORD *)&v58.camera_matrix.m_data[3] != *(_QWORD *)&v58.camera_matrix.m_data[4])
    {
      v41 = 0;
      do
      {
        v61[0] = v56;
        v61[1] = 4;
        v62[0] = (double *)v61;
        v62[1] = v39;
        *(_QWORD *)((char *)&v64[1] + 4) = 0;
        *(_QWORD *)((char *)&v64[2] + 4) = 0;
        *(_QWORD *)((char *)v64 + 4) = 0;
        cva::assign<false,false,cva::Matrix<double,3u,1u,false>,cva::MatrixRef<double const,3u,3u,false>,cva::Matrix<double,3u,1u,false>>((uint64_t)v64 + 4, v62);
        v42 = 0;
        v52 = 0uLL;
        v53 = 0.0;
        do
        {
          v52.f64[v42] = *(double *)((char *)&v64[v42] + 4) + v57.f64[v42];
          ++v42;
        }
        while (v42 != 3);
        *(float32x2_t *)&v43 = vcvt_f32_f64(v52);
        *(float *)&v44 = v53;
        *((_QWORD *)&v43 + 1) = __PAIR64__(HIDWORD(v52.f64[1]), v44);
        *(_OWORD *)(*(_QWORD *)(a1 + 408) + 16 * v41++) = v43;
        v39 += 3;
      }
      while (v39 != *(double **)&v40);
    }
    v9 = v47;
    objc_msgSend(*(id *)(a1 + 352), "setJoints3dWrtCamera:", *(_QWORD *)(a1 + 408));
    objc_msgSend(*(id *)(a1 + 352), "setSuccess:", 1);
  }
  objc_msgSend((id)a1, "_endRunCameraRegistrationSignpost");
  v45 = *(id *)(a1 + 352);
  if (*(_QWORD *)&v58.camera_matrix.m_data[3])
  {
    v58.camera_matrix.m_data[4] = v58.camera_matrix.m_data[3];
    operator delete(*(void **)&v58.camera_matrix.m_data[3]);
  }
  if (*(_QWORD *)&v58.camera_matrix.m_data[0])
  {
    v58.camera_matrix.m_data[1] = v58.camera_matrix.m_data[0];
    operator delete(*(void **)&v58.camera_matrix.m_data[0]);
  }
  if (*(_QWORD *)&v58.transform.m_data[14])
  {
    v58.transform.m_data[15] = v58.transform.m_data[14];
    operator delete(*(void **)&v58.transform.m_data[14]);
  }

  return v45;
}

- (void)_startRunCameraRegistrationSignpost
{
  kdebug_trace();
}

- (void)_endRunCameraRegistrationSignpost
{
  kdebug_trace();
}

- (void).cxx_destruct
{
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **var0;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **v4;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v5;
  void *v6;
  void *v7;

  var0 = self->_v3d_cam.var0;
  if (var0)
  {
    self[1].super.isa = (Class)var0;
    operator delete(var0);
  }
  v4 = self->_v3d_body.var0;
  if (v4)
  {
    *(_QWORD *)self->_anon_188 = v4;
    operator delete(v4);
  }
  v5 = self->_imagePoints.var0;
  if (v5)
  {
    *(_QWORD *)self->_anon_170 = v5;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_regResult, 0);
  v6 = *(void **)&self->_anon_110[56];
  if (v6)
  {
    *(_QWORD *)&self->_anon_110[64] = v6;
    operator delete(v6);
  }
  v7 = *(void **)&self->_anon_110[32];
  if (v7)
  {
    *(_QWORD *)&self->_anon_110[40] = v7;
    operator delete(v7);
  }
}

- (id).cxx_construct
{
  *((_DWORD *)self + 4) = 5;
  *(_OWORD *)((char *)self + 168) = xmmword_210882088;
  *(_OWORD *)((char *)self + 184) = unk_210882098;
  *(_OWORD *)((char *)self + 200) = xmmword_2108820A8;
  *(_OWORD *)((char *)self + 216) = unk_2108820B8;
  *(_OWORD *)((char *)self + 104) = xmmword_210882048;
  *(_OWORD *)((char *)self + 120) = unk_210882058;
  *(_OWORD *)((char *)self + 136) = xmmword_210882068;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_QWORD *)self + 12) = 0;
  *(_OWORD *)((char *)self + 152) = unk_210882078;
  *((_OWORD *)self + 20) = 0u;
  *((_OWORD *)self + 21) = 0u;
  *((_OWORD *)self + 18) = 0u;
  *((_OWORD *)self + 19) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 17) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_QWORD *)self + 53) = 0;
  *(_OWORD *)((char *)self + 392) = 0u;
  *(_OWORD *)((char *)self + 408) = 0u;
  *(_OWORD *)((char *)self + 360) = 0u;
  *(_OWORD *)((char *)self + 376) = 0u;
  return self;
}

@end
