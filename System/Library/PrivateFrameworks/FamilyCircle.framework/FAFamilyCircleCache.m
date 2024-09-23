@implementation FAFamilyCircleCache

- (FAFamilyCircleCache)initWithAccount:(id)a3
{
  id v5;
  FAFamilyCircleCache *v6;
  FAFamilyCircleCache *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAFamilyCircleCache;
  v6 = -[FAFamilyCircleCache init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (id)_cacheURLWithError:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v10;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  if (v6)
  {
    _FALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[FAFamilyCircleCache _cacheURLWithError:].cold.1();

    if (a3)
      *a3 = objc_retainAutorelease(v6);
  }
  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("FamilyCircle/CircleCache.plist"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)cacheQueue
{
  if (cacheQueue_onceToken != -1)
    dispatch_once(&cacheQueue_onceToken, &__block_literal_global_6);
  return (id)cacheQueue_cacheQueue;
}

void __33__FAFamilyCircleCache_cacheQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("FAFetchFamilyCircleOperation Cache Queue", v2);
  v1 = (void *)cacheQueue_cacheQueue;
  cacheQueue_cacheQueue = (uint64_t)v0;

}

- (id)_fetchData:(id *)a3
{
  NSObject *v5;
  id v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__1;
  v13 = __Block_byref_object_dispose__1;
  v14 = 0;
  objc_msgSend((id)objc_opt_class(), "cacheQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__FAFamilyCircleCache__fetchData___block_invoke;
  block[3] = &unk_1E8561D00;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v5, block);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __34__FAFamilyCircleCache__fetchData___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (void *)a1[4];
  v9 = 0;
  objc_msgSend(v2, "_cacheURLWithError:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v5, 0, a1[6]);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[5] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  else if (v4 && a1[6])
  {
    *(_QWORD *)a1[6] = objc_retainAutorelease(v4);
  }

}

- (id)_username
{
  void *v2;
  void *v3;

  -[FAFamilyCircleCache account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_personID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)load
{
  id v3;
  _QWORD v5[5];

  v3 = objc_alloc(MEMORY[0x1E0CF0EB0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__FAFamilyCircleCache_load__block_invoke;
  v5[3] = &unk_1E85618E0;
  v5[4] = self;
  return (id)objc_msgSend(v3, "initWithBlock:", v5);
}

void __27__FAFamilyCircleCache_load__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void (**v3)(id, void *, id);
  void *v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v6 = 0;
  v3 = a2;
  objc_msgSend(v2, "loadWithError:", &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  v3[2](v3, v4, v5);

}

- (id)loadWithError:(id *)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  FAFamilyCircleCacheResponse *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  int v31;
  void *v32;
  double v33;
  double v34;
  NSObject *v35;
  FAFamilyCircle *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  _FASignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = _FASignpostCreate(v5);
  v8 = v7;

  _FASignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAEBA000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v6, "LoadFamilyCache", ", buf, 2u);
  }

  _FASignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[FAFamilyCircleCache loadWithError:].cold.7();

  v54 = 0;
  -[FAFamilyCircleCache _fetchData:](self, "_fetchData:", &v54);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v54;
  if (v14)
  {
    _FALogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[FAFamilyCircleCache loadWithError:].cold.6();

    if (a3)
      *a3 = objc_retainAutorelease(v14);
    _FASignpostGetNanoseconds(v6, v8);
    _FASignpostLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CAEBA000, v17, OS_SIGNPOST_INTERVAL_END, v6, "LoadFamilyCache", ", buf, 2u);
    }

    _FASignpostLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[FAFamilyCircleCache loadWithError:].cold.1();
LABEL_59:
    v24 = 0;
    goto LABEL_60;
  }
  if (!v13)
    goto LABEL_54;
  v53 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v13, 0, 0, &v53);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v53;
  if (!v18)
  {
    if (v19)
    {
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("username"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("serverTag"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("timestamp"));
      v26 = objc_claimAutoreleasedReturnValue();
      v49 = v19;
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("circle"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[FAFamilyCircleCache _username](self, "_username");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v25;
      v24 = (FAFamilyCircleCacheResponse *)objc_msgSend(v25, "isEqualToString:", v28);

      v52 = (void *)v26;
      v29 = v26 == 0;
      v30 = v27;
      if (v29)
        v31 = 0;
      else
        v31 = (int)v24;
      if (!v27)
        v31 = 0;
      v48 = v31;
      if (v31 == 1)
      {
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("cacheDuration"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "doubleValue");
        v34 = v33;

        if (v34 == 0.0)
        {
          _FALogSystem();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v56 = 0x40F5180000000000;
            _os_log_impl(&dword_1CAEBA000, v35, OS_LOG_TYPE_DEFAULT, "Defaulting to cache age of: %f", buf, 0xCu);
          }

          v34 = 86400.0;
        }
        v36 = -[FAFamilyCircle initWithServerResponse:]([FAFamilyCircle alloc], "initWithServerResponse:", v27);
        v24 = -[FAFamilyCircleCacheResponse initWithFamilyCircle:serverTag:cacheDate:maxAge:]([FAFamilyCircleCacheResponse alloc], "initWithFamilyCircle:serverTag:cacheDate:maxAge:", v36, v51, v52, v34);
        _FASignpostGetNanoseconds(v6, v8);
        _FASignpostLogSystem();
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = v37;
        if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CAEBA000, v38, OS_SIGNPOST_INTERVAL_END, v6, "LoadFamilyCache", ", buf, 2u);
        }

        _FASignpostLogSystem();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          -[FAFamilyCircleCache loadWithError:].cold.1();

        v30 = v27;
      }
      else
      {
        _FALogSystem();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v24);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v52 == 0);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v30 == 0);
          v42 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v56 = (uint64_t)v47;
          v57 = 2112;
          v58 = v46;
          v59 = 2112;
          v60 = v42;
          v24 = (FAFamilyCircleCacheResponse *)v42;
          v36 = (FAFamilyCircle *)v41;
          _os_log_impl(&dword_1CAEBA000, v41, OS_LOG_TYPE_DEFAULT, "Invalid cache detected... validUser: %@, cachedTimestamp: %@, cachedCirclePlist: %@", buf, 0x20u);

        }
        else
        {
          v36 = (FAFamilyCircle *)v41;
        }
      }
      v19 = v49;

      if ((v48 & 1) != 0)
        goto LABEL_28;
    }
    else
    {
      _FALogSystem();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CAEBA000, v40, OS_LOG_TYPE_DEFAULT, "FAFamilyCircleCache plist == nil", buf, 2u);
      }

    }
