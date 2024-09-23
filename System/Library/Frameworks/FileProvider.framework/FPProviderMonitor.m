@implementation FPProviderMonitor

+ (BOOL)isProviderIDForeground:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  int val;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;

  v3 = a3;
  if (isProviderIDForeground__onceToken != -1)
    dispatch_once(&isProviderIDForeground__onceToken, &__block_literal_global_32_0);
  val = -1;
  FPNotifyNameForForegroundChangeWithProviderID(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)isProviderIDForeground__tokensCache, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || (v7 = objc_msgSend(v5, "intValue"), val = v7, (_DWORD)v7 == -1))
  {
    v8 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v9 = getbrc_notify_register_checkSymbolLoc_ptr;
    v19 = getbrc_notify_register_checkSymbolLoc_ptr;
    if (!getbrc_notify_register_checkSymbolLoc_ptr)
    {
      v10 = (void *)CloudDocsLibrary();
      v9 = dlsym(v10, "brc_notify_register_check");
      v17[3] = (uint64_t)v9;
      getbrc_notify_register_checkSymbolLoc_ptr = v9;
    }
    _Block_object_dispose(&v16, 8);
    if (!v9)
      +[FPProviderMonitor isProviderIDForeground:].cold.1();
    ((void (*)(uint64_t, int *))v9)(v8, &val);
    if (!notify_is_valid_token(val))
    {
      v13 = 0;
      goto LABEL_12;
    }
    v11 = (void *)isProviderIDForeground__tokensCache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", val);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, v3);

    v7 = val;
  }
  v16 = 0;
  _brc_notify_get_state(v7, (uint64_t)&v16, objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  v13 = v16 != 0;
LABEL_12:

  return v13;
}

+ (id)providerIDForApplication:(id)a3 sharedContainerIdentifier:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", a3, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v16, "plugInKitPlugins");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "protocol");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.fileprovider-nonui"));

        if (v11)
        {
          objc_msgSend(v9, "objectForInfoDictionaryKey:ofClass:inScope:", CFSTR("NSExtensionFileProviderDocumentGroup"), objc_opt_class(), 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "isEqualToString:", v12))
            objc_msgSend(v17, "addObject:", v9);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  objc_msgSend(v17, "sortUsingComparator:", &__block_literal_global_34);
  objc_msgSend(v17, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (FPProviderMonitor)init
{
  FPProviderMonitor *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *observersByContainerID;
  NSMutableDictionary *v5;
  NSMutableDictionary *notifyTokenByContainerID;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FPProviderMonitor;
  v2 = -[FPProviderMonitor init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observersByContainerID = v2->_observersByContainerID;
    v2->_observersByContainerID = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    notifyTokenByContainerID = v2->_notifyTokenByContainerID;
    v2->_notifyTokenByContainerID = v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.fileprovider.containers.monitor", v7);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

  }
  return v2;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (-[NSMutableDictionary count](self->_notifyTokenByContainerID, "count")
    && -[NSMutableDictionary count](self->_notifyTokenByContainerID, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPProviderMonitor.m"), 91, CFSTR("There were observers remaining at dealloc time. Call -removeObserver:forContainerID: first."));

  }
  v5.receiver = self;
  v5.super_class = (Class)FPProviderMonitor;
  -[FPProviderMonitor dealloc](&v5, sel_dealloc);
}

uint64_t __72__FPProviderMonitor_providerIDForApplication_sharedContainerIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)addObserver:(id)a3 forProviderID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  FPProviderMonitor *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *queue;
  id v19;
  _QWORD block[4];
  id v21;
  int v22;
  _QWORD v23[5];
  id v24;
  id v25;
  int out_token;
  uint64_t section;

  v6 = a3;
  v7 = a4;
  section = __fp_create_section();
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[FPProviderMonitor addObserver:forProviderID:].cold.1(&section, (uint64_t)v7, v8);

  v9 = self;
  objc_sync_enter(v9);
  out_token = 0;
  -[NSMutableDictionary objectForKeyedSubscript:](v9->_observersByContainerID, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9->_observersByContainerID, "setObject:forKeyedSubscript:", v10, v7);
  }
  objc_msgSend(v10, "addObject:", v6);
  FPNotifyNameForForegroundChangeWithProviderID(v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __47__FPProviderMonitor_addObserver_forProviderID___block_invoke;
  v23[3] = &unk_1E444DAC0;
  v23[4] = v9;
  v13 = v7;
  v24 = v13;
  v14 = v11;
  v25 = v14;
  v15 = (void *)MEMORY[0x1A1B00850](v23);
  v16 = objc_retainAutorelease(v14);
  notify_register_dispatch((const char *)objc_msgSend(v16, "UTF8String"), &out_token, (dispatch_queue_t)v9->_queue, v15);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9->_notifyTokenByContainerID, "setObject:forKeyedSubscript:", v17, v13);

  queue = v9->_queue;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __47__FPProviderMonitor_addObserver_forProviderID___block_invoke_28;
  block[3] = &unk_1E444DAE8;
  v21 = v15;
  v22 = out_token;
  v19 = v15;
  dispatch_async(queue, block);

  objc_sync_exit(v9);
  __fp_leave_section_Debug((uint64_t)&section);

}

