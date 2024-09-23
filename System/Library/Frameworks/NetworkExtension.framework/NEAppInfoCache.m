@implementation NEAppInfoCache

- (NEAppInfoCache)init
{
  NEAppInfoCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *cachedSourceAppInfo;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *cacheQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NEAppInfoCache;
  v2 = -[NEAppInfoCache init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cachedSourceAppInfo = v2->_cachedSourceAppInfo;
    v2->_cachedSourceAppInfo = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("NEAppInfoCache queue", v5);
    cacheQueue = v2->_cacheQueue;
    v2->_cacheQueue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheQueue, 0);
  objc_storeStrong((id *)&self->_cachedSourceAppInfo, 0);
  objc_destroyWeak((id *)&self->_lookupDelegate);
}

+ (id)sharedAppInfoCache
{
  objc_opt_self();
  if (sharedAppInfoCache_onceToken != -1)
    dispatch_once(&sharedAppInfoCache_onceToken, &__block_literal_global);
  return (id)sharedAppInfoCache_sharedAppInfoCache;
}

void __36__NEAppInfoCache_sharedAppInfoCache__block_invoke()
{
  NEAppInfoCache *v0;
  void *v1;

  v0 = objc_alloc_init(NEAppInfoCache);
  v1 = (void *)sharedAppInfoCache_sharedAppInfoCache;
  sharedAppInfoCache_sharedAppInfoCache = (uint64_t)v0;

}

- (void)appInfoForPid:(void *)a3 UUID:(void *)a4 bundleID:(void *)a5 completionHandler:
{
  id v9;
  id v10;
  const char *v11;
  void (**v12)(id, _QWORD);
  NSObject *Property;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  void *v18;
  void (**v19)(id, _QWORD);
  int v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v12 = a5;
  if (a1)
  {
    if (a2 < 0)
    {
      ne_log_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[NEAppInfoCache appInfoForPid:UUID:bundleID:completionHandler:]";
        v23 = 1024;
        v24 = a2;
        _os_log_fault_impl(&dword_19BD16000, v14, OS_LOG_TYPE_FAULT, "%s got invalid pid: %d", buf, 0x12u);
      }

      v12[2](v12, 0);
    }
    else
    {
      Property = objc_getProperty(a1, v11, 24, 1);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64__NEAppInfoCache_appInfoForPid_UUID_bundleID_completionHandler___block_invoke;
      block[3] = &unk_1E3CC1888;
      v20 = a2;
      v16 = v9;
      v17 = v10;
      v18 = a1;
      v19 = v12;
      dispatch_async(Property, block);

    }
  }

}

