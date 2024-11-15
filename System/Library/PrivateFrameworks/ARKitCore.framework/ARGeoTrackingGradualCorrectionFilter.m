@implementation ARGeoTrackingGradualCorrectionFilter

- (__n128)initWithTargetTransform:(__n128 *)a3
{
  ARGeoTrackingGradualCorrectionFilter *v4;
  __n128 result;
  __n128 v6;
  __n128 v7;
  __n128 v8;
  __n128 v9;
  __n128 v10;
  __n128 v11;
  __n128 v12;
  __n128 v13;
  __n128 v14;
  __n128 v15;
  __n128 v16;
  objc_super v17;

  v17.receiver = a1;
  v17.super_class = (Class)ARGeoTrackingGradualCorrectionFilter;
  v4 = -[ARGeoTrackingGradualCorrectionFilter init](&v17, sel_init);
  if (v4)
  {
    v4->_targetLock._os_unfair_lock_opaque = 0;
    v6 = *a3;
    v7 = a3[1];
    v8 = a3[3];
    *(__n128 *)&v4->_anon_10[32] = a3[2];
    *(__n128 *)&v4->_anon_10[48] = v8;
    *(__n128 *)v4->_anon_10 = v6;
    *(__n128 *)&v4->_anon_10[16] = v7;
    v9 = a3[4];
    v10 = a3[5];
    v11 = a3[7];
    *(__n128 *)&v4->_anon_10[96] = a3[6];
    *(__n128 *)&v4->_anon_10[112] = v11;
    *(__n128 *)&v4->_anon_10[64] = v9;
    *(__n128 *)&v4->_anon_10[80] = v10;
    v4->_lastTimestamp = -1.0;
    v12 = *a3;
    v13 = a3[1];
    v14 = a3[3];
    *(__n128 *)&v4[1]._anon_10[16] = a3[2];
    *(__n128 *)&v4[1]._anon_10[32] = v14;
    *(__n128 *)&v4[1].super.isa = v12;
    *(__n128 *)v4[1]._anon_10 = v13;
    result = a3[4];
    v15 = a3[5];
    v16 = a3[7];
    *(__n128 *)&v4[1]._anon_10[80] = a3[6];
    *(__n128 *)&v4[1]._anon_10[96] = v16;
    *(__n128 *)&v4[1]._anon_10[48] = result;
    *(__n128 *)&v4[1]._anon_10[64] = v15;
  }
  return result;
}

- (void)ENUFromVIOTarget
{
  os_unfair_lock_s *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v4 = (os_unfair_lock_s *)(a1 + 280);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
  v5 = *(_OWORD *)(a1 + 416);
  a2[4] = *(_OWORD *)(a1 + 400);
  a2[5] = v5;
  v6 = *(_OWORD *)(a1 + 448);
  a2[6] = *(_OWORD *)(a1 + 432);
  a2[7] = v6;
  v7 = *(_OWORD *)(a1 + 352);
  *a2 = *(_OWORD *)(a1 + 336);
  a2[1] = v7;
  v8 = *(_OWORD *)(a1 + 384);
  a2[2] = *(_OWORD *)(a1 + 368);
  a2[3] = v8;
  os_unfair_lock_unlock(v4);
}

- (void)setENUFromVIOTarget:(__int128 *)a3
{
  os_unfair_lock_s *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v5 = (os_unfair_lock_s *)(a1 + 280);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
  v6 = *a3;
  v7 = a3[1];
  v8 = a3[3];
  *(_OWORD *)(a1 + 368) = a3[2];
  *(_OWORD *)(a1 + 384) = v8;
  *(_OWORD *)(a1 + 336) = v6;
  *(_OWORD *)(a1 + 352) = v7;
  v9 = a3[4];
  v10 = a3[5];
  v11 = a3[7];
  *(_OWORD *)(a1 + 432) = a3[6];
  *(_OWORD *)(a1 + 448) = v11;
  *(_OWORD *)(a1 + 400) = v9;
  *(_OWORD *)(a1 + 416) = v10;
  os_unfair_lock_unlock(v5);
}

