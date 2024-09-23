@implementation NUObservatory

- (NUObservatory)init
{
  NUObservatory *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *serializer;
  NSMutableArray *v5;
  NSMutableArray *observations;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NUObservatory;
  v2 = -[NUObservatory init](&v8, sel_init);
  v3 = dispatch_queue_create("NUObservatory", 0);
  serializer = v2->_serializer;
  v2->_serializer = (OS_dispatch_queue *)v3;

  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  observations = v2->_observations;
  v2->_observations = v5;

  return v2;
}

- (id)addObserverForKey:(int64_t)a3 queue:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  _NUObserver *v10;

  v8 = a5;
  v9 = a4;
  v10 = objc_alloc_init(_NUObserver);
  -[NUObservatory addObserver:forKey:queue:block:](self, "addObserver:forKey:queue:block:", v10, a3, v9, v8);

  return v10;
}

- (void)addObserver:(id)a3 forKey:(int64_t)a4 queue:(id)a5 block:(id)a6
{
  id v10;
  id v11;
  _NUObservation *v12;
  NSObject *serializer;
  _NUObservation *v14;
  NSObject *v15;
  void *v16;
  void *specific;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  _QWORD block[5];
  _NUObservation *v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v10 = a5;
  v11 = a6;
  if (!v47)
  {
    NUAssertLogger_22215();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "observer != nil");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v16;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_22215();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v30 = (void *)MEMORY[0x1E0CB3978];
        v31 = v29;
        objc_msgSend(v30, "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v29;
        v52 = 2114;
        v53 = v33;
        _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v21;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUObservatory addObserver:forKey:queue:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUObservatory.m", 89, CFSTR("Invalid parameter not satisfying: %s"), v34, v35, v36, v37, (uint64_t)"observer != nil");
  }
  if (!v11)
  {
    NUAssertLogger_22215();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "block != nil");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v23;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_22215();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v24)
    {
      if (v26)
      {
        v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v39 = (void *)MEMORY[0x1E0CB3978];
        v40 = v38;
        objc_msgSend(v39, "callStackSymbols");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v38;
        v52 = 2114;
        v53 = v42;
        _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v28;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUObservatory addObserver:forKey:queue:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUObservatory.m", 90, CFSTR("Invalid parameter not satisfying: %s"), v43, v44, v45, v46, (uint64_t)"block != nil");
  }
  v12 = -[_NUObservation initWithObserver:key:queue:block:]([_NUObservation alloc], "initWithObserver:key:queue:block:", v47, a4, v10, v11);
  serializer = self->_serializer;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__NUObservatory_addObserver_forKey_queue_block___block_invoke;
  block[3] = &unk_1E5063FB8;
  block[4] = self;
  v49 = v12;
  v14 = v12;
  dispatch_sync(serializer, block);

}

- (void)_addObservation:(id)a3
{
  -[NSMutableArray addObject:](self->_observations, "addObject:", a3);
}

- (void)removeObserver:(id)a3 forKey:(int64_t)a4
{
  id v6;
  NSObject *serializer;
  NSObject *v8;
  void *v9;
  void *specific;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  _QWORD block[5];
  id v26;
  int64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_22215();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "observer != nil");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v9;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_22215();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v16 = (void *)MEMORY[0x1E0CB3978];
        v17 = v15;
        objc_msgSend(v16, "callStackSymbols");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v15;
        v30 = 2114;
        v31 = v19;
        _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v14;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUObservatory removeObserver:forKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUObservatory.m", 107, CFSTR("Invalid parameter not satisfying: %s"), v20, v21, v22, v23, (uint64_t)"observer != nil");
  }
  serializer = self->_serializer;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__NUObservatory_removeObserver_forKey___block_invoke;
  block[3] = &unk_1E5063C48;
  block[4] = self;
  v26 = v6;
  v27 = a4;
  v24 = v6;
  dispatch_sync(serializer, block);

}

- (void)_removeObserver:(id)a3 forKey:(int64_t)a4
{
  id v6;
  NSMutableArray *observations;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  int64_t v12;

  v6 = a3;
  observations = self->_observations;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__NUObservatory__removeObserver_forKey___block_invoke;
  v10[3] = &unk_1E50635E8;
  v11 = v6;
  v12 = a4;
  v9 = v6;
  -[NSMutableArray indexesOfObjectsPassingTest:](observations, "indexesOfObjectsPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsAtIndexes:](self->_observations, "removeObjectsAtIndexes:", v8);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *serializer;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  _QWORD block[5];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_22215();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "observer != nil");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_22215();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v13;
        v27 = 2114;
        v28 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUObservatory removeObserver:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUObservatory.m", 130, CFSTR("Invalid parameter not satisfying: %s"), v18, v19, v20, v21, (uint64_t)"observer != nil");
  }
  serializer = self->_serializer;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__NUObservatory_removeObserver___block_invoke;
  block[3] = &unk_1E5063FB8;
  block[4] = self;
  v24 = v4;
  v22 = v4;
  dispatch_sync(serializer, block);

}

- (void)_removeObserver:(id)a3
{
  id v4;
  NSMutableArray *observations;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  observations = self->_observations;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__NUObservatory__removeObserver___block_invoke;
  v8[3] = &unk_1E5063610;
  v9 = v4;
  v7 = v4;
  -[NSMutableArray indexesOfObjectsPassingTest:](observations, "indexesOfObjectsPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsAtIndexes:](self->_observations, "removeObjectsAtIndexes:", v6);

}

- (void)notifyAllObserversForKey:(int64_t)a3 withBlock:(id)a4
{
  id v6;
  NSObject *serializer;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  serializer = self->_serializer;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__NUObservatory_notifyAllObserversForKey_withBlock___block_invoke;
  block[3] = &unk_1E5063638;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_sync(serializer, block);

}

- (void)_notifyAllObserversForKey:(int64_t)a3 withBlock:(id)a4
{
  id v6;
  NSMutableArray *observations;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  int64_t v12;

  v6 = a4;
  observations = self->_observations;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__NUObservatory__notifyAllObserversForKey_withBlock___block_invoke;
  v10[3] = &unk_1E5063660;
  v11 = v6;
  v12 = a3;
  v9 = v6;
  -[NSMutableArray indexesOfObjectsPassingTest:](observations, "indexesOfObjectsPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsAtIndexes:](self->_observations, "removeObjectsAtIndexes:", v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observations, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
}

BOOL __53__NUObservatory__notifyAllObserversForKey_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend(v3, "observer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(v3, "key") == *(_QWORD *)(a1 + 40))
    objc_msgSend(v3, "notifyWithBlock:", *(_QWORD *)(a1 + 32));

  return v4 == 0;
}

uint64_t __52__NUObservatory_notifyAllObserversForKey_withBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyAllObserversForKey:withBlock:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

BOOL __33__NUObservatory__removeObserver___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "observer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = v3 == *(void **)(a1 + 32);
  else
    v4 = 1;

  return v4;
}

uint64_t __32__NUObservatory_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeObserver:", *(_QWORD *)(a1 + 40));
}

BOOL __40__NUObservatory__removeObserver_forKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  objc_msgSend(v3, "observer");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = v4 == *(_QWORD *)(a1 + 32) && objc_msgSend(v3, "key") == *(_QWORD *)(a1 + 40);
  else
    v6 = 1;

  return v6;
}

uint64_t __39__NUObservatory_removeObserver_forKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeObserver:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __48__NUObservatory_addObserver_forKey_queue_block___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addObservation:", *(_QWORD *)(a1 + 40));
}

@end
