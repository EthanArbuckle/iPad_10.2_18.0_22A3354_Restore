@implementation NUCGAuxiliaryImageSourceNode

- (NUCGAuxiliaryImageSourceNode)initWithSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *specific;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  objc_class *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_8418);
  v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = v5;
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v11;
    _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v12 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v12 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_8418);
      goto LABEL_8;
    }
    if (v12 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_8418);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v13 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v14 = (void *)MEMORY[0x1E0CB3978];
    v15 = v13;
    objc_msgSend(v14, "callStackSymbols");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v17;
    _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v18 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v20 = (void *)MEMORY[0x1E0CB3978];
  v21 = specific;
  v15 = v18;
  objc_msgSend(v20, "callStackSymbols");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v31 = specific;
  v32 = 2114;
  v33 = v23;
  _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v24 = (objc_class *)objc_opt_class();
  NSStringFromClass(v24);
  v25 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUCGAuxiliaryImageSourceNode initWithSettings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGAuxiliaryImage.m", 121, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v26, v27, v28, v29, v25);
}

- (NUCGAuxiliaryImageSourceNode)initWithSourceNode:(id)a3 auxiliaryImageType:(int64_t)a4 auxiliaryImageProperties:(id)a5
{
  NUCGImageSourceNode *v8;
  NUAuxiliaryImageProperties *v9;
  NUAuxiliaryImageProperties *auxiliaryImageProperties;
  NUAuxiliaryImageProperties *v11;
  NUCGImageSourceNode *sourceNode;
  NUCGImageSourceNode *v13;
  void *v14;
  unint64_t v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  NUCGAuxiliaryImageSourceNode *v19;
  NSObject *v21;
  void *v22;
  void *specific;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
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
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  objc_super v53;
  _QWORD v54[2];
  _QWORD v55[2];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = (NUCGImageSourceNode *)a3;
  v9 = (NUAuxiliaryImageProperties *)a5;
  if (!v8)
  {
    NUAssertLogger_8396();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "sourceNode != nil");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v22;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_8396();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = (void *)MEMORY[0x1E0CB3978];
        v37 = v35;
        objc_msgSend(v36, "callStackSymbols");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = v35;
        v58 = 2114;
        v59 = v39;
        _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v27;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCGAuxiliaryImageSourceNode initWithSourceNode:auxiliaryImageType:auxiliaryImageProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGAuxiliaryImage.m", 126, CFSTR("Invalid parameter not satisfying: %s"), v40, v41, v42, v43, (uint64_t)"sourceNode != nil");
  }
  if (!v9)
  {
    NUAssertLogger_8396();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "auxiliaryImageProperties != nil");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v29;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_8396();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v45 = (void *)MEMORY[0x1E0CB3978];
        v46 = v44;
        objc_msgSend(v45, "callStackSymbols");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = v44;
        v58 = 2114;
        v59 = v48;
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
      v57 = v34;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCGAuxiliaryImageSourceNode initWithSourceNode:auxiliaryImageType:auxiliaryImageProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGAuxiliaryImage.m", 127, CFSTR("Invalid parameter not satisfying: %s"), v49, v50, v51, v52, (uint64_t)"auxiliaryImageProperties != nil");
  }
  auxiliaryImageProperties = self->_auxiliaryImageProperties;
  self->_auxiliaryImageProperties = v9;
  v11 = v9;

  self->_auxiliaryImageType = a4;
  sourceNode = self->_sourceNode;
  self->_sourceNode = v8;
  v13 = v8;

  v54[0] = CFSTR("sourceSettings");
  -[NURenderNode settings](v13, "settings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = CFSTR("auxiliaryImageType");
  v55[0] = v14;
  v15 = -[NUCGAuxiliaryImageSourceNode auxiliaryImageType](self, "auxiliaryImageType");
  if (v15 > 0xC)
    v16 = CFSTR("Invalid");
  else
    v16 = off_1E5060F88[v15];
  v17 = v16;
  v55[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v53.receiver = self;
  v53.super_class = (Class)NUCGAuxiliaryImageSourceNode;
  v19 = -[NUSourceNode initWithSettings:](&v53, sel_initWithSettings_, v18);

  -[NUSourceNode setOriginalNode:](v19, "setOriginalNode:", v13);
  return v19;
}

- (int64_t)auxiliaryImageType
{
  return self->_auxiliaryImageType;
}

- (id)pipelineOptionsForPipelineState:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  NSObject *v13;
  void *v14;
  void *specific;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const __CFString *v29;
  __CFString *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    NUAssertLogger_8396();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v14;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_8396();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v21 = (void *)MEMORY[0x1E0CB3978];
        v22 = v20;
        objc_msgSend(v21, "callStackSymbols");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v20;
        v33 = 2114;
        v34 = v24;
        _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v19;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCGAuxiliaryImageSourceNode pipelineOptionsForPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGAuxiliaryImage.m", 148, CFSTR("Invalid parameter not satisfying: %s"), v25, v26, v27, v28, (uint64_t)"error != NULL");
  }
  v7 = v6;
  v8 = -[NUCGAuxiliaryImageSourceNode auxiliaryImageType](self, "auxiliaryImageType");
  v29 = CFSTR("auxiliaryImageType");
  if (v8 > 0xC)
    v9 = CFSTR("Invalid");
  else
    v9 = off_1E5060F88[v8];
  v10 = v9;
  v30 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)pixelSizeWithSourceOptions:(id)a3
{
  int64_t v3;
  int64_t v4;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v3 = -[NUAuxiliaryImageProperties size](self->_auxiliaryImageProperties, "size", a3);
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (int64_t)sourceOrientation
{
  return -[NUCGImageSourceNode sourceOrientation](self->_sourceNode, "sourceOrientation");
}

- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3
{
  return -[NUCGAuxiliaryImageSourceNode auxiliaryImageType](self, "auxiliaryImageType") == a3;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "evaluationMode");
  return (v3 < 4) & (0xBu >> (v3 & 0xF));
}

