@implementation HFProxControlActivityClientManager

+ (id)sharedInstance
{
  if (qword_1ED379570 != -1)
    dispatch_once(&qword_1ED379570, &__block_literal_global_143);
  return (id)_MergedGlobals_278;
}

void __52__HFProxControlActivityClientManager_sharedInstance__block_invoke()
{
  HFProxControlActivityClientManager *v0;
  void *v1;

  v0 = objc_alloc_init(HFProxControlActivityClientManager);
  v1 = (void *)_MergedGlobals_278;
  _MergedGlobals_278 = (uint64_t)v0;

}

- (HFProxControlActivityClientManager)init
{
  HFProxControlActivityClientManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *dataModelUpdateQueue;
  uint64_t v5;
  NSHashTable *observers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFProxControlActivityClientManager;
  v2 = -[HFProxControlActivityClientManager init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.Home.proxControlDataModelUpdateQueue", 0);
    dataModelUpdateQueue = v2->_dataModelUpdateQueue;
    v2->_dataModelUpdateQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  HFProxControlActivityClientManager *v10;
  SEL v11;

  v5 = a3;
  -[HFProxControlActivityClientManager dataModelUpdateQueue](self, "dataModelUpdateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__HFProxControlActivityClientManager_addObserver___block_invoke;
  block[3] = &unk_1EA727778;
  v10 = self;
  v11 = a2;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

void __50__HFProxControlActivityClientManager_addObserver___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "%@ Adding observer = %@", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 32));

}

- (void)removeObserver:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  HFProxControlActivityClientManager *v10;
  SEL v11;

  v5 = a3;
  -[HFProxControlActivityClientManager dataModelUpdateQueue](self, "dataModelUpdateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__HFProxControlActivityClientManager_removeObserver___block_invoke;
  block[3] = &unk_1EA727778;
  v10 = self;
  v11 = a2;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

void __53__HFProxControlActivityClientManager_removeObserver___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "%@ Removing observer = %@", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 32));

}

- (id)startMonitoringUpdatesForMediaRemoteIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HFProxControlActivityClientManager _setupProxControlClient](self, "_setupProxControlClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__HFProxControlActivityClientManager_startMonitoringUpdatesForMediaRemoteIdentifier___block_invoke;
  v9[3] = &unk_1EA72CA50;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

id __85__HFProxControlActivityClientManager_startMonitoringUpdatesForMediaRemoteIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  v5 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D83170]), "initWithIdentifier:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "proxControlActivityClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startObservingMediaRemoteIdentifier:", v7);

  objc_msgSend(WeakRetained, "setHasStartedMonitoringUpdates:", 1);
  v12 = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v14, v5);
  v9 = v4;
  v13 = v9;
  objc_msgSend(WeakRetained, "proxControlActivityClient", v12, 3221225472, __85__HFProxControlActivityClientManager_startMonitoringUpdatesForMediaRemoteIdentifier___block_invoke_2, &unk_1EA738490);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMediaRemoteUpdateHandler:", &v12);

  objc_destroyWeak(&v14);
  return v9;
}

void __85__HFProxControlActivityClientManager_startMonitoringUpdatesForMediaRemoteIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __85__HFProxControlActivityClientManager_startMonitoringUpdatesForMediaRemoteIdentifier___block_invoke_3;
  v17 = &unk_1EA7271B0;
  v18 = WeakRetained;
  v19 = v8;
  v20 = v7;
  v21 = v9;
  v11 = v9;
  v12 = v7;
  v13 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], &v14);
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", MEMORY[0x1E0C9AAB0], v14, v15, v16, v17, v18);

}

uint64_t __85__HFProxControlActivityClientManager_startMonitoringUpdatesForMediaRemoteIdentifier___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForUpdatedActivities:forProxControlID:disambiguationContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (id)startMonitoringUpdatesForAccessoryID:(id)a3 homeID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HFProxControlActivityClientManager _setupProxControlClient](self, "_setupProxControlClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__HFProxControlActivityClientManager_startMonitoringUpdatesForAccessoryID_homeID___block_invoke;
  v13[3] = &unk_1EA72BC68;
  objc_copyWeak(&v16, &location);
  v9 = v7;
  v14 = v9;
  v10 = v6;
  v15 = v10;
  objc_msgSend(v8, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

id __82__HFProxControlActivityClientManager_startMonitoringUpdatesForAccessoryID_homeID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  v5 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setHomeID:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAccessoryID:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D83168]), "initWithAccessoryID:homeID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "proxControlActivityClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startObservingDeviceWithIdentifier:", v7);

  objc_msgSend(WeakRetained, "setHasStartedMonitoringUpdates:", 1);
  v12 = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v14, v5);
  v9 = v4;
  v13 = v9;
  objc_msgSend(WeakRetained, "proxControlActivityClient", v12, 3221225472, __82__HFProxControlActivityClientManager_startMonitoringUpdatesForAccessoryID_homeID___block_invoke_2, &unk_1EA7384B8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUpdateHandler:", &v12);

  objc_destroyWeak(&v14);
  return v9;
}

