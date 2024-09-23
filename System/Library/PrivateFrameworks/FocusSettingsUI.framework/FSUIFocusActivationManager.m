@implementation FSUIFocusActivationManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__FSUIFocusActivationManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken[0] != -1)
    dispatch_once(sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance;
}

void __44__FSUIFocusActivationManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

- (FSUIFocusActivationManager)init
{
  FSUIFocusActivationManager *v2;
  FSUIFocusActivationManager *v3;
  uint64_t v4;
  DNDModeSelectionService *modeSelectionService;
  NSMutableArray *v6;
  NSMutableArray *listeners;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *listenersQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FSUIFocusActivationManager;
  v2 = -[FSUIFocusActivationManager init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    -[FSUIFocusActivationManager _modeSelectionService](v2, "_modeSelectionService");
    v4 = objc_claimAutoreleasedReturnValue();
    modeSelectionService = v3->_modeSelectionService;
    v3->_modeSelectionService = (DNDModeSelectionService *)v4;

    -[DNDModeSelectionService addListener:withCompletionHandler:](v3->_modeSelectionService, "addListener:withCompletionHandler:", v3, &__block_literal_global);
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    listeners = v3->_listeners;
    v3->_listeners = v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.donotdisturb.FCUIFocusActivationManager", v8);
    listenersQueue = v3->_listenersQueue;
    v3->_listenersQueue = (OS_dispatch_queue *)v9;

  }
  return v3;
}

void __34__FSUIFocusActivationManager_init__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((a2 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __34__FSUIFocusActivationManager_init__block_invoke_cold_1((uint64_t)v4);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[FSUIFocusActivationManager _modeSelectionService](self, "_modeSelectionService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeListener:", self);

  v4.receiver = self;
  v4.super_class = (Class)FSUIFocusActivationManager;
  -[FSUIFocusActivationManager dealloc](&v4, sel_dealloc);
}

- (BOOL)isActiveMode:(id)a3
{
  id v4;
  FSUIFocusActivationManager *v5;
  DNDModeAssertion *latestModeAssertion;
  DNDModeSelectionService *modeSelectionService;
  uint64_t v8;
  id v9;
  DNDModeAssertion *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v16;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    latestModeAssertion = v5->_latestModeAssertion;
    if (!latestModeAssertion)
    {
      modeSelectionService = v5->_modeSelectionService;
      v16 = 0;
      -[DNDModeSelectionService activeModeAssertionWithError:](modeSelectionService, "activeModeAssertionWithError:", &v16);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v16;
      v10 = v5->_latestModeAssertion;
      v5->_latestModeAssertion = (DNDModeAssertion *)v8;

      latestModeAssertion = v5->_latestModeAssertion;
    }
    -[DNDModeAssertion details](latestModeAssertion, "details");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "modeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

  }
  else
  {
    v14 = 0;
  }
  objc_sync_exit(v5);

  return v14;
}

- (void)setMode:(id)a3 isActive:(BOOL)a4
{
  _BOOL4 v4;
  FSUIFocusActivationManager *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  DNDModeAssertion *latestModeAssertion;
  id v12;

  v4 = a4;
  v12 = a3;
  v6 = self;
  objc_sync_enter(v6);
  if (v4)
  {
    v7 = objc_alloc_init(MEMORY[0x24BE2D700]);
    objc_msgSend(v7, "setIdentifier:", CFSTR("com.apple.FocusSettings"));
    objc_msgSend(v12, "modeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setModeIdentifier:", v8);

    objc_msgSend(v7, "setReason:", 1);
    objc_msgSend(MEMORY[0x24BE2D670], "lifetimeUntilEndOfScheduleWithIdentifier:", *MEMORY[0x24BE2D5C8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLifetime:", v9);

  }
  else
  {
    v7 = 0;
  }
  -[FSUIFocusActivationManager _modeSelectionService](v6, "_modeSelectionService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activateModeWithDetails:error:", v7, 0);

  latestModeAssertion = v6->_latestModeAssertion;
  v6->_latestModeAssertion = 0;

  objc_sync_exit(v6);
}

- (void)addListenerForFocusActivationChanges:(id)a3
{
  id v4;
  NSObject *listenersQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  listenersQueue = self->_listenersQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__FSUIFocusActivationManager_addListenerForFocusActivationChanges___block_invoke;
  block[3] = &unk_24D35B570;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(listenersQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __67__FSUIFocusActivationManager_addListenerForFocusActivationChanges___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[3], "addObject:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)removeListenerForFocusActivationChanges:(id)a3
{
  id v4;
  NSObject *listenersQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  listenersQueue = self->_listenersQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__FSUIFocusActivationManager_removeListenerForFocusActivationChanges___block_invoke;
  block[3] = &unk_24D35B570;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(listenersQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __70__FSUIFocusActivationManager_removeListenerForFocusActivationChanges___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[3], "removeObject:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)modeSelectionService:(id)a3 didReceiveUpdatedActiveModeAssertion:(id)a4 stateUpdate:(id)a5
{
  id v8;
  id v9;
  id v10;
  FSUIFocusActivationManager *v11;
  uint8_t v12[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_2154AF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Did receive updated active mode assertion", v12, 2u);
  }
  objc_storeStrong((id *)&v11->_latestModeAssertion, a4);
  -[FSUIFocusActivationManager _notifyListenersOfActiveModeAssertionChange:](v11, "_notifyListenersOfActiveModeAssertionChange:", v9);
  objc_sync_exit(v11);

}

- (void)_notifyListenersOfActiveModeAssertionChange:(id)a3
{
  id v4;
  NSObject *listenersQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  listenersQueue = self->_listenersQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__FSUIFocusActivationManager__notifyListenersOfActiveModeAssertionChange___block_invoke;
  block[3] = &unk_24D35B570;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(listenersQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __74__FSUIFocusActivationManager__notifyListenersOfActiveModeAssertionChange___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = WeakRetained[3];
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "didUpdateActiveModesForActivationManager:assertion:", v3, *(_QWORD *)(a1 + 32), (_QWORD)v10);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (id)_modeSelectionService
{
  DNDModeSelectionService *modeSelectionService;
  DNDModeSelectionService *v4;
  DNDModeSelectionService *v5;

  modeSelectionService = self->_modeSelectionService;
  if (!modeSelectionService)
  {
    objc_msgSend(MEMORY[0x24BE2D6D0], "serviceForClientIdentifier:", CFSTR("com.apple.FocusSettings"));
    v4 = (DNDModeSelectionService *)objc_claimAutoreleasedReturnValue();
    v5 = self->_modeSelectionService;
    self->_modeSelectionService = v4;

    modeSelectionService = self->_modeSelectionService;
  }
  return modeSelectionService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenersQueue, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_latestModeAssertion, 0);
  objc_storeStrong((id *)&self->_modeSelectionService, 0);
}

void __34__FSUIFocusActivationManager_init__block_invoke_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_2154AF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to connect to the mode selection service with error: %@", (uint8_t *)&v1, 0xCu);
}

@end