- (BOOL)supportsPipelineState:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  const __CFString *v10;
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
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    NUAssertLogger_8396();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_8396();
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
        v29 = v19;
        v30 = 2114;
        v31 = v23;
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
      v29 = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCGAuxiliaryImageSourceNode supportsPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGAuxiliaryImage.m", 184, CFSTR("Invalid parameter not satisfying: %s"), v24, v25, v26, v27, (uint64_t)"error != nil");
  }
  v7 = v6;
  if (objc_msgSend(v6, "mediaComponentType") != 1)
  {
    v10 = CFSTR("expected an image mediaComponentType");
LABEL_7:
    +[NUError mismatchError:object:](NUError, "mismatchError:object:", v10, v7);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v8 = objc_msgSend(v7, "auxiliaryImageType");
  if (v8 != -[NUCGAuxiliaryImageSourceNode auxiliaryImageType](self, "auxiliaryImageType"))
  {
    v10 = CFSTR("Incompatible auxiliary image type");
    goto LABEL_7;
  }
  v9 = 1;
LABEL_8:

  return v9;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  NUCGAuxiliaryImageSourceNode *v7;

  if (-[NUCGAuxiliaryImageSourceNode supportsPipelineState:error:](self, "supportsPipelineState:error:", a5, a6))
    v7 = self;
  else
    v7 = 0;
  return v7;
}

