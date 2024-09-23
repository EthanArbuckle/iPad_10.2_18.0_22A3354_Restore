@implementation NURenderNode

- (NURenderNode)init
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_12958);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_12958);
      goto LABEL_8;
    }
    if (v8 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_12958);
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
  _NUAssertFailHandler((uint64_t)"-[NURenderNode init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 85, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v22, v23, v24, v25, v21);
}

- (NURenderNode)initWithSettings:(id)a3 inputs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NURenderNode *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *nodeCreationJobName;
  uint64_t v14;
  NSDictionary *inputs;
  uint64_t v16;
  NSString *dominantInputKey;
  NSString *v18;
  uint64_t v19;
  NSDictionary *settings;
  void *v21;
  NSString *v22;
  uint64_t v23;
  NSDictionary *v24;
  void *v25;
  void *v26;
  NSString *v27;
  uint64_t v28;
  NSString *spaceMapKey;
  NSObject *v31;
  void *v32;
  void *specific;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  objc_super v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    NUAssertLogger_12944();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "settings != nil");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v65 = v32;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12944();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v35)
      {
        v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v46 = (void *)MEMORY[0x1E0CB3978];
        v47 = v45;
        objc_msgSend(v46, "callStackSymbols");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v65 = v45;
        v66 = 2114;
        v67 = v49;
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
      v65 = v37;
      _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 91, CFSTR("Invalid parameter not satisfying: %s"), v50, v51, v52, v53, (uint64_t)"settings != nil");
  }
  v8 = v7;
  if (!v7)
  {
    NUAssertLogger_12944();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "inputs != nil");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v65 = v39;
      _os_log_error_impl(&dword_1A6553000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12944();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
    if (v40)
    {
      if (v42)
      {
        v54 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v55 = (void *)MEMORY[0x1E0CB3978];
        v56 = v54;
        objc_msgSend(v55, "callStackSymbols");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "componentsJoinedByString:", CFSTR("\n"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v65 = v54;
        v66 = 2114;
        v67 = v58;
        _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v42)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v65 = v44;
      _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 92, CFSTR("Invalid parameter not satisfying: %s"), v59, v60, v61, v62, (uint64_t)"inputs != nil");
  }
  v63.receiver = self;
  v63.super_class = (Class)NURenderNode;
  v9 = -[NURenderNode init](&v63, sel_init);
  v9->_nodeCreationTime = NUAbsoluteTime();
  dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = objc_msgSend(v10, "copy");
    nodeCreationJobName = v9->_nodeCreationJobName;
    v9->_nodeCreationJobName = (NSString *)v12;
  }
  else
  {
    nodeCreationJobName = v9->_nodeCreationJobName;
    v9->_nodeCreationJobName = (NSString *)CFSTR("N/A");
  }

  v14 = objc_msgSend(v8, "copy");
  inputs = v9->_inputs;
  v9->_inputs = (NSDictionary *)v14;

  v9->_isGeometryNode = 0;
  v9->_hashValue = 0;
  objc_msgSend(v6, "objectForKey:", CFSTR("__dominantInputSettingsKey"));
  v16 = objc_claimAutoreleasedReturnValue();
  dominantInputKey = v9->_dominantInputKey;
  v9->_dominantInputKey = (NSString *)v16;

  if (v9->_dominantInputKey)
  {
    v18 = (NSString *)objc_msgSend(v6, "mutableCopy");
    -[NSString removeObjectForKey:](v18, "removeObjectForKey:", CFSTR("__dominantInputSettingsKey"));
    v19 = -[NSString copy](v18, "copy");
    settings = v9->_settings;
    v9->_settings = (NSDictionary *)v19;

    objc_msgSend(v8, "objectForKeyedSubscript:", v9->_dominantInputKey);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      v22 = v9->_dominantInputKey;
      v9->_dominantInputKey = 0;

    }
    goto LABEL_11;
  }
  v23 = objc_msgSend(v6, "copy");
  v24 = v9->_settings;
  v9->_settings = (NSDictionary *)v23;

  v25 = (void *)*MEMORY[0x1E0C9E1F8];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1F8]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v27 = v25;
    v18 = v9->_dominantInputKey;
    v9->_dominantInputKey = v27;
LABEL_11:

  }
  -[NURenderNode _generateSpaceMapKey](v9, "_generateSpaceMapKey");
  v28 = objc_claimAutoreleasedReturnValue();
  spaceMapKey = v9->_spaceMapKey;
  v9->_spaceMapKey = (NSString *)v28;

  return v9;
}

- (BOOL)isPlaceholderNode
{
  return 0;
}

- (id)_generateSpaceMapKey
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%p"), objc_opt_class(), self);
}

- (id)inputForKey:(id)a3
{
  return -[NSDictionary objectForKey:](self->_inputs, "objectForKey:", a3);
}

- (BOOL)hasCyclicalDependencyForInput:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToRenderNode:", self) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v4, "inputs", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v4, "inputForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[NURenderNode hasCyclicalDependencyForInput:](self, "hasCyclicalDependencyForInput:", v11);

          if (v12)
          {
            v5 = 1;
            goto LABEL_13;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }
    v5 = 0;
LABEL_13:

  }
  return v5;
}

- (void)resetInput:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSDictionary *v9;
  NSDictionary *inputs;
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
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v60 = a3;
  v6 = a4;
  if (!v60)
  {
    NUAssertLogger_12944();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "input != nil");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v62 = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12944();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v33 = (void *)MEMORY[0x1E0CB3978];
        v34 = v32;
        objc_msgSend(v33, "callStackSymbols");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v62 = v32;
        v63 = 2114;
        v64 = v36;
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
      v62 = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode resetInput:forKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 191, CFSTR("Invalid parameter not satisfying: %s"), v37, v38, v39, v40, (uint64_t)"input != nil");
  }
  if (!v6)
  {
    NUAssertLogger_12944();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "key != nil");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v62 = v19;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12944();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v22)
      {
        v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v42 = (void *)MEMORY[0x1E0CB3978];
        v43 = v41;
        objc_msgSend(v42, "callStackSymbols");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "componentsJoinedByString:", CFSTR("\n"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v62 = v41;
        v63 = 2114;
        v64 = v45;
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
      v62 = v24;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode resetInput:forKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 192, CFSTR("Invalid parameter not satisfying: %s"), v46, v47, v48, v49, (uint64_t)"key != nil");
  }
  if (-[NURenderNode isCached](self, "isCached"))
  {
    NUAssertLogger_12944();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot mutate a cached node!"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v62 = v26;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12944();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        v50 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v51 = (void *)MEMORY[0x1E0CB3978];
        v52 = v50;
        objc_msgSend(v51, "callStackSymbols");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "componentsJoinedByString:", CFSTR("\n"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v62 = v50;
        v63 = 2114;
        v64 = v54;
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
      v62 = v31;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode resetInput:forKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 193, CFSTR("Cannot mutate a cached node!"), v55, v56, v57, v58, v59);
  }
  -[NSDictionary objectForKeyedSubscript:](self->_inputs, "objectForKeyedSubscript:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v60)
  {
    v8 = (void *)-[NSDictionary mutableCopy](self->_inputs, "mutableCopy");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v60, v6);
    v9 = (NSDictionary *)objc_msgSend(v8, "copy");
    inputs = self->_inputs;
    self->_inputs = v9;

    self->_hashValue = 0;
  }

}

- (id)nodeByReplayingAgainstCache:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
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
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_12944();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "state != nil");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v14;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12944();
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
        v30 = v20;
        v31 = 2114;
        v32 = v24;
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
      v30 = v19;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode nodeByReplayingAgainstCache:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 220, CFSTR("Invalid parameter not satisfying: %s"), v25, v26, v27, v28, (uint64_t)"state != nil");
  }
  v7 = v6;
  +[NURenderNodeCache sharedInstance](NURenderNodeCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderNode nodeByReplayingAgainstCache:pipelineState:error:](self, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v7, a4);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (a4 && !v9 && !*a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing error %s:%d: failed to replay against cache"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 224);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError unknownError:object:](NUError, "unknownError:object:", v11, self);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSDictionary *obj;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v26 = a4;
  v9 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[NURenderNode inputs](self, "inputs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = self->_inputs;
  v12 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        -[NSDictionary objectForKey:](self->_inputs, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v8;
        objc_msgSend(v17, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v26, a5);
        v19 = objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          if (a5 && !*a5)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing error %s:%d: failed to replay against cache"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 237);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            +[NUError unknownError:object:](NUError, "unknownError:object:", v23, v17);
            *a5 = (id)objc_claimAutoreleasedReturnValue();

          }
          v22 = 0;
          v21 = v26;
          goto LABEL_14;
        }
        v20 = (void *)v19;
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, v16);

        v8 = v18;
      }
      v13 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v13)
        continue;
      break;
    }
  }

  v21 = v26;
  -[NURenderNode resolvedNodeWithCachedInputs:cache:pipelineState:error:](self, "resolvedNodeWithCachedInputs:cache:pipelineState:error:", v11, v8, v26, a5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v22;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_12958);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_12958);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_12958);
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
  _NUAssertFailHandler((uint64_t)"-[NURenderNode shouldCacheNodeForPipelineState:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 248, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v24, v25, v26, v27, v23);
}