void __47__FPProviderMonitor_addObserver_forProviderID___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  v5 = (uint64_t *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_sync_exit(v4);
  _brc_notify_get_state(a2, (uint64_t)&v20, objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String"));
  v8 = v20;
  fp_current_or_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __47__FPProviderMonitor_addObserver_forProviderID___block_invoke_cold_1(v5, v8 == 0, v9);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13);
        v15 = *v5;
        if (v8)
          objc_msgSend(v14, "providerDidEnterForeground:", v15);
        else
          objc_msgSend(v14, "providerDidEnterBackground:", v15, (_QWORD)v16);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v11);
  }

}

uint64_t __47__FPProviderMonitor_addObserver_forProviderID___block_invoke_28(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

- (void)removeObserver:(id)a3 forProviderID:(id)a4
{
  id v6;
  id v7;
  FPProviderMonitor *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  int v19;
  NSMutableDictionary *observersByContainerID;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  NSMutableDictionary *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[NSMutableDictionary objectForKeyedSubscript:](v8->_observersByContainerID, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "containsObject:", v6) & 1) == 0)
  {
    fp_simulate_crash(CFSTR("removed non existing observer %@ for %@, existing observers were %@"), v10, v11, v12, v13, v14, v15, v16, (uint64_t)v6);
    fp_current_or_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      observersByContainerID = v8->_observersByContainerID;
      *(_DWORD *)buf = 138412802;
      v22 = v6;
      v23 = 2112;
      v24 = v7;
      v25 = 2112;
      v26 = observersByContainerID;
      _os_log_fault_impl(&dword_1A0A34000, v17, OS_LOG_TYPE_FAULT, "[SIMCRASH] removed non existing observer %@ for %@, existing observers were %@", buf, 0x20u);
    }

  }
  objc_msgSend(v9, "removeObject:", v6);
  if (!objc_msgSend(v9, "count"))
  {
    -[NSMutableDictionary removeObjectForKey:](v8->_observersByContainerID, "removeObjectForKey:", v7);
    -[NSMutableDictionary objectForKeyedSubscript:](v8->_notifyTokenByContainerID, "objectForKeyedSubscript:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "intValue");

    notify_cancel(v19);
    -[NSMutableDictionary removeObjectForKey:](v8->_notifyTokenByContainerID, "removeObjectForKey:", v7);
  }

  objc_sync_exit(v8);
}

void __44__FPProviderMonitor_isProviderIDForeground___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)isProviderIDForeground__tokensCache;
  isProviderIDForeground__tokensCache = v0;

}

- (BOOL)supportsWakesForProviderID:(id)a3
{
  return 1;
}

- (BOOL)wakeProviderID:(id)a3 forSessionIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  char v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v5 = a3;
  v6 = a4;
  +[FPItemManager defaultManager](FPItemManager, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FPWakeForURLSessionOperation initForProvider:sessionIdentifier:]([FPWakeForURLSessionOperation alloc], "initForProvider:sessionIdentifier:", v5, v6);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__FPProviderMonitor_wakeProviderID_forSessionIdentifier___block_invoke;
  v11[3] = &unk_1E444BE98;
  v11[4] = &v12;
  objc_msgSend(v8, "setActionCompletionBlock:", v11);
  objc_msgSend(v7, "scheduleAction:", v8);
  objc_msgSend(v8, "waitUntilFinished");
  v9 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __57__FPProviderMonitor_wakeProviderID_forSessionIdentifier___block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2 == 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notifyTokenByContainerID, 0);
  objc_storeStrong((id *)&self->_observersByContainerID, 0);
}

- (void)addObserver:(NSObject *)a3 forProviderID:.cold.1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, a2, a3, "[DEBUG] ┏%llx adding observer for %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

void __47__FPProviderMonitor_addObserver_forProviderID___block_invoke_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  const char *v3;
  _BYTE v4[24];

  v3 = "foreground";
  if ((a2 & 1) != 0)
    v3 = "background";
  *(_DWORD *)v4 = 138412546;
  *(_QWORD *)&v4[4] = *a1;
  *(_WORD *)&v4[12] = 2080;
  *(_QWORD *)&v4[14] = v3;
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, a2, a3, "[DEBUG] %@ is now %s", *(_QWORD *)v4, *(_QWORD *)&v4[8], *(_QWORD *)&v4[16], *MEMORY[0x1E0C80C00]);
}

+ (void)isProviderIDForeground:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int _brc_notify_register_check(const char *, int *)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FPProviderMonitor.m"), 32, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
