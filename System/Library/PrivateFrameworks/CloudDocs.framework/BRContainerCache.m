@implementation BRContainerCache

+ (BOOL)isPersonalProvider
{
  if (isPersonalProvider_once != -1)
    dispatch_once(&isPersonalProvider_once, &__block_literal_global_461);
  return isPersonalProvider_isPersonalProvider;
}

+ (BOOL)isManagedProvider
{
  if (isManagedProvider_once != -1)
    dispatch_once(&isManagedProvider_once, &__block_literal_global_466);
  return isManagedProvider_isManagedProvider;
}

void __37__BRContainerCache_isManagedProvider__block_invoke(uint64_t a1, uint64_t a2)
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  id v6;

  v2 = BRIsFPFSEnabled(a1, a2);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged");
  else
    v5 = CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged");
  isManagedProvider_isManagedProvider = objc_msgSend(v3, "isEqualToString:", v5);

}

void __38__BRContainerCache_isPersonalProvider__block_invoke(uint64_t a1, uint64_t a2)
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  id v6;

  v2 = BRIsFPFSEnabled(a1, a2);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider");
  else
    v5 = CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider");
  isPersonalProvider_isPersonalProvider = objc_msgSend(v3, "isEqualToString:", v5);

}

void __47__BRContainerCache_containerCacheForPersonaID___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)containerCacheForPersonaID__containerCacheByPersona;
  containerCacheForPersonaID__containerCacheByPersona = v0;

}

void __36__BRContainerCache_hasDaemonicParts__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  hasDaemonicParts_hasDaemonicParts_0 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.bird"));

}

void __35__BRContainerCache_containerHelper__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "hasDaemonicParts"))
    v1 = NSClassFromString((NSString *)CFSTR("BRCDaemonContainerHelper"));
  else
    v1 = (void *)objc_opt_class();
  objc_msgSend(v1, "sharedHelper");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)containerHelper_helper;
  containerHelper_helper = v2;

}

