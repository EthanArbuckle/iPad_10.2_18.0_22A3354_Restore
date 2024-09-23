@implementation WFBluetoothSettingsClient

- (WFBluetoothSettingsClient)initWithBluetoothManager:(id)a3
{
  id v5;
  WFBluetoothSettingsClient *v6;
  WFBluetoothSettingsClient *v7;
  uint64_t v8;
  NSMutableDictionary *observeBlocksPerDeviceType;
  WFBluetoothSettingsClient *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFBluetoothSettingsClient;
  v6 = -[WFBluetoothSettingsClient init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_manager, a3);
    v8 = objc_opt_new();
    observeBlocksPerDeviceType = v7->_observeBlocksPerDeviceType;
    v7->_observeBlocksPerDeviceType = (NSMutableDictionary *)v8;

    -[WFBluetoothSettingsClient registerForNotifications](v7, "registerForNotifications");
    v10 = v7;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getBluetoothAvailabilityChangedNotification();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  getBluetoothDeviceUpdatedNotification();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, v6, 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  getBluetoothDeviceRemovedNotification();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, v8, 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  getBluetoothDeviceChangedNotification();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:name:object:", self, v10, 0);

  v11.receiver = self;
  v11.super_class = (Class)WFBluetoothSettingsClient;
  -[WFBluetoothSettingsClient dealloc](&v11, sel_dealloc);
}

- (void)waitForAvailabilityWithCompletionHandler:(id)a3
{
  BluetoothManager *manager;
  void (**availabilityCompletion)(_QWORD);
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  BluetoothManager *v9;
  BluetoothManager *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  BluetoothManager *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  manager = self->_manager;
  availabilityCompletion = (void (**)(_QWORD))a3;
  v6 = -[BluetoothManager available](manager, "available");
  getWFBundledIntentsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      v9 = self->_manager;
      v12 = 136315394;
      v13 = "-[WFBluetoothSettingsClient waitForAvailabilityWithCompletionHandler:]";
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_DEBUG, "%s BluetoothManager is available: %@", (uint8_t *)&v12, 0x16u);
    }

    availabilityCompletion[2](availabilityCompletion);
  }
  else
  {
    if (v8)
    {
      v10 = self->_manager;
      v12 = 136315394;
      v13 = "-[WFBluetoothSettingsClient waitForAvailabilityWithCompletionHandler:]";
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_DEBUG, "%s Waiting for BluetoothManager to become available: %@", (uint8_t *)&v12, 0x16u);
    }

    v11 = (void *)objc_msgSend(availabilityCompletion, "copy");
    availabilityCompletion = (void (**)(_QWORD))self->_availabilityCompletion;
    self->_availabilityCompletion = v11;
  }

}

- (void)getPairedDevicesMatchingType:(unint64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  unint64_t v10;

  v6 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__WFBluetoothSettingsClient_getPairedDevicesMatchingType_completion___block_invoke;
  block[3] = &unk_24F8B8D30;
  block[4] = self;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)observePairedDevicesMatchingType:(unint64_t)a3 update:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  -[WFBluetoothSettingsClient observeBlocksPerDeviceType](self, "observeBlocksPerDeviceType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    -[WFBluetoothSettingsClient observeBlocksPerDeviceType](self, "observeBlocksPerDeviceType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_opt_new();
    objc_msgSend(v9, "setObject:forKeyedSubscript:");

  }
  v11 = (void *)objc_msgSend(v6, "copy");
  v12 = _Block_copy(v11);
  objc_msgSend(v13, "addObject:", v12);

  -[WFBluetoothSettingsClient getPairedDevicesMatchingType:completion:](self, "getPairedDevicesMatchingType:completion:", a3, v6);
}

- (void)devicesChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__WFBluetoothSettingsClient_devicesChanged___block_invoke;
  block[3] = &unk_24F8BB638;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)availabilityChanged:(id)a3
{
  id v4;
  NSObject *v5;
  BluetoothManager *manager;
  id availabilityCompletion;
  int v8;
  const char *v9;
  __int16 v10;
  BluetoothManager *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_availabilityCompletion && -[BluetoothManager available](self->_manager, "available"))
  {
    getWFBundledIntentsLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      manager = self->_manager;
      v8 = 136315394;
      v9 = "-[WFBluetoothSettingsClient availabilityChanged:]";
      v10 = 2112;
      v11 = manager;
      _os_log_impl(&dword_22D353000, v5, OS_LOG_TYPE_DEBUG, "%s BluetoothManager has become available: %@", (uint8_t *)&v8, 0x16u);
    }

    (*((void (**)(void))self->_availabilityCompletion + 2))();
    availabilityCompletion = self->_availabilityCompletion;
    self->_availabilityCompletion = 0;

  }
}

