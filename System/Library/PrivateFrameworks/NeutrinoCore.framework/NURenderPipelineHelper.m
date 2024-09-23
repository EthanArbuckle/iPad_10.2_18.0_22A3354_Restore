@implementation NURenderPipelineHelper

- (NURenderPipelineHelper)initWithPipelineState:(id)a3
{
  NURenderPipelineState *v4;
  NURenderPipelineHelper *v5;
  NURenderPipelineState *pipelineState;
  objc_super v8;

  v4 = (NURenderPipelineState *)a3;
  v8.receiver = self;
  v8.super_class = (Class)NURenderPipelineHelper;
  v5 = -[NURenderPipelineHelper init](&v8, sel_init);
  pipelineState = v5->_pipelineState;
  v5->_pipelineState = v4;

  return v5;
}

- (int64_t)mediaTypeForComposition:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("source"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "definition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "mediaType");
  else
    v6 = 0;

  return v6;
}

- (BOOL)hasStaticTime
{
  void *v2;
  void *v3;
  BOOL v4;
  char v6;

  -[NURenderPipelineHelper pipelineState](self, "pipelineState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "time");
    v4 = v6 & 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)beginGroupWithName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[NURenderPipelineHelper pipelineState](self, "pipelineState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginGroupWithName:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)endGroupWithName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[NURenderPipelineHelper pipelineState](self, "pipelineState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "endGroupWithName:error:", v6, a4);

  return (char)a4;
}

