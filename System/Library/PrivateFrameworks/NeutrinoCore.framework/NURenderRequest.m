@implementation NURenderRequest

- (NURenderRequest)init
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_5343);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_5343);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_5343);
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
  _NUAssertFailHandler((uint64_t)"-[NURenderRequest init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderRequest.m", 33, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (NURenderRequest)initWithComposition:(id)a3
{
  id v4;
  void *v5;
  NURenderRequest *v6;
  NURenderRequest *v7;
  unint64_t v8;
  uint64_t v9;
  NSString *name;
  NURenderContext *v11;
  NURenderContext *renderContext;
  id v13;
  const char *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *responseQueue;
  uint64_t v18;
  NUComposition *internalComposition;
  NSArray *pipelineFilters;
  NUPriority *v21;
  NUPriority *priority;
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
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_5368();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "composition != nil");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v25;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_5368();
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
        v42 = v31;
        v43 = 2114;
        v44 = v35;
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
      v42 = v30;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderRequest initWithComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderRequest.m", 38, CFSTR("Invalid parameter not satisfying: %s"), v36, v37, v38, v39, (uint64_t)"composition != nil");
  }
  v5 = v4;
  v40.receiver = self;
  v40.super_class = (Class)NURenderRequest;
  v6 = -[NURenderRequest init](&v40, sel_init);
  v7 = v6;
  do
    v8 = __ldaxr(&NURenderRequestGlobalCounter);
  while (__stlxr(v8 + 1, &NURenderRequestGlobalCounter));
  v6->_requestNumber = v8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%lld"), objc_opt_class(), v6->_requestNumber);
  v9 = objc_claimAutoreleasedReturnValue();
  name = v7->_name;
  v7->_name = (NSString *)v9;

  v11 = objc_alloc_init(NURenderContext);
  renderContext = v7->_renderContext;
  v7->_renderContext = v11;

  -[NURenderRequest name](v7, "name");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = (const char *)objc_msgSend(v13, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = dispatch_queue_create(v14, v15);
  responseQueue = v7->_responseQueue;
  v7->_responseQueue = (OS_dispatch_queue *)v16;

  v18 = objc_msgSend(v5, "copy");
  internalComposition = v7->_internalComposition;
  v7->_internalComposition = (NUComposition *)v18;

  pipelineFilters = v7->_pipelineFilters;
  v7->_pipelineFilters = (NSArray *)MEMORY[0x1E0C9AA60];

  v21 = objc_alloc_init(NUPriority);
  priority = v7->_priority;
  v7->_priority = v21;

  return v7;
}

- (NURenderRequest)initWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NURenderRequest *v7;
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
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_5368();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "request != nil");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v10;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_5368();
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
    _NUAssertFailHandler((uint64_t)"-[NURenderRequest initWithRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderRequest.m", 57, CFSTR("Invalid parameter not satisfying: %s"), v21, v22, v23, v24, (uint64_t)"request != nil");
  }
  v5 = v4;
  objc_msgSend(v4, "internalComposition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NURenderRequest initWithComposition:](self, "initWithComposition:", v6);

  -[NURenderRequest takePropertiesFromRequest:](v7, "takePropertiesFromRequest:", v5);
  return v7;
}

