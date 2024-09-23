@implementation GEOResourceManifestUpdateAssertionRegistry

+ (id)sharedRegistry
{
  if (qword_1ECDBBFF8 != -1)
    dispatch_once(&qword_1ECDBBFF8, &__block_literal_global_90);
  return (id)_MergedGlobals_237;
}

void __65__GEOResourceManifestUpdateAssertionRegistry_hasActiveAssertions__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  void *v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v1);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v7, "isExpired"))
        {
          GEOGetResourceManifestLog();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v15 = v7;
            _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "Update assertion is expired due to timeout: %{public}@", buf, 0xCu);
          }

          if (!v4)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v4, "addObject:", v7);
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  if (objc_msgSend(v4, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectsInArray:", v4);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count") != 0;

}

- (BOOL)hasActiveAssertions
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  geo_isolate_sync_data();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __60__GEOResourceManifestUpdateAssertionRegistry_sharedRegistry__block_invoke()
{
  GEOResourceManifestUpdateAssertionRegistry *v0;
  void *v1;

  v0 = objc_alloc_init(GEOResourceManifestUpdateAssertionRegistry);
  v1 = (void *)_MergedGlobals_237;
  _MergedGlobals_237 = (uint64_t)v0;

}

- (GEOResourceManifestUpdateAssertionRegistry)init
{
  GEOResourceManifestUpdateAssertionRegistry *v2;
  uint64_t v3;
  geo_isolater *isolation;
  void *v5;
  GEOResourceManifestUpdateAssertionRegistry *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GEOResourceManifestUpdateAssertionRegistry;
  v2 = -[GEOResourceManifestUpdateAssertionRegistry init](&v8, sel_init);
  if (v2)
  {
    v3 = geo_isolater_create();
    isolation = v2->_isolation;
    v2->_isolation = (geo_isolater *)v3;

    dispatch_get_global_queue(17, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GEORegisterPListStateCaptureLegacy();

    v6 = v2;
  }

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  GEOUnregisterStateCaptureLegacy();
  v3.receiver = self;
  v3.super_class = (Class)GEOResourceManifestUpdateAssertionRegistry;
  -[GEOResourceManifestUpdateAssertionRegistry dealloc](&v3, sel_dealloc);
}

- (id)addAssertionForProcess:(id)a3 reason:(id)a4 creationTimestamp:(double)a5
{
  id v7;
  id v8;
  NSObject *v9;
  _GEOResourceManifestUpdateAssertionRecord *v10;
  _GEOResourceManifestUpdateAssertionRecord *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  GEOGetResourceManifestLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v14 = v7;
    v15 = 2114;
    v16 = v8;
    _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_INFO, "Taking new update assertion for '%{public}@': %{public}@", buf, 0x16u);
  }

  v12 = -[_GEOResourceManifestUpdateAssertionRecord initWithProcess:reason:creationTimestamp:]([_GEOResourceManifestUpdateAssertionRecord alloc], "initWithProcess:reason:creationTimestamp:", v7, v8, a5);
  geo_isolate_sync_data();
  v10 = v12;

  return v10;
}

uint64_t __94__GEOResourceManifestUpdateAssertionRegistry_addAssertionForProcess_reason_creationTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

- (id)addInternalAssertionForReason:(id)a3
{
  id v3;
  NSObject *v4;
  _GEOInternalResourceManifestUpdateAssertionRecord *v5;
  _GEOInternalResourceManifestUpdateAssertionRecord *v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  GEOGetResourceManifestLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v3;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_INFO, "Taking new internal update assertion for : %{public}@", buf, 0xCu);
  }

  v7 = -[_GEOInternalResourceManifestUpdateAssertionRecord initWithReason:]([_GEOInternalResourceManifestUpdateAssertionRecord alloc], "initWithReason:", v3);
  geo_isolate_sync_data();
  v5 = v7;

  return v5;
}

uint64_t __76__GEOResourceManifestUpdateAssertionRegistry_addInternalAssertionForReason___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeAssertion:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    GEOGetResourceManifestLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "process");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "reason");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v10 = v6;
      v11 = 2114;
      v12 = v7;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_INFO, "Clearing update assertion for '%{public}@': %{public}@", buf, 0x16u);

    }
    v8 = v4;
    geo_isolate_sync_data();

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [assertion isKindOfClass:_GEOResourceManifestUpdateAssertionRecord.class]", buf, 2u);
  }

}

uint64_t __62__GEOResourceManifestUpdateAssertionRegistry_removeAssertion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (id)activeAssertionsDescription
{
  void *v3;
  geo_isolater *v5;

  v5 = self->_isolation;
  _geo_isolate_lock_data();
  -[NSMutableArray description](self->_assertions, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _geo_isolate_unlock();

  return v3;
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  id v3;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  geo_isolate_sync_data();
  v3 = v5;

  return v3;
}

void __73__GEOResourceManifestUpdateAssertionRegistry_captureStatePlistWithHints___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double Current;
  double v12;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v16 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v7 = *(void **)(a1 + 40);
        v8 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "process");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "reason");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        Current = CFAbsoluteTimeGetCurrent();
        objc_msgSend(v6, "creationTimestamp");
        objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: %@ (%f seconds old)"), v9, v10, Current - v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v3);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
}

@end