- (id)_evaluateAuxiliaryImageForType:(int64_t)a3 error:(id *)a4
{
  void *v7;
  __CFString *v8;
  __CFString *v9;
  NSObject *v11;
  void *v12;
  void *specific;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    NUAssertLogger_8396();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_8396();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v19 = (void *)MEMORY[0x1E0CB3978];
        v20 = v18;
        objc_msgSend(v19, "callStackSymbols");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v18;
        v29 = 2114;
        v30 = v22;
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
      v28 = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCGAuxiliaryImageSourceNode _evaluateAuxiliaryImageForType:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGAuxiliaryImage.m", 211, CFSTR("Invalid parameter not satisfying: %s"), v23, v24, v25, v26, (uint64_t)"error != NULL");
  }
  if (-[NUCGAuxiliaryImageSourceNode auxiliaryImageType](self, "auxiliaryImageType") == 10)
  {
    -[NUCGImageSourceNode _evaluateAuxiliaryImageForType:error:](self->_sourceNode, "_evaluateAuxiliaryImageForType:error:", a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[NUCGAuxiliaryImageSourceNode auxiliaryImageType](self, "auxiliaryImageType") == a3)
  {
    -[NUAuxiliaryImageProperties auxiliaryImage:](self->_auxiliaryImageProperties, "auxiliaryImage:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((unint64_t)a3 > 0xC)
      v8 = CFSTR("Invalid");
    else
      v8 = off_1E5060F88[a3];
    v9 = v8;
    +[NUError mismatchError:object:](NUError, "mismatchError:object:", CFSTR("Incompatible auxiliary image type"), v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v7 = 0;
  }
  return v7;
}

- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  NUAuxiliaryImageProperties *auxiliaryImageProperties;
  void *v11;
  id v12;
  void *v13;
  NUAuxiliaryImageProperties *v14;
  uint64_t v15;
  __CVBuffer *v16;
  id v17;
  int64_t v18;
  CGColorSpace *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  NSObject *v32;
  void *v33;
  void *specific;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE buf[12];
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!a5)
  {
    NUAssertLogger_8396();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v33;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_8396();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v36)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v40 = (void *)MEMORY[0x1E0CB3978];
        v41 = v39;
        objc_msgSend(v40, "callStackSymbols");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v39;
        v53 = 2114;
        v54 = v43;
        _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v36)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v38;
      _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCGAuxiliaryImageSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGAuxiliaryImage.m", 230, CFSTR("Invalid parameter not satisfying: %s"), v44, v45, v46, v47, (uint64_t)"error != NULL");
  }
  v9 = v8;
  if (-[NUCGAuxiliaryImageSourceNode auxiliaryImageType](self, "auxiliaryImageType") == 11)
  {
    *(_QWORD *)buf = 1;
    auxiliaryImageProperties = self->_auxiliaryImageProperties;
    v49 = 0;
    -[NUAuxiliaryImageProperties auxiliaryImageWithSourceOptions:subsampleFactor:error:](auxiliaryImageProperties, "auxiliaryImageWithSourceOptions:subsampleFactor:error:", v9, buf, &v49);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v49;
    if (!v11)
    {
LABEL_4:
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to retrieve auxiliary image"), self->_auxiliaryImageProperties, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v21 = 0;
      *a5 = v13;
      goto LABEL_23;
    }
  }
  else
  {
    v14 = self->_auxiliaryImageProperties;
    v48 = 0;
    -[NUAuxiliaryImageProperties auxiliaryImageWithSourceOptions:subsampleFactor:error:](v14, "auxiliaryImageWithSourceOptions:subsampleFactor:error:", v9, a4, &v48);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v48;
    if (!v11)
      goto LABEL_4;
  }
  v15 = objc_msgSend(v11, "cvPixelBufferRef");
  if (!v15)
  {
    +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Unable to retrieve cvPixelBufferRef"), v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v16 = (__CVBuffer *)v15;
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = -[NUCGAuxiliaryImageSourceNode auxiliaryImageType](self, "auxiliaryImageType");
  if (v18 == 10)
  {
    +[NUColorSpace displayP3ColorSpace](NUColorSpace, "displayP3ColorSpace");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "CGColorSpace");
    v24 = *MEMORY[0x1E0C9E110];
    v25 = v17;
  }
  else
  {
    if (v18 == 7)
    {
      v19 = (CGColorSpace *)CVBufferCopyAttachment(v16, (CFStringRef)*MEMORY[0x1E0CA8CD8], 0);
      if (!v19)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0C9E110]);

      }
      CGColorSpaceRelease(v19);
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *MEMORY[0x1E0C9E110];
    v25 = v17;
    v23 = (uint64_t)v22;
  }
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v23, v24);

LABEL_17:
  -[NSObject nu_digest](self, "nu_digest");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0C9E118]);

  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", v16, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v11, "metadata");
  if (v27)
  {
    v50 = *MEMORY[0x1E0CBC6D0];
    v51 = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "imageBySettingPropertiesNoCopy:", v28);
    v29 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v29;
  }
  if (v21)
  {
    v30 = v21;
  }
  else
  {
    +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("[CIImage imageWithCVPixelBuffer:cvPixelBufferRef options:options] failed."), v16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_23:
  return v21;
}

- (id)_evaluateImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4
{
  return -[NUCGImageSourceNode _evaluateImagePropertiesWithSourceOptions:error:](self->_sourceNode, "_evaluateImagePropertiesWithSourceOptions:error:", a3, a4);
}

- (NUCGImageSourceNode)sourceNode
{
  return (NUCGImageSourceNode *)objc_getProperty(self, a2, 200, 1);
}

- (void)setSourceNode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NUAuxiliaryImageProperties)auxiliaryImageProperties
{
  return self->_auxiliaryImageProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceNode, 0);
  objc_storeStrong((id *)&self->_auxiliaryImageProperties, 0);
}

@end
