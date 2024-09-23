@implementation DASimulatedDeviceDiscovery

- (DASimulatedDeviceDiscovery)init
{
  DASimulatedDeviceDiscovery *v2;
  DASimulatedDeviceDiscovery *v3;
  DASimulatedDeviceDiscovery *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DASimulatedDeviceDiscovery;
  v2 = -[DASimulatedDeviceDiscovery init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v4 = v3;
  }

  return v3;
}

- (id)description
{
  return -[DASimulatedDeviceDiscovery descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  objc_opt_class();
  NSAppendPrintF();
  return 0;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__DASimulatedDeviceDiscovery_activate__block_invoke;
  block[3] = &unk_24D169168;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __38__DASimulatedDeviceDiscovery_activate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    v2 = result;
    *(_BYTE *)(v1 + 8) = 1;
    CFStringGetTypeID();
    v3 = CFPrefs_CopyTypedValue();
    v4 = *(_QWORD *)(v2 + 32);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    if (gLogCategory_DASimulatedDeviceDiscovery <= 30
      && (gLogCategory_DASimulatedDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return objc_msgSend(*(id *)(v2 + 32), "_activate");
  }
  return result;
}

- (void)_activate
{
  -[DASimulatedDeviceDiscovery _bluetoothEnsureStarted](self, "_bluetoothEnsureStarted");
  -[DASimulatedDeviceDiscovery _bonjourEnsureStarted](self, "_bonjourEnsureStarted");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__DASimulatedDeviceDiscovery_invalidate__block_invoke;
  block[3] = &unk_24D169168;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __40__DASimulatedDeviceDiscovery_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 32))
  {
    v2 = result;
    *(_BYTE *)(v1 + 32) = 1;
    if (gLogCategory_DASimulatedDeviceDiscovery <= 30
      && (gLogCategory_DASimulatedDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      v3 = *(_QWORD *)(v2 + 32);
      LogPrintF();
    }
    objc_msgSend(*(id *)(v2 + 32), "_bluetoothEnsureStopped", v3);
    objc_msgSend(*(id *)(v2 + 32), "_bonjourEnsureStopped");
    return objc_msgSend(*(id *)(v2 + 32), "_invalidated");
  }
  return result;
}

- (void)_invalidated
{
  id eventHandler;

  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    eventHandler = self->_eventHandler;
    self->_eventHandler = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_DASimulatedDeviceDiscovery <= 30
      && (gLogCategory_DASimulatedDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_bluetoothEnsureStarted
{
  CBDiscovery **p_bluetoothScanner;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  DASimulatedDeviceDiscovery *v11;
  _QWORD v12[4];
  id v13;
  DASimulatedDeviceDiscovery *v14;

  p_bluetoothScanner = &self->_bluetoothScanner;
  if (!self->_bluetoothScanner)
  {
    if (gLogCategory_DASimulatedDeviceDiscovery <= 30
      && (gLogCategory_DASimulatedDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v4 = objc_alloc_init(getCBDiscoveryClass());
    objc_storeStrong((id *)p_bluetoothScanner, v4);
    objc_msgSend(v4, "setDiscoveryFlags:", 0x1000000800);
    v5 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __53__DASimulatedDeviceDiscovery__bluetoothEnsureStarted__block_invoke;
    v12[3] = &unk_24D169860;
    v6 = v4;
    v13 = v6;
    v14 = self;
    objc_msgSend(v6, "setDeviceFoundHandler:", v12);
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __53__DASimulatedDeviceDiscovery__bluetoothEnsureStarted__block_invoke_2;
    v9[3] = &unk_24D169860;
    v10 = v6;
    v11 = self;
    v7 = v6;
    objc_msgSend(v7, "setDeviceLostHandler:", v9);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __53__DASimulatedDeviceDiscovery__bluetoothEnsureStarted__block_invoke_3;
    v8[3] = &unk_24D169548;
    v8[4] = self;
    objc_msgSend(v7, "activateWithCompletion:", v8);

  }
}

_QWORD *__53__DASimulatedDeviceDiscovery__bluetoothEnsureStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[2])
    return (_QWORD *)objc_msgSend(result, "_bluetoothFoundDevice:", a2);
  return result;
}

_QWORD *__53__DASimulatedDeviceDiscovery__bluetoothEnsureStarted__block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[2])
    return (_QWORD *)objc_msgSend(result, "_bluetoothFoundDevice:", a2);
  return result;
}

void __53__DASimulatedDeviceDiscovery__bluetoothEnsureStarted__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    v7 = v3;
    if (gLogCategory_DASimulatedDeviceDiscovery <= 90
      && (gLogCategory_DASimulatedDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate", v6);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = 0;

    v3 = v7;
  }

}

- (void)_bluetoothEnsureStopped
{
  CBDiscovery *bluetoothScanner;

  if (self->_bluetoothScanner)
  {
    if (gLogCategory_DASimulatedDeviceDiscovery <= 30
      && (gLogCategory_DASimulatedDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[CBDiscovery invalidate](self->_bluetoothScanner, "invalidate");
    bluetoothScanner = self->_bluetoothScanner;
    self->_bluetoothScanner = 0;

  }
}

- (void)_bluetoothFoundDevice:(id)a3
{
  DADevice *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  DADeviceEvent *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = objc_alloc_init(DADevice);
  objc_msgSend(v14, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DADevice setIdentifier:](v4, "setIdentifier:", v5);

  objc_msgSend(v14, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[DADevice setName:](v4, "setName:", v6);
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v14, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSObject();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("Unknown device %@"), v9);
    -[DADevice setName:](v4, "setName:", v10);

  }
  v11 = -[DAEventDevice initWithEventType:device:]([DADeviceEvent alloc], "initWithEventType:device:", 40, v4);
  if (gLogCategory_DASimulatedDeviceDiscovery <= 30
    && (gLogCategory_DASimulatedDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v12 = _Block_copy(self->_eventHandler);
  v13 = v12;
  if (v12)
    (*((void (**)(void *, DADeviceEvent *))v12 + 2))(v12, v11);

}

- (void)_bluetoothLostDevice:(id)a3
{
  DADevice *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  DADeviceEvent *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = objc_alloc_init(DADevice);
  objc_msgSend(v14, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DADevice setIdentifier:](v4, "setIdentifier:", v5);

  objc_msgSend(v14, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[DADevice setName:](v4, "setName:", v6);
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v14, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSObject();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("Unknown device %@"), v9);
    -[DADevice setName:](v4, "setName:", v10);

  }
  v11 = -[DAEventDevice initWithEventType:device:]([DADeviceEvent alloc], "initWithEventType:device:", 41, v4);
  if (gLogCategory_DASimulatedDeviceDiscovery <= 30
    && (gLogCategory_DASimulatedDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v12 = _Block_copy(self->_eventHandler);
  v13 = v12;
  if (v12)
    (*((void (**)(void *, DADeviceEvent *))v12 + 2))(v12, v11);

}

- (void)_bonjourEnsureStarted
{
  CUBonjourBrowser **p_bonjourBrowser;
  id v4;
  __CFString *v5;
  uint64_t v6;
  __CFString *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[6];

  p_bonjourBrowser = &self->_bonjourBrowser;
  if (!self->_bonjourBrowser)
  {
    v4 = objc_alloc_init(MEMORY[0x24BE29798]);
    objc_storeStrong((id *)p_bonjourBrowser, v4);
    objc_msgSend(v4, "setChangeFlags:", 0xFFFFFFFFLL);
    objc_msgSend(v4, "setDispatchQueue:", self->_dispatchQueue);
    objc_msgSend(v4, "setDomain:", CFSTR("local."));
    v5 = self->_deviceBonjourServiceType;
    if (!v5)
    {
      CFStringGetTypeID();
      v5 = (__CFString *)CFPrefs_CopyTypedValue();
      if (!v5)
        v5 = CFSTR("_deviceaccess._udp");
    }
    objc_msgSend(v4, "setServiceType:", v5);
    v6 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __51__DASimulatedDeviceDiscovery__bonjourEnsureStarted__block_invoke;
    v10[3] = &unk_24D169888;
    v10[4] = v4;
    v10[5] = self;
    objc_msgSend(v4, "setDeviceFoundHandler:", v10);
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __51__DASimulatedDeviceDiscovery__bonjourEnsureStarted__block_invoke_2;
    v9[3] = &unk_24D169888;
    v9[4] = v4;
    v9[5] = self;
    objc_msgSend(v4, "setDeviceLostHandler:", v9);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __51__DASimulatedDeviceDiscovery__bonjourEnsureStarted__block_invoke_3;
    v8[3] = &unk_24D1698B0;
    v8[4] = v4;
    v8[5] = self;
    objc_msgSend(v4, "setDeviceChangedHandler:", v8);
    if (gLogCategory_DASimulatedDeviceDiscovery <= 30
      && (gLogCategory_DASimulatedDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      v7 = v5;
      LogPrintF();
    }
    objc_msgSend(v4, "activate", v7);

  }
}

_QWORD *__51__DASimulatedDeviceDiscovery__bonjourEnsureStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[3])
    return (_QWORD *)objc_msgSend(result, "_bonjourFoundDevice:", a2);
  return result;
}

_QWORD *__51__DASimulatedDeviceDiscovery__bonjourEnsureStarted__block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[3])
    return (_QWORD *)objc_msgSend(result, "_bonjourLostDevice:", a2);
  return result;
}

_QWORD *__51__DASimulatedDeviceDiscovery__bonjourEnsureStarted__block_invoke_3(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[3])
    return (_QWORD *)objc_msgSend(result, "_bonjourFoundDevice:", a2);
  return result;
}

- (void)_bonjourEnsureStopped
{
  CUBonjourBrowser *bonjourBrowser;

  if (self->_bonjourBrowser)
  {
    if (gLogCategory_DASimulatedDeviceDiscovery <= 30
      && (gLogCategory_DASimulatedDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[CUBonjourBrowser invalidate](self->_bonjourBrowser, "invalidate");
    bonjourBrowser = self->_bonjourBrowser;
    self->_bonjourBrowser = 0;

  }
}

- (void)_bonjourFoundDevice:(id)a3
{
  DADevice *v4;
  void *v5;
  void *v6;
  NSString *nameTXTKey;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  const char *v15;
  id v16;
  uint64_t v17;
  const char *v18;
  nw_endpoint_t bonjour_service;
  DADeviceEvent *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v4 = objc_alloc_init(DADevice);
  objc_msgSend(v23, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DADevice setIdentifier:](v4, "setIdentifier:", v6);

  nameTXTKey = self->_nameTXTKey;
  if (!nameTXTKey
    || (v8 = nameTXTKey,
        objc_msgSend(v23, "txtDictionary"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "objectForKeyedSubscript:", v8),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v9,
        !v10))
  {
    objc_msgSend(v23, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[DADevice setName:](v4, "setName:", v10);
  objc_msgSend(v23, "txtDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DADevice setTxtRecordData:](v4, "setTxtRecordData:", v12);

  }
  -[DADevice setProtocolType:](v4, "setProtocolType:", *MEMORY[0x24BDF8790]);
  objc_msgSend(v23, "name");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = objc_msgSend(v13, "UTF8String");
  if (v14)
    v15 = (const char *)v14;
  else
    v15 = "?";
  -[CUBonjourBrowser serviceType](self->_bonjourBrowser, "serviceType");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = objc_msgSend(v16, "UTF8String");
  if (v17)
    v18 = (const char *)v17;
  else
    v18 = "_fake._tcp";
  bonjour_service = nw_endpoint_create_bonjour_service(v15, v18, "local");
  -[DADevice setNetworkEndpoint:](v4, "setNetworkEndpoint:", bonjour_service);

  v20 = -[DAEventDevice initWithEventType:device:]([DADeviceEvent alloc], "initWithEventType:device:", 40, v4);
  if (gLogCategory_DASimulatedDeviceDiscovery <= 30
    && (gLogCategory_DASimulatedDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v21 = _Block_copy(self->_eventHandler);
  v22 = v21;
  if (v21)
    (*((void (**)(void *, DADeviceEvent *))v21 + 2))(v21, v20);

}

- (void)_bonjourLostDevice:(id)a3
{
  DADevice *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  DADeviceEvent *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = objc_alloc_init(DADevice);
  objc_msgSend(v13, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DADevice setIdentifier:](v4, "setIdentifier:", v6);

  objc_msgSend(v13, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DADevice setName:](v4, "setName:", v7);

  objc_msgSend(v13, "txtDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DADevice setTxtRecordData:](v4, "setTxtRecordData:", v9);

  }
  v10 = -[DAEventDevice initWithEventType:device:]([DADeviceEvent alloc], "initWithEventType:device:", 41, v4);
  if (gLogCategory_DASimulatedDeviceDiscovery <= 30
    && (gLogCategory_DASimulatedDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v11 = _Block_copy(self->_eventHandler);
  v12 = v11;
  if (v11)
    (*((void (**)(void *, DADeviceEvent *))v11 + 2))(v11, v10);

}

- (NSString)deviceBonjourServiceType
{
  return self->_deviceBonjourServiceType;
}

- (void)setDeviceBonjourServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_deviceBonjourServiceType, 0);
  objc_storeStrong((id *)&self->_nameTXTKey, 0);
  objc_storeStrong((id *)&self->_bonjourBrowser, 0);
  objc_storeStrong((id *)&self->_bluetoothScanner, 0);
}

@end
