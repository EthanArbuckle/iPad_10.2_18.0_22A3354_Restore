@implementation AXHearingAidDeviceController

+ (id)sharedController
{
  if (sharedController_onceToken_1 != -1)
    dispatch_once(&sharedController_onceToken_1, &__block_literal_global_14);
  return (id)sharedController_HearingAidController;
}

void __48__AXHearingAidDeviceController_sharedController__block_invoke()
{
  AXHearingAidDeviceController *v0;
  void *v1;

  v0 = objc_alloc_init(AXHearingAidDeviceController);
  v1 = (void *)sharedController_HearingAidController;
  sharedController_HearingAidController = (uint64_t)v0;

}

- (void)searchForAvailableDevicesWithCompletion:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AXPerformBlockOnMainThread();

}

void __72__AXHearingAidDeviceController_searchForAvailableDevicesWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  objc_msgSend(*(id *)(a1 + 32), "connectedDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v2, "copy");

  objc_msgSend(*(id *)(a1 + 32), "persistentDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "persistentDevices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "arrayByAddingObjectsFromArray:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v19 = (id)v6;
  }
  objc_msgSend(*(id *)(a1 + 32), "availablePeripherals");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v19);

  objc_msgSend(*(id *)(a1 + 32), "loadedDevices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "indexesOfObjectsPassingTest:", &__block_literal_global_2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectsAtIndexes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v11);

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "availableSearchBlocks");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeAllObjects");

    v14 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(*(id *)(a1 + 32), "availableSearchBlocks");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1DF0EB808](v14);
    objc_msgSend(v15, "addObject:", v16);

    objc_msgSend(*(id *)(a1 + 32), "connectedSearchBlocks");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1DF0EB808](v14);
    objc_msgSend(v17, "addObject:", v18);

  }
  objc_msgSend(*(id *)(a1 + 32), "searchForAvailableDevices");

}

uint64_t __72__AXHearingAidDeviceController_searchForAvailableDevicesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didLoadBasicProperties");
}

- (AXHearingAidDeviceController)init
{
  AXHearingAidDeviceController *v3;
  NSMutableArray *v4;
  NSMutableArray *availableSearchBlocks;
  NSMutableArray *v6;
  NSMutableArray *connectedSearchBlocks;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *bluetoothCentralQueue;
  id v16;
  OS_dispatch_queue *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  CBCentralManager *bluetoothManager;
  void *v23;
  NSLock *v24;
  NSLock *centralRequestsLock;
  NSObject *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *deviceUpdatesQueue;
  uint64_t v29;
  AXDispatchTimer *availableDeviceTimer;
  dispatch_time_t v31;
  NSObject *v32;
  AXHearingAidDeviceController *v33;
  _QWORD block[4];
  AXHearingAidDeviceController *v36;
  objc_super v37;

  if ((objc_msgSend(MEMORY[0x1E0D2F990], "currentProcessIsHeard") & 1) != 0 || _AXSInUnitTestMode())
  {
    v37.receiver = self;
    v37.super_class = (Class)AXHearingAidDeviceController;
    v3 = -[HUDeviceController init](&v37, sel_init);
    if (v3)
    {
      v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      availableSearchBlocks = v3->_availableSearchBlocks;
      v3->_availableSearchBlocks = v4;

      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      connectedSearchBlocks = v3->_connectedSearchBlocks;
      v3->_connectedSearchBlocks = v6;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXHearingAidDeviceController setUpdateDeviceBlocks:](v3, "setUpdateDeviceBlocks:", v8);

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXHearingAidDeviceController setAvailablePeripherals:](v3, "setAvailablePeripherals:", v9);

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXHearingAidDeviceController setLoadedDevices:](v3, "setLoadedDevices:", v10);

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXHearingAidDeviceController setConnectedDevices:](v3, "setConnectedDevices:", v11);

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXHearingAidDeviceController setCentralRequestBlocks:](v3, "setCentralRequestBlocks:", v12);

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXHearingAidDeviceController setPersistentDevices:](v3, "setPersistentDevices:", v13);

      v14 = dispatch_queue_create("com.apple.ax.hearingaids", 0);
      bluetoothCentralQueue = v3->_bluetoothCentralQueue;
      v3->_bluetoothCentralQueue = (OS_dispatch_queue *)v14;

      v16 = objc_alloc(MEMORY[0x1E0C97728]);
      v17 = v3->_bluetoothCentralQueue;
      v18 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dictionaryWithObjectsAndKeys:", v19, *MEMORY[0x1E0C97640], 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v16, "initWithDelegate:queue:options:", v3, v17, v20);
      bluetoothManager = v3->_bluetoothManager;
      v3->_bluetoothManager = (CBCentralManager *)v21;

      -[CBCentralManager sharedPairingAgent](v3->_bluetoothManager, "sharedPairingAgent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setDelegate:", v3);

      v3->_centralIsOn = -[CBCentralManager state](v3->_bluetoothManager, "state") == 5;
      v24 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
      centralRequestsLock = v3->_centralRequestsLock;
      v3->_centralRequestsLock = v24;

      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = dispatch_queue_create("ha_updates_queue", v26);
      deviceUpdatesQueue = v3->_deviceUpdatesQueue;
      v3->_deviceUpdatesQueue = (OS_dispatch_queue *)v27;

      v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF3978]), "initWithTargetSerialQueue:", 0);
      availableDeviceTimer = v3->_availableDeviceTimer;
      v3->_availableDeviceTimer = (AXDispatchTimer *)v29;

      -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](v3->_availableDeviceTimer, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
      v31 = dispatch_time(0, 100000000);
      dispatch_get_global_queue(21, 0);
      v32 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __36__AXHearingAidDeviceController_init__block_invoke;
      block[3] = &unk_1EA8E8220;
      v36 = v3;
      dispatch_after(v31, v32, block);

    }
    self = v3;
    v33 = self;
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

void __36__AXHearingAidDeviceController_init__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "pairedHearingAidsDidChange");
  objc_initWeak(&location, *(id *)(a1 + 32));
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__AXHearingAidDeviceController_init__block_invoke_2;
  v3[3] = &unk_1EA8E81D0;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "registerUpdateBlock:forRetrieveSelector:withListener:", v3, sel_pairedHearingAids, *(_QWORD *)(a1 + 32));

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __36__AXHearingAidDeviceController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pairedHearingAidsDidChange");

}

- (void)dealloc
{
  objc_super v3;

  -[AXHearingAidDeviceController setAvailablePeripherals:](self, "setAvailablePeripherals:", 0);
  -[AXHearingAidDeviceController setLoadedDevices:](self, "setLoadedDevices:", 0);
  -[AXHearingAidDeviceController setConnectedDevices:](self, "setConnectedDevices:", 0);
  -[AXHearingAidDeviceController setUpdateDeviceBlocks:](self, "setUpdateDeviceBlocks:", 0);
  -[AXHearingAidDeviceController setAvailableSearchBlocks:](self, "setAvailableSearchBlocks:", 0);
  -[AXHearingAidDeviceController setConnectedSearchBlocks:](self, "setConnectedSearchBlocks:", 0);
  -[AXHearingAidDeviceController setCentralRequestBlocks:](self, "setCentralRequestBlocks:", 0);
  -[AXHearingAidDeviceController setPersistentDevices:](self, "setPersistentDevices:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AXHearingAidDeviceController;
  -[AXHearingAidDeviceController dealloc](&v3, sel_dealloc);
}

- (void)clearMissingHearingAids
{
  AXDispatchTimer *advertisingTimeoutTimer;
  _QWORD v4[5];
  id v5;
  id location;

  -[AXDispatchTimer cancel](self->_advertisingTimeoutTimer, "cancel");
  objc_initWeak(&location, self);
  advertisingTimeoutTimer = self->_advertisingTimeoutTimer;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__AXHearingAidDeviceController_clearMissingHearingAids__block_invoke;
  v4[3] = &unk_1EA8E8B68;
  v4[4] = self;
  objc_copyWeak(&v5, &location);
  -[AXDispatchTimer afterDelay:processBlock:](advertisingTimeoutTimer, "afterDelay:processBlock:", v4, 10.0);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __55__AXHearingAidDeviceController_clearMissingHearingAids__block_invoke(uint64_t a1)
{
  void *v1;
  id *v2;
  id WeakRetained;
  int v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__AXHearingAidDeviceController_clearMissingHearingAids__block_invoke_2;
  v6[3] = &unk_1EA8EA1E8;
  v2 = (id *)(a1 + 40);
  objc_copyWeak(&v7, (id *)(a1 + 40));
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v6);
  WeakRetained = objc_loadWeakRetained(v2);
  v4 = objc_msgSend(WeakRetained, "isScanning");

  if (v4)
  {
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "clearMissingHearingAids");

  }
  objc_destroyWeak(&v7);
}

void __55__AXHearingAidDeviceController_clearMissingHearingAids__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  id *v10;
  id WeakRetained;
  void *v12;
  _QWORD v13[4];
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v6);
  v9 = v8;

  if (v9 >= 10.0)
  {
    v10 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "hearingAidsForUUID:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __55__AXHearingAidDeviceController_clearMissingHearingAids__block_invoke_3;
    v13[3] = &unk_1EA8EA1C0;
    objc_copyWeak(&v14, v10);
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v13);
    objc_destroyWeak(&v14);

  }
}

void __55__AXHearingAidDeviceController_clearMissingHearingAids__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id *v9;
  id WeakRetained;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "isConnected") & 1) == 0 && (objc_msgSend(v3, "isPersistent") & 1) == 0)
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Device stopped advertising. Removing %@"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController clearMissingHearingAids]_block_invoke_3", 193, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_retainAutorelease(v5);
      v8 = v6;
      *(_DWORD *)buf = 136446210;
      v13 = objc_msgSend(v7, "UTF8String");
      _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    v9 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained(v9);
    objc_msgSend(WeakRetained, "removeLoadedDevice:", v3);

    v11 = objc_loadWeakRetained(v9);
    objc_msgSend(v11, "removeAvailableDevice:", v3);

  }
}

- (void)searchForAvailableDevices
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  AXDispatchTimer *v20;
  AXDispatchTimer *advertisingTimeoutTimer;
  NSMutableDictionary *v22;
  NSMutableDictionary *advertisingTimestamps;
  _QWORD v24[5];
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (self->_isScanning)
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Already scanning"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController searchForAvailableDevices]", 261, v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_retainAutorelease(v4);
      v6 = v5;
      *(_DWORD *)buf = 136446210;
      v28 = objc_msgSend(v4, "UTF8String");
      _os_log_impl(&dword_1DE311000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXHearingAidDeviceController persistentDevices](self, "persistentDevices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "leftPeripheralUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      if (v11)
      {
        v12 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v9, "leftPeripheralUUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v12, "initWithUUIDString:", v13);

        if (v14)
          objc_msgSend(v7, "addObject:", v14);

      }
      objc_msgSend(v9, "rightPeripheralUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "length");

      if (v16)
      {
        v17 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v9, "rightPeripheralUUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v17, "initWithUUIDString:", v18);

        if (v19)
          objc_msgSend(v7, "addObject:", v19);

      }
    }
    if (!self->_advertisingTimeoutTimer)
    {
      v20 = (AXDispatchTimer *)objc_alloc_init(MEMORY[0x1E0CF3978]);
      advertisingTimeoutTimer = self->_advertisingTimeoutTimer;
      self->_advertisingTimeoutTimer = v20;

    }
    if (!self->_advertisingTimestamps)
    {
      v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      advertisingTimestamps = self->_advertisingTimestamps;
      self->_advertisingTimestamps = v22;

    }
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __57__AXHearingAidDeviceController_searchForAvailableDevices__block_invoke;
    v24[3] = &unk_1EA8E9C00;
    v24[4] = self;
    v25 = v7;
    v26 = v9;
    v4 = v9;
    v3 = v7;
    -[AXHearingAidDeviceController sendRequestToCentralManager:](self, "sendRequestToCentralManager:", v24);

  }
  -[AXHearingAidDeviceController loadedDevicesDidChange](self, "loadedDevicesDidChange");
}

void __57__AXHearingAidDeviceController_searchForAvailableDevices__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "retrievePeripheralsWithIdentifiers:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__AXHearingAidDeviceController_searchForAvailableDevices__block_invoke_2;
  v5[3] = &unk_1EA8EA210;
  v5[4] = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 40);
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "checkPartiallyPairedWithCompletion:", v5);

}