- (id)inputForPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    NUAssertLogger_21569();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v15;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_21569();
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
        v31 = v21;
        v32 = 2114;
        v33 = v25;
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
      v31 = v20;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper inputForPath:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 64, CFSTR("Invalid parameter not satisfying: %s"), v26, v27, v28, v29, (uint64_t)"error != NULL");
  }
  v7 = v6;
  -[NURenderPipelineHelper pipelineState](self, "pipelineState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[NURenderTagGroup validatePath:error:](NURenderTagGroup, "validatePath:error:", v7, a4))
  {
    objc_msgSend(v9, "nodeWithPath:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "input");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 5, CFSTR("inputForPath - did not find node with path"), v7);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 5, CFSTR("inputForPath - Invalid path"), v7, *a4);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)addTagWithName:(id)a3 inputNode:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v16;
  void *v17;
  void *specific;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!a5)
  {
    NUAssertLogger_21569();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v17;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_21569();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v24 = (void *)MEMORY[0x1E0CB3978];
        v25 = v23;
        objc_msgSend(v24, "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v23;
        v34 = 2114;
        v35 = v27;
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
      v33 = v22;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper addTagWithName:inputNode:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 88, CFSTR("Invalid parameter not satisfying: %s"), v28, v29, v30, v31, (uint64_t)"error != NULL");
  }
  v10 = v9;
  if (+[NURenderTagNode validateName:error:](NURenderTagNode, "validateName:error:", v8, a5))
  {
    -[NURenderPipelineHelper pipelineState](self, "pipelineState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentGroup");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "nodeWithPath:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 5, CFSTR("Given tag already present"), v8);
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v12, "addTag:forNode:", v8, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 5, CFSTR("Invalid tag name"), v8, *a5);
    v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)getTagWithPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
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
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    NUAssertLogger_21569();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v15;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_21569();
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
        v31 = v21;
        v32 = 2114;
        v33 = v25;
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
      v31 = v20;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper getTagWithPath:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 112, CFSTR("Invalid parameter not satisfying: %s"), v26, v27, v28, v29, (uint64_t)"error != nil");
  }
  v7 = v6;
  -[NURenderPipelineHelper pipelineState](self, "pipelineState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[NURenderTagGroup validatePath:error:](NURenderTagGroup, "validatePath:error:", v7, a4))
  {
    objc_msgSend(v9, "nodeWithPath:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 1, CFSTR("getTagWithPath - could not find tag"), v7);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 5, CFSTR("getTagWithPath - Invalid tag path"), v7, *a4);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)renderNodeFromSource:(id)a3 settings:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v20;
  void *v21;
  void *specific;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
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
  if (!a5)
  {
    NUAssertLogger_21569();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v21;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_21569();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v28 = (void *)MEMORY[0x1E0CB3978];
        v29 = v27;
        objc_msgSend(v28, "callStackSymbols");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v27;
        v38 = 2114;
        v39 = v31;
        _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v26;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper renderNodeFromSource:settings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 135, CFSTR("Invalid parameter not satisfying: %s"), v32, v33, v34, v35, (uint64_t)"error != nil");
  }
  v10 = v9;
  if (v8)
  {
    +[NUSourceContainerNode sourceContainerNodeFromSource:error:](NUSourceContainerNode, "sourceContainerNodeFromSource:error:", v8, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[NURenderPipelineHelper pipelineState](self, "pipelineState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pipelineSettingsFromSourceSettings:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[NURenderPipelineHelper pipelineState](self, "pipelineState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "copy");

      if (objc_msgSend(v15, "applyPipelineSettings:error:", v13, a5))
      {
        objc_msgSend(v11, "preparedSourceNodeForPipelineState:pipelineSettings:sourceSettings:error:", v15, v13, v10, a5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
          v18 = v16;

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("Invalid source"), self);
    v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)cacheNode:(id)a3 type:(id)a4 settings:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v20;
  void *v21;
  void *specific;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
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
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!a6)
  {
    NUAssertLogger_21569();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v21;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_21569();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v28 = (void *)MEMORY[0x1E0CB3978];
        v29 = v27;
        objc_msgSend(v28, "callStackSymbols");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v27;
        v38 = 2114;
        v39 = v31;
        _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v26;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper cacheNode:type:settings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 164, CFSTR("Invalid parameter not satisfying: %s"), v32, v33, v34, v35, (uint64_t)"error != nil");
  }
  v13 = v12;
  +[NUCacheNode registry](NUCacheNode, "registry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "classForCacheNodeType:", v11);

  if (v15)
  {
    -[NURenderPipelineHelper pipelineState](self, "pipelineState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "nodeWithInput:settings:pipelineState:error:", v10, v13, v16, a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = v17;
    }
    else
    {
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to instantiate cache node"), v15, *a6);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Unknown cache node type"), v11);
    v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)scaleNode:(id)a3 scale:(id)a4 error:(id *)a5
{
  int64_t var1;
  int64_t var0;
  id v9;
  void *v10;
  NUScaleNode *v11;
  void *v12;
  NUScaleNode *v13;
  NSObject *v15;
  void *v16;
  void *specific;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  var1 = a4.var1;
  var0 = a4.var0;
  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!a5)
  {
    NUAssertLogger_21569();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v16;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_21569();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v23 = (void *)MEMORY[0x1E0CB3978];
        v24 = v22;
        objc_msgSend(v23, "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v22;
        v33 = 2114;
        v34 = v26;
        _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v21;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper scaleNode:scale:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 183, CFSTR("Invalid parameter not satisfying: %s"), v27, v28, v29, v30, (uint64_t)"error != nil");
  }
  v10 = v9;
  if (v9)
  {
    v11 = [NUScaleNode alloc];
    -[NURenderPipelineHelper pipelineState](self, "pipelineState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NUScaleNode initWithScale:sampleMode:input:](v11, "initWithScale:sampleMode:input:", var0, var1, objc_msgSend(v12, "sampleMode"), v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("input image to scaleNode:scale: cannot be nil"), v12);
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)cropNode:(id)a3 cropRect:(id *)a4 cropSettings:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NUCropNode *v20;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  NUCropNode *v22;
  NSObject *v24;
  void *v25;
  void *specific;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int v40;
  double v41;
  double v42;
  double v43;
  _QWORD v44[3];
  _QWORD v45[3];
  uint8_t buf[40];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (!v7)
  {
    NUAssertLogger_21569();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "node != nil");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v25;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_21569();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v32 = (void *)MEMORY[0x1E0CB3978];
        v33 = v31;
        objc_msgSend(v32, "callStackSymbols");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v31;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v35;
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
      *(_QWORD *)&buf[4] = v30;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper cropNode:cropRect:cropSettings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 197, CFSTR("Invalid parameter not satisfying: %s"), v36, v37, v38, v39, (uint64_t)"node != nil");
  }
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("resetCleanAperture"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("projectUsingCleanAperture"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("projectUsingOriginalSize"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("projectUsingEstimatedCleanAperture"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    if (v12 && v13)
    {
      v40 = v11;
      v42 = 0.0;
      v43 = 0.0;
      objc_msgSend(v13, "getValue:", &v42);
      memset(buf, 0, 32);
      objc_msgSend(v12, "getValue:", buf);
      v41 = 0.0;
      if (v14)
        objc_msgSend(v14, "getValue:", &v41);
      v44[0] = CFSTR("projectUsingCleanAperture");
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGRect:", *(double *)buf, *(double *)&buf[8], *(_OWORD *)&buf[16]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v16;
      v44[1] = CFSTR("projectUsingOriginalSize");
      v17 = objc_alloc(MEMORY[0x1E0C9DDF8]);
      v18 = (void *)objc_msgSend(v17, "initWithX:Y:", v42, v43);
      v45[1] = v18;
      v44[2] = CFSTR("projectUsingEstimatedCleanAperture");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v41);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v45[2] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v40;
    }
  }
  else
  {
    v13 = 0;
    v11 = 0;
    v12 = 0;
    v14 = 0;
    v15 = 0;
  }
  v20 = [NUCropNode alloc];
  var1 = a4->var1;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)buf = a4->var0;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)&buf[16] = var1;
  v22 = -[NUCropNode initWithRect:input:resetCleanAperture:settings:](v20, "initWithRect:input:resetCleanAperture:settings:", buf, v7, v11, v15);

  return v22;
}

