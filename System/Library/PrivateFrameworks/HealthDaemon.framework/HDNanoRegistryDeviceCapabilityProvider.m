@implementation HDNanoRegistryDeviceCapabilityProvider

- (HDNanoRegistryDeviceCapabilityProvider)init
{
  return -[HDNanoRegistryDeviceCapabilityProvider initWithActivePairedDeviceProvider:](self, "initWithActivePairedDeviceProvider:", &__block_literal_global_2);
}

id __46__HDNanoRegistryDeviceCapabilityProvider_init__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D51838], "activeDeviceSelectorBlock");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "getDevicesMatching:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HDNanoRegistryDeviceCapabilityProvider)initWithActivePairedDeviceProvider:(id)a3
{
  id v4;
  HDNanoRegistryDeviceCapabilityProvider *v5;
  HDNanoRegistryDeviceCapabilityProvider *v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  HKObserverSet *observers;
  void *v13;
  id activePairedDeviceProvider;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDNanoRegistryDeviceCapabilityProvider;
  v5 = -[HDNanoRegistryDeviceCapabilityProvider init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_pairedDeviceDidChangeCapabilitiesNotificationToken = -1;
    v7 = objc_alloc(MEMORY[0x1E0CB6988]);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HKLogInfrastructure();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "initWithName:loggingCategory:", v9, v10);
    observers = v6->_observers;
    v6->_observers = (HKObserverSet *)v11;

    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_lock_isListeningForUpdates = 0;
    v13 = _Block_copy(v4);
    activePairedDeviceProvider = v6->_activePairedDeviceProvider;
    v6->_activePairedDeviceProvider = v13;

  }
  return v6;
}

void __67__HDNanoRegistryDeviceCapabilityProvider__startListeningForUpdates__block_invoke(uint64_t a1)
{
  NSObject *v1;
  id v2;
  void *v3;
  _QWORD *WeakRetained;
  __int128 buf;
  uint64_t (*v6)(uint64_t, void *);
  void *v7;
  _QWORD *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
      v2 = *(id *)((char *)&buf + 4);
      _os_log_impl(&dword_1B7802000, v1, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying delegate for a device capabilities change", (uint8_t *)&buf, 0xCu);

    }
    -[HDNanoRegistryDeviceCapabilityProvider resetCachedLastActivePairedDevice]((uint64_t)WeakRetained);
    v3 = (void *)WeakRetained[2];
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v6 = __76__HDNanoRegistryDeviceCapabilityProvider__pairedDeviceDidChangeCapabilities__block_invoke;
    v7 = &unk_1E6CE83B8;
    v8 = WeakRetained;
    objc_msgSend(v3, "notifyObservers:", &buf);
  }

}

- (void)dealloc
{
  int pairedDeviceDidChangeCapabilitiesNotificationToken;
  objc_super v4;

  pairedDeviceDidChangeCapabilitiesNotificationToken = self->_pairedDeviceDidChangeCapabilitiesNotificationToken;
  if (pairedDeviceDidChangeCapabilitiesNotificationToken != -1)
    notify_cancel(pairedDeviceDidChangeCapabilitiesNotificationToken);
  v4.receiver = self;
  v4.super_class = (Class)HDNanoRegistryDeviceCapabilityProvider;
  -[HDNanoRegistryDeviceCapabilityProvider dealloc](&v4, sel_dealloc);
}

- (void)_pairedOrActiveDevicesDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  HKObserverSet *observers;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v6;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying delegate for an active device change: %{public}@", buf, 0x16u);

  }
  -[HDNanoRegistryDeviceCapabilityProvider resetCachedLastActivePairedDevice]((uint64_t)self);
  observers = self->_observers;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__HDNanoRegistryDeviceCapabilityProvider__pairedOrActiveDevicesDidChange___block_invoke;
  v10[3] = &unk_1E6CE83B8;
  v10[4] = self;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v10);

}

- (void)resetCachedLastActivePairedDevice
{
  os_unfair_lock_s *v2;
  void *v3;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    v3 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

    os_unfair_lock_unlock(v2);
  }
}

uint64_t __74__HDNanoRegistryDeviceCapabilityProvider__pairedOrActiveDevicesDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pairedDeviceCapabilitiesDidUpdate:", *(_QWORD *)(a1 + 32));
}

uint64_t __76__HDNanoRegistryDeviceCapabilityProvider__pairedDeviceDidChangeCapabilities__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pairedDeviceCapabilitiesDidUpdate:", *(_QWORD *)(a1 + 32));
}

- (id)isCapabilitySupportedOnActivePairedDevice:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  -[HDNanoRegistryDeviceCapabilityProvider activePairedDevice](self, "activePairedDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportsCapability:", v6);

  objc_msgSend(v5, "numberWithInt:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)activePairedDevice
{
  os_unfair_lock_s *p_lock;
  NRDevice *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_lastActivePairedDevice;
  if (!v4)
  {
    (*((void (**)(void))self->_activePairedDeviceProvider + 2))();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5;
    os_unfair_lock_assert_owner(p_lock);
    if (self->_lock_isListeningForUpdates && !self->_lock_lastActivePairedDevice)
      objc_storeStrong((id *)&self->_lock_lastActivePairedDevice, v5);

  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isCapabilitySupported:(id)a3 onDevice:(id)a4
{
  return objc_msgSend(a4, "supportsCapability:", a3);
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  HKObserverSet *observers;
  _QWORD v5[5];

  observers = self->_observers;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__HDNanoRegistryDeviceCapabilityProvider_registerObserver_queue___block_invoke;
  v5[3] = &unk_1E6CE80E8;
  v5[4] = self;
  -[HKObserverSet registerObserver:queue:runIfFirstObserver:](observers, "registerObserver:queue:runIfFirstObserver:", a3, a4, v5);
}

void __65__HDNanoRegistryDeviceCapabilityProvider_registerObserver_queue___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  const char *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id location;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *MEMORY[0x1E0D517D0];
    v18[0] = *MEMORY[0x1E0D517E0];
    v18[1] = v3;
    v18[2] = *MEMORY[0x1E0D517A8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(v2, "addObserver:selector:name:object:", v1, sel__pairedOrActiveDevicesDidChange_, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), 0);
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v5);
    }

    objc_initWeak(&location, (id)v1);
    *(_DWORD *)(v1 + 8) = -1;
    v8 = (const char *)objc_msgSend((id)*MEMORY[0x1E0D517F0], "UTF8String");
    v9 = MEMORY[0x1E0C80D38];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __67__HDNanoRegistryDeviceCapabilityProvider__startListeningForUpdates__block_invoke;
    v10[3] = &unk_1E6CE8390;
    objc_copyWeak(&v11, &location);
    notify_register_dispatch(v8, (int *)(v1 + 8), MEMORY[0x1E0C80D38], v10);

    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 24));
    *(_BYTE *)(v1 + 28) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 24));
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
}

- (void)unregisterObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activePairedDeviceProvider, 0);
  objc_storeStrong((id *)&self->_lock_lastActivePairedDevice, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