uint64_t __57__AXHearingAidDeviceController_searchForAvailableDevices__block_invoke_2(uint64_t a1, int a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "shouldActiveScan"))
    return objc_msgSend(*(id *)(a1 + 32), "centralManager:didRetrievePeripherals:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(a1 + 56));
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (!objc_msgSend(*(id *)(a1 + 48), "count"))
      goto LABEL_14;
LABEL_7:
    if (!objc_msgSend(*(id *)(a1 + 56), "count"))
      a2 = 1;
    if (v6)
    {
      if (!a2)
        return objc_msgSend(*(id *)(a1 + 32), "centralManager:didRetrievePeripherals:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(a1 + 56));
    }
    else
    {

      if ((a2 & 1) == 0)
        return objc_msgSend(*(id *)(a1 + 32), "centralManager:didRetrievePeripherals:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(a1 + 56));
    }
    goto LABEL_14;
  }
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairedHearingAids");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && objc_msgSend(*(id *)(a1 + 48), "count"))
    goto LABEL_7;

LABEL_14:
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Starting scan %@"), *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController searchForAvailableDevices]_block_invoke_2", 249, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_retainAutorelease(v8);
    v11 = v9;
    *(_DWORD *)buf = 136446210;
    v23 = objc_msgSend(v10, "UTF8String");
    _os_log_impl(&dword_1DE311000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 1;
  v12 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v13 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("7D74F4BD-C74A-4431-862C-CCE884371592"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayWithObjects:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0C97658];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", v17, v18, v19, *MEMORY[0x1E0C97690], 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scanForPeripheralsWithServices:options:", v15, v20);

  objc_msgSend(*(id *)(a1 + 32), "clearMissingHearingAids");
  return objc_msgSend(*(id *)(a1 + 32), "centralManager:didRetrievePeripherals:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(a1 + 56));
}

- (void)searchForConnectedDevices
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __57__AXHearingAidDeviceController_searchForConnectedDevices__block_invoke;
  v2[3] = &unk_1EA8E8220;
  v2[4] = self;
  -[AXHearingAidDeviceController sendRequestToCentralManager:](self, "sendRequestToCentralManager:", v2);
}

void __57__AXHearingAidDeviceController_searchForConnectedDevices__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v3 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("7D74F4BD-C74A-4431-862C-CCE884371592"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObjects:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "retrieveConnectedPeripheralsWithServices:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "centralManager:didRetrieveConnectedPeripherals:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), v6);
}

- (void)resetConnectionToPeripheral:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Resetting connection to %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController resetConnectionToPeripheral:]", 277, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v6);
    v9 = v7;
    *(_DWORD *)buf = 136446210;
    v11 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if (v4)
    -[AXHearingAidDeviceController disconnectFromPeripheral:](self, "disconnectFromPeripheral:", v4);

}

- (void)connectToPeripheral:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  AXHearingAidDeviceController *v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __52__AXHearingAidDeviceController_connectToPeripheral___block_invoke;
    v6[3] = &unk_1EA8E81F8;
    v7 = v4;
    v8 = self;
    -[AXHearingAidDeviceController sendRequestToCentralManager:](self, "sendRequestToCentralManager:", v6);

  }
}

void __52__AXHearingAidDeviceController_connectToPeripheral___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  os_log_t *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  os_log_t v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  os_log_t v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  os_log_t v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  os_log_t v41;
  void *v42;
  void *v43;
  os_log_t v44;
  void *v45;
  void *v46;
  os_log_t v47;
  id v48;
  NSObject *v49;
  uint64_t v50;
  _BOOL4 v51;
  id v52;
  NSObject *v53;
  uint64_t v54;
  id v55;
  NSObject *v56;
  uint64_t v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  void *v64;
  int v65;
  NSObject *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  _QWORD v73[4];
  id v74;
  uint64_t v75;
  char v76;
  uint8_t buf[4];
  uint64_t v78;
  __int16 v79;
  void *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  v2 = (void *)MEMORY[0x1E0CB3940];
  +[HUNearbyHearingAidController sharedInstance](HUNearbyHearingAidController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForCurrentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Requesting connection in state %@ to %@"), v4, *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController connectToPeripheral:]_block_invoke", 289, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (os_log_t *)MEMORY[0x1E0D2F928];
  v8 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease(v6);
    v10 = v8;
    *(_DWORD *)buf = 136446210;
    v78 = objc_msgSend(v9, "UTF8String");
    _os_log_impl(&dword_1DE311000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "hearingAidForPeripheral:", *(_QWORD *)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isPaired"))
  {
    objc_msgSend(v11, "leftPeripheral");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 32);

    if (v12 == v13)
    {
      +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "shouldStreamToLeftAid");

      HAInitializeLogging();
      if (v25)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Enabling streaming to LEFT %@"), *(_QWORD *)(a1 + 32));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController connectToPeripheral:]_block_invoke", 298, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          v29 = objc_retainAutorelease(v27);
          v30 = v28;
          v31 = objc_msgSend(v29, "UTF8String");
          *(_DWORD *)buf = 136446210;
          v78 = v31;
          _os_log_impl(&dword_1DE311000, v30, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

        }
        objc_msgSend(*(id *)(a1 + 32), "axUntag:", CFSTR("DisableLEA"));
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Disabling streaming to LEFT %@"), *(_QWORD *)(a1 + 32));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController connectToPeripheral:]_block_invoke", 303, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          v35 = objc_retainAutorelease(v33);
          v36 = v34;
          v37 = objc_msgSend(v35, "UTF8String");
          *(_DWORD *)buf = 136446210;
          v78 = v37;
          _os_log_impl(&dword_1DE311000, v36, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

        }
        objc_msgSend(*(id *)(a1 + 32), "axTag:", CFSTR("DisableLEA"));
      }
      v38 = compoundAttributeContainsAttribute(objc_msgSend(v11, "earsSupportingWatch"), 2);
      HAInitializeLogging();
      if (v38)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Enabling watch support LEFT %@"), *(_QWORD *)(a1 + 32));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController connectToPeripheral:]_block_invoke", 310, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
          goto LABEL_27;
        goto LABEL_28;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Disabling watch support LEFT %@"), *(_QWORD *)(a1 + 32));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController connectToPeripheral:]_block_invoke", 315, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_30;
    }
    else
    {
      objc_msgSend(v11, "rightPeripheral");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(void **)(a1 + 32);

      if (v14 != v15)
      {
LABEL_32:
        objc_msgSend(v11, "updateInputTagsAndReset:", 0);
        goto LABEL_33;
      }
      +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "shouldStreamToRightAid");

      HAInitializeLogging();
      if (v17)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Enabling streaming to RIGHT %@"), *(_QWORD *)(a1 + 32));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController connectToPeripheral:]_block_invoke", 324, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          v21 = objc_retainAutorelease(v19);
          v22 = v20;
          v23 = objc_msgSend(v21, "UTF8String");
          *(_DWORD *)buf = 136446210;
          v78 = v23;
          _os_log_impl(&dword_1DE311000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

        }
        objc_msgSend(*(id *)(a1 + 32), "axUntag:", CFSTR("DisableLEA"));
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Disabling streaming to RIGHT %@"), *(_QWORD *)(a1 + 32));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController connectToPeripheral:]_block_invoke", 329, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          v48 = objc_retainAutorelease(v46);
          v49 = v47;
          v50 = objc_msgSend(v48, "UTF8String");
          *(_DWORD *)buf = 136446210;
          v78 = v50;
          _os_log_impl(&dword_1DE311000, v49, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

        }
        objc_msgSend(*(id *)(a1 + 32), "axTag:", CFSTR("DisableLEA"));
      }
      v51 = compoundAttributeContainsAttribute(objc_msgSend(v11, "earsSupportingWatch"), 4);
      HAInitializeLogging();
      if (v51)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Enabling watch support RIGHT %@"), *(_QWORD *)(a1 + 32));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController connectToPeripheral:]_block_invoke", 336, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
LABEL_27:
          v52 = objc_retainAutorelease(v40);
          v53 = v41;
          v54 = objc_msgSend(v52, "UTF8String");
          *(_DWORD *)buf = 136446210;
          v78 = v54;
          _os_log_impl(&dword_1DE311000, v53, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

        }
LABEL_28:

        objc_msgSend(*(id *)(a1 + 32), "axTag:", CFSTR("HearingAidSupportsWatch"));
        goto LABEL_32;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Disabling watch support RIGHT %@"), *(_QWORD *)(a1 + 32));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController connectToPeripheral:]_block_invoke", 341, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
LABEL_30:
        v55 = objc_retainAutorelease(v43);
        v56 = v44;
        v57 = objc_msgSend(v55, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v78 = v57;
        _os_log_impl(&dword_1DE311000, v56, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
    }

    objc_msgSend(*(id *)(a1 + 32), "axUntag:", CFSTR("HearingAidSupportsWatch"));
    goto LABEL_32;
  }
LABEL_33:
  +[HUNearbyHearingAidController sharedInstance](HUNearbyHearingAidController, "sharedInstance");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "shouldConnect");

  objc_msgSend(*(id *)(a1 + 40), "persistentDevices");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "firstObject");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
  {
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __52__AXHearingAidDeviceController_connectToPeripheral___block_invoke_58;
    v73[3] = &unk_1EA8EA238;
    v62 = *(id *)(a1 + 32);
    v76 = v59;
    v63 = *(_QWORD *)(a1 + 40);
    v74 = v62;
    v75 = v63;
    objc_msgSend(v61, "checkPairingStatusWithCompletion:", v73);
    v64 = v74;
LABEL_42:

    goto LABEL_43;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
    v65 = 0;
  else
    v65 = v59;
  if (v65 == 1)
  {
    HCLogHearingHandoff();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      v67 = objc_msgSend(*(id *)(a1 + 32), "state");
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v78 = v67;
      v79 = 2112;
      v80 = v68;
      _os_log_impl(&dword_1DE311000, v66, OS_LOG_TYPE_DEFAULT, "BT connectPeripheral state: %ld, %@", buf, 0x16u);

    }
    v69 = *(_QWORD *)(a1 + 32);
    v70 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
    v71 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "dictionaryWithObject:forKey:", v64, *MEMORY[0x1E0C97678]);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "connectPeripheral:options:", v69, v72);

    goto LABEL_42;
  }
LABEL_43:

}

void __52__AXHearingAidDeviceController_connectToPeripheral___block_invoke_58(uint64_t a1, char a2)
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") != 2)
  {
    if (*(_BYTE *)(a1 + 48)
      || (objc_msgSend(*(id *)(a1 + 40), "persistentDevices"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "count"),
          v4,
          v5 == 1)
      && (a2 & 1) == 0)
    {
      HCLogHearingHandoff();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = objc_msgSend(*(id *)(a1 + 32), "state");
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 134218242;
        v16 = v7;
        v17 = 2112;
        v18 = v8;
        _os_log_impl(&dword_1DE311000, v6, OS_LOG_TYPE_DEFAULT, "BT connectPeripheral state: %ld, %@", (uint8_t *)&v15, 0x16u);

      }
      v10 = a1 + 32;
      v9 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(*(_QWORD *)(v10 + 8) + 40);
      v12 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dictionaryWithObject:forKey:", v13, *MEMORY[0x1E0C97678]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "connectPeripheral:options:", v9, v14);

    }
  }
}

- (void)disconnectFromPeripheral:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  AXHearingAidDeviceController *v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("disconnectFromPeripheral from %@"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController disconnectFromPeripheral:]", 378, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_retainAutorelease(v6);
      v9 = v7;
      *(_DWORD *)buf = 136446210;
      v14 = objc_msgSend(v8, "UTF8String");
      _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__AXHearingAidDeviceController_disconnectFromPeripheral___block_invoke;
    v10[3] = &unk_1EA8E81F8;
    v11 = v4;
    v12 = self;
    -[AXHearingAidDeviceController sendRequestToCentralManager:](self, "sendRequestToCentralManager:", v10);

  }
}

void __57__AXHearingAidDeviceController_disconnectFromPeripheral___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  HCLogHearingHandoff();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "state");
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1DE311000, v2, OS_LOG_TYPE_DEFAULT, "BT disconnectFromPeripheral: state: %ld, %@", buf, 0x16u);

  }
  v6 = a1 + 32;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(*(_QWORD *)(v6 + 8) + 40);
  v8 = *MEMORY[0x1E0C97630];
  v10[0] = *MEMORY[0x1E0C97638];
  v10[1] = v8;
  v11[0] = MEMORY[0x1E0C9AAB0];
  v11[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelPeripheralConnection:options:", v5, v9);

}