- (id)filterNode:(id)a3 input:(id)a4 settings:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15 = *MEMORY[0x1E0C9E1F8];
  v16[0] = a4;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NURenderPipelineHelper filterNode:inputs:settings:](self, "filterNode:inputs:settings:", v11, v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)filterNode:(id)a3 inputs:(id)a4 settings:(id)a5
{
  id v7;
  id v8;
  id v9;
  NUFilterNode *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[NUFilterNode initWithFilterName:settings:inputs:]([NUFilterNode alloc], "initWithFilterName:settings:inputs:", v9, v7, v8);

  return v10;
}

- (BOOL)isCIFilterAvailable:(id)a3 propertyName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "inputKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v5);

  }
  else
  {
    v9 = 1;
  }
  if (!v7)
    v9 = 0;

  return v9;
}

- (id)vectorWithFloats:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[256];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4 >= 0x20)
    v5 = 32;
  else
    v5 = v4;
  objc_msgSend(v3, "subarrayWithRange:", 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    v11 = v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "doubleValue", (_QWORD)v16);
        *v11++ = v13;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithValues:count:", v21, objc_msgSend(v7, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)sourceFromComposition:(id)a3 error:(id *)a4
{
  return -[NURenderPipelineHelper sourceFromComposition:withName:error:](self, "sourceFromComposition:withName:error:", a3, CFSTR("source"), a4);
}

- (id)sourceFromComposition:(id)a3 withName:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  const __CFString *v10;
  id v11;

  v7 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v10 = CFSTR("no source found");
    v11 = v7;
LABEL_6:
    +[NUError missingError:object:](NUError, "missingError:object:", v10, v11);
    v9 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = CFSTR("object is not an NUSource");
    v11 = v8;
    goto LABEL_6;
  }
  v9 = v8;
LABEL_7:

  return v9;
}

