@implementation HMDeviceManager

+ (id)sharedInstance
{
  if (sharedInstance_sOnce_0 != -1)
    dispatch_once(&sharedInstance_sOnce_0, &__block_literal_global_0);
  return (id)sharedInstance_sSelf_0;
}

void __33__HMDeviceManager_sharedInstance__block_invoke()
{
  HMDeviceManager *v0;
  void *v1;

  v0 = objc_alloc_init(HMDeviceManager);
  v1 = (void *)sharedInstance_sSelf_0;
  sharedInstance_sSelf_0 = (uint64_t)v0;

}

- (id)availableRecords
{
  HMDeviceManager *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableDictionary copy](v2->_deviceRecordMap, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (id)availableDiagnosticRecords
{
  HMDeviceManager *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableDictionary copy](v2->_diagnosticRecordMap, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (HMDeviceManager)init
{
  HMDeviceManager *v2;
  HMDeviceManager *v3;
  HMDeviceManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDeviceManager;
  v2 = -[HMDeviceManager init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v4 = v3;
  }

  return v3;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__HMDeviceManager_activate__block_invoke;
  block[3] = &unk_250EBAE60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __27__HMDeviceManager_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  if (!self->_activateCalled)
  {
    self->_activateCalled = 1;
    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[HMDeviceManager _accessoryDiscoveryEnsureStarted](self, "_accessoryDiscoveryEnsureStarted");
    -[HMDeviceManager _aaControllerEnsureStarted](self, "_aaControllerEnsureStarted");
    -[HMDeviceManager _cloudServicesClientEnsureStarted](self, "_cloudServicesClientEnsureStarted");
  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__HMDeviceManager_invalidate__block_invoke;
  block[3] = &unk_250EBAE60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__HMDeviceManager_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  NSMutableDictionary *deviceRecordMap;
  NSMutableDictionary *deviceAHPSConnectionManagerMap;
  NSMutableDictionary *diagnosticRecordMap;

  if (gLogCategory_HMDeviceManager <= 30
    && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[HMDeviceManager _accessoryDiscoveryEnsureStopped](self, "_accessoryDiscoveryEnsureStopped");
  -[HMDeviceManager _aaControllerEnsureStopped](self, "_aaControllerEnsureStopped");
  -[HMDeviceManager _cloudServicesClientEnsureStopped](self, "_cloudServicesClientEnsureStopped");
  -[NSMutableDictionary removeAllObjects](self->_deviceRecordMap, "removeAllObjects");
  deviceRecordMap = self->_deviceRecordMap;
  self->_deviceRecordMap = 0;

  -[NSMutableDictionary removeAllObjects](self->_deviceAHPSConnectionManagerMap, "removeAllObjects");
  deviceAHPSConnectionManagerMap = self->_deviceAHPSConnectionManagerMap;
  self->_deviceAHPSConnectionManagerMap = 0;

  -[NSMutableDictionary removeAllObjects](self->_diagnosticRecordMap, "removeAllObjects");
  diagnosticRecordMap = self->_diagnosticRecordMap;
  self->_diagnosticRecordMap = 0;

  self->_activateCalled = 0;
}

- (void)_modifyDeviceConfiguration:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  _QWORD *v25;
  _QWORD v26[3];
  char v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecordMap, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v8, "restoreConfigsFromCloudRecordIfNeeded:", v11);
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x2020000000;
    v27 = 0;
    v27 = objc_msgSend(v8, "needsUpdateToPersonalAudioForDevice:", v11);
    v12 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __68__HMDeviceManager__modifyDeviceConfiguration_identifier_completion___block_invoke;
    v21[3] = &unk_250EBAFD8;
    v25 = v26;
    v21[4] = self;
    v13 = v9;
    v22 = v13;
    v14 = v8;
    v23 = v14;
    v24 = v10;
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __68__HMDeviceManager__modifyDeviceConfiguration_identifier_completion___block_invoke_2;
    v17[3] = &unk_250EBB028;
    v15 = (id)MEMORY[0x242648A28](v21);
    v20 = v15;
    v17[4] = self;
    v18 = v14;
    v19 = v13;
    -[HMDeviceManager _sendConfigOverDeviceManager:identifier:completion:](self, "_sendConfigOverDeviceManager:identifier:completion:", v18, v19, v17);

    _Block_object_dispose(v26, 8);
  }
  else
  {
    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    NSErrorF();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      (*((void (**)(id, void *))v10 + 2))(v10, v16);

  }
}

void __68__HMDeviceManager__modifyDeviceConfiguration_identifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (!v3)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "_updatePersonalAudioConfigForIdentifier:", *(_QWORD *)(a1 + 40));
LABEL_4:
      v3 = 0;
      goto LABEL_9;
    }
    if (gLogCategory_HMDeviceManager <= 10)
    {
      if (gLogCategory_HMDeviceManager != -1 || (v4 = _LogCategory_Initialize(), v3 = 0, v4))
      {
        LogPrintF();
        goto LABEL_4;
      }
    }
  }