- (void)disconnectFromHearingAidWithDeviceUUID:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[AXHearingAidDeviceController hearingAidForDeviceID:](self, "hearingAidForDeviceID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUNearbyHearingAidController sharedInstance](HUNearbyHearingAidController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldDisconnect");

  HCLogHearingHandoff();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) == 0)
  {
    if (v8)
    {
      objc_msgSend(v4, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v11;
      _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "Disconnection is not allowed from %@", (uint8_t *)&v12, 0xCu);

    }
    goto LABEL_8;
  }
  if (v8)
  {
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v9;
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "Disconnection from %@", (uint8_t *)&v12, 0xCu);

  }
  if (v4)
  {
    objc_msgSend(v4, "leftPeripheral");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXHearingAidDeviceController disconnectFromPeripheral:](self, "disconnectFromPeripheral:", v10);

    objc_msgSend(v4, "rightPeripheral");
    v7 = objc_claimAutoreleasedReturnValue();
    -[AXHearingAidDeviceController disconnectFromPeripheral:](self, "disconnectFromPeripheral:", v7);
LABEL_8:

  }
}

- (void)cancelPendingConnections
{
  NSObject *bluetoothCentralQueue;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  bluetoothCentralQueue = self->_bluetoothCentralQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__AXHearingAidDeviceController_cancelPendingConnections__block_invoke;
  block[3] = &unk_1EA8E8220;
  block[4] = self;
  dispatch_async(bluetoothCentralQueue, block);
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cancelling connections"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController cancelPendingConnections]", 407, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v6);
    v9 = v7;
    v10 = objc_msgSend(v8, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v15 = v10;
    _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[AXHearingAidDeviceController availablePeripherals](self, "availablePeripherals");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __56__AXHearingAidDeviceController_cancelPendingConnections__block_invoke_64;
  v12[3] = &unk_1EA8EA260;
  v12[4] = self;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v12);

}

void __56__AXHearingAidDeviceController_cancelPendingConnections__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "centralRequestBlocks");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

void __56__AXHearingAidDeviceController_cancelPendingConnections__block_invoke_64(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "leftPeripheral");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disconnectFromPeripheral:", v5);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v4, "rightPeripheral");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "disconnectFromPeripheral:", v7);
}

- (BOOL)isBluetoothAvailable
{
  return self->_centralIsOn;
}

- (void)stopSearching
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Stopping scan"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController stopSearching]", 422, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v10 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[CBCentralManager stopScan](self->_bluetoothManager, "stopScan");
  self->_isScanning = 0;
  -[AXHearingAidDeviceController loadedDevices](self, "loadedDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", &__block_literal_global_67);

}

void __45__AXHearingAidDeviceController_stopSearching__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setKeepInSync:", objc_msgSend(v2, "isPaired"));

}

- (BOOL)isScanning
{
  return self->_isScanning;
}

- (BOOL)shouldRelinquishForPartialConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[AXHearingAidDeviceController loadedDevices](self, "loadedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", &__block_literal_global_69);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count") != 1)
  {
    HAInitializeLogging();
    v21 = (void *)MEMORY[0x1E0CB3940];
    -[AXHearingAidDeviceController loadedDevices](self, "loadedDevices");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("Wrong number of paired devices %@"), v22);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController shouldRelinquishForPartialConnection]", 458, v6);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v23 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_retainAutorelease(v18);
      v24 = v23;
      *(_DWORD *)buf = 136446210;
      v27 = objc_msgSend(v18, "UTF8String");
      _os_log_impl(&dword_1DE311000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
LABEL_10:
    v20 = 0;
    goto LABEL_11;
  }
  -[AXHearingAidDeviceController loadedDevices](self, "loadedDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "firstIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HAInitializeLogging();
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = objc_msgSend(v6, "leftAvailable");
  v9 = objc_msgSend(v6, "rightAvailable");
  objc_msgSend(v6, "leftPeripheral");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "state") == 2;
  objc_msgSend(v6, "rightPeripheral");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Should relinquish %d, %d, %d, %d"), v8, v9, v11, objc_msgSend(v12, "state") != 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController shouldRelinquishForPartialConnection]", 450, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_retainAutorelease(v14);
    v17 = v15;
    *(_DWORD *)buf = 136446210;
    v27 = objc_msgSend(v16, "UTF8String");
    _os_log_impl(&dword_1DE311000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if (!objc_msgSend(v6, "leftAvailable") || !objc_msgSend(v6, "rightAvailable"))
  {
    v20 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v6, "leftPeripheral");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "state") != 2)
    goto LABEL_10;
  objc_msgSend(v6, "rightPeripheral");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "state") != 2;

LABEL_11:
LABEL_13:

  return v20;
}

uint64_t __68__AXHearingAidDeviceController_shouldRelinquishForPartialConnection__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPaired");
}

- (void)checkPartiallyPairedWithCompletion:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  AXHearingAidDeviceController *v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v5 = self->_loadedDevices;
  objc_sync_enter(v5);
  -[AXHearingAidDeviceController loadedDevices](self, "loadedDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexesOfObjectsPassingTest:", &__block_literal_global_74);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") == 1)
  {
    -[AXHearingAidDeviceController loadedDevices](self, "loadedDevices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "firstIndex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __67__AXHearingAidDeviceController_checkPartiallyPairedWithCompletion___block_invoke_2;
    v18[3] = &unk_1EA8EA328;
    v10 = v9;
    v22 = &v23;
    v19 = v10;
    v20 = self;
    v21 = v4;
    objc_msgSend(v10, "checkPairingStatusWithCompletion:", v18);

  }
  else
  {
    HAInitializeLogging();
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = *((unsigned __int8 *)v24 + 24);
    -[AXHearingAidDeviceController loadedDevices](self, "loadedDevices");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Partial pair %d = %@"), v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController checkPartiallyPairedWithCompletion:]", 491, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
      *(_DWORD *)buf = 136446210;
      v28 = v17;
      _os_log_impl(&dword_1DE311000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD))v4 + 2))(v4, *((unsigned __int8 *)v24 + 24));
  }

  objc_sync_exit(v5);
  _Block_object_dispose(&v23, 8);

}

uint64_t __67__AXHearingAidDeviceController_checkPartiallyPairedWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPaired");
}

uint64_t __67__AXHearingAidDeviceController_checkPartiallyPairedWithCompletion___block_invoke_2(uint64_t a1, int a2, int a3)
{
  void *v6;
  void *v7;
  _BOOL4 v8;
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "leftUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "rightUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length") == 0;

  }
  else
  {
    v8 = 1;
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "leftAvailable") & 1) != 0)
    v9 = 0;
  else
    v9 = objc_msgSend(*(id *)(a1 + 32), "rightAvailable") ^ 1;
  v10 = objc_msgSend(*(id *)(a1 + 32), "leftAvailable");
  if (((a2 & ~(v10 ^ objc_msgSend(*(id *)(a1 + 32), "rightAvailable") | a3) | v9 | v8) & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  HAInitializeLogging();
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 40), "loadedDevices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("Partial pair %d = %@"), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController checkPartiallyPairedWithCompletion:]_block_invoke_2", 485, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_retainAutorelease(v15);
    v18 = v16;
    *(_DWORD *)buf = 136446210;
    v21 = objc_msgSend(v17, "UTF8String");
    _os_log_impl(&dword_1DE311000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (BOOL)isPartiallyConnected
{
  NSMutableArray *v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v3 = self->_loadedDevices;
  objc_sync_enter(v3);
  -[AXHearingAidDeviceController loadedDevices](self, "loadedDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__AXHearingAidDeviceController_isPartiallyConnected__block_invoke;
  v6[3] = &unk_1EA8EA350;
  v6[4] = &v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  objc_sync_exit(v3);
  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __52__AXHearingAidDeviceController_isPartiallyConnected__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "hasConnection")
    && (objc_msgSend(v6, "isConnected") & 1) == 0
    && objc_msgSend(v6, "isPaired"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }

}

- (BOOL)isPaired
{
  NSMutableArray *v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v3 = self->_loadedDevices;
  objc_sync_enter(v3);
  -[AXHearingAidDeviceController loadedDevices](self, "loadedDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__AXHearingAidDeviceController_isPaired__block_invoke;
  v6[3] = &unk_1EA8EA350;
  v6[4] = &v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  objc_sync_exit(v3);
  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __40__AXHearingAidDeviceController_isPaired__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "isPaired")
    && ((objc_msgSend(v6, "leftAvailable") & 1) != 0 || objc_msgSend(v6, "rightAvailable")))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }

}

- (BOOL)isConnected
{
  NSMutableArray *v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v3 = self->_loadedDevices;
  objc_sync_enter(v3);
  -[AXHearingAidDeviceController loadedDevices](self, "loadedDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__AXHearingAidDeviceController_isConnected__block_invoke;
  v6[3] = &unk_1EA8EA350;
  v6[4] = &v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  objc_sync_exit(v3);
  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __43__AXHearingAidDeviceController_isConnected__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (objc_msgSend(v6, "hasConnection") && objc_msgSend(v6, "isPaired"))
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Found connected device %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController isConnected]_block_invoke", 541, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_retainAutorelease(v8);
      v11 = v9;
      *(_DWORD *)buf = 136446210;
      v13 = objc_msgSend(v10, "UTF8String");
      _os_log_impl(&dword_1DE311000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }

}

- (BOOL)isConnecting
{
  NSMutableArray *v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v3 = self->_loadedDevices;
  objc_sync_enter(v3);
  -[AXHearingAidDeviceController loadedDevices](self, "loadedDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__AXHearingAidDeviceController_isConnecting__block_invoke;
  v6[3] = &unk_1EA8EA350;
  v6[4] = &v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  objc_sync_exit(v3);
  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __44__AXHearingAidDeviceController_isConnecting__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (objc_msgSend(v6, "isAnyPeripheralInConnectingState") && objc_msgSend(v6, "isPaired"))
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Found connecting device %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController isConnecting]_block_invoke", 560, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_retainAutorelease(v8);
      v11 = v9;
      *(_DWORD *)buf = 136446210;
      v15 = objc_msgSend(v10, "UTF8String");
      _os_log_impl(&dword_1DE311000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  HCLogHearingHandoff();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    __44__AXHearingAidDeviceController_isConnecting__block_invoke_cold_2(v6);

  HCLogHearingHandoff();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    __44__AXHearingAidDeviceController_isConnecting__block_invoke_cold_1(v6);

}

- (id)hearingAidsForUUID:(id)a3
{
  id v4;
  NSMutableArray *availablePeripherals;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__5;
  v18 = __Block_byref_object_dispose__5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(v4, "length"))
  {
    availablePeripherals = self->_availablePeripherals;
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __51__AXHearingAidDeviceController_hearingAidsForUUID___block_invoke;
    v11 = &unk_1EA8EA378;
    v12 = v4;
    v13 = &v14;
    -[NSMutableArray enumerateObjectsUsingBlock:](availablePeripherals, "enumerateObjectsUsingBlock:", &v8);

  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v15[5], v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v14, 8);

  return v6;
}

void __51__AXHearingAidDeviceController_hearingAidsForUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "leftUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v5)
  {
    objc_msgSend(v11, "leftUUID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 32)))
    {

      goto LABEL_13;
    }
    v6 = v11;
  }
  objc_msgSend(v6, "rightUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && (objc_msgSend(v11, "rightUUID"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        (objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0))
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v11, "deviceUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (!v7)
      goto LABEL_11;
  }

LABEL_11:
  if (!v5)
  {
    v10 = v11;
    if (!v8)
      goto LABEL_14;
    goto LABEL_13;
  }

  v10 = v11;
  if ((v8 & 1) != 0)
  {
LABEL_13:
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v11);
    v10 = v11;
  }
LABEL_14:

}

