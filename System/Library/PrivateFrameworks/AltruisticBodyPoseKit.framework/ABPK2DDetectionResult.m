@implementation ABPK2DDetectionResult

- (ABPK2DDetectionResult)initWithJoints:(ABPK2DDetectionResult *)self trackingStates:(SEL)a2 numberOfJoints:rotation:croppedRect:liftingData:
{
  const void *v2;
  const void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  const void *v14;
  const void *v15;
  id v17;
  char *v18;
  void *v19;
  void *v20;
  float64x2_t v21;
  float64x2_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  float v26;
  __float2 v27;
  char **v28;
  uint64_t v29;
  unint64_t v30;
  float32x2_t v31;
  _QWORD *v32;
  float32x2_t *v33;
  float32x2_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  float32x2_t *v40;
  char *v41;
  char *v42;
  float32x2_t v43;
  float64_t v45;
  float64_t v46;
  float64_t v47;
  float32x2_t v48;
  float64_t v49;
  __int128 v50;
  uint64_t v51;
  objc_super v52;

  v11 = v6;
  v45 = v10;
  v46 = v8;
  v47 = v7;
  v49 = v9;
  v12 = v5;
  v13 = v4;
  v14 = v3;
  v15 = v2;
  v17 = v6;
  v52.receiver = self;
  v52.super_class = (Class)ABPK2DDetectionResult;
  v18 = -[ABPK2DDetectionResult init](&v52, sel_init);
  if (v18)
  {
    v50 = 0uLL;
    v51 = 0;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v50, v15, (uint64_t)v15 + 8 * v13, v13);
    v19 = (void *)*((_QWORD *)v18 + 1);
    if (v19)
    {
      *((_QWORD *)v18 + 2) = v19;
      operator delete(v19);
      *((_QWORD *)v18 + 1) = 0;
      *((_QWORD *)v18 + 2) = 0;
      *((_QWORD *)v18 + 3) = 0;
    }
    *(_OWORD *)(v18 + 8) = v50;
    *((_QWORD *)v18 + 3) = v51;
    v50 = 0uLL;
    v51 = 0;
    std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(&v50, v14, (uint64_t)v14 + 4 * v13, v13);
    v20 = (void *)*((_QWORD *)v18 + 7);
    if (v20)
    {
      *((_QWORD *)v18 + 8) = v20;
      operator delete(v20);
      *((_QWORD *)v18 + 7) = 0;
      *((_QWORD *)v18 + 8) = 0;
      *((_QWORD *)v18 + 9) = 0;
    }
    v21.f64[0] = v49;
    *(_OWORD *)(v18 + 56) = v50;
    *((_QWORD *)v18 + 9) = v51;
    v21.f64[1] = v45;
    v22.f64[0] = v47;
    v22.f64[1] = v46;
    if (v12 == 90 || v12 == -90)
    {
      v21 = (float64x2_t)vextq_s8((int8x16_t)v21, (int8x16_t)v21, 8uLL);
      v22 = (float64x2_t)vextq_s8((int8x16_t)v22, (int8x16_t)v22, 8uLL);
    }
    v23 = *((_QWORD *)v18 + 1);
    if (*((_QWORD *)v18 + 2) != v23)
    {
      v24 = 0;
      do
      {
        *(float32x2_t *)(v23 + 8 * v24) = vcvt_f32_f64(vmlaq_f64(v22, v21, vcvtq_f64_f32(*(float32x2_t *)(v23 + 8 * v24))));
        ++v24;
        v23 = *((_QWORD *)v18 + 1);
      }
      while (v24 < (*((_QWORD *)v18 + 2) - v23) >> 3);
    }
    *((_QWORD *)v18 + 13) = v12;
    objc_storeStrong((id *)v18 + 12, v11);
    v25 = *((_QWORD *)v18 + 13);
    if (v25)
    {
      v26 = (double)v25 * 3.14159265 / 180.0;
      v27 = __sincosf_stret(v26);
      v28 = (char **)(v18 + 32);
      _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE7reserveEm((void **)v18 + 4, (uint64_t)(*((_QWORD *)v18 + 2) - *((_QWORD *)v18 + 1)) >> 3);
      v29 = *((_QWORD *)v18 + 1);
      if (*((_QWORD *)v18 + 2) != v29)
      {
        v30 = 0;
        v31.f32[0] = -v27.__sinval;
        v31.i32[1] = LODWORD(v27.__cosval);
        v48 = v31;
        v32 = v18 + 48;
        v33 = (float32x2_t *)*((_QWORD *)v18 + 5);
        do
        {
          v34 = vadd_f32(vmla_n_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v27.__sinval), LODWORD(v27.__cosval)), COERCE_FLOAT(*(_QWORD *)(v29 + 8 * v30)) + -0.5), v48, COERCE_FLOAT(HIDWORD(*(_QWORD *)(v29 + 8 * v30))) + -0.5), (float32x2_t)0x3F0000003F000000);
          if ((unint64_t)v33 >= *v32)
          {
            v35 = ((char *)v33 - *v28) >> 3;
            if ((unint64_t)(v35 + 1) >> 61)
              std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
            v36 = *v32 - (_QWORD)*v28;
            v37 = v36 >> 2;
            if (v36 >> 2 <= (unint64_t)(v35 + 1))
              v37 = v35 + 1;
            if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF8)
              v38 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v38 = v37;
            if (v38)
              v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v18 + 48), v38);
            else
              v39 = 0;
            v40 = (float32x2_t *)&v39[8 * v35];
            *v40 = v34;
            v33 = v40 + 1;
            v42 = (char *)*((_QWORD *)v18 + 4);
            v41 = (char *)*((_QWORD *)v18 + 5);
            if (v41 != v42)
            {
              do
              {
                v43 = *(float32x2_t *)(v41 - 8);
                v41 -= 8;
                v40[-1] = v43;
                --v40;
              }
              while (v41 != v42);
              v41 = *v28;
            }
            *((_QWORD *)v18 + 4) = v40;
            *((_QWORD *)v18 + 5) = v33;
            *((_QWORD *)v18 + 6) = &v39[8 * v38];
            if (v41)
              operator delete(v41);
          }
          else
          {
            *v33++ = v34;
          }
          *((_QWORD *)v18 + 5) = v33;
          ++v30;
          v29 = *((_QWORD *)v18 + 1);
        }
        while (v30 < (*((_QWORD *)v18 + 2) - v29) >> 3);
      }
    }
    else
    {
      _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(v18 + 32, *((char **)v18 + 1), *((_QWORD *)v18 + 2), (uint64_t)(*((_QWORD *)v18 + 2) - *((_QWORD *)v18 + 1)) >> 3);
    }
  }

  return (ABPK2DDetectionResult *)v18;
}

