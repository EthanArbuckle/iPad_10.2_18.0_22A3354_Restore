@implementation NUIOSurface

- (NUIOSurface)init
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11348);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_11348);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11348);
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
  _NUAssertFailHandler((uint64_t)"-[NUIOSurface init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 31, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (NUIOSurface)initWithSize:(id)a3 format:(id)a4
{
  int64_t var1;
  int64_t var0;
  NUPixelFormat *v7;
  NUPixelFormat *v8;
  NUIOSurface *v9;
  NUPixelFormat *format;
  NSObject *v12;
  void *v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  objc_super v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  var1 = a3.var1;
  var0 = a3.var0;
  v49 = *MEMORY[0x1E0C80C00];
  v7 = (NUPixelFormat *)a4;
  if (var0 < 1 || var1 <= 0)
  {
    NUAssertLogger_11337();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "size.width > 0 && size.height > 0");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_11337();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v27 = (void *)MEMORY[0x1E0CB3978];
        v28 = v26;
        objc_msgSend(v27, "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v26;
        v47 = 2114;
        v48 = v30;
        _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurface initWithSize:format:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 36, CFSTR("Invalid parameter not satisfying: %s"), v31, v32, v33, v34, (uint64_t)"size.width > 0 && size.height > 0");
  }
  v8 = v7;
  if (!v7)
  {
    NUAssertLogger_11337();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "format != nil");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v20;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_11337();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v21)
    {
      if (v23)
      {
        v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = (void *)MEMORY[0x1E0CB3978];
        v37 = v35;
        objc_msgSend(v36, "callStackSymbols");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v35;
        v47 = 2114;
        v48 = v39;
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
      v46 = v25;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurface initWithSize:format:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 37, CFSTR("Invalid parameter not satisfying: %s"), v40, v41, v42, v43, (uint64_t)"format != nil");
  }
  v44.receiver = self;
  v44.super_class = (Class)NUIOSurface;
  v9 = -[NUIOSurface init](&v44, sel_init);
  v9->_size.width = var0;
  v9->_size.height = var1;
  format = v9->_format;
  v9->_format = v8;

  -[NUIOSurface _allocateSurface](v9, "_allocateSurface");
  return v9;
}

- (NUIOSurface)initWithIOSurface:(__IOSurface *)a3
{
  NUIOSurface *v4;
  __IOSurface *v5;
  uint64_t v6;
  NUPixelFormat *format;
  NSObject *v9;
  void *v10;
  void *specific;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_11337();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "surface != NULL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v10;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_11337();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v17 = (void *)MEMORY[0x1E0CB3978];
        v18 = v16;
        objc_msgSend(v17, "callStackSymbols");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v16;
        v28 = 2114;
        v29 = v20;
        _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v15;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurface initWithIOSurface:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 51, CFSTR("Invalid parameter not satisfying: %s"), v21, v22, v23, v24, (uint64_t)"surface != NULL");
  }
  v25.receiver = self;
  v25.super_class = (Class)NUIOSurface;
  v4 = -[NUIOSurface init](&v25, sel_init);
  v5 = (__IOSurface *)CFRetain(a3);
  v4->_IOSurfaceRef = v5;
  v4->_size.width = IOSurfaceGetWidth(v5);
  v4->_size.height = IOSurfaceGetHeight(v4->_IOSurfaceRef);
  +[NUPixelFormat pixelFormatForCVPixelFormat:](NUPixelFormat, "pixelFormatForCVPixelFormat:", IOSurfaceGetPixelFormat(v4->_IOSurfaceRef));
  v6 = objc_claimAutoreleasedReturnValue();
  format = v4->_format;
  v4->_format = (NUPixelFormat *)v6;

  return v4;
}

- (IOSurface)IOSurface
{
  return (IOSurface *)self->_IOSurfaceRef;
}

