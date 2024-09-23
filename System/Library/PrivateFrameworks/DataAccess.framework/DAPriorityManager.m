@implementation DAPriorityManager

+ (void)vendPriorityManagers
{
  sVendPriorityManagers = 1;
}

+ (id)sharedManager
{
  id v2;

  if (sVendPriorityManagers == 1)
  {
    if (sharedManager_onceToken != -1)
      dispatch_once(&sharedManager_onceToken, &__block_literal_global_14);
    v2 = (id)sharedManager_sSharedDAPriorityManager;
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void __34__DAPriorityManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_sSharedDAPriorityManager;
  sharedManager_sSharedDAPriorityManager = v0;

}

- (id)appIDsToDataclasses
{
  if (appIDsToDataclasses_onceToken != -1)
    dispatch_once(&appIDsToDataclasses_onceToken, &__block_literal_global_12_0);
  return (id)appIDsToDataclasses_sAppIDsToDataclasses;
}

void __40__DAPriorityManager_appIDsToDataclasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0D0C468];
  v2[1] = CFSTR("com.apple.MobileAddressBook");
  v3[0] = &unk_1E68DA1F8;
  v3[1] = &unk_1E68DA210;
  v2[2] = CFSTR("com.apple.mobilephone");
  v2[3] = CFSTR("com.apple.mobilenotes");
  v3[2] = &unk_1E68DA210;
  v3[3] = &unk_1E68DA228;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)appIDsToDataclasses_sAppIDsToDataclasses;
  appIDsToDataclasses_sAppIDsToDataclasses = v0;

}

- (void)appWithBundleID:(id)a3 isNowRunningAndVisible:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  int64_t foregroundDataclasses;
  int v13;
  id v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  int64_t v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedAppState, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedAppState, "setObject:forKeyedSubscript:", v9, v6);

  if (v8 != v4)
    -[DAPriorityManager _updateForegroundDataclasses](self, "_updateForegroundDataclasses");
  DALoggingwithCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 7);
  if (os_log_type_enabled(v10, v11))
  {
    foregroundDataclasses = self->_foregroundDataclasses;
    v13 = 138412802;
    v14 = v6;
    v15 = 1024;
    v16 = v4;
    v17 = 2048;
    v18 = foregroundDataclasses;
    _os_log_impl(&dword_1B51E4000, v10, v11, "App state changed; %@ now has foreground status: %{BOOL}i. Foreground dataclasses are 0x%lx",
      (uint8_t *)&v13,
      0x1Cu);
  }

}

- (void)_updateForegroundDataclasses
{
  int64_t foregroundDataclasses;
  void *v4;
  int64_t v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  foregroundDataclasses = self->_foregroundDataclasses;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[DAPriorityManager appIDsToDataclasses](self, "appIDsToDataclasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__DAPriorityManager__updateForegroundDataclasses__block_invoke;
  v6[3] = &unk_1E68CBFD8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

  v5 = v8[3];
  if (v5 != foregroundDataclasses)
  {
    self->_foregroundDataclasses = v5;
    -[DAPriorityManager _setNewPriority](self, "_setNewPriority");
  }
  _Block_object_dispose(&v7, 8);
}

void __49__DAPriorityManager__updateForegroundDataclasses__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= (int)objc_msgSend(v7, "intValue");

}

