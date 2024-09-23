@implementation HKWristDetectionSettingManager

- (HKWristDetectionSettingManager)init
{
  return -[HKWristDetectionSettingManager initWithPairedDeviceRegistry:](self, "initWithPairedDeviceRegistry:", 0);
}

- (HKWristDetectionSettingManager)initWithPairedDeviceRegistry:(id)a3
{
  id v5;
  HKWristDetectionSettingManager *v6;
  HKWristDetectionSettingManager *v7;
  uint64_t v8;
  OS_dispatch_queue *queue;
  HKObserverSet *v10;
  void *v11;
  uint64_t v12;
  HKObserverSet *observers;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKWristDetectionSettingManager;
  v6 = -[HKWristDetectionSettingManager init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    HKCreateSerialDispatchQueue(v6, CFSTR("HKWristDetectManager private queue"));
    v8 = objc_claimAutoreleasedReturnValue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v7->_loggingCategory, (id)HKLogDefault);
    v10 = [HKObserverSet alloc];
    -[HKWristDetectionSettingManager description](v7, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HKObserverSet initWithName:loggingCategory:](v10, "initWithName:loggingCategory:", v11, v7->_loggingCategory);
    observers = v7->_observers;
    v7->_observers = (HKObserverSet *)v12;

    objc_storeStrong(&v7->_pairedDeviceRegistry, a3);
    v7->_disableWristDetectionSettingChangeNotificationToken = -1;
  }

  return v7;
}

- (void)dealloc
{
  int disableWristDetectionSettingChangeNotificationToken;
  objc_super v4;

  disableWristDetectionSettingChangeNotificationToken = self->_disableWristDetectionSettingChangeNotificationToken;
  if (disableWristDetectionSettingChangeNotificationToken != -1)
    notify_cancel(disableWristDetectionSettingChangeNotificationToken);
  v4.receiver = self;
  v4.super_class = (Class)HKWristDetectionSettingManager;
  -[HKWristDetectionSettingManager dealloc](&v4, sel_dealloc);
}

- (id)pairedDeviceRegistry
{
  id pairedDeviceRegistry;
  void *v4;
  id v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  pairedDeviceRegistry = self->_pairedDeviceRegistry;
  if (pairedDeviceRegistry)
    return pairedDeviceRegistry;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v4 = (void *)getNRPairedDeviceRegistryClass_softClass_4;
  v10 = getNRPairedDeviceRegistryClass_softClass_4;
  if (!getNRPairedDeviceRegistryClass_softClass_4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __getNRPairedDeviceRegistryClass_block_invoke_4;
    v6[3] = &unk_1E37E8690;
    v6[4] = &v7;
    __getNRPairedDeviceRegistryClass_block_invoke_4((uint64_t)v6);
    v4 = (void *)v8[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v7, 8);
  objc_msgSend(v5, "sharedInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)isWristDetectEnabled
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HKObjectForNanoPreferencesUserDefaultsKey(CFSTR("com.apple.Carousel"), CFSTR("DisableWristDetection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "BOOLValue") ^ 1;
  }
  else
  {
    _HKInitializeLogging();
    v6 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = a1;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unable to retrieve wrist detect setting, defaulting to YES.", (uint8_t *)&v8, 0xCu);
    }
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (BOOL)isWristDetectEnabled
{
  return objc_msgSend((id)objc_opt_class(), "isWristDetectEnabled");
}

- (void)registerObserver:(id)a3
{
  -[HKWristDetectionSettingManager registerObserver:queue:](self, "registerObserver:queue:", a3, 0);
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  HKObserverSet *observers;
  _QWORD v5[5];

  observers = self->_observers;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__HKWristDetectionSettingManager_registerObserver_queue___block_invoke;
  v5[3] = &unk_1E37E6770;
  v5[4] = self;
  -[HKObserverSet registerObserver:queue:runIfFirstObserver:](observers, "registerObserver:queue:runIfFirstObserver:", a3, a4, v5);
}

uint64_t __57__HKWristDetectionSettingManager_registerObserver_queue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startObserving");
}

- (void)unregisterObserver:(id)a3
{
  HKObserverSet *observers;
  _QWORD v4[5];

  observers = self->_observers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__HKWristDetectionSettingManager_unregisterObserver___block_invoke;
  v4[3] = &unk_1E37E6770;
  v4[4] = self;
  -[HKObserverSet unregisterObserver:runIfLastObserver:](observers, "unregisterObserver:runIfLastObserver:", a3, v4);
}

uint64_t __53__HKWristDetectionSettingManager_unregisterObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopObserving");
}

- (void)_startObserving
{
  NSObject *loggingCategory;
  NSObject *queue;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD handler[4];
  id v19;
  uint8_t v20[128];
  uint8_t buf[4];
  HKWristDetectionSettingManager *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = self;
    _os_log_impl(&dword_19A0E6000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting observation", buf, 0xCu);
  }
  if (self->_disableWristDetectionSettingChangeNotificationToken == -1)
  {
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __49__HKWristDetectionSettingManager__startObserving__block_invoke;
    handler[3] = &unk_1E37E9F88;
    objc_copyWeak(&v19, (id *)buf);
    notify_register_dispatch("CSLDisableWristDetectionChangedNotification", &self->_disableWristDetectionSettingChangeNotificationToken, queue, handler);
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAppleWatch");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[HKWristDetectionSettingManager _activeWatchNotifications](self, "_activeWatchNotifications", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          -[HKWristDetectionSettingManager pairedDeviceRegistry](self, "pairedDeviceRegistry");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__pairedOrActiveDevicesDidChange_, v12, v13);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v9);
    }

  }
}

void __49__HKWristDetectionSettingManager__startObserving__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_settingDidChange");

}