- (BOOL)isSourceAvailable:(id)a3 sourceSettings:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  id v15;
  id v17;
  id v18;
  id v19;

  v6 = a4;
  v19 = 0;
  +[NUSourceContainerNode sourceContainerNodeFromSource:error:](NUSourceContainerNode, "sourceContainerNodeFromSource:error:", a3, &v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v19;
  if (v7)
  {
    -[NURenderPipelineHelper pipelineState](self, "pipelineState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    objc_msgSend(v10, "pipelineSettingsFromSourceSettings:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v12 = objc_msgSend(v10, "applyPipelineSettings:error:", v11, &v18);
    v13 = v18;

    if (v12)
    {
      v17 = 0;
      objc_msgSend(v7, "preparedSourceNodeForPipelineState:pipelineSettings:sourceSettings:error:", v10, v11, v6, &v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v17;

      LOBYTE(v12) = v14 != 0;
      v13 = v15;
    }

    v8 = v13;
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (id)auxiliaryImageFromComposition:(id)a3 type:(id)a4 mediaComponentType:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v23;
  void *v24;
  void *specific;
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
  _OWORD v39[2];
  _QWORD v40[4];
  _QWORD v41[4];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!a6)
  {
    NUAssertLogger_21569();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v24;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_21569();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v31 = (void *)MEMORY[0x1E0CB3978];
        v32 = v30;
        objc_msgSend(v31, "callStackSymbols");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v30;
        v44 = 2114;
        v45 = v34;
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
      v43 = v29;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper auxiliaryImageFromComposition:type:mediaComponentType:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 310, CFSTR("Invalid parameter not satisfying: %s"), v35, v36, v37, v38, (uint64_t)"error != nil");
  }
  v13 = v12;
  v40[0] = CFSTR("auxiliaryImageType");
  v40[1] = CFSTR("skipOrientation");
  v41[0] = v11;
  v41[1] = MEMORY[0x1E0C9AAB0];
  v40[2] = CFSTR("nativeScale");
  v40[3] = CFSTR("mediaComponentType");
  v41[2] = MEMORY[0x1E0C9AAB0];
  v41[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("source"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[NURenderPipelineHelper isSourceAvailable:sourceSettings:](self, "isSourceAvailable:sourceSettings:", v15, v14);

  if (v16)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("source"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderPipelineHelper renderNodeFromSource:settings:error:](self, "renderNodeFromSource:settings:error:", v17, v14, a6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v18, "outputImageGeometry:", a6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
        objc_msgSend(v19, "extent");
      else
        memset(v39, 0, sizeof(v39));
      -[NURenderPipelineHelper cropNode:cropRect:cropSettings:](self, "cropNode:cropRect:cropSettings:", v18, v39, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)resetTag:(id)a3 input:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a3;
  -[NURenderPipelineHelper pipelineState](self, "pipelineState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "nodeWithPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "hasCyclicalDependencyForInput:", v10) & 1) == 0)
    objc_msgSend(v9, "setInput:", v10);

}

- (BOOL)resetTag:(id)a3 input:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  BOOL v16;
  NSObject *v18;
  void *v19;
  void *specific;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
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
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    NUAssertLogger_21569();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "path != nil");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v67 = v19;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_21569();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v40 = (void *)MEMORY[0x1E0CB3978];
        v41 = v39;
        objc_msgSend(v40, "callStackSymbols");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v67 = v39;
        v68 = 2114;
        v69 = v43;
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
      v67 = v24;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper resetTag:input:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 348, CFSTR("Invalid parameter not satisfying: %s"), v44, v45, v46, v47, (uint64_t)"path != nil");
  }
  v10 = v9;
  if (!v9)
  {
    NUAssertLogger_21569();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "input != nil");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v67 = v26;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_21569();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v49 = (void *)MEMORY[0x1E0CB3978];
        v50 = v48;
        objc_msgSend(v49, "callStackSymbols");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "componentsJoinedByString:", CFSTR("\n"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v67 = v48;
        v68 = 2114;
        v69 = v52;
        _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v67 = v31;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper resetTag:input:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 349, CFSTR("Invalid parameter not satisfying: %s"), v53, v54, v55, v56, (uint64_t)"input != nil");
  }
  if (!a5)
  {
    NUAssertLogger_21569();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v67 = v33;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_21569();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (v34)
    {
      if (v36)
      {
        v57 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v58 = (void *)MEMORY[0x1E0CB3978];
        v59 = v57;
        objc_msgSend(v58, "callStackSymbols");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "componentsJoinedByString:", CFSTR("\n"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v67 = v57;
        v68 = 2114;
        v69 = v61;
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
      v67 = v38;
      _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper resetTag:input:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 350, CFSTR("Invalid parameter not satisfying: %s"), v62, v63, v64, v65, (uint64_t)"error != nil");
  }
  -[NURenderPipelineHelper pipelineState](self, "pipelineState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentGroup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "nodeWithPath:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if (!objc_msgSend(v13, "hasCyclicalDependencyForInput:", v10))
    {
      objc_msgSend(v14, "setInput:", v10);
      v16 = 1;
      goto LABEL_10;
    }
    v15 = CFSTR("resetTag failed - has cyclical dependency");
  }
  else
  {
    v15 = CFSTR("resetTag failed - could not find tag");
  }
  +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 1, v15, v8);
  v16 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v16;
}

