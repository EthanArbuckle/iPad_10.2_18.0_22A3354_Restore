@implementation NURenderResultCache

- (NURenderResultCache)init
{
  NURenderResultCache *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v6;
  NSMutableDictionary *cache;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NURenderResultCache;
  v2 = -[NURenderResultCache init](&v9, sel_init);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("NURenderResultCache", v3);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v4;

  v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  cache = v2->_cache;
  v2->_cache = v6;

  return v2;
}

- (id)resultForJob:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  NSObject *queue;
  id v10;
  id v11;
  NSObject *v12;
  const char *v13;
  id v14;
  NSObject *v16;
  void *v17;
  void *specific;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD block[5];
  id v33;
  id v34;
  _BYTE *v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  _BYTE v40[24];
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_23747();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "job != nil");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v40 = 138543362;
      *(_QWORD *)&v40[4] = v17;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v40, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_23747();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v24 = (void *)MEMORY[0x1E0CB3978];
        v25 = v23;
        objc_msgSend(v24, "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v40 = 138543618;
        *(_QWORD *)&v40[4] = v23;
        *(_WORD *)&v40[12] = 2114;
        *(_QWORD *)&v40[14] = v27;
        _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v40, 0x16u);

      }
    }
    else if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v40 = 138543362;
      *(_QWORD *)&v40[4] = v22;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v40, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderResultCache resultForJob:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderResultCache.m", 27, CFSTR("Invalid parameter not satisfying: %s"), v28, v29, v30, v31, (uint64_t)"job != nil");
  }
  v5 = v4;
  objc_msgSend(v4, "memoizationCacheKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    *(_QWORD *)v40 = 0;
    *(_QWORD *)&v40[8] = v40;
    *(_QWORD *)&v40[16] = 0x3032000000;
    v41 = __Block_byref_object_copy__23773;
    v42 = __Block_byref_object_dispose__23774;
    v43 = 0;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__NURenderResultCache_resultForJob___block_invoke;
    block[3] = &unk_1E5064080;
    block[4] = self;
    v10 = v8;
    v33 = v10;
    v35 = v40;
    v11 = v6;
    v34 = v11;
    dispatch_sync(queue, block);
    if (*(_QWORD *)(*(_QWORD *)&v40[8] + 40))
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_27);
      v12 = _NULogger;
      if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEBUG))
        goto LABEL_12;
      *(_DWORD *)buf = 138412546;
      v37 = v10;
      v38 = 2112;
      v39 = v11;
      v13 = "MEMOIZE %@ %@ CACHE HIT";
    }
    else
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_27);
      v12 = _NULogger;
      if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEBUG))
        goto LABEL_12;
      *(_DWORD *)buf = 138412546;
      v37 = v10;
      v38 = 2112;
      v39 = v11;
      v13 = "MEMOIZE %@ %@ CACHE MISS";
    }
    _os_log_debug_impl(&dword_1A6553000, v12, OS_LOG_TYPE_DEBUG, v13, buf, 0x16u);
LABEL_12:
    v14 = *(id *)(*(_QWORD *)&v40[8] + 40);

    _Block_object_dispose(v40, 8);
    goto LABEL_13;
  }
  v14 = 0;
LABEL_13:

  return v14;
}

- (void)setResult:(id)a3 forJob:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  NSObject *queue;
  id v12;
  NSObject *v13;
  void *v14;
  void *specific;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  _QWORD block[5];
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v6 = a4;
  if (!v6)
  {
    NUAssertLogger_23747();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "job != nil");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v14;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_23747();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v28 = (void *)MEMORY[0x1E0CB3978];
        v29 = v27;
        objc_msgSend(v28, "callStackSymbols");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v27;
        v52 = 2114;
        v53 = v31;
        _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v19;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderResultCache setResult:forJob:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderResultCache.m", 52, CFSTR("Invalid parameter not satisfying: %s"), v32, v33, v34, v35, (uint64_t)"job != nil");
  }
  v7 = v6;
  if (!v45)
  {
    NUAssertLogger_23747();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "result != nil");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v21;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_23747();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (v22)
    {
      if (v24)
      {
        v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v37 = (void *)MEMORY[0x1E0CB3978];
        v38 = v36;
        objc_msgSend(v37, "callStackSymbols");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v36;
        v52 = 2114;
        v53 = v40;
        _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v26;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderResultCache setResult:forJob:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderResultCache.m", 53, CFSTR("Invalid parameter not satisfying: %s"), v41, v42, v43, v44, (uint64_t)"result != nil");
  }
  objc_msgSend(v6, "memoizationCacheKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__NURenderResultCache_setResult_forJob___block_invoke;
    block[3] = &unk_1E5063AF0;
    block[4] = self;
    v47 = v10;
    v48 = v8;
    v49 = v45;
    v12 = v10;
    dispatch_sync(queue, block);

  }
}

- (void)flush
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__NURenderResultCache_flush__block_invoke;
  block[3] = &unk_1E5064008;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __28__NURenderResultCache_flush__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_27);
  v2 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_1A6553000, v2, OS_LOG_TYPE_DEBUG, "MEMOIZE CACHE FLUSH", v4, 2u);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

void __40__NURenderResultCache_setResult_forJob___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ result cache"), a1[5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setName:", v3);

    objc_msgSend(v2, "setCountLimit:", 16);
    objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKeyedSubscript:", v2, a1[5]);
  }
  objc_msgSend(v2, "objectForKey:", a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_27);
    v5 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEBUG))
    {
      v6 = a1[5];
      v7 = a1[6];
      *(_DWORD *)buf = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_debug_impl(&dword_1A6553000, v5, OS_LOG_TYPE_DEBUG, "MEMOIZE %@ %@ CACHE STORE", buf, 0x16u);
    }
    objc_msgSend(v2, "setObject:forKey:", a1[7], a1[6]);
  }

}

void __36__NURenderResultCache_resultForJob___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = v2;
    objc_msgSend(v2, "objectForKey:", a1[6]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[7] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = v6;
  }

}

+ (id)shared
{
  void *v2;
  void *v3;

  +[NUFactory sharedFactory](NUFactory, "sharedFactory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "renderResultCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