LABEL_9:
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

void __68__HMDeviceManager__modifyDeviceConfiguration_identifier_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __68__HMDeviceManager__modifyDeviceConfiguration_identifier_completion___block_invoke_3;
    v5[3] = &unk_250EBB000;
    v4 = *(_QWORD *)(a1 + 48);
    v6 = *(id *)(a1 + 56);
    objc_msgSend(v2, "_sendPMEConfigOverAAController:identifier:completion:", v3, v4, v5);

  }
}

uint64_t __68__HMDeviceManager__modifyDeviceConfiguration_identifier_completion___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)_triggerDiagnosticCheckForIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, void *))a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceAHPSConnectionManagerMap, "objectForKeyedSubscript:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v9 = v10;
    NSErrorF();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_HMDeviceManager <= 90
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      v9 = v10;
      LogPrintF();
    }
    v6[2](v6, v8);

  }
  objc_msgSend(v7, "triggerOnDemandDiagnosticCheckWithCompletionHandler:", v6, v9);

}

- (void)_accessoryDiscoveryEnsureStarted
{
  AADeviceManager **p_deviceManager;
  AADeviceManager *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  AADeviceManager *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  p_deviceManager = &self->_deviceManager;
  v4 = self->_deviceManager;
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BE09A38]);
    objc_storeStrong((id *)p_deviceManager, v5);
    objc_msgSend(v5, "setDispatchQueue:", self->_dispatchQueue);
    objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_10);
    objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_12);
    v6 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __51__HMDeviceManager__accessoryDiscoveryEnsureStarted__block_invoke_3;
    v10[3] = &unk_250EBB090;
    v10[4] = self;
    objc_msgSend(v5, "setDeviceFoundHandler:", v10);
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __51__HMDeviceManager__accessoryDiscoveryEnsureStarted__block_invoke_4;
    v9[3] = &unk_250EBB090;
    v9[4] = self;
    objc_msgSend(v5, "setDeviceLostHandler:", v9);
    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __51__HMDeviceManager__accessoryDiscoveryEnsureStarted__block_invoke_5;
    v7[3] = &unk_250EBB0B8;
    v7[4] = self;
    v4 = (AADeviceManager *)v5;
    v8 = v4;
    -[AADeviceManager activateWithCompletion:](v4, "activateWithCompletion:", v7);

  }
}