- (ABPK2DDetectionResult)initWithJoints:(ABPK2DDetectionResult *)self trackingStates:(SEL)a2 numberOfJoints:imageResolution:rotation:croppedRect:liftingData:
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  ABPK2DDetectionResult *result;

  v8 = v3;
  v9 = v2;
  result = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:](self, "initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:", v4, v5, v6, v7);
  if (result)
  {
    result->_imageResolution.width = v9;
    result->_imageResolution.height = v8;
  }
  return result;
}

- (uint64_t)rawJointsOutput
{
  return *(_QWORD *)(a1 + 8);
}

- (uint64_t)joints
{
  return *(_QWORD *)(a1 + 32);
}

- (const)jointTrackingStates
{
  return self->_jointTrackingStates.__begin_;
}

- (unint64_t)jointCount
{
  return (uint64_t)(*(_QWORD *)self->_anon_10 - (unint64_t)self->_rawJoints.var0) >> 3;
}

- (unint64_t)trackedJointCount
{
  unsigned int *begin;
  unsigned int *end;
  int v4;
  int v5;

  begin = self->_jointTrackingStates.__begin_;
  end = self->_jointTrackingStates.__end_;
  if (begin == end)
    return 0;
  v4 = 0;
  do
  {
    v5 = *begin++;
    v4 += v5;
  }
  while (begin != end);
  return v4;
}