- (id)trimInput:(id)a3 startTime:(id *)a4 endTime:(id *)a5 error:(id *)a6
{
  id v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  const __CFString *v13;
  NUTrimNode *v14;
  NUTrimNode *v15;
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
  CMTime rhs;
  CMTime duration;
  CMTimeRange v35;
  CMTimeRange time;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!a6)
  {
    NUAssertLogger_21569();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time.start.value) = 138543362;
      *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&time, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_21569();
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
        LODWORD(time.start.value) = 138543618;
        *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v24;
        LOWORD(time.start.flags) = 2114;
        *(_QWORD *)((char *)&time.start.flags + 2) = v28;
        _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&time, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time.start.value) = 138543362;
      *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&time, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper trimInput:startTime:endTime:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 373, CFSTR("Invalid parameter not satisfying: %s"), v29, v30, v31, v32, (uint64_t)"error != nil");
  }
  v10 = v9;
  if ((a4->var2 & 1) == 0)
  {
    *(_OWORD *)&time.start.value = *(_OWORD *)&a4->var0;
    time.start.epoch = a4->var3;
    v11 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &time.start);
    +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("start time is invalid"), v11);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  if ((a5->var2 & 1) == 0)
  {
    *(_OWORD *)&time.start.value = *(_OWORD *)&a5->var0;
    time.start.epoch = a5->var3;
    v12 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &time.start);
    v13 = CFSTR("end time is invalid");
LABEL_12:
    +[NUError invalidError:object:](NUError, "invalidError:object:", v13, v12);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  memset(&v35, 0, sizeof(v35));
  *(_OWORD *)&time.start.value = *(_OWORD *)&a5->var0;
  time.start.epoch = a5->var3;
  rhs = (CMTime)*a4;
  CMTimeSubtract(&duration, &time.start, &rhs);
  *(_OWORD *)&time.start.value = *(_OWORD *)&a4->var0;
  time.start.epoch = a4->var3;
  CMTimeRangeMake(&v35, &time.start, &duration);
  if ((v35.start.flags & 1) == 0 || (v35.duration.flags & 1) == 0 || v35.duration.epoch || v35.duration.value < 0)
  {
    time = v35;
    v12 = (__CFString *)CMTimeRangeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &time);
    v13 = CFSTR("time range is invalid");
    goto LABEL_12;
  }
  v14 = [NUTrimNode alloc];
  time = v35;
  v15 = -[NUTrimNode initWithTimeRange:input:](v14, "initWithTimeRange:input:", &time, v10);
LABEL_14:

  return v15;
}

