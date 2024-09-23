@implementation ACXDeviceConnection

void __45__ACXDeviceConnection_sharedDeviceConnection__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedDeviceConnection_sharedConnection;
  sharedDeviceConnection_sharedConnection = (uint64_t)v0;

}

- (void)retryPendingAppInstallationsForPairedDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", &__block_literal_global_82);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "retryPendingAppInstallationsOnDeviceWithPairingID:", v5);
}

+ (id)sharedDeviceConnection
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__ACXDeviceConnection_sharedDeviceConnection__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDeviceConnection_onceToken != -1)
    dispatch_once(&sharedDeviceConnection_onceToken, block);
  return (id)sharedDeviceConnection_sharedConnection;
}

- (id)_proxyWithErrorHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void (**v6)(_QWORD);
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  -[ACXDeviceConnection internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__ACXDeviceConnection__proxyWithErrorHandler___block_invoke;
  v9[3] = &unk_1E9883570;
  v9[4] = self;
  v11 = &v13;
  v12 = &v19;
  v6 = (void (**)(_QWORD))v4;
  v10 = v6;
  dispatch_sync(v5, v9);

  if (v14[5])
    v6[2](v6);
  v7 = (id)v20[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __67__ACXDeviceConnection_retryPendingAppInstallationsForPairedDevice___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    v3 = v2;
    MOLogWrite();
    v2 = v3;
  }

}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[ACXDeviceConnection internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__ACXDeviceConnection_addObserver___block_invoke;
  block[3] = &unk_1E98834D0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __35__ACXDeviceConnection_addObserver___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    v5 = *(void **)(a1 + 32);
    v10 = 0;
    v6 = objc_msgSend(v5, "_onQueue_createXPCConnectionIfNecessary:", &v10);
    v7 = v10;
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "enableObservers");

    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }

  }
}

- (BOOL)_onQueue_createXPCConnectionIfNecessary:(id *)a3
{
  void *v5;
  __SecTask *v6;
  __SecTask *v7;
  void *v8;
  const void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id location;

  -[ACXDeviceConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    return 1;
  v6 = SecTaskCreateFromSelf(0);
  if (v6)
  {
    v7 = v6;
    v8 = (void *)SecTaskCopyValueForEntitlement(v6, CFSTR("com.apple.companionappd.connect.allow"), 0);
    if (v8)
    {
      v9 = v8;
      v10 = ACXBooleanValue(v8, 0);
      CFRelease(v7);
      CFRelease(v9);
      if ((v10 & 1) != 0)
        goto LABEL_12;
    }
    else
    {
      CFRelease(v7);
    }
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    -[ACXDeviceConnection _onQueue_createXPCConnectionIfNecessary:].cold.1();
LABEL_12:
  if ((gTestModeEnabled & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getActivePairedDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      _CreateAndLogError((uint64_t)"-[ACXDeviceConnection _onQueue_createXPCConnectionIfNecessary:]", 130, CFSTR("ACXErrorDomain"), 54, 0, 0, CFSTR("There is no active paired watch."), v13, v32);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v29;
      if (a3)
        *a3 = objc_retainAutorelease(v29);
      -[ACXDeviceConnection observers](self, "observers");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "count");

      if (v31)
        -[ACXDeviceConnection _onQueue_beginMonitoringNanoRegistryDeviceState](self, "_onQueue_beginMonitoringNanoRegistryDeviceState");
      goto LABEL_24;
    }
    -[ACXDeviceConnection _onQueue_endMonitoringNanoRegistryDeviceState](self, "_onQueue_endMonitoringNanoRegistryDeviceState");

  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.appconduitd.device-connection"), 4096);
  -[ACXDeviceConnection setXpcConnection:](self, "setXpcConnection:", v14);

  -[ACXDeviceConnection xpcConnection](self, "xpcConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    +[ACXDeviceConnectionProtocolInterface interface](ACXDeviceConnectionProtocolInterface, "interface");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACXDeviceConnection xpcConnection](self, "xpcConnection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setRemoteObjectInterface:", v17);

    +[ACXDeviceConnectionDelegateProtocolInterface interface](ACXDeviceConnectionDelegateProtocolInterface, "interface");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACXDeviceConnection xpcConnection](self, "xpcConnection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setExportedInterface:", v19);

    -[ACXDeviceConnection xpcConnection](self, "xpcConnection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setExportedObject:", self);

    objc_initWeak(&location, self);
    v22 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __63__ACXDeviceConnection__onQueue_createXPCConnectionIfNecessary___block_invoke;
    v35[3] = &unk_1E9883520;
    objc_copyWeak(&v36, &location);
    -[ACXDeviceConnection xpcConnection](self, "xpcConnection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setInterruptionHandler:", v35);

    v33[0] = v22;
    v33[1] = 3221225472;
    v33[2] = __63__ACXDeviceConnection__onQueue_createXPCConnectionIfNecessary___block_invoke_3;
    v33[3] = &unk_1E9883520;
    objc_copyWeak(&v34, &location);
    -[ACXDeviceConnection xpcConnection](self, "xpcConnection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setInvalidationHandler:", v33);

    -[ACXDeviceConnection xpcConnection](self, "xpcConnection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "resume");

    -[ACXDeviceConnection _onQueue_enableObserversIfNeededForAValidXPCConnection](self, "_onQueue_enableObserversIfNeededForAValidXPCConnection");
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
    return 1;
  }
  _CreateAndLogError((uint64_t)"-[ACXDeviceConnection _onQueue_createXPCConnectionIfNecessary:]", 148, CFSTR("ACXErrorDomain"), 1, 0, 0, CFSTR("Failed to create NSXPCConnection for service %@"), v16, (uint64_t)CFSTR("com.apple.appconduitd.device-connection"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (a3)
  {
    v28 = objc_retainAutorelease(v27);
    *a3 = v28;
  }
LABEL_24:

  return 0;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)_onQueue_beginMonitoringNanoRegistryDeviceState
{
  NSObject *v3;
  id v4;

  -[ACXDeviceConnection internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!-[ACXDeviceConnection monitoringForDeviceChanges](self, "monitoringForDeviceChanges"))
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      MOLogWrite();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__deviceDidBecomeActiveNotification_, *MEMORY[0x1E0D517A8], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__deviceDidPairNotification_, *MEMORY[0x1E0D517C0], 0);
    -[ACXDeviceConnection setMonitoringForDeviceChanges:](self, "setMonitoringForDeviceChanges:", 1);

  }
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (BOOL)monitoringForDeviceChanges
{
  return self->_monitoringForDeviceChanges;
}

void __46__ACXDeviceConnection__proxyWithErrorHandler___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  v12 = 0;
  v3 = objc_msgSend(v2, "_onQueue_createXPCConnectionIfNecessary:", &v12);
  v4 = v12;
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", *(_QWORD *)(a1 + 40));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  else
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = v4;
    v6 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v11;
  }

}

- (void)setMonitoringForDeviceChanges:(BOOL)a3
{
  self->_monitoringForDeviceChanges = a3;
}

- (ACXDeviceConnection)init
{
  ACXDeviceConnection *v2;
  uint64_t v3;
  NSHashTable *observers;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *internalQueue;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *observerQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ACXDeviceConnection;
  v2 = -[ACXDeviceConnection init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.appconduit.DeviceConnection.internal", v5);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.appconduit.DeviceConnection.observer", v8);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v9;

  }
  return v2;
}

+ (void)enableTestMode
{
  gTestModeEnabled = 1;
}

+ (void)disableTestMode
{
  gTestModeEnabled = 0;
}

- (void)_onQueue_endMonitoringNanoRegistryDeviceState
{
  NSObject *v3;
  id v4;

  -[ACXDeviceConnection internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[ACXDeviceConnection monitoringForDeviceChanges](self, "monitoringForDeviceChanges"))
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      MOLogWrite();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0D517A8], 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0D517C0], 0);
    -[ACXDeviceConnection setMonitoringForDeviceChanges:](self, "setMonitoringForDeviceChanges:", 0);

  }
}

- (void)_deviceDidBecomeActiveNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ACXDeviceConnection *v9;

  v4 = a3;
  -[ACXDeviceConnection internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__ACXDeviceConnection__deviceDidBecomeActiveNotification___block_invoke;
  v7[3] = &unk_1E98834D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __58__ACXDeviceConnection__deviceDidBecomeActiveNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v4;

  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D51798]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  return objc_msgSend(*(id *)(a1 + 40), "_onQueue_reEstablishObserverConnectionIfNeeded");
}

- (void)_deviceDidPairNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ACXDeviceConnection *v9;

  v4 = a3;
  -[ACXDeviceConnection internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__ACXDeviceConnection__deviceDidPairNotification___block_invoke;
  v7[3] = &unk_1E98834D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __50__ACXDeviceConnection__deviceDidPairNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v4;

  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D51798]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  return objc_msgSend(*(id *)(a1 + 40), "_onQueue_reEstablishObserverConnectionIfNeeded");
}

void __63__ACXDeviceConnection__onQueue_createXPCConnectionIfNecessary___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "internalQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__ACXDeviceConnection__onQueue_createXPCConnectionIfNecessary___block_invoke_2;
    block[3] = &unk_1E98834F8;
    block[4] = v2;
    dispatch_async(v3, block);

  }
}

uint64_t __63__ACXDeviceConnection__onQueue_createXPCConnectionIfNecessary___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setObserversEnabled:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_reEstablishObserverConnectionIfNeeded");
}

void __63__ACXDeviceConnection__onQueue_createXPCConnectionIfNecessary___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_invalidateXPCConnection");
    WeakRetained = v2;
  }

}

- (BOOL)_onQueue_enableObserversIfNeededForAValidXPCConnection
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  -[ACXDeviceConnection internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  -[ACXDeviceConnection observers](self, "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!-[ACXDeviceConnection observersEnabled](self, "observersEnabled"))
  {
    -[ACXDeviceConnection xpcConnection](self, "xpcConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __77__ACXDeviceConnection__onQueue_enableObserversIfNeededForAValidXPCConnection__block_invoke;
    v10[3] = &unk_1E9883548;
    v10[4] = &v11;
    v10[5] = v5;
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enableObservers");

    if (!v12[5])
      -[ACXDeviceConnection setObserversEnabled:](self, "setObserversEnabled:", 1);
  }
  v8 = v12[5] == 0;
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __77__ACXDeviceConnection__onQueue_enableObserversIfNeededForAValidXPCConnection__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();

}

- (void)_onQueue_reEstablishObserverConnectionIfNeeded
{
  NSObject *v3;
  _BOOL4 v4;
  id v5;
  id v6;

  -[ACXDeviceConnection internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v6 = 0;
  v4 = -[ACXDeviceConnection _onQueue_createXPCConnectionIfNecessary:](self, "_onQueue_createXPCConnectionIfNecessary:", &v6);
  v5 = v6;
  if (v4)
  {
    -[ACXDeviceConnection _onQueue_enableObserversIfNeededForAValidXPCConnection](self, "_onQueue_enableObserversIfNeededForAValidXPCConnection");
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
  }

}

- (void)_invalidateXPCConnection
{
  NSObject *v3;
  _QWORD block[5];

  -[ACXDeviceConnection internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__ACXDeviceConnection__invalidateXPCConnection__block_invoke;
  block[3] = &unk_1E98834F8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __47__ACXDeviceConnection__invalidateXPCConnection__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  dispatch_source_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD handler[5];

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setXpcConnection:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setObserversEnabled:", 0);
  objc_msgSend(*(id *)(a1 + 32), "observers");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "observerReEstablishTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "internalQueue");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
      objc_msgSend(*(id *)(a1 + 32), "setObserverReEstablishTimer:", v5);

      objc_msgSend(*(id *)(a1 + 32), "observerReEstablishTimer");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = dispatch_time(0, 5000000000);
      dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

      objc_msgSend(*(id *)(a1 + 32), "observerReEstablishTimer");
      v8 = objc_claimAutoreleasedReturnValue();
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __47__ACXDeviceConnection__invalidateXPCConnection__block_invoke_2;
      handler[3] = &unk_1E98834F8;
      handler[4] = *(_QWORD *)(a1 + 32);
      dispatch_source_set_event_handler(v8, handler);

      objc_msgSend(*(id *)(a1 + 32), "observerReEstablishTimer");
      v9 = objc_claimAutoreleasedReturnValue();
      dispatch_resume(v9);

    }
  }
  else
  {

  }
}

uint64_t __47__ACXDeviceConnection__invalidateXPCConnection__block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_reEstablishObserverConnectionIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "observerReEstablishTimer");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v2);

  return objc_msgSend(*(id *)(a1 + 32), "setObserverReEstablishTimer:", 0);
}

- (id)_synchronousProxyWithErrorHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void (**v6)(_QWORD);
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  -[ACXDeviceConnection internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__ACXDeviceConnection__synchronousProxyWithErrorHandler___block_invoke;
  v9[3] = &unk_1E9883570;
  v9[4] = self;
  v11 = &v13;
  v12 = &v19;
  v6 = (void (**)(_QWORD))v4;
  v10 = v6;
  dispatch_sync(v5, v9);

  if (v14[5])
    v6[2](v6);
  v7 = (id)v20[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __57__ACXDeviceConnection__synchronousProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  v12 = 0;
  v3 = objc_msgSend(v2, "_onQueue_createXPCConnectionIfNecessary:", &v12);
  v4 = v12;
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", *(_QWORD *)(a1 + 40));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  else
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = v4;
    v6 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v11;
  }

}

- (void)updatedInstallStateForApplicationsWithInfo:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[ACXDeviceConnection internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__ACXDeviceConnection_updatedInstallStateForApplicationsWithInfo___block_invoke;
  block[3] = &unk_1E98834D0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __66__ACXDeviceConnection_updatedInstallStateForApplicationsWithInfo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id obj;
  uint64_t v19;
  _QWORD block[5];
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "observers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v28;
    v5 = MEMORY[0x1E0C80D38];
    v16 = *(_QWORD *)v28;
    do
    {
      v6 = 0;
      v17 = v3;
      do
      {
        if (*(_QWORD *)v28 != v4)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v19 = v6;
          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          v8 = *(id *)(a1 + 40);
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v24;
            do
            {
              for (i = 0; i != v10; ++i)
              {
                if (*(_QWORD *)v24 != v11)
                  objc_enumerationMutation(v8);
                v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
                objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v13, v16);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                block[0] = MEMORY[0x1E0C809B0];
                block[1] = 3221225472;
                block[2] = __66__ACXDeviceConnection_updatedInstallStateForApplicationsWithInfo___block_invoke_2;
                block[3] = &unk_1E9883598;
                block[4] = v7;
                v21 = v14;
                v22 = v13;
                v15 = v14;
                dispatch_async(v5, block);

              }
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v10);
          }

          v4 = v16;
          v3 = v17;
          v6 = v19;
        }
        ++v6;
      }
      while (v6 != v3);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v3);
  }

}

