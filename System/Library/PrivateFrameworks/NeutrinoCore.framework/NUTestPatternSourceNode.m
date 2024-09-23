@implementation NUTestPatternSourceNode

- (NUTestPatternSourceNode)initWithSize:(id)a3 orientation:(int64_t)a4
{
  return -[NUTestPatternSourceNode initWithSize:orientation:scale:](self, "initWithSize:orientation:scale:", a3.var0, a3.var1, a4, NUScaleOne);
}

- (NUTestPatternSourceNode)initWithSize:(id)a3 orientation:(int64_t)a4 scale:(id)a5
{
  int64_t var1;
  int64_t var0;
  int64_t v7;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NUTestPatternSourceNode *v17;
  uint64_t v18;
  NUColorSpace *colorSpace;
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
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int64_t v69;
  int64_t v70;
  void *v71;
  int64_t v72;
  objc_super v73;
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[3];
  _QWORD v77[3];
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a4 - 1) >= 8)
  {
    NUAssertLogger_11084();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "NUOrientationIsValid(orientation)");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v22;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_11084();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v43 = (void *)MEMORY[0x1E0CB3978];
        v44 = v42;
        objc_msgSend(v43, "callStackSymbols");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v79 = v42;
        v80 = 2114;
        v81 = v46;
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
      v79 = v27;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUTestPatternSourceNode initWithSize:orientation:scale:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Test.m", 100, CFSTR("Invalid parameter not satisfying: %s"), v47, v48, v49, v50, (uint64_t)"NUOrientationIsValid(orientation)");
  }
  if (!a3.var0 || (var1 = a3.var1) == 0)
  {
    NUAssertLogger_11084();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "!NUPixelSizeIsEmpty(size)");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v29;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_11084();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        v51 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v52 = (void *)MEMORY[0x1E0CB3978];
        v53 = v51;
        objc_msgSend(v52, "callStackSymbols");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "componentsJoinedByString:", CFSTR("\n"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v79 = v51;
        v80 = 2114;
        v81 = v55;
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
      v79 = v34;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUTestPatternSourceNode initWithSize:orientation:scale:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Test.m", 101, CFSTR("Invalid parameter not satisfying: %s"), v56, v57, v58, v59, (uint64_t)"!NUPixelSizeIsEmpty(size)");
  }
  var0 = a5.var0;
  if (a5.var0 < 1 || (v7 = a5.var1, a5.var1 <= 0))
  {
    NUAssertLogger_11084();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "NUScaleIsValid(scale)");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v36;
      _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_11084();
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
    if (v37)
    {
      if (v39)
      {
        v60 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v61 = (void *)MEMORY[0x1E0CB3978];
        v62 = v60;
        objc_msgSend(v61, "callStackSymbols");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "componentsJoinedByString:", CFSTR("\n"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v79 = v60;
        v80 = 2114;
        v81 = v64;
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
      v79 = v41;
      _os_log_error_impl(&dword_1A6553000, v38, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUTestPatternSourceNode initWithSize:orientation:scale:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Test.m", 102, CFSTR("Invalid parameter not satisfying: %s"), v65, v66, v67, v68, (uint64_t)"NUScaleIsValid(scale)");
  }
  v76[0] = CFSTR("size");
  v72 = a3.var0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v71;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", var1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v75[1] = v10;
  v70 = var1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = v11;
  v76[1] = CFSTR("orientation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v77[1] = v12;
  v76[2] = CFSTR("scale");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", var0);
  v69 = var0;
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v77[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v73.receiver = self;
  v73.super_class = (Class)NUTestPatternSourceNode;
  v17 = -[NUSourceNode initWithSettings:](&v73, sel_initWithSettings_, v16);

  v17->_size.width = v72;
  v17->_size.height = v70;
  v17->_orientation = a4;
  v17->_scale.numerator = v69;
  v17->_scale.denominator = v7;
  +[NUColorSpace sRGBLinearColorSpace](NUColorSpace, "sRGBLinearColorSpace");
  v18 = objc_claimAutoreleasedReturnValue();
  colorSpace = v17->_colorSpace;
  v17->_colorSpace = (NUColorSpace *)v18;

  return v17;
}

- (NUTestPatternSourceNode)initWithSettings:(id)a3
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11098);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_11098);
      goto LABEL_8;
    }
    if (v12 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11098);
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
  _NUAssertFailHandler((uint64_t)"-[NUTestPatternSourceNode initWithSettings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Test.m", 116, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v26, v27, v28, v29, v25);
}