- (ABPK2DDetectionResult)initWithJoints:(ABPK2DDetectionResult *)self trackingStates:(SEL)a2 numberOfJoints:aligningPreviousSkeleton:rotation:
{
  uint64_t v2;
  int *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int *v9;
  uint64_t v10;
  id v12;
  char *v13;
  int v14;
  uint64_t v15;
  int *v16;
  int v17;
  int v18;
  int v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _DWORD *v23;
  uint64_t v24;
  unint64_t v25;
  unsigned int v26;
  unsigned int v27;
  _DWORD *v28;
  int v29;
  int v30;
  unsigned int v31;
  _DWORD *v32;
  _DWORD *v33;
  float *v34;
  const char *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  char **v39;
  float32x4_t v40;
  uint64_t v41;
  unint64_t v42;
  int32x2_t v43;
  uint64_t v44;
  float32x4_t v45;
  int16x4_t v46;
  unint64_t v47;
  int32x2_t *v48;
  int32x2_t *v49;
  unint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int32x2_t *v60;
  char *v61;
  char *v62;
  int32x2_t v63;
  char *v64;
  int32x2_t v65;
  float v66;
  __float2 v67;
  char **v68;
  float32x2_t v69;
  uint64_t v70;
  unint64_t v71;
  _QWORD *v72;
  float32x2_t *v73;
  float32x2_t v74;
  float32x2_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  char *v80;
  float32x2_t *v81;
  char *v82;
  char *v83;
  float32x2_t v84;
  uint64_t v85;
  float32x2_t v86;
  float32x2_t v87;
  uint64_t v88;
  float32x2_t v89;
  float32x2_t v90;
  uint64_t v91;
  float32x2_t v92;
  float32x2_t v93;
  ABPK2DDetectionResult *v94;
  const void *v95;
  uint64_t v96;
  void *v97;
  int v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  float32x4_t v103;
  float32x2_t v104;
  float32x4_t v105;
  void **v106;
  void **v107;
  _QWORD v108[2];
  simd_float4x4 v109;
  simd_float4x4 v110;
  _QWORD v111[2];
  _QWORD v112[2];
  float32x4_t v113;
  void *v114[2];
  unsigned int v115;
  void *v116[2];
  int v117;
  objc_super v118;

  v7 = v6;
  v8 = v4;
  v9 = v3;
  v10 = v2;
  v12 = v5;
  v118.receiver = self;
  v118.super_class = (Class)ABPK2DDetectionResult;
  v13 = -[ABPK2DDetectionResult init](&v118, sel_init);
  if (!v13)
  {
LABEL_86:
    v94 = v13;
    goto LABEL_87;
  }
  v14 = 0;
  if (v8)
  {
    v15 = 4 * v8;
    v16 = v9;
    do
    {
      v17 = *v16++;
      v14 += v17;
      v15 -= 4;
    }
    while (v15);
  }
  v18 = objc_msgSend(v12, "trackedJointCount");
  v116[0] = 0;
  v116[1] = 0;
  if (v14 >= v18)
    v19 = v18;
  else
    v19 = v14;
  v20 = (2 * v19);
  v117 = 2 * v19;
  cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)v116, (8 * v19));
  v114[0] = 0;
  v114[1] = 0;
  v115 = v20;
  cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)v114, v20);
  v21 = objc_msgSend(v12, "rawJointsOutput");
  v22 = objc_msgSend(v12, "jointCount");
  v23 = (_DWORD *)objc_msgSend(v12, "jointTrackingStates");
  if (v8 >= v22)
    v25 = v22;
  else
    v25 = v8;
  if (v25)
  {
    v26 = 0;
    v27 = v117;
    v28 = v116[0];
    v29 = 2 * v117;
    v30 = 3 * v117;
    v31 = v115;
    v32 = v114[0];
    v33 = (_DWORD *)(v10 + 4);
    v34 = (float *)(v21 + 4);
    v35 = "((row < mixed().rows()) && (col < mixed().columns())) || cva::detail::assertMessage(\"Index out of bounds!\")";
    v24 = 1065353216;
    do
    {
      v36 = *v9++;
      if (v36 && *v23)
      {
        if (v27 <= v26
          || (v28[v26] = *(_QWORD *)(v34 - 1),
              *(float *)&v28[v27 + v26] = -*v34,
              v28[v29 + v26] = 1065353216,
              v28[v30 + v26] = 0,
              v37 = v26 + 1,
              v27 <= v37))
        {
          v99 = 2269;
          goto LABEL_90;
        }
        v28[v37] = *(_DWORD *)v34;
        v28[v27 + v37] = *(_QWORD *)(v34 - 1);
        v28[(v29 + v37)] = 0;
        v28[(v30 + v37)] = 1065353216;
        if (v31 <= v26 || (v32[v26] = *(_QWORD *)(v33 - 1), v31 <= v37))
        {
          v99 = 2283;
          v35 = "(i < mixed().elements()) || cva::detail::assertMessage(\"Index out of bounds!\")";
LABEL_90:
          __assert_rtn("assert_in_bounds", "matrixmixin.h", v99, v35);
        }
        v32[v37] = *v33;
        v26 += 2;
      }
      v33 += 2;
      v34 += 2;
      ++v23;
      --v25;
    }
    while (v25);
  }
  v107 = v116;
  v108[0] = &v107;
  v108[1] = v116;
  memset(&v109, 0, sizeof(v109));
  cva::assign<false,false,cva::Matrix<float,4u,4u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,4u,false> const>,cva::Matrix<float,0u,4u,false>>((uint64_t)&v109, (uint64_t)v108, v24);
  cva::inv<cva::Matrix<float,4u,4u,false>,4u,true,float>(&v109, &v110);
  v106 = v116;
  v111[0] = &v110;
  v111[1] = &v106;
  if (v117 != v115)
    __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
  v112[0] = v111;
  v112[1] = v114;
  v113 = 0uLL;
  cva::assign<false,false,cva::Matrix<float,4u,1u,false>,cva::MatrixMultExpr<cva::Matrix<float,4u,4u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,4u,false> const>>,cva::Matrix<float,0u,1u,false>>(&v113, (uint64_t)v112);
  v100 = v10;
  v101 = v7;
  v38 = v113.i64[0];
  v39 = (char **)(v13 + 8);
  v40.i64[0] = v113.i64[1];
  v105 = v40;
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE7reserveEm((void **)v13 + 1, v22);
  if (v22)
  {
    v41 = 0;
    *(float *)&v42 = -*((float *)&v38 + 1);
    HIDWORD(v42) = v38;
    v103 = (float32x4_t)v42;
    v43 = vdup_n_s32(0x7FC00000u);
    do
    {
      v44 = vaddq_f32(v105, vmlaq_lane_f32(vmulq_n_f32((float32x4_t)(unint64_t)v38, COERCE_FLOAT(*(_QWORD *)(v21 + 8 * v41))), v103, *(float32x2_t *)(v21 + 8 * v41), 1)).u64[0];
      v45 = (float32x4_t)vdupq_lane_s64(v44, 0);
      v46.i32[0] = vmovn_s32(vcgtq_f32(v45, (float32x4_t)xmmword_210881980)).u32[0];
      v46.i32[1] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_210881980, v45)).i32[1];
      if ((vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v46, 0xFuLL))) & 1) != 0)
      {
        v48 = (int32x2_t *)*((_QWORD *)v13 + 2);
        v47 = *((_QWORD *)v13 + 3);
        if ((unint64_t)v48 >= v47)
        {
          v52 = ((char *)v48 - *v39) >> 3;
          if ((unint64_t)(v52 + 1) >> 61)
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          v53 = v47 - (_QWORD)*v39;
          v54 = v53 >> 2;
          if (v53 >> 2 <= (unint64_t)(v52 + 1))
            v54 = v52 + 1;
          if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFF8)
            v55 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v55 = v54;
          if (v55)
            v56 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v13 + 24), v55);
          else
            v56 = 0;
          v60 = (int32x2_t *)&v56[8 * v52];
          *v60 = v43;
          v49 = v60 + 1;
          v62 = (char *)*((_QWORD *)v13 + 1);
          v61 = (char *)*((_QWORD *)v13 + 2);
          if (v61 != v62)
          {
            do
            {
              v63 = *(int32x2_t *)(v61 - 8);
              v61 -= 8;
              v60[-1] = v63;
              --v60;
            }
            while (v61 != v62);
            goto LABEL_52;
          }
          goto LABEL_53;
        }
        *v48 = v43;
        v49 = v48 + 1;
      }
      else
      {
        v102 = v44;
        v51 = (uint64_t *)*((_QWORD *)v13 + 2);
        v50 = *((_QWORD *)v13 + 3);
        if ((unint64_t)v51 >= v50)
        {
          v57 = ((char *)v51 - *v39) >> 3;
          if ((unint64_t)(v57 + 1) >> 61)
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          v58 = v50 - (_QWORD)*v39;
          v59 = v58 >> 2;
          if (v58 >> 2 <= (unint64_t)(v57 + 1))
            v59 = v57 + 1;
          if ((unint64_t)v58 >= 0x7FFFFFFFFFFFFFF8)
            v55 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v55 = v59;
          if (v55)
            v56 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v13 + 24), v55);
          else
            v56 = 0;
          v60 = (int32x2_t *)&v56[8 * v57];
          *v60 = (int32x2_t)v102;
          v49 = v60 + 1;
          v64 = (char *)*((_QWORD *)v13 + 1);
          v61 = (char *)*((_QWORD *)v13 + 2);
          if (v61 != v64)
          {
            do
            {
              v65 = *(int32x2_t *)(v61 - 8);
              v61 -= 8;
              v60[-1] = v65;
              --v60;
            }
            while (v61 != v64);
LABEL_52:
            v61 = *v39;
          }