void __82__HFProxControlActivityClientManager_startMonitoringUpdatesForAccessoryID_homeID___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __82__HFProxControlActivityClientManager_startMonitoringUpdatesForAccessoryID_homeID___block_invoke_3;
  v17 = &unk_1EA7271B0;
  v18 = WeakRetained;
  v19 = v8;
  v20 = v7;
  v21 = v9;
  v11 = v9;
  v12 = v7;
  v13 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], &v14);
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", MEMORY[0x1E0C9AAB0], v14, v15, v16, v17, v18);

}

uint64_t __82__HFProxControlActivityClientManager_startMonitoringUpdatesForAccessoryID_homeID___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForUpdatedActivities:forProxControlID:disambiguationContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)userTappedDisambiguationButtonForContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFProxControlActivityClientManager proxControlActivityClient](self, "proxControlActivityClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userTappedDisambiguationButton:", v4);

}

- (void)userTappedCloseButton
{
  void *v3;
  id v4;

  -[HFProxControlActivityClientManager proxControlActivityClient](self, "proxControlActivityClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userTappedCloseButton");

  -[HFProxControlActivityClientManager proxControlActivityClient](self, "proxControlActivityClient");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

- (void)invalidateProxClient
{
  NSObject *v3;
  void *v4;
  int v5;
  HFProxControlActivityClientManager *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "%@ Invalidating Prox client", (uint8_t *)&v5, 0xCu);
  }

  -[HFProxControlActivityClientManager proxControlActivityClient](self, "proxControlActivityClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

- (id)_setupProxControlClient
{
  id v4;
  PCRemoteActivityClient *v5;
  PCRemoteActivityClient *proxControlActivityClient;
  void *v7;
  uint64_t v8;
  PCRemoteActivityClient *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  SEL v14;
  _QWORD v15[5];
  _QWORD v16[5];

  v4 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  v5 = (PCRemoteActivityClient *)objc_alloc_init(MEMORY[0x1E0D83178]);
  proxControlActivityClient = self->_proxControlActivityClient;
  self->_proxControlActivityClient = v5;

  -[HFProxControlActivityClientManager dataModelUpdateQueue](self, "dataModelUpdateQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCRemoteActivityClient setDispatchQueue:](self->_proxControlActivityClient, "setDispatchQueue:", v7);

  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__HFProxControlActivityClientManager__setupProxControlClient__block_invoke;
  v16[3] = &__block_descriptor_40_e5_v8__0l;
  v16[4] = a2;
  -[PCRemoteActivityClient setInterruptionHandler:](self->_proxControlActivityClient, "setInterruptionHandler:", v16);
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __61__HFProxControlActivityClientManager__setupProxControlClient__block_invoke_19;
  v15[3] = &__block_descriptor_40_e5_v8__0l;
  v15[4] = a2;
  -[PCRemoteActivityClient setInvalidationHandler:](self->_proxControlActivityClient, "setInvalidationHandler:", v15);
  v9 = self->_proxControlActivityClient;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __61__HFProxControlActivityClientManager__setupProxControlClient__block_invoke_20;
  v12[3] = &unk_1EA72C190;
  v10 = v4;
  v13 = v10;
  v14 = a2;
  -[PCRemoteActivityClient activateWithCompletion:](v9, "activateWithCompletion:", v12);

  return v10;
}

void __61__HFProxControlActivityClientManager__setupProxControlClient__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_error_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_ERROR, "%@ InterruptionHandler called back", (uint8_t *)&v4, 0xCu);

  }
}

void __61__HFProxControlActivityClientManager__setupProxControlClient__block_invoke_19(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_error_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_ERROR, "%@ InvalidationHandler called back", (uint8_t *)&v4, 0xCu);

  }
}