void __51__HMDeviceManager__accessoryDiscoveryEnsureStarted__block_invoke()
{
  if (gLogCategory_HMDeviceManager <= 30
    && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __51__HMDeviceManager__accessoryDiscoveryEnsureStarted__block_invoke_2()
{
  if (gLogCategory_HMDeviceManager <= 30
    && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __51__HMDeviceManager__accessoryDiscoveryEnsureStarted__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deviceFound:", a2);
}

void __51__HMDeviceManager__accessoryDiscoveryEnsureStarted__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (gLogCategory_HMDeviceManager <= 30)
  {
    if (gLogCategory_HMDeviceManager != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      v5 = v3;
      LogPrintF();
      v3 = v6;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_deviceLost:", v3, v5);

}

void __51__HMDeviceManager__accessoryDiscoveryEnsureStarted__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      v5 = v6;
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "invalidate", v5);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
  if (gLogCategory_HMDeviceManager <= 30
    && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)_accessoryDiscoveryEnsureStopped
{
  AADeviceManager *deviceManager;
  AADeviceManager *v4;

  deviceManager = self->_deviceManager;
  if (deviceManager)
  {
    -[AADeviceManager invalidate](deviceManager, "invalidate");
    v4 = self->_deviceManager;
    self->_deviceManager = 0;

  }
}

- (void)_deviceFound:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSMutableDictionary *deviceRecordMap;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;
  id v11;

  v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  objc_msgSend(v11, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecordMap, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      if (!objc_msgSend(v5, "updateWithAADevice:", v11))
        goto LABEL_13;
    }
    else
    {
      if (gLogCategory_HMDeviceManager <= 30
        && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
      {
        v10 = v11;
        LogPrintF();
      }
      v6 = objc_alloc_init(MEMORY[0x24BE4BDD8]);
      deviceRecordMap = self->_deviceRecordMap;
      if (!deviceRecordMap)
      {
        v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
        v9 = self->_deviceRecordMap;
        self->_deviceRecordMap = v8;

        deviceRecordMap = self->_deviceRecordMap;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](deviceRecordMap, "setObject:forKeyedSubscript:", v6, v4, v10);
      objc_msgSend(v6, "updateWithAADevice:", v11);
      -[HMDeviceManager _activateAHPSConnectionForDevice:](self, "_activateAHPSConnectionForDevice:", v6);
    }
    -[HMDeviceManager _performActionsOnRecordChange:](self, "_performActionsOnRecordChange:", v6);
LABEL_13:

    goto LABEL_14;
  }
  if (gLogCategory_HMDeviceManager <= 90
    && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_14:

}

- (void)_performActionsOnRecordChange:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v5 = a3;
  if (gLogCategory_HMDeviceManager <= 30
    && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    v4 = v5;
    LogPrintF();
  }
  +[HMServiceDaemon sharedHMServiceDaemon](HMServiceDaemon, "sharedHMServiceDaemon", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reportDeviceRecordChange:", v5);

}

- (void)_deviceLost:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  objc_msgSend(v8, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecordMap, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (gLogCategory_HMDeviceManager <= 30
        && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
      {
        v7 = v5;
        LogPrintF();
      }
      -[HMDeviceManager _invalidateAHPSConnectionForDevice:](self, "_invalidateAHPSConnectionForDevice:", v5, v7);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceRecordMap, "setObject:forKeyedSubscript:", 0, v4);
      +[HMServiceDaemon sharedHMServiceDaemon](HMServiceDaemon, "sharedHMServiceDaemon");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reportDeviceRecordLost:", v5);

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_diagnosticRecordMap, "setObject:forKeyedSubscript:", 0, v4);
    }

  }
  else if (gLogCategory_HMDeviceManager <= 90
         && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)_sendConfigOverDeviceManager:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  AADeviceManager *deviceManager;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_deviceManager)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecordMap, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if ((objc_msgSend(v8, "needsUpdateToDeviceManagerForDevice:", v11) & 1) != 0)
      {
        v12 = objc_alloc_init(MEMORY[0x24BE09A30]);
        objc_msgSend(v12, "setListeningModeOffAllowed:", objc_msgSend(v8, "allowListeningModeOff"));
        if (gLogCategory_HMDeviceManager <= 30
          && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        deviceManager = self->_deviceManager;
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __70__HMDeviceManager__sendConfigOverDeviceManager_identifier_completion___block_invoke;
        v16[3] = &unk_250EBB0E0;
        v17 = v12;
        v18 = v9;
        v19 = v10;
        v15 = v12;
        -[AADeviceManager sendDeviceConfig:identifier:completion:](deviceManager, "sendDeviceConfig:identifier:completion:", v15, v18, v16);

      }
      else
      {
        if (gLogCategory_HMDeviceManager <= 10
          && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (v10)
          (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
      }
    }
    else
    {
      if (gLogCategory_HMDeviceManager <= 90
        && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      NSErrorF();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        (*((void (**)(id, void *))v10 + 2))(v10, v13);

    }
  }
  else
  {
    if (gLogCategory_HMDeviceManager <= 90
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    NSErrorF();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      (*((void (**)(id, void *))v10 + 2))(v10, v11);
  }

}

void __70__HMDeviceManager__sendConfigOverDeviceManager_identifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    if (gLogCategory_HMDeviceManager <= 90)
    {
      if (gLogCategory_HMDeviceManager != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        v3 = v6;
      }
    }
  }
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

- (void)_aaControllerEnsureStarted
{
  AAController **p_aaController;
  AAController *v4;
  id v5;
  int v6;
  uint64_t v7;
  _QWORD v8[4];
  AAController *v9;
  HMDeviceManager *v10;
  _QWORD v11[4];
  id v12;
  HMDeviceManager *v13;

  p_aaController = &self->_aaController;
  v4 = self->_aaController;
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BE09A28]);
    objc_msgSend(v5, "setDispatchQueue:", self->_dispatchQueue);
    objc_storeStrong((id *)p_aaController, v5);
    objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_34);
    v6 = _os_feature_enabled_impl();
    v7 = MEMORY[0x24BDAC760];
    if (v6)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __45__HMDeviceManager__aaControllerEnsureStarted__block_invoke_2;
      v11[3] = &unk_250EBB128;
      v12 = v5;
      v13 = self;
      objc_msgSend(v12, "setPmeConfigMessageHandler:", v11);

    }
    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __45__HMDeviceManager__aaControllerEnsureStarted__block_invoke_3;
    v8[3] = &unk_250EBB0B8;
    v4 = (AAController *)v5;
    v9 = v4;
    v10 = self;
    -[AAController activateWithCompletion:](v4, "activateWithCompletion:", v8);

  }
}