- (void)_allocateSurface
{
  uint64_t v3;
  int64_t width;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFDictionary *v23;
  void *v24;
  void *v25;
  void *v26;
  __IOSurface *v27;
  NSObject *v28;
  void *v29;
  void *specific;
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
  int64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  int64_t v48;
  void *v49;
  void *v50;
  int64_t v51;
  void *v52;
  int64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  _QWORD v64[4];
  _QWORD v65[4];
  _QWORD v66[6];
  _QWORD v67[6];
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD v74[6];
  _QWORD v75[2];
  _QWORD v76[5];
  _QWORD v77[7];

  v77[5] = *MEMORY[0x1E0C80C00];
  if (-[NUPixelFormat isYCC](self->_format, "isYCC"))
  {
    v3 = -[NUPixelFormat chromaSubsampling](self->_format, "chromaSubsampling");
    width = self->_size.width;
    v5 = (v3 + width - 1) / v3;
    v7 = (v6 + self->_size.height - 1) / v6;
    v48 = v7;
    v8 = +[NUImageUtilities alignedRowBytesForWidth:bytesPerPixel:](NUImageUtilities, "alignedRowBytesForWidth:bytesPerPixel:", width, -[NUPixelFormat bytesPerLuma](self->_format, "bytesPerLuma"));
    v9 = self->_size.height * v8;
    v44 = v9;
    v51 = +[NUImageUtilities alignedRowBytesForWidth:bytesPerPixel:](NUImageUtilities, "alignedRowBytesForWidth:bytesPerPixel:", v5, -[NUPixelFormat bytesPerChroma](self->_format, "bytesPerChroma"));
    v53 = v51 * v7;
    v76[0] = *MEMORY[0x1E0CBC1E0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_size.width);
    v59 = objc_claimAutoreleasedReturnValue();
    v77[0] = v59;
    v76[1] = *MEMORY[0x1E0CBC008];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_size.height);
    v57 = objc_claimAutoreleasedReturnValue();
    v77[1] = v57;
    v76[2] = *MEMORY[0x1E0CBC070];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NUPixelFormat CVPixelFormat](self->_format, "CVPixelFormat"));
    v47 = objc_claimAutoreleasedReturnValue();
    v77[2] = v47;
    v76[3] = *MEMORY[0x1E0CBC158];
    v68 = *MEMORY[0x1E0CBC178];
    v10 = v68;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_size.width);
    v55 = objc_claimAutoreleasedReturnValue();
    v74[0] = v55;
    v69 = *MEMORY[0x1E0CBC140];
    v11 = v69;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_size.height);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v74[1] = v58;
    v70 = *MEMORY[0x1E0CBC090];
    v12 = v70;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NUPixelFormat bytesPerLuma](self->_format, "bytesPerLuma"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v74[2] = v56;
    v71 = *MEMORY[0x1E0CBC098];
    v13 = v71;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v74[3] = v54;
    v72 = *MEMORY[0x1E0CBC168];
    v14 = v72;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = *MEMORY[0x1E0CBC160];
    v15 = v73;
    v74[4] = v52;
    v74[5] = &unk_1E50A2550;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, &v68, 6);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = v50;
    v66[0] = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v46;
    v66[1] = v11;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v67[1] = v49;
    v66[2] = v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NUPixelFormat bytesPerChroma](self->_format, "bytesPerChroma"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v67[2] = v45;
    v66[3] = v13;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v51);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v67[3] = v16;
    v66[4] = v14;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v53);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v67[4] = v17;
    v66[5] = v15;
    v18 = (void *)v47;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v44);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v67[5] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v75[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v77[3] = v21;
    v76[4] = *MEMORY[0x1E0CBBEE0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v53 + v44);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v77[4] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 5);
    v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)v57;
    v25 = (void *)v59;

    v26 = (void *)v55;
  }
  else
  {
    v64[0] = *MEMORY[0x1E0CBC1E0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_size.width);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v25;
    v64[1] = *MEMORY[0x1E0CBC008];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_size.height);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v65[1] = v24;
    v64[2] = *MEMORY[0x1E0CBC070];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NUPixelFormat CVPixelFormat](self->_format, "CVPixelFormat"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v65[2] = v18;
    v64[3] = *MEMORY[0x1E0CBBF00];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NUPixelFormat bytesPerPixel](self->_format, "bytesPerPixel"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v65[3] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 4);
    v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  }

  v27 = IOSurfaceCreate(v23);
  self->_IOSurfaceRef = v27;
  if (!v27)
  {
    NUAssertLogger_11337();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create IOSurface with properties: %@ and NUPixelFormat:%@"), v23, self->_format);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v61 = v29;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_11337();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v32)
      {
        v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = (void *)MEMORY[0x1E0CB3978];
        v37 = v35;
        objc_msgSend(v36, "callStackSymbols");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v61 = v35;
        v62 = 2114;
        v63 = v39;
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
      v61 = v34;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurface _allocateSurface]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 117, CFSTR("Failed to create IOSurface with properties: %@ and NUPixelFormat:%@"), v40, v41, v42, v43, (uint64_t)v23);
  }

}