LABEL_53:
          *((_QWORD *)v13 + 1) = v60;
          *((_QWORD *)v13 + 2) = v49;
          *((_QWORD *)v13 + 3) = &v56[8 * v55];
          if (v61)
            operator delete(v61);
          goto LABEL_55;
        }
        *v51 = v44;
        v49 = (int32x2_t *)(v51 + 1);
      }
LABEL_55:
      *((_QWORD *)v13 + 2) = v49;
      ++v41;
    }
    while (v41 != v22);
  }
  if (-[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:aligningPreviousSkeleton:rotation:]::onceToken != -1)
    dispatch_once(&-[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:aligningPreviousSkeleton:rotation:]::onceToken, &__block_literal_global_0);
  if (v101)
  {
    v66 = (double)v101 * 3.14159265 / 180.0;
    v67 = __sincosf_stret(v66);
    v68 = (char **)(v13 + 32);
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE7reserveEm((void **)v13 + 4, (uint64_t)(*((_QWORD *)v13 + 2) - *((_QWORD *)v13 + 1)) >> 3);
    v69.f32[0] = -v67.__sinval;
    v69.i32[1] = LODWORD(v67.__cosval);
    v104 = v69;
    v70 = *((_QWORD *)v13 + 1);
    if (*((_QWORD *)v13 + 2) != v70)
    {
      v71 = 0;
      v72 = v13 + 48;
      v73 = (float32x2_t *)*((_QWORD *)v13 + 5);
      do
      {
        v74 = vadd_f32(*(float32x2_t *)(v70 + 8 * v71), (float32x2_t)0xBF000000BF000000);
        v75 = vadd_f32(vmla_lane_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v67.__sinval), LODWORD(v67.__cosval)), v74.f32[0]), v104, v74, 1), (float32x2_t)0x3F0000003F000000);
        if ((unint64_t)v73 >= *v72)
        {
          v76 = ((char *)v73 - *v68) >> 3;
          if ((unint64_t)(v76 + 1) >> 61)
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          v77 = *v72 - (_QWORD)*v68;
          v78 = v77 >> 2;
          if (v77 >> 2 <= (unint64_t)(v76 + 1))
            v78 = v76 + 1;
          if ((unint64_t)v77 >= 0x7FFFFFFFFFFFFFF8)
            v79 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v79 = v78;
          if (v79)
            v80 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v13 + 48), v79);
          else
            v80 = 0;
          v81 = (float32x2_t *)&v80[8 * v76];
          *v81 = v75;
          v73 = v81 + 1;
          v83 = (char *)*((_QWORD *)v13 + 4);
          v82 = (char *)*((_QWORD *)v13 + 5);
          if (v82 != v83)
          {
            do
            {
              v84 = *(float32x2_t *)(v82 - 8);
              v82 -= 8;
              v81[-1] = v84;
              --v81;
            }
            while (v82 != v83);
            v82 = *v68;
          }
          *((_QWORD *)v13 + 4) = v81;
          *((_QWORD *)v13 + 5) = v73;
          *((_QWORD *)v13 + 6) = &v80[8 * v79];
          if (v82)
            operator delete(v82);
        }
        else
        {
          *v73++ = v75;
        }
        *((_QWORD *)v13 + 5) = v73;
        ++v71;
        v70 = *((_QWORD *)v13 + 1);
      }
      while (v71 < (*((_QWORD *)v13 + 2) - v70) >> 3);
    }
    v85 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:aligningPreviousSkeleton:rotation:]::rootIndex;
    v86 = vadd_f32(*(float32x2_t *)(v100+ 8* -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:aligningPreviousSkeleton:rotation:]::rootIndex), (float32x2_t)0xBF000000BF000000);
    v87 = vadd_f32(vmla_lane_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v67.__sinval), LODWORD(v67.__cosval)), v86.f32[0]), v104, v86, 1), (float32x2_t)0x3F0000003F000000);
    v88 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:aligningPreviousSkeleton:rotation:]::neckIndex;
    v89 = vadd_f32(*(float32x2_t *)(v100+ 8* -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:aligningPreviousSkeleton:rotation:]::neckIndex), (float32x2_t)0xBF000000BF000000);
    v90 = vadd_f32(vmla_lane_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v67.__sinval), LODWORD(v67.__cosval)), v89.f32[0]), v104, v89, 1), (float32x2_t)0x3F0000003F000000);
  }
  else
  {
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(v13 + 32, *((char **)v13 + 1), *((_QWORD *)v13 + 2), (uint64_t)(*((_QWORD *)v13 + 2) - *((_QWORD *)v13 + 1)) >> 3);
    v85 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:aligningPreviousSkeleton:rotation:]::rootIndex;
    v87 = *(float32x2_t *)(v100
                         + 8
                         * -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:aligningPreviousSkeleton:rotation:]::rootIndex);
    v88 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:aligningPreviousSkeleton:rotation:]::neckIndex;
    v90 = *(float32x2_t *)(v100
                         + 8
                         * -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:aligningPreviousSkeleton:rotation:]::neckIndex);
  }
  v91 = *((_QWORD *)v13 + 4);
  v92 = vsub_f32(v87, *(float32x2_t *)(v91 + 8 * v85));
  if (sqrtf(vaddv_f32(vmul_f32(v92, v92))) <= 0.05)
  {
    v93 = vsub_f32(v90, *(float32x2_t *)(v91 + 8 * v88));
    if (sqrtf(vaddv_f32(vmul_f32(v93, v93))) <= 0.05)
    {
      v95 = (const void *)objc_msgSend(v12, "jointTrackingStates");
      v96 = objc_msgSend(v12, "jointTrackingStates");
      memset(&v110, 0, 24);
      std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(&v110, v95, v96 + 4 * v22, (uint64_t)(v96 + 4 * v22 - (_QWORD)v95) >> 2);
      v97 = (void *)*((_QWORD *)v13 + 7);
      if (v97)
      {
        *((_QWORD *)v13 + 8) = v97;
        operator delete(v97);
        *((_QWORD *)v13 + 7) = 0;
        *((_QWORD *)v13 + 8) = 0;
        *((_QWORD *)v13 + 9) = 0;
      }
      *(simd_float4 *)(v13 + 56) = v110.columns[0];
      *((_QWORD *)v13 + 9) = v110.columns[1].i64[0];
      *((_QWORD *)v13 + 13) = v101;
      free(v114[0]);
      free(v116[0]);
      goto LABEL_86;
    }
  }
  free(v114[0]);
  free(v116[0]);
  v94 = 0;