- (BRContainerCache)initWithHelper:(id)a3 personaID:(id)a4
{
  id v7;
  id v8;
  BRContainerCache *v9;
  BRContainerCache *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *containersByID;
  uint64_t v13;
  NSMutableSet *fetchedContainerIDs;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  uint64_t v19;
  br_pacer *invalidationPacer;
  br_pacer *v21;
  uint64_t v22;
  dispatch_source_t v23;
  OS_dispatch_source *memoryPressureSource;
  OS_dispatch_source *v25;
  OS_dispatch_source *v26;
  _QWORD *v27;
  NSObject *v28;
  _QWORD *v29;
  void *v30;
  void *v31;
  dispatch_block_t v32;
  id v33;
  const char *v34;
  void *v35;
  NSObject *v36;
  _QWORD *v37;
  void *v38;
  void *v39;
  id v40;
  _QWORD *v41;
  NSObject *v42;
  _QWORD *v43;
  void *v44;
  void *v45;
  id v46;
  _QWORD *v47;
  uint32_t v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v53;
  NSObject *v54;
  id v55;
  id obj;
  _QWORD v57[4];
  id v58;
  int v59;
  _QWORD v60[4];
  id v61;
  int out_token;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  id location;
  objc_super v68;
  uint64_t handler;
  uint64_t v70;
  void (*v71)(uint64_t);
  void *v72;
  id v73;
  id v74;
  const char *v75;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    brc_bread_crumbs((uint64_t)"-[BRContainerCache initWithHelper:personaID:]", 2609);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
      -[BRContainerCache initWithHelper:personaID:].cold.2();

  }
  v68.receiver = self;
  v68.super_class = (Class)BRContainerCache;
  v9 = -[BRContainerCache init](&v68, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_helper, a3);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    containersByID = v10->_containersByID;
    v10->_containersByID = v11;

    v13 = objc_opt_new();
    fetchedContainerIDs = v10->_fetchedContainerIDs;
    v10->_fetchedContainerIDs = (NSMutableSet *)v13;

    v10->_containerCacheUptodate = 0;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v15, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.clouddocs.container-cache-queue", v16);

    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v17;

    br_pacer_create("com.apple.clouddocs.container-invalidation-pacer", v10->_queue, 1.0);
    v19 = objc_claimAutoreleasedReturnValue();
    invalidationPacer = v10->_invalidationPacer;
    v10->_invalidationPacer = (br_pacer *)v19;

    objc_initWeak(&location, v10);
    v21 = v10->_invalidationPacer;
    v22 = MEMORY[0x1E0C809B0];
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __45__BRContainerCache_initWithHelper_personaID___block_invoke;
    v65[3] = &unk_1E3DA5870;
    objc_copyWeak(&v66, &location);
    br_pacer_set_event_handler(v21, v65);
    br_pacer_resume((unsigned __int8 *)v10->_invalidationPacer);
    v23 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 6uLL, 0);
    memoryPressureSource = v10->_memoryPressureSource;
    v10->_memoryPressureSource = (OS_dispatch_source *)v23;

    v25 = v10->_memoryPressureSource;
    v63[0] = v22;
    v63[1] = 3221225472;
    v63[2] = __45__BRContainerCache_initWithHelper_personaID___block_invoke_440;
    v63[3] = &unk_1E3DA5870;
    objc_copyWeak(&v64, &location);
    v26 = v25;
    v27 = v63;
    v28 = v26;
    v29 = v27;
    v30 = v29;
    v31 = v29;
    if (brc_block_remember_persona)
    {
      brc_block_remember_persona(v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v55 = v8;
    obj = a4;
    v32 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v31);
    dispatch_source_set_event_handler(v28, v32);

    dispatch_resume((dispatch_object_t)v10->_memoryPressureSource);
    out_token = 0;
    objc_msgSend(CFSTR("BRContainerCacheDidChangeDistributedNotification"), "br_libnotifyPerUserNotificationName");
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v34 = (const char *)objc_msgSend(v33, "UTF8String");
    dispatch_get_global_queue(0, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v22;
    v60[1] = 3221225472;
    v60[2] = __45__BRContainerCache_initWithHelper_personaID___block_invoke_441;
    v60[3] = &unk_1E3DA6F58;
    objc_copyWeak(&v61, &location);
    v36 = v35;
    v37 = v60;
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "br_currentPersonaID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    handler = MEMORY[0x1E0C809B0];
    v70 = 3221225472;
    v71 = __br_notify_register_dispatch_block_invoke_3;
    v72 = &unk_1E3DA49A8;
    v40 = v39;
    v73 = v40;
    v75 = v34;
    v41 = v37;
    v74 = v41;
    notify_register_dispatch(v34, &out_token, v36, &handler);

    objc_storeStrong((id *)&v10->_personaID, obj);
    v59 = 0;
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __45__BRContainerCache_initWithHelper_personaID___block_invoke_2;
    v57[3] = &unk_1E3DA6F58;
    objc_copyWeak(&v58, &location);
    v42 = v36;
    v43 = v57;
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "br_currentPersonaID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    handler = MEMORY[0x1E0C809B0];
    v70 = 3221225472;
    v71 = __br_notify_register_dispatch_block_invoke_3;
    v72 = &unk_1E3DA49A8;
    v46 = v45;
    v73 = v46;
    v75 = "com.apple.tcc.access.changed";
    v47 = v43;
    v74 = v47;
    v48 = notify_register_dispatch("com.apple.tcc.access.changed", &v59, v42, &handler);

    v8 = v55;
    if (v48)
    {
      brc_bread_crumbs((uint64_t)"-[BRContainerCache initWithHelper:personaID:]", 2648);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, (os_log_type_t)0x90u))
        -[BRContainerCache initWithHelper:personaID:].cold.1((uint64_t)v49, v48, v50);

    }
    +[BRAccount startAccountTokenChangeObserverIfNeeded](BRAccount, "startAccountTokenChangeObserverIfNeeded");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addObserver:selector:name:object:", v10, sel__accountWillChange, CFSTR("BRAccountTokenWillChangeNotification"), 0);

    objc_destroyWeak(&v58);
    objc_destroyWeak(&v61);
    objc_destroyWeak(&v64);
    objc_destroyWeak(&v66);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (id)containerByID:(id)a3
{
  id v4;
  BRContainerCache *v5;
  NSMutableDictionary *containersByID;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSMutableDictionary *v13;
  void *v14;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_containerCacheUptodate
    || (-[NSMutableSet containsObject:](v5->_fetchedContainerIDs, "containsObject:", v4) & 1) != 0)
  {
    containersByID = v5->_containersByID;
    objc_msgSend(v4, "appLibraryOrZoneName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](containersByID, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_11;
    goto LABEL_4;
  }
  -[BRContainerHelper fetchContainerForMangledID:personaID:](v5->_helper, "fetchContainerForMangledID:personaID:", v4, v5->_personaID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
LABEL_4:
    brc_bread_crumbs((uint64_t)"-[BRContainerCache containerByID:]", 2767);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412546;
      v17 = v4;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_19CBF0000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] could not find container for id: %@%@", (uint8_t *)&v16, 0x16u);
    }

    v8 = 0;
    goto LABEL_11;
  }
  brc_bread_crumbs((uint64_t)"-[BRContainerCache containerByID:]", 2759);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[BRContainerCache containerByID:].cold.1((uint64_t)v4);

  v13 = v5->_containersByID;
  objc_msgSend(v4, "appLibraryOrZoneName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v8, v14);

  -[NSMutableSet addObject:](v5->_fetchedContainerIDs, "addObject:", v4);
LABEL_11:
  objc_sync_exit(v5);

  return v8;
}

