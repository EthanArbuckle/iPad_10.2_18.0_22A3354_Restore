@implementation NUAutoCalculator

- (void)submit:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
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
  v3 = a3;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_23908);
  v4 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = v4;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_23908);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_23908);
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
  _NUAssertFailHandler((uint64_t)"-[NUAutoCalculator submit:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUAutoCalculator.m", 14, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v24, v25, v26, v27, v23);
}

@end
