@implementation NUResampleNode

- (NUResampleNode)initWithInput:(id)a3 settings:(id)a4
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
  _NUAssertFailHandler((uint64_t)"-[NUResampleNode initWithInput:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 574, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v29, v30, v31, v32, v28);
}

- (NUResampleNode)initWithPreparedInput:(id)a3 subsampleNode:(id)a4
{
  id v6;
  NUSubsampleNode *v7;
  NUSubsampleNode *v8;
  NUResampleNode *v9;
  NUSubsampleNode *subsampleNode;
  NSObject *v12;
  void *v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (NUSubsampleNode *)a4;
  if (!v7)
  {
    NUAssertLogger_10707();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "subsampleNode != nil");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_10707();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E0CB3978];
        v21 = v19;
        objc_msgSend(v20, "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v19;
        v31 = 2114;
        v32 = v23;
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
      v30 = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUResampleNode initWithPreparedInput:subsampleNode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 579, CFSTR("Invalid parameter not satisfying: %s"), v24, v25, v26, v27, (uint64_t)"subsampleNode != nil");
  }
  v8 = v7;
  v28.receiver = self;
  v28.super_class = (Class)NUResampleNode;
  v9 = -[NUAbstractScaleNode initWithInput:settings:](&v28, sel_initWithInput_settings_, v6, MEMORY[0x1E0C9AA70]);
  subsampleNode = v9->_subsampleNode;
  v9->_subsampleNode = v8;

  return v9;
}

- (NUResampleNode)initWithSubsampleFactor:(int64_t)a3 sampleMode:(int64_t)a4 source:(id)a5 subsampleNode:(id)a6
{
  id v10;
  NUSubsampleNode *v11;
  NUSubsampleNode *v12;
  void *v13;
  void *v14;
  void *v15;
  NUResampleNode *v16;
  NUSubsampleNode *subsampleNode;
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
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  objc_super v67;
  _QWORD v68[2];
  _QWORD v69[2];
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = (NUSubsampleNode *)a6;
  if (a3 < 0)
  {
    NUAssertLogger_10707();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "subsampleFactor >= 0");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v71 = v20;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_10707();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v41 = (void *)MEMORY[0x1E0CB3978];
        v42 = v40;
        objc_msgSend(v41, "callStackSymbols");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v71 = v40;
        v72 = 2114;
        v73 = v44;
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
      v71 = v25;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUResampleNode initWithSubsampleFactor:sampleMode:source:subsampleNode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 590, CFSTR("Invalid parameter not satisfying: %s"), v45, v46, v47, v48, (uint64_t)"subsampleFactor >= 0");
  }
  if (!a4)
  {
    NUAssertLogger_10707();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "sampleMode != NUSampleModeDefault");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v71 = v27;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_10707();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v30)
      {
        v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v50 = (void *)MEMORY[0x1E0CB3978];
        v51 = v49;
        objc_msgSend(v50, "callStackSymbols");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "componentsJoinedByString:", CFSTR("\n"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v71 = v49;
        v72 = 2114;
        v73 = v53;
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
      v71 = v32;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUResampleNode initWithSubsampleFactor:sampleMode:source:subsampleNode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 591, CFSTR("Invalid parameter not satisfying: %s"), v54, v55, v56, v57, (uint64_t)"sampleMode != NUSampleModeDefault");
  }
  v12 = v11;
  if (!v11)
  {
    NUAssertLogger_10707();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "subsampleNode != nil");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v71 = v34;
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
        v58 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v59 = (void *)MEMORY[0x1E0CB3978];
        v60 = v58;
        objc_msgSend(v59, "callStackSymbols");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "componentsJoinedByString:", CFSTR("\n"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v71 = v58;
        v72 = 2114;
        v73 = v62;
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
      v71 = v39;
      _os_log_error_impl(&dword_1A6553000, v36, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUResampleNode initWithSubsampleFactor:sampleMode:source:subsampleNode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 592, CFSTR("Invalid parameter not satisfying: %s"), v63, v64, v65, v66, (uint64_t)"subsampleNode != nil");
  }
  v68[0] = CFSTR("sampleMode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = CFSTR("subsampleFactor");
  v69[0] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v69[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v67.receiver = self;
  v67.super_class = (Class)NUResampleNode;
  v16 = -[NUAbstractScaleNode initWithInput:settings:](&v67, sel_initWithInput_settings_, v10, v15);
  v16->_subsampleFactor = a3;
  v16->_sampleMode = a4;
  subsampleNode = v16->_subsampleNode;
  v16->_subsampleNode = v12;

  return v16;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NUSubsampleNode *v11;
  void *v12;
  void *v13;
  NUSubsampleNode *subsampleNode;
  id v15;
  id v16;
  NUResampleNode *v17;
  NSObject *v19;
  void *v20;
  void *specific;
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
  _BYTE v35[12];
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "scale") < 1 || v10 <= 0)
  {
    NUAssertLogger_10707();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid render scale"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v35 = 138543362;
      *(_QWORD *)&v35[4] = v20;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v35, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_10707();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v27 = (void *)MEMORY[0x1E0CB3978];
        v28 = v26;
        objc_msgSend(v27, "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v35 = 138543618;
        *(_QWORD *)&v35[4] = v26;
        v36 = 2114;
        v37 = v30;
        _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v35, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v35 = 138543362;
      *(_QWORD *)&v35[4] = v25;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v35, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUResampleNode nodeByReplayingAgainstCache:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 619, CFSTR("Invalid render scale"), v31, v32, v33, v34, *(uint64_t *)v35);
  }
  -[NUAbstractScaleNode inputNode](self, "inputNode");
  v11 = (NUSubsampleNode *)objc_claimAutoreleasedReturnValue();
  -[NUSubsampleNode nodeByReplayingAgainstCache:pipelineState:error:](v11, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v9, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if (!objc_msgSend(v12, "isPlaceholderNode")
      && -[NUAbstractScaleNode shouldCacheNodeForPipelineState:](self, "shouldCacheNodeForPipelineState:", v9))
    {
      subsampleNode = self->_subsampleNode;
      if (v11 == subsampleNode)
      {
        v15 = v13;
      }
      else
      {
        -[NUSubsampleNode nodeByReplayingAgainstCache:pipelineState:error:](subsampleNode, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v9, a5);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          v16 = 0;
LABEL_14:

          goto LABEL_15;
        }
      }
      v16 = (id)objc_msgSend(v15, "resolveSubsampleFactorForPipelineState:error:", v9, a5);
      if (v16)
      {
        v17 = -[NUResampleNode initWithSubsampleFactor:sampleMode:source:subsampleNode:]([NUResampleNode alloc], "initWithSubsampleFactor:sampleMode:source:subsampleNode:", v16, objc_msgSend(v9, "sampleMode"), v13, v15);
        +[NURenderNode nodeFromCache:cache:](NURenderNode, "nodeFromCache:cache:", v17, v8);
        v16 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "setEvaluatedForMode:", objc_msgSend(v9, "evaluationMode"));
      }
      goto LABEL_14;
    }
    v16 = v13;
  }
  else
  {
    v16 = 0;
  }
