@implementation ACCTransportIOAccessorySharedManager

- (ACCTransportIOAccessorySharedManager)init
{
  ACCTransportIOAccessorySharedManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *listQ;
  uint64_t v5;
  NSMutableSet *allIOAccessoryManagers;
  uint64_t v7;
  NSMutableSet *allIOAccessories;
  ACCTransportIOAccessoryListener *v9;
  ACCTransportIOAccessoryListener *ioAccessoryListener;
  ACCSettingsState *v11;
  ACCSettingsState *enableDirectAWCAuth;
  NSRecursiveLock *v13;
  NSRecursiveLock *accessoryPortLock;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  NSMutableArray *deferAuthCPServiceArray;
  NSMutableArray *v19;
  NSMutableArray *deferEAServiceArray;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)ACCTransportIOAccessorySharedManager;
  v2 = -[ACCTransportIOAccessorySharedManager init](&v22, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.accessoryd.ioaccmgr.listq", 0);
    listQ = v2->_listQ;
    v2->_listQ = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    allIOAccessoryManagers = v2->_allIOAccessoryManagers;
    v2->_allIOAccessoryManagers = (NSMutableSet *)v5;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    allIOAccessories = v2->_allIOAccessories;
    v2->_allIOAccessories = (NSMutableSet *)v7;

    v9 = -[ACCTransportIOAccessoryListener initWithDelegate:]([ACCTransportIOAccessoryListener alloc], "initWithDelegate:", v2);
    ioAccessoryListener = v2->_ioAccessoryListener;
    v2->_ioAccessoryListener = v9;

    v2->_isB139OrB164Connected = 0;
    v11 = -[ACCSettingsState initWithKey:applicationID:notification:defaultValue:invalidValue:]([ACCSettingsState alloc], "initWithKey:applicationID:notification:defaultValue:invalidValue:", CFSTR("EnableDirectAWCAuth"), CFSTR("com.apple.CoreAccessories"), CFSTR("com.apple.CoreAccessories.PreferencesDidChangeNotification"), 0, -1);
    enableDirectAWCAuth = v2->_enableDirectAWCAuth;
    v2->_enableDirectAWCAuth = v11;

    objc_storeWeak((id *)&v2->_delegate, 0);
    v13 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x24BDD1788]);
    accessoryPortLock = v2->_accessoryPortLock;
    v2->_accessoryPortLock = v13;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v2, sel__handleRequestForIAPDPortB139B164Connected_, *MEMORY[0x24BE1A030], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v2, sel__handleRequestForPrimaryPort_, *MEMORY[0x24BE1A038], 0);

    v2->_bIsWatch = MGGetSInt32Answer() == 6;
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    deferAuthCPServiceArray = v2->_deferAuthCPServiceArray;
    v2->_deferAuthCPServiceArray = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    deferEAServiceArray = v2->_deferEAServiceArray;
    v2->_deferEAServiceArray = v19;

  }
  return v2;
}

- (void)dealloc
{
  OS_dispatch_queue *listQ;
  NSMutableSet *allIOAccessoryManagers;
  NSMutableSet *allIOAccessories;
  ACCTransportIOAccessoryListener *ioAccessoryListener;
  NSRecursiveLock *accessoryPortLock;
  NSMutableArray *deferAuthCPServiceArray;
  NSMutableArray *deferEAServiceArray;
  objc_super v10;

  dispatch_sync((dispatch_queue_t)self->_listQ, &__block_literal_global_5);
  listQ = self->_listQ;
  self->_listQ = 0;

  -[NSMutableSet removeAllObjects](self->_allIOAccessoryManagers, "removeAllObjects");
  allIOAccessoryManagers = self->_allIOAccessoryManagers;
  self->_allIOAccessoryManagers = 0;

  -[NSMutableSet removeAllObjects](self->_allIOAccessories, "removeAllObjects");
  allIOAccessories = self->_allIOAccessories;
  self->_allIOAccessories = 0;

  ioAccessoryListener = self->_ioAccessoryListener;
  self->_ioAccessoryListener = 0;

  accessoryPortLock = self->_accessoryPortLock;
  self->_accessoryPortLock = 0;

  deferAuthCPServiceArray = self->_deferAuthCPServiceArray;
  self->_deferAuthCPServiceArray = 0;

  deferEAServiceArray = self->_deferEAServiceArray;
  self->_deferEAServiceArray = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  v10.receiver = self;
  v10.super_class = (Class)ACCTransportIOAccessorySharedManager;
  -[ACCTransportIOAccessorySharedManager dealloc](&v10, sel_dealloc);
}

- (void)startIOACCTransportManager
{
  io_service_t ServiceWithPrimaryPort;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD block[5];

  ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort();
  EnableAccessoryPowerForPortService(ServiceWithPrimaryPort, 1);
  IOObjectRelease(ServiceWithPrimaryPort);
  v4 = dispatch_time(0, 1250000000);
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__ACCTransportIOAccessorySharedManager_startIOACCTransportManager__block_invoke;
  block[3] = &unk_24D719E68;
  block[4] = self;
  dispatch_after(v4, v5, block);

}

uint64_t __66__ACCTransportIOAccessorySharedManager_startIOACCTransportManager__block_invoke(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;

  if (gLogObjects)
    v2 = gNumLogObjects < 2;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __66__ACCTransportIOAccessorySharedManager_startIOACCTransportManager__block_invoke_cold_1(v4, v5, v6);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "startListening");
}

- (void)stopIOACCTransportManager
{
  -[ACCTransportIOAccessoryListener stopListening](self->_ioAccessoryListener, "stopListening");
}

- (id)_managerForBase:(id)a3
{
  id v4;
  NSObject *listQ;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD block[5];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  v31 = 0;
  listQ = self->_listQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__ACCTransportIOAccessorySharedManager__managerForBase___block_invoke;
  block[3] = &unk_24D719FF8;
  v25 = &v26;
  block[4] = self;
  v6 = v4;
  v24 = v6;
  dispatch_sync(listQ, block);
  if (objc_msgSend((id)v27[5], "count") != 1)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v7 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend((id)v27[5], "count");
      v15 = v27[5];
      *(_DWORD *)buf = 134218242;
      v33 = v14;
      v34 = 2112;
      v35 = v15;
      _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_DEFAULT, "found %lu IOAccMgr Ports contained in set! %@", buf, 0x16u);
    }
    goto LABEL_18;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = (id)v27[5];
  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v36, 16);
  if (!v8)
  {
LABEL_18:
    v9 = 0;
    goto LABEL_19;
  }
  v9 = 0;
  v10 = *(_QWORD *)v20;
  do
  {
    v11 = 0;
    v12 = v9;
    do
    {
      if (*(_QWORD *)v20 != v10)
        objc_enumerationMutation(v7);
      v9 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * v11);

      ++v11;
      v12 = v9;
    }
    while (v8 != v11);
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v36, 16);
  }
  while (v8);
LABEL_19:

  v16 = v24;
  v17 = v9;

  _Block_object_dispose(&v26, 8);
  return v17;
}

void __56__ACCTransportIOAccessorySharedManager__managerForBase___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "allIOAccessoryManagers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__ACCTransportIOAccessorySharedManager__managerForBase___block_invoke_2;
  v6[3] = &unk_24D71A928;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "objectsPassingTest:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

BOOL __56__ACCTransportIOAccessorySharedManager__managerForBase___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  int v9;
  int v10;
  NSObject *v11;
  id v12;

  v5 = a2;
  if (gLogObjects)
    v6 = gNumLogObjects < 2;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v8 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  else
  {
    v8 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __56__ACCTransportIOAccessorySharedManager__managerForBase___block_invoke_2_cold_3(v5, a1);

  v9 = objc_msgSend(v5, "ioService");
  v10 = objc_msgSend(*(id *)(a1 + 32), "upstreamManagerService");
  if (v9 == v10)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v11 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __56__ACCTransportIOAccessorySharedManager__managerForBase___block_invoke_2_cold_1();

    *a3 = 1;
  }

  return v9 == v10;
}

- (id)_managerContainingBase:(id)a3
{
  id v4;
  NSObject *listQ;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD block[5];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  v31 = 0;
  listQ = self->_listQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__ACCTransportIOAccessorySharedManager__managerContainingBase___block_invoke;
  block[3] = &unk_24D719FF8;
  v25 = &v26;
  block[4] = self;
  v6 = v4;
  v24 = v6;
  dispatch_sync(listQ, block);
  if (objc_msgSend((id)v27[5], "count") != 1)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v7 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend((id)v27[5], "count");
      v15 = v27[5];
      *(_DWORD *)buf = 134218242;
      v33 = v14;
      v34 = 2112;
      v35 = v15;
      _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_DEFAULT, "unexpectedly found more than 1, %lu IOAccMgr Ports contained in set! %@", buf, 0x16u);
    }
    goto LABEL_18;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = (id)v27[5];
  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v36, 16);
  if (!v8)
  {
LABEL_18:
    v9 = 0;
    goto LABEL_19;
  }
  v9 = 0;
  v10 = *(_QWORD *)v20;
  do
  {
    v11 = 0;
    v12 = v9;
    do
    {
      if (*(_QWORD *)v20 != v10)
        objc_enumerationMutation(v7);
      v9 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * v11);

      ++v11;
      v12 = v9;
    }
    while (v8 != v11);
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v36, 16);
  }
  while (v8);
LABEL_19:

  v16 = v24;
  v17 = v9;

  _Block_object_dispose(&v26, 8);
  return v17;
}

void __63__ACCTransportIOAccessorySharedManager__managerContainingBase___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "allIOAccessoryManagers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__ACCTransportIOAccessorySharedManager__managerContainingBase___block_invoke_2;
  v6[3] = &unk_24D71A928;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "objectsPassingTest:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __63__ACCTransportIOAccessorySharedManager__managerContainingBase___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  BOOL v7;
  id v8;
  NSObject *v9;

  objc_msgSend(a2, "ioAccessoryChildPorts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)v6)
  {
    if (gLogObjects)
      v7 = gNumLogObjects < 2;
    else
      v7 = 1;
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    else
    {
      v9 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __63__ACCTransportIOAccessorySharedManager__managerContainingBase___block_invoke_2_cold_1();

    *a3 = 1;
  }
  return v6;
}

- (id)managerForIOAccessoryManagerService:(unsigned int)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  unsigned int v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[ACCTransportIOAccessorySharedManager allIOAccessoryManagers](self, "allIOAccessoryManagers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __76__ACCTransportIOAccessorySharedManager_managerForIOAccessoryManagerService___block_invoke;
  v20[3] = &__block_descriptor_36_e44_B24__0__ACCTransportIOAccessoryManager_8_B16l;
  v21 = a3;
  objc_msgSend(v4, "objectsPassingTest:", v20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") != 1)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v6 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 134218242;
      v23 = v14;
      v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_21722C000, v6, OS_LOG_TYPE_DEFAULT, "unexpectedly found > 1, %lu ACCTransportIOAccessoryManagers contained in set! %@", buf, 0x16u);
    }
    goto LABEL_18;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5;
  v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (!v7)
  {
LABEL_18:
    v9 = 0;
    goto LABEL_19;
  }
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v17;
  do
  {
    v11 = 0;
    v12 = v9;
    do
    {
      if (*(_QWORD *)v17 != v10)
        objc_enumerationMutation(v6);
      v9 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * v11);

      ++v11;
      v12 = v9;
    }
    while (v8 != v11);
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  }
  while (v8);
LABEL_19:

  return v9;
}

BOOL __76__ACCTransportIOAccessorySharedManager_managerForIOAccessoryManagerService___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ioService") == *(_DWORD *)(a1 + 32);
}

- (id)_managerForIOService:(unsigned int)a3 shouldCreateNewService:(BOOL)a4
{
  NSObject *listQ;
  id v5;
  _QWORD block[6];
  unsigned int v8;
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  listQ = self->_listQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__ACCTransportIOAccessorySharedManager__managerForIOService_shouldCreateNewService___block_invoke;
  block[3] = &unk_24D71A970;
  v8 = a3;
  block[4] = self;
  block[5] = &v10;
  v9 = a4;
  dispatch_sync(listQ, block);
  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __84__ACCTransportIOAccessorySharedManager__managerForIOService_shouldCreateNewService___block_invoke(uint64_t a1)
{
  int *v2;
  uint64_t UpstreamService;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  int v18;
  int v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = (int *)(a1 + 48);
  UpstreamService = IOAccessoryManagerGetUpstreamService();
  if (!(_DWORD)UpstreamService)
  {
    if (gLogObjects)
      v9 = gNumLogObjects < 2;
    else
      v9 = 1;
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v10 = MEMORY[0x24BDACB70];
    }
    else
    {
      v11 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __84__ACCTransportIOAccessorySharedManager__managerForIOService_shouldCreateNewService___block_invoke_cold_1(v2, v11, v12);
    goto LABEL_17;
  }
  v4 = UpstreamService;
  objc_msgSend(*(id *)(a1 + 32), "managerForIOAccessoryManagerService:", UpstreamService);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) && *(_BYTE *)(a1 + 52))
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v8 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 67109120;
      v20 = v4;
      _os_log_impl(&dword_21722C000, v8, OS_LOG_TYPE_DEFAULT, "Creating new IOAccMgrService, calling IOAccessoryManagerServiceArrived for serviceID %d?", (uint8_t *)&v19, 8u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_addIOAccessoryManagerWithIOService:", v4);
    objc_msgSend(*(id *)(a1 + 32), "managerForIOAccessoryManagerService:", v4);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    if (gLogObjects && gNumLogObjects >= 2)
    {
      v11 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v17 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *v2;
      v19 = 67109376;
      v20 = v4;
      v21 = 1024;
      v22 = v18;
      _os_log_impl(&dword_21722C000, v11, OS_LOG_TYPE_DEFAULT, "Created new ACCTransportIOAccessoryManager with  service %d for downstream service %d", (uint8_t *)&v19, 0xEu);
    }
LABEL_17:

  }
}

- (void)_addIOAccessoryManagerWithIOService:(unsigned int)a3
{
  uint64_t v3;
  BOOL v5;
  id v6;
  NSObject *v7;
  ACCTransportIOAccessoryManager *v8;
  NSObject *v9;
  id v10;
  id v11;
  int v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v3 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v5 = gNumLogObjects < 2;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v23) = 67109120;
    HIDWORD(v23) = v3;
    _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_DEFAULT, "adding io acc mgr with service %d", (uint8_t *)&v23, 8u);
  }

  v8 = -[ACCTransportIOAccessoryManager initWithIOService:]([ACCTransportIOAccessoryManager alloc], "initWithIOService:", v3);
  -[NSMutableSet addObject:](self->_allIOAccessoryManagers, "addObject:", v8);
  -[NSMutableSet addObject:](self->_allIOAccessories, "addObject:", v8);
  if (-[ACCTransportIOAccessoryManager isRootPort](v8, "isRootPort"))
  {
    -[NSMutableSet addObject:](self->_rootIOAccessoryManagers, "addObject:", v8);
    switch(-[ACCTransportIOAccessoryManager connectionType](v8, "connectionType"))
    {
      case 1:
        objc_storeStrong((id *)&self->_rootE75Manager, v8);
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v9 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v9 = MEMORY[0x24BDACB70];
          v10 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          -[ACCTransportIOAccessorySharedManager _addIOAccessoryManagerWithIOService:].cold.4();
        break;
      case 3:
        objc_storeStrong((id *)&self->_rootOrionManager, v8);
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v9 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v9 = MEMORY[0x24BDACB70];
          v16 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          -[ACCTransportIOAccessorySharedManager _addIOAccessoryManagerWithIOService:].cold.2();
        break;
      case 4:
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v9 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v9 = MEMORY[0x24BDACB70];
          v17 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(v23) = 0;
          v13 = "not caching inductive root manager to a root port variable";
          goto LABEL_61;
        }
        break;
      case 8:
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v9 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v9 = MEMORY[0x24BDACB70];
          v18 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(v23) = 0;
          v13 = "Not caching AWC root manager to a root port variable";
          goto LABEL_61;
        }
        break;
      case 0xB:
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v9 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v9 = MEMORY[0x24BDACB70];
          v19 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(v23) = 0;
          v13 = "Not caching unknown root manager to a root port variable";
LABEL_61:
          v14 = v9;
          v15 = 2;
          goto LABEL_62;
        }
        break;
      default:
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v9 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v9 = MEMORY[0x24BDACB70];
          v11 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v12 = -[ACCTransportIOAccessoryManager connectionType](v8, "connectionType");
          LODWORD(v23) = 67109120;
          HIDWORD(v23) = v12;
          v13 = "Not caching unhandled root port connectionType %d to a root port variable";
          v14 = v9;
          v15 = 8;
LABEL_62:
          _os_log_impl(&dword_21722C000, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v23, v15);
        }
        break;
    }

  }
  if (-[ACCTransportIOAccessoryManager connectionType](v8, "connectionType", v23, v24) == 1)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", self, sel__handleUSBHostPluginArrived_, CFSTR("ACCTransportIOAccessory_USBHostPluginArrivedNotification"), 0);

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "postNotificationName:object:", CFSTR("ACCTransportIOAccessory_IOAccessoryManagerArrivedNotification"), 0);

  if (-[ACCTransportIOAccessoryManager connectionType](v8, "connectionType") == 8)
    v22 = 2;
  else
    v22 = 3;
  -[ACCTransportIOAccessoryManager setAccessoryPowerMode:](v8, "setAccessoryPowerMode:", v22);

}

- (id)_managerForBaseEndpointUUID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  int v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  id v12;
  id v13;
  const char *v14;
  id v15;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACCTransportIOAccessorySharedManager _basePortForEndpointUUID:](self, "_basePortForEndpointUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (gLogObjects)
      v11 = gNumLogObjects < 2;
    else
      v11 = 1;
    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)(gLogObjects + 8);
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      goto LABEL_34;
    v17 = 138412290;
    v18 = v4;
    v14 = "Unable to find accBaseTransport for endpointUUID %@";
    goto LABEL_33;
  }
  -[ACCTransportIOAccessorySharedManager _managerForBase:](self, "_managerForBase:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (gLogObjects)
    v7 = gNumLogObjects <= 1;
  else
    v7 = 1;
  v8 = !v7;
  if (!v6)
  {
    if (v8)
    {
      v10 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v15 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      goto LABEL_34;
    v17 = 138412290;
    v18 = v5;
    v14 = "Unable to find accMgrTransport for base transport %@";
LABEL_33:
    _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v17, 0xCu);
LABEL_34:
    v9 = 0;
    goto LABEL_35;
  }
  v9 = (void *)v6;
  if (v8)
  {
    v10 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v10 = MEMORY[0x24BDACB70];
    v13 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ACCTransportIOAccessorySharedManager _managerForBaseEndpointUUID:].cold.3(v9);
LABEL_35:

  return v9;
}

- (id)_managerForConnectionUUID:(id)a3
{
  id v4;
  void *v5;
  NSObject *listQ;
  BOOL v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t ServiceWithPort;
  void *v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  BOOL v33;
  id v34;
  const char *v35;
  id v36;
  id v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD block[5];
  id v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  uint64_t v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__0;
  v50 = __Block_byref_object_dispose__0;
  v51 = 0;
  if (v4)
  {
    listQ = self->_listQ;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__ACCTransportIOAccessorySharedManager__managerForConnectionUUID___block_invoke;
    block[3] = &unk_24D719FF8;
    v45 = &v46;
    block[4] = self;
    v44 = v4;
    dispatch_sync(listQ, block);

  }
  else
  {
    if (gLogObjects)
      v7 = gNumLogObjects < 2;
    else
      v7 = 1;
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    else
    {
      v9 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:].cold.9(v9, v10, v11);

  }
  v12 = (void *)v47[5];
  if (!v12)
  {
LABEL_34:
    -[ACCTransportIOAccessorySharedManager _basePortForConnectionUUID:](self, "_basePortForConnectionUUID:", v5, (_QWORD)v39);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v23 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v23 = MEMORY[0x24BDACB70];
        v27 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21722C000, v23, OS_LOG_TYPE_INFO, "Found base port owning connectionUUID, stop looking", buf, 2u);
      }
      v15 = 0;
      goto LABEL_90;
    }
    ServiceWithPort = IOAccessoryPortGetServiceWithPort();
    if ((_DWORD)ServiceWithPort)
    {
      -[ACCTransportIOAccessorySharedManager _managerForIOService:shouldCreateNewService:](self, "_managerForIOService:shouldCreateNewService:", ServiceWithPort, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v15 = v25;
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v26 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v26 = MEMORY[0x24BDACB70];
          v29 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21722C000, v26, OS_LOG_TYPE_DEFAULT, "Found USB port ACCTransportIOAccessoryManager", buf, 2u);
        }

        goto LABEL_76;
      }
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v28 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v28 = MEMORY[0x24BDACB70];
        v31 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21722C000, v28, OS_LOG_TYPE_DEFAULT, "Couldn't find ACCTransportIOAccessoryManager for portServiceUSB", buf, 2u);
      }
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v28 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v28 = MEMORY[0x24BDACB70];
        v30 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:].cold.3();
    }

    -[ACCTransportIOAccessorySharedManager rootE75Manager](self, "rootE75Manager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32 == 0;

    if (!v33)
    {
      -[ACCTransportIOAccessorySharedManager rootE75Manager](self, "rootE75Manager");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v23 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v23 = MEMORY[0x24BDACB70];
        v36 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        goto LABEL_90;
      *(_WORD *)buf = 0;
      v35 = "Did not find manager for USB port. Setting to root Lightning port";
LABEL_89:
      _os_log_impl(&dword_21722C000, v23, OS_LOG_TYPE_DEFAULT, v35, buf, 2u);
LABEL_90:

      goto LABEL_91;
    }
    v15 = 0;
LABEL_76:
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v23 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v23 = MEMORY[0x24BDACB70];
      v34 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_90;
    *(_WORD *)buf = 0;
    v35 = "ERROR: No root lightning port manager is present";
    goto LABEL_89;
  }
  if (objc_msgSend(v12, "count") != 1)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v13 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v13 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_msgSend((id)v47[5], "count");
      v21 = v47[5];
      *(_DWORD *)buf = 134218498;
      v53 = v20;
      v54 = 2112;
      v55 = v5;
      v56 = 2112;
      v57 = v21;
      _os_log_impl(&dword_21722C000, v13, OS_LOG_TYPE_DEFAULT, "Found %lu IOAccMgr Ports contained in set for connectionUUID %@! %@", buf, 0x20u);
    }
    goto LABEL_33;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v13 = (id)v47[5];
  v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v39, v58, 16);
  if (!v14)
  {
LABEL_33:

    goto LABEL_34;
  }
  v15 = 0;
  v16 = *(_QWORD *)v40;
  do
  {
    v17 = 0;
    v18 = v15;
    do
    {
      if (*(_QWORD *)v40 != v16)
        objc_enumerationMutation(v13);
      v15 = *(id *)(*((_QWORD *)&v39 + 1) + 8 * v17);

      ++v17;
      v18 = v15;
    }
    while (v14 != v17);
    v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v39, v58, 16);
  }
  while (v14);

  if (!v15)
    goto LABEL_34;
LABEL_91:
  v37 = v15;
  _Block_object_dispose(&v46, 8);

  return v37;
}

void __66__ACCTransportIOAccessorySharedManager__managerForConnectionUUID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "allIOAccessoryManagers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__ACCTransportIOAccessorySharedManager__managerForConnectionUUID___block_invoke_2;
  v6[3] = &unk_24D71A928;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "objectsPassingTest:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __66__ACCTransportIOAccessorySharedManager__managerForConnectionUUID___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  if (gLogObjects)
    v6 = gNumLogObjects < 2;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v8 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  else
  {
    v8 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __66__ACCTransportIOAccessorySharedManager__managerForConnectionUUID___block_invoke_2_cold_3(v5);

  objc_msgSend(v5, "connectionUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  v10 = (uint64_t *)(a1 + 32);
  v12 = objc_msgSend(v9, "isEqualToString:", v11);

  if ((_DWORD)v12)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v13 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v13 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __66__ACCTransportIOAccessorySharedManager__managerForConnectionUUID___block_invoke_2_cold_1(v10, v13, v15);

    *a3 = 1;
  }

  return v12;
}

- (BOOL)_managerForConnectionUUIDHasActiveEndpoint:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  id v21;
  void *v22;
  const char *v23;
  id v24;
  id v25;
  id v26;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:](self, "_managerForConnectionUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v19 = 0;
    goto LABEL_59;
  }
  objc_msgSend(v3, "ioAccessoryChildPorts");
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (!v6)
  {
    v19 = 0;
    goto LABEL_58;
  }
  v7 = v6;
  v28 = v4;
  v8 = *(_QWORD *)v30;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v30 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      NSClassFromString(CFSTR("ACCTransportIOAccessoryPort"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v10;
        objc_msgSend(v11, "ioAccPortEndpointUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          if (gLogObjects && gNumLogObjects >= 2)
          {
            v20 = *(id *)(gLogObjects + 8);
            v4 = v28;
          }
          else
          {
            v4 = v28;
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v20 = MEMORY[0x24BDACB70];
            v21 = MEMORY[0x24BDACB70];
          }
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            goto LABEL_57;
          objc_msgSend(v11, "ioAccPortEndpointUUID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v34 = v22;
          v23 = "found IOAccessoryPort with active endpointUUID %@";
LABEL_56:
          _os_log_impl(&dword_21722C000, v20, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);

LABEL_57:
          v19 = 1;
          goto LABEL_58;
        }
      }
      else
      {
        NSClassFromString(CFSTR("ACCTransportIOAccessoryEA"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v10;
          objc_msgSend(v13, "endpointUUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            if (gLogObjects && gNumLogObjects >= 2)
            {
              v20 = *(id *)(gLogObjects + 8);
              v4 = v28;
            }
            else
            {
              v4 = v28;
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
              v20 = MEMORY[0x24BDACB70];
              v24 = MEMORY[0x24BDACB70];
            }
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              goto LABEL_57;
            objc_msgSend(v13, "endpointUUID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v34 = v22;
            v23 = "found IOAccessoryEA with active endpointUUID %@";
            goto LABEL_56;
          }
        }
        else
        {
          NSClassFromString(CFSTR("ACCTransportIOAccessoryOOBPairing"));
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = v10;
            objc_msgSend(v15, "endpointUUID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              if (gLogObjects && gNumLogObjects >= 2)
              {
                v20 = *(id *)(gLogObjects + 8);
                v4 = v28;
              }
              else
              {
                v4 = v28;
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
                v20 = MEMORY[0x24BDACB70];
                v25 = MEMORY[0x24BDACB70];
              }
              if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                goto LABEL_57;
              objc_msgSend(v15, "endpointUUID");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v34 = v22;
              v23 = "found IOAccessoryOOBPairing with active endpointUUID %@";
              goto LABEL_56;
            }
          }
          else
          {
            NSClassFromString(CFSTR("ACCTransportIOAccessoryConfigStream"));
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
            v17 = v10;
            objc_msgSend(v17, "endpointUUID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              if (gLogObjects && gNumLogObjects >= 2)
              {
                v20 = *(id *)(gLogObjects + 8);
                v4 = v28;
              }
              else
              {
                v4 = v28;
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
                v20 = MEMORY[0x24BDACB70];
                v26 = MEMORY[0x24BDACB70];
              }
              if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                goto LABEL_57;
              objc_msgSend(v17, "endpointUUID");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v34 = v22;
              v23 = "found IOAccessoryConfigStream with active endpointUUID %@";
              goto LABEL_56;
            }
          }
        }
      }

    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v7)
      continue;
    break;
  }
  v19 = 0;
  v4 = v28;
LABEL_58:

LABEL_59:
  return v19;
}

