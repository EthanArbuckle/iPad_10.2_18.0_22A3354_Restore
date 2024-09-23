@implementation GEORequestCountPowerLogger

void __66__GEORequestCountPowerLogger_incrementCountForClient_requestType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  GEOClientRequestInfo *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v6 = (GEOClientRequestInfo *)objc_claimAutoreleasedReturnValue();
  if (v6
    || (v6 = objc_alloc_init(GEOClientRequestInfo),
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 40)),
        v6))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0CB37E8];
    -[NSMutableDictionary objectForKeyedSubscript:](v6->_requests, "objectForKeyedSubscript:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "unsignedIntegerValue") + 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_requests, "setObject:forKeyedSubscript:", v5, v2);

  }
  else
  {
    v6 = 0;
  }
  -[GEORequestCountPowerLogger _setIsDirty:](*(_QWORD *)(a1 + 32), 1);

}

- (void)_setIsDirty:(uint64_t)a1
{
  NSObject *v4;
  dispatch_time_t v5;
  NSObject *v6;
  uint64_t v7;

  if (a1)
  {
    geo_assert_isolated();
    if (*(unsigned __int8 *)(a1 + 40) != a2)
    {
      *(_BYTE *)(a1 + 40) = a2;
      v4 = *(NSObject **)(a1 + 48);
      if (a2)
      {
        v5 = dispatch_time(0, 30000000000);
        v6 = v4;
        v7 = 5000000000;
      }
      else
      {
        v6 = v4;
        v5 = -1;
        v7 = 0;
      }
      dispatch_source_set_timer(v6, v5, 0xFFFFFFFFFFFFFFFFLL, v7);
    }
  }
}

- (void)incrementCountForClient:(id)a3 requestType:(int)a4
{
  unsigned int v6;
  int v7;
  int v8;
  id v9;
  id v10;

  v9 = a3;
  if (!objc_msgSend(v9, "length"))
    goto LABEL_10;
  objc_opt_self();
  v6 = (a4 >> 8) & 0x7F;
  if (v6 <= 0xB)
  {
    v7 = 1 << v6;
    if ((v7 & 0xAA) != 0)
    {
      v8 = a4 & 0x7F00;
LABEL_7:
      if (v8 == 2560)
        goto LABEL_10;
      goto LABEL_8;
    }
    if ((v7 & 0xC05) != 0)
    {
      v8 = a4;
      goto LABEL_7;
    }
  }
LABEL_8:
  if (-[GEORequestCountPowerLogger _readFromDisk]((uint64_t)self))
  {
    geo_assert_not_isolated();
    v10 = v9;
    geo_isolate_sync_data();

  }
LABEL_10:

}

- (uint64_t)_readFromDisk
{
  uint64_t v1;
  unsigned __int8 v2;
  void *v3;
  char v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  uint32_t v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  id v30;
  _QWORD v31[5];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    geo_assert_not_isolated();
    v2 = atomic_load((unsigned __int8 *)(v1 + 16));
    if ((v2 & 1) != 0)
      return 1;
    +[GEOKeyBagNotification sharedObject](GEOKeyBagNotification, "sharedObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "canAccessFilesWithProtection:", 1);

    if ((v4 & 1) != 0)
    {
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __43__GEORequestCountPowerLogger__readFromDisk__block_invoke;
      v31[3] = &unk_1E1C07858;
      v31[4] = v1;
      v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D765024](v31);
      +[GEORequestCountPowerLogger cacheFileURL]();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

      if ((v9 & 1) == 0)
      {
        GEOGetRequestCountPowerLoggerLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v6;
          _os_log_impl(&dword_1885A9000, v27, OS_LOG_TYPE_DEBUG, "Resetting counters, cache does not exist at %@", buf, 0xCu);
        }

        v5[2](v5, 0);
        goto LABEL_24;
      }
      v30 = 0;
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v6, 0, &v30);
      v11 = v30;
      v12 = v11;
      if (!v10 || v11)
      {
        GEOGetRequestCountPowerLoggerLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v33 = v6;
          v34 = 2112;
          v35 = v12;
          _os_log_impl(&dword_1885A9000, v28, OS_LOG_TYPE_ERROR, "Resetting counters, failed to read %@: %@", buf, 0x16u);
        }

        v5[2](v5, 0);
        goto LABEL_23;
      }
      v13 = (void *)MEMORY[0x1E0C99E60];
      v14 = objc_opt_class();
      v15 = objc_opt_class();
      v16 = objc_opt_class();
      objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v17, v10, &v29);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v29;
      v19 = ((uint64_t (*)(_QWORD, void *))v5[2])(v5, v18);
      GEOGetRequestCountPowerLoggerLog();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if ((v19 & 1) != 0)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v22 = "Successfuly read counters";
          v23 = v21;
          v24 = OS_LOG_TYPE_DEBUG;
          v25 = 2;