- (id)createSloMoWithInput:(id)a3 startTime:(id *)a4 endTime:(id *)a5 rate:(float)a6 error:(id *)a7
{
  id v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  const __CFString *v15;
  NUSlowMotionNode *v16;
  NUSlowMotionNode *v17;
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
  CMTime rhs;
  CMTime duration;
  CMTimeRange v37;
  CMTimeRange time;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  if (!a7)
  {
    NUAssertLogger_21569();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time.start.value) = 138543362;
      *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v20;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&time, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_21569();
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
        LODWORD(time.start.value) = 138543618;
        *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v26;
        LOWORD(time.start.flags) = 2114;
        *(_QWORD *)((char *)&time.start.flags + 2) = v30;
        _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&time, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time.start.value) = 138543362;
      *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v25;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&time, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper createSloMoWithInput:startTime:endTime:rate:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 397, CFSTR("Invalid parameter not satisfying: %s"), v31, v32, v33, v34, (uint64_t)"error != nil");
  }
  v12 = v11;
  if ((a4->var2 & 1) == 0)
  {
    *(_OWORD *)&time.start.value = *(_OWORD *)&a4->var0;
    time.start.epoch = a4->var3;
    v13 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &time.start);
    +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("start time is invalid"), v13);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
    v17 = 0;
    goto LABEL_14;
  }
  if ((a5->var2 & 1) == 0)
  {
    *(_OWORD *)&time.start.value = *(_OWORD *)&a5->var0;
    time.start.epoch = a5->var3;
    v14 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &time.start);
    v15 = CFSTR("end time is invalid");
LABEL_12:
    +[NUError invalidError:object:](NUError, "invalidError:object:", v15, v14);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  memset(&v37, 0, sizeof(v37));
  *(_OWORD *)&time.start.value = *(_OWORD *)&a5->var0;
  time.start.epoch = a5->var3;
  rhs = (CMTime)*a4;
  CMTimeSubtract(&duration, &time.start, &rhs);
  *(_OWORD *)&time.start.value = *(_OWORD *)&a4->var0;
  time.start.epoch = a4->var3;
  CMTimeRangeMake(&v37, &time.start, &duration);
  if ((v37.start.flags & 1) == 0 || (v37.duration.flags & 1) == 0 || v37.duration.epoch || v37.duration.value < 0)
  {
    time = v37;
    v14 = (__CFString *)CMTimeRangeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &time);
    v15 = CFSTR("time range is invalid");
    goto LABEL_12;
  }
  v16 = [NUSlowMotionNode alloc];
  time = v37;
  v17 = -[NUSlowMotionNode initWithTimeRange:rate:input:](v16, "initWithTimeRange:rate:input:", &time, v12, COERCE_DOUBLE(__PAIR64__(v37.duration.flags, LODWORD(a6))));
LABEL_14:

  return v17;
}