void __45__HMDeviceManager__aaControllerEnsureStarted__block_invoke()
{
  if (gLogCategory_HMDeviceManager <= 30
    && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __45__HMDeviceManager__aaControllerEnsureStarted__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD *v3;
  id v6;

  v3 = *(_QWORD **)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == v3[1])
  {
    v6 = a2;
    objc_msgSend(v3, "_pmeConfigDataReceived:identifier:", a3, v6);
    objc_msgSend(*(id *)(a1 + 40), "_updatePersonalAudioConfigForIdentifier:", v6);

  }
}

void __45__HMDeviceManager__aaControllerEnsureStarted__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8))
  {
    if (v3)
    {
      v9 = v3;
      if (gLogCategory_HMDeviceManager <= 90
        && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
      {
        v8 = v9;
        LogPrintF();
      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v8);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(void **)(v5 + 8);
      *(_QWORD *)(v5 + 8) = 0;

      goto LABEL_11;
    }
    if (gLogCategory_HMDeviceManager <= 30)
    {
      v9 = 0;
      if (gLogCategory_HMDeviceManager != -1 || (v7 = _LogCategory_Initialize(), v4 = 0, v7))
      {
        LogPrintF();
LABEL_11:
        v4 = v9;
      }
    }
  }

}

- (void)_aaControllerEnsureStopped
{
  AAController *aaController;
  AAController *v4;

  aaController = self->_aaController;
  if (aaController)
  {
    -[AAController invalidate](aaController, "invalidate");
    v4 = self->_aaController;
    self->_aaController = 0;

  }
}

