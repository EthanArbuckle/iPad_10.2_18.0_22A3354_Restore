@implementation NUFileSourceDefinition

- (id)generateSourceNodeWithIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  NUVideoSourceNode *v10;
  void *v11;
  void *v12;
  NURAWImageSourceNode *v13;
  NUCGImageSourceNode *v14;
  void *v15;
  void *v16;
  void *v17;
  NURAWImageSourceNode *v18;
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
  const __CFString *v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    NUAssertLogger_6578();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "identifier != nil");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v22;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_6578();
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
        v40 = v28;
        v41 = 2114;
        v42 = v32;
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
      v40 = v27;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUFileSourceDefinition(NodeProvider) generateSourceNodeWithIdentifier:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 508, CFSTR("Invalid parameter not satisfying: %s"), v33, v34, v35, v36, (uint64_t)"identifier != nil");
  }
  v6 = v5;
  v7 = -[NUFileSourceDefinition useEmbeddedPreview](self, "useEmbeddedPreview");
  -[NUFileSourceDefinition uti](self, "uti");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "conformsToType:", *MEMORY[0x1E0CEC5B8])
    && !v7
    && !+[NUGlobalSettings imageSourceDisableRAW](NUGlobalSettings, "imageSourceDisableRAW"))
  {
    v18 = [NURAWImageSourceNode alloc];
    -[NUFileSourceDefinition url](self, "url");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NURAWImageSourceNode initWithURL:UTI:identifier:](v18, "initWithURL:UTI:identifier:", v11, v8, v6);
    goto LABEL_9;
  }
  if (objc_msgSend(v9, "conformsToType:", *MEMORY[0x1E0CEC568]))
  {
    v10 = [NUVideoSourceNode alloc];
    -[NUFileSourceDefinition url](self, "url");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUSourceDefinition sourceOptions](self, "sourceOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NUVideoSourceNode initWithURL:identifier:options:](v10, "initWithURL:identifier:options:", v11, v6, v12);

LABEL_9:
    goto LABEL_10;
  }
  v14 = [NUCGImageSourceNode alloc];
  -[NUFileSourceDefinition url](self, "url");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = CFSTR("useEmbeddedPreview");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[NUCGImageSourceNode initWithURL:UTI:identifier:options:](v14, "initWithURL:UTI:identifier:options:", v15, v8, v6, v17);

LABEL_10:
  -[NUSingleSourceDefinition sourceDerivation](self, "sourceDerivation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUSourceNode setSourceDerivation:](v13, "setSourceDerivation:", v19);

  return v13;
}

- (NUFileSourceDefinition)init
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
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
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_7194);
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_7194);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_7194);
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
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUFileSourceDefinition init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUSource.m", 127, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (NUFileSourceDefinition)initWithURL:(id)a3 UTI:(id)a4
{
  NSURL *v6;
  NSString *v7;
  NSString *v8;
  NUFileSourceDefinition *v9;
  NSURL *url;
  NSURL *v11;
  NSString *uti;
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
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = (NSURL *)a3;
  v7 = (NSString *)a4;
  if (!v6)
  {
    NUAssertLogger_7182();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "url != nil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v15;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_7182();
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
        v32 = v21;
        v33 = 2114;
        v34 = v25;
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
      v32 = v20;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUFileSourceDefinition initWithURL:UTI:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUSource.m", 132, CFSTR("Invalid parameter not satisfying: %s"), v26, v27, v28, v29, (uint64_t)"url != nil");
  }
  v8 = v7;
  v30.receiver = self;
  v30.super_class = (Class)NUFileSourceDefinition;
  v9 = -[NUSingleSourceDefinition init](&v30, sel_init);
  url = v9->_url;
  v9->_url = v6;
  v11 = v6;

  uti = v9->_uti;
  v9->_uti = v8;

  return v9;
}

- (int64_t)mediaType
{
  void *v2;
  char v4;

  if (!self->_uti)
    return 0;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToType:", *MEMORY[0x1E0CEC520]))
  {

    return 1;
  }
  v4 = objc_msgSend(v2, "conformsToType:", *MEMORY[0x1E0CEC568]);

  if ((v4 & 1) != 0)
    return 2;
  else
    return 0;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p uti=%@ url=%@>"), objc_opt_class(), self, self->_uti, self->_url);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)uti
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)useEmbeddedPreview
{
  return self->_useEmbeddedPreview;
}

- (void)setUseEmbeddedPreview:(BOOL)a3
{
  self->_useEmbeddedPreview = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
