@implementation NUImageTransform3D

- (NUImageTransform3D)initWithAffineTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v10[8];

  *(CGFloat *)&v3 = a3->a;
  *(CGFloat *)&v4 = a3->b;
  *((_QWORD *)&v3 + 1) = *(_QWORD *)&a3->c;
  *(_QWORD *)&v5 = 0;
  *(_QWORD *)&v6 = 0;
  *((_QWORD *)&v6 + 1) = *(_QWORD *)&a3->tx;
  *((_QWORD *)&v4 + 1) = *(_QWORD *)&a3->d;
  *((_QWORD *)&v5 + 1) = *(_QWORD *)&a3->ty;
  v10[0] = v3;
  v10[1] = v6;
  v10[2] = v4;
  v10[3] = v5;
  v7 = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 80);
  v10[4] = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 64);
  v10[5] = v7;
  v8 = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 112);
  v10[6] = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 96);
  v10[7] = v8;
  return -[NUImageTransform3D initWithTransform3D:](self, "initWithTransform3D:", v10);
}

- (_OWORD)initWithTransform3D:(float64x2_t *)a3
{
  __int128 *v54;
  char *v55;
  _OWORD *v56;
  int64x2_t v57;
  float64x2_t v58;
  float64x2_t v59;
  float64x2_t v60;
  float64x2_t v61;
  float64x2_t v62;
  float64x2_t v63;
  _OWORD *v64;
  float64x2_t v65;
  float64x2_t v66;
  float64x2_t v67;
  float64x2_t v68;
  float64x2_t v69;
  float64x2_t v70;
  float64x2_t v71;
  float64x2_t v72;
  float64x2_t v73;
  float64x2_t v74;
  float64x2_t v75;
  float64x2_t v76;
  float64x2_t v77;
  float64x2_t v78;
  float64x2_t v79;
  float64x2_t v80;
  float64x2_t v81;
  float64x2_t v82;
  int64x2_t v83;
  int64x2_t v84;
  void *v85;
  void *v86;
  NSObject *v87;
  void *v88;
  uint64_t v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *specific;
  void *v102;
  id v103;
  NSObject *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  float64x2_t v113;
  float64x2_t v114;
  float64x2_t v115;
  float64x2_t vars0;
  float64x2_t v117;
  float64x2_t v118;
  float64x2_t v119;
  float64x2_t v120;
  float64x2_t v121;
  float64x2_t v122;
  float64x2_t v123;
  float64x2_t v124;
  float64x2_t v125;
  float64x2_t v126;
  float64x2_t v127;
  float64x2_t v128;
  float64x2x2_t v129;

  a53 = *MEMORY[0x1E0C80C00];
  v127 = a3[1];
  v128 = *a3;
  v125 = a3[3];
  v126 = a3[2];
  v123 = a3[5];
  v124 = a3[4];
  v121 = a3[7];
  v122 = a3[6];
  v54 = (__int128 *)MEMORY[0x1E0C83FD8];
  v119 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 16);
  v120 = *(float64x2_t *)MEMORY[0x1E0C83FD8];
  v117 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 48);
  v118 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 32);
  v115 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 80);
  vars0 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 64);
  v113 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 112);
  v114 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 96);
  a41.receiver = a1;
  a41.super_class = (Class)NUImageTransform3D;
  v55 = -[NUImageTransform3D init](&a41, sel_init);
  v56 = v55;
  if (v55)
  {
    v57 = (int64x2_t)vandq_s8(vandq_s8(vandq_s8((int8x16_t)vceqq_f64(v126, v118), (int8x16_t)vceqq_f64(v128, v120)), vandq_s8((int8x16_t)vceqq_f64(v124, vars0), (int8x16_t)vceqq_f64(v122, v114))), vandq_s8(vandq_s8((int8x16_t)vceqq_f64(v125, v117), (int8x16_t)vceqq_f64(v127, v119)), vandq_s8((int8x16_t)vceqq_f64(v123, v115), (int8x16_t)vceqq_f64(v121, v113))));
    v58 = a3[3];
    v60 = *a3;
    v59 = a3[1];
    *((float64x2_t *)v55 + 12) = a3[2];
    *((float64x2_t *)v55 + 13) = v58;
    *((float64x2_t *)v55 + 10) = v60;
    *((float64x2_t *)v55 + 11) = v59;
    v61 = a3[7];
    v63 = a3[4];
    v62 = a3[5];
    *((float64x2_t *)v55 + 16) = a3[6];
    *((float64x2_t *)v55 + 17) = v61;
    *((float64x2_t *)v55 + 14) = v63;
    *((float64x2_t *)v55 + 15) = v62;
    v64 = v55 + 16;
    if ((vandq_s8((int8x16_t)v57, (int8x16_t)vdupq_laneq_s64(v57, 1)).u64[0] & 0x8000000000000000) != 0)
    {
      v90 = *v54;
      v91 = v54[1];
      v92 = v54[3];
      *((_OWORD *)v55 + 3) = v54[2];
      *((_OWORD *)v55 + 4) = v92;
      *v64 = v90;
      *((_OWORD *)v55 + 2) = v91;
      v93 = v54[4];
      v94 = v54[5];
      v95 = v54[7];
      *((_OWORD *)v55 + 7) = v54[6];
      *((_OWORD *)v55 + 8) = v95;
      *((_OWORD *)v55 + 5) = v93;
      *((_OWORD *)v55 + 6) = v94;
    }
    else
    {
      v65 = a3[5];
      a46 = a3[4];
      a47 = v65;
      v66 = a3[7];
      a48 = a3[6];
      a49 = v66;
      v67 = a3[1];
      buf = *a3;
      a43 = v67;
      v68 = a3[3];
      a44 = a3[2];
      a45 = v68;
      __invert_d4();
      v56[3] = a35;
      v56[4] = a36;
      *v64 = a33;
      v56[2] = a34;
      v56[7] = a39;
      v56[8] = a40;
      v56[5] = a37;
      v56[6] = a38;
      v129 = vld2q_f64(a3->f64);
      v69 = a3[2];
      v70 = a3[3];
      v71 = a3[4];
      v72 = a3[5];
      v73 = a3[6];
      v74 = a3[7];
      v75 = (float64x2_t)vextq_s8((int8x16_t)v70, (int8x16_t)v69, 8uLL);
      v76 = (float64x2_t)vextq_s8((int8x16_t)v69, (int8x16_t)v70, 8uLL);
      v77 = (float64x2_t)vextq_s8((int8x16_t)v74, (int8x16_t)v73, 8uLL);
      v78 = (float64x2_t)vextq_s8((int8x16_t)v73, (int8x16_t)v74, 8uLL);
      v79 = (float64x2_t)vextq_s8((int8x16_t)v72, (int8x16_t)v71, 8uLL);
      v80 = (float64x2_t)vextq_s8((int8x16_t)v71, (int8x16_t)v72, 8uLL);
      v81 = vnegq_f64(v80);
      v82 = vnegq_f64(v79);
      v83 = (int64x2_t)vmlaq_f64(vmlaq_f64(vmulq_f64(v69, vmlaq_f64(vmulq_f64(v78, v82), v77, v80)), vmlaq_f64(vmulq_f64(v73, v81), v78, v71), v75), vmlaq_f64(vmulq_f64(v77, vnegq_f64(v71)), v73, v79), v76);
      v84 = (int64x2_t)vmlaq_f64(vmlaq_f64(vmulq_f64(v70, vmlaq_f64(vmulq_f64(v77, v81), v78, v79)), vmlaq_f64(vmulq_f64(v74, v82), v77, v72), v76), vmlaq_f64(vmulq_f64(v78, vnegq_f64(v72)), v74, v80), v75);
      if (vaddvq_f64(vsubq_f64(vmulq_f64(v129.val[0], (float64x2_t)vzip1q_s64(v84, v83)), vmulq_f64(v129.val[1], (float64x2_t)vzip2q_s64(v84, v83)))) == 0.0)
      {
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_16879);
        v85 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
        {
          v86 = (void *)MEMORY[0x1E0CB3940];
          v87 = v85;
          objc_msgSend(v86, "stringWithFormat:", CFSTR("Supplied transform is not invertible"));
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf.f64[0]) = 138543362;
          *(_QWORD *)((char *)buf.f64 + 4) = v88;
          _os_log_impl(&dword_1A6553000, v87, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", (uint8_t *)&buf, 0xCu);

          v89 = _NULogOnceToken;
          if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
          {
            if (v89 != -1)
              dispatch_once(&_NULogOnceToken, &__block_literal_global_16879);
LABEL_12:
            v96 = (void *)_NUAssertLogger;
            if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
            {
              specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
              v102 = (void *)MEMORY[0x1E0CB3978];
              v103 = specific;
              v104 = v96;
              objc_msgSend(v102, "callStackSymbols");
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v105, "componentsJoinedByString:", CFSTR("\n"));
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(buf.f64[0]) = 138543618;
              *(_QWORD *)((char *)buf.f64 + 4) = specific;
              WORD2(buf.f64[1]) = 2114;
              *(_QWORD *)((char *)&buf.f64[1] + 6) = v106;
              _os_log_error_impl(&dword_1A6553000, v104, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

LABEL_20:
              goto LABEL_17;
            }
            goto LABEL_17;
          }
          if (v89 != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_16879);
        }
        else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          goto LABEL_12;
        }
        v107 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          v109 = (void *)MEMORY[0x1E0CB3978];
          v104 = v107;
          objc_msgSend(v109, "callStackSymbols");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "componentsJoinedByString:", CFSTR("\n"));
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf.f64[0]) = 138543362;
          *(_QWORD *)((char *)buf.f64 + 4) = v111;
          _os_log_error_impl(&dword_1A6553000, v104, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

          goto LABEL_20;
        }