- (void)registerForNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getBluetoothAvailabilityChangedNotification();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_availabilityChanged_, v4, 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  getBluetoothDeviceUpdatedNotification();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_devicesChanged_, v6, 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  getBluetoothDeviceRemovedNotification();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_devicesChanged_, v8, 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  getBluetoothDeviceChangedNotification();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_devicesChanged_, v9, 0);

}

- (void)getStateWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__WFBluetoothSettingsClient_getStateWithCompletionHandler___block_invoke;
  v6[3] = &unk_24F8BB5E0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__WFBluetoothSettingsClient_setState_completionHandler___block_invoke;
  block[3] = &unk_24F8B8F98;
  v10 = a3;
  block[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (BluetoothManager)manager
{
  return self->_manager;
}

- (id)availabilityCompletion
{
  return self->_availabilityCompletion;
}

- (void)setAvailabilityCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableDictionary)observeBlocksPerDeviceType
{
  return self->_observeBlocksPerDeviceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observeBlocksPerDeviceType, 0);
  objc_storeStrong(&self->_availabilityCompletion, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

uint64_t __56__WFBluetoothSettingsClient_setState_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", *(unsigned __int8 *)(a1 + 48));

  getWFBundledIntentsLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(unsigned __int8 *)(a1 + 48);
    v6 = 136315394;
    v7 = "-[WFBluetoothSettingsClient setState:completionHandler:]_block_invoke";
    v8 = 1024;
    v9 = v4;
    _os_log_impl(&dword_22D353000, v3, OS_LOG_TYPE_INFO, "%s Set Bluetooth state to %d", (uint8_t *)&v6, 0x12u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __59__WFBluetoothSettingsClient_getStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enabled");

  getWFBundledIntentsLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[WFBluetoothSettingsClient getStateWithCompletionHandler:]_block_invoke";
    v8 = 1024;
    v9 = v3;
    _os_log_impl(&dword_22D353000, v4, OS_LOG_TYPE_INFO, "%s Retrieved Bluetooth state: %d", (uint8_t *)&v6, 0x12u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __44__WFBluetoothSettingsClient_devicesChanged___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  id obj;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint8_t v36[128];
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v1 = a1;
  v41 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "available");

  if (v3)
  {
    objc_msgSend(*(id *)(v1 + 32), "manager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pairedDevices");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = (void *)MEMORY[0x24BDBD1A8];
    if (v5)
      v7 = (void *)v5;
    v8 = v7;

    getWFBundledIntentsLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[WFBluetoothSettingsClient devicesChanged:]_block_invoke";
      v39 = 2112;
      v40 = v8;
      _os_log_impl(&dword_22D353000, v9, OS_LOG_TYPE_INFO, "%s BluetoothManager has updated device list: %@", buf, 0x16u);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(*(id *)(v1 + 32), "observeBlocksPerDeviceType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "keyEnumerator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v11;
    v26 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v26)
    {
      v25 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v32 != v25)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "integerValue");
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v15 = v1;
          objc_msgSend(*(id *)(v1 + 32), "observeBlocksPerDeviceType");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v28;
            do
            {
              for (j = 0; j != v19; ++j)
              {
                if (*(_QWORD *)v28 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
                WFBluetoothDeviceFilterDevicesMatchingType(v8, v14);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v23);

              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            }
            while (v19);
          }

          v1 = v15;
        }
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v26);
    }

  }
}

void __69__WFBluetoothSettingsClient_getPairedDevicesMatchingType_completion___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "available");

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "manager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pairedDevices");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = (void *)MEMORY[0x24BDBD1A8];
    if (v5)
      v7 = (void *)v5;
    v8 = v7;

    WFBluetoothDeviceFilterDevicesMatchingType(v8, *(_QWORD *)(a1 + 48));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

+ (void)createClientWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__WFBluetoothSettingsClient_createClientWithCompletionHandler___block_invoke;
  v6[3] = &unk_24F8B8D08;
  v7 = v4;
  v8 = a1;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __63__WFBluetoothSettingsClient_createClientWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v2 = (void *)getBluetoothManagerClass_softClass;
  v16 = getBluetoothManagerClass_softClass;
  if (!getBluetoothManagerClass_softClass)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __getBluetoothManagerClass_block_invoke;
    v12[3] = &unk_24F8BB430;
    v12[4] = &v13;
    __getBluetoothManagerClass_block_invoke((uint64_t)v12);
    v2 = (void *)v14[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v13, 8);
  objc_msgSend(v3, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithBluetoothManager:", v4);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __63__WFBluetoothSettingsClient_createClientWithCompletionHandler___block_invoke_2;
    v9[3] = &unk_24F8BB5E0;
    v6 = *(id *)(a1 + 32);
    v10 = v5;
    v11 = v6;
    v7 = v5;
    objc_msgSend(v7, "waitForAvailabilityWithCompletionHandler:", v9);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    WFSettingsClientError();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v7);
  }

}

uint64_t __63__WFBluetoothSettingsClient_createClientWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

@end