- (void)dealloc
{
  __IOSurface *IOSurfaceRef;
  objc_super v4;

  IOSurfaceRef = self->_IOSurfaceRef;
  if (IOSurfaceRef)
    CFRelease(IOSurfaceRef);
  v4.receiver = self;
  v4.super_class = (Class)NUIOSurface;
  -[NUIOSurface dealloc](&v4, sel_dealloc);
}

- (int64_t)rowBytes
{
  return IOSurfaceGetBytesPerRow(self->_IOSurfaceRef);
}

- (int64_t)sizeInBytes
{
  return IOSurfaceGetAllocSize(self->_IOSurfaceRef);
}

- (NSString)name
{
  void *v2;
  void *v3;

  v2 = (void *)IOSurfaceCopyValue(self->_IOSurfaceRef, (CFStringRef)*MEMORY[0x1E0CBC048]);
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (void)setName:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  IOSurfaceSetValue(self->_IOSurfaceRef, (CFStringRef)*MEMORY[0x1E0CBC048], v4);

}

- (CGColorSpace)colorSpace
{
  CGColorSpace *result;
  CGColorSpace *v3;
  CGColorSpaceRef v4;
  CGColorSpace *v5;

  result = (CGColorSpace *)IOSurfaceCopyValue(self->_IOSurfaceRef, (CFStringRef)*MEMORY[0x1E0CBBF90]);
  if (result)
  {
    v3 = result;
    v4 = CGColorSpaceCreateWithPropertyList(result);
    v5 = (CGColorSpace *)CFAutorelease(v4);
    CFRelease(v3);
    return v5;
  }
  return result;
}

- (void)setColorSpace:(CGColorSpace *)a3
{
  CFPropertyListRef v4;
  const void *v5;

  if (a3)
  {
    v4 = CGColorSpaceCopyPropertyList(a3);
    if (v4)
    {
      v5 = v4;
      IOSurfaceSetValue(self->_IOSurfaceRef, (CFStringRef)*MEMORY[0x1E0CBBF90], v4);
      CFRelease(v5);
    }
  }
  else
  {
    IOSurfaceRemoveValue(self->_IOSurfaceRef, (CFStringRef)*MEMORY[0x1E0CBBF90]);
  }
}

- (void)makePurgeable:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = IOSurfaceSetPurgeable(self->_IOSurfaceRef, -[NUIOSurface _purgeLevelToOSValue:](self, "_purgeLevelToOSValue:", a3), 0);
  if ((_DWORD)v4)
  {
    v5 = v4;
    NUAssertLogger_11337();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ failed to set volatile state: %d"), self, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_11337();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v23 = v13;
        v24 = 2114;
        v25 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurface makePurgeable:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 176, CFSTR("%@ failed to set volatile state: %d"), v18, v19, v20, v21, (uint64_t)self);
  }
}

- (BOOL)makeNonPurgeable
{
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint32_t oldState;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  oldState = 0;
  v3 = IOSurfaceSetPurgeable(self->_IOSurfaceRef, 0, &oldState);
  if ((_DWORD)v3)
  {
    v5 = v3;
    NUAssertLogger_11337();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ failed to set non volatile state: %d"), self, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_11337();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v13;
        v25 = 2114;
        v26 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurface makeNonPurgeable]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 183, CFSTR("%@ failed to set non volatile state: %d"), v18, v19, v20, v21, (uint64_t)self);
  }
  return oldState != 2;
}

- (BOOL)isPurged
{
  int v4;

  v4 = 0;
  return !-[NUIOSurface _fetchPurgeState:](self, "_fetchPurgeState:", &v4) && v4 == 2;
}