LABEL_17:
        _NUAssertContinueHandler((uint64_t)"-[NUImageTransform3D initWithTransform3D:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUGeometryTransform.m", 287, CFSTR("Supplied transform is not invertible"), v97, v98, v99, v100, v112);
      }
    }
  }
  return v56;
}

- (NUImageTransform3D)init
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *specific;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  objc_class *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_16879);
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_16879);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_16879);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v12 = (void *)MEMORY[0x1E0CB3978];
    v13 = v11;
    objc_msgSend(v12, "callStackSymbols");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v18 = (void *)MEMORY[0x1E0CB3978];
  v19 = specific;
  v13 = v16;
  objc_msgSend(v18, "callStackSymbols");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v29 = specific;
  v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  NSStringFromClass(v22);
  v23 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUImageTransform3D init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUGeometryTransform.m", 296, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (BOOL)isIdentityImageTransform
{
  int64x2_t v2;

  v2 = (int64x2_t)vandq_s8(vandq_s8(vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self[1]._anon_10[16], *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 32)), (int8x16_t)vceqq_f64(*(float64x2_t *)&self[1].super.super.super.isa, *MEMORY[0x1E0C83FD8])), vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self[1]._anon_10[48], *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 64)), (int8x16_t)vceqq_f64(*(float64x2_t *)&self[1]._anon_10[80], *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 96)))), vandq_s8(vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self[1]._anon_10[32], *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 48)), (int8x16_t)vceqq_f64(
                                     *(float64x2_t *)self[1]._anon_10,
                                     *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 16))),
                      vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self[1]._anon_10[64], *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 80)), (int8x16_t)vceqq_f64(*(float64x2_t *)&self[1]._anon_10[96], *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 112)))));
  return vandq_s8((int8x16_t)v2, (int8x16_t)vdupq_laneq_s64(v2, 1)).u64[0] >> 63;
}

