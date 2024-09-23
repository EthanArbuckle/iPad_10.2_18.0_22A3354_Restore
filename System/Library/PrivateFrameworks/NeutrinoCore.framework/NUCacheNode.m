@implementation NUCacheNode

- (NUCacheNode)initWithSettings:(id)a3 inputs:(id)a4
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_217);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_217);
      goto LABEL_8;
    }
    if (v15 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_217);
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
  _NUAssertFailHandler((uint64_t)"-[NUCacheNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 77, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v29, v30, v31, v32, v28);
}

- (NUCacheNode)initWithInput:(id)a3 settings:(id)a4
{
  return -[NUCacheNode initWithInput:settings:subsampleFactor:](self, "initWithInput:settings:subsampleFactor:", a3, a4, 0);
}

- (NUCacheNode)initWithInput:(id)a3 settings:(id)a4 subsampleFactor:(int64_t)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  NUCacheNode *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v14 = CFSTR("input");
  v15[0] = a3;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[NUCacheNode initWithInputs:settings:subsampleFactor:](self, "initWithInputs:settings:subsampleFactor:", v11, v9, a5);
  return v12;
}

- (NUCacheNode)initWithInputs:(id)a3 settings:(id)a4 subsampleFactor:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  NUCacheNode *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  dispatch_group_t v15;
  OS_dispatch_group *group;
  NURenderContext *v17;
  NURenderContext *renderContext;
  NSObject *v20;
  void *v21;
  void *specific;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
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
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  objc_super v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("input"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    NUAssertLogger_12502();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "inputs[NUCacheNodeInputKey] != nil");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v21;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12502();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v35 = (void *)MEMORY[0x1E0CB3978];
        v36 = v34;
        objc_msgSend(v35, "callStackSymbols");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v34;
        v55 = 2114;
        v56 = v38;
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
      v54 = v26;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCacheNode initWithInputs:settings:subsampleFactor:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 92, CFSTR("Invalid parameter not satisfying: %s"), v39, v40, v41, v42, (uint64_t)"inputs[NUCacheNodeInputKey] != nil");
  }
  if (a5 < 0)
  {
    NUAssertLogger_12502();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "subsampleFactor >= 0");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v28;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12502();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (v29)
    {
      if (v31)
      {
        v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v44 = (void *)MEMORY[0x1E0CB3978];
        v45 = v43;
        objc_msgSend(v44, "callStackSymbols");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "componentsJoinedByString:", CFSTR("\n"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v43;
        v55 = 2114;
        v56 = v47;
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
      v54 = v33;
      _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCacheNode initWithInputs:settings:subsampleFactor:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 93, CFSTR("Invalid parameter not satisfying: %s"), v48, v49, v50, v51, (uint64_t)"subsampleFactor >= 0");
  }
  v52.receiver = self;
  v52.super_class = (Class)NUCacheNode;
  v11 = -[NURenderNode initWithSettings:inputs:](&v52, sel_initWithSettings_inputs_, v9, v8);
  v11->_subsampleFactor = a5;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = dispatch_queue_create("NUCacheNode", v12);
  queue = v11->_queue;
  v11->_queue = (OS_dispatch_queue *)v13;

  v15 = dispatch_group_create();
  group = v11->_group;
  v11->_group = (OS_dispatch_group *)v15;

  v17 = objc_alloc_init(NURenderContext);
  renderContext = v11->_renderContext;
  v11->_renderContext = v17;

  return v11;
}

- (id)descriptionSubClassHook
{
  NSObject *queue;
  void *v4;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__12548;
  v11 = __Block_byref_object_dispose__12549;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__NUCacheNode_descriptionSubClassHook__block_invoke;
  block[3] = &unk_1E5063FE0;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(queue, block);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" sourceNode : %@ %lu"), v8[5], self->_subsampleFactor);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (NURenderNode)inputNode
{
  return (NURenderNode *)-[NURenderNode inputForKey:](self, "inputForKey:", CFSTR("input"));
}

- (unint64_t)_hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NUCacheNode;
  return self->_subsampleFactor ^ -[NURenderNode _hash](&v3, sel__hash);
}

- (void)nu_updateDigest:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NUCacheNode;
  v4 = a3;
  -[NURenderNode nu_updateDigest:](&v5, sel_nu_updateDigest_, v4);
  objc_msgSend(v4, "addCString:", "subsample", v5.receiver, v5.super_class);
  objc_msgSend(v4, "addBytes:length:", &self->_subsampleFactor, 8);

}

