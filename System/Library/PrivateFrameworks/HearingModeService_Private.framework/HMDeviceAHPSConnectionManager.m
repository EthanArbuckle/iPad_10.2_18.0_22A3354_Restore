@implementation HMDeviceAHPSConnectionManager

- (HMDeviceAHPSConnectionManager)initWithQueue:(id)a3
{
  id v5;
  HMDeviceAHPSConnectionManager *v6;
  HMDeviceAHPSConnectionManager *v7;
  HMDeviceAHPSConnectionManager *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDeviceAHPSConnectionManager;
  v6 = -[HMDeviceAHPSConnectionManager init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
    v8 = v7;
  }

  return v7;
}

- (void)activateWithBluetoothDeviceUUID:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__HMDeviceAHPSConnectionManager_activateWithBluetoothDeviceUUID___block_invoke;
  v7[3] = &unk_250EBAE38;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __65__HMDeviceAHPSConnectionManager_activateWithBluetoothDeviceUUID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithBluetoothDeviceUUID:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithBluetoothDeviceUUID:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (!self->_activateCalled)
  {
    v6 = v5;
    self->_activateCalled = 1;
    if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
      && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_identifier, a3);
    -[HMDeviceAHPSConnectionManager _centralManagerEnsureStarted](self, "_centralManagerEnsureStarted");
    v5 = v6;
  }

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__HMDeviceAHPSConnectionManager_invalidate__block_invoke;
  block[3] = &unk_250EBAE60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __43__HMDeviceAHPSConnectionManager_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  uint64_t v3;
  void (**diagnosticCheckWriteCompletion)(void);
  id v5;
  id diagnosticStatusUpdateHandler;
  NSString *identifier;
  id v8;

  -[HMDeviceAHPSConnectionManager _centralManagerEnsureStopped](self, "_centralManagerEnsureStopped");
  NSErrorF();
  v3 = objc_claimAutoreleasedReturnValue();
  diagnosticCheckWriteCompletion = (void (**)(void))self->_diagnosticCheckWriteCompletion;
  v8 = (id)v3;
  if (diagnosticCheckWriteCompletion)
  {
    diagnosticCheckWriteCompletion[2]();
    v5 = self->_diagnosticCheckWriteCompletion;
  }
  else
  {
    v5 = 0;
  }
  self->_diagnosticCheckWriteCompletion = 0;

  diagnosticStatusUpdateHandler = self->_diagnosticStatusUpdateHandler;
  self->_diagnosticStatusUpdateHandler = 0;

  self->_activateCalled = 0;
  identifier = self->_identifier;
  self->_identifier = 0;

}

- (void)_centralManagerEnsureStarted
{
  CBCentralManager *v3;
  id v4;
  OS_dispatch_queue *dispatchQueue;
  void *v6;
  void *v7;
  void *v8;
  CBCentralManager *obj;

  if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
    && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = self->_centralManager;
  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDBB220]);
    dispatchQueue = self->_dispatchQueue;
    v6 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, *MEMORY[0x24BDBB038], 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    obj = (CBCentralManager *)objc_msgSend(v4, "initWithDelegate:queue:options:", self, dispatchQueue, v8);

    objc_storeStrong((id *)&self->_centralManager, obj);
    v3 = obj;
  }

}

- (void)_centralManagerEnsureStopped
{
  CBCentralManager *centralManager;
  CBPeripheral *selectedPeripheral;

  if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
    && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  centralManager = self->_centralManager;
  self->_centralManager = 0;

  selectedPeripheral = self->_selectedPeripheral;
  self->_selectedPeripheral = 0;

}

- (void)_discoverAccessory
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
  void *v12;
  _QWORD v13[5];
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
    && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_isCentralManagerOn)
  {
    centralManager = self->_centralManager;
    v16 = *MEMORY[0x24BDBB160];
    v4 = *MEMORY[0x24BDBB1D8];
    objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", *MEMORY[0x24BDBB1D8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBCentralManager registerForConnectionEventsWithOptions:](centralManager, "registerForConnectionEventsWithOptions:", v7);

    v8 = self->_centralManager;
    objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBCentralManager retrieveConnectedPeripheralsWithServices:](v8, "retrieveConnectedPeripheralsWithServices:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
      && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
    {
      v12 = v11;
      LogPrintF();
    }
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __51__HMDeviceAHPSConnectionManager__discoverAccessory__block_invoke;
    v13[3] = &unk_250EBAE88;
    v13[4] = self;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13, v12);

  }
  else if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
         && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __51__HMDeviceAHPSConnectionManager__discoverAccessory__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  id v15;

  v7 = a2;
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v15 = v7;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  v12 = v10;
  if (v11 == v12)
  {

  }
  else
  {
    v13 = v12;
    if ((v11 == 0) == (v12 != 0))
    {

      goto LABEL_12;
    }
    v14 = objc_msgSend(v11, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_12;
  }
  if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
    && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), a2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "connectPeripheral:options:", v15, 0);
  *a4 = 1;