- (BOOL)isInverseOf:(id)a3
{
  float64x2_t v3;
  int64x2_t v4;
  _BOOL8 v5;
  int64x2_t v6;

  v3 = (float64x2_t)vdupq_n_s64(0x3EE4F8B588E368F1uLL);
  v4 = (int64x2_t)vandq_s8(vandq_s8(vandq_s8((int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)&self[1]._anon_10[16], *((float64x2_t *)a3 + 3))), (int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)&self[1].super.super.super.isa, *((float64x2_t *)a3 + 1)))), vandq_s8((int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)&self[1]._anon_10[48], *((float64x2_t *)a3 + 5))), (int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)&self[1]._anon_10[80], *((float64x2_t *)a3 + 7))))), vandq_s8(vandq_s8((int8x16_t)vcgeq_f64(v3,
                                     vabdq_f64(*(float64x2_t *)&self[1]._anon_10[32], *((float64x2_t *)a3 + 4))),
                        (int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)self[1]._anon_10, *((float64x2_t *)a3 + 2)))),
                      vandq_s8((int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)&self[1]._anon_10[64], *((float64x2_t *)a3 + 6))), (int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)&self[1]._anon_10[96], *((float64x2_t *)a3 + 8))))));
  if ((vandq_s8((int8x16_t)v4, (int8x16_t)vdupq_laneq_s64(v4, 1)).u64[0] & 0x8000000000000000) != 0)
  {
    v6 = (int64x2_t)vandq_s8(vandq_s8(vandq_s8((int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)&self->_anon_10[32], *((float64x2_t *)a3 + 12))), (int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)self->_anon_10, *((float64x2_t *)a3 + 10)))), vandq_s8((int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)&self->_anon_10[64], *((float64x2_t *)a3 + 14))), (int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)&self->_anon_10[96], *((float64x2_t *)a3 + 16))))), vandq_s8(vandq_s8((int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)&self->_anon_10[48], *((float64x2_t *)a3 + 13))), (int8x16_t)vcgeq_f64(
                                       v3,
                                       vabdq_f64(*(float64x2_t *)&self->_anon_10[16], *((float64x2_t *)a3 + 11)))),
                        vandq_s8((int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)&self->_anon_10[80], *((float64x2_t *)a3 + 15))), (int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)&self->_anon_10[112], *((float64x2_t *)a3 + 17))))));
    return vandq_s8((int8x16_t)v6, (int8x16_t)vdupq_laneq_s64(v6, 1)).u64[0] >> 63;
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)inverseTransform
{
  NUImageTransform3D *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD v22[8];

  v3 = [NUImageTransform3D alloc];
  v4 = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 80);
  v22[4] = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 64);
  v22[5] = v4;
  v5 = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 112);
  v22[6] = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 96);
  v22[7] = v5;
  v6 = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 16);
  v22[0] = *MEMORY[0x1E0C83FD8];
  v22[1] = v6;
  v7 = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 48);
  v22[2] = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 32);
  v22[3] = v7;
  v8 = -[NUImageTransform3D initWithTransform3D:](v3, "initWithTransform3D:", v22);
  v9 = *(_OWORD *)&self->_anon_10[48];
  v11 = *(_OWORD *)self->_anon_10;
  v10 = *(_OWORD *)&self->_anon_10[16];
  *(_OWORD *)(v8 + 192) = *(_OWORD *)&self->_anon_10[32];
  *(_OWORD *)(v8 + 208) = v9;
  *(_OWORD *)(v8 + 160) = v11;
  *(_OWORD *)(v8 + 176) = v10;
  v12 = *(_OWORD *)&self->_anon_10[112];
  v14 = *(_OWORD *)&self->_anon_10[64];
  v13 = *(_OWORD *)&self->_anon_10[80];
  *(_OWORD *)(v8 + 256) = *(_OWORD *)&self->_anon_10[96];
  *(_OWORD *)(v8 + 272) = v12;
  *(_OWORD *)(v8 + 224) = v14;
  *(_OWORD *)(v8 + 240) = v13;
  v15 = *(_OWORD *)&self[1]._anon_10[32];
  v17 = *(_OWORD *)&self[1].super.super.super.isa;
  v16 = *(_OWORD *)self[1]._anon_10;
  *(_OWORD *)(v8 + 48) = *(_OWORD *)&self[1]._anon_10[16];
  *(_OWORD *)(v8 + 64) = v15;
  *(_OWORD *)(v8 + 16) = v17;
  *(_OWORD *)(v8 + 32) = v16;
  v18 = *(_OWORD *)&self[1]._anon_10[96];
  v20 = *(_OWORD *)&self[1]._anon_10[48];
  v19 = *(_OWORD *)&self[1]._anon_10[64];
  *(_OWORD *)(v8 + 112) = *(_OWORD *)&self[1]._anon_10[80];
  *(_OWORD *)(v8 + 128) = v18;
  *(_OWORD *)(v8 + 80) = v20;
  *(_OWORD *)(v8 + 96) = v19;
  *(_BYTE *)(v8 + 144) ^= 1u;
  return (id)v8;
}

