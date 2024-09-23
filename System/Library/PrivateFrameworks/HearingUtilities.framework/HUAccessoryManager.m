@implementation HUAccessoryManager

+ (HUAccessoryManager)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_6);
  return (HUAccessoryManager *)(id)sharedInstance_AccessoryManager;
}

void __36__HUAccessoryManager_sharedInstance__block_invoke()
{
  HUAccessoryManager *v0;
  void *v1;

  v0 = objc_alloc_init(HUAccessoryManager);
  v1 = (void *)sharedInstance_AccessoryManager;
  sharedInstance_AccessoryManager = (uint64_t)v0;

}

- (HUAccessoryManager)init
{
  HUAccessoryManager *v2;
  HUAccessoryManager *v3;
  uint64_t v4;
  OS_dispatch_queue *bluetoothCentralQueue;
  id v6;
  OS_dispatch_queue *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CBCentralManager *centralManager;
  NSObject *v13;
  HUAccessoryManager *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD block[4];
  HUAccessoryManager *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)HUAccessoryManager;
  v2 = -[HUAccessoryManager init](&v23, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_syncLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0D2F990], "bluetoothManagerQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    bluetoothCentralQueue = v3->_bluetoothCentralQueue;
    v3->_bluetoothCentralQueue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc(MEMORY[0x1E0C97728]);
    v7 = v3->_bluetoothCentralQueue;
    v8 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, *MEMORY[0x1E0C97640], 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "initWithDelegate:queue:options:", v3, v7, v10);
    centralManager = v3->_centralManager;
    v3->_centralManager = (CBCentralManager *)v11;

    v13 = v3->_bluetoothCentralQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__HUAccessoryManager_init__block_invoke;
    block[3] = &unk_1EA8E8220;
    v14 = v3;
    v22 = v14;
    dispatch_async(v13, block);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryManager setRegisteredCharacteristics:](v14, "setRegisteredCharacteristics:", v15);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryManager setLoggingUpdates:](v14, "setLoggingUpdates:", v16);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryManager setUpdateUpdates:](v14, "setUpdateUpdates:", v17);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryManager setDiscoveryUpdates:](v14, "setDiscoveryUpdates:", v18);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryManager setBluetoothStateUpdates:](v14, "setBluetoothStateUpdates:", v19);

    -[HUAccessoryManager setupBluetoothController](v14, "setupBluetoothController");
  }
  return v3;
}

uint64_t __26__HUAccessoryManager_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateBluetoothAvailability");
}

- (id)sharedQueue
{
  return self->_bluetoothCentralQueue;
}

- (void)logMessage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  HUAccessoryManager *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t *v23;
  uint64_t v24;

  v4 = a3;
  v23 = &v24;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:locale:arguments:", v4, 0, &v24);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  v22 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __33__HUAccessoryManager_logMessage___block_invoke;
  v14 = &unk_1EA8E90D8;
  v15 = self;
  v16 = &v17;
  AX_PERFORM_WITH_LOCK();
  v7 = (void *)v18[5];
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __33__HUAccessoryManager_logMessage___block_invoke_2;
  v9[3] = &unk_1EA8E8708;
  v8 = v5;
  v10 = v8;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v9);

  _Block_object_dispose(&v17, 8);
}

void __33__HUAccessoryManager_logMessage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __33__HUAccessoryManager_logMessage___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x1DF0EB808](a3);
  if (v4)
  {
    v5 = v4;
    v4[2](v4, *(_QWORD *)(a1 + 32));
    v4 = (void (**)(_QWORD, _QWORD))v5;
  }

}

- (void)registerLoggingBlock:(id)a3 withListener:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    v9 = v5;
    AX_PERFORM_WITH_LOCK();

  }
}

void __56__HUAccessoryManager_registerLoggingBlock_withListener___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  HUAccessoryListenerHelper *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 48);
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
  v7 = (id)v2;
  if (v3)
  {
    v5 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(v4, "setObject:forKey:", v5, v7);

    objc_getAssociatedObject(*(id *)(a1 + 32), &HUAccessoryUpdateDestructionHelperKey);
    v6 = (HUAccessoryListenerHelper *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = -[HUAccessoryListenerHelper initWithListenerAddress:andDelegate:]([HUAccessoryListenerHelper alloc], "initWithListenerAddress:andDelegate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      objc_setAssociatedObject(*(id *)(a1 + 32), &HUAccessoryUpdateDestructionHelperKey, v6, (void *)1);
    }
    -[HUAccessoryListenerHelper addKey:](v6, "addKey:", CFSTR("HUAccessoryManagerLoggingKey"));

  }
  else
  {
    objc_msgSend(v4, "removeObjectForKey:");
  }

}

- (void)updateNotify:(BOOL)a3 forPeripheral:(id)a4 withCharacteristicUUIDs:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  HUAccessoryManager *v15;
  id v16;
  BOOL v17;

  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "services");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__HUAccessoryManager_updateNotify_forPeripheral_withCharacteristicUUIDs___block_invoke;
  v13[3] = &unk_1EA8E9150;
  v14 = v9;
  v15 = self;
  v17 = a3;
  v16 = v8;
  v11 = v8;
  v12 = v9;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);

}