- (DAPriorityManager)init
{
  DAPriorityManager *v2;
  uint64_t v3;
  NSMapTable *clientsToPriorityRequests;
  id v5;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *cachedAppState;
  uint64_t v9;
  void *v10;
  char v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DAPriorityManager;
  v2 = -[DAPriorityManager init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithWeakToStrongObjects");
    v3 = objc_claimAutoreleasedReturnValue();
    clientsToPriorityRequests = v2->_clientsToPriorityRequests;
    v2->_clientsToPriorityRequests = (NSMapTable *)v3;

    v5 = objc_alloc(MEMORY[0x1E0C99E08]);
    -[DAPriorityManager appIDsToDataclasses](v2, "appIDsToDataclasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));
    cachedAppState = v2->_cachedAppState;
    v2->_cachedAppState = (NSMutableDictionary *)v7;

    -[DAPriorityManager setupProcessStateMonitor](v2, "setupProcessStateMonitor");
    v12 = 0;
    v9 = SBSSpringBoardServerPort();
    MEMORY[0x1B5E487B8](v9, &sDeviceIsLocked, &v12);
    if (init_onceToken != -1)
      dispatch_once(&init_onceToken, &__block_literal_global_24);
    notify_register_dispatch((const char *)*MEMORY[0x1E0DAC070], &init_notifToken, (dispatch_queue_t)init_SBLockQueue, &__block_literal_global_27);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel__setNewPriority, CFSTR("SBLockStateChanged"), 0);

    v2->_currentPriority = 0x80000000;
    -[DAPriorityManager _setNewPriority](v2, "_setNewPriority");
  }
  return v2;
}

void __25__DAPriorityManager_init__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.dataaccessd.sblockqueue", 0);
  v1 = (void *)init_SBLockQueue;
  init_SBLockQueue = (uint64_t)v0;

}

void __25__DAPriorityManager_init__block_invoke_2()
{
  void *v0;
  uint64_t state64;

  state64 = 0;
  notify_get_state(init_notifToken, &state64);
  sDeviceIsLocked = state64 != 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("SBLockStateChanged"), 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBLockStateChanged"), 0);

  -[RBSProcessMonitor invalidate](self->_processMonitor, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)DAPriorityManager;
  -[DAPriorityManager dealloc](&v4, sel_dealloc);
}

- (void)setupProcessStateMonitor
{
  void *v3;
  RBSProcessMonitor *v4;
  RBSProcessMonitor *processMonitor;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0D87D90];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__DAPriorityManager_setupProcessStateMonitor__block_invoke;
  v6[3] = &unk_1E68CC088;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "monitorWithConfiguration:", v6);
  v4 = (RBSProcessMonitor *)objc_claimAutoreleasedReturnValue();
  processMonitor = self->_processMonitor;
  self->_processMonitor = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __45__DAPriorityManager_setupProcessStateMonitor__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D87DC0], "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValues:", 1);
  objc_msgSend(v4, "setEndowmentNamespaces:", &unk_1E68DA248);
  objc_msgSend(v3, "setStateDescriptor:", v4);
  v5 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "appIDsToDataclasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingBundleIdentifier:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  objc_msgSend(v3, "setPredicates:", v9);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __45__DAPriorityManager_setupProcessStateMonitor__block_invoke_2;
  v15[3] = &unk_1E68CC060;
  objc_copyWeak(&v16, v5);
  objc_msgSend(v3, "setUpdateHandler:", v15);
  objc_destroyWeak(&v16);

}

void __45__DAPriorityManager_setupProcessStateMonitor__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  NSObject *WeakRetained;
  NSObject *v16;
  uint64_t v17;
  os_log_type_t v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "taskState");

  objc_msgSend(v7, "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "endowmentNamespaces");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "containsObject:", CFSTR("com.apple.frontboard.visibility"));
  objc_msgSend(v6, "bundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v16 = WeakRetained;
    if (v9 == 4)
      v17 = v12;
    else
      v17 = 0;
    -[NSObject appWithBundleID:isNowRunningAndVisible:](WeakRetained, "appWithBundleID:isNowRunningAndVisible:", v14, v17);
  }
  else
  {
    DALoggingwithCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    v18 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 3);
    if (os_log_type_enabled(v16, v18))
    {
      v19 = 138412290;
      v20 = v6;
      _os_log_impl(&dword_1B51E4000, v16, v18, "Ignoring an update for a process (%@) without a bundle identifier", (uint8_t *)&v19, 0xCu);
    }
  }

}

- (void)_setForegroundDataclasses:(int64_t)a3
{
  self->_foregroundDataclasses = a3;
}