- (int)_fetchPurgeState:(unsigned int *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *specific;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = IOSurfaceSetPurgeable(self->_IOSurfaceRef, 3u, a3);
  if ((_DWORD)v4)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11348);
    v5 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = v5;
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ failed to read purgeable: %d"), self, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v8;
      _os_log_impl(&dword_1A6553000, v7, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      v9 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (v9 != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_11348);
LABEL_9:
        v10 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v16 = (void *)MEMORY[0x1E0CB3978];
          v17 = specific;
          v18 = v10;
          objc_msgSend(v16, "callStackSymbols");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v27 = specific;
          v28 = 2114;
          v29 = v20;
          _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_17:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v9 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_11348);
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_9;
    }
    v21 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      v23 = (void *)MEMORY[0x1E0CB3978];
      v18 = v21;
      objc_msgSend(v23, "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v25;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_17;
    }
LABEL_14:
    _NUAssertContinueHandler((uint64_t)"-[NUIOSurface _fetchPurgeState:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 204, CFSTR("%@ failed to read purgeable: %d"), v11, v12, v13, v14, (uint64_t)self);
  }
  return v4;
}

- (id)_purgeStateDescription
{
  unsigned int v3;

  v3 = 0;
  if (-[NUIOSurface _fetchPurgeState:](self, "_fetchPurgeState:", &v3))
    return CFSTR("Purgeable (Error)");
  if (v3 > 2)
    return CFSTR("Purgeable (Unknown)");
  return off_1E5061F18[v3];
}

- (unsigned)_purgeLevelToOSValue:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return 33;
  else
    return dword_1A671A4F0[a3 - 1];
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NUPixelFormat *format;
  CGColorSpace *v6;
  void *v7;
  void *v8;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 size;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  size = self->_size;
  format = self->_format;
  v6 = -[NUIOSurface colorSpace](self, "colorSpace");
  -[NUIOSurface _purgeStateDescription](self, "_purgeStateDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p size:%dx%d format:%@ colorSpace:%@ purgeable:%@>"), v4, self, size, format, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)debugQuickLookObject
{
  return (id)objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithIOSurface:", self->_IOSurfaceRef);
}