- (id)_basePortForService:(unsigned int)a3
{
  NSObject *listQ;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  int v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD block[6];
  unsigned int v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__0;
  v29 = __Block_byref_object_dispose__0;
  v30 = 0;
  listQ = self->_listQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__ACCTransportIOAccessorySharedManager__basePortForService___block_invoke;
  block[3] = &unk_24D71A9B8;
  block[4] = self;
  block[5] = &v25;
  v24 = a3;
  dispatch_sync(listQ, block);
  if (objc_msgSend((id)v26[5], "count") != 1)
  {
    v10 = objc_msgSend((id)v26[5], "count");
    if (gLogObjects)
      v11 = gNumLogObjects <= 1;
    else
      v11 = 1;
    v12 = !v11;
    if (v10)
    {
      if (v12)
      {
        v4 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v4 = MEMORY[0x24BDACB70];
        v13 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        goto LABEL_31;
    }
    else
    {
      if (v12)
      {
        v4 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v4 = MEMORY[0x24BDACB70];
        v14 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        goto LABEL_31;
    }
    v15 = objc_msgSend((id)v26[5], "count");
    v16 = v26[5];
    *(_DWORD *)buf = 134218242;
    v32 = v15;
    v33 = 2112;
    v34 = v16;
    _os_log_impl(&dword_21722C000, v4, OS_LOG_TYPE_INFO, "Found %lu IOBase Ports contained in set! %@", buf, 0x16u);
LABEL_31:
    v6 = 0;
    goto LABEL_32;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = (id)v26[5];
  v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v35, 16);
  if (!v5)
    goto LABEL_31;
  v6 = 0;
  v7 = *(_QWORD *)v20;
  do
  {
    v8 = 0;
    v9 = v6;
    do
    {
      if (*(_QWORD *)v20 != v7)
        objc_enumerationMutation(v4);
      v6 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * v8);

      ++v8;
      v9 = v6;
    }
    while (v5 != v8);
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v35, 16);
  }
  while (v5);
LABEL_32:

  v17 = v6;
  _Block_object_dispose(&v25, 8);

  return v17;
}

void __60__ACCTransportIOAccessorySharedManager__basePortForService___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  int v7;

  objc_msgSend(*(id *)(a1 + 32), "allIOAccessories");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__ACCTransportIOAccessorySharedManager__basePortForService___block_invoke_2;
  v6[3] = &__block_descriptor_36_e41_B24__0__ACCTransportIOAccessoryBase_8_B16l;
  v7 = *(_DWORD *)(a1 + 48);
  objc_msgSend(v5, "objectsPassingTest:", v6);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

BOOL __60__ACCTransportIOAccessorySharedManager__basePortForService___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  int v5;
  int v6;

  v5 = objc_msgSend(a2, "ioService");
  v6 = *(_DWORD *)(a1 + 32);
  if (v5 == v6)
    *a3 = 1;
  return v5 == v6;
}

- (id)_basePortForEndpointUUID:(id)a3
{
  id v4;
  NSObject *listQ;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  __CFString *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD block[5];
  __CFString *v23;
  id v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  const __CFString *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__0;
  v34 = __Block_byref_object_dispose__0;
  v35 = 0;
  listQ = self->_listQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__ACCTransportIOAccessorySharedManager__basePortForEndpointUUID___block_invoke;
  block[3] = &unk_24D71AA08;
  v29 = &v30;
  block[4] = self;
  v23 = CFSTR("ACCTransportIOAccessoryPort");
  v6 = v4;
  v24 = v6;
  v25 = CFSTR("ACCTransportIOAccessoryEA");
  v26 = CFSTR("ACCTransportIOAccessoryOOBPairing");
  v27 = CFSTR("ACCTransportIOAccessoryAuthCP");
  v28 = CFSTR("ACCTransportIOAccessoryConfigStream");
  dispatch_sync(listQ, block);
  if (objc_msgSend((id)v31[5], "count") != 1)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v7 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v14 = objc_msgSend((id)v31[5], "count");
      *(_DWORD *)buf = 134218242;
      v37 = v14;
      v38 = 2112;
      v39 = v6;
      _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_INFO, "Found %lu IOBase Ports contained in set for endpointUUID! %@", buf, 0x16u);
    }
    goto LABEL_18;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (id)v31[5];
  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v40, 16);
  if (!v8)
  {
LABEL_18:
    v9 = 0;
    goto LABEL_19;
  }
  v9 = 0;
  v10 = *(_QWORD *)v19;
  do
  {
    v11 = 0;
    v12 = v9;
    do
    {
      if (*(_QWORD *)v19 != v10)
        objc_enumerationMutation(v7);
      v9 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * v11);

      ++v11;
      v12 = v9;
    }
    while (v8 != v11);
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v40, 16);
  }
  while (v8);
LABEL_19:

  v15 = (__CFString *)v28;
  v16 = v9;

  _Block_object_dispose(&v30, 8);
  return v16;
}

void __65__ACCTransportIOAccessorySharedManager__basePortForEndpointUUID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "allIOAccessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__ACCTransportIOAccessorySharedManager__basePortForEndpointUUID___block_invoke_2;
  v6[3] = &unk_24D71A9E0;
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 64);
  v11 = *(id *)(a1 + 72);
  v12 = *(id *)(a1 + 80);
  objc_msgSend(v2, "objectsPassingTest:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __65__ACCTransportIOAccessorySharedManager__basePortForEndpointUUID___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  int v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  NSClassFromString(*(NSString **)(a1 + 32));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NSClassFromString(*(NSString **)(a1 + 48));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "endpointUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 40));

      if (!v10)
        goto LABEL_35;
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v8 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v8 = MEMORY[0x24BDACB70];
        v18 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        goto LABEL_47;
      v19 = *(_QWORD *)(a1 + 40);
      v29 = 138412290;
      v30 = v19;
      v15 = "Found IOAccessoryEA with endpointUUID %@";
    }
    else
    {
      NSClassFromString(*(NSString **)(a1 + 56));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "endpointUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 40));

        if (!v12)
          goto LABEL_35;
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v8 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v8 = MEMORY[0x24BDACB70];
          v24 = MEMORY[0x24BDACB70];
        }
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          goto LABEL_47;
        v25 = *(_QWORD *)(a1 + 40);
        v29 = 138412290;
        v30 = v25;
        v15 = "Found IOAccessoryOOBPairing with endpointUUID %@";
      }
      else
      {
        NSClassFromString(*(NSString **)(a1 + 64));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v5, "endpointUUID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", *(_QWORD *)(a1 + 40));

          if (!v17)
            goto LABEL_35;
          if (gLogObjects && gNumLogObjects >= 2)
          {
            v8 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v8 = MEMORY[0x24BDACB70];
            v26 = MEMORY[0x24BDACB70];
          }
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
            goto LABEL_47;
          v27 = *(_QWORD *)(a1 + 40);
          v29 = 138412290;
          v30 = v27;
          v15 = "Found IOAccessoryAuthCP with endpointUUID %@";
        }
        else
        {
          NSClassFromString(*(NSString **)(a1 + 72));
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_35;
          objc_msgSend(v5, "endpointUUID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToString:", *(_QWORD *)(a1 + 40));

          if (!v21)
            goto LABEL_35;
          logObjectForModule_0(1);
          v8 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
LABEL_47:

            v23 = 1;
            *a3 = 1;
            goto LABEL_48;
          }
          v22 = *(_QWORD *)(a1 + 40);
          v29 = 138412290;
          v30 = v22;
          v15 = "Found IOAccessoryConfigStream with endpointUUID %@";
        }
      }
    }
LABEL_46:
    _os_log_impl(&dword_21722C000, v8, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v29, 0xCu);
    goto LABEL_47;
  }
  objc_msgSend(v5, "ioAccPortEndpointUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 40));

  if (v7)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v8 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_47;
    v14 = *(_QWORD *)(a1 + 40);
    v29 = 138412290;
    v30 = v14;
    v15 = "Found IOAccessoryPort with endpointUUID %@";
    goto LABEL_46;
  }
LABEL_35:
  v23 = 0;
LABEL_48:

  return v23;
}

- (id)_basePortForConnectionUUID:(id)a3
{
  id v4;
  NSObject *listQ;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD block[5];
  __CFString *v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  v31 = 0;
  listQ = self->_listQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__ACCTransportIOAccessorySharedManager__basePortForConnectionUUID___block_invoke;
  block[3] = &unk_24D71AA58;
  v25 = &v26;
  block[4] = self;
  v23 = CFSTR("ACCTransportIOAccessoryAuthCP");
  v6 = v4;
  v24 = v6;
  dispatch_sync(listQ, block);
  if (objc_msgSend((id)v27[5], "count") != 1)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v7 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v14 = objc_msgSend((id)v27[5], "count");
      *(_DWORD *)buf = 134218242;
      v33 = v14;
      v34 = 2112;
      v35 = v6;
      _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_INFO, "Found %lu IOBase Ports contained in set for connectionUUID! %@", buf, 0x16u);
    }
    goto LABEL_18;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (id)v27[5];
  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v36, 16);
  if (!v8)
  {
LABEL_18:
    v9 = 0;
    goto LABEL_19;
  }
  v9 = 0;
  v10 = *(_QWORD *)v19;
  do
  {
    v11 = 0;
    v12 = v9;
    do
    {
      if (*(_QWORD *)v19 != v10)
        objc_enumerationMutation(v7);
      v9 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * v11);

      ++v11;
      v12 = v9;
    }
    while (v8 != v11);
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v36, 16);
  }
  while (v8);
LABEL_19:

  v15 = v24;
  v16 = v9;

  _Block_object_dispose(&v26, 8);
  return v16;
}

void __67__ACCTransportIOAccessorySharedManager__basePortForConnectionUUID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "allIOAccessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__ACCTransportIOAccessorySharedManager__basePortForConnectionUUID___block_invoke_2;
  v6[3] = &unk_24D71AA30;
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "objectsPassingTest:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __67__ACCTransportIOAccessorySharedManager__basePortForConnectionUUID___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  NSClassFromString(*(NSString **)(a1 + 32));
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v5, "connectionUUID"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 40)),
        v6,
        v7))
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v8 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v10 = MEMORY[0x24BDACB70];
    }
    v9 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v13 = 138412290;
      v14 = v11;
      _os_log_impl(&dword_21722C000, v8, OS_LOG_TYPE_INFO, "Found IOAccessoryAuthCP with connectionUUID %@", (uint8_t *)&v13, 0xCu);
    }

    *a3 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_portForManagerMatchingPrimaryPort:(id)a3
{
  id v4;
  NSObject *listQ;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  int v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD block[4];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  int v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  v31 = 0;
  listQ = self->_listQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__ACCTransportIOAccessorySharedManager__portForManagerMatchingPrimaryPort___block_invoke;
  block[3] = &unk_24D71AAA8;
  v25 = &v26;
  v6 = v4;
  v24 = v6;
  dispatch_sync(listQ, block);
  if (objc_msgSend((id)v27[5], "count") != 1)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v7 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v14 = objc_msgSend((id)v27[5], "count");
      v15 = objc_msgSend(v6, "primaryPortNumber");
      *(_DWORD *)buf = 134218240;
      v33 = v14;
      v34 = 1024;
      v35 = v15;
      _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_INFO, "Found %lu IOBase Ports contained in set for primaryPort %d", buf, 0x12u);
    }
    goto LABEL_18;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = (id)v27[5];
  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v36, 16);
  if (!v8)
  {
LABEL_18:
    v9 = 0;
    goto LABEL_19;
  }
  v9 = 0;
  v10 = *(_QWORD *)v20;
  do
  {
    v11 = 0;
    v12 = v9;
    do
    {
      if (*(_QWORD *)v20 != v10)
        objc_enumerationMutation(v7);
      v9 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * v11);

      ++v11;
      v12 = v9;
    }
    while (v8 != v11);
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v36, 16);
  }
  while (v8);
LABEL_19:

  v16 = v24;
  v17 = v9;

  _Block_object_dispose(&v26, 8);
  return v17;
}

void __75__ACCTransportIOAccessorySharedManager__portForManagerMatchingPrimaryPort___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "ioAccessoryChildPorts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __75__ACCTransportIOAccessorySharedManager__portForManagerMatchingPrimaryPort___block_invoke_2;
  v6[3] = &unk_24D71AA80;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v2, "objectsPassingTest:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __75__ACCTransportIOAccessorySharedManager__portForManagerMatchingPrimaryPort___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  id v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  int v11;
  int v12;
  _DWORD v14[2];
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_7;
  v6 = v5;
  v7 = objc_msgSend(v6, "portIDNumber");
  if (v7 != objc_msgSend(*(id *)(a1 + 32), "primaryPortNumber"))
  {

LABEL_7:
    v9 = 0;
    goto LABEL_14;
  }
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v8 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v8 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v6, "portIDNumber");
    v12 = objc_msgSend(*(id *)(a1 + 32), "primaryPortNumber");
    v14[0] = 67109376;
    v14[1] = v11;
    v15 = 1024;
    v16 = v12;
    _os_log_impl(&dword_21722C000, v8, OS_LOG_TYPE_DEFAULT, "Found IOAccessoryPort with portID %d, matching primaryPort %d", (uint8_t *)v14, 0xEu);
  }

  v9 = 1;
  *a3 = 1;

LABEL_14:
  return v9;
}

- (void)_processEAService:(unsigned int)a3 andPublish:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  void *v7;
  ACCTransportIOAccessoryEA *v8;
  NSObject *listQ;
  NSObject *v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  NSMutableArray *deferEAServiceArray;
  DeferredEAServiceWrapper *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  ACCTransportIOAccessorySharedManager *v31;
  ACCTransportIOAccessoryEA *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v39 = *MEMORY[0x24BDAC8D0];
  -[ACCTransportIOAccessorySharedManager _managerForIOService:shouldCreateNewService:](self, "_managerForIOService:shouldCreateNewService:", *(_QWORD *)&a3, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isAuthenticated"))
  {
    v8 = -[ACCTransportIOAccessoryEA initWithDelegate:andIOService:]([ACCTransportIOAccessoryEA alloc], "initWithDelegate:andIOService:", self, v5);
    if (-[ACCTransportIOAccessorySharedManager _addACCTransportToManager:](self, "_addACCTransportToManager:", v8))
    {
      listQ = self->_listQ;
      v27 = MEMORY[0x24BDAC760];
      v28 = 3221225472;
      v29 = __69__ACCTransportIOAccessorySharedManager__processEAService_andPublish___block_invoke;
      v30 = &unk_24D71A1D8;
      v31 = self;
      v32 = v8;
      dispatch_sync(listQ, &v27);
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v10 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v10 = MEMORY[0x24BDACB70];
        v17 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_INFO, "Successfully added io accessory EA service to all ports list", buf, 2u);
      }

    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v13 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v13 = MEMORY[0x24BDACB70];
        v18 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v34) = -[ACCTransportIOAccessoryBase ioService](v8, "ioService");
        _os_log_impl(&dword_21722C000, v13, OS_LOG_TYPE_INFO, "Couldn't find upstream io acc manager service for accEA service %d", buf, 8u);
      }

    }
    -[ACCTransportIOAccessoryEA deviceModelNumber](v8, "deviceModelNumber", v27, v28, v29, v30, v31);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isEqualToString:", CFSTR("A1468")))
    {

    }
    else
    {
      -[ACCTransportIOAccessoryEA deviceModelNumber](v8, "deviceModelNumber");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("A1450"));

      if (!v21)
      {
LABEL_44:
        -[ACCTransportIOAccessorySharedManager _createEAProtocolsForManager:](self, "_createEAProtocolsForManager:", v7);
        if (v4)
        {
          -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "connectionUUID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "publishConnectionWithUUID:", v26);

        }
        goto LABEL_47;
      }
    }
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v22 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v22 = MEMORY[0x24BDACB70];
      v23 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[ACCTransportIOAccessoryEA deviceModelNumber](v8, "deviceModelNumber");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v24;
      _os_log_impl(&dword_21722C000, v22, OS_LOG_TYPE_DEFAULT, "Have a B139/B164 connected, accEA.deviceModelNumber %@", buf, 0xCu);

    }
    self->_isB139OrB164Connected = 1;
    goto LABEL_44;
  }
  if (gLogObjects)
    v11 = gNumLogObjects < 2;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v14 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v14 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v34 = v7;
    v35 = 1024;
    v36 = objc_msgSend(v7, "isAuthenticated");
    v37 = 1024;
    v38 = v5;
    _os_log_impl(&dword_21722C000, v14, OS_LOG_TYPE_DEFAULT, "accMgrInstance=%@ isAuthenticated=%d Defer creating of ACCTransportIOAccessoryEA until auth passes for accEa %d", buf, 0x18u);
  }

  deferEAServiceArray = self->_deferEAServiceArray;
  v16 = -[DeferredEAServiceWrapper initWithIOService:withMgr:]([DeferredEAServiceWrapper alloc], "initWithIOService:withMgr:", v5, v7);
  -[NSMutableArray addObject:](deferEAServiceArray, "addObject:", v16);

  IOObjectRetain(v5);
LABEL_47:

}

uint64_t __69__ACCTransportIOAccessorySharedManager__processEAService_andPublish___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)_createEAProtocolsForManager:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t i;
  void *v28;
  void *v29;
  uint64_t v30;
  int v31;
  BOOL v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _QWORD v42[2];
  _QWORD v43[2];
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "connectionUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "createConnectionWithType:andIdentifier:", objc_msgSend(v4, "connectionType"), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSupervisedTransportsRestricted:forConnectionWithUUID:", objc_msgSend(v4, "supervisedTransportsRestricted"), v7);

      objc_msgSend(v4, "setConnectionUUID:", v7);
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v9 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v9 = MEMORY[0x24BDACB70];
        v10 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "connectionUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v45 = (uint64_t)v11;
        _os_log_impl(&dword_21722C000, v9, OS_LOG_TYPE_INFO, "Created a new connection with UUID: %@", buf, 0xCu);

      }
      v42[0] = *MEMORY[0x24BE1A178];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", (int)objc_msgSend(v4, "primaryPortNumber"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v12;
      v42[1] = *MEMORY[0x24BE1A158];
      objc_msgSend(v4, "digitalID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (!v13)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v43[1] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)

      -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "copy");
      objc_msgSend(v16, "setProperties:forConnectionWithUUID:", v17, v7);

    }
    objc_msgSend(v4, "eaProtocolChildPorts");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v19 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v19 = MEMORY[0x24BDACB70];
      v20 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v45 = (uint64_t)v18;
      _os_log_impl(&dword_21722C000, v19, OS_LOG_TYPE_INFO, "accEAEndpointsForManager = %@", buf, 0xCu);
    }

    -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v35 = v18;
      v22 = v18;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v38;
        v26 = MEMORY[0x24BDACB70];
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v38 != v25)
              objc_enumerationMutation(v22);
            v28 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            objc_msgSend(v28, "endpointUUID");
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
            {
              v30 = gLogObjects;
              v31 = gNumLogObjects;
              if (gLogObjects)
                v32 = gNumLogObjects < 2;
              else
                v32 = 1;
              if (v32)
              {
                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218240;
                  v45 = v30;
                  v46 = 1024;
                  v47 = v31;
                  _os_log_error_impl(&dword_21722C000, v26, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                v33 = v26;
                v34 = v26;
              }
              else
              {
                v34 = *(id *)(gLogObjects + 8);
              }
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_21722C000, v34, OS_LOG_TYPE_INFO, "Skipped re-creating endpoint with existing UUID.", buf, 2u);
              }

            }
            else
            {
              -[ACCTransportIOAccessorySharedManager _createEAEndpointForProtocol:andManager:](self, "_createEAEndpointForProtocol:andManager:", v28, v4);
            }
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v24);
      }

      v18 = v35;
    }

  }
}

- (void)_createEAEndpointForProtocol:(id)a3 andManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  ACCTransportIOAccessorySharedManager *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  ACCTransportIOAccessorySharedManager *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  _QWORD v42[9];
  _QWORD v43[11];

  v43[9] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v30 = self;
    v42[0] = *MEMORY[0x24BE1A118];
    objc_msgSend(v6, "deviceName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v35;
    v42[1] = *MEMORY[0x24BE1A110];
    objc_msgSend(v6, "deviceModelNumber");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v34;
    v42[2] = *MEMORY[0x24BE1A108];
    objc_msgSend(v6, "deviceVendorName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2] = v33;
    v42[3] = *MEMORY[0x24BE1A138];
    objc_msgSend(v6, "deviceSerialNumber");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v32;
    v42[4] = *MEMORY[0x24BE1A0F8];
    objc_msgSend(v6, "deviceFirmwareRevision");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v43[4] = v31;
    v42[5] = *MEMORY[0x24BE1A100];
    objc_msgSend(v6, "deviceHardwareRevision");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v43[5] = v9;
    v42[6] = *MEMORY[0x24BE1A120];
    objc_msgSend(v7, "ppid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v43[6] = v11;
    v42[7] = *MEMORY[0x24BE1A130];
    objc_msgSend(v7, "regionCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v43[7] = v13;
    v42[8] = *MEMORY[0x24BE1A0E8];
    objc_msgSend(v7, "inductiveDeviceUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v43[8] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)

    if (!v12)
    if (!v10)

    if (gLogObjects && gNumLogObjects >= 2)
    {
      v17 = *(id *)(gLogObjects + 8);
      v18 = v30;
    }
    else
    {
      v18 = v30;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v17 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "eaProtocol");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "connectionUUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v37 = v16;
      v38 = 2112;
      v39 = v20;
      v40 = 2112;
      v41 = v21;
      _os_log_impl(&dword_21722C000, v17, OS_LOG_TYPE_INFO, "accInfoDictionary = %@, accEAProtocol.eaProtocol = %@, ioAccMgr.connectionUUID = %@", buf, 0x20u);

    }
    -[ACCTransportIOAccessorySharedManager delegate](v18, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "eaProtocol");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "connectionUUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");
    objc_msgSend(v22, "createEndpointWithTransportType:andProtocol:andIdentifier:forConnectionWithUUID:publishConnection:", 5, 5, v23, v25, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[ACCTransportIOAccessorySharedManager delegate](v18, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAccessoryInfo:forEndpointWithUUID:", v16, v26);

    v28 = (void *)objc_msgSend(v26, "copy");
    objc_msgSend(v6, "setEndpointUUID:", v28);

    objc_msgSend(v7, "connectionUUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setParentConnectionUUID:", v29);

  }
}

- (void)_clearChildPortEndpointsForManagerDisconnection:(id)a3
{
  id v3;

  objc_msgSend(a3, "ioAccessoryChildPorts");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_85);

}

void __88__ACCTransportIOAccessorySharedManager__clearChildPortEndpointsForManagerDisconnection___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
    if (gLogObjects)
      v4 = gNumLogObjects < 2;
    else
      v4 = 1;
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v5 = MEMORY[0x24BDACB70];
    }
    else
    {
      v6 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "ioAccPortEndpointUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v7;
      _os_log_impl(&dword_21722C000, v6, OS_LOG_TYPE_DEFAULT, "Clearing endpointUUID %@ from childIOAccessoryPort", (uint8_t *)&v20, 0xCu);

    }
    objc_msgSend(v3, "setIoAccPortEndpointUUID:", 0);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v2;
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v9 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v10 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "endpointUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v11;
      _os_log_impl(&dword_21722C000, v9, OS_LOG_TYPE_DEFAULT, "Clearing endpointUUID %@ from childEAAccessoryPort", (uint8_t *)&v20, 0xCu);

    }
    objc_msgSend(v8, "setEndpointUUID:", 0);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v2;
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v13 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v13 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "endpointUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v15;
      _os_log_impl(&dword_21722C000, v13, OS_LOG_TYPE_DEFAULT, "Clearing endpointUUID %@ from childOOBPairingPort", (uint8_t *)&v20, 0xCu);

    }
    objc_msgSend(v12, "setEndpointUUID:", 0);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v2;
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v17 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v17 = MEMORY[0x24BDACB70];
      v18 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v16, "endpointUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v19;
      _os_log_impl(&dword_21722C000, v17, OS_LOG_TYPE_DEFAULT, "Clearing endpointUUID %@ from childConfigStreamPort", (uint8_t *)&v20, 0xCu);

    }
    objc_msgSend(v16, "setEndpointUUID:", 0);

  }
}

- (int)_connectionTypeForIOAccessoryPort:(id)a3
{
  id v4;
  char Type;
  int v6;
  int v7;

  v4 = a3;
  objc_msgSend(v4, "upstreamManagerService");
  Type = IOAccessoryManagerGetType();
  if (Type == 3 || (!self->_bIsWatch && (Type & 0xF) != 5 ? (v6 = 1) : (v6 = 4), Type == 6))
    v6 = 6;
  v7 = objc_msgSend(v4, "portIDNumber");

  if (v7 == 257)
    return 8;
  if (v7 == 256)
    return 3;
  return v6;
}

- (int)_endpointTransportTypeForIOAccessoryPort:(id)a3
{
  id v3;
  int v4;
  int v5;
  int v6;
  int v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "portIDNumber");
  if ((v4 - 6) <= 0xF)
  {
    v5 = objc_msgSend(v3, "portTransportType");
    v6 = v5;
    if (v5 == 7)
      goto LABEL_18;
    if (v5 != 19)
    {
      v6 = 1;
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  v6 = 5;
  if (v4 > 256)
  {
    if (v4 == 257)
    {
      v6 = 9;
      goto LABEL_18;
    }
    if (v4 == 512)
    {
LABEL_14:
      if (objc_msgSend(v3, "portStreamType") == 5)
        v6 = 14;
      else
        v6 = 12;
    }
  }
  else
  {
    if (v4 == 2)
      v7 = 0;
    else
      v7 = 5;
    if (v4 == 1)
      v6 = 6;
    else
      v6 = v7;
  }
LABEL_18:

  return v6;
}

- (BOOL)_addACCTransportToManager:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  int v14;
  id v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACCTransportIOAccessorySharedManager _managerForBase:](self, "_managerForBase:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (gLogObjects)
    v7 = gNumLogObjects <= 1;
  else
    v7 = 1;
  v8 = !v7;
  if (v5)
  {
    if (v8)
    {
      v9 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 67109120;
      LODWORD(v15) = objc_msgSend(v6, "ioService");
      _os_log_impl(&dword_21722C000, v9, OS_LOG_TYPE_DEFAULT, "Found IOAccessoryManager with service %u, adding child port to manager", (uint8_t *)&v14, 8u);
    }

    objc_msgSend(v6, "addIOAccessoryChildPort:", v4);
  }
  else
  {
    if (v8)
    {
      v10 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v14 = 138413058;
      v15 = v4;
      v16 = 1024;
      v17 = objc_msgSend(v4, "ioService");
      v18 = 1024;
      v19 = objc_msgSend(v4, "primaryPortNumber");
      v20 = 1024;
      v21 = objc_msgSend(v4, "upstreamManagerService");
      _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_INFO, "Couldn't find Manager for basePort %@, ioService %d, primaryPortNumber %d, upstreamManagerService %d", (uint8_t *)&v14, 0x1Eu);
    }

  }
  return v6 != 0;
}

