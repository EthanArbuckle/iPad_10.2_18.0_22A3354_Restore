@implementation NUSourceNode

- (NUSourceNode)initWithSettings:(id)a3
{
  NUSourceNode *v3;
  NUDefaultSourceDerivation *v4;
  NUSourceDerivation *sourceDerivation;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUSourceNode;
  v3 = -[NURenderNode initWithSettings:inputs:](&v7, sel_initWithSettings_inputs_, a3, MEMORY[0x1E0C9AA70]);
  v4 = objc_alloc_init(NUDefaultSourceDerivation);
  sourceDerivation = v3->_sourceDerivation;
  v3->_sourceDerivation = (NUSourceDerivation *)v4;

  return v3;
}

- (BOOL)isGeometryNode
{
  return 1;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)pixelSizeWithSourceOptions:(id)a3
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_6563);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_6563);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_6563);
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
  _NUAssertFailHandler((uint64_t)"-[NUSourceNode pixelSizeWithSourceOptions:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 651, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v24, v25, v26, v27, v23);
}

- (BOOL)isValid:(id *)a3
{
  _BOOL4 v5;
  uint64_t v6;
  BOOL v7;
  id v8;
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
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_6578();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v10;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_6578();
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
        v27 = v16;
        v28 = 2114;
        v29 = v20;
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
      v27 = v15;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceNode isValid:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 656, CFSTR("Invalid parameter not satisfying: %s"), v21, v22, v23, v24, (uint64_t)"error != nil");
  }
  v5 = -[NUSourceNode load:](self, "load:");
  if (v5)
  {
    if (-[NUSourceNode pixelSizeWithSourceOptions:](self, "pixelSizeWithSourceOptions:", MEMORY[0x1E0C9AA70]))
      v7 = v6 == 0;
    else
      v7 = 1;
    if (v7)
    {
      +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("Invalid size"), self);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = 0;
      *a3 = v8;
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)load:(id *)a3
{
  return 1;
}

- (int64_t)sourceOrientation
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_6563);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_6563);
      goto LABEL_8;
    }
    if (v8 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_6563);
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
  _NUAssertFailHandler((uint64_t)"-[NUSourceNode sourceOrientation]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 679, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v22, v23, v24, v25, v21);
}

- (int64_t)auxiliaryImageType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NURenderNode settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("auxiliaryImageType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = NUAuxiliaryImageTypeFromString(v3);

  return v4;
}

