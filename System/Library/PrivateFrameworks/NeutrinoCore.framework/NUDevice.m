@implementation NUDevice

- (NUDevice)init
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_164);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_164);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_164);
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
  _NUAssertFailHandler((uint64_t)"-[NUDevice init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUDevice.m", 25, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (NUDevice)initWithName:(id)a3 model:(id)a4 metalDevice:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NUDevice *v12;
  uint64_t v13;
  NSString *name;
  uint64_t v15;
  NSString *model;
  id v17;
  const char *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v22;
  NSMutableDictionary *renderers;
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
  objc_super v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    NUAssertLogger_286();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "name != nil");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v26;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_286();
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
    _NUAssertFailHandler((uint64_t)"-[NUDevice initWithName:model:metalDevice:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUDevice.m", 30, CFSTR("Invalid parameter not satisfying: %s"), v37, v38, v39, v40, (uint64_t)"name != nil");
  }
  v11 = v10;
  v41.receiver = self;
  v41.super_class = (Class)NUDevice;
  v12 = -[NUDevice init](&v41, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v8, "copy");
    name = v12->_name;
    v12->_name = (NSString *)v13;

    v15 = objc_msgSend(v9, "copy");
    model = v12->_model;
    v12->_model = (NSString *)v15;

    objc_storeStrong((id *)&v12->_metalDevice, a5);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NUDevice.%@"), v8);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = (const char *)objc_msgSend(v17, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create(v18, v19);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v20;

    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    renderers = v12->_renderers;
    v12->_renderers = v22;

  }
  return v12;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NUDevice name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUDevice model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)hasMetalSupport
{
  return self->_metalDevice != 0;
}

- (unint64_t)family
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_164);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_164);
      goto LABEL_8;
    }
    if (v8 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_164);
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
  _NUAssertFailHandler((uint64_t)"-[NUDevice family]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUDevice.m", 55, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v22, v23, v24, v25, v21);
}

- (int64_t)defaultSampleMode
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__NUDevice_defaultSampleMode__block_invoke;
  v5[3] = &unk_1E5063FE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)_defaultSampleMode
{
  int64_t result;

  result = +[NUGlobalSettings deviceDefaultSampleMode](NUGlobalSettings, "deviceDefaultSampleMode");
  if ((unint64_t)result > 3 || ((0xEu >> (result & 0xF)) & 1) == 0)
    return -[NUDevice _preferredSampleMode](self, "_preferredSampleMode");
  return result;
}

- (int64_t)_preferredSampleMode
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_164);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_164);
      goto LABEL_8;
    }
    if (v8 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_164);
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
  _NUAssertFailHandler((uint64_t)"-[NUDevice _preferredSampleMode]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUDevice.m", 80, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v22, v23, v24, v25, v21);
}

- (BOOL)shouldRenderUsingMetal
{
  _BOOL4 v2;

  v2 = -[NUDevice hasMetalSupport](self, "hasMetalSupport");
  if (v2)
    LOBYTE(v2) = !+[NUGlobalSettings deviceDisableMetal](NUGlobalSettings, "deviceDisableMetal");
  return v2;
}

- (BOOL)shouldLogRendererUsed
{
  return +[NUGlobalSettings devicePrintRenderer](NUGlobalSettings, "devicePrintRenderer");
}

- (id)renderer:(id *)a3
{
  return -[NUDevice rendererWithOptions:error:](self, "rendererWithOptions:error:", 4, a3);
}

- (id)lowPriorityRenderer:(id *)a3
{
  return -[NUDevice rendererWithOptions:error:](self, "rendererWithOptions:error:", 5, a3);
}

- (id)rendererWithoutIntermediateCaching:(id *)a3
{
  return -[NUDevice rendererWithOptions:error:](self, "rendererWithOptions:error:", 16, a3);
}