- (void)_handleRequestForIAPDPortB139B164Connected:(id)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = -[ACCTransportIOAccessorySharedManager isB139OrB164Connected](self, "isB139OrB164Connected", a3);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BE1A020];
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", *MEMORY[0x24BE1A050], 0, v5);

}

- (void)_handleRequestForPrimaryPort:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  int v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE1A028]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogObjects)
    v6 = gNumLogObjects < 2;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v8 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  else
  {
    v8 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v5;
    _os_log_impl(&dword_21722C000, v8, OS_LOG_TYPE_INFO, "Request for primary port: connectionUUID = %@", buf, 0xCu);
  }

  -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:](self, "_managerForConnectionUUID:", v5);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (gLogObjects)
    v11 = gNumLogObjects <= 1;
  else
    v11 = 1;
  v12 = !v11;
  if (v9)
  {
    if (v12)
    {
      v13 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v13 = MEMORY[0x24BDACB70];
      v15 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(v10, "primaryPortNumber");
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v16;
      _os_log_impl(&dword_21722C000, v13, OS_LOG_TYPE_DEFAULT, "Request for primary port: found managerForConnectionUUID. PrimaryPort is %d", buf, 8u);
    }

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v10, "primaryPortNumber"));
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v12)
    {
      v14 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v14 = MEMORY[0x24BDACB70];
      v18 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21722C000, v14, OS_LOG_TYPE_DEFAULT, "Request for primary port: did not find managerForConnectionUUID for primary port! Assume primary port number is built-in port", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v17;
  v22 = *MEMORY[0x24BE1A018];
  v23 = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "postNotificationName:object:userInfo:", *MEMORY[0x24BE1A058], 0, v20);

}

- (void)handleOpenEASessionNotification:(id)a3
{
  void *v3;
  BOOL v4;
  id v5;

  -[ACCTransportIOAccessorySharedManager _basePortForEndpointUUID:](self, "_basePortForEndpointUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    v4 = objc_msgSend(v3, "ioServiceClassType") == 2;
    v3 = v5;
    if (v4)
    {
      objc_msgSend(v5, "openEAServiceSession");
      v3 = v5;
    }
  }

}

- (void)handleCloseEASessionNotification:(id)a3
{
  void *v3;
  BOOL v4;
  id v5;

  -[ACCTransportIOAccessorySharedManager _basePortForEndpointUUID:](self, "_basePortForEndpointUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    v4 = objc_msgSend(v3, "ioServiceClassType") == 2;
    v3 = v5;
    if (v4)
    {
      objc_msgSend(v5, "closeEAServiceSession");
      v3 = v5;
    }
  }

}

- (void)_handleUSBHostPluginArrived:(id)a3
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (gLogObjects)
    v4 = gNumLogObjects < 2;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = CFSTR("ACCTransportIOAccessory_USBHostPluginArrivedNotification");
    v10 = 2112;
    v11 = CFSTR("ACCTransportIOAccessory_IOAccessoryManagerArrivedNotification");
    _os_log_impl(&dword_21722C000, v6, OS_LOG_TYPE_DEFAULT, "Received %@ notification, notifying %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("ACCTransportIOAccessory_IOAccessoryManagerArrivedNotification"), 0);

}

- (void)transmitData:(id)a3 forEndpointUUID:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  os_signpost_id_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  int v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 2;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:].cold.3();

  if (acc_userDefaultsLogging_BOOLForKey((uint64_t)CFSTR("TransportSignpost")))
  {
    if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
    {
      v11 = *(id *)(gLogSignpostObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:].cold.2();
      v11 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    v13 = objc_msgSend(v7, "hash");
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v11))
      {
        v19 = 138412546;
        v20 = v7;
        v21 = 2048;
        v22 = objc_msgSend(v6, "length");
        _os_signpost_emit_with_name_impl(&dword_21722C000, v11, OS_SIGNPOST_EVENT, v14, "Endpoint SEND", "Send outgoing data! %@, %lu bytes", (uint8_t *)&v19, 0x16u);
      }
    }

  }
  -[ACCTransportIOAccessorySharedManager _basePortForEndpointUUID:](self, "_basePortForEndpointUUID:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "transmitData:", v6);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v17 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v17 = MEMORY[0x24BDACB70];
      v18 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v19 = 138412290;
      v20 = v7;
      _os_log_impl(&dword_21722C000, v17, OS_LOG_TYPE_INFO, "No ACCTransport handler for connectionUUID %@", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (BOOL)shouldEnableDirectAWCAuth
{
  BOOL v3;
  id v4;
  NSObject *v5;

  if (gLogObjects)
    v3 = gNumLogObjects < 2;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ACCTransportIOAccessorySharedManager shouldEnableDirectAWCAuth].cold.1((uint64_t)self);

  return -[ACCSettingsState BOOLValue](self->_enableDirectAWCAuth, "BOOLValue");
}

- (BOOL)setProperties:(id)a3 forManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = 0;
  if (v6 && v8)
  {

    if (!v7)
    {
      v10 = 0;
      goto LABEL_6;
    }
    -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "connectionUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "setProperties:forConnectionWithUUID:", v6, v11);

  }
LABEL_6:

  return v10;
}

- (BOOL)openEASession:(id)a3 withEAEndpointUUID:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  id v15;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 2;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v17 = 138412546;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_INFO, "Opening EA session for protocol %@ and endpoint UUID %@", (uint8_t *)&v17, 0x16u);
  }

  -[ACCTransportIOAccessorySharedManager _basePortForEndpointUUID:](self, "_basePortForEndpointUUID:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, "openEAServiceSession");
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v14 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v14 = MEMORY[0x24BDACB70];
      v15 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v17 = 138412290;
      v18 = v6;
      _os_log_impl(&dword_21722C000, v14, OS_LOG_TYPE_INFO, "Could not find ACCTransportIOAccessoryEA object for protocol %@", (uint8_t *)&v17, 0xCu);
    }

    v13 = 0;
  }

  return v13;
}

- (void)closeEASession:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 2;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v12 = 138412290;
    v13 = v4;
    _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_INFO, "Closing EA session for eaEndpointUUID %@", (uint8_t *)&v12, 0xCu);
  }

  -[ACCTransportIOAccessorySharedManager _basePortForEndpointUUID:](self, "_basePortForEndpointUUID:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "closeEAServiceSession");
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v10 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_INFO, "Could not find ACCTransportIOAccessoryEA object for eaEndpointUUID %@", (uint8_t *)&v12, 0xCu);
    }

  }
}

- (BOOL)setUSBMode:(int)a3 forConnectionUUID:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;
  int v11;
  NSObject *v12;
  BOOL v13;
  id v14;
  id v15;
  BOOL v16;
  id v17;
  int v19;
  id v20;
  uint64_t v21;

  v4 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:](self, "_managerForConnectionUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    if (gLogObjects)
      v13 = gNumLogObjects < 2;
    else
      v13 = 1;
    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    else
    {
      v12 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v19 = 138412290;
      v20 = v6;
      _os_log_impl(&dword_21722C000, v12, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v19, 0xCu);
    }
    goto LABEL_34;
  }
  v9 = objc_msgSend(v7, "setUSBMode:", v4);
  if (gLogObjects)
    v10 = gNumLogObjects <= 1;
  else
    v10 = 1;
  v11 = !v10;
  if (!v9)
  {
    if (v11)
    {
      v12 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v17 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessorySharedManager setUSBMode:forConnectionUUID:].cold.4();
LABEL_34:
    v16 = 0;
    goto LABEL_35;
  }
  if (v11)
  {
    v12 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v12 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACCTransportIOAccessorySharedManager setUSBMode:forConnectionUUID:].cold.2();
  v16 = 1;
LABEL_35:

  return v16;
}

- (BOOL)setUSBMode:(int)a3 forEndpointUUID:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;
  int v11;
  NSObject *v12;
  BOOL v13;
  id v14;
  id v15;
  BOOL v16;
  id v17;
  int v19;
  id v20;
  uint64_t v21;

  v4 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[ACCTransportIOAccessorySharedManager _managerForBaseEndpointUUID:](self, "_managerForBaseEndpointUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    if (gLogObjects)
      v13 = gNumLogObjects < 2;
    else
      v13 = 1;
    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    else
    {
      v12 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v19 = 138412290;
      v20 = v6;
      _os_log_impl(&dword_21722C000, v12, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base endpoint UUID %@", (uint8_t *)&v19, 0xCu);
    }
    goto LABEL_34;
  }
  v9 = objc_msgSend(v7, "setUSBMode:", v4);
  if (gLogObjects)
    v10 = gNumLogObjects <= 1;
  else
    v10 = 1;
  v11 = !v10;
  if (!v9)
  {
    if (v11)
    {
      v12 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v17 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessorySharedManager setUSBMode:forEndpointUUID:].cold.4();
LABEL_34:
    v16 = 0;
    goto LABEL_35;
  }
  if (v11)
  {
    v12 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v12 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACCTransportIOAccessorySharedManager setUSBMode:forEndpointUUID:].cold.2();
  v16 = 1;
LABEL_35:

  return v16;
}

- (int)USBModeForConnectionUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  id v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:](self, "_managerForConnectionUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "getUSBMode");
    if (gLogObjects)
      v8 = gNumLogObjects < 2;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v12 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[ACCTransportIOAccessorySharedManager setUSBMode:forConnectionUUID:].cold.2();
  }
  else
  {
    if (gLogObjects)
      v10 = gNumLogObjects < 2;
    else
      v10 = 1;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    else
    {
      v12 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_impl(&dword_21722C000, v12, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v14, 0xCu);
    }
    v7 = -1;
  }

  return v7;
}

- (int)USBModeForEndpointUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  id v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACCTransportIOAccessorySharedManager _managerForBaseEndpointUUID:](self, "_managerForBaseEndpointUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "getUSBMode");
    if (gLogObjects)
      v8 = gNumLogObjects < 2;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v12 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[ACCTransportIOAccessorySharedManager setUSBMode:forEndpointUUID:].cold.2();
  }
  else
  {
    if (gLogObjects)
      v10 = gNumLogObjects < 2;
    else
      v10 = 1;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    else
    {
      v12 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_impl(&dword_21722C000, v12, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base endpoint UUID %@", (uint8_t *)&v14, 0xCu);
    }
    v7 = -1;
  }

  return v7;
}

- (int)_accPlatformPowerModeToIOAccessoryPowerMode:(int)a3
{
  return a3;
}

- (BOOL)configureAccessoryPowerMode:(int)a3 forConnectionUUID:(id)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  int v15;
  id v16;
  uint64_t v17;

  v4 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = -[ACCTransportIOAccessorySharedManager _accPlatformPowerModeToIOAccessoryPowerMode:](self, "_accPlatformPowerModeToIOAccessoryPowerMode:", v4);
  -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:](self, "_managerForConnectionUUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setAccessoryPowerMode:", v7);
    v10 = objc_msgSend(v9, "accessoryPowerMode") == (_DWORD)v7;
  }
  else
  {
    if (gLogObjects)
      v11 = gNumLogObjects < 2;
    else
      v11 = 1;
    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v13 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    else
    {
      v13 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v15 = 138412290;
      v16 = v6;
      _os_log_impl(&dword_21722C000, v13, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v15, 0xCu);
    }

    v10 = 0;
  }

  return v10;
}

- (BOOL)setUSBCurrentOffset:(int)a3 forConnectionUUID:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v4 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:](self, "_managerForConnectionUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "setUSBCurrentOffset:", v4);
  }
  else
  {
    if (gLogObjects)
      v10 = gNumLogObjects < 2;
    else
      v10 = 1;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    else
    {
      v12 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_21722C000, v12, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v14, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (BOOL)setUSBCurrentLimitBase:(unsigned int)a3 forConnectionUUID:(id)a4 forceResponse:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  int v16;
  id v17;
  uint64_t v18;

  v5 = a5;
  v6 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:](self, "_managerForConnectionUUID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "setUSBCurrentLimitBase:forceResponse:", v6, v5);
  }
  else
  {
    if (gLogObjects)
      v12 = gNumLogObjects < 2;
    else
      v12 = 1;
    if (v12)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v14 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    else
    {
      v14 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = v8;
      _os_log_impl(&dword_21722C000, v14, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v16, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

- (unsigned)USBCurrentLimitInmA:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:](self, "_managerForConnectionUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "USBCurrentLimitInmA");
  }
  else
  {
    if (gLogObjects)
      v8 = gNumLogObjects < 2;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v12, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (unsigned)USBCurrentLimitBaseInmA:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:](self, "_managerForConnectionUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "USBCurrentLimitBaseInmA");
  }
  else
  {
    if (gLogObjects)
      v8 = gNumLogObjects < 2;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v12, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (unsigned)USBCurrentLimitOffsetInmA:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:](self, "_managerForConnectionUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "USBCurrentLimitOffsetInmA");
  }
  else
  {
    if (gLogObjects)
      v8 = gNumLogObjects < 2;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v12, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (unsigned)USBChargingVoltageInmV:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:](self, "_managerForConnectionUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "USBChargingVoltageInmV");
  }
  else
  {
    if (gLogObjects)
      v8 = gNumLogObjects < 2;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v12, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (int)CableType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:](self, "_managerForConnectionUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "cableType");
  }
  else
  {
    if (gLogObjects)
      v8 = gNumLogObjects < 2;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v12, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (unsigned)sleepPowerCurrentLimitInmA:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  unsigned int v12;
  NSObject *v13;
  unsigned int v14;
  unsigned int v15;
  NSObject *v16;
  char v17;
  NSObject *v18;
  id v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  int v24;
  id v26;
  void *v27;
  void *v28;
  int v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  unsigned int v41;
  __int16 v42;
  unsigned int v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:](self, "_managerForConnectionUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "isRootPort") & 1) == 0)
    {
      v7 = objc_msgSend(v6, "connectionType");
      if (v7 == 1)
      {
        v8 = 64;
      }
      else
      {
        if (v7 != 3)
          goto LABEL_23;
        v8 = 72;
      }
      v13 = *(id *)((char *)&self->super.isa + v8);
      if (v13)
      {
        v11 = v13;
        v12 = -[NSObject sleepPowerCurrentLimitInmA](v13, "sleepPowerCurrentLimitInmA");
        v14 = objc_msgSend(v6, "sleepPowerCurrentLimitInmA");
        v15 = v14;
        if (v12 >= v14)
        {
          v17 = 0;
          v12 = v14;
        }
        else
        {
          if (gLogObjects && gNumLogObjects >= 2)
          {
            v16 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v16 = MEMORY[0x24BDACB70];
            v26 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v6, "connectionUUID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v6, "primaryPortNumber");
            -[NSObject connectionUUID](v11, "connectionUUID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413826;
            v31 = v4;
            v32 = 2112;
            v33 = v27;
            v34 = 1024;
            v35 = v29;
            v36 = 2112;
            v37 = v28;
            v38 = 1024;
            v39 = -[NSObject primaryPortNumber](v11, "primaryPortNumber");
            v40 = 1024;
            v41 = v15;
            v42 = 1024;
            v43 = v12;
            _os_log_impl(&dword_21722C000, v16, OS_LOG_TYPE_INFO, "connectionUUID %@, accMgrTransport %@ (%d), rootMgr %@ (%d), sleepPowerCurrentLimitInmA=%d -> %d", buf, 0x38u);

          }
          v17 = 0;
        }
        goto LABEL_24;
      }
    }
LABEL_23:
    v12 = objc_msgSend(v6, "sleepPowerCurrentLimitInmA");
    v11 = 0;
    v17 = 1;
LABEL_24:
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v18 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v18 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "connectionUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v6, "primaryPortNumber");
      v22 = v21;
      if ((v17 & 1) != 0)
      {
        *(_DWORD *)buf = 138413570;
        v31 = v4;
        v32 = 2112;
        v33 = v20;
        v34 = 1024;
        v35 = v21;
        v36 = 2112;
        v37 = 0;
        v38 = 1024;
        v39 = -1;
        v40 = 1024;
        v41 = v12;
        _os_log_impl(&dword_21722C000, v18, OS_LOG_TYPE_INFO, "connectionUUID %@, accMgrTransport %@ (%d), rootMgr %@ (%d), sleepPowerCurrentLimitInmA=%d", buf, 0x32u);
      }
      else
      {
        -[NSObject connectionUUID](v11, "connectionUUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[NSObject primaryPortNumber](v11, "primaryPortNumber");
        *(_DWORD *)buf = 138413570;
        v31 = v4;
        v32 = 2112;
        v33 = v20;
        v34 = 1024;
        v35 = v22;
        v36 = 2112;
        v37 = v23;
        v38 = 1024;
        v39 = v24;
        v40 = 1024;
        v41 = v12;
        _os_log_impl(&dword_21722C000, v18, OS_LOG_TYPE_INFO, "connectionUUID %@, accMgrTransport %@ (%d), rootMgr %@ (%d), sleepPowerCurrentLimitInmA=%d", buf, 0x32u);

      }
    }

    goto LABEL_36;
  }
  if (gLogObjects)
    v9 = gNumLogObjects < 2;
  else
    v9 = 1;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v11 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  else
  {
    v11 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v4;
    _os_log_impl(&dword_21722C000, v11, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", buf, 0xCu);
  }
  v12 = 0;
LABEL_36:

  return v12;
}

- (BOOL)isPowerDuringSleepSupported:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:](self, "_managerForConnectionUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "isPowerDuringSleepSupported");
  }
  else
  {
    if (gLogObjects)
      v8 = gNumLogObjects < 2;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v12, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (BOOL)setPowerDuringSleepEnabled:(BOOL)a3 forConnectionUUID:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:](self, "_managerForConnectionUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "setPowerDuringSleepEnabled:", v4);
  }
  else
  {
    if (gLogObjects)
      v10 = gNumLogObjects < 2;
    else
      v10 = 1;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    else
    {
      v12 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_21722C000, v12, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v14, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (BOOL)isPowerDuringSleepEnabled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:](self, "_managerForConnectionUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "isPowerDuringSleepEnabled");
  }
  else
  {
    if (gLogObjects)
      v8 = gNumLogObjects < 2;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v12, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (BOOL)setBatteryPackMode:(BOOL)a3 forConnectionUUID:(id)a4 forceResponse:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  int v16;
  id v17;
  uint64_t v18;

  v5 = a5;
  v6 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:](self, "_managerForConnectionUUID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "setBatteryPackMode:forceResponse:", v6, v5);
  }
  else
  {
    if (gLogObjects)
      v12 = gNumLogObjects < 2;
    else
      v12 = 1;
    if (v12)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v14 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    else
    {
      v14 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = v8;
      _os_log_impl(&dword_21722C000, v14, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v16, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

- (BOOL)isBatteryPackModeEnabled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:](self, "_managerForConnectionUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "isBatteryPackModeEnabled");
  }
  else
  {
    if (gLogObjects)
      v8 = gNumLogObjects < 2;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v12, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (BOOL)setAccessoryRequestedCurrent:(unsigned int)a3 forConnectionUUID:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v4 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:](self, "_managerForConnectionUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "setAccessoryRequestedCurrent:", v4);
  }
  else
  {
    if (gLogObjects)
      v10 = gNumLogObjects < 2;
    else
      v10 = 1;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    else
    {
      v12 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_21722C000, v12, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v14, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (BOOL)setAccessoryUsedCurrent:(unsigned int)a3 forConnectionUUID:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v4 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:](self, "_managerForConnectionUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "setAccessoryUsedCurrent:", v4);
  }
  else
  {
    if (gLogObjects)
      v10 = gNumLogObjects < 2;
    else
      v10 = 1;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    else
    {
      v12 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_21722C000, v12, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v14, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (BOOL)resetAccessoryBaseCurrent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:](self, "_managerForConnectionUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "resetAccessoryBaseCurrent");
  }
  else
  {
    if (gLogObjects)
      v8 = gNumLogObjects < 2;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v12, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (unsigned)accessoryChargingCurrentInmA:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:](self, "_managerForConnectionUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "accessoryChargingCurrentInmA");
  }
  else
  {
    if (gLogObjects)
      v8 = gNumLogObjects < 2;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v12, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (unsigned)accessoryPowerModeCurrentLimitInmA:(int)a3 forConnectionUUID:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v4 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:](self, "_managerForConnectionUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "accessoryPowerModeCurrentLimitInmA:", v4);
  }
  else
  {
    if (gLogObjects)
      v10 = gNumLogObjects < 2;
    else
      v10 = 1;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    else
    {
      v12 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_21722C000, v12, OS_LOG_TYPE_INFO, "Unable to find accMgrTransport for base connection UUID %@", (uint8_t *)&v14, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (id)digitalIDDataForUpstreamConnection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:](self, "_managerForConnectionUUID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCTransportIOAccessorySharedManager managerForIOAccessoryManagerService:](self, "managerForIOAccessoryManagerService:", objc_msgSend(v4, "upstreamManagerService"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "digitalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)connectedThroughAdapter:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:](self, "_managerForConnectionUUID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCTransportIOAccessorySharedManager managerForIOAccessoryManagerService:](self, "managerForIOAccessoryManagerService:", objc_msgSend(v4, "upstreamManagerService"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "digitalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (BOOL)setFeaturesFromAuthStatus:(int)a3 andAuthCert:(id)a4 certType:(int)a5 forConnectionUUID:(id)a6 withConnectionType:(int)a7
{
  uint64_t v9;
  uint64_t v10;
  id v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  id v16;
  NSObject *v17;
  char v18;
  uint8_t v20[16];

  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a3;
  v12 = a4;
  -[ACCTransportIOAccessorySharedManager _managerForConnectionUUID:](self, "_managerForConnectionUUID:", a6);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (a7 == 1 && !v13)
  {
    if (gLogObjects)
      v15 = gNumLogObjects < 2;
    else
      v15 = 1;
    if (v15)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v17 = MEMORY[0x24BDACB70];
      v16 = MEMORY[0x24BDACB70];
    }
    else
    {
      v17 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_21722C000, v17, OS_LOG_TYPE_DEFAULT, "Setting allowed features for root E75", v20, 2u);
    }

    -[ACCTransportIOAccessorySharedManager rootE75Manager](self, "rootE75Manager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = objc_msgSend(v14, "setFeaturesFromAuthStatus:authCert:certType:", v10, v12, v9);

  return v18;
}

- (void)_createModuleConnectionAndEndpoint:(id)a3
{
  id v4;
  unsigned int v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  NSObject *v26;
  id v27;
  void *v28;
  _QWORD v29[6];
  _QWORD v30[6];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "accConnectionType") == 7)
  {
    v5 = objc_msgSend(v4, "representsInternalModule") - 1;
    if (v5 <= 2)
    {
      v6 = dword_21728F2FC[v5];
      v7 = off_24D71AB50[v5];
      -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "createConnectionWithType:andIdentifier:", objc_msgSend(v4, "accConnectionType"), 0);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

      -[ACCTransportIOAccessorySharedManager managerForIOAccessoryManagerService:](self, "managerForIOAccessoryManagerService:", objc_msgSend(v4, "upstreamManagerService"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACCTransportIOAccessorySharedManager managerForIOAccessoryManagerService:](self, "managerForIOAccessoryManagerService:", objc_msgSend(v4, "upstreamManagerService"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setSupervisedTransportsRestricted:forConnectionWithUUID:", objc_msgSend(v12, "supervisedTransportsRestricted"), v9);

      }
      if (v9)
      {
        -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)-[__CFString copy](v9, "copy");
        objc_msgSend(v13, "createEndpointWithTransportType:andProtocol:andIdentifier:forConnectionWithUUID:publishConnection:", v6, 2, 0, v14, 0);
        v15 = objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          if (gLogObjects && gNumLogObjects >= 2)
          {
            v16 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v16 = MEMORY[0x24BDACB70];
            v17 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v32 = v15;
            v33 = 2112;
            v34 = v7;
            _os_log_impl(&dword_21722C000, v16, OS_LOG_TYPE_DEFAULT, "Created endpointUUID %{public}@ for %@ AppleAuthCP", buf, 0x16u);
          }

          -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "publishConnectionWithUUID:", v9);

          objc_msgSend(v4, "setConnectionUUID:", v9);
          objc_msgSend(v4, "setEndpointUUID:", v15);
          v19 = *MEMORY[0x24BE1A110];
          v29[0] = *MEMORY[0x24BE1A118];
          v29[1] = v19;
          v30[0] = CFSTR("Internal Hardware");
          v30[1] = v7;
          v20 = *MEMORY[0x24BE1A138];
          v29[2] = *MEMORY[0x24BE1A108];
          v29[3] = v20;
          v30[2] = CFSTR("Apple Inc.");
          v30[3] = CFSTR("NotApplicable");
          v21 = *MEMORY[0x24BE1A100];
          v29[4] = *MEMORY[0x24BE1A0F8];
          v29[5] = v21;
          v30[4] = CFSTR("NotApplicable");
          v30[5] = CFSTR("NotApplicable");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 6);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (gLogObjects && gNumLogObjects >= 2)
          {
            v23 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v23 = MEMORY[0x24BDACB70];
            v24 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v32 = v22;
            v33 = 2112;
            v34 = v9;
            _os_log_impl(&dword_21722C000, v23, OS_LOG_TYPE_DEFAULT, "accInfoDictionary for hardware accessory = %@, connectionUUID = %@", buf, 0x16u);
          }

          -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setAccessoryInfo:forEndpointWithUUID:", v22, v15);

          if (gLogObjects && gNumLogObjects >= 2)
          {
            v26 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v26 = MEMORY[0x24BDACB70];
            v27 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v32 = v9;
            _os_log_impl(&dword_21722C000, v26, OS_LOG_TYPE_DEFAULT, "Publishing connection: %@ with eACCEndpoint_Protocol_InternalInfo", buf, 0xCu);
          }

          -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "publishConnectionWithUUID:", v9);

        }
        else
        {
          logObjectForModule_0(1);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v32 = v7;
            v33 = 2112;
            v34 = v9;
            _os_log_impl(&dword_21722C000, v15, OS_LOG_TYPE_DEFAULT, "Failed to create endpointUUID for %{public}@ AppleAuthCP and to publish connection: %@", buf, 0x16u);
          }
        }

      }
    }
  }

}

- (void)IOAccessoryManagerServiceArrived:(unsigned int)a3
{
  BOOL v5;
  id v6;
  NSObject *v7;
  NSObject *listQ;
  _QWORD v9[5];
  unsigned int v10;
  uint8_t buf[4];
  unsigned int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v5 = gNumLogObjects < 2;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v12 = a3;
    _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_INFO, "IOAccMgr service arrived with service %d", buf, 8u);
  }

  listQ = self->_listQ;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __73__ACCTransportIOAccessorySharedManager_IOAccessoryManagerServiceArrived___block_invoke;
  v9[3] = &unk_24D71A8E0;
  v9[4] = self;
  v10 = a3;
  dispatch_sync(listQ, v9);
}

