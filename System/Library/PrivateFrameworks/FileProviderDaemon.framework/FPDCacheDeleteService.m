@implementation FPDCacheDeleteService

uint64_t __53__FPDCacheDeleteService_registerCacheDeleteCallbacks__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[3];
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __53__FPDCacheDeleteService_registerCacheDeleteCallbacks__block_invoke_cold_1();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (FPIsSpaceAttributionEnabledAndUsedByStorageUI())
  {
    v12[0] = CFSTR("CACHE_DELETE_VOLUME");
    v12[1] = CFSTR("CACHE_DELETE_AMOUNT");
    v13[0] = v6;
    v13[1] = &unk_1E8C95E20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10[0] = CFSTR("CACHE_DELETE_VOLUME");
    v10[1] = CFSTR("CACHE_DELETE_AMOUNT");
    v11[0] = v6;
    v11[1] = &unk_1E8C95E20;
    v10[2] = CFSTR("CACHE_DELETE_ITEMIZED_NONPURGEABLE");
    objc_msgSend(*(id *)(a1 + 32), "nonPurgableSpacePerProviderOnVolume:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
    v7 = objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (FPDCacheDeleteService)init
{
  FPDCacheDeleteService *v2;
  FPDCacheDeleteService *v3;
  NSString *cacheDeleteServiceName;
  uint64_t v5;
  NSMutableDictionary *cdNotificationsHandlers;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *notificationsHandlersQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FPDCacheDeleteService;
  v2 = -[FPDCacheDeleteService init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    cacheDeleteServiceName = v2->_cacheDeleteServiceName;
    v2->_cacheDeleteServiceName = (NSString *)CFSTR("com.apple.FileProvider.cache-delete");

    v5 = objc_opt_new();
    cdNotificationsHandlers = v3->_cdNotificationsHandlers;
    v3->_cdNotificationsHandlers = (NSMutableDictionary *)v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("FPDCacheDeleteService notification queue", v7);
    notificationsHandlersQueue = v3->_notificationsHandlersQueue;
    v3->_notificationsHandlersQueue = (OS_dispatch_queue *)v8;

    v3->_cacheDeleteCacheable = CacheDeleteCacheable();
  }
  return v3;
}

- (void)start
{
  -[FPDCacheDeleteService registerCacheDeleteCallbacks](self, "registerCacheDeleteCallbacks");
  -[FPDCacheDeleteService registerActivity](self, "registerActivity");
}

- (void)registerCacheDeleteCallbacks
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_4_3(&dword_1CF55F000, v0, v1, "[ERROR] Failed to register %@ as a cache delete service (%d)");
  OUTLINED_FUNCTION_8_0();
}

uint64_t __53__FPDCacheDeleteService_registerCacheDeleteCallbacks__block_invoke_13(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __53__FPDCacheDeleteService_registerCacheDeleteCallbacks__block_invoke_13_cold_1();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = CFSTR("CACHE_DELETE_VOLUME");
  v8[1] = CFSTR("CACHE_DELETE_AMOUNT");
  v9[0] = v5;
  v9[1] = &unk_1E8C95E20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = objc_claimAutoreleasedReturnValue();

  return v6;
}

void __53__FPDCacheDeleteService_registerCacheDeleteCallbacks__block_invoke_14(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  int v5;
  NSObject *v6;
  NSObject **v7;
  NSObject *v8;
  _QWORD block[4];
  NSObject **v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(a2, "objectForKey:", CFSTR("CACHE_DELETE_CACHE_ENABLED"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __53__FPDCacheDeleteService_registerCacheDeleteCallbacks__block_invoke_14_cold_1(v5, v6);

    v7 = (NSObject **)WeakRetained;
    objc_sync_enter(v7);
    if (*((unsigned __int8 *)v7 + 32) != v5)
    {
      *((_BYTE *)v7 + 32) = v5;
      v8 = v7[3];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __53__FPDCacheDeleteService_registerCacheDeleteCallbacks__block_invoke_17;
      block[3] = &unk_1E8C75E48;
      v10 = v7;
      dispatch_async(v8, block);

    }
    objc_sync_exit(v7);

  }
}

void __53__FPDCacheDeleteService_registerCacheDeleteCallbacks__block_invoke_17(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5++) + 16))();
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (id)nonPurgableSpacePerProviderOnVolume:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v6 = MEMORY[0x1E0C809B0];
  v24 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __61__FPDCacheDeleteService_nonPurgableSpacePerProviderOnVolume___block_invoke;
  v20[3] = &unk_1E8C76E40;
  v20[4] = &v21;
  -[FPDCacheDeleteService enumerateProviderDomainOnVolume:usingBlock:](self, "enumerateProviderDomainOnVolume:usingBlock:", v4, v20);
  if (*((_BYTE *)v22 + 24))
  {
    -[FPDExtensionManager nonEvictableSizeByProviderDomain](self->_extensionManager, "nonEvictableSizeByProviderDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[FPDCacheDeleteService nonPurgableSpacePerProviderOnVolume:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __61__FPDCacheDeleteService_nonPurgableSpacePerProviderOnVolume___block_invoke_21;
    v17[3] = &unk_1E8C76E68;
    v18 = v5;
    v15 = v7;
    v19 = v15;
    -[FPDCacheDeleteService enumerateProviderDomainOnVolume:usingBlock:](self, "enumerateProviderDomainOnVolume:usingBlock:", v4, v17);

  }
  _Block_object_dispose(&v21, 8);

  return v5;
}

