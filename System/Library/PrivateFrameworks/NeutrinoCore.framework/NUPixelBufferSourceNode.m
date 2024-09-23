@implementation NUPixelBufferSourceNode

- (NUPixelBufferSourceNode)initWithPixelBuffer:(__CVBuffer *)a3 settings:(id)a4 orientation:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  __IOSurface *IOSurface;
  uint64_t Seed;
  void *v13;
  void *v14;
  NUPixelBufferSourceNode *v15;
  NSObject *v17;
  void *v18;
  void *specific;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  objc_super v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (!a3)
  {
    NUAssertLogger_551();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "pixelBuffer != nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_551();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v25 = (void *)MEMORY[0x1E0CB3978];
        v26 = v24;
        objc_msgSend(v25, "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v24;
        v36 = 2114;
        v37 = v28;
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
      v35 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUPixelBufferSourceNode initWithPixelBuffer:settings:orientation:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 1072, CFSTR("Invalid parameter not satisfying: %s"), v29, v30, v31, v32, (uint64_t)"pixelBuffer != nil");
  }
  v9 = v8;
  v10 = (void *)objc_msgSend(v8, "mutableCopy");
  IOSurface = CVPixelBufferGetIOSurface(a3);
  Seed = IOSurfaceGetSeed(IOSurface);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", IOSurfaceGetID(IOSurface));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("surfaceID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", Seed);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("seed"));

  v33.receiver = self;
  v33.super_class = (Class)NUPixelBufferSourceNode;
  v15 = -[NUVideoFrameSourceNode initWithSettings:orientation:](&v33, sel_initWithSettings_orientation_, v10, a5);
  v15->_pixelBuffer = CVPixelBufferRetain(a3);

  return v15;
}

- (NUPixelBufferSourceNode)initWithSettings:(id)a3 orientation:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *specific;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  objc_class *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_562);
  v6 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = v6;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v12;
    _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v13 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v13 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_562);
      goto LABEL_8;
    }
    if (v13 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_562);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v14 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v15 = (void *)MEMORY[0x1E0CB3978];
    v16 = v14;
    objc_msgSend(v15, "callStackSymbols");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v18;
    _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v19 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v21 = (void *)MEMORY[0x1E0CB3978];
  v22 = specific;
  v16 = v19;
  objc_msgSend(v21, "callStackSymbols");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v32 = specific;
  v33 = 2114;
  v34 = v24;
  _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v25 = (objc_class *)objc_opt_class();
  NSStringFromClass(v25);
  v26 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUPixelBufferSourceNode initWithSettings:orientation:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 1093, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v27, v28, v29, v30, v26);
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)NUPixelBufferSourceNode;
  -[NUPixelBufferSourceNode dealloc](&v3, sel_dealloc);
}

- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NUPixelBufferSourceNode *v12;
  CIImage *v13;
  void *v14;
  NSObject *v16;
  void *v17;
  void *specific;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!a5)
  {
    NUAssertLogger_551();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v17;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_551();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v31 = (void *)MEMORY[0x1E0CB3978];
        v32 = v30;
        objc_msgSend(v31, "callStackSymbols");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v30;
        v52 = 2114;
        v53 = v34;
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
      v51 = v22;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUPixelBufferSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 1103, CFSTR("Invalid parameter not satisfying: %s"), v35, v36, v37, v38, (uint64_t)"error != NULL");
  }
  if (!a4)
  {
    NUAssertLogger_551();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "subsampleFactor != NULL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v24;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_551();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v25)
    {
      if (v27)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v40 = (void *)MEMORY[0x1E0CB3978];
        v41 = v39;
        objc_msgSend(v40, "callStackSymbols");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v39;
        v52 = 2114;
        v53 = v43;
        _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v29;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUPixelBufferSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 1105, CFSTR("Invalid parameter not satisfying: %s"), v44, v45, v46, v47, (uint64_t)"subsampleFactor != NULL");
  }
  v9 = v8;
  *a4 = 1;
  if (-[NUSourceNode auxiliaryImageType](self, "auxiliaryImageType") == 2
    || -[NUSourceNode auxiliaryImageType](self, "auxiliaryImageType") == 12
    || -[NUSourceNode auxiliaryImageType](self, "auxiliaryImageType") == 11
    || -[NUSourceNode auxiliaryImageType](self, "auxiliaryImageType") == 9
    || -[NUSourceNode auxiliaryImageType](self, "auxiliaryImageType") == 3
    || -[NUSourceNode auxiliaryImageType](self, "auxiliaryImageType") == 4)
  {
    v48 = *MEMORY[0x1E0C9E110];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA70];
  }
  v12 = self;
  objc_sync_enter(v12);
  v13 = v12->_image;
  if (!v13)
  {
    v13 = (CIImage *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCVPixelBuffer:options:", v12->_pixelBuffer, v11);
    if (!v13)
    {
      +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 3, CFSTR("Unable to produce CIImage from CVPixelBuffer"), v12);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v12->_image, v13);
  }
  -[NUVideoFrameSourceNode applySourceOptions:image:](v12, "applySourceOptions:image:", v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v12);
  return v14;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)pixelSizeWithSourceOptions:(id)a3
{
  id v4;
  _BOOL4 v5;
  _BOOL4 v6;
  size_t Width;
  size_t Height;
  void *v9;
  void *v10;
  int64_t v11;
  int64_t v12;
  size_t v13;
  size_t v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  size_t v18;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v4 = a3;
  if (-[NUSourceNode auxiliaryImageType](self, "auxiliaryImageType"))
    v5 = -[NUSourceNode auxiliaryImageType](self, "auxiliaryImageType") != 1;
  else
    v5 = 0;
  v6 = -[NUSourceNode auxiliaryImageType](self, "auxiliaryImageType") != 12
    && -[NUSourceNode auxiliaryImageType](self, "auxiliaryImageType") != 10;
  if (v6 && v5)
  {
    Width = CVPixelBufferGetWidth(self->_pixelBuffer);
    Height = CVPixelBufferGetHeight(self->_pixelBuffer);
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("applyCleanAperture"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "nu_pixelRect");
      Width = v17;
      Height = v18;
    }
    else
    {
      -[NUVideoFrameSourceNode originalExtent](self, "originalExtent");
      if (v15 && v16)
      {
        -[NUVideoFrameSourceNode originalExtent](self, "originalExtent");
        Width = v13;
        Height = v14;
      }
      else
      {
        Width = CVPixelBufferGetWidth(self->_pixelBuffer);
        Height = CVPixelBufferGetHeight(self->_pixelBuffer);
      }
    }

  }
  v11 = Width;
  v12 = Height;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