void __73__ACCTransportIOAccessorySharedManager_IOAccessoryManagerServiceArrived___block_invoke(uint64_t a1)
{
  void *v2;
  BOOL v3;
  id v4;
  NSObject *v5;
  int v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managerForIOAccessoryManagerService:", *(unsigned int *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (gLogObjects)
      v3 = gNumLogObjects < 1;
    else
      v3 = 1;
    if (v3)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v5 = MEMORY[0x24BDACB70];
      v4 = MEMORY[0x24BDACB70];
    }
    else
    {
      v5 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_DWORD *)(a1 + 40);
      v7[0] = 67109120;
      v7[1] = v6;
      _os_log_impl(&dword_21722C000, v5, OS_LOG_TYPE_DEFAULT, "Already connected IOAccMgr service with service %d", (uint8_t *)v7, 8u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_addIOAccessoryManagerWithIOService:", *(unsigned int *)(a1 + 40));
  }

}

- (void)IOAccessoryManagerServiceDetached:(unsigned int)a3
{
  void *v5;
  NSObject *listQ;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD block[6];
  unsigned int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  unsigned int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  listQ = self->_listQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__ACCTransportIOAccessorySharedManager_IOAccessoryManagerServiceDetached___block_invoke;
  block[3] = &unk_24D71A9B8;
  v18 = a3;
  block[4] = self;
  block[5] = &v19;
  dispatch_sync(listQ, block);
  v7 = (void *)v20[5];
  if (v7)
  {
    objc_msgSend(v7, "connectionUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v9 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v9 = MEMORY[0x24BDACB70];
        v11 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend((id)v20[5], "connectionUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109378;
        v26 = a3;
        v27 = 2112;
        v28 = v12;
        _os_log_impl(&dword_21722C000, v9, OS_LOG_TYPE_DEFAULT, "IOAccessoryManager service %d detach, remove connectionUUID %@", buf, 0x12u);

      }
      -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v20[5], "connectionUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "destroyConnectionWithUUID:", v14);

      objc_msgSend((id)v20[5], "setConnectionUUID:", 0);
      -[ACCTransportIOAccessorySharedManager _clearChildPortEndpointsForManagerDisconnection:](self, "_clearChildPortEndpointsForManagerDisconnection:", v20[5]);
    }
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v10 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v15 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v26 = a3;
      _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_INFO, "Couldn't find ACCTransportIOAccessoryManager for service %d", buf, 8u);
    }

  }
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "unlock");

  _Block_object_dispose(&v19, 8);
}

void __74__ACCTransportIOAccessorySharedManager_IOAccessoryManagerServiceDetached___block_invoke(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v2 = gNumLogObjects < 2;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1 + 48);
    v9[0] = 67109120;
    v9[1] = v5;
    _os_log_impl(&dword_21722C000, v4, OS_LOG_TYPE_DEFAULT, "IOAccessoryManager SERVICE DETACH: handling detach for io acc mgr with service %d", (uint8_t *)v9, 8u);
  }

  objc_msgSend(*(id *)(a1 + 32), "managerForIOAccessoryManagerService:", *(unsigned int *)(a1 + 48));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (void)IOAccessoryManagerServiceTerminated:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *listQ;
  id v19;
  void *v20;
  _QWORD v21[4];
  NSObject *v22;
  ACCTransportIOAccessorySharedManager *v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v3 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x24BDAC8D0];
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  if (gLogObjects)
    v6 = gNumLogObjects < 2;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v8 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  else
  {
    v8 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v25 = v3;
    _os_log_impl(&dword_21722C000, v8, OS_LOG_TYPE_DEFAULT, "IOAccessoryManager SERVICE TERMINATED: removing io acc mgr with service %d", buf, 8u);
  }

  -[ACCTransportIOAccessorySharedManager managerForIOAccessoryManagerService:](self, "managerForIOAccessoryManagerService:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "connectionUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v12 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v12 = MEMORY[0x24BDACB70];
        v14 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "connectionUUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109378;
        v25 = v3;
        v26 = 2112;
        v27 = v15;
        _os_log_impl(&dword_21722C000, v12, OS_LOG_TYPE_DEFAULT, "IOAccessoryManager service %d terminated, remove connectionUUID %@", buf, 0x12u);

      }
      -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "connectionUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "destroyConnectionWithUUID:", v17);

      objc_msgSend(v10, "setConnectionUUID:", 0);
      -[ACCTransportIOAccessorySharedManager _clearChildPortEndpointsForManagerDisconnection:](self, "_clearChildPortEndpointsForManagerDisconnection:", v10);
    }
    listQ = self->_listQ;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __76__ACCTransportIOAccessorySharedManager_IOAccessoryManagerServiceTerminated___block_invoke;
    v21[3] = &unk_24D71A1D8;
    v22 = v10;
    v23 = self;
    dispatch_sync(listQ, v21);
    v13 = v22;
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v13 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v13 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v25 = v3;
      _os_log_impl(&dword_21722C000, v13, OS_LOG_TYPE_INFO, "Couldn't find ACCTransportIOAccessoryManager for service %d on service termination", buf, 8u);
    }
  }

  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "unlock");

}

void __76__ACCTransportIOAccessorySharedManager_IOAccessoryManagerServiceTerminated___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  int v4;
  uint64_t v5;
  int v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "transportClassTerminated");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "removeObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removeObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "removeObject:", *(_QWORD *)(a1 + 32));
  v2 = objc_msgSend(*(id *)(a1 + 32), "ioService");
  objc_msgSend(*(id *)(a1 + 40), "rootE75Manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ioService");

  if (v2 == v4)
  {
    v5 = 64;
  }
  else
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "ioService");
    objc_msgSend(*(id *)(a1 + 40), "rootOrionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "ioService");

    if (v6 != v8)
      return;
    v5 = 72;
  }
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(v9 + v5);
  *(_QWORD *)(v9 + v5) = 0;

}

- (void)IOAccessoryManagerServiceInfoSet:(unsigned int)a3
{
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSObject *listQ;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  id v12;
  void *v13;
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
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  void *v29;
  BOOL v30;
  int v31;
  NSObject *v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  int v61;
  void *v62;
  int v63;
  BOOL v64;
  int v65;
  NSObject *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t i;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  int v78;
  id v80;
  id v81;
  id v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v103;
  void *v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _QWORD block[6];
  unsigned int v110;
  uint64_t v111;
  void *v112;
  _QWORD v113[11];
  _QWORD v114[11];
  uint8_t v115[4];
  void *v116;
  _BYTE v117[128];
  _QWORD v118[2];
  _QWORD v119[2];
  uint8_t buf[8];
  uint8_t *v121;
  uint64_t v122;
  uint64_t (*v123)(uint64_t, uint64_t);
  void (*v124)(uint64_t);
  id v125;
  uint64_t v126;

  v126 = *MEMORY[0x24BDAC8D0];
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lock");

  if (gLogObjects)
    v5 = gNumLogObjects < 2;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = a3;
    _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_DEFAULT, "Accessory info set for IOAccessoryManager service %d", buf, 8u);
  }

  *(_QWORD *)buf = 0;
  v121 = buf;
  v122 = 0x3032000000;
  v123 = __Block_byref_object_copy__0;
  v124 = __Block_byref_object_dispose__0;
  v125 = 0;
  listQ = self->_listQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__ACCTransportIOAccessorySharedManager_IOAccessoryManagerServiceInfoSet___block_invoke;
  block[3] = &unk_24D71A9B8;
  block[4] = self;
  block[5] = buf;
  v110 = a3;
  dispatch_sync(listQ, block);
  objc_msgSend(*((id *)v121 + 5), "connectionUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  if (v10)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v11 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v115 = 67109120;
      LODWORD(v116) = a3;
      _os_log_impl(&dword_21722C000, v11, OS_LOG_TYPE_DEFAULT, "No connectionUUID for IOAccessoryManager service %d yet, creating one", v115, 8u);
    }

    -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "createConnectionWithType:andIdentifier:", objc_msgSend(*((id *)v121 + 5), "connectionType"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSupervisedTransportsRestricted:forConnectionWithUUID:", objc_msgSend(*((id *)v121 + 5), "supervisedTransportsRestricted"), v14);

    objc_msgSend(*((id *)v121 + 5), "setConnectionUUID:", v14);
    v118[0] = *MEMORY[0x24BE1A178];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", (int)objc_msgSend(*((id *)v121 + 5), "primaryPortNumber"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v119[0] = v16;
    v118[1] = *MEMORY[0x24BE1A158];
    objc_msgSend(*((id *)v121 + 5), "digitalID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v17)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v119[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v119, v118, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*((id *)v121 + 5), "isAdapter"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*((id *)v121 + 5), "isAdapter"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKey:", v21, *MEMORY[0x24BE1A168]);

    }
    objc_msgSend(*((id *)v121 + 5), "managerParent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(*((id *)v121 + 5), "managerParent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKey:", v23, *MEMORY[0x24BE1A170]);

    }
    -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(v24, "setProperties:forConnectionWithUUID:", v25, v14);

  }
  if (objc_msgSend(*((id *)v121 + 5), "connectionType") != 4 || self->_bIsWatch)
  {
    -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v121 + 5), "connectionUUID");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = -[NSObject copy](v27, "copy");
    objc_msgSend(v26, "createEndpointWithTransportType:andProtocol:andIdentifier:forConnectionWithUUID:publishConnection:", 5, 2, 0, v28, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_32;
  }
  -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)v121 + 5), "connectionUUID");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "endpointUUIDsForConnectionWithUUID:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v26 = v70;
  v71 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v105, v117, 16);
  if (!v71)
  {

LABEL_143:
    -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
    v27 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v121 + 5), "connectionUUID");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = (void *)objc_msgSend(v86, "copy");
    -[NSObject createEndpointWithTransportType:andProtocol:andIdentifier:forConnectionWithUUID:publishConnection:](v27, "createEndpointWithTransportType:andProtocol:andIdentifier:forConnectionWithUUID:publishConnection:", 12, 1, 0, v87, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_32;
  }
  v29 = 0;
  v72 = *(_QWORD *)v106;
  do
  {
    for (i = 0; i != v71; ++i)
    {
      if (*(_QWORD *)v106 != v72)
        objc_enumerationMutation(v26);
      v74 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
      -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v75, "transportTypeForEndpointWithUUID:", v74);

      -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v77, "protocolForEndpointWithUUID:", v74);

      if (v76 == 12 && v78 == 1)
      {
        v80 = v74;

        v29 = v80;
      }
    }
    v71 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v105, v117, 16);
  }
  while (v71);

  if (!v29)
    goto LABEL_143;
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v27 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v27 = MEMORY[0x24BDACB70];
    v88 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v115 = 138412290;
    v116 = v29;
    _os_log_impl(&dword_21722C000, v27, OS_LOG_TYPE_DEFAULT, "Found existing endpointUUID %@ for IOAccessoryManager accessory info", v115, 0xCu);
  }
LABEL_32:

  if (gLogObjects)
    v30 = gNumLogObjects <= 1;
  else
    v30 = 1;
  v31 = !v30;
  if (v29)
  {
    if (v31)
    {
      v32 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v32 = MEMORY[0x24BDACB70];
      v34 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v115 = 138412290;
      v116 = v29;
      _os_log_impl(&dword_21722C000, v32, OS_LOG_TYPE_DEFAULT, "Created endpointUUID %@ for IOAccessoryManager accessory info", v115, 0xCu);
    }

    v113[0] = *MEMORY[0x24BE1A118];
    objc_msgSend(*((id *)v121 + 5), "deviceName");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (uint64_t)v103;
    if (!v103)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v35 = objc_claimAutoreleasedReturnValue();
    }
    v96 = (void *)v35;
    v114[0] = v35;
    v113[1] = *MEMORY[0x24BE1A110];
    objc_msgSend(*((id *)v121 + 5), "deviceModelNumber");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (uint64_t)v100;
    if (!v100)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v36 = objc_claimAutoreleasedReturnValue();
    }
    v95 = (void *)v36;
    v114[1] = v36;
    v113[2] = *MEMORY[0x24BE1A108];
    objc_msgSend(*((id *)v121 + 5), "deviceVendorName");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (uint64_t)v99;
    if (!v99)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v37 = objc_claimAutoreleasedReturnValue();
    }
    v94 = (void *)v37;
    v114[2] = v37;
    v113[3] = *MEMORY[0x24BE1A138];
    objc_msgSend(*((id *)v121 + 5), "deviceSerialNumber");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (uint64_t)v98;
    if (!v98)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v38 = objc_claimAutoreleasedReturnValue();
    }
    v93 = (void *)v38;
    v114[3] = v38;
    v113[4] = *MEMORY[0x24BE1A0F8];
    objc_msgSend(*((id *)v121 + 5), "deviceFirmwareRevision");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (uint64_t)v101;
    if (!v101)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v39 = objc_claimAutoreleasedReturnValue();
    }
    v92 = (void *)v39;
    v114[4] = v39;
    v113[5] = *MEMORY[0x24BE1A100];
    objc_msgSend(*((id *)v121 + 5), "deviceHardwareRevision");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (uint64_t)v97;
    if (!v97)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v40 = objc_claimAutoreleasedReturnValue();
    }
    v91 = (void *)v40;
    v114[5] = v40;
    v113[6] = *MEMORY[0x24BE1A120];
    objc_msgSend(*((id *)v121 + 5), "ppid");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (uint64_t)v41;
    if (!v41)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v42 = objc_claimAutoreleasedReturnValue();
    }
    v90 = (void *)v42;
    v114[6] = v42;
    v113[7] = *MEMORY[0x24BE1A130];
    objc_msgSend(*((id *)v121 + 5), "regionCode");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (uint64_t)v43;
    if (!v43)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v44 = objc_claimAutoreleasedReturnValue();
    }
    v89 = (void *)v44;
    v114[7] = v44;
    v113[8] = *MEMORY[0x24BE1A0E8];
    objc_msgSend(*((id *)v121 + 5), "inductiveDeviceUID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    if (!v45)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v114[8] = v46;
    v113[9] = *MEMORY[0x24BE1A140];
    objc_msgSend(*((id *)v121 + 5), "vendorID");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (!v47)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v114[9] = v48;
    v113[10] = *MEMORY[0x24BE1A128];
    objc_msgSend(*((id *)v121 + 5), "productID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49;
    if (!v49)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v114[10] = v50;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v114, v113, 11);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v49)

    if (!v47)
    if (!v45)

    if (!v43)
    if (!v41)

    if (!v97)
    if (!v101)

    if (!v98)
    if (!v99)

    if (!v100)
    if (!v103)

    objc_msgSend(*((id *)v121 + 5), "connectionUUID");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("accInfoDictionary for IOAccessoryManager acc. info = %@, ioAccMgr.connectionUUID = %@"), v104, v51);

    -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setAccessoryInfo:forEndpointWithUUID:", v104, v29);

    objc_msgSend(*((id *)v121 + 5), "inductiveLocalDeviceID");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      v111 = *MEMORY[0x24BE1A160];
      objc_msgSend(*((id *)v121 + 5), "inductiveLocalDeviceID");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = v54;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)v121 + 5), "connectionUUID");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setProperties:forConnectionWithUUID:", v55, v57);

    }
    objc_msgSend(*((id *)v121 + 5), "eaProtocolChildPorts");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "count");

    objc_msgSend(*((id *)v121 + 5), "oobPairingChildPorts");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "count");

    objc_msgSend(*((id *)v121 + 5), "configStreamChildPorts");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "count");

    if (gLogObjects)
      v64 = gNumLogObjects <= 1;
    else
      v64 = 1;
    v65 = !v64;
    if (v59 || v61 || v63)
    {
      if (v65)
      {
        v67 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v67 = MEMORY[0x24BDACB70];
        v84 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        -[ACCTransportIOAccessorySharedManager IOAccessoryManagerServiceInfoSet:].cold.2((uint64_t)v115, objc_msgSend(*((id *)v121 + 5), "ioService"), v67);
    }
    else
    {
      if (v65)
      {
        v66 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v66 = MEMORY[0x24BDACB70];
        v82 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v115 = 0;
        _os_log_impl(&dword_21722C000, v66, OS_LOG_TYPE_DEFAULT, "Publishing connection with eACCEndpoint_Protocol_InternalInfo", v115, 2u);
      }

      -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
      v67 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)v121 + 5), "connectionUUID");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject publishConnectionWithUUID:](v67, "publishConnectionWithUUID:", v83);

    }
  }
  else
  {
    if (v31)
    {
      v33 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v33 = MEMORY[0x24BDACB70];
      v81 = MEMORY[0x24BDACB70];
    }
    v104 = v33;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v115 = 67109120;
      LODWORD(v116) = a3;
      _os_log_impl(&dword_21722C000, v33, OS_LOG_TYPE_DEFAULT, "Failed to create endpointUUID for IOAccessoryManager info for service %d", v115, 8u);
    }
  }

  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "unlock");

  _Block_object_dispose(buf, 8);
}

void __73__ACCTransportIOAccessorySharedManager_IOAccessoryManagerServiceInfoSet___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "managerForIOAccessoryManagerService:", *(unsigned int *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)IOAccessoryManagerResistorIDChanged:(int)a3 forManager:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[ACCTransportIOAccessorySharedManager _portForManagerMatchingPrimaryPort:](self, "_portForManagerMatchingPrimaryPort:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lock");

  if (v7)
  {
    objc_msgSend(v7, "ioAccPortEndpointUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v10 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v10 = MEMORY[0x24BDACB70];
        v15 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      objc_msgSend(v6, "connectionUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ioAccPortEndpointUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412546;
      v25 = v16;
      v26 = 2112;
      v27 = v17;
      _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_DEFAULT, "Already have a connection %@ and an endpoint %@ when handling resistorIDChanged...ignore it", (uint8_t *)&v24, 0x16u);

    }
    else
    {
      -[ACCTransportIOAccessorySharedManager IOAccessoryPortArrived:withEndpointProtocol:publish:](self, "IOAccessoryPortArrived:withEndpointProtocol:publish:", v7, 3, 1);
      v11 = objc_claimAutoreleasedReturnValue();
      v10 = v11;
      if (v11)
      {
        v12 = -[NSObject copy](v11, "copy");
        objc_msgSend(v7, "setIoAccPortEndpointUUID:", v12);

      }
      objc_msgSend(v6, "connectionUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        goto LABEL_24;
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v14 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v14 = MEMORY[0x24BDACB70];
        v18 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "connectionUUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138412290;
        v25 = v19;
        _os_log_impl(&dword_21722C000, v14, OS_LOG_TYPE_DEFAULT, "SharedManager: Have a connection UUID %@, sending resistorID notification", (uint8_t *)&v24, 0xCu);

      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = *MEMORY[0x24BE1A028];
      objc_msgSend(v6, "connectionUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = *MEMORY[0x24BE1A040];
      v29[0] = v20;
      v29[1] = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "postNotificationName:object:userInfo:", *MEMORY[0x24BE1A048], 0, v21);

    }
LABEL_24:

  }
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "unlock");

}

- (void)IOAccessoryManagerSupervisedTransportsRestrictedDidChange:(BOOL)a3 forManager:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _DWORD v17[2];
  __int16 v18;
  void *v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lock");

  if (v6
    && (objc_msgSend(v6, "connectionUUID"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v9 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "connectionUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = 67109378;
      v17[1] = v4;
      v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_21722C000, v9, OS_LOG_TYPE_DEFAULT, "sending supervisedTransports %d notification for connectionUUID %@", (uint8_t *)v17, 0x12u);

    }
    -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "connectionUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setSupervisedTransportsRestricted:forConnectionWithUUID:](v12, "setSupervisedTransportsRestricted:forConnectionWithUUID:", v4, v15);

  }
  else
  {
    if (gLogObjects)
      v10 = gNumLogObjects < 2;
    else
      v10 = 1;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    else
    {
      v12 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17[0]) = 0;
      _os_log_impl(&dword_21722C000, v12, OS_LOG_TYPE_DEFAULT, "no connectionUUID, not sending supervisedTransports notification", (uint8_t *)v17, 2u);
    }
  }

  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "unlock");

}

- (void)IOAccessoryPortServiceArrived:(unsigned int)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  BOOL v7;
  id v8;
  NSObject *listQ;
  NSObject *v10;
  ACCTransportIOAccessoryPort *v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  ACCTransportIOAccessorySharedManager *v19;
  ACCTransportIOAccessoryPort *v20;
  uint8_t buf[4];
  unsigned int v22;
  uint64_t v23;

  v3 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x24BDAC8D0];
  v5 = -[ACCTransportIOAccessorySharedManager _managerForIOService:shouldCreateNewService:](self, "_managerForIOService:shouldCreateNewService:", *(_QWORD *)&a3, 1);
  -[ACCTransportIOAccessorySharedManager _basePortForService:](self, "_basePortForService:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (gLogObjects)
      v7 = gNumLogObjects < 2;
    else
      v7 = 1;
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v11 = (ACCTransportIOAccessoryPort *)MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    else
    {
      v11 = (ACCTransportIOAccessoryPort *)*(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(&v11->super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v22 = v3;
      _os_log_impl(&dword_21722C000, &v11->super.super, OS_LOG_TYPE_DEFAULT, "already existing ACCTransportIOAccessoryPort for service ID %d", buf, 8u);
    }
  }
  else
  {
    v11 = -[ACCTransportIOAccessoryPort initWithDelegate:andIOService:]([ACCTransportIOAccessoryPort alloc], "initWithDelegate:andIOService:", self, v3);
    if (-[ACCTransportIOAccessorySharedManager _addACCTransportToManager:](self, "_addACCTransportToManager:", v11))
    {
      listQ = self->_listQ;
      v15 = MEMORY[0x24BDAC760];
      v16 = 3221225472;
      v17 = __70__ACCTransportIOAccessorySharedManager_IOAccessoryPortServiceArrived___block_invoke;
      v18 = &unk_24D71A1D8;
      v19 = self;
      v11 = v11;
      v20 = v11;
      dispatch_sync(listQ, &v15);
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v10 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v10 = MEMORY[0x24BDACB70];
        v13 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v22 = v3;
        _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_DEFAULT, "Successfully added io accessory port service %d to all ports list", buf, 8u);
      }

      -[ACCTransportIOAccessoryPort portServiceRegistrationComplete](v11, "portServiceRegistrationComplete", v15, v16, v17, v18, v19);
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v12 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v12 = MEMORY[0x24BDACB70];
        v14 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v22 = -[ACCTransportIOAccessoryBase ioService](v11, "ioService");
        _os_log_impl(&dword_21722C000, v12, OS_LOG_TYPE_INFO, "Couldn't find upstream io acc manager service for accPort service %d", buf, 8u);
      }

    }
  }

}

uint64_t __70__ACCTransportIOAccessorySharedManager_IOAccessoryPortServiceArrived___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)IOAccessoryPortServiceTerminated:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  BOOL v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  int v19;
  id v20;
  id v21;
  NSObject *listQ;
  void *v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v3 = *(_QWORD *)&a3;
  v30 = *MEMORY[0x24BDAC8D0];
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[ACCTransportIOAccessorySharedManager _basePortForService:](self, "_basePortForService:", v3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (gLogObjects)
    v8 = gNumLogObjects <= 1;
  else
    v8 = 1;
  v9 = !v8;
  if (v6)
  {
    if (v9)
    {
      v10 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v27 = v3;
      _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_DEFAULT, "IOAccessoryPort TERMINATED: found terminated service %d", buf, 8u);
    }

    objc_msgSend(v7, "transportClassTerminated");
    -[ACCTransportIOAccessorySharedManager _IOAccessoryPortDetachInternal:](self, "_IOAccessoryPortDetachInternal:", v7);
    -[ACCTransportIOAccessorySharedManager _managerForBase:](self, "_managerForBase:", v7);
    v13 = objc_claimAutoreleasedReturnValue();
    v11 = v13;
    if (gLogObjects)
      v14 = gNumLogObjects <= 1;
    else
      v14 = 1;
    v15 = !v14;
    if (v13)
    {
      if (v15)
      {
        v16 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v16 = MEMORY[0x24BDACB70];
        v18 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v19 = -[NSObject ioService](v11, "ioService");
        *(_DWORD *)buf = 67109376;
        v27 = v19;
        v28 = 1024;
        v29 = v3;
        _os_log_impl(&dword_21722C000, v16, OS_LOG_TYPE_DEFAULT, "Found manager with service %d for removed IOAccessoryPortService  %d", buf, 0xEu);
      }

      -[NSObject removeIOAccessoryChildPort:](v11, "removeIOAccessoryChildPort:", v7);
    }
    else
    {
      if (v15)
      {
        v17 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v17 = MEMORY[0x24BDACB70];
        v21 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v27 = v3;
        _os_log_impl(&dword_21722C000, v17, OS_LOG_TYPE_INFO, "Didn't find manager for removed accessory port service %d", buf, 8u);
      }

    }
    listQ = self->_listQ;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __73__ACCTransportIOAccessorySharedManager_IOAccessoryPortServiceTerminated___block_invoke;
    v24[3] = &unk_24D71A1D8;
    v24[4] = self;
    v25 = v7;
    dispatch_sync(listQ, v24);

  }
  else
  {
    if (v9)
    {
      v11 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v20 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v27 = v3;
      _os_log_impl(&dword_21722C000, v11, OS_LOG_TYPE_INFO, "Didn't find base accessory object for removed IOPort service %d", buf, 8u);
    }
  }

  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "unlock");

}

