@implementation _NUStyleEngineConfiguration

- (_NUStyleEngineConfiguration)init
{
  _NUStyleEngineConfiguration *v2;
  CMIStyleEngineConfiguration *v3;
  CMIStyleEngineConfiguration *styleEngineConfiguration;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_NUStyleEngineConfiguration;
  v2 = -[_NUStyleEngineConfiguration init](&v6, sel_init);
  v3 = (CMIStyleEngineConfiguration *)objc_alloc_init(MEMORY[0x1E0D08AE8]);
  styleEngineConfiguration = v2->_styleEngineConfiguration;
  v2->_styleEngineConfiguration = v3;

  return v2;
}

- (_NUStyleEngineConfiguration)initWithStyleEngineConfiguration:(id)a3
{
  CMIStyleEngineConfiguration *v4;
  CMIStyleEngineConfiguration *v5;
  _NUStyleEngineConfiguration *v6;
  CMIStyleEngineConfiguration *styleEngineConfiguration;
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
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (CMIStyleEngineConfiguration *)a3;
  if (!v4)
  {
    NUAssertLogger_24413();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "configuration != nil");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v10;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
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
    _NUAssertFailHandler((uint64_t)"-[_NUStyleEngineConfiguration initWithStyleEngineConfiguration:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2393, CFSTR("Invalid parameter not satisfying: %s"), v21, v22, v23, v24, (uint64_t)"configuration != nil");
  }
  v5 = v4;
  v25.receiver = self;
  v25.super_class = (Class)_NUStyleEngineConfiguration;
  v6 = -[_NUStyleEngineConfiguration init](&v25, sel_init);
  styleEngineConfiguration = v6->_styleEngineConfiguration;
  v6->_styleEngineConfiguration = v5;

  return v6;
}