LABEL_21:
          _os_log_impl(&dword_1885A9000, v23, v24, v22, buf, v25);
        }
      }
      else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v33 = v6;
        v34 = 2112;
        v35 = v12;
        v22 = "Resetting counters, failed to unarchive %@: %@";
        v23 = v21;
        v24 = OS_LOG_TYPE_ERROR;
        v25 = 22;
        goto LABEL_21;
      }

LABEL_23:
LABEL_24:

      return 1;
    }
    GEOGetRequestCountPowerLoggerLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v26, OS_LOG_TYPE_INFO, "Refusing to read counters, device has not been unlocked.", buf, 2u);
    }

    return 0;
  }
  return result;
}

+ (id)sharedInstance
{
  if (qword_1ECDBBC58 != -1)
    dispatch_once(&qword_1ECDBBC58, &__block_literal_global_54);
  return (id)_MergedGlobals_211;
}

void __44__GEORequestCountPowerLogger_sharedInstance__block_invoke()
{
  GEORequestCountPowerLogger *v0;
  void *v1;

  v0 = objc_alloc_init(GEORequestCountPowerLogger);
  v1 = (void *)_MergedGlobals_211;
  _MergedGlobals_211 = (uint64_t)v0;

}

+ (id)cacheFileURL
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  _QWORD block[4];
  id v6;

  objc_opt_self();
  +[GEOFilePaths urlFor:](GEOFilePaths, "urlFor:", 36);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__GEORequestCountPowerLogger_cacheFileURL__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  v1 = v0;
  v2 = v1;
  v6 = v1;
  if (cacheFileURL_onceToken == -1)
  {
    v3 = v1;
  }
  else
  {
    dispatch_once(&cacheFileURL_onceToken, block);
    v3 = v6;
  }

  return v2;
}

void __42__GEORequestCountPowerLogger_cacheFileURL__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[GEOFilePaths urlFor:](GEOFilePaths, "urlFor:", 32804);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v12 = 0;
    v8 = objc_msgSend(v6, "moveItemAtURL:toURL:error:", v2, v7, &v12);
    v9 = v12;

    if ((v8 & 1) == 0)
    {
      GEOGetRequestCountPowerLoggerLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v14 = v2;
        v15 = 2112;
        v16 = v11;
        v17 = 2112;
        v18 = v9;
        _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_ERROR, "Could not migrate cache from %@ to %@: %@", buf, 0x20u);
      }

    }
  }

}

- (GEORequestCountPowerLogger)init
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *global_queue;
  dispatch_source_t v7;
  void *v8;
  NSObject *v9;
  _QWORD handler[4];
  id v12;
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)GEORequestCountPowerLogger;
  v2 = -[GEORequestCountPowerLogger init](&v15, sel_init);
  if (v2)
  {
    v3 = geo_isolater_create();
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__terminationRequested_, CFSTR("GEODaemonShouldTerminateNotification"), 0);

    global_queue = geo_get_global_queue();
    v7 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, global_queue);
    v8 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v7;

    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 6), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak(&location, v2);
    v9 = *((_QWORD *)v2 + 6);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __34__GEORequestCountPowerLogger_init__block_invoke;
    handler[3] = &unk_1E1C07830;
    v12 = v2;
    objc_copyWeak(&v13, &location);
    dispatch_source_set_event_handler(v9, handler);
    dispatch_activate(*((dispatch_object_t *)v2 + 6));
    objc_destroyWeak(&v13);

    objc_destroyWeak(&location);
  }
  return (GEORequestCountPowerLogger *)v2;
}

void __34__GEORequestCountPowerLogger_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  dispatch_source_set_timer(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 48), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[GEORequestCountPowerLogger _writeToDiskIfNecessary]((uint64_t)WeakRetained);

}

- (void)_writeToDiskIfNecessary
{
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  NSObject *global_queue;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[5];
  NSObject *v10;
  uint8_t *v11;
  uint8_t buf[8];
  uint8_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (a1)
  {
    geo_assert_not_isolated();
    +[GEOKeyBagNotification sharedObject](GEOKeyBagNotification, "sharedObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "canAccessFilesWithProtection:", 1);

    if ((v3 & 1) != 0)
    {
      +[GEORequestCountPowerLogger cacheFileURL]();
      v4 = objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = (void *)v4;
        *(_QWORD *)buf = 0;
        v13 = buf;
        v14 = 0x3032000000;
        v15 = __Block_byref_object_copy__25;
        v16 = __Block_byref_object_dispose__25;
        _GEOCreateTransaction();
        v17 = (id)objc_claimAutoreleasedReturnValue();
        global_queue = geo_get_global_queue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __53__GEORequestCountPowerLogger__writeToDiskIfNecessary__block_invoke;
        block[3] = &unk_1E1BFF8F8;
        block[4] = a1;
        v7 = v5;
        v10 = v7;
        v11 = buf;
        dispatch_async(global_queue, block);

        _Block_object_dispose(buf, 8);
      }
      else
      {
        GEOGetRequestCountPowerLoggerLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_INFO, "Refusing to write counters, device has not created cacehe container.", buf, 2u);
        }

        v7 = 0;
      }
    }
    else
    {
      GEOGetRequestCountPowerLoggerLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_INFO, "Refusing to write counters, device has not been unlocked.", buf, 2u);
      }
    }

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[GEORequestCountPowerLogger _writeToDiskIfNecessary]((uint64_t)self);
  v4.receiver = self;
  v4.super_class = (Class)GEORequestCountPowerLogger;
  -[GEORequestCountPowerLogger dealloc](&v4, sel_dealloc);
}