- (NSString)auxiliaryImageTypeString
{
  void *v2;
  void *v3;

  -[NURenderNode settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("auxiliaryImageType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)normalizeSubsampleFactor:(int64_t)a3
{
  return a3;
}

- (id)sourceOptionsForSettings:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)pipelineOptionsForPipelineState:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)_addResampleNode:(id)a3 subsampleNode:(id)a4
{
  id v5;
  id v6;
  NUResampleNode *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[NUResampleNode initWithPreparedInput:subsampleNode:]([NUResampleNode alloc], "initWithPreparedInput:subsampleNode:", v6, v5);

  return v7;
}

- (id)_addScaleNode:(id)a3 pipelineState:(id)a4 pipelineSettings:(id)a5 sourceSettings:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  NUNativeScaleNode *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NUScaleNode *v22;
  NUNativeScaleNode *v23;
  NSObject *v25;
  void *v26;
  void *specific;
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
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("nativeScale"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if (v14)
  {
    v15 = -[NUNativeScaleNode initWithInput:]([NUNativeScaleNode alloc], "initWithInput:", v9);
  }
  else
  {
    v16 = objc_msgSend(v10, "sampleMode");
    v18 = *((_QWORD *)&NUScaleUnknown + 1);
    v17 = NUScaleUnknown;
    v41 = NUScaleUnknown;
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("scale"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      if (objc_msgSend(v10, "scale") < 1 || v20 <= 0)
      {
        NUAssertLogger_6578();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid pipelineState scale when applying override: %@"), v11);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v43 = v26;
          _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

        }
        specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        NUAssertLogger_6578();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
        if (specific)
        {
          if (v29)
          {
            v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v33 = (void *)MEMORY[0x1E0CB3978];
            v34 = v32;
            objc_msgSend(v33, "callStackSymbols");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v43 = v32;
            v44 = 2114;
            v45 = v36;
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
          v43 = v31;
          _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

        }
        _NUAssertFailHandler((uint64_t)"-[NUSourceNode _addScaleNode:pipelineState:pipelineSettings:sourceSettings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 733, CFSTR("Invalid pipelineState scale when applying override: %@"), v37, v38, v39, v40, (uint64_t)v11);
      }
      v17 = objc_msgSend(v10, "scale");
      v18 = v21;
      +[NUSubsampleNode subsampleFactorForScale:additionalScale:](NUSubsampleNode, "subsampleFactorForScale:additionalScale:", v17, v21, &v41);
    }
    v22 = [NUScaleNode alloc];
    v15 = -[NUScaleNode initWithTargetScale:effectiveScale:sampleMode:input:](v22, "initWithTargetScale:effectiveScale:sampleMode:input:", v17, v18, v41, v16, v9);
  }
  v23 = v15;

  return v23;
}

- (id)_addOrientationNode:(id)a3 sourceSettings:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  int64_t v12;
  NUSourceOrientationNode *v13;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("skipOrientation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  v12 = +[NUSourceOrientationNode originalOrientationToApplyToSource:skipOrientation:error:](NUSourceOrientationNode, "originalOrientationToApplyToSource:skipOrientation:error:", self, v11, a5);
  if ((unint64_t)(v12 - 1) > 7)
    v13 = 0;
  else
    v13 = -[NUSourceOrientationNode initWithInput:source:settings:orientation:]([NUSourceOrientationNode alloc], "initWithInput:source:settings:orientation:", v8, self, v9, v12);

  return v13;
}

- (id)_addStyleReverseNode:(id)a3 pipelineState:(id)a4 sourceSettings:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  int v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  void *v21;
  __objc2_class *v22;
  id v23;
  void *v24;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(a4, "mediaComponentType");
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("revertToOriginalStyle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = objc_msgSend(v11, "BOOLValue");
  if ((_DWORD)v9)
  {
    v12 = +[NUGlobalSettings shouldRevertStyledOriginalIfPossible](NUGlobalSettings, "shouldRevertStyledOriginalIfPossible");
    if (v10 == 1)
    {
      v13 = v12;
      v26 = 0;
      -[NURenderNode imageProperties:](self, "imageProperties:", &v26);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v26;
      if (!v14)
      {
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_252);
        v16 = _NULogger;
        if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v15;
          _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "*** failed to load image properties: %@", buf, 0xCu);
        }
      }
      objc_msgSend(v14, "rawProperties");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = 0;
      }
      else
      {
        objc_msgSend(v14, "auxiliaryImagePropertiesForType:", 10);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v14, "auxiliaryImagePropertiesForType:", 12);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v21 != 0;

        }
        else
        {
          v18 = 1;
          v13 = 1;
        }
      }

      if (!v13)
        goto LABEL_18;
    }
    else
    {
      v18 = 1;
    }
    if (v18)
    {
      v22 = NUStyleTransferReverseNode;
LABEL_19:
      v23 = [v22 alloc];
      v19 = (id)objc_msgSend(v23, "initWithInput:settings:", v8, MEMORY[0x1E0C9AA70]);
      goto LABEL_20;
    }
LABEL_18:
    v22 = NUStyleTransferOriginalNode;
    goto LABEL_19;
  }
  v19 = v8;
LABEL_20:
  v24 = v19;

  return v24;
}

