@implementation NUBufferRenderRequest

- (id)newRenderJob
{
  return -[NUImageRenderJob initWithImageRequest:]([NUBufferRenderJob alloc], "initWithImageRequest:", self);
}

- (void)submit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *specific;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BYTE v26[12];
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NURenderRequest renderContext](self, "renderContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "purpose") == 2)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_1754);
    v6 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = v6;
      objc_msgSend(v7, "stringWithFormat:", CFSTR("submitting a buffer render request on a video purpose context"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v26 = 138543362;
      *(_QWORD *)&v26[4] = v9;
      _os_log_impl(&dword_1A6553000, v8, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", v26, 0xCu);

      v10 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (v10 != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_1754);
LABEL_9:
        v11 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v17 = (void *)MEMORY[0x1E0CB3978];
          v18 = specific;
          v19 = v11;
          objc_msgSend(v17, "callStackSymbols");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v26 = 138543618;
          *(_QWORD *)&v26[4] = specific;
          v27 = 2114;
          v28 = v21;
          _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v26, 0x16u);

LABEL_17:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v10 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_1754);
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_9;
    }
    v22 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      v23 = (void *)MEMORY[0x1E0CB3978];
      v19 = v22;
      objc_msgSend(v23, "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v26 = 138543362;
      *(_QWORD *)&v26[4] = v25;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v26, 0xCu);

      goto LABEL_17;
    }
LABEL_14:
    _NUAssertContinueHandler((uint64_t)"-[NUBufferRenderRequest submit:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUBufferRenderRequest.m", 29, CFSTR("submitting a buffer render request on a video purpose context"), v12, v13, v14, v15, *(uint64_t *)v26);
  }

  -[NURenderRequest submitGeneric:](self, "submitGeneric:", v4);
}

@end
