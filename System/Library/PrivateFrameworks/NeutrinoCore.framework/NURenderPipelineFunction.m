@implementation NURenderPipelineFunction

- (id)evaluate:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *specific;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  objc_class *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_316);
  v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = v5;
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = v10;
    _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v11 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v11 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_316);
      goto LABEL_8;
    }
    if (v11 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_316);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v12 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v13 = (void *)MEMORY[0x1E0CB3978];
    v14 = v12;
    objc_msgSend(v13, "callStackSymbols");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = v16;
    _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v17 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v19 = (void *)MEMORY[0x1E0CB3978];
  v20 = specific;
  v14 = v17;
  objc_msgSend(v19, "callStackSymbols");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v30 = specific;
  v31 = 2114;
  v32 = v22;
  _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v23 = (objc_class *)objc_opt_class();
  NSStringFromClass(v23);
  v24 = objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NURenderPipelineFunction evaluate:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 498, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v25, v26, v27, v28, v24);
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *specific;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  objc_class *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_316);
  v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = v2;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v7;
    _os_log_error_impl(&dword_1A6553000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_316);
      goto LABEL_8;
    }
    if (v8 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_316);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v10 = (void *)MEMORY[0x1E0CB3978];
    v11 = v9;
    objc_msgSend(v10, "callStackSymbols");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v13;
    _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v16 = (void *)MEMORY[0x1E0CB3978];
  v17 = specific;
  v11 = v14;
  objc_msgSend(v16, "callStackSymbols");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v27 = specific;
  v28 = 2114;
  v29 = v19;
  _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NURenderPipelineFunction hash]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 504, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v22, v23, v24, v25, v21);
}

- (BOOL)isEqual:(id)a3
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_316);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_316);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_316);
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
  _NUAssertFailHandler((uint64_t)"-[NURenderPipelineFunction isEqual:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 510, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v24, v25, v26, v27, v23);
}

+ (id)functionWithEvaluationBlock:(id)a3
{
  id v3;
  _NURenderPipelineBlockVariable *v4;

  v3 = a3;
  v4 = -[_NURenderPipelineBlockVariable initWithEvaluationBlock:]([_NURenderPipelineBlockVariable alloc], "initWithEvaluationBlock:", v3);

  return v4;
}

+ (id)scaleMultiplyOfScalar:(double)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__NURenderPipelineFunction_scaleMultiplyOfScalar___block_invoke;
  v4[3] = &__block_descriptor_40_e31__16__0__NURenderPipelineState_8l;
  *(double *)&v4[4] = a3;
  +[NURenderPipelineFunction functionWithEvaluationBlock:](NURenderPipelineFunction, "functionWithEvaluationBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)scaledVector:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__NURenderPipelineFunction_scaledVector___block_invoke;
  v7[3] = &unk_1E50609B0;
  v8 = v3;
  v4 = v3;
  +[NURenderPipelineFunction functionWithEvaluationBlock:](NURenderPipelineFunction, "functionWithEvaluationBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)sharpnessWithIntensity:(double)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__NURenderPipelineFunction_sharpnessWithIntensity___block_invoke;
  v4[3] = &__block_descriptor_40_e31__16__0__NURenderPipelineState_8l;
  *(double *)&v4[4] = a3;
  +[NURenderPipelineFunction functionWithEvaluationBlock:](NURenderPipelineFunction, "functionWithEvaluationBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)redEyeSpotsWithCorrectionInfo:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__NURenderPipelineFunction_redEyeSpotsWithCorrectionInfo___block_invoke;
  v7[3] = &unk_1E50609B0;
  v8 = v3;
  v4 = v3;
  +[NURenderPipelineFunction functionWithEvaluationBlock:](NURenderPipelineFunction, "functionWithEvaluationBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)grainInputSeedFromFrameTime
{
  return +[NURenderPipelineFunction functionWithEvaluationBlock:](NURenderPipelineFunction, "functionWithEvaluationBlock:", &__block_literal_global_283);
}

id __55__NURenderPipelineFunction_grainInputSeedFromFrameTime__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  Float64 Seconds;
  CMTime time;
  long double __y[2];
  uint64_t v9;
  uint64_t v10;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "time");
    if ((v9 & 0x100000000) != 0)
    {
      objc_msgSend(v3, "time");
      Seconds = CMTimeGetSeconds(&time);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)modf(Seconds / 10.0, __y));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = &unk_1E50A2478;
    }
  }
  else
  {
    __y[1] = 0.0;
    v9 = 0;
    v4 = &unk_1E50A2478;
    v10 = 0;
  }

  return v4;
}

id __58__NURenderPipelineFunction_redEyeSpotsWithCorrectionInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  unint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v36;
  uint64_t v37;
  void *v38;
  double v39[2];
  _QWORD v40[3];
  _QWORD v41[5];

  v41[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v3;
  v4 = objc_msgSend(v3, "scale");
  v6 = NUScaleToDouble(v4, v5);
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v7 = 0;
    v8 = CFSTR("pointX");
    v9 = CFSTR("pointY");
    v10 = CFSTR("radius");
    v11 = CFSTR("sensitivity");
    v37 = a1;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v15 = v14;
      objc_msgSend(v12, "objectForKeyedSubscript:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValue");
      v18 = v17;

      objc_msgSend(v12, "objectForKeyedSubscript:", v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v21 = v20;

      objc_msgSend(v12, "objectForKeyedSubscript:", v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "doubleValue");
      v24 = v23;

      v25 = fmin(v6 * (v21 + 10.0), 400.0);
      if (v25 >= 3.0)
      {
        v40[0] = CFSTR("inputCenter");
        v39[0] = v6 * v15;
        v39[1] = v6 * v18;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v39, "{CGPoint=dd}");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = v26;
        v40[1] = CFSTR("inputRadius");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v41[1] = v27;
        v40[2] = CFSTR("inputSensitivity");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
        v28 = v11;
        v29 = v10;
        v30 = v8;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v41[2] = v31;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
        v32 = v9;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addObject:", v33);

        v9 = v32;
        v8 = v30;
        v10 = v29;
        v11 = v28;
        a1 = v37;

      }
      ++v7;
    }
    while (v7 < objc_msgSend(*(id *)(a1 + 32), "count"));
  }
  v34 = (void *)objc_msgSend(v38, "copy");

  return v34;
}

uint64_t __51__NURenderPipelineFunction_sharpnessWithIntensity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;

  v3 = objc_msgSend(a2, "scale");
  v5 = NUScaleToDouble(v3, v4) * -2.0 * *(double *)(a1 + 32) + 1.0;
  if (v5 >= 0.0)
    v6 = log10(v5 * 9.0 + 1.0);
  else
    v6 = -log10(v5 * -9.0 + 1.0);
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 - v6);
}

id __41__NURenderPipelineFunction_scaledVector___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double *v15;
  uint64_t i;
  double v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[256];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "scale");
  v6 = NUScaleToDouble(v4, v5);
  v7 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v7 >= 0x20)
    v8 = 32;
  else
    v8 = v7;
  v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(v9, "subarrayWithRange:", 0, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    v15 = (double *)v24;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "doubleValue", (_QWORD)v20);
        *v15++ = v6 * v17;
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithValues:count:", v24, objc_msgSend(v11, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t __50__NURenderPipelineFunction_scaleMultiplyOfScalar___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = objc_msgSend(a2, "scale");
  return objc_msgSend(v3, "numberWithDouble:", NUScaleToDouble(v4, v5) * *(double *)(a1 + 32));
}

@end