- (BOOL)read:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  BOOL v6;
  void *BaseAddress;
  NUBufferAdapter *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *specific;
  NSObject *v55;
  _BOOL4 v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_11337();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "block != nil");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v53;
      _os_log_error_impl(&dword_1A6553000, v52, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_11337();
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = os_log_type_enabled(v55, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v56)
      {
        v59 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v60 = (void *)MEMORY[0x1E0CB3978];
        v61 = v59;
        objc_msgSend(v60, "callStackSymbols");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "componentsJoinedByString:", CFSTR("\n"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v69 = v59;
        v70 = 2114;
        v71 = v63;
        _os_log_error_impl(&dword_1A6553000, v55, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v56)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "componentsJoinedByString:", CFSTR("\n"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v58;
      _os_log_error_impl(&dword_1A6553000, v55, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurface read:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 270, CFSTR("Invalid parameter not satisfying: %s"), v64, v65, v66, v67, (uint64_t)"block != nil");
  }
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (!IOSurfaceLock(self->_IOSurfaceRef, 1u, 0))
  {
    BaseAddress = IOSurfaceGetBaseAddress(self->_IOSurfaceRef);
    v6 = BaseAddress != 0;
    if (BaseAddress)
    {
      v8 = -[NUBufferAdapter initWithSize:format:rowBytes:bytes:]([NUBufferAdapter alloc], "initWithSize:format:rowBytes:bytes:", self->_size.width, self->_size.height, self->_format, IOSurfaceGetBytesPerRow(self->_IOSurfaceRef), BaseAddress);
      ((void (**)(_QWORD, NUBufferAdapter *))v5)[2](v5, v8);
      -[NUBufferAdapter invalidate](v8, "invalidate");

      goto LABEL_19;
    }
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11348);
    v9 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = v9;
      objc_msgSend(v10, "stringWithFormat:", CFSTR("Invalid surface data: %@"), self);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v12;
      _os_log_impl(&dword_1A6553000, v11, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      v13 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (v13 != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_11348);
LABEL_13:
        v14 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v20 = (void *)MEMORY[0x1E0CB3978];
          v21 = v19;
          v22 = v14;
          objc_msgSend(v20, "callStackSymbols");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v69 = v19;
          v70 = 2114;
          v71 = v24;
          _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_37:
          goto LABEL_18;
        }
        goto LABEL_18;
      }
      if (v13 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_11348);
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_13;
    }
    v25 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      v49 = (void *)MEMORY[0x1E0CB3978];
      v22 = v25;
      objc_msgSend(v49, "callStackSymbols");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "componentsJoinedByString:", CFSTR("\n"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v51;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_37;
    }
LABEL_18:
    _NUAssertContinueHandler((uint64_t)"-[NUIOSurface read:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 280, CFSTR("Invalid surface data: %@"), v15, v16, v17, v18, (uint64_t)self);
LABEL_19:
    v26 = IOSurfaceUnlock(self->_IOSurfaceRef, 1u, 0);
    if (!(_DWORD)v26)
      goto LABEL_33;
    v27 = v26;
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11348);
    v28 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (void *)MEMORY[0x1E0CB3940];
      v30 = v28;
      objc_msgSend(v29, "stringWithFormat:", CFSTR("%@ failed to unlock: %d"), self, v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v31;
      _os_log_impl(&dword_1A6553000, v30, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      v32 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (v32 != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_11348);
LABEL_27:
        v33 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v39 = (void *)MEMORY[0x1E0CB3978];
          v40 = v38;
          v41 = v33;
          objc_msgSend(v39, "callStackSymbols");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v69 = v38;
          v70 = 2114;
          v71 = v43;
          _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_35:
          goto LABEL_32;
        }
        goto LABEL_32;
      }
      if (v32 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_11348);
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_27;
    }
    v44 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      v46 = (void *)MEMORY[0x1E0CB3978];
      v41 = v44;
      objc_msgSend(v46, "callStackSymbols");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v48;
      _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_35;
    }
LABEL_32:
    _NUAssertContinueHandler((uint64_t)"-[NUIOSurface read:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 290, CFSTR("%@ failed to unlock: %d"), v34, v35, v36, v37, (uint64_t)self);
    goto LABEL_33;
  }
  v6 = 0;
LABEL_33:

  return v6;
}

- (BOOL)write:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  BOOL v6;
  void *BaseAddress;
  NUMutableBufferAdapter *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *specific;
  NSObject *v55;
  _BOOL4 v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_11337();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "block != nil");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v53;
      _os_log_error_impl(&dword_1A6553000, v52, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_11337();
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = os_log_type_enabled(v55, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v56)
      {
        v59 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v60 = (void *)MEMORY[0x1E0CB3978];
        v61 = v59;
        objc_msgSend(v60, "callStackSymbols");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "componentsJoinedByString:", CFSTR("\n"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v69 = v59;
        v70 = 2114;
        v71 = v63;
        _os_log_error_impl(&dword_1A6553000, v55, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v56)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "componentsJoinedByString:", CFSTR("\n"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v58;
      _os_log_error_impl(&dword_1A6553000, v55, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurface write:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 298, CFSTR("Invalid parameter not satisfying: %s"), v64, v65, v66, v67, (uint64_t)"block != nil");
  }
  v5 = (void (**)(_QWORD, _QWORD))v4;
  v6 = 0;
  if (IOSurfaceLock(self->_IOSurfaceRef, 0, 0))
    goto LABEL_32;
  BaseAddress = IOSurfaceGetBaseAddress(self->_IOSurfaceRef);
  v6 = BaseAddress != 0;
  if (BaseAddress)
  {
    v8 = -[NUMutableBufferAdapter initWithSize:format:rowBytes:mutableBytes:]([NUMutableBufferAdapter alloc], "initWithSize:format:rowBytes:mutableBytes:", self->_size.width, self->_size.height, self->_format, IOSurfaceGetBytesPerRow(self->_IOSurfaceRef), BaseAddress);
    ((void (**)(_QWORD, NUMutableBufferAdapter *))v5)[2](v5, v8);
    -[NUBufferAdapter invalidate](v8, "invalidate");

    goto LABEL_18;
  }
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11348);
  v9 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = v9;
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Invalid surface data: %@"), self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v69 = v12;
    _os_log_impl(&dword_1A6553000, v11, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

    v13 = _NULogOnceToken;
    if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v13 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_11348);
LABEL_12:
      v14 = (void *)_NUAssertLogger;
      if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E0CB3978];
        v21 = v19;
        v22 = v14;
        objc_msgSend(v20, "callStackSymbols");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v69 = v19;
        v70 = 2114;
        v71 = v24;
        _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_36:
        goto LABEL_17;
      }
      goto LABEL_17;
    }
    if (v13 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11348);
  }
  else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    goto LABEL_12;
  }
  v25 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v49 = (void *)MEMORY[0x1E0CB3978];
    v22 = v25;
    objc_msgSend(v49, "callStackSymbols");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "componentsJoinedByString:", CFSTR("\n"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v69 = v51;
    _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_36;
  }