- (CGPoint)transformPoint:(CGPoint)a3
{
  int64x2_t v3;
  int64x2_t v4;
  int64x2_t v5;
  int64x2_t v6;
  const double *v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  double v21;
  int64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  double v26;
  CGPoint result;
  float64x2x4_t v28;

  v4 = *(int64x2_t *)&self[1].super.super.super.isa;
  v3 = *(int64x2_t *)self[1]._anon_10;
  v5 = *(int64x2_t *)&self[1]._anon_10[16];
  v6 = *(int64x2_t *)&self[1]._anon_10[32];
  v7 = (const double *)&self[1]._anon_10[48];
  v28 = vld4q_f64(v7);
  v8 = (float64x2_t)vzip1q_s64(v4, v5);
  v9 = (float64x2_t)vzip2q_s64(v4, v5);
  v10 = (float64x2_t)vzip1q_s64(v3, v6);
  v11 = (float64x2_t)vzip2q_s64(v3, v6);
  v12 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3.y, 0);
  if (self->_inverseProjection)
  {
    v13 = vmlaq_f64(vmulq_n_f64(v8, a3.x), v12, v9);
    v14 = vmlaq_f64(vmulq_n_f64(v28.val[0], a3.x), v12, v28.val[1]);
    v15 = (float64x2_t)vdupq_n_s64(0xC08F400000000000);
    v16 = vmlaq_f64(v14, v15, v28.val[2]);
    v17 = vaddq_f64(v11, vmlaq_f64(v13, v15, v10));
    v18 = vaddq_f64(v28.val[3], v16);
    v19 = (float64x2_t)vdupq_n_s64(0x408F400000000000uLL);
    v20 = vaddq_f64(v28.val[3], vmlaq_f64(v14, v19, v28.val[2]));
    v21 = v18.f64[0] / (v20.f64[0] - v18.f64[0]);
    v22 = (int64x2_t)vmlsq_lane_f64(v18, vsubq_f64(v20, v18), v21, 0);
    v23 = vmlsq_lane_f64(v17, vsubq_f64(vaddq_f64(v11, vmlaq_f64(v13, v19, v10)), v17), v21, 0);
  }
  else
  {
    v24 = vmlaq_f64(vmlaq_f64(vmulq_n_f64(v8, a3.x), v12, v9), (float64x2_t)0, v10);
    v22 = (int64x2_t)vaddq_f64(v28.val[3], vmlaq_f64(vmlaq_f64(vmulq_n_f64(v28.val[0], a3.x), v12, v28.val[1]), (float64x2_t)0, v28.val[2]));
    v23 = vaddq_f64(v11, v24);
  }
  v25 = vdivq_f64(v23, (float64x2_t)vdupq_laneq_s64(v22, 1));
  v26 = v25.f64[1];
  result.x = v25.f64[0];
  result.y = v26;
  return result;
}

