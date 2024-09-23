@implementation NUAlphaHistogramCalculator

- (NUAlphaHistogramCalculator)init
{
  NUAlphaHistogramCalculator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NUAlphaHistogramCalculator;
  result = -[NUHistogramCalculator init](&v3, sel_init);
  result->_luminanceWeights = ($43F634250C0E94E2A09AB0840E4770D1)NUStandardLuminanceWeights;
  *(_QWORD *)&result->_luminanceThresholds.r = 0;
  *(_QWORD *)&result->_luminanceThresholds.b = 0;
  return result;
}

- (id)computeHistogramFromBuffer:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  NSObject *v17;
  void *v18;
  void *specific;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_1866();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "buffer != nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1866();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v32 = (void *)MEMORY[0x1E0CB3978];
        v33 = v31;
        objc_msgSend(v32, "callStackSymbols");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v31;
        v51 = 2114;
        v52 = v35;
        _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUAlphaHistogramCalculator computeHistogramFromBuffer:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogramCalculator.m", 308, CFSTR("Invalid parameter not satisfying: %s"), v36, v37, v38, v39, (uint64_t)"buffer != nil");
  }
  if (!a4)
  {
    NUAssertLogger_1866();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v25;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1866();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v41 = (void *)MEMORY[0x1E0CB3978];
        v42 = v40;
        objc_msgSend(v41, "callStackSymbols");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v40;
        v51 = 2114;
        v52 = v44;
        _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v28)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v30;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUAlphaHistogramCalculator computeHistogramFromBuffer:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogramCalculator.m", 309, CFSTR("Invalid parameter not satisfying: %s"), v45, v46, v47, v48, (uint64_t)"error != NULL");
  }
  v7 = v6;
  objc_msgSend(v6, "format");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[NUPixelFormat BGRA8](NUPixelFormat, "BGRA8");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToPixelFormat:", v9);

  if (!v10)
  {
    objc_msgSend(v7, "format");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError unsupportedError:object:](NUError, "unsupportedError:object:", CFSTR("Unsupported pixel format"), v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    goto LABEL_12;
  }
  if (-[NUHistogramCalculator binCount](self, "binCount") != 256)
  {
    v15 = CFSTR("Unsupported histogram bin count for 8-bit image");
LABEL_11:
    +[NUError unsupportedError:object:](NUError, "unsupportedError:object:", v15, self);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  -[NUHistogramCalculator range](self, "range");
  if (v11 != 0.0 || (-[NUHistogramCalculator range](self, "range"), v12 != 1.0))
  {
    v15 = CFSTR("Unsupported histogram range for 8-bit image");
    goto LABEL_11;
  }
  -[NUAlphaHistogramCalculator _computeAlphaHistogramForBufferBGRA8:error:](self, "_computeAlphaHistogramForBufferBGRA8:error:", v7, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v13;
}

- (id)_computeAlphaHistogramForBufferBGRA8:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  float g;
  float b;
  float a;
  float v11;
  float32x4_t v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float32x4_t v17;
  NUMutableImageHistogram *v18;
  id v19;
  NSObject *v21;
  void *v22;
  void *specific;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  int32x4_t v58;
  float v59;
  int32x4_t v60;
  _QWORD v61[4];
  int32x4_t v62;
  int32x4_t v63;
  id v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_1866();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "buffer != nil");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v66 = v22;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1866();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = (void *)MEMORY[0x1E0CB3978];
        v37 = v35;
        objc_msgSend(v36, "callStackSymbols");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v66 = v35;
        v67 = 2114;
        v68 = v39;
        _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v66 = v27;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUAlphaHistogramCalculator _computeAlphaHistogramForBufferBGRA8:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogramCalculator.m", 343, CFSTR("Invalid parameter not satisfying: %s"), v40, v41, v42, v43, (uint64_t)"buffer != nil");
  }
  if (!a4)
  {
    NUAssertLogger_1866();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v66 = v29;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1866();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v45 = (void *)MEMORY[0x1E0CB3978];
        v46 = v44;
        objc_msgSend(v45, "callStackSymbols");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v66 = v44;
        v67 = 2114;
        v68 = v48;
        _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v32)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v66 = v34;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUAlphaHistogramCalculator _computeAlphaHistogramForBufferBGRA8:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogramCalculator.m", 344, CFSTR("Invalid parameter not satisfying: %s"), v49, v50, v51, v52, (uint64_t)"error != NULL");
  }
  v7 = v6;
  g = self->_luminanceWeights.g;
  b = self->_luminanceWeights.b;
  a = self->_luminanceWeights.a;
  v59 = ldexpf(self->_luminanceWeights.r, 10);
  v56 = ldexpf(g, 10);
  v54 = ldexpf(b, 10);
  v11 = ldexpf(a, 10);
  v12.i64[0] = __PAIR64__(LODWORD(v56), LODWORD(v59));
  v12.i64[1] = __PAIR64__(LODWORD(v11), LODWORD(v54));
  v60 = vmovl_s16(vmovn_s32(vcvtq_s32_f32(vrndxq_f32(v12))));
  v13 = self->_luminanceThresholds.g;
  v14 = self->_luminanceThresholds.b;
  v15 = self->_luminanceThresholds.a;
  v57 = ldexpf(self->_luminanceThresholds.r, 8);
  v55 = ldexpf(v13, 8);
  v53 = ldexpf(v14, 8);
  v16 = ldexpf(v15, 8);
  v17.i64[0] = __PAIR64__(LODWORD(v55), LODWORD(v57));
  v17.i64[1] = __PAIR64__(LODWORD(v16), LODWORD(v53));
  v58 = vmovl_s16(vmovn_s32(vcvtq_s32_f32(vrndxq_f32(v17))));
  v18 = objc_alloc_init(NUMutableImageHistogram);
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __73__NUAlphaHistogramCalculator__computeAlphaHistogramForBufferBGRA8_error___block_invoke;
  v61[3] = &unk_1E5060CE8;
  v64 = v7;
  v62 = v60;
  v63 = v58;
  v19 = v7;
  -[NUMutableImageHistogram write:](v18, "write:", v61);

  return v18;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)luminanceWeights
{
  float r;
  float g;
  float b;
  float a;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  r = self->_luminanceWeights.r;
  g = self->_luminanceWeights.g;
  b = self->_luminanceWeights.b;
  a = self->_luminanceWeights.a;
  result.var3 = a;
  result.var2 = b;
  result.var1 = g;
  result.var0 = r;
  return result;
}