uint64_t __61__FPDCacheDeleteService_nonPurgableSpacePerProviderOnVolume___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __61__FPDCacheDeleteService_nonPurgableSpacePerProviderOnVolume___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v5, "providerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v5, "providerID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E8C95E20, v10);

  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v5, "providerID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "longLongValue");

    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "longLongValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v17 + v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(void **)(a1 + 32);
    objc_msgSend(v5, "providerID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v20);

  }
}

- (void)registerActivity
{
  const char *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v2 = (const char *)objc_msgSend((id)FPDCacheDeletePushXPCActivityId, "UTF8String");
  v3 = (void *)*MEMORY[0x1E0C80748];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__FPDCacheDeleteService_registerActivity__block_invoke;
  v4[3] = &unk_1E8C76900;
  objc_copyWeak(&v5, &location);
  xpc_activity_register(v2, v3, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __41__FPDCacheDeleteService_registerActivity__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  _xpc_activity_s *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  xpc_object_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  xpc_object_t v19;
  int64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  int v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  _QWORD *WeakRetained;
  _xpc_activity_s *v39;
  xpc_activity_t activity;
  uint8_t v41;
  _BYTE v42[15];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t section;
  _QWORD v48[4];
  _QWORD v49[4];
  uint8_t buf[4];
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  activity = v3;
  if (FPIsSpaceAttributionEnabledAndUsedByStorageUI())
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __41__FPDCacheDeleteService_registerActivity__block_invoke_cold_1(v4, v5, v6);

    xpc_activity_unregister((const char *)objc_msgSend((id)FPDCacheDeletePushXPCActivityId, "UTF8String"));
    goto LABEL_57;
  }
  if (xpc_activity_get_state(v3))
  {
    section = __fp_create_section();
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __41__FPDCacheDeleteService_registerActivity__block_invoke_cold_5();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = WeakRetained;
    if (WeakRetained)
    {
      v9 = activity;
      if (xpc_activity_should_defer(v9))
      {
        fp_current_or_default_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          __41__FPDCacheDeleteService_registerActivity__block_invoke_cold_3(v10, v11, v12);

        v13 = v9;
        if (!xpc_activity_set_state(v9, 3))
        {
          fp_current_or_default_log();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CF55F000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to defer the state", buf, 2u);
          }

          v13 = v9;
        }
        goto LABEL_55;
      }
      v39 = v9;

      if (!FPDCacheDeletePushXPCActivityId_block_invoke_alreadyProcessedVolumePaths)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)FPDCacheDeletePushXPCActivityId_block_invoke_alreadyProcessedVolumePaths;
        FPDCacheDeletePushXPCActivityId_block_invoke_alreadyProcessedVolumePaths = v21;

      }
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      objc_msgSend(WeakRetained, "allStorageVolumes");
      v13 = objc_claimAutoreleasedReturnValue();
      v23 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v44;
