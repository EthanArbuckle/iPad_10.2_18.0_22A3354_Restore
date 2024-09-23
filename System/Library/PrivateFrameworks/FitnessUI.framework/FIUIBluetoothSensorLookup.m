@implementation FIUIBluetoothSensorLookup

+ (id)didUpdateBTSensorSeenStatus
{
  return CFSTR("DidUpdateBTSensorSeenStatus");
}

+ (BOOL)hasHadPairedCyclingSpeedSensors
{
  void *v2;
  char v3;

  objc_msgSend(a1, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasHadPairedCyclingSpeedSensors");

  return v3;
}

+ (BOOL)hasHadPairedCyclingCadenceSensors
{
  void *v2;
  char v3;

  objc_msgSend(a1, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasHadPairedCyclingCadenceSensors");

  return v3;
}

+ (BOOL)hasHadPairedCyclingPowerSensors
{
  void *v2;
  char v3;

  objc_msgSend(a1, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasHadPairedCyclingPowerSensors");

  return v3;
}

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_5);
  return (id)shared___shared;
}

void __35__FIUIBluetoothSensorLookup_shared__block_invoke()
{
  FIUIBluetoothSensorLookup *v0;
  void *v1;

  v0 = objc_alloc_init(FIUIBluetoothSensorLookup);
  v1 = (void *)shared___shared;
  shared___shared = (uint64_t)v0;

}

- (FIUIBluetoothSensorLookup)init
{
  FIUIBluetoothSensorLookup *v2;
  dispatch_queue_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FIUIBluetoothSensorLookup;
  v2 = -[FIUIBluetoothSensorLookup init](&v5, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("BTSensorLookup", 0);
    -[FIUIBluetoothSensorLookup setQueue:](v2, "setQueue:", v3);

    -[FIUIBluetoothSensorLookup setPendingTypes:](v2, "setPendingTypes:", 0);
  }
  return v2;
}

- (BOOL)hasHadPairedCyclingSpeedSensors
{
  return 1;
}

- (BOOL)hasHadPairedCyclingCadenceSensors
{
  return 1;
}

- (BOOL)hasHadPairedCyclingPowerSensors
{
  return 1;
}

- (BOOL)hideBluetoothPowerAlert
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("CyclingHideBluetoothPowerAlert"));

  return v3;
}

- (void)_spinUpCheck
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[FIUIBluetoothSensorLookup queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__FIUIBluetoothSensorLookup__spinUpCheck__block_invoke;
  v4[3] = &unk_24CF30408;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __41__FIUIBluetoothSensorLookup__spinUpCheck__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queueSpinUpBTCheck:", 7);

}

- (void)_queueSpinUpBTCheck:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  os_log_t *v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t v21[8];
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  -[FIUIBluetoothSensorLookup queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[FIUIBluetoothSensorLookup setPendingTypes:](self, "setPendingTypes:", -[FIUIBluetoothSensorLookup pendingTypes](self, "pendingTypes") | a3);
  -[FIUIBluetoothSensorLookup centralManager](self, "centralManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FIUIBluetoothSensorLookup centralManager](self, "centralManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "state");

    if (v8 == 5)
    {
      -[FIUIBluetoothSensorLookup _queueCheckForPeripherals](self, "_queueCheckForPeripherals");
    }
    else
    {
      _HKInitializeLogging();
      v15 = *MEMORY[0x24BDD3078];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_21307C000, v15, OS_LOG_TYPE_DEFAULT, "[Bluetooth] Waiting for CBCentralManager to power on", v21, 2u);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    v9 = (os_log_t *)MEMORY[0x24BDD3078];
    v10 = *MEMORY[0x24BDD3078];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_21307C000, v10, OS_LOG_TYPE_DEFAULT, "[Bluetooth] Powering up CBCentralManager", v21, 2u);
    }
    v11 = objc_msgSend(MEMORY[0x24BEBD3C8], "isRunningInStoreDemoMode");
    if (-[FIUIBluetoothSensorLookup hideBluetoothPowerAlert](self, "hideBluetoothPowerAlert"))
    {
      _HKInitializeLogging();
      v12 = *v9;
      v13 = os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT);
      v14 = 0;
      if (v13)
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_21307C000, v12, OS_LOG_TYPE_DEFAULT, "[Bluetooth] Always hiding Bluetooth Power Alert, overriden in defaults", v21, 2u);
        v14 = 0;
      }
    }
    else
    {
      v14 = v11 ^ 1u;
    }
    v16 = objc_alloc(MEMORY[0x24BDBB220]);
    -[FIUIBluetoothSensorLookup queue](self, "queue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x24BDBB040];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v16, "initWithDelegate:queue:options:", self, v17, v19);
    -[FIUIBluetoothSensorLookup setCentralManager:](self, "setCentralManager:", v20);

  }
}