- (id)resolvedNodeWithCachedInputs:(id)a3 cache:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!-[NURenderNode shouldCacheNodeForPipelineState:](self, "shouldCacheNodeForPipelineState:", v12))
  {
    -[NURenderNode placeholderNodeWithCachedInputs:](self, "placeholderNodeWithCachedInputs:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[NURenderNode evaluateSettings:pipelineState:error:](self, "evaluateSettings:pipelineState:error:", self->_settings, v12, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    if (!a6 || *a6)
      goto LABEL_14;
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = 258;
    goto LABEL_13;
  }
  -[NURenderNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](self, "resolvedNodeWithCachedInputs:settings:pipelineState:error:", v10, v13, v12, a6);
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    if (!a6 || *a6)
      goto LABEL_14;
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = 267;
LABEL_13:
    objc_msgSend(v17, "stringWithFormat:", CFSTR("missing error %s:%d: failed to evaluate settings"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError unknownError:object:](NUError, "unknownError:object:", v19, self);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_14:
    v16 = 0;
    goto LABEL_15;
  }
  v15 = (void *)v14;

LABEL_6:
  +[NURenderNode nodeFromCache:cache:](NURenderNode, "nodeFromCache:cache:", v15, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setEvaluatedForMode:", objc_msgSend(v12, "evaluationMode"));
LABEL_15:

  return v16;
}

- (id)evaluateSettings:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a3, "nu_evaluateWithPipelineState:error:", a4, a5);
}

- (id)placeholderNodeWithCachedInputs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NUPlaceholderNode *v16;
  NUPlaceholderNode *v17;
  NUPlaceholderNode *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v5);
          objc_msgSend(v5, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), (_QWORD)v20);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v11, "isPlaceholderNode")
            || (objc_msgSend(v11, "inputs"),
                v12 = (void *)objc_claimAutoreleasedReturnValue(),
                v13 = objc_msgSend(v12, "count"),
                v12,
                v13))
          {
            objc_msgSend(v11, "spaceMapKey");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v14);

            v15 = v11;
            v8 = v15;
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
    }

    if (objc_msgSend(v4, "count") == 1)
      v18 = v8;
    else
      v18 = -[NUPlaceholderNode initWithInputs:]([NUPlaceholderNode alloc], "initWithInputs:", v4);
    v17 = v18;

  }
  else
  {
    v16 = [NUPlaceholderNode alloc];
    v17 = -[NUPlaceholderNode initWithInputs:](v16, "initWithInputs:", MEMORY[0x1E0C9AA70]);
  }

  return v17;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v8 = a4;
  v9 = a3;
  v10 = objc_alloc((Class)objc_opt_class());
  v11 = objc_msgSend(v9, "copy");

  v12 = (void *)*((_QWORD *)v10 + 3);
  *((_QWORD *)v10 + 3) = v11;

  v13 = objc_msgSend(v8, "copy");
  v14 = (void *)*((_QWORD *)v10 + 4);
  *((_QWORD *)v10 + 4) = v13;

  objc_storeStrong((id *)v10 + 16, self->_dominantInputKey);
  objc_msgSend(v10, "_generateSpaceMapKey");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)*((_QWORD *)v10 + 17);
  *((_QWORD *)v10 + 17) = v15;

  *((_QWORD *)v10 + 18) = *(_QWORD *)&self->_nodeCreationTime;
  objc_storeStrong((id *)v10 + 19, self->_nodeCreationJobName);
  *((_QWORD *)v10 + 20) = self->_cacheHitsCount;
  return v10;
}

- (void)setEvaluatedForMode:(int64_t)a3
{
  NURenderNode *v4;
  uint64_t v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  __CFString *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  v5 = -[NURenderNode _evaluatedForMode](v4, "_evaluatedForMode");
  if (a3)
  {
    v6 = v5;
    if (v5 != a3)
    {
      if (v5)
      {
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_12958);
        v7 = (id)_NUAssertLogger;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = (void *)MEMORY[0x1E0CB3940];
          if (v6 > 3)
            v9 = CFSTR("Prepare");
          else
            v9 = off_1E5060A80[v6 - 1];
          v10 = v9;
          if ((unint64_t)(a3 - 1) > 2)
            v11 = CFSTR("Prepare");
          else
            v11 = off_1E5060A80[a3 - 1];
          v12 = v11;
          objc_msgSend(v8, "stringWithFormat:", CFSTR("Node is already evaluated for %@ -> %@\n%@"), v10, v12, v4);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v29 = v13;
          _os_log_impl(&dword_1A6553000, v7, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

        }
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (_NULogOnceToken != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_12958);
          v14 = (id)_NUAssertLogger;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v29 = v15;
            v30 = 2114;
            v31 = v17;
            _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

          }
        }
        else
        {
          if (_NULogOnceToken != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_12958);
          v14 = (id)_NUAssertLogger;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v29 = v26;
            _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

          }
        }

        if (v6 > 3)
          v18 = CFSTR("Prepare");
        else
          v18 = off_1E5060A80[v6 - 1];
        v19 = v18;
        if ((unint64_t)(a3 - 1) > 2)
          v20 = CFSTR("Prepare");
        else
          v20 = off_1E5060A80[a3 - 1];
        v27 = v20;
        _NUAssertContinueHandler((uint64_t)"-[NURenderNode setEvaluatedForMode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 353, CFSTR("Node is already evaluated for %@ -> %@\n%@"), v21, v22, v23, v24, (uint64_t)v19);

      }
      -[NURenderNode set_evaluatedForMode:](v4, "set_evaluatedForMode:", a3);
    }
  }
  objc_sync_exit(v4);

}

- (id)evaluateRenderDependenciesWithRequest:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  NSDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
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
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!-[NURenderNode evaluatedForMode](self, "evaluatedForMode"))
  {
    NUAssertLogger_12944();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Node hasn't been evaluated for render"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v20;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12944();
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
        *(_DWORD *)buf = 138543618;
        v42 = v26;
        v43 = 2114;
        v44 = v30;
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
      v42 = v25;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode evaluateRenderDependenciesWithRequest:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 363, CFSTR("Node hasn't been evaluated for render"), v31, v32, v33, v34, v35);
  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v8 = self->_inputs;
  v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v37;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v37 != v11)
          objc_enumerationMutation(v8);
        -[NURenderNode inputForKey:](self, "inputForKey:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "evaluateRenderDependenciesWithRequest:error:", v6, a4);
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          if (a4 && !*a4)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing error %s:%d: unable to evaluate dependencies"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 373, (_QWORD)v36);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            +[NUError unknownError:object:](NUError, "unknownError:object:", v17, v13);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
          v16 = 0;
          goto LABEL_15;
        }
        v15 = (void *)v14;
        objc_msgSend(v7, "addEntriesFromDictionary:", v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v10)
        continue;
      break;
    }
  }

  v16 = v7;
LABEL_15:

  return v16;
}