void __73__HUAccessoryManager_updateNotify_forPeripheral_withCharacteristicUUIDs___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  char v11;

  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__HUAccessoryManager_updateNotify_forPeripheral_withCharacteristicUUIDs___block_invoke_2;
  v7[3] = &unk_1EA8E9128;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v8 = v4;
  v9 = v5;
  v11 = *(_BYTE *)(a1 + 56);
  v10 = v6;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);

}

void __73__HUAccessoryManager_updateNotify_forPeripheral_withCharacteristicUUIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "logMessage:", CFSTR("Setting notify %d for peripheral: %@ - %@"), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48), v6);
    objc_msgSend(*(id *)(a1 + 48), "setNotifyValue:forCharacteristic:", *(unsigned __int8 *)(a1 + 56), v6);
  }

}

- (void)setNotify:(BOOL)a3 forCharacteristicUUIDs:(id)a4
{
  id v6;
  NSObject *bluetoothCentralQueue;
  _QWORD block[4];
  id v9;
  HUAccessoryManager *v10;
  BOOL v11;

  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    bluetoothCentralQueue = self->_bluetoothCentralQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__HUAccessoryManager_setNotify_forCharacteristicUUIDs___block_invoke;
    block[3] = &unk_1EA8E91C8;
    v11 = a3;
    v9 = v6;
    v10 = self;
    dispatch_async(bluetoothCentralQueue, block);

  }
}

void __55__HUAccessoryManager_setNotify_forCharacteristicUUIDs___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  int8x16_t v7;
  _QWORD v8[4];
  int8x16_t v9;
  char v10;
  _QWORD v11[5];

  v2 = MEMORY[0x1E0C809B0];
  if (*(_BYTE *)(a1 + 48))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__HUAccessoryManager_setNotify_forCharacteristicUUIDs___block_invoke_2;
    v11[3] = &unk_1EA8E9178;
    v3 = *(void **)(a1 + 32);
    v11[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v11);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "registeredCharacteristics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectsInArray:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 40), "peripherals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __55__HUAccessoryManager_setNotify_forCharacteristicUUIDs___block_invoke_3;
  v8[3] = &unk_1EA8E91A0;
  v10 = *(_BYTE *)(a1 + 48);
  v7 = *(int8x16_t *)(a1 + 32);
  v6 = (id)v7.i64[0];
  v9 = vextq_s8(v7, v7, 8uLL);
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

}

void __55__HUAccessoryManager_setNotify_forCharacteristicUUIDs___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "registeredCharacteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", v6);

  if ((v4 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "registeredCharacteristics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

uint64_t __55__HUAccessoryManager_setNotify_forCharacteristicUUIDs___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateNotify:forPeripheral:withCharacteristicUUIDs:", *(unsigned __int8 *)(a1 + 48), a2, *(_QWORD *)(a1 + 40));
}

- (void)registerUpdateBlock:(id)a3 forCharacteristicUUIDs:(id)a4 withListener:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    -[HUAccessoryManager setNotify:forCharacteristicUUIDs:](self, "setNotify:forCharacteristicUUIDs:", v8 != 0, a4);
    v10 = v9;
    v11 = v8;
    AX_PERFORM_WITH_LOCK();

  }
}

void __78__HUAccessoryManager_registerUpdateBlock_forCharacteristicUUIDs_withListener___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  HUAccessoryListenerHelper *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 48);
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
  v7 = (id)v2;
  if (v3)
  {
    v5 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(v4, "setObject:forKey:", v5, v7);

    objc_getAssociatedObject(*(id *)(a1 + 32), &HUAccessoryUpdateDestructionHelperKey);
    v6 = (HUAccessoryListenerHelper *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = -[HUAccessoryListenerHelper initWithListenerAddress:andDelegate:]([HUAccessoryListenerHelper alloc], "initWithListenerAddress:andDelegate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      objc_setAssociatedObject(*(id *)(a1 + 32), &HUAccessoryUpdateDestructionHelperKey, v6, (void *)1);
    }
    -[HUAccessoryListenerHelper addKey:](v6, "addKey:", CFSTR("HUAccessoryManagerUpdateKey"));

  }
  else
  {
    objc_msgSend(v4, "removeObjectForKey:");
  }

}

- (void)registerDiscoveryBlock:(id)a3 withListener:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    v9 = v5;
    AX_PERFORM_WITH_LOCK();

  }
}