void __64__NEAppInfoCache_appInfoForPid_UUID_bundleID_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  id v4;
  id Property;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id *v14;
  id *v15;
  id *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  id v27;
  _QWORD v28[2];
  int v29;
  _QWORD v30[5];
  id v31;
  id v32;
  _QWORD v33[2];
  int v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  int v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  v40 = 0;
  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v22 = *(_DWORD *)(a1 + 64);
    v23 = *(_QWORD *)(a1 + 32);
    v24 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 67109634;
    v42 = v22;
    v43 = 2112;
    v44 = v23;
    v45 = 2112;
    v46 = v24;
    _os_log_debug_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEBUG, "Fetching appInfo from cache for pid: %d uuid: %@ bundle id: %@", buf, 0x1Cu);
  }

  v4 = *(id *)(a1 + 32);
  if (v4)
  {
    Property = *(id *)(a1 + 48);
    if (Property)
      Property = objc_getProperty(Property, v3, 16, 1);
    v6 = Property;
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v36[5];
    v36[5] = v7;

  }
  v9 = v36[5];
  if (!v9)
  {
    v11 = *(void **)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v12 = *(unsigned int *)(a1 + 64);
    v13 = *(void **)(a1 + 32);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __64__NEAppInfoCache_appInfoForPid_UUID_bundleID_completionHandler___block_invoke_2;
    v25[3] = &unk_1E3CBF418;
    v28[1] = &v35;
    v25[4] = v10;
    v26 = v13;
    v27 = *(id *)(a1 + 40);
    v28[0] = *(id *)(a1 + 56);
    v29 = *(_DWORD *)(a1 + 64);
    -[NEAppInfoCache performCustomLookupIfNecessaryForPid:UUID:bundleID:completionHandler:](v10, v12, v26, v11, v25);
    v14 = &v26;
    v15 = &v27;
    v16 = (id *)v28;
LABEL_13:

    goto LABEL_14;
  }
  if (!*(_QWORD *)(v9 + 40))
  {
    v17 = *(unsigned int *)(a1 + 64);
    if ((int)v17 >= 1)
    {
      v18 = *(void **)(a1 + 32);
      v19 = *(void **)(a1 + 40);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __64__NEAppInfoCache_appInfoForPid_UUID_bundleID_completionHandler___block_invoke_46;
      v30[3] = &unk_1E3CBF418;
      v21 = *(_QWORD *)(a1 + 48);
      v20 = *(void **)(a1 + 56);
      v33[1] = &v35;
      v30[4] = v21;
      v33[0] = v20;
      v31 = *(id *)(a1 + 32);
      v32 = *(id *)(a1 + 40);
      v34 = *(_DWORD *)(a1 + 64);
      -[NEAppInfoCache performCustomLookupIfNecessaryForPid:UUID:bundleID:completionHandler:](v21, v17, v18, v19, v30);
      v14 = (id *)v33;
      v15 = &v31;
      v16 = &v32;
      goto LABEL_13;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_14:

  _Block_object_dispose(&v35, 8);
}

void __64__NEAppInfoCache_appInfoForPid_UUID_bundleID_completionHandler___block_invoke_46(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = a2;
  v8 = v4;
  if (v4)
  {
    if (!-[NEAppInfoCache appInfo:mismatchedWithUUID:andBundleID:](*(_QWORD *)(a1 + 32), v4, *(void **)(a1 + 40), *(void **)(a1 + 48)))
    {
      v7 = *(_QWORD *)(a1 + 64);
      v6 = a1 + 64;
      objc_storeStrong((id *)(*(_QWORD *)(v7 + 8) + 40), a2);
      -[NEAppInfoCache addAppInfoToCache:](*(void **)(v6 - 32), *(void **)(*(_QWORD *)(*(_QWORD *)v6 + 8) + 40));
      v5 = *(_QWORD *)(v6 - 8);
      goto LABEL_6;
    }
    -[NEAppInfoCache addAppInfoToCache:](*(void **)(a1 + 32), v8);
  }
  v5 = *(_QWORD *)(a1 + 56);
  v6 = a1 + 64;
LABEL_6:
  (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v6 + 8) + 40));

}

- (void)performCustomLookupIfNecessaryForPid:(void *)a3 UUID:(void *)a4 bundleID:(void *)a5 completionHandler:
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  const uint8_t *uuid;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *string;
  const char *v24;
  const void *data;
  const void *v26;
  id v27;
  void *v28;
  void *v29;
  NEAppInfo *v30;
  NEAppInfo *v31;
  const char *v32;
  SEL v33;
  SEL v34;
  SEL v35;
  NSObject *v36;
  id v37;
  id v38;
  void *v39;
  _QWORD v40[5];
  id v41;
  _BYTE length[18];
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    if (WeakRetained)
    {
      ne_log_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)length = 67109634;
        *(_DWORD *)&length[4] = a2;
        *(_WORD *)&length[8] = 2112;
        *(_QWORD *)&length[10] = v9;
        v43 = 2112;
        v44 = v10;
        _os_log_debug_impl(&dword_19BD16000, v13, OS_LOG_TYPE_DEBUG, "Calling delegate lookup handler with pid: %d, uuid: %@, bundleID: %@", length, 0x1Cu);
      }

      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __87__NEAppInfoCache_performCustomLookupIfNecessaryForPid_UUID_bundleID_completionHandler___block_invoke;
      v40[3] = &unk_1E3CC0478;
      v40[4] = a1;
      v41 = v11;
      objc_msgSend(WeakRetained, "fetchAppInfoForPID:UUID:bundleID:completionHandler:", a2, v9, v10, v40);