uint64_t __66__ACXDeviceConnection_updatedInstallStateForApplicationsWithInfo___block_invoke_2(uint64_t a1)
{
  objc_class *v2;
  void *v3;
  void *v5;
  __int128 v6;
  uint64_t v7;

  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    v2 = (objc_class *)objc_opt_class();
    NSStringFromClass(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v6 = *(_OWORD *)(a1 + 32);
    v5 = v3;
    MOLogWrite();

  }
  return objc_msgSend(*(id *)(a1 + 32), "updateInstallStateForApplication:installState:", *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "integerValue", v5, v6, v7));
}

- (void)updateInstallProgressForApplication:(id)a3 progress:(double)a4 phase:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  unint64_t v13;
  double v14;

  v8 = a3;
  -[ACXDeviceConnection internalQueue](self, "internalQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__ACXDeviceConnection_updateInstallProgressForApplication_progress_phase___block_invoke;
  block[3] = &unk_1E98835C0;
  v12 = v8;
  v13 = a5;
  v14 = a4;
  block[4] = self;
  v10 = v8;
  dispatch_sync(v9, block);

}

void __74__ACXDeviceConnection_updateInstallProgressForApplication_progress_phase___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    v6 = MEMORY[0x1E0C80D38];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v10[0] = MEMORY[0x1E0C809B0];
          v10[1] = 3221225472;
          v10[2] = __74__ACXDeviceConnection_updateInstallProgressForApplication_progress_phase___block_invoke_2;
          v10[3] = &unk_1E98835C0;
          v9 = *(void **)(a1 + 40);
          v12 = *(_QWORD *)(a1 + 48);
          v10[4] = v8;
          v13 = *(_QWORD *)(a1 + 56);
          v11 = v9;
          dispatch_async(v6, v10);

        }
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

uint64_t __74__ACXDeviceConnection_updateInstallProgressForApplication_progress_phase___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  objc_class *v3;
  void *v4;

  if (*(_QWORD *)(a1 + 48) >= 3uLL)
    v2 = -1;
  else
    v2 = *(_QWORD *)(a1 + 48);
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  return objc_msgSend(*(id *)(a1 + 32), "updateInstallProgressForApplication:progress:installPhase:", *(_QWORD *)(a1 + 40), v2, *(double *)(a1 + 56));
}

- (void)applicationsInstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ACXDeviceConnection internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__ACXDeviceConnection_applicationsInstalled_onDeviceWithPairingID___block_invoke;
  block[3] = &unk_1E9883598;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

void __67__ACXDeviceConnection_applicationsInstalled_onDeviceWithPairingID___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1[4], "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(a1[4], "observerQueue");
          v8 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __67__ACXDeviceConnection_applicationsInstalled_onDeviceWithPairingID___block_invoke_2;
          block[3] = &unk_1E9883598;
          block[4] = v7;
          v10 = a1[5];
          v11 = a1[6];
          dispatch_async(v8, block);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

uint64_t __67__ACXDeviceConnection_applicationsInstalled_onDeviceWithPairingID___block_invoke_2(uint64_t a1)
{
  objc_class *v2;
  void *v3;

  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    v2 = (objc_class *)objc_opt_class();
    NSStringFromClass(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "count");
    MOLogWrite();

  }
  return objc_msgSend(*(id *)(a1 + 32), "applicationsInstalled:onDeviceWithPairingID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)applicationsUpdated:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ACXDeviceConnection internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__ACXDeviceConnection_applicationsUpdated_onDeviceWithPairingID___block_invoke;
  block[3] = &unk_1E9883598;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

void __65__ACXDeviceConnection_applicationsUpdated_onDeviceWithPairingID___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1[4], "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(a1[4], "observerQueue");
          v8 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __65__ACXDeviceConnection_applicationsUpdated_onDeviceWithPairingID___block_invoke_2;
          block[3] = &unk_1E9883598;
          block[4] = v7;
          v10 = a1[5];
          v11 = a1[6];
          dispatch_async(v8, block);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

uint64_t __65__ACXDeviceConnection_applicationsUpdated_onDeviceWithPairingID___block_invoke_2(uint64_t a1)
{
  objc_class *v2;
  void *v3;

  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    v2 = (objc_class *)objc_opt_class();
    NSStringFromClass(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "count");
    MOLogWrite();

  }
  return objc_msgSend(*(id *)(a1 + 32), "applicationsUpdated:onDeviceWithPairingID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)applicationsUninstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ACXDeviceConnection internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__ACXDeviceConnection_applicationsUninstalled_onDeviceWithPairingID___block_invoke;
  block[3] = &unk_1E9883598;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

void __69__ACXDeviceConnection_applicationsUninstalled_onDeviceWithPairingID___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1[4], "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(a1[4], "observerQueue");
          v8 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __69__ACXDeviceConnection_applicationsUninstalled_onDeviceWithPairingID___block_invoke_2;
          block[3] = &unk_1E9883598;
          block[4] = v7;
          v10 = a1[5];
          v11 = a1[6];
          dispatch_async(v8, block);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

uint64_t __69__ACXDeviceConnection_applicationsUninstalled_onDeviceWithPairingID___block_invoke_2(uint64_t a1)
{
  objc_class *v2;
  void *v3;

  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    v2 = (objc_class *)objc_opt_class();
    NSStringFromClass(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "count");
    MOLogWrite();

  }
  return objc_msgSend(*(id *)(a1 + 32), "applicationsUninstalled:onDeviceWithPairingID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)applicationDatabaseResyncedForDeviceWithPairingID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[ACXDeviceConnection internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__ACXDeviceConnection_applicationDatabaseResyncedForDeviceWithPairingID___block_invoke;
  block[3] = &unk_1E98834D0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __73__ACXDeviceConnection_applicationDatabaseResyncedForDeviceWithPairingID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "observerQueue");
          v8 = objc_claimAutoreleasedReturnValue();
          v9[0] = MEMORY[0x1E0C809B0];
          v9[1] = 3221225472;
          v9[2] = __73__ACXDeviceConnection_applicationDatabaseResyncedForDeviceWithPairingID___block_invoke_2;
          v9[3] = &unk_1E98834D0;
          v9[4] = v7;
          v10 = *(id *)(a1 + 40);
          dispatch_async(v8, v9);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

uint64_t __73__ACXDeviceConnection_applicationDatabaseResyncedForDeviceWithPairingID___block_invoke_2(uint64_t a1)
{
  objc_class *v2;
  void *v3;

  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    v2 = (objc_class *)objc_opt_class();
    NSStringFromClass(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  return objc_msgSend(*(id *)(a1 + 32), "applicationDatabaseResyncedForDeviceWithPairingID:", *(_QWORD *)(a1 + 40));
}

- (void)removabilityDidChangeForApplications:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ACXDeviceConnection internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__ACXDeviceConnection_removabilityDidChangeForApplications_onDeviceWithPairingID___block_invoke;
  block[3] = &unk_1E9883598;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

void __82__ACXDeviceConnection_removabilityDidChangeForApplications_onDeviceWithPairingID___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1[4], "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(a1[4], "observerQueue");
          v8 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __82__ACXDeviceConnection_removabilityDidChangeForApplications_onDeviceWithPairingID___block_invoke_2;
          block[3] = &unk_1E9883598;
          block[4] = v7;
          v10 = a1[5];
          v11 = a1[6];
          dispatch_async(v8, block);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

uint64_t __82__ACXDeviceConnection_removabilityDidChangeForApplications_onDeviceWithPairingID___block_invoke_2(uint64_t a1)
{
  objc_class *v2;
  void *v3;

  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    v2 = (objc_class *)objc_opt_class();
    NSStringFromClass(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "count");
    MOLogWrite();

  }
  return objc_msgSend(*(id *)(a1 + 32), "removabilityDidChangeForApplications:onDeviceWithPairingID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)observerRegistrationSuccessful
{
  NSObject *v3;
  _QWORD block[5];

  -[ACXDeviceConnection internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ACXDeviceConnection_observerRegistrationSuccessful__block_invoke;
  block[3] = &unk_1E98834F8;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __53__ACXDeviceConnection_observerRegistrationSuccessful__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[5];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "observerQueue");
          v8 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __53__ACXDeviceConnection_observerRegistrationSuccessful__block_invoke_2;
          block[3] = &unk_1E98834F8;
          block[4] = v7;
          dispatch_async(v8, block);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

uint64_t __53__ACXDeviceConnection_observerRegistrationSuccessful__block_invoke_2(uint64_t a1)
{
  objc_class *v2;
  void *v4;

  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    v2 = (objc_class *)objc_opt_class();
    NSStringFromClass(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  return objc_msgSend(*(id *)(a1 + 32), "observerRegistered");
}

+ (void)performUninstallationCleanup
{
  void *v3;
  void *v4;
  id v5;

  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  ACXCopyLogDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_removeFilesAtURL:", v3);

  ACXCopyDataDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_removeFilesAtURL:", v4);

  ACXCopyStagingDirectoryPath();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_removeFilesAtURL:", v5);

}

+ (void)_removeFilesAtURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v5 = objc_msgSend(v4, "removeItemAtURL:error:", v3, &v8);
  v6 = v8;

  if ((v5 & 1) != 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
LABEL_7:
      objc_msgSend(v3, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    goto LABEL_7;
  }

}

void __35__ACXDeviceConnection_addObserver___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    v3 = v2;
    MOLogWrite();
    v2 = v3;
  }

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[ACXDeviceConnection internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__ACXDeviceConnection_removeObserver___block_invoke;
  block[3] = &unk_1E98834D0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __38__ACXDeviceConnection_removeObserver___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "observerReEstablishTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "observerReEstablishTimer");
      v6 = objc_claimAutoreleasedReturnValue();
      dispatch_source_cancel(v6);

      objc_msgSend(*(id *)(a1 + 32), "setObserverReEstablishTimer:", 0);
    }
    objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_73);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "disableObservers");

  }
}

void __38__ACXDeviceConnection_removeObserver___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    v3 = v2;
    MOLogWrite();
    v2 = v3;
  }

}

- (void)fetchInstalledApplicationsWithErrorCompletion:(id)a3
{
  -[ACXDeviceConnection fetchInstalledApplicationsForPairedDevice:completion:](self, "fetchInstalledApplicationsForPairedDevice:completion:", 0, a3);
}

- (void)fetchInstalledApplicationsForPairedDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__ACXDeviceConnection_fetchInstalledApplicationsForPairedDevice_completion___block_invoke;
  v11[3] = &unk_1E9883648;
  v12 = v6;
  v7 = v6;
  v8 = a3;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "fetchInstalledApplicationsForDeviceWithPairingID:completion:", v10, v7);
}

uint64_t __76__ACXDeviceConnection_fetchInstalledApplicationsForPairedDevice_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchInstalledComplicationsWithErrorCompletion:(id)a3
{
  -[ACXDeviceConnection fetchInstalledComplicationsForPairedDevice:completion:](self, "fetchInstalledComplicationsForPairedDevice:completion:", 0, a3);
}

- (void)fetchInstalledComplicationsForPairedDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__ACXDeviceConnection_fetchInstalledComplicationsForPairedDevice_completion___block_invoke;
  v11[3] = &unk_1E9883648;
  v12 = v6;
  v7 = v6;
  v8 = a3;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "fetchInstalledComplicationsForDeviceWithPairingID:completion:", v10, v7);
}

uint64_t __77__ACXDeviceConnection_fetchInstalledComplicationsForPairedDevice_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)activeComplicationsWithErrorCompletion:(id)a3
{
  -[ACXDeviceConnection activeComplicationsForPairedDevice:completion:](self, "activeComplicationsForPairedDevice:completion:", 0, a3);
}

- (void)activeComplicationsForPairedDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__ACXDeviceConnection_activeComplicationsForPairedDevice_completion___block_invoke;
  v11[3] = &unk_1E9883648;
  v12 = v6;
  v7 = v6;
  v8 = a3;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "activeComplicationsForDeviceWithPairingID:completion:", v10, v7);
}

uint64_t __69__ACXDeviceConnection_activeComplicationsForPairedDevice_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchInstalledCompatibleApplicationsWithDevice:(id)a3 withErrorCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90__ACXDeviceConnection_fetchInstalledCompatibleApplicationsWithDevice_withErrorCompletion___block_invoke;
  v11[3] = &unk_1E9883648;
  v12 = v6;
  v7 = v6;
  v8 = a3;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "fetchInstalledCompatibleApplicationsForDeviceWithPairingID:completion:", v10, v7);
}

uint64_t __90__ACXDeviceConnection_fetchInstalledCompatibleApplicationsWithDevice_withErrorCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchApplicationWithContainingApplicationBundleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__ACXDeviceConnection_fetchApplicationWithContainingApplicationBundleID_completion___block_invoke;
  v10[3] = &unk_1E9883648;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchApplicationWithContainingApplicationBundleID:completion:", v8, v7);

}

uint64_t __84__ACXDeviceConnection_fetchApplicationWithContainingApplicationBundleID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchInfoForApplicationWithBundleID:(id)a3 completion:(id)a4
{
  -[ACXDeviceConnection fetchInfoForApplicationWithBundleID:forPairedDevice:completion:](self, "fetchInfoForApplicationWithBundleID:forPairedDevice:completion:", a3, 0, a4);
}

- (void)fetchInfoForApplicationWithBundleID:(id)a3 forPairedDevice:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __86__ACXDeviceConnection_fetchInfoForApplicationWithBundleID_forPairedDevice_completion___block_invoke;
  v14[3] = &unk_1E9883648;
  v15 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "fetchInfoForApplicationWithBundleID:forDeviceWithPairingID:completion:", v11, v13, v9);
}

uint64_t __86__ACXDeviceConnection_fetchInfoForApplicationWithBundleID_forPairedDevice_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchWatchAppBundleURLWithinCompanionAppWithWatchAppIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __97__ACXDeviceConnection_fetchWatchAppBundleURLWithinCompanionAppWithWatchAppIdentifier_completion___block_invoke;
  v10[3] = &unk_1E9883648;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchWatchAppBundleURLWithinCompanionAppWithWatchAppIdentifier:completion:", v8, v7);

}

uint64_t __97__ACXDeviceConnection_fetchWatchAppBundleURLWithinCompanionAppWithWatchAppIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)watchAppBundleURLWithinCompanionAppWithWatchAppIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v7 = MEMORY[0x1E0C809B0];
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __87__ACXDeviceConnection_watchAppBundleURLWithinCompanionAppWithWatchAppIdentifier_error___block_invoke;
  v13[3] = &unk_1E9883670;
  v13[4] = &v14;
  -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __87__ACXDeviceConnection_watchAppBundleURLWithinCompanionAppWithWatchAppIdentifier_error___block_invoke_2;
  v12[3] = &unk_1E9883698;
  v12[4] = &v14;
  v12[5] = &v20;
  objc_msgSend(v8, "fetchWatchAppBundleURLWithinCompanionAppWithWatchAppIdentifier:completion:", v6, v12);

  v9 = (void *)v21[5];
  if (a4 && !v9)
  {
    *a4 = objc_retainAutorelease((id)v15[5]);
    v9 = (void *)v21[5];
  }
  v10 = v9;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __87__ACXDeviceConnection_watchAppBundleURLWithinCompanionAppWithWatchAppIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __87__ACXDeviceConnection_watchAppBundleURLWithinCompanionAppWithWatchAppIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

