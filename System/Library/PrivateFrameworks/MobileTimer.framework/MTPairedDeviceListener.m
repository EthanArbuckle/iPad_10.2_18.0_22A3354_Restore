@implementation MTPairedDeviceListener

void __40__MTPairedDeviceListener_sharedListener__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedListener___sharedListener;
  sharedListener___sharedListener = v0;

}

- (MTPairedDeviceListener)init
{
  MTPairedDeviceListener *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *serializerQueue;
  uint64_t v7;
  NAScheduler *serializer;
  uint64_t v9;
  MTObserverStore *observers;
  objc_super v12;
  uint8_t buf[4];
  MTPairedDeviceListener *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)MTPairedDeviceListener;
  v2 = -[MTPairedDeviceListener init](&v12, sel_init);
  if (v2)
  {
    MTLogForCategory(6);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v2;
      _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
    }

    dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)+[MTScheduler defaultPriority](MTScheduler, "defaultPriority"), -1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.MTPairedDeviceListener.access-queue", v4);
    serializerQueue = v2->_serializerQueue;
    v2->_serializerQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0D519E8], "schedulerWithDispatchQueue:", v2->_serializerQueue);
    v7 = objc_claimAutoreleasedReturnValue();
    serializer = v2->_serializer;
    v2->_serializer = (NAScheduler *)v7;

    v9 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (MTObserverStore *)v9;

    -[MTPairedDeviceListener _registerForLocalNotifications](v2, "_registerForLocalNotifications");
    -[MTPairedDeviceListener updateActiveDeviceInfo](v2, "updateActiveDeviceInfo");

  }
  return v2;
}

- (void)updateActiveDeviceInfo
{
  void *v3;
  _QWORD v4[5];

  -[MTPairedDeviceListener serializer](self, "serializer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__MTPairedDeviceListener_updateActiveDeviceInfo__block_invoke;
  v4[3] = &unk_1E39CB858;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

- (NAScheduler)serializer
{
  return self->_serializer;
}

void __48__MTPairedDeviceListener_updateActiveDeviceInfo__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getActivePairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setPairedDevice:", v3);
  MTLogForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "pairedDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0D51728]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "pairedDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForProperty:", *MEMORY[0x1E0D51778]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v5;
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Active Paired Device: %{public}@ (version: %{public}@)", (uint8_t *)&v10, 0x20u);

  }
}

- (NRDevice)pairedDevice
{
  return self->_pairedDevice;
}

- (void)setPairedDevice:(id)a3
{
  objc_storeStrong((id *)&self->_pairedDevice, a3);
}

- (void)_registerForLocalNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_didReceiveNotification_, *MEMORY[0x1E0D517C0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_didReceiveNotification_, *MEMORY[0x1E0D517A8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_didReceiveNotification_, *MEMORY[0x1E0D517D0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_didReceiveNotification_, *MEMORY[0x1E0D517B0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_didReceiveNotification_, CFSTR("MTPairedDevicePreferencesChanged"), 0);

}

+ (MTPairedDeviceListener)sharedListener
{
  if (sharedListener_onceToken != -1)
    dispatch_once(&sharedListener_onceToken, &__block_literal_global_8);
  return (MTPairedDeviceListener *)(id)sharedListener___sharedListener;
}

+ (id)_handledNotifications
{
  if (_handledNotifications_onceToken != -1)
    dispatch_once(&_handledNotifications_onceToken, &__block_literal_global_8);
  return (id)_handledNotifications___handledNotifications;
}

void __47__MTPairedDeviceListener__handledNotifications__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0D51800];
  v6[0] = *MEMORY[0x1E0D517F8];
  v6[1] = v1;
  v2 = *MEMORY[0x1E0D517B8];
  v6[2] = *MEMORY[0x1E0D517C8];
  v6[3] = v2;
  v6[4] = *MEMORY[0x1E0D517F0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_handledNotifications___handledNotifications;
  _handledNotifications___handledNotifications = v4;

}

- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_handledNotifications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5
{
  void *v7;
  id v8;

  v8 = a5;
  -[MTPairedDeviceListener didReceiveNotificationNamed:](self, "didReceiveNotificationNamed:", a3);
  v7 = v8;
  if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
    v7 = v8;
  }

}

- (void)didReceiveNotification:(id)a3
{
  id v4;

  objc_msgSend(a3, "name");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MTPairedDeviceListener didReceiveNotificationNamed:](self, "didReceiveNotificationNamed:", v4);

}

