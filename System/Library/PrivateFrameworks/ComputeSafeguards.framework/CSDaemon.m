@implementation CSDaemon

- (id)_init
{
  CSDaemon *v2;
  CSDaemon *v3;
  uint64_t v4;
  OS_dispatch_queue *mainQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSDaemon;
  v2 = -[CSDaemon init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_runInternalOnly = 0;
    getMainQueue();
    v4 = objc_claimAutoreleasedReturnValue();
    mainQueue = v3->_mainQueue;
    v3->_mainQueue = (OS_dispatch_queue *)v4;

  }
  return v3;
}

+ (id)_sharedInstance
{
  if (_sharedInstance_onceToken_0 != -1)
    dispatch_once(&_sharedInstance_onceToken_0, &__block_literal_global_2);
  return (id)_sharedInstance___sharedInstance_0;
}

void __27__CSDaemon__sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[CSDaemon _init]([CSDaemon alloc], "_init");
  v1 = (void *)_sharedInstance___sharedInstance_0;
  _sharedInstance___sharedInstance_0 = (uint64_t)v0;

}

- (void)_start
{
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *mainQueue;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = -[CSDaemon _shouldRunSafeguards](self, "_shouldRunSafeguards");
  +[CSLogger defaultCategory](CSLogger, "defaultCategory");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2383F5000, v4, OS_LOG_TYPE_DEFAULT, "Starting Compute Safeguards System", buf, 2u);
    }

    mainQueue = self->_mainQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __18__CSDaemon__start__block_invoke;
    block[3] = &unk_250A16848;
    block[4] = self;
    dispatch_async(mainQueue, block);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2383F5000, v4, OS_LOG_TYPE_DEFAULT, "Could not start the Safeguards System", buf, 2u);
    }

  }
}

uint64_t __18__CSDaemon__start__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  CSRestrictionDataProvider *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  +[CSContextStore sharedInstance](CSContextStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextStore:", v3);

  v4 = *(void **)(a1 + 32);
  v5 = objc_alloc_init(CSRestrictionDataProvider);
  objc_msgSend(v4, "setRestrictionDataProvider:", v5);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "restrictionDataProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSRestrictionManager sharedInstanceWithDataProvider:](CSRestrictionManager, "sharedInstanceWithDataProvider:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRestrictionsManager:", v8);

  +[CSLogger defaultCategory](CSLogger, "defaultCategory");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "restrictionsManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v10;
    _os_log_impl(&dword_2383F5000, v9, OS_LOG_TYPE_INFO, "Created restrictionsManager: %@", (uint8_t *)&v12, 0xCu);

  }
  return +[CSViolationHandlerService run](CSViolationHandlerService, "run");
}

- (BOOL)_shouldRunSafeguards
{
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  __int16 v7;
  __int16 v8;

  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    if (!self->_runInternalOnly || (isInternalBuild() & 1) != 0)
      return 1;
    +[CSLogger defaultCategory](CSLogger, "defaultCategory");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 0;
      v5 = "Not an internal build, Safeguards are currenlty internal-only";
      v6 = (uint8_t *)&v7;
      goto LABEL_9;
    }
  }
  else
  {
    +[CSLogger defaultCategory](CSLogger, "defaultCategory");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 0;
      v5 = "Safeguards are disabled";
      v6 = (uint8_t *)&v8;
LABEL_9:
      _os_log_impl(&dword_2383F5000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }

  return 0;
}

+ (id)run
{
  if (run_onceToken_0 != -1)
    dispatch_once(&run_onceToken_0, &__block_literal_global_8);
  return +[CSDaemon _sharedInstance](CSDaemon, "_sharedInstance");
}

void __15__CSDaemon_run__block_invoke()
{
  id v0;

  +[CSDaemon _sharedInstance](CSDaemon, "_sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_start");

}

- (void)updateContextForIdentifier:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  NSObject *mainQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  mainQueue = self->_mainQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__CSDaemon_updateContextForIdentifier_withState___block_invoke;
  block[3] = &unk_250A169C0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(mainQueue, block);

}

void __49__CSDaemon_updateContextForIdentifier_withState___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "contextStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateState:forIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (BOOL)runInternalOnly
{
  return self->_runInternalOnly;
}

- (void)setRunInternalOnly:(BOOL)a3
{
  self->_runInternalOnly = a3;
}

- (OS_dispatch_queue)mainQueue
{
  return self->_mainQueue;
}

- (void)setMainQueue:(id)a3
{
  objc_storeStrong((id *)&self->_mainQueue, a3);
}

- (CSRestrictionDataProvider)restrictionDataProvider
{
  return self->_restrictionDataProvider;
}

- (void)setRestrictionDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_restrictionDataProvider, a3);
}

- (CSRestrictionManager)restrictionsManager
{
  return self->_restrictionsManager;
}

- (void)setRestrictionsManager:(id)a3
{
  objc_storeStrong((id *)&self->_restrictionsManager, a3);
}

- (CSContextStore)contextStore
{
  return self->_contextStore;
}

- (void)setContextStore:(id)a3
{
  objc_storeStrong((id *)&self->_contextStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextStore, 0);
  objc_storeStrong((id *)&self->_restrictionsManager, 0);
  objc_storeStrong((id *)&self->_restrictionDataProvider, 0);
  objc_storeStrong((id *)&self->_mainQueue, 0);
}

@end