- (void)fetchWatchAppBundleIDForCompanionAppBundleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__ACXDeviceConnection_fetchWatchAppBundleIDForCompanionAppBundleID_completion___block_invoke;
  v10[3] = &unk_1E9883648;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchWatchAppBundleIDForCompanionAppBundleID:completion:", v8, v7);

}

uint64_t __79__ACXDeviceConnection_fetchWatchAppBundleIDForCompanionAppBundleID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)watchAppBundleIDForCompanionAppBundleID:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v7 = MEMORY[0x1E0C809B0];
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__ACXDeviceConnection_watchAppBundleIDForCompanionAppBundleID_error___block_invoke;
  v13[3] = &unk_1E9883670;
  v13[4] = &v14;
  -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __69__ACXDeviceConnection_watchAppBundleIDForCompanionAppBundleID_error___block_invoke_2;
  v12[3] = &unk_1E98836C0;
  v12[4] = &v14;
  v12[5] = &v20;
  objc_msgSend(v8, "fetchWatchAppBundleIDForCompanionAppBundleID:completion:", v6, v12);

  v9 = (void *)v21[5];
  if (a4 && !v9)
  {
    *a4 = objc_retainAutorelease((id)v15[5]);
    v9 = (void *)v21[5];
  }
  v10 = v9;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __69__ACXDeviceConnection_watchAppBundleIDForCompanionAppBundleID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __69__ACXDeviceConnection_watchAppBundleIDForCompanionAppBundleID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

- (void)installAllApplications
{
  id v2;

  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", &__block_literal_global_80);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installAllApplications");

}

void __45__ACXDeviceConnection_installAllApplications__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    v3 = v2;
    MOLogWrite();
    v2 = v3;
  }

}

- (void)cancelPendingInstallations
{
  id v2;

  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", &__block_literal_global_81);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelPendingInstallations");

}

void __49__ACXDeviceConnection_cancelPendingInstallations__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    v3 = v2;
    MOLogWrite();
    v2 = v3;
  }

}

- (void)installApplication:(id)a3 completionWithError:(id)a4
{
  -[ACXDeviceConnection installApplication:onPairedDevice:completion:](self, "installApplication:onPairedDevice:completion:", a3, 0, a4);
}

- (void)installApplication:(id)a3 onPairedDevice:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__ACXDeviceConnection_installApplication_onPairedDevice_completion___block_invoke;
  v14[3] = &unk_1E9883648;
  v15 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "installApplication:withProvisioningProfileInfo:forTestFlight:onDeviceWithPairingID:completion:", v11, 0, 0, v13, v9);
}

void __68__ACXDeviceConnection_installApplication_onPairedDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (BOOL)installApplication:(id)a3 onPairedDevice:(id)a4 installationStatus:(int64_t *)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t *v15;
  void *v16;
  BOOL v17;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v10 = a3;
  v11 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v12 = MEMORY[0x1E0C809B0];
  v26 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __82__ACXDeviceConnection_installApplication_onPairedDevice_installationStatus_error___block_invoke;
  v20[3] = &unk_1E9883670;
  v20[4] = &v21;
  -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __82__ACXDeviceConnection_installApplication_onPairedDevice_installationStatus_error___block_invoke_2;
  v19[3] = &unk_1E9883748;
  v19[4] = &v21;
  v19[5] = &v27;
  objc_msgSend(v13, "installApplication:withProvisioningProfileInfo:forTestFlight:onDeviceWithPairingID:completion:", v10, 0, 0, v14, v19);

  v15 = v22;
  v16 = (void *)v22[5];
  if (v16)
  {
    if (a6)
    {
      *a6 = objc_retainAutorelease(v16);
      v15 = v22;
    }
  }
  else if (a5)
  {
    *a5 = v28[3];
  }
  v17 = v15[5] == 0;
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v17;
}

void __82__ACXDeviceConnection_installApplication_onPairedDevice_installationStatus_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __82__ACXDeviceConnection_installApplication_onPairedDevice_installationStatus_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (void)installApplication:(id)a3 withProvisioningProfiles:(id)a4 completionWithError:(id)a5
{
  -[ACXDeviceConnection installApplication:withProvisioningProfiles:onPairedDevice:completion:](self, "installApplication:withProvisioningProfiles:onPairedDevice:completion:", a3, a4, 0, a5);
}

- (id)_validateAndExtractProfiles:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  id v23;
  id obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    v17 = (id)objc_opt_new();
    v10 = 0;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((ACXArrayContainsOnlyClass(v5) & 1) == 0)
  {
    _CreateAndLogError((uint64_t)"-[ACXDeviceConnection _validateAndExtractProfiles:error:]", 693, CFSTR("ACXErrorDomain"), 20, 0, 0, CFSTR("Profiles array did not contain only NSURL objects"), v6, v22);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v17 = 0;
LABEL_14:
    v7 = 0;
    if (!a4)
      goto LABEL_22;
    goto LABEL_20;
  }
  v7 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v23 = v5;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v27;
    while (2)
    {
      v12 = 0;
      v13 = v10;
      do
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
        objc_msgSend(v14, "lastPathComponent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v13;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v14, 3, &v25);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v25;

        if (!v16)
        {
          objc_msgSend(v14, "path");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          _CreateAndLogError((uint64_t)"-[ACXDeviceConnection _validateAndExtractProfiles:error:]", 702, CFSTR("ACXErrorDomain"), 21, v10, 0, CFSTR("Failed to read profile at %@ : %@"), v19, (uint64_t)v18);
          v20 = objc_claimAutoreleasedReturnValue();

          v17 = 0;
          v10 = (id)v20;
          goto LABEL_19;
        }
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v15);

        ++v12;
        v13 = v10;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0;
  }

  v17 = v7;
  v7 = v17;
LABEL_19:
  v5 = v23;
  if (a4)
  {
LABEL_20:
    if (!v17)
      *a4 = objc_retainAutorelease(v10);
  }
LABEL_22:

  return v17;
}

- (void)installApplication:(id)a3 withProvisioningProfiles:(id)a4 onPairedDevice:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v23 = 0;
  -[ACXDeviceConnection _validateAndExtractProfiles:error:](self, "_validateAndExtractProfiles:error:", a4, &v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  if (v13)
  {
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __93__ACXDeviceConnection_installApplication_withProvisioningProfiles_onPairedDevice_completion___block_invoke;
    v21 = &unk_1E9883648;
    v15 = v12;
    v22 = v15;
    -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", &v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForProperty:", *MEMORY[0x1E0D51730], v18, v19, v20, v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "installApplication:withProvisioningProfileInfo:forTestFlight:onDeviceWithPairingID:completion:", v10, v13, 1, v17, v15);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v12 + 2))(v12, 0, v14);
  }

}

void __93__ACXDeviceConnection_installApplication_withProvisioningProfiles_onPairedDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (BOOL)installApplication:(id)a3 withProvisioningProfiles:(id)a4 onPairedDevice:(id)a5 installationStatus:(int64_t *)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t *v19;
  void *v20;
  BOOL v21;
  _QWORD v23[6];
  _QWORD v24[5];
  id obj;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  obj = 0;
  -[ACXDeviceConnection _validateAndExtractProfiles:error:](self, "_validateAndExtractProfiles:error:", v13, &obj);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v31, obj);
  if (v15)
  {
    v16 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __107__ACXDeviceConnection_installApplication_withProvisioningProfiles_onPairedDevice_installationStatus_error___block_invoke;
    v24[3] = &unk_1E9883670;
    v24[4] = &v26;
    -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "valueForProperty:", *MEMORY[0x1E0D51730]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __107__ACXDeviceConnection_installApplication_withProvisioningProfiles_onPairedDevice_installationStatus_error___block_invoke_2;
    v23[3] = &unk_1E9883748;
    v23[4] = &v26;
    v23[5] = &v32;
    objc_msgSend(v17, "installApplication:withProvisioningProfileInfo:forTestFlight:onDeviceWithPairingID:completion:", v12, v15, 1, v18, v23);

  }
  v19 = v27;
  v20 = (void *)v27[5];
  if (v20)
  {
    if (a7)
    {
      *a7 = objc_retainAutorelease(v20);
      v19 = v27;
    }
  }
  else if (a6)
  {
    *a6 = v33[3];
  }
  v21 = v19[5] == 0;
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v21;
}

void __107__ACXDeviceConnection_installApplication_withProvisioningProfiles_onPairedDevice_installationStatus_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __107__ACXDeviceConnection_installApplication_withProvisioningProfiles_onPairedDevice_installationStatus_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  id v10;

  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(_QWORD *)(v7 + 40);
  v8 = (id *)(v7 + 40);
  if (v9)
  {
    v10 = v6;
    objc_storeStrong(v8, a3);
    v6 = v10;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (void)installApplicationAtURL:(id)a3 onPairedDevice:(id)a4 installOptions:(id)a5 size:(int64_t)a6 completion:(id)a7
{
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v12 = *MEMORY[0x1E0D51730];
  v13 = a7;
  v14 = a5;
  v15 = a3;
  objc_msgSend(a4, "valueForProperty:", v12);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[ACXDeviceConnection installApplicationAtURL:onDeviceWithPairingID:installOptions:size:completion:](self, "installApplicationAtURL:onDeviceWithPairingID:installOptions:size:completion:", v15, v16, v14, a6, v13);

}

- (void)installApplicationAtURL:(id)a3 onDeviceWithPairingID:(id)a4 installOptions:(id)a5 size:(int64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v12 = a7;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __100__ACXDeviceConnection_installApplicationAtURL_onDeviceWithPairingID_installOptions_size_completion___block_invoke;
  v18[3] = &unk_1E9883648;
  v19 = v12;
  v13 = v12;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "installApplicationAtURL:onDeviceWithPairingID:installOptions:size:completion:", v16, v15, v14, a6, v13);

}

void __100__ACXDeviceConnection_installApplicationAtURL_onDeviceWithPairingID_installOptions_size_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (BOOL)installApplicationAtURL:(id)a3 onPairedDevice:(id)a4 installOptions:(id)a5 size:(int64_t)a6 installationStatus:(int64_t *)a7 error:(id *)a8
{
  uint64_t v14;
  id v15;
  id v16;
  void *v17;

  v14 = *MEMORY[0x1E0D51730];
  v15 = a5;
  v16 = a3;
  objc_msgSend(a4, "valueForProperty:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a8) = -[ACXDeviceConnection installApplicationAtURL:onDeviceWithPairingID:installOptions:size:installationStatus:error:](self, "installApplicationAtURL:onDeviceWithPairingID:installOptions:size:installationStatus:error:", v16, v17, v15, a6, a7, a8);

  return (char)a8;
}

- (BOOL)installApplicationAtURL:(id)a3 onDeviceWithPairingID:(id)a4 installOptions:(id)a5 size:(int64_t)a6 installationStatus:(int64_t *)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t *v19;
  void *v20;
  BOOL v21;
  _QWORD v23[6];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v17 = MEMORY[0x1E0C809B0];
  v30 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __114__ACXDeviceConnection_installApplicationAtURL_onDeviceWithPairingID_installOptions_size_installationStatus_error___block_invoke;
  v24[3] = &unk_1E9883670;
  v24[4] = &v25;
  -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  v23[1] = 3221225472;
  v23[2] = __114__ACXDeviceConnection_installApplicationAtURL_onDeviceWithPairingID_installOptions_size_installationStatus_error___block_invoke_2;
  v23[3] = &unk_1E9883748;
  v23[4] = &v25;
  v23[5] = &v31;
  objc_msgSend(v18, "installApplicationAtURL:onDeviceWithPairingID:installOptions:size:completion:", v14, v15, v16, a6, v23);

  v19 = v26;
  v20 = (void *)v26[5];
  if (v20)
  {
    if (a8)
    {
      *a8 = objc_retainAutorelease(v20);
      v19 = v26;
    }
  }
  else if (a7)
  {
    *a7 = v32[3];
  }
  v21 = v19[5] == 0;
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v21;
}

void __114__ACXDeviceConnection_installApplicationAtURL_onDeviceWithPairingID_installOptions_size_installationStatus_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __114__ACXDeviceConnection_installApplicationAtURL_onDeviceWithPairingID_installOptions_size_installationStatus_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (void)removeApplication:(id)a3 completion:(id)a4
{
  -[ACXDeviceConnection removeApplication:fromPairedDevice:completion:](self, "removeApplication:fromPairedDevice:completion:", a3, 0, a4);
}

- (void)removeApplication:(id)a3 fromPairedDevice:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__ACXDeviceConnection_removeApplication_fromPairedDevice_completion___block_invoke;
  v10[3] = &unk_1E9883770;
  v11 = v8;
  v9 = v8;
  -[ACXDeviceConnection removeApplication:fromPairedDevice:completionWithError:](self, "removeApplication:fromPairedDevice:completionWithError:", a3, a4, v10);

}

uint64_t __69__ACXDeviceConnection_removeApplication_fromPairedDevice_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeApplication:(id)a3 fromPairedDevice:(id)a4 completionWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__ACXDeviceConnection_removeApplication_fromPairedDevice_completionWithError___block_invoke;
  v14[3] = &unk_1E9883648;
  v15 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "removeApplication:fromDeviceWithPairingID:completion:", v11, v13, v9);
}

void __78__ACXDeviceConnection_removeApplication_fromPairedDevice_completionWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (BOOL)removeApplication:(id)a3 fromPairedDevice:(id)a4 removalStatus:(int64_t *)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t *v15;
  void *v16;
  BOOL v17;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v10 = a3;
  v11 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v12 = MEMORY[0x1E0C809B0];
  v26 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __78__ACXDeviceConnection_removeApplication_fromPairedDevice_removalStatus_error___block_invoke;
  v20[3] = &unk_1E9883670;
  v20[4] = &v21;
  -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __78__ACXDeviceConnection_removeApplication_fromPairedDevice_removalStatus_error___block_invoke_2;
  v19[3] = &unk_1E9883748;
  v19[4] = &v21;
  v19[5] = &v27;
  objc_msgSend(v13, "removeApplication:fromDeviceWithPairingID:completion:", v10, v14, v19);

  v15 = v22;
  v16 = (void *)v22[5];
  if (v16)
  {
    if (a6)
    {
      *a6 = objc_retainAutorelease(v16);
      v15 = v22;
    }
  }
  else if (a5)
  {
    *a5 = v28[3];
  }
  v17 = v15[5] == 0;
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v17;
}

