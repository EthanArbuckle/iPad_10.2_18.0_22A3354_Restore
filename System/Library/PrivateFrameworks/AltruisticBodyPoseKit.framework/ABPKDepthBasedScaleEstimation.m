@implementation ABPKDepthBasedScaleEstimation

- (ABPKDepthBasedScaleEstimation)init
{
  NSObject *v3;
  ABPKDepthBasedScaleEstimation *v4;
  ABPKDepthBasedScaleEstimation *v5;
  objc_super v7;
  uint8_t buf[16];

  __ABPKLogSharedInstance();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v3, OS_LOG_TYPE_DEBUG, " ABPKDepthBasedScaleEstimation: Initializing ", buf, 2u);
  }

  v7.receiver = self;
  v7.super_class = (Class)ABPKDepthBasedScaleEstimation;
  v4 = -[ABPKDepthBasedScaleEstimation init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[ABPKDepthBasedScaleEstimation resetState](v4, "resetState");
  return v5;
}

- (void)resetState
{
  NSObject *v3;
  uint8_t v4[16];

  __ABPKLogSharedInstance();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_210836000, v3, OS_LOG_TYPE_DEBUG, " ABPKDepthBasedScaleEstimation: Reset state ", v4, 2u);
  }

  self->_depth_scaler_num_den = 0;
  self->_depth_scaler_observation_count = 0;
}

