@implementation NURawFilterNode

- (NURawFilterNode)initWithRawFilter:(id)a3 type:(int)a4 settings:(id)a5 input:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NURawFilterNode *v26;
  NSObject *v28;
  void *v29;
  void *specific;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NURawFilterNode *v60;
  unsigned int v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  void *v67;
  uint8_t v68[128];
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (!v10)
  {
    NUAssertLogger();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "filter != nil");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v70 = v29;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v32)
      {
        v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v43 = (void *)MEMORY[0x1E0CB3978];
        v44 = v42;
        objc_msgSend(v43, "callStackSymbols");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v70 = v42;
        v71 = 2114;
        v72 = v46;
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
      v70 = v34;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURawFilterNode initWithRawFilter:type:settings:input:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 1042, CFSTR("Invalid parameter not satisfying: %s"), v47, v48, v49, v50, (uint64_t)"filter != nil");
  }
  v13 = v12;
  if (!v12)
  {
    NUAssertLogger();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "input != nil");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v70 = v36;
      _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
    if (v37)
    {
      if (v39)
      {
        v51 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v52 = (void *)MEMORY[0x1E0CB3978];
        v53 = v51;
        objc_msgSend(v52, "callStackSymbols");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "componentsJoinedByString:", CFSTR("\n"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v70 = v51;
        v71 = 2114;
        v72 = v55;
        _os_log_error_impl(&dword_1A6553000, v38, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v39)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v70 = v41;
      _os_log_error_impl(&dword_1A6553000, v38, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURawFilterNode initWithRawFilter:type:settings:input:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 1043, CFSTR("Invalid parameter not satisfying: %s"), v56, v57, v58, v59, (uint64_t)"input != nil");
  }
  v60 = self;
  v61 = a4;
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  objc_msgSend(v10, "inputKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v63 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
        objc_msgSend(v10, "valueForKey:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
    }
    while (v17);
  }

  v22 = *MEMORY[0x1E0C9E288];
  objc_msgSend(v10, "valueForKey:", *MEMORY[0x1E0C9E288]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v23, v22);

  objc_msgSend(v14, "addEntriesFromDictionary:", v11);
  objc_msgSend(v10, "name");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = *MEMORY[0x1E0C9E1F8];
  v67 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[NURawFilterNode initWithRawFilterName:type:settings:inputs:](v60, "initWithRawFilterName:type:settings:inputs:", v24, v61, v14, v25);

  return v26;
}

- (NURawFilterNode)initWithRawFilterName:(id)a3 type:(int)a4 settings:(id)a5 inputs:(id)a6
{
  NURawFilterNode *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NURawFilterNode;
  result = -[NUFilterNode initWithFilterName:settings:inputs:](&v8, sel_initWithFilterName_settings_inputs_, a3, a5, a6);
  result->_rawFilterType = a4;
  return result;
}

- (NURawFilterNode)initWithFilterName:(id)a3 settings:(id)a4 inputs:(id)a5
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_572);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_572);
      goto LABEL_8;
    }
    if (v18 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_572);
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
  _NUAssertFailHandler((uint64_t)"-[NURawFilterNode initWithFilterName:settings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 1069, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v32, v33, v34, v35, v31);
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  _DWORD *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NURawFilterNode;
  -[NUFilterNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v9, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5, a6);
  v7 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v7[46] = self->_rawFilterType;
  return v7;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "auxiliaryImageType") == 10)
  {
    -[NURawFilterNode rawFilterType](self, "rawFilterType");
    v5 = 1;
  }
  else if (objc_msgSend(v4, "auxiliaryImageType") == 11)
  {
    v5 = ((-[NURawFilterNode rawFilterType](self, "rawFilterType") - 10) & 0xFFFFFFFB) != 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NURawFilterNode;
    v5 = -[NUFilterNode shouldCacheNodeForPipelineState:](&v7, sel_shouldCacheNodeForPipelineState_, v4);
  }

  return v5;
}

- (int)rawFilterType
{
  return self->_rawFilterType;
}

@end