- (void)takePropertiesFromRequest:(id)a3
{
  int64_t *v4;
  NUDevice *v5;
  NUDevice *device;
  NSArray *v7;
  NSArray *pipelineFilters;
  NUPriority *v9;
  NUPriority *priority;
  OS_dispatch_queue *v11;
  OS_dispatch_queue *responseQueue;
  NURenderContext *v13;
  NURenderContext *renderContext;
  double v15;
  void *v16;
  NSString *v17;
  NSString *name;
  __int128 v19;
  int64_t v20;

  v4 = (int64_t *)a3;
  objc_msgSend(v4, "device");
  v5 = (NUDevice *)objc_claimAutoreleasedReturnValue();
  device = self->_device;
  self->_device = v5;

  self->_sampleMode = objc_msgSend(v4, "sampleMode");
  objc_msgSend(v4, "pipelineFilters");
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  pipelineFilters = self->_pipelineFilters;
  self->_pipelineFilters = v7;

  objc_msgSend(v4, "priority");
  v9 = (NUPriority *)objc_claimAutoreleasedReturnValue();
  priority = self->_priority;
  self->_priority = v9;

  objc_msgSend(v4, "responseQueue");
  v11 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  responseQueue = self->_responseQueue;
  self->_responseQueue = v11;

  objc_msgSend(v4, "renderContext");
  v13 = (NURenderContext *)objc_claimAutoreleasedReturnValue();
  renderContext = self->_renderContext;
  self->_renderContext = v13;

  if (v4)
  {
    objc_msgSend(v4, "time");
  }
  else
  {
    v19 = 0uLL;
    v20 = 0;
  }
  *(_OWORD *)&self->_time.value = v19;
  self->_time.epoch = v20;
  objc_msgSend(v4, "submitTime");
  self->_submitTime = v15;
  self->_parentRequestNumber = v4[8];
  objc_msgSend(v4, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByAppendingFormat:", CFSTR(".%@"), objc_opt_class());
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v17;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
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
  __int128 v16;
  unint64_t v17;
  int64_t copiedFromRequestNumber;

  v4 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 96), self->_internalComposition);
    objc_storeStrong((id *)(v5 + 48), self->_device);
    *(_QWORD *)(v5 + 32) = self->_sampleMode;
    v6 = -[NSArray copy](self->_pipelineFilters, "copy");
    v7 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v6;

    -[NURenderRequest name](self, "name");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v8;

    -[NURenderRequest priority](self, "priority");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v10;

    -[NURenderRequest responseQueue](self, "responseQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v12;

    -[NURenderRequest renderContext](self, "renderContext");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = v14;

    v16 = *(_OWORD *)&self->_time.value;
    *(_QWORD *)(v5 + 144) = self->_time.epoch;
    *(_OWORD *)(v5 + 128) = v16;
    do
      v17 = __ldaxr(&NURenderRequestGlobalCounter);
    while (__stlxr(v17 + 1, &NURenderRequestGlobalCounter));
    *(_QWORD *)(v5 + 64) = v17;
    *(_QWORD *)(v5 + 16) = self->_parentRequestNumber;
    copiedFromRequestNumber = self->_copiedFromRequestNumber;
    if (!copiedFromRequestNumber)
      copiedFromRequestNumber = self->_requestNumber;
    *(_QWORD *)(v5 + 8) = copiedFromRequestNumber;
    *(_BYTE *)(v5 + 24) = self->_shouldUseLowMemoryMode;
    *(_BYTE *)(v5 + 25) = self->_isOneShot;
  }
  return (id)v5;
}

- (void)setShouldCoalesceUpdates:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NURenderRequest renderContext](self, "renderContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldCoalesceUpdates:", v3);

}

- (BOOL)shouldCoalesceUpdates
{
  void *v2;
  char v3;

  -[NURenderRequest renderContext](self, "renderContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldCoalesceUpdates");

  return v3;
}

- (NUComposition)composition
{
  void *v2;
  void *v3;

  -[NURenderRequest internalComposition](self, "internalComposition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NUComposition *)v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *name;
  int64_t requestNumber;
  int64_t parentRequestNumber;
  __CFString *v8;
  int64_t copiedFromRequestNumber;
  __CFString *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  name = self->_name;
  requestNumber = self->_requestNumber;
  parentRequestNumber = self->_parentRequestNumber;
  if (parentRequestNumber)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" parent #: %lld"), self->_parentRequestNumber);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_1E5068958;
  }
  copiedFromRequestNumber = self->_copiedFromRequestNumber;
  if (copiedFromRequestNumber)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" copy-of #: %lld"), self->_copiedFromRequestNumber);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = &stru_1E5068958;
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@> request #: %lld%@%@ composition: %@ device: %@ filters: %@"), v4, self, name, requestNumber, v8, v10, self->_internalComposition, self->_device, self->_pipelineFilters);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (copiedFromRequestNumber)

  if (parentRequestNumber)
  return v11;
}

