@implementation CRVehicleAccessoryManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_21);
  return (id)sharedInstance_sInstance;
}

void __43__CRVehicleAccessoryManager_sharedInstance__block_invoke()
{
  CRVehicleAccessoryManager *v0;
  void *v1;

  v0 = objc_alloc_init(CRVehicleAccessoryManager);
  v1 = (void *)sharedInstance_sInstance;
  sharedInstance_sInstance = (uint64_t)v0;

}

+ (id)vehicleAccessQueue
{
  if (vehicleAccessQueue_onceToken != -1)
    dispatch_once(&vehicleAccessQueue_onceToken, &__block_literal_global_272);
  return (id)vehicleAccessQueue___vehicleQueue;
}

void __47__CRVehicleAccessoryManager_vehicleAccessQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.carkit.vehicleAccessoryManager", v2);
  v1 = (void *)vehicleAccessQueue___vehicleQueue;
  vehicleAccessQueue___vehicleQueue = (uint64_t)v0;

}

+ (id)managerInfoDataCache
{
  if (managerInfoDataCache_onceToken != -1)
    dispatch_once(&managerInfoDataCache_onceToken, &__block_literal_global_274);
  return (id)managerInfoDataCache___dictionary;
}

void __49__CRVehicleAccessoryManager_managerInfoDataCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)managerInfoDataCache___dictionary;
  managerInfoDataCache___dictionary = v0;

}

+ (BOOL)_isValidAccessoryMacAddress:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("00:00:00:00:00:00")) ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

+ (BOOL)_isVehicleAccessory:(id)a3
{
  return objc_msgSend(a3, "supportsCarPlay");
}