- (id)pairedHearingDevice
{
  void *v3;
  void *v4;
  void *v5;

  +[AXHAController sharedController](AXHAController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pairedDeviceUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDeviceController hearingAidForDeviceID:](self, "hearingAidForDeviceID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hearingAidForPeripheral:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *availablePeripherals;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v5 = v4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__5;
  v23 = __Block_byref_object_dispose__5;
  v24 = 0;
  if (v4)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }
    v10 = self->_availablePeripherals;
    objc_sync_enter(v10);
    availablePeripherals = self->_availablePeripherals;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __56__AXHearingAidDeviceController_hearingAidForPeripheral___block_invoke;
    v15[3] = &unk_1EA8EA3A0;
    v12 = v8;
    v16 = v12;
    v17 = v5;
    v18 = &v19;
    -[NSMutableArray enumerateObjectsUsingBlock:](availablePeripherals, "enumerateObjectsUsingBlock:", v15);

    objc_sync_exit(v10);
    v9 = (void *)v20[5];
  }
  else
  {
    v9 = 0;
  }
  v13 = v9;
  _Block_object_dispose(&v19, 8);

  return v13;
}

void __56__AXHearingAidDeviceController_hearingAidForPeripheral___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  if ((objc_msgSend(v11, "containsPeripheralWithUUID:", a1[4]) & 1) != 0)
    goto LABEL_6;
  objc_msgSend(v11, "leftPeripheral");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 == (void *)a1[5])
  {

LABEL_6:
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    *a4 = 1;
    goto LABEL_7;
  }
  objc_msgSend(v11, "rightPeripheral");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)a1[5];

  if (v9 == v10)
    goto LABEL_6;
LABEL_7:

}

- (id)hearingAidForDeviceID:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *availablePeripherals;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  v5 = self->_availablePeripherals;
  objc_sync_enter(v5);
  availablePeripherals = self->_availablePeripherals;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__AXHearingAidDeviceController_hearingAidForDeviceID___block_invoke;
  v10[3] = &unk_1EA8EA378;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  -[NSMutableArray enumerateObjectsUsingBlock:](availablePeripherals, "enumerateObjectsUsingBlock:", v10);

  objc_sync_exit(v5);
  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __54__AXHearingAidDeviceController_hearingAidForDeviceID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "deviceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)hearingAidsForPeripheral:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  NSMutableArray *availablePeripherals;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }
    v9 = self->_availablePeripherals;
    objc_sync_enter(v9);
    availablePeripherals = self->_availablePeripherals;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__AXHearingAidDeviceController_hearingAidsForPeripheral___block_invoke;
    v13[3] = &unk_1EA8E9570;
    v11 = v8;
    v14 = v11;
    v15 = v4;
    v16 = v5;
    -[NSMutableArray enumerateObjectsUsingBlock:](availablePeripherals, "enumerateObjectsUsingBlock:", v13);

    objc_sync_exit(v9);
  }

  return v5;
}

void __57__AXHearingAidDeviceController_hearingAidsForPeripheral___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((objc_msgSend(v7, "containsPeripheralWithUUID:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    goto LABEL_6;
  objc_msgSend(v7, "leftPeripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 == *(void **)(a1 + 40))
  {

LABEL_6:
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
    goto LABEL_7;
  }
  objc_msgSend(v7, "rightPeripheral");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);

  if (v5 == v6)
    goto LABEL_6;
LABEL_7:

}

- (void)loadedDevicesDidChange
{
  AXDispatchTimer *availableDeviceTimer;
  _QWORD v4[5];
  id v5;
  id location;

  if ((-[AXDispatchTimer isActive](self->_availableDeviceTimer, "isActive") & 1) == 0)
  {
    objc_initWeak(&location, self);
    availableDeviceTimer = self->_availableDeviceTimer;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __54__AXHearingAidDeviceController_loadedDevicesDidChange__block_invoke;
    v4[3] = &unk_1EA8E8B68;
    v4[4] = self;
    objc_copyWeak(&v5, &location);
    -[AXDispatchTimer afterDelay:processBlock:cancelBlock:](availableDeviceTimer, "afterDelay:processBlock:cancelBlock:", v4, 0, 0.2);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __54__AXHearingAidDeviceController_loadedDevicesDidChange__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "copy");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "availableSearchBlocks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__AXHearingAidDeviceController_loadedDevicesDidChange__block_invoke_2;
  v6[3] = &unk_1EA8EA3C8;
  v7 = v2;
  v5 = v2;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

uint64_t __54__AXHearingAidDeviceController_loadedDevicesDidChange__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

- (void)addLoadedDevice:(id)a3
{
  NSMutableArray *v4;
  id v5;

  v5 = a3;
  v4 = self->_loadedDevices;
  objc_sync_enter(v4);
  if (v5 && (-[NSMutableArray containsObject:](self->_loadedDevices, "containsObject:", v5) & 1) == 0)
  {
    -[NSMutableArray addObject:](self->_loadedDevices, "addObject:", v5);
    -[AXHearingAidDeviceController loadedDevicesDidChange](self, "loadedDevicesDidChange");
  }
  objc_sync_exit(v4);

}

- (void)removeLoadedDevice:(id)a3
{
  NSMutableArray *v4;
  id v5;

  v5 = a3;
  v4 = self->_loadedDevices;
  objc_sync_enter(v4);
  -[NSMutableArray removeObject:](self->_loadedDevices, "removeObject:", v5);
  -[AXHearingAidDeviceController loadedDevicesDidChange](self, "loadedDevicesDidChange");
  objc_sync_exit(v4);

}

- (void)clearLoadedDevices
{
  NSMutableArray *obj;

  obj = self->_loadedDevices;
  objc_sync_enter(obj);
  -[NSMutableArray removeAllObjects](self->_loadedDevices, "removeAllObjects");
  -[AXHearingAidDeviceController loadedDevicesDidChange](self, "loadedDevicesDidChange");
  objc_sync_exit(obj);

}

- (void)addAvailableDevice:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = self->_availablePeripherals;
    objc_sync_enter(v5);
    if ((-[NSMutableArray containsObject:](self->_availablePeripherals, "containsObject:", v6) & 1) == 0)
      -[NSMutableArray addObject:](self->_availablePeripherals, "addObject:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (void)removeAvailableDevice:(id)a3
{
  NSMutableArray *v4;
  id v5;

  v5 = a3;
  v4 = self->_availablePeripherals;
  objc_sync_enter(v4);
  -[NSMutableArray removeObject:](self->_availablePeripherals, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)clearAvailableDevices
{
  NSMutableArray *obj;

  obj = self->_availablePeripherals;
  objc_sync_enter(obj);
  -[NSMutableArray removeAllObjects](self->_availablePeripherals, "removeAllObjects");
  objc_sync_exit(obj);

}

- (void)addConnectedDevice:(id)a3
{
  NSMutableArray *v4;
  id v5;

  v5 = a3;
  v4 = self->_connectedDevices;
  objc_sync_enter(v4);
  if (v5 && (-[NSMutableArray containsObject:](self->_connectedDevices, "containsObject:", v5) & 1) == 0)
    -[NSMutableArray addObject:](self->_connectedDevices, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)removeConnectedDevice:(id)a3
{
  NSMutableArray *v4;
  id v5;

  v5 = a3;
  v4 = self->_connectedDevices;
  objc_sync_enter(v4);
  -[NSMutableArray removeObject:](self->_connectedDevices, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)clearConnectedDevices
{
  NSMutableArray *obj;

  obj = self->_connectedDevices;
  objc_sync_enter(obj);
  -[NSMutableArray removeAllObjects](self->_connectedDevices, "removeAllObjects");
  objc_sync_exit(obj);

}

- (void)replaceDevice:(id)a3 withDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Replacing %@ with %@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController replaceDevice:withDevice:]", 778, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_retainAutorelease(v9);
    v12 = v10;
    *(_DWORD *)buf = 136446210;
    v21 = objc_msgSend(v11, "UTF8String");
    _os_log_impl(&dword_1DE311000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[AXHearingAidDeviceController removeLoadedDevice:](self, "removeLoadedDevice:", v6);
  -[AXHearingAidDeviceController removeAvailableDevice:](self, "removeAvailableDevice:", v6);
  -[AXHearingAidDeviceController removeConnectedDevice:](self, "removeConnectedDevice:", v6);
  if (objc_msgSend(v7, "isConnected"))
    -[AXHearingAidDeviceController addConnectedDevice:](self, "addConnectedDevice:", v7);
  if (objc_msgSend(v6, "isPaired"))
  {
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isiCloudPaired");

    if ((v14 & 1) == 0)
    {
      -[AXHearingAidDeviceController persistentDevices](self, "persistentDevices");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeAllObjects");

      +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "persistentRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setPairedHearingAids:", v17);

      +[AXHAController sharedController](AXHAController, "sharedController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deviceUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setPairedHearingAidID:", v19);

    }
  }
  -[HUDeviceController device:didUpdateProperty:](self, "device:didUpdateProperty:", v7, 69206024);

}

- (void)mergeDevice:(id)a3 withDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Device %@ did merge with: %@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController mergeDevice:withDevice:]", 801, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_retainAutorelease(v9);
    v12 = v10;
    *(_DWORD *)buf = 136446210;
    v28 = objc_msgSend(v11, "UTF8String");
    _os_log_impl(&dword_1DE311000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if (v6 && v7)
  {
    v13 = v7;
    v14 = v6;
    v15 = v13;
    v16 = v14;
    if (objc_msgSend(v14, "leftAvailable"))
    {

      v16 = v13;
      v15 = v14;
    }
    v17 = objc_opt_class();
    if (v17 == objc_opt_class())
    {
      v18 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLeftDevice:andRightDevice:", v15, v16);
      if (v18)
      {
        v19 = (void *)v18;
        -[AXHearingAidDeviceController addLoadedDevice:](self, "addLoadedDevice:", v18);
        -[AXHearingAidDeviceController addAvailableDevice:](self, "addAvailableDevice:", v19);
        if (objc_msgSend(v19, "isConnected"))
          -[AXHearingAidDeviceController addConnectedDevice:](self, "addConnectedDevice:", v19);
        if (objc_msgSend(v19, "isPaired"))
        {
          +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isiCloudPaired");

          if ((v21 & 1) == 0)
          {
            -[AXHearingAidDeviceController persistentDevices](self, "persistentDevices");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "removeAllObjects");

            +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "persistentRepresentation");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setPairedHearingAids:", v24);

            +[AXHAController sharedController](AXHAController, "sharedController");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "deviceUUID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setPairedHearingAidID:", v26);

          }
        }
        -[AXHearingAidDeviceController removeAvailableDevice:](self, "removeAvailableDevice:", v14);
        -[AXHearingAidDeviceController removeConnectedDevice:](self, "removeConnectedDevice:", v14);
        -[AXHearingAidDeviceController removeLoadedDevice:](self, "removeLoadedDevice:", v14);
        -[AXHearingAidDeviceController removeAvailableDevice:](self, "removeAvailableDevice:", v13);
        -[AXHearingAidDeviceController removeConnectedDevice:](self, "removeConnectedDevice:", v13);
        -[AXHearingAidDeviceController removeLoadedDevice:](self, "removeLoadedDevice:", v13);
        -[HUDeviceController device:didUpdateProperty:](self, "device:didUpdateProperty:", v19, 69206024);

      }
    }

  }
}

- (void)deviceDidFinishLoading:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[AXHearingAidDeviceController addAvailableDevice:](self, "addAvailableDevice:", v4);
    -[AXHearingAidDeviceController addLoadedDevice:](self, "addLoadedDevice:", v4);
    objc_msgSend(v4, "leftPeripheral");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tag:", v6);

    objc_msgSend(v4, "leftPeripheral");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tag:", CFSTR("Left HA"));

    objc_msgSend(v4, "rightPeripheral");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tag:", v9);

    objc_msgSend(v4, "rightPeripheral");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tag:", CFSTR("Right HA"));

    if ((objc_msgSend(v4, "isPaired") & 1) == 0)
      objc_msgSend(v4, "disconnectAndUnpair:", 0);
  }
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Device finished loading %@"), v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController deviceDidFinishLoading:]", 865, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_retainAutorelease(v12);
    v15 = v13;
    *(_DWORD *)buf = 136446210;
    v17 = objc_msgSend(v14, "UTF8String");
    _os_log_impl(&dword_1DE311000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if (objc_msgSend(v4, "keepInSync") && objc_msgSend(v4, "isConnected"))
    objc_msgSend(v4, "loadRequiredProperties");

}

- (void)forgetDevice:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    objc_msgSend(a3, "deviceUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXHearingAidDeviceController hearingAidForDeviceID:](self, "hearingAidForDeviceID:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[AXHearingAidDeviceController removeLoadedDevice:](self, "removeLoadedDevice:", v6);
    -[AXHearingAidDeviceController removeAvailableDevice:](self, "removeAvailableDevice:", v6);
    -[AXHearingAidDeviceController removeConnectedDevice:](self, "removeConnectedDevice:", v6);
    -[AXHearingAidDeviceController persistentDevices](self, "persistentDevices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v6);

  }
}

