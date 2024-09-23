@implementation NUFilterNode

- (NUFilterNode)initWithSettings:(id)a3 inputs:(id)a4
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_15891);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_15891);
      goto LABEL_8;
    }
    if (v15 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_15891);
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
  _NUAssertFailHandler((uint64_t)"-[NUFilterNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Filter.m", 30, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v29, v30, v31, v32, v28);
}

- (NUFilterNode)initWithFilterName:(id)a3 settings:(id)a4 inputs:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  NUFilterNode *v16;
  uint64_t v17;
  NSString *filterName;
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
  objc_super v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    NUAssertLogger_15856();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "filterName != nil");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v21;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_15856();
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
        v38 = v27;
        v39 = 2114;
        v40 = v31;
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
      v38 = v26;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUFilterNode initWithFilterName:settings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Filter.m", 37, CFSTR("Invalid parameter not satisfying: %s"), v32, v33, v34, v35, (uint64_t)"filterName != nil");
  }
  v11 = v10;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("__gainMapMode"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("__gainMapMode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    self->_gainMapMode = objc_msgSend(v14, "integerValue");

    v15 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, CFSTR("__gainMapMode"));

    v9 = v15;
  }
  v36.receiver = self;
  v36.super_class = (Class)NUFilterNode;
  v16 = -[NURenderNode initWithSettings:inputs:](&v36, sel_initWithSettings_inputs_, v9, v11);
  v17 = objc_msgSend(v8, "copy");
  filterName = v16->_filterName;
  v16->_filterName = (NSString *)v17;

  return v16;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  int64_t v15;
  objc_super *v16;
  void *v17;
  void *v18;
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
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  objc_super v40;
  objc_super v41;
  _QWORD v42[2];
  objc_super v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!a5)
  {
    NUAssertLogger_15856();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v25;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_15856();
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
        v45 = v31;
        v46 = 2114;
        v47 = v35;
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
      v45 = v30;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUFilterNode nodeByReplayingAgainstCache:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Filter.m", 59, CFSTR("Invalid parameter not satisfying: %s"), v36, v37, v38, v39, (uint64_t)"error != nil");
  }
  v10 = v9;
  -[NURenderNode inputs](self, "inputs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (!v12)
  {
    v13 = v10;
    if (objc_msgSend(v13, "evaluationMode") == 3)
    {
      v20 = (void *)objc_msgSend(v13, "copy");

      objc_msgSend(v20, "setEvaluationMode:", 1);
      v13 = v20;
    }
    v43.receiver = self;
    v43.super_class = (Class)NUFilterNode;
    -[NURenderNode nodeByReplayingAgainstCache:pipelineState:error:](&v43, sel_nodeByReplayingAgainstCache_pipelineState_error_, v8, v13, a5);
    goto LABEL_17;
  }
  -[NURenderNode dominantInputKey](self, "dominantInputKey");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "auxiliaryImageType");
  if (v14 != 7)
    goto LABEL_9;
  v15 = -[NUFilterNode gainMapMode](self, "gainMapMode");
  if (v15 == 3)
  {
    -[NUFilterNode filterName](self, "filterName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError unsupportedError:object:](NUError, "unsupportedError:object:", CFSTR("Gain map is disabled"), v22);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    v21 = 0;
    goto LABEL_23;
  }
  if (v15 == 2)
  {
    v18 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v18, "setAuxiliaryImageType:", 1);
    v41.receiver = self;
    v41.super_class = (Class)NUFilterNode;
    -[NURenderNode nodeByReplayingAgainstCache:pipelineState:error:](&v41, sel_nodeByReplayingAgainstCache_pipelineState_error_, v8, v18, a5);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (v15 != 1)
  {
LABEL_9:
    if (v14 == 1 || !v13)
    {
      v40.receiver = self;
      v40.super_class = (Class)NUFilterNode;
      v16 = &v40;
      goto LABEL_16;
    }
    -[NURenderNode inputForKey:](self, "inputForKey:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v17)
    {
      +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("missing dominant input"), self);
      v21 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    objc_msgSend(v17, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v10, a5);
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_20:
    v21 = (void *)v19;
LABEL_22:

    goto LABEL_23;
  }
  v42[0] = self;
  v42[1] = NUFilterNode;
  v16 = (objc_super *)v42;
LABEL_16:
  -[objc_super nodeByReplayingAgainstCache:pipelineState:error:](v16, sel_nodeByReplayingAgainstCache_pipelineState_error_, v8, v10, a5);
LABEL_17:
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v21;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  uint64_t v7;
  _QWORD *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NUFilterNode;
  -[NURenderNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v10, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (_QWORD *)v7;
  if (v7)
  {
    objc_storeStrong((id *)(v7 + 168), self->_filterName);
    v8[22] = self->_gainMapMode;
  }
  return v8;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  char v7;
  unsigned int v8;
  unint64_t v9;
  int v10;
  BOOL v11;

  v4 = a3;
  if (objc_msgSend(v4, "auxiliaryImageType") == 1 || !objc_msgSend(v4, "auxiliaryImageType"))
  {
    v9 = objc_msgSend(v4, "evaluationMode");
    v6 = v9 >= 4;
    v7 = v9 & 0xF;
    v8 = 11;
  }
  else
  {
    if (objc_msgSend(v4, "auxiliaryImageType") != 7)
    {
      v11 = 0;
      goto LABEL_9;
    }
    v5 = -[NUFilterNode gainMapMode](self, "gainMapMode");
    v6 = v5 >= 4;
    v7 = v5 & 0xF;
    v8 = 6;
  }
  v10 = (v8 >> v7) & 1;
  if (v6)
    v11 = 0;
  else
    v11 = v10;
LABEL_9:

  return v11;
}

- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3
{
  objc_super v6;

  if (a3 == 7 && -[NUFilterNode gainMapMode](self, "gainMapMode"))
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)NUFilterNode;
  return -[NURenderNode canPropagateOriginalAuxiliaryData:](&v6, sel_canPropagateOriginalAuxiliaryData_, a3);
}

- (id)_evaluateAuxiliaryImageForType:(int64_t)a3 error:(id *)a4
{
  __CFString *v7;
  objc_super v9;

  if (a3 == 7 && -[NUFilterNode gainMapMode](self, "gainMapMode"))
  {
    v7 = CFSTR("HDRGainMap");
    +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("Filter node cannot propagate original auxiliary data"), CFSTR("HDRGainMap"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    return 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NUFilterNode;
    -[NURenderNode _evaluateAuxiliaryImageForType:error:](&v9, sel__evaluateAuxiliaryImageForType_error_, a3, a4);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)isGeometryNode
{
  void *v2;
  uint64_t v3;

  -[NURenderNode inputs](self, "inputs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3 != 1;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGSize v17;
  uint64_t v18;
  NUImageGeometry *v19;
  NUImageGeometry *v20;
  uint64_t v21;
  CGRect v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v26;
  _OWORD v27[2];
  CGRect v28;
  CGRect v29;

  v26.receiver = self;
  v26.super_class = (Class)NUFilterNode;
  -[NURenderNode _evaluateImageGeometry:](&v26, sel__evaluateImageGeometry_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "extent");
    if (v24)
      v7 = v25 == 0;
    else
      v7 = 1;
    if (v7)
    {
      v8 = objc_msgSend(v6, "renderScale");
      v10 = v9;
      -[NURenderNode outputImage:](self, "outputImage:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "extent");
        x = v29.origin.x;
        y = v29.origin.y;
        width = v29.size.width;
        height = v29.size.height;
        if (CGRectIsInfinite(v29))
        {
          v17 = *(CGSize *)(MEMORY[0x1E0C9D5E0] + 16);
          v28.origin = (CGPoint)*MEMORY[0x1E0C9D5E0];
          v28.size = v17;
          v18 = 3;
        }
        else
        {
          v28.origin.x = x;
          v28.origin.y = y;
          v28.size.width = width;
          v28.size.height = height;
          v18 = 0;
        }
        NU::RectT<long>::RectT(v27, &v28, v18);
        v23.origin = (CGPoint)v27[0];
        v23.size = (CGSize)v27[1];
        v20 = [NUImageGeometry alloc];
        v21 = objc_msgSend(v6, "orientation");
        v28 = v23;
        v19 = -[NUImageGeometry initWithExtent:renderScale:orientation:](v20, "initWithExtent:renderScale:orientation:", &v28, v8, v10, v21);
      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = v6;
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)_evaluateImageProperties:(id *)a3
{
  void *v4;
  _NUImageProperties *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUFilterNode;
  -[NURenderNode _evaluateImageProperties:](&v7, sel__evaluateImageProperties_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && -[NUFilterNode gainMapMode](self, "gainMapMode") == 3)
  {
    v5 = -[_NUImageProperties initWithProperties:]([_NUImageProperties alloc], "initWithProperties:", v4);
    -[_NUImageProperties setAuxiliaryImageProperties:forType:](v5, "setAuxiliaryImageProperties:forType:", 0, 7);

    v4 = v5;
  }
  return v4;
}

- (id)_evaluateImage:(id *)a3
{
  void *v5;
  NSString *filterName;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
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
  id *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_15856();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v22;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_15856();
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
        v45 = v28;
        v46 = 2114;
        v47 = v32;
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
      v45 = v27;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUFilterNode _evaluateImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Filter.m", 233, CFSTR("Invalid parameter not satisfying: %s"), v33, v34, v35, v36, (uint64_t)"error != NULL");
  }
  v5 = (void *)MEMORY[0x1E0C9DDB8];
  filterName = self->_filterName;
  -[NURenderNode settings](self, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filterWithName:withInputParameters:", filterName, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = a3;

  if (!v8)
  {
    +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 1, CFSTR("Cannot create filter with name"), self->_filterName);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return 0;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[NURenderNode inputs](self, "inputs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v40 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        -[NURenderNode inputForKey:](self, "inputForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0;
        objc_msgSend(v14, "outputImage:", &v38);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v38;
        if (!v15)
        {
          +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 2, CFSTR("Cannot evaluate input"), v14, v16);
          *v37 = (id)objc_claimAutoreleasedReturnValue();

          return 0;
        }
        objc_msgSend(v8, "setValue:forKey:", v15, v13);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v10)
        continue;
      break;
    }
  }

  objc_msgSend(v8, "outputImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("Filter produced a nil output image"), v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to produce valid output image for CIFilter"), v8, v18);
    v19 = 0;
    *v37 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("Output image is not a CIImage"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  v18 = 0;
  v19 = v17;
LABEL_19:

  return v19;
}

- (id)debugQuickLookObject
{
  void *v3;
  objc_super v5;
  uint64_t v6;

  if (-[NURenderNode isCached](self, "isCached"))
  {
    v5.receiver = self;
    v5.super_class = (Class)NUFilterNode;
    -[NURenderNode debugQuickLookObject](&v5, sel_debugQuickLookObject);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
    -[NUFilterNode _evaluateImage:](self, "_evaluateImage:", &v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)isEqualToRenderNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int64_t v8;
  BOOL v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NUFilterNode;
  if (-[NURenderNode isEqualToRenderNode:](&v11, sel_isEqualToRenderNode_, v4)
    && (-[NUFilterNode filterName](self, "filterName"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "filterName"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "isEqualToString:", v6),
        v6,
        v5,
        v7))
  {
    v8 = -[NUFilterNode gainMapMode](self, "gainMapMode");
    v9 = v8 == objc_msgSend(v4, "gainMapMode");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NUFilterNode;
  v3 = 0x2312EF99DDCBC5 * -[NURenderNode hash](&v5, sel_hash);
  return (0x41359F86079F7 * -[NSString hash](self->_filterName, "hash")) ^ v3;
}

- (id)descriptionSubClassHook
{
  NSString *v3;
  int64_t v4;
  NSString *v5;
  NSString *v6;

  v3 = self->_filterName;
  v4 = -[NUFilterNode gainMapMode](self, "gainMapMode");
  if ((unint64_t)(v4 - 1) >= 3)
  {
    v5 = v3;
  }
  else
  {
    -[NSString stringByAppendingFormat:](v3, "stringByAppendingFormat:", CFSTR("[gm:%@]"), off_1E5062930[v4 - 1]);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)aliasDescription
{
  return self->_filterName;
}

- (void)nu_updateDigest:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NUFilterNode;
  v4 = a3;
  -[NURenderNode nu_updateDigest:](&v5, sel_nu_updateDigest_, v4);
  objc_msgSend(v4, "addCString:", "filterName", v5.receiver, v5.super_class);
  objc_msgSend(v4, "addString:", self->_filterName);
  objc_msgSend(v4, "addCString:", "gainMapMode");
  objc_msgSend(v4, "addBytes:length:", &self->_gainMapMode, 8);

}

- (BOOL)requiresVideoComposition
{
  return 1;
}

- (NSString)filterName
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (int64_t)gainMapMode
{
  return self->_gainMapMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterName, 0);
}

@end