uint64_t __43__GEORequestCountPowerLogger__readFromDisk__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unsigned __int8 *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v3 = a2;
  geo_isolate_sync_data();
  v4 = (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16);
  do
    __ldaxr(v4);
  while (__stlxr(1u, v4));
  v5 = *((unsigned __int8 *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v5;
}

void __43__GEORequestCountPowerLogger__readFromDisk__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  if (objc_msgSend(*(id *)(a1 + 32), "count") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("startDate"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(v3 + 24);
    *(_QWORD *)(v3 + 24) = v2;

    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("clientInfo"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 32);
    *(_QWORD *)(v6 + 32) = v5;

  }
  v8 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v8 + 24) && *(_QWORD *)(v8 + 32))
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(v11 + 24);
    *(_QWORD *)(v11 + 24) = v10;

    v13 = objc_opt_new();
    v14 = *(_QWORD *)(a1 + 40);
    v15 = *(void **)(v14 + 32);
    *(_QWORD *)(v14 + 32) = v13;

    v9 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9;
}

void __53__GEORequestCountPowerLogger__writeToDiskIfNecessary__block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  char v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18[9];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__25;
  v29 = __Block_byref_object_dispose__25;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__25;
  v23 = __Block_byref_object_dispose__25;
  v24 = 0;
  v2 = (void *)a1[4];
  v18[1] = (id)MEMORY[0x1E0C809B0];
  v18[2] = (id)3221225472;
  v18[3] = __53__GEORequestCountPowerLogger__writeToDiskIfNecessary__block_invoke_2;
  v18[4] = &unk_1E1C07880;
  v18[5] = v2;
  v18[6] = &v31;
  v18[7] = &v25;
  v18[8] = &v19;
  geo_isolate_sync_data();
  if (*((_BYTE *)v32 + 24))
  {
    v3 = v26[5];
    v39[0] = CFSTR("startDate");
    v39[1] = CFSTR("clientInfo");
    v4 = v20[5];
    v40[0] = v3;
    v40[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v18[0];
    v8 = v7;
    if (!v6 || v7)
    {
      GEOGetRequestCountPowerLoggerLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v8;
        _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "Failed to archive request counts %@", buf, 0xCu);
      }

    }
    else
    {
      v9 = a1[5];
      v17 = 0;
      v10 = objc_msgSend(v6, "writeToURL:options:error:", v9, 0x40000000, &v17);
      v8 = v17;
      if (v8)
        v11 = 0;
      else
        v11 = v10;
      GEOGetRequestCountPowerLoggerLog();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if ((v11 & 1) != 0)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_DEBUG, "Successfuly wrote request counts", buf, 2u);
        }

        v14 = *(_QWORD *)(a1[6] + 8);
        v8 = *(id *)(v14 + 40);
        *(_QWORD *)(v14 + 40) = 0;
      }
      else
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v16 = (void *)a1[5];
          *(_DWORD *)buf = 138412546;
          v36 = v16;
          v37 = 2112;
          v38 = v8;
          _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, "Failed to write request counts to %@: %@", buf, 0x16u);
        }

      }
    }

  }
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
}

void __53__GEORequestCountPowerLogger__writeToDiskIfNecessary__block_invoke_2(uint64_t *a1)
{
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = a1[4];
  if (v2)
  {
    geo_assert_isolated();
    v3 = *(_BYTE *)(v2 + 40) != 0;
  }
  else
  {
    v3 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v3;
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 24));
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:copyItems:", *(_QWORD *)(a1[4] + 32), 1);
    v5 = *(_QWORD *)(a1[7] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    -[GEORequestCountPowerLogger _setIsDirty:](a1[4], 0);
  }
}

