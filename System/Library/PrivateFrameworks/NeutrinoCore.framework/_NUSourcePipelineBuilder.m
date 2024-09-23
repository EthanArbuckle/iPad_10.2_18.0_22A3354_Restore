@implementation _NUSourcePipelineBuilder

- (_NUSourcePipelineBuilder)init
{
  void *v3;
  _NUSourcePipelineBuilder *v4;

  +[NUSourceSchema sharedSourceSchema](NUSourceSchema, "sharedSourceSchema");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_NUSourcePipelineBuilder initWithSourceSchema:](self, "initWithSourceSchema:", v3);

  return v4;
}

- (_NUSourcePipelineBuilder)initWithSourceSchema:(id)a3
{
  NUSourceSchema *v4;
  NUSourceSchema *v5;
  _NUSourcePipelineBuilder *v6;
  NUSourceSchema *sourceSchema;
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
  v4 = (NUSourceSchema *)a3;
  if (!v4)
  {
    NUAssertLogger_4813();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "schema != nil");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v10;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4813();
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
    _NUAssertFailHandler((uint64_t)"-[_NUSourcePipelineBuilder initWithSourceSchema:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 712, CFSTR("Invalid parameter not satisfying: %s"), v21, v22, v23, v24, (uint64_t)"schema != nil");
  }
  v5 = v4;
  v25.receiver = self;
  v25.super_class = (Class)_NUSourcePipelineBuilder;
  v6 = -[_NUSourcePipelineBuilder init](&v25, sel_init);
  sourceSchema = v6->_sourceSchema;
  v6->_sourceSchema = v5;

  return v6;
}

- (id)buildPipeline:(id *)a3
{
  void *v5;
  void *v6;
  _NUPipeline *v7;
  _NUPipeline *v8;
  _NUPipeline *v9;

  -[_NUSourcePipelineBuilder sourceSchema](self, "sourceSchema");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_NUPipeline initWithIdentifier:]([_NUPipeline alloc], "initWithIdentifier:", v6);
  if (-[_NUSourcePipelineBuilder buildPipeline:error:](self, "buildPipeline:error:", v7, a3))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (BOOL)buildPipeline:(id)a3 error:(id *)a4
{
  id v5;
  NUChannelControlFormat *v6;
  void *v7;
  NUChannelControlFormat *v8;
  NUChannel *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  v6 = [NUChannelControlFormat alloc];
  -[_NUSourcePipelineBuilder sourceSchema](self, "sourceSchema");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NUChannelControlFormat initWithControlType:dataModel:](v6, "initWithControlType:dataModel:", 2, v7);

  v9 = -[NUChannel initWithName:format:index:]([NUChannel alloc], "initWithName:format:index:", CFSTR("source"), v8, 0);
  objc_msgSend(v5, "addInputChannel:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[NUChannel primary](NUChannel, "primary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v5, "addOutputChannel:", v11);

  return 1;
}

- (NUSourceSchema)sourceSchema
{
  return self->_sourceSchema;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceSchema, 0);
}

@end