- (id)newRenderJob
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_5343);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_5343);
      goto LABEL_8;
    }
    if (v8 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_5343);
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
  _NUAssertFailHandler((uint64_t)"-[NURenderRequest newRenderJob]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderRequest.m", 139, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v22, v23, v24, v25, v21);
}

- (int64_t)mediaComponentType
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_5343);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_5343);
      goto LABEL_8;
    }
    if (v8 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_5343);
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
  _NUAssertFailHandler((uint64_t)"-[NURenderRequest mediaComponentType]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderRequest.m", 144, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v22, v23, v24, v25, v21);
}

- (void)submitGeneric:(id)a3
{
  -[NURenderRequest submitGenericConfiguringRequest:completion:](self, "submitGenericConfiguringRequest:completion:", 0, a3);
}

- (void)submitGenericConfiguringRequest:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = (void (**)(id, void *))a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A85C1390]();
  v9 = (void *)-[NURenderRequest copy](self, "copy");
  objc_msgSend(v9, "setCompletionBlock:", v7);
  objc_msgSend(v9, "setSubmitTime:", NUAbsoluteTime());
  v10 = (void *)voucher_copy_without_importance();
  objc_msgSend(v9, "setVoucher:", v10);

  if (v6)
    v6[2](v6, v9);
  if (+[NUGlobalSettings runNeutrinoSynchronously](NUGlobalSettings, "runNeutrinoSynchronously"))
  {
    v11 = (void *)objc_msgSend(v9, "newRenderJob");
    objc_msgSend(v11, "runSynchronous");

  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__NURenderRequest_submitGenericConfiguringRequest_completion___block_invoke;
    v12[3] = &unk_1E50614A8;
    v13 = v9;
    +[NURenderTransaction withCurrentTransaction:](NURenderTransaction, "withCurrentTransaction:", v12);

  }
  objc_autoreleasePoolPop(v8);

}

- (id)submitGenericSynchronous:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = (void *)-[NURenderRequest copy](self, "copy");
  objc_msgSend(v4, "setSubmitTime:", NUAbsoluteTime());
  v5 = (void *)voucher_copy_without_importance();
  objc_msgSend(v4, "setVoucher:", v5);

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__5337;
  v15 = __Block_byref_object_dispose__5338;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__NURenderRequest_submitGenericSynchronous___block_invoke;
  v10[3] = &unk_1E50640C8;
  v10[4] = &v11;
  v6 = (void *)MEMORY[0x1A85C1390](objc_msgSend(v4, "setCompletionBlock:", v10));
  v7 = (void *)objc_msgSend(v4, "newRenderJob");
  objc_msgSend(v7, "runSynchronous");

  objc_autoreleasePoolPop(v6);
  objc_msgSend((id)v12[5], "result:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (void)introspectPrepare:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = (void *)-[NURenderRequest copy](self, "copy");
  objc_msgSend(v5, "setSubmitTime:", NUAbsoluteTime());
  v6 = (void *)voucher_copy_without_importance();
  objc_msgSend(v5, "setVoucher:", v6);

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__5337;
  v13 = __Block_byref_object_dispose__5338;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__NURenderRequest_introspectPrepare___block_invoke;
  v8[3] = &unk_1E50640C8;
  v8[4] = &v9;
  objc_msgSend(v5, "setCompletionBlock:", v8);
  v7 = (void *)objc_msgSend(v5, "newRenderJob");
  objc_msgSend(v7, "runToPrepareSynchronous");
  v4[2](v4, v7, v10[5]);

  _Block_object_dispose(&v9, 8);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NUDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)requestNumber
{
  return self->_requestNumber;
}

- (void)setRequestNumber:(int64_t)a3
{
  self->_requestNumber = a3;
}

- (NUPriority)priority
{
  return self->_priority;
}