void __78__ACXDeviceConnection_removeApplication_fromPairedDevice_removalStatus_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __78__ACXDeviceConnection_removeApplication_fromPairedDevice_removalStatus_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (void)setAlwaysInstall:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getActivePairedDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ACXDeviceConnection setAlwaysInstall:forDevice:](self, "setAlwaysInstall:forDevice:", v6, v5);
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
  }

}

- (void)setAlwaysInstall:(id)a3 forDevice:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  id v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;

  v16 = a3;
  v5 = (objc_class *)MEMORY[0x1E0D51610];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithDomain:pairedDevice:", CFSTR("com.apple.appconduitd.gizmostate"), v6);
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      objc_msgSend(v8, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v16, "BOOLValue");
      v11 = CFSTR("NO");
      if (v10)
        v11 = CFSTR("YES");
      v13 = v9;
      v14 = v11;
      MOLogWrite();

    }
    objc_msgSend(v7, "setObject:forKey:", v16, CFSTR("AlwaysInstall"), v13, v14);
    v12 = (id)objc_msgSend(v7, "synchronize");
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    objc_msgSend(v8, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
}

- (void)getAlwaysInstallWithCompletion:(id)a3
{
  -[ACXDeviceConnection getAlwaysInstallForPairedDevice:completion:](self, "getAlwaysInstallForPairedDevice:completion:", 0, a3);
}

- (void)setAllExistingAppsShouldBeInstalled:(BOOL)a3 forNewDevice:(id)a4
{
  _BOOL8 v4;
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = (objc_class *)MEMORY[0x1E0D51610];
  v6 = a4;
  v12 = (id)objc_msgSend([v5 alloc], "initWithDomain:pairedDevice:", CFSTR("com.apple.appconduitd.gizmostate"), v6);
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      objc_msgSend(v7, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (int)ACXYOrN(v4);
      MOLogWrite();

    }
    objc_msgSend(v12, "setBool:forKey:", v4, CFSTR("InitiallyInstallAllExistingApps"), v9, v10);
    v8 = (id)objc_msgSend(v12, "synchronize");
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    ACXYOrN(v4);
    objc_msgSend(v7, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
}

- (void)getAlwaysInstallForPairedDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__ACXDeviceConnection_getAlwaysInstallForPairedDevice_completion___block_invoke;
  v11[3] = &unk_1E9883648;
  v12 = v6;
  v7 = v6;
  v8 = a3;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "getAlwaysInstallForDeviceWithPairingID:completion:", v10, v7);
}

void __66__ACXDeviceConnection_getAlwaysInstallForPairedDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (BOOL)getAlwaysInstall:(BOOL *)a3 forPairedDevice:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t *v12;
  void *v13;
  BOOL v14;
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v8 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v9 = MEMORY[0x1E0C809B0];
  v23 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __62__ACXDeviceConnection_getAlwaysInstall_forPairedDevice_error___block_invoke;
  v17[3] = &unk_1E9883670;
  v17[4] = &v18;
  -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __62__ACXDeviceConnection_getAlwaysInstall_forPairedDevice_error___block_invoke_2;
  v16[3] = &unk_1E9883798;
  v16[4] = &v24;
  objc_msgSend(v10, "getAlwaysInstallForDeviceWithPairingID:completion:", v11, v16);

  v12 = v19;
  v13 = (void *)v19[5];
  if (v13)
  {
    if (a5)
    {
      *a5 = objc_retainAutorelease(v13);
      v12 = v19;
    }
  }
  else if (a3)
  {
    *a3 = *((_BYTE *)v25 + 24);
  }
  v14 = v12[5] == 0;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

void __62__ACXDeviceConnection_getAlwaysInstall_forPairedDevice_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __62__ACXDeviceConnection_getAlwaysInstall_forPairedDevice_error___block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)installProvisioningProfileWithURL:(id)a3 completion:(id)a4
{
  -[ACXDeviceConnection installProvisioningProfileWithURL:onPairedDevice:completion:](self, "installProvisioningProfileWithURL:onPairedDevice:completion:", a3, 0, a4);
}

- (void)installProvisioningProfileWithURL:(id)a3 onPairedDevice:(id)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;

  v8 = a4;
  v10 = a5;
  if (a3)
  {
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 3, &v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v22;
    if (v11)
    {
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __83__ACXDeviceConnection_installProvisioningProfileWithURL_onPairedDevice_completion___block_invoke;
      v20 = &unk_1E9883648;
      v13 = v10;
      v21 = v13;
      -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", &v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "valueForProperty:", *MEMORY[0x1E0D51730], v17, v18, v19, v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "installProvisioningProfileWithData:onDeviceWithPairingID:completion:", v11, v15, v13);

    }
    else
    {
      (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v12);
    }

  }
  else
  {
    _CreateAndLogError((uint64_t)"-[ACXDeviceConnection installProvisioningProfileWithURL:onPairedDevice:completion:]", 942, CFSTR("ACXErrorDomain"), 20, 0, 0, CFSTR("profileURL parameter was nil"), v9, v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v16);

  }
}

void __83__ACXDeviceConnection_installProvisioningProfileWithURL_onPairedDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (BOOL)installProvisioningProfileWithURL:(id)a3 onPairedDevice:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  BOOL v17;
  uint64_t v19[6];
  _QWORD v20[5];
  id obj;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = a3;
  v10 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  if (!v8)
  {
    _CreateAndLogError((uint64_t)"-[ACXDeviceConnection installProvisioningProfileWithURL:onPairedDevice:error:]", 965, CFSTR("ACXErrorDomain"), 20, 0, 0, CFSTR("profileURL parameter was nil"), v9, v19[0]);
    v15 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v27[5];
    v27[5] = v15;
    goto LABEL_5;
  }
  obj = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v8, 3, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v31, obj);
  if (v11)
  {
    v12 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __78__ACXDeviceConnection_installProvisioningProfileWithURL_onPairedDevice_error___block_invoke;
    v20[3] = &unk_1E9883670;
    v20[4] = &v26;
    -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForProperty:", *MEMORY[0x1E0D51730]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = (uint64_t)__78__ACXDeviceConnection_installProvisioningProfileWithURL_onPairedDevice_error___block_invoke_2;
    v19[3] = (uint64_t)&unk_1E98837C0;
    v19[4] = (uint64_t)&v26;
    v19[5] = (uint64_t)&v22;
    objc_msgSend(v13, "installProvisioningProfileWithData:onDeviceWithPairingID:completion:", v11, v14, v19);

LABEL_5:
  }
  v16 = *((unsigned __int8 *)v23 + 24);
  if (a5 && !*((_BYTE *)v23 + 24))
  {
    *a5 = objc_retainAutorelease((id)v27[5]);
    v16 = *((unsigned __int8 *)v23 + 24);
  }
  v17 = v16 != 0;
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v17;
}

void __78__ACXDeviceConnection_installProvisioningProfileWithURL_onPairedDevice_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __78__ACXDeviceConnection_installProvisioningProfileWithURL_onPairedDevice_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (void)removeProvisioningProfileWithID:(id)a3 completion:(id)a4
{
  -[ACXDeviceConnection removeProvisioningProfileWithID:fromPairedDevice:completion:](self, "removeProvisioningProfileWithID:fromPairedDevice:completion:", a3, 0, a4);
}

- (void)removeProvisioningProfileWithID:(id)a3 fromPairedDevice:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
  if (v8)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __83__ACXDeviceConnection_removeProvisioningProfileWithID_fromPairedDevice_completion___block_invoke;
    v18[3] = &unk_1E9883648;
    v13 = v10;
    v19 = v13;
    -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForProperty:", *MEMORY[0x1E0D51730]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeProvisioningProfileWithID:fromDeviceWithPairingID:completion:", v8, v15, v13);

  }
  else
  {
    _CreateAndLogError((uint64_t)"-[ACXDeviceConnection removeProvisioningProfileWithID:fromPairedDevice:completion:]", 1001, CFSTR("ACXErrorDomain"), 20, 0, 0, CFSTR("profileID parameter was nil"), v11, v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v12)[2](v12, 0, v16);

  }
}

void __83__ACXDeviceConnection_removeProvisioningProfileWithID_fromPairedDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (BOOL)removeProvisioningProfileWithID:(id)a3 fromPairedDevice:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  BOOL v16;
  uint64_t v18;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v8 = a3;
  v10 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  if (v8)
  {
    v11 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __78__ACXDeviceConnection_removeProvisioningProfileWithID_fromPairedDevice_error___block_invoke;
    v20[3] = &unk_1E9883670;
    v20[4] = &v25;
    -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForProperty:", *MEMORY[0x1E0D51730]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __78__ACXDeviceConnection_removeProvisioningProfileWithID_fromPairedDevice_error___block_invoke_2;
    v19[3] = &unk_1E98837C0;
    v19[4] = &v25;
    v19[5] = &v21;
    objc_msgSend(v12, "removeProvisioningProfileWithID:fromDeviceWithPairingID:completion:", v8, v13, v19);

  }
  else
  {
    _CreateAndLogError((uint64_t)"-[ACXDeviceConnection removeProvisioningProfileWithID:fromPairedDevice:error:]", 1017, CFSTR("ACXErrorDomain"), 20, 0, 0, CFSTR("profileID parameter was nil"), v9, v18);
    v14 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v26[5];
    v26[5] = v14;
  }

  v15 = *((unsigned __int8 *)v22 + 24);
  if (a5 && !*((_BYTE *)v22 + 24))
  {
    *a5 = objc_retainAutorelease((id)v26[5]);
    v15 = *((unsigned __int8 *)v22 + 24);
  }
  v16 = v15 != 0;
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v16;
}

void __78__ACXDeviceConnection_removeProvisioningProfileWithID_fromPairedDevice_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __78__ACXDeviceConnection_removeProvisioningProfileWithID_fromPairedDevice_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (void)fetchProvisioningProfilesWithCompletion:(id)a3
{
  -[ACXDeviceConnection fetchProvisioningProfilesForPairedDevice:completion:](self, "fetchProvisioningProfilesForPairedDevice:completion:", 0, a3);
}

- (void)fetchProvisioningProfilesForPairedDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__ACXDeviceConnection_fetchProvisioningProfilesForPairedDevice_completion___block_invoke;
  v11[3] = &unk_1E9883648;
  v12 = v6;
  v7 = v6;
  v8 = a3;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "fetchProvisioningProfilesForDeviceWithPairingID:completion:", v10, v7);
}

void __75__ACXDeviceConnection_fetchProvisioningProfilesForPairedDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (id)provisioningProfilesForPairedDevice:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v7 = MEMORY[0x1E0C809B0];
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__ACXDeviceConnection_provisioningProfilesForPairedDevice_error___block_invoke;
  v14[3] = &unk_1E9883670;
  v14[4] = &v21;
  -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __65__ACXDeviceConnection_provisioningProfilesForPairedDevice_error___block_invoke_2;
  v13[3] = &unk_1E98837E8;
  v13[4] = &v21;
  v13[5] = &v15;
  objc_msgSend(v8, "fetchProvisioningProfilesForDeviceWithPairingID:completion:", v9, v13);

  v10 = (void *)v16[5];
  if (a4 && !v10)
  {
    *a4 = objc_retainAutorelease((id)v22[5]);
    v10 = (void *)v16[5];
  }
  v11 = v10;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __65__ACXDeviceConnection_provisioningProfilesForPairedDevice_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __65__ACXDeviceConnection_provisioningProfilesForPairedDevice_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

- (void)fetchProvisioningProfilesForApplicationWithBundleID:(id)a3 completion:(id)a4
{
  -[ACXDeviceConnection fetchProvisioningProfilesForApplicationWithBundleID:forPairedDevice:completion:](self, "fetchProvisioningProfilesForApplicationWithBundleID:forPairedDevice:completion:", a3, 0, a4);
}

- (void)fetchProvisioningProfilesForApplicationWithBundleID:(id)a3 forPairedDevice:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __102__ACXDeviceConnection_fetchProvisioningProfilesForApplicationWithBundleID_forPairedDevice_completion___block_invoke;
  v14[3] = &unk_1E9883648;
  v15 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "fetchProvisioningProfilesForApplicationWithBundleID:forDeviceWithPairingID:completion:", v11, v13, v9);
}

void __102__ACXDeviceConnection_fetchProvisioningProfilesForApplicationWithBundleID_forPairedDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (id)provisioningProfilesForApplicationWithBundleID:(id)a3 forPairedDevice:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v10 = MEMORY[0x1E0C809B0];
  v23 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __92__ACXDeviceConnection_provisioningProfilesForApplicationWithBundleID_forPairedDevice_error___block_invoke;
  v17[3] = &unk_1E9883670;
  v17[4] = &v24;
  -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __92__ACXDeviceConnection_provisioningProfilesForApplicationWithBundleID_forPairedDevice_error___block_invoke_2;
  v16[3] = &unk_1E98837E8;
  v16[4] = &v24;
  v16[5] = &v18;
  objc_msgSend(v11, "fetchProvisioningProfilesForApplicationWithBundleID:forDeviceWithPairingID:completion:", v8, v12, v16);

  v13 = (void *)v19[5];
  if (a5 && !v13)
  {
    *a5 = objc_retainAutorelease((id)v25[5]);
    v13 = (void *)v19[5];
  }
  v14 = v13;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

void __92__ACXDeviceConnection_provisioningProfilesForApplicationWithBundleID_forPairedDevice_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __92__ACXDeviceConnection_provisioningProfilesForApplicationWithBundleID_forPairedDevice_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

- (void)updatePreferencesForApplicationWithIdentifier:(id)a3 preferences:(id)a4 completion:(id)a5
{
  -[ACXDeviceConnection updatePreferencesForApplicationWithIdentifier:preferences:forPairedDevice:completion:](self, "updatePreferencesForApplicationWithIdentifier:preferences:forPairedDevice:completion:", a3, a4, 0, a5);
}

- (void)updatePreferencesForApplicationWithIdentifier:(id)a3 preferences:(id)a4 forPairedDevice:(id)a5 completion:(id)a6
{
  -[ACXDeviceConnection updatePreferencesForApplicationWithIdentifier:preferences:writingToPreferencesLocation:forPairedDevice:options:completion:](self, "updatePreferencesForApplicationWithIdentifier:preferences:writingToPreferencesLocation:forPairedDevice:options:completion:", a3, a4, 0, a5, 0, a6);
}

- (void)updatePreferencesForApplicationWithIdentifier:(id)a3 preferences:(id)a4 writingToPreferencesLocation:(unint64_t)a5 forPairedDevice:(id)a6 options:(unint64_t)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v14 = a8;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __145__ACXDeviceConnection_updatePreferencesForApplicationWithIdentifier_preferences_writingToPreferencesLocation_forPairedDevice_options_completion___block_invoke;
  v21[3] = &unk_1E9883648;
  v22 = v14;
  v15 = v14;
  v16 = a6;
  v17 = a4;
  v18 = a3;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "updatePreferencesForApplicationWithIdentifier:preferences:writingToPreferencesLocation:forDeviceWithPairingID:options:completion:", v18, v17, a5, v20, a7, v15);
}