- (void)sendRequestToCentralManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *bluetoothCentralQueue;
  _QWORD block[5];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_centralIsOn)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BT not available. Caching [%ld, %d]"), -[CBCentralManager state](self->_bluetoothManager, "state"), self->_centralIsOn);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController sendRequestToCentralManager:]", 895, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_retainAutorelease(v7);
      v10 = v8;
      *(_DWORD *)buf = 136446210;
      v15 = objc_msgSend(v9, "UTF8String");
      _os_log_impl(&dword_1DE311000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    bluetoothCentralQueue = self->_bluetoothCentralQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__AXHearingAidDeviceController_sendRequestToCentralManager___block_invoke;
    block[3] = &unk_1EA8E86E0;
    block[4] = self;
    v13 = v5;
    dispatch_async(bluetoothCentralQueue, block);

  }
}

void __60__AXHearingAidDeviceController_sendRequestToCentralManager___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(a1 + 32), "centralRequestBlocks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1DF0EB808](v4);
  objc_msgSend(v2, "addObject:", v3);

}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  os_log_t *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  os_log_t v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *bluetoothCentralQueue;
  void *v20;
  void *v21;
  os_log_t v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Central state (%ld) %d = %d"), objc_msgSend(v4, "state"), -[AXHearingAidDeviceController isBluetoothAvailable](self, "isBluetoothAvailable"), self->_centralIsOn);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController centralManagerDidUpdateState:]", 909, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (os_log_t *)MEMORY[0x1E0D2F928];
  v8 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease(v6);
    v10 = v8;
    *(_DWORD *)buf = 136446210;
    v29 = objc_msgSend(v9, "UTF8String");
    _os_log_impl(&dword_1DE311000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if (objc_msgSend(v4, "state") == 5)
  {
    self->_centralIsOn = 1;
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("centralManager ON"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController centralManagerDidUpdateState:]", 914, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_retainAutorelease(v12);
      v15 = v13;
      v16 = objc_msgSend(v14, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v29 = v16;
      _os_log_impl(&dword_1DE311000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    -[AXHearingAidDeviceController pairedHearingAidsDidChange](self, "pairedHearingAidsDidChange");
    -[AXHearingAidDeviceController persistentDevices](self, "persistentDevices");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "connect");

    bluetoothCentralQueue = self->_bluetoothCentralQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__AXHearingAidDeviceController_centralManagerDidUpdateState___block_invoke;
    block[3] = &unk_1EA8E8220;
    block[4] = self;
    dispatch_async(bluetoothCentralQueue, block);
  }
  else
  {
    self->_centralIsOn = 0;
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("centralManager OFF"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController centralManagerDidUpdateState:]", 934, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_retainAutorelease(v21);
      v24 = v22;
      v25 = objc_msgSend(v23, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v29 = v25;
      _os_log_impl(&dword_1DE311000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    if (self->_isScanning)
    {
      self->_isScanning = 0;
      -[AXHearingAidDeviceController searchForAvailableDevices](self, "searchForAvailableDevices");
    }
    -[AXHearingAidDeviceController clearAvailableDevices](self, "clearAvailableDevices");
    -[AXHearingAidDeviceController clearConnectedDevices](self, "clearConnectedDevices");
    -[AXHearingAidDeviceController clearLoadedDevices](self, "clearLoadedDevices");
    -[AXHearingAidDeviceController pairedHearingAidsDidChange](self, "pairedHearingAidsDidChange");
  }
  +[HUNearbyHearingAidController sharedInstance](HUNearbyHearingAidController, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sendConnectionUpdateToPeers");

}

void __61__AXHearingAidDeviceController_centralManagerDidUpdateState___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "centralRequestBlocks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_100);

  objc_msgSend(*(id *)(a1 + 32), "centralRequestBlocks");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

}

void __61__AXHearingAidDeviceController_centralManagerDidUpdateState___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void (**v2)(void);

  v2 = (void (**)(void))MEMORY[0x1DF0EB808](a2);
  v2[2]();

}

- (void)centralManager:(id)a3 didRetrievePeripherals:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  HAInitializeLogging();
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[AXHearingAidDeviceController persistentDevices](self, "persistentDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ - %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController centralManager:didRetrievePeripherals:]", 956, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_retainAutorelease(v9);
    v12 = v10;
    *(_DWORD *)buf = 136446210;
    v16 = objc_msgSend(v11, "UTF8String");
    _os_log_impl(&dword_1DE311000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  HCLogHearingHandoff();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DE311000, v13, OS_LOG_TYPE_DEFAULT, "CentralManager didRetrievePeripherals", buf, 2u);
  }

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__AXHearingAidDeviceController_centralManager_didRetrievePeripherals___block_invoke;
  v14[3] = &unk_1EA8E9290;
  v14[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v14);

}

void __70__AXHearingAidDeviceController_centralManager_didRetrievePeripherals___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  void *v37;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "persistentDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "persistentDevices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __70__AXHearingAidDeviceController_centralManager_didRetrievePeripherals___block_invoke_3;
    v25[3] = &unk_1EA8EA458;
    v7 = v3;
    v8 = *(_QWORD *)(a1 + 32);
    v26 = v7;
    v27 = v8;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v25);

    objc_msgSend(*(id *)(a1 + 32), "loadedDevicesDidChange");
    v9 = v26;
  }
  else
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__5;
    v36 = __Block_byref_object_dispose__5;
    v37 = 0;
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pairedHearingAids");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectForKey:", CFSTR("ax_hearing_device_left_peripheral_key"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("ax_hearing_device_right_peripheral_key"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v12, "objectForKey:", CFSTR("ax_hearing_device_uuid_key"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v12, "objectForKey:", CFSTR("ax_hearing_device_uuid_key"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v16);

      }
    }
    if (v13)
    {
      objc_msgSend(v13, "objectForKey:", CFSTR("ax_hearing_device_uuid_key"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v13, "objectForKey:", CFSTR("ax_hearing_device_uuid_key"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v18);

      }
    }
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __70__AXHearingAidDeviceController_centralManager_didRetrievePeripherals___block_invoke_2;
    v28[3] = &unk_1EA8EA430;
    v19 = v3;
    v29 = v19;
    v20 = v11;
    v30 = v20;
    v31 = &v32;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v28);
    v21 = (void *)v33[5];
    if (v21)
    {
      objc_msgSend(v21, "setIsPaired:", 1);
      objc_msgSend(*(id *)(a1 + 32), "connectToPeripheral:", v19);
      objc_msgSend(*(id *)(a1 + 32), "addAvailableDevice:", v33[5]);
      objc_msgSend(*(id *)(a1 + 32), "persistentDevices");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "indexOfObject:", v33[5]);

      if (v23 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(*(id *)(a1 + 32), "persistentDevices");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v33[5]);

      }
    }

    _Block_object_dispose(&v32, 8);
    v9 = v37;
  }

}

void __70__AXHearingAidDeviceController_centralManager_didRetrievePeripherals___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  AXHearingAidDevice *v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if (v7 && a1[5])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[AXHearingAidDevice initWithPeripheral:]([AXHearingAidDevice alloc], "initWithPeripheral:", a1[4]);
      v9 = *(_QWORD *)(a1[6] + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
  }
}

void __70__AXHearingAidDeviceController_centralManager_didRetrievePeripherals___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v6 = objc_msgSend(v11, "addPeripheral:", *(_QWORD *)(a1 + 32));
  v7 = v11;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "addLoadedDevice:", v11);
    objc_msgSend(*(id *)(a1 + 40), "addAvailableDevice:", v11);
    objc_msgSend(v11, "setIsPersistent:", 1);
    objc_msgSend(v11, "setIsPaired:", 1);
    objc_msgSend(*(id *)(a1 + 40), "connectToPeripheral:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "persistentDevices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "indexOfObject:", v11);

    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 40), "persistentDevices");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

    }
    *a4 = 1;
    v7 = v11;
  }

}

- (void)centralManager:(id)a3 didRetrieveConnectedPeripherals:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController centralManager:didRetrieveConnectedPeripherals:]", 1024, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease(v7);
    v10 = v8;
    *(_DWORD *)buf = 136446210;
    v13 = objc_msgSend(v9, "UTF8String");
    _os_log_impl(&dword_1DE311000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__AXHearingAidDeviceController_centralManager_didRetrieveConnectedPeripherals___block_invoke;
  v11[3] = &unk_1EA8E9290;
  v11[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);

}

void __79__AXHearingAidDeviceController_centralManager_didRetrieveConnectedPeripherals___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "hearingAidForPeripheral:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addAvailableDevice:", v5);
  if (objc_msgSend(v5, "didLoadBasicProperties"))
    objc_msgSend(*(id *)(a1 + 32), "addLoadedDevice:", v5);
  HCLogHearingHandoff();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DE311000, v6, OS_LOG_TYPE_DEFAULT, "CentralManager didRetrieveConnectedPeripherals, Connect", v7, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "connectToPeripheral:", v4);
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  BOOL v22;
  NSMutableDictionary *advertisingTimestamps;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint8_t v43[16];
  _QWORD v44[4];
  id v45;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v10 = a4;
  v11 = a5;
  v42 = a6;
  -[AXHearingAidDeviceController hearingAidForPeripheral:](self, "hearingAidForPeripheral:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HAInitializeLogging();
  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = *MEMORY[0x1E0C97628];
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0C97628]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ - %@ - %@ - %@"), v10, v11, v12, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController centralManager:didDiscoverPeripheral:advertisementData:RSSI:]", 1042, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_retainAutorelease(v17);
    v20 = v18;
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v19, "UTF8String");
    _os_log_impl(&dword_1DE311000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

  }
  if (v12)
  {
    objc_msgSend(v12, "updateNameWithAdvertisingData:", v11);
    -[AXHearingAidDeviceController addAvailableDevice:](self, "addAvailableDevice:", v12);
    objc_msgSend(v12, "deviceUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21 == 0;

    if (!v22)
    {
      advertisingTimestamps = self->_advertisingTimestamps;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "deviceUUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](advertisingTimestamps, "setObject:forKey:", v24, v25);

    }
    if ((objc_msgSend(v12, "didLoadBasicProperties") & 1) != 0 || objc_msgSend(v12, "isPersistent"))
      -[AXHearingAidDeviceController addLoadedDevice:](self, "addLoadedDevice:", v12);
    HAInitializeLogging();
    v26 = (void *)MEMORY[0x1E0CB3940];
    if ((objc_msgSend(v12, "isConnected") & 1) != 0)
    {
      v27 = 0;
    }
    else if ((objc_msgSend(v12, "isPaired") & 1) != 0 || !objc_msgSend(v12, "didLoadBasicProperties"))
    {
      v27 = 1;
    }
    else
    {
      v27 = objc_msgSend(v12, "isConnecting");
    }
    objc_msgSend(v26, "stringWithFormat:", CFSTR("Connecting %d = [%d, %d, %d, %d]"), v27, objc_msgSend(v12, "isConnected") ^ 1, objc_msgSend(v12, "isPaired"), objc_msgSend(v12, "didLoadBasicProperties") ^ 1, objc_msgSend(v12, "isConnecting"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController centralManager:didDiscoverPeripheral:advertisementData:RSSI:]", 1077, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v35 = objc_retainAutorelease(v33);
      v36 = v34;
      v37 = objc_msgSend(v35, "UTF8String");
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v37;
      _os_log_impl(&dword_1DE311000, v36, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

    }
    if ((objc_msgSend(v12, "isConnected") & 1) == 0
      && ((objc_msgSend(v12, "isPaired") & 1) != 0
       || !objc_msgSend(v12, "didLoadBasicProperties")
       || objc_msgSend(v12, "isConnecting")))
    {
      objc_msgSend(v12, "addPeripheral:", v10);
      HCLogHearingHandoff();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1DE311000, v38, OS_LOG_TYPE_DEFAULT, "CentralManager didDiscoverPeripheral, Connect", (uint8_t *)&buf, 2u);
      }

      objc_msgSend(v12, "leftPeripheral");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXHearingAidDeviceController connectToPeripheral:](self, "connectToPeripheral:", v39);

      objc_msgSend(v12, "rightPeripheral");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXHearingAidDeviceController connectToPeripheral:](self, "connectToPeripheral:", v40);

    }
    if (objc_msgSend(v12, "isConnected"))
      -[AXHearingAidDeviceController addConnectedDevice:](self, "addConnectedDevice:", v12);
  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__5;
    v50 = __Block_byref_object_dispose__5;
    v51 = 0;
    objc_msgSend(v11, "objectForKey:", v14);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __92__AXHearingAidDeviceController_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke;
    v44[3] = &unk_1EA8EA480;
    p_buf = &buf;
    v29 = v10;
    v45 = v29;
    objc_msgSend(v28, "enumerateObjectsUsingBlock:", v44);

    v30 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v30)
    {
      objc_msgSend(v30, "updateNameWithAdvertisingData:", v11);
      HCLogHearingHandoff();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v43 = 0;
        _os_log_impl(&dword_1DE311000, v31, OS_LOG_TYPE_DEFAULT, "CentralManager didDiscoverPeripheral, Connect", v43, 2u);
      }

      -[AXHearingAidDeviceController connectToPeripheral:](self, "connectToPeripheral:", v29);
      -[AXHearingAidDeviceController addAvailableDevice:](self, "addAvailableDevice:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
    }

    _Block_object_dispose(&buf, 8);
  }

}