- (_OWORD)transformMatrix:(_OWORD *)a3@<X8>
{
  uint64_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t *v18;
  _OWORD v19[8];

  v3 = 0;
  v5 = *a2;
  v4 = a2[1];
  v7 = a2[2];
  v6 = a2[3];
  v9 = a2[4];
  v8 = a2[5];
  v11 = a2[6];
  v10 = a2[7];
  v12 = result[15];
  v19[4] = result[14];
  v19[5] = v12;
  v13 = result[17];
  v19[6] = result[16];
  v19[7] = v13;
  v14 = result[11];
  v19[0] = result[10];
  v19[1] = v14;
  v15 = result[13];
  v19[2] = result[12];
  v19[3] = v15;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  a3[5] = 0u;
  a3[6] = 0u;
  a3[7] = 0u;
  do
  {
    v17 = (float64x2_t)v19[v3];
    v16 = (float64x2_t)v19[v3 + 1];
    v18 = (float64x2_t *)&a3[v3];
    *v18 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v5, v17.f64[0]), v7, v17, 1), v9, v16.f64[0]), v11, v16, 1);
    v18[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v4, v17.f64[0]), v6, v17, 1), v8, v16.f64[0]), v10, v16, 1);
    v3 += 2;
  }
  while (v3 != 8);
  return result;
}

- (id)transformByScaleX:(double)a3 scaleY:(double)a4
{
  uint64_t v4;
  float64x2_t v5;
  float64x2_t v6;
  __int128 v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t *v10;
  __int128 v12;
  __int128 vars0;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v4 = 0;
  v5 = (float64x2_t)*(unint64_t *)&a3;
  v6.f64[0] = 0.0;
  v6.f64[1] = a4;
  v7 = *(_OWORD *)self[1]._anon_10;
  v12 = *(_OWORD *)&self[1].super.super.super.isa;
  vars0 = v7;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  do
  {
    v9 = *(float64x2_t *)((char *)&v12 + v4);
    v8 = *(float64x2_t *)((char *)&v12 + v4 + 16);
    v10 = (float64x2_t *)((char *)&v14 + v4);
    *v10 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v5, v9.f64[0]), v6, v9, 1), (float64x2_t)0, v8.f64[0]), (float64x2_t)0, v8, 1);
    v10[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)0, v9.f64[0]), (float64x2_t)0, v9, 1), (float64x2_t)xmmword_1A671A2A0, v8.f64[0]), (float64x2_t)xmmword_1A671A290, v8, 1);
    v4 += 32;
  }
  while (v4 != 128);
  v12 = v14;
  vars0 = v15;
  return -[NUImageTransform3D initWithTransform3D:]([NUImageTransform3D alloc], "initWithTransform3D:", &v12);
}

- (id)transformByTranslateX:(double)a3 translateY:(double)a4
{
  uint64_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  __int128 v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t *v16;
  __int128 v18;
  __int128 vars0;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v4 = 0;
  v5 = *(float64x2_t *)MEMORY[0x1E0C83FD8];
  v9 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 16);
  v6 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 32);
  v12 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 48);
  v8 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 64);
  v7 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 80);
  v9.f64[1] = a3;
  v11 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 96);
  v10 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 112);
  v12.f64[1] = a4;
  v13 = *(_OWORD *)self[1]._anon_10;
  v18 = *(_OWORD *)&self[1].super.super.super.isa;
  vars0 = v13;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  do
  {
    v15 = *(float64x2_t *)((char *)&v18 + v4);
    v14 = *(float64x2_t *)((char *)&v18 + v4 + 16);
    v16 = (float64x2_t *)((char *)&v20 + v4);
    *v16 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v5, v15.f64[0]), v6, v15, 1), v8, v14.f64[0]), v11, v14, 1);
    v16[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v9, v15.f64[0]), v12, v15, 1), v7, v14.f64[0]), v10, v14, 1);
    v4 += 32;
  }
  while (v4 != 128);
  v18 = v20;
  vars0 = v21;
  return -[NUImageTransform3D initWithTransform3D:]([NUImageTransform3D alloc], "initWithTransform3D:", &v18);
}