- (BOOL)isEqualToRenderNode:(id)a3
{
  id v4;
  int64_t subsampleFactor;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NUCacheNode;
  if (-[NURenderNode isEqualToRenderNode:](&v8, sel_isEqualToRenderNode_, v4))
  {
    subsampleFactor = self->_subsampleFactor;
    v6 = subsampleFactor == objc_msgSend(v4, "subsampleFactor");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v40;
  void *v41;
  void *specific;
  NSObject *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t v66[128];
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v61 = a3;
  v8 = a4;
  if (!a5)
  {
    NUAssertLogger_12502();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v41;
      _os_log_error_impl(&dword_1A6553000, v40, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12502();
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v44)
      {
        v47 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v48 = (void *)MEMORY[0x1E0CB3978];
        v49 = v47;
        objc_msgSend(v48, "callStackSymbols");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "componentsJoinedByString:", CFSTR("\n"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v68 = v47;
        v69 = 2114;
        v70 = v51;
        _os_log_error_impl(&dword_1A6553000, v43, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v44)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v46;
      _os_log_error_impl(&dword_1A6553000, v43, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCacheNode nodeByReplayingAgainstCache:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 149, CFSTR("Invalid parameter not satisfying: %s"), v52, v53, v54, v55, (uint64_t)"error != NULL");
  }
  v9 = v8;
  -[NURenderNode outputImageGeometry:](self, "outputImageGeometry:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_msgSend(v9, "scale");
    v13 = v12;
    v14 = objc_msgSend(v10, "renderScale");
    v16 = NUScaleDivide(v11, v13, v14, v15);
    v18 = -[NUCacheNode subsampleFactorForScale:](self, "subsampleFactorForScale:", v16, v17);
    -[NUCacheNode inputNode](self, "inputNode");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "outputImageGeometry:", a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v58 = v10;
      v59 = v9;
      v21 = (void *)objc_msgSend(v9, "copy");
      objc_msgSend(v21, "setEvaluationMode:", 0);
      v57 = v20;
      v22 = objc_msgSend(v20, "renderScale");
      v56 = v18;
      v24 = NUScaleMultiply(1, v18, v22, v23);
      objc_msgSend(v21, "setScale:", v24, v25);
      v60 = v21;
      objc_msgSend(v21, "setSampleMode:", -[NUCacheNode sampleMode](self, "sampleMode"));
      v26 = (void *)objc_opt_new();
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      -[NURenderNode inputs](self, "inputs");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "allKeys");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v63;
        while (2)
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v63 != v31)
              objc_enumerationMutation(v28);
            v33 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
            -[NURenderNode inputForKey:](self, "inputForKey:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "nodeByReplayingAgainstCache:pipelineState:error:", v61, v60, a5);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v35)
            {
              +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("[NUCacheNode nodeByReplayingAgainstCache] could not get cached input node."), 0, *a5);
              v38 = 0;
              *a5 = (id)objc_claimAutoreleasedReturnValue();
              v9 = v59;
              goto LABEL_16;
            }
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v35, v33);

          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
          if (v30)
            continue;
          break;
        }
      }

      -[NURenderNode settings](self, "settings");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v59;
      -[NURenderNode evaluateSettings:pipelineState:error:](self, "evaluateSettings:pipelineState:error:", v36, v59, a5);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        v37 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithInputs:settings:subsampleFactor:", v26, v28, v56);
        +[NURenderNode nodeFromCache:cache:](NURenderNode, "nodeFromCache:cache:", v37, v61);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v38, "setEvaluatedForMode:", objc_msgSend(v59, "evaluationMode"));
      }
      else
      {
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("[NUCacheNode nodeByReplayingAgainstCache] could not get resolve settings"), 0, *a5);
        v38 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_16:
      v20 = v57;
      v10 = v58;

    }
    else
    {
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("[NUCacheNode nodeByReplayingAgainstCache] could not get [self.inputNode outputImageGeometry]"), 0, *a5);
      v38 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("[NUCacheNode nodeByReplayingAgainstCache] could not get [self outputImageGeometry]"), 0, *a5);
    v38 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v38;
}