void __58__HUAccessoryManager_registerDiscoveryBlock_withListener___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  HUAccessoryListenerHelper *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 48);
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
  v7 = (id)v2;
  if (v3)
  {
    v5 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(v4, "setObject:forKey:", v5, v7);

    objc_getAssociatedObject(*(id *)(a1 + 32), &HUAccessoryUpdateDestructionHelperKey);
    v6 = (HUAccessoryListenerHelper *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = -[HUAccessoryListenerHelper initWithListenerAddress:andDelegate:]([HUAccessoryListenerHelper alloc], "initWithListenerAddress:andDelegate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      objc_setAssociatedObject(*(id *)(a1 + 32), &HUAccessoryUpdateDestructionHelperKey, v6, (void *)1);
    }
    -[HUAccessoryListenerHelper addKey:](v6, "addKey:", CFSTR("HUAccessoryManagerDiscoveryKey"));

  }
  else
  {
    objc_msgSend(v4, "removeObjectForKey:");
  }

}

- (void)registerBluetoothStateBlock:(id)a3 withListener:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    v9 = v5;
    AX_PERFORM_WITH_LOCK();

  }
}

void __63__HUAccessoryManager_registerBluetoothStateBlock_withListener___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  HUAccessoryListenerHelper *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 48);
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
  v7 = (id)v2;
  if (v3)
  {
    v5 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(v4, "setObject:forKey:", v5, v7);

    objc_getAssociatedObject(*(id *)(a1 + 32), &HUAccessoryUpdateDestructionHelperKey);
    v6 = (HUAccessoryListenerHelper *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = -[HUAccessoryListenerHelper initWithListenerAddress:andDelegate:]([HUAccessoryListenerHelper alloc], "initWithListenerAddress:andDelegate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      objc_setAssociatedObject(*(id *)(a1 + 32), &HUAccessoryUpdateDestructionHelperKey, v6, (void *)1);
    }
    -[HUAccessoryListenerHelper addKey:](v6, "addKey:", CFSTR("HUAccessoryManagerBluetoothStateKey"));

  }
  else
  {
    objc_msgSend(v4, "removeObjectForKey:");
  }

}

- (void)getBluetoothState:(id)a3
{
  id v4;
  void *v5;
  NSObject *bluetoothCentralQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    bluetoothCentralQueue = self->_bluetoothCentralQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__HUAccessoryManager_getBluetoothState___block_invoke;
    v7[3] = &unk_1EA8E86E0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(bluetoothCentralQueue, v7);

  }
}

uint64_t __40__HUAccessoryManager_getBluetoothState___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 9));
}

- (NSArray)peripherals
{
  HUAccessoryManager *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSArray copy](v2->_peripherals, "copy");
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)setPeripherals:(id)a3
{
  HUAccessoryManager *v4;
  uint64_t v5;
  NSArray *peripherals;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  peripherals = v4->_peripherals;
  v4->_peripherals = (NSArray *)v5;

  objc_sync_exit(v4);
}

- (void)getAvailableAddressesSupportingCharacteristic:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *bluetoothCentralQueue;
  _QWORD block[4];
  id v10;
  HUAccessoryManager *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    bluetoothCentralQueue = self->_bluetoothCentralQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__HUAccessoryManager_getAvailableAddressesSupportingCharacteristic_withCompletion___block_invoke;
    block[3] = &unk_1EA8E9218;
    v10 = v6;
    v11 = self;
    v12 = v7;
    dispatch_async(bluetoothCentralQueue, block);

  }
}

void __83__HUAccessoryManager_getAvailableAddressesSupportingCharacteristic_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "peripherals");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__HUAccessoryManager_getAvailableAddressesSupportingCharacteristic_withCompletion___block_invoke_2;
  v9[3] = &unk_1EA8E91F0;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v10 = v5;
  v11 = v6;
  v12 = v2;
  v13 = v3;
  v7 = v3;
  v8 = v2;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  objc_msgSend(*(id *)(a1 + 40), "logMessage:", CFSTR("Found identifiers for %@ = %@"), *(_QWORD *)(a1 + 32), v7);
  objc_msgSend(*(id *)(a1 + 40), "getAddressesFromIdentifiers:withCompletion:", v7, *(_QWORD *)(a1 + 48));

}

void __83__HUAccessoryManager_getAvailableAddressesSupportingCharacteristic_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (!objc_msgSend(*(id *)(a1 + 32), "length")
    || (objc_msgSend(*(id *)(a1 + 40), "characteristicWithUUID:forPeripheral:", *(_QWORD *)(a1 + 48), v7),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    v4 = *(void **)(a1 + 56);
    objc_msgSend(v7, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hcSafeAddObject:", v6);

  }
}

- (void)getIdentifiersFromAddresses:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *bluetoothCentralQueue;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    bluetoothCentralQueue = self->_bluetoothCentralQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__HUAccessoryManager_getIdentifiersFromAddresses_withCompletion___block_invoke;
    block[3] = &unk_1EA8E9218;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(bluetoothCentralQueue, block);

  }
}

void __65__HUAccessoryManager_getIdentifiersFromAddresses_withCompletion___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "bluetoothController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__HUAccessoryManager_getIdentifiersFromAddresses_withCompletion___block_invoke_2;
  v5[3] = &unk_1EA8E9268;
  v6 = a1[5];
  v7 = v2;
  v8 = a1[4];
  v9 = a1[6];
  v4 = v2;
  objc_msgSend(v3, "getDevicesWithFlags:completionHandler:", 0, v5);

}