- (id)_constructPMEConfigDataBytesForDevice:(id)a3 fromConfig:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  void *v41;
  int v42;
  void *v43;
  int v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  int v52;
  void *v53;
  int v54;
  void *v55;
  int v56;
  void *v57;
  int v58;
  void *v59;
  int v60;
  void *v61;
  int v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  int v70;
  void *v71;
  int v72;
  void *v73;
  int v74;
  void *v75;
  int v76;
  void *v77;
  int v78;
  void *v79;
  int v80;
  void *v81;
  int v82;
  void *v83;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;

  v5 = a4;
  objc_msgSend(a3, "configDataPME");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  LODWORD(v93) = 0;
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  if (v6)
  {
    objc_msgSend(v6, "getBytes:length:", &v85, 132);
  }
  else if (gLogCategory_HMDeviceManager <= 30
         && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  LOBYTE(v85) = 2;
  if (objc_msgSend(v5, "enablePMEMedia", v85, v86, v87, v88, v89, v90, v91, v92, v93))
  {
    if (objc_msgSend(v5, "enablePMEMedia") == 1)
      v8 = 1;
    else
      v8 = 2;
    BYTE3(v85) = v8;
  }
  if (objc_msgSend(v5, "enablePMEVoice"))
  {
    if (objc_msgSend(v5, "enablePMEVoice") == 1)
      v9 = 1;
    else
      v9 = 2;
    BYTE2(v85) = v9;
  }
  if (objc_msgSend(v5, "enrollPMEVoice"))
  {
    if (objc_msgSend(v5, "enrollPMEVoice") == 1)
      v10 = 1;
    else
      v10 = 2;
    BYTE1(v85) = v10;
  }
  objc_msgSend(v5, "mediaLossArrayLeft");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v5, "mediaLossArrayLeft");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    DWORD1(v87) = v14;

    objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    DWORD2(v87) = v16;

    objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    HIDWORD(v87) = v18;

    objc_msgSend(v12, "objectAtIndexedSubscript:", 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "floatValue");
    LODWORD(v88) = v20;

    objc_msgSend(v12, "objectAtIndexedSubscript:", 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "floatValue");
    DWORD1(v88) = v22;

    objc_msgSend(v12, "objectAtIndexedSubscript:", 5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "floatValue");
    DWORD2(v88) = v24;

    objc_msgSend(v12, "objectAtIndexedSubscript:", 6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "floatValue");
    HIDWORD(v88) = v26;

    objc_msgSend(v12, "objectAtIndexedSubscript:", 7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "floatValue");
    LODWORD(v89) = v28;

  }
  objc_msgSend(v5, "mediaLossArrayRight");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v5, "mediaLossArrayRight");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "floatValue");
    DWORD1(v91) = v32;

    objc_msgSend(v30, "objectAtIndexedSubscript:", 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "floatValue");
    DWORD2(v91) = v34;

    objc_msgSend(v30, "objectAtIndexedSubscript:", 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "floatValue");
    HIDWORD(v91) = v36;

    objc_msgSend(v30, "objectAtIndexedSubscript:", 3);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "floatValue");
    LODWORD(v92) = v38;

    objc_msgSend(v30, "objectAtIndexedSubscript:", 4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "floatValue");
    DWORD1(v92) = v40;

    objc_msgSend(v30, "objectAtIndexedSubscript:", 5);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "floatValue");
    DWORD2(v92) = v42;

    objc_msgSend(v30, "objectAtIndexedSubscript:", 6);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "floatValue");
    HIDWORD(v92) = v44;

    objc_msgSend(v30, "objectAtIndexedSubscript:", 7);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "floatValue");
    LODWORD(v93) = v46;

  }
  objc_msgSend(v5, "voiceLossArrayLeft");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    objc_msgSend(v5, "voiceLossArrayLeft");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectAtIndexedSubscript:", 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "floatValue");
    DWORD1(v85) = v50;

    objc_msgSend(v48, "objectAtIndexedSubscript:", 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "floatValue");
    DWORD2(v85) = v52;

    objc_msgSend(v48, "objectAtIndexedSubscript:", 2);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "floatValue");
    HIDWORD(v85) = v54;

    objc_msgSend(v48, "objectAtIndexedSubscript:", 3);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "floatValue");
    LODWORD(v86) = v56;

    objc_msgSend(v48, "objectAtIndexedSubscript:", 4);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "floatValue");
    DWORD1(v86) = v58;

    objc_msgSend(v48, "objectAtIndexedSubscript:", 5);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "floatValue");
    DWORD2(v86) = v60;

    objc_msgSend(v48, "objectAtIndexedSubscript:", 6);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "floatValue");
    HIDWORD(v86) = v62;

    objc_msgSend(v48, "objectAtIndexedSubscript:", 7);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "floatValue");
    LODWORD(v87) = v64;

  }
  objc_msgSend(v5, "voiceLossArrayRight");
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (v65)
  {
    objc_msgSend(v5, "voiceLossArrayRight");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "objectAtIndexedSubscript:", 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "floatValue");
    DWORD1(v89) = v68;

    objc_msgSend(v66, "objectAtIndexedSubscript:", 1);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "floatValue");
    DWORD2(v89) = v70;

    objc_msgSend(v66, "objectAtIndexedSubscript:", 2);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "floatValue");
    HIDWORD(v89) = v72;

    objc_msgSend(v66, "objectAtIndexedSubscript:", 3);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "floatValue");
    LODWORD(v90) = v74;

    objc_msgSend(v66, "objectAtIndexedSubscript:", 4);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "floatValue");
    DWORD1(v90) = v76;

    objc_msgSend(v66, "objectAtIndexedSubscript:", 5);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "floatValue");
    DWORD2(v90) = v78;

    objc_msgSend(v66, "objectAtIndexedSubscript:", 6);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "floatValue");
    HIDWORD(v90) = v80;

    objc_msgSend(v66, "objectAtIndexedSubscript:", 7);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "floatValue");
    LODWORD(v91) = v82;

  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v85, 132);
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  return v83;
}