+ (BOOL)hasDaemonicParts
{
  if (hasDaemonicParts_once_0 != -1)
    dispatch_once(&hasDaemonicParts_once_0, &__block_literal_global_460);
  return hasDaemonicParts_hasDaemonicParts_0;
}

+ (id)containerHelper
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__BRContainerCache_containerHelper__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (containerHelper_once != -1)
    dispatch_once(&containerHelper_once, block);
  return (id)containerHelper_helper;
}

+ (id)containerCache
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "br_currentPersonaID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "containerCacheForPersonaID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)containerCacheForPersonaID:(id)a3
{
  id v4;
  id v5;
  BRContainerCache *v6;
  BRContainerCache *v7;
  void *v8;

  v4 = a3;
  if (containerCacheForPersonaID__onceToken != -1)
    dispatch_once(&containerCacheForPersonaID__onceToken, &__block_literal_global_454);
  v5 = (id)containerCacheForPersonaID__containerCacheByPersona;
  objc_sync_enter(v5);
  objc_msgSend((id)containerCacheForPersonaID__containerCacheByPersona, "objectForKeyedSubscript:", v4);
  v6 = (BRContainerCache *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = [BRContainerCache alloc];
    objc_msgSend(a1, "containerHelper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[BRContainerCache initWithHelper:personaID:](v7, "initWithHelper:personaID:", v8, v4);

    objc_msgSend((id)containerCacheForPersonaID__containerCacheByPersona, "setObject:forKeyedSubscript:", v6, v4);
  }
  objc_sync_exit(v5);

  return v6;
}

void __45__BRContainerCache_initWithHelper_personaID___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  _QWORD v5[3];

  memset(v5, 0, sizeof(v5));
  __brc_create_section(0, (uint64_t)"-[BRContainerCache initWithHelper:personaID:]_block_invoke", 2621, v5);
  brc_bread_crumbs((uint64_t)"-[BRContainerCache initWithHelper:personaID:]_block_invoke", 2621);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __45__BRContainerCache_initWithHelper_personaID___block_invoke_cold_1(v5);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidateAndClearCache:", 0);

  __brc_leave_section((uint64_t)v5);
}

void __45__BRContainerCache_initWithHelper_personaID___block_invoke_440(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  _QWORD v5[3];

  memset(v5, 0, sizeof(v5));
  __brc_create_section(0, (uint64_t)"-[BRContainerCache initWithHelper:personaID:]_block_invoke", 2630, v5);
  brc_bread_crumbs((uint64_t)"-[BRContainerCache initWithHelper:personaID:]_block_invoke", 2630);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __45__BRContainerCache_initWithHelper_personaID___block_invoke_440_cold_1(v5);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidateAndClearCache:", 1);

  __brc_leave_section((uint64_t)v5);
}

void __45__BRContainerCache_initWithHelper_personaID___block_invoke_441(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_containerListDidChange");

}

void __45__BRContainerCache_initWithHelper_personaID___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;

  brc_bread_crumbs((uint64_t)"-[BRContainerCache initWithHelper:personaID:]_block_invoke_2", 2644);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __45__BRContainerCache_initWithHelper_personaID___block_invoke_2_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidateAndClearCache:", 1);

}

- (void)dealloc
{
  OS_dispatch_source *memoryPressureSource;
  objc_super v4;

  br_pacer_cancel(self->_invalidationPacer);
  dispatch_source_cancel((dispatch_source_t)self->_memoryPressureSource);
  memoryPressureSource = self->_memoryPressureSource;
  self->_memoryPressureSource = 0;

  -[BRContainerCache unsubscribeToContainerStatusUpdate](self, "unsubscribeToContainerStatusUpdate");
  v4.receiver = self;
  v4.super_class = (Class)BRContainerCache;
  -[BRContainerCache dealloc](&v4, sel_dealloc);
}