void __145__ACXDeviceConnection_updatePreferencesForApplicationWithIdentifier_preferences_writingToPreferencesLocation_forPairedDevice_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (BOOL)updatePreferencesForApplicationWithIdentifier:(id)a3 preferences:(id)a4 writingToPreferencesLocation:(unint64_t)a5 forPairedDevice:(id)a6 options:(unint64_t)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  BOOL v20;
  _QWORD v22[5];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v17 = MEMORY[0x1E0C809B0];
  v29 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __140__ACXDeviceConnection_updatePreferencesForApplicationWithIdentifier_preferences_writingToPreferencesLocation_forPairedDevice_options_error___block_invoke;
  v23[3] = &unk_1E9883670;
  v23[4] = &v24;
  -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __140__ACXDeviceConnection_updatePreferencesForApplicationWithIdentifier_preferences_writingToPreferencesLocation_forPairedDevice_options_error___block_invoke_2;
  v22[3] = &unk_1E9883670;
  v22[4] = &v24;
  objc_msgSend(v18, "updatePreferencesForApplicationWithIdentifier:preferences:writingToPreferencesLocation:forDeviceWithPairingID:options:completion:", v14, v15, a5, v19, a7, v22);

  if (a8)
    *a8 = objc_retainAutorelease((id)v25[5]);
  v20 = v25[5] == 0;
  _Block_object_dispose(&v24, 8);

  return v20;
}

void __140__ACXDeviceConnection_updatePreferencesForApplicationWithIdentifier_preferences_writingToPreferencesLocation_forPairedDevice_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __140__ACXDeviceConnection_updatePreferencesForApplicationWithIdentifier_preferences_writingToPreferencesLocation_forPairedDevice_options_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

- (void)setUpdatePendingForCompanionApp:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__ACXDeviceConnection_setUpdatePendingForCompanionApp_completion___block_invoke;
  v10[3] = &unk_1E9883648;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUpdatePendingForCompanionApp:completion:", v8, v7);

}

void __66__ACXDeviceConnection_setUpdatePendingForCompanionApp_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (BOOL)setUpdatePendingForCompanionApp:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v7 = MEMORY[0x1E0C809B0];
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__ACXDeviceConnection_setUpdatePendingForCompanionApp_error___block_invoke;
  v12[3] = &unk_1E9883670;
  v12[4] = &v13;
  -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __61__ACXDeviceConnection_setUpdatePendingForCompanionApp_error___block_invoke_2;
  v11[3] = &unk_1E9883670;
  v11[4] = &v13;
  objc_msgSend(v8, "setUpdatePendingForCompanionApp:completion:", v6, v11);

  if (a4)
    *a4 = objc_retainAutorelease((id)v14[5]);
  v9 = v14[5] == 0;
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __61__ACXDeviceConnection_setUpdatePendingForCompanionApp_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __61__ACXDeviceConnection_setUpdatePendingForCompanionApp_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

- (void)cancelUpdatePendingForCompanionApp:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__ACXDeviceConnection_cancelUpdatePendingForCompanionApp_completion___block_invoke;
  v10[3] = &unk_1E9883648;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cancelUpdatePendingForCompanionApp:completion:", v8, v7);

}

void __69__ACXDeviceConnection_cancelUpdatePendingForCompanionApp_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (BOOL)cancelUpdatePendingForCompanionApp:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v7 = MEMORY[0x1E0C809B0];
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__ACXDeviceConnection_cancelUpdatePendingForCompanionApp_error___block_invoke;
  v12[3] = &unk_1E9883670;
  v12[4] = &v13;
  -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __64__ACXDeviceConnection_cancelUpdatePendingForCompanionApp_error___block_invoke_2;
  v11[3] = &unk_1E9883670;
  v11[4] = &v13;
  objc_msgSend(v8, "cancelUpdatePendingForCompanionApp:completion:", v6, v11);

  if (a4)
    *a4 = objc_retainAutorelease((id)v14[5]);
  v9 = v14[5] == 0;
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __64__ACXDeviceConnection_cancelUpdatePendingForCompanionApp_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __64__ACXDeviceConnection_cancelUpdatePendingForCompanionApp_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

- (void)getApplicationWithBundleID:(id)a3 willInstallAfterPairingOnDevice:(id)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = *MEMORY[0x1E0D51730];
  v10 = a3;
  objc_msgSend(a4, "valueForProperty:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __93__ACXDeviceConnection_getApplicationWithBundleID_willInstallAfterPairingOnDevice_completion___block_invoke;
  v14[3] = &unk_1E9883648;
  v15 = v8;
  v12 = v8;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "applicationWillInstallAfterPairingOnDeviceWithPairingID:withBundleID:completion:", v11, v10, v12);

}

void __93__ACXDeviceConnection_getApplicationWithBundleID_willInstallAfterPairingOnDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (BOOL)getApplicationWithBundleID:(id)a3 willInstallAfterPairing:(BOOL *)a4 onDevice:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v10 = a3;
  v11 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  objc_msgSend(v11, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __89__ACXDeviceConnection_getApplicationWithBundleID_willInstallAfterPairing_onDevice_error___block_invoke;
  v18[3] = &unk_1E9883670;
  v18[4] = &v23;
  -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __89__ACXDeviceConnection_getApplicationWithBundleID_willInstallAfterPairing_onDevice_error___block_invoke_2;
  v17[3] = &unk_1E98837C0;
  v17[4] = &v23;
  v17[5] = &v19;
  objc_msgSend(v14, "applicationWillInstallAfterPairingOnDeviceWithPairingID:withBundleID:completion:", v12, v10, v17);

  v15 = (void *)v24[5];
  if (v15)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v15);
  }
  else if (a4)
  {
    *a4 = *((_BYTE *)v20 + 24);
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v15 == 0;
}

void __89__ACXDeviceConnection_getApplicationWithBundleID_willInstallAfterPairing_onDevice_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __89__ACXDeviceConnection_getApplicationWithBundleID_willInstallAfterPairing_onDevice_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (void)enumerateInstalledApplicationsOnPairedDevice:(id)a3 withBlock:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;

  v6 = *MEMORY[0x1E0D51730];
  v7 = a4;
  objc_msgSend(a3, "valueForProperty:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ACXDeviceConnection enumerateInstalledApplicationsOnDeviceWithPairingID:withBlock:](self, "enumerateInstalledApplicationsOnDeviceWithPairingID:withBlock:", v8, v7);

}

- (void)enumerateInstalledApplicationsOnDeviceWithPairingID:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  ACXDeviceConnection *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke;
  v17[3] = &unk_1E9883648;
  v9 = v7;
  v18 = v9;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke_2;
  v13[3] = &unk_1E9883888;
  v15 = self;
  v16 = v9;
  v14 = v6;
  v11 = v6;
  v12 = v9;
  objc_msgSend(v10, "fetchInstalledWatchAppBundleIDsForDeviceWithPairingID:completion:", v11, v13);

}

void __85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

void __85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  qos_class_t v11;
  NSObject *v12;
  int8x16_t v13;
  _QWORD v14[4];
  id v15;
  int8x16_t v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  id *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
  }
  else
  {
    if (objc_msgSend(v5, "count"))
    {
      v7 = (void *)objc_msgSend(v5, "mutableCopy");
      v19 = 0;
      v20 = (id *)&v19;
      v21 = 0x3042000000;
      v22 = __Block_byref_object_copy__116;
      v23 = __Block_byref_object_dispose__117;
      v24 = 0;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke_118;
      v14[3] = &unk_1E9883860;
      v18 = &v19;
      v17 = *(id *)(a1 + 48);
      v8 = v7;
      v15 = v8;
      v13 = *(int8x16_t *)(a1 + 32);
      v9 = (id)v13.i64[0];
      v16 = vextq_s8(v13, v13, 8uLL);
      v10 = (void *)objc_msgSend(v14, "copy");
      objc_storeWeak(v20 + 5, v10);
      v11 = qos_class_self();
      dispatch_get_global_queue(v11, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v12, v10);

      _Block_object_dispose(&v19, 8);
      objc_destroyWeak(&v24);

      goto LABEL_8;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      MOLogWrite();
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));
LABEL_8:

}

void __85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke_118(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  qos_class_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  qos_class_t v14;
  NSObject *v15;
  id v16;
  uint64_t v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD block[4];
  id v26;
  id v27;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "lastObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "removeLastObject");
      v6 = *(void **)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = (uint64_t)__85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke_4;
      v17[3] = (uint64_t)&unk_1E9883838;
      v5 = v5;
      v18 = v5;
      v20 = *(id *)(a1 + 56);
      v19 = *(id *)(a1 + 32);
      v21 = WeakRetained;
      objc_msgSend(v6, "fetchApplicationOnDeviceWithPairingID:withBundleID:completion:", v7, v5, v17);

      v8 = v18;
    }
    else
    {
      _CreateAndLogError((uint64_t)"-[ACXDeviceConnection enumerateInstalledApplicationsOnDeviceWithPairingID:withBlock:]_block_invoke", 1286, CFSTR("ACXErrorDomain"), 1, 0, 0, CFSTR("Failed to get next bundle ID while enumerating remote apps"), v4, v17[0]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = qos_class_self();
      dispatch_get_global_queue(v14, 0);
      v15 = objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke_3;
      v22[3] = &unk_1E9883360;
      v16 = *(id *)(a1 + 56);
      v23 = v13;
      v24 = v16;
      v8 = v13;
      dispatch_async(v15, v22);

    }
  }
  else
  {
    _CreateAndLogError((uint64_t)"-[ACXDeviceConnection enumerateInstalledApplicationsOnDeviceWithPairingID:withBlock:]_block_invoke", 1277, CFSTR("ACXErrorDomain"), 1, 0, 0, CFSTR("Async enumeration block reference somehow became nil while enumerating remote apps"), v2, v17[0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = qos_class_self();
    dispatch_get_global_queue(v10, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke_2_121;
    block[3] = &unk_1E9883360;
    v12 = *(id *)(a1 + 56);
    v26 = v9;
    v27 = v12;
    v5 = v9;
    dispatch_async(v11, block);

    v8 = v27;
  }

}

uint64_t __85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke_2_121(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke_4(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  qos_class_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = qos_class_self();
  dispatch_get_global_queue(v7, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke_5;
  v11[3] = &unk_1E9883810;
  v12 = v6;
  v13 = a1[4];
  v16 = a1[6];
  v14 = v5;
  v15 = a1[5];
  v17 = a1[7];
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, v11);

}

void __85__ACXDeviceConnection_enumerateInstalledApplicationsOnDeviceWithPairingID_withBlock___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  qos_class_t v5;
  void (*v6)(void);
  uint64_t v7;
  NSObject *v8;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "domain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("ACXErrorDomain")))
    {

      goto LABEL_12;
    }
    v4 = objc_msgSend(*(id *)(a1 + 32), "code");

    if (v4 != 19)
    {
LABEL_12:
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        MOLogWrite();
      v6 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_24:
      v6();
      return;
    }
LABEL_9:
    if (objc_msgSend(*(id *)(a1 + 56), "count", v7))
    {
      v5 = qos_class_self();
      dispatch_get_global_queue(v5, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v8, *(dispatch_block_t *)(a1 + 72));

      return;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    goto LABEL_24;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    v7 = *(_QWORD *)(a1 + 40);
    MOLogWrite();
  }
  if ((*(unsigned int (**)(_QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64)))
    goto LABEL_9;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    MOLogWrite();
}

- (void)enumerateLocallyAvailableApplicationsForPairedDevice:(id)a3 options:(unint64_t)a4 withBlock:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;

  v8 = *MEMORY[0x1E0D51730];
  v9 = a5;
  objc_msgSend(a3, "valueForProperty:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[ACXDeviceConnection enumerateLocallyAvailableApplicationsForDeviceWithPairingID:options:withBlock:](self, "enumerateLocallyAvailableApplicationsForDeviceWithPairingID:options:withBlock:", v10, a4, v9);

}

- (void)enumerateLocallyAvailableApplicationsForDeviceWithPairingID:(id)a3 options:(unint64_t)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  unint64_t v18;
  _QWORD v19[4];
  id v20;

  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke;
  v19[3] = &unk_1E9883648;
  v11 = v9;
  v20 = v11;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke_2;
  v15[3] = &unk_1E9883928;
  v15[4] = self;
  v16 = v8;
  v17 = v11;
  v18 = a4;
  v13 = v8;
  v14 = v11;
  objc_msgSend(v12, "fetchLocallyAvailableWatchAppBundleIDsWithCompletion:", v15);

}

void __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

void __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  qos_class_t v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  id *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
  }
  else
  {
    if (objc_msgSend(v5, "count"))
    {
      v7 = (void *)objc_msgSend(v5, "mutableCopy");
      v23 = 0;
      v24 = (id *)&v23;
      v25 = 0x3042000000;
      v26 = __Block_byref_object_copy__116;
      v27 = __Block_byref_object_dispose__117;
      v28 = 0;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke_3;
      v16[3] = &unk_1E9883900;
      v21 = &v23;
      v20 = *(id *)(a1 + 48);
      v8 = v7;
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(a1 + 40);
      v17 = v8;
      v18 = v9;
      v11 = v10;
      v12 = *(_QWORD *)(a1 + 56);
      v19 = v11;
      v22 = v12;
      v13 = (void *)objc_msgSend(v16, "copy");
      objc_storeWeak(v24 + 5, v13);
      v14 = qos_class_self();
      dispatch_get_global_queue(v14, 0);
      v15 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v15, v13);

      _Block_object_dispose(&v23, 8);
      objc_destroyWeak(&v28);

      goto LABEL_8;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      MOLogWrite();
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));
LABEL_8:

}

