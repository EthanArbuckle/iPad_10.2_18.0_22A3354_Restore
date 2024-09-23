@implementation HAP2AccessoryServerCoordinator

- (void)resurfaceDiscoveryInfoForDeviceID:(id)a3
{
  id v4;
  HAP2AsynchronousBlockOperation *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  uint64_t *v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__309;
  v21 = __Block_byref_object_dispose__310;
  v22 = 0;
  v5 = [HAP2AsynchronousBlockOperation alloc];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __68__HAP2AccessoryServerCoordinator_resurfaceDiscoveryInfoForDeviceID___block_invoke;
  v13 = &unk_1E894CFA8;
  objc_copyWeak(&v16, &location);
  v6 = v4;
  v14 = v6;
  v15 = &v17;
  v7 = -[HAP2AsynchronousBlockOperation initWithBlock:](v5, "initWithBlock:", &v10);
  v8 = (void *)v18[5];
  v18[5] = v7;

  -[HAP2AccessoryServerCoordinator localOperationQueue](self, "localOperationQueue", v10, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addOperation:", v18[5]);

  _Block_object_dispose(&v17, 8);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (NSOperationQueue)localOperationQueue
{
  return self->_localOperationQueue;
}

void __68__HAP2AccessoryServerCoordinator_resurfaceDiscoveryInfoForDeviceID___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "discoveredAccessoryServers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __68__HAP2AccessoryServerCoordinator_resurfaceDiscoveryInfoForDeviceID___block_invoke_3;
    v5[3] = &unk_1E894A6C0;
    v5[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(WeakRetained, "_didDiscoverAccessory:completion:", v4, v5);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "finish");
  }

}

- (NSMutableDictionary)discoveredAccessoryServers
{
  void *v3;

  -[HAP2AccessoryServerCoordinator operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  return self->_discoveredAccessoryServers;
}

- (HAP2SerializedOperationQueue)operationQueue
{
  return self->_operationQueue;
}

void __68__HAP2AccessoryServerCoordinator_resurfaceDiscoveryInfoForDeviceID___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__HAP2AccessoryServerCoordinator_resurfaceDiscoveryInfoForDeviceID___block_invoke_2;
  v7[3] = &unk_1E894CFA8;
  objc_copyWeak(&v10, v2);
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v4, "addBlock:", v7);

  objc_destroyWeak(&v10);
}

- (HAP2AccessoryServerCoordinator)initWithDiscovery:(id)a3 pairingFactory:(id)a4 transportFactory:(id)a5 secureTransportFactory:(id)a6 encodingFactory:(id)a7 controllerFactory:(id)a8
{
  id v15;
  id v16;
  id v17;
  HAP2AccessoryServerCoordinator *v18;
  HAP2AccessoryServerCoordinator *v19;
  uint64_t v20;
  HAP2PropertyLock *propertyLock;
  uint64_t v22;
  NSMutableDictionary *discoveredAccessoryServers;
  NSOperationQueue *v24;
  NSOperationQueue *localOperationQueue;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v15 = a3;
  v29 = a4;
  v28 = a5;
  v27 = a6;
  v16 = a7;
  v17 = a8;
  v30.receiver = self;
  v30.super_class = (Class)HAP2AccessoryServerCoordinator;
  v18 = -[HAP2AccessoryServerCoordinator init](&v30, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_discovery, a3);
    objc_storeStrong((id *)&v19->_pairingFactory, a4);
    objc_storeStrong((id *)&v19->_transportFactory, a5);
    objc_storeStrong((id *)&v19->_secureTransportFactory, a6);
    objc_storeStrong((id *)&v19->_encodingFactory, a7);
    objc_storeStrong((id *)&v19->_controllerFactory, a8);
    +[HAP2PropertyLock lockWithName:](HAP2PropertyLock, "lockWithName:", CFSTR("HAP2AccessoryServerCoordinator.propertyLock"));
    v20 = objc_claimAutoreleasedReturnValue();
    propertyLock = v19->_propertyLock;
    v19->_propertyLock = (HAP2PropertyLock *)v20;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v22 = objc_claimAutoreleasedReturnValue();
    discoveredAccessoryServers = v19->_discoveredAccessoryServers;
    v19->_discoveredAccessoryServers = (NSMutableDictionary *)v22;

    v24 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    localOperationQueue = v19->_localOperationQueue;
    v19->_localOperationQueue = v24;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v19->_localOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](v19->_localOperationQueue, "setName:", CFSTR("HAP2AccessoryServerCoordinator.localOperationQueue"));
    objc_msgSend(v15, "setDelegate:", v19);
  }

  return v19;
}

