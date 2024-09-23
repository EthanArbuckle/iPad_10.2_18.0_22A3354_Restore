@implementation NUHistogramCalculator

- (NUHistogramCalculator)init
{
  NUHistogramCalculator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NUHistogramCalculator;
  result = -[NUHistogramCalculator init](&v3, sel_init);
  result->_range = ($7B59B1D66D8657D7171CFE400C1A1779)xmmword_1A671A290;
  result->_colorMatrix.r = ($43F634250C0E94E2A09AB0840E4770D1)NUStandardLuminanceColorMatrix;
  result->_colorMatrix.g = ($43F634250C0E94E2A09AB0840E4770D1)unk_1A671A158;
  result->_colorMatrix.b = ($43F634250C0E94E2A09AB0840E4770D1)xmmword_1A671A168;
  result->_binCount = 256;
  result->_colorMatrix.a = ($43F634250C0E94E2A09AB0840E4770D1)unk_1A671A178;
  return result;
}

- (id)computeHistogramFromBuffer:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  NSObject *v19;
  void *v20;
  void *specific;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_1866();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "buffer != nil");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v20;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1866();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v34 = (void *)MEMORY[0x1E0CB3978];
        v35 = v33;
        objc_msgSend(v34, "callStackSymbols");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v33;
        v53 = 2114;
        v54 = v37;
        _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v25;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUHistogramCalculator computeHistogramFromBuffer:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogramCalculator.m", 58, CFSTR("Invalid parameter not satisfying: %s"), v38, v39, v40, v41, (uint64_t)"buffer != nil");
  }
  if (!a4)
  {
    NUAssertLogger_1866();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v27;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1866();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v30)
      {
        v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v43 = (void *)MEMORY[0x1E0CB3978];
        v44 = v42;
        objc_msgSend(v43, "callStackSymbols");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v42;
        v53 = 2114;
        v54 = v46;
        _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v30)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v32;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUHistogramCalculator computeHistogramFromBuffer:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogramCalculator.m", 59, CFSTR("Invalid parameter not satisfying: %s"), v47, v48, v49, v50, (uint64_t)"error != NULL");
  }
  v7 = v6;
  objc_msgSend(v6, "format");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[NUPixelFormat BGRA8](NUPixelFormat, "BGRA8");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToPixelFormat:", v9);

  if (v10)
  {
    if (self->_binCount == 256)
    {
      if (self->_range.min == 0.0 && self->_range.max == 1.0)
      {
        -[NUHistogramCalculator _computeHistogramForBufferBGRA8:error:](self, "_computeHistogramForBufferBGRA8:error:", v7, a4);
        v11 = objc_claimAutoreleasedReturnValue();
LABEL_19:
        v17 = (void *)v11;
        goto LABEL_17;
      }
      v15 = CFSTR("Unsupported histogram range for 8-bit image");
      goto LABEL_16;
    }
LABEL_13:
    v15 = CFSTR("Unsupported histogram bin count for 8-bit image");
LABEL_16:
    +[NUError unsupportedError:object:](NUError, "unsupportedError:object:", v15, self);
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  objc_msgSend(v7, "format");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[NUPixelFormat RGBAh](NUPixelFormat, "RGBAh");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToPixelFormat:", v13);

  if (v14)
  {
    if (self->_binCount >= 1)
    {
      if (self->_range.min >= 0.0 && self->_range.max <= 12.0)
      {
        -[NUHistogramCalculator _computeHistogramForBufferRGBAhHLG:error:](self, "_computeHistogramForBufferRGBAhHLG:error:", v7, a4);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
      v15 = CFSTR("Unsupported histogram range for half float HDR image");
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  objc_msgSend(v7, "format");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[NUError unsupportedError:object:](NUError, "unsupportedError:object:", CFSTR("Unsupported pixel format"), v16);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  v17 = 0;
LABEL_17:

  return v17;
}

- (id)_computeHistogramForBufferBGRA8:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NUMutableImageHistogram *v8;
  unsigned int v9;
  id v10;
  int v11;
  id v12;
  unsigned int v13;
  void *v14;
  NUMutableImageHistogram *v15;
  void *v16;
  NSObject *v18;
  void *v19;
  void *specific;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[4];
  id v51;
  uint64_t *v52;
  vImage_Buffer v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  vImage_Error v57;
  vImage_Buffer dest;
  int16_t matrix[16];
  vImage_Buffer src;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_1866();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "buffer != nil");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v19;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1866();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v33 = (void *)MEMORY[0x1E0CB3978];
        v34 = v32;
        objc_msgSend(v33, "callStackSymbols");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(src.data) = 138543618;
        *(void **)((char *)&src.data + 4) = v32;
        WORD2(src.height) = 2114;
        *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v36;
        _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);

      }
    }
    else if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v24;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUHistogramCalculator _computeHistogramForBufferBGRA8:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogramCalculator.m", 114, CFSTR("Invalid parameter not satisfying: %s"), v37, v38, v39, v40, (uint64_t)"buffer != nil");
  }
  if (!a4)
  {
    NUAssertLogger_1866();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v26;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);

    }
    v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1866();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v42 = (void *)MEMORY[0x1E0CB3978];
        v43 = v41;
        objc_msgSend(v42, "callStackSymbols");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "componentsJoinedByString:", CFSTR("\n"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(src.data) = 138543618;
        *(void **)((char *)&src.data + 4) = v41;
        WORD2(src.height) = 2114;
        *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v45;
        _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);

      }
    }
    else if (v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v31;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUHistogramCalculator _computeHistogramForBufferBGRA8:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogramCalculator.m", 115, CFSTR("Invalid parameter not satisfying: %s"), v46, v47, v48, v49, (uint64_t)"error != NULL");
  }
  v7 = v6;
  v8 = objc_alloc_init(NUMutableImageHistogram);
  src.data = (void *)objc_msgSend(v7, "bytes");
  objc_msgSend(v7, "size");
  src.height = v9;
  LODWORD(src.width) = objc_msgSend(v7, "size");
  src.width = LODWORD(src.width);
  src.rowBytes = objc_msgSend(v7, "rowBytes");
  v10 = objc_alloc(MEMORY[0x1E0C99DF0]);
  objc_msgSend(v7, "size");
  v12 = objc_retainAutorelease((id)objc_msgSend(v10, "initWithLength:", v11 * objc_msgSend(v7, "rowBytes")));
  dest.data = (void *)objc_msgSend(v12, "mutableBytes");
  objc_msgSend(v7, "size");
  dest.height = v13;
  LODWORD(dest.width) = objc_msgSend(v7, "size");
  dest.width = LODWORD(dest.width);
  dest.rowBytes = objc_msgSend(v7, "rowBytes");
  matrix[0] = (int)rintf(ldexpf(self->_colorMatrix.a.b, 10));
  matrix[1] = (int)rintf(ldexpf(self->_colorMatrix.r.b, 10));
  matrix[2] = (int)rintf(ldexpf(self->_colorMatrix.g.b, 10));
  matrix[3] = (int)rintf(ldexpf(self->_colorMatrix.b.b, 10));
  matrix[4] = (int)rintf(ldexpf(self->_colorMatrix.a.g, 10));
  matrix[5] = (int)rintf(ldexpf(self->_colorMatrix.r.g, 10));
  matrix[6] = (int)rintf(ldexpf(self->_colorMatrix.g.g, 10));
  matrix[7] = (int)rintf(ldexpf(self->_colorMatrix.b.g, 10));
  matrix[8] = (int)rintf(ldexpf(self->_colorMatrix.a.r, 10));
  matrix[9] = (int)rintf(ldexpf(self->_colorMatrix.r.r, 10));
  matrix[10] = (int)rintf(ldexpf(self->_colorMatrix.g.r, 10));
  matrix[11] = (int)rintf(ldexpf(self->_colorMatrix.b.r, 10));
  matrix[12] = (int)rintf(ldexpf(self->_colorMatrix.a.a, 10));
  matrix[13] = (int)rintf(ldexpf(self->_colorMatrix.r.a, 10));
  matrix[14] = (int)rintf(ldexpf(self->_colorMatrix.g.a, 10));
  matrix[15] = (int)rintf(ldexpf(self->_colorMatrix.b.a, 10));
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  v57 = vImageMatrixMultiply_ARGB8888(&src, &dest, matrix, 1024, 0, 0, 0);
  if (v55[3])
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("vImageMatrixMultiply_ARGB8888 failed"), v14);
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __63__NUHistogramCalculator__computeHistogramForBufferBGRA8_error___block_invoke;
    v50[3] = &unk_1E5060C78;
    v52 = &v54;
    v53 = dest;
    v51 = v7;
    -[NUMutableImageHistogram write:](v8, "write:", v50);
    if (v55[3])
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("vImageHistogramCalculation_ARGB8888 failed"), v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v15 = 0;
    }
    else
    {
      v15 = v8;
    }
    v14 = v51;
  }

  _Block_object_dispose(&v54, 8);
  return v15;
}

