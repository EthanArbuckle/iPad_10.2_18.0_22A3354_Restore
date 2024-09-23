@implementation NUStyleTransferInterpolationNode

- (NUStyleTransferInterpolationNode)initWithSettings:(id)a3 inputs:(id)a4
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_24428);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_24428);
      goto LABEL_8;
    }
    if (v15 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_24428);
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
  _NUAssertFailHandler((uint64_t)"-[NUStyleTransferInterpolationNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1232, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v29, v30, v31, v32, v28);
}

- (NUStyleTransferInterpolationNode)initWithInputs:(id)a3 weights:(id)a4 settings:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t i;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NUStyleTransferInterpolationNode *v25;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  void *specific;
  NSObject *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  _BOOL4 v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NUStyleTransferInterpolationNode *v76;
  void *v77;
  objc_super v78;
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  void *v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v8, "count"))
  {
    NUAssertLogger_24413();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "inputs.count >= 1");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v80 = v44;
      _os_log_error_impl(&dword_1A6553000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v47)
      {
        v57 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v58 = (void *)MEMORY[0x1E0CB3978];
        v59 = v57;
        objc_msgSend(v58, "callStackSymbols");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "componentsJoinedByString:", CFSTR("\n"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v80 = v57;
        v81 = 2114;
        v82 = v61;
        _os_log_error_impl(&dword_1A6553000, v46, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v47)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v80 = v49;
      _os_log_error_impl(&dword_1A6553000, v46, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferInterpolationNode initWithInputs:weights:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1236, CFSTR("Invalid parameter not satisfying: %s"), v62, v63, v64, v65, (uint64_t)"inputs.count >= 1");
  }
  v11 = objc_msgSend(v8, "count");
  if (v11 != objc_msgSend(v9, "count"))
  {
    NUAssertLogger_24413();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "inputs.count == weights.count");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v80 = v51;
      _os_log_error_impl(&dword_1A6553000, v50, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v52 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);
    if (v52)
    {
      if (v54)
      {
        v66 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v67 = (void *)MEMORY[0x1E0CB3978];
        v68 = v66;
        objc_msgSend(v67, "callStackSymbols");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "componentsJoinedByString:", CFSTR("\n"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v80 = v66;
        v81 = 2114;
        v82 = v70;
        _os_log_error_impl(&dword_1A6553000, v53, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v54)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "componentsJoinedByString:", CFSTR("\n"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v80 = v56;
      _os_log_error_impl(&dword_1A6553000, v53, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferInterpolationNode initWithInputs:weights:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1237, CFSTR("Invalid parameter not satisfying: %s"), v71, v72, v73, v74, (uint64_t)"inputs.count == weights.count");
  }
  v76 = self;
  v12 = objc_msgSend(v8, "count");
  v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v12);
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v12)
  {
    for (i = 0; i != v12; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("input#%lu"), i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        NUAssertLogger_24413();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid Style Transfer Interpolation input node"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v80 = v28;
          _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

        }
        v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        NUAssertLogger_24413();
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
        if (v29)
        {
          if (v31)
          {
            v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v35 = (void *)MEMORY[0x1E0CB3978];
            v36 = v34;
            objc_msgSend(v35, "callStackSymbols");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v80 = v34;
            v81 = 2114;
            v82 = v38;
            _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

          }
        }
        else if (v31)
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v80 = v33;
          _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

        }
        _NUAssertFailHandler((uint64_t)"-[NUStyleTransferInterpolationNode initWithInputs:weights:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1244, CFSTR("Invalid Style Transfer Interpolation input node"), v39, v40, v41, v42, v75);
      }
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setObject:forKeyedSubscript:", v18, v15);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("weight#%lu"), i);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v9, "objectAtIndexedSubscript:", i);
      v21 = v9;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "floatValue");
      objc_msgSend(v20, "numberWithFloat:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v23, v19);

      v9 = v21;
    }
  }
  if (v10)
    objc_msgSend(v13, "addEntriesFromDictionary:", v10);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v24, CFSTR("count"));

  v78.receiver = v76;
  v78.super_class = (Class)NUStyleTransferInterpolationNode;
  v25 = -[NURenderNode initWithSettings:inputs:](&v78, sel_initWithSettings_inputs_, v13, v77);

  return v25;
}