LABEL_39:
      goto LABEL_40;
    }
    v14 = v10;
    ne_log_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)length = 67109378;
      *(_DWORD *)&length[4] = a2;
      *(_WORD *)&length[8] = 2112;
      *(_QWORD *)&length[10] = v14;
      _os_log_debug_impl(&dword_19BD16000, v15, OS_LOG_TYPE_DEBUG, "Origin lookup for pid %d, bundle id: %@", length, 0x12u);
    }

    v39 = v14;
    if (v14)
    {
      v16 = (void *)objc_msgSend(v14, "length");
      if (v16)
      {
        -[NEAppInfoCache bundleIDWithoutTeamID:](v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v16 = 0;
    }
    v38 = objc_retainAutorelease(v16);
    objc_msgSend(v38, "UTF8String");
    v17 = (void *)NEHelperCopyAppInfo();
    v18 = v17;
    v37 = v9;
    if (v17)
    {
      uuid = xpc_dictionary_get_uuid(v17, "app-euuid");
      if (uuid)
        v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uuid);
      else
        v20 = 0;
      string = xpc_dictionary_get_string(v18, "app-identifier");
      if (string)
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
      else
        v21 = 0;
      v24 = xpc_dictionary_get_string(v18, "version-string");
      if (v24)
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v24);
      else
        v22 = 0;
      *(_QWORD *)length = 0;
      data = xpc_dictionary_get_data(v18, "app-cd-hash", (size_t *)length);
      if (*(_QWORD *)length)
      {
        v26 = data;
        v27 = objc_alloc(MEMORY[0x1E0C99D50]);
        v28 = (void *)objc_msgSend(v27, "initWithBytes:length:", v26, *(_QWORD *)length);
LABEL_26:
        v29 = (void *)v20;
        if (!v20 && !v21 && !v22 && !v28)
        {
          v30 = 0;
LABEL_36:
          ne_log_large_obj();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)length = 138412290;
            *(_QWORD *)&length[4] = v30;
            _os_log_debug_impl(&dword_19BD16000, v36, OS_LOG_TYPE_DEBUG, "Origin lookup created appInfo:\n%@", length, 0xCu);
          }

          (*((void (**)(id, NEAppInfo *))v11 + 2))(v11, v30);
          v9 = v37;
          goto LABEL_39;
        }
        v31 = objc_alloc_init(NEAppInfo);
        v30 = v31;
        if ((int)a2 < 1)
        {
          if (!v31)
            goto LABEL_36;
        }
        else
        {
          if (!v31)
            goto LABEL_36;
          v31->_pid = a2;
        }
        objc_setProperty_nonatomic_copy(v31, v32, v29, 16);
        objc_setProperty_nonatomic_copy(v30, v33, v21, 24);
        objc_setProperty_nonatomic_copy(v30, v34, v22, 32);
        objc_setProperty_nonatomic_copy(v30, v35, v28, 40);
        goto LABEL_36;
      }
    }
    else
    {
      v20 = 0;
      v21 = 0;
      v22 = 0;
    }
    v28 = 0;
    goto LABEL_26;
  }
LABEL_40:

}

