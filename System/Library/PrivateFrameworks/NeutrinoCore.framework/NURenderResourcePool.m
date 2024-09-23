@implementation NURenderResourcePool

- (NURenderResourcePool)init
{
  NURenderResourcePool *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSMutableArray *v6;
  NSMutableArray *resources;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NURenderResourcePool;
  v2 = -[NURenderResourcePool init](&v9, sel_init);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("NURenderResourcePool", v3);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v4;

  v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  resources = v2->_resources;
  v2->_resources = v6;

  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_9354);
  v2->_sid = os_signpost_id_make_with_pointer((os_log_t)_NULogger, v2);
  return v2;
}

- (id)checkOutResourceForKey:(id)a3 matching:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  id v10;
  id v11;
  NSObject *v12;
  os_signpost_id_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  os_signpost_id_t sid;
  void *v18;
  NSObject *v20;
  void *v21;
  void *specific;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
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
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD block[5];
  id v53;
  id v54;
  _BYTE *v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  void *v59;
  _BYTE v60[24];
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    NUAssertLogger_9407();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "key != nil");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v60 = 138543362;
      *(_QWORD *)&v60[4] = v21;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v60, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_9407();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v35 = (void *)MEMORY[0x1E0CB3978];
        v36 = v34;
        objc_msgSend(v35, "callStackSymbols");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v60 = 138543618;
        *(_QWORD *)&v60[4] = v34;
        *(_WORD *)&v60[12] = 2114;
        *(_QWORD *)&v60[14] = v38;
        _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v60, 0x16u);

      }
    }
    else if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v60 = 138543362;
      *(_QWORD *)&v60[4] = v26;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v60, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderResourcePool checkOutResourceForKey:matching:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderResourcePool.m", 47, CFSTR("Invalid parameter not satisfying: %s"), v39, v40, v41, v42, (uint64_t)"key != nil");
  }
  v8 = v7;
  if (!v7)
  {
    NUAssertLogger_9407();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "predicate != nil");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v60 = 138543362;
      *(_QWORD *)&v60[4] = v28;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v60, 0xCu);

    }
    v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_9407();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (v29)
    {
      if (v31)
      {
        v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v44 = (void *)MEMORY[0x1E0CB3978];
        v45 = v43;
        objc_msgSend(v44, "callStackSymbols");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "componentsJoinedByString:", CFSTR("\n"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v60 = 138543618;
        *(_QWORD *)&v60[4] = v43;
        *(_WORD *)&v60[12] = 2114;
        *(_QWORD *)&v60[14] = v47;
        _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v60, 0x16u);

      }
    }
    else if (v31)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v60 = 138543362;
      *(_QWORD *)&v60[4] = v33;
      _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v60, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderResourcePool checkOutResourceForKey:matching:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderResourcePool.m", 48, CFSTR("Invalid parameter not satisfying: %s"), v48, v49, v50, v51, (uint64_t)"predicate != nil");
  }
  *(_QWORD *)v60 = 0;
  *(_QWORD *)&v60[8] = v60;
  *(_QWORD *)&v60[16] = 0x3032000000;
  v61 = __Block_byref_object_copy__9446;
  v62 = __Block_byref_object_dispose__9447;
  v63 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__NURenderResourcePool_checkOutResourceForKey_matching___block_invoke;
  block[3] = &unk_1E50619E8;
  v55 = v60;
  block[4] = self;
  v10 = v6;
  v53 = v10;
  v11 = v8;
  v54 = v11;
  dispatch_sync(queue, block);
  if (*(_QWORD *)(*(_QWORD *)&v60[8] + 40))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_9354);
    v12 = (id)_NULogger;
    v13 = objc_msgSend(*(id *)(*(_QWORD *)&v60[8] + 40), "sid");
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      objc_msgSend(*(id *)(*(_QWORD *)&v60[8] + 40), "key");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)&v60[8] + 40), "object");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v57 = v14;
      v58 = 2048;
      v59 = v15;
      _os_signpost_emit_with_name_impl(&dword_1A6553000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "NURenderResource.use", "key=%@, obj=%p", buf, 0x16u);

    }
  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_9354);
    v16 = (id)_NULogger;
    v12 = v16;
    sid = self->_sid;
    if (sid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_DWORD *)buf = 138412290;
      v57 = v10;
      _os_signpost_emit_with_name_impl(&dword_1A6553000, v12, OS_SIGNPOST_EVENT, sid, "NURenderResource.miss", "key=%@", buf, 0xCu);
    }
  }

  objc_msgSend(*(id *)(*(_QWORD *)&v60[8] + 40), "object");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v60, 8);
  return v18;
}

