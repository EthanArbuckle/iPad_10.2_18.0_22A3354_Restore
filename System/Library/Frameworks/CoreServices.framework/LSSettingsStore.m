@implementation LSSettingsStore

+ (id)sharedInstance
{
  if (+[LSSettingsStore sharedInstance]::onceToken != -1)
    dispatch_once(&+[LSSettingsStore sharedInstance]::onceToken, &__block_literal_global_43);
  return (id)+[LSSettingsStore sharedInstance]::store;
}

void __33__LSSettingsStore_sharedInstance__block_invoke()
{
  int v0;
  __objc2_class **v1;
  id v2;
  void *v3;

  v0 = objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer");
  v1 = off_1E103C160;
  if (!v0)
    v1 = off_1E103C110;
  v2 = objc_alloc_init(*v1);
  v3 = (void *)+[LSSettingsStore sharedInstance]::store;
  +[LSSettingsStore sharedInstance]::store = (uint64_t)v2;

}

- (id)_init
{
  LSSettingsStore *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *observerQueue;
  uint64_t v6;
  NSMutableSet *observerSet;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LSSettingsStore;
  v2 = -[LSSettingsStore init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.launchservices._LSSettingsInProcessStore.notification", v3);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v4;

    v6 = objc_opt_new();
    observerSet = v2->_observerSet;
    v2->_observerSet = (NSMutableSet *)v6;

  }
  return v2;
}

- (BOOL)setUserElection:(unsigned __int8)a3 forExtensionKey:(id)a4 error:(id *)a5
{
  if (a5)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[LSSettingsStore setUserElection:forExtensionKey:error:]", 204, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)resetUserElectionsWithError:(id *)a3
{
  if (a3)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[LSSettingsStore resetUserElectionsWithError:]", 211, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)addChangeObserver:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *SharedInstance;
  void *v9;
  OS_dispatch_queue *observerQueue;
  uint64_t v11;
  id v12;
  _QWORD *v13;
  NSObject *v14;
  _QWORD *v15;
  void *v16;
  _QWORD *v17;
  _QWORD block[5];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  unsigned int v24;

  v4 = a3;
  v5 = (_QWORD *)objc_opt_new();
  v6 = MEMORY[0x186DAE9BC](v4);
  v7 = (void *)v5[1];
  v5[1] = v6;

  SharedInstance = (void *)__LSDefaultsGetSharedInstance();
  objc_msgSend(SharedInstance, "settingsUpdateNotificationNameForUserID:", geteuid());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  observerQueue = self->_observerQueue;
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __37__LSSettingsStore_addChangeObserver___block_invoke;
  v21[3] = &unk_1E10422C8;
  v12 = v9;
  v22 = v12;
  v13 = v5;
  v23 = v13;
  LaunchServices::notifyd::NotifyToken::RegisterDispatch(v12, observerQueue, v21, &v24);
  LaunchServices::notifyd::NotifyToken::operator=((LaunchServices::notifyd::NotifyToken *)(v13 + 2), (LaunchServices::notifyd::NotifyToken *)&v24);
  LaunchServices::notifyd::NotifyToken::~NotifyToken((LaunchServices::notifyd::NotifyToken *)&v24);
  v14 = self->_observerQueue;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __37__LSSettingsStore_addChangeObserver___block_invoke_36;
  block[3] = &unk_1E10422C8;
  block[4] = self;
  v15 = v13;
  v20 = v15;
  dispatch_sync(v14, block);
  v16 = v20;
  v17 = v15;

  return v17;
}

uint64_t __37__LSSettingsStore_addChangeObserver___block_invoke(uint64_t a1)
{
  NSObject *v2;

  _LSDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __37__LSSettingsStore_addChangeObserver___block_invoke_cold_1();

  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 16))();
}

uint64_t __37__LSSettingsStore_addChangeObserver___block_invoke_36(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeChangeObserver:(id)a3
{
  id v5;
  NSObject *observerQueue;
  void *v7;
  objc_class *v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v12;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSSettingsStore.mm"), 238, CFSTR("Unexpected class %@"), v9);

  }
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__LSSettingsStore_removeChangeObserver___block_invoke;
  block[3] = &unk_1E10418C8;
  v12 = v5;
  v10 = v5;
  dispatch_sync(observerQueue, block);

}

uint64_t __40__LSSettingsStore_removeChangeObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  return LaunchServices::notifyd::NotifyToken::cancel((LaunchServices::notifyd::NotifyToken *)(*(_QWORD *)(a1 + 32)
                                                                                             + 16));
}

- (OS_dispatch_queue)observerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableSet)observerSet
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerSet, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
}

- (unsigned)userElectionForExtensionKey:(id)a3
{
  objc_opt_class();
  OUTLINED_FUNCTION_4_2();
  return 0;
}

- (id)settingsStoreConfigurationForProcessWithAuditToken:(id *)a3
{
  objc_opt_class();
  OUTLINED_FUNCTION_4_2();
  return 0;
}

void __37__LSSettingsStore_addChangeObserver___block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  OUTLINED_FUNCTION_15_0(*MEMORY[0x1E0C80C00]);
  v3 = 138543362;
  v4 = v0;
  OUTLINED_FUNCTION_4_3(&dword_182882000, v1, v2, "NotifyToken::Received(%{public}@)", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

@end