LABEL_87:

  return v94;
}

void __104__ABPK2DDetectionResult_initWithJoints_trackingStates_numberOfJoints_aligningPreviousSkeleton_rotation___block_invoke()
{
  ABPKSkeletonDefinition *v0;

  v0 = -[ABPKSkeletonDefinition initWithType:]([ABPKSkeletonDefinition alloc], "initWithType:", 0);
  -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:aligningPreviousSkeleton:rotation:]::rootIndex = -[ABPKSkeletonDefinition indexOfJointWithName:](v0, "indexOfJointWithName:", CFSTR("root"));
  -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:aligningPreviousSkeleton:rotation:]::neckIndex = -[ABPKSkeletonDefinition indexOfJointWithName:](v0, "indexOfJointWithName:", CFSTR("neck"));

}

- (id)alignSkeleton:(id)a3 rotationNeeded:(int64_t)a4
{
  id v6;
  int v7;
  int v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  unsigned int v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  _DWORD *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  _DWORD *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  float32x4_t v29;
  unint64_t v30;
  float32x4_t v31;
  unint64_t v32;
  unint64_t v33;
  int32x2_t v34;
  uint64_t v35;
  float32x4_t v36;
  float32x4_t v37;
  int16x4_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char *v45;
  uint64_t v46;
  unint64_t v47;
  int32x2_t *v48;
  char *v49;
  uint64_t v50;
  int32x2_t v51;
  uint64_t v52;
  int32x2_t v53;
  ABPK2DDetectionResult *v54;
  uint64_t v55;
  uint64_t v56;
  ABPK2DDetectionResult *v57;
  ABPKSkeletonDefinition *v58;
  uint64_t v59;
  uint64_t v60;
  float32x2_t v61;
  float32x2_t v62;
  float32x2_t v63;
  uint64_t v64;
  float32x2_t v65;
  float32x2_t v66;
  ABPK2DDetectionResult *v67;
  int v69;
  float32x4_t v70;
  float32x4_t v71;
  float32x4_t v72;
  void **v73;
  void **v74;
  _QWORD v75[2];
  simd_float4x4 v76;
  simd_float4x4 __p;
  _QWORD v78[2];
  _QWORD v79[2];
  float32x4_t v80;
  void *v81[2];
  unsigned int v82;
  void *v83[2];
  unsigned int v84;

  v6 = a3;
  v7 = -[ABPK2DDetectionResult trackedJointCount](self, "trackedJointCount");
  v8 = objc_msgSend(v6, "trackedJointCount");
  v83[0] = 0;
  v83[1] = 0;
  if (v7 >= v8)
    v9 = v8;
  else
    v9 = v7;
  v10 = (2 * v9);
  v84 = 2 * v9;
  cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)v83, (8 * v9));
  v81[0] = 0;
  v81[1] = 0;
  v82 = v10;
  cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)v81, v10);
  v11 = 0;
  v12 = 0;
  v13 = 1;
  v14 = "((row < mixed().rows()) && (col < mixed().columns())) || cva::detail::assertMessage(\"Index out of bounds!\")";
  while (-[ABPK2DDetectionResult jointCount](self, "jointCount") > v11 && objc_msgSend(v6, "jointCount") > v11)
  {
    if (-[ABPK2DDetectionResult jointTrackingStates](self, "jointTrackingStates")[4 * v11]
      && *(_DWORD *)(objc_msgSend(v6, "jointTrackingStates") + 4 * v11))
    {
      v16 = objc_msgSend(v6, "rawJointsOutput");
      if (v84 <= v12)
        goto LABEL_59;
      *((_DWORD *)v83[0] + v12) = *(_QWORD *)(v16 + 8 * v11);
      v17 = objc_msgSend(v6, "rawJointsOutput");
      v18 = v84;
      if (v84 <= v12)
        goto LABEL_59;
      v19 = v83[0];
      *((float *)v83[0] + v84 + v12) = -*(float *)(v17 + 4 * v13);
      v20 = v12 + 2 * v18;
      v19[v20] = 1065353216;
      v19[v20 + v18] = 0;
      v21 = objc_msgSend(v6, "rawJointsOutput");
      v22 = v12 + 1;
      if (v84 <= v22
        || (*((_DWORD *)v83[0] + v22) = *(_DWORD *)(v21 + 4 * v13),
            v23 = objc_msgSend(v6, "rawJointsOutput"),
            v24 = v84,
            v84 <= v22))
      {
LABEL_59:
        v69 = 2269;
        goto LABEL_61;
      }
      v25 = v83[0];
      *((_DWORD *)v83[0] + v84 + v22) = *(_QWORD *)(v23 + 8 * v11);
      v26 = v22 + 2 * v24;
      v25[v26] = 0;
      v25[v26 + v24] = 1065353216;
      v27 = -[ABPK2DDetectionResult rawJointsOutput](self, "rawJointsOutput");
      if (v82 <= v12
        || (*((_DWORD *)v81[0] + v12) = *(_QWORD *)(v27 + 8 * v11),
            v28 = -[ABPK2DDetectionResult rawJointsOutput](self, "rawJointsOutput"),
            v82 <= v22))
      {
        v69 = 2283;
        v14 = "(i < mixed().elements()) || cva::detail::assertMessage(\"Index out of bounds!\")";
LABEL_61:
        __assert_rtn("assert_in_bounds", "matrixmixin.h", v69, v14);
      }
      *((_DWORD *)v81[0] + v22) = *(_DWORD *)(v28 + 4 * v13);
      v12 += 2;
    }
    ++v11;
    v13 += 2;
  }
  v74 = v83;
  v75[0] = &v74;
  v75[1] = v83;
  memset(&v76, 0, sizeof(v76));
  cva::assign<false,false,cva::Matrix<float,4u,4u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,4u,false> const>,cva::Matrix<float,0u,4u,false>>((uint64_t)&v76, (uint64_t)v75, v15);
  cva::inv<cva::Matrix<float,4u,4u,false>,4u,true,float>(&v76, &__p);
  v73 = v83;
  v78[0] = &__p;
  v78[1] = &v73;
  if (v84 != v82)
    __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
  v79[0] = v78;
  v79[1] = v81;
  v80 = 0uLL;
  cva::assign<false,false,cva::Matrix<float,4u,1u,false>,cva::MatrixMultExpr<cva::Matrix<float,4u,4u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,4u,false> const>>,cva::Matrix<float,0u,1u,false>>(&v80, (uint64_t)v79);
  v31 = v80;
  v29.i64[0] = *(_OWORD *)&v31 >> 64;
  v30 = (unint64_t)v31;
  v72 = v29;
  memset(&__p, 0, 24);
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE7reserveEm((void **)&__p, objc_msgSend(v6, "jointCount"));
  v32 = 0;
  *(float *)&v33 = -*((float *)&v30 + 1);
  HIDWORD(v33) = v30;
  v71 = (float32x4_t)v33;
  v34 = vdup_n_s32(0x7FC00000u);
  while (objc_msgSend(v6, "jointCount", *(_OWORD *)&v70) > v32)
  {
    v35 = objc_msgSend(v6, "rawJointsOutput");
    v36 = vaddq_f32(v72, vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v30, COERCE_FLOAT(*(_QWORD *)(v35 + 8 * v32))), v71, *(float32x2_t *)(v35 + 8 * v32), 1));
    v37 = (float32x4_t)vdupq_lane_s64(v36.i64[0], 0);
    v38.i32[0] = vmovn_s32(vcgtq_f32(v37, (float32x4_t)xmmword_210881980)).u32[0];
    v38.i32[1] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_210881980, v37)).i32[1];
    if ((vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v38, 0xFuLL))) & 1) != 0)
    {
      v39 = __p.columns[0].i64[1];
      if (__p.columns[0].i64[1] < (unint64_t)__p.columns[1].i64[0])
      {
        *(int32x2_t *)__p.columns[0].i64[1] = v34;
        v40 = v39 + 8;
        goto LABEL_51;
      }
      v42 = (__p.columns[0].i64[1] - __p.columns[0].i64[0]) >> 3;
      if ((unint64_t)(v42 + 1) >> 61)
        std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
      v43 = (__p.columns[1].i64[0] - __p.columns[0].i64[0]) >> 2;
      if (v43 <= v42 + 1)
        v43 = v42 + 1;
      if (__p.columns[1].i64[0] - __p.columns[0].i64[0] >= 0x7FFFFFFFFFFFFFF8uLL)
        v44 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v44 = v43;
      if (v44)
        v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&__p.columns[1], v44);
      else
        v45 = 0;
      v48 = (int32x2_t *)&v45[8 * v42];
      *v48 = v34;
      v40 = (uint64_t)&v48[1];
      v49 = (char *)__p.columns[0].i64[1];
      v50 = __p.columns[0].i64[0];
      if (__p.columns[0].i64[1] == __p.columns[0].i64[0])
        goto LABEL_49;
      do
      {
        v51 = *(int32x2_t *)(v49 - 8);
        v49 -= 8;
        v48[-1] = v51;
        --v48;
      }
      while (v49 != (char *)v50);
      goto LABEL_48;
    }
    v70 = v36;
    v41 = __p.columns[0].i64[1];
    if (__p.columns[0].i64[1] < (unint64_t)__p.columns[1].i64[0])
    {
      *(_QWORD *)__p.columns[0].i64[1] = v36.i64[0];
      v40 = v41 + 8;
      goto LABEL_51;
    }
    v46 = (__p.columns[0].i64[1] - __p.columns[0].i64[0]) >> 3;
    if ((unint64_t)(v46 + 1) >> 61)
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    v47 = (__p.columns[1].i64[0] - __p.columns[0].i64[0]) >> 2;
    if (v47 <= v46 + 1)
      v47 = v46 + 1;
    if (__p.columns[1].i64[0] - __p.columns[0].i64[0] >= 0x7FFFFFFFFFFFFFF8uLL)
      v44 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v44 = v47;
    if (v44)
      v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&__p.columns[1], v44);
    else
      v45 = 0;
    v48 = (int32x2_t *)&v45[8 * v46];
    *v48 = *(int32x2_t *)v70.f32;
    v40 = (uint64_t)&v48[1];
    v49 = (char *)__p.columns[0].i64[1];
    v52 = __p.columns[0].i64[0];
    if (__p.columns[0].i64[1] != __p.columns[0].i64[0])
    {
      do
      {
        v53 = *(int32x2_t *)(v49 - 8);
        v49 -= 8;
        v48[-1] = v53;
        --v48;
      }
      while (v49 != (char *)v52);
LABEL_48:
      v49 = (char *)__p.columns[0].i64[0];
    }
