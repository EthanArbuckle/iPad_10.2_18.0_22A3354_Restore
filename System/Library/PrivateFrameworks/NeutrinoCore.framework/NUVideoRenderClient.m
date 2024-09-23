@implementation NUVideoRenderClient

- (NUVideoRenderClient)initWithName:(id)a3 responseQueue:(id)a4
{
  NUVideoRenderClient *v4;
  uint64_t v5;
  NUScalePolicy *scalePolicy;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NUVideoRenderClient;
  v4 = -[NURenderClient initWithName:responseQueue:](&v8, sel_initWithName_responseQueue_, a3, a4);
  if (v4)
  {
    +[NUFixedScalePolicy oneToOneScalePolicy](NUFixedScalePolicy, "oneToOneScalePolicy");
    v5 = objc_claimAutoreleasedReturnValue();
    scalePolicy = v4->_scalePolicy;
    v4->_scalePolicy = (NUScalePolicy *)v5;

    v4->_sampleMode = 0;
  }
  return v4;
}

- (void)submitRequestForComposition:(id)a3 completion:(id)a4
{
  id v6;
  NUVideoRenderRequest *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
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
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v6 = a4;
  if (!v43)
  {
    NUAssertLogger_17097();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "composition != nil");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_17097();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v26 = (void *)MEMORY[0x1E0CB3978];
        v27 = v25;
        objc_msgSend(v26, "callStackSymbols");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v25;
        v46 = 2114;
        v47 = v29;
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
      v45 = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoRenderClient submitRequestForComposition:completion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoRenderRequest.m", 45, CFSTR("Invalid parameter not satisfying: %s"), v30, v31, v32, v33, (uint64_t)"composition != nil");
  }
  if (!v6)
  {
    NUAssertLogger_17097();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "completionBlock != nil");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v19;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_17097();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v22)
      {
        v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v35 = (void *)MEMORY[0x1E0CB3978];
        v36 = v34;
        objc_msgSend(v35, "callStackSymbols");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v34;
        v46 = 2114;
        v47 = v38;
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
      v45 = v24;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoRenderClient submitRequestForComposition:completion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoRenderRequest.m", 46, CFSTR("Invalid parameter not satisfying: %s"), v39, v40, v41, v42, (uint64_t)"completionBlock != nil");
  }
  v7 = -[NUVideoRenderRequest initWithComposition:]([NUVideoRenderRequest alloc], "initWithComposition:", v43);
  -[NUVideoRenderClient pipelineFilters](self, "pipelineFilters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderRequest setPipelineFilters:](v7, "setPipelineFilters:", v8);

  -[NUVideoRenderClient scalePolicy](self, "scalePolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUVideoRenderRequest setScalePolicy:](v7, "setScalePolicy:", v9);

  -[NURenderRequest setSampleMode:](v7, "setSampleMode:", -[NUVideoRenderClient sampleMode](self, "sampleMode"));
  -[NURenderClient name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderRequest setName:](v7, "setName:", v10);

  -[NURenderClient submitGenericRequest:completion:](self, "submitGenericRequest:completion:", v7, v6);
}

- (NUScalePolicy)scalePolicy
{
  return self->_scalePolicy;
}

- (void)setScalePolicy:(id)a3
{
  objc_storeStrong((id *)&self->_scalePolicy, a3);
}

- (int64_t)sampleMode
{
  return self->_sampleMode;
}

- (void)setSampleMode:(int64_t)a3
{
  self->_sampleMode = a3;
}

- (NSArray)pipelineFilters
{
  return self->_pipelineFilters;
}

- (void)setPipelineFilters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineFilters, 0);
  objc_storeStrong((id *)&self->_scalePolicy, 0);
}

@end