- (id)lowPriorityRendererWithoutIntermediateCaching:(id *)a3
{
  return -[NUDevice rendererWithOptions:error:](self, "rendererWithOptions:error:", 17, a3);
}

- (id)lowPriorityLowMemoryRendererWithoutIntermediateCaching:(id *)a3
{
  return -[NUDevice rendererWithOptions:error:](self, "rendererWithOptions:error:", 25, a3);
}

- (id)highPriorityLowMemoryRendererWithoutIntermediateCaching:(id *)a3
{
  return -[NUDevice rendererWithOptions:error:](self, "rendererWithOptions:error:", 24, a3);
}

- (id)rendererWithOptions:(unint64_t)a3 error:(id *)a4
{
  NSObject *queue;
  id v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__NUDevice_rendererWithOptions_error___block_invoke;
  v7[3] = &unk_1E505FE18;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  dispatch_sync(queue, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)_rendererWithOptions:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  id v8;
  NSObject *v9;
  NSString *name;
  int v12;
  NSString *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_renderers, "objectForKey:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = -[NUDevice _newRendererWithOptions:error:](self, "_newRendererWithOptions:error:", a3, a4);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_renderers, "setObject:forKeyedSubscript:", v8, v7);
    if (-[NUDevice shouldLogRendererUsed](self, "shouldLogRendererUsed"))
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_165);
      v9 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
      {
        name = self->_name;
        v12 = 138543874;
        v13 = name;
        v14 = 2114;
        v15 = v8;
        v16 = 2050;
        v17 = a3;
        _os_log_impl(&dword_1A6553000, v9, OS_LOG_TYPE_INFO, "Rendering on device %{public}@ using renderer: %{public}@ - [Options  %{public}lx]", (uint8_t *)&v12, 0x20u);
      }
    }
  }

  return v8;
}

- (id)_newRendererWithOptions:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  id v7;

  objc_msgSend((id)objc_opt_class(), "_ciContextOptionsForRendererOptions:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NUDevice _newRendererWithCIContextOptions:error:](self, "_newRendererWithCIContextOptions:error:", v6, a4);

  return v7;
}

- (id)_newRendererWithCIContextOptions:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *specific;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  objc_class *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_164);
  v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = v5;
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = v10;
    _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v11 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v11 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_164);
      goto LABEL_8;
    }
    if (v11 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_164);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v12 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v13 = (void *)MEMORY[0x1E0CB3978];
    v14 = v12;
    objc_msgSend(v13, "callStackSymbols");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = v16;
    _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v17 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v19 = (void *)MEMORY[0x1E0CB3978];
  v20 = specific;
  v14 = v17;
  objc_msgSend(v19, "callStackSymbols");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v30 = specific;
  v31 = 2114;
  v32 = v22;
  _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v23 = (objc_class *)objc_opt_class();
  NSStringFromClass(v23);
  v24 = objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUDevice _newRendererWithCIContextOptions:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUDevice.m", 198, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v25, v26, v27, v28, v24);
}

- (void)clearCaches
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__NUDevice_clearCaches__block_invoke;
  block[3] = &unk_1E5064008;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)executeMetal:(id)a3
{
  void (**v4)(id, void *);
  NSObject *queue;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *specific;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NUDevice *v28;
  _QWORD block[6];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__NUDevice_executeMetal___block_invoke;
  block[3] = &unk_1E5063FE0;
  block[4] = self;
  block[5] = &v30;
  dispatch_sync(queue, block);
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "threadDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = self;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NUDevice(%p).currentCommandBuffer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v4[2](v4, v9);
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CC6A58]);
    objc_msgSend((id)v31[5], "commandBufferWithDescriptor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      NUAssertLogger_286();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No Metal command buffer!"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v37 = v15;
        _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_286();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v18)
        {
          v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v37 = v21;
          v38 = 2114;
          v39 = v23;
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
        v37 = v20;
        _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"-[NUDevice executeMetal:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUDevice.m", 231, CFSTR("No Metal command buffer!"), v24, v25, v26, v27, (uint64_t)v28);
    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v8);
    objc_msgSend(v11, "enqueue");
    v4[2](v4, v11);
    objc_msgSend(v11, "commit");
    objc_msgSend(v11, "waitUntilScheduled");
    if (objc_msgSend(v11, "status") == 5)
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_165);
      v12 = (id)_NULogger;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v11, "error");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v37 = v13;
        _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Metal execution failed: %{public}@", buf, 0xCu);

      }
    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v8);

  }
  _Block_object_dispose(&v30, 8);

}