+ (id)_certificateSerialNumberForAccessory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t (*v7)(void *);
  NSObject *v8;
  id v9;
  _Unwind_Exception *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "certData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v5 = (void *)objc_msgSend(v5, "length");
      if (v5)
      {
        v13 = 0;
        v14 = &v13;
        v15 = 0x2020000000;
        v7 = (uint64_t (*)(void *))getMFAACreateCertificateSerialNumberSymbolLoc_ptr;
        v16 = getMFAACreateCertificateSerialNumberSymbolLoc_ptr;
        if (!getMFAACreateCertificateSerialNumberSymbolLoc_ptr)
        {
          v12[0] = MEMORY[0x1E0C809B0];
          v12[1] = 3221225472;
          v12[2] = __getMFAACreateCertificateSerialNumberSymbolLoc_block_invoke;
          v12[3] = &unk_1E5428AD0;
          v12[4] = &v13;
          __getMFAACreateCertificateSerialNumberSymbolLoc_block_invoke((uint64_t)v12);
          v7 = (uint64_t (*)(void *))v14[3];
        }
        _Block_object_dispose(&v13, 8);
        if (!v7)
        {
          v11 = (_Unwind_Exception *)-[CRCarPlayAppPolicyEvaluator effectivePolicyForAppDeclaration:inVehicleWithCertificateSerial:].cold.1();
          _Block_object_dispose(&v13, 8);
          _Unwind_Resume(v11);
        }
        v5 = (void *)v7(v6);
        if (!v5)
        {
          CarGeneralLogging();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            +[CRVehicleAccessoryManager _certificateSerialNumberForAccessory:].cold.2(v8);

          v5 = 0;
        }
      }
    }
    v9 = v5;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (CRVehicleAccessoryManager)init
{
  CRVehicleAccessoryManager *v2;
  CARObserverHashTable *v3;
  CARObserverHashTable *observers;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CRVehicleAccessoryManager;
  v2 = -[CRVehicleAccessoryManager init](&v12, sel_init);
  if (v2)
  {
    v3 = -[CARObserverHashTable initWithProtocol:]([CARObserverHashTable alloc], "initWithProtocol:", &unk_1EE9AC558);
    observers = v2->_observers;
    v2->_observers = v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicleAccessoryManager setVehiclesBySerialNumber:](v2, "setVehiclesBySerialNumber:", v5);

    objc_msgSend(MEMORY[0x1E0CAA650], "sharedAccessoryManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicleAccessoryManager setAccessoryManager:](v2, "setAccessoryManager:", v6);

    -[CRVehicleAccessoryManager accessoryManager](v2, "accessoryManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerForLocalNotifications");

    objc_initWeak(&location, v2);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __33__CRVehicleAccessoryManager_init__block_invoke;
    v9[3] = &unk_1E5428130;
    objc_copyWeak(&v10, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __33__CRVehicleAccessoryManager_init__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained(v1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v6, sel_handleAccessoryConnect_, *MEMORY[0x1E0CAA618], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v6, sel_handleAccessoryDisconnect_, *MEMORY[0x1E0CAA620], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v6, sel_handleAccessoryInformationUpdate_, *MEMORY[0x1E0CAA630], 0);

    objc_msgSend(v6, "_primeConnectedVehicleAccessories");
  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[CRVehicleAccessoryManager accessoryManager](self, "accessoryManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterForLocalNotifications");

  v5.receiver = self;
  v5.super_class = (Class)CRVehicleAccessoryManager;
  -[CRVehicleAccessoryManager dealloc](&v5, sel_dealloc);
}

- (void)setVehicleAccessoryDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_vehicleAccessoryDelegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    if (obj)
      -[CRVehicleAccessoryManager addObserver:](self, "addObserver:", obj);
    v6 = objc_loadWeakRetained((id *)&self->_vehicleAccessoryDelegate);

    if (v6)
    {
      v7 = objc_loadWeakRetained((id *)&self->_vehicleAccessoryDelegate);
      -[CRVehicleAccessoryManager removeObserver:](self, "removeObserver:", v7);

    }
    objc_storeWeak((id *)&self->_vehicleAccessoryDelegate, obj);
    v5 = obj;
  }

}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRVehicleAccessoryManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRVehicleAccessoryManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)_primeConnectedVehicleAccessories
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CRVehicleAccessoryManager connectedAccessories](self, "connectedAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = -[CRVehicleAccessoryManager _vehicleForAccessory:](self, "_vehicleForAccessory:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (id)_vehicleForAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  _QWORD v10[5];
  NSObject *v11;
  id v12;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "_isVehicleAccessory:", v4) & 1) == 0)
  {
    CarGeneralLogging();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_DEFAULT, "Accessory %@ does not support CarPlay", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_9;
  }
  objc_msgSend((id)objc_opt_class(), "_certificateSerialNumberForAccessory:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    CarGeneralLogging();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CRVehicleAccessoryManager _vehicleForAccessory:].cold.1((uint64_t)v4, v8);

LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2;
  v17 = __Block_byref_object_dispose__2;
  v18 = 0;
  objc_msgSend((id)objc_opt_class(), "vehicleAccessQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__CRVehicleAccessoryManager__vehicleForAccessory___block_invoke;
  v10[3] = &unk_1E54293A0;
  p_buf = &buf;
  v10[4] = self;
  v5 = v5;
  v11 = v5;
  v12 = v4;
  dispatch_sync(v6, v10);

  v7 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

LABEL_10:
  return v7;
}

void __50__CRVehicleAccessoryManager__vehicleForAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  CRVehicleAccessory *v10;
  uint64_t v11;
  void *v12;
  uint64_t *v13;
  void *v14;
  NSObject *v15;

  objc_msgSend(*(id *)(a1 + 32), "vehiclesBySerialNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v6)
  {
    objc_msgSend(v6, "connectionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");
    v9 = objc_msgSend(*(id *)(a1 + 48), "connectionID");

    if (v8 != v9)
      objc_msgSend(*(id *)(a1 + 32), "_updateVehicle:usingAccessory:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v10 = objc_alloc_init(CRVehicleAccessory);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCertificateSerialNumber:", *(_QWORD *)(a1 + 40));
    v13 = (uint64_t *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "_updateVehicle:usingAccessory:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "vehiclesBySerialNumber");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 40));

    CarGeneralLogging();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __50__CRVehicleAccessoryManager__vehicleForAccessory___block_invoke_cold_1(v13, v15);

  }
}

- (void)_updateVehicle:(id)a3 usingAccessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unsigned int v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  int v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setAccessory:", v7);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "connectionID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConnectionID:", v8);

  -[CRVehicleAccessoryManager _vehicleInfoDataForAccessory:](self, "_vehicleInfoDataForAccessory:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVehicleInfoDataCache:", v9);

  objc_msgSend(v6, "_updateName");
  objc_msgSend(v7, "protocolStrings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v6, "setAccessoryProtocols:", v10);
  objc_msgSend(v7, "macAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "_isValidAccessoryMacAddress:", v11))
  {
    objc_msgSend(v7, "macAddress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBluetoothAddress:", v12);

  }
  else
  {
    objc_msgSend(v6, "setBluetoothAddress:", 0);
  }
  objc_msgSend(v6, "setTransportType:", +[CRVehicleAccessory _transportTypeForExternalAccessoryTransportType:](CRVehicleAccessory, "_transportTypeForExternalAccessoryTransportType:", objc_msgSend(v7, "transportType")));
  if (CRIsInternalInstall())
  {
    objc_msgSend(v7, "modelNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v6, "setVehicleModelName:", v13);

  }
  objc_msgSend(v6, "setSupportsUSBCarPlay:", objc_msgSend(v7, "supportsUSBCarPlay"));
  objc_msgSend(v6, "setSupportsWirelessCarPlay:", objc_msgSend(v7, "supportsWirelessCarPlay"));
  if ((objc_msgSend(v7, "supportsOOBBTPairing") & 1) != 0)
    v14 = 1;
  else
    v14 = objc_msgSend(v7, "supportsOOBBTPairing2");
  objc_msgSend(v6, "setSupportsWiredBluetoothPairing:", v14);
  objc_msgSend(v6, "setSupportsCarPlayConnectionRequest:", objc_msgSend(v7, "supportsCarPlayConnectionRequest"));
  objc_msgSend(v6, "setSupportsBluetoothLE:", 0);
  v15 = objc_msgSend(v7, "accessoryCapabilities");
  CarGeneralLogging();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = CFSTR("NO");
    if ((v15 & 0x200000) != 0)
      v17 = CFSTR("YES");
    v19 = 138543362;
    v20 = v17;
    _os_log_impl(&dword_1A83A2000, v16, OS_LOG_TYPE_DEFAULT, "vehicle supports theme assets: %{public}@", (uint8_t *)&v19, 0xCu);
  }

  objc_msgSend(v6, "setSupportsThemeAssets:", (v15 >> 21) & 1);
  objc_msgSend(v6, "setSupportsEnhancedIntegration:", objc_msgSend(v7, "supportsCarPlayAppLinks"));
  objc_msgSend(v7, "ppid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPPID:", v18);

}

- (id)_vehicleInfoDataForAccessory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "certificateSerialNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "managerInfoDataCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    CarGeneralLogging();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        v16 = 138412290;
        v17 = v4;
        _os_log_impl(&dword_1A83A2000, v7, OS_LOG_TYPE_DEFAULT, "Fetched Vehicle Info data from cache for %@", (uint8_t *)&v16, 0xCu);
      }

      v9 = v6;
    }
    else
    {
      if (v8)
      {
        v16 = 138412290;
        v17 = v4;
        _os_log_impl(&dword_1A83A2000, v7, OS_LOG_TYPE_DEFAULT, "Fetching Vehicle Info data from accessory for %@", (uint8_t *)&v16, 0xCu);
      }

      objc_msgSend(v3, "accessory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "getVehicleInfoData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend((id)objc_opt_class(), "managerInfoDataCache");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v13, v4);

      }
      v9 = v13;
    }
    v10 = v9;
    v11 = v9;
  }
  else
  {
    CarGeneralLogging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v3;
      _os_log_impl(&dword_1A83A2000, v10, OS_LOG_TYPE_DEFAULT, "No available serial for Vehicle Info data request for %@", (uint8_t *)&v16, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

- (void)handleAccessoryConnect:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  _QWORD v11[6];
  _QWORD v12[6];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CAA628]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRVehicleAccessoryManager _vehicleForAccessory:](self, "_vehicleForAccessory:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __52__CRVehicleAccessoryManager_handleAccessoryConnect___block_invoke;
    v12[3] = &unk_1E5427D20;
    v12[4] = self;
    v8 = (id *)v12;
    v9 = (void *)v6;
LABEL_5:
    v8[5] = v9;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

    goto LABEL_6;
  }
  objc_msgSend(v5, "macAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __52__CRVehicleAccessoryManager_handleAccessoryConnect___block_invoke_2;
    v11[3] = &unk_1E5427D20;
    v11[4] = self;
    v8 = (id *)v11;
    v9 = v5;
    goto LABEL_5;
  }