- (void)_pmeConfigDataReceived:(id)a3 identifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecordMap, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "updateWithPMEConfigData:", v12))
    {
      if (gLogCategory_HMDeviceManager <= 30
        && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSDataHex();
        v10 = v8;
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      +[HMServiceDaemon sharedHMServiceDaemon](HMServiceDaemon, "sharedHMServiceDaemon", v10, v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "reportDeviceRecordChange:", v8);

    }
  }
  else if (gLogCategory_HMDeviceManager <= 30
         && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)_sendPMEConfigOverAAController:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  void *v11;
  void *v12;
  AAController *aaController;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  HMDeviceManager *v18;
  void (**v19)(id, id);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecordMap, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      if (gLogCategory_HMDeviceManager <= 90
        && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      NSErrorF();
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v10)
        v10[2](v10, v14);
      goto LABEL_20;
    }
    if ((objc_msgSend(v8, "needsUpdateToPMEConfigurationForDevice:", v11) & 1) != 0)
    {
      -[HMDeviceManager _aaControllerEnsureStarted](self, "_aaControllerEnsureStarted");
      -[HMDeviceManager _constructPMEConfigDataBytesForDevice:fromConfig:](self, "_constructPMEConfigDataBytesForDevice:fromConfig:", v11, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      aaController = self->_aaController;
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __72__HMDeviceManager__sendPMEConfigOverAAController_identifier_completion___block_invoke;
      v15[3] = &unk_250EBB150;
      v16 = v12;
      v17 = v9;
      v18 = self;
      v19 = v10;
      v14 = v12;
      -[AAController sendPMEConfigData:destinationIdentifier:completionHandler:](aaController, "sendPMEConfigData:destinationIdentifier:completionHandler:", v14, v17, v15);

LABEL_20:
      goto LABEL_24;
    }
    if (gLogCategory_HMDeviceManager <= 10
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v10)
      v10[2](v10, 0);
  }
  else
  {
    if (gLogCategory_HMDeviceManager <= 90
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    NSErrorF();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v10[2](v10, v11);
  }
LABEL_24:

}

void __72__HMDeviceManager__sendPMEConfigOverAAController_identifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v3 = a2;
  v12 = v3;
  if (!v3)
  {
    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      v5 = *(_QWORD *)(a1 + 40);
      CUPrintNSDataHex();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      objc_msgSend(*(id *)(a1 + 48), "_pmeConfigDataReceived:identifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5, v11);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "_pmeConfigDataReceived:identifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v8, v10);
    }
    goto LABEL_12;
  }
  v4 = v3;
  if (gLogCategory_HMDeviceManager <= 90)
  {
    if (gLogCategory_HMDeviceManager != -1 || (v6 = _LogCategory_Initialize(), v4 = v12, v6))
    {
      CUPrintNSDataHex();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

LABEL_12:
      v4 = v12;
    }
  }
  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
  {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v12);
    v4 = v12;
  }

}