- (BOOL)supportsPipelineState:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)preparedNodeWithSourceContainer:(id)a3 pipelineState:(id)a4 pipelineSettings:(id)a5 sourceSettings:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  NUSubsampleNode *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v29;
  void *v30;
  void *specific;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!a7)
  {
    NUAssertLogger_6578();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v30;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_6578();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        v50 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v51 = (void *)MEMORY[0x1E0CB3978];
        v52 = v50;
        objc_msgSend(v51, "callStackSymbols");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "componentsJoinedByString:", CFSTR("\n"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v79 = v50;
        v80 = 2114;
        v81 = v54;
        _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v33)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v35;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceNode preparedNodeWithSourceContainer:pipelineState:pipelineSettings:sourceSettings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 819, CFSTR("Invalid parameter not satisfying: %s"), v55, v56, v57, v58, (uint64_t)"error != nil");
  }
  if (!v13)
  {
    NUAssertLogger_6578();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "pipelineState != nil");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v37;
      _os_log_error_impl(&dword_1A6553000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_6578();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    if (v38)
    {
      if (v40)
      {
        v59 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v60 = (void *)MEMORY[0x1E0CB3978];
        v61 = v59;
        objc_msgSend(v60, "callStackSymbols");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "componentsJoinedByString:", CFSTR("\n"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v79 = v59;
        v80 = 2114;
        v81 = v63;
        _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v40)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v42;
      _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceNode preparedNodeWithSourceContainer:pipelineState:pipelineSettings:sourceSettings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 820, CFSTR("Invalid parameter not satisfying: %s"), v64, v65, v66, v67, (uint64_t)"pipelineState != nil");
  }
  if (!v12)
  {
    NUAssertLogger_6578();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "sourceContainer != nil");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v44;
      _os_log_error_impl(&dword_1A6553000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_6578();
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
    if (v45)
    {
      if (v47)
      {
        v68 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v69 = (void *)MEMORY[0x1E0CB3978];
        v70 = v68;
        objc_msgSend(v69, "callStackSymbols");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "componentsJoinedByString:", CFSTR("\n"));
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v79 = v68;
        v80 = 2114;
        v81 = v72;
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
      v79 = v49;
      _os_log_error_impl(&dword_1A6553000, v46, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceNode preparedNodeWithSourceContainer:pipelineState:pipelineSettings:sourceSettings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 821, CFSTR("Invalid parameter not satisfying: %s"), v73, v74, v75, v76, (uint64_t)"sourceContainer != nil");
  }
  v16 = v15;
  if (-[NUSourceNode load:](self, "load:", a7))
  {
    -[NUSourceNode originalNode](self, "originalNode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && !objc_msgSend(v17, "load:", a7)
      || !-[NUSourceNode supportsPipelineState:error:](self, "supportsPipelineState:error:", v13, a7))
    {
      v27 = 0;
    }
    else
    {
      -[NUSourceNode sourceOptionsForSettings:error:](self, "sourceOptionsForSettings:error:", v16, a7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("__addTags"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "BOOLValue");

        if (v20)
        {
          objc_msgSend(v13, "currentGroup");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (id)objc_msgSend(v21, "addTag:forNode:", CFSTR("__SourceOrigin"), self);

        }
        v23 = -[NUSubsampleNode initWithPreparedSource:container:pipelineSettings:sourceOptions:]([NUSubsampleNode alloc], "initWithPreparedSource:container:pipelineSettings:sourceOptions:", self, v12, v14, v18);
        -[NUSourceNode _addResampleNode:subsampleNode:](self, "_addResampleNode:subsampleNode:", v23, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NUSourceNode _addStyleReverseNode:pipelineState:sourceSettings:](self, "_addStyleReverseNode:pipelineState:sourceSettings:", v24, v13, v16);
        v77 = v18;
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        -[NUSourceNode _addScaleNode:pipelineState:pipelineSettings:sourceSettings:](self, "_addScaleNode:pipelineState:pipelineSettings:sourceSettings:", v25, v13, v14, v16);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = v77;
        -[NUSourceNode preparedNodeWithSourceNode:sourceSettings:pipelineState:error:](self, "preparedNodeWithSourceNode:sourceSettings:pipelineState:error:", v26, v16, v13, a7);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v27 = 0;
      }

    }
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)preparedNodeWithSourceNode:(id)a3 sourceSettings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  return -[NUSourceNode _addOrientationNode:sourceSettings:error:](self, "_addOrientationNode:sourceSettings:error:", a3, a4, a6);
}

- (id)_evaluateImageGeometryWithSourceOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NUImageGeometry *v36;
  NUImageGeometry *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NUImageGeometry *v41;
  int64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v6 = a3;
  -[NUSourceNode originalNode](self, "originalNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "outputImageGeometry:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      v11 = objc_msgSend(v9, "orientation");
      -[NUSourceNode sourceDerivation](self, "sourceDerivation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "orientationFromOriginal:derivativeOrientation:", v11, -[NUSourceNode sourceOrientation](self, "sourceOrientation"));

      v14 = 6;
      if (v13 != 8)
        v14 = v13;
      if (v13 == 6)
        v15 = 8;
      else
        v15 = v14;
      v16 = NUOrientationConcat(v11, v15);
      objc_msgSend(v10, "extent");
      v44 = NUOrientationTransformImageSize(v16, v45, v46);
      v18 = v17;
      v19 = objc_msgSend(v10, "scaledSize");
      v21 = NUOrientationTransformImageSize(v16, v19, v20);
      v23 = v22;
      v24 = -[NUSourceNode pixelSizeWithSourceOptions:](self, "pixelSizeWithSourceOptions:", v6);
      v26 = v25;
      -[NUSourceNode sourceDerivation](self, "sourceDerivation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "scaleFromOriginalSize:derivativeSize:", v21, v23, v24, v26);
      v30 = v29;

      v31 = objc_msgSend(v10, "renderScale");
      v33 = NUScaleMultiply(v31, v32, v28, v30);
      v35 = v34;
      v36 = [NUImageGeometry alloc];
      v47 = 0;
      v48 = 0;
      v49 = v44;
      v50 = v18;
      v37 = -[NUImageGeometry initWithExtent:renderScale:orientation:](v36, "initWithExtent:renderScale:orientation:", &v47, v33, v35, v13);

    }
    else
    {
      v37 = 0;
    }
  }
  else
  {
    v38 = -[NUSourceNode pixelSizeWithSourceOptions:](self, "pixelSizeWithSourceOptions:", v6);
    v40 = v39;
    v41 = [NUImageGeometry alloc];
    v42 = -[NUSourceNode sourceOrientation](self, "sourceOrientation");
    v47 = 0;
    v48 = 0;
    v49 = v38;
    v50 = v40;
    v37 = -[NUImageGeometry initWithExtent:renderScale:orientation:](v41, "initWithExtent:renderScale:orientation:", &v47, NUScaleOne, v42);
  }

  return v37;
}

- (id)_evaluateGeometrySpaceMap:(id *)a3
{
  NUGeometrySpaceMap *v4;
  NUSpace *v5;
  void *v6;

  v4 = objc_alloc_init(NUGeometrySpaceMap);
  v5 = objc_alloc_init(NUSpace);
  -[NURenderNode spaceMapKey](self, "spaceMapKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUGeometrySpaceMap setSpace:forKey:](v4, "setSpace:forKey:", v5, v6);

  return v4;
}

- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5
{
  id v6;
  void *v7;
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
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a5)
  {
    NUAssertLogger_6578();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v10;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_6578();
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
        v26 = v16;
        v27 = 2114;
        v28 = v20;
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
      v26 = v15;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 938, CFSTR("Invalid parameter not satisfying: %s"), v21, v22, v23, v24, (uint64_t)"error != nil");
  }
  v7 = v6;
  +[NUError unsupportedError:object:](NUError, "unsupportedError:object:", CFSTR("_evaluateImageWithSourceOptions not implemented"), objc_opt_class());
  *a5 = (id)objc_claimAutoreleasedReturnValue();

  return 0;
}