- (id)stateString
{
  void *v3;
  DAPriorityManager *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  objc_sync_enter(v4);
  -[DAPriorityManager clientsToPriorityRequests](v4, "clientsToPriorityRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(v3, "appendString:", CFSTR("------\nDAPriorityManager: \n"));
    -[DAPriorityManager clientsToPriorityRequests](v4, "clientsToPriorityRequests");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keyEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    while (1)
    {

      objc_msgSend(v8, "nextObject");
      v10 = objc_claimAutoreleasedReturnValue();

      if (!v10)
        break;
      -[DAPriorityManager clientsToPriorityRequests](v4, "clientsToPriorityRequests");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v7, "refreshDataclasses") & 0x7F) == 0)
      {
        v9 = (void *)v10;
        if ((objc_msgSend(v7, "UIDataclasses") & 0x7F) == 0)
          continue;
      }
      objc_msgSend(v3, "appendFormat:", CFSTR("\t[%@ "), v10);
      if ((objc_msgSend(v7, "refreshDataclasses") & 0x7F) != 0)
        objc_msgSend(v3, "appendFormat:", CFSTR("Refresh: 0x%lx "), objc_msgSend(v7, "refreshDataclasses") & 0x7F);
      if ((objc_msgSend(v7, "UIDataclasses") & 0x7F) != 0)
        objc_msgSend(v3, "appendFormat:", CFSTR("UI: 0x%lx "), objc_msgSend(v7, "UIDataclasses") & 0x7F);
      objc_msgSend(v3, "appendFormat:", CFSTR("]\n"));
      v9 = (void *)v10;
    }
    objc_msgSend(v3, "appendString:", CFSTR("------\n"));

  }
  objc_sync_exit(v4);

  return v3;
}

- (int)_recalculatePriority
{
  DAPriorityManager *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;

  v2 = self;
  objc_sync_enter(v2);
  -[DAPriorityManager clientsToPriorityRequests](v2, "clientsToPriorityRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = 0;
  for (i = 0; ; i = (void *)v8)
  {

    objc_msgSend(v4, "nextObject");
    v8 = objc_claimAutoreleasedReturnValue();

    if (!v8)
      break;
    -[DAPriorityManager clientsToPriorityRequests](v2, "clientsToPriorityRequests");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v6 |= objc_msgSend(v3, "refreshDataclasses");
    v5 |= objc_msgSend(v3, "UIDataclasses");
  }

  objc_sync_exit(v2);
  if (v5)
    return 0;
  if (sDeviceIsLocked || (v2->_foregroundDataclasses & v6) != 0)
    return 18;
  return 4096;
}

- (void)_setNewPriority
{
  int v3;
  int v4;
  NSObject *v5;
  os_log_type_t v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = -[DAPriorityManager _recalculatePriority](self, "_recalculatePriority");
  if (v3 != self->_currentPriority)
  {
    v4 = v3;
    DALoggingwithCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
    if (os_log_type_enabled(v5, v6))
    {
      v7[0] = 67109120;
      v7[1] = v4;
      _os_log_impl(&dword_1B51E4000, v5, v6, "DAPERF: DAPriorityManager is changing the priority to %d", (uint8_t *)v7, 8u);
    }

    setpriority(4, 0, v4);
    self->_currentPriority = v4;
  }
}

- (void)requestPriority:(int)a3 forClient:(id)a4 dataclasses:(int64_t)a5
{
  id v9;
  DAPriorityManager *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  int64_t v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  int64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAPriorityManager.m"), 258, CFSTR("You can't request priority with a nil client"));

  }
  v10 = self;
  objc_sync_enter(v10);
  -[DAPriorityManager clientsToPriorityRequests](v10, "clientsToPriorityRequests");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v12 = (void *)objc_opt_new();
    -[NSMapTable setObject:forKey:](v10->_clientsToPriorityRequests, "setObject:forKey:", v12, v9);
  }
  DALoggingwithCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
  if (os_log_type_enabled(v13, v14))
  {
    if (a3 > 2)
      v15 = CFSTR("Unknown");
    else
      v15 = off_1E68CC0A8[a3];
    v22 = 138412802;
    v23 = v9;
    v24 = 2112;
    v25 = v15;
    v26 = 2048;
    v27 = a5;
    _os_log_impl(&dword_1B51E4000, v13, v14, "Client %@ requested priority %@ for dataclasses 0x%lx", (uint8_t *)&v22, 0x20u);
  }

  switch(a3)
  {
    case 2:
      v18 = a5 & 0x7F;
      objc_msgSend(v12, "setRefreshDataclasses:", objc_msgSend(v12, "refreshDataclasses") & (v18 ^ 0x7F));
      v17 = objc_msgSend(v12, "UIDataclasses") | v18;
      goto LABEL_16;
    case 1:
      v19 = a5 & 0x7F;
      objc_msgSend(v12, "setRefreshDataclasses:", objc_msgSend(v12, "refreshDataclasses") | v19);
      v17 = objc_msgSend(v12, "UIDataclasses") & (v19 ^ 0x7F);
      goto LABEL_16;
    case 0:
      v16 = ~(_BYTE)a5 & 0x7F;
      objc_msgSend(v12, "setRefreshDataclasses:", objc_msgSend(v12, "refreshDataclasses") & v16);
      v17 = objc_msgSend(v12, "UIDataclasses") & v16;
LABEL_16:
      objc_msgSend(v12, "setUIDataclasses:", v17);
      break;
  }
  if (!objc_msgSend(v12, "refreshDataclasses") && !objc_msgSend(v12, "UIDataclasses"))
  {
    -[DAPriorityManager clientsToPriorityRequests](v10, "clientsToPriorityRequests");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeObjectForKey:", v9);

  }
  -[DAPriorityManager _setNewPriority](v10, "_setNewPriority");

  objc_sync_exit(v10);
}