void __65__HUAccessoryManager_getIdentifiersFromAddresses_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__HUAccessoryManager_getIdentifiersFromAddresses_withCompletion___block_invoke_3;
  v4[3] = &unk_1EA8E9240;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v4);
  objc_msgSend(*(id *)(a1 + 48), "logMessage:", CFSTR("Found identifiers %@"), *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __65__HUAccessoryManager_getIdentifiersFromAddresses_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9 = v3;
  objc_msgSend(v3, "btAddressData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CUPrintNSDataAddress();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v6);

  if ((_DWORD)v4)
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v9, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hcSafeAddObject:", v8);

  }
}

- (void)getAddressesFromIdentifiers:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *bluetoothCentralQueue;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    bluetoothCentralQueue = self->_bluetoothCentralQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__HUAccessoryManager_getAddressesFromIdentifiers_withCompletion___block_invoke;
    block[3] = &unk_1EA8E9218;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(bluetoothCentralQueue, block);

  }
}

void __65__HUAccessoryManager_getAddressesFromIdentifiers_withCompletion___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "bluetoothController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__HUAccessoryManager_getAddressesFromIdentifiers_withCompletion___block_invoke_2;
  v5[3] = &unk_1EA8E9268;
  v6 = a1[5];
  v7 = v2;
  v8 = a1[4];
  v9 = a1[6];
  v4 = v2;
  objc_msgSend(v3, "getDevicesWithFlags:completionHandler:", 0, v5);

}

void __65__HUAccessoryManager_getAddressesFromIdentifiers_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__HUAccessoryManager_getAddressesFromIdentifiers_withCompletion___block_invoke_3;
  v4[3] = &unk_1EA8E9240;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v4);
  objc_msgSend(*(id *)(a1 + 48), "logMessage:", CFSTR("Found addresses %@"), *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __65__HUAccessoryManager_getAddressesFromIdentifiers_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9 = v3;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v9, "btAddressData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataAddress();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hcSafeAddObject:", v8);

  }
}

- (void)readValueForCharacteristicUUID:(id)a3
{
  id v4;
  NSObject *bluetoothCentralQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  bluetoothCentralQueue = self->_bluetoothCentralQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__HUAccessoryManager_readValueForCharacteristicUUID___block_invoke;
  v7[3] = &unk_1EA8E81F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(bluetoothCentralQueue, v7);

}

void __53__HUAccessoryManager_readValueForCharacteristicUUID___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "peripherals");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__HUAccessoryManager_readValueForCharacteristicUUID___block_invoke_2;
  v3[3] = &unk_1EA8E9290;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);

}

void __53__HUAccessoryManager_readValueForCharacteristicUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "services");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__HUAccessoryManager_readValueForCharacteristicUUID___block_invoke_3;
  v6[3] = &unk_1EA8E8B18;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __53__HUAccessoryManager_readValueForCharacteristicUUID___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__HUAccessoryManager_readValueForCharacteristicUUID___block_invoke_4;
  v4[3] = &unk_1EA8E8AF0;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void __53__HUAccessoryManager_readValueForCharacteristicUUID___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "readValueForCharacteristic:", v8);
    *a4 = 1;
  }

}

- (void)writeValue:(id)a3 forCharacteristicUUID:(id)a4 andAddress:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "length")
    && objc_msgSend(v10, "length")
    && (objc_msgSend(v9, "UUIDString"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "length"),
        v11,
        v12))
  {
    v18[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __66__HUAccessoryManager_writeValue_forCharacteristicUUID_andAddress___block_invoke;
    v14[3] = &unk_1EA8E92B8;
    v14[4] = self;
    v15 = v9;
    v16 = v8;
    v17 = v10;
    -[HUAccessoryManager getIdentifiersFromAddresses:withCompletion:](self, "getIdentifiersFromAddresses:withCompletion:", v13, v14);

  }
  else
  {
    -[HUAccessoryManager logMessage:](self, "logMessage:", CFSTR("Skipping write request. Missing value %@, %@ = %@"), v10, v9, v8);
  }

}

void __66__HUAccessoryManager_writeValue_forCharacteristicUUID_andAddress___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  objc_msgSend(a2, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v9, "length");
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "peripherals");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__HUAccessoryManager_writeValue_forCharacteristicUUID_andAddress___block_invoke_2;
    v10[3] = &unk_1EA8E91F0;
    v6 = v9;
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v11 = v6;
    v12 = v7;
    v13 = v8;
    v14 = *(id *)(a1 + 48);
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

  }
  else
  {
    objc_msgSend(v4, "logMessage:", CFSTR("Skipping write request. No identifier found for %@"), *(_QWORD *)(a1 + 56));
  }

}

