@implementation NUScaleNode

- (NUScaleNode)initWithInput:(id)a3 settings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *specific;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  objc_class *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_10736);
  v8 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = v8;
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v34 = v14;
    _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v15 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v15 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_10736);
      goto LABEL_8;
    }
    if (v15 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_10736);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v16 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v17 = (void *)MEMORY[0x1E0CB3978];
    v18 = v16;
    objc_msgSend(v17, "callStackSymbols");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v34 = v20;
    _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v21 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v23 = (void *)MEMORY[0x1E0CB3978];
  v24 = specific;
  v18 = v21;
  objc_msgSend(v23, "callStackSymbols");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v34 = specific;
  v35 = 2114;
  v36 = v26;
  _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v27 = (objc_class *)objc_opt_class();
  NSStringFromClass(v27);
  v28 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUScaleNode initWithInput:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 98, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v29, v30, v31, v32, v28);
}

- (NUScaleNode)initWithScale:(id)a3 sampleMode:(int64_t)a4 input:(id)a5
{
  return -[NUScaleNode initWithTargetScale:effectiveScale:sampleMode:input:](self, "initWithTargetScale:effectiveScale:sampleMode:input:", a3.var0, a3.var1, NUScaleUnknown, a4, a5);
}

- (NUScaleNode)initWithTargetScale:(id)a3 effectiveScale:(id)a4 sampleMode:(int64_t)a5 input:(id)a6
{
  int64_t var1;
  int64_t var0;
  int64_t v9;
  int64_t v10;
  id v12;
  void *v13;
  void *v14;
  NUScaleNode *v15;
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
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  objc_super v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3.var1;
  v10 = a3.var0;
  v54 = *MEMORY[0x1E0C80C00];
  v12 = a6;
  if (!a5)
  {
    NUAssertLogger_10707();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "sampleMode != NUSampleModeDefault");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_10707();
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
        v51 = v24;
        v52 = 2114;
        v53 = v28;
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
      v51 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUScaleNode initWithTargetScale:effectiveScale:sampleMode:input:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 109, CFSTR("Invalid parameter not satisfying: %s"), v29, v30, v31, v32, (uint64_t)"sampleMode != NUSampleModeDefault");
  }
  v13 = v12;
  if ((v10 < 1 || v9 < 1) && var0 >= 1 && var1 >= 1)
  {
    NUAssertLogger_10707();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "NUScaleIsValid(targetScale) || !NUScaleIsValid(effectiveScale)");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v34;
      _os_log_error_impl(&dword_1A6553000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_10707();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (v35)
    {
      if (v37)
      {
        v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v41 = (void *)MEMORY[0x1E0CB3978];
        v42 = v40;
        objc_msgSend(v41, "callStackSymbols");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v40;
        v52 = 2114;
        v53 = v44;
        _os_log_error_impl(&dword_1A6553000, v36, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v37)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v39;
      _os_log_error_impl(&dword_1A6553000, v36, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUScaleNode initWithTargetScale:effectiveScale:sampleMode:input:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 111, CFSTR("Invalid parameter not satisfying: %s"), v45, v46, v47, v48, (uint64_t)"NUScaleIsValid(targetScale) || !NUScaleIsValid(effectiveScale)");
  }
  -[NUScaleNode _settingsWithTargetScale:effectiveScale:sampleMode:](self, "_settingsWithTargetScale:effectiveScale:sampleMode:", v10, v9, var0, var1, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v49.receiver = self;
  v49.super_class = (Class)NUScaleNode;
  v15 = -[NUAbstractScaleNode initWithInput:settings:](&v49, sel_initWithInput_settings_, v13, v14);
  v15->_targetScale.numerator = v10;
  v15->_targetScale.denominator = v9;
  v15->_effectiveScale.numerator = var0;
  v15->_effectiveScale.denominator = var1;
  v15->_sampleMode = a5;

  return v15;
}

- (NUScaleNode)initWithPipelineState:(id)a3 input:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NUScaleNode *v12;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v7, "scale");
  v10 = v9;
  v11 = objc_msgSend(v7, "sampleMode");

  v12 = -[NUScaleNode initWithScale:sampleMode:input:](self, "initWithScale:sampleMode:input:", v8, v10, v11, v6);
  return v12;
}