- (BOOL)testAndSetPeripheral:(id)a3 forTag:(id)a4 defaultsKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  char v12;
  BOOL v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!objc_msgSend(v7, "hasTag:", v8))
    goto LABEL_5;
  _HKInitializeLogging();
  v10 = *MEMORY[0x24BDD3078];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412546;
    v16 = v8;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_21307C000, v10, OS_LOG_TYPE_DEFAULT, "[Bluetooth] Did find %@ peripheral %@", (uint8_t *)&v15, 0x16u);
  }
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLForKey:", v9);

  if ((v12 & 1) == 0)
  {
    v13 = 1;
    objc_msgSend(MEMORY[0x24BDBCF50], "fu_backupAndSetBool:forKey:", 1, v9);
  }
  else
  {
LABEL_5:
    v13 = 0;
  }

  return v13;
}

- (void)_queueCheckForPeripherals
{
  NSObject *v3;
  int64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[6];
  uint8_t buf[16];

  -[FIUIBluetoothSensorLookup queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = -[FIUIBluetoothSensorLookup pendingTypes](self, "pendingTypes");
  -[FIUIBluetoothSensorLookup setPendingTypes:](self, "setPendingTypes:", 0);
  -[FIUIBluetoothSensorLookup centralManager](self, "centralManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FIUIBluetoothSensorLookup centralManager](self, "centralManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __54__FIUIBluetoothSensorLookup__queueCheckForPeripherals__block_invoke;
    v8[3] = &unk_24CF30D48;
    v8[4] = self;
    v8[5] = v4;
    objc_msgSend(v6, "retrievePeripheralsWithCustomProperties:completion:", &unk_24CF4EF18, v8);

  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x24BDD3078];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21307C000, v7, OS_LOG_TYPE_DEFAULT, "[Bluetooth] CBCentralManager has gone away before we could check", buf, 2u);
    }
  }
}

void __54__FIUIBluetoothSensorLookup__queueCheckForPeripherals__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint8_t buf[16];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x24BDD3078];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_ERROR))
      __54__FIUIBluetoothSensorLookup__queueCheckForPeripherals__block_invoke_cold_1((uint64_t)v6, v7);
    goto LABEL_26;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v8)
    goto LABEL_23;
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v26;
  v12 = *MEMORY[0x24BDD33E8];
  v13 = *MEMORY[0x24BDD33D0];
  v14 = *MEMORY[0x24BDD33E0];
  do
  {
    v15 = 0;
    do
    {
      if (*(_QWORD *)v26 != v11)
        objc_enumerationMutation(v5);
      v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v15);
      v17 = *(_QWORD *)(a1 + 40);
      if ((v17 & 1) != 0)
      {
        v10 |= objc_msgSend(*(id *)(a1 + 32), "testAndSetPeripheral:forTag:defaultsKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v15), v12, CFSTR("CyclingSpeedSensorWasConnected"));
        v17 = *(_QWORD *)(a1 + 40);
        if ((v17 & 2) == 0)
        {
LABEL_11:
          if ((v17 & 1) == 0)
            goto LABEL_13;
LABEL_12:
          v10 |= objc_msgSend(*(id *)(a1 + 32), "testAndSetPeripheral:forTag:defaultsKey:", v16, v14, CFSTR("CyclingPowerSensorWasConnected"));
          goto LABEL_13;
        }
      }
      else if ((v17 & 2) == 0)
      {
        goto LABEL_11;
      }
      v10 |= objc_msgSend(*(id *)(a1 + 32), "testAndSetPeripheral:forTag:defaultsKey:", v16, v13, CFSTR("CyclingCadenceSensorWasConnected"));
      if ((*(_QWORD *)(a1 + 40) & 1) != 0)
        goto LABEL_12;
LABEL_13:
      ++v15;
    }
    while (v9 != v15);
    v18 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    v9 = v18;
  }
  while (v18);
  v6 = 0;
  if ((v10 & 1) != 0)
  {
    _HKInitializeLogging();
    v19 = *MEMORY[0x24BDD3078];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21307C000, v19, OS_LOG_TYPE_DEFAULT, "[Bluetooth] Posting update notification", buf, 2u);
    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "didUpdateBTSensorSeenStatus");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "postNotificationName:object:", v21, *(_QWORD *)(a1 + 32));

  }
LABEL_23:
  _HKInitializeLogging();
  v22 = *MEMORY[0x24BDD3078];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21307C000, v22, OS_LOG_TYPE_DEFAULT, "[Bluetooth] Removing reference to CBCentralManager.", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "centralManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setDelegate:", 0);

  objc_msgSend(*(id *)(a1 + 32), "setCentralManager:", 0);
LABEL_26:

}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;

  v4 = a3;
  -[FIUIBluetoothSensorLookup queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = objc_msgSend(v4, "state");
  if (v6 == 5)
    -[FIUIBluetoothSensorLookup _queueCheckForPeripherals](self, "_queueCheckForPeripherals");
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (int64_t)pendingTypes
{
  return self->_pendingTypes;
}

- (void)setPendingTypes:(int64_t)a3
{
  self->_pendingTypes = a3;
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
  objc_storeStrong((id *)&self->_centralManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __54__FIUIBluetoothSensorLookup__queueCheckForPeripherals__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21307C000, a2, OS_LOG_TYPE_ERROR, "[Bluetooth] Error retrieving peripherals: %@", (uint8_t *)&v2, 0xCu);
}

@end