- (id)_activeWatchNotifications
{
  id *v2;
  void *v3;
  id v4;
  id *v5;
  void *v6;
  id v7;
  id *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v2 = (id *)getNRPairedDeviceRegistryDeviceIsSetupNotificationSymbolLoc_ptr_0;
  v17 = getNRPairedDeviceRegistryDeviceIsSetupNotificationSymbolLoc_ptr_0;
  if (!getNRPairedDeviceRegistryDeviceIsSetupNotificationSymbolLoc_ptr_0)
  {
    v3 = (void *)NanoRegistryLibrary_4();
    v2 = (id *)dlsym(v3, "NRPairedDeviceRegistryDeviceIsSetupNotification");
    v15[3] = (uint64_t)v2;
    getNRPairedDeviceRegistryDeviceIsSetupNotificationSymbolLoc_ptr_0 = (uint64_t)v2;
  }
  _Block_object_dispose(&v14, 8);
  if (!v2)
    -[HKWristDetectionSettingManager _activeWatchNotifications].cold.1();
  v4 = *v2;
  v18[0] = v4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v5 = (id *)getNRPairedDeviceRegistryDeviceDidUnpairNotificationSymbolLoc_ptr_0;
  v17 = getNRPairedDeviceRegistryDeviceDidUnpairNotificationSymbolLoc_ptr_0;
  if (!getNRPairedDeviceRegistryDeviceDidUnpairNotificationSymbolLoc_ptr_0)
  {
    v6 = (void *)NanoRegistryLibrary_4();
    v5 = (id *)dlsym(v6, "NRPairedDeviceRegistryDeviceDidUnpairNotification");
    v15[3] = (uint64_t)v5;
    getNRPairedDeviceRegistryDeviceDidUnpairNotificationSymbolLoc_ptr_0 = (uint64_t)v5;
  }
  _Block_object_dispose(&v14, 8);
  if (!v5)
    -[HKWristDetectionSettingManager _activeWatchNotifications].cold.2();
  v7 = *v5;
  v18[1] = v7;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v8 = (id *)getNRPairedDeviceRegistryDeviceDidBecomeActiveSymbolLoc_ptr_0;
  v17 = getNRPairedDeviceRegistryDeviceDidBecomeActiveSymbolLoc_ptr_0;
  if (!getNRPairedDeviceRegistryDeviceDidBecomeActiveSymbolLoc_ptr_0)
  {
    v9 = (void *)NanoRegistryLibrary_4();
    v8 = (id *)dlsym(v9, "NRPairedDeviceRegistryDeviceDidBecomeActive");
    v15[3] = (uint64_t)v8;
    getNRPairedDeviceRegistryDeviceDidBecomeActiveSymbolLoc_ptr_0 = (uint64_t)v8;
  }
  _Block_object_dispose(&v14, 8);
  if (!v8)
    -[HKWristDetectionSettingManager _activeWatchNotifications].cold.3();
  v19 = *v8;
  v10 = (void *)MEMORY[0x1E0C99D20];
  v11 = v19;
  objc_msgSend(v10, "arrayWithObjects:count:", v18, 3, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_stopObserving
{
  NSObject *loggingCategory;
  int disableWristDetectionSettingChangeNotificationToken;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  HKWristDetectionSettingManager *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = self;
    _os_log_impl(&dword_19A0E6000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Stopping observation", buf, 0xCu);
  }
  disableWristDetectionSettingChangeNotificationToken = self->_disableWristDetectionSettingChangeNotificationToken;
  if (disableWristDetectionSettingChangeNotificationToken != -1)
    notify_cancel(disableWristDetectionSettingChangeNotificationToken);
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAppleWatch");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[HKWristDetectionSettingManager _activeWatchNotifications](self, "_activeWatchNotifications", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          -[HKWristDetectionSettingManager pairedDeviceRegistry](self, "pairedDeviceRegistry");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "removeObserver:name:object:", self, v13, v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
}

- (void)_queue_settingDidChange
{
  NSObject *loggingCategory;
  NSObject *v4;
  id v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    v4 = loggingCategory;
    *(_DWORD *)v6 = 138543362;
    *(_QWORD *)&v6[4] = objc_opt_class();
    v5 = *(id *)&v6[4];
    _os_log_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received notification of setting change", v6, 0xCu);

  }
  -[HKWristDetectionSettingManager _queue_notifyObservers](self, "_queue_notifyObservers", *(_OWORD *)v6);
}

- (void)_pairedOrActiveDevicesDidChange:(id)a3
{
  id v4;
  NSObject *loggingCategory;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    v6 = loggingCategory;
    v7 = (void *)objc_opt_class();
    v8 = v7;
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v7;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received pairing/active notification: %{public}@", buf, 0x16u);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__HKWristDetectionSettingManager__pairedOrActiveDevicesDidChange___block_invoke;
  block[3] = &unk_1E37E6770;
  block[4] = self;
  dispatch_async(queue, block);

}

uint64_t __66__HKWristDetectionSettingManager__pairedOrActiveDevicesDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyObservers");
}

- (void)_queue_notifyObservers
{
  HKObserverSet *observers;
  _QWORD v4[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  observers = self->_observers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__HKWristDetectionSettingManager__queue_notifyObservers__block_invoke;
  v4[3] = &unk_1E37F2E88;
  v4[4] = self;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v4);
}

uint64_t __56__HKWristDetectionSettingManager__queue_notifyObservers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wristDetectionSettingManagerDidObserveWristDetectChange:", *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pairedDeviceRegistry, 0);
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_activeWatchNotifications
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getNRPairedDeviceRegistryDeviceDidBecomeActive(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("HKWristDetectionSettingManager.m"), 28, CFSTR("%s"), OUTLINED_FUNCTION_0_6());

  __break(1u);
}

@end