LABEL_49:
    __p.columns[0].i64[0] = (uint64_t)v48;
    __p.columns[0].i64[1] = v40;
    __p.columns[1].i64[0] = (uint64_t)&v45[8 * v44];
    if (v49)
      operator delete(v49);
LABEL_51:
    __p.columns[0].i64[1] = v40;
    ++v32;
  }
  v54 = [ABPK2DDetectionResult alloc];
  v55 = __p.columns[0].i64[0];
  v56 = objc_msgSend(v6, "jointTrackingStates");
  v57 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:](v54, "initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:", v55, v56, (__p.columns[0].i64[1] - __p.columns[0].i64[0]) >> 3, a4, 0, 0.0, 0.0, 1.0, 1.0);
  v58 = -[ABPKSkeletonDefinition initWithType:]([ABPKSkeletonDefinition alloc], "initWithType:", 0);
  v59 = -[ABPKSkeletonDefinition indexOfJointWithName:](v58, "indexOfJointWithName:", CFSTR("root"));
  v60 = -[ABPKSkeletonDefinition indexOfJointWithName:](v58, "indexOfJointWithName:", CFSTR("neck"));
  v61 = *(float32x2_t *)(-[ABPK2DDetectionResult joints](self, "joints") + 8 * v59);
  v62 = *(float32x2_t *)(-[ABPK2DDetectionResult joints](v57, "joints") + 8 * v59);
  v63 = *(float32x2_t *)(-[ABPK2DDetectionResult joints](self, "joints") + 8 * v60);
  v64 = -[ABPK2DDetectionResult joints](v57, "joints");
  v65 = vsub_f32(v61, v62);
  if (sqrtf(vaddv_f32(vmul_f32(v65, v65))) <= 0.05
    && (v66 = vsub_f32(v63, *(float32x2_t *)(v64 + 8 * v60)), sqrtf(vaddv_f32(vmul_f32(v66, v66))) <= 0.05))
  {
    v67 = v57;
  }
  else
  {
    v67 = 0;
  }

  if (__p.columns[0].i64[0])
  {
    __p.columns[0].i64[1] = __p.columns[0].i64[0];
    operator delete((void *)__p.columns[0].i64[0]);
  }
  free(v81[0]);
  free(v83[0]);

  return v67;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", -[ABPK2DDetectionResult jointCount](self, "jointCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("jointCount"));

  -[ABPK2DDetectionResult liftingData](self, "liftingData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("liftingData"));

  -[ABPK2DDetectionResult imageResolution](self, "imageResolution");
  *(float *)&v6 = v6;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("imageResolution.width"), v6);
  -[ABPK2DDetectionResult imageResolution](self, "imageResolution");
  *(float *)&v8 = v7;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("imageResolution.height"), v8);
  objc_msgSend(v9, "encodeInteger:forKey:", -[ABPK2DDetectionResult rotation](self, "rotation"), CFSTR("rotation"));
  objc_msgSend(v9, "encodeBytes:length:forKey:", -[ABPK2DDetectionResult rawJointsOutput](self, "rawJointsOutput"), 8 * -[ABPK2DDetectionResult jointCount](self, "jointCount"), CFSTR("rawJointsData"));
  objc_msgSend(v9, "encodeBytes:length:forKey:", -[ABPK2DDetectionResult jointTrackingStates](self, "jointTrackingStates"), 4 * -[ABPK2DDetectionResult jointCount](self, "jointCount"), CFSTR("jointTrackingStates"));

}