- (int64_t)sourceOrientation
{
  return self->_orientation;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)pixelSizeWithSourceOptions:(id)a3
{
  $5BB7312FFE32F1AB3F1F5957C99A58B3 *p_size;
  int64_t width;
  int64_t height;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  p_size = &self->_size;
  width = self->_size.width;
  height = p_size->height;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (id)preparedNodeWithSourceContainer:(id)a3 pipelineState:(id)a4 pipelineSettings:(id)a5 sourceSettings:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;

  v10 = a4;
  v11 = a6;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("__addTags"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if (v13)
  {
    objc_msgSend(v10, "currentGroup");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v14, "addTag:forNode:", CFSTR("__SourceOrigin"), self);

  }
  -[NUSourceNode _addOrientationNode:sourceSettings:error:](self, "_addOrientationNode:sourceSettings:error:", self, v11, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 *p_size;
  int64_t orientation;
  uint64_t v17;
  uint64_t v18;
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
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!a6)
  {
    NUAssertLogger_11084();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v22;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_11084();
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
        v38 = v28;
        v39 = 2114;
        v40 = v32;
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
      v38 = v27;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUTestPatternSourceNode resolvedNodeWithCachedInputs:settings:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Test.m", 146, CFSTR("Invalid parameter not satisfying: %s"), v33, v34, v35, v36, (uint64_t)"error != nil");
  }
  v13 = v12;
  if (-[NUTestPatternSourceNode supportsPipelineState:error:](self, "supportsPipelineState:error:", v12, a6))
  {
    v14 = objc_alloc((Class)objc_opt_class());
    p_size = &self->_size;
    orientation = self->_orientation;
    v17 = objc_msgSend(v13, "scale");
    v19 = (void *)objc_msgSend(v14, "initWithSize:orientation:scale:", p_size->width, p_size->height, orientation, v17, v18);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)_evaluateImageGeometryWithSourceOptions:(id)a3 error:(id *)a4
{
  NUImageGeometry *v5;
  _QWORD v7[2];
  $5BB7312FFE32F1AB3F1F5957C99A58B3 size;

  v5 = [NUImageGeometry alloc];
  v7[0] = 0;
  v7[1] = 0;
  size = self->_size;
  return -[NUImageGeometry initWithExtent:renderScale:orientation:](v5, "initWithExtent:renderScale:orientation:", v7, self->_scale.numerator, self->_scale.denominator, self->_orientation);
}

- (id)_evaluateImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4
{
  id v6;
  _NUImageProperties *v7;
  uint64_t v8;
  uint64_t v9;
  NUTestPatternAuxiliaryProperties *v10;

  v6 = a3;
  if (-[NUSourceNode load:](self, "load:", a4))
  {
    v7 = objc_alloc_init(_NUImageProperties);
    -[_NUImageProperties setMetadata:](v7, "setMetadata:", MEMORY[0x1E0C9AA70]);
    -[_NUImageProperties setColorSpace:](v7, "setColorSpace:", self->_colorSpace);
    v8 = -[NUTestPatternSourceNode pixelSizeWithSourceOptions:](self, "pixelSizeWithSourceOptions:", v6);
    -[_NUImageProperties setSize:](v7, "setSize:", v8, v9);
    -[_NUImageProperties setOrientation:](v7, "setOrientation:", -[NUTestPatternSourceNode sourceOrientation](self, "sourceOrientation"));
    -[_NUImageProperties setAlphaInfo:](v7, "setAlphaInfo:", 2);
    -[_NUImageProperties setComponentInfo:](v7, "setComponentInfo:", 0);
    v10 = objc_alloc_init(NUTestPatternAuxiliaryProperties);
    -[NUTestPatternAuxiliaryProperties setSize:](v10, "setSize:", self->_size.width, self->_size.height);
    -[NUTestPatternAuxiliaryProperties setAuxiliaryImageTypeCGIdentifier:](v10, "setAuxiliaryImageTypeCGIdentifier:", *MEMORY[0x1E0CBC708]);
    -[_NUImageProperties setAuxiliaryImageProperties:forType:](v7, "setAuxiliaryImageProperties:forType:", v10, 2);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_evaluateImage:(id *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NUTestPatternImage *v10;
  uint64_t v11;
  CGColorSpace *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  -[NURenderNode outputImageGeometry:](self, "outputImageGeometry:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "scaledSize");
    v8 = v7;
    v9 = objc_alloc(MEMORY[0x1E0C9DDC8]);
    v10 = objc_alloc_init(NUTestPatternImage);
    v11 = *MEMORY[0x1E0C9DFF8];
    v12 = -[NUColorSpace CGColorSpace](self->_colorSpace, "CGColorSpace");
    v18[0] = CFSTR("width");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = CFSTR("height");
    v19[0] = v13;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v9, "initWithImageProvider:size::format:colorSpace:options:", v10, v6, v8, v11, v12, v15);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
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
  v8 = a3;
  if (!a4)
  {
    NUAssertLogger_11084();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "subsampleFactor != NULL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_11084();
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
    _NUAssertFailHandler((uint64_t)"-[NUTestPatternSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Test.m", 211, CFSTR("Invalid parameter not satisfying: %s"), v24, v25, v26, v27, (uint64_t)"subsampleFactor != NULL");
  }
  v9 = v8;
  *a4 = 1;
  -[NUTestPatternSourceNode _evaluateImage:](self, "_evaluateImage:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "evaluationMode");
  return (v3 < 4) & (0xBu >> (v3 & 0xF));
}

- (BOOL)supportsPipelineState:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  BOOL v9;
  __CFString *v10;
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
  v5 = a3;
  if (!a4)
  {
    NUAssertLogger_11084();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_11084();
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
    _NUAssertFailHandler((uint64_t)"-[NUTestPatternSourceNode supportsPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Test.m", 233, CFSTR("Invalid parameter not satisfying: %s"), v24, v25, v26, v27, (uint64_t)"error != NULL");
  }
  v6 = v5;
  if ((unint64_t)(objc_msgSend(v5, "auxiliaryImageType") - 2) > 0xA)
  {
    if (objc_msgSend(v6, "mediaComponentType") == 1)
    {
      v9 = 1;
    }
    else
    {
      +[NUError mismatchError:object:](NUError, "mismatchError:object:", CFSTR("expected an image mediaComponentType"), v6);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = objc_msgSend(v6, "auxiliaryImageType");
    if (v7 > 0xC)
      v8 = CFSTR("Invalid");
    else
      v8 = off_1E5060F88[v7];
    v10 = v8;
    +[NUError unsupportedError:object:](NUError, "unsupportedError:object:", CFSTR("Auxiliary image type is not supported"), v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorSpace, 0);
}

@end