void __66__HUAccessoryManager_writeValue_forCharacteristicUUID_andAddress___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "characteristicWithUUID:forPeripheral:", *(_QWORD *)(a1 + 48), v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "logMessage:", CFSTR("Writing %@ to %@ - %@"), v9, v10, *(_QWORD *)(a1 + 56));
    if (v9)
      objc_msgSend(v10, "writeValue:forCharacteristic:type:", *(_QWORD *)(a1 + 56), v9, 1);
    else
      objc_msgSend(*(id *)(a1 + 40), "logMessage:", CFSTR("Error: Could not write nil characteristic %@ - %@, %@"), v10, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
    *a4 = 1;

  }
}

- (void)updateBluetoothAvailability
{
  unint64_t v3;
  int bluetoothAvailable;
  int v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[11];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = -[CBController bluetoothState](self->_bluetoothController, "bluetoothState");
  bluetoothAvailable = self->_bluetoothAvailable;
  v5 = v3 == 5;
  self->_bluetoothAvailable = v5;
  if (v3 > 0xA)
    v6 = "?";
  else
    v6 = off_1EA8E9490[v3];
  -[HUAccessoryManager logMessage:](self, "logMessage:", CFSTR("Updating BT state %s"), v6);
  if (self->_bluetoothAvailable)
    -[HUAccessoryManager discoverAccessories](self, "discoverAccessories");
  else
    -[HUAccessoryManager removeDiscoveredAccessories](self, "removeDiscoveredAccessories");
  if (bluetoothAvailable != v5)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__1;
    v14 = __Block_byref_object_dispose__1;
    v15 = 0;
    v7 = MEMORY[0x1E0C809B0];
    v9[5] = MEMORY[0x1E0C809B0];
    v9[6] = 3221225472;
    v9[7] = __49__HUAccessoryManager_updateBluetoothAvailability__block_invoke;
    v9[8] = &unk_1EA8E90D8;
    v9[9] = self;
    v9[10] = &v10;
    AX_PERFORM_WITH_LOCK();
    v8 = (void *)v11[5];
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __49__HUAccessoryManager_updateBluetoothAvailability__block_invoke_2;
    v9[3] = &unk_1EA8E92E0;
    v9[4] = self;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v9);
    _Block_object_dispose(&v10, 8);

  }
}

void __49__HUAccessoryManager_updateBluetoothAvailability__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __49__HUAccessoryManager_updateBluetoothAvailability__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a3 + 16))(a3, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 9));
}

- (void)setupBluetoothController
{
  NSObject *bluetoothCentralQueue;
  _QWORD block[5];

  bluetoothCentralQueue = self->_bluetoothCentralQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__HUAccessoryManager_setupBluetoothController__block_invoke;
  block[3] = &unk_1EA8E8220;
  block[4] = self;
  dispatch_async(bluetoothCentralQueue, block);
}

void __46__HUAccessoryManager_setupBluetoothController__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = objc_alloc_init(MEMORY[0x1E0C97740]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setDispatchQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 40);
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __46__HUAccessoryManager_setupBluetoothController__block_invoke_2;
  v14[3] = &unk_1EA8E9308;
  v14[4] = v5;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v6, "getControllerInfoWithCompletion:", v14);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __46__HUAccessoryManager_setupBluetoothController__block_invoke_3;
  v12[3] = &unk_1EA8E81D0;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v8, "setBluetoothStateChangedHandler:", v12);
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __46__HUAccessoryManager_setupBluetoothController__block_invoke_4;
  v10[3] = &unk_1EA8E9330;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v9, "activateWithCompletion:", v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __46__HUAccessoryManager_setupBluetoothController__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "logMessage:", CFSTR("Error getting controller info"));
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v8, "hardwareAddressData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataAddress();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setLocalBluetoothAddress:", v7);

  }
}

void __46__HUAccessoryManager_setupBluetoothController__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateBluetoothAvailability");

}

void __46__HUAccessoryManager_setupBluetoothController__block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  id v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "logMessage:", CFSTR("Activated bluetooth controller with error %@"), v3);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "updateBluetoothAvailability");

}

- (void)discoverAccessories
{
  CBCentralManager *centralManager;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  CBCentralManager *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (self->_centralIsOn && self->_bluetoothAvailable)
  {
    centralManager = self->_centralManager;
    v15 = *MEMORY[0x1E0C97680];
    v4 = *MEMORY[0x1E0C976C0];
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", *MEMORY[0x1E0C976C0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBCentralManager registerForConnectionEventsWithOptions:](centralManager, "registerForConnectionEventsWithOptions:", v7);

    v8 = self->_centralManager;
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBCentralManager retrieveConnectedPeripheralsWithServices:](v8, "retrieveConnectedPeripheralsWithServices:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUAccessoryManager setPeripherals:](self, "setPeripherals:", v11);
    -[HUAccessoryManager logMessage:](self, "logMessage:", CFSTR("Found peripherals %@"), v11);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __41__HUAccessoryManager_discoverAccessories__block_invoke;
    v12[3] = &unk_1EA8E9290;
    v12[4] = self;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v12);

  }
  else
  {
    -[HUAccessoryManager logMessage:](self, "logMessage:", CFSTR("Skipping discovery %d, %d"), self->_centralIsOn, self->_bluetoothAvailable);
  }
}