- (ABPK2DDetectionResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  float v9;
  float v10;
  float v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  ABPK2DDetectionResult *v19;
  ABPK2DDetectionResult *v20;
  unint64_t v22;
  unint64_t v23;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("jointCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongValue");

  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rotation"));
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("imageResolution.width"));
  v9 = v8;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("imageResolution.height"));
  v11 = v10;
  v23 = 0;
  v12 = objc_retainAutorelease(v4);
  v13 = objc_msgSend(v12, "decodeBytesForKey:returnedLength:", CFSTR("rawJointsData"), &v23);
  if (v6 != v23 >> 3)
  {
    NSLog(CFSTR("Inconsistent jointCount while decoding ABPK2DDetectionResult."));
LABEL_6:
    v20 = 0;
    goto LABEL_7;
  }
  v14 = v13;
  v22 = 0;
  v15 = objc_retainAutorelease(v12);
  v16 = objc_msgSend(v15, "decodeBytesForKey:returnedLength:", CFSTR("jointTrackingStates"), &v22);
  if (v6 != v22 >> 2)
  {
    NSLog(CFSTR("Inconsistent tracking state count while decoding ABPK2DDetectionResult."));
    goto LABEL_6;
  }
  v17 = v16;
  objc_msgSend(v15, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("liftingData"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:imageResolution:rotation:croppedRect:liftingData:]([ABPK2DDetectionResult alloc], "initWithJoints:trackingStates:numberOfJoints:imageResolution:rotation:croppedRect:liftingData:", v14, v17, v6, v7, v18, v9, v11, 0.0, 0.0, 1.0, 1.0);

  self = v19;
  v20 = self;
LABEL_7:

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  unint64_t v6;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **var0;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v8;
  unint64_t v9;
  float32x2_t *v10;
  float32x2_t v11;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v12;
  uint64_t v13;
  unint64_t v14;
  float32x2_t *v15;
  float32x2_t v16;
  void *v17;
  void *v18;
  char v19;

  v4 = a3;
  if ((objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = v4;
    v6 = -[ABPK2DDetectionResult jointCount](self, "jointCount");
    if (v6 == objc_msgSend(v5, "jointCount"))
    {
      var0 = self->_rawJoints.var0;
      v8 = *(__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> ***)self->_anon_10;
      v9 = v8 - var0;
      v10 = (float32x2_t *)v5[1];
      if (v9 == (uint64_t)(v5[2] - (_QWORD)v10) >> 3)
      {
        if (v8 == var0)
        {
LABEL_9:
          v12 = self->_rotatedJoints.var0;
          v13 = *(_QWORD *)self->_anon_28 - (_QWORD)v12;
          if (v13)
          {
            v14 = v13 >> 3;
            v15 = (float32x2_t *)v5[4];
            if (v14 <= 1)
              v14 = 1;
            while (1)
            {
              v16 = vsub_f32(*v15, *(float32x2_t *)v12);
              if (sqrtf(vaddv_f32(vmul_f32(v16, v16))) > 0.00000011921)
                break;
              ++v12;
              ++v15;
              if (!--v14)
                goto LABEL_14;
            }
          }
          else
          {
LABEL_14:
            if (self->_rotation == v5[13])
            {
              -[ABPK2DDetectionResult liftingData](self, "liftingData");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "liftingData");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v17, "isEqual:", v18);

LABEL_18:
              goto LABEL_19;
            }
          }
        }
        else
        {
          if (v9 <= 1)
            v9 = 1;
          while (1)
          {
            v11 = vsub_f32(*v10, *(float32x2_t *)var0);
            if (sqrtf(vaddv_f32(vmul_f32(v11, v11))) > 0.00000011921)
              break;
            ++var0;
            ++v10;
            if (!--v9)
              goto LABEL_9;
          }
        }
      }
    }
    v19 = 0;
    goto LABEL_18;
  }
  v19 = 0;
