@implementation NUHDRGainMapHeadroomNode

- (NUHDRGainMapHeadroomNode)initWithSettings:(id)a3 inputs:(id)a4
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_195_8777);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_195_8777);
      goto LABEL_8;
    }
    if (v15 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_195_8777);
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
  _NUAssertFailHandler((uint64_t)"-[NUHDRGainMapHeadroomNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUHDRGainMapNode.m", 820, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v29, v30, v31, v32, v28);
}

- (NUHDRGainMapHeadroomNode)initWithInput:(id)a3 settings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  NUHDRGainMapHeadroomNode *v15;
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
  objc_super v33;
  uint64_t v34;
  id v35;
  const __CFString *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    NUAssertLogger_8789();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "input != nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_8789();
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
        v39 = v24;
        v40 = 2114;
        v41 = v28;
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
      v39 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUHDRGainMapHeadroomNode initWithInput:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUHDRGainMapNode.m", 824, CFSTR("Invalid parameter not satisfying: %s"), v29, v30, v31, v32, (uint64_t)"input != nil");
  }
  v8 = v7;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("headroomOffset"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  v36 = CFSTR("headroomOffset");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = *MEMORY[0x1E0C9E1F8];
  v35 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33.receiver = self;
  v33.super_class = (Class)NUHDRGainMapHeadroomNode;
  v15 = -[NURenderNode initWithSettings:inputs:](&v33, sel_initWithSettings_inputs_, v13, v14);

  return v15;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "evaluationMode") == 1 && objc_msgSend(v3, "auxiliaryImageType") == 1;

  return v4;
}

- (id)inputNode
{
  void *v2;
  void *v3;

  -[NURenderNode inputs](self, "inputs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1F8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)headroomOffset
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NURenderNode settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("headroomOffset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (id)_evaluateImageProperties:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  id v12;

  -[NUHDRGainMapHeadroomNode inputNode](self, "inputNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageProperties:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  if (v7)
  {
    v8 = (void *)objc_opt_class();
    objc_msgSend(v7, "gainMapHeadroom");
    v10 = v9;
    -[NUHDRGainMapHeadroomNode headroomOffset](self, "headroomOffset");
    objc_msgSend(v8, "_updateContentHeadroom:withOffset:", v10, v11);
    objc_msgSend(v7, "setGainMapHeadroom:");
    v12 = v7;
  }

  return v7;
}

- (id)_evaluateAuxiliaryImageForType:(int64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  const CGImageMetadata *v8;
  CGMutableImageMetadataRef MutableCopy;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NUHDRGainMapHeadroomNode;
  -[NURenderNode _evaluateAuxiliaryImageForType:error:](&v16, sel__evaluateAuxiliaryImageForType_error_, a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (a3 == 7)
    {
      v8 = (const CGImageMetadata *)objc_msgSend(v6, "metadata");
      v15 = 0x3FF0000000000000;
      if (+[_NUImageProperties getGainMapHeadroom:fromMetadata:](_NUImageProperties, "getGainMapHeadroom:fromMetadata:", &v15, v8))
      {
        MutableCopy = CGImageMetadataCreateMutableCopy(v8);
        +[_NUImageProperties getGainMapHeadroom:fromMetadata:](_NUImageProperties, "getGainMapHeadroom:fromMetadata:", &v15, v8);
        v10 = (void *)objc_opt_class();
        v11 = *(double *)&v15;
        -[NUHDRGainMapHeadroomNode headroomOffset](self, "headroomOffset");
        objc_msgSend(v10, "_updateContentHeadroom:withOffset:", v11, v12);
        +[_NUImageProperties setGainMapHeadroom:toMetadata:](_NUImageProperties, "setGainMapHeadroom:toMetadata:", MutableCopy);
        objc_msgSend(v7, "auxiliaryImageByUpdatingMetadata:", MutableCopy);
        v13 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v13;
      }
    }
  }
  return v7;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUHDRGainMapHeadroomNode;
  -[NURenderNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v7, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_evaluateImage:(id *)a3
{
  void *v4;
  void *v5;

  -[NUHDRGainMapHeadroomNode inputNode](self, "inputNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputImage:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (double)_updateContentHeadroom:(double)a3 withOffset:(double)a4
{
  double v5;
  double v6;

  v5 = a3;
  if (a4 >= 0.0)
  {
    if (a4 > 0.0)
    {
      +[NUGlobalSettings maxGainMapHeadroom](NUGlobalSettings, "maxGainMapHeadroom");
      return v5 + a4 * (v6 - v5);
    }
  }
  else if (a3 + a4 * (a3 + -1.0) >= 1.0)
  {
    return a3 + a4 * (a3 + -1.0);
  }
  else
  {
    return 1.0;
  }
  return v5;
}

@end