- (int64_t)subsampleFactorForScale:(id)a3
{
  _QWORD v4[2];

  v4[0] = 0;
  v4[1] = 0;
  return +[NUSubsampleNode subsampleFactorForScale:additionalScale:](NUSubsampleNode, "subsampleFactorForScale:additionalScale:", a3.var0, a3.var1, v4);
}

- (int64_t)sampleMode
{
  void *v2;
  void *v3;
  int64_t v4;

  +[NUPlatform currentPlatform](NUPlatform, "currentPlatform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "defaultSampleMode");

  return v4;
}

- (BOOL)tryLoadPersistentURL:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)evaluateRenderDependenciesWithRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v27;
  void *v28;
  void *specific;
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
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[NUCacheNode subsampleFactor](self, "subsampleFactor") <= 0)
  {
    NUAssertLogger_12502();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Node hasn't been evaluated for render"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = (uint64_t)v28;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12502();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
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
        v50 = (uint64_t)v34;
        v51 = 2114;
        v52 = v38;
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
      v50 = (uint64_t)v33;
      _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCacheNode evaluateRenderDependenciesWithRequest:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 234, CFSTR("Node hasn't been evaluated for render"), v39, v40, v41, v42, v43);
  }
  if (-[NUCacheNode isResolved](self, "isResolved"))
  {
    v7 = (void *)MEMORY[0x1E0C9AA70];
  }
  else
  {
    -[NUCacheNode persistentURL](self, "persistentURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    v9 = -[NUCacheNode tryLoadPersistentURL:error:](self, "tryLoadPersistentURL:error:", v8, &v44);
    v10 = v44;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = *MEMORY[0x1E0CB2A88];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAttributes:ofItemAtPath:error:", v13, v14, 0);

      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_218_12520);
      v15 = (void *)_NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v15;
        v17 = objc_opt_class();
        objc_msgSend(v8, "path");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v17;
        v51 = 2114;
        v52 = v18;
        _os_log_impl(&dword_1A6553000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ cache hit: %{public}@", buf, 0x16u);

      }
      v7 = (void *)MEMORY[0x1E0C9AA70];
    }
    else
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_218_12520);
      v19 = (void *)_NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
      {
        v20 = v19;
        v21 = objc_opt_class();
        objc_msgSend(v8, "path");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v21;
        v51 = 2114;
        v52 = v22;
        _os_log_impl(&dword_1A6553000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ cache miss: %{public}@", buf, 0x16u);

      }
      v23 = -[NUCacheNode newRenderRequestWithOriginalRequest:error:](self, "newRenderRequestWithOriginalRequest:error:", v6, a4);
      if (v23)
      {
        -[NUCacheNode setupDependentJobFromRequest:originalRequest:error:](self, "setupDependentJobFromRequest:originalRequest:error:", v23, v6, a4);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          -[NUCacheNode cacheIdentifier](self, "cacheIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v25;
          v46 = v24;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v7 = 0;
        }

      }
      else
      {
        v7 = 0;
      }

    }
  }

  return v7;
}

- (id)setupDependentJobFromRequest:(id)a3 originalRequest:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  NUPipelineOutputNode *v11;
  void *v12;
  NUPipelineOutputNode *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v8 = a3;
  objc_msgSend(a4, "priority");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPriority:", v9);

  objc_msgSend(v8, "setSubmitTime:", NUAbsoluteTime());
  v10 = (void *)objc_msgSend(v8, "newRenderJob");

  objc_msgSend(v10, "setReplyGroup:", self->_group);
  v11 = [NUPipelineOutputNode alloc];
  -[NUCacheNode inputNode](self, "inputNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[NUPipelineOutputNode initWithInput:](v11, "initWithInput:", v12);
  objc_msgSend(v10, "setPrepareNode:", v13);

  -[NURenderNode outputImageGeometry:](self, "outputImageGeometry:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v10, "setOutputGeometry:", v14);
    v15 = objc_msgSend(v14, "renderScale");
    objc_msgSend(v10, "setRenderScale:", v15, v16);
    -[NURenderContext addJob:](self->_renderContext, "addJob:", v10);
    v17 = v10;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)isResolved
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__NUCacheNode_isResolved__block_invoke;
  v5[3] = &unk_1E5063FE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)resolveWithSourceNode:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__NUCacheNode_resolveWithSourceNode_error___block_invoke;
  block[3] = &unk_1E5062E88;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