void __61__HFProxControlActivityClientManager__setupProxControlClient__block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "finishWithError:", v3);
    HFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v3;
      _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "%@ PCRemoteActivityClient wasn't activated [%@]", (uint8_t *)&v7, 0x16u);
LABEL_6:

    }
  }
  else
  {
    objc_msgSend(v4, "finishWithResult:", MEMORY[0x1E0C9AAB0]);
    HFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%@ PCRemoteActivityClient Activated Succesfully!", (uint8_t *)&v7, 0xCu);
      goto LABEL_6;
    }
  }

}

- (void)_resetProxClient
{
  void *v3;
  id v4;

  -[HFProxControlActivityClientManager proxControlActivityClient](self, "proxControlActivityClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[HFProxControlActivityClientManager setProxControlActivityClient:](self, "setProxControlActivityClient:", 0);
  -[HFProxControlActivityClientManager setHasStartedMonitoringUpdates:](self, "setHasStartedMonitoringUpdates:", 0);
  v4 = -[HFProxControlActivityClientManager _setupProxControlClient](self, "_setupProxControlClient");
}

- (void)_notifyObserversForUpdatedActivities:(id)a3 forProxControlID:(id)a4 disambiguationContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  HFLogForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v31 = v13;
    v32 = 2112;
    v33 = v9;
    v34 = 2112;
    v35 = v11;
    v36 = 2112;
    v37 = v10;
    _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "%@ UpdateHandler called back with activities = %@ - disambiguationContext = %@, identifier = %@", buf, 0x2Au);

  }
  HFLogForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leadingImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "titleText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subtitleText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v31 = v15;
    v32 = 2112;
    v33 = v16;
    v34 = 2112;
    v35 = v17;
    v36 = 2112;
    v37 = v18;
    _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "\n %@ leadingImage = [%@] titleText = [%@] subTitle = [%@]", buf, 0x2Au);

  }
  -[HFProxControlActivityClientManager setLastIdentifier:](self, "setLastIdentifier:", v10);
  -[HFProxControlActivityClientManager setLastActivities:](self, "setLastActivities:", v9);
  -[HFProxControlActivityClientManager setLastDisambiguationContext:](self, "setLastDisambiguationContext:", v11);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[HFProxControlActivityClientManager observers](self, "observers", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v24, "conformsToProtocol:", &unk_1F04765C0)
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v24, "didUpdateActivities:forProxControlID:disambiguationContext:", v9, v10, v11);
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v21);
  }

}

- (BOOL)hasStartedMonitoringUpdates
{
  return self->_hasStartedMonitoringUpdates;
}

- (void)setHasStartedMonitoringUpdates:(BOOL)a3
{
  self->_hasStartedMonitoringUpdates = a3;
}

- (NSObject)lastIdentifier
{
  return self->_lastIdentifier;
}

- (void)setLastIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_lastIdentifier, a3);
}

- (NSOrderedSet)lastActivities
{
  return self->_lastActivities;
}

- (void)setLastActivities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (PCDisambiguationContext)lastDisambiguationContext
{
  return self->_lastDisambiguationContext;
}

- (void)setLastDisambiguationContext:(id)a3
{
  objc_storeStrong((id *)&self->_lastDisambiguationContext, a3);
}

- (BOOL)useSAConfig
{
  return self->_useSAConfig;
}

- (void)setUseSAConfig:(BOOL)a3
{
  self->_useSAConfig = a3;
}

- (PCRemoteActivityClient)proxControlActivityClient
{
  return self->_proxControlActivityClient;
}

- (void)setProxControlActivityClient:(id)a3
{
  objc_storeStrong((id *)&self->_proxControlActivityClient, a3);
}

- (NSUUID)homeID
{
  return self->_homeID;
}

- (void)setHomeID:(id)a3
{
  objc_storeStrong((id *)&self->_homeID, a3);
}

- (NSUUID)accessoryID
{
  return self->_accessoryID;
}

- (void)setAccessoryID:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryID, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (OS_dispatch_queue)dataModelUpdateQueue
{
  return self->_dataModelUpdateQueue;
}

- (void)setDataModelUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dataModelUpdateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataModelUpdateQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_accessoryID, 0);
  objc_storeStrong((id *)&self->_homeID, 0);
  objc_storeStrong((id *)&self->_proxControlActivityClient, 0);
  objc_storeStrong((id *)&self->_lastDisambiguationContext, 0);
  objc_storeStrong((id *)&self->_lastActivities, 0);
  objc_storeStrong((id *)&self->_lastIdentifier, 0);
}

@end