- (id)styleInputAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("input#%lu"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderNode inputForKey:](self, "inputForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (float)interpolationWeightAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  float v7;
  float v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("weight#%lu"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderNode settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  return v8;
}

- (unint64_t)inputCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NURenderNode settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (id)tuningParameters
{
  void *v2;
  void *v3;

  -[NUStyleTransferInterpolationNode styleInputAtIndex:](self, "styleInputAtIndex:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tuningParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)configuration
{
  void *v2;
  void *v3;

  -[NUStyleTransferInterpolationNode styleInputAtIndex:](self, "styleInputAtIndex:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)targetColorSpace
{
  void *v2;
  void *v3;

  -[NUStyleTransferInterpolationNode styleInputAtIndex:](self, "styleInputAtIndex:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetColorSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v24;
  void *v25;
  void *specific;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "auxiliaryImageType") != 1)
  {
    NUAssertLogger_24413();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ cannot be applied to aux images"), objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v66 = v25;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v39 = (void *)MEMORY[0x1E0CB3978];
        v40 = v38;
        objc_msgSend(v39, "callStackSymbols");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v66 = v38;
        v67 = 2114;
        v68 = v42;
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
      v66 = v30;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v43 = objc_opt_class();
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferInterpolationNode nodeByReplayingAgainstCache:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1286, CFSTR("%@ cannot be applied to aux images"), v44, v45, v46, v47, v43);
  }
  if (objc_msgSend(v7, "evaluationMode") == 2)
  {
    NUAssertLogger_24413();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ cannot be evaluated for video"), objc_opt_class());
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v66 = v32;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (v33)
    {
      if (v35)
      {
        v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v49 = (void *)MEMORY[0x1E0CB3978];
        v50 = v48;
        objc_msgSend(v49, "callStackSymbols");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "componentsJoinedByString:", CFSTR("\n"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v66 = v48;
        v67 = 2114;
        v68 = v52;
        _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v35)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v66 = v37;
      _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v53 = objc_opt_class();
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferInterpolationNode nodeByReplayingAgainstCache:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1287, CFSTR("%@ cannot be evaluated for video"), v54, v55, v56, v57, v53);
  }
  v8 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[NURenderNode inputs](self, "inputs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  -[NURenderNode inputs](self, "inputs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v61;
LABEL_5:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v61 != v14)
        objc_enumerationMutation(v11);
      v16 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v15);
      -[NURenderNode inputForKey:](self, "inputForKey:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "isCached"))
      {
        v18 = objc_msgSend(v17, "evaluatedForMode");
        if (v18 != objc_msgSend(v7, "evaluationMode"))
        {
          +[NUError mismatchError:object:](NUError, "mismatchError:object:", CFSTR("Wrong evaluation mode for cached input"), v17);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
          *a5 = v22;

          v21 = 0;
          goto LABEL_19;
        }
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v16);
      }
      else
      {
        objc_msgSend(v17, "nodeByReplayingAgainstCache:pipelineState:error:", v6, v7, a5);
        v19 = objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("failed to evaluate input"), v17);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_18;
        }
        v20 = (void *)v19;
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, v16);

      }
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
        if (v13)
          goto LABEL_5;
        break;
      }
    }
  }

  -[NURenderNode resolvedNodeWithCachedInputs:cache:pipelineState:error:](self, "resolvedNodeWithCachedInputs:cache:pipelineState:error:", v10, v6, v7, a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v21;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_super v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__25008;
  v21 = __Block_byref_object_dispose__25009;
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __94__NUStyleTransferInterpolationNode_resolvedNodeWithCachedInputs_settings_pipelineState_error___block_invoke;
  v16[3] = &unk_1E5063D28;
  v16[4] = &v17;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v16);
  if (v18[5])
  {
    +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("Invalid style input node"));
    v13 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NUStyleTransferInterpolationNode;
    -[NUStyleTransferNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v15, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, v10, v11, v12, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v17, 8);

  return v13;
}

- (id)_evaluateImage:(id *)a3
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v19;
  id v20;

  v5 = -[NUStyleTransferInterpolationNode inputCount](self, "inputCount");
  if (v5)
  {
    v6 = v5;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6);
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = v9;
      -[NUStyleTransferInterpolationNode styleInputAtIndex:](self, "styleInputAtIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      objc_msgSend(v12, "outputImage:", &v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v19;

      if (!v13)
        break;
      objc_msgSend(v7, "addObject:", v13);
      -[NUStyleTransferInterpolationNode interpolationWeightAtIndex:](self, "interpolationWeightAtIndex:", v10);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v14);

      if (v6 == ++v10)
      {
        +[_NUStyleTransferInterpolateProcessor interpolateStyles:weights:error:](_NUStyleTransferInterpolateProcessor, "interpolateStyles:weights:error:", v7, v8, a3);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to evaluate style at index"), v17, v9);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    v16 = 0;
  }
  else
  {
    -[NUStyleTransferInterpolationNode styleInputAtIndex:](self, "styleInputAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v7, "outputImage:", &v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v20;
    if (v8)
    {
      v15 = v8;
      v8 = v15;
LABEL_8:
      v16 = v15;
    }
    else
    {
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to evaluate style at index"), &unk_1E50A2A60, v9);
      v16 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v16;
}

void __94__NUStyleTransferInterpolationNode_resolvedNodeWithCachedInputs_settings_pipelineState_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }

}

@end