- (id)transformByRotateZ:(double)a3
{
  NUImageTransform3D *v3;
  float64x2_t v4;
  __double2 v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t *v13;
  float64x2_t v15;
  float64x2_t vars0;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;

  v3 = self + 1;
  v19 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 48);
  v20 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 16);
  v17 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 112);
  v18 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 64);
  v15 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 96);
  vars0 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 80);
  v5 = __sincos_stret(a3 * 3.14159265 / 180.0);
  v4.f64[0] = v5.__cosval;
  v6 = 0;
  v7 = *(_OWORD *)&v3->_anon_10[64];
  v25 = *(_OWORD *)&v3->_anon_10[48];
  v26 = v7;
  v8 = *(_OWORD *)&v3->_anon_10[96];
  v27 = *(_OWORD *)&v3->_anon_10[80];
  v28 = v8;
  v9 = *(_OWORD *)v3->_anon_10;
  v21 = *(_OWORD *)&v3->super.super.super.isa;
  v22 = v9;
  v10 = *(_OWORD *)&v3->_anon_10[32];
  v23 = *(_OWORD *)&v3->_anon_10[16];
  v24 = v10;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  do
  {
    v12 = *(float64x2_t *)((char *)&v21 + v6);
    v11 = *(float64x2_t *)((char *)&v21 + v6 + 16);
    v4.f64[1] = -v5.__sinval;
    v13 = (float64x2_t *)((char *)&v29 + v6);
    *v13 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v4, v12.f64[0]), (float64x2_t)v5, v12, 1), v18, v11.f64[0]), v15, v11, 1);
    v13[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v20, v12.f64[0]), v19, v12, 1), vars0, v11.f64[0]), v17, v11, 1);
    v6 += 32;
  }
  while (v6 != 128);
  v25 = v33;
  v26 = v34;
  v27 = v35;
  v28 = v36;
  v21 = v29;
  v22 = v30;
  v23 = v31;
  v24 = v32;
  return -[NUImageTransform3D initWithTransform3D:]([NUImageTransform3D alloc], "initWithTransform3D:", &v21);
}

