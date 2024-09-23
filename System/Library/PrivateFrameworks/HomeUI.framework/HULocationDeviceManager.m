@implementation HULocationDeviceManager

+ (HULocationDeviceManager)sharedInstance
{
  if (qword_1ED580B40 != -1)
    dispatch_once(&qword_1ED580B40, &__block_literal_global_93_2);
  return (HULocationDeviceManager *)(id)qword_1ED580B38;
}

void __41__HULocationDeviceManager_sharedInstance__block_invoke()
{
  HULocationDeviceManager *v0;
  void *v1;

  v0 = objc_alloc_init(HULocationDeviceManager);
  v1 = (void *)qword_1ED580B38;
  qword_1ED580B38 = (uint64_t)v0;

}

- (HULocationDeviceManager)init
{
  HULocationDeviceManager *v2;
  id v3;
  void *v4;
  uint64_t v5;
  FMFSession *fmfSession;
  uint64_t v7;
  NSHashTable *observers;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HULocationDeviceManager;
  v2 = -[HULocationDeviceManager init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D20260]);
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithDelegate:delegateQueue:", v2, v4);
    fmfSession = v2->_fmfSession;
    v2->_fmfSession = (FMFSession *)v5;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v7;

  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HULocationDeviceManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HULocationDeviceManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (NAFuture)activeFMFDeviceFuture
{
  NAFuture *activeFMFDeviceFuture;
  id v4;
  void *v5;
  id v6;
  NAFuture *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  activeFMFDeviceFuture = self->_activeFMFDeviceFuture;
  if (!activeFMFDeviceFuture)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HULocationDeviceManager fmfSession](self, "fmfSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __48__HULocationDeviceManager_activeFMFDeviceFuture__block_invoke;
    v12[3] = &unk_1E6F55D30;
    v6 = v4;
    v13 = v6;
    objc_msgSend(v5, "getActiveLocationSharingDevice:", v12);

    v7 = self->_activeFMFDeviceFuture;
    self->_activeFMFDeviceFuture = (NAFuture *)v6;
    v8 = v6;

    activeFMFDeviceFuture = self->_activeFMFDeviceFuture;
  }
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NAFuture reschedule:](activeFMFDeviceFuture, "reschedule:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NAFuture *)v10;
}

void __48__HULocationDeviceManager_activeFMFDeviceFuture__block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  v10 = a2;
  v5 = a3;
  v6 = (void *)v5;
  v7 = *(void **)(a1 + 32);
  if (!(v10 | v5))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = (void *)v8;
    objc_msgSend(v7, "finishWithError:", v8);

    goto LABEL_6;
  }
  if (!v10)
  {
    if (v5)
    {
      objc_msgSend(v7, "finishWithError:", v5);
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "na_genericError");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(v7, "finishWithResult:");
LABEL_6:

}

- (NAFuture)availableFMFDevicesFuture
{
  NAFuture *availableFMFDevicesFuture;
  id v4;
  void *v5;
  id v6;
  NAFuture *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  availableFMFDevicesFuture = self->_availableFMFDevicesFuture;
  if (!availableFMFDevicesFuture)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HULocationDeviceManager fmfSession](self, "fmfSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__HULocationDeviceManager_availableFMFDevicesFuture__block_invoke;
    v10[3] = &unk_1E6F52828;
    v6 = v4;
    v11 = v6;
    objc_msgSend(v5, "getAllDevices:", v10);

    v7 = self->_availableFMFDevicesFuture;
    self->_availableFMFDevicesFuture = (NAFuture *)v6;
    v8 = v6;

    availableFMFDevicesFuture = self->_availableFMFDevicesFuture;
  }
  return availableFMFDevicesFuture;
}

void __52__HULocationDeviceManager_availableFMFDevicesFuture__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v6, "finishWithError:", v5);
  }
  else if (v8)
  {
    objc_msgSend(v6, "finishWithResult:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishWithResult:", v7);

  }
}

- (NAFuture)activeLocationDeviceFuture
{
  void *v2;
  void *v3;

  -[HULocationDeviceManager activeFMFDeviceFuture](self, "activeFMFDeviceFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flatMap:", &__block_literal_global_106_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NAFuture *)v3;
}

id __53__HULocationDeviceManager_activeLocationDeviceFuture__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  HULocationDevice *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D519C0];
  v3 = a2;
  v4 = -[HULocationDevice initWithFMFDevice:]([HULocationDevice alloc], "initWithFMFDevice:", v3);

  objc_msgSend(v2, "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NAFuture)availableLocationDevicesFuture
{
  void *v2;
  void *v3;

  -[HULocationDeviceManager availableFMFDevicesFuture](self, "availableFMFDevicesFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flatMap:", &__block_literal_global_109_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NAFuture *)v3;
}

id __57__HULocationDeviceManager_availableLocationDevicesFuture__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(a2, "na_map:", &__block_literal_global_111);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

HULocationDevice *__57__HULocationDeviceManager_availableLocationDevicesFuture__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  HULocationDevice *v3;

  v2 = a2;
  v3 = -[HULocationDevice initWithFMFDevice:]([HULocationDevice alloc], "initWithFMFDevice:", v2);

  return v3;
}

- (id)updateActiveLocationDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Updating active location device to: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[HULocationDeviceManager availableFMFDevicesFuture](self, "availableFMFDevicesFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__HULocationDeviceManager_updateActiveLocationDevice___block_invoke;
  v10[3] = &unk_1E6F55E40;
  objc_copyWeak(&v12, (id *)buf);
  v7 = v4;
  v11 = v7;
  objc_msgSend(v6, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);

  return v8;
}