LABEL_27:
        v25 = 0;
        while (1)
        {
          if (*(_QWORD *)v44 != v24)
            objc_enumerationMutation(v13);
          v26 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v25);
          v27 = (void *)MEMORY[0x1D17D1B04]();
          objc_msgSend(v26, "path");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend((id)FPDCacheDeletePushXPCActivityId_block_invoke_alreadyProcessedVolumePaths, "containsObject:", v28))
          {
            fp_current_or_default_log();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v51 = v28;
              _os_log_debug_impl(&dword_1CF55F000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] Ignoring already processed volume: %@", buf, 0xCu);
            }
            v30 = 5;
          }
          else
          {
            fp_current_or_default_log();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v51 = v28;
              _os_log_debug_impl(&dword_1CF55F000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] Processing volume %@", buf, 0xCu);
            }

            v29 = v9;
            if (xpc_activity_should_defer((xpc_activity_t)v29))
            {
              fp_current_or_default_log();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                __41__FPDCacheDeleteService_registerActivity__block_invoke_cold_4(&v41, v42, v32);

              if (!xpc_activity_set_state((xpc_activity_t)v29, 3))
              {
                fp_current_or_default_log();
                v33 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1CF55F000, v33, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to defer the state", buf, 2u);
                }

              }
              v30 = 1;
            }
            else
            {

              objc_msgSend(WeakRetained, "nonPurgableSpacePerProviderOnVolume:", v28);
              v29 = objc_claimAutoreleasedReturnValue();
              v34 = WeakRetained[1];
              v48[0] = CFSTR("CACHE_DELETE_ID");
              v48[1] = CFSTR("CACHE_DELETE_VOLUME");
              v49[0] = v34;
              v49[1] = v28;
              v48[2] = CFSTR("CACHE_DELETE_ITEMIZED_NONPURGEABLE");
              v48[3] = CFSTR("CACHE_DELETE_AMOUNT");
              v49[2] = v29;
              v49[3] = &unk_1E8C95E20;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 4);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              fp_current_or_default_log();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v51 = v35;
                _os_log_debug_impl(&dword_1CF55F000, v36, OS_LOG_TYPE_DEBUG, "[DEBUG] Returning purgeable info: %@", buf, 0xCu);
              }

              CacheDeleteUpdatePurgeable();
              objc_msgSend((id)FPDCacheDeletePushXPCActivityId_block_invoke_alreadyProcessedVolumePaths, "addObject:", v28);

              v30 = 0;
            }
          }

          objc_autoreleasePoolPop(v27);
          if (v30 != 5)
          {
            if (v30)
              goto LABEL_55;
          }
          if (v23 == ++v25)
          {
            v23 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
            if (v23)
              goto LABEL_27;
            break;
          }
        }
      }

      v37 = (void *)FPDCacheDeletePushXPCActivityId_block_invoke_alreadyProcessedVolumePaths;
      FPDCacheDeletePushXPCActivityId_block_invoke_alreadyProcessedVolumePaths = 0;

      v8 = WeakRetained;
      if (!xpc_activity_set_state(v39, 5))
      {
        fp_current_or_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          goto LABEL_54;
        }
        goto LABEL_55;
      }
    }
    else if (!xpc_activity_set_state(activity, 5))
    {
      fp_current_or_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
LABEL_54:
        _os_log_impl(&dword_1CF55F000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to set the xpc state to done", buf, 2u);
      }
LABEL_55:

      v8 = WeakRetained;
    }

    __fp_leave_section_Debug();
    goto LABEL_57;
  }
  v15 = xpc_activity_copy_criteria(v3);

  if (!v15)
  {
    fp_current_or_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      __41__FPDCacheDeleteService_registerActivity__block_invoke_cold_2(v16, v17, v18);

    v19 = xpc_dictionary_create(0, 0, 0);
    v20 = *MEMORY[0x1E0C807D8];
    xpc_dictionary_set_int64(v19, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807D8]);
    xpc_dictionary_set_int64(v19, (const char *)*MEMORY[0x1E0C80790], v20);
    xpc_dictionary_set_BOOL(v19, (const char *)*MEMORY[0x1E0C80898], 1);
    xpc_dictionary_set_BOOL(v19, (const char *)*MEMORY[0x1E0C808D8], 1);
    xpc_dictionary_set_BOOL(v19, (const char *)*MEMORY[0x1E0C80738], 0);
    xpc_dictionary_set_string(v19, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
    xpc_activity_set_criteria(v3, v19);

  }