- (id)perspectiveTransformWithPitch:(double)a3 yaw:(double)a4 roll:(double)a5 imageRect:(CGRect)a6
{
  int64x2_t v6;
  int64x2_t v7;
  int64x2_t v8;
  NUImageTransform3D *v9;
  _OWORD v11[8];
  int64x2_t v12;
  int64x2_t v13;
  int64x2_t v14;
  int64x2_t v15;
  int64x2_t v16;
  float64x2_t v17;
  int64x2_t v18;
  float64x2_t v19;
  float64x2x4_t v20;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  +[NUCropModel _imageTransformFromPitch:yaw:roll:imageRect:](NUCropModel, "_imageTransformFromPitch:yaw:roll:imageRect:", a3 * 3.14159265 / 180.0, a4 * 3.14159265 / 180.0, a5 * 3.14159265 / 180.0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  v20 = vld4q_f64((const double *)v16.i64);
  v6 = vzip2q_s64(v12, v14);
  v7 = vzip1q_s64(v13, v15);
  v8 = vzip2q_s64(v13, v15);
  v12 = vzip1q_s64(v12, v14);
  v13 = (int64x2_t)v20.val[0];
  v14 = v6;
  v15 = (int64x2_t)v20.val[1];
  v16 = v7;
  v17 = v20.val[2];
  v18 = v8;
  v19 = v20.val[3];
  v9 = [NUImageTransform3D alloc];
  v11[4] = v16;
  v11[5] = v17;
  v11[6] = v18;
  v11[7] = v19;
  v11[0] = v12;
  v11[1] = v13;
  v11[2] = v14;
  v11[3] = v15;
  return -[NUImageTransform3D initWithTransform3D:](v9, "initWithTransform3D:", v11);
}

- (id)straightenTransformWithAngle:(double)a3 extent:(id *)a4
{
  CGFloat v5;
  CGFloat v6;
  __int128 v7;
  NUImageTransformAffine *v8;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGAffineTransform v12;

  v5 = (double)a4->var1.var0 * 0.5 + (double)a4->var0.var0;
  v6 = (double)a4->var1.var1 * 0.5 + (double)a4->var0.var1;
  v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v12.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v12.c = v7;
  *(_OWORD *)&v12.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v11.a = *(_OWORD *)&v12.a;
  *(_OWORD *)&v11.c = v7;
  *(_OWORD *)&v11.tx = *(_OWORD *)&v12.tx;
  CGAffineTransformTranslate(&v12, &v11, v5, v6);
  v10 = v12;
  CGAffineTransformRotate(&v11, &v10, a3 * 3.14159265 / 180.0);
  v12 = v11;
  v10 = v11;
  CGAffineTransformTranslate(&v11, &v10, -v5, -v6);
  v12 = v11;
  v8 = [NUImageTransformAffine alloc];
  v11 = v12;
  return -[NUImageTransformAffine initWithAffineTransform:](v8, "initWithAffineTransform:", &v11);
}

- (int64_t)orientationFromAdjustmentIn:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("orientation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (id)orientedNode:(id)a3 withOrientation:(int64_t)a4
{
  id v5;
  NUUserOrientationNode *v6;

  v5 = a3;
  v6 = -[NUOrientationNode initWithOrientation:input:]([NUUserOrientationNode alloc], "initWithOrientation:input:", a4, v5);

  return v6;
}

- (id)livePhotoKeyFrameMetadataFromNode:(id)a3 time:(id *)a4 error:(id *)a5
{
  id v7;
  void *v8;
  __CFString *v9;
  NULivePhotoKeyFrameMetaDataNode *v10;
  NULivePhotoKeyFrameMetaDataNode *v11;
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
  CMTime time;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!a5)
  {
    NUAssertLogger_21569();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time.value) = 138543362;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v14;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&time, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_21569();
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
        LODWORD(time.value) = 138543618;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v20;
        LOWORD(time.flags) = 2114;
        *(_QWORD *)((char *)&time.flags + 2) = v24;
        _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&time, 0x16u);

      }
    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time.value) = 138543362;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v19;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&time, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineHelper livePhotoKeyFrameMetadataFromNode:time:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineHelper.m", 454, CFSTR("Invalid parameter not satisfying: %s"), v25, v26, v27, v28, (uint64_t)"error != nil");
  }
  v8 = v7;
  if ((a4->var2 & 1) != 0)
  {
    v11 = [NULivePhotoKeyFrameMetaDataNode alloc];
    time = (CMTime)*a4;
    v10 = -[NULivePhotoKeyFrameMetaDataNode initWithTime:input:](v11, "initWithTime:input:", &time, v8);
  }
  else
  {
    time = (CMTime)*a4;
    v9 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &time);
    +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("time is invalid"), v9);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    v10 = 0;
  }

  return v10;
}