- (id)_checkOutResourceForKey:(id)a3 matching:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __57__NURenderResourcePool__checkOutResourceForKey_matching___block_invoke;
  v15 = &unk_1E5061A10;
  v16 = v6;
  v17 = v7;
  v8 = v7;
  v9 = v6;
  -[NURenderResourcePool _resourceMatching:](self, "_resourceMatching:", &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInUse:", 1, v12, v13, v14, v15);

  return v10;
}

- (id)_resourceMatching:(id)a3
{
  id v4;
  NSMutableArray *resources;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  resources = self->_resources;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__NURenderResourcePool__resourceMatching___block_invoke;
  v10[3] = &unk_1E5061A38;
  v6 = v4;
  v11 = v6;
  v7 = -[NSMutableArray indexOfObjectPassingTest:](resources, "indexOfObjectPassingTest:", v10);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_resources, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)checkInResource:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  NSObject *v10;
  void *v11;
  void *specific;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  _QWORD block[5];
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    NUAssertLogger_9407();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "object != nil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_9407();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v25 = (void *)MEMORY[0x1E0CB3978];
        v26 = v24;
        objc_msgSend(v25, "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v24;
        v48 = 2114;
        v49 = v28;
        _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderResourcePool checkInResource:forKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderResourcePool.m", 78, CFSTR("Invalid parameter not satisfying: %s"), v29, v30, v31, v32, (uint64_t)"object != nil");
  }
  if (!v7)
  {
    NUAssertLogger_9407();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "key != nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_9407();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v21)
      {
        v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v34 = (void *)MEMORY[0x1E0CB3978];
        v35 = v33;
        objc_msgSend(v34, "callStackSymbols");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v33;
        v48 = 2114;
        v49 = v37;
        _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderResourcePool checkInResource:forKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderResourcePool.m", 79, CFSTR("Invalid parameter not satisfying: %s"), v38, v39, v40, v41, (uint64_t)"key != nil");
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__NURenderResourcePool_checkInResource_forKey___block_invoke;
  block[3] = &unk_1E5062E88;
  block[4] = self;
  v44 = v6;
  v45 = v7;
  v9 = v7;
  v42 = v6;
  dispatch_sync(queue, block);

}

- (void)_checkInResource:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _NURenderResource *v11;
  _NURenderResource *v12;
  NSObject *v13;
  uint64_t v14;
  os_signpost_id_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __48__NURenderResourcePool__checkInResource_forKey___block_invoke;
  v22 = &unk_1E5061A60;
  v9 = v7;
  v23 = v9;
  v10 = v6;
  v24 = v10;
  -[NURenderResourcePool _resourceMatching:](self, "_resourceMatching:", &v19);
  v11 = (_NURenderResource *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v12 = [_NURenderResource alloc];
    v11 = -[_NURenderResource initWithResource:key:](v12, "initWithResource:key:", v10, v9, v19, v20, v21, v22, v23);
    -[NSMutableArray addObject:](self->_resources, "addObject:", v11);
  }
  -[_NURenderResource setInUse:](v11, "setInUse:", 0, v19, v20, v21, v22);
  -[_NURenderResource setUseCount:](v11, "setUseCount:", -[_NURenderResource useCount](v11, "useCount") + 1);
  -[_NURenderResource setLastUseTime:](v11, "setLastUseTime:", v8);
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_9354);
  v13 = (id)_NULogger;
  v14 = -[_NURenderResource sid](v11, "sid");
  if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v15 = v14;
    if (os_signpost_enabled(v13))
    {
      -[_NURenderResource key](v11, "key");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NURenderResource object](v11, "object");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[_NURenderResource useCount](v11, "useCount");
      *(_DWORD *)buf = 138412802;
      v26 = v16;
      v27 = 2048;
      v28 = v17;
      v29 = 2048;
      v30 = v18;
      _os_signpost_emit_with_name_impl(&dword_1A6553000, v13, OS_SIGNPOST_INTERVAL_END, v15, "NURenderResource.use", "key=%@, obj=%p, count=%lu", buf, 0x20u);

    }
  }

  -[NURenderResourcePool _scheduleEvictionOfResource:](self, "_scheduleEvictionOfResource:", v11);
}

