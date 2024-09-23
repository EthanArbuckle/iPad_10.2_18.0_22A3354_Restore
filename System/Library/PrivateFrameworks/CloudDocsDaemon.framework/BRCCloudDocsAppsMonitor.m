@implementation BRCCloudDocsAppsMonitor

- (BOOL)hasFetchedInitialApps
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__BRCCloudDocsAppsMonitor_hasFetchedInitialApps__block_invoke;
  v5[3] = &unk_1E8760960;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__BRCCloudDocsAppsMonitor_hasFetchedInitialApps__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 64);
  return result;
}

- (void)_refetchApps
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx refetching installed apps list%@");
  OUTLINED_FUNCTION_2();
}

void __39__BRCCloudDocsAppsMonitor__refetchApps__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17A6BE8]();
  BREntitledContainerIdentifiersForProxy();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = v3;
      objc_msgSend(v3, "applicationIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v8, v6);

      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v9 = v5;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v18 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v15)
            {
              v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
              objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v15, v14);
            }
            objc_msgSend(v15, "addObject:", v6);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v11);
      }

      v3 = v16;
    }
  }

  objc_autoreleasePoolPop(v4);
}

void __39__BRCCloudDocsAppsMonitor__refetchApps__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 1;
}

void __39__BRCCloudDocsAppsMonitor__refetchApps__block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "cloudDocsAppsListDidChange:", *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)forceRefetchAppList
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1CBD43000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] forced a refetch of the list of apps%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)_start
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx start monitoring cloud apps%@");
  OUTLINED_FUNCTION_2();
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *callbackQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  callbackQueue = self->_callbackQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__BRCCloudDocsAppsMonitor_addObserver___block_invoke;
  v7[3] = &unk_1E875D470;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(callbackQueue, v7);

}

void __39__BRCCloudDocsAppsMonitor_addObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__52;
  v9 = __Block_byref_object_dispose__52;
  v10 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__BRCCloudDocsAppsMonitor_addObserver___block_invoke_14;
  v4[3] = &unk_1E8760960;
  v4[4] = v2;
  v4[5] = &v5;
  dispatch_sync(v3, v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
  if (v6[5])
    objc_msgSend(*(id *)(a1 + 40), "cloudDocsAppsListDidChange:");
  _Block_object_dispose(&v5, 8);

}

void __39__BRCCloudDocsAppsMonitor_addObserver___block_invoke_14(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *callbackQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__BRCCloudDocsAppsMonitor_removeObserver___block_invoke;
  block[3] = &unk_1E875D470;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(callbackQueue, block);

}

uint64_t __42__BRCCloudDocsAppsMonitor_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (id)applicationIdentifiersForContainerID:(id)a3
{
  id v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  NSObject *v6;
  NSObject *queue;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  _BYTE *v15;
  uint64_t v16[3];
  _BYTE buf[24];
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  memset(v16, 0, sizeof(v16));
  __brc_create_section(0, (uint64_t)"-[BRCCloudDocsAppsMonitor applicationIdentifiersForContainerID:]", 182, v16);
  brc_bread_crumbs();
  v5 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v16[0];
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2112;
    v18 = v5;
    _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx asked appIDs for %@%@", buf, 0x20u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v18 = __Block_byref_object_copy__52;
  v19 = __Block_byref_object_dispose__52;
  v20 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__BRCCloudDocsAppsMonitor_applicationIdentifiersForContainerID___block_invoke;
  v13[3] = &unk_1E875D528;
  v15 = buf;
  v13[4] = self;
  v8 = v4;
  v14 = v8;
  dispatch_sync(queue, v13);
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[BRCCloudDocsAppsMonitor applicationIdentifiersForContainerID:].cold.1();

  v11 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  __brc_leave_section(v16);
  return v11;
}

void __64__BRCCloudDocsAppsMonitor_applicationIdentifiersForContainerID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)containerIDsForApplicationIdentifier:(id)a3
{
  id v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  NSObject *v6;
  NSObject *queue;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  _BYTE *v15;
  uint64_t v16[3];
  _BYTE buf[24];
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  memset(v16, 0, sizeof(v16));
  __brc_create_section(0, (uint64_t)"-[BRCCloudDocsAppsMonitor containerIDsForApplicationIdentifier:]", 193, v16);
  brc_bread_crumbs();
  v5 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v16[0];
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2112;
    v18 = v5;
    _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx asked containerIDs for %@%@", buf, 0x20u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v18 = __Block_byref_object_copy__52;
  v19 = __Block_byref_object_dispose__52;
  v20 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__BRCCloudDocsAppsMonitor_containerIDsForApplicationIdentifier___block_invoke;
  v13[3] = &unk_1E875D528;
  v15 = buf;
  v13[4] = self;
  v8 = v4;
  v14 = v8;
  dispatch_sync(queue, v13);
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[BRCCloudDocsAppsMonitor applicationIdentifiersForContainerID:].cold.1();

  v11 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  __brc_leave_section(v16);
  return v11;
}