- (id)_settingsWithTargetScale:(id)a3 effectiveScale:(id)a4 sampleMode:(int64_t)a5
{
  int64_t var1;
  int64_t var0;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[3];
  _QWORD v18[4];

  var1 = a3.var1;
  var0 = a3.var0;
  v18[3] = *MEMORY[0x1E0C80C00];
  if (a4.var0 < 1 || a4.var1 < 1)
  {
    if (a3.var0 < 1 || a3.var1 < 1)
    {
      v13 = CFSTR("sampleMode");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v15[0] = CFSTR("targetScale");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld:%ld"), a3.var0, a3.var1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = CFSTR("sampleMode");
    v16[0] = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17[0] = CFSTR("effectiveScale");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld:%ld"), a4.var0, a4.var1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v8;
    v17[1] = CFSTR("targetScale");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld:%ld"), var0, var1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v9;
    v17[2] = CFSTR("sampleMode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_9:

  return v11;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  NSObject *v37;
  void *v38;
  void *specific;
  NSObject *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  objc_super v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!a6)
  {
    NUAssertLogger_10707();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v74 = v38;
      _os_log_error_impl(&dword_1A6553000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_10707();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v41)
      {
        v51 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v52 = (void *)MEMORY[0x1E0CB3978];
        v53 = v51;
        objc_msgSend(v52, "callStackSymbols");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "componentsJoinedByString:", CFSTR("\n"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v74 = v51;
        v75 = 2114;
        v76 = v55;
        _os_log_error_impl(&dword_1A6553000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v41)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v74 = v43;
      _os_log_error_impl(&dword_1A6553000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUScaleNode resolvedNodeWithCachedInputs:settings:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 153, CFSTR("Invalid parameter not satisfying: %s"), v56, v57, v58, v59, (uint64_t)"error != nil");
  }
  v13 = v12;
  if (objc_msgSend(v12, "scale") < 1 || v14 <= 0)
  {
    NUAssertLogger_10707();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid render scale"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v74 = v45;
      _os_log_error_impl(&dword_1A6553000, v44, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v46 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_10707();
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
    if (v46)
    {
      if (v48)
      {
        v60 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v61 = (void *)MEMORY[0x1E0CB3978];
        v62 = v60;
        objc_msgSend(v61, "callStackSymbols");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "componentsJoinedByString:", CFSTR("\n"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v74 = v60;
        v75 = 2114;
        v76 = v64;
        _os_log_error_impl(&dword_1A6553000, v47, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v48)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "componentsJoinedByString:", CFSTR("\n"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v74 = v50;
      _os_log_error_impl(&dword_1A6553000, v47, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUScaleNode resolvedNodeWithCachedInputs:settings:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 154, CFSTR("Invalid render scale"), v65, v66, v67, v68, v69);
  }
  v15 = v11;
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0C9E1F8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "outputImageGeometry:", a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
  {
    v21 = 0;
    goto LABEL_12;
  }
  if (objc_msgSend(v17, "renderScale") < 1 || v19 <= 0)
  {
    +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("invalid scale"), v18);
    v21 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
    v22 = v15;
    goto LABEL_24;
  }
  v23 = -[NUScaleNode targetScale](self, "targetScale");
  v25 = v24;
  v26 = -[NUScaleNode effectiveScale](self, "effectiveScale");
  v71 = v27;
  v28 = -[NUScaleNode effectiveScale](self, "effectiveScale");
  if (v28 < 1 || v29 <= 0)
  {
    if (objc_msgSend(v13, "scale") >= 1 && v30 >= 1)
    {
      v23 = objc_msgSend(v13, "scale");
      v25 = v31;
    }
    if (v23 >= 1 && v25 >= 1 && objc_msgSend(v13, "evaluationMode"))
    {
      v32 = objc_msgSend(v18, "renderScale");
      v26 = NUScaleDivide(v23, v25, v32, v33);
      v71 = v34;
    }
  }
  v70 = v23;
  -[NUScaleNode _settingsWithTargetScale:effectiveScale:sampleMode:](self, "_settingsWithTargetScale:effectiveScale:sampleMode:", v23, v25, v26, v71, objc_msgSend(v13, "sampleMode"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v72.receiver = self;
  v72.super_class = (Class)NUScaleNode;
  -[NURenderNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v72, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, v10, v22, v13, a6);
  v35 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v21 = v35;
  if (v35)
  {
    v35[22] = v70;
    v35[23] = v25;
    v35[24] = v26;
    v35[25] = v71;
    v35[21] = objc_msgSend(v13, "sampleMode");
  }
LABEL_24:

  return v21;
}

- (id)_evaluateImage:(id *)a3
{
  $F9703ADC4DD3124DE91DE417D7636CC9 *p_effectiveScale;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int64_t sampleMode;
  uint64_t v12;
  NSObject *v14;
  void *v15;
  void *specific;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[32];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  p_effectiveScale = &self->_effectiveScale;
  if (self->_effectiveScale.numerator < 1 || self->_effectiveScale.denominator <= 0)
  {
    NUAssertLogger_10707();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: invalid scale"), self);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v15;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_10707();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v22 = (void *)MEMORY[0x1E0CB3978];
        v23 = v21;
        objc_msgSend(v22, "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v21;
        v33 = 2114;
        v34 = v25;
        _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v20;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUScaleNode _evaluateImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 209, CFSTR("%@: invalid scale"), v26, v27, v28, v29, (uint64_t)self);
  }
  -[NURenderNode outputImageGeometry:](self, "outputImageGeometry:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NUAbstractScaleNode inputNode](self, "inputNode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "outputImage:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = v9;
      if (!NUScaleEqual(p_effectiveScale->numerator, p_effectiveScale->denominator, NUScaleOne, *((uint64_t *)&NUScaleOne + 1)))
      {
        sampleMode = self->_sampleMode;
        objc_msgSend(v7, "physicalScaledExtent");
        -[NUAbstractScaleNode _scaleImage:by:sampleMode:extent:](self, "_scaleImage:by:sampleMode:extent:", v10, p_effectiveScale->numerator, p_effectiveScale->denominator, sampleMode, v30);
        v12 = objc_claimAutoreleasedReturnValue();

        v10 = (id)v12;
      }
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  void *v4;
  void *v5;
  $F9703ADC4DD3124DE91DE417D7636CC9 *p_targetScale;
  NUImageGeometry *v8;
  NUImageGeometry *v9;
  NUImageGeometry *v10;
  uint64_t v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NUScaleNode;
  -[NURenderNode _evaluateImageGeometry:](&v13, sel__evaluateImageGeometry_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    p_targetScale = &self->_targetScale;
    if (self->_targetScale.numerator < 1 || self->_targetScale.denominator <= 0)
    {
      v10 = v4;
    }
    else
    {
      v9 = [NUImageGeometry alloc];
      objc_msgSend(v5, "extent");
      v10 = -[NUImageGeometry initWithExtent:renderScale:orientation:](v9, "initWithExtent:renderScale:orientation:", &v12, p_targetScale->numerator, p_targetScale->denominator, objc_msgSend(v5, "orientation"));
    }
    v8 = v10;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)targetScale
{
  int64_t v2;
  int64_t v3;
  _QWORD v4[2];
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  objc_copyStruct(v4, &self->_targetScale, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)effectiveScale
{
  int64_t v2;
  int64_t v3;
  _QWORD v4[2];
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  objc_copyStruct(v4, &self->_effectiveScale, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

@end