LABEL_57:

}

- (BOOL)getVolume:(int *)a3 forPath:(id)a4
{
  id v5;
  int v6;
  NSObject *v7;
  stat v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  memset(&v9, 0, sizeof(v9));
  v5 = objc_retainAutorelease(a4);
  v6 = lstat((const char *)objc_msgSend(v5, "fileSystemRepresentation"), &v9);
  if (v6 < 0)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] unable to stat volume %@", buf, 0xCu);
    }

  }
  else
  {
    *a3 = v9.st_dev;
  }

  return v6 >= 0;
}

- (void)enumerateFPFSDomainsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[FPDExtensionManager providerDomainsByID](self->_extensionManager, "providerDomainsByID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__FPDCacheDeleteService_enumerateFPFSDomainsUsingBlock___block_invoke;
  v7[3] = &unk_1E8C76E90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __56__FPDCacheDeleteService_enumerateFPFSDomainsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(v11, "fp_toProviderID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "providerWithIdentifier:reason:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v11, "fp_toDomainIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "domainForIdentifier:reason:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && objc_msgSend(v10, "isUsingFPFS"))
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (id)allStorageVolumes
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__FPDCacheDeleteService_allStorageVolumes__block_invoke;
  v6[3] = &unk_1E8C76EB8;
  v4 = v3;
  v7 = v4;
  -[FPDCacheDeleteService enumerateFPFSDomainsUsingBlock:](self, "enumerateFPFSDomainsUsingBlock:", v6);

  return v4;
}

void __42__FPDCacheDeleteService_allStorageVolumes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  __int128 v21;
  id obj;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(a3, "storageURLs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v27;
    v7 = *MEMORY[0x1E0C99D08];
    v8 = *MEMORY[0x1E0CB28A8];
    *(_QWORD *)&v4 = 138412546;
    v21 = v4;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v9);
        v24 = 0;
        v25 = 0;
        v11 = objc_msgSend(v10, "getResourceValue:forKey:error:", &v25, v7, &v24, v21);
        v12 = v25;
        v13 = v24;
        v14 = v13;
        if (v11)
          v15 = v12 == 0;
        else
          v15 = 1;
        if (!v15)
        {
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);
          goto LABEL_18;
        }
        objc_msgSend(v13, "domain");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "isEqualToString:", v8))
        {
          v17 = objc_msgSend(v14, "code");

          if (v17 == 260)
            goto LABEL_18;
        }
        else
        {

        }
        fp_current_or_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v10, "fp_shortDescription");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "fp_prettyDescription");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v21;
          v31 = v19;
          v32 = 2112;
          v33 = v20;
          _os_log_error_impl(&dword_1CF55F000, v18, OS_LOG_TYPE_ERROR, "[ERROR] unable to get volume for storage URL %@ (%@)", buf, 0x16u);

        }
LABEL_18:

        ++v9;
      }
      while (v5 != v9);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v5);
  }

}

- (void)enumerateProviderDomainOnVolume:(id)a3 usingBlock:(id)a4
{
  id v6;
  _QWORD v7[5];
  id v8;
  int v9;
  int v10;

  v6 = a4;
  v10 = 0;
  if (-[FPDCacheDeleteService getVolume:forPath:](self, "getVolume:forPath:", &v10, a3))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__FPDCacheDeleteService_enumerateProviderDomainOnVolume_usingBlock___block_invoke;
    v7[3] = &unk_1E8C76EE0;
    v7[4] = self;
    v9 = v10;
    v8 = v6;
    -[FPDCacheDeleteService enumerateFPFSDomainsUsingBlock:](self, "enumerateFPFSDomainsUsingBlock:", v7);

  }
}

void __68__FPDCacheDeleteService_enumerateProviderDomainOnVolume_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "storageURLs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(v6, "storageURLs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0;
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v10, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "getVolume:forPath:", &v15, v12))
    {
      v13 = v15;
      v14 = *(_DWORD *)(a1 + 48);

      if (v13 == v14)
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {

    }
  }

}