- (void)_resolveWithSourceNode:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  NUCacheNodeSourceDerivation *v9;
  NSError *sourceError;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!self->_sourceNode)
  {
    if (v7)
    {
      objc_msgSend(v7, "setOriginalNode:", self);
      v9 = -[NUCacheNodeSourceDerivation initWithSubsampleFactor:]([NUCacheNodeSourceDerivation alloc], "initWithSubsampleFactor:", -[NUCacheNode subsampleFactor](self, "subsampleFactor"));
      objc_msgSend(v7, "setSourceDerivation:", v9);

      -[NURenderContext cancelAllJobs](self->_renderContext, "cancelAllJobs");
      objc_storeStrong((id *)&self->_sourceNode, a3);
      sourceError = self->_sourceError;
      self->_sourceError = 0;

    }
    else if (!self->_sourceError)
    {
      self->_sourceNode = 0;
      objc_storeStrong((id *)&self->_sourceError, a4);
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_218_12520);
      v11 = (void *)_NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        v12 = v11;
        -[NUCacheNode persistentURL](self, "persistentURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412546;
        v15 = v13;
        v16 = 2112;
        v17 = v8;
        _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Error preparing cache node %@: %@", (uint8_t *)&v14, 0x16u);

      }
    }
  }

}

- (id)resolvedSourceNode:(id *)a3
{
  NSObject *queue;
  void *v6;
  id v7;
  NSObject *v9;
  void *v10;
  void *specific;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD block[7];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _BYTE buf[24];
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_12502();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v10;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12502();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v17 = (void *)MEMORY[0x1E0CB3978];
        v18 = v16;
        objc_msgSend(v17, "callStackSymbols");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v16;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v20;
        _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v15;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCacheNode resolvedSourceNode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 349, CFSTR("Invalid parameter not satisfying: %s"), v21, v22, v23, v24, (uint64_t)"error != NULL");
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v33 = __Block_byref_object_copy__12548;
  v34 = __Block_byref_object_dispose__12549;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__12548;
  v30 = __Block_byref_object_dispose__12549;
  v31 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__NUCacheNode_resolvedSourceNode___block_invoke;
  block[3] = &unk_1E50631E8;
  block[4] = self;
  block[5] = buf;
  block[6] = &v26;
  dispatch_sync(queue, block);
  v6 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    if (v27[5])
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to cache source node"), self);
    else
      +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("Cache node doesn't have cached contents"), self);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(buf, 8);
  return v6;
}

- (NSString)cacheIdentifier
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *specific;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NUDigest *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  _BYTE v28[12];
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!-[NURenderNode isCached](self, "isCached"))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_217);
    v3 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      v5 = v3;
      objc_msgSend(v4, "stringWithFormat:", CFSTR("evaluating cacheIdentifier on a non-cached node"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v28 = 138543362;
      *(_QWORD *)&v28[4] = v6;
      _os_log_impl(&dword_1A6553000, v5, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", v28, 0xCu);

      v7 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (v7 != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_217);
LABEL_9:
        v8 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v14 = (void *)MEMORY[0x1E0CB3978];
          v15 = specific;
          v16 = v8;
          objc_msgSend(v14, "callStackSymbols");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v28 = 138543618;
          *(_QWORD *)&v28[4] = specific;
          v29 = 2114;
          v30 = v18;
          _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v28, 0x16u);

LABEL_19:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v7 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_217);
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_9;
    }
    v19 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      v25 = (void *)MEMORY[0x1E0CB3978];
      v16 = v19;
      objc_msgSend(v25, "callStackSymbols");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v28 = 138543362;
      *(_QWORD *)&v28[4] = v27;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v28, 0xCu);

      goto LABEL_19;
    }