- (void)_activateAHPSConnectionForDevice:(id)a3
{
  id v4;
  void *v5;
  HMDeviceAHPSConnectionManager *v6;
  NSMutableDictionary *deviceAHPSConnectionManagerMap;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  _QWORD v10[5];

  v4 = a3;
  objc_msgSend(v4, "bluetoothUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceAHPSConnectionManagerMap, "objectForKeyedSubscript:", v5);
    v6 = (HMDeviceAHPSConnectionManager *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = -[HMDeviceAHPSConnectionManager initWithQueue:]([HMDeviceAHPSConnectionManager alloc], "initWithQueue:", self->_dispatchQueue);
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __52__HMDeviceManager__activateAHPSConnectionForDevice___block_invoke;
      v10[3] = &unk_250EBB178;
      v10[4] = self;
      -[HMDeviceAHPSConnectionManager setDiagnosticStatusUpdateHandler:](v6, "setDiagnosticStatusUpdateHandler:", v10);
      deviceAHPSConnectionManagerMap = self->_deviceAHPSConnectionManagerMap;
      if (!deviceAHPSConnectionManagerMap)
      {
        v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
        v9 = self->_deviceAHPSConnectionManagerMap;
        self->_deviceAHPSConnectionManagerMap = v8;

        deviceAHPSConnectionManagerMap = self->_deviceAHPSConnectionManagerMap;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](deviceAHPSConnectionManagerMap, "setObject:forKeyedSubscript:", v6, v5);
      -[HMDeviceAHPSConnectionManager activateWithBluetoothDeviceUUID:](v6, "activateWithBluetoothDeviceUUID:", v5);
    }

  }
  else if (gLogCategory_HMDeviceManager <= 90
         && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

uint64_t __52__HMDeviceManager__activateAHPSConnectionForDevice___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_diagnosticDataReceived:identifier:", a3, a2);
}

- (void)_invalidateAHPSConnectionForDevice:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "bluetoothUUID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceAHPSConnectionManagerMap, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "invalidate");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceAHPSConnectionManagerMap, "setObject:forKeyedSubscript:", 0, v6);
  }

}

- (void)_diagnosticDataReceived:(id)a3 identifier:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSMutableDictionary *diagnosticRecordMap;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecordMap, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x24BE4BDD0]);
    objc_msgSend(v8, "updateWithHMDeviceRecord:", v7);
    objc_msgSend(v8, "updateWithDiagnosticData:", v14);
    diagnosticRecordMap = self->_diagnosticRecordMap;
    if (!diagnosticRecordMap)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v11 = self->_diagnosticRecordMap;
      self->_diagnosticRecordMap = v10;

      diagnosticRecordMap = self->_diagnosticRecordMap;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](diagnosticRecordMap, "setObject:forKeyedSubscript:", v8, v6);
    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      v13 = v8;
      LogPrintF();
    }
    +[HMServiceDaemon sharedHMServiceDaemon](HMServiceDaemon, "sharedHMServiceDaemon", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reportDiagnosticRecordChange:", v8);

  }
  else if (gLogCategory_HMDeviceManager <= 90
         && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)_cloudServicesClientEnsureStarted
{
  AACloudServicesClient **p_cloudServicesClient;
  AACloudServicesClient *v4;
  id v5;
  _QWORD v6[4];
  AACloudServicesClient *v7;
  HMDeviceManager *v8;

  p_cloudServicesClient = &self->_cloudServicesClient;
  v4 = self->_cloudServicesClient;
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BE09A20]);
    objc_msgSend(v5, "setDispatchQueue:", self->_dispatchQueue);
    objc_storeStrong((id *)p_cloudServicesClient, v5);
    objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_59);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __52__HMDeviceManager__cloudServicesClientEnsureStarted__block_invoke_2;
    v6[3] = &unk_250EBB0B8;
    v4 = (AACloudServicesClient *)v5;
    v7 = v4;
    v8 = self;
    -[AACloudServicesClient activateWithCompletion:](v4, "activateWithCompletion:", v6);

  }
}