LABEL_6:

}

void __52__CRVehicleAccessoryManager_handleAccessoryConnect___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryManager:didConnectVehicleAccessory:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __52__CRVehicleAccessoryManager_handleAccessoryConnect___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "macAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryManager:didConnectUnsupportedAccessoryWithBluetoothAddress:", v2, v3);

}

- (void)handleAccessoryDisconnect:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[6];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CAA628]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "connectionID");
  objc_msgSend((id)objc_opt_class(), "vehicleAccessQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__CRVehicleAccessoryManager_handleAccessoryDisconnect___block_invoke;
  v8[3] = &unk_1E54293C8;
  v8[4] = self;
  v8[5] = v6;
  dispatch_async(v7, v8);

}

void __55__CRVehicleAccessoryManager_handleAccessoryDisconnect___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "vehiclesBySerialNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
      objc_msgSend(v8, "connectionID");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(v8, "connectionID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "unsignedIntegerValue");
        v13 = *(_QWORD *)(a1 + 40);

        if (v12 == v13)
          break;
      }
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_13;
      }
    }
    v14 = v8;

    if (!v14)
      return;
    objc_msgSend(v14, "setConnectionID:", 0);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __55__CRVehicleAccessoryManager_handleAccessoryDisconnect___block_invoke_2;
    v15[3] = &unk_1E5427D20;
    v15[4] = *(_QWORD *)(a1 + 32);
    v16 = v14;
    v3 = v14;
    dispatch_async(MEMORY[0x1E0C80D38], v15);

  }