id __54__HULocationDeviceManager_updateActiveLocationDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __54__HULocationDeviceManager_updateActiveLocationDevice___block_invoke_2;
  v26[3] = &unk_1E6F55E18;
  v27 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_firstObjectPassingTest:", v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    objc_msgSend(WeakRetained, "fmfSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorOnlyCompletionHandlerAdapter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActiveDevice:completion:", v6, v9);

    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reschedule:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v5;
    v22[1] = 3221225472;
    v22[2] = __54__HULocationDeviceManager_updateActiveLocationDevice___block_invoke_113;
    v22[3] = &unk_1E6F542A8;
    v23 = *(id *)(a1 + 32);
    v12 = v6;
    v24 = v12;
    v25 = WeakRetained;
    objc_msgSend(v11, "addSuccessBlock:", v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v5;
    v19[1] = 3221225472;
    v19[2] = __54__HULocationDeviceManager_updateActiveLocationDevice___block_invoke_115;
    v19[3] = &unk_1E6F4D1B0;
    v20 = *(id *)(a1 + 32);
    v21 = v12;
    objc_msgSend(v13, "addFailureBlock:", v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    HFLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v29 = v18;
      v30 = 2112;
      v31 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_ERROR, "Could not find FMF device for location device %@! FMF devices: %@", buf, 0x16u);
    }

    v16 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "futureWithError:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

uint64_t __54__HULocationDeviceManager_updateActiveLocationDevice___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "deviceId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __54__HULocationDeviceManager_updateActiveLocationDevice___block_invoke_113(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "Successfully updated active location device to: %@ (FMF device: %@)", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 48), "_updateActiveFMFDevice:", *(_QWORD *)(a1 + 40));
}

void __54__HULocationDeviceManager_updateActiveLocationDevice___block_invoke_115(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_error_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_ERROR, "Failed to update active location device to: %@ (FMF device: %@)", (uint8_t *)&v5, 0x16u);
  }

}

- (void)_updateActiveFMFDevice:(id)a3
{
  NAFuture *activeFMFDeviceFuture;
  NAFuture *v5;
  NAFuture *v6;
  void *v7;
  id v8;

  v8 = a3;
  activeFMFDeviceFuture = self->_activeFMFDeviceFuture;
  if (activeFMFDeviceFuture && (-[NAFuture isFinished](activeFMFDeviceFuture, "isFinished") & 1) == 0)
    v5 = self->_activeFMFDeviceFuture;
  else
    v5 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
  v6 = v5;
  if (v8)
  {
    -[NAFuture finishWithResult:](v5, "finishWithResult:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NAFuture finishWithError:](v6, "finishWithError:", v7);

  }
  -[HULocationDeviceManager setActiveFMFDeviceFuture:](self, "setActiveFMFDeviceFuture:", v6);

}

- (void)didUpdateActiveDeviceList:(id)a3
{
  id v4;
  NSObject *v5;
  NAFuture *availableFMFDevicesFuture;
  NAFuture *v7;
  NAFuture *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "didUpdateActiveDeviceList: %@", buf, 0xCu);
  }

  availableFMFDevicesFuture = self->_availableFMFDevicesFuture;
  if (availableFMFDevicesFuture && (-[NAFuture isFinished](availableFMFDevicesFuture, "isFinished") & 1) == 0)
    v7 = self->_availableFMFDevicesFuture;
  else
    v7 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
  v8 = v7;
  if (v4)
  {
    -[NAFuture finishWithResult:](v7, "finishWithResult:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NAFuture finishWithResult:](v8, "finishWithResult:", v9);

  }
  -[HULocationDeviceManager setAvailableFMFDevicesFuture:](self, "setAvailableFMFDevicesFuture:", v8);
  objc_initWeak((id *)buf, self);
  -[HULocationDeviceManager availableLocationDevicesFuture](self, "availableLocationDevicesFuture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__HULocationDeviceManager_didUpdateActiveDeviceList___block_invoke;
  v12[3] = &unk_1E6F55E68;
  objc_copyWeak(&v13, (id *)buf);
  v11 = (id)objc_msgSend(v10, "addSuccessBlock:", v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

void __53__HULocationDeviceManager_didUpdateActiveDeviceList___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(WeakRetained, "observers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "locationDeviceManager:didUpdateAvailableLocationDevices:", WeakRetained, v3);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)didChangeActiveLocationSharingDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "didChangeActiveLocationSharingDevice: %@", buf, 0xCu);
  }

  -[HULocationDeviceManager _updateActiveFMFDevice:](self, "_updateActiveFMFDevice:", v4);
  objc_initWeak((id *)buf, self);
  -[HULocationDeviceManager activeLocationDeviceFuture](self, "activeLocationDeviceFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__HULocationDeviceManager_didChangeActiveLocationSharingDevice___block_invoke;
  v8[3] = &unk_1E6F55E90;
  objc_copyWeak(&v9, (id *)buf);
  v7 = (id)objc_msgSend(v6, "addSuccessBlock:", v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);

}

void __64__HULocationDeviceManager_didChangeActiveLocationSharingDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(WeakRetained, "observers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "locationDeviceManager:didUpdateActiveLocationDevice:", WeakRetained, v3);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (FMFSession)fmfSession
{
  return self->_fmfSession;
}

- (void)setActiveFMFDeviceFuture:(id)a3
{
  objc_storeStrong((id *)&self->_activeFMFDeviceFuture, a3);
}

- (void)setAvailableFMFDevicesFuture:(id)a3
{
  objc_storeStrong((id *)&self->_availableFMFDevicesFuture, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_availableFMFDevicesFuture, 0);
  objc_storeStrong((id *)&self->_activeFMFDeviceFuture, 0);
  objc_storeStrong((id *)&self->_fmfSession, 0);
}

@end