- (void)setBrowser:(id)a3 operationQueue:(id)a4
{
  HAP2SerializedOperationQueue *v6;
  HAP2SerializedOperationQueue *operationQueue;

  v6 = (HAP2SerializedOperationQueue *)a4;
  objc_storeWeak((id *)&self->_browser, a3);
  operationQueue = self->_operationQueue;
  self->_operationQueue = v6;

}

- (HAP2AccessoryServerCoordinatorDelegate)delegate
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__309;
  v11 = __Block_byref_object_dispose__310;
  v12 = 0;
  -[HAP2AccessoryServerCoordinator propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__HAP2AccessoryServerCoordinator_delegate__block_invoke;
  v6[3] = &unk_1E894DEE8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performReadingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HAP2AccessoryServerCoordinatorDelegate *)v4;
}

- (void)setDelegate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAP2AccessoryServerCoordinator propertyLock](self, "propertyLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__HAP2AccessoryServerCoordinator_setDelegate___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWritingBlock:", v7);

}

- (BOOL)isDiscovering
{
  HAP2AccessoryServerCoordinator *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[HAP2AccessoryServerCoordinator propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__HAP2AccessoryServerCoordinator_isDiscovering__block_invoke;
  v5[3] = &unk_1E894DEE8;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performReadingBlock:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setDiscovering:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HAP2AccessoryServerCoordinator propertyLock](self, "propertyLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__HAP2AccessoryServerCoordinator_setDiscovering___block_invoke;
  v6[3] = &unk_1E894D770;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "performWritingBlock:", v6);

}