void __92__AXHearingAidDeviceController_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  int v9;
  AXHearingAidDevice *v10;
  uint64_t v11;
  void *v12;

  v6 = (void *)MEMORY[0x1E0C97778];
  v7 = a2;
  objc_msgSend(v6, "UUIDWithString:", CFSTR("7D74F4BD-C74A-4431-862C-CCE884371592"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    v10 = -[AXHearingAidDevice initWithPeripheral:]([AXHearingAidDevice alloc], "initWithPeripheral:", *(_QWORD *)(a1 + 32));
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *a4 = 1;
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  os_log_t *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  os_log_t v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  os_log_t v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  NSMutableArray *v36;
  NSMutableArray *availablePeripherals;
  void *v38;
  NSMutableArray *loadedDevices;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  _QWORD v49[5];
  void *v50;
  void *v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v48 = a3;
  v6 = a4;
  HCLogHearingHandoff();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v6, "state");
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v53 = v8;
    v54 = 2112;
    v55 = v9;
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "CentralManager didConnectPeripheral state: %ld %@", buf, 0x16u);

  }
  -[AXHearingAidDeviceController hearingAidsForPeripheral:](self, "hearingAidsForPeripheral:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ in %@"), v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController centralManager:didConnectPeripheral:]", 1097, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (os_log_t *)MEMORY[0x1E0D2F928];
  v14 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_retainAutorelease(v12);
    v16 = v14;
    v17 = objc_msgSend(v15, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v53 = v17;
    _os_log_impl(&dword_1DE311000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if (objc_msgSend(v10, "count"))
  {
    if (objc_msgSend(v10, "count") == 1)
    {
      objc_msgSend(v10, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v10, "indexesOfObjectsPassingTest:", &__block_literal_global_123);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __68__AXHearingAidDeviceController_centralManager_didConnectPeripheral___block_invoke_2;
      v49[3] = &unk_1EA8EA260;
      v49[4] = self;
      objc_msgSend(v10, "enumerateObjectsAtIndexes:options:usingBlock:", v25, 0, v49);
      v26 = objc_msgSend(v10, "count");
      if (v26 - objc_msgSend(v25, "count") == 1)
      {
        -[AXHearingAidDeviceController hearingAidForPeripheral:](self, "hearingAidForPeripheral:", v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        HAInitializeLogging();
        v27 = (void *)MEMORY[0x1E0CB3940];
        -[AXHearingAidDeviceController hearingAidsForPeripheral:](self, "hearingAidsForPeripheral:", v6);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("More than one valid hearing device %@"), v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController centralManager:didConnectPeripheral:]", 1123, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
        {
          v32 = objc_retainAutorelease(v30);
          v33 = v31;
          v34 = objc_msgSend(v32, "UTF8String");
          *(_DWORD *)buf = 136446210;
          v53 = v34;
          _os_log_impl(&dword_1DE311000, v33, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

        }
        v18 = 0;
      }

    }
    objc_msgSend(v18, "addPeripheral:", v6);
    -[AXHearingAidDeviceController addConnectedDevice:](self, "addConnectedDevice:", v18);
  }
  else
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No device for peripheral %@"), v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController centralManager:didConnectPeripheral:]", 1132, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_retainAutorelease(v20);
      v23 = v21;
      v24 = objc_msgSend(v22, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v53 = v24;
      _os_log_impl(&dword_1DE311000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    -[AXHearingAidDeviceController disconnectFromPeripheral:](self, "disconnectFromPeripheral:", v6);
    v18 = 0;
  }
  objc_msgSend(v6, "axTag:", CFSTR("IsHearingAid"));
  objc_msgSend(v18, "connectionDidChange");
  if (objc_msgSend(v18, "isPaired"))
  {
    +[HUNearbyHearingAidController sharedInstance](HUNearbyHearingAidController, "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "sendConnectionUpdateToPeers");

    v36 = self->_availablePeripherals;
    objc_sync_enter(v36);
    availablePeripherals = self->_availablePeripherals;
    v51 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray setArray:](availablePeripherals, "setArray:", v38);

    objc_sync_exit(v36);
    loadedDevices = self->_loadedDevices;
    v50 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray setArray:](loadedDevices, "setArray:", v40);

    -[AXHearingAidDeviceController persistentDevices](self, "persistentDevices");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v40) = objc_msgSend(v41, "indexOfObject:", v18) == 0x7FFFFFFFFFFFFFFFLL;

    if ((_DWORD)v40)
    {
      -[AXHearingAidDeviceController persistentDevices](self, "persistentDevices");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addObject:", v18);

    }
    -[AXHearingAidDeviceController loadedDevicesDidChange](self, "loadedDevicesDidChange");
  }
  if (objc_msgSend(v18, "didLoadBasicProperties"))
    -[AXHearingAidDeviceController deviceDidFinishLoading:](self, "deviceDidFinishLoading:", v18);
  v43 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("7D74F4BD-C74A-4431-862C-CCE884371592"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("180a"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("8341F2B4-C013-4F04-8197-C4CDB42E26DC"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "arrayWithObjects:", v44, v45, v46, 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "discoverServices:", v47);

}

BOOL __68__AXHearingAidDeviceController_centralManager_didConnectPeripheral___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;
  void *v5;

  v2 = a2;
  if (objc_msgSend(v2, "didLoadPersistentProperties"))
  {
    objc_msgSend(v2, "leftPeripheral");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(v2, "rightPeripheral");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v5 == 0;

    }
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

uint64_t __68__AXHearingAidDeviceController_centralManager_didConnectPeripheral___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAvailableDevice:", a2);
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  os_log_t *v13;
  void *v14;
  os_log_t *v15;
  id v16;
  id v17;
  AXHearingAidDeviceController *v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  os_log_t v26;
  id v27;
  id v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  os_log_t v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  const char *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint8_t buf[4];
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController centralManager:didFailToConnectPeripheral:error:]", 1168, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (os_log_t *)MEMORY[0x1E0D2F928];
  v14 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v15 = v13;
    v16 = v10;
    v17 = v9;
    v18 = self;
    v19 = v8;
    v20 = objc_retainAutorelease(v12);
    v21 = v14;
    v22 = v20;
    v8 = v19;
    self = v18;
    v9 = v17;
    v10 = v16;
    v13 = v15;
    *(_DWORD *)buf = 136446210;
    v54 = objc_msgSend(v22, "UTF8String");
    _os_log_impl(&dword_1DE311000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v23 = objc_msgSend(v10, "code");
  if (v23 <= 0x10)
  {
    if (((1 << v23) & 0x8EF9) != 0)
    {
      HAInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Non fatal error. Attempting reconnect"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController centralManager:didFailToConnectPeripheral:error:]", 1183, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
      {
        v27 = v8;
        v28 = objc_retainAutorelease(v25);
        v29 = v26;
        v30 = v28;
        v8 = v27;
        v31 = objc_msgSend(v30, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v54 = v31;
        _os_log_impl(&dword_1DE311000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      HCLogHearingHandoff();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "identifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v54 = (uint64_t)v33;
        _os_log_impl(&dword_1DE311000, v32, OS_LOG_TYPE_DEFAULT, "CentralManager: didFailToConnectPeripheral, Non fatal, Reconnect: %@", buf, 0xCu);

      }
      -[AXHearingAidDeviceController connectToPeripheral:](self, "connectToPeripheral:", v9);
      goto LABEL_17;
    }
    if (((1 << v23) & 0x13106) != 0)
    {
      HAInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fatal error"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController centralManager:didFailToConnectPeripheral:error:]", 1195, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
      {
        v37 = objc_retainAutorelease(v35);
        v38 = v36;
        v39 = objc_msgSend(v37, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v54 = v39;
        _os_log_impl(&dword_1DE311000, v38, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      HCLogHearingHandoff();
      v40 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      objc_msgSend(v9, "identifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v54 = (uint64_t)v41;
      v42 = "CentralManager: didFailToConnectPeripheral, Fatal: %@";
    }
    else
    {
      +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "clearPartialPairing");

      if (v44)
      {
        objc_msgSend(v8, "sharedPairingAgent");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "unpairPeer:", v9);
      }
      else
      {
        v46 = (void *)MEMORY[0x1E0D2F9A0];
        v47 = (void *)MEMORY[0x1E0D2F990];
        v51 = *MEMORY[0x1E0D2F900];
        v52 = &unk_1EA8FFCE0;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "messagePayloadFromDictionary:andIdentifier:", v48, 0x8000000000000000);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "messageWithPayload:", v49);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        +[AXHeardController sharedServer](AXHeardController, "sharedServer");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "sendUpdateMessage:forIdentifier:", v45, 0x8000000000000000);

      }
      HCLogHearingHandoff();
      v40 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      objc_msgSend(v9, "identifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v54 = (uint64_t)v41;
      v42 = "CentralManager: didFailToConnectPeripheral, Pairing info was removed: %@";
    }
    _os_log_impl(&dword_1DE311000, v40, OS_LOG_TYPE_DEFAULT, v42, buf, 0xCu);

LABEL_16:
  }
LABEL_17:

}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  -[AXHearingAidDeviceController hearingAidForPeripheral:](self, "hearingAidForPeripheral:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateBatteryServiceForPeripheral:", v7);
  HCLogHearingHandoff();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v7, "state");
    objc_msgSend(v7, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 134218754;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v13;
    v26 = 2112;
    v27 = v8;
    _os_log_impl(&dword_1DE311000, v10, OS_LOG_TYPE_DEFAULT, "CentralManager didDisconnectPeripheral state: %ld %@ %@ error: %@", (uint8_t *)&v20, 0x2Au);

  }
  if (!objc_msgSend(v9, "isPaired"))
    goto LABEL_10;
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isiCloudPaired"))
  {

    goto LABEL_10;
  }
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pairedHearingAids");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
LABEL_10:
    if (v9)
    {
      -[HUDeviceController device:didUpdateProperty:](self, "device:didUpdateProperty:", v9, 69206016);
      -[AXHearingAidDeviceController removeConnectedDevice:](self, "removeConnectedDevice:", v9);
      -[AXHearingAidDeviceController persistentDevices](self, "persistentDevices");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeObject:", v9);

      -[AXHearingAidDeviceController loadedDevicesDidChange](self, "loadedDevicesDidChange");
    }
    goto LABEL_12;
  }
  -[HUDeviceController device:didUpdateProperty:](self, "device:didUpdateProperty:", v9, 0x200000);
  -[AXHearingAidDeviceController removeConnectedDevice:](self, "removeConnectedDevice:", v9);
  objc_msgSend(v9, "connectionDidChange");
  +[HUNearbyHearingAidController sharedInstance](HUNearbyHearingAidController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sendConnectionUpdateToPeers");

  HCLogHearingHandoff();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_1DE311000, v18, OS_LOG_TYPE_DEFAULT, "CentralManager didDisconnectPeripheral, Connect", (uint8_t *)&v20, 2u);
  }

  -[AXHearingAidDeviceController connectToPeripheral:](self, "connectToPeripheral:", v7);
LABEL_12:

}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  AXHearingAidDevice *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  id v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  int v47;
  __CFString *v48;
  void *v49;
  __CFString *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint8_t buf[4];
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "hasTag:", CFSTR("IsHearingAid")))
  {
    v6 = v5;
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pairedHearingAids");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Pairing completed %@ - %@"), v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController pairingAgent:peerDidCompletePairing:]", 1249, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_retainAutorelease(v10);
      v13 = v11;
      *(_DWORD *)buf = 136446210;
      v68 = objc_msgSend(v12, "UTF8String");
      _os_log_impl(&dword_1DE311000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    -[AXHearingAidDeviceController hearingAidForPeripheral:](self, "hearingAidForPeripheral:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      goto LABEL_32;
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pairedHearingAids");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v47 = objc_msgSend(v6, "hasTag:", CFSTR("Left HA"));
      v48 = CFSTR("ax_hearing_device_right_peripheral_key");
      if (v47)
        v48 = CFSTR("ax_hearing_device_left_peripheral_key");
      v49 = (void *)MEMORY[0x1E0C99E08];
      v50 = v48;
      +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "knownPeripheralUUIDs");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "dictionaryWithDictionary:", v52);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v6, "identifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "UUIDString");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setValue:forKey:", v54, v50);

      +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setKnownPeripheralUUIDs:", v18);

      HAInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not iCloud paired. Storing UUIDs %@"), v18);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController pairingAgent:peerDidCompletePairing:]", 1301, v25);
      v56 = (id)objc_claimAutoreleasedReturnValue();
      v57 = (void *)*MEMORY[0x1E0D2F928];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
      {
        v56 = objc_retainAutorelease(v56);
        v58 = v57;
        v59 = objc_msgSend(v56, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v68 = v59;
        _os_log_impl(&dword_1DE311000, v58, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      goto LABEL_31;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ax_hearing_device_left_peripheral_key"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", CFSTR("ax_hearing_device_hiid_key"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKey:", CFSTR("ax_hearing_device_left_peripheral_key"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", CFSTR("ax_hearing_device_hiidother_key"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKey:", CFSTR("ax_hearing_device_right_peripheral_key"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", CFSTR("ax_hearing_device_hiid_key"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKey:", CFSTR("ax_hearing_device_right_peripheral_key"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", CFSTR("ax_hearing_device_hiidother_key"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v63 = v23;
    if (!objc_msgSend(v18, "length"))
    {
      v24 = v23;

      v18 = v24;
    }
    v25 = v66;
    if (!objc_msgSend(v21, "length"))
    {
      v26 = v66;

      v21 = v26;
    }
    v64 = v21;
    +[AXHearingAidDevice deviceIDFromLeftID:andRightID:](AXHearingAidDevice, "deviceIDFromLeftID:andRightID:", v18, v21);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v6, "hasTag:", v27);
    HAInitializeLogging();
    v65 = (void *)v27;
    if (v28)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Found easy paired peripheral %@ - %@"), v27, v6);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController pairingAgent:peerDidCompletePairing:]", 1272, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)*MEMORY[0x1E0D2F928];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
      {
        v32 = objc_retainAutorelease(v30);
        v33 = v31;
        v34 = objc_msgSend(v32, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v68 = v34;
        _os_log_impl(&dword_1DE311000, v33, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      -[AXHearingAidDeviceController hearingAidForDeviceID:](self, "hearingAidForDeviceID:", v65);
      v35 = (AXHearingAidDevice *)objc_claimAutoreleasedReturnValue();
      if (!v35)
      {
        v35 = -[AXHearingAidDevice initWithPersistentRepresentation:]([AXHearingAidDevice alloc], "initWithPersistentRepresentation:", v8);
        -[AXHearingAidDeviceController addAvailableDevice:](self, "addAvailableDevice:", v35);
        -[AXHearingAidDeviceController addLoadedDevice:](self, "addLoadedDevice:", v35);
        HAInitializeLogging();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Creating new easy pairing device %@"), v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController pairingAgent:peerDidCompletePairing:]", 1279, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)*MEMORY[0x1E0D2F928];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
        {
          v62 = v36;
          v39 = objc_retainAutorelease(v37);
          v40 = v38;
          v41 = v39;
          v36 = v62;
          v42 = objc_msgSend(v41, "UTF8String");
          *(_DWORD *)buf = 136446210;
          v68 = v42;
          _os_log_impl(&dword_1DE311000, v40, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

        }
      }
      -[AXHearingAidDevice addPeripheral:asLeft:](v35, "addPeripheral:asLeft:", v6, objc_msgSend(v6, "hasTag:", CFSTR("Left HA")));
      +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
      v43 = (id)objc_claimAutoreleasedReturnValue();
      -[AXHearingAidDevice persistentRepresentation](v35, "persistentRepresentation");
      v44 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setPairedHearingAids:", v44);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Peripheral missing tag %@"), v27);
      v35 = (AXHearingAidDevice *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController pairingAgent:peerDidCompletePairing:]", 1286, v35);
      v43 = (id)objc_claimAutoreleasedReturnValue();
      v60 = (void *)*MEMORY[0x1E0D2F928];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
      {
LABEL_30:

        v56 = v64;
LABEL_31:

LABEL_32:
        objc_msgSend(v14, "addPeripheral:", v6);
        objc_msgSend(v14, "pairingDidCompleteForPeripheral:", v6);
        objc_msgSend(v14, "checkPairingStatusWithCompletion:", &__block_literal_global_152);
        -[AXHearingAidDeviceController loadedDevicesDidChange](self, "loadedDevicesDidChange");

        goto LABEL_33;
      }
      v43 = objc_retainAutorelease(v43);
      v44 = v60;
      v61 = objc_msgSend(v43, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v68 = v61;
      _os_log_impl(&dword_1DE311000, v44, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    v25 = v66;
    goto LABEL_30;
  }
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Skipping pairing becuase not a hearing device %@"), v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController pairingAgent:peerDidCompletePairing:]", 1319, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v45 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v8);
    v46 = v45;
    *(_DWORD *)buf = 136446210;
    v68 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_1DE311000, v46, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
LABEL_33:

}

void __68__AXHearingAidDeviceController_pairingAgent_peerDidCompletePairing___block_invoke(uint64_t a1, int a2, char a3)
{
  void *v3;
  id v4;

  if (a2)
  {
    if ((a3 & 1) == 0)
    {
      +[AXHAController sharedController](AXHAController, "sharedController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setListenForAvailableDeviceUpdates:", 0);

      +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setClearPartialPairing:", 0);

    }
  }
}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController pairingAgent:peerDidFailToCompletePairing:error:]", 1325, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_retainAutorelease(v10);
    v13 = v11;
    *(_DWORD *)buf = 136446210;
    v17 = objc_msgSend(v12, "UTF8String");
    _os_log_impl(&dword_1DE311000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v7;
    -[AXHearingAidDeviceController hearingAidForPeripheral:](self, "hearingAidForPeripheral:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pairingDidCompleteForPeripheral:", v14);

    -[AXHearingAidDeviceController loadedDevicesDidChange](self, "loadedDevicesDidChange");
  }

}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[AXHearingAidDeviceController hearingAidForPeripheral:](self, "hearingAidForPeripheral:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Did Unpair %@ in device %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController pairingAgent:peerDidUnpair:]", 1339, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_retainAutorelease(v8);
    v11 = v9;
    *(_DWORD *)buf = 136446210;
    v14 = objc_msgSend(v10, "UTF8String");
    _os_log_impl(&dword_1DE311000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if (v6)
  {
    -[AXHearingAidDeviceController forgetDevice:](self, "forgetDevice:", v6);
    -[AXHearingAidDeviceController loadedDevicesDidChange](self, "loadedDevicesDidChange");
    objc_msgSend(v6, "disconnectAndUnpair:", 1);
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPairedHearingAids:", 0);

  }
}

- (void)checkPeripheralPaired:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  NSObject *bluetoothCentralQueue;
  _QWORD block[5];
  id v10;
  void (**v11)(id, uint64_t);

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  if (v7)
  {
    if (_AXSInUnitTestMode())
    {
      v7[2](v7, 1);
    }
    else if (v6)
    {
      bluetoothCentralQueue = self->_bluetoothCentralQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__AXHearingAidDeviceController_checkPeripheralPaired_withCompletion___block_invoke;
      block[3] = &unk_1EA8E9218;
      block[4] = self;
      v10 = v6;
      v11 = v7;
      dispatch_async(bluetoothCentralQueue, block);

    }
    else
    {
      v7[2](v7, 0);
    }
  }

}

uint64_t __69__AXHearingAidDeviceController_checkPeripheralPaired_withCompletion___block_invoke(_QWORD *a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1[4] + 40), "sharedPairingAgent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isPeerPaired:", a1[5]);

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)unpairPeripheralWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  AXHearingAidDeviceController *v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__AXHearingAidDeviceController_unpairPeripheralWithUUID___block_invoke;
    v10[3] = &unk_1EA8E81F8;
    v11 = v4;
    v12 = self;
    -[AXHearingAidDeviceController sendRequestToCentralManager:](self, "sendRequestToCentralManager:", v10);
    v5 = v11;
  }
  else
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not Unpairing %@"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController unpairPeripheralWithUUID:]", 1400, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_retainAutorelease(v6);
      v9 = v7;
      *(_DWORD *)buf = 136446210;
      v14 = objc_msgSend(v8, "UTF8String");
      _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }

}