void __64__NEAppInfoCache_appInfoForPid_UUID_bundleID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void (*v12)(void);
  int v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  _QWORD v17[5];
  __int128 v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (!v5)
  {
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v13 = *(_DWORD *)(a1 + 72);
      v15 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 67109634;
      v20 = v13;
      v21 = 2112;
      v22 = v14;
      v23 = 2112;
      v24 = v15;
      _os_log_debug_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEBUG, "Could not look up appInfo for pid: %d bundle id: %@ uuid: %@", buf, 0x1Cu);
    }

    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_8;
  }
  v6 = -[NEAppInfoCache appInfo:mismatchedWithUUID:andBundleID:](*(_QWORD *)(a1 + 32), v5, *(void **)(a1 + 40), *(void **)(a1 + 48));
  -[NEAppInfoCache addAppInfoToCache:](*(void **)(a1 + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  if (!v6)
  {
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_8:
    v12();
    goto LABEL_9;
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__NEAppInfoCache_appInfoForPid_UUID_bundleID_completionHandler___block_invoke_3;
  v17[3] = &unk_1E3CBF3F0;
  v17[4] = v7;
  v16 = *(_OWORD *)(a1 + 56);
  v10 = (id)v16;
  v18 = v16;
  -[NEAppInfoCache performCustomLookupIfNecessaryForPid:UUID:bundleID:completionHandler:](v7, 0, v8, v9, v17);

LABEL_9:
}

- (uint64_t)appInfo:(void *)a3 mismatchedWithUUID:(void *)a4 andBundleID:
{
  id *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    if (v8 && !objc_msgSend(v7[2], "isEqual:", v8))
      goto LABEL_7;
    if (!v9)
      goto LABEL_6;
    v10 = v7[3];
    v11 = v9;
    -[NEAppInfoCache bundleIDWithoutTeamID:](v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEAppInfoCache bundleIDWithoutTeamID:](v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if (!v14)
LABEL_7:
      a1 = 1;
    else
LABEL_6:
      a1 = 0;
  }

  return a1;
}

- (void)addAppInfoToCache:(void *)a1
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  _QWORD *v6;
  id v7;
  SEL v8;
  const char *v9;
  void *v10;
  _QWORD *v11;
  id *v12;
  id *v13;
  id v14;
  void *v15;
  BOOL v16;
  char v17;
  NSObject *v18;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (v3)
    {
      v5 = (void *)v3[2];
      if (v5)
      {
        v6 = v3;
        v7 = v5;
        objc_msgSend(objc_getProperty(a1, v8, 16, 1), "objectForKeyedSubscript:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = v6;
          v12 = v10;
          v13 = v12;
          if (!v11[5] && v12[5])
          {
            v14 = v12[2];
            v15 = v14;
            if (v14)
              v16 = v4[2] == 0;
            else
              v16 = 1;
            if (!v16)
            {
              v17 = objc_msgSend(v14, "isEqual:");

              if ((v17 & 1) != 0)
                goto LABEL_15;
              goto LABEL_14;
            }

          }
        }
LABEL_14:
        objc_msgSend(objc_getProperty(a1, v9, 16, 1), "setObject:forKeyedSubscript:", v6, v7);
LABEL_15:

      }
    }
    else
    {
      ne_log_obj();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        v19 = 136315138;
        v20 = "-[NEAppInfoCache addAppInfoToCache:]";
        _os_log_fault_impl(&dword_19BD16000, v18, OS_LOG_TYPE_FAULT, "%s called with null appInfo", (uint8_t *)&v19, 0xCu);
      }

    }
  }

}

void __64__NEAppInfoCache_appInfoForPid_UUID_bundleID_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v4;
  id v5;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v4)
    -[NEAppInfoCache addAppInfoToCache:](*(void **)(a1 + 32), v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)bundleIDWithoutTeamID:(void *)a1
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v10 = 136315138;
      v11 = "-[NEAppInfoCache bundleIDWithoutTeamID:]";
      _os_log_fault_impl(&dword_19BD16000, v8, OS_LOG_TYPE_FAULT, "%s called with null bundleID", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_10;
  }
  v3 = objc_msgSend(v1, "rangeOfString:options:", CFSTR("."), 1);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v4 == 1)
    {
      v7 = v3 + 1;
      if (v3 + 1 < (unint64_t)objc_msgSend(v2, "length"))
      {
        objc_msgSend(v2, "substringFromIndex:", v7);
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_4;
      }
    }
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = (const char *)v2;
      _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "found invalid \".\" in bundle id: %@", (uint8_t *)&v10, 0xCu);
    }
LABEL_10:

    v6 = 0;
    goto LABEL_11;
  }
  v5 = objc_msgSend(v2, "copy");
LABEL_4:
  v6 = (void *)v5;
LABEL_11:

  return v6;
}

void __87__NEAppInfoCache_performCustomLookupIfNecessaryForPid_UUID_bundleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  void *v5;
  NSObject *Property;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a2;
  v5 = *(void **)(a1 + 32);
  if (v5)
    Property = objc_getProperty(v5, v3, 24, 1);
  else
    Property = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__NEAppInfoCache_performCustomLookupIfNecessaryForPid_UUID_bundleID_completionHandler___block_invoke_2;
  v9[3] = &unk_1E3CC46A8;
  v7 = *(id *)(a1 + 40);
  v10 = v4;
  v11 = v7;
  v8 = v4;
  dispatch_async(Property, v9);

}

uint64_t __87__NEAppInfoCache_performCustomLookupIfNecessaryForPid_UUID_bundleID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