- (id)switchFromNodes:(id)a3 mainInput:(id)a4 selector:(id)a5
{
  id v7;
  id v8;
  id v9;
  NUSwitchNode *v10;
  void *v11;
  NUSwitchNode *v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [NUSwitchNode alloc];
  +[NURenderPipelineFunction functionWithEvaluationBlock:](NURenderPipelineFunction, "functionWithEvaluationBlock:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[NUSwitchNode initWithInputs:mainInput:selector:](v10, "initWithInputs:mainInput:selector:", v9, v8, v11);
  return v12;
}

- (id)auxiliaryImageNode:(id)a3 type:(int64_t)a4
{
  id v5;
  NUAuxiliaryRenderNode *v6;

  v5 = a3;
  v6 = -[NUAuxiliaryRenderNode initWithInput:auxiliaryImageType:]([NUAuxiliaryRenderNode alloc], "initWithInput:auxiliaryImageType:", v5, a4);

  return v6;
}

- (id)gainMapNode:(id)a3 contentHeadroom:(double)a4 displayHeadroom:(double)a5
{
  id v7;
  NUHDRGainMapNode *v8;

  v7 = a3;
  v8 = -[NUHDRGainMapNode initWithInput:contentHeadroom:displayHeadroom:]([NUHDRGainMapNode alloc], "initWithInput:contentHeadroom:displayHeadroom:", v7, a4, a5);

  return v8;
}

- (id)gainMapHeadroomNode:(id)a3 headroomOffset:(double)a4
{
  id v5;
  NUHDRGainMapHeadroomNode *v6;
  void *v7;
  void *v8;
  NUHDRGainMapHeadroomNode *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = [NUHDRGainMapHeadroomNode alloc];
  v11 = CFSTR("headroomOffset");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NUHDRGainMapHeadroomNode initWithInput:settings:](v6, "initWithInput:settings:", v5, v8);

  return v9;
}

- (NURenderPipelineState)pipelineState
{
  return self->_pipelineState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineState, 0);
}

+ (id)lightMapFromGainMap:(id)a3 settings:(id)a4
{
  id v5;
  id v6;
  NUHDRGainMapMultiplyNode *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[NUHDRGainMapMultiplyNode initWithInput:settings:]([NUHDRGainMapMultiplyNode alloc], "initWithInput:settings:", v6, v5);

  return v7;
}

+ (id)gainMapFromLightMap:(id)a3 base:(id)a4 settings:(id)a5
{
  id v7;
  id v8;
  id v9;
  NUHDRGainMapDivideNode *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[NUHDRGainMapDivideNode initWithInput:lightMap:settings:]([NUHDRGainMapDivideNode alloc], "initWithInput:lightMap:settings:", v8, v9, v7);

  return v10;
}

+ (id)styleTransferNodeWithInput:(id)a3 target:(id)a4 settings:(id)a5
{
  id v7;
  id v8;
  id v9;
  NUStyleTransferNode *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[NUStyleTransferNode initWithInput:target:settings:]([NUStyleTransferNode alloc], "initWithInput:target:settings:", v9, v8, v7);

  return v10;
}

+ (id)styleTransferLearnNodeWithInput:(id)a3 target:(id)a4 settings:(id)a5
{
  id v7;
  id v8;
  id v9;
  NUStyleTransferLearnNode *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[NUStyleTransferNode initWithInput:target:settings:]([NUStyleTransferLearnNode alloc], "initWithInput:target:settings:", v9, v8, v7);

  return v10;
}

+ (id)styleTransferThumbnailNodeWithInput:(id)a3 settings:(id)a4
{
  id v5;
  id v6;
  NUStyleTransferThumbnailNode *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[NUStyleTransferThumbnailNode initWithInput:settings:]([NUStyleTransferThumbnailNode alloc], "initWithInput:settings:", v6, v5);

  return v7;
}

+ (id)styleTransferApplyNodeWithInput:(id)a3 thumbnail:(id)a4 target:(id)a5 settings:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NUStyleTransferApplyNode *v13;
  uint64_t v14;
  void *v15;

  v9 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = [NUStyleTransferApplyNode alloc];
  if (v9)
    v14 = -[NUStyleTransferApplyNode initWithInput:thumbnail:target:settings:](v13, "initWithInput:thumbnail:target:settings:", v12, v9, v11, v10);
  else
    v14 = -[NUStyleTransferNode initWithInput:target:settings:](v13, "initWithInput:target:settings:", v12, v11, v10);
  v15 = (void *)v14;

  return v15;
}

+ (id)styleTransferInterpolationNodeWithInputs:(id)a3 weights:(id)a4 settings:(id)a5
{
  id v7;
  id v8;
  id v9;
  NUStyleTransferInterpolationNode *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[NUStyleTransferInterpolationNode initWithInputs:weights:settings:]([NUStyleTransferInterpolationNode alloc], "initWithInputs:weights:settings:", v9, v8, v7);

  return v10;
}

@end