- (id)transformByRotateX:(double)a3 y:(double)a4 z:(double)a5
{
  NUImageTransform3D *v5;
  double v6;
  double v7;
  float64x2_t v8;
  __double2 v9;
  float64x2_t v10;
  __double2 v11;
  uint64_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v18;
  float64x2_t v20;
  float64x2_t v21;
  __double2 v29;
  float64x2_t v31;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  float64x2_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t *v46;
  float64x2_t v48;
  float64x2_t v49;
  float64x2_t vars0;
  double v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;

  v5 = self + 1;
  v6 = a4 * 3.14159265 / 180.0;
  v7 = a5 * 3.14159265 / 180.0;
  v9 = __sincos_stret(a3 * 3.14159265 / 180.0 * 0.5);
  v8.f64[0] = v9.__sinval;
  *(_QWORD *)&v51 = *(_OWORD *)&vmulq_f64(v8, (float64x2_t)0);
  vars0 = vmulq_n_f64((float64x2_t)xmmword_1A671A2A0, v9.__sinval);
  v11 = __sincos_stret(v6 * 0.5);
  v10.f64[0] = v11.__sinval;
  *(_QWORD *)&v10.f64[0] = *(_OWORD *)&vmulq_f64(v10, (float64x2_t)0);
  v10.f64[1] = v11.__cosval;
  v48 = v10;
  v49 = vmulq_n_f64((float64x2_t)xmmword_1A671A290, v11.__sinval);
  v29 = __sincos_stret(v7 * 0.5);
  v12 = 0;
  v13 = vmulq_n_f64((float64x2_t)0, v29.__sinval);
  v14 = vnegq_f64(v49);
  v15 = (float64x2_t)vextq_s8((int8x16_t)v48, (int8x16_t)vnegq_f64(v48), 8uLL);
  _Q6 = vmlaq_n_f64(vmulq_laneq_f64(v48, vars0, 1), v15, vars0.f64[0]);
  _Q1 = vaddq_f64(vmlaq_n_f64(vmulq_n_f64(v48, v9.__cosval), v15, v51), vmlaq_n_f64(vmulq_laneq_f64(v14, vars0, 1), (float64x2_t)vextq_s8((int8x16_t)v49, (int8x16_t)v14, 8uLL), vars0.f64[0]));
  v18 = vaddq_f64(vmlaq_n_f64(vmulq_n_f64(v49, v9.__cosval), (float64x2_t)vextq_s8((int8x16_t)v14, (int8x16_t)v49, 8uLL), v51), _Q6);
  _Q5 = vnegq_f64(v13);
  v20 = (float64x2_t)vextq_s8((int8x16_t)v29, (int8x16_t)vnegq_f64((float64x2_t)v29), 8uLL);
  v21 = vmlaq_n_f64(vmulq_laneq_f64((float64x2_t)v29, v18, 1), v20, v18.f64[0]);
  _Q3 = vaddq_f64(vmlaq_n_f64(vmulq_laneq_f64(_Q5, v18, 1), (float64x2_t)vextq_s8((int8x16_t)v13, (int8x16_t)_Q5, 8uLL), v18.f64[0]), vmlaq_n_f64(vmulq_laneq_f64((float64x2_t)v29, _Q1, 1), v20, _Q1.f64[0]));
  _Q4 = vaddq_f64(v21, vmlaq_n_f64(vmulq_laneq_f64(v13, _Q1, 1), (float64x2_t)vextq_s8((int8x16_t)_Q5, (int8x16_t)v13, 8uLL), _Q1.f64[0]));
  _Q5.f64[0] = _Q4.f64[1];
  __asm { FMLS            D1, D3, V3.D[0] }
  _D7 = _Q3.f64[1];
  __asm { FMLA            D1, D7, V3.D[1] }
  v29.__sinval = vmlad_n_f64(vmuld_lane_f64(_Q3.f64[0], _Q3, 1), _Q4.f64[1], _Q4.f64[0]);
  v13.f64[0] = v29.__sinval + v29.__sinval;
  v21.f64[0] = vmuld_lane_f64(_Q4.f64[1], _Q3, 1);
  v29.__sinval = vmlad_n_f64(-(_Q4.f64[1] * _Q3.f64[1]), _Q3.f64[0], _Q4.f64[0]);
  v29.__sinval = v29.__sinval + v29.__sinval;
  _Q1.f64[1] = v13.f64[0];
  v13.f64[0] = vmlad_n_f64(-(_Q3.f64[0] * _Q3.f64[1]), _Q4.f64[1], _Q4.f64[0]);
  v13.f64[0] = v13.f64[0] + v13.f64[0];
  __asm
  {
    FMLA            D6, D5, V4.D[1]
    FMLA            D6, D7, V3.D[1]
    FMLS            D6, D4, V4.D[0]
    FMLA            D17, D3, V4.D[1]
  }
  v13.f64[1] = _Q6.f64[0];
  _Q6.f64[0] = -(_Q4.f64[0] * _Q3.f64[1]);
  v31 = (float64x2_t)vzip1q_s64((int64x2_t)_Q4, (int64x2_t)_Q3);
  __asm
  {
    FMLS            D7, D4, V4.D[0]
    FMLS            D7, D5, V4.D[1]
  }
  _Q4.f64[0] = _Q3.f64[0];
  v21.f64[1] = _Q6.f64[0];
  v34 = vmlaq_f64(v21, v31, _Q4);
  v36 = vaddq_f64(v34, v34);
  v35 = (float64x2_t)vzip2q_s64((int64x2_t)v36, (int64x2_t)0);
  v36.f64[1] = 0.0;
  v37 = (float64x2_t)*(unint64_t *)&_Q5.f64[0];
  v37.f64[0] = _D7;
  v38 = *(_OWORD *)&v5->_anon_10[64];
  v56 = *(_OWORD *)&v5->_anon_10[48];
  v57 = v38;
  v39 = *(_OWORD *)&v5->_anon_10[96];
  v58 = *(_OWORD *)&v5->_anon_10[80];
  v59 = v39;
  v40 = *(_OWORD *)v5->_anon_10;
  v52 = *(_OWORD *)&v5->super.super.super.isa;
  v53 = v40;
  v41 = *(_OWORD *)&v5->_anon_10[32];
  v54 = *(_OWORD *)&v5->_anon_10[16];
  v55 = v41;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v42 = (float64x2_t)vzip1q_s64((int64x2_t)_Q1, (int64x2_t)v13);
  v64 = 0u;
  v65 = 0u;
  v43 = (float64x2_t)vzip2q_s64((int64x2_t)_Q1, (int64x2_t)v13);
  v66 = 0u;
  v67 = 0u;
  do
  {
    v45 = *(float64x2_t *)((char *)&v52 + v12);
    v44 = *(float64x2_t *)((char *)&v52 + v12 + 16);
    v46 = (float64x2_t *)((char *)&v60 + v12);
    v29.__cosval = _D17 + _D17;
    *v46 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v42, v45.f64[0]), v43, v45, 1), (float64x2_t)v29, v44.f64[0]), (float64x2_t)0, v44, 1);
    v46[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v36, v45.f64[0]), v35, v45, 1), v37, v44.f64[0]), (float64x2_t)xmmword_1A671A290, v44, 1);
    v12 += 32;
  }
  while (v12 != 128);
  v56 = v64;
  v57 = v65;
  v58 = v66;
  v59 = v67;
  v52 = v60;
  v53 = v61;
  v54 = v62;
  v55 = v63;
  return -[NUImageTransform3D initWithTransform3D:]([NUImageTransform3D alloc], "initWithTransform3D:", &v52);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NUImageTransform3D  m11=%f m12=%f m13=%f m14=%f m21=%f m22=%f m23=%f m24=%f m31=%f m32=%f m33=%f m34=%f m41=%f m42=%f m43=%f m44=%f "), self[1].super.super.super.isa, *(_QWORD *)self[1]._anon_8, *(_QWORD *)self[1]._anon_10, *(_QWORD *)&self[1]._anon_10[8], *(_QWORD *)&self[1]._anon_10[16], *(_QWORD *)&self[1]._anon_10[24], *(_QWORD *)&self[1]._anon_10[32], *(_QWORD *)&self[1]._anon_10[40], *(_QWORD *)&self[1]._anon_10[48], *(_QWORD *)&self[1]._anon_10[56], *(_QWORD *)&self[1]._anon_10[64], *(_QWORD *)&self[1]._anon_10[72], *(_QWORD *)&self[1]._anon_10[80], *(_QWORD *)&self[1]._anon_10[88], *(_QWORD *)&self[1]._anon_10[96], *(_QWORD *)&self[1]._anon_10[104]);
}