uint64_t __73__ACCTransportIOAccessorySharedManager_IOAccessoryPortServiceTerminated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)IOAccessoryAuthCPServiceArrived:(unsigned int)a3
{
  uint64_t v3;
  BOOL v5;
  BOOL bIsWatch;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  int v13;
  ACCTransportIOAccessoryAuthCP *v14;
  NSObject *v15;
  id v16;
  ACCTransportIOAccessoryAuthCP *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *listQ;
  NSObject *v21;
  NSObject *v22;
  id v23;
  ACCTransportIOAccessoryAuthCP *v24;
  id v25;
  NSObject *v26;
  id v27;
  unsigned int v28;
  id v29;
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
  io_registry_entry_t v41;
  CFTypeRef CFProperty;
  NSObject *v43;
  id v44;
  _QWORD block[5];
  id v46;
  int v47;
  _QWORD v48[5];
  ACCTransportIOAccessoryAuthCP *v49;
  _QWORD v50[5];
  ACCTransportIOAccessoryAuthCP *v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  _QWORD v58[2];
  _QWORD v59[5];

  v3 = *(_QWORD *)&a3;
  v59[2] = *MEMORY[0x24BDAC8D0];
  IOAccessoryManagerGetUpstreamService();
  v5 = (IOAccessoryManagerGetType() & 0xF) == 5;
  bIsWatch = self->_bIsWatch;
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lock");

  -[ACCTransportIOAccessorySharedManager _managerForIOService:shouldCreateNewService:](self, "_managerForIOService:shouldCreateNewService:", v3, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "needsOOBPairing") & 1) == 0)
  {
    if (v8)
      v10 = objc_msgSend(v8, "connectionType");
    else
      v10 = 7;
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v15 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v15 = MEMORY[0x24BDACB70];
      v16 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v53) = v10;
      _os_log_impl(&dword_21722C000, v15, OS_LOG_TYPE_INFO, "ACCTransportIOAccessoryAuthCP connectionType = %d", buf, 8u);
    }

    v17 = -[ACCTransportIOAccessoryAuthCP initWithDelegate:andIOService:connectionType:]([ACCTransportIOAccessoryAuthCP alloc], "initWithDelegate:andIOService:connectionType:", self, v3, v10);
    v14 = v17;
    if (v17)
    {
      if (!v8)
      {
        listQ = self->_listQ;
        v48[0] = MEMORY[0x24BDAC760];
        v48[1] = 3221225472;
        v48[2] = __72__ACCTransportIOAccessorySharedManager_IOAccessoryAuthCPServiceArrived___block_invoke_102;
        v48[3] = &unk_24D71A1D8;
        v48[4] = self;
        v14 = v17;
        v49 = v14;
        dispatch_sync(listQ, v48);
        if (-[ACCTransportIOAccessoryAuthCP representsInternalModule](v14, "representsInternalModule")
           - 1 <= 2)
          -[ACCTransportIOAccessorySharedManager _createModuleConnectionAndEndpoint:](self, "_createModuleConnectionAndEndpoint:", v14);
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v21 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v21 = MEMORY[0x24BDACB70];
          v23 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21722C000, v21, OS_LOG_TYPE_DEFAULT, "Starting auth process for AuthCP Service that has no associated parent IOAccMgr", buf, 2u);
        }

        v24 = v49;
        goto LABEL_70;
      }
      if (-[ACCTransportIOAccessorySharedManager _addACCTransportToManager:](self, "_addACCTransportToManager:", v17))
      {
        v18 = self->_listQ;
        v50[0] = MEMORY[0x24BDAC760];
        v50[1] = 3221225472;
        v50[2] = __72__ACCTransportIOAccessorySharedManager_IOAccessoryAuthCPServiceArrived___block_invoke;
        v50[3] = &unk_24D71A1D8;
        v50[4] = self;
        v14 = v14;
        v51 = v14;
        dispatch_sync(v18, v50);
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v19 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v19 = MEMORY[0x24BDACB70];
          v25 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21722C000, v19, OS_LOG_TYPE_INFO, "Successfully added io accessory authCP to all ports list", buf, 2u);
        }

        if (bIsWatch || v5)
        {
          if (gLogObjects && gNumLogObjects >= 2)
          {
            v26 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v26 = MEMORY[0x24BDACB70];
            v29 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21722C000, v26, OS_LOG_TYPE_DEFAULT, "bIsInductive is true, should create connectionUUID for watchOS and iOS", buf, 2u);
          }

          objc_msgSend(v8, "connectionUUID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v30)
          {
            -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "createConnectionWithType:andIdentifier:", objc_msgSend(v8, "connectionType"), 0);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setSupervisedTransportsRestricted:forConnectionWithUUID:", objc_msgSend(v8, "supervisedTransportsRestricted"), v32);

            objc_msgSend(v8, "setConnectionUUID:", v32);
            v58[0] = *MEMORY[0x24BE1A178];
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", (int)objc_msgSend(v8, "primaryPortNumber"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v59[0] = v34;
            v58[1] = *MEMORY[0x24BE1A158];
            objc_msgSend(v8, "digitalID");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v35;
            if (!v35)
            {
              objc_msgSend(MEMORY[0x24BDBCEF8], "null");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v59[1] = v36;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v35)

            -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = (void *)objc_msgSend(v37, "copy");
            objc_msgSend(v38, "setProperties:forConnectionWithUUID:", v39, v32);

          }
        }
        v24 = v51;
LABEL_70:

        v13 = 1;
        goto LABEL_71;
      }
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v22 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v22 = MEMORY[0x24BDACB70];
        v27 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v28 = -[ACCTransportIOAccessoryBase ioService](v14, "ioService");
        *(_DWORD *)buf = 67109120;
        LODWORD(v53) = v28;
        _os_log_impl(&dword_21722C000, v22, OS_LOG_TYPE_INFO, "Couldn't find upstream io acc manager service for authCP service %d", buf, 8u);
      }

    }
    v13 = 0;
    goto LABEL_71;
  }
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v9 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v9 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v53 = v8;
    v54 = 1024;
    v55 = objc_msgSend(v8, "needsOOBPairing");
    v56 = 1024;
    v57 = v3;
    _os_log_impl(&dword_21722C000, v9, OS_LOG_TYPE_DEFAULT, "accMgrInstance=%@ needsOOBPairing=%d Defer creating of ACCTransportIOAccessoryAuthCP until OOBPairing processing for %d", buf, 0x18u);
  }

  IOObjectRetain(v3);
  v12 = self->_listQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__ACCTransportIOAccessorySharedManager_IOAccessoryAuthCPServiceArrived___block_invoke_103;
  block[3] = &unk_24D71AB10;
  block[4] = self;
  v47 = v3;
  v46 = v8;
  dispatch_async(v12, block);

  v13 = 0;
  v14 = 0;
LABEL_71:
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "unlock");

  if (v13 && -[ACCTransportIOAccessoryAuthCP requiresAuthenticationProcess](v14, "requiresAuthenticationProcess"))
  {
    -[ACCTransportIOAccessoryAuthCP startAuthenticationProcess](v14, "startAuthenticationProcess");
  }
  else
  {
    v41 = -[ACCTransportIOAccessoryBase ioService](v14, "ioService");
    CFProperty = IORegistryEntryCreateCFProperty(v41, CFSTR("AuthFullPass"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (CFProperty)
    {
      CFRelease(CFProperty);
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v43 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v43 = MEMORY[0x24BDACB70];
        v44 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21722C000, v43, OS_LOG_TYPE_DEFAULT, "doPostAuthentication", buf, 2u);
      }

      -[ACCTransportIOAccessoryAuthCP doPostAuthentication](v14, "doPostAuthentication");
    }
  }

}

uint64_t __72__ACCTransportIOAccessorySharedManager_IOAccessoryAuthCPServiceArrived___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __72__ACCTransportIOAccessorySharedManager_IOAccessoryAuthCPServiceArrived___block_invoke_102(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

void __72__ACCTransportIOAccessorySharedManager_IOAccessoryAuthCPServiceArrived___block_invoke_103(uint64_t a1)
{
  void *v1;
  DeferredAuthCPServiceWrapper *v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  v2 = -[DeferredAuthCPServiceWrapper initWithIOService:withMgr:]([DeferredAuthCPServiceWrapper alloc], "initWithIOService:withMgr:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
  objc_msgSend(v1, "addObject:", v2);

}

- (void)IOAccessoryAuthCPServiceTerminated:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char *__ptr32 *v9;
  uint64_t v10;
  NSObject *v11;
  BOOL v12;
  int v13;
  NSObject *v14;
  BOOL v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  NSObject *listQ;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  BOOL v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  _QWORD v33[5];
  int v34;
  _QWORD block[5];
  id v36;
  uint8_t buf[4];
  _DWORD v38[7];

  v3 = *(_QWORD *)&a3;
  *(_QWORD *)&v38[5] = *MEMORY[0x24BDAC8D0];
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[ACCTransportIOAccessorySharedManager _basePortForService:](self, "_basePortForService:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = MEMORY[0x24BDAC760];
  v9 = &off_21728F000;
  if (v6)
  {
    objc_msgSend(v6, "transportClassTerminated");
    objc_msgSend(v7, "startShutdownProcess");
    -[ACCTransportIOAccessorySharedManager _managerForBase:](self, "_managerForBase:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (gLogObjects)
      v12 = gNumLogObjects <= 1;
    else
      v12 = 1;
    v13 = !v12;
    if (v10)
    {
      if (v13)
      {
        v14 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v14 = MEMORY[0x24BDACB70];
        v18 = MEMORY[0x24BDACB70];
      }
      v9 = &off_21728F000;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109376;
        v38[0] = -[NSObject ioService](v11, "ioService");
        LOWORD(v38[1]) = 1024;
        *(_DWORD *)((char *)&v38[1] + 2) = v3;
        _os_log_impl(&dword_21722C000, v14, OS_LOG_TYPE_INFO, "AUTH CP Terminated: found manager with service %d for terminated service %d", buf, 0xEu);
      }

      -[NSObject removeIOAccessoryChildPort:](v11, "removeIOAccessoryChildPort:", v7);
      -[NSObject setIsAuthenticated:](v11, "setIsAuthenticated:", 0);
    }
    else
    {
      if (v13)
      {
        v17 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v17 = MEMORY[0x24BDACB70];
        v19 = MEMORY[0x24BDACB70];
      }
      v9 = &off_21728F000;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v38[0] = v3;
        _os_log_impl(&dword_21722C000, v17, OS_LOG_TYPE_INFO, "Didn't find manager for removed auth CP service %d", buf, 8u);
      }

    }
    listQ = self->_listQ;
    v21 = v8;
    block[0] = v8;
    block[1] = *((_QWORD *)v9 + 31);
    block[2] = __75__ACCTransportIOAccessorySharedManager_IOAccessoryAuthCPServiceTerminated___block_invoke;
    block[3] = &unk_24D71A1D8;
    block[4] = self;
    v36 = v7;
    dispatch_sync(listQ, block);
    -[NSObject connectionUUID](v11, "connectionUUID");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)v22;
      -[NSObject connectionUUID](v11, "connectionUUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[ACCTransportIOAccessorySharedManager _managerForConnectionUUIDHasActiveEndpoint:](self, "_managerForConnectionUUIDHasActiveEndpoint:", v24);

      v9 = &off_21728F000;
      if (!v25)
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v26 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v26 = MEMORY[0x24BDACB70];
          v27 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject connectionUUID](v11, "connectionUUID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v38 = v28;
          _os_log_impl(&dword_21722C000, v26, OS_LOG_TYPE_DEFAULT, "No active endpoint for AuthCP Service connection, remove connectionUUID %@", buf, 0xCu);

        }
        -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject connectionUUID](v11, "connectionUUID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "destroyConnectionWithUUID:", v30);

        -[NSObject setConnectionUUID:](v11, "setConnectionUUID:", 0);
        -[ACCTransportIOAccessorySharedManager _clearChildPortEndpointsForManagerDisconnection:](self, "_clearChildPortEndpointsForManagerDisconnection:", v11);
        v9 = &off_21728F000;
      }
    }

    v8 = v21;
  }
  else
  {
    if (gLogObjects)
      v15 = gNumLogObjects < 2;
    else
      v15 = 1;
    if (v15)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v16 = MEMORY[0x24BDACB70];
    }
    else
    {
      v11 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v38[0] = v3;
      _os_log_impl(&dword_21722C000, v11, OS_LOG_TYPE_INFO, "Didn't find base accessory object for removed Auth CP service %d", buf, 8u);
    }
  }

  v31 = self->_listQ;
  v33[0] = v8;
  v33[1] = *((_QWORD *)v9 + 31);
  v33[2] = __75__ACCTransportIOAccessorySharedManager_IOAccessoryAuthCPServiceTerminated___block_invoke_107;
  v33[3] = &unk_24D71A8E0;
  v33[4] = self;
  v34 = v3;
  dispatch_async(v31, v33);
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "unlock");

}

uint64_t __75__ACCTransportIOAccessorySharedManager_IOAccessoryAuthCPServiceTerminated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
}

void __75__ACCTransportIOAccessorySharedManager_IOAccessoryAuthCPServiceTerminated___block_invoke_107(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  id v9;
  int v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v7, "service", (_QWORD)v12) == *(_DWORD *)(a1 + 40))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeObject:", v7);
          IOObjectRelease(*(_DWORD *)(a1 + 40));
          if (gLogObjects && gNumLogObjects >= 2)
          {
            v8 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v8 = MEMORY[0x24BDACB70];
            v9 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            v10 = *(_DWORD *)(a1 + 40);
            v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "count");
            *(_DWORD *)buf = 67109376;
            v17 = v10;
            v18 = 2048;
            v19 = v11;
            _os_log_impl(&dword_21722C000, v8, OS_LOG_TYPE_DEFAULT, "Removing dangling deferred AuthCP service %d due to service termination.  Remaining array count = %lu", buf, 0x12u);
          }

          goto LABEL_19;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_19:

}

- (void)IOAccessoryEAServiceArrived:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  id v6;

  v3 = *(_QWORD *)&a3;
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[ACCTransportIOAccessorySharedManager _processEAService:andPublish:](self, "_processEAService:andPublish:", v3, 1);
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (void)IOAccessoryEAServiceTerminated:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  BOOL v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  int v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  int v33;
  NSObject *v34;
  id v35;
  void *v36;
  NSObject *listQ;
  uint64_t v38;
  void *v39;
  void *v40;
  BOOL v41;
  NSObject *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  NSMutableArray *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  NSObject *v53;
  id v54;
  uint64_t v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD block[5];
  id v62;
  uint8_t v63[128];
  uint8_t buf[4];
  _BYTE v65[18];
  uint64_t v66;

  v3 = *(_QWORD *)&a3;
  v66 = *MEMORY[0x24BDAC8D0];
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[ACCTransportIOAccessorySharedManager _basePortForService:](self, "_basePortForService:", v3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (gLogObjects)
    v8 = gNumLogObjects <= 1;
  else
    v8 = 1;
  v9 = !v8;
  if (v6)
  {
    if (v9)
    {
      v10 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v65 = v3;
      _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_DEFAULT, "EA SERVICE Terminated: found terminated service %d", buf, 8u);
    }

    objc_msgSend(v7, "transportClassTerminated");
    -[ACCTransportIOAccessorySharedManager _managerForBase:](self, "_managerForBase:", v7);
    v13 = objc_claimAutoreleasedReturnValue();
    v11 = v13;
    if (gLogObjects)
      v14 = gNumLogObjects <= 1;
    else
      v14 = 1;
    v15 = !v14;
    if (v13)
    {
      if (v15)
      {
        v16 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v16 = MEMORY[0x24BDACB70];
        v18 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v19 = -[NSObject ioService](v11, "ioService");
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v65 = v19;
        *(_WORD *)&v65[4] = 1024;
        *(_DWORD *)&v65[6] = v3;
        _os_log_impl(&dword_21722C000, v16, OS_LOG_TYPE_INFO, "Found manager with service %d for incoming service %d", buf, 0xEu);
      }

      -[NSObject removeIOAccessoryChildPort:](v11, "removeIOAccessoryChildPort:", v7);
    }
    else
    {
      if (v15)
      {
        v17 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v17 = MEMORY[0x24BDACB70];
        v21 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v65 = v3;
        _os_log_impl(&dword_21722C000, v17, OS_LOG_TYPE_INFO, "Didn't find manager for removed EA service %d", buf, 8u);
      }

    }
    objc_msgSend(v7, "deviceModelNumber");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isEqualToString:", CFSTR("A1468")))
    {

    }
    else
    {
      objc_msgSend(v7, "deviceModelNumber");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("A1450"));

      if (!v24)
      {
LABEL_57:
        objc_msgSend(v7, "endpointUUID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(v28, "copy");

        if (gLogObjects && gNumLogObjects >= 2)
        {
          v30 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v30 = MEMORY[0x24BDACB70];
          v31 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v65 = v29;
          _os_log_impl(&dword_21722C000, v30, OS_LOG_TYPE_DEFAULT, "Remove EA Service endpointUUID %@", buf, 0xCu);
        }

        if (v29)
        {
          -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "destroyEndpointWithUUID:", v29);

          if (v33)
          {
            if (gLogObjects && gNumLogObjects >= 2)
            {
              v34 = *(id *)(gLogObjects + 8);
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
              v34 = MEMORY[0x24BDACB70];
              v35 = MEMORY[0x24BDACB70];
            }
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v7, "eaProtocol");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v65 = v29;
              *(_WORD *)&v65[8] = 2112;
              *(_QWORD *)&v65[10] = v36;
              _os_log_impl(&dword_21722C000, v34, OS_LOG_TYPE_DEFAULT, "Removed EA service endpoint %@ for protocol %@", buf, 0x16u);

            }
            objc_msgSend(v7, "setEndpointUUID:", 0);
            objc_msgSend(v7, "setParentConnectionUUID:", 0);
          }
        }
        listQ = self->_listQ;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __71__ACCTransportIOAccessorySharedManager_IOAccessoryEAServiceTerminated___block_invoke;
        block[3] = &unk_24D71A1D8;
        block[4] = self;
        v62 = v7;
        dispatch_sync(listQ, block);
        -[NSObject connectionUUID](v11, "connectionUUID");
        v38 = objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          v39 = (void *)v38;
          -[NSObject connectionUUID](v11, "connectionUUID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = -[ACCTransportIOAccessorySharedManager _managerForConnectionUUIDHasActiveEndpoint:](self, "_managerForConnectionUUIDHasActiveEndpoint:", v40);

          if (!v41)
          {
            if (gLogObjects && gNumLogObjects >= 2)
            {
              v42 = *(id *)(gLogObjects + 8);
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
              v42 = MEMORY[0x24BDACB70];
              v43 = MEMORY[0x24BDACB70];
            }
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              -[NSObject connectionUUID](v11, "connectionUUID");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v65 = v44;
              _os_log_impl(&dword_21722C000, v42, OS_LOG_TYPE_DEFAULT, "No active endpoint for EA Service connection, remove connectionUUID %@", buf, 0xCu);

            }
            -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject connectionUUID](v11, "connectionUUID");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "destroyConnectionWithUUID:", v46);

            -[NSObject setConnectionUUID:](v11, "setConnectionUUID:", 0);
            -[ACCTransportIOAccessorySharedManager _clearChildPortEndpointsForManagerDisconnection:](self, "_clearChildPortEndpointsForManagerDisconnection:", v11);
          }
        }

        goto LABEL_88;
      }
    }
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v25 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v25 = MEMORY[0x24BDACB70];
      v26 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "deviceModelNumber");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v65 = v27;
      _os_log_impl(&dword_21722C000, v25, OS_LOG_TYPE_DEFAULT, "Detaching a B139/B164, baseAccessoryEA %@", buf, 0xCu);

    }
    self->_isB139OrB164Connected = 0;
    goto LABEL_57;
  }
  if (v9)
  {
    v11 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v11 = MEMORY[0x24BDACB70];
    v20 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v65 = v3;
    _os_log_impl(&dword_21722C000, v11, OS_LOG_TYPE_INFO, "Didn't find base accessory object for removed EA service %d", buf, 8u);
  }
LABEL_88:

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v47 = self->_deferEAServiceArray;
  v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v58;
    while (2)
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v58 != v50)
          objc_enumerationMutation(v47);
        v52 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        if (objc_msgSend(v52, "service", (_QWORD)v57) == (_DWORD)v3)
        {
          -[NSMutableArray removeObject:](self->_deferEAServiceArray, "removeObject:", v52);
          IOObjectRelease(v3);
          if (gLogObjects && gNumLogObjects >= 2)
          {
            v53 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v53 = MEMORY[0x24BDACB70];
            v54 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            v55 = -[NSMutableArray count](self->_deferEAServiceArray, "count");
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v65 = v3;
            *(_WORD *)&v65[4] = 2048;
            *(_QWORD *)&v65[6] = v55;
            _os_log_impl(&dword_21722C000, v53, OS_LOG_TYPE_DEFAULT, "Removing dangling deferred EA service %d due to service termination.  Remaining array count = %lu", buf, 0x12u);
          }

          goto LABEL_106;
        }
      }
      v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
      if (v49)
        continue;
      break;
    }
  }
LABEL_106:

  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "unlock");

}

uint64_t __71__ACCTransportIOAccessorySharedManager_IOAccessoryEAServiceTerminated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)IOAccessoryOOBPairingServiceArrived:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  ACCTransportIOAccessoryOOBPairing *v7;
  NSObject *listQ;
  ACCTransportIOAccessoryOOBPairing *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
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
  NSObject *v40;
  id v41;
  id v42;
  unsigned int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  ACCTransportIOAccessoryOOBPairing *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD block[5];
  ACCTransportIOAccessoryOOBPairing *v56;
  uint8_t buf[4];
  unsigned int v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  _QWORD v63[10];
  _QWORD v64[10];
  _QWORD v65[2];
  _QWORD v66[4];

  v3 = *(_QWORD *)&a3;
  v66[2] = *MEMORY[0x24BDAC8D0];
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[ACCTransportIOAccessorySharedManager _managerForIOService:shouldCreateNewService:](self, "_managerForIOService:shouldCreateNewService:", v3, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ACCTransportIOAccessoryOOBPairing initWithDelegate:andIOService:]([ACCTransportIOAccessoryOOBPairing alloc], "initWithDelegate:andIOService:", self, v3);
  -[ACCTransportIOAccessoryOOBPairing openServiceSession](v7, "openServiceSession");
  if (!v6)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v11 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_37;
    *(_WORD *)buf = 0;
    v13 = "Starting OOBPairing Service that has no associated parent IOAccMgr";
    v14 = v11;
    v15 = OS_LOG_TYPE_DEFAULT;
    v16 = 2;
    goto LABEL_36;
  }
  if (!-[ACCTransportIOAccessorySharedManager _addACCTransportToManager:](self, "_addACCTransportToManager:", v7))
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v11 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v41 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      goto LABEL_37;
    *(_DWORD *)buf = 67109120;
    v58 = -[ACCTransportIOAccessoryBase ioService](v7, "ioService");
    v13 = "Couldn't find upstream io acc manager service for OOBPairing service %d";
    v14 = v11;
    v15 = OS_LOG_TYPE_INFO;
    v16 = 8;
LABEL_36:
    _os_log_impl(&dword_21722C000, v14, v15, v13, buf, v16);
LABEL_37:

    goto LABEL_44;
  }
  listQ = self->_listQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__ACCTransportIOAccessorySharedManager_IOAccessoryOOBPairingServiceArrived___block_invoke;
  block[3] = &unk_24D71A1D8;
  block[4] = self;
  v9 = v7;
  v56 = v9;
  dispatch_sync(listQ, block);
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v10 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v10 = MEMORY[0x24BDACB70];
    v17 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_INFO, "Successfully added io accessory OOBPairing to all ports list", buf, 2u);
  }
  v50 = v7;

  objc_msgSend(v6, "connectionUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "createConnectionWithType:andIdentifier:", objc_msgSend(v6, "connectionType"), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSupervisedTransportsRestricted:forConnectionWithUUID:", objc_msgSend(v6, "supervisedTransportsRestricted"), v20);

    objc_msgSend(v6, "setConnectionUUID:", v20);
    v65[0] = *MEMORY[0x24BE1A178];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", (int)objc_msgSend(v6, "primaryPortNumber"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v22;
    v65[1] = *MEMORY[0x24BE1A158];
    objc_msgSend(v6, "digitalID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (!v23)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v66[1] = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)

    -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(v26, "setProperties:forConnectionWithUUID:", v27, v20);

  }
  v63[0] = *MEMORY[0x24BE1A118];
  -[ACCTransportIOAccessoryOOBPairing deviceName](v9, "deviceName");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v53;
  v63[1] = *MEMORY[0x24BE1A108];
  -[ACCTransportIOAccessoryOOBPairing deviceVendorName](v9, "deviceVendorName");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v52;
  v63[2] = *MEMORY[0x24BE1A110];
  -[ACCTransportIOAccessoryOOBPairing deviceModelNumber](v9, "deviceModelNumber");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v51;
  v63[3] = *MEMORY[0x24BE1A138];
  -[ACCTransportIOAccessoryOOBPairing deviceSerialNumber](v9, "deviceSerialNumber");
  v54 = v6;
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v64[3] = v28;
  v63[4] = *MEMORY[0x24BE1A100];
  -[ACCTransportIOAccessoryOOBPairing deviceHardwareRevision](v9, "deviceHardwareRevision");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v64[4] = v29;
  v63[5] = *MEMORY[0x24BE1A0F8];
  -[ACCTransportIOAccessoryOOBPairing deviceFirmwareRevision](v9, "deviceFirmwareRevision");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v64[5] = v30;
  v63[6] = *MEMORY[0x24BE1A0E8];
  -[ACCTransportIOAccessoryOOBPairing deviceUID](v9, "deviceUID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v64[6] = v31;
  v63[7] = *MEMORY[0x24BE1A0F0];
  -[ACCTransportIOAccessoryOOBPairing devicePlatformID](v9, "devicePlatformID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v64[7] = v32;
  v63[8] = CFSTR("SupportedTypes");
  -[ACCTransportIOAccessoryOOBPairing deviceSupportedTypes](v9, "deviceSupportedTypes");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v64[8] = v33;
  v63[9] = CFSTR("Supports2Way");
  -[ACCTransportIOAccessoryOOBPairing supports2way](v9, "supports2way");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v64[9] = v34;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, v63, 10);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v54;
  -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "connectionUUID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "copy");
  objc_msgSend(v36, "createEndpointWithTransportType:andProtocol:andIdentifier:forConnectionWithUUID:publishConnection:", 9, 8, 0, v38, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogObjects && gNumLogObjects >= 2)
  {
    v40 = *(id *)(gLogObjects + 8);
    v7 = v50;
  }
  else
  {
    v7 = v50;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v40 = MEMORY[0x24BDACB70];
    v42 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    v43 = -[ACCTransportIOAccessoryBase ioService](v9, "ioService");
    *(_DWORD *)buf = 67109634;
    v58 = v43;
    v59 = 2112;
    v60 = v39;
    v61 = 2112;
    v62 = v35;
    _os_log_impl(&dword_21722C000, v40, OS_LOG_TYPE_INFO, "setAccessoryInfo for OOBPairing service %d, endpointUUID %@, accInfo %@", buf, 0x1Cu);
  }

  -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setAccessoryInfo:forEndpointWithUUID:", v35, v39);

  v45 = (void *)objc_msgSend(v39, "copy");
  -[ACCTransportIOAccessoryOOBPairing setEndpointUUID:](v9, "setEndpointUUID:", v45);

  objc_msgSend(v54, "connectionUUID");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCTransportIOAccessoryOOBPairing setParentConnectionUUID:](v9, "setParentConnectionUUID:", v46);

  -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "connectionUUID");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "publishConnectionWithUUID:", v48);