LABEL_12:

}

- (void)centralManager:(id)a3 connectionEventDidOccur:(int64_t)a4 forPeripheral:(id)a5
{
  NSString *identifier;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  id v15;

  v15 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  identifier = self->_identifier;
  objc_msgSend(v15, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = identifier;
  v12 = v10;
  if (v11 == v12)
  {

  }
  else
  {
    v13 = v12;
    if ((v11 == 0) == (v12 != 0))
    {

LABEL_15:
      if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
        && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      goto LABEL_13;
    }
    v14 = -[NSString isEqual:](v11, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_15;
  }
  if (a4 == 1 && !self->_selectedPeripheral)
  {
    if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
      && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_selectedPeripheral, a5);
    -[CBCentralManager connectPeripheral:options:](self->_centralManager, "connectPeripheral:options:", v15, 0);
  }
LABEL_13:

}

- (void)centralManagerDidUpdateState:(id)a3
{
  uint64_t v4;
  _BOOL4 v5;
  uint64_t v6;

  v4 = objc_msgSend(a3, "state");
  v5 = v4 == 5;
  if (self->_isCentralManagerOn != v5)
  {
    v6 = v4;
    if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
      && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_isCentralManagerOn = v5;
    if (v6 == 5)
      -[HMDeviceAHPSConnectionManager _discoverAccessory](self, "_discoverAccessory");
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  NSString *identifier;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;

  v20 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  identifier = self->_identifier;
  objc_msgSend(v20, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = identifier;
  v9 = v7;
  if (v8 == v9)
  {

    goto LABEL_6;
  }
  v10 = v9;
  if ((v8 == 0) != (v9 != 0))
  {
    v11 = -[NSString isEqual:](v8, "isEqual:", v9);

    if ((v11 & 1) == 0)
      goto LABEL_14;
LABEL_6:
    v12 = v20;
    if (gLogCategory_HMDeviceAHPSConnectionManager <= 30)
    {
      if (gLogCategory_HMDeviceAHPSConnectionManager != -1 || (v13 = _LogCategory_Initialize(), v12 = v20, v13))
      {
        objc_msgSend(v12, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        v12 = v20;
      }
    }
    objc_msgSend(v12, "setDelegate:", self, v19);
    v14 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", *MEMORY[0x24BDBB1D8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayWithObjects:", v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "discoverServices:", v16);

    goto LABEL_11;
  }

LABEL_14:
  v17 = v20;
  if (gLogCategory_HMDeviceAHPSConnectionManager <= 30)
  {
    if (gLogCategory_HMDeviceAHPSConnectionManager != -1 || (v18 = _LogCategory_Initialize(), v17 = v20, v18))
    {
      LogPrintF();
LABEL_11:
      v17 = v20;
    }
  }

}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  NSString *identifier;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  char v12;
  CBPeripheral *selectedPeripheral;
  void *v14;
  id v15;

  v15 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  identifier = self->_identifier;
  objc_msgSend(v15, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = identifier;
  v10 = v8;
  if (v9 == v10)
  {

  }
  else
  {
    v11 = v10;
    if ((v9 == 0) == (v10 != 0))
    {

LABEL_13:
      if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
        && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      goto LABEL_11;
    }
    v12 = -[NSString isEqual:](v9, "isEqual:", v10);

    if ((v12 & 1) == 0)
      goto LABEL_13;
  }
  if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
    && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v15, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  selectedPeripheral = self->_selectedPeripheral;
  self->_selectedPeripheral = 0;

LABEL_11:
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  NSString *identifier;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v15 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  identifier = self->_identifier;
  objc_msgSend(v15, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = identifier;
  v9 = v7;
  if (v8 == v9)
  {

    goto LABEL_6;
  }
  v10 = v9;
  if ((v8 == 0) != (v9 != 0))
  {
    v11 = -[NSString isEqual:](v8, "isEqual:", v9);

    if ((v11 & 1) == 0)
      goto LABEL_10;
LABEL_6:
    objc_msgSend(v15, "services");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __64__HMDeviceAHPSConnectionManager_peripheral_didDiscoverServices___block_invoke;
    v16[3] = &unk_250EBAEB0;
    v17 = v15;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v16);

LABEL_7:
    v13 = v15;
    goto LABEL_8;
  }

LABEL_10:
  v13 = v15;
  if (gLogCategory_HMDeviceAHPSConnectionManager <= 30)
  {
    if (gLogCategory_HMDeviceAHPSConnectionManager != -1 || (v14 = _LogCategory_Initialize(), v13 = v15, v14))
    {
      LogPrintF();
      goto LABEL_7;
    }
  }
LABEL_8:

}

void __64__HMDeviceAHPSConnectionManager_peripheral_didDiscoverServices___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", *MEMORY[0x24BDBB1D8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if (v5)
  {
    if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
      && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
    {
      v7 = *(_QWORD *)(a1 + 32);
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 32), "discoverCharacteristics:forService:", 0, v8, v7);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "discoverCharacteristics:forService:", 0, v8, v6);
    }
  }

}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v7;
  NSString *identifier;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v18 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  identifier = self->_identifier;
  objc_msgSend(v18, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = identifier;
  v12 = v10;
  if (v11 == v12)
  {

  }
  else
  {
    v13 = v12;
    if ((v11 == 0) == (v12 != 0))
    {

LABEL_20:
      if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
        && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      goto LABEL_18;
    }
    v14 = -[NSString isEqual:](v11, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_20;
  }
  if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
    && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v7, "characteristics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v18;
    LogPrintF();

  }
  objc_msgSend(v18, "services", v16, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __87__HMDeviceAHPSConnectionManager_peripheral_didDiscoverCharacteristicsForService_error___block_invoke;
  v19[3] = &unk_250EBAEB0;
  v20 = v18;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v19);

  if (self->_isDiagnosticCheckPending)
  {
    if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
      && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (self->_selectedPeripheral)
    {
      -[HMDeviceAHPSConnectionManager _triggerOnDemandDiagnosticCheckWithCompletionHandler:](self, "_triggerOnDemandDiagnosticCheckWithCompletionHandler:", self->_diagnosticCheckWriteCompletion);
    }
    else if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
           && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

LABEL_18:
}

void __87__HMDeviceAHPSConnectionManager_peripheral_didDiscoverCharacteristicsForService_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __87__HMDeviceAHPSConnectionManager_peripheral_didDiscoverCharacteristicsForService_error___block_invoke_2;
  v4[3] = &unk_250EBAED8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void __87__HMDeviceAHPSConnectionManager_peripheral_didDiscoverCharacteristicsForService_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", CFSTR("a4120002-95c5-4d6f-9098-0f0b41457e0a"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = v4;
  if (v5 == v6)
  {

  }
  else
  {
    v7 = v6;
    if ((v5 == 0) == (v6 != 0))
    {

      goto LABEL_16;
    }
    v8 = objc_msgSend(v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
      goto LABEL_16;
  }
  if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
    && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v12 = v13;
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "setNotifyValue:forCharacteristic:", 1, v13, v9, v12);
  if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
    && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
  {
    v11 = *(_QWORD *)(a1 + 32);
    LogPrintF();
    objc_msgSend(*(id *)(a1 + 32), "readValueForCharacteristic:", v13, v11);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "readValueForCharacteristic:", v13, v10);
  }