void __64__BRCCloudDocsAppsMonitor_containerIDsForApplicationIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)allApplicationIdentifiers
{
  void *v3;
  NSObject *v4;
  NSObject *queue;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17[3];

  memset(v17, 0, sizeof(v17));
  __brc_create_section(0, (uint64_t)"-[BRCCloudDocsAppsMonitor allApplicationIdentifiers]", 220, v17);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[BRCCloudDocsAppsMonitor allApplicationIdentifiers].cold.2();

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__52;
  v15 = __Block_byref_object_dispose__52;
  v16 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__BRCCloudDocsAppsMonitor_allApplicationIdentifiers__block_invoke;
  block[3] = &unk_1E8760960;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(queue, block);
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[BRCCloudDocsAppsMonitor applicationIdentifiersForContainerID:].cold.1();

  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  __brc_leave_section(v17);
  return v8;
}

void __52__BRCCloudDocsAppsMonitor_allApplicationIdentifiers__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allKeys");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (BOOL)isApplicationInstalledForContainerID:(id)a3
{
  void *v3;
  BOOL v4;

  -[BRCCloudDocsAppsMonitor applicationIdentifiersForContainerID:](self, "applicationIdentifiersForContainerID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

+ (id)cloudDocsAppsMonitor
{
  if (cloudDocsAppsMonitor_once != -1)
    dispatch_once(&cloudDocsAppsMonitor_once, &__block_literal_global_64);
  return (id)cloudDocsAppsMonitor_gMonitor;
}

void __47__BRCCloudDocsAppsMonitor_cloudDocsAppsMonitor__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)cloudDocsAppsMonitor_gMonitor;
  cloudDocsAppsMonitor_gMonitor = v0;

}

- (BRCCloudDocsAppsMonitor)init
{
  BRCCloudDocsAppsMonitor *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *fetchInstalledAppsQueue;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *callbackQueue;
  NSMutableSet *v15;
  NSMutableSet *observers;
  void *v17;
  uint64_t v18;
  br_pacer *refetchPacer;
  uint64_t v21;
  id v22;
  id location;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)BRCCloudDocsAppsMonitor;
  v2 = -[BRCCloudDocsAppsMonitor init](&v24, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.bird.apps-monitor", v4);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v7, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.bird.apps-monitor.fetch-apps", v8);

    fetchInstalledAppsQueue = v2->_fetchInstalledAppsQueue;
    v2->_fetchInstalledAppsQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v11, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.bird.apps-monitor.callback", v12);

    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    observers = v2->_observers;
    v2->_observers = v15;

    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appsFetchPacerDelay");
    br_pacer_create();
    v18 = objc_claimAutoreleasedReturnValue();
    refetchPacer = v2->_refetchPacer;
    v2->_refetchPacer = (br_pacer *)v18;

    objc_initWeak(&location, v2);
    v21 = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v22, &location);
    br_pacer_set_event_handler();
    br_pacer_resume();
    -[BRCCloudDocsAppsMonitor _start](v2, "_start", v21, 3221225472, __31__BRCCloudDocsAppsMonitor_init__block_invoke, &unk_1E875DC98);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __31__BRCCloudDocsAppsMonitor_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_refetchApps");

}

- (void)dumpToContext:(id)a3
{
  id v4;
  NSObject *queue;
  uint64_t v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BRCCloudDocsAppsMonitor *v12;
  _QWORD block[4];
  id v14;
  BRCCloudDocsAppsMonitor *v15;

  v4 = a3;
  objc_msgSend(v4, "writeLineWithFormat:", CFSTR("apps monitor"));
  objc_msgSend(v4, "writeLineWithFormat:", CFSTR("-----------------------------------------------------"));
  objc_msgSend(v4, "pushIndentation");
  objc_msgSend(v4, "writeLineWithFormat:", CFSTR("app library IDs by App ID"));
  objc_msgSend(v4, "writeLineWithFormat:", CFSTR("======================="));
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__BRCCloudDocsAppsMonitor_dumpToContext___block_invoke;
  block[3] = &unk_1E875D470;
  v7 = v4;
  v14 = v7;
  v15 = self;
  dispatch_sync(queue, block);
  objc_msgSend(v7, "writeLineWithFormat:", &stru_1E8769030);
  objc_msgSend(v7, "writeLineWithFormat:", CFSTR("app IDs by app library IDs"));
  objc_msgSend(v7, "writeLineWithFormat:", CFSTR("======================="));
  v8 = self->_queue;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __41__BRCCloudDocsAppsMonitor_dumpToContext___block_invoke_2;
  v10[3] = &unk_1E875D470;
  v11 = v7;
  v12 = self;
  v9 = v7;
  dispatch_sync(v8, v10);
  objc_msgSend(v9, "popIndentation");
  objc_msgSend(v9, "writeLineWithFormat:", &stru_1E8769030);

}

uint64_t __41__BRCCloudDocsAppsMonitor_dumpToContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeLineWithFormat:", CFSTR("%@"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
}

uint64_t __41__BRCCloudDocsAppsMonitor_dumpToContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeLineWithFormat:", CFSTR("%@"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_fetchInstalledAppsQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_refetchPacer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_appIDsByAppLibraryID, 0);
  objc_storeStrong((id *)&self->_cloudDocsAppLibrariesByAppID, 0);
}

- (void)applicationIdentifiersForContainerID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] returning %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)allApplicationIdentifiers
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx asked appIDs%@");
  OUTLINED_FUNCTION_2();
}

@end