- (id)outputVideo:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;

  if (-[NURenderNode isCached](self, "isCached"))
  {
    -[NURenderNode cached_outputVideo](self, "cached_outputVideo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[NURenderNode _evaluateVideo:](self, "_evaluateVideo:", a3);
      v6 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v6;
      if (a3 && !v6 && !*a3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing error %s:%d: unable to get video"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 393);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[NUError unknownError:object:](NUError, "unknownError:object:", v7, self);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      -[NURenderNode setCached_outputVideo:](self, "setCached_outputVideo:", v5);
    }
  }
  else
  {
    -[NURenderNode _evaluateVideo:](self, "_evaluateVideo:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_evaluateVideo:(id *)a3
{
  NSDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  NSDictionary *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
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
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _OWORD v44[4];
  _BYTE v45[128];
  _BYTE v46[128];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_12944();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v25;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12944();
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
        v48 = v31;
        v49 = 2114;
        v50 = v35;
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
      v48 = v30;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode _evaluateVideo:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 406, CFSTR("Invalid parameter not satisfying: %s"), v36, v37, v38, v39, (uint64_t)"error != nil");
  }
  if (!-[NSDictionary count](self->_inputs, "count"))
  {
    v9 = CFSTR("Cannot generate an AVComposition. no inputs.");
    v10 = 9;
LABEL_26:
    +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", v10, v9, self);
    v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  if (-[NSDictionary count](self->_inputs, "count") == 1)
  {
    memset(v44, 0, sizeof(v44));
    v5 = self->_inputs;
    if (-[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", v44, v46, 16))
    {
      -[NSDictionary objectForKey:](self->_inputs, "objectForKey:", **((_QWORD **)&v44[0] + 1));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "outputVideo:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7 && !*a3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing error %s:%d: unable to get video"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 425);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[NUError unknownError:object:](NUError, "unknownError:object:", v8, v6);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      return v7;
    }

  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v11 = self->_inputs;
  v12 = -[NSDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (!v12)
  {

LABEL_25:
    v9 = CFSTR("[NURenderNode _evaluateVideo] expected outputAsset to be set.");
    v10 = 1;
    goto LABEL_26;
  }
  v13 = v12;
  v7 = 0;
  v14 = *(_QWORD *)v41;
  while (2)
  {
    v15 = 0;
    v16 = v7;
    do
    {
      if (*(_QWORD *)v41 != v14)
        objc_enumerationMutation(v11);
      v17 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v15);
      -[NSDictionary objectForKey:](self->_inputs, "objectForKey:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "outputVideo:", a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Cannot get AV composition for input node"), v18, *a3);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        *a3 = v21;
        if (!v21)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing error %s:%d: unable to get video from %@"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 441, v17);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[NUError unknownError:object:](NUError, "unknownError:object:", v22, v18);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

        }
        return 0;
      }
      v20 = v19;
      v7 = (void *)objc_msgSend(v19, "copy");

      ++v15;
      v16 = v7;
    }
    while (v13 != v15);
    v13 = -[NSDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v13)
      continue;
    break;
  }

  if (!v7)
    goto LABEL_25;
  return v7;
}

- (BOOL)requiresVideoComposition
{
  NSDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_inputs;
  v4 = -[NSDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        -[NSDictionary objectForKey:](self->_inputs, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "requiresVideoComposition");

        if ((v9 & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)outputVideoComposition:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;

  if (-[NURenderNode isCached](self, "isCached"))
  {
    -[NURenderNode cached_outputVideoComposition](self, "cached_outputVideoComposition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[NURenderNode _evaluateVideoComposition:](self, "_evaluateVideoComposition:", a3);
      v6 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v6;
      if (a3 && !v6 && !*a3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing error %s:%d: unable to evaluate video composition"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 480);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[NUError unknownError:object:](NUError, "unknownError:object:", v7, self);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      -[NURenderNode setCached_outputVideoComposition:](self, "setCached_outputVideoComposition:", v5);
    }
  }
  else
  {
    -[NURenderNode _evaluateVideoComposition:](self, "_evaluateVideoComposition:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_evaluateVideoComposition:(id *)a3
{
  id *v3;
  NURenderNode *v4;
  NSDictionary *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  _OWORD *v12;
  CMTimeFlags v13;
  CMTimeEpoch v14;
  void *v15;
  NSDictionary *v16;
  CMTimeEpoch v17;
  char v18;
  uint64_t v19;
  void *v20;
  void *v21;
  CMTimeFlags flags;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  uint64_t v52;
  void *v53;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  uint64_t v59;
  BOOL v60;
  NSObject *v61;
  _BOOL4 v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  NSObject *v75;
  void *v76;
  void *specific;
  NSObject *v78;
  _BOOL4 v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  id *v99;
  uint64_t v100;
  NURenderNode *v101;
  CMTimeEpoch v102;
  uint64_t v103;
  NSDictionary *v104;
  void *v105;
  uint64_t v106;
  id obj;
  uint64_t v108;
  CMTimeFlags v109;
  uint64_t v110;
  void *v111;
  void *v112;
  CMTimeEpoch epoch;
  CMTimeValue v114;
  CMTimeScale v115;
  CMTimeFlags v116;
  CMTimeEpoch v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  CMTimeRange otherRange;
  CMTimeRange range;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  CMTime time1;
  CMTime time2;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  _QWORD v146[8];
  _BYTE v147[128];
  _BYTE v148[128];
  CMTimeRange v149;
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  CMTimeValue value;
  CMTimeScale timescale;
  char v156[128];
  uint64_t v157;

  v157 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_12944();
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v149.start.value) = 138543362;
      *(CMTimeValue *)((char *)&v149.start.value + 4) = (CMTimeValue)v76;
      _os_log_error_impl(&dword_1A6553000, v75, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v149, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12944();
    v78 = objc_claimAutoreleasedReturnValue();
    v79 = os_log_type_enabled(v78, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v79)
      {
        v82 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v83 = (void *)MEMORY[0x1E0CB3978];
        v84 = v82;
        objc_msgSend(v83, "callStackSymbols");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "componentsJoinedByString:", CFSTR("\n"));
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v149.start.value) = 138543618;
        *(CMTimeValue *)((char *)&v149.start.value + 4) = (CMTimeValue)v82;
        LOWORD(v149.start.flags) = 2114;
        *(_QWORD *)((char *)&v149.start.flags + 2) = v86;
        _os_log_error_impl(&dword_1A6553000, v78, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v149, 0x16u);

      }
    }
    else if (v79)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "componentsJoinedByString:", CFSTR("\n"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v149.start.value) = 138543362;
      *(CMTimeValue *)((char *)&v149.start.value + 4) = (CMTimeValue)v81;
      _os_log_error_impl(&dword_1A6553000, v78, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v149, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode _evaluateVideoComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 493, CFSTR("Invalid parameter not satisfying: %s"), v87, v88, v89, v90, (uint64_t)"error != nil");
  }
  v3 = a3;
  v4 = self;
  if (!-[NSDictionary count](self->_inputs, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("This type of source node (%@) cannot generate an AVVideoComposition"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 9, v9, v4);
    *v3 = (id)objc_claimAutoreleasedReturnValue();

    v7 = 0;
    return v7;
  }
  if (-[NSDictionary count](v4->_inputs, "count") == 1)
  {
    memset(v146, 0, sizeof(v146));
    v5 = v4->_inputs;
    if (-[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", v146, v156, 16))
    {
      -[NSDictionary objectForKey:](v4->_inputs, "objectForKey:", *(_QWORD *)v146[1]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "outputVideoComposition:", v3);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (!v7 && !*v3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing error %s:%d: unable to evaluate video composition"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 513);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[NUError unknownError:object:](NUError, "unknownError:object:", v8, v6);
        *v3 = (id)objc_claimAutoreleasedReturnValue();

      }
      return v7;
    }

  }
  v11 = *MEMORY[0x1E0C9D820];
  v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v12 = (_OWORD *)MEMORY[0x1E0CA2E68];
  value = *MEMORY[0x1E0CA2E68];
  v13 = *(_DWORD *)(MEMORY[0x1E0CA2E68] + 12);
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E68] + 8);
  v14 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v15 = (void *)objc_opt_new();
  v142 = 0u;
  v143 = 0u;
  v144 = 0u;
  v145 = 0u;
  v16 = v4->_inputs;
  v106 = -[NSDictionary countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v142, v153, 16);
  v102 = v14;
  if (!v106)
  {
    epoch = v14;
    goto LABEL_80;
  }
  v108 = *(_QWORD *)v143;
  v17 = v14;
  v18 = 1;
  epoch = v17;
  v101 = v4;
  v104 = v16;
  do
  {
    v19 = 0;
    do
    {
      if (*(_QWORD *)v143 != v108)
        objc_enumerationMutation(v16);
      v110 = v19;
      -[NSDictionary objectForKey:](v4->_inputs, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * v19));
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "outputVideoComposition:", v3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        if (*v3)
        {
          v21 = 0;
LABEL_77:
          v53 = v111;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing error %s:%d: unable to evaluate video composition"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 533);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v111;
          +[NUError unknownError:object:](NUError, "unknownError:object:", v74, v111);
          *v3 = (id)objc_claimAutoreleasedReturnValue();

          v21 = 0;
        }

        v7 = 0;
        goto LABEL_84;
      }
      v21 = v20;
      objc_msgSend(v20, "frameDuration");
      time1.value = value;
      time1.timescale = timescale;
      time1.flags = v13;
      time1.epoch = epoch;
      CMTimeMaximum(&v149.start, &time1, &time2);
      value = v149.start.value;
      flags = v149.start.flags;
      timescale = v149.start.timescale;
      epoch = v149.start.epoch;
      objc_msgSend(v21, "renderSize");
      v25 = v23;
      v26 = v24;
      v109 = flags;
      if ((v18 & 1) == 0)
      {
        if (v23 != v11 || v24 != v10)
        {
          +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 5, CFSTR("Mixed resolutions not currently supported"), 0);
          *v3 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_77;
        }
        v134 = 0u;
        v135 = 0u;
        v132 = 0u;
        v133 = 0u;
        objc_msgSend(v21, "instructions");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v132, v151, 16);
        if (!v97)
          goto LABEL_73;
        v34 = *(_QWORD *)v133;
        v93 = *(_QWORD *)v133;
LABEL_34:
        v35 = 0;
        v36 = 0uLL;
        while (1)
        {
          if (*(_QWORD *)v133 != v34)
          {
            v37 = v35;
            objc_enumerationMutation(v27);
            v35 = v37;
            v36 = 0uLL;
          }
          v100 = v35;
          v112 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * v35);
          v128 = v36;
          v129 = v36;
          v130 = v36;
          v131 = v36;
          obj = v15;
          v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, v150, 16);
          if (v96)
            break;
LABEL_69:

          v35 = v100 + 1;
          v36 = 0uLL;
          v34 = v93;
          if (v100 + 1 == v97)
          {
            v97 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v132, v151, 16, 0.0);
            if (!v97)
              goto LABEL_73;
            goto LABEL_34;
          }
        }
        v103 = *(_QWORD *)v129;
        while (2)
        {
          v38 = 0;
LABEL_40:
          if (*(_QWORD *)v129 != v103)
          {
            v39 = v38;
            objc_enumerationMutation(obj);
            v38 = v39;
          }
          v95 = v38;
          v40 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * v38);
          if ((objc_msgSend(v40, "isEqual:", v112) & 1) != 0)
            goto LABEL_69;
          v41 = 0uLL;
          memset(&v149, 0, sizeof(v149));
          if (v112)
          {
            objc_msgSend(v112, "timeRange");
            v41 = 0uLL;
            if (v40)
              goto LABEL_45;
LABEL_47:
            *(_OWORD *)&otherRange.start.epoch = v41;
            *(_OWORD *)&otherRange.duration.timescale = v41;
            *(_OWORD *)&otherRange.start.value = v41;
          }
          else
          {
            memset(&range, 0, sizeof(range));
            if (!v40)
              goto LABEL_47;
LABEL_45:
            objc_msgSend(v40, "timeRange", *(double *)&v41);
          }
          CMTimeRangeGetIntersection(&v149, &range, &otherRange);
          if ((v149.start.flags & 1) == 0
            || (v149.duration.flags & 1) == 0
            || v149.duration.epoch
            || v149.duration.value < 0)
          {
            goto LABEL_69;
          }
          objc_msgSend(v112, "requiredSourceTrackIDs");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "requiredSourceTrackIDs");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v122 = 0u;
          v123 = 0u;
          v124 = 0u;
          v125 = 0u;
          v43 = v42;
          v94 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v122, v148, 16);
          if (v94)
          {
            v44 = *(_QWORD *)v123;
            v98 = v43;
            v99 = v3;
            v92 = *(_QWORD *)v123;
            do
            {
              v45 = 0;
              do
              {
                if (*(_QWORD *)v123 != v44)
                  objc_enumerationMutation(v43);
                v46 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * v45);
                v118 = 0u;
                v119 = 0u;
                v120 = 0u;
                v121 = 0u;
                v47 = v105;
                v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v118, v147, 16);
                if (v48)
                {
                  v49 = v48;
                  v50 = *(_QWORD *)v119;
                  while (2)
                  {
                    for (i = 0; i != v49; ++i)
                    {
                      if (*(_QWORD *)v119 != v50)
                        objc_enumerationMutation(v47);
                      if ((objc_msgSend(v46, "isEqual:", *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * i)) & 1) != 0)
                      {
                        +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 5, CFSTR("time ranges for tracks cannot overlap"), v46);
                        *v99 = (id)objc_claimAutoreleasedReturnValue();

                        v16 = v104;
                        goto LABEL_77;
                      }
                    }
                    v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v118, v147, 16);
                    if (v49)
                      continue;
                    break;
                  }
                }

                ++v45;
                v43 = v98;
                v3 = v99;
                v4 = v101;
                v16 = v104;
                v44 = v92;
              }
              while (v45 != v94);
              v94 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v122, v148, 16);
            }
            while (v94);
          }

          v38 = v95 + 1;
          if (v95 + 1 == v96)
          {
            v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, v150, 16);
            if (v96)
              continue;
            goto LABEL_69;
          }
          goto LABEL_40;
        }
      }
      v138 = 0u;
      v139 = 0u;
      v136 = 0u;
      v137 = 0u;
      objc_msgSend(v21, "instructions");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v136, v152, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v137;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v137 != v30)
              objc_enumerationMutation(v27);
            v32 = *(_QWORD *)(*((_QWORD *)&v136 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (_NULogOnceToken != -1)
                dispatch_once(&_NULogOnceToken, &__block_literal_global_12958);
              v55 = (void *)_NUAssertLogger;
              if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
              {
                v56 = (void *)MEMORY[0x1E0CB3940];
                v57 = v55;
                objc_msgSend(v56, "stringWithFormat:", CFSTR("incorrect class of video instruction"));
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v149.start.value) = 138543362;
                *(CMTimeValue *)((char *)&v149.start.value + 4) = (CMTimeValue)v58;
                _os_log_error_impl(&dword_1A6553000, v57, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v149, 0xCu);

                v59 = _NULogOnceToken;
                v60 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey) == 0;
                if (v59 != -1)
                  dispatch_once(&_NULogOnceToken, &__block_literal_global_12958);
              }
              else
              {
                v60 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey) == 0;
              }
              v61 = (id)_NUAssertLogger;
              v62 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);
              if (v60)
              {
                if (v62)
                {
                  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v63, "componentsJoinedByString:", CFSTR("\n"));
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(v149.start.value) = 138543362;
                  *(CMTimeValue *)((char *)&v149.start.value + 4) = (CMTimeValue)v64;
                  _os_log_error_impl(&dword_1A6553000, v61, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v149, 0xCu);

                }
              }
              else if (v62)
              {
                v65 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
                v66 = (void *)MEMORY[0x1E0CB3978];
                v67 = v65;
                objc_msgSend(v66, "callStackSymbols");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "componentsJoinedByString:", CFSTR("\n"));
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v149.start.value) = 138543618;
                *(CMTimeValue *)((char *)&v149.start.value + 4) = (CMTimeValue)v65;
                LOWORD(v149.start.flags) = 2114;
                *(_QWORD *)((char *)&v149.start.flags + 2) = v69;
                _os_log_error_impl(&dword_1A6553000, v61, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v149, 0x16u);

              }
              _NUAssertFailHandler((uint64_t)"-[NURenderNode _evaluateVideoComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 552, CFSTR("incorrect class of video instruction"), v70, v71, v72, v73, v91);
            }
            objc_msgSend(v15, "addObject:", v32);
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v136, v152, 16);
        }
        while (v29);
        v10 = v26;
        v11 = v25;
        v4 = v101;
        v16 = v104;
      }
      else
      {
        v10 = v26;
        v11 = v25;
      }