LABEL_17:
  _NUAssertContinueHandler((uint64_t)"-[NUIOSurface write:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 308, CFSTR("Invalid surface data: %@"), v15, v16, v17, v18, (uint64_t)self);
LABEL_18:
  v26 = IOSurfaceUnlock(self->_IOSurfaceRef, 0, 0);
  if ((_DWORD)v26)
  {
    v27 = v26;
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11348);
    v28 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (void *)MEMORY[0x1E0CB3940];
      v30 = v28;
      objc_msgSend(v29, "stringWithFormat:", CFSTR("%@ failed to unlock: %d"), self, v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v31;
      _os_log_impl(&dword_1A6553000, v30, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      v32 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (v32 != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_11348);
LABEL_26:
        v33 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v39 = (void *)MEMORY[0x1E0CB3978];
          v40 = v38;
          v41 = v33;
          objc_msgSend(v39, "callStackSymbols");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v69 = v38;
          v70 = 2114;
          v71 = v43;
          _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_34:
          goto LABEL_31;
        }
        goto LABEL_31;
      }
      if (v32 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_11348);
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_26;
    }
    v44 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      v46 = (void *)MEMORY[0x1E0CB3978];
      v41 = v44;
      objc_msgSend(v46, "callStackSymbols");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v48;
      _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_34;
    }
LABEL_31:
    _NUAssertContinueHandler((uint64_t)"-[NUIOSurface write:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 318, CFSTR("%@ failed to unlock: %d"), v34, v35, v36, v37, (uint64_t)self);
  }
LABEL_32:

  return v6;
}

- (id)newRenderDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0C9DDE8]);
  -[NUIOSurface IOSurface](self, "IOSurface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithIOSurface:", v4);

  objc_msgSend(v5, "setLabel:", CFSTR("NUIOSurface-new"));
  return v5;
}

- (id)textureForDevice:(id)a3
{
  id v4;
  void *v5;
  NUIOSurface *v6;
  NSMutableDictionary *textures;
  void *v8;
  id v9;
  NUIOSurface *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  void *v14;
  NSObject *v16;
  void *v17;
  void *specific;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_11337();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "device != nil");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v17;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_11337();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v24 = (void *)MEMORY[0x1E0CB3978];
        v25 = v23;
        objc_msgSend(v24, "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v23;
        v34 = 2114;
        v35 = v27;
        _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v22;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurface textureForDevice:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 334, CFSTR("Invalid parameter not satisfying: %s"), v28, v29, v30, v31, (uint64_t)"device != nil");
  }
  v5 = v4;
  v6 = self;
  objc_sync_enter(v6);
  textures = v6->_textures;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v5, "registryID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](textures, "objectForKeyedSubscript:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v6);
  if (!v9)
  {
    v9 = -[NUIOSurface _newTextureForDevice:](v6, "_newTextureForDevice:", v5);
    v10 = v6;
    objc_sync_enter(v10);
    v11 = v6->_textures;
    if (!v11)
    {
      v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v13 = v6->_textures;
      v6->_textures = v12;

      v11 = v6->_textures;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v5, "registryID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v9, v14);

    objc_sync_exit(v10);
  }

  return v9;
}