- (id)_computeHistogramForBufferRGBAhHLG:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  double min;
  double max;
  NUMutableImageHistogram *v10;
  unsigned int v11;
  id v12;
  uint64_t v13;
  id v14;
  unsigned int v15;
  void *v16;
  NUMutableImageHistogram *v17;
  id v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  float g;
  float r;
  float v24;
  float v25;
  float v26;
  float v27;
  float a;
  float b;
  float v30;
  float v31;
  float v32;
  float v33;
  vImage_Error v34;
  void *v35;
  void *v36;
  NSObject *v38;
  void *v39;
  void *specific;
  NSObject *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  _BOOL4 v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD v70[4];
  id v71;
  uint64_t *v72;
  vImage_Buffer v73;
  double v74;
  double v75;
  vImage_Buffer v76;
  vImage_Buffer v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  vImage_Error v81;
  vImage_Buffer dest;
  vImage_Buffer src;
  float matrix;
  void *v85;
  _BYTE v86[12];
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float v92;
  float v93;
  float v94;
  float v95;
  float v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_1866();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "buffer != nil");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      matrix = 5.8381e-34;
      v85 = v39;
      _os_log_error_impl(&dword_1A6553000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&matrix, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1866();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v42)
      {
        v52 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v53 = (void *)MEMORY[0x1E0CB3978];
        v54 = v52;
        objc_msgSend(v53, "callStackSymbols");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "componentsJoinedByString:", CFSTR("\n"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        matrix = 5.8382e-34;
        v85 = v52;
        *(_WORD *)v86 = 2114;
        *(_QWORD *)&v86[2] = v56;
        _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&matrix, 0x16u);

      }
    }
    else if (v42)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      matrix = 5.8381e-34;
      v85 = v44;
      _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&matrix, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUHistogramCalculator _computeHistogramForBufferRGBAhHLG:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogramCalculator.m", 169, CFSTR("Invalid parameter not satisfying: %s"), v57, v58, v59, v60, (uint64_t)"buffer != nil");
  }
  if (!a4)
  {
    NUAssertLogger_1866();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      matrix = 5.8381e-34;
      v85 = v46;
      _os_log_error_impl(&dword_1A6553000, v45, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&matrix, 0xCu);

    }
    v47 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1866();
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = os_log_type_enabled(v48, OS_LOG_TYPE_ERROR);
    if (v47)
    {
      if (v49)
      {
        v61 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v62 = (void *)MEMORY[0x1E0CB3978];
        v63 = v61;
        objc_msgSend(v62, "callStackSymbols");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "componentsJoinedByString:", CFSTR("\n"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        matrix = 5.8382e-34;
        v85 = v61;
        *(_WORD *)v86 = 2114;
        *(_QWORD *)&v86[2] = v65;
        _os_log_error_impl(&dword_1A6553000, v48, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&matrix, 0x16u);

      }
    }
    else if (v49)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "componentsJoinedByString:", CFSTR("\n"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      matrix = 5.8381e-34;
      v85 = v51;
      _os_log_error_impl(&dword_1A6553000, v48, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&matrix, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUHistogramCalculator _computeHistogramForBufferRGBAhHLG:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogramCalculator.m", 170, CFSTR("Invalid parameter not satisfying: %s"), v66, v67, v68, v69, (uint64_t)"error != NULL");
  }
  v7 = v6;
  min = self->_range.min;
  max = self->_range.max;
  v10 = -[NUImageHistogram initWithBinCount:range:]([NUMutableImageHistogram alloc], "initWithBinCount:range:", self->_binCount, min, max);
  src.data = (void *)objc_msgSend(v7, "bytes");
  objc_msgSend(v7, "size");
  src.height = v11;
  src.width = 4 * objc_msgSend(v7, "size");
  src.rowBytes = objc_msgSend(v7, "rowBytes");
  v12 = objc_alloc(MEMORY[0x1E0C99DF0]);
  objc_msgSend(v7, "size");
  v14 = objc_retainAutorelease((id)objc_msgSend(v12, "initWithLength:", 16 * v13 * objc_msgSend(v7, "size")));
  dest.data = (void *)objc_msgSend(v14, "mutableBytes");
  objc_msgSend(v7, "size");
  dest.height = v15;
  dest.width = 4 * objc_msgSend(v7, "size");
  dest.rowBytes = 16 * objc_msgSend(v7, "size");
  v78 = 0;
  v79 = &v78;
  v80 = 0x2020000000;
  v81 = 0;
  v81 = vImageConvert_Planar16FtoPlanarF(&src, &dest, 0);
  if (v79[3])
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("vImageConvert_Planar16FtoPlanarF failed"), v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v17 = 0;
  }
  else
  {
    v18 = objc_retainAutorelease(v14);
    v77.data = (void *)objc_msgSend(v18, "mutableBytes");
    objc_msgSend(v7, "size");
    v77.height = v19;
    LODWORD(v77.width) = objc_msgSend(v7, "size");
    v77.width = LODWORD(v77.width);
    v77.rowBytes = 16 * objc_msgSend(v7, "size");
    v76.data = (void *)objc_msgSend(objc_retainAutorelease(v18), "mutableBytes");
    objc_msgSend(v7, "size");
    v76.height = v20;
    LODWORD(v76.width) = objc_msgSend(v7, "size");
    v76.width = LODWORD(v76.width);
    v21 = objc_msgSend(v7, "size");
    g = self->_colorMatrix.a.g;
    r = self->_colorMatrix.r.r;
    v24 = self->_colorMatrix.r.g;
    matrix = self->_colorMatrix.a.r;
    *(float *)&v85 = r;
    v25 = self->_colorMatrix.g.g;
    v26 = self->_colorMatrix.b.r;
    v27 = self->_colorMatrix.b.g;
    HIDWORD(v85) = LODWORD(self->_colorMatrix.g.r);
    *(float *)v86 = v26;
    *(float *)&v86[4] = g;
    *(float *)&v86[8] = v24;
    v87 = v25;
    v88 = v27;
    a = self->_colorMatrix.a.a;
    b = self->_colorMatrix.r.b;
    v30 = self->_colorMatrix.r.a;
    v89 = self->_colorMatrix.a.b;
    v90 = b;
    v31 = self->_colorMatrix.g.a;
    v32 = self->_colorMatrix.b.b;
    v33 = self->_colorMatrix.b.a;
    v91 = self->_colorMatrix.g.b;
    v92 = v32;
    v93 = a;
    v94 = v30;
    v76.rowBytes = 16 * v21;
    v95 = v31;
    v96 = v33;
    v34 = vImageMatrixMultiply_ARGBFFFF(&v77, &v76, &matrix, 0, 0, 0);
    v79[3] = v34;
    if (v34)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("vImageMatrixMultiply_ARGBFFFF failed"), v35);
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __66__NUHistogramCalculator__computeHistogramForBufferRGBAhHLG_error___block_invoke;
      v70[3] = &unk_1E5060CA0;
      v72 = &v78;
      v73 = v76;
      v74 = min;
      v75 = max;
      v71 = v7;
      -[NUMutableImageHistogram write:](v10, "write:", v70);
      if (v79[3])
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("vImageHistogramCalculation_ARGBFFFF failed"), v36);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        v17 = 0;
      }
      else
      {
        v17 = v10;
      }
      v35 = v71;
    }

  }
  _Block_object_dispose(&v78, 8);

  return v17;
}