void __57__AXHearingAidDeviceController_unpairPeripheralWithUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint8_t buf[4];
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", *(_QWORD *)(a1 + 32));
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
  v21[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "retrievePeripheralsWithIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not unpairing %@"), *(_QWORD *)(a1 + 32));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController unpairPeripheralWithUUID:]_block_invoke", 1394, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_retainAutorelease(v15);
      v18 = v16;
      *(_DWORD *)buf = 136446210;
      v20 = objc_msgSend(v17, "UTF8String");
      _os_log_impl(&dword_1DE311000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "sharedPairingAgent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isPeerPaired:", v6);

  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unpairing [%d] %@"), v8, *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController unpairPeripheralWithUUID:]_block_invoke", 1386, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_retainAutorelease(v10);
    v13 = v11;
    *(_DWORD *)buf = 136446210;
    v20 = objc_msgSend(v12, "UTF8String");
    _os_log_impl(&dword_1DE311000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if (v8)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "sharedPairingAgent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "unpairPeer:", v6);
LABEL_9:

  }
}

- (void)persistPairedHearingAids
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[AXHearingAidDeviceController persistentDevices](self, "persistentDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistentRepresentation");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPairedHearingAids:", v5);

  }
}

- (void)pairedHearingAidsDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  AXFakeHearingAidDevice *v14;
  AXFakeHearingAidDevice *v15;
  AXFakeHearingAidDevice *v16;
  AXFakeHearingAidDevice *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  AXFakeHearingAidDevice *v23;
  void *v24;
  void *v25;
  AXHearingAidDevice *v26;
  void *v27;
  void *v28;
  AXHearingAidDevice *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  NSObject *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[5];
  id v64;
  AXHearingAidDevice *v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  AXFakeHearingAidDevice *v69;
  _QWORD v70[5];
  AXHearingAidDevice *v71;
  uint8_t buf[4];
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pairedHearingAids");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("New aids: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController pairedHearingAidsDidChange]", 1420, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v6);
    v9 = v7;
    *(_DWORD *)buf = 136446210;
    v73 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if (!v4)
  {
    +[AXHAController sharedController](AXHAController, "sharedController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "liveListenController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isListening");

    if (!v20)
      goto LABEL_33;
    +[AXHAController sharedController](AXHAController, "sharedController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "liveListenController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke;
    v70[3] = &unk_1EA8EA508;
    v70[4] = self;
    objc_msgSend(v22, "stopListeningWithCompletion:", v70);

LABEL_32:
    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("HAFakeSearch"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    if ((v11 & 1) == 0)
    {
      objc_msgSend(v4, "valueForKey:", CFSTR("ax_hearing_device_fake_type_key"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v23 = -[AXFakeHearingAidDevice initWithDeviceType:]([AXFakeHearingAidDevice alloc], "initWithDeviceType:", objc_msgSend(v21, "intValue"));
        -[AXHearingAidDeviceController persistentDevices](self, "persistentDevices");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v23);

        -[AXHearingAidDeviceController addLoadedDevice:](self, "addLoadedDevice:", v23);
        -[AXHearingAidDeviceController addAvailableDevice:](self, "addAvailableDevice:", v23);
LABEL_31:

        goto LABEL_32;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[AXHearingAidDevice initWithPersistentRepresentation:]([AXHearingAidDevice alloc], "initWithPersistentRepresentation:", v4);
      -[AXHearingAidDevice deviceUUID](v26, "deviceUUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXHearingAidDeviceController hearingAidForDeviceID:](self, "hearingAidForDeviceID:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        v29 = v28;

        v26 = v29;
      }
      else if (!v26)
      {
        goto LABEL_17;
      }
      if (-[AXHearingAidDevice didLoadPersistentProperties](v26, "didLoadPersistentProperties"))
      {
        -[AXHearingAidDeviceController persistentDevices](self, "persistentDevices");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setArray:", v31);

        -[AXHearingAidDeviceController addLoadedDevice:](self, "addLoadedDevice:", v26);
        -[AXHearingAidDeviceController addAvailableDevice:](self, "addAvailableDevice:", v26);
LABEL_18:
        -[AXHearingAidDevice leftPeripheralUUID](v26, "leftPeripheralUUID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          -[AXHearingAidDevice leftPeripheralUUID](v26, "leftPeripheralUUID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v34);

        }
        v62 = v28;
        -[AXHearingAidDevice rightPeripheralUUID](v26, "rightPeripheralUUID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          -[AXHearingAidDevice rightPeripheralUUID](v26, "rightPeripheralUUID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v36);

        }
        HAInitializeLogging();
        v37 = (void *)MEMORY[0x1E0CB3940];
        -[AXHearingAidDeviceController persistentDevices](self, "persistentDevices");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "stringWithFormat:", CFSTR("Persistent device %@, %@"), v26, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController pairedHearingAidsDidChange]", 1489, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)*MEMORY[0x1E0D2F928];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
        {
          v42 = objc_retainAutorelease(v40);
          v43 = v41;
          v44 = objc_msgSend(v42, "UTF8String");
          *(_DWORD *)buf = 136446210;
          v73 = v44;
          _os_log_impl(&dword_1DE311000, v43, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

        }
        -[AXHearingAidDeviceController connectedDevices](self, "connectedDevices");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = MEMORY[0x1E0C809B0];
        v68[0] = MEMORY[0x1E0C809B0];
        v68[1] = 3221225472;
        v68[2] = __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke_172;
        v68[3] = &unk_1EA8EA260;
        v23 = v25;
        v69 = v23;
        objc_msgSend(v45, "enumerateObjectsUsingBlock:", v68);

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v66[0] = v46;
        v66[1] = 3221225472;
        v66[2] = __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke_3_174;
        v66[3] = &unk_1EA8EA558;
        v47 = (id)objc_claimAutoreleasedReturnValue();
        v67 = v47;
        -[AXFakeHearingAidDevice enumerateObjectsUsingBlock:](v23, "enumerateObjectsUsingBlock:", v66);
        if (objc_msgSend(v47, "count"))
        {
          v63[0] = v46;
          v63[1] = 3221225472;
          v63[2] = __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke_4;
          v63[3] = &unk_1EA8E9C00;
          v63[4] = self;
          v64 = v47;
          v65 = v26;
          -[AXHearingAidDeviceController sendRequestToCentralManager:](self, "sendRequestToCentralManager:", v63);

          v48 = v62;
        }
        else
        {
          +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "isiCloudPaired");

          v48 = v62;
          if ((v50 & 1) == 0)
          {
            HAInitializeLogging();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No BT identifiers %@, unpairing rep %@"), v23, v4);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController pairedHearingAidsDidChange]", 1543, v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = (void *)*MEMORY[0x1E0D2F928];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
            {
              v61 = v51;
              v54 = objc_retainAutorelease(v52);
              v55 = v53;
              v56 = v54;
              v51 = v61;
              v57 = objc_msgSend(v56, "UTF8String");
              *(_DWORD *)buf = 136446210;
              v73 = v57;
              _os_log_impl(&dword_1DE311000, v55, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

            }
            +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "setPairedHearingAids:", 0);

            -[AXHearingAidDeviceController persistentDevices](self, "persistentDevices");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "firstObject");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "disconnectAndUnpair:", 1);

            -[AXHearingAidDeviceController searchForAvailableDevices](self, "searchForAvailableDevices");
          }
        }

        goto LABEL_31;
      }
LABEL_17:
      -[AXHearingAidDevice disconnectAndUnpair:](v26, "disconnectAndUnpair:", 1);
      +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setPairedHearingAids:", 0);

      goto LABEL_18;
    }
  }
  objc_msgSend(v4, "valueForKey:", CFSTR("HAFakeSearch"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if (v13)
  {
    v14 = -[AXFakeHearingAidDevice initWithDeviceType:]([AXFakeHearingAidDevice alloc], "initWithDeviceType:", 2);
    -[AXHearingAidDeviceController addLoadedDevice:](self, "addLoadedDevice:", v14);
    -[AXHearingAidDeviceController addAvailableDevice:](self, "addAvailableDevice:", v14);
    v15 = -[AXFakeHearingAidDevice initWithDeviceType:]([AXFakeHearingAidDevice alloc], "initWithDeviceType:", 4);

    -[AXHearingAidDeviceController addLoadedDevice:](self, "addLoadedDevice:", v15);
    -[AXHearingAidDeviceController addAvailableDevice:](self, "addAvailableDevice:", v15);
    v16 = -[AXFakeHearingAidDevice initWithDeviceType:]([AXFakeHearingAidDevice alloc], "initWithDeviceType:", 8);

    -[AXHearingAidDeviceController addLoadedDevice:](self, "addLoadedDevice:", v16);
    -[AXHearingAidDeviceController addAvailableDevice:](self, "addAvailableDevice:", v16);
    v17 = -[AXFakeHearingAidDevice initWithDeviceType:]([AXFakeHearingAidDevice alloc], "initWithDeviceType:", 64);

    -[AXHearingAidDeviceController addLoadedDevice:](self, "addLoadedDevice:", v17);
    -[AXHearingAidDeviceController addAvailableDevice:](self, "addAvailableDevice:", v17);

  }
LABEL_33:

}

uint64_t __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "persistentDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke_2;
  v4[3] = &unk_1EA8EA260;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);

  return AXPerformBlockOnMainThread();
}