- (id)_evaluateImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v8;
  void *v9;
  void *specific;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!a4)
  {
    NUAssertLogger_6578();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v9;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_6578();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v16 = (void *)MEMORY[0x1E0CB3978];
        v17 = v15;
        objc_msgSend(v16, "callStackSymbols");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v15;
        v26 = 2114;
        v27 = v19;
        _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v14;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceNode _evaluateImagePropertiesWithSourceOptions:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 945, CFSTR("Invalid parameter not satisfying: %s"), v20, v21, v22, v23, (uint64_t)"error != nil");
  }
  v6 = v5;
  +[NUError unsupportedError:object:](NUError, "unsupportedError:object:", CFSTR("_evaluateImagePropertiesWithSourceOptions not implemented"), objc_opt_class());
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  return 0;
}

- (id)_evaluateVideoPropertiesWithSourceOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v8;
  void *v9;
  void *specific;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!a4)
  {
    NUAssertLogger_6578();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v9;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_6578();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v16 = (void *)MEMORY[0x1E0CB3978];
        v17 = v15;
        objc_msgSend(v16, "callStackSymbols");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v15;
        v26 = 2114;
        v27 = v19;
        _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v14;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceNode _evaluateVideoPropertiesWithSourceOptions:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 952, CFSTR("Invalid parameter not satisfying: %s"), v20, v21, v22, v23, (uint64_t)"error != nil");
  }
  v6 = v5;
  +[NUError unsupportedError:object:](NUError, "unsupportedError:object:", CFSTR("_evaluateVideoPropertiesWithSourceOptions not implemented"), objc_opt_class());
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  return 0;
}