LABEL_15:

  return v16;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_additionalScale
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  NSObject *v11;
  void *v12;
  void *specific;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = -[NUSubsampleNode appliedSubsampleFactor](self->_subsampleNode, "appliedSubsampleFactor");
  if (v3 <= 0)
  {
    NUAssertLogger_10707();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad subsample factor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_10707();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v26 = (void *)MEMORY[0x1E0CB3978];
        v27 = v25;
        objc_msgSend(v26, "callStackSymbols");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v25;
        v46 = 2114;
        v47 = v29;
        _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUResampleNode _additionalScale]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 663, CFSTR("Bad subsample factor"), v30, v31, v32, v33, v43);
  }
  v4 = v3;
  if (!-[NUResampleNode subsampleFactor](self, "subsampleFactor"))
  {
    NUAssertLogger_10707();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: invalid subsample factor"), self);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v19;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_10707();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v22)
      {
        v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v35 = (void *)MEMORY[0x1E0CB3978];
        v36 = v34;
        objc_msgSend(v35, "callStackSymbols");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v34;
        v46 = 2114;
        v47 = v38;
        _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v24;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUResampleNode _additionalScale]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 666, CFSTR("%@: invalid subsample factor"), v39, v40, v41, v42, (uint64_t)self);
  }
  v5 = -[NUResampleNode subsampleFactor](self, "subsampleFactor");
  v7 = *((_QWORD *)&NUScaleOne + 1);
  v6 = NUScaleOne;
  if (NUScaleCompare(1, v4, 1, v5) >= 1)
  {
    v6 = NUScaleDivide(1, v5, 1, v4);
    v7 = v8;
  }
  v9 = v6;
  v10 = v7;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (id)_evaluateImage:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int64_t sampleMode;
  uint64_t v13;
  uint64_t v15;

  -[NUAbstractScaleNode inputNode](self, "inputNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputImage:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[NUResampleNode _additionalScale](self, "_additionalScale");
    v9 = v8;
    if (!NUScaleEqual(v7, v8, NUScaleOne, *((uint64_t *)&NUScaleOne + 1)))
    {
      -[NURenderNode outputImageGeometry:](self, "outputImageGeometry:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = v10;
        sampleMode = self->_sampleMode;
        objc_msgSend(v10, "physicalScaledExtent");
        -[NUAbstractScaleNode _scaleImage:by:sampleMode:extent:](self, "_scaleImage:by:sampleMode:extent:", v6, v7, v9, sampleMode, &v15);
        v13 = objc_claimAutoreleasedReturnValue();

        v6 = v11;
      }
      else
      {
        v13 = 0;
      }

      v6 = (void *)v13;
    }
  }
  return v6;
}

- (BOOL)isGeometryNode
{
  return 1;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NUImageGeometry *v13;
  NUImageGeometry *v14;
  NUImageGeometry *v15;
  uint64_t v17;

  -[NUAbstractScaleNode inputNode](self, "inputNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputImageGeometry:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (-[NUResampleNode subsampleFactor](self, "subsampleFactor"))
    {
      v7 = -[NUResampleNode subsampleFactor](self, "subsampleFactor");
      v8 = objc_msgSend(v6, "renderScale");
      v10 = NUScaleMultiply(1, v7, v8, v9);
      v12 = v11;
      v13 = [NUImageGeometry alloc];
      objc_msgSend(v6, "extent");
      v14 = -[NUImageGeometry initWithExtent:renderScale:orientation:](v13, "initWithExtent:renderScale:orientation:", &v17, v10, v12, objc_msgSend(v6, "orientation"));
    }
    else
    {
      v14 = v6;
    }
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (int64_t)subsampleFactor
{
  return self->_subsampleFactor;
}

- (int64_t)sampleMode
{
  return self->_sampleMode;
}

- (NUSubsampleNode)subsampleNode
{
  return (NUSubsampleNode *)objc_getProperty(self, a2, 184, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subsampleNode, 0);
}

@end