void __52__HMDeviceManager__cloudServicesClientEnsureStarted__block_invoke()
{
  if (gLogCategory_HMDeviceManager <= 30
    && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __52__HMDeviceManager__cloudServicesClientEnsureStarted__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24))
  {
    if (v3)
    {
      v9 = v3;
      if (gLogCategory_HMDeviceManager <= 90
        && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
      {
        v8 = v9;
        LogPrintF();
      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v8);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(void **)(v5 + 24);
      *(_QWORD *)(v5 + 24) = 0;

      goto LABEL_11;
    }
    if (gLogCategory_HMDeviceManager <= 30)
    {
      v9 = 0;
      if (gLogCategory_HMDeviceManager != -1 || (v7 = _LogCategory_Initialize(), v4 = 0, v7))
      {
        LogPrintF();
LABEL_11:
        v4 = v9;
      }
    }
  }

}

- (void)_cloudServicesClientEnsureStopped
{
  AACloudServicesClient *cloudServicesClient;

  if (self->_cloudServicesClient)
  {
    if (gLogCategory_HMDeviceManager <= 30
      && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[AACloudServicesClient invalidate](self->_cloudServicesClient, "invalidate");
    cloudServicesClient = self->_cloudServicesClient;
    self->_cloudServicesClient = 0;

  }
}

- (void)_updatePersonalAudioConfigForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  _BOOL8 v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24[3];
  id v25;
  id v26;

  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceRecordMap, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
    {
      if (gLogCategory_HMDeviceManager <= 90
        && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      goto LABEL_49;
    }
    objc_msgSend(v5, "bluetoothAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (objc_msgSend(v6, "pmeMediaEnabled") && objc_msgSend(v6, "pmeVoiceEnabled"))
      {
        v24[0] = 0;
        objc_msgSend(v6, "pmeMediaLossDataLeft");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        HMEarLossDataToArray();
        v25 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "pmeMediaLossDataRight");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        HMEarLossDataToArray();
        v26 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "pmeVoiceLossDataLeft");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        HMEarLossDataToArray();
        v24[1] = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "pmeVoiceLossDataRight");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        HMEarLossDataToArray();
        v24[2] = (id)objc_claimAutoreleasedReturnValue();

        if (v25 && v26)
        {
          BYTE1(v24[0]) = objc_msgSend(v6, "pmeMediaEnabled") == 1;
          v12 = objc_msgSend(v6, "pmeVoiceEnabled");
          LOBYTE(v24[0]) = v12 == 1;
          v13 = v12 == 1 || BYTE1(v24[0]) != 0;
          if (gLogCategory_HMDeviceManager <= 30
            && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
          {
            v14 = "no";
            if (v13)
              v14 = "yes";
            v18 = v14;
            LogPrintF();
          }
          objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance", v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setPersonalMediaEnabled:forRouteUID:", v13, v7);

          if (gLogCategory_HMDeviceManager <= 30
            && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
          {
            objc_msgSend(v25, "firstObject");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "firstObject");
            v22 = v16;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = BYTE1(v24[0]);
            v21 = LOBYTE(v24[0]);
            v19 = v7;
            LogPrintF();

          }
          objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance", v19, v20, v21, v22, v23);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "updateConfiguration:forRouteID:", v24, v7);

        }
        else if (gLogCategory_HMDeviceManager <= 30
               && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        __destructor_8_s8_s16_s24_s32(v24);
        goto LABEL_48;
      }
      if (gLogCategory_HMDeviceManager > 30
        || gLogCategory_HMDeviceManager == -1 && !_LogCategory_Initialize())
      {
LABEL_48:

LABEL_49:
        goto LABEL_50;
      }
    }
    else if (gLogCategory_HMDeviceManager > 90
           || gLogCategory_HMDeviceManager == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_48;
    }
    LogPrintF();
    goto LABEL_48;
  }
  if (gLogCategory_HMDeviceManager <= 90
    && (gLogCategory_HMDeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_50:

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_diagnosticRecordMap, 0);
  objc_storeStrong((id *)&self->_deviceRecordMap, 0);
  objc_storeStrong((id *)&self->_deviceManager, 0);
  objc_storeStrong((id *)&self->_deviceAHPSConnectionManagerMap, 0);
  objc_storeStrong((id *)&self->_cloudServicesClient, 0);
  objc_storeStrong((id *)&self->_aaController, 0);
}

@end