LABEL_44:
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "unlock");

}

uint64_t __76__ACCTransportIOAccessorySharedManager_IOAccessoryOOBPairingServiceArrived___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)IOAccessoryOOBPairingServiceTerminated:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  BOOL v10;
  int v11;
  NSObject *v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  int v23;
  NSObject *v24;
  id v25;
  NSObject *listQ;
  uint64_t v27;
  void *v28;
  void *v29;
  BOOL v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t);
  void *v40;
  ACCTransportIOAccessorySharedManager *v41;
  id v42;
  uint8_t buf[4];
  _DWORD v44[7];

  v3 = *(_QWORD *)&a3;
  *(_QWORD *)&v44[5] = *MEMORY[0x24BDAC8D0];
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[ACCTransportIOAccessorySharedManager _basePortForService:](self, "_basePortForService:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "closeServiceSession");
    -[ACCTransportIOAccessorySharedManager _managerForBase:](self, "_managerForBase:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (gLogObjects)
      v10 = gNumLogObjects <= 1;
    else
      v10 = 1;
    v11 = !v10;
    if (v8)
    {
      if (v11)
      {
        v12 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v12 = MEMORY[0x24BDACB70];
        v16 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109376;
        v44[0] = -[NSObject ioService](v9, "ioService");
        LOWORD(v44[1]) = 1024;
        *(_DWORD *)((char *)&v44[1] + 2) = v3;
        _os_log_impl(&dword_21722C000, v12, OS_LOG_TYPE_INFO, "OOBPairing Terminated: found manager with service %d for terminated service %d", buf, 0xEu);
      }

      -[NSObject setNeedsOOBPairing:](v9, "setNeedsOOBPairing:", -[NSObject primaryPortNumber](v9, "primaryPortNumber") == 257);
      -[NSObject removeIOAccessoryChildPort:](v9, "removeIOAccessoryChildPort:", v7);
    }
    else
    {
      if (v11)
      {
        v15 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v15 = MEMORY[0x24BDACB70];
        v17 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v44[0] = v3;
        _os_log_impl(&dword_21722C000, v15, OS_LOG_TYPE_INFO, "Didn't find manager for removed auth CP service %d", buf, 8u);
      }

    }
    objc_msgSend(v7, "endpointUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");

    if (gLogObjects && gNumLogObjects >= 2)
    {
      v20 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v20 = MEMORY[0x24BDACB70];
      v21 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v44 = v19;
      _os_log_impl(&dword_21722C000, v20, OS_LOG_TYPE_DEFAULT, "Remove OOBPairing Service endpointUUID %@", buf, 0xCu);
    }

    if (v19)
    {
      -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "destroyEndpointWithUUID:", v19);

      if (v23)
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v24 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v24 = MEMORY[0x24BDACB70];
          v25 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v44 = v19;
          _os_log_impl(&dword_21722C000, v24, OS_LOG_TYPE_DEFAULT, "Removed OOBPairing service endpoint %@", buf, 0xCu);
        }

        objc_msgSend(v7, "setEndpointUUID:", 0);
        objc_msgSend(v7, "setParentConnectionUUID:", 0);
      }
    }
    listQ = self->_listQ;
    v37 = MEMORY[0x24BDAC760];
    v38 = 3221225472;
    v39 = __79__ACCTransportIOAccessorySharedManager_IOAccessoryOOBPairingServiceTerminated___block_invoke;
    v40 = &unk_24D71A1D8;
    v41 = self;
    v42 = v7;
    dispatch_sync(listQ, &v37);
    -[NSObject connectionUUID](v9, "connectionUUID", v37, v38, v39, v40, v41);
    v27 = objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v28 = (void *)v27;
      -[NSObject connectionUUID](v9, "connectionUUID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[ACCTransportIOAccessorySharedManager _managerForConnectionUUIDHasActiveEndpoint:](self, "_managerForConnectionUUIDHasActiveEndpoint:", v29);

      if (!v30)
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v31 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v31 = MEMORY[0x24BDACB70];
          v32 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject connectionUUID](v9, "connectionUUID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v44 = v33;
          _os_log_impl(&dword_21722C000, v31, OS_LOG_TYPE_DEFAULT, "No active endpoint for OOBPairing Service connection, remove connectionUUID %@", buf, 0xCu);

        }
        -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject connectionUUID](v9, "connectionUUID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "destroyConnectionWithUUID:", v35);

        -[NSObject setConnectionUUID:](v9, "setConnectionUUID:", 0);
        -[ACCTransportIOAccessorySharedManager _clearChildPortEndpointsForManagerDisconnection:](self, "_clearChildPortEndpointsForManagerDisconnection:", v9);
      }
    }

  }
  else
  {
    if (gLogObjects)
      v13 = gNumLogObjects < 2;
    else
      v13 = 1;
    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    else
    {
      v9 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v44[0] = v3;
      _os_log_impl(&dword_21722C000, v9, OS_LOG_TYPE_INFO, "Didn't find base accessory object for removed OOBPairing service %d", buf, 8u);
    }
  }

  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "unlock");

}

uint64_t __79__ACCTransportIOAccessorySharedManager_IOAccessoryOOBPairingServiceTerminated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (id)IOAccessoryPortArrived:(id)a3 withEndpointProtocol:(int)a4 publish:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  id v8;
  void *v9;
  unint64_t v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int isForcePassthroughIOAccessoryManagerPort;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  id v47;
  int v48;
  uint64_t v49;
  NSObject *v50;
  id v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  id v61;
  void *v62;
  unsigned int v64;
  unsigned int v65;
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[3];
  _QWORD v69[3];
  uint64_t v70;
  void *v71;
  uint8_t buf[4];
  _BYTE v73[14];
  __int16 v74;
  unsigned int v75;
  __int16 v76;
  int v77;
  __int16 v78;
  int v79;
  __int16 v80;
  _BOOL4 v81;
  uint64_t v82;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v82 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lock");

  v10 = 0x253E63000uLL;
  if (gLogObjects)
    v11 = gNumLogObjects < 2;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v13 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413570;
    *(_QWORD *)v73 = v8;
    *(_WORD *)&v73[8] = 1024;
    *(_DWORD *)&v73[10] = objc_msgSend(v8, "primaryPortNumber");
    v74 = 1024;
    v75 = objc_msgSend(v8, "portIDNumber");
    v76 = 1024;
    v77 = objc_msgSend(v8, "portStreamType");
    v78 = 1024;
    v79 = v6;
    v80 = 1024;
    v81 = v5;
    _os_log_impl(&dword_21722C000, v13, OS_LOG_TYPE_INFO, "IOAccessoryPortArrived: port %@ (%d / %d) streamType %d, endpointProtocol %{coreacc:ACCEndpoint_Protocol_t}d, publish %d", buf, 0x2Au);
  }

  -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v65 = -[ACCTransportIOAccessorySharedManager _endpointTransportTypeForIOAccessoryPort:](self, "_endpointTransportTypeForIOAccessoryPort:", v8);
    -[ACCTransportIOAccessorySharedManager _managerForBase:](self, "_managerForBase:", v8);
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject connectionUUID](v15, "connectionUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = v6;
    if (v16)
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v17 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v17 = MEMORY[0x24BDACB70];
        v32 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[ACCTransportIOAccessorySharedManager IOAccessoryPortArrived:withEndpointProtocol:publish:].cold.5(v15);

      -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v33
        || (-[NSObject inductiveLocalDeviceID](v15, "inductiveLocalDeviceID"),
            v34 = (void *)objc_claimAutoreleasedReturnValue(),
            v34,
            !v34))
      {
LABEL_35:
        -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject connectionUUID](v15, "connectionUUID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "createEndpointWithTransportType:andProtocol:andIdentifier:forConnectionWithUUID:publishConnection:", v65, v6, 0, v37, 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSObject connectionUUID](v15, "connectionUUID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setIoAccPortParentConnectionUUID:", v39);

        if (!__isForcePassthroughIOAccessoryManagerPort())
          goto LABEL_47;
        isForcePassthroughIOAccessoryManagerPort = __isForcePassthroughIOAccessoryManagerPort();
        if (isForcePassthroughIOAccessoryManagerPort == 2)
        {
          -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setProperties:forEndpointWithUUID:", &unk_24D726520, v38);
        }
        else
        {
          if (isForcePassthroughIOAccessoryManagerPort != 1)
            goto LABEL_47;
          -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (void *)objc_msgSend(&unk_24D7264F8, "copy");
          objc_msgSend(v41, "setProperties:forEndpointWithUUID:", v42, v38);

        }
LABEL_47:
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = *(_QWORD *)(v10 + 2768);
        if (v45 && gNumLogObjects >= 2)
        {
          v46 = *(id *)(v45 + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v46 = MEMORY[0x24BDACB70];
          v47 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          v48 = -[NSObject resistorID](v15, "resistorID");
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v73 = v48;
          _os_log_impl(&dword_21722C000, v46, OS_LOG_TYPE_INFO, "resistorID from manager in IOAccessoryPortArrived: %u", buf, 8u);
        }

        if (-[NSObject resistorID](v15, "resistorID") != 100
          && -[NSObject resistorID](v15, "resistorID") != -1)
        {
          v49 = *(_QWORD *)(v10 + 2768);
          if (v49 && gNumLogObjects >= 2)
          {
            v50 = *(id *)(v49 + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v50 = MEMORY[0x24BDACB70];
            v51 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            v52 = -[NSObject resistorID](v15, "resistorID");
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v73 = v52;
            _os_log_impl(&dword_21722C000, v50, OS_LOG_TYPE_DEFAULT, "Sending resistorID %d with IOAccessoryPort endpoint properties", buf, 8u);
          }

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NSObject resistorID](v15, "resistorID"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setObject:forKey:", v53, *MEMORY[0x24BE1A1A0]);

        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", (int)objc_msgSend(v8, "portIDNumber"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setObject:forKey:", v54, *MEMORY[0x24BE1A198]);

        -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (void *)objc_msgSend(v44, "copy");
        objc_msgSend(v55, "setProperties:forEndpointWithUUID:", v56, v38);

        if (v5)
        {
          -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject connectionUUID](v15, "connectionUUID");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "publishConnectionWithUUID:", v58);

        }
        v59 = *(_QWORD *)(v10 + 2768);
        if (v59 && gNumLogObjects >= 2)
        {
          v60 = *(id *)(v59 + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v60 = MEMORY[0x24BDACB70];
          v61 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v73 = v65;
          *(_WORD *)&v73[4] = 2112;
          *(_QWORD *)&v73[6] = v38;
          v74 = 1024;
          v75 = v64;
          _os_log_impl(&dword_21722C000, v60, OS_LOG_TYPE_DEFAULT, "IOAccessoryPort arrived, transportType: %{coreacc:ACCEndpoint_TransportType_t}d, assigned endpointUUID %@, endpoint protocol %{coreacc:ACCEndpoint_Protocol_t}d", buf, 0x18u);
        }

        goto LABEL_77;
      }
      v70 = *MEMORY[0x24BE1A160];
      -[NSObject inductiveLocalDeviceID](v15, "inductiveLocalDeviceID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v35;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v21, "copy");
      -[NSObject connectionUUID](v15, "connectionUUID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setProperties:forConnectionWithUUID:", v30, v31);
LABEL_34:

      v6 = v64;
      goto LABEL_35;
    }
    -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_35;
    v19 = -[ACCTransportIOAccessorySharedManager _connectionTypeForIOAccessoryPort:](self, "_connectionTypeForIOAccessoryPort:", v8);
    -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "createConnectionWithType:andIdentifier:", v19, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setSupervisedTransportsRestricted:forConnectionWithUUID:", -[NSObject supervisedTransportsRestricted](v15, "supervisedTransportsRestricted"), v21);

    -[NSObject setConnectionUUID:](v15, "setConnectionUUID:", v21);
    -[NSObject inductiveLocalDeviceID](v15, "inductiveLocalDeviceID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (_QWORD *)MEMORY[0x24BE1A158];
    if (v23)
    {
      v68[0] = *MEMORY[0x24BE1A178];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", (int)objc_msgSend(v8, "primaryPortNumber"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v69[0] = v25;
      v68[1] = *v24;
      -[NSObject digitalID](v15, "digitalID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (!v26)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v69[1] = v27;
      v68[2] = *MEMORY[0x24BE1A160];
      -[NSObject inductiveLocalDeviceID](v15, "inductiveLocalDeviceID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v69[2] = v28;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, v68, 3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
        goto LABEL_25;
    }
    else
    {
      v66[0] = *MEMORY[0x24BE1A178];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", (int)objc_msgSend(v8, "primaryPortNumber"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v66[1] = *v24;
      v67[0] = v25;
      -[NSObject digitalID](v15, "digitalID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (!v26)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v67[1] = v27;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, v66, 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
        goto LABEL_25;
    }

LABEL_25:
    -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v29, "copy");
    objc_msgSend(v30, "setProperties:forConnectionWithUUID:", v31, v21);
    v10 = 0x253E63000;
    goto LABEL_34;
  }
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v15 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v15 = MEMORY[0x24BDACB70];
    v43 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21722C000, v15, OS_LOG_TYPE_INFO, "Can't find delegate for ACCTransportIOAccessoryPortProtocol accessoryPortAttached", buf, 2u);
  }
  v38 = 0;
LABEL_77:

  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "unlock");

  return v38;
}

- (void)_IOAccessoryPortDetachInternal:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  BOOL v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "ioAccPortEndpointUUID");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[ACCTransportIOAccessorySharedManager delegate](self, "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    objc_msgSend(v4, "ioAccPortEndpointUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");

    if (gLogObjects && gNumLogObjects >= 2)
    {
      v10 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 138412290;
      v30 = v9;
      _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_DEFAULT, "IOAccessoryPortDetachInternal: remove endpointUUID %@", (uint8_t *)&v29, 0xCu);
    }

    if (v9
      && (-[ACCTransportIOAccessorySharedManager delegate](self, "delegate"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "destroyEndpointWithUUID:", v9),
          v14,
          v15))
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v16 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v16 = MEMORY[0x24BDACB70];
        v19 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v29 = 138412290;
        v30 = v9;
        _os_log_impl(&dword_21722C000, v16, OS_LOG_TYPE_DEFAULT, "Successfully sent io accessory port detach for endpointToRemove %@", (uint8_t *)&v29, 0xCu);
      }

      -[ACCTransportIOAccessorySharedManager _managerForBase:](self, "_managerForBase:", v4);
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setIoAccPortEndpointUUID:", 0);
      objc_msgSend(v4, "setIoAccPortParentConnectionUUID:", 0);
      -[NSObject connectionUUID](v17, "connectionUUID");
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = (void *)v20;
        -[NSObject connectionUUID](v17, "connectionUUID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[ACCTransportIOAccessorySharedManager _managerForConnectionUUIDHasActiveEndpoint:](self, "_managerForConnectionUUIDHasActiveEndpoint:", v22);

        if (!v23)
        {
          if (gLogObjects && gNumLogObjects >= 2)
          {
            v24 = *(id *)(gLogObjects + 8);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v24 = MEMORY[0x24BDACB70];
            v25 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            -[NSObject connectionUUID](v17, "connectionUUID");
            v26 = objc_claimAutoreleasedReturnValue();
            v29 = 138412290;
            v30 = v26;
            _os_log_impl(&dword_21722C000, v24, OS_LOG_TYPE_DEFAULT, "No active endpoint for IOAccessoryPort, remove connectionUUID %@", (uint8_t *)&v29, 0xCu);

          }
          -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject connectionUUID](v17, "connectionUUID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "destroyConnectionWithUUID:", v28);

          -[NSObject setConnectionUUID:](v17, "setConnectionUUID:", 0);
          -[ACCTransportIOAccessorySharedManager _clearChildPortEndpointsForManagerDisconnection:](self, "_clearChildPortEndpointsForManagerDisconnection:", v17);
        }
      }
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v17 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v17 = MEMORY[0x24BDACB70];
        v18 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessorySharedManager _IOAccessoryPortDetachInternal:].cold.2();
    }

  }
  else
  {
    if (gLogObjects)
      v11 = gNumLogObjects < 2;
    else
      v11 = 1;
    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    else
    {
      v9 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 67109120;
      LODWORD(v30) = objc_msgSend(v4, "ioService");
      _os_log_impl(&dword_21722C000, v9, OS_LOG_TYPE_DEFAULT, "No active endpointUUID for IOAccessoryPort service %d", (uint8_t *)&v29, 8u);
    }
  }

}

- (void)IOAccessoryPortDetach:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[ACCTransportIOAccessorySharedManager _IOAccessoryPortDetachInternal:](self, "_IOAccessoryPortDetachInternal:", v4);
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (BOOL)IOAccessoryPortDataArrived:(id)a3 endpointUUID:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  os_signpost_id_t v12;
  uint64_t v13;
  os_signpost_id_t v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  int v27;
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogSignpostObjects)
    v8 = gNumLogSignpostObjects < 4;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:].cold.2();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)(gLogSignpostObjects + 24);
  }
  v11 = objc_msgSend(v7, "hash");
  if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v12 = v11;
    if (os_signpost_enabled(v10))
    {
      v27 = 138412546;
      v28 = (const char *)v7;
      v29 = 2048;
      v30 = objc_msgSend(v6, "length");
      _os_signpost_emit_with_name_impl(&dword_21722C000, v10, OS_SIGNPOST_EVENT, v12, "Endpoint RECV", "Received incoming data! %@, %lu bytes", (uint8_t *)&v27, 0x16u);
    }
  }

  v13 = objc_msgSend(v7, "hash");
  v14 = objc_msgSend(v6, "hash") ^ v13;
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v15 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:].cold.2();
    v15 = MEMORY[0x24BDACB70];
    v16 = MEMORY[0x24BDACB70];
  }
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    v17 = objc_msgSend(v6, "length");
    v27 = 138412546;
    v28 = (const char *)v7;
    v29 = 2048;
    v30 = v17;
    _os_signpost_emit_with_name_impl(&dword_21722C000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v14, "Endpoint RECV", "Received incoming data! %@, %lu bytes", (uint8_t *)&v27, 0x16u);
  }

  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lock");

  -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = objc_msgSend(v20, "processIncomingData:forEndpointWithUUID:", v6, v7);

  }
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "unlock");

  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v22 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:].cold.2();
    v22 = MEMORY[0x24BDACB70];
    v23 = MEMORY[0x24BDACB70];
  }
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    if ((_DWORD)v19)
      v24 = "SUCCESS";
    else
      v24 = "ERROR";
    v25 = objc_msgSend(v6, "length");
    v27 = 136315650;
    v28 = v24;
    v29 = 2112;
    v30 = (uint64_t)v7;
    v31 = 2048;
    v32 = v25;
    _os_signpost_emit_with_name_impl(&dword_21722C000, v22, OS_SIGNPOST_INTERVAL_END, v14, "Endpoint RECV", "%s handling Received incoming data! %@, %lu bytes", (uint8_t *)&v27, 0x20u);
  }

  return (char)v19;
}

- (void)IOAccessoryPortPropertyChanged:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  _DWORD v22[7];

  *(_QWORD *)&v22[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[ACCTransportIOAccessorySharedManager _managerForIOService:shouldCreateNewService:](self, "_managerForIOService:shouldCreateNewService:", objc_msgSend(v4, "ioService"), 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (gLogObjects)
    v8 = gNumLogObjects <= 1;
  else
    v8 = 1;
  v9 = !v8;
  if (!v6)
  {
    if (v9)
    {
      v11 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 67109376;
      v22[0] = objc_msgSend(v4, "ioService");
      LOWORD(v22[1]) = 1024;
      *(_DWORD *)((char *)&v22[1] + 2) = objc_msgSend(v4, "portIDNumber");
      _os_log_impl(&dword_21722C000, v11, OS_LOG_TYPE_DEFAULT, "Didn't find existing manager for property change IOAccessoryPortService %d, portID %d", (uint8_t *)&v21, 0xEu);
    }
    goto LABEL_39;
  }
  if (v9)
  {
    v10 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v10 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 67109376;
    v22[0] = objc_msgSend(v7, "ioService");
    LOWORD(v22[1]) = 1024;
    *(_DWORD *)((char *)&v22[1] + 2) = objc_msgSend(v4, "ioService");
    _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_DEFAULT, "Found manager with service %d for property change IOAccessoryPort service %d, will remove from its child ports", (uint8_t *)&v21, 0xEu);
  }

  objc_msgSend(v7, "removeIOAccessoryChildPort:", v4);
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v13 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v13 = MEMORY[0x24BDACB70];
    v14 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "ioAccPortParentConnectionUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412290;
    *(_QWORD *)v22 = v15;
    _os_log_impl(&dword_21722C000, v13, OS_LOG_TYPE_DEFAULT, "Current parent connectionUUID for port is %@", (uint8_t *)&v21, 0xCu);

  }
  objc_msgSend(v4, "ioAccPortParentConnectionUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v11 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v17 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "ioAccPortEndpointUUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412290;
      *(_QWORD *)v22 = v18;
      _os_log_impl(&dword_21722C000, v11, OS_LOG_TYPE_DEFAULT, "Current endpointUUID for port is %@", (uint8_t *)&v21, 0xCu);

    }
LABEL_39:

  }
  -[ACCTransportIOAccessorySharedManager _addACCTransportToManager:](self, "_addACCTransportToManager:", v4);
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "unlock");

}

- (void)IOAccessoryPortPublish:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  _DWORD v14[2];
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[ACCTransportIOAccessorySharedManager _managerForIOService:shouldCreateNewService:](self, "_managerForIOService:shouldCreateNewService:", objc_msgSend(v4, "ioService"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v7 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v14[0] = 67109376;
      v14[1] = objc_msgSend(v6, "ioService");
      v15 = 1024;
      v16 = objc_msgSend(v4, "ioService");
      _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_DEFAULT, "Found manager with service %d for property change IOAccessoryPort service %d, will publish", (uint8_t *)v14, 0xEu);
    }

    -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "connectionUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject publishConnectionWithUUID:](v10, "publishConnectionWithUUID:", v11);

    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v10 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v10 = MEMORY[0x24BDACB70];
        v12 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14[0]) = 0;
        _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_INFO, "Can't find delegate for ACCTransportIOAccessoryPortProtocol skip Publish", (uint8_t *)v14, 2u);
      }
    }

  }
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unlock");

}

- (void)IOAccessoryAuthCPServiceAuthStatusChanged:(int)a3 authType:(int)a4 authCert:(id)a5 certType:(int)a6 authCTA:(BOOL)a7 service:(unsigned int)a8
{
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v11;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id *p_isa;
  void *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  uint64_t v46;
  int v47;
  BOOL v48;
  NSObject *v49;
  NSObject *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  ACCTransportIOAccessorySharedManager *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _QWORD v76[2];
  _QWORD v77[2];
  uint8_t buf[4];
  __int128 v79;
  __int16 v80;
  int v81;
  __int16 v82;
  int v83;
  __int16 v84;
  int v85;
  uint64_t v86;

  v8 = *(_QWORD *)&a8;
  v9 = a7;
  v11 = *(_QWORD *)&a3;
  v86 = *MEMORY[0x24BDAC8D0];
  v13 = a5;
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lock");

  -[ACCTransportIOAccessorySharedManager _managerForIOService:shouldCreateNewService:](self, "_managerForIOService:shouldCreateNewService:", v8, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = self;
  -[ACCTransportIOAccessorySharedManager _basePortForService:](self, "_basePortForService:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "delegate");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogObjects && gNumLogObjects >= 2)
  {
    v18 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v18 = MEMORY[0x24BDACB70];
    v19 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110400;
    LODWORD(v79) = v11;
    WORD2(v79) = 1024;
    *(_DWORD *)((char *)&v79 + 6) = 2;
    WORD5(v79) = 1024;
    HIDWORD(v79) = a4;
    v80 = 1024;
    v81 = v8;
    v82 = 1024;
    v83 = (unsigned __int16)v15;
    v84 = 1024;
    v85 = (unsigned __int16)v16;
    _os_log_impl(&dword_21722C000, v18, OS_LOG_TYPE_DEFAULT, "newAuthStatus = %d (passed = %d), authType = %d, ioService = %d, accMgrInstance: %04X, authCPInstance = %04X", buf, 0x26u);
  }

  IOAccessoryManagerGetUpstreamService();
  p_isa = (id *)&v70->super.isa;
  if (!(v70->_bIsWatch | ((IOAccessoryManagerGetType() & 0xF) == 5)))
  {
    if (v15
      && (objc_msgSend(v15, "connectionUUID"), v21 = (void *)objc_claimAutoreleasedReturnValue(),
                                               v21,
                                               !v21))
    {
      if ((_DWORD)v11 != 2)
        goto LABEL_21;
      v67 = v16;
      v55 = v13;
      -[ACCTransportIOAccessorySharedManager delegate](v70, "delegate");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "createConnectionWithType:andIdentifier:", objc_msgSend(v15, "connectionType"), 0);
      v22 = objc_claimAutoreleasedReturnValue();

      -[ACCTransportIOAccessorySharedManager delegate](v70, "delegate");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setSupervisedTransportsRestricted:forConnectionWithUUID:", objc_msgSend(v15, "supervisedTransportsRestricted"), v22);

      objc_msgSend(v15, "setConnectionUUID:", v22);
      v76[0] = *MEMORY[0x24BE1A178];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", (int)objc_msgSend(v15, "primaryPortNumber"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v77[0] = v58;
      v76[1] = *MEMORY[0x24BE1A158];
      objc_msgSend(v15, "digitalID");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v59;
      if (!v59)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v77[1] = v60;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v77, v76, 2);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v59)

      -[ACCTransportIOAccessorySharedManager delegate](v70, "delegate");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = (void *)objc_msgSend(v61, "copy");
      objc_msgSend(v62, "setProperties:forConnectionWithUUID:", v63, v22);

      p_isa = (id *)&v70->super.isa;
      v13 = v55;
      v16 = v67;
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v22 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v22 = MEMORY[0x24BDACB70];
        v23 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[ACCTransportIOAccessorySharedManager IOAccessoryAuthCPServiceAuthStatusChanged:authType:authCert:certType:authCTA:service:].cold.7(v15);
    }

  }