- (void)flushToPowerLog
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  int v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t *);
  void *v21;
  GEORequestCountPowerLogger *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  const __CFString *v38;
  __int16 v39;
  id v40;
  _QWORD v41[2];
  _QWORD v42[3];

  v42[2] = *MEMORY[0x1E0C80C00];
  geo_assert_not_isolated();
  if (-[GEORequestCountPowerLogger _readFromDisk]((uint64_t)self))
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__25;
    v35 = __Block_byref_object_dispose__25;
    v36 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__25;
    v29 = __Block_byref_object_dispose__25;
    v30 = 0;
    v3 = MEMORY[0x1E0C809B0];
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __45__GEORequestCountPowerLogger_flushToPowerLog__block_invoke;
    v21 = &unk_1E1C00788;
    v22 = self;
    v23 = &v31;
    v24 = &v25;
    geo_isolate_sync_data();
    if (objc_msgSend((id)v26[5], "count") && PLShouldLogRegisteredEvent())
    {
      v4 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend((id)v32[5], "timeIntervalSince1970");
      objc_msgSend(v4, "numberWithDouble:");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSince1970");
      objc_msgSend(v6, "numberWithDouble:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_alloc(MEMORY[0x1E0C99E08]);
      v41[0] = CFSTR("StartUnix");
      v41[1] = CFSTR("EndUnix");
      v42[0] = v5;
      v42[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithDictionary:", v10);

      v12 = (void *)v26[5];
      v16[0] = v3;
      v16[1] = 3221225472;
      v16[2] = __45__GEORequestCountPowerLogger_flushToPowerLog__block_invoke_2;
      v16[3] = &unk_1E1C078A8;
      v13 = v11;
      v17 = v13;
      objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v16);
      PLLogRegisteredEvent();
      GEOGetRequestCountPowerLoggerLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138478083;
        v38 = CFSTR("GEO Network Activity");
        v39 = 2113;
        v40 = v13;
        _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_DEBUG, "Flushed network activity to powerlog:\n[%{private}@] %{private}@", buf, 0x16u);
      }

    }
    else
    {
      GEOGetRequestCountPowerLoggerLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v15 = objc_msgSend((id)v26[5], "count");
        *(_DWORD *)buf = 138478083;
        v38 = CFSTR("GEO Network Activity");
        v39 = 1024;
        LODWORD(v40) = v15;
        _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "Not flushing network activity to powerlog %{private}@ either [_clientInfo count] (%u) == 0 or ShouldLog == NO", buf, 0x12u);
      }
    }

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v31, 8);

  }
}

void __45__GEORequestCountPowerLogger_flushToPowerLog__block_invoke(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 24));
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 32));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  v5 = objc_opt_new();
  v6 = a1[4];
  v7 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v5;

  -[GEORequestCountPowerLogger _setIsDirty:](a1[4], 1);
}

uint64_t __45__GEORequestCountPowerLogger_flushToPowerLog__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    a3 = *(_QWORD *)(a3 + 8);
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

+ (void)submitBackgroundTasksNeededDuringDaemonStart
{
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  __CFString *v9;
  NSObject *v10;
  const __CFString *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (BackgroundSystemTasksLibraryCore())
  {
    objc_opt_self();
    if (BackgroundSystemTasksLibraryCore())
    {
      objc_msgSend(getBGSystemTaskSchedulerClass(), "sharedScheduler");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      v3 = objc_msgSend(v2, "cancelTaskRequestWithIdentifier:error:", CFSTR("com.apple.geod.RequestCountPowerLogger"), &v13);
      v4 = v13;

      if ((v3 & 1) == 0)
      {
        GEOGetRequestCountPowerLoggerLog();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v15 = CFSTR("com.apple.geod.RequestCountPowerLogger");
          v16 = 2112;
          v17 = v4;
          _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_ERROR, "Trouble cancelling %@ with error %@", buf, 0x16u);
        }

      }
    }
    v6 = (void *)objc_msgSend(objc_alloc((Class)getBGRepeatingSystemTaskRequestClass()), "initWithIdentifier:", CFSTR("com.apple.geod.RequestCountPowerLogger"));
    objc_msgSend(v6, "setInterval:", (double)GEOConfigGetUint64(GeoServicesConfig_RequestCountPowerLogFlushInterval, (uint64_t)off_1EDF4CCF8));
    objc_msgSend(v6, "setRequiresNetworkConnectivity:", 0);
    objc_msgSend(getBGSystemTaskSchedulerClass(), "sharedScheduler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v8 = objc_msgSend(v7, "submitTaskRequest:error:", v6, &v12);
    v9 = (__CFString *)v12;

    if ((v8 & 1) == 0)
    {
      GEOGetRequestCountPowerLoggerLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = CFSTR("Unknown");
        if (v9)
          v11 = v9;
        *(_DWORD *)buf = 138412290;
        v15 = v11;
        _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_ERROR, "Failed to submit task with error: %@", buf, 0xCu);
      }

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeTimer, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_isolater, 0);
}

@end