- (id)_metalCommandQueue
{
  MTLCommandQueue *commandQueue;
  MTLCommandQueue *v4;
  MTLCommandQueue *v5;

  commandQueue = self->_commandQueue;
  if (!commandQueue)
  {
    v4 = (MTLCommandQueue *)-[MTLDevice newCommandQueue](self->_metalDevice, "newCommandQueue");
    v5 = self->_commandQueue;
    self->_commandQueue = v4;

    commandQueue = self->_commandQueue;
  }
  return commandQueue;
}

- (BOOL)supportsPixelFormat:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NUDevice metalDevice](self, "metalDevice", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metalFormat");

  MTLPixelFormatGetInfoForDevice();
  return 0;
}

- (void)clearRenderers
{
  -[NSMutableDictionary removeAllObjects](self->_renderers, "removeAllObjects");
}

- (NSString)name
{
  return self->_name;
}

- (NSString)model
{
  return self->_model;
}

- (NURenderer)renderer
{
  return self->_renderer;
}

- (NURenderer)lowPriorityRenderer
{
  return self->_lowPriorityRenderer;
}

- (MTLDevice)metalDevice
{
  return self->_metalDevice;
}

- (NSMutableDictionary)renderers
{
  return self->_renderers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalDevice, 0);
  objc_storeStrong((id *)&self->_lowPriorityRenderer, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_renderers, 0);
}

void __25__NUDevice_executeMetal___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_metalCommandQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __23__NUDevice_clearCaches__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_298);
}

void __23__NUDevice_clearCaches__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  objc_msgSend(a3, "context");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearCaches");

}

void __38__NUDevice_rendererWithOptions_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_rendererWithOptions:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __29__NUDevice_defaultSampleMode__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_defaultSampleMode");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (id)_ciContextOptionsForRendererOptions:(unint64_t)a3
{
  char v3;
  id v4;
  void *v5;
  _QWORD *v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    v6 = (_QWORD *)MEMORY[0x1E0C9DFA8];
  }
  else
  {
    if ((v3 & 2) == 0)
      goto LABEL_6;
    v6 = (_QWORD *)MEMORY[0x1E0C9DFA0];
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *v6);
LABEL_6:
  if ((v3 & 8) != 0)
  {
    if (!+[NUGlobalSettings rendererContextLowMemoryTarget](NUGlobalSettings, "rendererContextLowMemoryTarget"))goto LABEL_13;
    v10 = (void *)MEMORY[0x1E0CB37E8];
    v8 = +[NUGlobalSettings rendererContextLowMemoryTarget](NUGlobalSettings, "rendererContextLowMemoryTarget");
    v9 = v10;
    goto LABEL_12;
  }
  if ((v3 & 4) != 0)
  {
    v7 = +[NUGlobalSettings rendererContextLargeMemoryTarget](NUGlobalSettings, "rendererContextLargeMemoryTarget");
    if (v7)
    {
      v8 = v7;
      v9 = (void *)MEMORY[0x1E0CB37E8];
LABEL_12:
      objc_msgSend(v9, "numberWithInteger:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0C9DF78]);

    }
  }
LABEL_13:
  if ((v3 & 0x10) != 0)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0C9DF58]);
  v12 = (void *)objc_msgSend(v5, "copy");

  return v12;
}

@end
