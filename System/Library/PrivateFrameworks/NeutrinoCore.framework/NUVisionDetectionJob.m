@implementation NUVisionDetectionJob

- (NUVisionDetectionJob)initWithVisionDetectionRequest:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NUVisionDetectionJob;
  return -[NURenderJob initWithRequest:](&v4, sel_initWithRequest_, a3);
}

- (NUVisionDetectionJob)initWithRequest:(id)a3
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_142_14104);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_142_14104);
      goto LABEL_8;
    }
    if (v12 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_142_14104);
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
  _NUAssertFailHandler((uint64_t)"-[NUVisionDetectionJob initWithRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVisionDetectionRequest.m", 96, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v26, v27, v28, v29, v25);
}

- (id)scalePolicy
{
  void *v2;
  void *v3;

  -[NUVisionDetectionJob detectionRequest](self, "detectionRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scalePolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (BOOL)wantsOutputGeometry
{
  return 0;
}

- (BOOL)wantsCompleteStage
{
  return 0;
}

- (BOOL)render:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
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
  id v43;
  void *v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  _BYTE v52[128];
  uint64_t v53;
  void *v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_14087();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v56 = v28;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14087();
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
        v56 = v34;
        v57 = 2114;
        v58 = v38;
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
      v56 = v33;
      _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVisionDetectionJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVisionDetectionRequest.m", 121, CFSTR("Invalid parameter not satisfying: %s"), v39, v40, v41, v42, (uint64_t)"error != nil");
  }
  -[NURenderJob renderer:](self, "renderer:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NURenderJob outputImage](self, "outputImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0CEDF70]);
    v53 = *MEMORY[0x1E0CEE378];
    v54 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUFactory sharedFactory](NUFactory, "sharedFactory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "visionSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v8, "initWithCIImage:options:session:", v6, v9, v11);

    -[NUVisionDetectionJob detectionRequest](self, "detectionRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "visionRequests");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = 0;
    v15 = objc_msgSend(v12, "performRequests:error:", v14, &v51);
    v16 = v51;
    v17 = v16;
    if ((v15 & 1) != 0)
    {
      v43 = v16;
      v44 = v12;
      v45 = v7;
      v46 = v6;
      v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v19 = v14;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v48 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "results");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
              objc_msgSend(v18, "addObjectsFromArray:", v24);

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        }
        while (v21);
      }

      v25 = (void *)objc_msgSend(v18, "copy");
      -[NUVisionDetectionJob setObservations:](self, "setObservations:", v25);

      v7 = v45;
      v6 = v46;
      v17 = v43;
      v12 = v44;
    }
    else
    {
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Vision detection failed"), v14, v16);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)result
{
  _NUVisionDetectionResult *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_alloc_init(_NUVisionDetectionResult);
  -[NUVisionDetectionJob observations](self, "observations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUVisionDetectionResult setObservations:](v3, "setObservations:", v4);

  -[NURenderJob outputGeometry](self, "outputGeometry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "size");
  -[_NUVisionDetectionResult setImageSize:](v3, "setImageSize:", v6, v7);

  return v3;
}

- (void)cleanUp
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NUVisionDetectionJob;
  -[NURenderJob cleanUp](&v3, sel_cleanUp);
  -[NUVisionDetectionJob setObservations:](self, "setObservations:", 0);
}

- (NSArray)observations
{
  return self->_observations;
}

- (void)setObservations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observations, 0);
}

@end