- (id)_newTextureForDevice:(id)a3
{
  void *v4;
  NUPixelFormat *format;
  id v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CC6BB0];
  format = self->_format;
  v6 = a3;
  objc_msgSend(v4, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", -[NUPixelFormat metalFormat](format, "metalFormat"), self->_size.width, self->_size.height, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUsage:", 3);
  v8 = (void *)objc_msgSend(v6, "newTextureWithDescriptor:iosurface:plane:", v7, -[NUIOSurface IOSurfaceRef](self, "IOSurfaceRef"), 0);

  return v8;
}

- (__CVBuffer)pixelBuffer
{
  NUIOSurface *v2;
  __CVBuffer *v3;
  NUIOSurface *v4;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  pixelBufferOut = v2->_pixelBuffer;
  v3 = pixelBufferOut;
  objc_sync_exit(v2);

  if (!pixelBufferOut)
  {
    if (CVPixelBufferCreateWithIOSurface(0, v2->_IOSurfaceRef, 0, &pixelBufferOut))
    {
      NUAssertLogger_11337();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create pixel buffer from IOSUrface"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v26 = v7;
        _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_11337();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v10)
        {
          v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v14 = (void *)MEMORY[0x1E0CB3978];
          v15 = v13;
          objc_msgSend(v14, "callStackSymbols");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
          v17 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v26 = v13;
          v27 = 2114;
          v28 = v17;
          v18 = (void *)v17;
          _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v26 = v12;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"-[NUIOSurface pixelBuffer]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 369, CFSTR("Failed to create pixel buffer from IOSUrface"), v19, v20, v21, v22, v23);
    }
    v4 = v2;
    objc_sync_enter(v4);
    CVPixelBufferRelease(v2->_pixelBuffer);
    v2->_pixelBuffer = pixelBufferOut;
    objc_sync_exit(v4);

    return pixelBufferOut;
  }
  return v3;
}

- (void)invalidatePixelBuffer
{
  NUIOSurface *obj;

  obj = self;
  objc_sync_enter(obj);
  CVPixelBufferRelease(obj->_pixelBuffer);
  obj->_pixelBuffer = 0;
  objc_sync_exit(obj);

}

- (void)debugDump:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  CGImage *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFURL *v12;
  __CFString *v13;
  CGImageDestination *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  NSObject *v19;
  uint64_t v20;
  int v21;
  NUIOSurface *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CBD130]);
  v6 = CGImageCreateFromIOSurface();
  if (v6)
  {
    v7 = (CGImage *)v6;
    +[NUGlobalSettings tempDir](NUGlobalSettings, "tempDir");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, 0);

    objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("tiff"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
    v12 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEC600], "identifier");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v14 = CGImageDestinationCreateWithURL(v12, v13, 1uLL, 0);

    CGImageDestinationAddImage(v14, v7, 0);
    if (CGImageDestinationFinalize(v14))
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_133_11327);
      v15 = _NULogger;
      if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      v21 = 138412546;
      v22 = self;
      v23 = 2112;
      v24 = v11;
      v16 = "Dumped IOSurface: %@ to: %@";
      v17 = v15;
      v18 = 22;
    }
    else
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_133_11327);
      v20 = _NULogger;
      if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      v21 = 138412290;
      v22 = self;
      v16 = "Failed to dump IOSurface: %@";
      v17 = v20;
      v18 = 12;
    }
    _os_log_impl(&dword_1A6553000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v21, v18);
LABEL_16:
    CFRelease(v14);
    CFRelease(v7);

    goto LABEL_17;
  }
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_133_11327);
  v19 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412290;
    v22 = self;
    _os_log_impl(&dword_1A6553000, v19, OS_LOG_TYPE_DEFAULT, "Failed to create CGImage from IOSurface: %@", (uint8_t *)&v21, 0xCu);
  }
LABEL_17:

}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t height;
  int64_t width;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  height = self->_size.height;
  width = self->_size.width;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (NUPixelFormat)format
{
  return self->_format;
}

- (__IOSurface)IOSurfaceRef
{
  return self->_IOSurfaceRef;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_textures, 0);
}

@end