- (BOOL)isStartDiscoveringPending
{
  void *v3;

  -[HAP2AccessoryServerCoordinator operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  return self->_startDiscoveringPending;
}

- (void)setStartDiscoveringPending:(BOOL)a3
{
  void *v5;

  -[HAP2AccessoryServerCoordinator operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertCurrentQueue");

  self->_startDiscoveringPending = a3;
}

- (BOOL)isStopDiscoveringPending
{
  void *v3;

  -[HAP2AccessoryServerCoordinator operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  return self->_stopDiscoveringPending;
}

- (void)setStopDiscoveringPending:(BOOL)a3
{
  void *v5;

  -[HAP2AccessoryServerCoordinator operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertCurrentQueue");

  self->_stopDiscoveringPending = a3;
}

- (void)startDiscovering
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[HAP2AccessoryServerCoordinator operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__HAP2AccessoryServerCoordinator_startDiscovering__block_invoke;
  v4[3] = &unk_1E894E050;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "addBlock:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)stopDiscovering
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[HAP2AccessoryServerCoordinator operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__HAP2AccessoryServerCoordinator_stopDiscovering__block_invoke;
  v4[3] = &unk_1E894E050;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "addBlock:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)discovery:(id)a3 didStartDiscoveringWithError:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  -[HAP2AccessoryServerCoordinator discovery](self, "discovery");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    objc_initWeak(&location, self);
    -[HAP2AccessoryServerCoordinator operationQueue](self, "operationQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __73__HAP2AccessoryServerCoordinator_discovery_didStartDiscoveringWithError___block_invoke;
    v10[3] = &unk_1E894DF38;
    objc_copyWeak(&v12, &location);
    v11 = v7;
    objc_msgSend(v9, "addBlock:", v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (void)discovery:(id)a3 didStopDiscoveringWithError:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  -[HAP2AccessoryServerCoordinator discovery](self, "discovery");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    objc_initWeak(&location, self);
    -[HAP2AccessoryServerCoordinator operationQueue](self, "operationQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72__HAP2AccessoryServerCoordinator_discovery_didStopDiscoveringWithError___block_invoke;
    v10[3] = &unk_1E894DF38;
    objc_copyWeak(&v12, &location);
    v11 = v7;
    objc_msgSend(v9, "addBlock:", v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (void)discovery:(id)a3 didDiscoverAccessory:(id)a4
{
  id v6;
  id v7;
  id v8;
  HAP2AsynchronousBlockOperation *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  id location;

  v6 = a3;
  v7 = a4;
  -[HAP2AccessoryServerCoordinator discovery](self, "discovery");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    objc_initWeak(&location, self);
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__309;
    v24 = __Block_byref_object_dispose__310;
    v25 = 0;
    v9 = [HAP2AsynchronousBlockOperation alloc];
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __65__HAP2AccessoryServerCoordinator_discovery_didDiscoverAccessory___block_invoke;
    v16 = &unk_1E894CFA8;
    objc_copyWeak(&v19, &location);
    v17 = v7;
    v18 = &v20;
    v10 = -[HAP2AsynchronousBlockOperation initWithBlock:](v9, "initWithBlock:", &v13);
    v11 = (void *)v21[5];
    v21[5] = v10;

    -[HAP2AccessoryServerCoordinator localOperationQueue](self, "localOperationQueue", v13, v14, v15, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addOperation:", v21[5]);

    _Block_object_dispose(&v20, 8);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

}

- (void)discovery:(id)a3 didLoseAccessory:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(id *);
  void *v18;
  id v19;
  id v20;
  id v21;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HAP2AccessoryServerCoordinator discovery](self, "discovery");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v8)
  {
    objc_initWeak(&location, self);
    -[HAP2AccessoryServerCoordinator localOperationQueue](self, "localOperationQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB34C8];
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __67__HAP2AccessoryServerCoordinator_discovery_didLoseAccessory_error___block_invoke;
    v18 = &unk_1E894DFD8;
    objc_copyWeak(&v21, &location);
    v19 = v9;
    v20 = v10;
    objc_msgSend(v13, "blockOperationWithBlock:", &v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addOperation:", v14, v15, v16, v17, v18);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

}

- (void)_startDiscovering
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint8_t *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];
  uint8_t buf[2];
  __int16 v13;

  -[HAP2AccessoryServerCoordinator operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  if (-[HAP2AccessoryServerCoordinator isDiscovering](self, "isDiscovering"))
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v4 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      v13 = 0;
      v5 = "Coordinator: startDiscovering called while already discovering";
      v6 = (uint8_t *)&v13;
      v7 = v4;
LABEL_11:
      _os_log_debug_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, v5, v6, 2u);
    }
  }
  else
  {
    v8 = -[HAP2AccessoryServerCoordinator isStartDiscoveringPending](self, "isStartDiscoveringPending");
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v9 = hap2Log_accessory;
    if (v8)
    {
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
        return;
      *(_WORD *)buf = 0;
      v5 = "Coordinator: startDiscovering called while a previous call is pending";
      v6 = buf;
      v7 = v9;
      goto LABEL_11;
    }
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "Coordinator: Starting discovery", v11, 2u);
    }
    -[HAP2AccessoryServerCoordinator setStartDiscoveringPending:](self, "setStartDiscoveringPending:", 1);
    -[HAP2AccessoryServerCoordinator discovery](self, "discovery");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startDiscovering");

  }
}

- (void)_stopDiscovering
{
  void *v3;
  _BOOL4 v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint8_t v11[16];
  __int16 v12;
  uint8_t buf[2];

  -[HAP2AccessoryServerCoordinator operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  if (-[HAP2AccessoryServerCoordinator isDiscovering](self, "isDiscovering"))
  {
    v4 = -[HAP2AccessoryServerCoordinator isStopDiscoveringPending](self, "isStopDiscoveringPending");
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v5 = hap2Log_accessory;
    if (v4)
    {
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
        return;
      v12 = 0;
      v6 = "Coordinator: stopDiscovering called while a previous call is pending";
      v7 = (uint8_t *)&v12;
      v8 = v5;
      goto LABEL_11;
    }
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "Coordinator: Stopping discovery", v11, 2u);
    }
    -[HAP2AccessoryServerCoordinator setStopDiscoveringPending:](self, "setStopDiscoveringPending:", 1);
    -[HAP2AccessoryServerCoordinator discovery](self, "discovery");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stopDiscovering");

  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v9 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v6 = "Coordinator: stopDiscovering called while not discovering";
      v7 = buf;
      v8 = v9;
LABEL_11:
      _os_log_debug_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEBUG, v6, v7, 2u);
    }
  }
}

- (void)_didStartDiscoveringWithError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAP2AccessoryServerCoordinator operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertCurrentQueue");

  -[HAP2AccessoryServerCoordinator setStartDiscoveringPending:](self, "setStartDiscoveringPending:", 0);
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v6 = hap2Log_accessory;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_error_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_ERROR, "Coordinator: Failed to start discovering: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "Coordinator: Started discovering", (uint8_t *)&v8, 2u);
  }
  -[HAP2AccessoryServerCoordinator setDiscovering:](self, "setDiscovering:", v4 == 0);
  -[HAP2AccessoryServerCoordinator delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "coordinator:didStartDiscoveringWithError:", self, v4);

}