- (void)setTargetTranslation:(ARGeoTrackingGradualCorrectionFilter *)self
{
  __int128 *v2;
  os_unfair_lock_s *p_targetLock;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v6 = v2[1];
  v7 = *v2;
  p_targetLock = &self->_targetLock;
  os_unfair_lock_lock(&self->_targetLock);
  *(_QWORD *)&v5 = v6;
  *((_QWORD *)&v5 + 1) = 1.0;
  *(_OWORD *)&self[1]._anon_10[80] = v7;
  *(_OWORD *)&self[1]._anon_10[96] = v5;
  os_unfair_lock_unlock(p_targetLock);
}

- (void)setTargetRotation:(uint64_t)a3
{
  os_unfair_lock_s *v5;
  uint64_t i;
  __int128 v7;
  os_unfair_lock_s *v8;

  v5 = a1 + 70;
  os_unfair_lock_lock(a1 + 70);
  for (i = 0; i != 24; i += 8)
  {
    v7 = *(_OWORD *)(a3 + i * 4 + 16);
    v8 = &a1[i + 84];
    *(_OWORD *)&v8->_os_unfair_lock_opaque = *(_OWORD *)(a3 + i * 4);
    *(_OWORD *)&v8[4]._os_unfair_lock_opaque = v7;
  }
  os_unfair_lock_unlock(v5);
}

- (BOOL)getCurrentENUFromVIO:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)self->_anon_10;
  v4 = *(_OWORD *)&self->_anon_10[16];
  v5 = *(_OWORD *)&self->_anon_10[48];
  *((_OWORD *)a3 + 2) = *(_OWORD *)&self->_anon_10[32];
  *((_OWORD *)a3 + 3) = v5;
  *(_OWORD *)a3 = v3;
  *((_OWORD *)a3 + 1) = v4;
  v6 = *(_OWORD *)&self->_anon_10[64];
  v7 = *(_OWORD *)&self->_anon_10[80];
  v8 = *(_OWORD *)&self->_anon_10[112];
  *((_OWORD *)a3 + 6) = *(_OWORD *)&self->_anon_10[96];
  *((_OWORD *)a3 + 7) = v8;
  *((_OWORD *)a3 + 4) = v6;
  *((_OWORD *)a3 + 5) = v7;
  return 1;
}