LABEL_19:

  return v19;
}

- (unint64_t)hash
{
  unint64_t result;
  float v4;
  float v5;

  result = -[ABPK2DDetectionResult jointCount](self, "jointCount");
  if (result)
  {
    v4 = COERCE_FLOAT(*self->_rotatedJoints.var0);
    LODWORD(v5) = HIDWORD(*(_QWORD *)(*(_QWORD *)self->_anon_28 - 8));
    return -[ABPK2DDetectionResult jointCount](self, "jointCount") ^ (unint64_t)v4 ^ (unint64_t)v5;
  }
  return result;
}

- (CGSize)imageResolution
{
  double width;
  double height;
  CGSize result;

  width = self->_imageResolution.width;
  height = self->_imageResolution.height;
  result.height = height;
  result.width = width;
  return result;
}

- (ABPK2D3DLiftingData)liftingData
{
  return self->_liftingData;
}

- (int64_t)rotation
{
  return self->_rotation;
}

- (void).cxx_destruct
{
  unsigned int *begin;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **var0;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v5;

  objc_storeStrong((id *)&self->_liftingData, 0);
  begin = self->_jointTrackingStates.__begin_;
  if (begin)
  {
    self->_jointTrackingStates.__end_ = begin;
    operator delete(begin);
  }
  var0 = self->_rotatedJoints.var0;
  if (var0)
  {
    *(_QWORD *)self->_anon_28 = var0;
    operator delete(var0);
  }
  v5 = self->_rawJoints.var0;
  if (v5)
  {
    *(_QWORD *)self->_anon_10 = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