- (id)computeHistogramFromMatteBuffer:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithNUImageBuffer:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUHistogramCalculator computeHistogramFromMatte:](self, "computeHistogramFromMatte:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)computeHistogramFromMatte:(id)a3
{
  id v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  int64_t v19;
  NUMutableHistogram *v20;
  NSObject *v22;
  void *v23;
  void *specific;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[7];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C9DDB8], "areaHistogramFilter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInputImage:", v4);
    objc_msgSend(v4, "extent");
    objc_msgSend(v5, "setExtent:");
    objc_msgSend(v5, "setCount:", -[NUHistogramCalculator binCount](self, "binCount"));
    LODWORD(v6) = 1.0;
    objc_msgSend(v5, "setScale:", v6);
    objc_msgSend(v5, "outputImage");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      NUAssertLogger_1866();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to produce histogram for matte image"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v41 = v23;
        _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_1866();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v26)
        {
          v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v30 = (void *)MEMORY[0x1E0CB3978];
          v31 = v29;
          objc_msgSend(v30, "callStackSymbols");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v41 = v29;
          v42 = 2114;
          v43 = v33;
          _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v26)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v41 = v28;
        _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"-[NUHistogramCalculator computeHistogramFromMatte:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogramCalculator.m", 269, CFSTR("Failed to produce histogram for matte image"), v34, v35, v36, v37, v38);
    }
    v8 = (void *)v7;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 4 * -[NUHistogramCalculator binCount](self, "binCount"));
    objc_msgSend(MEMORY[0x1E0C9DD90], "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_retainAutorelease(v9);
    v12 = objc_msgSend(v11, "mutableBytes");
    v13 = objc_msgSend(v11, "length");
    objc_msgSend(v8, "extent");
    objc_msgSend(v10, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v8, v12, v13, *MEMORY[0x1E0C9E090], 0);
    v14 = objc_retainAutorelease(v11);
    v15 = objc_msgSend(v14, "bytes");
    objc_msgSend(v4, "extent");
    v18 = v16 * v17;
    v19 = -[NUHistogramCalculator binCount](self, "binCount");
    v20 = -[NUHistogram initWithBinCount:range:]([NUMutableHistogram alloc], "initWithBinCount:range:", v19, 0.0, 1.0);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __51__NUHistogramCalculator_computeHistogramFromMatte___block_invoke;
    v39[3] = &__block_descriptor_56_e12_q24__0_q8q16l;
    v39[4] = v19;
    v39[5] = v15;
    *(double *)&v39[6] = v18;
    -[NUMutableHistogram write:](v20, "write:", v39);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (int64_t)binCount
{
  return self->_binCount;
}

- (void)setBinCount:(int64_t)a3
{
  self->_binCount = a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)range
{
  double min;
  double max;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  min = self->_range.min;
  max = self->_range.max;
  result.var1 = max;
  result.var0 = min;
  return result;
}

- (void)setRange:(id)a3
{
  self->_range = ($7B59B1D66D8657D7171CFE400C1A1779)a3;
}

- ($6DEFAE59D8B0B490C28D581BBA01C329)colorMatrix
{
  $C28CD4A45FD07A4F97CC9D5F91F25271 var3;
  $C28CD4A45FD07A4F97CC9D5F91F25271 var1;

  var3 = self->var3;
  retstr->var0 = self->var2;
  retstr->var1 = var3;
  var1 = self[1].var1;
  retstr->var2 = self[1].var0;
  retstr->var3 = var1;
  return self;
}

- (void)setColorMatrix:(id *)a3
{
  $43F634250C0E94E2A09AB0840E4770D1 var0;
  $43F634250C0E94E2A09AB0840E4770D1 var1;
  $43F634250C0E94E2A09AB0840E4770D1 var3;

  var0 = ($43F634250C0E94E2A09AB0840E4770D1)a3->var0;
  var1 = ($43F634250C0E94E2A09AB0840E4770D1)a3->var1;
  var3 = ($43F634250C0E94E2A09AB0840E4770D1)a3->var3;
  self->_colorMatrix.b = ($43F634250C0E94E2A09AB0840E4770D1)a3->var2;
  self->_colorMatrix.a = var3;
  self->_colorMatrix.r = var0;
  self->_colorMatrix.g = var1;
}

uint64_t __51__NUHistogramCalculator_computeHistogramFromMatte___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;

  if (*(uint64_t *)(a1 + 32) < 1)
    return 0;
  v2 = 0;
  v3 = 0;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(double *)(a1 + 48);
  do
  {
    v6 = v5 * *(float *)(v4 + 4 * v2);
    *(_QWORD *)(a2 + 8 * v2) = (uint64_t)v6;
    v3 += (uint64_t)v6;
    ++v2;
  }
  while (v2 < *(_QWORD *)(a1 + 32));
  return v3;
}