- (void)didReceiveNotificationNamed:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  MTPairedDeviceListener *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(6);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543618;
    v7 = self;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ received %{public}@", (uint8_t *)&v6, 0x16u);
  }

  -[MTPairedDeviceListener updateActiveDeviceInfo](self, "updateActiveDeviceInfo");
  -[MTPairedDeviceListener notifyObserversWithBlock:](self, "notifyObserversWithBlock:", &__block_literal_global_12);

}

uint64_t __54__MTPairedDeviceListener_didReceiveNotificationNamed___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "activePairedDeviceDidChange");
}

- (NSString)pairedDeviceVersion
{
  NSObject *serializerQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  serializerQueue = self->_serializerQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__MTPairedDeviceListener_pairedDeviceVersion__block_invoke;
  v5[3] = &unk_1E39CBB50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serializerQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __45__MTPairedDeviceListener_pairedDeviceVersion__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "pairedDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForProperty:", *MEMORY[0x1E0D51760]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)hasActivePairedDevice
{
  return -[MTPairedDeviceListener hasActivePairedDeviceCheckSyncing:](self, "hasActivePairedDeviceCheckSyncing:", 0);
}

- (BOOL)hasActivePairedDeviceSupportingSyncing
{
  return -[MTPairedDeviceListener hasActivePairedDeviceCheckSyncing:](self, "hasActivePairedDeviceCheckSyncing:", 1);
}

- (BOOL)hasActivePairedDeviceCheckSyncing:(BOOL)a3
{
  NSObject *serializerQueue;
  char v4;
  _QWORD block[6];
  BOOL v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  serializerQueue = self->_serializerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MTPairedDeviceListener_hasActivePairedDeviceCheckSyncing___block_invoke;
  block[3] = &unk_1E39CBB78;
  block[4] = self;
  block[5] = &v8;
  v7 = a3;
  dispatch_sync(serializerQueue, block);
  v4 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __60__MTPairedDeviceListener_hasActivePairedDeviceCheckSyncing___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  const __CFString *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "pairedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    MTLogForCategory(6);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v13 = 138543362;
      v14 = v4;
      _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ no paired device detected", (uint8_t *)&v13, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  if (*(_BYTE *)(a1 + 48))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "pairedDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("C0F3C2C3-0CDE-4DF9-A95A-789AC9A0348B"));
      v7 = objc_msgSend(v5, "supportsCapability:", v6);

      if ((v7 & 1) == 0)
      {
        MTLogForCategory(6);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(_QWORD *)(a1 + 32);
          v13 = 138543362;
          v14 = v9;
          _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ paired watch version is too old for sync", (uint8_t *)&v13, 0xCu);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      }
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    MTLogForCategory(6);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = CFSTR(" with sync capability");
      if (!*(_BYTE *)(a1 + 48))
        v12 = &stru_1E39CF258;
      v13 = 138543618;
      v14 = v11;
      v15 = 2114;
      v16 = v12;
      _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_INFO, "%{public}@ has active paired watch%{public}@", (uint8_t *)&v13, 0x16u);
    }

  }
}

- (void)registerObserver:(id)a3
{
  -[MTObserverStore addObserver:](self->_observers, "addObserver:", a3);
}

- (void)notifyObserversWithBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTPairedDeviceListener observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateObserversWithBlock:", v4);

}

- (void)printDiagnostics
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "-----MTPairedDeviceListener-----", (uint8_t *)&v13, 2u);
  }

  MTLogForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[MTPairedDeviceListener pairedDevice](self, "pairedDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForProperty:", *MEMORY[0x1E0D51650]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTPairedDeviceListener pairedDevice](self, "pairedDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForProperty:", *MEMORY[0x1E0D51778]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTPairedDeviceListener pairedDevice](self, "pairedDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForProperty:", *MEMORY[0x1E0D51760]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v6;
    v15 = 2114;
    v16 = v8;
    v17 = 2114;
    v18 = v10;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "Paired Device: %{public}@ - %{public}@ - %{public}@", (uint8_t *)&v13, 0x20u);

  }
  MTLogForCategory(6);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[MTPairedDeviceListener pairedDevice](self, "pairedDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 67240192;
    LODWORD(v14) = v12 != 0;
    _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "Paired Device Active: %{public}d", (uint8_t *)&v13, 8u);

  }
}

- (OS_dispatch_queue)serializerQueue
{
  return self->_serializerQueue;
}

- (void)setSerializerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serializerQueue, a3);
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (MTObserverStore)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (BOOL)sleepEnabled
{
  return self->_sleepEnabled;
}

- (void)setSleepEnabled:(BOOL)a3
{
  self->_sleepEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedDevice, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_serializerQueue, 0);
}

@end