uint64_t __41__HUAccessoryManager_discoverAccessories__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "connectPeripheral:options:", a2, 0);
}

- (void)removeDiscoveredAccessories
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v8[11];
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessoryManager peripherals](self, "peripherals");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__HUAccessoryManager_removeDiscoveredAccessories__block_invoke;
  v11[3] = &unk_1EA8E9290;
  v6 = v3;
  v12 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);

  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessoryManager setPeripherals:](self, "setPeripherals:", v7);

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__1;
  v9[4] = __Block_byref_object_dispose__1;
  v10 = 0;
  v8[5] = v5;
  v8[6] = 3221225472;
  v8[7] = __49__HUAccessoryManager_removeDiscoveredAccessories__block_invoke_2;
  v8[8] = &unk_1EA8E90D8;
  v8[9] = self;
  v8[10] = v9;
  AX_PERFORM_WITH_LOCK();
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __49__HUAccessoryManager_removeDiscoveredAccessories__block_invoke_3;
  v8[3] = &unk_1EA8E9358;
  v8[4] = v9;
  -[HUAccessoryManager getAddressesFromIdentifiers:withCompletion:](self, "getAddressesFromIdentifiers:withCompletion:", v6, v8);
  _Block_object_dispose(v9, 8);

}

void __49__HUAccessoryManager_removeDiscoveredAccessories__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hcSafeAddObject:", v3);

}

void __49__HUAccessoryManager_removeDiscoveredAccessories__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __49__HUAccessoryManager_removeDiscoveredAccessories__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__HUAccessoryManager_removeDiscoveredAccessories__block_invoke_4;
  v6[3] = &unk_1EA8E8708;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __49__HUAccessoryManager_removeDiscoveredAccessories__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  v4 = (id)MEMORY[0x1DF0EB808](a3);
  (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, *(_QWORD *)(a1 + 32));

}

- (id)characteristicWithUUID:(id)a3 forPeripheral:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = 0;
  objc_msgSend(v6, "services");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__HUAccessoryManager_characteristicWithUUID_forPeripheral___block_invoke;
  v11[3] = &unk_1EA8E8C48;
  v8 = v5;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __59__HUAccessoryManager_characteristicWithUUID_forPeripheral___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(a2, "characteristics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__HUAccessoryManager_characteristicWithUUID_forPeripheral___block_invoke_2;
  v9[3] = &unk_1EA8E8C20;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v10 = v7;
  v11 = v8;
  v12 = a4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

}

void __59__HUAccessoryManager_characteristicWithUUID_forPeripheral___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
    **(_BYTE **)(a1 + 48) = 1;
  }

}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  -[HUAccessoryManager logMessage:](self, "logMessage:", CFSTR("Central state (%ld) %d"), objc_msgSend(v4, "state"), self->_centralIsOn);
  v5 = objc_msgSend(v4, "state");

  if (v5 == 5)
  {
    self->_centralIsOn = 1;
    -[HUAccessoryManager logMessage:](self, "logMessage:", CFSTR("centralManager ON"));
    -[HUAccessoryManager discoverAccessories](self, "discoverAccessories");
  }
  else
  {
    self->_centralIsOn = 0;
    -[HUAccessoryManager logMessage:](self, "logMessage:", CFSTR("centralManager OFF"));
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "setDelegate:", self);
  v6 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", *MEMORY[0x1E0C976C0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithObjects:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "discoverServices:", v8);

  objc_msgSend(v5, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
  {
    v14[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__HUAccessoryManager_centralManager_didConnectPeripheral___block_invoke;
    v12[3] = &unk_1EA8E9380;
    v12[4] = self;
    v13 = v5;
    -[HUAccessoryManager getAddressesFromIdentifiers:withCompletion:](self, "getAddressesFromIdentifiers:withCompletion:", v11, v12);

  }
}

void __58__HUAccessoryManager_centralManager_didConnectPeripheral___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "logMessage:", CFSTR("Connected to %@ - %@"), v3, *(_QWORD *)(a1 + 40));

}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  HUAccessoryManager *v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HUAccessoryManager peripherals](self, "peripherals");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  v13 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __67__HUAccessoryManager_centralManager_didDisconnectPeripheral_error___block_invoke;
  v29[3] = &unk_1EA8E93A8;
  v14 = v9;
  v30 = v14;
  objc_msgSend(v12, "ax_removeObjectsFromArrayUsingBlock:", v29);
  -[HUAccessoryManager setPeripherals:](self, "setPeripherals:", v12);
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "length"))
  {
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3032000000;
    v27[3] = __Block_byref_object_copy__1;
    v27[4] = __Block_byref_object_dispose__1;
    v28 = 0;
    v21 = v13;
    v22 = 3221225472;
    v23 = __67__HUAccessoryManager_centralManager_didDisconnectPeripheral_error___block_invoke_2;
    v24 = &unk_1EA8E90D8;
    v25 = self;
    v26 = v27;
    AX_PERFORM_WITH_LOCK();
    v31[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __67__HUAccessoryManager_centralManager_didDisconnectPeripheral_error___block_invoke_3;
    v18[3] = &unk_1EA8E93D0;
    v18[4] = self;
    v19 = v14;
    v20 = v27;
    -[HUAccessoryManager getAddressesFromIdentifiers:withCompletion:](self, "getAddressesFromIdentifiers:withCompletion:", v17, v18);

    _Block_object_dispose(v27, 8);
  }

}

