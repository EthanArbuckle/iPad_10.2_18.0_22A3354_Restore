@implementation NUColorSampler

- (NUColorSampler)initWithComposition:(id)a3
{
  return -[NUColorSampler initWithComposition:responseQueue:](self, "initWithComposition:responseQueue:", a3, MEMORY[0x1E0C80D38]);
}

- (NUColorSampler)initWithComposition:(id)a3 responseQueue:(id)a4
{
  id v6;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *v8;
  NUColorSampler *v9;
  uint64_t v10;
  NUComposition *composition;
  uint64_t v12;
  NUColorSpace *colorSpace;
  OS_dispatch_queue *responseQueue;
  OS_dispatch_queue *v15;
  NUImageDataRequest *v16;
  NUImageDataRequest *request;
  NSObject *v19;
  void *v20;
  void *specific;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  objc_super v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (OS_dispatch_queue *)a4;
  if (!v6)
  {
    NUAssertLogger_22345();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "composition != nil");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v20;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_22345();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v34 = (void *)MEMORY[0x1E0CB3978];
        v35 = v33;
        objc_msgSend(v34, "callStackSymbols");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v53 = v33;
        v54 = 2114;
        v55 = v37;
        _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v25;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUColorSampler initWithComposition:responseQueue:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Sampler/NUColorSampler.m", 37, CFSTR("Invalid parameter not satisfying: %s"), v38, v39, v40, v41, (uint64_t)"composition != nil");
  }
  v8 = v7;
  if (!v7)
  {
    NUAssertLogger_22345();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "responseQueue != nil");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v27;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_22345();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v30)
      {
        v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v43 = (void *)MEMORY[0x1E0CB3978];
        v44 = v42;
        objc_msgSend(v43, "callStackSymbols");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v53 = v42;
        v54 = 2114;
        v55 = v46;
        _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v30)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v32;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUColorSampler initWithComposition:responseQueue:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Sampler/NUColorSampler.m", 38, CFSTR("Invalid parameter not satisfying: %s"), v47, v48, v49, v50, (uint64_t)"responseQueue != nil");
  }
  v51.receiver = self;
  v51.super_class = (Class)NUColorSampler;
  v9 = -[NUColorSampler init](&v51, sel_init);
  v10 = objc_msgSend(v6, "copy");
  composition = v9->_composition;
  v9->_composition = (NUComposition *)v10;

  v9->_sampleRadius = 2;
  +[NUColorSpace sRGBColorSpace](NUColorSpace, "sRGBColorSpace");
  v12 = objc_claimAutoreleasedReturnValue();
  colorSpace = v9->_colorSpace;
  v9->_colorSpace = (NUColorSpace *)v12;

  responseQueue = v9->_responseQueue;
  v9->_responseQueue = v8;
  v15 = v8;

  v16 = -[NUImageDataRequest initWithComposition:dataExtractor:options:]([NUImageDataRequest alloc], "initWithComposition:dataExtractor:options:", v6, CFSTR("CIAreaAverage"), 0);
  request = v9->_request;
  v9->_request = v16;

  -[NURenderRequest setShouldCoalesceUpdates:](v9->_request, "setShouldCoalesceUpdates:", 1);
  -[NUColorSampler setName:](v9, "setName:", CFSTR("NUColorSampler"));

  return v9;
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;
  NSString *v6;
  NSObject *v7;
  void *v8;
  void *specific;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  if (!v4)
  {
    NUAssertLogger_22345();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "name != nil");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v8;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_22345();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v15 = (void *)MEMORY[0x1E0CB3978];
        v16 = v14;
        objc_msgSend(v15, "callStackSymbols");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v14;
        v26 = 2114;
        v27 = v18;
        _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v13;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUColorSampler setName:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Sampler/NUColorSampler.m", 54, CFSTR("Invalid parameter not satisfying: %s"), v19, v20, v21, v22, (uint64_t)"name != nil");
  }
  name = self->_name;
  self->_name = v4;
  v6 = v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-Image-Data-Request"), self->_name);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  -[NURenderRequest setName:](self->_request, "setName:");

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_request;
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE time](result, "time");
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- (void)setTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v3;

  v3 = *a3;
  -[NURenderRequest setTime:](self->_request, "setTime:", &v3);
}