- (float)estimateScaleFromDepthData:(CGFloat)a3 depthConfidenceData:(CGFloat)a4 timestamp:(__n128)a5 imageResolution:(__n128)a6 imageIntrinsics:(__n128)a7 cameraFromBodyPose:(uint64_t)a8 liftingResult:(__CVBuffer *)a9
{
  id v23;
  NSObject *v24;
  size_t Width;
  size_t Height;
  int v27;
  unint64_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  NSObject *v32;
  int BytesPerRow;
  int v34;
  NSObject *v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  float *v39;
  int32x2_t v40;
  int32x2_t v41;
  float32x4_t v42;
  unint64_t v43;
  const float *v44;
  int v45;
  __CVBuffer *v46;
  int v47;
  int v48;
  int v49;
  int v50;
  char *v51;
  _DWORD *v52;
  char *v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char *v58;
  char *v59;
  int v60;
  char *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char *v68;
  char *v69;
  int v70;
  float32x4_t v71;
  __int32 v72;
  char *v73;
  _DWORD *v74;
  char *v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  char *v80;
  __int32 *v81;
  __int32 v82;
  NSObject *v83;
  uint64_t v84;
  float v85;
  uint64_t v86;
  float v87;
  float v88;
  float v89;
  _OWORD *v91;
  const float *v93;
  const float *BaseAddress;
  int32x2_t v95;
  int32x2_t v96;
  float v97;
  float32x4_t v98;
  _BYTE v99[48];
  float32x4_t v100;
  float32x4_t v101;
  float32x4_t v102;
  uint8_t *v103;
  uint8_t *v104;
  uint8_t *v105;
  int v106;
  void *v107;
  int v108;
  int v109;
  unsigned int v110;
  uint64_t v111;
  unsigned int v112;
  int v113;
  uint8_t v114[4];
  uint64_t v115;
  int v116;
  int v117;
  void *__p;
  char *v119;
  char *v120;
  float32x4_t v121;
  _OWORD v122[3];
  uint8_t buf[16];
  _OWORD v124[3];
  float v125[3];
  CGSize v126;
  CGSize v127;

  *(__n128 *)&v99[16] = a6;
  *(__n128 *)&v99[32] = a7;
  *(__n128 *)v99 = a5;
  v23 = a11;
  __ABPKLogSharedInstance();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v24, OS_LOG_TYPE_DEBUG, " ABPKDepthBasedScaleEstimation: Estimating scale from AppleDepth data ", buf, 2u);
  }

  if (a2 - *(double *)(a1 + 8) > 1.0)
    objc_msgSend((id)a1, "resetState");
  Width = CVPixelBufferGetWidth(a9);
  Height = CVPixelBufferGetHeight(a9);
  v27 = Height;
  v127.width = (double)Width;
  v127.height = (double)Height;
  v126.width = a3;
  v126.height = a4;
  v29.f32[0] = ABPKAdjustIntrinsicsForViewportSize(*(simd_float3x3 *)v99, v126, v127);
  v28 = 0;
  v29.i32[3] = 0;
  v30.i32[3] = 0;
  v31.i32[3] = 0;
  v121 = a15;
  v122[0] = a16;
  v122[1] = a17;
  v122[2] = a18;
  do
  {
    *(float32x4_t *)&buf[v28] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, COERCE_FLOAT(*(_OWORD *)((char *)&v121 + v28))), v30, *(float32x2_t *)&v121.f32[v28 / 4], 1), v31, *(float32x4_t *)((char *)&v121 + v28), 2), (float32x4_t)xmmword_210881530, *(float32x4_t *)((char *)&v121 + v28), 3);
    v28 += 16;
  }
  while (v28 != 64);
  v101 = (float32x4_t)v124[0];
  v102 = *(float32x4_t *)buf;
  v98 = (float32x4_t)v124[2];
  v100 = (float32x4_t)v124[1];
  CVPixelBufferLockBaseAddress(a9, 0);
  CVPixelBufferLockBaseAddress(a10, 0);
  __ABPKLogSharedInstance();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v32, OS_LOG_TYPE_DEBUG, " \t Accessing depth data pointers ", buf, 2u);
  }

  BaseAddress = (const float *)CVPixelBufferGetBaseAddress(a9);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a9);
  v93 = (const float *)CVPixelBufferGetBaseAddress(a10);
  v34 = CVPixelBufferGetBytesPerRow(a10);
  memset(buf, 0, sizeof(buf));
  *(_QWORD *)&v124[0] = 0;
  v121 = 0uLL;
  *(_QWORD *)&v122[0] = 0;
  __p = 0;
  v119 = 0;
  v120 = 0;
  std::vector<float>::reserve((void **)buf, objc_msgSend(v23, "jointCount"));
  std::vector<float>::reserve((void **)&v121, objc_msgSend(v23, "jointCount"));
  std::vector<float>::reserve(&__p, objc_msgSend(v23, "jointCount"));
  __ABPKLogSharedInstance();
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (unint64_t)BytesPerRow >> 2;
  v37 = (unint64_t)v34 >> 2;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v114 = 0;
    _os_log_impl(&dword_210836000, v35, OS_LOG_TYPE_DEBUG, " \t Extracting depth data for the 2d keypoints ", v114, 2u);
  }

  v38 = 0;
  v91 = v124;
  while (objc_msgSend(v23, "jointCount", v91) > v38)
  {
    if (objc_msgSend(v23, "isJointTracked:", v38))
    {
      v44 = (const float *)objc_msgSend(v23, "joints");
      v39 = (float *)&v44[4 * v38];
      *(float *)v40.i32 = v39[1] / 1000.0;
      *(float *)v41.i32 = v39[2] / 1000.0;
      v42 = vaddq_f32(v98, vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v102, *v39 / 1000.0), v101, *(float *)v40.i32), v100, *(float *)v41.i32));
      v43 = vdivq_f32(v42, (float32x4_t)vdupq_laneq_s32((int32x4_t)v42, 2)).u64[0];
      LODWORD(v44) = llroundf(*(float *)&v43);
      if ((v44 & 0x80000000) == 0 && (int)v44 < (int)Width)
      {
        v45 = llroundf(*((float *)&v43 + 1));
        if ((v45 & 0x80000000) == 0 && v45 < v27)
        {
          v95 = v41;
          v96 = v40;
          v97 = *v39 / 1000.0;
          v46 = a10;
          DepthAndConfidenceInNeighborood(v44, v45, BaseAddress, v93, Width, v27, v36, v37);
          v48 = v47;
          v50 = v49;
          v51 = (char *)v121.i64[1];
          if (v121.i64[1] >= *(_QWORD *)&v122[0])
          {
            v53 = (char *)v121.i64[0];
            v54 = (v121.i64[1] - v121.i64[0]) >> 2;
            v55 = v54 + 1;
            if ((unint64_t)(v54 + 1) >> 62)
              goto LABEL_83;
            v56 = *(_QWORD *)&v122[0] - v121.i64[0];
            if ((*(_QWORD *)&v122[0] - v121.i64[0]) >> 1 > v55)
              v55 = v56 >> 1;
            if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFFCLL)
              v57 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v57 = v55;
            if (v57)
            {
              v58 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v122, v57);
              v51 = (char *)v121.i64[1];
              v53 = (char *)v121.i64[0];
            }
            else
            {
              v58 = 0;
            }
            v59 = &v58[4 * v54];
            *(_DWORD *)v59 = v48;
            v52 = v59 + 4;
            while (v51 != v53)
            {
              v60 = *((_DWORD *)v51 - 1);
              v51 -= 4;
              *((_DWORD *)v59 - 1) = v60;
              v59 -= 4;
            }
            v121.i64[0] = (uint64_t)v59;
            v121.i64[1] = (uint64_t)v52;
            *(_QWORD *)&v122[0] = &v58[4 * v57];
            if (v53)
              operator delete(v53);
          }
          else
          {
            *(_DWORD *)v121.i64[1] = v47;
            v52 = v51 + 4;
          }
          v121.i64[1] = (uint64_t)v52;
          v61 = v119;
          if (v119 >= v120)
          {
            v63 = (char *)__p;
            v64 = (v119 - (_BYTE *)__p) >> 2;
            v65 = v64 + 1;
            if ((unint64_t)(v64 + 1) >> 62)
LABEL_83:
              std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
            v66 = v120 - (_BYTE *)__p;
            if ((v120 - (_BYTE *)__p) >> 1 > v65)
              v65 = v66 >> 1;
            if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFFCLL)
              v67 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v67 = v65;
            if (v67)
            {
              v68 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v120, v67);
              v63 = (char *)__p;
              v61 = v119;
            }
            else
            {
              v68 = 0;
            }
            v69 = &v68[4 * v64];
            *(_DWORD *)v69 = v50;
            v62 = v69 + 4;
            while (v61 != v63)
            {
              v70 = *((_DWORD *)v61 - 1);
              v61 -= 4;
              *((_DWORD *)v69 - 1) = v70;
              v69 -= 4;
            }
            __p = v69;
            v119 = v62;
            v120 = &v68[4 * v67];
            if (v63)
              operator delete(v63);
          }
          else
          {
            *(_DWORD *)v119 = v50;
            v62 = v61 + 4;
          }
          v119 = v62;
          v71 = vaddq_f32(a18, vmlaq_f32(vmlaq_f32(vmulq_n_f32(a15, v97), (float32x4_t)vdupq_lane_s32(v96, 0), a16), (float32x4_t)vdupq_lane_s32(v95, 0), a17));
          v72 = v71.i32[2];
          v73 = *(char **)&buf[8];
          if (*(_QWORD *)&buf[8] >= *(_QWORD *)&v124[0])
          {
            v75 = *(char **)buf;
            v76 = (uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 2;
            v77 = v76 + 1;
            if ((unint64_t)(v76 + 1) >> 62)
              std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
            v78 = *(_QWORD *)&v124[0] - *(_QWORD *)buf;
            if ((uint64_t)(*(_QWORD *)&v124[0] - *(_QWORD *)buf) >> 1 > v77)
              v77 = v78 >> 1;
            if ((unint64_t)v78 >= 0x7FFFFFFFFFFFFFFCLL)
              v79 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v79 = v77;
            if (v79)
            {
              v80 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v91, v79);
              v75 = *(char **)buf;
              v73 = *(char **)&buf[8];
            }
            else
            {
              v80 = 0;
            }
            v81 = (__int32 *)&v80[4 * v76];
            *v81 = v72;
            v74 = v81 + 1;
            while (v73 != v75)
            {
              v82 = *((_DWORD *)v73 - 1);
              v73 -= 4;
              *--v81 = v82;
            }
            *(_QWORD *)buf = v81;
            *(_QWORD *)&buf[8] = v74;
            *(_QWORD *)&v124[0] = &v80[4 * v79];
            if (v75)
              operator delete(v75);
          }
          else
          {
            **(_DWORD **)&buf[8] = v71.i32[2];
            v74 = v73 + 4;
          }
          *(_QWORD *)&buf[8] = v74;
          a10 = v46;
        }
      }
    }
    ++v38;
  }
  CVPixelBufferUnlockBaseAddress(a9, 0);
  CVPixelBufferUnlockBaseAddress(a10, 0);
  __ABPKLogSharedInstance();
  v83 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v114 = 0;
    _os_log_impl(&dword_210836000, v83, OS_LOG_TYPE_DEBUG, " \t Performing optimization ", v114, 2u);
  }

  *(_DWORD *)v114 = (*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 2;
  v115 = *(_QWORD *)buf;
  v116 = *(_DWORD *)v114;
  v117 = 0;
  v110 = (unint64_t)(v121.i64[1] - v121.i64[0]) >> 2;
  v111 = v121.i64[0];
  v112 = v110;
  v113 = 0;
  v106 = (unint64_t)(v119 - (_BYTE *)__p) >> 2;
  v107 = __p;
  v108 = v106;
  v109 = 0;
  v104 = v114;
  v105 = (uint8_t *)&v106;
  cva::MatrixRef<float,0u,1u,false>::operator=<cva::MatrixBinaryExpr<cva::MatrixRef<float,0u,1u,false>,cva::MatrixRef<float,0u,1u,false>,cva::detail::MulOp>>((unsigned int *)v114, &v104);
  v104 = (uint8_t *)&v110;
  v105 = (uint8_t *)&v106;
  cva::MatrixRef<float,0u,1u,false>::operator=<cva::MatrixBinaryExpr<cva::MatrixRef<float,0u,1u,false>,cva::MatrixRef<float,0u,1u,false>,cva::detail::MulOp>>(&v110, &v104);
  v103 = v114;
  if (*(_DWORD *)v114 != v110)
    __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
  v104 = (uint8_t *)&v103;
  v105 = (uint8_t *)&v110;
  v125[0] = 0.0;
  cva::assign<false,false,cva::Matrix<float,1u,1u,false>,cva::MatrixTransposeExpr<cva::MatrixRef<float,0u,1u,false>>,cva::MatrixRef<float,0u,1u,false>>(v125, (uint64_t)&v104, v84);
  v85 = v125[0];
  v103 = v114;
  v104 = (uint8_t *)&v103;
  v105 = v114;
  v125[0] = 0.0;
  cva::assign<false,false,cva::Matrix<float,1u,1u,false>,cva::MatrixTransposeExpr<cva::MatrixRef<float,0u,1u,false>>,cva::MatrixRef<float,0u,1u,false>>(v125, (uint64_t)&v104, v86);
  v87 = -1.0;
  if (v85 > 0.0 && v125[0] > 0.0)
  {
    v88 = v85 + *(float *)(a1 + 16);
    v89 = v125[0] + *(float *)(a1 + 20);
    *(float *)(a1 + 16) = v88;
    *(float *)(a1 + 20) = v89;
    *(double *)(a1 + 8) = a2;
    v87 = v88 / v89;
  }
  if (__p)
  {
    v119 = (char *)__p;
    operator delete(__p);
  }
  if (v121.i64[0])
  {
    v121.i64[1] = v121.i64[0];
    operator delete((void *)v121.i64[0]);
  }
  if (*(_QWORD *)buf)
  {
    *(_QWORD *)&buf[8] = *(_QWORD *)buf;
    operator delete(*(void **)buf);
  }

  return v87;
}