LABEL_73:

      v18 = 0;
      v19 = v110 + 1;
      v13 = v109;
    }
    while (v110 + 1 != v106);
    v52 = -[NSDictionary countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v142, v153, 16);
    v18 = 0;
    v12 = (_OWORD *)MEMORY[0x1E0CA2E68];
    v106 = v52;
  }
  while (v52);
LABEL_80:

  if ((v13 & 1) != 0
    && (v149.start.value = value,
        v149.start.timescale = timescale,
        v149.start.flags = v13,
        v149.start.epoch = epoch,
        *(_OWORD *)&time1.value = *v12,
        time1.epoch = v102,
        CMTimeCompare(&v149.start, &time1) > 0))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C8B288]);
    objc_msgSend(v7, "setRenderSize:", v11, v10);
    v114 = value;
    v115 = timescale;
    v116 = v13;
    v117 = epoch;
    objc_msgSend(v7, "setFrameDuration:", &v114);
    objc_msgSend(v7, "setInstructions:", v15);
  }
  else
  {
    +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("Invalid frame duration for render node"), v4);
    v7 = 0;
    *v3 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_84:

  return v7;
}

- (BOOL)requiresAudioMix
{
  NSDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_inputs;
  v4 = -[NSDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        -[NSDictionary objectForKey:](self->_inputs, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "requiresAudioMix");

        if ((v9 & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)outputAudioMix:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;

  if (-[NURenderNode isCached](self, "isCached"))
  {
    -[NURenderNode cached_outputAudioMix](self, "cached_outputAudioMix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[NURenderNode _evaluateAudioMix:](self, "_evaluateAudioMix:", a3);
      v6 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v6;
      if (a3 && !v6 && !*a3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing error %s:%d: unable to evaluate audio mix"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 647);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[NUError unknownError:object:](NUError, "unknownError:object:", v7, self);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      -[NURenderNode setCached_outputAudioMix:](self, "setCached_outputAudioMix:", v5);
    }
  }
  else
  {
    -[NURenderNode _evaluateAudioMix:](self, "_evaluateAudioMix:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_evaluateAudioMix:(id *)a3
{
  NSDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  _OWORD v27[4];
  _BYTE v28[128];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_12944();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12944();
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
        v30 = v18;
        v31 = 2114;
        v32 = v22;
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
      v30 = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode _evaluateAudioMix:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 660, CFSTR("Invalid parameter not satisfying: %s"), v23, v24, v25, v26, (uint64_t)"error != NULL");
  }
  if (self->_dominantInputKey)
  {
    -[NSDictionary objectForKey:](self->_inputs, "objectForKey:");
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary outputAudioMix:](v5, "outputAudioMix:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6 && !*a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing error %s:%d: unable to evaluate audio mix"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 667);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError unknownError:object:](NUError, "unknownError:object:", v7, v5);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    memset(v27, 0, sizeof(v27));
    v5 = self->_inputs;
    if (!-[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", v27, v28, 16))
    {

      +[NUError unsupportedError:object:](NUError, "unsupportedError:object:", CFSTR("cannot generate audio mix"), objc_opt_class());
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
    -[NSDictionary objectForKey:](self->_inputs, "objectForKey:", **((_QWORD **)&v27[0] + 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "outputAudioMix:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6 && !*a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing error %s:%d: unable to evaluate audio mix"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 679, *(_QWORD *)&v27[0]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError unknownError:object:](NUError, "unknownError:object:", v9, v8);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v6;
}

- (BOOL)shouldInvalidateCachedAudioMix
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSDictionary allValues](self->_inputs, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "shouldInvalidateCachedAudioMix") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)invalidateCachedAudioMix
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[NURenderNode setCached_outputAudioMix:](self, "setCached_outputAudioMix:", 0);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[NSDictionary allValues](self->_inputs, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "invalidateCachedAudioMix");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)outputImage:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;

  if (-[NURenderNode isCached](self, "isCached"))
  {
    -[NURenderNode cached_outputImage](self, "cached_outputImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[NURenderNode _evaluateImage:](self, "_evaluateImage:", a3);
      v6 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v6;
      if (a3 && !v6 && !*a3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing error %s:%d: unable to evaluate output image"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 719);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[NUError unknownError:object:](NUError, "unknownError:object:", v7, self);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      -[NURenderNode setCached_outputImage:](self, "setCached_outputImage:", v5);
    }
  }
  else
  {
    -[NURenderNode _evaluateImage:](self, "_evaluateImage:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)outputTimedMetadataSampleWithIdentifier:(id)a3 atTime:(id *)a4 error:(id *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  v6 = *a4;
  -[NURenderNode _evaluateTimedMetadataSampleWithIdentifier:atTime:error:](self, "_evaluateTimedMetadataSampleWithIdentifier:atTime:error:", a3, &v6, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_evaluateTimedMetadataSampleWithIdentifier:(id)a3 atTime:(id *)a4 error:(id *)a5
{
  id v8;
  NSDictionary *inputs;
  void *v10;
  void *v11;
  NSDictionary *v12;
  void *v13;
  void *v14;
  void *v16;
  __int128 v17;
  int64_t var3;

  v8 = a3;
  inputs = self->_inputs;
  if (self->_dominantInputKey)
  {
    -[NSDictionary objectForKey:](inputs, "objectForKey:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v17 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
LABEL_5:
    objc_msgSend(v10, "_evaluateTimedMetadataSampleWithIdentifier:atTime:error:", v8, &v17, a5);
    a5 = (id *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if (-[NSDictionary count](inputs, "count") == 1)
  {
    v12 = self->_inputs;
    -[NSDictionary allKeys](v12, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v10 = v11;
    goto LABEL_5;
  }
  if (a5)
  {
    if (!*a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing error %s:%d: unable to evaluate timed metadata sample with multiple, or zero, inputs"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 747);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError unknownError:object:](NUError, "unknownError:object:", v16, self);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    a5 = 0;
  }
LABEL_6:

  return a5;
}

- (id)debugQuickLookObject
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[NURenderNode cached_outputImage](self, "cached_outputImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    if (self->_dominantInputKey)
    {
      -[NSDictionary objectForKey:](self->_inputs, "objectForKey:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "debugQuickLookObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0C9DDC8], "emptyImage");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
LABEL_6:

  return v6;
}

- (id)_evaluateImage:(id *)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *specific;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  objc_class *v21;
  uint64_t v22;
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
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_12958);
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v8;
    _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v9 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v9 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_12958);
      goto LABEL_8;
    }
    if (v9 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_12958);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v10 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v11 = (void *)MEMORY[0x1E0CB3978];
    v12 = v10;
    objc_msgSend(v11, "callStackSymbols");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v14;
    _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v15 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v17 = (void *)MEMORY[0x1E0CB3978];
  v18 = specific;
  v12 = v15;
  objc_msgSend(v17, "callStackSymbols");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v28 = specific;
  v29 = 2114;
  v30 = v20;
  _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v21 = (objc_class *)objc_opt_class();
  NSStringFromClass(v21);
  v22 = objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NURenderNode _evaluateImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 767, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v23, v24, v25, v26, v22);
}

- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3
{
  NSDictionary *v5;
  char v6;
  void *v7;
  _OWORD v9[4];
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_dominantInputKey)
  {
    -[NSDictionary objectForKey:](self->_inputs, "objectForKey:");
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = -[NSDictionary canPropagateOriginalAuxiliaryData:](v5, "canPropagateOriginalAuxiliaryData:", a3);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v5 = self->_inputs;
    if (-[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", v9, v10, 16))
    {
      -[NSDictionary objectForKey:](self->_inputs, "objectForKey:", **((_QWORD **)&v9[0] + 1), *(_QWORD *)&v9[0]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "canPropagateOriginalAuxiliaryData:", a3);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)canPropagateOriginalLivePhotoMetadataTrack
{
  NSDictionary *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_dominantInputKey)
  {
    -[NSDictionary objectForKey:](self->_inputs, "objectForKey:");
    v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v4 = -[NSDictionary canPropagateOriginalLivePhotoMetadataTrack](v3, "canPropagateOriginalLivePhotoMetadataTrack");
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = self->_inputs;
    v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v3);
          -[NSDictionary objectForKey:](self->_inputs, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "canPropagateOriginalLivePhotoMetadataTrack");

          if (!v10)
          {
            v4 = 0;
            goto LABEL_13;
          }
        }
        v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }
    v4 = 1;
  }
LABEL_13:

  return v4;
}

- (id)originalAuxiliaryImageForType:(int64_t)a3 error:(id *)a4
{
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  if (-[NURenderNode isCached](self, "isCached"))
  {
    if ((unint64_t)a3 > 0xC)
      v7 = CFSTR("Invalid");
    else
      v7 = off_1E5060F88[a3];
    v9 = v7;
    -[NURenderNode cached_auxiliaryImages](self, "cached_auxiliaryImages");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[NURenderNode _evaluateAuxiliaryImageForType:error:](self, "_evaluateAuxiliaryImageForType:error:", a3, a4);
      v11 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v11;
      if (a4 && !v11 && !*a4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing error %s:%d: unable to evaluate portrait effects matte"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 812);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[NUError unknownError:object:](NUError, "unknownError:object:", v12, self);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      -[NURenderNode cached_auxiliaryImages](self, "cached_auxiliaryImages");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, v9);

    }
  }
  else
  {
    -[NURenderNode _evaluateAuxiliaryImageForType:error:](self, "_evaluateAuxiliaryImageForType:error:", a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)_evaluateAuxiliaryImageForType:(int64_t)a3 error:(id *)a4
{
  NSDictionary *v7;
  void *v8;
  void *v9;
  void *v10;
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
  _OWORD v29[4];
  _BYTE v30[128];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    NUAssertLogger_12944();
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
    NUAssertLogger_12944();
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
    _NUAssertFailHandler((uint64_t)"-[NURenderNode _evaluateAuxiliaryImageForType:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 824, CFSTR("Invalid parameter not satisfying: %s"), v25, v26, v27, v28, (uint64_t)"error != NULL");
  }
  if (self->_dominantInputKey)
  {
    -[NSDictionary objectForKey:](self->_inputs, "objectForKey:");
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary originalAuxiliaryImageForType:error:](v7, "originalAuxiliaryImageForType:error:", a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8 && !*a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing error %s:%d: unable to evaluate auxiliary image"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 830);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError unknownError:object:](NUError, "unknownError:object:", v9, v7);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    memset(v29, 0, sizeof(v29));
    v7 = self->_inputs;
    if (!-[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", v29, v30, 16))
    {

      +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("unable to resolve evaluate auxiliary image"), self);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
    -[NSDictionary objectForKey:](self->_inputs, "objectForKey:", **((_QWORD **)&v29[0] + 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "originalAuxiliaryImageForType:error:", a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8 && !*a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing error %s:%d: unable to evaluate evaluate auxiliary image"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 841, *(_QWORD *)&v29[0]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError unknownError:object:](NUError, "unknownError:object:", v11, v10);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v8;
}

- (id)outputGeometrySpaceMap:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;

  if (-[NURenderNode isCached](self, "isCached"))
  {
    -[NURenderNode cached_geometrySpaceMap](self, "cached_geometrySpaceMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[NURenderNode _evaluateGeometrySpaceMap:](self, "_evaluateGeometrySpaceMap:", a3);
      v6 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v6;
      if (a3 && !v6 && !*a3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing error %s:%d: unable to evaluate geometry space map"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 859);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[NUError unknownError:object:](NUError, "unknownError:object:", v7, self);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      -[NURenderNode setCached_geometrySpaceMap:](self, "setCached_geometrySpaceMap:", v5);
    }
  }
  else
  {
    -[NURenderNode _evaluateGeometrySpaceMap:](self, "_evaluateGeometrySpaceMap:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)uniqueInputNode
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__13002;
  v13 = __Block_byref_object_dispose__13003;
  v14 = 0;
  -[NURenderNode inputs](self, "inputs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    -[NURenderNode inputs](self, "inputs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __31__NURenderNode_uniqueInputNode__block_invoke;
    v8[3] = &unk_1E5063D28;
    v8[4] = &v9;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)geometryNode
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *specific;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[12];
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[NURenderNode isGeometryNode](self, "isGeometryNode"))
    return self;
  -[NURenderNode uniqueInputNode](self, "uniqueInputNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    NUAssertLogger_12944();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GeometryNode :: Nodes with 0 or 2 or more inputs must be geometry nodes"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v23 = 138543362;
      *(_QWORD *)&v23[4] = v8;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v23, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12944();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v15 = (void *)MEMORY[0x1E0CB3978];
        v16 = v14;
        objc_msgSend(v15, "callStackSymbols");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v23 = 138543618;
        *(_QWORD *)&v23[4] = v14;
        v24 = 2114;
        v25 = v18;
        _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v23, 0x16u);

      }
    }
    else if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v23 = 138543362;
      *(_QWORD *)&v23[4] = v13;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v23, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode geometryNode]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 891, CFSTR("GeometryNode :: Nodes with 0 or 2 or more inputs must be geometry nodes"), v19, v20, v21, v22, *(uint64_t *)v23);
  }
  v5 = v4;
  objc_msgSend(v4, "geometryNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_evaluateGeometrySpaceMap:(id *)a3
{
  NUGeometrySpaceMap *v5;
  void *v6;
  NUGeometrySpaceMap *v7;
  NUGeometrySpaceMap *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v22;
  void *v23;
  void *specific;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  NSString *dominantInputKey;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_12944();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v62 = v23;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12944();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v30 = (void *)MEMORY[0x1E0CB3978];
        v31 = v29;
        objc_msgSend(v30, "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v62 = v29;
        v63 = 2114;
        v64 = v33;
        _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v62 = v28;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode _evaluateGeometrySpaceMap:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 899, CFSTR("Invalid parameter not satisfying: %s"), v34, v35, v36, v37, (uint64_t)"error != nil");
  }
  if (-[NURenderNode isGeometryNode](self, "isGeometryNode"))
  {
    v5 = objc_alloc_init(NUGeometrySpaceMap);
    if (self->_dominantInputKey)
    {
      dominantInputKey = self->_dominantInputKey;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &dominantInputKey, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[NURenderNode inputs](self, "inputs");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v56;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v56 != v13)
            objc_enumerationMutation(v10);
          -[NURenderNode inputForKey:](self, "inputForKey:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "outputGeometrySpaceMap:", a3);
          v16 = objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
            if (!*a3)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing error %s:%d: unable to evaluate geometry space map"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 915, (_QWORD)v55);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              +[NUError unknownError:object:](NUError, "unknownError:object:", v20, v15);
              *a3 = (id)objc_claimAutoreleasedReturnValue();

            }
            v8 = 0;
            goto LABEL_22;
          }
          v17 = (void *)v16;
          -[NUGeometrySpaceMap mergeWithSpaceMap:](v5, "mergeWithSpaceMap:", v16);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
        if (v12)
          continue;
        break;
      }
    }

    v18 = (void *)objc_opt_new();
    -[NURenderNode spaceMapKey](self, "spaceMapKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUGeometrySpaceMap setSpace:forKey:](v5, "setSpace:forKey:", v18, v19);

    v8 = v5;
LABEL_22:

  }
  else
  {
    -[NURenderNode uniqueInputNode](self, "uniqueInputNode");
    v7 = (NUGeometrySpaceMap *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      NUAssertLogger_12944();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SpaceMap :: Nodes with 0 or 2 or more inputs must be geometry nodes"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v62 = v39;
        _os_log_error_impl(&dword_1A6553000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_12944();
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
      if (v40)
      {
        if (v42)
        {
          v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v46 = (void *)MEMORY[0x1E0CB3978];
          v47 = v45;
          objc_msgSend(v46, "callStackSymbols");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v62 = v45;
          v63 = 2114;
          v64 = v49;
          _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v42)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v62 = v44;
        _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"-[NURenderNode _evaluateGeometrySpaceMap:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 930, CFSTR("SpaceMap :: Nodes with 0 or 2 or more inputs must be geometry nodes"), v50, v51, v52, v53, v54);
    }
    v5 = v7;
    -[NUGeometrySpaceMap outputGeometrySpaceMap:](v7, "outputGeometrySpaceMap:", a3);
    v8 = (NUGeometrySpaceMap *)objc_claimAutoreleasedReturnValue();
    if (!v8 && !*a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing error %s:%d: unable to evaluate geometry space map"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 933);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError unknownError:object:](NUError, "unknownError:object:", v9, v5);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v8;
}

- (id)outputImageGeometry:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v8;

  if (-[NURenderNode isCached](self, "isCached"))
  {
    -[NURenderNode cached_outputImageGeometry](self, "cached_outputImageGeometry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[NURenderNode _evaluateImageGeometry:](self, "_evaluateImageGeometry:", a3);
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v5 = (void *)v6;
        -[NURenderNode setCached_outputImageGeometry:](self, "setCached_outputImageGeometry:", v6);
      }
      else
      {
        if (a3 && !*a3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing error %s:%d: unable to evaluate image geometry"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 947);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          +[NUError unknownError:object:](NUError, "unknownError:object:", v8, self);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

        }
        v5 = 0;
      }
    }
  }
  else
  {
    -[NURenderNode _evaluateImageGeometry:](self, "_evaluateImageGeometry:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSDictionary *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  char v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NUImageGeometry *v26;
  NUImageGeometry *v27;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
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
  NSDictionary *obj;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint8_t buf[40];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_12944();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v33;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12944();
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
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v43;
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
    _NUAssertFailHandler((uint64_t)"-[NURenderNode _evaluateImageGeometry:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 961, CFSTR("Invalid parameter not satisfying: %s"), v44, v45, v46, v47, (uint64_t)"error != nil");
  }
  v5 = *((_QWORD *)&NUScaleOne + 1);
  v6 = NUScaleOne;
  v57 = 0u;
  v58 = 0u;
  if (self->_dominantInputKey)
  {
    -[NSDictionary objectForKey:](self->_inputs, "objectForKey:");
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary outputImageGeometry:](v7, "outputImageGeometry:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(v8, "renderScale");
      if (v10 >= 1 && v11 > 0)
      {
        v6 = v10;
        v5 = v11;
        objc_msgSend(v9, "extent");
        v24 = objc_msgSend(v9, "orientation");
        v25 = objc_msgSend(v9, "roundingPolicy");

        goto LABEL_31;
      }
      +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 1, CFSTR("invalid scale for input node"), v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("unable to evaluate image geometry"), v7, *a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    *a3 = v13;

LABEL_41:
    v27 = 0;
    return v27;
  }
  v55 = 0uLL;
  v56 = 0uLL;
  v53 = 0uLL;
  v54 = 0uLL;
  v7 = self->_inputs;
  v51 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (!v51)
  {
    v25 = 0;
    v24 = 1;
    goto LABEL_31;
  }
  v49 = 0;
  v50 = v6;
  v52 = *(_QWORD *)v54;
  v24 = 1;
  v14 = 1;
  obj = v7;
  while (2)
  {
    for (i = 0; i != v51; ++i)
    {
      if (*(_QWORD *)v54 != v52)
        objc_enumerationMutation(obj);
      -[NSDictionary objectForKey:](self->_inputs, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "outputImageGeometry:", a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (!v17)
      {
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("unable to evaluate image geometry"), v16, *a3);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_40;
      }
      v19 = objc_msgSend(v17, "renderScale");
      if (v19 < 1 || v20 <= 0)
      {
        v29 = CFSTR("invalid scale for input node");
        goto LABEL_35;
      }
      v22 = v19;
      v23 = v20;
      if ((v14 & 1) != 0)
      {
        objc_msgSend(v18, "extent");
        v57 = 0u;
        v58 = 0u;
        v24 = objc_msgSend(v18, "orientation");
        v49 = objc_msgSend(v18, "roundingPolicy");
        v50 = v22;
        v5 = v23;
        goto LABEL_25;
      }
      if (!NUScaleEqual(v19, v20, v50, v5))
      {
        v29 = CFSTR("mismatch of rendering scales across inputs");
LABEL_35:
        v30 = 1;
LABEL_39:
        +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", v30, v29, v16);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_40:
        *a3 = v28;

        goto LABEL_41;
      }
      objc_msgSend(v18, "extent");
      memset(buf, 0, 32);
      v59 = v57;
      v60 = v58;
      NU::RectT<long>::add((uint64_t *)&v59, (uint64_t *)buf);
      v57 = v59;
      v58 = v60;
      if (v24 != objc_msgSend(v18, "orientation"))
      {
        v29 = CFSTR("incompatible orientations for multiple inputs");
LABEL_38:
        v30 = 5;
        goto LABEL_39;
      }
      if (v49 != objc_msgSend(v18, "roundingPolicy"))
      {
        v29 = CFSTR("incompatible rounding policy for multiple inputs");
        goto LABEL_38;
      }
LABEL_25:

      v14 = 0;
    }
    v7 = obj;
    v14 = 0;
    v51 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    if (v51)
      continue;
    break;
  }
  v25 = v49;
  v6 = v50;
LABEL_31:

  v26 = [NUImageGeometry alloc];
  *(_OWORD *)buf = v57;
  *(_OWORD *)&buf[16] = v58;
  v27 = -[NUImageGeometry initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:](v26, "initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:", buf, v6, v5, v24, 0, v25);
  return v27;
}

- (id)_evaluateVideoAttributes:(id *)a3
{
  NSString *dominantInputKey;
  NSDictionary *inputs;
  void *v7;
  void *v8;

  dominantInputKey = self->_dominantInputKey;
  inputs = self->_inputs;
  if (!dominantInputKey)
  {
    if (-[NSDictionary count](inputs, "count") != 1)
    {
      v8 = 0;
      return v8;
    }
    inputs = self->_inputs;
    dominantInputKey = (NSString *)*MEMORY[0x1E0C9E1F8];
  }
  -[NSDictionary objectForKey:](inputs, "objectForKey:", dominantInputKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "outputVideoAttributes:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)imageProperties:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;

  if (-[NURenderNode isCached](self, "isCached"))
  {
    -[NURenderNode cached_imageProperties](self, "cached_imageProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[NURenderNode _evaluateImageProperties:](self, "_evaluateImageProperties:", a3);
      v6 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v6;
      if (a3 && !v6 && !*a3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing error %s:%d: unable to evaluate image properties"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 1109);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[NUError unknownError:object:](NUError, "unknownError:object:", v7, self);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      -[NURenderNode setCached_imageProperties:](self, "setCached_imageProperties:", v5);
    }
  }
  else
  {
    -[NURenderNode _evaluateImageProperties:](self, "_evaluateImageProperties:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_evaluateImageProperties:(id *)a3
{
  NSDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  _OWORD v27[4];
  _BYTE v28[128];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_12944();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12944();
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
        v30 = v18;
        v31 = 2114;
        v32 = v22;
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
      v30 = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode _evaluateImageProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 1122, CFSTR("Invalid parameter not satisfying: %s"), v23, v24, v25, v26, (uint64_t)"error != NULL");
  }
  if (self->_dominantInputKey)
  {
    -[NSDictionary objectForKey:](self->_inputs, "objectForKey:");
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary imageProperties:](v5, "imageProperties:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6 && !*a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing error %s:%d: unable to evaluate image properties"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 1128);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError unknownError:object:](NUError, "unknownError:object:", v7, v5);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    memset(v27, 0, sizeof(v27));
    v5 = self->_inputs;
    if (!-[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", v27, v28, 16))
    {

      +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("unable to resolve image properties -- no inputs"), self);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
    -[NSDictionary objectForKey:](self->_inputs, "objectForKey:", **((_QWORD **)&v27[0] + 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageProperties:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6 && !*a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing error %s:%d: unable to evaluate image properties"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 1142, *(_QWORD *)&v27[0]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError unknownError:object:](NUError, "unknownError:object:", v9, v8);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v6;
}

- (id)videoProperties:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;

  if (-[NURenderNode isCached](self, "isCached"))
  {
    -[NURenderNode cached_videoProperties](self, "cached_videoProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[NURenderNode _evaluateVideoProperties:](self, "_evaluateVideoProperties:", a3);
      v6 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v6;
      if (a3 && !v6 && !*a3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing error %s:%d: unable to evaluate video properties"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 1160);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[NUError unknownError:object:](NUError, "unknownError:object:", v7, self);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      -[NURenderNode setCached_videoProperties:](self, "setCached_videoProperties:", v5);
    }
  }
  else
  {
    -[NURenderNode _evaluateVideoProperties:](self, "_evaluateVideoProperties:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_evaluateVideoProperties:(id *)a3
{
  NSDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  _OWORD v27[4];
  _BYTE v28[128];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_12944();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12944();
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
        v30 = v18;
        v31 = 2114;
        v32 = v22;
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
      v30 = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode _evaluateVideoProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 1173, CFSTR("Invalid parameter not satisfying: %s"), v23, v24, v25, v26, (uint64_t)"error != NULL");
  }
  if (self->_dominantInputKey)
  {
    -[NSDictionary objectForKey:](self->_inputs, "objectForKey:");
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary videoProperties:](v5, "videoProperties:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6 && !*a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing error %s:%d: unable to evaluate video properties"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 1179);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError unknownError:object:](NUError, "unknownError:object:", v7, v5);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    memset(v27, 0, sizeof(v27));
    v5 = self->_inputs;
    if (!-[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", v27, v28, 16))
    {

      +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("unable to resolve video properties -- no inputs"), self);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
    -[NSDictionary objectForKey:](self->_inputs, "objectForKey:", **((_QWORD **)&v27[0] + 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "videoProperties:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6 && !*a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing error %s:%d: unable to evaluate video properties"), "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 1191, *(_QWORD *)&v27[0]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError unknownError:object:](NUError, "unknownError:object:", v9, v8);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v6;
}

- (id)description
{
  return -[NURenderNode _descriptionWithOffset:showInputs:map:](self, "_descriptionWithOffset:showInputs:map:", 0, 0, 0);
}

- (id)debugDescription
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 514, 0, 0);
  -[NURenderNode _descriptionWithOffset:showInputs:map:](self, "_descriptionWithOffset:showInputs:map:", 0, 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_dictionaryToSingleLineString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a3, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E5068958);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\t"), CFSTR(" "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("    "), CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "length");
  if (v7 >= 0xFF)
    v8 = 255;
  else
    v8 = v7;
  objc_msgSend(v6, "substringToIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_appendInputsWithOffset:(int64_t)a3 to:(id)a4 map:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id obj;
  uint64_t v25;
  NURenderNode *v26;
  id v27;
  uint64_t v28;
  int64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v27 = a4;
  v8 = a5;
  v26 = self;
  -[NSDictionary allKeys](self->_inputs, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v10;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v28)
  {
    v29 = a3 + 1;
    v25 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        -[NSDictionary objectForKey:](v26->_inputs, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("\n"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if ((a3 & 0x8000000000000000) == 0)
          objc_msgSend(v14, "appendString:", CFSTR("|"));
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%2ld"), v29);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "appendString:", v16);
        v17 = a3 & ~(a3 >> 63);
        if (a3 >= 1)
        {
          do
          {
            objc_msgSend(v15, "appendString:", CFSTR("--"));
            --v17;
          }
          while (v17);
        }
        if ((a3 & 0x8000000000000000) == 0)
          objc_msgSend(v15, "appendString:", CFSTR(">"));
        objc_msgSend(v8, "objectForKey:", v13);
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = (void *)v18;
          objc_msgSend(v27, "appendFormat:", CFSTR("%@ '%@' : %@"), v15, v12, v18);
        }
        else
        {
          objc_msgSend(v13, "_descriptionWithOffset:showInputs:map:", v29, 1, v8);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "appendFormat:", CFSTR("%@ '%@' : %@"), v15, v12, v20);

          if (!v8)
            goto LABEL_17;
          v23 = (void *)MEMORY[0x1E0CB3940];
          v21 = objc_opt_class();
          objc_msgSend(v13, "aliasDescription");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@:%p> %@"), v21, v13, v22);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "setObject:forKey:", v19, v13);
        }

LABEL_17:
      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v28);
  }

}

- (id)_descriptionWithOffset:(int64_t)a3 showInputs:(BOOL)a4 map:(id)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  __CFString *v11;
  __CFString *v12;
  _BOOL4 v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a4;
  v7 = a5;
  v8 = (void *)MEMORY[0x1E0CB37A0];
  v9 = objc_opt_class();
  v10 = -[NURenderNode evaluatedForMode](self, "evaluatedForMode");
  if ((unint64_t)(v10 - 1) > 2)
    v11 = CFSTR("Prepare");
  else
    v11 = off_1E5060A80[v10 - 1];
  v12 = v11;
  v13 = -[NURenderNode isCached](self, "isCached");
  v14 = -[NURenderNode hash](self, "hash");
  -[NURenderNode descriptionSubClassHook](self, "descriptionSubClassHook");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderNode _dictionaryToSingleLineString:](self, "_dictionaryToSingleLineString:", self->_settings);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@:%p> evaluated=%@ cached=%d hash=%lu %@ settings=%@"), v9, self, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[NURenderNode _appendInputsWithOffset:to:map:](self, "_appendInputsWithOffset:to:map:", a3, v17, v7);

  return v17;
}

- (id)descriptionSubClassHook
{
  return &stru_1E5068958;
}

- (id)aliasDescription
{
  return &stru_1E5068958;
}

- (BOOL)isEqual:(id)a3
{
  NURenderNode *v4;
  BOOL v5;

  v4 = (NURenderNode *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[NURenderNode isEqualToRenderNode:](self, "isEqualToRenderNode:", v4);
  }

  return v5;
}

- (BOOL)isEqualToSettingsAndInputs:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSDictionary *v6;
  id v7;
  uint64_t v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, void *, _BYTE *);
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v4 = a3;
  v5 = (void *)v4[3];
  v6 = self->_inputs;
  v7 = v5;
  v8 = -[NSDictionary count](v6, "count");
  if (v8 != objc_msgSend(v7, "count"))
  {

    goto LABEL_5;
  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __NURenderNodeDictionaryEqual_block_invoke;
  v18 = &unk_1E50623C8;
  v9 = v7;
  v19 = v9;
  v20 = &v21;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v6, "enumerateKeysAndObjectsUsingBlock:", &v15);
  v10 = *((unsigned __int8 *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  if (!v10)
  {
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  -[NURenderNode settings](self, "settings", v15, v16, v17, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToDictionary:", v12);

LABEL_6:
  return v13;
}

- (BOOL)isEqualToRenderNode:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v5 == objc_opt_class() && -[NURenderNode isEqualToSettingsAndInputs:](self, "isEqualToSettingsAndInputs:", v4);

  return v6;
}

- (unint64_t)settingsAndInputsHash
{
  uint64_t v3;
  NSDictionary *v4;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = NUDeepDictionaryHash(self->_settings);
  v4 = self->_inputs;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __NURenderNodeDictionaryHash_block_invoke;
  v7[3] = &unk_1E5063D28;
  v7[4] = &v8;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v4, "enumerateKeysAndObjectsUsingBlock:", v7);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return (0x22FE22F4190DAFLL * v5) ^ (0x18705A47792769 * v3);
}

- (unint64_t)_hash
{
  objc_class *v3;
  void *v4;
  uint64_t v5;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0x412264519ABB7 * objc_msgSend(v4, "hash");

  return (0x1C820311EBB3D9 * -[NURenderNode settingsAndInputsHash](self, "settingsAndInputsHash")) ^ v5;
}

- (unint64_t)hash
{
  unint64_t result;

  result = self->_hashValue;
  if (!result)
  {
    result = -[NURenderNode _hash](self, "_hash");
    self->_hashValue = result;
  }
  return result;
}

- (void)nu_updateDigest:(id)a3
{
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addString:", v5);

  objc_msgSend(v8, "addCString:", "settings");
  -[NURenderNode settings](self, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nu_updateDigest:", v8);

  objc_msgSend(v8, "addCString:", "inputs");
  -[NURenderNode inputs](self, "inputs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nu_updateDigest:", v8);

  objc_msgSend(v8, "addCString:", "end");
}

- (NSDictionary)inputs
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)settings
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)xforms
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isGeometryNode
{
  return self->_isGeometryNode;
}

- (CIImage)cached_outputImage
{
  return (CIImage *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCached_outputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableDictionary)cached_auxiliaryImages
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCached_auxiliaryImages:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (AVComposition)cached_outputVideo
{
  return (AVComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCached_outputVideo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (AVVideoComposition)cached_outputVideoComposition
{
  return (AVVideoComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCached_outputVideoComposition:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (AVAudioMix)cached_outputAudioMix
{
  return (AVAudioMix *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCached_outputAudioMix:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NUImageGeometry)cached_outputImageGeometry
{
  return (NUImageGeometry *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCached_outputImageGeometry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NUImageProperties)cached_imageProperties
{
  return (NUImageProperties *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCached_imageProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NUVideoProperties)cached_videoProperties
{
  return (NUVideoProperties *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCached_videoProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NUGeometrySpaceMap)cached_geometrySpaceMap
{
  return (NUGeometrySpaceMap *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCached_geometrySpaceMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (BOOL)isCached
{
  return self->_isCached;
}

- (void)setCached:(BOOL)a3
{
  self->_cached = a3;
}

- (int64_t)_evaluatedForMode
{
  return self->__evaluatedForMode;
}

- (void)set_evaluatedForMode:(int64_t)a3
{
  self->__evaluatedForMode = a3;
}

- (NSString)dominantInputKey
{
  return self->_dominantInputKey;
}

- (NSString)spaceMapKey
{
  return self->_spaceMapKey;
}

- (double)nodeCreationTime
{
  return self->_nodeCreationTime;
}

- (NSString)nodeCreationJobName
{
  return self->_nodeCreationJobName;
}

- (void)setNodeCreationJobName:(id)a3
{
  objc_storeStrong((id *)&self->_nodeCreationJobName, a3);
}

- (int64_t)cacheHitsCount
{
  return self->_cacheHitsCount;
}

- (void)setCacheHitsCount:(int64_t)a3
{
  self->_cacheHitsCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodeCreationJobName, 0);
  objc_storeStrong((id *)&self->_spaceMapKey, 0);
  objc_storeStrong((id *)&self->_dominantInputKey, 0);
  objc_storeStrong((id *)&self->_cached_geometrySpaceMap, 0);
  objc_storeStrong((id *)&self->_cached_videoProperties, 0);
  objc_storeStrong((id *)&self->_cached_imageProperties, 0);
  objc_storeStrong((id *)&self->_cached_outputImageGeometry, 0);
  objc_storeStrong((id *)&self->_cached_outputAudioMix, 0);
  objc_storeStrong((id *)&self->_cached_outputVideoComposition, 0);
  objc_storeStrong((id *)&self->_cached_outputVideo, 0);
  objc_storeStrong((id *)&self->_cached_auxiliaryImages, 0);
  objc_storeStrong((id *)&self->_cached_outputImage, 0);
  objc_storeStrong((id *)&self->_xforms, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
}

void __31__NURenderNode_uniqueInputNode__block_invoke(uint64_t a1, int a2, id obj, _BYTE *a4)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  *a4 = 1;
}

+ (id)nodeFromCache:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[NURenderNodeCache sharedInstance](NURenderNodeCache, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NURenderNode nodeFromCache:cache:](NURenderNode, "nodeFromCache:cache:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)nodeFromCache:(id)a3 cache:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v10;
  void *v11;
  void *specific;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
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
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    NUAssertLogger_12944();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "node != nil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12944();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v25 = (void *)MEMORY[0x1E0CB3978];
        v26 = v24;
        objc_msgSend(v25, "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v24;
        v44 = 2114;
        v45 = v28;
        _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NURenderNode nodeFromCache:cache:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 210, CFSTR("Invalid parameter not satisfying: %s"), v29, v30, v31, v32, (uint64_t)"node != nil");
  }
  v7 = v6;
  if (!v6)
  {
    NUAssertLogger_12944();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "cache != nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12944();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v21)
      {
        v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v34 = (void *)MEMORY[0x1E0CB3978];
        v35 = v33;
        objc_msgSend(v34, "callStackSymbols");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v33;
        v44 = 2114;
        v45 = v37;
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
      v43 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NURenderNode nodeFromCache:cache:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 211, CFSTR("Invalid parameter not satisfying: %s"), v38, v39, v40, v41, (uint64_t)"cache != nil");
  }
  objc_msgSend(v6, "retrieveAndCacheNode:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCached:", 1);

  return v8;
}

@end