- (void)bumpDataclassesToUIPriority:(int64_t)a3
{
  DAPriorityManager *v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
  if (os_log_type_enabled(v5, v6))
  {
    v13 = 134217984;
    v14 = a3;
    _os_log_impl(&dword_1B51E4000, v5, v6, "Bumping all client priority requests for dataclasses 0x%lx to UI. Open bar, dude!", (uint8_t *)&v13, 0xCu);
  }

  -[DAPriorityManager clientsToPriorityRequests](v4, "clientsToPriorityRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  for (i = 0; ; i = (void *)v10)
  {
    objc_msgSend(v8, "nextObject");
    v10 = objc_claimAutoreleasedReturnValue();

    if (!v10)
      break;
    -[DAPriorityManager clientsToPriorityRequests](v4, "clientsToPriorityRequests");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setUIDataclasses:", objc_msgSend(v12, "UIDataclasses") | objc_msgSend(v12, "refreshDataclasses") & a3);
    objc_msgSend(v12, "setRefreshDataclasses:", objc_msgSend(v12, "refreshDataclasses") & ~(_DWORD)a3 & 0x7FLL);

  }
  objc_sync_exit(v4);

  -[DAPriorityManager _setNewPriority](v4, "_setNewPriority");
}

- (NSMapTable)clientsToPriorityRequests
{
  return self->_clientsToPriorityRequests;
}

- (void)setClientsToPriorityRequests:(id)a3
{
  objc_storeStrong((id *)&self->_clientsToPriorityRequests, a3);
}

- (int)currentPriority
{
  return self->_currentPriority;
}

- (RBSProcessMonitor)processMonitor
{
  return self->_processMonitor;
}

- (void)setProcessMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_processMonitor, a3);
}

- (NSMutableDictionary)cachedAppState
{
  return self->_cachedAppState;
}

- (void)setCachedAppState:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAppState, a3);
}

- (int64_t)foregroundDataclasses
{
  return self->_foregroundDataclasses;
}

- (void)setForegroundDataclasses:(int64_t)a3
{
  self->_foregroundDataclasses = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAppState, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_clientsToPriorityRequests, 0);
}

@end