- (id)_evaluateVideoCompositionWithSourceOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v8;
  void *v9;
  void *specific;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!a4)
  {
    NUAssertLogger_6578();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v9;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_6578();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v16 = (void *)MEMORY[0x1E0CB3978];
        v17 = v15;
        objc_msgSend(v16, "callStackSymbols");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v15;
        v26 = 2114;
        v27 = v19;
        _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v14;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceNode _evaluateVideoCompositionWithSourceOptions:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 959, CFSTR("Invalid parameter not satisfying: %s"), v20, v21, v22, v23, (uint64_t)"error != nil");
  }
  v6 = v5;
  +[NUError unsupportedError:object:](NUError, "unsupportedError:object:", CFSTR("_evaluateVideoCompositionWithSourceOptions not implemented"), objc_opt_class());
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  return 0;
}

- (id)_evaluateImage:(id *)a3
{
  uint64_t v4;

  v4 = 1;
  -[NUSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:](self, "_evaluateImageWithSourceOptions:subsampleFactor:error:", MEMORY[0x1E0C9AA70], &v4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_evaluateImageProperties:(id *)a3
{
  return -[NUSourceNode _evaluateImagePropertiesWithSourceOptions:error:](self, "_evaluateImagePropertiesWithSourceOptions:error:", MEMORY[0x1E0C9AA70], a3);
}

- (id)_evaluateImageGeometry:(id *)a3
{
  return -[NUSourceNode _evaluateImageGeometryWithSourceOptions:error:](self, "_evaluateImageGeometryWithSourceOptions:error:", MEMORY[0x1E0C9AA70], a3);
}

- (id)_evaluateVideoProperties:(id *)a3
{
  return -[NUSourceNode _evaluateVideoPropertiesWithSourceOptions:error:](self, "_evaluateVideoPropertiesWithSourceOptions:error:", MEMORY[0x1E0C9AA70], a3);
}

- (id)_evaluateVideoComposition:(id *)a3
{
  return -[NUSourceNode _evaluateVideoCompositionWithSourceOptions:error:](self, "_evaluateVideoCompositionWithSourceOptions:error:", MEMORY[0x1E0C9AA70], a3);
}

- (NURenderNode)originalNode
{
  return (NURenderNode *)objc_loadWeakRetained((id *)&self->_originalNode);
}

- (void)setOriginalNode:(id)a3
{
  objc_storeWeak((id *)&self->_originalNode, a3);
}

- (NUSourceDerivation)sourceDerivation
{
  return (NUSourceDerivation *)objc_getProperty(self, a2, 176, 1);
}

- (void)setSourceDerivation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceDerivation, 0);
  objc_destroyWeak((id *)&self->_originalNode);
}

@end