LABEL_14:
    _NUAssertContinueHandler((uint64_t)"-[NUCacheNode cacheIdentifier]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 389, CFSTR("evaluating cacheIdentifier on a non-cached node"), v9, v10, v11, v12, *(uint64_t *)v28);
  }
  -[NUCacheNode cachedCacheIdentifier](self, "cachedCacheIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    v21 = objc_alloc_init(NUDigest);
    +[NUSoftwareVersion currentSoftwareVersion](NUSoftwareVersion, "currentSoftwareVersion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "buildNumber");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "nu_updateDigest:", v21);

    -[NUCacheNode nu_updateDigest:](self, "nu_updateDigest:", v21);
    -[NUDigest finalize](v21, "finalize");
    -[NUDigest stringValue](v21, "stringValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUCacheNode setCachedCacheIdentifier:](self, "setCachedCacheIdentifier:", v20);

  }
  return (NSString *)v20;
}

- (id)persistentURLPrefix
{
  void *v3;
  void *v4;
  void *v5;

  +[NUCacheNode cacheDirectoryURL](NUCacheNode, "cacheDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUCacheNode cacheIdentifier](self, "cacheIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)temporaryURLPrefix
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[NUCacheNode cacheDirectoryURL](NUCacheNode, "cacheDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[NUCacheNode cacheIdentifier](self, "cacheIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.temp.%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)persistentURL
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_217);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_217);
      goto LABEL_8;
    }
    if (v8 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_217);
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
  _NUAssertFailHandler((uint64_t)"-[NUCacheNode persistentURL]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 425, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v22, v23, v24, v25, v21);
}

- (id)newRenderRequestWithOriginalRequest:(id)a3 error:(id *)a4
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_217);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_217);
      goto LABEL_8;
    }
    if (v11 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_217);
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
  _NUAssertFailHandler((uint64_t)"-[NUCacheNode newRenderRequestWithOriginalRequest:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 432, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v25, v26, v27, v28, v24);
}

- (BOOL)installTemporaryURL:(id)a3 intoPersistentURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v20;
  NSObject *v21;
  void *v22;
  void *specific;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!a5)
  {
    NUAssertLogger_12502();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v22;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12502();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v29 = (void *)MEMORY[0x1E0CB3978];
        v30 = v28;
        objc_msgSend(v29, "callStackSymbols");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v28;
        v42 = 2114;
        v43 = v32;
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
      v41 = v27;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCacheNode installTemporaryURL:intoPersistentURL:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 437, CFSTR("Invalid parameter not satisfying: %s"), v33, v34, v35, v36, (uint64_t)"error != nil");
  }
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "moveItemAtURL:toURL:error:", v7, v9, a5);

  if ((v11 & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    v37 = 0;
    v12 = objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", &v37);
    v13 = v37;
    if ((v12 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = *MEMORY[0x1E0CB2A88];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAttributes:ofItemAtPath:error:", v16, v17, 0);

    }
    else
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_218_12520);
      v18 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        v20 = *a5;
        *(_DWORD *)buf = 138412802;
        v41 = v7;
        v42 = 2112;
        v43 = v9;
        v44 = 2112;
        v45 = v20;
        _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Failed to install %@ -> %@: %@", buf, 0x20u);
      }
    }

  }
  return v12;
}

- (void)resolveSourceWithResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  BOOL v12;
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
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_12502();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "response != nil");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v14;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12502();
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
        v33 = v20;
        v34 = 2114;
        v35 = v24;
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
      v33 = v19;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCacheNode resolveSourceWithResponse:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 460, CFSTR("Invalid parameter not satisfying: %s"), v25, v26, v27, v28, (uint64_t)"response != nil");
  }
  v5 = v4;
  v31 = 0;
  objc_msgSend(v4, "result:", &v31);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v31;
  if (v6)
  {
    -[NUCacheNode persistentURL](self, "persistentURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "destinationURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v10 = -[NUCacheNode installTemporaryURL:intoPersistentURL:error:](self, "installTemporaryURL:intoPersistentURL:error:", v9, v8, &v30);
    v11 = v30;

    if (v10)
    {
      v29 = 0;
      v12 = -[NUCacheNode tryLoadPersistentURL:error:](self, "tryLoadPersistentURL:error:", v8, &v29);
      v7 = v29;

      v11 = v7;
      if (v12)
        goto LABEL_9;
    }
    else
    {
      v7 = v11;
    }
    -[NUCacheNode resolveWithSourceNode:error:](self, "resolveWithSourceNode:error:", 0, v11);
LABEL_9:

    goto LABEL_10;
  }
  -[NUCacheNode resolveWithSourceNode:error:](self, "resolveWithSourceNode:error:", 0, v7);
LABEL_10:

}

- (id)_evaluateImageGeometry:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[NUCacheNode inputNode](self, "inputNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputImageGeometry:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;

  return v6;
}