- (void)_didStopDiscoveringWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAP2AccessoryServerCoordinator operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertCurrentQueue");

  -[HAP2AccessoryServerCoordinator setStopDiscoveringPending:](self, "setStopDiscoveringPending:", 0);
  -[HAP2AccessoryServerCoordinator setDiscovering:](self, "setDiscovering:", 0);
  -[HAP2AccessoryServerCoordinator discoveredAccessoryServers](self, "discoveredAccessoryServers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v7 = hap2Log_accessory;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_error_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_ERROR, "Coordinator: Failed to stop discovering: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "Coordinator: Stopped discovering", (uint8_t *)&v9, 2u);
  }
  -[HAP2AccessoryServerCoordinator delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "coordinator:didStopDiscoveringWithError:", self, v4);

}

- (void)_didDiscoverAccessory:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  void (**v26)(_QWORD);
  id v27;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[HAP2AccessoryServerCoordinator operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertCurrentQueue");

  if (-[HAP2AccessoryServerCoordinator isDiscovering](self, "isDiscovering"))
  {
    -[HAP2AccessoryServerCoordinator delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[HAP2AccessoryServerCoordinator browser](self, "browser");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v6, "deviceID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2AccessoryServerCoordinator discoveredAccessoryServers](self, "discoveredAccessoryServers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, v11);

        objc_initWeak(location, self);
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __67__HAP2AccessoryServerCoordinator__didDiscoverAccessory_completion___block_invoke;
        v23[3] = &unk_1E8948FE8;
        v13 = v11;
        v24 = v13;
        v26 = v7;
        objc_copyWeak(&v27, location);
        v25 = v6;
        objc_msgSend(v10, "accessoryWithDeviceIDIsPaired:completion:", v13, v23);

        objc_destroyWeak(&v27);
        objc_destroyWeak(location);

      }
      else
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v16 = (void *)hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
        {
          v21 = v16;
          objc_msgSend(v6, "deviceID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v22;
          _os_log_debug_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_DEBUG, "Coordinator: Ignoring discovered accessory %@ after browser has died", (uint8_t *)location, 0xCu);

        }
        v7[2](v7);
      }

    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v15 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
      {
        v19 = v15;
        objc_msgSend(v6, "deviceID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v20;
        _os_log_debug_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_DEBUG, "Coordinator: Ignoring discovered accessory %@ with no delegate", (uint8_t *)location, 0xCu);

      }
      v7[2](v7);
    }

  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v14 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      v17 = v14;
      objc_msgSend(v6, "deviceID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v18;
      _os_log_debug_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_DEBUG, "Coordinator: Ignoring discovered accessory %@ while not discovering", (uint8_t *)location, 0xCu);

    }
    v7[2](v7);
  }

}