void __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "disconnectAndUnpair:", 1);
  objc_msgSend(*(id *)(a1 + 32), "removeLoadedDevice:", v3);
  objc_msgSend(*(id *)(a1 + 32), "removeAvailableDevice:", v3);
  objc_msgSend(v3, "setIsPaired:", 0);

}

uint64_t __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "persistentDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  return objc_msgSend(*(id *)(a1 + 32), "loadedDevicesDidChange");
}

void __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke_172(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke_2_173;
  v7[3] = &unk_1EA8EA530;
  v8 = v3;
  v6 = v3;
  v5 = objc_msgSend(v4, "indexOfObjectPassingTest:", v7);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v6, "disconnectAndUnpair:", 1);
  objc_msgSend(v6, "setIsPaired:", v5 != 0x7FFFFFFFFFFFFFFFLL);

}

uint64_t __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke_2_173(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsPeripheralWithUUID:", a2);
}

void __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke_3_174(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3A28];
  v4 = a2;
  v6 = (id)objc_msgSend([v3 alloc], "initWithUUIDString:", v4);

  v5 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    v5 = v6;
  }

}

void __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "retrievePeripheralsWithIdentifiers:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke_177;
    v15[3] = &unk_1EA8EA558;
    v16 = *(id *)(a1 + 48);
    objc_msgSend(v2, "enumerateObjectsUsingBlock:", v15);
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isiCloudPaired");

    if (v4)
    {
      +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "persistentRepresentation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPairedHearingAids:", v6);

    }
    objc_msgSend(*(id *)(a1 + 32), "centralManager:didRetrievePeripherals:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), v2);

  }
  else
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No BT peripherals with identifiers, unpairing %@"), *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController pairedHearingAidsDidChange]_block_invoke_4", 1522, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_retainAutorelease(v8);
      v11 = v9;
      *(_DWORD *)buf = 136446210;
      v18 = objc_msgSend(v10, "UTF8String");
      _os_log_impl(&dword_1DE311000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPairedHearingAids:", 0);

    objc_msgSend(*(id *)(a1 + 32), "persistentDevices");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "disconnectAndUnpair:", 1);

    objc_msgSend(*(id *)(a1 + 32), "searchForAvailableDevices");
  }

}

void __58__AXHearingAidDeviceController_pairedHearingAidsDidChange__block_invoke_177(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  LODWORD(v2) = objc_msgSend(v2, "addPeripheral:", v3);
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Adding peripheral to device [%d] %@"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDeviceController pairedHearingAidsDidChange]_block_invoke", 1531, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v5);
    v8 = v6;
    *(_DWORD *)buf = 136446210;
    v10 = objc_msgSend(v7, "UTF8String");
    _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

- (id)valueForProperty:(unint64_t)a3 forDeviceID:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[AXHearingAidDeviceController hearingAidForDeviceID:](self, "hearingAidForDeviceID:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "valueForProperty:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)representsLocalDevices
{
  return 1;
}

- (NSMutableArray)availablePeripherals
{
  return self->_availablePeripherals;
}

- (void)setAvailablePeripherals:(id)a3
{
  objc_storeStrong((id *)&self->_availablePeripherals, a3);
}

- (NSMutableArray)loadedDevices
{
  return (NSMutableArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setLoadedDevices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSMutableArray)connectedDevices
{
  return self->_connectedDevices;
}

- (void)setConnectedDevices:(id)a3
{
  objc_storeStrong((id *)&self->_connectedDevices, a3);
}

- (NSMutableArray)centralRequestBlocks
{
  return self->centralRequestBlocks;
}

- (void)setCentralRequestBlocks:(id)a3
{
  objc_storeStrong((id *)&self->centralRequestBlocks, a3);
}

- (NSMutableArray)availableSearchBlocks
{
  return self->_availableSearchBlocks;
}

- (void)setAvailableSearchBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_availableSearchBlocks, a3);
}

- (NSMutableArray)connectedSearchBlocks
{
  return self->_connectedSearchBlocks;
}

- (void)setConnectedSearchBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_connectedSearchBlocks, a3);
}

- (NSMutableArray)updateDeviceBlocks
{
  return self->_updateDeviceBlocks;
}

- (void)setUpdateDeviceBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_updateDeviceBlocks, a3);
}

- (NSMutableArray)persistentDevices
{
  return self->_persistentDevices;
}

- (void)setPersistentDevices:(id)a3
{
  objc_storeStrong((id *)&self->_persistentDevices, a3);
}

- (BOOL)shouldActiveScan
{
  return self->_shouldActiveScan;
}

- (void)setShouldActiveScan:(BOOL)a3
{
  self->_shouldActiveScan = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentDevices, 0);
  objc_storeStrong((id *)&self->centralRequestBlocks, 0);
  objc_storeStrong((id *)&self->_connectedDevices, 0);
  objc_storeStrong((id *)&self->_loadedDevices, 0);
  objc_storeStrong((id *)&self->_availablePeripherals, 0);
  objc_storeStrong((id *)&self->_availableDeviceTimer, 0);
  objc_storeStrong((id *)&self->_advertisingTimestamps, 0);
  objc_storeStrong((id *)&self->_advertisingTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_deviceUpdatesDescription, 0);
  objc_storeStrong((id *)&self->_deviceUpdatesQueue, 0);
  objc_storeStrong((id *)&self->_updateDeviceBlocks, 0);
  objc_storeStrong((id *)&self->_connectedSearchBlocks, 0);
  objc_storeStrong((id *)&self->_availableSearchBlocks, 0);
  objc_storeStrong((id *)&self->_bluetoothCentralQueue, 0);
  objc_storeStrong((id *)&self->_centralRequestsLock, 0);
  objc_storeStrong((id *)&self->_bluetoothManager, 0);
}

void __44__AXHearingAidDeviceController_isConnecting__block_invoke_cold_1(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  objc_msgSend(a1, "rightPeripheral");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "descriptionForCBPeripheralState:", objc_msgSend(v2, "state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rightPeripheral");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1DE311000, v6, v7, "rightPeripheral state: %@ %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_0_0();
}

void __44__AXHearingAidDeviceController_isConnecting__block_invoke_cold_2(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  objc_msgSend(a1, "leftPeripheral");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "descriptionForCBPeripheralState:", objc_msgSend(v2, "state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "leftPeripheral");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1DE311000, v6, v7, "leftPeripheral state: %@ %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_0_0();
}

@end