- (id)_evaluateImage:(id *)a3
{
  void *v4;
  void *v5;

  -[NUCacheNode resolvedSourceNode:](self, "resolvedSourceNode:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_evaluateImage:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_evaluateVideo:(id *)a3
{
  void *v4;
  void *v5;

  -[NUCacheNode resolvedSourceNode:](self, "resolvedSourceNode:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputVideo:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_evaluateVideoComposition:(id *)a3
{
  void *v4;
  void *v5;

  -[NUCacheNode resolvedSourceNode:](self, "resolvedSourceNode:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputVideoComposition:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)requiresVideoComposition
{
  return 0;
}

- (BOOL)requiresAudioMix
{
  return 0;
}

- (int64_t)subsampleFactor
{
  return self->_subsampleFactor;
}

- (NSString)cachedCacheIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setCachedCacheIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCacheIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceError, 0);
  objc_storeStrong((id *)&self->_sourceNode, 0);
  objc_storeStrong((id *)&self->_renderContext, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __34__NUCacheNode_resolvedSourceNode___block_invoke(_QWORD *a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 192));
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 200));
}

uint64_t __43__NUCacheNode_resolveWithSourceNode_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resolveWithSourceNode:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __25__NUCacheNode_isResolved__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 192) || *(_QWORD *)(v1 + 200))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  return result;
}

void __38__NUCacheNode_descriptionSubClassHook__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 192));
}

+ (id)registry
{
  void *v2;
  void *v3;

  +[NUFactory sharedFactory](NUFactory, "sharedFactory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cacheNodeRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)nodeWithInput:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInput:settings:", v9, v8);

  return v10;
}

+ (id)cacheDirectoryURL
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  id v9;

  if (cacheDirectoryURL_onceToken != -1)
    dispatch_once(&cacheDirectoryURL_onceToken, &__block_literal_global_12635);
  +[NUGlobalSettings cacheNodeDirectoryURL](NUGlobalSettings, "cacheNodeDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ensureCacheDirectoryURL:", v3);
  v4 = (void *)cacheDirectoryURL_pruneCoalescer;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__NUCacheNode_cacheDirectoryURL__block_invoke_2;
  v7[3] = &unk_1E50631C0;
  v9 = a1;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "coalesceBlock:", v7);

  return v5;
}

+ (void)_ensureCacheDirectoryURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  BOOL v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  char v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  char v32;
  _QWORD v33[3];
  _QWORD v34[3];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v32 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v5, &v32);

  if (v6)
    v7 = v32 == 0;
  else
    v7 = 0;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v10 = objc_msgSend(v9, "removeItemAtURL:error:", v3, &v31);
    v8 = v31;

    if ((v10 & 1) != 0)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_218_12520);
      v11 = (void *)_NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        v27 = v11;
        objc_msgSend(v3, "path");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v36 = v28;
        v37 = 2112;
        v38 = v8;
        _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Failed to delete file at path: %@, error: %@", buf, 0x16u);

      }
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    v8 = 0;
  }
  v33[0] = *MEMORY[0x1E0CB2A90];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", getuid());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v12;
  v33[1] = *MEMORY[0x1E0CB2A50];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", getgid());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v13;
  v33[2] = *MEMORY[0x1E0CB2AA8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[NUGlobalSettings cacheNodeFilePermissions](NUGlobalSettings, "cacheNodeFilePermissions"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v3, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v8;
    v19 = objc_msgSend(v17, "setAttributes:ofItemAtPath:error:", v15, v18, &v29);
    v20 = v29;

    if ((v19 & 1) == 0)
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_218_12520);
      v21 = (void *)_NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        v22 = v21;
        objc_msgSend(v3, "path");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v36 = v23;
        v37 = 2112;
        v38 = v20;
        v24 = "Failed to set directory attributes at path: %@, error: %@";
LABEL_25:
        _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, v24, buf, 0x16u);

      }
    }
  }
  else
  {
    v30 = v8;
    v25 = objc_msgSend(v16, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, v15, &v30);
    v20 = v30;

    if ((v25 & 1) == 0)
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_218_12520);
      v26 = (void *)_NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        v22 = v26;
        objc_msgSend(v3, "path");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v36 = v23;
        v37 = 2112;
        v38 = v20;
        v24 = "Failed to create temporary directory at path: %@, error: %@";
        goto LABEL_25;
      }
    }
  }

}