LABEL_21:
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v24 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v24 = MEMORY[0x24BDACB70];
    v25 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v15, "connectionUUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    LODWORD(v79) = (unsigned __int16)v15;
    WORD2(v79) = 2112;
    *(_QWORD *)((char *)&v79 + 6) = v26;
    _os_log_impl(&dword_21722C000, v24, OS_LOG_TYPE_DEFAULT, "accMgrInstance: %04X, connectionUUID:[%@]", buf, 0x12u);

  }
  if ((_DWORD)v11 == 2)
    v27 = 2;
  else
    v27 = 1;
  v28 = v15;
  if (v15
    || v16
    && (objc_msgSend(v16, "connectionUUID"),
        v30 = (void *)objc_claimAutoreleasedReturnValue(),
        v30,
        v28 = v16,
        v30))
  {
    objc_msgSend(v28, "connectionUUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29
      && (objc_msgSend(v68, "setAuthenticationStatus:andCertificateData:authCTA:forConnectionWithUUID:", v27, v13, v9, v29) & 1) != 0)
    {
      if (!v15)
        goto LABEL_67;
      goto LABEL_57;
    }
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v31 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v31 = MEMORY[0x24BDACB70];
      v32 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21722C000, v31, OS_LOG_TYPE_INFO, "auth status changed, but no connectionUUID is associated with the auth status event", buf, 2u);
    }

    v29 = 0;
  }
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v33 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v33 = MEMORY[0x24BDACB70];
    v34 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    -[ACCTransportIOAccessorySharedManager IOAccessoryAuthCPServiceAuthStatusChanged:authType:authCert:certType:authCTA:service:].cold.3();

  if (v15)
  {
LABEL_57:
    if ((objc_msgSend(v15, "setFeaturesFromAuthStatus:authCert:certType:", v11, v13, a6) & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v35 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v35 = MEMORY[0x24BDACB70];
        v36 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessorySharedManager IOAccessoryAuthCPServiceAuthStatusChanged:authType:authCert:certType:authCTA:service:].cold.1();

    }
  }
LABEL_67:
  if ((_DWORD)v11 == 2)
  {
    v64 = v29;
    v65 = v13;
    v66 = v16;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setIsAuthenticated:", 1);
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v38 = p_isa[13];
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
    if (v39)
    {
      v40 = v39;
      v41 = MEMORY[0x24BDACB70];
      v42 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v72 != v42)
            objc_enumerationMutation(v38);
          v44 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
          objc_msgSend(v44, "mgr");
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (v45 == v15)
          {
            v46 = gLogObjects;
            v47 = gNumLogObjects;
            if (gLogObjects)
              v48 = gNumLogObjects < 2;
            else
              v48 = 1;
            if (v48)
            {
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                *(_QWORD *)&v79 = v46;
                WORD4(v79) = 1024;
                *(_DWORD *)((char *)&v79 + 10) = v47;
                _os_log_error_impl(&dword_21722C000, v41, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v49 = v41;
              v50 = v41;
            }
            else
            {
              v50 = *(id *)(gLogObjects + 8);
            }
            p_isa = (id *)&v70->super.isa;
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              v51 = objc_msgSend(v44, "service");
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&v79 = v15;
              WORD4(v79) = 1024;
              *(_DWORD *)((char *)&v79 + 10) = v51;
              _os_log_impl(&dword_21722C000, v50, OS_LOG_TYPE_DEFAULT, "accMgrInstance=%@ Auth passed. Processing deferred EA service %d, and remove it from deferral list", buf, 0x12u);
            }

            -[ACCTransportIOAccessorySharedManager _processEAService:andPublish:](v70, "_processEAService:andPublish:", objc_msgSend(v44, "service"), 0);
            IOObjectRelease(objc_msgSend(v44, "service"));
            objc_msgSend(v37, "addObject:", v44);
          }
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
      }
      while (v40);
    }

    v13 = v65;
    if (objc_msgSend(v37, "count"))
    {
      objc_msgSend(p_isa, "delegate");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "connectionUUID");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "publishConnectionWithUUID:", v53);

    }
    objc_msgSend(p_isa[13], "removeObjectsInArray:", v37);

    v16 = v66;
    v29 = v64;
  }
  else if ((_DWORD)v11 == 4)
  {
    objc_msgSend(v15, "setIsAuthTimedOut:", 1);
  }
  objc_msgSend(p_isa, "accessoryPortLock");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "unlock");

}

- (BOOL)IOAccessoryEADataArrived:(id)a3 eaEndpointUUID:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  os_signpost_id_t v12;
  uint64_t v13;
  os_signpost_id_t v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  int v26;
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogSignpostObjects)
    v8 = gNumLogSignpostObjects < 4;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:].cold.2();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)(gLogSignpostObjects + 24);
  }
  v11 = objc_msgSend(v7, "hash");
  if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v12 = v11;
    if (os_signpost_enabled(v10))
    {
      v26 = 138412546;
      v27 = (const char *)v7;
      v28 = 2048;
      v29 = objc_msgSend(v6, "length");
      _os_signpost_emit_with_name_impl(&dword_21722C000, v10, OS_SIGNPOST_EVENT, v12, "Endpoint RECV", "Received incoming EA data! %@, %lu bytes", (uint8_t *)&v26, 0x16u);
    }
  }

  v13 = objc_msgSend(v7, "hash");
  v14 = objc_msgSend(v6, "hash") ^ v13;
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v15 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:].cold.2();
    v15 = MEMORY[0x24BDACB70];
    v16 = MEMORY[0x24BDACB70];
  }
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    v17 = objc_msgSend(v6, "length");
    v26 = 138412546;
    v27 = (const char *)v7;
    v28 = 2048;
    v29 = v17;
    _os_signpost_emit_with_name_impl(&dword_21722C000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v14, "Endpoint RECV", "Received incoming EA data! %@, %lu bytes", (uint8_t *)&v26, 0x16u);
  }

  -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "processIncomingData:forEndpointWithUUID:", v6, v7);

  }
  else
  {
    v20 = 0;
  }
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v21 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:].cold.2();
    v21 = MEMORY[0x24BDACB70];
    v22 = MEMORY[0x24BDACB70];
  }
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    if (v20)
      v23 = "SUCCESS";
    else
      v23 = "ERROR";
    v24 = objc_msgSend(v6, "length");
    v26 = 136315650;
    v27 = v23;
    v28 = 2112;
    v29 = (uint64_t)v7;
    v30 = 2048;
    v31 = v24;
    _os_signpost_emit_with_name_impl(&dword_21722C000, v21, OS_SIGNPOST_INTERVAL_END, v14, "Endpoint RECV", "%s handling Received incoming EA data! %@, %lu bytes", (uint8_t *)&v26, 0x20u);
  }

  return v20;
}

- (BOOL)IOAccessoryOOBPairingInfoArrived:(id)a3 endpointUUID:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  os_signpost_id_t v12;
  uint64_t v13;
  os_signpost_id_t v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  int v26;
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogSignpostObjects)
    v8 = gNumLogSignpostObjects < 4;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:].cold.2();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)(gLogSignpostObjects + 24);
  }
  v11 = objc_msgSend(v7, "hash");
  if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v12 = v11;
    if (os_signpost_enabled(v10))
    {
      v26 = 138412546;
      v27 = (const char *)v7;
      v28 = 2048;
      v29 = objc_msgSend(v6, "length");
      _os_signpost_emit_with_name_impl(&dword_21722C000, v10, OS_SIGNPOST_EVENT, v12, "Endpoint RECV", "Received incoming OOBPairingInfo data! %@, %lu bytes", (uint8_t *)&v26, 0x16u);
    }
  }

  v13 = objc_msgSend(v7, "hash");
  v14 = objc_msgSend(v6, "hash") ^ v13;
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v15 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:].cold.2();
    v15 = MEMORY[0x24BDACB70];
    v16 = MEMORY[0x24BDACB70];
  }
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    v17 = objc_msgSend(v6, "length");
    v26 = 138412546;
    v27 = (const char *)v7;
    v28 = 2048;
    v29 = v17;
    _os_signpost_emit_with_name_impl(&dword_21722C000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v14, "Endpoint RECV", "Received incoming OOBPairingInfo data! %@, %lu bytes", (uint8_t *)&v26, 0x16u);
  }

  -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "processIncomingData:forEndpointWithUUID:", v6, v7);

  }
  else
  {
    v20 = 0;
  }
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v21 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:].cold.2();
    v21 = MEMORY[0x24BDACB70];
    v22 = MEMORY[0x24BDACB70];
  }
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    if (v20)
      v23 = "SUCCESS";
    else
      v23 = "ERROR";
    v24 = objc_msgSend(v6, "length");
    v26 = 136315650;
    v27 = v23;
    v28 = 2112;
    v29 = (uint64_t)v7;
    v30 = 2048;
    v31 = v24;
    _os_signpost_emit_with_name_impl(&dword_21722C000, v21, OS_SIGNPOST_INTERVAL_END, v14, "Endpoint RECV", "%s handling Received incoming OOBPairingInfo data! %@, %lu bytes", (uint8_t *)&v26, 0x20u);
  }

  return v20;
}

- (BOOL)IOAccessoryOOBPairingDataArrived:(id)a3 endpointUUID:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  os_signpost_id_t v12;
  uint64_t v13;
  os_signpost_id_t v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  int v26;
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogSignpostObjects)
    v8 = gNumLogSignpostObjects < 4;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:].cold.2();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)(gLogSignpostObjects + 24);
  }
  v11 = objc_msgSend(v7, "hash");
  if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v12 = v11;
    if (os_signpost_enabled(v10))
    {
      v26 = 138412546;
      v27 = (const char *)v7;
      v28 = 2048;
      v29 = objc_msgSend(v6, "length");
      _os_signpost_emit_with_name_impl(&dword_21722C000, v10, OS_SIGNPOST_EVENT, v12, "Endpoint RECV", "Received incoming OOBPairingData data! %@, %lu bytes", (uint8_t *)&v26, 0x16u);
    }
  }

  v13 = objc_msgSend(v7, "hash");
  v14 = objc_msgSend(v6, "hash") ^ v13;
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v15 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:].cold.2();
    v15 = MEMORY[0x24BDACB70];
    v16 = MEMORY[0x24BDACB70];
  }
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    v17 = objc_msgSend(v6, "length");
    v26 = 138412546;
    v27 = (const char *)v7;
    v28 = 2048;
    v29 = v17;
    _os_signpost_emit_with_name_impl(&dword_21722C000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v14, "Endpoint RECV", "Received incoming OOBPairingData data! %@, %lu bytes", (uint8_t *)&v26, 0x16u);
  }

  -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "processIncomingData:forEndpointWithUUID:", v6, v7);

  }
  else
  {
    v20 = 0;
  }
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v21 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:].cold.2();
    v21 = MEMORY[0x24BDACB70];
    v22 = MEMORY[0x24BDACB70];
  }
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    if (v20)
      v23 = "SUCCESS";
    else
      v23 = "ERROR";
    v24 = objc_msgSend(v6, "length");
    v26 = 136315650;
    v27 = v23;
    v28 = 2112;
    v29 = (uint64_t)v7;
    v30 = 2048;
    v31 = v24;
    _os_signpost_emit_with_name_impl(&dword_21722C000, v21, OS_SIGNPOST_INTERVAL_END, v14, "Endpoint RECV", "%s handling Received incoming OOBPairingData data! %@, %lu bytes", (uint8_t *)&v26, 0x20u);
  }

  return v20;
}

- (BOOL)IOAccessoryOOBPairingDataStartedForEndpointUUID:(id)a3
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (gLogObjects)
    v4 = gNumLogObjects < 2;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_21722C000, v6, OS_LOG_TYPE_DEFAULT, "IOAccessoryOOBPairingDataStartedForEndpointUUID: %@", (uint8_t *)&v8, 0xCu);
  }

  return 1;
}

- (BOOL)IOAccessoryOOBPairingDataFinishedForEndpointUUID:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  int v13;
  NSObject *listQ;
  id v15;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 2;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v4;
    _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_DEFAULT, "IOAccessoryOOBPairingDataFinishedForEndpointUUID: %@", buf, 0xCu);
  }

  -[ACCTransportIOAccessorySharedManager _basePortForEndpointUUID:](self, "_basePortForEndpointUUID:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "ioServiceClassType") == 4)
  {
    -[ACCTransportIOAccessorySharedManager _managerForBase:](self, "_managerForBase:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v11 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v11 = MEMORY[0x24BDACB70];
        v12 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_msgSend(v10, "needsOOBPairing");
        *(_DWORD *)buf = 138412546;
        v20 = v10;
        v21 = 1024;
        v22 = v13;
        _os_log_impl(&dword_21722C000, v11, OS_LOG_TYPE_DEFAULT, "accMgrInstance=%@ OOBPairing finished. Reset needsOOBPairing, current %d", buf, 0x12u);
      }

      objc_msgSend(v10, "setNeedsOOBPairing:", 0);
    }
  }
  else
  {
    v10 = 0;
  }
  listQ = self->_listQ;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __89__ACCTransportIOAccessorySharedManager_IOAccessoryOOBPairingDataFinishedForEndpointUUID___block_invoke;
  v17[3] = &unk_24D71A1D8;
  v17[4] = self;
  v18 = v10;
  v15 = v10;
  dispatch_async(listQ, v17);

  return 1;
}

void __89__ACCTransportIOAccessorySharedManager_IOAccessoryOOBPairingDataFinishedForEndpointUUID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  _QWORD block[4];
  id v25;
  id v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v29;
    v8 = MEMORY[0x24BDACB70];
    *(_QWORD *)&v5 = 134218240;
    v23 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v10, "mgr", v23);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(void **)(a1 + 40);

        if (v11 == v12)
        {
          v13 = gLogObjects;
          v14 = gNumLogObjects;
          if (gLogObjects)
            v15 = gNumLogObjects < 2;
          else
            v15 = 1;
          if (v15)
          {
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v23;
              v34 = v13;
              v35 = 1024;
              v36 = v14;
              _os_log_error_impl(&dword_21722C000, v8, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v16 = v8;
            v17 = v8;
          }
          else
          {
            v17 = *(id *)(gLogObjects + 8);
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = *(_QWORD *)(a1 + 40);
            v19 = objc_msgSend(v10, "service");
            *(_DWORD *)buf = 138412546;
            v34 = v18;
            v35 = 1024;
            v36 = v19;
            _os_log_impl(&dword_21722C000, v17, OS_LOG_TYPE_DEFAULT, "accMgrInstance=%@ OOBPairing finished. Found deferred AuthCP service %d, remove it from deferral list", buf, 0x12u);
          }

          objc_msgSend(v2, "addObject:", v10);
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeObjectsInArray:", v2);
  if (objc_msgSend(v2, "count"))
  {
    dispatch_get_global_queue(0, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __89__ACCTransportIOAccessorySharedManager_IOAccessoryOOBPairingDataFinishedForEndpointUUID___block_invoke_123;
    block[3] = &unk_24D719FD0;
    v25 = v2;
    v21 = *(id *)(a1 + 40);
    v22 = *(_QWORD *)(a1 + 32);
    v26 = v21;
    v27 = v22;
    dispatch_async(v20, block);

  }
}

void __89__ACCTransportIOAccessorySharedManager_IOAccessoryOOBPairingDataFinishedForEndpointUUID___block_invoke_123(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  int v9;
  BOOL v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v17;
    v5 = MEMORY[0x24BDACB70];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v8 = gLogObjects;
        v9 = gNumLogObjects;
        if (gLogObjects)
          v10 = gNumLogObjects < 2;
        else
          v10 = 1;
        if (v10)
        {
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v22 = v8;
            v23 = 1024;
            v24 = v9;
            _os_log_error_impl(&dword_21722C000, v5, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v11 = v5;
          v12 = v5;
        }
        else
        {
          v12 = *(id *)(gLogObjects + 8);
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = *(_QWORD *)(a1 + 40);
          v14 = objc_msgSend(v7, "service");
          *(_DWORD *)buf = 138412546;
          v22 = v13;
          v23 = 1024;
          v24 = v14;
          _os_log_impl(&dword_21722C000, v12, OS_LOG_TYPE_DEFAULT, "accMgrInstance=%@ OOBPairing finished. Processing deferred AuthCP service %d", buf, 0x12u);
        }

        objc_msgSend(*(id *)(a1 + 48), "IOAccessoryAuthCPServiceArrived:", objc_msgSend(v7, "service"));
        IOObjectRelease(objc_msgSend(v7, "service"));
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v3);
  }

}

- (void)IOAccessoryConfigStreamServiceArrived:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  ACCTransportIOAccessoryConfigStream *v7;
  NSObject *listQ;
  ACCTransportIOAccessoryConfigStream *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  id v37;
  id v38;
  unsigned int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  id v46;
  unsigned int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  ACCTransportIOAccessoryConfigStream *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  ACCTransportIOAccessoryConfigStream *v60;
  _QWORD block[5];
  ACCTransportIOAccessoryConfigStream *v62;
  uint8_t buf[4];
  _BYTE v64[14];
  __int16 v65;
  _BYTE v66[14];
  __int16 v67;
  void *v68;
  _QWORD v69[9];
  _QWORD v70[9];
  _QWORD v71[2];
  _QWORD v72[4];

  v3 = *(_QWORD *)&a3;
  v72[2] = *MEMORY[0x24BDAC8D0];
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[ACCTransportIOAccessorySharedManager _managerForIOService:shouldCreateNewService:](self, "_managerForIOService:shouldCreateNewService:", v3, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ACCTransportIOAccessoryConfigStream initWithDelegate:andIOService:]([ACCTransportIOAccessoryConfigStream alloc], "initWithDelegate:andIOService:", self, v3);
  if (!v6)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v11 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_49;
    *(_WORD *)buf = 0;
    v13 = "Starting ConfigStream Service that has no associated parent IOAccMgr";
    v14 = v11;
    v15 = OS_LOG_TYPE_DEFAULT;
    v16 = 2;
    goto LABEL_48;
  }
  if (!-[ACCTransportIOAccessorySharedManager _addACCTransportToManager:](self, "_addACCTransportToManager:", v7))
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v11 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v37 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      goto LABEL_49;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v64 = -[ACCTransportIOAccessoryBase ioService](v7, "ioService");
    v13 = "Couldn't find upstream io acc manager service for ConfigStream service %d";
    v14 = v11;
    v15 = OS_LOG_TYPE_INFO;
    v16 = 8;
LABEL_48:
    _os_log_impl(&dword_21722C000, v14, v15, v13, buf, v16);
LABEL_49:

    goto LABEL_64;
  }
  listQ = self->_listQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__ACCTransportIOAccessorySharedManager_IOAccessoryConfigStreamServiceArrived___block_invoke;
  block[3] = &unk_24D71A1D8;
  block[4] = self;
  v9 = v7;
  v62 = v9;
  dispatch_sync(listQ, block);
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v10 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v10 = MEMORY[0x24BDACB70];
    v17 = MEMORY[0x24BDACB70];
  }
  v54 = v7;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_INFO, "Successfully added io accessory ConfigStream to all ports list", buf, 2u);
  }

  objc_msgSend(v6, "connectionUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "createConnectionWithType:andIdentifier:", objc_msgSend(v6, "connectionType"), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSupervisedTransportsRestricted:forConnectionWithUUID:", objc_msgSend(v6, "supervisedTransportsRestricted"), v20);

    objc_msgSend(v6, "setConnectionUUID:", v20);
    v71[0] = *MEMORY[0x24BE1A178];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", (int)objc_msgSend(v6, "primaryPortNumber"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v22;
    v71[1] = *MEMORY[0x24BE1A158];
    objc_msgSend(v6, "digitalID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (!v23)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v72[1] = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)

    -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(v26, "setProperties:forConnectionWithUUID:", v27, v20);

  }
  v69[0] = *MEMORY[0x24BE1A118];
  -[ACCTransportIOAccessoryConfigStream deviceName](v9, "deviceName");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v59;
  v69[1] = *MEMORY[0x24BE1A108];
  -[ACCTransportIOAccessoryConfigStream deviceManufacturer](v9, "deviceManufacturer");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = v58;
  v69[2] = *MEMORY[0x24BE1A110];
  -[ACCTransportIOAccessoryConfigStream deviceModel](v9, "deviceModel");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v70[2] = v57;
  v69[3] = *MEMORY[0x24BE1A138];
  -[ACCTransportIOAccessoryConfigStream deviceSerialNumber](v9, "deviceSerialNumber");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v70[3] = v56;
  v69[4] = *MEMORY[0x24BE1A100];
  -[ACCTransportIOAccessoryConfigStream deviceHardwareVersion](v9, "deviceHardwareVersion");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v70[4] = v55;
  v69[5] = *MEMORY[0x24BE1A0F8];
  -[ACCTransportIOAccessoryConfigStream deviceFirmwareVersion](v9, "deviceFirmwareVersion");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v70[5] = v28;
  v69[6] = *MEMORY[0x24BE1A120];
  v60 = v9;
  -[ACCTransportIOAccessoryConfigStream devicePPID](v9, "devicePPID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (!v29)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v70[6] = v30;
  v69[7] = *MEMORY[0x24BE1A130];
  objc_msgSend(v6, "regionCode");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (!v31)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v70[7] = v32;
  v69[8] = *MEMORY[0x24BE1A0E8];
  objc_msgSend(v6, "inductiveDeviceUID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (!v33)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v70[8] = v34;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v70, v69, 9);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v33)

  if (!v31)
  if (!v29)

  if (gLogObjects && gNumLogObjects >= 2)
  {
    v36 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v36 = MEMORY[0x24BDACB70];
    v38 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    v39 = -[ACCTransportIOAccessoryBase ioService](v60, "ioService");
    objc_msgSend(v6, "connectionUUID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v64 = "-[ACCTransportIOAccessorySharedManager IOAccessoryConfigStreamServiceArrived:]";
    *(_WORD *)&v64[8] = 1024;
    *(_DWORD *)&v64[10] = 3213;
    v65 = 1024;
    *(_DWORD *)v66 = v39;
    *(_WORD *)&v66[4] = 2112;
    *(_QWORD *)&v66[6] = v40;
    v67 = 2112;
    v68 = v35;
    _os_log_impl(&dword_21722C000, v36, OS_LOG_TYPE_INFO, "%s:%d service %d, connectionUUID %@, accInfo %@", buf, 0x2Cu);

  }
  -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectionUUID");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v42, "copy");
  objc_msgSend(v41, "createEndpointWithTransportType:andProtocol:andIdentifier:forConnectionWithUUID:publishConnection:", 12, 11, 0, v43, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogObjects && gNumLogObjects >= 2)
  {
    v45 = *(id *)(gLogObjects + 8);
    v7 = v54;
  }
  else
  {
    v7 = v54;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v45 = MEMORY[0x24BDACB70];
    v46 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    v47 = -[ACCTransportIOAccessoryBase ioService](v60, "ioService");
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v64 = v47;
    *(_WORD *)&v64[4] = 2112;
    *(_QWORD *)&v64[6] = v44;
    v65 = 2112;
    *(_QWORD *)v66 = v35;
    _os_log_impl(&dword_21722C000, v45, OS_LOG_TYPE_INFO, "setAccessoryInfo for ConfigStream service %d, endpointUUID %@, accInfo %@", buf, 0x1Cu);
  }

  -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setAccessoryInfo:forEndpointWithUUID:", v35, v44);

  v49 = (void *)objc_msgSend(v44, "copy");
  -[ACCTransportIOAccessoryConfigStream setEndpointUUID:](v60, "setEndpointUUID:", v49);

  objc_msgSend(v6, "connectionUUID");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCTransportIOAccessoryConfigStream setParentConnectionUUID:](v60, "setParentConnectionUUID:", v50);

  -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectionUUID");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "publishConnectionWithUUID:", v52);

LABEL_64:
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "unlock");

}

uint64_t __78__ACCTransportIOAccessorySharedManager_IOAccessoryConfigStreamServiceArrived___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)IOAccessoryConfigStreamServiceTerminated:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  BOOL v9;
  int v10;
  NSObject *v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  int v22;
  NSObject *v23;
  id v24;
  NSObject *listQ;
  uint64_t v26;
  void *v27;
  void *v28;
  BOOL v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  ACCTransportIOAccessorySharedManager *v40;
  id v41;
  uint8_t buf[4];
  _DWORD v43[7];

  v3 = *(_QWORD *)&a3;
  *(_QWORD *)&v43[5] = *MEMORY[0x24BDAC8D0];
  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[ACCTransportIOAccessorySharedManager _basePortForService:](self, "_basePortForService:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ACCTransportIOAccessorySharedManager _managerForBase:](self, "_managerForBase:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (gLogObjects)
      v9 = gNumLogObjects <= 1;
    else
      v9 = 1;
    v10 = !v9;
    if (v7)
    {
      if (v10)
      {
        v11 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v11 = MEMORY[0x24BDACB70];
        v15 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109376;
        v43[0] = -[NSObject ioService](v8, "ioService");
        LOWORD(v43[1]) = 1024;
        *(_DWORD *)((char *)&v43[1] + 2) = v3;
        _os_log_impl(&dword_21722C000, v11, OS_LOG_TYPE_INFO, "ConfigStream Terminated: found manager with service %d for terminated service %d", buf, 0xEu);
      }

      -[NSObject removeIOAccessoryChildPort:](v8, "removeIOAccessoryChildPort:", v6);
    }
    else
    {
      if (v10)
      {
        v14 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v14 = MEMORY[0x24BDACB70];
        v16 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v43[0] = v3;
        _os_log_impl(&dword_21722C000, v14, OS_LOG_TYPE_INFO, "Didn't find manager for removed auth CP service %d", buf, 8u);
      }

    }
    objc_msgSend(v6, "endpointUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");

    if (gLogObjects && gNumLogObjects >= 2)
    {
      v19 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v19 = MEMORY[0x24BDACB70];
      v20 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v43 = v18;
      _os_log_impl(&dword_21722C000, v19, OS_LOG_TYPE_DEFAULT, "Remove ConfigStream Service endpointUUID %@", buf, 0xCu);
    }

    if (v18)
    {
      -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "destroyEndpointWithUUID:", v18);

      if (v22)
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v23 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v23 = MEMORY[0x24BDACB70];
          v24 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v43 = v18;
          _os_log_impl(&dword_21722C000, v23, OS_LOG_TYPE_DEFAULT, "Removed ConfigStream service endpoint %@", buf, 0xCu);
        }

        objc_msgSend(v6, "setEndpointUUID:", 0);
        objc_msgSend(v6, "setParentConnectionUUID:", 0);
      }
    }
    listQ = self->_listQ;
    v36 = MEMORY[0x24BDAC760];
    v37 = 3221225472;
    v38 = __81__ACCTransportIOAccessorySharedManager_IOAccessoryConfigStreamServiceTerminated___block_invoke;
    v39 = &unk_24D71A1D8;
    v40 = self;
    v41 = v6;
    dispatch_sync(listQ, &v36);
    -[NSObject connectionUUID](v8, "connectionUUID", v36, v37, v38, v39, v40);
    v26 = objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v27 = (void *)v26;
      -[NSObject connectionUUID](v8, "connectionUUID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[ACCTransportIOAccessorySharedManager _managerForConnectionUUIDHasActiveEndpoint:](self, "_managerForConnectionUUIDHasActiveEndpoint:", v28);

      if (!v29)
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v30 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v30 = MEMORY[0x24BDACB70];
          v31 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject connectionUUID](v8, "connectionUUID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v43 = v32;
          _os_log_impl(&dword_21722C000, v30, OS_LOG_TYPE_DEFAULT, "No active endpoint for ConfigStream Service connection, remove connectionUUID %@", buf, 0xCu);

        }
        -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject connectionUUID](v8, "connectionUUID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "destroyConnectionWithUUID:", v34);

        -[NSObject setConnectionUUID:](v8, "setConnectionUUID:", 0);
        -[ACCTransportIOAccessorySharedManager _clearChildPortEndpointsForManagerDisconnection:](self, "_clearChildPortEndpointsForManagerDisconnection:", v8);
      }
    }

  }
  else
  {
    if (gLogObjects)
      v12 = gNumLogObjects < 2;
    else
      v12 = 1;
    if (v12)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    else
    {
      v8 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v43[0] = v3;
      _os_log_impl(&dword_21722C000, v8, OS_LOG_TYPE_INFO, "Didn't find base accessory object for removed ConfigStream service %d", buf, 8u);
    }
  }

  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "unlock");

}