- (void)_didDeterminePairingStateForAccessory:(id)a3 isPaired:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v6 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  -[HAP2AccessoryServerCoordinator operationQueue](self, "operationQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assertCurrentQueue");

  objc_msgSend(v8, "deviceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HAP2AccessoryServerCoordinator isDiscovering](self, "isDiscovering"))
  {
    -[HAP2AccessoryServerCoordinator browser](self, "browser");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "operationQueueForDeviceID:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAP2AccessoryServerCoordinator transportFactory](self, "transportFactory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAP2AccessoryServerCoordinator discovery](self, "discovery");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "createTransportWithAccessoryInfo:discovery:", v8, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      -[HAP2AccessoryServerCoordinator _didDiscoverPairedAccessory:transport:operationQueue:completion:](self, "_didDiscoverPairedAccessory:transport:operationQueue:completion:", v8, v16, v13, v9);
    else
      -[HAP2AccessoryServerCoordinator _didDiscoverUnpairedAccessory:transport:operationQueue:completion:](self, "_didDiscoverUnpairedAccessory:transport:operationQueue:completion:", v8, v16, v13, v9);

  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v17 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      v18 = 138412290;
      v19 = v11;
      _os_log_debug_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_DEBUG, "Coordinator: Ignoring discovered accessory %@ while not discovering", (uint8_t *)&v18, 0xCu);
    }
    v9[2](v9);
  }

}

- (void)_didLoseAccessory:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HAP2AccessoryServerCoordinator operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertCurrentQueue");

  if (-[HAP2AccessoryServerCoordinator isDiscovering](self, "isDiscovering"))
  {
    -[HAP2AccessoryServerCoordinator discoveredAccessoryServers](self, "discoveredAccessoryServers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v10);

    -[HAP2AccessoryServerCoordinator delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "coordinator:didLoseAccessory:error:", self, v6, v7);
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v14 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
      {
        v15 = v14;
        objc_msgSend(v6, "deviceID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412290;
        v18 = v16;
        _os_log_debug_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_DEBUG, "Coordinator: Ignoring lost unpaired accessory %@ with no delegate", (uint8_t *)&v17, 0xCu);

      }
    }

  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v13 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v17) = 0;
      _os_log_debug_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_DEBUG, "Coordinator: Ignoring lost accessory while not discovering", (uint8_t *)&v17, 2u);
    }
  }

}

- (void)_didDiscoverUnpairedAccessory:(id)a3 transport:(id)a4 operationQueue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(_QWORD))a6;
  -[HAP2AccessoryServerCoordinator operationQueue](self, "operationQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "assertCurrentQueue");

  -[HAP2AccessoryServerCoordinator delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[HAP2AccessoryServerCoordinator _createUnpairedAccessoryServerWithAccessoryInfo:transport:operationQueue:](self, "_createUnpairedAccessoryServerWithAccessoryInfo:transport:operationQueue:", v10, v11, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v17 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138412290;
        v22 = v16;
        _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_DEFAULT, "Coordinator: Discovered unpaired accessory %@", (uint8_t *)&v21, 0xCu);
      }
      objc_msgSend(v15, "coordinator:didCreateUnpairedAccessoryServer:", self, v16);
    }
    v13[2](v13);

  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v18 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      v19 = v18;
      objc_msgSend(v10, "deviceID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412290;
      v22 = v20;
      _os_log_debug_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_DEBUG, "Coordinator: Ignoring discovered unpaired accessory %@ with no delegate", (uint8_t *)&v21, 0xCu);

    }
    v13[2](v13);
  }

}