- (_NUStyleEngineConfiguration)initWithConfigurationDictionary:(id)a3
{
  id v4;
  void *v5;
  _NUStyleEngineConfiguration *v6;
  CMIStyleEngineConfiguration *v7;
  CMIStyleEngineConfiguration *styleEngineConfiguration;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
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
  uint64_t v63;
  objc_super v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_24413();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "config != nil");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v66 = v32;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
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
        v66 = v45;
        v67 = 2114;
        v68 = v49;
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
      v66 = v37;
      _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUStyleEngineConfiguration initWithConfigurationDictionary:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2400, CFSTR("Invalid parameter not satisfying: %s"), v50, v51, v52, v53, (uint64_t)"config != nil");
  }
  v5 = v4;
  v64.receiver = self;
  v64.super_class = (Class)_NUStyleEngineConfiguration;
  v6 = -[_NUStyleEngineConfiguration init](&v64, sel_init);
  v7 = (CMIStyleEngineConfiguration *)objc_alloc_init(MEMORY[0x1E0D08AE8]);
  styleEngineConfiguration = v6->_styleEngineConfiguration;
  v6->_styleEngineConfiguration = v7;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("thumbnailWidth"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("thumbnailHeight"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  if (!v10 || !v12)
  {
    NUAssertLogger_24413();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing thumbnail size"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v66 = v39;
      _os_log_error_impl(&dword_1A6553000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
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
        v66 = v54;
        v67 = 2114;
        v68 = v58;
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
      v66 = v44;
      _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUStyleEngineConfiguration initWithConfigurationDictionary:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2405, CFSTR("Missing thumbnail size"), v59, v60, v61, v62, v63);
  }
  -[CMIStyleEngineConfiguration setThumbnailSize:](v6->_styleEngineConfiguration, "setThumbnailSize:", (double)v10, (double)v12);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("linearSystemType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMIStyleEngineConfiguration setLinearSystemType:](v6->_styleEngineConfiguration, "setLinearSystemType:", objc_msgSend(v13, "unsignedIntegerValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("linearSystemOrder"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMIStyleEngineConfiguration setLinearSystemOrder:](v6->_styleEngineConfiguration, "setLinearSystemOrder:", objc_msgSend(v14, "unsignedIntegerValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("linearSystemSolver"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMIStyleEngineConfiguration setLinearSystemSolver:](v6->_styleEngineConfiguration, "setLinearSystemSolver:", objc_msgSend(v15, "unsignedIntegerValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("weightPlaneCount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMIStyleEngineConfiguration setWeightPlaneCount:](v6->_styleEngineConfiguration, "setWeightPlaneCount:", objc_msgSend(v16, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("spotlightCountX"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "unsignedIntValue");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("spotlightCountY"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMIStyleEngineConfiguration setSpotlightCount:](v6->_styleEngineConfiguration, "setSpotlightCount:", COERCE_DOUBLE(__PAIR64__(objc_msgSend(v19, "unsignedIntValue"), v18)));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("useFloat16"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMIStyleEngineConfiguration setInputCoefficientsF16:](v6->_styleEngineConfiguration, "setInputCoefficientsF16:", objc_msgSend(v20, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("useFloat16"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMIStyleEngineConfiguration setOutputCoefficientsF16:](v6->_styleEngineConfiguration, "setOutputCoefficientsF16:", objc_msgSend(v21, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("priorMatrix"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    v24 = (double *)objc_msgSend(objc_retainAutorelease(v22), "bytes");
    -[CMIStyleEngineConfiguration setLinearSystemPriorMatrix:](v6->_styleEngineConfiguration, "setLinearSystemPriorMatrix:", *v24, v24[2], v24[4]);
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("createAndSolveGlobalLinearSystem"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMIStyleEngineConfiguration setCreateAndSolveGlobalLinearSystem:](v6->_styleEngineConfiguration, "setCreateAndSolveGlobalLinearSystem:", objc_msgSend(v25, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("globalLinearSystemMixFactor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "floatValue");
  -[CMIStyleEngineConfiguration setGlobalLinearSystemMixFactor:](v6->_styleEngineConfiguration, "setGlobalLinearSystemMixFactor:");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("useBicubicIntegration"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMIStyleEngineConfiguration setUseBicubicIntegration:](v6->_styleEngineConfiguration, "setUseBicubicIntegration:", objc_msgSend(v27, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("applySyntheticNoise"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMIStyleEngineConfiguration setApplySyntheticNoise:](v6->_styleEngineConfiguration, "setApplySyntheticNoise:", objc_msgSend(v28, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("applyDithering"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMIStyleEngineConfiguration setApplyDithering:](v6->_styleEngineConfiguration, "setApplyDithering:", objc_msgSend(v29, "BOOLValue"));

  return v6;
}

- (NSDictionary)configurationDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v29;
  _OWORD v30[3];

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_usage, CFSTR("usage"));
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[CMIStyleEngineConfiguration thumbnailSize](self->_styleEngineConfiguration, "thumbnailSize");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("thumbnailWidth"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[CMIStyleEngineConfiguration thumbnailSize](self->_styleEngineConfiguration, "thumbnailSize");
  objc_msgSend(v6, "numberWithDouble:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("thumbnailHeight"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CMIStyleEngineConfiguration linearSystemType](self->_styleEngineConfiguration, "linearSystemType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("linearSystemType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CMIStyleEngineConfiguration linearSystemOrder](self->_styleEngineConfiguration, "linearSystemOrder"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("linearSystemOrder"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CMIStyleEngineConfiguration linearSystemSolver](self->_styleEngineConfiguration, "linearSystemSolver"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("linearSystemSolver"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CMIStyleEngineConfiguration weightPlaneCount](self->_styleEngineConfiguration, "weightPlaneCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("weightPlaneCount"));

  -[CMIStyleEngineConfiguration spotlightCount](self->_styleEngineConfiguration, "spotlightCount");
  v29 = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("spotlightCountX"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v29);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("spotlightCountY"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CMIStyleEngineConfiguration inputCoefficientsF16](self->_styleEngineConfiguration, "inputCoefficientsF16"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("useFloat16"));

  -[CMIStyleEngineConfiguration linearSystemPriorMatrix](self->_styleEngineConfiguration, "linearSystemPriorMatrix");
  v30[0] = v18;
  v30[1] = v19;
  v30[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v30, 48);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("priorMatrix"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CMIStyleEngineConfiguration createAndSolveGlobalLinearSystem](self->_styleEngineConfiguration, "createAndSolveGlobalLinearSystem"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("createAndSolveGlobalLinearSystem"));

  v23 = (void *)MEMORY[0x1E0CB37E8];
  -[CMIStyleEngineConfiguration globalLinearSystemMixFactor](self->_styleEngineConfiguration, "globalLinearSystemMixFactor");
  objc_msgSend(v23, "numberWithFloat:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("globalLinearSystemMixFactor"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CMIStyleEngineConfiguration useBicubicIntegration](self->_styleEngineConfiguration, "useBicubicIntegration"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("useBicubicIntegration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CMIStyleEngineConfiguration applySyntheticNoise](self->_styleEngineConfiguration, "applySyntheticNoise"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("applySyntheticNoise"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CMIStyleEngineConfiguration applyDithering](self->_styleEngineConfiguration, "applyDithering"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("applyDithering"));

  return (NSDictionary *)v3;
}

- (BOOL)matchesConfiguration:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  char v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  int32x2_t v33;
  int32x2_t v34;
  void *v35;
  int32x2_t v36;
  uint32x2_t v37;
  unsigned __int32 v38;
  void *v39;
  int v40;
  void *v41;
  int v42;
  void *v44;
  int v45;
  void *v46;
  int v47;

  v4 = a3;
  -[_NUStyleEngineConfiguration styleEngineConfiguration](self, "styleEngineConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "linearSystemType");
  objc_msgSend(v4, "styleEngineConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "linearSystemType");

  if (v6 != v8)
    goto LABEL_9;
  -[_NUStyleEngineConfiguration styleEngineConfiguration](self, "styleEngineConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "linearSystemOrder");
  objc_msgSend(v4, "styleEngineConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "linearSystemOrder");

  if (v10 != v12)
    goto LABEL_9;
  -[_NUStyleEngineConfiguration styleEngineConfiguration](self, "styleEngineConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "linearSystemSolver");
  objc_msgSend(v4, "styleEngineConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "linearSystemSolver");

  if (v14 != v16)
  {
LABEL_9:
    v27 = 0;
    goto LABEL_10;
  }
  -[_NUStyleEngineConfiguration styleEngineConfiguration](self, "styleEngineConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "thumbnailSize");
  v19 = v18;
  v21 = v20;
  objc_msgSend(v4, "styleEngineConfiguration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "thumbnailSize");
  v24 = v23;
  v26 = v25;

  v27 = 0;
  if (v19 == v24 && v21 == v26)
  {
    -[_NUStyleEngineConfiguration styleEngineConfiguration](self, "styleEngineConfiguration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "weightPlaneCount");
    objc_msgSend(v4, "styleEngineConfiguration");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "weightPlaneCount");

    if (v29 == v31)
    {
      -[_NUStyleEngineConfiguration styleEngineConfiguration](self, "styleEngineConfiguration");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "spotlightCount");
      v34 = v33;
      objc_msgSend(v4, "styleEngineConfiguration");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "spotlightCount");
      v37 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_s32(v34, v36));
      v38 = vpmax_u32(v37, v37).u32[0];

      if ((v38 & 0x80000000) == 0)
      {
        -[_NUStyleEngineConfiguration styleEngineConfiguration](self, "styleEngineConfiguration");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "inputCoefficientsF16");
        objc_msgSend(v4, "styleEngineConfiguration");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "inputCoefficientsF16");

        if (v40 == v42)
        {
          -[_NUStyleEngineConfiguration styleEngineConfiguration](self, "styleEngineConfiguration");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "outputCoefficientsF16");
          objc_msgSend(v4, "styleEngineConfiguration");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v45 ^ objc_msgSend(v46, "outputCoefficientsF16");

          v27 = v47 ^ 1;
          goto LABEL_10;
        }
      }
    }
    goto LABEL_9;
  }
LABEL_10:

  return v27;
}

- (CGSize)coefficientTextureSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0D08AF0], "coefficientPixelBufferSizeForConfiguration:float16:", self->_styleEngineConfiguration, -[CMIStyleEngineConfiguration outputCoefficientsF16](self->_styleEngineConfiguration, "outputCoefficientsF16"));
  result.height = v3;
  result.width = v2;
  return result;
}

- (CMIStyleEngineConfiguration)styleEngineConfiguration
{
  return self->_styleEngineConfiguration;
}

- (NSString)usage
{
  return self->_usage;
}

- (void)setUsage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usage, 0);
  objc_storeStrong((id *)&self->_styleEngineConfiguration, 0);
}

+ (CGSize)coefficientTextureSizeForConfigurationDictionary:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConfigurationDictionary:", v4);

  objc_msgSend(v5, "coefficientTextureSize");
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

+ (CGSize)coefficientTextureSizeForStyleEngineConfiguration:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStyleEngineConfiguration:", v4);

  objc_msgSend(v5, "coefficientTextureSize");
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

@end