- (void)_scheduleEvictionOfResource:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  dispatch_time_t v8;
  NSObject *queue;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v4 = a3;
  objc_msgSend(v4, "lastUseTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NUGlobalSettings renderResourceEvictionDelay](NUGlobalSettings, "renderResourceEvictionDelay");
  if (v6 <= 0.0)
  {
    -[NURenderResourcePool _evictResource:ifNotUsedSince:](self, "_evictResource:ifNotUsedSince:", v4, v5);
  }
  else
  {
    v7 = v6;
    objc_initWeak(&location, self);
    v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    queue = self->_queue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__NURenderResourcePool__scheduleEvictionOfResource___block_invoke;
    v10[3] = &unk_1E5061A88;
    objc_copyWeak(&v13, &location);
    v11 = v4;
    v12 = v5;
    dispatch_after(v8, queue, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

- (void)_evictResource:(id)a3 ifNotUsedSince:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  os_signpost_id_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "inUse") & 1) == 0)
  {
    objc_msgSend(v6, "lastUseTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToDate:", v7);

    if (v9)
    {
      v10 = -[NSMutableArray indexOfObjectIdenticalTo:](self->_resources, "indexOfObjectIdenticalTo:", v6);
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[NSMutableArray removeObjectAtIndex:](self->_resources, "removeObjectAtIndex:", v10);
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_9354);
        v11 = (void *)_NULogger;
        if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
        {
          v12 = v11;
          objc_msgSend(v6, "key");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "object");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v6, "useCount");
          v16 = -[NSMutableArray count](self->_resources, "count");
          v23 = 138413058;
          v24 = v13;
          v25 = 2048;
          v26 = v14;
          v27 = 2048;
          v28 = v15;
          v29 = 2048;
          v30 = v16;
          _os_log_impl(&dword_1A6553000, v12, OS_LOG_TYPE_INFO, "NURenderResource: evicted unused resource: %@ %p [%lu] (%lu remaining)", (uint8_t *)&v23, 0x2Au);

          if (_NULogOnceToken != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_9354);
        }
        v17 = (id)_NULogger;
        v18 = objc_msgSend(v6, "sid");
        if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v19 = v18;
          if (os_signpost_enabled(v17))
          {
            objc_msgSend(v6, "key");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "object");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v6, "useCount");
            v23 = 138412802;
            v24 = v20;
            v25 = 2048;
            v26 = v21;
            v27 = 2048;
            v28 = v22;
            _os_signpost_emit_with_name_impl(&dword_1A6553000, v17, OS_SIGNPOST_EVENT, v19, "NURenderResource.evicted", "key=%@, obj=%p, count=%lu", (uint8_t *)&v23, 0x20u);

          }
        }

      }
    }
  }

}

- (void)flush
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__NURenderResourcePool_flush__block_invoke;
  block[3] = &unk_1E5064008;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_flush
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t sid;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_9354);
  v3 = (id)_NULogger;
  v4 = v3;
  sid = self->_sid;
  if (sid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = -[NSMutableArray count](self->_resources, "count");
    v7 = 134217984;
    v8 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A6553000, v4, OS_SIGNPOST_EVENT, sid, "NURenderResourcePool.flush", "count=%lu", (uint8_t *)&v7, 0xCu);
  }

  -[NSMutableArray removeAllObjects](self->_resources, "removeAllObjects");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p resources:%@>"), objc_opt_class(), self, self->_resources);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __29__NURenderResourcePool_flush__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_flush");
}

void __52__NURenderResourcePool__scheduleEvictionOfResource___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_evictResource:ifNotUsedSince:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

BOOL __48__NURenderResourcePool__checkInResource_forKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  objc_msgSend(v3, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == *(void **)(a1 + 40);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __47__NURenderResourcePool_checkInResource_forKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkInResource:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __42__NURenderResourcePool__resourceMatching___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__NURenderResourcePool__checkOutResourceForKey_matching___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  if ((objc_msgSend(v3, "inUse") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "key");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    {
      v6 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "object");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

void __56__NURenderResourcePool_checkOutResourceForKey_matching___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_checkOutResourceForKey:matching:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)shared
{
  void *v2;
  void *v3;

  +[NUFactory sharedFactory](NUFactory, "sharedFactory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "renderResourcePool");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