uint64_t __67__HUAccessoryManager_centralManager_didDisconnectPeripheral_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __67__HUAccessoryManager_centralManager_didDisconnectPeripheral_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __67__HUAccessoryManager_centralManager_didDisconnectPeripheral_error___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(a2, "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "logMessage:", CFSTR("Disconnected from %@ - %@"), v4, *(_QWORD *)(a1 + 40));
  if (objc_msgSend(v4, "length"))
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __67__HUAccessoryManager_centralManager_didDisconnectPeripheral_error___block_invoke_4;
    v5[3] = &unk_1EA8E8708;
    v6 = v4;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);

  }
}

void __67__HUAccessoryManager_centralManager_didDisconnectPeripheral_error___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1DF0EB808](a3);
  if (v4)
  {
    v6[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v4)[2](v4, 0, v5);

  }
}

- (void)centralManager:(id)a3 connectionEventDidOccur:(int64_t)a4 forPeripheral:(id)a5
{
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v12 = a5;
  -[HUAccessoryManager logMessage:](self, "logMessage:", CFSTR("Connection changed %ld - %@"), a4, v12);
  if (a4 == 1)
  {
    -[HUAccessoryManager peripherals](self, "peripherals");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __75__HUAccessoryManager_centralManager_connectionEventDidOccur_forPeripheral___block_invoke;
    v13[3] = &unk_1EA8E93A8;
    v8 = v12;
    v14 = v8;
    v9 = objc_msgSend(v7, "indexOfObjectPassingTest:", v13);

    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[HUAccessoryManager peripherals](self, "peripherals");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "arrayByAddingObject:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAccessoryManager setPeripherals:](self, "setPeripherals:", v11);

    }
    -[CBCentralManager connectPeripheral:options:](self->_centralManager, "connectPeripheral:options:", v8, 0);

  }
}

uint64_t __75__HUAccessoryManager_centralManager_connectionEventDidOccur_forPeripheral___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "services");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__HUAccessoryManager_peripheral_didDiscoverServices___block_invoke;
  v7[3] = &unk_1EA8E93F8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __53__HUAccessoryManager_peripheral_didDiscoverServices___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", *MEMORY[0x1E0C976C0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "discoverCharacteristics:forService:", 0, v6);

}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
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
  _QWORD v17[11];
  _QWORD v18[5];
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "characteristics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessoryManager logMessage:](self, "logMessage:", CFSTR("Found characteristics %@ - %@"), v8, v11);

  -[HUAccessoryManager registeredCharacteristics](self, "registeredCharacteristics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessoryManager updateNotify:forPeripheral:withCharacteristicUUIDs:](self, "updateNotify:forPeripheral:withCharacteristicUUIDs:", 1, v8, v12);

  objc_msgSend(v8, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "length"))
  {
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = __Block_byref_object_copy__1;
    v18[4] = __Block_byref_object_dispose__1;
    v19 = 0;
    v15 = MEMORY[0x1E0C809B0];
    v17[5] = MEMORY[0x1E0C809B0];
    v17[6] = 3221225472;
    v17[7] = __76__HUAccessoryManager_peripheral_didDiscoverCharacteristicsForService_error___block_invoke;
    v17[8] = &unk_1EA8E90D8;
    v17[9] = self;
    v17[10] = v18;
    AX_PERFORM_WITH_LOCK();
    v20[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v15;
    v17[1] = 3221225472;
    v17[2] = __76__HUAccessoryManager_peripheral_didDiscoverCharacteristicsForService_error___block_invoke_2;
    v17[3] = &unk_1EA8E9358;
    v17[4] = v18;
    -[HUAccessoryManager getAddressesFromIdentifiers:withCompletion:](self, "getAddressesFromIdentifiers:withCompletion:", v16, v17);

    _Block_object_dispose(v18, 8);
  }

}

void __76__HUAccessoryManager_peripheral_didDiscoverCharacteristicsForService_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __76__HUAccessoryManager_peripheral_didDiscoverCharacteristicsForService_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(a2, "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __76__HUAccessoryManager_peripheral_didDiscoverCharacteristicsForService_error___block_invoke_3;
    v5[3] = &unk_1EA8E8708;
    v6 = v4;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);

  }
}