- (unint64_t)hash
{
  int64x2_t v2;
  int64x2_t v3;
  float64x2_t v4;
  int64x2_t v5;
  int64x2_t v6;
  float64x2_t v7;
  void *v8;
  unint64_t v9;

  v2 = (int64x2_t)vaddq_f64(vmulq_f64(*(float64x2_t *)&self[1].super.super.super.isa, (float64x2_t)xmmword_1A671A440), vmulq_f64(*(float64x2_t *)self[1]._anon_10, (float64x2_t)xmmword_1A671A430));
  v3 = (int64x2_t)vaddq_f64(vmulq_f64(*(float64x2_t *)&self[1]._anon_10[16], (float64x2_t)xmmword_1A671A460), vmulq_f64(*(float64x2_t *)&self[1]._anon_10[32], (float64x2_t)xmmword_1A671A450));
  v4 = vaddq_f64((float64x2_t)vzip1q_s64(v2, v3), (float64x2_t)vzip2q_s64(v2, v3));
  v5 = (int64x2_t)vaddq_f64(vmulq_f64(*(float64x2_t *)&self[1]._anon_10[48], (float64x2_t)xmmword_1A671A480), vmulq_f64(*(float64x2_t *)&self[1]._anon_10[64], (float64x2_t)xmmword_1A671A470));
  v6 = (int64x2_t)vaddq_f64(vmulq_f64(*(float64x2_t *)&self[1]._anon_10[80], (float64x2_t)xmmword_1A671A4A0), vmulq_f64(*(float64x2_t *)&self[1]._anon_10[96], (float64x2_t)xmmword_1A671A490));
  v7 = vaddq_f64((float64x2_t)vzip1q_s64(v5, v6), (float64x2_t)vzip2q_s64(v5, v6));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4.f64[0] + 0.0 + v4.f64[1] + v7.f64[0] + v7.f64[1]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  NUImageTransform3D *v4;
  BOOL v5;

  v4 = (NUImageTransform3D *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[NUImageTransform3D isEqualToGeometryTransform3D:](self, "isEqualToGeometryTransform3D:", v4);
  }

  return v5;
}

- (BOOL)isEqualToGeometryTransform3D:(id)a3
{
  float64x2_t *v4;
  int64x2_t v5;
  NSObject *v7;
  void *v8;
  void *specific;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = (float64x2_t *)a3;
  if (!v4)
  {
    NUAssertLogger_16917();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "other != nil");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v8;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_16917();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v15 = (void *)MEMORY[0x1E0CB3978];
        v16 = v14;
        objc_msgSend(v15, "callStackSymbols");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v14;
        v42 = 2114;
        v43 = v18;
        _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v13;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUImageTransform3D isEqualToGeometryTransform3D:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUGeometryTransform.m", 460, CFSTR("Invalid parameter not satisfying: %s"), v19, v20, v21, v22, (uint64_t)"other != nil");
  }
  v35 = *(float64x2_t *)&self[1].super.super.super.isa;
  v38 = *(float64x2_t *)&self[1]._anon_10[32];
  v39 = *(float64x2_t *)self[1]._anon_10;
  v34 = *(float64x2_t *)&self[1]._anon_10[16];
  v37 = *(float64x2_t *)&self[1]._anon_10[64];
  v33 = *(float64x2_t *)&self[1]._anon_10[48];
  v36 = *(float64x2_t *)&self[1]._anon_10[96];
  v31 = v4[11];
  v32 = *(float64x2_t *)&self[1]._anon_10[80];
  v26 = v4[12];
  v27 = v4[10];
  v29 = v4[15];
  v30 = v4[13];
  v28 = v4[17];
  v24 = v4[16];
  v25 = v4[14];

  v5 = (int64x2_t)vandq_s8(vandq_s8(vandq_s8((int8x16_t)vceqq_f64(v34, v26), (int8x16_t)vceqq_f64(v35, v27)), vandq_s8((int8x16_t)vceqq_f64(v33, v25), (int8x16_t)vceqq_f64(v32, v24))), vandq_s8(vandq_s8((int8x16_t)vceqq_f64(v38, v30), (int8x16_t)vceqq_f64(v39, v31)), vandq_s8((int8x16_t)vceqq_f64(v37, v29), (int8x16_t)vceqq_f64(v36, v28))));
  return vandq_s8((int8x16_t)v5, (int8x16_t)vdupq_laneq_s64(v5, 1)).u64[0] >> 63;
}

- (void)nu_updateDigest:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "addCString:", "NUImageTransform3D");
  objc_msgSend(v4, "addBytes:length:", &self[1], 128);

}

- (void)transform
{
  objc_copyStruct(a2, (const void *)(a1 + 160), 128, 1, 0);
}

@end