- (void)updateWithVIOPose:(uint64_t)a3 timestamp:(_OWORD *)a4
{
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _OWORD *v58;
  char RelativeMotionAndYaw;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  double v64;
  __int128 *v65;
  double v66;
  float64x2_t v67;
  float64x2_t v68;
  double v69;
  double v70;
  unint64_t v71;
  double v72;
  NSObject *v74;
  objc_class *v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  NSObject *v85;
  objc_class *v86;
  void *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  float64x2_t v102;
  float64x2_t v103;
  float64x2_t v104;
  double v105;
  float64x2_t v106;
  double v107;
  double v108;
  float64x2_t v109;
  double v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  float64x2_t v120;
  double v121;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  NSObject *v137;
  objc_class *v138;
  void *v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  double v149;
  float64x2_t v150;
  float64x2_t v151;
  int64x2_t v152;
  float64x2_t v153;
  float64x2_t v154;
  __int128 v155;
  uint64_t v156;
  float64x2_t v157;
  float64x2_t vars0;

  STACK[0xAF8] = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&STACK[0x940] = 0u;
  *(_OWORD *)&STACK[0x950] = 0u;
  *(_OWORD *)&STACK[0x920] = 0u;
  *(_OWORD *)&STACK[0x930] = 0u;
  *(_OWORD *)&STACK[0x900] = 0u;
  *(_OWORD *)&STACK[0x910] = 0u;
  *(_OWORD *)&STACK[0x8E0] = 0u;
  *(_OWORD *)&STACK[0x8F0] = 0u;
  v50 = a4[5];
  *(_OWORD *)&STACK[0x9A0] = a4[4];
  *(_OWORD *)&STACK[0x9B0] = v50;
  v51 = a4[7];
  *(_OWORD *)&STACK[0x9C0] = a4[6];
  *(_OWORD *)&STACK[0x9D0] = v51;
  v52 = a4[1];
  *(_OWORD *)&STACK[0x960] = *a4;
  *(_OWORD *)&STACK[0x970] = v52;
  v53 = a4[3];
  *(_OWORD *)&STACK[0x980] = a4[2];
  *(_OWORD *)&STACK[0x990] = v53;
  __invert_d4();
  *(_OWORD *)&STACK[0x9D0] = 0u;
  *(_OWORD *)&STACK[0x9C0] = 0u;
  *(_OWORD *)&STACK[0x9B0] = 0u;
  *(_OWORD *)&STACK[0x9A0] = 0u;
  *(_OWORD *)&STACK[0x990] = 0u;
  *(_OWORD *)&STACK[0x970] = 0u;
  *(_OWORD *)&STACK[0x980] = 0u;
  *(_OWORD *)&STACK[0x960] = 0u;
  ConvertIMU((float64x2_t *)&STACK[0x8E0], (uint64_t)&STACK[0x960]);
  if (*(double *)(a1 + 272) >= 0.0)
  {
    STACK[0x8D8] = 0;
    STACK[0x8D0] = 0;
    v58 = (_OWORD *)(a1 + 144);
    RelativeMotionAndYaw = GetRelativeMotionAndYaw((const simd_double4x4 *)(a1 + 144), (const simd_double4x4 *)&STACK[0x960], (double *)&STACK[0x8D8], (double *)&STACK[0x8D0]);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    v60 = *(_OWORD *)(a1 + 416);
    *(_OWORD *)&STACK[0x890] = *(_OWORD *)(a1 + 400);
    *(_OWORD *)&STACK[0x8A0] = v60;
    v61 = *(_OWORD *)(a1 + 448);
    *(_OWORD *)&STACK[0x8B0] = *(_OWORD *)(a1 + 432);
    *(_OWORD *)&STACK[0x8C0] = v61;
    v62 = *(_OWORD *)(a1 + 352);
    *(_OWORD *)&STACK[0x850] = *(_OWORD *)(a1 + 336);
    *(_OWORD *)&STACK[0x860] = v62;
    v63 = *(_OWORD *)(a1 + 384);
    *(_OWORD *)&STACK[0x870] = *(_OWORD *)(a1 + 368);
    *(_OWORD *)&STACK[0x880] = v63;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
    if ((RelativeMotionAndYaw & 1) != 0)
    {
      v64 = *(double *)&STACK[0x8D0];
      v65 = (__int128 *)(a1 + 16);
      v66 = *(double *)(a1 + 272);
      v151 = *(float64x2_t *)&STACK[0x9D0];
      v152 = *(int64x2_t *)&STACK[0x9C0];
      v67 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*(float64x2_t *)&STACK[0x860], *(double *)&STACK[0x9C0]), *(float64x2_t *)&STACK[0x880], *(float64x2_t *)&STACK[0x9C0], 1), *(float64x2_t *)&STACK[0x8A0], v151.f64[0]), *(float64x2_t *)&STACK[0x8C0], v151, 1);
      v153 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 16), *(double *)&STACK[0x9C0]), *(float64x2_t *)(a1 + 48), *(float64x2_t *)&STACK[0x9C0], 1), *(float64x2_t *)(a1 + 80), *(double *)&STACK[0x9D0]), *(float64x2_t *)(a1 + 112), *(float64x2_t *)&STACK[0x9D0], 1);
      v154 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 32), *(double *)&STACK[0x9C0]), *(float64x2_t *)(a1 + 64), *(float64x2_t *)&STACK[0x9C0], 1), *(float64x2_t *)(a1 + 96), *(double *)&STACK[0x9D0]), *(float64x2_t *)(a1 + 128), *(float64x2_t *)&STACK[0x9D0], 1);
      v68 = vsubq_f64(v67, v154);
      v149 = v67.f64[0] - v154.f64[0];
      v150 = vsubq_f64(vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*(float64x2_t *)&STACK[0x850], *(double *)&STACK[0x9C0]), *(float64x2_t *)&STACK[0x870], *(float64x2_t *)&STACK[0x9C0], 1), *(float64x2_t *)&STACK[0x890], v151.f64[0]), *(float64x2_t *)&STACK[0x8B0], v151, 1), v153);
      v68.f64[0] = v67.f64[0] - v154.f64[0];
      *(double *)&v156 = sqrt(vmulq_f64(v68, v68).f64[0] + vaddvq_f64(vmulq_f64(v150, v150)));
      v69 = (*(double *)&v156 + -1.0) / 10.0;
      if (v69 > 1.0)
        v69 = 1.0;
      if (v69 >= 0.0)
        v70 = v69;
      else
        v70 = 0.0;
      STACK[0x840] = 0;
      GetRelativeMotionAndYaw((const simd_double4x4 *)(a1 + 16), (const simd_double4x4 *)&STACK[0x850], (double *)&STACK[0x848], (double *)&STACK[0x840]);
      v71 = STACK[0x840];
      v72 = fabs(*(double *)&STACK[0x840]);
      if (*(double *)&v156 <= 5.0 && v72 <= 5.0)
      {
        v96 = a2 - v66;
        v97 = *(double *)&STACK[0x8D8];
        v98 = fabs(v64) * 0.01;
        v99 = (v72 + -1.0) / 10.0;
        if (v99 > 1.0)
          v99 = 1.0;
        if (v99 < 0.0)
          v99 = 0.0;
        v100 = v98 + v96 * v99;
        if (v100 < v72)
          v72 = v100;
        if (v72 < 0.0001)
          v72 = 0.0;
        if (*(double *)&v71 >= 0.0)
          v101 = v72;
        else
          v101 = -v72;
        Transform4DofFromMatrix((const simd_double4x4 *)(a1 + 16), (uint64_t)&STACK[0x818]);
        STACK[0x810] = 0;
        a48 = 0u;
        *(_OWORD *)&STACK[0x800] = 0u;
        *(double *)&STACK[0x808] = v101 + *(double *)&STACK[0x830];
        *(_OWORD *)&STACK[0xAE0] = 0u;
        *(_OWORD *)&STACK[0xAD0] = 0u;
        *(_OWORD *)&STACK[0xAC0] = 0u;
        *(_OWORD *)&STACK[0xAB0] = 0u;
        *(_OWORD *)&STACK[0xAA0] = 0u;
        *(_OWORD *)&STACK[0xA90] = 0u;
        *(_OWORD *)&STACK[0xA80] = 0u;
        *(_OWORD *)&STACK[0xA70] = 0u;
        MatrixFromTransform4Dof(&a48, (uint64_t)&STACK[0xA70]);
        v102 = (float64x2_t)vdupq_laneq_s64(v152, 1);
        v103 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v151.f64[0], 0);
        v104 = (float64x2_t)vdupq_laneq_s64((int64x2_t)v151, 1);
        v105 = vmlaq_f64(vmlaq_f64(vmlaq_f64(vmulq_n_f64(*(float64x2_t *)&STACK[0xA80], *(double *)v152.i64), v102, *(float64x2_t *)&STACK[0xAA0]), v103, *(float64x2_t *)&STACK[0xAC0]), v104, *(float64x2_t *)&STACK[0xAE0]).f64[0];
        v106 = vsubq_f64(v153, vmlaq_f64(vmlaq_f64(vmlaq_f64(vmulq_n_f64(*(float64x2_t *)&STACK[0xA70], *(double *)v152.i64), v102, *(float64x2_t *)&STACK[0xA90]), v103, *(float64x2_t *)&STACK[0xAB0]), v104, *(float64x2_t *)&STACK[0xAD0]));
        v107 = v154.f64[0] - v105;
        v108 = 0.0;
        v109 = 0uLL;
        if (*(double *)&v156 > 0.0001)
        {
          v110 = v97 * 0.1 + v96 * v70;
          if (*(double *)&v156 < v110)
            v110 = *(double *)&v156;
          v109 = vdivq_f64(vmulq_n_f64(v150, v110), (float64x2_t)vdupq_lane_s64(v156, 0));
          v108 = v149 * v110 / *(double *)&v156;
        }
        v111 = *(_OWORD *)&STACK[0xA90];
        v112 = *(_OWORD *)&STACK[0xAA0];
        v113 = *(_OWORD *)&STACK[0xAA0];
        *(_OWORD *)&STACK[0xA20] = *(_OWORD *)&STACK[0xA90];
        *(_OWORD *)&STACK[0xA30] = v112;
        v114 = *(_OWORD *)&STACK[0xAB0];
        v115 = *(_OWORD *)&STACK[0xAC0];
        v116 = *(_OWORD *)&STACK[0xAC0];
        *(_OWORD *)&STACK[0xA40] = *(_OWORD *)&STACK[0xAB0];
        *(_OWORD *)&STACK[0xA50] = v115;
        v117 = *(_OWORD *)&STACK[0xA70];
        v118 = *(_OWORD *)&STACK[0xA80];
        v119 = *(_OWORD *)&STACK[0xA80];
        *(_OWORD *)&STACK[0xA00] = *(_OWORD *)&STACK[0xA70];
        *(_OWORD *)&STACK[0xA10] = v118;
        v120 = vaddq_f64(v106, v109);
        v121 = v107 + v108;
        __asm { FMOV            V2.2D, #1.0 }
        *(double *)&_Q2 = v121;
        v127 = *(_OWORD *)(a1 + 64);
        a42 = *(_OWORD *)(a1 + 48);
        a43 = v127;
        v128 = *(_OWORD *)(a1 + 32);
        a40 = *v65;
        a41 = v128;
        v129 = *(_OWORD *)(a1 + 128);
        a46 = *(_OWORD *)(a1 + 112);
        a47 = v129;
        v130 = *(_OWORD *)(a1 + 96);
        a44 = *(_OWORD *)(a1 + 80);
        a45 = v130;
        a32 = v117;
        a33 = v119;
        a36 = v114;
        a37 = v116;
        a34 = v111;
        a35 = v113;
        v155 = _Q2;
        v157 = v120;
        a38 = v120;
        a39 = _Q2;
        v131 = *(_OWORD *)&STACK[0x850];
        v132 = *(_OWORD *)&STACK[0x860];
        v133 = *(_OWORD *)&STACK[0x880];
        a26 = *(_OWORD *)&STACK[0x870];
        a27 = v133;
        a24 = v131;
        a25 = v132;
        v134 = *(_OWORD *)&STACK[0x890];
        v135 = *(_OWORD *)&STACK[0x8A0];
        v136 = *(_OWORD *)&STACK[0x8C0];
        a30 = *(_OWORD *)&STACK[0x8B0];
        a31 = v136;
        a28 = v134;
        a29 = v135;
        vars0 = *(float64x2_t *)&STACK[0x960];
        if ((SanityCheck((uint64_t)&a40, (uint64_t)&a32, (uint64_t)&a24, &vars0) & 1) == 0)
        {
          _ARLogGeneral();
          v137 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v137, OS_LOG_TYPE_INFO))
          {
            v138 = (objc_class *)objc_opt_class();
            NSStringFromClass(v138);
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(STACK[0x9E0]) = 138543618;
            STACK[0x9E4] = (unint64_t)v139;
            LOWORD(STACK[0x9EC]) = 2048;
            STACK[0x9EE] = a1;
            _os_log_impl(&dword_1B3A68000, v137, OS_LOG_TYPE_INFO, "%{public}@ <%p>: GradualCorrection Pose update does not improve", (uint8_t *)&STACK[0x9E0], 0x16u);

          }
        }
        v140 = *(_OWORD *)&STACK[0xA30];
        *(_OWORD *)(a1 + 48) = *(_OWORD *)&STACK[0xA20];
        *(_OWORD *)(a1 + 64) = v140;
        v141 = *(_OWORD *)&STACK[0xA50];
        *(_OWORD *)(a1 + 80) = *(_OWORD *)&STACK[0xA40];
        *(_OWORD *)(a1 + 96) = v141;
        v142 = *(_OWORD *)&STACK[0xA10];
        *v65 = *(_OWORD *)&STACK[0xA00];
        *(_OWORD *)(a1 + 32) = v142;
        *(float64x2_t *)(a1 + 112) = v157;
        *(_OWORD *)(a1 + 128) = v155;
        *(double *)(a1 + 272) = a2;
        v143 = *(_OWORD *)&STACK[0x960];
        v144 = *(_OWORD *)&STACK[0x970];
        v145 = *(_OWORD *)&STACK[0x990];
        *(_OWORD *)(a1 + 176) = *(_OWORD *)&STACK[0x980];
        *(_OWORD *)(a1 + 192) = v145;
        *v58 = v143;
        *(_OWORD *)(a1 + 160) = v144;
        v146 = *(_OWORD *)&STACK[0x9A0];
        v147 = *(_OWORD *)&STACK[0x9B0];
        v148 = *(_OWORD *)&STACK[0x9D0];
        *(_OWORD *)(a1 + 240) = *(_OWORD *)&STACK[0x9C0];
        *(_OWORD *)(a1 + 256) = v148;
        *(_OWORD *)(a1 + 208) = v146;
        *(_OWORD *)(a1 + 224) = v147;
      }
      else
      {
        _ARLogGeneral();
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
        {
          v75 = (objc_class *)objc_opt_class();
          NSStringFromClass(v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(STACK[0xA70]) = 138544130;
          STACK[0xA74] = (unint64_t)v76;
          LOWORD(STACK[0xA7C]) = 2048;
          STACK[0xA7E] = a1;
          LOWORD(STACK[0xA86]) = 2048;
          STACK[0xA88] = v156;
          LOWORD(STACK[0xA90]) = 2048;
          STACK[0xA92] = v71;
          _os_log_impl(&dword_1B3A68000, v74, OS_LOG_TYPE_INFO, "%{public}@ <%p>: GradualCorrection Pose update to strong (%f m ,%f deg) - resetting filter", (uint8_t *)&STACK[0xA70], 0x2Au);

        }
        *(double *)(a1 + 272) = a2;
        v77 = *(_OWORD *)&STACK[0x9B0];
        *(_OWORD *)(a1 + 208) = *(_OWORD *)&STACK[0x9A0];
        *(_OWORD *)(a1 + 224) = v77;
        v78 = *(_OWORD *)&STACK[0x9D0];
        *(_OWORD *)(a1 + 240) = *(_OWORD *)&STACK[0x9C0];
        *(_OWORD *)(a1 + 256) = v78;
        v79 = *(_OWORD *)&STACK[0x970];
        *v58 = *(_OWORD *)&STACK[0x960];
        *(_OWORD *)(a1 + 160) = v79;
        v80 = *(_OWORD *)&STACK[0x990];
        *(_OWORD *)(a1 + 176) = *(_OWORD *)&STACK[0x980];
        *(_OWORD *)(a1 + 192) = v80;
        v81 = *(_OWORD *)&STACK[0x880];
        *(_OWORD *)(a1 + 48) = *(_OWORD *)&STACK[0x870];
        *(_OWORD *)(a1 + 64) = v81;
        v82 = *(_OWORD *)&STACK[0x860];
        *v65 = *(_OWORD *)&STACK[0x850];
        *(_OWORD *)(a1 + 32) = v82;
        v83 = *(_OWORD *)&STACK[0x8C0];
        *(_OWORD *)(a1 + 112) = *(_OWORD *)&STACK[0x8B0];
        *(_OWORD *)(a1 + 128) = v83;
        v84 = *(_OWORD *)&STACK[0x8A0];
        *(_OWORD *)(a1 + 80) = *(_OWORD *)&STACK[0x890];
        *(_OWORD *)(a1 + 96) = v84;
      }
    }
    else
    {
      _ARLogGeneral();
      v85 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
      {
        v86 = (objc_class *)objc_opt_class();
        NSStringFromClass(v86);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(STACK[0xA70]) = 138543618;
        STACK[0xA74] = (unint64_t)v87;
        LOWORD(STACK[0xA7C]) = 2048;
        STACK[0xA7E] = a1;
        _os_log_impl(&dword_1B3A68000, v85, OS_LOG_TYPE_INFO, "%{public}@ <%p>: GradualCorrection GetRelativeMotionAndYaw failed - resetting filter", (uint8_t *)&STACK[0xA70], 0x16u);

      }
      *(double *)(a1 + 272) = a2;
      v88 = *(_OWORD *)&STACK[0x9B0];
      *(_OWORD *)(a1 + 208) = *(_OWORD *)&STACK[0x9A0];
      *(_OWORD *)(a1 + 224) = v88;
      v89 = *(_OWORD *)&STACK[0x9D0];
      *(_OWORD *)(a1 + 240) = *(_OWORD *)&STACK[0x9C0];
      *(_OWORD *)(a1 + 256) = v89;
      v90 = *(_OWORD *)&STACK[0x970];
      *v58 = *(_OWORD *)&STACK[0x960];
      *(_OWORD *)(a1 + 160) = v90;
      v91 = *(_OWORD *)&STACK[0x990];
      *(_OWORD *)(a1 + 176) = *(_OWORD *)&STACK[0x980];
      *(_OWORD *)(a1 + 192) = v91;
      v92 = *(_OWORD *)&STACK[0x880];
      *(_OWORD *)(a1 + 48) = *(_OWORD *)&STACK[0x870];
      *(_OWORD *)(a1 + 64) = v92;
      v93 = *(_OWORD *)&STACK[0x860];
      *(_OWORD *)(a1 + 16) = *(_OWORD *)&STACK[0x850];
      *(_OWORD *)(a1 + 32) = v93;
      v94 = *(_OWORD *)&STACK[0x8C0];
      *(_OWORD *)(a1 + 112) = *(_OWORD *)&STACK[0x8B0];
      *(_OWORD *)(a1 + 128) = v94;
      v95 = *(_OWORD *)&STACK[0x8A0];
      *(_OWORD *)(a1 + 80) = *(_OWORD *)&STACK[0x890];
      *(_OWORD *)(a1 + 96) = v95;
    }
  }
  else
  {
    *(double *)(a1 + 272) = a2;
    v54 = *(_OWORD *)&STACK[0x9B0];
    *(_OWORD *)(a1 + 208) = *(_OWORD *)&STACK[0x9A0];
    *(_OWORD *)(a1 + 224) = v54;
    v55 = *(_OWORD *)&STACK[0x9D0];
    *(_OWORD *)(a1 + 240) = *(_OWORD *)&STACK[0x9C0];
    *(_OWORD *)(a1 + 256) = v55;
    v56 = *(_OWORD *)&STACK[0x970];
    *(_OWORD *)(a1 + 144) = *(_OWORD *)&STACK[0x960];
    *(_OWORD *)(a1 + 160) = v56;
    v57 = *(_OWORD *)&STACK[0x990];
    *(_OWORD *)(a1 + 176) = *(_OWORD *)&STACK[0x980];
    *(_OWORD *)(a1 + 192) = v57;
  }
}

- (void).cxx_destruct
{
  char *begin;
  float *v4;

  begin = self->_posHistoryC.__begin_;
  if (begin)
  {
    self->_posHistoryC.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_posHistory.__begin_;
  if (v4)
  {
    self->_posHistory.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *((_OWORD *)self + 19) = 0u;
  *((_OWORD *)self + 20) = 0u;
  *((_OWORD *)self + 18) = 0u;
  return self;
}

@end