uint64_t __66__NUHistogramCalculator__computeHistogramForBufferRGBAhHLG_error___block_invoke(uint64_t a1, vImagePixelCount *a2, vImagePixelCount *a3, vImagePixelCount *a4, vImagePixelCount *a5, unsigned int histogram_entries)
{
  Pixel_F v7;
  Pixel_F v8;
  uint64_t v9;
  vImagePixelCount *histogram[4];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  histogram[0] = a5;
  histogram[1] = a2;
  histogram[2] = a3;
  histogram[3] = a4;
  v7 = *(double *)(a1 + 80);
  v8 = *(double *)(a1 + 88);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = vImageHistogramCalculation_ARGBFFFF((const vImage_Buffer *)(a1 + 48), histogram, histogram_entries, v7, v8, 0);
  objc_msgSend(*(id *)(a1 + 32), "size");
  return objc_msgSend(*(id *)(a1 + 32), "size") * v9;
}

uint64_t __63__NUHistogramCalculator__computeHistogramForBufferBGRA8_error___block_invoke(uint64_t a1, vImagePixelCount *a2, vImagePixelCount *a3, vImagePixelCount *a4, vImagePixelCount *a5)
{
  uint64_t v6;
  vImagePixelCount *histogram[4];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  histogram[0] = a5;
  histogram[1] = a2;
  histogram[2] = a3;
  histogram[3] = a4;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = vImageHistogramCalculation_ARGB8888((const vImage_Buffer *)(a1 + 48), histogram, 0);
  objc_msgSend(*(id *)(a1 + 32), "size");
  return objc_msgSend(*(id *)(a1 + 32), "size") * v6;
}

@end