void __76__HUAccessoryManager_peripheral_didDiscoverCharacteristicsForService_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1DF0EB808](a3);
  if (v4)
  {
    v6[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v4)[2](v4, v5, 0);

  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
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
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  HUAccessoryManager *v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "length"))
  {
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3032000000;
    v27[3] = __Block_byref_object_copy__1;
    v27[4] = __Block_byref_object_dispose__1;
    v28 = 0;
    v15 = MEMORY[0x1E0C809B0];
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __71__HUAccessoryManager_peripheral_didUpdateValueForCharacteristic_error___block_invoke;
    v24 = &unk_1EA8E90D8;
    v25 = self;
    v26 = v27;
    AX_PERFORM_WITH_LOCK();
    v29[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v15;
    v17[1] = 3221225472;
    v17[2] = __71__HUAccessoryManager_peripheral_didUpdateValueForCharacteristic_error___block_invoke_2;
    v17[3] = &unk_1EA8E9448;
    v20 = v27;
    v18 = v11;
    v19 = v12;
    -[HUAccessoryManager getAddressesFromIdentifiers:withCompletion:](self, "getAddressesFromIdentifiers:withCompletion:", v16, v17);

    _Block_object_dispose(v27, 8);
  }

}

void __71__HUAccessoryManager_peripheral_didUpdateValueForCharacteristic_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __71__HUAccessoryManager_peripheral_didUpdateValueForCharacteristic_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(a2, "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __71__HUAccessoryManager_peripheral_didUpdateValueForCharacteristic_error___block_invoke_3;
    v5[3] = &unk_1EA8E9420;
    v6 = v4;
    v7 = *(id *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);

  }
}

void __71__HUAccessoryManager_peripheral_didUpdateValueForCharacteristic_error___block_invoke_3(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v5;

  v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1DF0EB808](a3);
  if (v4)
  {
    v5 = v4;
    v4[2](v4, a1[4], a1[5], a1[6]);
    v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v5;
  }

}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  -[HUAccessoryManager logMessage:](self, "logMessage:", CFSTR("Did write to peripheral %@ - %@ - %@"), a4, a3, a5);
}

- (id)availableAddresses
{
  return -[HUAccessoryManager availableAddressesWithCharacteristicSupport:](self, "availableAddressesWithCharacteristicSupport:", 0);
}

- (id)availableAddressesWithCharacteristicSupport:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  id v8;
  _QWORD v10[4];
  NSObject *v11;
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
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__HUAccessoryManager_availableAddressesWithCharacteristicSupport___block_invoke;
  v10[3] = &unk_1EA8E9470;
  v12 = &v13;
  v6 = v5;
  v11 = v6;
  -[HUAccessoryManager getAvailableAddressesSupportingCharacteristic:withCompletion:](self, "getAvailableAddressesSupportingCharacteristic:withCompletion:", v4, v10);
  v7 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v6, v7);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __66__HUAccessoryManager_availableAddressesWithCharacteristicSupport___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)identifierFromBluetoothAddress:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  id v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = 0;
  if (objc_msgSend(v4, "length"))
  {
    v5 = dispatch_semaphore_create(0);
    v20[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__HUAccessoryManager_identifierFromBluetoothAddress___block_invoke;
    v11[3] = &unk_1EA8E9470;
    v13 = &v14;
    v7 = v5;
    v12 = v7;
    -[HUAccessoryManager getIdentifiersFromAddresses:withCompletion:](self, "getIdentifiersFromAddresses:withCompletion:", v6, v11);

    v8 = dispatch_time(0, 2000000000);
    dispatch_semaphore_wait(v7, v8);

  }
  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

intptr_t __53__HUAccessoryManager_identifierFromBluetoothAddress___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "firstObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
  objc_storeStrong((id *)&self->_centralManager, a3);
}

- (OS_dispatch_queue)bluetoothCentralQueue
{
  return self->_bluetoothCentralQueue;
}

- (void)setBluetoothCentralQueue:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothCentralQueue, a3);
}

- (CBController)bluetoothController
{
  return self->_bluetoothController;
}

- (void)setBluetoothController:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothController, a3);
}

- (NSMutableArray)registeredCharacteristics
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRegisteredCharacteristics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableDictionary)loggingUpdates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLoggingUpdates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableDictionary)updateUpdates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUpdateUpdates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableDictionary)discoveryUpdates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDiscoveryUpdates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSMutableDictionary)bluetoothStateUpdates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBluetoothStateUpdates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)localBluetoothAddress
{
  return self->_localBluetoothAddress;
}

- (void)setLocalBluetoothAddress:(id)a3
{
  objc_storeStrong((id *)&self->_localBluetoothAddress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localBluetoothAddress, 0);
  objc_storeStrong((id *)&self->_bluetoothStateUpdates, 0);
  objc_storeStrong((id *)&self->_discoveryUpdates, 0);
  objc_storeStrong((id *)&self->_updateUpdates, 0);
  objc_storeStrong((id *)&self->_loggingUpdates, 0);
  objc_storeStrong((id *)&self->_registeredCharacteristics, 0);
  objc_storeStrong((id *)&self->_bluetoothController, 0);
  objc_storeStrong((id *)&self->_bluetoothCentralQueue, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_peripherals, 0);
}

@end
