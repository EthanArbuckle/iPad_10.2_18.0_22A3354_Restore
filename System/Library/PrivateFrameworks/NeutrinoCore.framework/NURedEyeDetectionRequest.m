@implementation NURedEyeDetectionRequest

- (NURedEyeDetectionRequest)initWithComposition:(id)a3 dataExtractor:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *specific;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  objc_class *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3268);
  v11 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = v11;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v17;
    _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v18 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v18 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_3268);
      goto LABEL_8;
    }
    if (v18 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_3268);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v19 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v20 = (void *)MEMORY[0x1E0CB3978];
    v21 = v19;
    objc_msgSend(v20, "callStackSymbols");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v23;
    _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v24 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v26 = (void *)MEMORY[0x1E0CB3978];
  v27 = specific;
  v21 = v24;
  objc_msgSend(v26, "callStackSymbols");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v37 = specific;
  v38 = 2114;
  v39 = v29;
  _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v30 = (objc_class *)objc_opt_class();
  NSStringFromClass(v30);
  v31 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NURedEyeDetectionRequest initWithComposition:dataExtractor:options:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURedEyeDetectionRequest.m", 20, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v32, v33, v34, v35, v31);
}

- (NURedEyeDetectionRequest)initWithRequest:(id)a3 dataExtractor:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *specific;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  objc_class *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3268);
  v11 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = v11;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v17;
    _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v18 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v18 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_3268);
      goto LABEL_8;
    }
    if (v18 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_3268);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v19 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v20 = (void *)MEMORY[0x1E0CB3978];
    v21 = v19;
    objc_msgSend(v20, "callStackSymbols");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v23;
    _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v24 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v26 = (void *)MEMORY[0x1E0CB3978];
  v27 = specific;
  v21 = v24;
  objc_msgSend(v26, "callStackSymbols");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v37 = specific;
  v38 = 2114;
  v39 = v29;
  _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v30 = (objc_class *)objc_opt_class();
  NSStringFromClass(v30);
  v31 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NURedEyeDetectionRequest initWithRequest:dataExtractor:options:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURedEyeDetectionRequest.m", 25, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v32, v33, v34, v35, v31);
}

- (NURedEyeDetectionRequest)initWithRequest:(id)a3 options:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NURedEyeDetectionRequest;
  return -[NUImageDataRequest initWithRequest:dataExtractor:options:](&v5, sel_initWithRequest_dataExtractor_options_, a3, CFSTR("CIAutoRedEye"), a4);
}

- (NURedEyeDetectionRequest)initWithComposition:(id)a3 options:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NURedEyeDetectionRequest;
  return -[NUImageDataRequest initWithComposition:dataExtractor:options:](&v5, sel_initWithComposition_dataExtractor_options_, a3, CFSTR("CIAutoRedEye"), a4);
}

- (id)newRenderJob
{
  return -[NURenderJob initWithRequest:]([NURedEyeDetectionJob alloc], "initWithRequest:", self);
}

@end