- (id)allContainersBlockIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  BRContainerCache *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[BRContainerCache _allContainersByIDNoCopyBlocking:](v4, "_allContainersByIDNoCopyBlocking:", objc_msgSend((id)objc_opt_class(), "hasDaemonicParts") | v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v4);
  return v6;
}

- (id)documentContainers
{
  BRContainerCache *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSObject *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BRContainerCache _allContainersByIDNoCopyBlocking:](v2, "_allContainersByIDNoCopyBlocking:", 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "isDocumentScopePublic")
          && (objc_msgSend(v9, "isCloudSyncTCCDisabled") & 1) == 0)
        {
          objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_sync_exit(v2);
  brc_bread_crumbs((uint64_t)"-[BRContainerCache documentContainers]", 2733);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[BRContainerCache documentContainers].cold.1((uint64_t)v3);

  return v3;
}

- (void)_accountWillChange
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19CBF0000, v1, v2, "[ERROR] won't restore persona: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __38__BRContainerCache__accountWillChange__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_accountWillChange___personalPersona;
  _accountWillChange___personalPersona = v0;

}

- (id)allContainersByID
{
  BRContainerCache *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[BRContainerCache _allContainersByIDNoCopyBlocking:](v2, "_allContainersByIDNoCopyBlocking:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_sync_exit(v2);
  return v4;
}

- (void)subscribeToContainerStatusUpdate
{
  BRContainerCache *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *containerStatusObserver;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_containerStatusObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v2);
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __52__BRContainerCache_subscribeToContainerStatusUpdate__block_invoke;
    v11 = &unk_1E3DA6FC0;
    objc_copyWeak(&v12, &location);
    v4 = (void *)MEMORY[0x1A1AD85E4](&v8);
    v5 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    objc_msgSend(v5, "setMaxConcurrentOperationCount:", 1, v8, v9, v10, v11);
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", BRContainerDidChangeStatusDistributedNotification, 0, v5, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    containerStatusObserver = v2->_containerStatusObserver;
    v2->_containerStatusObserver = v6;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
  objc_sync_exit(v2);

}

void __52__BRContainerCache_subscribeToContainerStatusUpdate__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;

  v16 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v16, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = WeakRetained;
    objc_sync_enter(v5);
    objc_msgSend(v5, "_allContainersByIDNoCopyBlocking:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", BRContainerIDKey);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v5);
    objc_msgSend(v4, "objectForKeyedSubscript:", BRContainerCurrentStatusKey);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", BRContainerCurrentStatusKey);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCurrentStatus:", objc_msgSend(v10, "unsignedIntegerValue"));

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", BRContainerlastServerUpdateKey);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", BRContainerlastServerUpdateKey);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToDate:", v13);

      if (v14)
        v15 = 0;
      else
        v15 = v12;
      objc_msgSend(v8, "setLastServerUpdate:", v15);

    }
  }

}

- (void)unsubscribeToContainerStatusUpdate
{
  BRContainerCache *v2;
  void *v3;
  NSObject *containerStatusObserver;
  BRContainerCache *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (obj->_containerStatusObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", obj->_containerStatusObserver);
    containerStatusObserver = obj->_containerStatusObserver;
    obj->_containerStatusObserver = 0;

    v2 = obj;
  }
  objc_sync_exit(v2);

}

- (void)_containerListDidChange
{
  br_pacer_signal(self->_invalidationPacer);
}

- (void)invalidateAndClearCache:(BOOL)a3
{
  _BOOL4 v3;
  BRContainerCache *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *personaID;
  int v13;
  uint64_t v14;
  __int16 v15;
  NSString *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  -[BRContainerCache unsubscribeToContainerStatusUpdate](v4, "unsubscribeToContainerStatusUpdate");
  if (v3)
  {
    brc_bread_crumbs((uint64_t)"-[BRContainerCache invalidateAndClearCache:]", 2877);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v11 = -[NSMutableDictionary count](v4->_containersByID, "count");
      personaID = v4->_personaID;
      v13 = 134218498;
      v14 = v11;
      v15 = 2112;
      v16 = personaID;
      v17 = 2112;
      v18 = v5;
      _os_log_debug_impl(&dword_19CBF0000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] removing %lu containers from cache of persona: %@%@", (uint8_t *)&v13, 0x20u);
    }

    -[NSMutableDictionary removeAllObjects](v4->_containersByID, "removeAllObjects");
  }
  else
  {
    brc_bread_crumbs((uint64_t)"-[BRContainerCache invalidateAndClearCache:]", 2880);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[BRContainerCache invalidateAndClearCache:].cold.1();

  }
  v4->_containerCacheUptodate = 0;
  -[NSMutableSet removeAllObjects](v4->_fetchedContainerIDs, "removeAllObjects");
  objc_sync_exit(v4);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", BRContainerListDidChangeDistributedNotification, 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", BRContainerListDidChangeNotification, 0);

}