LABEL_16:

}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v7;
  NSString *identifier;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  void (**diagnosticStatusUpdateHandler)(id, NSString *, id);
  id v22;

  v22 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  identifier = self->_identifier;
  objc_msgSend(v22, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = identifier;
  v12 = v10;
  if (v11 == v12)
  {

    goto LABEL_6;
  }
  v13 = v12;
  if ((v11 == 0) != (v12 != 0))
  {
    v14 = -[NSString isEqual:](v11, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_21;
LABEL_6:
    objc_msgSend(v7, "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", CFSTR("a4120002-95c5-4d6f-9098-0f0b41457e0a"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v15;
    v18 = v16;
    if (v17 == v18)
    {

    }
    else
    {
      v19 = v18;
      if ((v17 == 0) == (v18 != 0))
      {

LABEL_18:
        goto LABEL_19;
      }
      v20 = objc_msgSend(v17, "isEqual:", v18);

      if ((v20 & 1) == 0)
        goto LABEL_19;
    }
    objc_msgSend(v7, "value");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
      && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    diagnosticStatusUpdateHandler = (void (**)(id, NSString *, id))self->_diagnosticStatusUpdateHandler;
    if (diagnosticStatusUpdateHandler)
      diagnosticStatusUpdateHandler[2](diagnosticStatusUpdateHandler, self->_identifier, v17);
    goto LABEL_18;
  }

LABEL_21:
  if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
    && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_19:

}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  id diagnosticCheckWriteCompletion;
  id v17;
  id v18;
  id v19;
  id v20;

  v20 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v9)
  {
    if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
      && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
    {
      v18 = v8;
      v19 = v9;
      v17 = v20;
LABEL_8:
      LogPrintF();
    }
  }
  else if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
         && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
  {
    v17 = v20;
    v18 = v8;
    goto LABEL_8;
  }
  objc_msgSend(v8, "UUID", v17, v18, v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", CFSTR("a4120004-95c5-4d6f-9098-0f0b41457e0a"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  v13 = v11;
  if (v12 == v13)
  {

LABEL_17:
    v12 = (id)MEMORY[0x242648A28](self->_diagnosticCheckWriteCompletion);
    diagnosticCheckWriteCompletion = self->_diagnosticCheckWriteCompletion;
    self->_diagnosticCheckWriteCompletion = 0;

    if (v12)
      (*((void (**)(id, id))v12 + 2))(v12, v9);
    goto LABEL_20;
  }
  v14 = v13;
  if ((v12 == 0) != (v13 != 0))
  {
    v15 = objc_msgSend(v12, "isEqual:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_21;
    goto LABEL_17;
  }

LABEL_20:
LABEL_21:

}

- (void)triggerOnDemandDiagnosticCheckWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __85__HMDeviceAHPSConnectionManager_triggerOnDemandDiagnosticCheckWithCompletionHandler___block_invoke;
  v7[3] = &unk_250EBAF00;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __85__HMDeviceAHPSConnectionManager_triggerOnDemandDiagnosticCheckWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_triggerOnDemandDiagnosticCheckWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_triggerOnDemandDiagnosticCheckWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id diagnosticCheckWriteCompletion;
  CBPeripheral *selectedPeripheral;
  void *v8;
  void *v9;
  void (**v10)(id, void *);
  id v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = (void *)MEMORY[0x242648A28](v4);
  diagnosticCheckWriteCompletion = self->_diagnosticCheckWriteCompletion;
  self->_diagnosticCheckWriteCompletion = v5;

  selectedPeripheral = self->_selectedPeripheral;
  if (selectedPeripheral)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    -[CBPeripheral services](selectedPeripheral, "services");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __86__HMDeviceAHPSConnectionManager__triggerOnDemandDiagnosticCheckWithCompletionHandler___block_invoke;
    v12[3] = &unk_250EBAF50;
    v12[4] = self;
    v12[5] = &v13;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

    if (!*((_BYTE *)v14 + 24))
    {
      if (gLogCategory_HMDeviceAHPSConnectionManager <= 90
        && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      NSErrorF();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void (**)(id, void *))self->_diagnosticCheckWriteCompletion;
      if (v10)
      {
        v10[2](v10, v9);
        v11 = self->_diagnosticCheckWriteCompletion;
      }
      else
      {
        v11 = 0;
      }
      self->_diagnosticCheckWriteCompletion = 0;

    }
    self->_isDiagnosticCheckPending = 0;
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    self->_isDiagnosticCheckPending = 1;
    if (gLogCategory_HMDeviceAHPSConnectionManager <= 90
      && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

}

void __86__HMDeviceAHPSConnectionManager__triggerOnDemandDiagnosticCheckWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  __int128 v5;

  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __86__HMDeviceAHPSConnectionManager__triggerOnDemandDiagnosticCheckWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_250EBAF28;
  v5 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void __86__HMDeviceAHPSConnectionManager__triggerOnDemandDiagnosticCheckWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", CFSTR("a4120004-95c5-4d6f-9098-0f0b41457e0a"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v7;
  if (v8 == v9)
  {

  }
  else
  {
    v10 = v9;
    if ((v8 == 0) == (v9 != 0))
    {

      goto LABEL_12;
    }
    v11 = objc_msgSend(v8, "isEqual:", v9);

    if ((v11 & 1) == 0)
      goto LABEL_12;
  }
  if (gLogCategory_HMDeviceAHPSConnectionManager <= 30
    && (gLogCategory_HMDeviceAHPSConnectionManager != -1 || _LogCategory_Initialize()))
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    LogPrintF();
  }
  v12 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", "1", 1, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "writeValue:forCharacteristic:type:", v13, v15, 0);

  *a4 = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
LABEL_12:

}

- (id)diagnosticStatusUpdateHandler
{
  return self->_diagnosticStatusUpdateHandler;
}

- (void)setDiagnosticStatusUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_diagnosticStatusUpdateHandler, 0);
  objc_storeStrong((id *)&self->_selectedPeripheral, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_diagnosticCheckWriteCompletion, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
}

@end
