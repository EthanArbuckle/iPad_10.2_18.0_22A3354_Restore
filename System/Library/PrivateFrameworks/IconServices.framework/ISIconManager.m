@implementation ISIconManager

- (id)findOrRegisterIcon:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__ISIconManager_findOrRegisterIcon___block_invoke;
  block[3] = &unk_1E5800FC0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

+ (ISIconManager)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_26);
  return (ISIconManager *)(id)sharedInstance_sharedInstance_4;
}

- (ISIconCache)iconCache
{
  return (ISIconCache *)objc_getProperty(self, a2, 16, 1);
}

void __36__ISIconManager_findOrRegisterIcon___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  NSObject *v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "member:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = a1 + 48;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v2;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(_QWORD *)(v6 + 40);
  v7 = (id *)(v6 + 40);
  if (!v8)
  {
    objc_storeStrong(v7, *(id *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
    _ISDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __36__ISIconManager_findOrRegisterIcon___block_invoke_cold_1(v3, v9);

  }
}

- (void)setIconCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

void __31__ISIconManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ISIconManager _init]([ISIconManager alloc], "_init");
  v1 = (void *)sharedInstance_sharedInstance_4;
  sharedInstance_sharedInstance_4 = (uint64_t)v0;

}

- (id)_init
{
  ISIconManager *v2;
  uint64_t v3;
  NSHashTable *iconRegistry;
  uint64_t v5;
  NSHashTable *observers;
  id v7;
  void *v8;
  uint64_t v9;
  NSXPCConnection *connection;
  void *v11;
  NSXPCConnection *v12;
  id v13;
  const char *v14;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *internalQueue;
  NSXPCConnection *v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id location;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)ISIconManager;
  v2 = -[ISIconManager init](&v30, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    iconRegistry = v2->_iconRegistry;
    v2->_iconRegistry = (NSHashTable *)v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    v2->_lock._os_unfair_lock_opaque = 0;
    v7 = objc_alloc(MEMORY[0x1E0CB3B38]);
    +[ISIconManager serviceName](ISIconManager, "serviceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithMachServiceName:options:", v8, 0);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v9;

    objc_msgSend(MEMORY[0x1E0CB3B50], "_IS_iconCacheServiceInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v11);
    v12 = v2->_connection;
    +[ISIconManager serviceName](ISIconManager, "serviceName");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (const char *)objc_msgSend(v13, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(21, 2uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create_with_target_V2(v14, v15, v16);
    -[NSXPCConnection _setQueue:](v12, "_setQueue:", v17);

    -[NSXPCConnection resume](v2->_connection, "resume");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create("Icon manager internal queue", v18);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v19;

    objc_initWeak(&location, v2);
    v21 = v2->_connection;
    v22 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __22__ISIconManager__init__block_invoke;
    v27[3] = &unk_1E5800F70;
    objc_copyWeak(&v28, &location);
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v21, "synchronousRemoteObjectProxyWithErrorHandler:", v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v22;
    v25[1] = 3221225472;
    v25[2] = __22__ISIconManager__init__block_invoke_11;
    v25[3] = &unk_1E5800F98;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v23, "fetchCacheConfigurationWithReply:", v25);
    objc_destroyWeak(&v26);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

  }
  return v2;
}

+ (id)serviceName
{
  void *v2;
  void *v3;

  +[ISDefaults sharedInstance](ISDefaults, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __22__ISIconManager__init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id WeakRetained;

  v3 = a2;
  _ISDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __22__ISIconManager__init__block_invoke_cold_1((uint64_t)v3, v4);

  +[ISIconCache defaultIconCache](ISIconCache, "defaultIconCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIconCache:", v5);

}

void __22__ISIconManager__init__block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  ISIconCache *v5;

  if (a2)
  {
    v3 = a2;
    v5 = -[ISIconCache initWithConfiguration:]([ISIconCache alloc], "initWithConfiguration:", v3);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setIconCache:", v5);

  }
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ISIconManager;
  -[ISIconManager dealloc](&v2, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (NSHashTable)iconRegistry
{
  return (NSHashTable *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIconRegistry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 32, 1);
}

- (void)setObservers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInternalQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_iconRegistry, 0);
  objc_storeStrong((id *)&self->_iconCache, 0);
}

void __22__ISIconManager__init__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1AA928000, a2, OS_LOG_TYPE_FAULT, "Failed to get the icon cache path with error: %@", (uint8_t *)&v2, 0xCu);
}

void __36__ISIconManager_findOrRegisterIcon___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1AA928000, a2, OS_LOG_TYPE_DEBUG, "Registered %@", (uint8_t *)&v3, 0xCu);
}

@end