- (void)sampleColorAt:(id)a3 completion:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v7;
  void *v8;
  NUImageDataRequest *request;
  id v10;
  NSObject *v11;
  void *v12;
  void *specific;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  int64_t v29;
  int64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  var1 = a3.var1;
  var0 = a3.var0;
  v35 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!v7)
  {
    NUAssertLogger_22345();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "completionBlock != nil");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_22345();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v19 = (void *)MEMORY[0x1E0CB3978];
        v20 = v18;
        objc_msgSend(v19, "callStackSymbols");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v18;
        v33 = 2114;
        v34 = v22;
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
      v32 = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUColorSampler sampleColorAt:completion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Sampler/NUColorSampler.m", 72, CFSTR("Invalid parameter not satisfying: %s"), v23, v24, v25, v26, (uint64_t)"completionBlock != nil");
  }
  v8 = v7;
  -[NUColorSampler configureRequest:forSamplingAtPoint:](self, "configureRequest:forSamplingAtPoint:", self->_request, var0, var1);
  request = self->_request;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __43__NUColorSampler_sampleColorAt_completion___block_invoke;
  v27[3] = &unk_1E50636A8;
  v29 = var0;
  v30 = var1;
  v28 = v8;
  v10 = v8;
  -[NUImageDataRequest submit:](request, "submit:", v27);

}

- (void)setShouldCoalesceUpdates:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NUColorSampler request](self, "request");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldCoalesceUpdates:", v3);

}

- (void)configureRequest:(id)a3 forSamplingAtPoint:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v7;
  void *v8;
  int64_t sampleRadius;
  NUFixedRegionPolicy *v10;
  void *v11;
  _QWORD v12[2];
  uint64_t v13;
  uint64_t v14;

  var1 = a4.var1;
  var0 = a4.var0;
  v7 = a3;
  +[NUFixedScalePolicy oneToOneScalePolicy](NUFixedScalePolicy, "oneToOneScalePolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScalePolicy:", v8);

  objc_msgSend(v7, "setSampleMode:", 2);
  objc_msgSend(v7, "setColorSpace:", self->_colorSpace);
  objc_msgSend(v7, "setResponseQueue:", self->_responseQueue);
  sampleRadius = self->_sampleRadius;
  v12[0] = var0 - sampleRadius;
  v12[1] = var1 - sampleRadius;
  v13 = (2 * sampleRadius) | 1;
  v14 = v13;
  v10 = -[NUFixedRegionPolicy initWithRect:]([NUFixedRegionPolicy alloc], "initWithRect:", v12);
  objc_msgSend(v7, "setRegionPolicy:", v10);

  -[NUColorSampler _pipelineFilters](self, "_pipelineFilters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPipelineFilters:", v11);

}

- (id)_pipelineFilters
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)cancel
{
  id v2;

  -[NURenderRequest renderContext](self->_request, "renderContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelAllRequests");

}

- (NUComposition)composition
{
  return self->_composition;
}

- (void)setComposition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_queue)responseQueue
{
  return self->_responseQueue;
}

- (void)setResponseQueue:(id)a3
{
  objc_storeStrong((id *)&self->_responseQueue, a3);
}

- (int64_t)sampleRadius
{
  return self->_sampleRadius;
}

- (void)setSampleRadius:(int64_t)a3
{
  self->_sampleRadius = a3;
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(id)a3
{
  objc_storeStrong((id *)&self->_colorSpace, a3);
}

- (BOOL)shouldCoalesceUpdates
{
  return self->_shouldCoalesceUpdates;
}

- (NSString)name
{
  return self->_name;
}

- (NUImageDataRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_responseQueue, 0);
  objc_storeStrong((id *)&self->_composition, 0);
}

void __43__NUColorSampler_sampleColorAt_completion___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  NUResponse *v4;
  void *v5;
  void *v6;
  _NUColorSamplerResult *v7;
  NUResponse *v8;
  id v9;

  v9 = 0;
  objc_msgSend(a2, "result:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (NUResponse *)v9;
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("color"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(_NUColorSamplerResult);
    -[_NUColorSamplerResult setColor:](v7, "setColor:", v6);
    -[_NUColorSamplerResult setPoint:](v7, "setPoint:", a1[5], a1[6]);
    v8 = -[NUResponse initWithResult:]([NUResponse alloc], "initWithResult:", v7);
    (*(void (**)(void))(a1[4] + 16))();

    v4 = v8;
  }
  else
  {
    v7 = -[NUResponse initWithError:]([NUResponse alloc], "initWithError:", v4);
    (*(void (**)(void))(a1[4] + 16))();
  }

}

@end