- (void)_didDiscoverPairedAccessory:(id)a3 transport:(id)a4 operationQueue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(_QWORD))a6;
  -[HAP2AccessoryServerCoordinator operationQueue](self, "operationQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "assertCurrentQueue");

  -[HAP2AccessoryServerCoordinator delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[HAP2AccessoryServerCoordinator _createPairedAccessoryServerWithAccessoryInfo:transport:operationQueue:](self, "_createPairedAccessoryServerWithAccessoryInfo:transport:operationQueue:", v10, v11, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v17 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138412290;
        v22 = v16;
        _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_DEFAULT, "Coordinator: Discovered paired accessory %@", (uint8_t *)&v21, 0xCu);
      }
      objc_msgSend(v15, "coordinator:didCreatePairedAccessoryServer:", self, v16);
    }
    v13[2](v13);

  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v18 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      v19 = v18;
      objc_msgSend(v10, "deviceID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412290;
      v22 = v20;
      _os_log_debug_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_DEBUG, "Coordinator: Ignoring discovered paired accessory %@ with no delegate", (uint8_t *)&v21, 0xCu);

    }
    v13[2](v13);
  }

}

- (id)_createMetadataForAccessoryServerWithAccessoryInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  HAP2AccessoryServerMetadata *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int16 v14;
  __int16 v15;
  void *v16;
  HAP2AccessoryServerMetadata *v17;
  uint64_t v19;
  _BOOL4 v20;
  void *v21;

  v4 = a3;
  -[HAP2AccessoryServerCoordinator operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertCurrentQueue");

  objc_opt_class();
  v21 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;
  v20 = (objc_msgSend(v7, "status") & 1) == 0;
  v8 = [HAP2AccessoryServerMetadata alloc];
  objc_msgSend(v7, "deviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "protocolVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "model");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "category");
  v14 = objc_msgSend(v7, "stateNumber");
  v15 = objc_msgSend(v7, "configurationNumber");
  objc_msgSend(v7, "setupHash");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  WORD1(v19) = v15;
  LOWORD(v19) = v14;
  v17 = -[HAP2AccessoryServerMetadata initWithDeviceID:hasPairings:protocolVersion:name:model:category:stateNumber:configNumber:setupHash:](v8, "initWithDeviceID:hasPairings:protocolVersion:name:model:category:stateNumber:configNumber:setupHash:", v9, v20, v10, v11, v12, v13, v19, v16);

  return v17;
}

- (id)_createUnpairedAccessoryServerWithAccessoryInfo:(id)a3 transport:(id)a4 operationQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HAP2AccessoryServerCoordinator operationQueue](self, "operationQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assertCurrentQueue");

  if (v9)
  {
    -[HAP2AccessoryServerCoordinator _createMetadataForAccessoryServerWithAccessoryInfo:](self, "_createMetadataForAccessoryServerWithAccessoryInfo:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[HAP2AccessoryServerCoordinator browser](self, "browser");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "protocolVersion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v9, "protocolFeaturesForVersion:", v14);

      if (v15)
      {
        -[HAP2AccessoryServerCoordinator encodingFactory](self, "encodingFactory");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "createEncodingWithOperationQueue:accessoryServerMetadata:encodingFeatures:", v10, v12, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[HAP2AccessoryServerCoordinator secureTransportFactory](self, "secureTransportFactory");
        v36 = v13;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "createSecureTransportWithTransport:isPaired:encryptedSession:", v9, 0, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        -[HAP2AccessoryServerCoordinator controllerFactory](self, "controllerFactory");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "createControllerWithEncoding:secureTransport:operationQueue:", v17, v19, v10);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        -[HAP2AccessoryServerCoordinator pairingFactory](self, "pairingFactory");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2AccessoryServerCoordinator secureTransportFactory](self, "secureTransportFactory");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "createPairingDriverWithAccessoryInfo:transport:secureTransportFactory:encoding:operationQueue:", v8, v9, v23, v17, v10);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = v36;
        +[HAP2AccessoryServer unpairedAccessoryServerWithMetadata:browser:controller:pairingDriver:operationQueue:](HAP2AccessoryServer, "unpairedAccessoryServerWithMetadata:browser:controller:pairingDriver:operationQueue:", v12, v36, v21, v24, v10);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v29 = (void *)hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          v31 = v29;
          objc_msgSend(v12, "name");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "deviceID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "protocolVersion");
          v34 = v13;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v38 = v32;
          v39 = 2112;
          v40 = v33;
          v41 = 2112;
          v42 = v35;
          _os_log_error_impl(&dword_1CCE01000, v31, OS_LOG_TYPE_ERROR, "Coordinator: Unpaired server [%@/%@] has invalid or unexpected version %@", buf, 0x20u);

          v13 = v34;
        }
        v25 = 0;
      }

    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v26 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      objc_msgSend(v8, "deviceID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v38 = v28;
      _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_DEFAULT, "Coordinator: Ignoring discovered unpaired accessory %@ with no transport", buf, 0xCu);

    }
    v25 = 0;
  }

  return v25;
}