LABEL_54:
    _FASignpostGetNanoseconds(v6, v8);
    _FASignpostLogSystem();
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CAEBA000, v44, OS_SIGNPOST_INTERVAL_END, v6, "LoadFamilyCache", ", buf, 2u);
    }

    _FASignpostLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[FAFamilyCircleCache loadWithError:].cold.1();
    goto LABEL_59;
  }
  _FALogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[FAFamilyCircleCache loadWithError:].cold.4();

  if (a3)
    *a3 = objc_retainAutorelease(v18);
  _FASignpostGetNanoseconds(v6, v8);
  _FASignpostLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAEBA000, v22, OS_SIGNPOST_INTERVAL_END, v6, "LoadFamilyCache", ", buf, 2u);
  }

  _FASignpostLogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    -[FAFamilyCircleCache loadWithError:].cold.1();

  v24 = 0;
LABEL_28:

LABEL_60:
  return v24;
}

- (BOOL)_isCacheDate:(id)a3 withinDuration:(double)a4
{
  id v5;
  double v6;
  double v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "timeIntervalSinceNow");
  v7 = fabs(v6);
  _FALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 >= a4)
  {
    if (v9)
    {
      v12 = 138412290;
      v13 = v5;
      v10 = "Attempting to fetch the family circle from the server as the cache is stale (%@)";
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    v12 = 138412290;
    v13 = v5;
    v10 = "Skipping server fetch of family circle as the cache is fresh (%@)";
LABEL_6:
    _os_log_impl(&dword_1CAEBA000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0xCu);
  }

  return v7 < a4;
}

- (id)_cacheDataWithFamilyCircle:(id)a3 serverTag:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0CF0EB0]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__FAFamilyCircleCache__cacheDataWithFamilyCircle_serverTag___block_invoke;
  v13[3] = &unk_1E8561D28;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  v11 = (void *)objc_msgSend(v8, "initWithBlock:", v13);

  return v11;
}

void __60__FAFamilyCircleCache__cacheDataWithFamilyCircle_serverTag___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a2;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("timestamp"));

  objc_msgSend(*(id *)(a1 + 32), "_username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("username"));

  objc_msgSend(*(id *)(a1 + 40), "_serverResponse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("circle"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("serverTag"));
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 100, 0, &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v9, v10);

}