LABEL_13:

}

void __55__CRVehicleAccessoryManager_handleAccessoryDisconnect___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryManager:didDisconnectVehicleAccessory:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)handleAccessoryInformationUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CRVehicleAccessoryManager *v9;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "vehicleAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__CRVehicleAccessoryManager_handleAccessoryInformationUpdate___block_invoke;
  v7[3] = &unk_1E5427D20;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __62__CRVehicleAccessoryManager_handleAccessoryInformationUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CAA628]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_vehicleForAccessory:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "certificateSerialNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "managerInfoDataCache");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "certificateSerialNumber");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectForKey:", v8);

    }
    objc_msgSend(*(id *)(a1 + 40), "_vehicleInfoDataForAccessory:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setVehicleInfoDataCache:", v9);

    if (objc_msgSend(v5, "_updateName"))
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __62__CRVehicleAccessoryManager_handleAccessoryInformationUpdate___block_invoke_2;
      v10[3] = &unk_1E5427D20;
      v10[4] = *(_QWORD *)(a1 + 40);
      v11 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], v10);

    }
  }

}

void __62__CRVehicleAccessoryManager_handleAccessoryInformationUpdate___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryManager:didUpdateVehicleAccessory:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)connectedAccessories
{
  void *v2;
  void *v3;

  -[CRVehicleAccessoryManager accessoryManager](self, "accessoryManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectedAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)connectedVehicleAccessories
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[CRVehicleAccessoryManager connectedAccessories](self, "connectedAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[CRVehicleAccessoryManager _vehicleForAccessory:](self, "_vehicleForAccessory:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)vehicleAccessoryForCertificateSerial:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  objc_msgSend((id)objc_opt_class(), "vehicleAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CRVehicleAccessoryManager_vehicleAccessoryForCertificateSerial___block_invoke;
  block[3] = &unk_1E54293F0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __66__CRVehicleAccessoryManager_vehicleAccessoryForCertificateSerial___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "vehiclesBySerialNumber");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)vehicleAccessoryForiAPConnectionIdentifier:(unint64_t)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[CRVehicleAccessoryManager connectedAccessories](self, "connectedAccessories");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
      if (objc_msgSend(v10, "connectionID", (_QWORD)v15) == a3)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v11 = v10;

    if (!v11)
      goto LABEL_12;
    -[CRVehicleAccessoryManager _vehicleForAccessory:](self, "_vehicleForAccessory:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_9:

    v11 = 0;
LABEL_12:
    v12 = 0;
  }
  v13 = v12;

  return v13;
}

- (CRVehicleAccessoryManagerDelegate)vehicleAccessoryDelegate
{
  return (CRVehicleAccessoryManagerDelegate *)objc_loadWeakRetained((id *)&self->_vehicleAccessoryDelegate);
}

- (EAAccessoryManager)accessoryManager
{
  return self->_accessoryManager;
}

- (void)setAccessoryManager:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryManager, a3);
}

- (NSMutableDictionary)vehiclesBySerialNumber
{
  return self->_vehiclesBySerialNumber;
}

- (void)setVehiclesBySerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_vehiclesBySerialNumber, a3);
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_vehiclesBySerialNumber, 0);
  objc_storeStrong((id *)&self->_accessoryManager, 0);
  objc_destroyWeak((id *)&self->_vehicleAccessoryDelegate);
}

+ (void)_certificateSerialNumberForAccessory:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A83A2000, log, OS_LOG_TYPE_ERROR, "Unable to get certificate serial data.", v1, 2u);
}

- (void)_vehicleForAccessory:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A83A2000, a2, OS_LOG_TYPE_ERROR, "Accessory %@ does not have a certificate serial number", (uint8_t *)&v2, 0xCu);
}

void __50__CRVehicleAccessoryManager__vehicleForAccessory___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1A83A2000, a2, OS_LOG_TYPE_DEBUG, "Accessory %@ added to vehiclesBySerialNumber", (uint8_t *)&v3, 0xCu);
}

@end