- (id)_createPairedAccessoryServerWithAccessoryInfo:(id)a3 transport:(id)a4 operationQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HAP2AccessoryServerCoordinator operationQueue](self, "operationQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assertCurrentQueue");

  if (v9)
  {
    -[HAP2AccessoryServerCoordinator _createMetadataForAccessoryServerWithAccessoryInfo:](self, "_createMetadataForAccessoryServerWithAccessoryInfo:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[HAP2AccessoryServerCoordinator browser](self, "browser");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "protocolVersion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v9, "protocolFeaturesForVersion:", v14);

      if (v15)
      {
        -[HAP2AccessoryServerCoordinator encodingFactory](self, "encodingFactory");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "createEncodingWithOperationQueue:accessoryServerMetadata:encodingFeatures:", v10, v12, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[HAP2AccessoryServerCoordinator secureTransportFactory](self, "secureTransportFactory");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "createSecureTransportWithTransport:isPaired:encryptedSession:", v9, 1, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        -[HAP2AccessoryServerCoordinator controllerFactory](self, "controllerFactory");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "createControllerWithEncoding:secureTransport:operationQueue:", v17, v19, v10);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        +[HAP2AccessoryServer pairedAccessoryServerWithMetadata:browser:controller:operationQueue:](HAP2AccessoryServer, "pairedAccessoryServerWithMetadata:browser:controller:operationQueue:", v12, v13, v21, v10);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v26 = (void *)hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          v28 = v26;
          objc_msgSend(v12, "name");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "deviceID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "protocolVersion");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 138412802;
          v33 = v29;
          v34 = 2112;
          v35 = v30;
          v36 = 2112;
          v37 = v31;
          _os_log_error_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_ERROR, "Coordinator: Paired server [%@/%@] has invalid or unexpected version %@", (uint8_t *)&v32, 0x20u);

        }
        v22 = 0;
      }

    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v23 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      objc_msgSend(v8, "deviceID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138412290;
      v33 = v25;
      _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_DEFAULT, "Coordinator: Ignoring discovered paired accessory %@ with no transport", (uint8_t *)&v32, 0xCu);

    }
    v22 = 0;
  }

  return v22;
}

- (HAP2AccessoryServerBrowserPrivate)browser
{
  return (HAP2AccessoryServerBrowserPrivate *)objc_loadWeakRetained((id *)&self->_browser);
}

- (HAP2AccessoryServerDiscovery)discovery
{
  return self->_discovery;
}

- (HAP2AccessoryServerPairingFactory)pairingFactory
{
  return self->_pairingFactory;
}

- (HAP2AccessoryServerTransportFactory)transportFactory
{
  return self->_transportFactory;
}

- (HAP2AccessoryServerSecureTransportFactory)secureTransportFactory
{
  return self->_secureTransportFactory;
}

- (HAP2AccessoryServerEncodingFactory)encodingFactory
{
  return self->_encodingFactory;
}