void __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  qos_class_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  qos_class_t v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "lastObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "removeLastObject");
      v6 = *(void **)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v8 = *(_QWORD *)(a1 + 72);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke_6;
      v19[3] = &unk_1E98838D8;
      v24 = v8;
      v5 = v5;
      v20 = v5;
      v22 = *(id *)(a1 + 56);
      v21 = *(id *)(a1 + 32);
      v23 = WeakRetained;
      objc_msgSend(v6, "_fetchLocallyAvailableApplicationWithBundleID:forDeviceWithPairingID:options:completion:", v5, v7, v8, v19);

      v9 = v20;
    }
    else
    {
      _CreateAndLogError((uint64_t)"-[ACXDeviceConnection enumerateLocallyAvailableApplicationsForDeviceWithPairingID:options:withBlock:]_block_invoke_3", 1373, CFSTR("ACXErrorDomain"), 1, 0, 0, CFSTR("Failed to get next bundle ID while enumerating local apps"), v4, v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = qos_class_self();
      dispatch_get_global_queue(v15, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke_5;
      v25[3] = &unk_1E9883360;
      v17 = *(id *)(a1 + 56);
      v26 = v14;
      v27 = v17;
      v9 = v14;
      dispatch_async(v16, v25);

    }
  }
  else
  {
    _CreateAndLogError((uint64_t)"-[ACXDeviceConnection enumerateLocallyAvailableApplicationsForDeviceWithPairingID:options:withBlock:]_block_invoke_3", 1364, CFSTR("ACXErrorDomain"), 1, 0, 0, CFSTR("Async enumeration block reference somehow became nil while enumerating local apps"), v2, v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = qos_class_self();
    dispatch_get_global_queue(v11, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke_4;
    block[3] = &unk_1E9883360;
    v13 = *(id *)(a1 + 56);
    v29 = v10;
    v30 = v13;
    v5 = v10;
    dispatch_async(v12, block);

    v9 = v30;
  }

}

uint64_t __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  qos_class_t v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  v7 = qos_class_self();
  dispatch_get_global_queue(v7, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke_7;
  block[3] = &unk_1E98838B0;
  v9 = *(_QWORD *)(a1 + 64);
  v13 = v6;
  v19 = v9;
  v14 = *(id *)(a1 + 32);
  v17 = *(id *)(a1 + 48);
  v15 = v5;
  v16 = *(id *)(a1 + 40);
  v18 = *(id *)(a1 + 56);
  v10 = v5;
  v11 = v6;
  dispatch_async(v8, block);

}

void __101__ACXDeviceConnection_enumerateLocallyAvailableApplicationsForDeviceWithPairingID_options_withBlock___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  qos_class_t v8;
  void (*v9)(void);
  uint64_t v10;
  NSObject *v11;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if ((*(_BYTE *)(a1 + 80) & 1) != 0)
    {
      objc_msgSend(v2, "domain");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("ACXErrorDomain"))
        && objc_msgSend(*(id *)(a1 + 32), "code") == 37)
      {

LABEL_22:
        objc_msgSend(*(id *)(a1 + 48), "isSystemApp");
LABEL_23:
        if (objc_msgSend(*(id *)(a1 + 56), "count", v10))
        {
          v8 = qos_class_self();
          dispatch_get_global_queue(v8, 0);
          v11 = objc_claimAutoreleasedReturnValue();
          dispatch_async(v11, *(dispatch_block_t *)(a1 + 72));

          return;
        }
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          MOLogWrite();
        v9 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
        goto LABEL_34;
      }
      objc_msgSend(*(id *)(a1 + 32), "domain");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ACXErrorDomain")) & 1) != 0)
      {
        v5 = objc_msgSend(*(id *)(a1 + 32), "code");

        if (v5 == 38)
          goto LABEL_22;
      }
      else
      {

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("ACXErrorDomain")))
    {
      v7 = objc_msgSend(*(id *)(a1 + 32), "code");

      if (v7 == 19)
        goto LABEL_22;
    }
    else
    {

    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_34:
    v9();
    return;
  }
  if ((objc_msgSend(*(id *)(a1 + 48), "isSystemApp") & 1) != 0)
    goto LABEL_23;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    v10 = *(_QWORD *)(a1 + 40);
    MOLogWrite();
  }
  if ((*(unsigned int (**)(_QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64)))
    goto LABEL_23;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    MOLogWrite();
}

- (void)fetchApplicationOnDeviceWithPairingID:(id)a3 withBundleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85__ACXDeviceConnection_fetchApplicationOnDeviceWithPairingID_withBundleID_completion___block_invoke;
  v13[3] = &unk_1E9883648;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchInstalledWatchAppWithBundleID:forDeviceWithPairingID:completion:", v10, v11, v9);

}

void __85__ACXDeviceConnection_fetchApplicationOnDeviceWithPairingID_withBundleID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (id)applicationOnDeviceWithPairingID:(id)a3 withBundleID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v10 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75__ACXDeviceConnection_applicationOnDeviceWithPairingID_withBundleID_error___block_invoke;
  v16[3] = &unk_1E9883670;
  v16[4] = &v23;
  -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __75__ACXDeviceConnection_applicationOnDeviceWithPairingID_withBundleID_error___block_invoke_2;
  v15[3] = &unk_1E9883950;
  v15[4] = &v23;
  v15[5] = &v17;
  objc_msgSend(v11, "fetchInstalledWatchAppWithBundleID:forDeviceWithPairingID:completion:", v9, v8, v15);

  v12 = (void *)v18[5];
  if (a5 && !v12)
  {
    *a5 = objc_retainAutorelease((id)v24[5]);
    v12 = (void *)v18[5];
  }
  v13 = v12;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v13;
}

void __75__ACXDeviceConnection_applicationOnDeviceWithPairingID_withBundleID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __75__ACXDeviceConnection_applicationOnDeviceWithPairingID_withBundleID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

- (void)fetchApplicationOnPairedDevice:(id)a3 withBundleID:(id)a4 completion:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  v8 = *MEMORY[0x1E0D51730];
  v9 = a5;
  v10 = a4;
  objc_msgSend(a3, "valueForProperty:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[ACXDeviceConnection fetchApplicationOnDeviceWithPairingID:withBundleID:completion:](self, "fetchApplicationOnDeviceWithPairingID:withBundleID:completion:", v11, v10, v9);

}

- (id)applicationOnPairedDevice:(id)a3 withBundleID:(id)a4 error:(id *)a5
{
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;

  v8 = *MEMORY[0x1E0D51730];
  v9 = a4;
  objc_msgSend(a3, "valueForProperty:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACXDeviceConnection applicationOnDeviceWithPairingID:withBundleID:error:](self, "applicationOnDeviceWithPairingID:withBundleID:error:", v10, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_fetchLocallyAvailableApplicationWithBundleID:(id)a3 forDeviceWithPairingID:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v10 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __111__ACXDeviceConnection__fetchLocallyAvailableApplicationWithBundleID_forDeviceWithPairingID_options_completion___block_invoke;
  v15[3] = &unk_1E9883648;
  v16 = v10;
  v11 = v10;
  v12 = a4;
  v13 = a3;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fetchLocallyAvailableWatchAppWithBundleID:forDeviceWithPairingID:options:completion:", v13, v12, a5, v11);

}

void __111__ACXDeviceConnection__fetchLocallyAvailableApplicationWithBundleID_forDeviceWithPairingID_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (void)fetchLocallyAvailableApplicationWithBundleID:(id)a3 forDeviceWithPairingID:(id)a4 completion:(id)a5
{
  -[ACXDeviceConnection _fetchLocallyAvailableApplicationWithBundleID:forDeviceWithPairingID:options:completion:](self, "_fetchLocallyAvailableApplicationWithBundleID:forDeviceWithPairingID:options:completion:", a3, a4, 0, a5);
}

- (void)fetchLocallyAvailableApplicationWithBundleID:(id)a3 forPairedDevice:(id)a4 completion:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  v8 = *MEMORY[0x1E0D51730];
  v9 = a5;
  v10 = a3;
  objc_msgSend(a4, "valueForProperty:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[ACXDeviceConnection _fetchLocallyAvailableApplicationWithBundleID:forDeviceWithPairingID:options:completion:](self, "_fetchLocallyAvailableApplicationWithBundleID:forDeviceWithPairingID:options:completion:", v10, v11, 0, v9);

}

- (id)_locallyAvailableApplicationWithBundleID:(id)a3 forDeviceWithPairingID:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v10 = a3;
  v11 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v12 = MEMORY[0x1E0C809B0];
  v24 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __101__ACXDeviceConnection__locallyAvailableApplicationWithBundleID_forDeviceWithPairingID_options_error___block_invoke;
  v18[3] = &unk_1E9883670;
  v18[4] = &v25;
  -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __101__ACXDeviceConnection__locallyAvailableApplicationWithBundleID_forDeviceWithPairingID_options_error___block_invoke_2;
  v17[3] = &unk_1E9883978;
  v17[4] = &v25;
  v17[5] = &v19;
  objc_msgSend(v13, "fetchLocallyAvailableWatchAppWithBundleID:forDeviceWithPairingID:options:completion:", v10, v11, a5, v17);

  v14 = (void *)v20[5];
  if (a6 && !v14)
  {
    *a6 = objc_retainAutorelease((id)v26[5]);
    v14 = (void *)v20[5];
  }
  v15 = v14;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void __101__ACXDeviceConnection__locallyAvailableApplicationWithBundleID_forDeviceWithPairingID_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __101__ACXDeviceConnection__locallyAvailableApplicationWithBundleID_forDeviceWithPairingID_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

- (id)locallyAvailableApplicationWithBundleID:(id)a3 forDeviceWithPairingID:(id)a4 error:(id *)a5
{
  return -[ACXDeviceConnection _locallyAvailableApplicationWithBundleID:forDeviceWithPairingID:options:error:](self, "_locallyAvailableApplicationWithBundleID:forDeviceWithPairingID:options:error:", a3, a4, 0, a5);
}

- (id)locallyAvailableApplicationWithBundleID:(id)a3 forPairedDevice:(id)a4 error:(id *)a5
{
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;

  v8 = *MEMORY[0x1E0D51730];
  v9 = a3;
  objc_msgSend(a4, "valueForProperty:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACXDeviceConnection _locallyAvailableApplicationWithBundleID:forDeviceWithPairingID:options:error:](self, "_locallyAvailableApplicationWithBundleID:forDeviceWithPairingID:options:error:", v9, v10, 0, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)locallyAvailableApplicationWithContainingApplicationBundleID:(id)a3 forPairedDevice:(id)a4 error:(id *)a5
{
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;

  v8 = *MEMORY[0x1E0D51730];
  v9 = a3;
  objc_msgSend(a4, "valueForProperty:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACXDeviceConnection locallyAvailableApplicationWithContainingApplicationBundleID:forDeviceWithPairingID:error:](self, "locallyAvailableApplicationWithContainingApplicationBundleID:forDeviceWithPairingID:error:", v9, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)fetchLocallyAvailableApplicationWithContainingApplicationBundleID:(id)a3 forPairedDevice:(id)a4 completion:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  v8 = *MEMORY[0x1E0D51730];
  v9 = a5;
  v10 = a3;
  objc_msgSend(a4, "valueForProperty:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[ACXDeviceConnection fetchLocallyAvailableApplicationWithContainingApplicationBundleID:forDeviceWithPairingID:completion:](self, "fetchLocallyAvailableApplicationWithContainingApplicationBundleID:forDeviceWithPairingID:completion:", v10, v11, v9);

}

- (void)fetchLocallyAvailableApplicationWithContainingApplicationBundleID:(id)a3 forDeviceWithPairingID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __123__ACXDeviceConnection_fetchLocallyAvailableApplicationWithContainingApplicationBundleID_forDeviceWithPairingID_completion___block_invoke;
  v13[3] = &unk_1E9883648;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchLocallyAvailableApplicationWithContainingApplicationBundleID:forDeviceWithPairingID:completion:", v11, v10, v9);

}

void __123__ACXDeviceConnection_fetchLocallyAvailableApplicationWithContainingApplicationBundleID_forDeviceWithPairingID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (id)locallyAvailableApplicationWithContainingApplicationBundleID:(id)a3 forDeviceWithPairingID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v10 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __113__ACXDeviceConnection_locallyAvailableApplicationWithContainingApplicationBundleID_forDeviceWithPairingID_error___block_invoke;
  v16[3] = &unk_1E9883670;
  v16[4] = &v23;
  -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __113__ACXDeviceConnection_locallyAvailableApplicationWithContainingApplicationBundleID_forDeviceWithPairingID_error___block_invoke_2;
  v15[3] = &unk_1E9883978;
  v15[4] = &v23;
  v15[5] = &v17;
  objc_msgSend(v11, "fetchLocallyAvailableApplicationWithContainingApplicationBundleID:forDeviceWithPairingID:completion:", v8, v9, v15);

  v12 = (void *)v18[5];
  if (a5 && !v12)
  {
    *a5 = objc_retainAutorelease((id)v24[5]);
    v12 = (void *)v18[5];
  }
  v13 = v12;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v13;
}

void __113__ACXDeviceConnection_locallyAvailableApplicationWithContainingApplicationBundleID_forDeviceWithPairingID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __113__ACXDeviceConnection_locallyAvailableApplicationWithContainingApplicationBundleID_forDeviceWithPairingID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

- (void)applicationIsInstalledOnPairedDevice:(id)a3 withBundleID:(id)a4 completion:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  v8 = *MEMORY[0x1E0D51730];
  v9 = a5;
  v10 = a4;
  objc_msgSend(a3, "valueForProperty:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[ACXDeviceConnection applicationIsInstalledOnDeviceWithPairingID:withBundleID:completion:](self, "applicationIsInstalledOnDeviceWithPairingID:withBundleID:completion:", v11, v10, v9);

}

- (BOOL)getApplicationIsInstalled:(BOOL *)a3 withBundleID:(id)a4 onPairedDevice:(id)a5 error:(id *)a6
{
  uint64_t v10;
  id v11;
  void *v12;

  v10 = *MEMORY[0x1E0D51730];
  v11 = a4;
  objc_msgSend(a5, "valueForProperty:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = -[ACXDeviceConnection getApplicationIsInstalled:withBundleID:onDeviceWithPairingID:error:](self, "getApplicationIsInstalled:withBundleID:onDeviceWithPairingID:error:", a3, v11, v12, a6);

  return (char)a6;
}

- (BOOL)getApplicationIsInstalled:(BOOL *)a3 withBundleID:(id)a4 onDeviceWithPairingID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t *v14;
  void *v15;
  BOOL v16;
  _QWORD v18[6];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v10 = a4;
  v11 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v12 = MEMORY[0x1E0C809B0];
  v23 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __90__ACXDeviceConnection_getApplicationIsInstalled_withBundleID_onDeviceWithPairingID_error___block_invoke;
  v19[3] = &unk_1E9883670;
  v19[4] = &v24;
  -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __90__ACXDeviceConnection_getApplicationIsInstalled_withBundleID_onDeviceWithPairingID_error___block_invoke_2;
  v18[3] = &unk_1E98837C0;
  v18[4] = &v24;
  v18[5] = &v20;
  objc_msgSend(v13, "applicationIsInstalledOnDeviceWithPairingID:withBundleID:completion:", v11, v10, v18);

  v14 = v25;
  v15 = (void *)v25[5];
  if (v15)
  {
    if (a6)
    {
      *a6 = objc_retainAutorelease(v15);
      v14 = v25;
    }
  }
  else if (a3)
  {
    *a3 = *((_BYTE *)v21 + 24);
  }
  v16 = v14[5] == 0;
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v16;
}

void __90__ACXDeviceConnection_getApplicationIsInstalled_withBundleID_onDeviceWithPairingID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __90__ACXDeviceConnection_getApplicationIsInstalled_withBundleID_onDeviceWithPairingID_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (void)applicationIsInstalledOnDeviceWithPairingID:(id)a3 withBundleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__ACXDeviceConnection_applicationIsInstalledOnDeviceWithPairingID_withBundleID_completion___block_invoke;
  v13[3] = &unk_1E9883648;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applicationIsInstalledOnDeviceWithPairingID:withBundleID:completion:", v11, v10, v9);

}

void __91__ACXDeviceConnection_applicationIsInstalledOnDeviceWithPairingID_withBundleID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (void)applicationIsInstalledOnPairedDevice:(id)a3 withCompanionBundleID:(id)a4 completion:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  v8 = *MEMORY[0x1E0D51730];
  v9 = a5;
  v10 = a4;
  objc_msgSend(a3, "valueForProperty:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[ACXDeviceConnection applicationIsInstalledOnDeviceWithPairingID:withCompanionBundleID:completion:](self, "applicationIsInstalledOnDeviceWithPairingID:withCompanionBundleID:completion:", v11, v10, v9);

}

- (BOOL)getApplicationIsInstalled:(BOOL *)a3 onPairedDevice:(id)a4 withCompanionBundleID:(id)a5 error:(id *)a6
{
  uint64_t v10;
  id v11;
  void *v12;

  v10 = *MEMORY[0x1E0D51730];
  v11 = a5;
  objc_msgSend(a4, "valueForProperty:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = -[ACXDeviceConnection getApplicationIsInstalled:onDeviceWithPairingID:withCompanionBundleID:error:](self, "getApplicationIsInstalled:onDeviceWithPairingID:withCompanionBundleID:error:", a3, v12, v11, a6);

  return (char)a6;
}

- (void)applicationIsInstalledOnDeviceWithPairingID:(id)a3 withCompanionBundleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __100__ACXDeviceConnection_applicationIsInstalledOnDeviceWithPairingID_withCompanionBundleID_completion___block_invoke;
  v13[3] = &unk_1E9883648;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applicationIsInstalledOnDeviceWithPairingID:withCompanionBundleID:completion:", v11, v10, v9);

}

void __100__ACXDeviceConnection_applicationIsInstalledOnDeviceWithPairingID_withCompanionBundleID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (BOOL)getApplicationIsInstalled:(BOOL *)a3 onDeviceWithPairingID:(id)a4 withCompanionBundleID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t *v14;
  void *v15;
  BOOL v16;
  _QWORD v18[6];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v10 = a4;
  v11 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v12 = MEMORY[0x1E0C809B0];
  v25 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __99__ACXDeviceConnection_getApplicationIsInstalled_onDeviceWithPairingID_withCompanionBundleID_error___block_invoke;
  v19[3] = &unk_1E9883670;
  v19[4] = &v20;
  -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __99__ACXDeviceConnection_getApplicationIsInstalled_onDeviceWithPairingID_withCompanionBundleID_error___block_invoke_2;
  v18[3] = &unk_1E98837C0;
  v18[4] = &v20;
  v18[5] = &v26;
  objc_msgSend(v13, "applicationIsInstalledOnDeviceWithPairingID:withCompanionBundleID:completion:", v10, v11, v18);

  v14 = v21;
  v15 = (void *)v21[5];
  if (v15)
  {
    if (a6)
    {
      *a6 = objc_retainAutorelease(v15);
      v14 = v21;
    }
  }
  else if (a3)
  {
    *a3 = *((_BYTE *)v27 + 24);
  }
  v16 = v14[5] == 0;
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v16;
}

void __99__ACXDeviceConnection_getApplicationIsInstalled_onDeviceWithPairingID_withCompanionBundleID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __99__ACXDeviceConnection_getApplicationIsInstalled_onDeviceWithPairingID_withCompanionBundleID_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (void)applicationIsInstalledOnAnyPairedDeviceWithBundleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__ACXDeviceConnection_applicationIsInstalledOnAnyPairedDeviceWithBundleID_completion___block_invoke;
  v10[3] = &unk_1E9883648;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applicationIsInstalledOnAnyPairedDeviceWithBundleID:completion:", v8, v7);

}