uint64_t __81__ACCTransportIOAccessorySharedManager_IOAccessoryConfigStreamServiceTerminated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)IOAccessoryConfigStreamUpdateAccesssoryInfo:(id)a3
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
  NSObject *v14;
  id v15;
  void *v16;
  _DWORD v17[2];
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  _QWORD v22[7];
  _QWORD v23[9];

  v23[7] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22[0] = *MEMORY[0x24BE1A118];
  objc_msgSend(v4, "deviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v5;
  v22[1] = *MEMORY[0x24BE1A108];
  objc_msgSend(v4, "deviceManufacturer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v6;
  v22[2] = *MEMORY[0x24BE1A110];
  objc_msgSend(v4, "deviceModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v7;
  v22[3] = *MEMORY[0x24BE1A138];
  objc_msgSend(v4, "deviceSerialNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v8;
  v22[4] = *MEMORY[0x24BE1A100];
  objc_msgSend(v4, "deviceHardwareVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v9;
  v22[5] = *MEMORY[0x24BE1A0F8];
  objc_msgSend(v4, "deviceFirmwareVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v10;
  v22[6] = *MEMORY[0x24BE1A120];
  objc_msgSend(v4, "devicePPID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "endpointUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v14 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v14 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v17[0] = 67109634;
    v17[1] = objc_msgSend(v4, "ioService");
    v18 = 2112;
    v19 = v13;
    v20 = 2112;
    v21 = v12;
    _os_log_impl(&dword_21722C000, v14, OS_LOG_TYPE_INFO, "setAccessoryInfo for ConfigStream service %d, endpointUUID %@, accInfo %@", (uint8_t *)v17, 0x1Cu);
  }

  -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAccessoryInfo:forEndpointWithUUID:", v12, v13);

}

- (void)IOAccessoryConfigStreamMessageArrived:(id)a3 endpointUUID:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  os_signpost_id_t v12;
  uint64_t v13;
  os_signpost_id_t v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  int v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  int v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogSignpostObjects)
    v8 = gNumLogSignpostObjects < 4;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:].cold.2();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)(gLogSignpostObjects + 24);
  }
  v11 = objc_msgSend(v7, "hash");
  if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v12 = v11;
    if (os_signpost_enabled(v10))
    {
      v25 = 138412546;
      v26 = (const char *)v7;
      v27 = 2048;
      v28 = objc_msgSend(v6, "length");
      _os_signpost_emit_with_name_impl(&dword_21722C000, v10, OS_SIGNPOST_EVENT, v12, "Endpoint RECV", "Received incoming ConfigStream data! %@, %lu bytes", (uint8_t *)&v25, 0x16u);
    }
  }

  v13 = objc_msgSend(v7, "hash");
  v14 = objc_msgSend(v6, "hash") ^ v13;
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v15 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:].cold.2();
    v15 = MEMORY[0x24BDACB70];
    v16 = MEMORY[0x24BDACB70];
  }
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    v17 = objc_msgSend(v6, "length");
    v25 = 138412546;
    v26 = (const char *)v7;
    v27 = 2048;
    v28 = v17;
    _os_signpost_emit_with_name_impl(&dword_21722C000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v14, "Endpoint RECV", "Received incoming ConfigStream data! %@, %lu bytes", (uint8_t *)&v25, 0x16u);
  }

  -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = "ERROR";
  if (v18)
  {
    -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "processIncomingData:forEndpointWithUUID:", v6, v7);

    if (v21)
      v19 = "SUCCESS";
  }
  if (gLogSignpostObjects && gNumLogSignpostObjects >= 4)
  {
    v22 = *(id *)(gLogSignpostObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessorySharedManager transmitData:forEndpointUUID:].cold.2();
    v22 = MEMORY[0x24BDACB70];
    v23 = MEMORY[0x24BDACB70];
  }
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    v24 = objc_msgSend(v6, "length");
    v25 = 136315650;
    v26 = v19;
    v27 = 2112;
    v28 = (uint64_t)v7;
    v29 = 2048;
    v30 = v24;
    _os_signpost_emit_with_name_impl(&dword_21722C000, v22, OS_SIGNPOST_INTERVAL_END, v14, "Endpoint RECV", "%s handling Received incoming ConfigStream data! %@, %lu bytes", (uint8_t *)&v25, 0x20u);
  }

}

- (void)lockAccessoryPorts
{
  id v2;

  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lock");

}

- (void)unlockAccessoryPorts
{
  id v2;

  -[ACCTransportIOAccessorySharedManager accessoryPortLock](self, "accessoryPortLock");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unlock");

}

- (void)resetLightningBusForEndpointWithUUID:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  io_object_t ManagerPrimaryPort;
  NSObject *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  io_object_t ServiceWithPort;
  io_object_t v25;
  NSObject *v26;
  id v27;
  unsigned int v28;
  NSObject *v29;
  id v30;
  int v31;
  mach_error_t USBConnectType;
  NSObject *v33;
  id v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  id v38;
  mach_error_t v39;
  mach_error_t v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  id v44;
  mach_error_t v45;
  mach_error_t v46;
  NSObject *v47;
  id v48;
  mach_error_t v49;
  NSObject *v50;
  id v51;
  NSObject *v52;
  id v53;
  NSObject *v54;
  id v55;
  NSObject *v56;
  id v57;
  mach_error_t v58;
  mach_error_t v59;
  NSObject *v60;
  id v61;
  id v62;
  mach_error_t v63;
  NSObject *v64;
  io_connect_t connect;
  uint8_t buf[4];
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  connect = 0;
  if (gLogObjects)
    v5 = gNumLogObjects < 2;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v67 = v4;
    _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_DEFAULT, "Resetting lightning bus for endpoint %@...", buf, 0xCu);
  }

  -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_15;
  -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "connectionUUIDForEndpointWithUUID:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "connectionTypeForConnectionWithUUID:", v11);

  if (v12 != 1)
  {
LABEL_15:
    logObjectForModule_0(1);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessorySharedManager resetLightningBusForEndpointWithUUID:].cold.1();
    ManagerPrimaryPort = 0;
    goto LABEL_172;
  }
  -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[ACCTransportIOAccessorySharedManager delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "transportTypeForEndpointWithUUID:", v4);

  }
  else
  {
    v15 = 17;
  }
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v18 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v18 = MEMORY[0x24BDACB70];
    v19 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[ACCTransportIOAccessorySharedManager resetLightningBusForEndpointWithUUID:].cold.23(v15, v18, v20);

  -[ACCTransportIOAccessorySharedManager _managerForBaseEndpointUUID:](self, "_managerForBaseEndpointUUID:", v4);
  v21 = objc_claimAutoreleasedReturnValue();
  v16 = v21;
  if (v21)
  {
    if (-[NSObject ioService](v21, "ioService"))
    {
      ManagerPrimaryPort = -[NSObject ioService](v16, "ioService");
      IOObjectRetain(ManagerPrimaryPort);
      if (!ManagerPrimaryPort)
        goto LABEL_163;
      goto LABEL_52;
    }
LABEL_43:
    ManagerPrimaryPort = 0;
    goto LABEL_163;
  }
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v22 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v22 = MEMORY[0x24BDACB70];
    v23 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21722C000, v22, OS_LOG_TYPE_DEFAULT, "Could not find endpoint, falling back to most downstream port...", buf, 2u);
  }

  ServiceWithPort = IOAccessoryPortGetServiceWithPort();
  if (!ServiceWithPort)
    goto LABEL_43;
  v25 = ServiceWithPort;
  ManagerPrimaryPort = IOAccessoryPortGetManagerPrimaryPort();
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v26 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v26 = MEMORY[0x24BDACB70];
    v27 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v67) = ManagerPrimaryPort;
    _os_log_impl(&dword_21722C000, v26, OS_LOG_TYPE_INFO, "primaryPortNumber: %d", buf, 8u);
  }

  if (ManagerPrimaryPort)
    ManagerPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort();
  IOObjectRelease(v25);
  if (!ManagerPrimaryPort)
    goto LABEL_163;
LABEL_52:
  if (!IOServiceOpen(ManagerPrimaryPort, *MEMORY[0x24BDAEC58], 0, &connect))
  {
    v28 = v15 & 0xFFFFFFF7;
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v29 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v29 = MEMORY[0x24BDACB70];
      v30 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v67) = 1250;
      _os_log_impl(&dword_21722C000, v29, OS_LOG_TYPE_DEFAULT, "Toggling lightning bus for %dms...", buf, 8u);
    }

    if (v28)
      goto LABEL_62;
    USBConnectType = IOAccessoryManagerGetUSBConnectType();
    if (USBConnectType)
    {
      v63 = USBConnectType;
      logObjectForModule_0(1);
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessorySharedManager resetLightningBusForEndpointWithUUID:].cold.19(v63);

      goto LABEL_172;
    }
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v33 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v33 = MEMORY[0x24BDACB70];
      v34 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v67) = -1;
      _os_log_impl(&dword_21722C000, v33, OS_LOG_TYPE_INFO, "Current USB Connection Type: %d", buf, 8u);
    }

    if (gLogObjects && gNumLogObjects >= 2)
    {
      v35 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v35 = MEMORY[0x24BDACB70];
      v36 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v67) = 0;
      _os_log_impl(&dword_21722C000, v35, OS_LOG_TYPE_INFO, "Current USB Connection Active: %d", buf, 8u);
    }

    if (gLogObjects && gNumLogObjects >= 2)
    {
      v37 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v37 = MEMORY[0x24BDACB70];
      v38 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21722C000, v37, OS_LOG_TYPE_INFO, "Disabling USB...", buf, 2u);
    }

    v39 = IOAccessoryManagerConfigureUSBMode();
    if (!v39)
    {
LABEL_62:
      v31 = 1;
    }
    else
    {
      v40 = v39;
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v41 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v41 = MEMORY[0x24BDACB70];
        v42 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessorySharedManager resetLightningBusForEndpointWithUUID:].cold.7(v40);

      v31 = 0;
    }
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v43 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v43 = MEMORY[0x24BDACB70];
      v44 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21722C000, v43, OS_LOG_TYPE_DEFAULT, "Disabling accessory power...", buf, 2u);
    }

    v45 = IOAccessoryManagerConfigurePower();
    if (v45)
    {
      v46 = v45;
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v47 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v47 = MEMORY[0x24BDACB70];
        v48 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessorySharedManager resetLightningBusForEndpointWithUUID:].cold.11(v46);

      v31 = 0;
    }
    usleep(0x1312D0u);
    if (!v28)
    {
      v49 = IOAccessoryManagerConfigureUSBMode();
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v50 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v50 = MEMORY[0x24BDACB70];
        v51 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21722C000, v50, OS_LOG_TYPE_INFO, "Enabling USB...", buf, 2u);
      }

      if (gLogObjects && gNumLogObjects >= 2)
      {
        v52 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v52 = MEMORY[0x24BDACB70];
        v53 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v67) = 4;
        _os_log_impl(&dword_21722C000, v52, OS_LOG_TYPE_INFO, "USB mode: %d", buf, 8u);
      }

      if (v49)
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v54 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v54 = MEMORY[0x24BDACB70];
          v55 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessorySharedManager resetLightningBusForEndpointWithUUID:].cold.7(v49);

        v31 = 0;
      }
    }
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v56 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v56 = MEMORY[0x24BDACB70];
      v57 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21722C000, v56, OS_LOG_TYPE_DEFAULT, "Enabling accessory power...", buf, 2u);
    }

    v58 = IOAccessoryManagerConfigurePower();
    if (!v58)
    {

      if (v31)
        goto LABEL_173;
      goto LABEL_164;
    }
    v59 = v58;
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v60 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v60 = MEMORY[0x24BDACB70];
      v61 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessorySharedManager resetLightningBusForEndpointWithUUID:].cold.4(v59);

  }
LABEL_163:

LABEL_164:
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v16 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v16 = MEMORY[0x24BDACB70];
    v62 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[ACCTransportIOAccessorySharedManager resetLightningBusForEndpointWithUUID:].cold.2();
LABEL_172:

LABEL_173:
  if (connect)
    IOServiceClose(connect);
  if (ManagerPrimaryPort)
    IOObjectRelease(ManagerPrimaryPort);

}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__ACCTransportIOAccessorySharedManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once != -1)
    dispatch_once(&sharedManager_once, block);
  return (id)sharedManager_sharedInstance;
}

void __53__ACCTransportIOAccessorySharedManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedInstance;
  sharedManager_sharedInstance = (uint64_t)v1;

}

+ (id)IOAccessoryClassStringForIOAccessoryClassType:(int)a3
{
  void *v4;
  const char *v5;
  BOOL v6;
  id v7;
  void *v8;
  NSObject *v10;

  switch(a3)
  {
    case 0:
      v4 = (void *)MEMORY[0x24BDD17C8];
      v5 = "IOAccessoryManager";
      goto LABEL_16;
    case 1:
      v4 = (void *)MEMORY[0x24BDD17C8];
      v5 = "IOAccessoryPort";
      goto LABEL_16;
    case 2:
      v4 = (void *)MEMORY[0x24BDD17C8];
      v5 = "IOAccessoryEAInterface";
      goto LABEL_16;
    case 3:
      v4 = (void *)MEMORY[0x24BDD17C8];
      v5 = "AppleAuthCP";
      goto LABEL_16;
    case 4:
      v4 = (void *)MEMORY[0x24BDD17C8];
      v5 = "IOAccessoryOOBPairingInterface";
      goto LABEL_16;
    case 6:
      v4 = (void *)MEMORY[0x24BDD17C8];
      v5 = "IOAccessoryConfigStreamInterface";
LABEL_16:
      objc_msgSend(v4, "stringWithUTF8String:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      if (gLogObjects)
        v6 = gNumLogObjects < 1;
      else
        v6 = 1;
      if (v6)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v10 = MEMORY[0x24BDACB70];
        v7 = MEMORY[0x24BDACB70];
      }
      else
      {
        v10 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[ACCTransportIOAccessorySharedManager IOAccessoryClassStringForIOAccessoryClassType:].cold.1(a3, v10);

      v8 = 0;
      break;
  }
  return v8;
}

+ (int)IOAccessoryClassTypeForIOAccessoryClassString:(id)a3
{
  id v3;
  void *v4;
  char v5;
  int v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  NSObject *v16;
  id v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "IOAccessoryManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "IOAccessoryPort");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "isEqualToString:", v7);

    if ((v8 & 1) != 0)
    {
      v6 = 1;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "IOAccessoryEAInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v3, "isEqualToString:", v9);

    if ((v10 & 1) != 0)
    {
      v6 = 2;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AppleAuthCP");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v3, "isEqualToString:", v11);

    if ((v12 & 1) != 0)
    {
      v6 = 3;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "IOAccessoryConfigStreamInterface");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v3, "isEqualToString:", v13);

    if ((v14 & 1) != 0)
    {
      v6 = 6;
      goto LABEL_11;
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v16 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v16 = MEMORY[0x24BDACB70];
      v17 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v18 = 138412290;
      v19 = v3;
      _os_log_impl(&dword_21722C000, v16, OS_LOG_TYPE_INFO, "Unknown classString %@", (uint8_t *)&v18, 0xCu);
    }

  }
  v6 = 0;
LABEL_11:

  return v6;
}

- (ACCTransportPluginIOAccessoryManager)delegate
{
  return (ACCTransportPluginIOAccessoryManager *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isB139OrB164Connected
{
  return self->_isB139OrB164Connected;
}

- (OS_dispatch_queue)listQ
{
  return self->_listQ;
}

- (void)setListQ:(id)a3
{
  objc_storeStrong((id *)&self->_listQ, a3);
}

- (NSMutableSet)allIOAccessories
{
  return self->_allIOAccessories;
}

- (void)setAllIOAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_allIOAccessories, a3);
}

- (NSMutableSet)allIOAccessoryManagers
{
  return self->_allIOAccessoryManagers;
}

- (void)setAllIOAccessoryManagers:(id)a3
{
  objc_storeStrong((id *)&self->_allIOAccessoryManagers, a3);
}

- (NSMutableSet)rootIOAccessoryManagers
{
  return self->_rootIOAccessoryManagers;
}

- (void)setRootIOAccessoryManagers:(id)a3
{
  objc_storeStrong((id *)&self->_rootIOAccessoryManagers, a3);
}

- (ACCTransportIOAccessoryListener)ioAccessoryListener
{
  return self->_ioAccessoryListener;
}

- (void)setIoAccessoryListener:(id)a3
{
  objc_storeStrong((id *)&self->_ioAccessoryListener, a3);
}

- (ACCTransportIOAccessoryManager)rootE75Manager
{
  return self->_rootE75Manager;
}

- (ACCTransportIOAccessoryManager)rootOrionManager
{
  return self->_rootOrionManager;
}

- (NSRecursiveLock)accessoryPortLock
{
  return self->_accessoryPortLock;
}

- (void)setAccessoryPortLock:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryPortLock, a3);
}

- (ACCSettingsState)enableDirectAWCAuth
{
  return self->_enableDirectAWCAuth;
}

- (void)setEnableDirectAWCAuth:(id)a3
{
  objc_storeStrong((id *)&self->_enableDirectAWCAuth, a3);
}

- (BOOL)bIsWatch
{
  return self->_bIsWatch;
}

- (NSMutableArray)deferAuthCPServiceArray
{
  return self->_deferAuthCPServiceArray;
}

- (void)setDeferAuthCPServiceArray:(id)a3
{
  objc_storeStrong((id *)&self->_deferAuthCPServiceArray, a3);
}

- (NSMutableArray)deferEAServiceArray
{
  return self->_deferEAServiceArray;
}

- (void)setDeferEAServiceArray:(id)a3
{
  objc_storeStrong((id *)&self->_deferEAServiceArray, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferEAServiceArray, 0);
  objc_storeStrong((id *)&self->_deferAuthCPServiceArray, 0);
  objc_storeStrong((id *)&self->_enableDirectAWCAuth, 0);
  objc_storeStrong((id *)&self->_accessoryPortLock, 0);
  objc_storeStrong((id *)&self->_rootOrionManager, 0);
  objc_storeStrong((id *)&self->_rootE75Manager, 0);
  objc_storeStrong((id *)&self->_ioAccessoryListener, 0);
  objc_storeStrong((id *)&self->_rootIOAccessoryManagers, 0);
  objc_storeStrong((id *)&self->_allIOAccessoryManagers, 0);
  objc_storeStrong((id *)&self->_allIOAccessories, 0);
  objc_storeStrong((id *)&self->_listQ, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __66__ACCTransportIOAccessorySharedManager_startIOACCTransportManager__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 1250;
  OUTLINED_FUNCTION_15_0(&dword_21722C000, a1, a3, "about to call startListeningBlock block after delay of %d Ms", (uint8_t *)v3);
  OUTLINED_FUNCTION_9();
}

void __56__ACCTransportIOAccessorySharedManager__managerForBase___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_5_1(&dword_21722C000, v0, v1, "_managerForBase found IOAccMgr class instance for base port", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __56__ACCTransportIOAccessorySharedManager__managerForBase___block_invoke_2_cold_3(void *a1, uint64_t a2)
{
  void *v3;
  os_log_t v4;
  os_log_type_t v5;
  const char *v6;
  uint8_t *v7;

  objc_msgSend(a1, "ioService");
  objc_msgSend(*(id *)(a2 + 32), "upstreamManagerService");
  OUTLINED_FUNCTION_19();
  _os_log_debug_impl(v3, v4, v5, v6, v7, 0xEu);
  OUTLINED_FUNCTION_3();
}

void __63__ACCTransportIOAccessorySharedManager__managerContainingBase___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_5_1(&dword_21722C000, v0, v1, "found IOAccMgr class instance for base port by checking the child port list", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __84__ACCTransportIOAccessorySharedManager__managerForIOService_shouldCreateNewService___block_invoke_cold_1(int *a1, NSObject *a2, uint64_t a3)
{
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4[0] = 67109120;
  v4[1] = v3;
  OUTLINED_FUNCTION_15_0(&dword_21722C000, a2, a3, "ACCTransportIOAccessoryManager already exists for service %d, or there is no upstream manager service", (uint8_t *)v4);
  OUTLINED_FUNCTION_9();
}

- (void)_addIOAccessoryManagerWithIOService:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_5_1(&dword_21722C000, v0, v1, "Adding root Orion manager", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_addIOAccessoryManagerWithIOService:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_5_1(&dword_21722C000, v0, v1, "Adding root E75 manager", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_managerForBaseEndpointUUID:(void *)a1 .cold.3(void *a1)
{
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;
  void *v7;

  objc_msgSend(a1, "ioService");
  objc_msgSend(a1, "connectionUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x1Cu);

}

- (void)_managerForConnectionUUID:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_12_0(&dword_21722C000, v0, v1, "IOAccessoryPortGetServiceWithPort for kIOAccessoryPortIDUSB failed!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_managerForConnectionUUID:(uint64_t)a3 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = 0;
  OUTLINED_FUNCTION_6_0(&dword_21722C000, a1, a3, "no connectionUUID %@ to find manager for", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void __66__ACCTransportIOAccessorySharedManager__managerForConnectionUUID___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_6_0(&dword_21722C000, a2, a3, "found IOAccMgr class instance for connectionUUID %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

void __66__ACCTransportIOAccessorySharedManager__managerForConnectionUUID___block_invoke_2_cold_3(void *a1)
{
  void *v1;
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  objc_msgSend(a1, "connectionUUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_19();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x16u);

  OUTLINED_FUNCTION_3();
}

- (void)transmitData:forEndpointUUID:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3(&dword_21722C000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging_signposts() / init_logging()!\n module %d, gLogSignpostObjects: %p, gNumLogSignpostObjects: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)transmitData:forEndpointUUID:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_16_0();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_21722C000, v1, OS_LOG_TYPE_DEBUG, "Sending outgoing data %@ for endpointUUID %@", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)shouldEnableDirectAWCAuth
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  objc_msgSend(*(id *)(a1 + 88), "BOOLValue");
  OUTLINED_FUNCTION_19();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 8u);
  OUTLINED_FUNCTION_2();
}

- (void)setUSBMode:forConnectionUUID:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_9_0(&dword_21722C000, v0, v1, "usbMode %d for connectionUUID %@");
  OUTLINED_FUNCTION_2();
}

- (void)setUSBMode:forConnectionUUID:.cold.4()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_2_0(&dword_21722C000, v0, (uint64_t)v0, "Error setting USB mode type %d for connectionUUID %@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)setUSBMode:forEndpointUUID:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_9_0(&dword_21722C000, v0, v1, "usbMode %d for endpointUUID %@");
  OUTLINED_FUNCTION_2();
}

- (void)setUSBMode:forEndpointUUID:.cold.4()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_2_0(&dword_21722C000, v0, (uint64_t)v0, "Error setting USB mode type %d for endpointUUID %@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)IOAccessoryManagerServiceInfoSet:(NSObject *)a3 .cold.2(uint64_t a1, int a2, NSObject *a3)
{
  *(_DWORD *)a1 = 67109120;
  *(_DWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_15_0(&dword_21722C000, a3, (uint64_t)a3, "IOAccessoryManager with service %d has EAService, OOBPairing child ports. Those handlers publish the eACCEndpoint_Protocol_InternalInfo endpoint", (uint8_t *)a1);
}

- (void)IOAccessoryPortArrived:(void *)a1 withEndpointProtocol:publish:.cold.5(void *a1)
{
  void *v1;
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  objc_msgSend(a1, "connectionUUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_19();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0xCu);

  OUTLINED_FUNCTION_6_1();
}

- (void)_IOAccessoryPortDetachInternal:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_8_1(&dword_21722C000, v0, v1, "Error, IOAccessoryPort endpointUUID %@ unable to detach", v2);
  OUTLINED_FUNCTION_2();
}

- (void)IOAccessoryAuthCPServiceAuthStatusChanged:authType:authCert:certType:authCTA:service:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_12_0(&dword_21722C000, v0, v1, "IOAccMgr setFeaturesFromAuthStatus: failed!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)IOAccessoryAuthCPServiceAuthStatusChanged:authType:authCert:certType:authCTA:service:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_12_0(&dword_21722C000, v0, v1, "Delegate setAuthenticationStatus: failed!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)IOAccessoryAuthCPServiceAuthStatusChanged:(void *)a1 authType:authCert:certType:authCTA:service:.cold.7(void *a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;
  void *v6;

  objc_msgSend(a1, "connectionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x12u);

  OUTLINED_FUNCTION_3();
}

- (void)resetLightningBusForEndpointWithUUID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_12_0(&dword_21722C000, v0, v1, "Cannot reset lightning bus for non-lightning connection!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)resetLightningBusForEndpointWithUUID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_8_1(&dword_21722C000, v0, v1, "Could not reset lighting port associated with endpoint %@!", v2);
  OUTLINED_FUNCTION_2();
}

- (void)resetLightningBusForEndpointWithUUID:(mach_error_t)a1 .cold.4(mach_error_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_19_0(a1);
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_7_1(&dword_21722C000, v1, v2, "Could not enable ACC power: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_6_1();
}

- (void)resetLightningBusForEndpointWithUUID:(mach_error_t)a1 .cold.7(mach_error_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_19_0(a1);
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_7_1(&dword_21722C000, v1, v2, "Could not configure USB mode: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_6_1();
}

- (void)resetLightningBusForEndpointWithUUID:(mach_error_t)a1 .cold.11(mach_error_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_19_0(a1);
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_7_1(&dword_21722C000, v1, v2, "Could not disable ACC power: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_6_1();
}

- (void)resetLightningBusForEndpointWithUUID:(mach_error_t)a1 .cold.19(mach_error_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_19_0(a1);
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_7_1(&dword_21722C000, v1, v2, "Could not get USB Connect Type! (ret: %s)", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_6_1();
}

- (void)resetLightningBusForEndpointWithUUID:(uint64_t)a3 .cold.23(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = a1;
  OUTLINED_FUNCTION_15_0(&dword_21722C000, a2, a3, "transportType: %{coreacc:ACCEndpoint_TransportType_t}d", (uint8_t *)v3);
  OUTLINED_FUNCTION_9();
}

+ (void)IOAccessoryClassStringForIOAccessoryClassType:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21722C000, a2, OS_LOG_TYPE_ERROR, "Unknown classType %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_9();
}

@end