- (void)setLuminanceWeights:(id)a3
{
  self->_luminanceWeights = ($43F634250C0E94E2A09AB0840E4770D1)a3;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)luminanceThresholds
{
  float r;
  float g;
  float b;
  float a;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  r = self->_luminanceThresholds.r;
  g = self->_luminanceThresholds.g;
  b = self->_luminanceThresholds.b;
  a = self->_luminanceThresholds.a;
  result.var3 = a;
  result.var2 = b;
  result.var1 = g;
  result.var0 = r;
  return result;
}

- (void)setLuminanceThresholds:(id)a3
{
  self->_luminanceThresholds = ($43F634250C0E94E2A09AB0840E4770D1)a3;
}

uint64_t __73__NUAlphaHistogramCalculator__computeAlphaHistogramForBufferBGRA8_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint32x4_t v15;
  uint64_t v16;
  uint64_t i;
  __int32 *v18;
  uint64_t v19;
  __int32 v20;
  int16x4_t v21;
  int8x8_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int v25;
  int v26;
  uint64_t v27;
  int v28;
  uint64_t v29;

  v10 = objc_msgSend(*(id *)(a1 + 64), "size");
  v12 = v11;
  v13 = objc_msgSend(*(id *)(a1 + 64), "bytes");
  v14 = objc_msgSend(*(id *)(a1 + 64), "rowBytes");
  if (v12 < 1)
    return 0;
  v16 = 0;
  for (i = 0; i != v12; ++i)
  {
    if (v10 >= 1)
    {
      v18 = (__int32 *)(v13 + i * v14);
      v19 = v10;
      do
      {
        v20 = *v18++;
        v15.i32[0] = v20;
        v21 = (int16x4_t)vmovl_u8(*(uint8x8_t *)v15.i8).u64[0];
        v22 = (int8x8_t)vrev32_s16(v21);
        v23 = (int32x4_t)vmovl_u16((uint16x4_t)vext_s8(v22, v22, 6uLL));
        v24 = *(int32x4_t *)(a1 + 48);
        v25 = vaddvq_s32(vmulq_s32(*(int32x4_t *)(a1 + 32), v23));
        v26 = v25 + 1535;
        v27 = v21.u16[3];
        *(_QWORD *)(a2 + 8 * v23.u32[0]) += v21.u8[6];
        if (v25 + 512 >= 0)
          v26 = v25 + 512;
        v28 = v26 >> 10;
        v23.i32[3] = v28;
        v15 = (uint32x4_t)vcgeq_s32(v23, v24);
        *(_QWORD *)(a3 + 8 * v23.u32[1]) += v27;
        *(_QWORD *)(a4 + 8 * v23.u32[2]) += v27;
        if ((vminvq_u32(v15) & 0x80000000) == 0)
          v29 = 0;
        else
          v29 = v27;
        *(_QWORD *)(a5 + 8 * v28) += v29;
        v16 += v27;
        --v19;
      }
      while (v19);
    }
  }
  return v16;
}

@end