void __86__ACXDeviceConnection_applicationIsInstalledOnAnyPairedDeviceWithBundleID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (BOOL)getApplicationIsInstalled:(BOOL *)a3 onAnyPairedDeviceWithBundleID:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t *v11;
  void *v12;
  BOOL v13;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v8 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v9 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__ACXDeviceConnection_getApplicationIsInstalled_onAnyPairedDeviceWithBundleID_error___block_invoke;
  v16[3] = &unk_1E9883670;
  v16[4] = &v17;
  -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __85__ACXDeviceConnection_getApplicationIsInstalled_onAnyPairedDeviceWithBundleID_error___block_invoke_2;
  v15[3] = &unk_1E98837C0;
  v15[4] = &v17;
  v15[5] = &v23;
  objc_msgSend(v10, "applicationIsInstalledOnAnyPairedDeviceWithBundleID:completion:", v8, v15);

  v11 = v18;
  v12 = (void *)v18[5];
  if (v12)
  {
    if (a5)
    {
      *a5 = objc_retainAutorelease(v12);
      v11 = v18;
    }
  }
  else if (a3)
  {
    *a3 = *((_BYTE *)v24 + 24);
  }
  v13 = v11[5] == 0;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v13;
}

void __85__ACXDeviceConnection_getApplicationIsInstalled_onAnyPairedDeviceWithBundleID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __85__ACXDeviceConnection_getApplicationIsInstalled_onAnyPairedDeviceWithBundleID_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (BOOL)_companionAppWithoutCounterparts:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t v9;

  v3 = (objc_class *)MEMORY[0x1E0CA5870];
  v4 = a3;
  v9 = 0;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v4, 1, &v9);

  if (v5)
  {
    objc_msgSend(v5, "counterpartIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") == 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)applicationIsInstalledOnAnyPairedDeviceWithCompanionBundleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  if (-[ACXDeviceConnection _companionAppWithoutCounterparts:](self, "_companionAppWithoutCounterparts:", v6))
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __95__ACXDeviceConnection_applicationIsInstalledOnAnyPairedDeviceWithCompanionBundleID_completion___block_invoke;
    v10[3] = &unk_1E9883648;
    v8 = v7;
    v11 = v8;
    -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "applicationIsInstalledOnAnyPairedDeviceWithCompanionBundleID:completion:", v6, v8);

  }
}

void __95__ACXDeviceConnection_applicationIsInstalledOnAnyPairedDeviceWithCompanionBundleID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (BOOL)getApplicationIsInstalled:(BOOL *)a3 onAnyPairedDeviceWithCompanionBundleID:(id)a4 error:(id *)a5
{
  id v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  uint64_t *v12;
  void *v13;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v8 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  if (-[ACXDeviceConnection _companionAppWithoutCounterparts:](self, "_companionAppWithoutCounterparts:", v8))
  {
    v9 = 0;
  }
  else
  {
    v10 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __94__ACXDeviceConnection_getApplicationIsInstalled_onAnyPairedDeviceWithCompanionBundleID_error___block_invoke;
    v16[3] = &unk_1E9883670;
    v16[4] = &v17;
    -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __94__ACXDeviceConnection_getApplicationIsInstalled_onAnyPairedDeviceWithCompanionBundleID_error___block_invoke_2;
    v15[3] = &unk_1E98837C0;
    v15[4] = &v17;
    v15[5] = &v23;
    objc_msgSend(v11, "applicationIsInstalledOnAnyPairedDeviceWithCompanionBundleID:completion:", v8, v15);

    v12 = v18;
    v13 = (void *)v18[5];
    if (v13)
    {
      if (a5)
      {
        *a5 = objc_retainAutorelease(v13);
        v12 = v18;
      }
    }
    else if (a3)
    {
      *a3 = *((_BYTE *)v24 + 24);
    }
    v9 = v12[5] == 0;
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v9;
}

void __94__ACXDeviceConnection_getApplicationIsInstalled_onAnyPairedDeviceWithCompanionBundleID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __94__ACXDeviceConnection_getApplicationIsInstalled_onAnyPairedDeviceWithCompanionBundleID_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (BOOL)fetchApplicationDatabaseSyncInformationForPairedDevice:(id)a3 returningDatabaseUUID:(id *)a4 lastSequenceNumber:(unint64_t *)a5 error:(id *)a6
{
  void *v10;

  objc_msgSend(a3, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = -[ACXDeviceConnection fetchApplicationDatabaseSyncInformationForDeviceWithPairingID:returningDatabaseUUID:lastSequenceNumber:error:](self, "fetchApplicationDatabaseSyncInformationForDeviceWithPairingID:returningDatabaseUUID:lastSequenceNumber:error:", v10, a4, a5, a6);

  return (char)a6;
}

- (BOOL)fetchApplicationDatabaseSyncInformationForDeviceWithPairingID:(id)a3 returningDatabaseUUID:(id *)a4 lastSequenceNumber:(unint64_t *)a5 error:(id *)a6
{
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[7];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v10 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v11 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __132__ACXDeviceConnection_fetchApplicationDatabaseSyncInformationForDeviceWithPairingID_returningDatabaseUUID_lastSequenceNumber_error___block_invoke;
  v16[3] = &unk_1E9883670;
  v16[4] = &v17;
  -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __132__ACXDeviceConnection_fetchApplicationDatabaseSyncInformationForDeviceWithPairingID_returningDatabaseUUID_lastSequenceNumber_error___block_invoke_2;
  v15[3] = &unk_1E98839A0;
  v15[4] = &v17;
  v15[5] = &v27;
  v15[6] = &v23;
  objc_msgSend(v12, "fetchApplicationDatabaseSyncInformationForDeviceWithPairingID:completion:", v10, v15);

  v13 = (void *)v18[5];
  if (v13)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v13);
  }
  else
  {
    if (a4)
      *a4 = objc_retainAutorelease((id)v28[5]);
    if (a5)
      *a5 = v24[3];
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v13 == 0;
}

void __132__ACXDeviceConnection_fetchApplicationDatabaseSyncInformationForDeviceWithPairingID_returningDatabaseUUID_lastSequenceNumber_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __132__ACXDeviceConnection_fetchApplicationDatabaseSyncInformationForDeviceWithPairingID_returningDatabaseUUID_lastSequenceNumber_error___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v8;
  id v9;

  v9 = a2;
  v8 = a4;
  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a4);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
  }

}

- (id)copyLocalizedValuesFromAllDevicesForInfoPlistKeys:(id)a3 forAppWithBundleID:(id)a4 fetchingFirstMatchingLocalizationInList:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[6];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v13 = MEMORY[0x1E0C809B0];
  v25 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __138__ACXDeviceConnection_copyLocalizedValuesFromAllDevicesForInfoPlistKeys_forAppWithBundleID_fetchingFirstMatchingLocalizationInList_error___block_invoke;
  v19[3] = &unk_1E9883670;
  v19[4] = &v20;
  -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __138__ACXDeviceConnection_copyLocalizedValuesFromAllDevicesForInfoPlistKeys_forAppWithBundleID_fetchingFirstMatchingLocalizationInList_error___block_invoke_2;
  v18[3] = &unk_1E98837E8;
  v18[4] = &v20;
  v18[5] = &v26;
  objc_msgSend(v14, "fetchLocalizedValuesFromAllDevicesForInfoPlistKeys:forAppWithBundleID:fetchingFirstMatchingLocalizationInList:completion:", v10, v11, v12, v18);

  v15 = (void *)v27[5];
  if (a6 && !v15)
  {
    *a6 = objc_retainAutorelease((id)v21[5]);
    v15 = (void *)v27[5];
  }
  v16 = v15;
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v16;
}

void __138__ACXDeviceConnection_copyLocalizedValuesFromAllDevicesForInfoPlistKeys_forAppWithBundleID_fetchingFirstMatchingLocalizationInList_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __138__ACXDeviceConnection_copyLocalizedValuesFromAllDevicesForInfoPlistKeys_forAppWithBundleID_fetchingFirstMatchingLocalizationInList_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

- (void)enumerateInstallableSystemAppsOnPairedDevice:(id)a3 withBlock:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;

  v6 = *MEMORY[0x1E0D51730];
  v7 = a4;
  objc_msgSend(a3, "valueForProperty:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ACXDeviceConnection enumerateInstallableSystemAppsOnDeviceWithPairingID:withBlock:](self, "enumerateInstallableSystemAppsOnDeviceWithPairingID:withBlock:", v8, v7);

}

- (void)enumerateInstallableSystemAppsOnDeviceWithPairingID:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  ACXDeviceConnection *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke;
  v17[3] = &unk_1E9883648;
  v9 = v7;
  v18 = v9;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke_2;
  v13[3] = &unk_1E9883888;
  v15 = self;
  v16 = v9;
  v14 = v6;
  v11 = v6;
  v12 = v9;
  objc_msgSend(v10, "fetchInstallableSystemAppBundleIDsForDeviceWithPairingID:completion:", v11, v13);

}

void __85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

void __85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  qos_class_t v11;
  NSObject *v12;
  int8x16_t v13;
  _QWORD v14[4];
  id v15;
  int8x16_t v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  id *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
  }
  else
  {
    if (objc_msgSend(v5, "count"))
    {
      v7 = (void *)objc_msgSend(v5, "mutableCopy");
      v19 = 0;
      v20 = (id *)&v19;
      v21 = 0x3042000000;
      v22 = __Block_byref_object_copy__116;
      v23 = __Block_byref_object_dispose__117;
      v24 = 0;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke_3;
      v14[3] = &unk_1E9883860;
      v18 = &v19;
      v17 = *(id *)(a1 + 48);
      v8 = v7;
      v15 = v8;
      v13 = *(int8x16_t *)(a1 + 32);
      v9 = (id)v13.i64[0];
      v16 = vextq_s8(v13, v13, 8uLL);
      v10 = (void *)objc_msgSend(v14, "copy");
      objc_storeWeak(v20 + 5, v10);
      v11 = qos_class_self();
      dispatch_get_global_queue(v11, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v12, v10);

      _Block_object_dispose(&v19, 8);
      objc_destroyWeak(&v24);

      goto LABEL_8;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      MOLogWrite();
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));
LABEL_8:

}