+ (void)_pruneCacheDirectory:(id)a3 toSize:(int64_t)a4
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  char v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  int64_t v43;
  __int16 v44;
  int64_t v45;
  _BYTE v46[128];
  _QWORD v47[4];

  v47[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v6 = *MEMORY[0x1E0C99998];
  v7 = *MEMORY[0x1E0C998E8];
  v47[0] = *MEMORY[0x1E0C99998];
  v47[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v5;
  v32 = v4;
  objc_msgSend(v5, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v4, v8, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v39 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v37 = 0;
        objc_msgSend(v17, "getResourceValue:forKey:error:", &v37, v6, 0);
        v18 = v37;
        objc_msgSend(v10, "insertObject:atIndex:", v17, objc_msgSend(v10, "indexOfObject:inSortedRange:options:usingComparator:", v17, 0, objc_msgSend(v10, "count"), 1024, &__block_literal_global_70));
        v19 = objc_msgSend(v18, "integerValue");

        v14 += v19;
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_218_12520);
  v20 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v43 = v14;
    v44 = 2048;
    v45 = a4;
    _os_log_impl(&dword_1A6553000, v20, OS_LOG_TYPE_DEFAULT, "Current cache size: %{iec-bytes}ld, max: %{iec-bytes}ld", buf, 0x16u);
  }
  while (v14 > a4)
  {
    objc_msgSend(v10, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    objc_msgSend(v21, "getResourceValue:forKey:error:", &v36, v6, 0);
    v22 = v36;
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_218_12520);
    v23 = (void *)_NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      objc_msgSend(v21, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v22, "longValue");
      *(_DWORD *)buf = 138412546;
      v43 = (int64_t)v25;
      v44 = 2048;
      v45 = v26;
      _os_log_impl(&dword_1A6553000, v24, OS_LOG_TYPE_DEFAULT, "Deleting file %@, size: %{iec-bytes}ld", buf, 0x16u);

    }
    v35 = 0;
    v27 = objc_msgSend(v33, "removeItemAtURL:error:", v21, &v35);
    v28 = v35;
    if ((v27 & 1) == 0)
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_218_12520);
      v29 = (void *)_NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        v30 = v29;
        objc_msgSend(v21, "path");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = (int64_t)v31;
        v44 = 2114;
        v45 = (int64_t)v28;
        _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "Failed to delete file at path: %{public}@, error: %{public}@", buf, 0x16u);

      }
    }
    objc_msgSend(v10, "removeLastObject");
    v14 -= objc_msgSend(v22, "integerValue");

  }
}

+ (int64_t)_maxCacheDirectorySize
{
  return +[NUGlobalSettings cacheNodeCacheSizeLimit](NUGlobalSettings, "cacheNodeCacheSizeLimit");
}

+ (void)clearCacheDirectory
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  +[NUGlobalSettings cacheNodeDirectoryURL](NUGlobalSettings, "cacheNodeDirectoryURL");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if (v5)
    objc_msgSend(a1, "_pruneCacheDirectory:toSize:", v6, 0);

}

uint64_t __43__NUCacheNode__pruneCacheDirectory_toSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  id v9;
  id v10;

  v10 = 0;
  v4 = *MEMORY[0x1E0C998D0];
  v5 = a3;
  objc_msgSend(a2, "getResourceValue:forKey:error:", &v10, v4, 0);
  v9 = 0;
  v6 = v10;
  objc_msgSend(v5, "getResourceValue:forKey:error:", &v9, v4, 0);

  v7 = objc_msgSend(v9, "compare:", v6);
  return v7;
}

uint64_t __32__NUCacheNode_cacheDirectoryURL__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "_pruneCacheDirectory:toSize:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "_maxCacheDirectorySize"));
}

void __32__NUCacheNode_cacheDirectoryURL__block_invoke()
{
  NSObject *v0;
  NUCoalescer *v1;
  void *v2;
  dispatch_queue_t v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("NUCacheNode.prune", v0);

  v1 = -[NUCoalescer initWithDelay:queue:]([NUCoalescer alloc], "initWithDelay:queue:", v3, 0.5);
  v2 = (void *)cacheDirectoryURL_pruneCoalescer;
  cacheDirectoryURL_pruneCoalescer = (uint64_t)v1;

}

@end