- (HAP2AccessoryServerControllerFactory)controllerFactory
{
  return self->_controllerFactory;
}

- (HAP2PropertyLock)propertyLock
{
  return self->_propertyLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyLock, 0);
  objc_storeStrong((id *)&self->_localOperationQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_controllerFactory, 0);
  objc_storeStrong((id *)&self->_encodingFactory, 0);
  objc_storeStrong((id *)&self->_secureTransportFactory, 0);
  objc_storeStrong((id *)&self->_transportFactory, 0);
  objc_storeStrong((id *)&self->_pairingFactory, 0);
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_destroyWeak((id *)&self->_browser);
  objc_storeStrong((id *)&self->_discoveredAccessoryServers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __67__HAP2AccessoryServerCoordinator__didDiscoverAccessory_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  char v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v6 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v16 = v9;
      v17 = 2112;
      v18 = v5;
      _os_log_error_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_ERROR, "Coordinator: Failed to determine if discovered accessory %@ is paired: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "operationQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __67__HAP2AccessoryServerCoordinator__didDiscoverAccessory_completion___block_invoke_12;
    v10[3] = &unk_1E8948FC0;
    objc_copyWeak(&v13, (id *)(a1 + 56));
    v11 = *(id *)(a1 + 40);
    v14 = a2;
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v8, "addBlock:", v10);

    objc_destroyWeak(&v13);
  }

}

void __67__HAP2AccessoryServerCoordinator__didDiscoverAccessory_completion___block_invoke_12(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_didDeterminePairingStateForAccessory:isPaired:completion:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

void __67__HAP2AccessoryServerCoordinator_discovery_didLoseAccessory_error___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__HAP2AccessoryServerCoordinator_discovery_didLoseAccessory_error___block_invoke_2;
  v5[3] = &unk_1E894DFD8;
  objc_copyWeak(&v8, v2);
  v6 = a1[4];
  v7 = a1[5];
  objc_msgSend(v4, "addBlock:", v5);

  objc_destroyWeak(&v8);
}

void __67__HAP2AccessoryServerCoordinator_discovery_didLoseAccessory_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_didLoseAccessory:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __65__HAP2AccessoryServerCoordinator_discovery_didDiscoverAccessory___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__HAP2AccessoryServerCoordinator_discovery_didDiscoverAccessory___block_invoke_2;
  v7[3] = &unk_1E894CFA8;
  objc_copyWeak(&v10, v2);
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v4, "addBlock:", v7);

  objc_destroyWeak(&v10);
}

void __65__HAP2AccessoryServerCoordinator_discovery_didDiscoverAccessory___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__HAP2AccessoryServerCoordinator_discovery_didDiscoverAccessory___block_invoke_3;
  v4[3] = &unk_1E894A6C0;
  v3 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(WeakRetained, "_didDiscoverAccessory:completion:", v3, v4);

}

uint64_t __65__HAP2AccessoryServerCoordinator_discovery_didDiscoverAccessory___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "finish");
}

void __72__HAP2AccessoryServerCoordinator_discovery_didStopDiscoveringWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didStopDiscoveringWithError:", *(_QWORD *)(a1 + 32));

}

void __73__HAP2AccessoryServerCoordinator_discovery_didStartDiscoveringWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didStartDiscoveringWithError:", *(_QWORD *)(a1 + 32));

}

uint64_t __68__HAP2AccessoryServerCoordinator_resurfaceDiscoveryInfoForDeviceID___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "finish");
}

void __49__HAP2AccessoryServerCoordinator_stopDiscovering__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_stopDiscovering");

}

void __50__HAP2AccessoryServerCoordinator_startDiscovering__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_startDiscovering");

}

uint64_t __49__HAP2AccessoryServerCoordinator_setDiscovering___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __47__HAP2AccessoryServerCoordinator_isDiscovering__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

id __46__HAP2AccessoryServerCoordinator_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

void __42__HAP2AccessoryServerCoordinator_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

@end