- (void)registerKey:(id)a3 notificationsUpdatesHandlers:(id)a4
{
  id v6;
  id v7;
  FPDCacheDeleteService *v8;
  void *v9;
  NSObject *notificationsHandlersQueue;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = (void *)MEMORY[0x1D17D1C84](v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_cdNotificationsHandlers, "setObject:forKeyedSubscript:", v9, v6);

  notificationsHandlersQueue = v8->_notificationsHandlersQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__FPDCacheDeleteService_registerKey_notificationsUpdatesHandlers___block_invoke;
  v12[3] = &unk_1E8C76C10;
  v12[4] = v8;
  v13 = v7;
  v11 = v7;
  dispatch_async(notificationsHandlersQueue, v12);

  objc_sync_exit(v8);
}

uint64_t __66__FPDCacheDeleteService_registerKey_notificationsUpdatesHandlers___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)unregisterKey:(id)a3
{
  FPDCacheDeleteService *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary removeObjectForKey:](v4->_cdNotificationsHandlers, "removeObjectForKey:", v5);
  objc_sync_exit(v4);

}

- (BOOL)isCacheDeleteCacheable
{
  FPDCacheDeleteService *v2;
  BOOL cacheDeleteCacheable;

  v2 = self;
  objc_sync_enter(v2);
  cacheDeleteCacheable = v2->_cacheDeleteCacheable;
  objc_sync_exit(v2);

  return cacheDeleteCacheable;
}

+ (FPDCacheDeleteService)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__FPDCacheDeleteService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, block);
  return (FPDCacheDeleteService *)(id)sharedInstance_sharedInstance;
}

void __39__FPDCacheDeleteService_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

- (FPDExtensionManager)extensionManager
{
  return self->_extensionManager;
}

- (void)setExtensionManager:(id)a3
{
  objc_storeStrong((id *)&self->_extensionManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionManager, 0);
  objc_storeStrong((id *)&self->_notificationsHandlersQueue, 0);
  objc_storeStrong((id *)&self->_cdNotificationsHandlers, 0);
  objc_storeStrong((id *)&self->_cacheDeleteServiceName, 0);
}

void __53__FPDCacheDeleteService_registerCacheDeleteCallbacks__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_3_5(&dword_1CF55F000, v0, v1, "[DEBUG] Purgeable request with urgency %d: %@");
  OUTLINED_FUNCTION_8_0();
}

void __53__FPDCacheDeleteService_registerCacheDeleteCallbacks__block_invoke_13_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_3_5(&dword_1CF55F000, v0, v1, "[DEBUG] Purge request with urgency %d: %@");
  OUTLINED_FUNCTION_8_0();
}

void __53__FPDCacheDeleteService_registerCacheDeleteCallbacks__block_invoke_14_cold_1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] FPDCacheDeleteService: cache enabled update: %{BOOL}d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_5();
}

- (void)nonPurgableSpacePerProviderOnVolume:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a2, a3, "[DEBUG] Nonevictable sizes per domain: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8_0();
}

void __41__FPDCacheDeleteService_registerActivity__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_2_4(&dword_1CF55F000, a1, a3, "[DEBUG] Unregistering CacheDelete Activity", v3);
  OUTLINED_FUNCTION_5();
}

void __41__FPDCacheDeleteService_registerActivity__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_2_4(&dword_1CF55F000, a1, a3, "[DEBUG] CacheDelete Activity wasn't registered automatically, despite it's in FileProvider's Info.plist", v3);
  OUTLINED_FUNCTION_5();
}

void __41__FPDCacheDeleteService_registerActivity__block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_2_4(&dword_1CF55F000, a1, a3, "[DEBUG] defering processing", v3);
  OUTLINED_FUNCTION_5();
}

void __41__FPDCacheDeleteService_registerActivity__block_invoke_cold_4(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_2_4(&dword_1CF55F000, a3, (uint64_t)a3, "[DEBUG] defering processing", a1);
}

void __41__FPDCacheDeleteService_registerActivity__block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] ┏%llx pushing purgeable update to cache delete", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_8_0();
}

@end