- (float)estimateScaleFromJasperCloud:(float32x4_t)a3 cameraFromBodyPose:(float32x4_t)a4 liftingResult:(float32x4_t)a5
{
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  float32x2_t *v16;
  float32x2_t v17;
  float32x2_t *v18;
  float32x2_t v19;
  float v20;
  float32x2_t *v21;
  float32x2_t v22;
  float v23;
  float v24;
  float *v25;
  float *v26;
  float *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  float *v33;
  int v34;
  char *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  char *v43;
  int v44;
  float *v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  float v51;
  uint64_t v52;
  float v53;
  float v54;
  float v55;
  unint64_t v56;
  id v58;
  int32x4_t v63;
  int *v64;
  uint8_t v65[8];
  int *v66;
  int v67;
  void *v68;
  int v69;
  int v70;
  int v71;
  char *v72;
  int v73;
  int v74;
  uint64_t v75;
  void *__p;
  float *v77;
  float *v78;
  char *v79;
  char *v80;
  char *v81;
  uint8_t buf[8];
  float32x2_t *v83;
  float v84[3];

  v10 = a7;
  v11 = a8;
  v58 = v10;
  __ABPKLogSharedInstance();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v12, OS_LOG_TYPE_DEBUG, " ABPKDepthBasedScaleEstimation: Estimating scale from Jasper point cloud data ", buf, 2u);
  }

  ExtractJasperNSZs(v10, (char **)buf);
  v13 = 0;
  v79 = 0;
  v80 = 0;
  v81 = 0;
  __p = 0;
  v77 = 0;
  v75 = 0x700000000;
  v78 = 0;
  do
  {
    v14 = *((int *)&v75 + v13);
    if ((objc_msgSend(v11, "isJointTracked:", v14) & 1) != 0)
    {
      v15 = objc_msgSend(v11, "joints");
      v16 = *(float32x2_t **)buf;
      if (*(float32x2_t **)buf != v83)
      {
        v63 = (int32x4_t)vaddq_f32(a5, vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(a2, *(float *)(v15 + 16 * v14) / 1000.0), a3, *(float *)(v15 + 16 * v14 + 4) / 1000.0), a4, *(float *)(v15 + 16 * v14 + 8) / 1000.0));
        v17 = vdiv_f32(*(float32x2_t *)v63.i8, (float32x2_t)vdup_laneq_s32(v63, 2));
        v18 = (float32x2_t *)(*(_QWORD *)buf + 16);
        v19 = vsub_f32(**(float32x2_t **)buf, v17);
        v20 = vaddv_f32(vmul_f32(v19, v19));
        if ((float32x2_t *)(*(_QWORD *)buf + 16) != v83)
        {
          do
          {
            v21 = v18 + 2;
            v22 = vsub_f32(*v18, v17);
            v23 = vaddv_f32(vmul_f32(v22, v22));
            if (v23 < v20)
            {
              v16 = v18;
              v20 = v23;
            }
            v18 += 2;
          }
          while (v21 != v83);
        }
        if (sqrtf(v20) <= 0.03)
        {
          v24 = v16[1].f32[0];
          if (v24 > 0.0)
          {
            v25 = v77;
            if (v77 >= v78)
            {
              v27 = (float *)__p;
              v28 = ((char *)v77 - (_BYTE *)__p) >> 2;
              v29 = v28 + 1;
              if ((unint64_t)(v28 + 1) >> 62)
                std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
              v30 = (char *)v78 - (_BYTE *)__p;
              if (((char *)v78 - (_BYTE *)__p) >> 1 > v29)
                v29 = v30 >> 1;
              if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFFCLL)
                v31 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v31 = v29;
              if (v31)
              {
                v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v78, v31);
                v27 = (float *)__p;
                v25 = v77;
              }
              else
              {
                v32 = 0;
              }
              v33 = (float *)&v32[4 * v28];
              *v33 = v24;
              v26 = v33 + 1;
              while (v25 != v27)
              {
                v34 = *((_DWORD *)v25-- - 1);
                *((_DWORD *)v33-- - 1) = v34;
              }
              __p = v33;
              v77 = v26;
              v78 = (float *)&v32[4 * v31];
              if (v27)
                operator delete(v27);
            }
            else
            {
              *v77 = v24;
              v26 = v25 + 1;
            }
            v77 = v26;
            v35 = v80;
            if (v80 >= v81)
            {
              v37 = v79;
              v38 = (v80 - v79) >> 2;
              v39 = v38 + 1;
              if ((unint64_t)(v38 + 1) >> 62)
                std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
              v40 = v81 - v79;
              if ((v81 - v79) >> 1 > v39)
                v39 = v40 >> 1;
              if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFFCLL)
                v41 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v41 = v39;
              if (v41)
              {
                v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v81, v41);
                v37 = v79;
                v35 = v80;
              }
              else
              {
                v42 = 0;
              }
              v43 = &v42[4 * v38];
              *(_DWORD *)v43 = v63.i32[2];
              v36 = v43 + 4;
              while (v35 != v37)
              {
                v44 = *((_DWORD *)v35 - 1);
                v35 -= 4;
                *((_DWORD *)v43 - 1) = v44;
                v43 -= 4;
              }
              v79 = v43;
              v80 = v36;
              v81 = &v42[4 * v41];
              if (v37)
                operator delete(v37);
            }
            else
            {
              *(_DWORD *)v80 = v63.i32[2];
              v36 = v35 + 4;
            }
            v80 = v36;
          }
        }
      }
    }
    ++v13;
  }
  while (v13 != 2);
  v45 = (float *)__p;
  if (__p == v77)
  {
    v53 = -1.0;
  }
  else
  {
    v46 = (unint64_t)(v80 - v79) >> 2;
    v70 = 0;
    v71 = v46;
    v72 = v79;
    v73 = v46;
    v74 = 0;
    v47 = (unint64_t)((char *)v77 - (_BYTE *)__p) >> 2;
    v67 = v47;
    v68 = __p;
    v69 = v47;
    if ((_DWORD)v47)
    {
      v48 = 4 * ((unint64_t)((char *)v77 - (_BYTE *)__p) >> 2);
      do
      {
        *v45 = *v45 + 0.1;
        ++v45;
        v48 -= 4;
      }
      while (v48);
    }
    __ABPKLogSharedInstance();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v65 = 0;
      _os_log_impl(&dword_210836000, v49, OS_LOG_TYPE_DEBUG, " \t Performing optimization ", v65, 2u);
    }

    v64 = &v71;
    if ((_DWORD)v46 != (_DWORD)v47)
      __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
    *(_QWORD *)v65 = &v64;
    v66 = &v67;
    v84[0] = 0.0;
    cva::assign<false,false,cva::Matrix<float,1u,1u,false>,cva::MatrixTransposeExpr<cva::MatrixRef<float,0u,1u,false>>,cva::MatrixRef<float,0u,1u,false>>(v84, (uint64_t)v65, v50);
    v51 = v84[0];
    v64 = &v71;
    *(_QWORD *)v65 = &v64;
    v66 = &v71;
    v84[0] = 0.0;
    cva::assign<false,false,cva::Matrix<float,1u,1u,false>,cva::MatrixTransposeExpr<cva::MatrixRef<float,0u,1u,false>>,cva::MatrixRef<float,0u,1u,false>>(v84, (uint64_t)v65, v52);
    v53 = -1.0;
    v45 = (float *)__p;
    v10 = v58;
    if (v51 > 0.0 && v84[0] > 0.0)
    {
      v54 = v51 + *(float *)(a1 + 16);
      v55 = v84[0] + *(float *)(a1 + 20);
      *(float *)(a1 + 16) = v54;
      *(float *)(a1 + 20) = v55;
      v56 = *(_QWORD *)(a1 + 24) + v77 - v45;
      *(_QWORD *)(a1 + 24) = v56;
      if (v56 >= 8)
        v53 = v54 / v55;
    }
  }
  if (v45)
  {
    v77 = v45;
    operator delete(v45);
  }
  if (v79)
  {
    v80 = v79;
    operator delete(v79);
  }
  if (*(_QWORD *)buf)
  {
    v83 = *(float32x2_t **)buf;
    operator delete(*(void **)buf);
  }

  return v53;
}

@end