- (id)_cacheURL
{
  id v3;
  _QWORD v5[5];

  v3 = objc_alloc(MEMORY[0x1E0CF0EB0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__FAFamilyCircleCache__cacheURL__block_invoke;
  v5[3] = &unk_1E85618E0;
  v5[4] = self;
  return (id)objc_msgSend(v3, "initWithBlock:", v5);
}

void __32__FAFamilyCircleCache__cacheURL__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void (**v3)(id, void *, id);
  void *v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v6 = 0;
  v3 = a2;
  objc_msgSend(v2, "_cacheURLWithError:", &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  v3[2](v3, v4, v5);

}

- (id)_createCacheFile
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  _QWORD v7[5];

  -[FAFamilyCircleCache _cacheURL](self, "_cacheURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "then");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__FAFamilyCircleCache__createCacheFile__block_invoke;
  v7[3] = &unk_1E8561D78;
  v7[4] = self;
  ((void (**)(_QWORD, _QWORD *))v4)[2](v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __39__FAFamilyCircleCache__createCacheFile__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__FAFamilyCircleCache__createCacheFile__block_invoke_2;
  v8[3] = &unk_1E8561D50;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "_onQueue:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __39__FAFamilyCircleCache__createCacheFile__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if ((v5 & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = 0,
        objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v11),
        v7 = v11,
        v6,
        (v8 = v7) == 0))
  {
    v7 = 0;
    v8 = *(void **)(a1 + 32);
  }
  v9 = v8;

  return v9;
}

- (id)updateWithFamilyCircle:(id)a3 serverTag:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0CF0EB0]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__FAFamilyCircleCache_updateWithFamilyCircle_serverTag___block_invoke;
  v13[3] = &unk_1E8561D28;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  v11 = (void *)objc_msgSend(v8, "initWithBlock:", v13);

  return v11;
}

void __56__FAFamilyCircleCache_updateWithFamilyCircle_serverTag___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "cacheQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__FAFamilyCircleCache_updateWithFamilyCircle_serverTag___block_invoke_2;
  v7[3] = &unk_1E8561DE0;
  v5 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  v10 = v3;
  v6 = v3;
  dispatch_async(v4, v7);

}

void __56__FAFamilyCircleCache_updateWithFamilyCircle_serverTag___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_cacheDataWithFamilyCircle:serverTag:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_createCacheFile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CF0EB0];
  v9[0] = v2;
  v9[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "all:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "then");
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v7)[2](v7, &__block_literal_global_42);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "onComplete:", *(_QWORD *)(a1 + 56));

}

id __56__FAFamilyCircleCache_updateWithFamilyCircle_serverTag___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  objc_msgSend(v3, "writeToURL:options:error:", v4, 1073741825, &v8);
  v5 = v8;
  _FALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[FAFamilyCircleCache updateWithFamilyCircle:serverTag:]_block_invoke_3";
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1CAEBA000, v6, OS_LOG_TYPE_DEFAULT, "%s: writeToURL completed error:%@", buf, 0x16u);
  }

  return v5;
}

- (id)_onQueue:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CF0EB0]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __32__FAFamilyCircleCache__onQueue___block_invoke;
  v9[3] = &unk_1E8561E30;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithBlock:", v9);

  return v7;
}

void __32__FAFamilyCircleCache__onQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "cacheQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__FAFamilyCircleCache__onQueue___block_invoke_2;
  v6[3] = &unk_1E8561E08;
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

void __32__FAFamilyCircleCache__onQueue___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  id v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = 0;
    v3 = v4;
  }
  else
  {
    v2 = v4;
    v3 = 0;
  }
  (*(void (**)(_QWORD, id, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v2, v3);

}

- (id)invalidate
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  _QWORD v7[5];

  -[FAFamilyCircleCache _cacheURL](self, "_cacheURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "then");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__FAFamilyCircleCache_invalidate__block_invoke;
  v7[3] = &unk_1E8561D78;
  v7[4] = self;
  ((void (**)(_QWORD, _QWORD *))v4)[2](v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __33__FAFamilyCircleCache_invalidate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__FAFamilyCircleCache_invalidate__block_invoke_2;
  v8[3] = &unk_1E8561D50;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "_onQueue:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __33__FAFamilyCircleCache_invalidate__block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v6;

  v2 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "checkResourceIsReachableAndReturnError:", 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 0;
    objc_msgSend(v3, "removeItemAtURL:error:", v4, &v6);
    v2 = v6;

  }
  return v2;
}

- (ACAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)_cacheURLWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1CAEBA000, v0, v1, "Call to fetch URL for circle cache provided error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

- (void)loadWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1CAEBA000, v0, v1, "END [%lld] %fs:LoadFamilyCache ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

- (void)loadWithError:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1CAEBA000, v0, v1, "Error parsing family circle cache: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

- (void)loadWithError:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1CAEBA000, v0, v1, "Error fetching family circle cache: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

- (void)loadWithError:.cold.7()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1CAEBA000, v0, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: LoadFamilyCache ", v1, 0xCu);
  OUTLINED_FUNCTION_0_0();
}

@end