- (void)setPriority:(id)a3
{
  objc_storeStrong((id *)&self->_priority, a3);
}

- (OS_dispatch_queue)responseQueue
{
  return self->_responseQueue;
}

- (void)setResponseQueue:(id)a3
{
  objc_storeStrong((id *)&self->_responseQueue, a3);
}

- (NURenderContext)renderContext
{
  return self->_renderContext;
}

- (void)setRenderContext:(id)a3
{
  objc_storeStrong((id *)&self->_renderContext, a3);
}

- (BOOL)shouldUseLowMemoryMode
{
  return self->_shouldUseLowMemoryMode;
}

- (void)setShouldUseLowMemoryMode:(BOOL)a3
{
  self->_shouldUseLowMemoryMode = a3;
}

- (BOOL)isOneShot
{
  return self->_isOneShot;
}

- (void)setIsOneShot:(BOOL)a3
{
  self->_isOneShot = a3;
}

- (NUComposition)internalComposition
{
  return (NUComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInternalComposition:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 128);
  return self;
}

- (void)setTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

- (double)submitTime
{
  return self->_submitTime;
}

- (void)setSubmitTime:(double)a3
{
  self->_submitTime = a3;
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (id)voucher
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setVoucher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_voucher, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_internalComposition, 0);
  objc_storeStrong((id *)&self->_renderContext, 0);
  objc_storeStrong((id *)&self->_responseQueue, 0);
  objc_storeStrong((id *)&self->_priority, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_pipelineFilters, 0);
}

void __37__NURenderRequest_introspectPrepare___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id obj;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v2 + 40);
  v3 = (id)objc_msgSend(a2, "result:", &obj);
  objc_storeStrong((id *)(v2 + 40), obj);
}

void __44__NURenderRequest_submitGenericSynchronous___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __62__NURenderRequest_submitGenericConfiguringRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "submitRequest:", *(_QWORD *)(a1 + 32));
}

- (NSString)additionalDebugInfo
{
  id v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NURenderRequest *v13;
  void *v14;
  void *v15;
  NURenderRequest *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Request Class = %@\n"), v5);

  v6 = -[NURenderRequest sampleMode](self, "sampleMode");
  if (v6 > 3)
    v7 = CFSTR("invalid");
  else
    v7 = off_1E5060FF0[v6];
  v8 = v7;
  objc_msgSend(v3, "appendFormat:", CFSTR("sampleMode = %@\n"), v8);

  -[NURenderRequest pipelineFilters](self, "pipelineFilters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("pipelineFilter.count = %d\n"), objc_msgSend(v9, "count"));

  -[NURenderRequest device](self, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("device = %@\n"), v10);

  -[NURenderRequest priority](self, "priority");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("priority = %@\n"), v11);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NURenderRequest scalePolicy](self, "scalePolicy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("scalePolicy = %@\n"), v12);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR("maxFaceCount = %ld\n"), -[NURenderRequest maxFaceCount](self, "maxFaceCount"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = self;
    -[NURenderRequest dataExtractor](v13, "dataExtractor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("dataExtractor = %@\n"), v14);

    -[NURenderRequest options](v13, "options");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      objc_msgSend(v3, "appendFormat:", CFSTR("options = %@\n"), v15);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = self;
    -[NURenderRequest colorSpace](v16, "colorSpace");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("colorSpace = %@\n"), v17);

    -[NURenderRequest regionPolicy](v16, "regionPolicy");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("regionPolicy = %@\n"), v18);

    -[NURenderRequest pixelFormat](v16, "pixelFormat");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("pixelFormat = %@\n"), v19);

    v20 = -[NURenderRequest tileSize](v16, "tileSize");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%ld, %ld}"), v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("tileSize = %@\n"), v22);

    v23 = -[NURenderRequest borderSize](v16, "borderSize");
    v25 = v24;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%ld, %ld}"), v23, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("borderSize = %@\n"), v26);

  }
  v27 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v27;
}

@end