- (BOOL)_updateContainersCache
{
  BOOL v2;
  BRContainerHelper *helper;
  void *v5;
  id v6;
  BRContainerCache *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  BRContainerCache *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_containerCacheUptodate)
    return 0;
  helper = self->_helper;
  v12 = 0;
  -[BRContainerHelper fetchAllContainersByIDWithError:](helper, "fetchAllContainersByIDWithError:", &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  v2 = v5 != 0;
  if (v5)
  {
    v7 = self;
    objc_sync_enter(v7);
    -[NSMutableDictionary removeAllObjects](v7->_containersByID, "removeAllObjects");
    -[NSMutableSet removeAllObjects](v7->_fetchedContainerIDs, "removeAllObjects");
    -[NSMutableDictionary addEntriesFromDictionary:](v7->_containersByID, "addEntriesFromDictionary:", v5);
    self->_containerCacheUptodate = 1;
    brc_bread_crumbs((uint64_t)"-[BRContainerCache _updateContainersCache]", 2910);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BRContainerCache _updateContainersCache].cold.1((uint64_t)v8, (uint64_t)buf, -[NSMutableDictionary count](v7->_containersByID, "count"), v9);

    objc_sync_exit(v7);
  }
  else
  {
    brc_bread_crumbs((uint64_t)"-[BRContainerCache _updateContainersCache]", 2914);
    v7 = (BRContainerCache *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_19CBF0000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to fetch all containers: %@%@", buf, 0x16u);
    }

  }
  return v2;
}

- (id)_allContainersByIDNoCopyBlocking:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  int IsContainerProxy;
  const __CFString *v8;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const __CFString *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  if (-[BRContainerHelper canFetchAllContainersByID](self->_helper, "canFetchAllContainersByID"))
  {
    if (!self->_containerCacheUptodate)
    {
      if (v3)
      {
        -[BRContainerCache _updateContainersCache](self, "_updateContainersCache");
      }
      else
      {
        queue = self->_queue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __53__BRContainerCache__allContainersByIDNoCopyBlocking___block_invoke;
        block[3] = &unk_1E3DA4738;
        block[4] = self;
        dispatch_async(queue, block);
      }
    }
  }
  else
  {
    brc_bread_crumbs((uint64_t)"-[BRContainerCache _allContainersByIDNoCopyBlocking:]", 2940);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      IsContainerProxy = BRCurrentProcessIsContainerProxy();
      v8 = CFSTR("NO");
      if (IsContainerProxy)
        v8 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_19CBF0000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] client can't fetch all containers by ID (isContainerProxy: %@)%@", buf, 0x16u);
    }

  }
  return self->_containersByID;
}

void __53__BRContainerCache__allContainersByIDNoCopyBlocking___block_invoke(uint64_t a1)
{
  id v1;

  if (objc_msgSend(*(id *)(a1 + 32), "_updateContainersCache"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "postNotificationName:object:", BRContainerListDidChangeNotification, 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerStatusObserver, 0);
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
  objc_storeStrong((id *)&self->_invalidationPacer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_fetchedContainerIDs, 0);
  objc_storeStrong((id *)&self->_containersByID, 0);
  objc_storeStrong((id *)&self->_helper, 0);
  objc_storeStrong((id *)&self->_personaID, 0);
}

- (void)initWithHelper:(os_log_t)log personaID:.cold.1(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_19CBF0000, log, (os_log_type_t)0x90u, "[ERROR] Can't register to TCC access changed; error: %d%@",
    (uint8_t *)v3,
    0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithHelper:personaID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: helper%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __45__BRContainerCache_initWithHelper_personaID___block_invoke_cold_1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] ┏%llx invalidating container cache%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __45__BRContainerCache_initWithHelper_personaID___block_invoke_440_cold_1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] ┏%llx Invalidate cache after receiving memory pressure%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __45__BRContainerCache_initWithHelper_personaID___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] TCC access changed, invalidating cache%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)documentContainers
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] Document containers returning %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)containerByID:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] added 1 container with mangledID %@ to cache%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)invalidateAndClearCache:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_17(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] Marking container cache stale for persona: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)_updateContainersCache
{
  *(_DWORD *)a2 = 134218242;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_7(&dword_19CBF0000, a4, a3, "[DEBUG] added %lu containers to cache%@", (uint8_t *)a2);
}

@end