void __85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  qos_class_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  qos_class_t v14;
  NSObject *v15;
  id v16;
  uint64_t v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD block[4];
  id v26;
  id v27;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "lastObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "removeLastObject");
      v6 = *(void **)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = (uint64_t)__85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke_6;
      v17[3] = (uint64_t)&unk_1E9883838;
      v5 = v5;
      v18 = v5;
      v20 = *(id *)(a1 + 56);
      v19 = *(id *)(a1 + 32);
      v21 = WeakRetained;
      objc_msgSend(v6, "fetchInstallableSystemAppWithBundleID:onDeviceWithPairingID:completion:", v5, v7, v17);

      v8 = v18;
    }
    else
    {
      _CreateAndLogError((uint64_t)"-[ACXDeviceConnection enumerateInstallableSystemAppsOnDeviceWithPairingID:withBlock:]_block_invoke_3", 1863, CFSTR("ACXErrorDomain"), 1, 0, 0, CFSTR("Failed to get next bundle ID while enumerating local apps"), v4, v17[0]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = qos_class_self();
      dispatch_get_global_queue(v14, 0);
      v15 = objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke_5;
      v22[3] = &unk_1E9883360;
      v16 = *(id *)(a1 + 56);
      v23 = v13;
      v24 = v16;
      v8 = v13;
      dispatch_async(v15, v22);

    }
  }
  else
  {
    _CreateAndLogError((uint64_t)"-[ACXDeviceConnection enumerateInstallableSystemAppsOnDeviceWithPairingID:withBlock:]_block_invoke_3", 1854, CFSTR("ACXErrorDomain"), 1, 0, 0, CFSTR("Async enumeration block reference somehow became nil while enumerating local apps"), v2, v17[0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = qos_class_self();
    dispatch_get_global_queue(v10, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke_4;
    block[3] = &unk_1E9883360;
    v12 = *(id *)(a1 + 56);
    v26 = v9;
    v27 = v12;
    v5 = v9;
    dispatch_async(v11, block);

    v8 = v27;
  }

}

uint64_t __85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke_6(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  qos_class_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = qos_class_self();
  dispatch_get_global_queue(v7, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke_7;
  v11[3] = &unk_1E9883810;
  v12 = v6;
  v13 = a1[4];
  v16 = a1[6];
  v14 = v5;
  v15 = a1[5];
  v17 = a1[7];
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, v11);

}

void __85__ACXDeviceConnection_enumerateInstallableSystemAppsOnDeviceWithPairingID_withBlock___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  qos_class_t v5;
  void (*v6)(void);
  uint64_t v7;
  NSObject *v8;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "domain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("ACXErrorDomain")))
    {

      goto LABEL_12;
    }
    v4 = objc_msgSend(*(id *)(a1 + 32), "code");

    if (v4 != 19)
    {
LABEL_12:
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        MOLogWrite();
      v6 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_24:
      v6();
      return;
    }
LABEL_9:
    if (objc_msgSend(*(id *)(a1 + 56), "count", v7))
    {
      v5 = qos_class_self();
      dispatch_get_global_queue(v5, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v8, *(dispatch_block_t *)(a1 + 72));

      return;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    goto LABEL_24;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    v7 = *(_QWORD *)(a1 + 40);
    MOLogWrite();
  }
  if ((*(unsigned int (**)(_QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64)))
    goto LABEL_9;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    MOLogWrite();
}

- (void)fetchInstallableSystemAppWithBundleID:(id)a3 onPairedDevice:(id)a4 completion:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  v8 = *MEMORY[0x1E0D51730];
  v9 = a5;
  v10 = a3;
  objc_msgSend(a4, "valueForProperty:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[ACXDeviceConnection fetchInstallableSystemAppWithBundleID:onDeviceWithPairingID:completion:](self, "fetchInstallableSystemAppWithBundleID:onDeviceWithPairingID:completion:", v10, v11, v9);

}

- (void)fetchInstallableSystemAppWithBundleID:(id)a3 onDeviceWithPairingID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __94__ACXDeviceConnection_fetchInstallableSystemAppWithBundleID_onDeviceWithPairingID_completion___block_invoke;
  v13[3] = &unk_1E9883648;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchInstallableSystemAppWithBundleID:forDeviceWithPairingID:completion:", v11, v10, v9);

}

void __94__ACXDeviceConnection_fetchInstallableSystemAppWithBundleID_onDeviceWithPairingID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (id)installableSystemAppWithBundleID:(id)a3 onPairedDevice:(id)a4 error:(id *)a5
{
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;

  v8 = *MEMORY[0x1E0D51730];
  v9 = a3;
  objc_msgSend(a4, "valueForProperty:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACXDeviceConnection installableSystemAppWithBundleID:onDeviceWithPairingID:error:](self, "installableSystemAppWithBundleID:onDeviceWithPairingID:error:", v9, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)installableSystemAppWithBundleID:(id)a3 onDeviceWithPairingID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v10 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__ACXDeviceConnection_installableSystemAppWithBundleID_onDeviceWithPairingID_error___block_invoke;
  v16[3] = &unk_1E9883670;
  v16[4] = &v23;
  -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __84__ACXDeviceConnection_installableSystemAppWithBundleID_onDeviceWithPairingID_error___block_invoke_2;
  v15[3] = &unk_1E9883950;
  v15[4] = &v23;
  v15[5] = &v17;
  objc_msgSend(v11, "fetchInstallableSystemAppWithBundleID:forDeviceWithPairingID:completion:", v8, v9, v15);

  v12 = (void *)v18[5];
  if (a5 && !v12)
  {
    *a5 = objc_retainAutorelease((id)v24[5]);
    v12 = (void *)v18[5];
  }
  v13 = v12;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v13;
}

void __84__ACXDeviceConnection_installableSystemAppWithBundleID_onDeviceWithPairingID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __84__ACXDeviceConnection_installableSystemAppWithBundleID_onDeviceWithPairingID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

- (void)systemAppIsInstallableOnPairedDevice:(id)a3 withBundleID:(id)a4 completion:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  v8 = *MEMORY[0x1E0D51730];
  v9 = a5;
  v10 = a4;
  objc_msgSend(a3, "valueForProperty:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[ACXDeviceConnection systemAppIsInstallableOnDeviceWithPairingID:withBundleID:completion:](self, "systemAppIsInstallableOnDeviceWithPairingID:withBundleID:completion:", v11, v10, v9);

}

- (void)systemAppIsInstallableOnDeviceWithPairingID:(id)a3 withBundleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__ACXDeviceConnection_systemAppIsInstallableOnDeviceWithPairingID_withBundleID_completion___block_invoke;
  v13[3] = &unk_1E9883648;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "systemAppIsInstallableOnDeviceWithPairingID:withBundleID:completion:", v11, v10, v9);

}

void __91__ACXDeviceConnection_systemAppIsInstallableOnDeviceWithPairingID_withBundleID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (BOOL)getSystemAppInstallability:(BOOL *)a3 onPairedDevice:(id)a4 withBundleID:(id)a5 error:(id *)a6
{
  uint64_t v10;
  id v11;
  void *v12;

  v10 = *MEMORY[0x1E0D51730];
  v11 = a5;
  objc_msgSend(a4, "valueForProperty:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = -[ACXDeviceConnection getSystemAppInstallability:onDeviceWithPairingID:withBundleID:error:](self, "getSystemAppInstallability:onDeviceWithPairingID:withBundleID:error:", a3, v12, v11, a6);

  return (char)a6;
}

- (BOOL)getSystemAppInstallability:(BOOL *)a3 onDeviceWithPairingID:(id)a4 withBundleID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t *v14;
  void *v15;
  BOOL v16;
  _QWORD v18[6];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v10 = a4;
  v11 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v12 = MEMORY[0x1E0C809B0];
  v23 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __91__ACXDeviceConnection_getSystemAppInstallability_onDeviceWithPairingID_withBundleID_error___block_invoke;
  v19[3] = &unk_1E9883670;
  v19[4] = &v24;
  -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __91__ACXDeviceConnection_getSystemAppInstallability_onDeviceWithPairingID_withBundleID_error___block_invoke_2;
  v18[3] = &unk_1E98837C0;
  v18[4] = &v24;
  v18[5] = &v20;
  objc_msgSend(v13, "systemAppIsInstallableOnDeviceWithPairingID:withBundleID:completion:", v10, v11, v18);

  v14 = v25;
  v15 = (void *)v25[5];
  if (v15)
  {
    if (a6)
    {
      *a6 = objc_retainAutorelease(v15);
      v14 = v25;
    }
  }
  else if (a3)
  {
    *a3 = *((_BYTE *)v21 + 24);
  }
  v16 = v14[5] == 0;
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v16;
}

void __91__ACXDeviceConnection_getSystemAppInstallability_onDeviceWithPairingID_withBundleID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __91__ACXDeviceConnection_getSystemAppInstallability_onDeviceWithPairingID_withBundleID_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (BOOL)installRequestFailedForApp:(id)a3 onDeviceWithPairingID:(id)a4 failureReason:(id)a5 wasUserInitiated:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t *v17;
  void *v18;
  BOOL v19;
  _QWORD v21[5];
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v15 = MEMORY[0x1E0C809B0];
  v28 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __109__ACXDeviceConnection_installRequestFailedForApp_onDeviceWithPairingID_failureReason_wasUserInitiated_error___block_invoke;
  v22[3] = &unk_1E9883670;
  v22[4] = &v23;
  -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __109__ACXDeviceConnection_installRequestFailedForApp_onDeviceWithPairingID_failureReason_wasUserInitiated_error___block_invoke_2;
  v21[3] = &unk_1E9883670;
  v21[4] = &v23;
  objc_msgSend(v16, "installRequestFailedForApp:forDeviceWithPairingID:failureReason:wasUserInitiated:completion:", v12, v13, v14, v8, v21);

  v17 = v24;
  if (a7)
  {
    v18 = (void *)v24[5];
    if (v18)
    {
      *a7 = objc_retainAutorelease(v18);
      v17 = v24;
    }
  }
  v19 = v17[5] == 0;
  _Block_object_dispose(&v23, 8);

  return v19;
}

void __109__ACXDeviceConnection_installRequestFailedForApp_onDeviceWithPairingID_failureReason_wasUserInitiated_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __109__ACXDeviceConnection_installRequestFailedForApp_onDeviceWithPairingID_failureReason_wasUserInitiated_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)acknowledgeTestFlightInstallBegunForApp:(id)a3 onDeviceWithPairingID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t *v12;
  void *v13;
  BOOL v14;
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v10 = MEMORY[0x1E0C809B0];
  v23 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __91__ACXDeviceConnection_acknowledgeTestFlightInstallBegunForApp_onDeviceWithPairingID_error___block_invoke;
  v17[3] = &unk_1E9883670;
  v17[4] = &v18;
  -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __91__ACXDeviceConnection_acknowledgeTestFlightInstallBegunForApp_onDeviceWithPairingID_error___block_invoke_2;
  v16[3] = &unk_1E9883670;
  v16[4] = &v18;
  objc_msgSend(v11, "acknowledgeTestFlightInstallBegunForApp:forDeviceWithPairingID:completion:", v8, v9, v16);

  v12 = v19;
  if (a5)
  {
    v13 = (void *)v19[5];
    if (v13)
    {
      *a5 = objc_retainAutorelease(v13);
      v12 = v19;
    }
  }
  v14 = v12[5] == 0;
  _Block_object_dispose(&v18, 8);

  return v14;
}

void __91__ACXDeviceConnection_acknowledgeTestFlightInstallBegunForApp_onDeviceWithPairingID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __91__ACXDeviceConnection_acknowledgeTestFlightInstallBegunForApp_onDeviceWithPairingID_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)applicationRemovabilityForPairedDevice:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__ACXDeviceConnection_applicationRemovabilityForPairedDevice_error___block_invoke;
  v14[3] = &unk_1E9883670;
  v14[4] = &v21;
  -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __68__ACXDeviceConnection_applicationRemovabilityForPairedDevice_error___block_invoke_2;
  v13[3] = &unk_1E98837E8;
  v13[4] = &v21;
  v13[5] = &v15;
  objc_msgSend(v9, "applicationRemovabilityOnDeviceWithPairingID:completion:", v7, v13);

  v10 = (void *)v16[5];
  if (a4 && !v10)
  {
    *a4 = objc_retainAutorelease((id)v22[5]);
    v10 = (void *)v16[5];
  }
  v11 = v10;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

void __68__ACXDeviceConnection_applicationRemovabilityForPairedDevice_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __68__ACXDeviceConnection_applicationRemovabilityForPairedDevice_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

- (void)applictionRemovabilityForPairedDevice:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  objc_msgSend(a3, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__ACXDeviceConnection_applictionRemovabilityForPairedDevice_completion___block_invoke;
  v10[3] = &unk_1E9883648;
  v11 = v6;
  v8 = v6;
  -[ACXDeviceConnection _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applicationRemovabilityOnDeviceWithPairingID:completion:", v7, v8);

}

void __72__ACXDeviceConnection_applictionRemovabilityForPairedDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (BOOL)killDaemonForTestingWithError:(id *)a3
{
  void *v4;
  int v5;
  BOOL v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__ACXDeviceConnection_killDaemonForTestingWithError___block_invoke;
  v8[3] = &unk_1E98839C8;
  v8[4] = &v9;
  v8[5] = &v15;
  -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "killDaemonForTesting:", &__block_literal_global_153);

  v5 = *((unsigned __int8 *)v16 + 24);
  if (a3 && !*((_BYTE *)v16 + 24))
  {
    *a3 = objc_retainAutorelease((id)v10[5]);
    v5 = *((unsigned __int8 *)v16 + 24);
  }
  v6 = v5 != 0;
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __53__ACXDeviceConnection_killDaemonForTestingWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
    v5 = objc_msgSend(v6, "code");

    if (v5 == 4097)
      goto LABEL_9;
  }
  else
  {

  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
LABEL_9:

}

void __53__ACXDeviceConnection_killDaemonForTestingWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    v3 = v2;
    MOLogWrite();
    v2 = v3;
  }

}

- (id)copyRemoteDuplicatedClassInfoWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__ACXDeviceConnection_copyRemoteDuplicatedClassInfoWithError___block_invoke;
  v10[3] = &unk_1E98839C8;
  v10[4] = &v11;
  v10[5] = &v17;
  -[ACXDeviceConnection _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __62__ACXDeviceConnection_copyRemoteDuplicatedClassInfoWithError___block_invoke_2;
  v9[3] = &unk_1E98837E8;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v5, "fetchDuplicatedClassInfo:", v9);

  v6 = (void *)v18[5];
  if (a3 && !v6)
  {
    *a3 = objc_retainAutorelease((id)v12[5]);
    v6 = (void *)v18[5];
  }
  v7 = v6;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __62__ACXDeviceConnection_copyRemoteDuplicatedClassInfoWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;
  v8 = v3;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

void __62__ACXDeviceConnection_copyRemoteDuplicatedClassInfoWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (ACXDeviceConnectionDelegate)delegate
{
  return (ACXDeviceConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (BOOL)observersEnabled
{
  return self->_observersEnabled;
}

- (void)setObserversEnabled:(BOOL)a3
{
  self->_observersEnabled = a3;
}

- (OS_dispatch_queue)observerQueue
{
  return self->_observerQueue;
}

- (OS_dispatch_source)observerReEstablishTimer
{
  return self->_observerReEstablishTimer;
}

- (void)setObserverReEstablishTimer:(id)a3
{
  objc_storeStrong((id *)&self->_observerReEstablishTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerReEstablishTimer, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_onQueue_createXPCConnectionIfNecessary:.cold.1()
{
  int v0;
  const __CFString *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 138412290;
  v1 = CFSTR("com.apple.companionappd.connect.allow");
  _os_log_fault_impl(&dword_1D4D22000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "This process does not have the %@:=TRUE entitlement. AppConduit interfaces will all return errors", (uint8_t *)&v0, 0xCu);
}

@end
