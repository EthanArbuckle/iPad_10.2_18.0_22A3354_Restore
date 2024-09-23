@implementation CUBluetoothClient

- (unsigned)statusFlags
{
  return self->_statusFlags;
}

- (CUBluetoothClient)init
{
  CUBluetoothClient *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CUBluetoothClient;
  v2 = -[CUBluetoothClient init](&v4, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUBluetoothClient;
  }
  return v2;
}

- (void)dealloc
{
  LogCategory *ucat;
  objc_super v4;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CUBluetoothClient;
  -[CUBluetoothClient dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)-[CUBluetoothClient descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t bluetoothState;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFMutableStringRef v13;

  v13 = 0;
  bluetoothState = self->_bluetoothState;
  if (bluetoothState > 0xA)
    v5 = "?";
  else
    v5 = off_1E25DC628[bluetoothState];
  -[NSMutableDictionary count](self->_btConnectedDevices, "count", *(_QWORD *)&a3);
  -[NSMutableDictionary count](self->_btPairedDevices, "count");
  NSAppendPrintF(&v13, (uint64_t)"CUBluetoothClient: BT %s, Connected %d, FL %#{flags}, Paired %d, SF %#{flags}", v6, v7, v8, v9, v10, v11, (uint64_t)v5);
  return v13;
}

- (void)setLabel:(id)a3
{
  id v5;
  uint64_t *p_ucat;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  objc_storeStrong((id *)&self->_label, a3);
  v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  v7 = qword_1EE0652A0;
  v14 = objc_retainAutorelease(v5);
  objc_msgSend(v14, "UTF8String");
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);

}

- (void)activate
{
  NSObject *v3;
  _QWORD block[5];

  -[CUBluetoothClient _internalDispatchQueue](self, "_internalDispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__CUBluetoothClient_activate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_externalInvokeBlock:(id)a3
{
  OS_dispatch_queue *v4;
  OS_dispatch_queue *dispatchQueue;
  void (**block)(void);

  block = (void (**)(void))a3;
  -[CUBluetoothClient _internalDispatchQueue](self, "_internalDispatchQueue");
  v4 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = self->_dispatchQueue;

  if (v4 == dispatchQueue)
    block[2]();
  else
    dispatch_async((dispatch_queue_t)self->_dispatchQueue, block);

}

- (id)_internalDispatchQueue
{
  return self->_dispatchQueue;
}

- (void)invalidate
{
  NSObject *v3;
  _QWORD block[5];

  -[CUBluetoothClient _internalDispatchQueue](self, "_internalDispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__CUBluetoothClient_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_invalidated
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  id bluetoothAddressChangedHandler;
  id bluetoothStateChangedHandler;
  id deviceConnectedHandler;
  id deviceDisconnectedHandler;
  id deviceEventHandler;
  id devicePairedHandler;
  id deviceUnpairedHandler;
  id interruptionHandler;
  id invalidationHandler;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  LogCategory *v22;
  _BOOL4 v23;
  uint64_t v24;
  void *v25;

  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled)
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 50)
      {
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x32u))
            goto LABEL_7;
          ucat = self->_ucat;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _invalidated]", 0x32u, (uint64_t)"### Unexpectedly invalidated\n", v2, v3, v4, v5, v24);
      }
    }
LABEL_7:
    if (self->_btPeripheralManager || self->_btPairingAgent || self->_btSession)
      return;
    bluetoothAddressChangedHandler = self->_bluetoothAddressChangedHandler;
    self->_bluetoothAddressChangedHandler = 0;

    bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
    self->_bluetoothStateChangedHandler = 0;

    deviceConnectedHandler = self->_deviceConnectedHandler;
    self->_deviceConnectedHandler = 0;

    deviceDisconnectedHandler = self->_deviceDisconnectedHandler;
    self->_deviceDisconnectedHandler = 0;

    deviceEventHandler = self->_deviceEventHandler;
    self->_deviceEventHandler = 0;

    devicePairedHandler = self->_devicePairedHandler;
    self->_devicePairedHandler = 0;

    deviceUnpairedHandler = self->_deviceUnpairedHandler;
    self->_deviceUnpairedHandler = 0;

    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    v25 = _Block_copy(self->_invalidationHandler);
    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    v21 = v25;
    if (v25)
    {
      -[CUBluetoothClient _externalInvokeBlock:](self, "_externalInvokeBlock:", v25);
      v21 = v25;
    }
    self->_invalidateDone = 1;
    v22 = self->_ucat;
    if (v22->var0 <= 10)
    {
      if (v22->var0 == -1)
      {
        v23 = _LogCategory_Initialize((uint64_t)v22, 0xAu);
        v21 = v25;
        if (!v23)
          goto LABEL_17;
        v22 = self->_ucat;
      }
      LogPrintF((uint64_t)v22, (uint64_t)"-[CUBluetoothClient _invalidated]", 0xAu, (uint64_t)"Invalidated\n", v17, v18, v19, v20, v24);
      v21 = v25;
    }
LABEL_17:

  }
}

- (void)findDeviceByAddress:(id)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;
  __int16 v12;

  v4 = *(_QWORD *)a3.var0;
  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CUBluetoothClient_findDeviceByAddress_completion___block_invoke;
  block[3] = &unk_1E25DC3E0;
  v11 = v4;
  v12 = WORD2(v4);
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_findDeviceByAddress:(id)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  NSMutableArray *findDeviceRequests;
  NSMutableArray *v8;
  NSMutableArray *v9;
  CUBluetoothFindDeviceRequest *v10;

  v4 = *(_QWORD *)a3.var0;
  v6 = a4;
  v10 = objc_alloc_init(CUBluetoothFindDeviceRequest);
  -[CUBluetoothFindDeviceRequest setAddress:](v10, "setAddress:", v4 & 0xFFFFFFFFFFFFLL);
  -[CUBluetoothFindDeviceRequest setCompletion:](v10, "setCompletion:", v6);

  findDeviceRequests = self->_findDeviceRequests;
  if (!findDeviceRequests)
  {
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = self->_findDeviceRequests;
    self->_findDeviceRequests = v8;

    findDeviceRequests = self->_findDeviceRequests;
  }
  -[NSMutableArray addObject:](findDeviceRequests, "addObject:", v10);
  self->_btCentralManagerNeeded = 1;
  self->_btSessionNeeded = 1;
  -[CUBluetoothClient _btEnsureStarted](self, "_btEnsureStarted");

}

- (void)_processFindDeviceRequests
{
  uint64_t v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CUBluetoothDevice *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (**v40)(_QWORD, _QWORD, _QWORD);
  uint64_t v41;
  const char *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void (**v51)(_QWORD, _QWORD, _QWORD);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  unint64_t v60;
  unsigned int v61;
  unsigned __int16 v62;
  uint64_t v63;
  int v64;
  __int16 v65;
  int v66;
  __int16 v67;
  _BYTE v68[32];
  _QWORD v69[3];

  v69[2] = *MEMORY[0x1E0C80C00];
  while (1)
  {
    -[NSMutableArray firstObject](self->_findDeviceRequests, "firstObject");
    v3 = objc_claimAutoreleasedReturnValue();
    if (!v3)
      break;
    v4 = (void *)v3;
    -[NSMutableArray removeObjectAtIndex:](self->_findDeviceRequests, "removeObjectAtIndex:", 0);
    if (self->_invalidateCalled)
    {
      objc_msgSend(v4, "completion");
      v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated", v6, v7, v8, v9, v10, v11, v59);
      v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v5[2](v5, 0, v12);
      goto LABEL_16;
    }
    v13 = objc_msgSend(v4, "address");
    v66 = v13;
    v67 = WORD2(v13);
    NSPrintF((uint64_t)"%.6a", v14, v15, v16, v17, v18, v19, v20, (uint64_t)&v66);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBCentralManager retrievePeripheralWithAddress:](self->_btCentralManager, "retrievePeripheralWithAddress:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v12 = (void (**)(_QWORD, _QWORD, _QWORD))v22;
      v5 = (void (**)(_QWORD, _QWORD, _QWORD))v21;
    }
    else
    {
      v23 = objc_msgSend(v4, "address");
      v64 = v23;
      v65 = WORD2(v23);
      NSPrintF((uint64_t)"Random %.6a", v24, v25, v26, v27, v28, v29, v30, (uint64_t)&v64);
      v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      -[CBCentralManager retrievePeripheralWithAddress:](self->_btCentralManager, "retrievePeripheralWithAddress:", v5);
      v31 = objc_claimAutoreleasedReturnValue();
      if (!v31)
      {
        objc_msgSend(v4, "completion");
        v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        NSErrorWithOSStatusF(4294960569, (uint64_t)"Peripheral not found", v44, v45, v46, v47, v48, v49, v59);
        v32 = (CUBluetoothDevice *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, CUBluetoothDevice *))v12)[2](v12, 0, v32);
        goto LABEL_15;
      }
      v12 = (void (**)(_QWORD, _QWORD, _QWORD))v31;
    }
    v32 = objc_alloc_init(CUBluetoothDevice);
    objc_msgSend(v12, "identifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUBluetoothDevice setIdentifier:](v32, "setIdentifier:", v33);
    v69[0] = 0;
    v69[1] = 0;
    objc_msgSend(v33, "getUUIDBytes:", v69);
    v63 = 0;
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceFromIdentifier_2037[0])((uint64_t)self->_btSession, (uint64_t)v69, (uint64_t)&v63))
    {
      objc_msgSend(v4, "completion");
      v40 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v41 = 4294960588;
      v42 = "BTDevice not found";
    }
    else
    {
      v68[0] = 0;
      if (!((unsigned int (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetAddressString_1991[0])(v63, (uint64_t)v68, 32))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v68);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUBluetoothDevice setAddressString:](v32, "setAddressString:", v50);

        v62 = 0;
        v61 = 0;
        if (((unsigned int (*)(uint64_t, uint64_t))softLinkBTDeviceAddressFromString[0])((uint64_t)v68, (uint64_t)&v61))
        {
          objc_msgSend(v4, "completion");
          v51 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          NSErrorWithOSStatusF(4294960535, (uint64_t)"Get address failed", v52, v53, v54, v55, v56, v57, v59);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, _QWORD, void *))v51)[2](v51, 0, v58);

        }
        else
        {
          v60 = v60 & 0xFFFF000000000000 | v61 | ((unint64_t)v62 << 32);
          -[CUBluetoothDevice setAddress:](v32, "setAddress:");
          -[CUBluetoothClient updateDevice:btDevice:](self, "updateDevice:btDevice:", v32, v63);
          objc_msgSend(v4, "completion");
          v51 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, CUBluetoothDevice *, _QWORD))v51)[2](v51, v32, 0);
        }

        goto LABEL_14;
      }
      objc_msgSend(v4, "completion");
      v40 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v41 = 4294960535;
      v42 = "Get address string failed";
    }
    NSErrorWithOSStatusF(v41, (uint64_t)v42, v34, v35, v36, v37, v38, v39, v59);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v40)[2](v40, 0, v43);

LABEL_14:
LABEL_15:

LABEL_16:
  }
}

- (void)setDeviceFlags:(unsigned int)a3 mask:(unsigned int)a4 deviceID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  unsigned int v18;
  unsigned int v19;

  v10 = a5;
  v11 = a6;
  -[CUBluetoothClient _internalDispatchQueue](self, "_internalDispatchQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__CUBluetoothClient_setDeviceFlags_mask_deviceID_completion___block_invoke;
  v15[3] = &unk_1E25DD0F8;
  v18 = a3;
  v19 = a4;
  v15[4] = self;
  v16 = v10;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, v15);

}

- (void)_setDeviceFlags:(unsigned int)a3 mask:(unsigned int)a4 deviceID:(id)a5 completion:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  LogCategory *ucat;
  uint64_t v18;
  void (**v19)(id, void *);

  v19 = (void (**)(id, void *))a6;
  NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960561, (uint64_t)"Not supported on this platform", v7, v8, v9, v10, v11, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  ucat = self->_ucat;
  if (ucat->var0 <= 90)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
        goto LABEL_5;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _setDeviceFlags:mask:deviceID:completion:]", 0x5Au, (uint64_t)"### setDeviceFlags failed: %{error}", v12, v13, v14, v15, (uint64_t)v16);
  }
LABEL_5:
  v19[2](v19, v16);

}

- (void)_btEnsureStarted
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  id v8;
  void *v9;
  CBCentralManager *v10;
  CBCentralManager *v11;
  void *v12;
  id v13;
  void *v14;
  CBCentralManager *v15;
  CBCentralManager *btCentralManager;
  LogCategory *v17;
  id v18;
  void *v19;
  CBPeripheralManager *v20;
  void *v21;
  void *v22;
  id v23;
  CBPeripheralManager *v24;
  CBPeripheralManager *btPeripheralManager;
  BTSessionImpl *btSession;
  LogCategory *v27;
  LogCategory *v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  BTLocalDeviceImpl *btLocalDevice;
  int v34;
  int v35;
  NSData *v36;
  NSData *btLocalDeviceAddr;
  LogCategory *v38;
  LogCategory *v39;
  LogCategory *v40;
  int v41;
  BTSessionImpl *v42;
  int v43;
  int v44;
  LogCategory *v45;
  int v46;
  int v47;
  LogCategory *v48;
  CUBluetoothClient *v49;
  char *var4;
  void *v51;
  int v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  LogCategory *v60;
  LogCategory *v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  LogCategory *v68;
  int v69;
  LogCategory *v70;
  uint64_t v71;
  int v72;
  __int16 v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  _QWORD v81[2];

  v81[1] = *MEMORY[0x1E0C80C00];
  if (!self->_btCentralManagerNeeded || self->_btCentralManager)
    goto LABEL_11;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_7;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _btEnsureStarted]", 0x1Eu, (uint64_t)"CBCentralManager start\n", v2, v3, v4, v5, v71);
  }
LABEL_7:
  if ((self->_flags & 0x20) != 0)
  {
    getCBCentralManagerOptionShowPowerAlertKey[0]();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v12;
    v81[0] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, &v80, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc((Class)getCBCentralManagerClass_2074());
    -[CUBluetoothClient _internalDispatchQueue](self, "_internalDispatchQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (CBCentralManager *)objc_msgSend(v13, "initWithDelegate:queue:options:", self, v14, v9);
    btCentralManager = self->_btCentralManager;
    self->_btCentralManager = v15;

  }
  else
  {
    v8 = objc_alloc((Class)getCBCentralManagerClass_2074());
    -[CUBluetoothClient _internalDispatchQueue](self, "_internalDispatchQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (CBCentralManager *)objc_msgSend(v8, "initWithDelegate:queue:", self, v9);
    v11 = self->_btCentralManager;
    self->_btCentralManager = v10;

  }
LABEL_11:
  if (!self->_btPeripheralManagerNeeded || self->_btPeripheralManager)
    goto LABEL_22;
  v17 = self->_ucat;
  if (v17->var0 <= 30)
  {
    if (v17->var0 != -1)
    {
LABEL_15:
      LogPrintF((uint64_t)v17, (uint64_t)"-[CUBluetoothClient _btEnsureStarted]", 0x1Eu, (uint64_t)"CBPeripheralManager start\n", v2, v3, v4, v5, v71);
      goto LABEL_17;
    }
    if (_LogCategory_Initialize((uint64_t)v17, 0x1Eu))
    {
      v17 = self->_ucat;
      goto LABEL_15;
    }
  }
LABEL_17:
  if ((self->_flags & 0x20) != 0)
  {
    getCBPeripheralManagerOptionShowPowerAlertKey[0]();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v22;
    v79 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_alloc((Class)getCBPeripheralManagerClass_2078());
    -[CUBluetoothClient _internalDispatchQueue](self, "_internalDispatchQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (CBPeripheralManager *)objc_msgSend(v23, "initWithDelegate:queue:options:", self, v21, v19);
    btPeripheralManager = self->_btPeripheralManager;
    self->_btPeripheralManager = v24;

  }
  else
  {
    v18 = objc_alloc((Class)getCBPeripheralManagerClass_2078());
    -[CUBluetoothClient _internalDispatchQueue](self, "_internalDispatchQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (CBPeripheralManager *)objc_msgSend(v18, "initWithDelegate:queue:", self, v19);
    v21 = self->_btPeripheralManager;
    self->_btPeripheralManager = v20;
  }

  if (self->_bluetoothAddressChangedHandler)
  {
    -[CBPeripheralManager addObserver:forKeyPath:options:context:](self->_btPeripheralManager, "addObserver:forKeyPath:options:context:", self, CFSTR("advertisingAddress"), 0, 0);
    -[CUBluetoothClient _handleBluetoothAddressChanged](self, "_handleBluetoothAddressChanged");
  }
LABEL_22:
  if (!self->_btSessionNeeded || self->_btSessionAttaching || self->_btSession)
    goto LABEL_25;
  v28 = self->_ucat;
  if (v28->var0 <= 30)
  {
    if (v28->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v28, 0x1Eu))
        goto LABEL_77;
      v28 = self->_ucat;
    }
    LogPrintF((uint64_t)v28, (uint64_t)"-[CUBluetoothClient _btEnsureStarted]", 0x1Eu, (uint64_t)"BTSession attach\n", v2, v3, v4, v5, v71);
  }
LABEL_77:
  v74 = _btSessionEventCallback_2082;
  v49 = self;

  var4 = self->_ucat->var4;
  -[CUBluetoothClient _internalDispatchQueue](v49, "_internalDispatchQueue");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, void *))softLinkBTSessionAttachWithQueue_2083[0])((uint64_t)var4, (uint64_t)&v74, (uint64_t)v49, v51);

  if (v52)
  {
    CFRelease(v49);
    v53 = (v52 + 310000);
    v54 = "BTSessionAttachWithQueue failed";
    goto LABEL_79;
  }
  self->_btSessionAttaching = 1;
  v49->_btSessionStarted = 1;
LABEL_25:
  btSession = self->_btSession;
  if (!btSession)
    goto LABEL_39;
  if (self->_btConnectionEventsNeeded && !self->_btSessionAddedServiceCallback)
  {
    v27 = self->_ucat;
    if (v27->var0 > 30)
      goto LABEL_35;
    if (v27->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v27, 0x1Eu))
      {
LABEL_35:
        v29 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTServiceAddCallbacks_2086[0])((uint64_t)self->_btSession, (uint64_t)_btServiceEventHandler_2064, (uint64_t)self);
        if (!v29)
        {
          self->_btSessionAddedServiceCallback = 1;
          btSession = self->_btSession;
          if (!btSession)
            goto LABEL_39;
          goto LABEL_37;
        }
        v69 = v29;
        v70 = self->_ucat;
        if (v70->var0 <= 60)
        {
          if (v70->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)v70, 0x3Cu))
              goto LABEL_93;
            v70 = self->_ucat;
          }
          LogPrintF((uint64_t)v70, (uint64_t)"-[CUBluetoothClient _btEnsureStarted]", 0x3Cu, (uint64_t)"### BTSession add service callbacks failed: %#m\n", v2, v3, v4, v5, (v69 + 310000));
        }
LABEL_93:
        v59 = 0;
        goto LABEL_94;
      }
      v27 = self->_ucat;
    }
    LogPrintF((uint64_t)v27, (uint64_t)"-[CUBluetoothClient _btEnsureStarted]", 0x1Eu, (uint64_t)"BTServiceAddCallbacks\n", v2, v3, v4, v5, v71);
    goto LABEL_35;
  }
LABEL_37:
  if (!self->_btLocalDevice)
  {
    v30 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTLocalDeviceGetDefault[0])((uint64_t)btSession, (uint64_t)&self->_btLocalDevice);
    if (v30)
    {
      v53 = (v30 + 310000);
      v54 = "BTLocalDeviceGetDefault failed";
      goto LABEL_79;
    }
  }
LABEL_39:
  if (self->_btLocalDeviceAddrNeeded)
  {
    btLocalDevice = self->_btLocalDevice;
    if (btLocalDevice)
    {
      if (!self->_btLocalDeviceAddr)
      {
        LOBYTE(v74) = 0;
        v34 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTLocalDeviceGetAddressString[0])((uint64_t)btLocalDevice, (uint64_t)&v74, 32);
        if (v34)
        {
          v53 = (v34 + 310000);
          v54 = "BTLocalDeviceGetAddressString failed";
          goto LABEL_79;
        }
        v73 = 0;
        v72 = 0;
        v35 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTDeviceAddressFromString[0])((uint64_t)&v74, (uint64_t)&v72);
        if (v35)
        {
          v53 = (v35 + 310000);
          v54 = "BTDeviceAddressFromString failed";
          goto LABEL_79;
        }
        v36 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v72, 6);
        btLocalDeviceAddr = self->_btLocalDeviceAddr;
        self->_btLocalDeviceAddr = v36;

        v38 = self->_ucat;
        if (v38->var0 <= 30)
        {
          if (v38->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)v38, 0x1Eu))
              goto LABEL_48;
            v38 = self->_ucat;
          }
          LogPrintF((uint64_t)v38, (uint64_t)"-[CUBluetoothClient _btEnsureStarted]", 0x1Eu, (uint64_t)"Bluetooth local address: %.6a\n", v2, v3, v4, v5, (uint64_t)&v72);
        }
      }
    }
  }
LABEL_48:
  if (!self->_btLocalDeviceCallbacksNeeded || self->_btLocalDeviceCallbacksRegistered || !self->_btLocalDevice)
    goto LABEL_50;
  v40 = self->_ucat;
  if (v40->var0 <= 30)
  {
    if (v40->var0 != -1)
    {
LABEL_59:
      LogPrintF((uint64_t)v40, (uint64_t)"-[CUBluetoothClient _btEnsureStarted]", 0x1Eu, (uint64_t)"BTLocalDeviceAddCallbacks\n", v2, v3, v4, v5, v71);
      goto LABEL_71;
    }
    if (_LogCategory_Initialize((uint64_t)v40, 0x1Eu))
    {
      v40 = self->_ucat;
      goto LABEL_59;
    }
  }
LABEL_71:
  self->_btLocalDeviceCallbacks.statusEvent = _btLocalDeviceStatusCallback;
  v46 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTLocalDeviceAddCallbacks[0])((uint64_t)self->_btLocalDevice, (uint64_t)&self->_btLocalDeviceCallbacks, (uint64_t)self);
  if (v46)
  {
    v47 = v46;
    v48 = self->_ucat;
    if (v48->var0 <= 60)
    {
      if (v48->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v48, 0x3Cu))
          goto LABEL_50;
        v48 = self->_ucat;
      }
      LogPrintF((uint64_t)v48, (uint64_t)"-[CUBluetoothClient _btEnsureStarted]", 0x3Cu, (uint64_t)"### BTLocalDeviceAddCallbacks failed: %#m\n", v2, v3, v4, v5, (v47 + 310000));
    }
  }
  else
  {
    self->_btLocalDeviceCallbacksRegistered = 1;
    -[CUBluetoothClient _handlePairingStatusChanged](self, "_handlePairingStatusChanged");
  }
LABEL_50:
  if (!self->_btPairingAgentNeeded || self->_btPairingAgent || !self->_btSession)
  {
LABEL_63:
    if (!self->_btAccessoryEventsNeeded)
      goto LABEL_89;
    v42 = self->_btSession;
    if (!v42)
      goto LABEL_89;
    if (self->_btAccessoryManager)
      goto LABEL_88;
    v43 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTAccessoryManagerGetDefault[0])((uint64_t)v42, (uint64_t)&self->_btAccessoryManager);
    if (v43)
    {
      v44 = v43;
      v45 = self->_ucat;
      if (v45->var0 <= 60)
      {
        if (v45->var0 != -1)
        {
LABEL_69:
          LogPrintF((uint64_t)v45, (uint64_t)"-[CUBluetoothClient _btEnsureStarted]", 0x3Cu, (uint64_t)"### BTAccessoryManagerGetDefault failed: %#m\n", v2, v3, v4, v5, (v44 + 310000));
          goto LABEL_87;
        }
        if (_LogCategory_Initialize((uint64_t)v45, 0x3Cu))
        {
          v45 = self->_ucat;
          goto LABEL_69;
        }
      }
    }
LABEL_87:
    if (!self->_btAccessoryManager)
      goto LABEL_89;
LABEL_88:
    if (self->_btAccessoryEventsRegistered)
      goto LABEL_89;
    v61 = self->_ucat;
    if (v61->var0 <= 30)
    {
      if (v61->var0 != -1)
      {
LABEL_100:
        LogPrintF((uint64_t)v61, (uint64_t)"-[CUBluetoothClient _btEnsureStarted]", 0x1Eu, (uint64_t)"BTAccessoryManagerAddCallbacks\n", v2, v3, v4, v5, v71);
        goto LABEL_102;
      }
      if (_LogCategory_Initialize((uint64_t)v61, 0x1Eu))
      {
        v61 = self->_ucat;
        goto LABEL_100;
      }
    }
LABEL_102:
    self->_btAccessoryCallbacks.accessorySetupCommand = 0;
    self->_btAccessoryCallbacks.accessoryRelayMsgRecv = 0;
    self->_btAccessoryCallbacks.accessoryCommandStatus = 0;
    self->_btAccessoryCallbacks.accessoryEvent = _btAccessoryEventCallback;
    v62 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTAccessoryManagerAddCallbacks[0])((uint64_t)self->_btAccessoryManager, (uint64_t)&self->_btAccessoryCallbacks, (uint64_t)self);
    if (v62)
    {
      v67 = v62;
      v68 = self->_ucat;
      if (v68->var0 > 60)
        goto LABEL_89;
      if (v68->var0 != -1)
        goto LABEL_105;
      if (_LogCategory_Initialize((uint64_t)v68, 0x3Cu))
      {
        v68 = self->_ucat;
LABEL_105:
        LogPrintF((uint64_t)v68, (uint64_t)"-[CUBluetoothClient _btEnsureStarted]", 0x3Cu, (uint64_t)"### BTAccessoryManagerAddCallbacks failed: %#m\n", v63, v64, v65, v66, (v67 + 310000));
      }
    }
    else
    {
      self->_btAccessoryEventsRegistered = 1;
    }
LABEL_89:
    if (self->_btConnectionEventsNeeded
      && !self->_btConnectionDevicesInitialized
      && self->_btLocalDevice
      && -[CBCentralManager state](self->_btCentralManager, "state") == 5)
    {
      -[CUBluetoothClient _handleConnectedDevicesInit](self, "_handleConnectedDevicesInit");
      self->_btConnectionDevicesInitialized = 1;
    }
    if (self->_btSession)
      -[CUBluetoothClient _processFindDeviceRequests](self, "_processFindDeviceRequests");
    goto LABEL_93;
  }
  v39 = self->_ucat;
  if (v39->var0 > 30)
    goto LABEL_61;
  if (v39->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)v39, 0x1Eu))
      goto LABEL_61;
    v39 = self->_ucat;
  }
  LogPrintF((uint64_t)v39, (uint64_t)"-[CUBluetoothClient _btEnsureStarted]", 0x1Eu, (uint64_t)"BTPairingAgent start\n", v2, v3, v4, v5, v71);
LABEL_61:
  v77 = 0;
  v75 = 0u;
  v76 = 0u;
  v74 = _btPairingAgentStatusCallback;
  v41 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTPairingAgentCreate[0])((uint64_t)self->_btSession, (uint64_t)&v74, (uint64_t)self, (uint64_t)&self->_btPairingAgent);
  if (v41)
  {
    v54 = "BTPairingAgentCreate failed";
  }
  else
  {
    v41 = ((uint64_t (*)(uint64_t))softLinkBTPairingAgentStart[0])((uint64_t)self->_btPairingAgent);
    if (!v41)
      goto LABEL_63;
    v54 = "BTPairingAgentStart failed";
  }
  v53 = (v41 + 310000);
LABEL_79:
  NSErrorWithOSStatusF(v53, (uint64_t)v54, v31, v32, v2, v3, v4, v5, v71);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (v59)
  {
    v60 = self->_ucat;
    if (v60->var0 <= 60)
    {
      if (v60->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v60, 0x3Cu))
          goto LABEL_94;
        v60 = self->_ucat;
      }
      LogPrintF((uint64_t)v60, (uint64_t)"-[CUBluetoothClient _btEnsureStarted]", 0x3Cu, (uint64_t)"### BTSession start failed: %{error}\n", v55, v56, v57, v58, (uint64_t)v59);
    }
  }
LABEL_94:

}

- (void)_btEnsureStopped
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  NSMutableDictionary *btConnectedDevices;
  LogCategory *ucat;
  int v10;
  int v11;
  LogCategory *v12;
  LogCategory *v13;
  LogCategory *v14;
  LogCategory *v15;
  LogCategory *v16;
  LogCategory *v17;
  NSData *btLocalDeviceAddr;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  LogCategory *v23;
  CBPeripheralManager *btPeripheralManager;
  CBPeripheralManager *v25;
  NSMutableDictionary *btPairedDevices;
  NSMutableDictionary *v27;
  uint64_t v28;
  _QWORD v29[6];

  if (!self->_invalidateCalled)
  {
    self->_statusFlags = 0;
    v7 = _Block_copy(self->_deviceDisconnectedHandler);
    btConnectedDevices = self->_btConnectedDevices;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __37__CUBluetoothClient__btEnsureStopped__block_invoke;
    v29[3] = &unk_1E25DC408;
    v29[4] = self;
    v29[5] = v7;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](btConnectedDevices, "enumerateKeysAndObjectsUsingBlock:", v29);

  }
  if (!self->_btAccessoryEventsRegistered)
    goto LABEL_13;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_8;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _btEnsureStopped]", 0x1Eu, (uint64_t)"BTAccessoryManagerRemoveCallbacks\n", v2, v3, v4, v5, v28);
  }
LABEL_8:
  self->_btAccessoryEventsRegistered = 0;
  v10 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTAccessoryManagerRemoveCallbacks[0])((uint64_t)self->_btAccessoryManager, (uint64_t)&self->_btAccessoryCallbacks);
  if (v10)
  {
    v11 = v10;
    v12 = self->_ucat;
    if (v12->var0 <= 60)
    {
      if (v12->var0 != -1)
      {
LABEL_11:
        LogPrintF((uint64_t)v12, (uint64_t)"-[CUBluetoothClient _btEnsureStopped]", 0x3Cu, (uint64_t)"### BTAccessoryManagerRemoveCallbacks failed: %#m\n", v2, v3, v4, v5, (v11 + 310000));
        goto LABEL_13;
      }
      if (_LogCategory_Initialize((uint64_t)v12, 0x3Cu))
      {
        v12 = self->_ucat;
        goto LABEL_11;
      }
    }
  }
LABEL_13:
  if (!self->_btLocalDeviceCallbacksRegistered)
    goto LABEL_19;
  v13 = self->_ucat;
  if (v13->var0 <= 30)
  {
    if (v13->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v13, 0x1Eu))
        goto LABEL_18;
      v13 = self->_ucat;
    }
    LogPrintF((uint64_t)v13, (uint64_t)"-[CUBluetoothClient _btEnsureStopped]", 0x1Eu, (uint64_t)"BTLocalDeviceRemoveCallbacks\n", v2, v3, v4, v5, v28);
  }
LABEL_18:
  ((void (*)(uint64_t, uint64_t))softLinkBTLocalDeviceRemoveCallbacks[0])((uint64_t)self->_btLocalDevice, (uint64_t)&self->_btLocalDeviceCallbacks);
  self->_btLocalDeviceCallbacksRegistered = 0;
LABEL_19:
  if (!self->_btPairingAgentStarted)
    goto LABEL_25;
  v14 = self->_ucat;
  if (v14->var0 <= 30)
  {
    if (v14->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v14, 0x1Eu))
        goto LABEL_24;
      v14 = self->_ucat;
    }
    LogPrintF((uint64_t)v14, (uint64_t)"-[CUBluetoothClient _btEnsureStopped]", 0x1Eu, (uint64_t)"BTPairingAgentStop\n", v2, v3, v4, v5, v28);
  }
LABEL_24:
  ((void (*)(uint64_t))softLinkBTPairingAgentStop[0])((uint64_t)self->_btPairingAgent);
  self->_btPairingAgentStarted = 0;
LABEL_25:
  if (!self->_btPairingAgent)
    goto LABEL_31;
  v15 = self->_ucat;
  if (v15->var0 <= 30)
  {
    if (v15->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v15, 0x1Eu))
        goto LABEL_30;
      v15 = self->_ucat;
    }
    LogPrintF((uint64_t)v15, (uint64_t)"-[CUBluetoothClient _btEnsureStopped]", 0x1Eu, (uint64_t)"BTPairingAgentDestroy\n", v2, v3, v4, v5, v28);
  }
LABEL_30:
  ((void (*)(uint64_t))softLinkBTPairingAgentDestroy[0])((uint64_t)&self->_btPairingAgent);
  self->_btPairingAgent = 0;
LABEL_31:
  if (!self->_btSessionAddedServiceCallback)
    goto LABEL_39;
  if (self->_btSession)
  {
    v16 = self->_ucat;
    if (v16->var0 <= 30)
    {
      if (v16->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v16, 0x1Eu))
          goto LABEL_37;
        v16 = self->_ucat;
      }
      LogPrintF((uint64_t)v16, (uint64_t)"-[CUBluetoothClient _btEnsureStopped]", 0x1Eu, (uint64_t)"BTServiceRemoveCallbacks\n", v2, v3, v4, v5, v28);
    }
LABEL_37:
    ((void (*)(uint64_t, uint64_t))softLinkBTServiceRemoveCallbacks_2065[0])((uint64_t)self->_btSession, (uint64_t)_btServiceEventHandler_2064);
  }
  self->_btSessionAddedServiceCallback = 0;
LABEL_39:
  if (!self->_btSession)
    goto LABEL_45;
  v17 = self->_ucat;
  if (v17->var0 <= 30)
  {
    if (v17->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v17, 0x1Eu))
        goto LABEL_44;
      v17 = self->_ucat;
    }
    LogPrintF((uint64_t)v17, (uint64_t)"-[CUBluetoothClient _btEnsureStopped]", 0x1Eu, (uint64_t)"BTSession detach\n", v2, v3, v4, v5, v28);
  }
LABEL_44:
  ((void (*)(uint64_t))softLinkBTSessionDetachWithQueue_2067[0])((uint64_t)&self->_btSession);
  self->_btSession = 0;
LABEL_45:
  self->_btSessionStarted = 0;
  btLocalDeviceAddr = self->_btLocalDeviceAddr;
  self->_btLocalDevice = 0;
  self->_btLocalDeviceAddr = 0;

  self->_btAccessoryManager = 0;
  if (!self->_btPeripheralManager)
    goto LABEL_53;
  v23 = self->_ucat;
  if (v23->var0 <= 30)
  {
    if (v23->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v23, 0x1Eu))
        goto LABEL_50;
      v23 = self->_ucat;
    }
    LogPrintF((uint64_t)v23, (uint64_t)"-[CUBluetoothClient _btEnsureStopped]", 0x1Eu, (uint64_t)"CBPeripheralManager stop\n", v19, v20, v21, v22, v28);
  }
LABEL_50:
  btPeripheralManager = self->_btPeripheralManager;
  if (self->_bluetoothAddressChangedHandler)
  {
    -[CBPeripheralManager removeObserver:forKeyPath:context:](btPeripheralManager, "removeObserver:forKeyPath:context:", self, CFSTR("advertisingAddress"), 0);
    btPeripheralManager = self->_btPeripheralManager;
  }
  -[CBPeripheralManager setDelegate:](btPeripheralManager, "setDelegate:", 0);
  v25 = self->_btPeripheralManager;
  self->_btPeripheralManager = 0;

LABEL_53:
  btPairedDevices = self->_btPairedDevices;
  self->_btPairedDevices = 0;

  self->_btPairedDevicesInitialized = 0;
  v27 = self->_btConnectedDevices;
  self->_btConnectedDevices = 0;

}

- (void)_btAccessoryNameChanged:(BTDeviceImpl *)a3
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  LogCategory *v24;
  void *v25;
  id v26;
  void *v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  LogCategory *v33;
  void *v34;
  void *v35;
  int v36;
  LogCategory *v37;
  LogCategory *ucat;
  _QWORD v39[4];
  id v40;
  void *v41;
  _BYTE v42[256];
  _BYTE v43[32];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if ((self->_flags & 0x40) != 0)
  {
    v43[0] = 0;
    v5 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetAddressString_1991[0])((uint64_t)a3, (uint64_t)v43, 32);
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v43);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](self->_btConnectedDevices, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v11;
      if (!v11)
      {
        ucat = self->_ucat;
        if (ucat->var0 <= 30)
        {
          if (ucat->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
              goto LABEL_25;
            ucat = self->_ucat;
          }
          LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _btAccessoryNameChanged:]", 0x1Eu, (uint64_t)"Name state changed: Lookup device failed: %@\n", v12, v13, v14, v15, (uint64_t)v10);
        }
LABEL_25:

        return;
      }
      objc_msgSend(v11, "name");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v42[0] = 0;
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetName[0])((uint64_t)a3, (uint64_t)v42, 256))
      {
        v18 = v17;
LABEL_6:

        v23 = v17;
        goto LABEL_7;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v42);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = v25;
      v26 = v17;
      if (v23 == v26)
        goto LABEL_6;
      v27 = v26;
      if ((v26 != 0) != (v23 == 0))
      {
        v28 = objc_msgSend(v23, "isEqual:", v26);

        if ((v28 & 1) != 0)
        {
LABEL_7:
          v24 = self->_ucat;
          if (v24->var0 <= 10)
          {
            if (v24->var0 == -1)
            {
              if (!_LogCategory_Initialize((uint64_t)v24, 0xAu))
                goto LABEL_24;
              v24 = self->_ucat;
            }
            LogPrintF((uint64_t)v24, (uint64_t)"-[CUBluetoothClient _btAccessoryNameChanged:]", 0xAu, (uint64_t)"Name unchanged: %@\n", v19, v20, v21, v22, (uint64_t)v16);
          }
LABEL_24:

          goto LABEL_25;
        }
      }
      else
      {

      }
      objc_msgSend(v16, "setName:", v23);
      v33 = self->_ucat;
      if (v33->var0 <= 30)
      {
        if (v33->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v33, 0x1Eu))
            goto LABEL_21;
          v33 = self->_ucat;
        }
        LogPrintF((uint64_t)v33, (uint64_t)"-[CUBluetoothClient _btAccessoryNameChanged:]", 0x1Eu, (uint64_t)"Name changed: %@, %@ -> %@\n", v29, v30, v31, v32, (uint64_t)v16);
      }
LABEL_21:
      v34 = _Block_copy(self->_deviceConnectedHandler);
      v35 = v34;
      if (v34)
      {
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __45__CUBluetoothClient__btAccessoryNameChanged___block_invoke;
        v39[3] = &unk_1E25DE600;
        v41 = v34;
        v40 = v16;
        -[CUBluetoothClient _externalInvokeBlock:](self, "_externalInvokeBlock:", v39);

      }
      goto LABEL_24;
    }
    v36 = v5;
    v37 = self->_ucat;
    if (v37->var0 <= 60)
    {
      if (v37->var0 != -1)
      {
LABEL_29:
        LogPrintF((uint64_t)v37, (uint64_t)"-[CUBluetoothClient _btAccessoryNameChanged:]", 0x3Cu, (uint64_t)"### Name state changed: BTDeviceGetAddressString failed: %#m\n", v6, v7, v8, v9, (v36 + 310000));
        return;
      }
      if (_LogCategory_Initialize((uint64_t)v37, 0x3Cu))
      {
        v37 = self->_ucat;
        goto LABEL_29;
      }
    }
  }
}

- (void)_btAccessoryStreamStateChanged:(int)a3 device:(BTDeviceImpl *)a4
{
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  LogCategory *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  LogCategory *v27;
  void *v28;
  void *v29;
  int v30;
  LogCategory *v31;
  LogCategory *ucat;
  _QWORD v33[4];
  id v34;
  void *v35;
  _BYTE v36[32];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if ((self->_flags & 0x40) != 0)
  {
    v4 = *(_QWORD *)&a3;
    v36[0] = 0;
    v6 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetAddressString_1991[0])((uint64_t)a4, (uint64_t)v36, 32);
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v36);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](self->_btConnectedDevices, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v12;
      if (!v12)
      {
        ucat = self->_ucat;
        if (ucat->var0 <= 30)
        {
          if (ucat->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
              goto LABEL_19;
            ucat = self->_ucat;
          }
          LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _btAccessoryStreamStateChanged:device:]", 0x1Eu, (uint64_t)"Stream state changed: Lookup device failed: %@\n", v13, v14, v15, v16, (uint64_t)v11);
        }
        goto LABEL_19;
      }
      if (objc_msgSend(v12, "streamState") == (_DWORD)v4)
      {
        v22 = self->_ucat;
        if (v22->var0 <= 10)
        {
          if (v22->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)v22, 0xAu))
              goto LABEL_19;
            v22 = self->_ucat;
          }
          LogPrintF((uint64_t)v22, (uint64_t)"-[CUBluetoothClient _btAccessoryStreamStateChanged:device:]", 0xAu, (uint64_t)"Stream state unchanged: %@\n", v18, v19, v20, v21, (uint64_t)v17);
        }
LABEL_19:

        return;
      }
      objc_msgSend(v17, "setStreamState:", v4);
      v27 = self->_ucat;
      if (v27->var0 <= 30)
      {
        if (v27->var0 != -1)
          goto LABEL_15;
        if (_LogCategory_Initialize((uint64_t)v27, 0x1Eu))
        {
          v27 = self->_ucat;
LABEL_15:
          LogPrintF((uint64_t)v27, (uint64_t)"-[CUBluetoothClient _btAccessoryStreamStateChanged:device:]", 0x1Eu, (uint64_t)"Stream state changed: %@, %s -> %s\n", v23, v24, v25, v26, (uint64_t)v17);
        }
      }
      v28 = _Block_copy(self->_deviceConnectedHandler);
      v29 = v28;
      if (v28)
      {
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __59__CUBluetoothClient__btAccessoryStreamStateChanged_device___block_invoke;
        v33[3] = &unk_1E25DE600;
        v35 = v28;
        v34 = v17;
        -[CUBluetoothClient _externalInvokeBlock:](self, "_externalInvokeBlock:", v33);

      }
      goto LABEL_19;
    }
    v30 = v6;
    v31 = self->_ucat;
    if (v31->var0 <= 60)
    {
      if (v31->var0 != -1)
      {
LABEL_23:
        LogPrintF((uint64_t)v31, (uint64_t)"-[CUBluetoothClient _btAccessoryStreamStateChanged:device:]", 0x3Cu, (uint64_t)"### Stream state changed: BTDeviceGetAddressString failed: %#m\n", v7, v8, v9, v10, (v30 + 310000));
        return;
      }
      if (_LogCategory_Initialize((uint64_t)v31, 0x3Cu))
      {
        v31 = self->_ucat;
        goto LABEL_23;
      }
    }
  }
}

- (void)_btAccessoryPlacementChanged:(BTAccessoryManagerImpl *)a3 device:(BTDeviceImpl *)a4
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  LogCategory *ucat;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  LogCategory *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  int v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  LogCategory *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  LogCategory *v46;
  void *v47;
  void *v48;
  int v49;
  LogCategory *v50;
  LogCategory *v51;
  _QWORD v52[4];
  id v53;
  void *v54;
  unsigned int v55;
  unsigned int v56;
  int v57;
  _BYTE v58[32];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v57 = 0;
  v7 = softLinkBTAccessoryManagerGetInEarDetectionEnable((uint64_t)a3, (uint64_t)a4, (uint64_t)&v57);
  if (v7)
  {
    v12 = v7;
    ucat = self->_ucat;
    if (ucat->var0 <= 60)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
          goto LABEL_11;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _btAccessoryPlacementChanged:device:]", 0x3Cu, (uint64_t)"### Placement changed: BTAccessoryManagerGetInEarDetectionEnable failed: %#m\n", v8, v9, v10, v11, (v12 + 310000));
    }
LABEL_11:
    v57 = 0;
    goto LABEL_12;
  }
  v55 = 3;
  v56 = 3;
  if (v57)
  {
    v14 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTAccessoryManagerGetInEarStatus[0])((uint64_t)a3, (uint64_t)a4, (uint64_t)&v56, (uint64_t)&v55);
    if (v14)
    {
      v19 = v14;
      v20 = self->_ucat;
      if (v20->var0 <= 60)
      {
        if (v20->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v20, 0x3Cu))
            goto LABEL_12;
          v20 = self->_ucat;
        }
        LogPrintF((uint64_t)v20, (uint64_t)"-[CUBluetoothClient _btAccessoryPlacementChanged:device:]", 0x3Cu, (uint64_t)"### Placement changed: BTAccessoryManagerGetInEarStatus failed: %#m\n", v15, v16, v17, v18, (v19 + 310000));
      }
LABEL_12:
      v55 = 3;
      v56 = 3;
    }
  }
  v58[0] = 0;
  v21 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetAddressString_1991[0])((uint64_t)a4, (uint64_t)v58, 32);
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v58);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_btConnectedDevices, "objectForKeyedSubscript:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v27;
    if (!v27)
    {
      v51 = self->_ucat;
      if (v51->var0 <= 30)
      {
        if (v51->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v51, 0x1Eu))
            goto LABEL_41;
          v51 = self->_ucat;
        }
        LogPrintF((uint64_t)v51, (uint64_t)"-[CUBluetoothClient _btAccessoryPlacementChanged:device:]", 0x1Eu, (uint64_t)"Placement changed: Lookup device failed: %@\n", v28, v29, v30, v31, (uint64_t)v26);
      }
      goto LABEL_41;
    }
    v33 = objc_msgSend(v27, "primaryPlacement");
    if (v57)
    {
      if (v56 > 0xD)
        v34 = 0;
      else
        v34 = dword_18D51E054[v56];
    }
    else
    {
      v34 = 7;
    }
    v35 = objc_msgSend(v32, "secondaryPlacement");
    if (v57)
    {
      if (v55 > 0xD)
        v40 = 0;
      else
        v40 = dword_18D51E054[v55];
    }
    else
    {
      v40 = 7;
    }
    if ((_DWORD)v34 == v33 && (_DWORD)v40 == v35)
    {
      v41 = self->_ucat;
      if (v41->var0 <= 10)
      {
        if (v41->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v41, 0xAu))
            goto LABEL_41;
          v41 = self->_ucat;
        }
        LogPrintF((uint64_t)v41, (uint64_t)"-[CUBluetoothClient _btAccessoryPlacementChanged:device:]", 0xAu, (uint64_t)"Placement unchanged: %@\n", v36, v37, v38, v39, (uint64_t)v32);
      }
LABEL_41:

      return;
    }
    objc_msgSend(v32, "setPrimaryPlacement:", v34);
    objc_msgSend(v32, "setSecondaryPlacement:", v40);
    -[CUBluetoothClient updateStatusFlags](self, "updateStatusFlags");
    v46 = self->_ucat;
    if (v46->var0 <= 30)
    {
      if (v46->var0 != -1)
        goto LABEL_37;
      if (_LogCategory_Initialize((uint64_t)v46, 0x1Eu))
      {
        v46 = self->_ucat;
LABEL_37:
        LogPrintF((uint64_t)v46, (uint64_t)"-[CUBluetoothClient _btAccessoryPlacementChanged:device:]", 0x1Eu, (uint64_t)"Placement changed: %@, P %s -> %s, S %s -> %s\n", v42, v43, v44, v45, (uint64_t)v32);
      }
    }
    v47 = _Block_copy(self->_deviceConnectedHandler);
    v48 = v47;
    if (v47)
    {
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __57__CUBluetoothClient__btAccessoryPlacementChanged_device___block_invoke;
      v52[3] = &unk_1E25DE600;
      v54 = v47;
      v53 = v32;
      -[CUBluetoothClient _externalInvokeBlock:](self, "_externalInvokeBlock:", v52);

    }
    goto LABEL_41;
  }
  v49 = v21;
  v50 = self->_ucat;
  if (v50->var0 <= 60)
  {
    if (v50->var0 != -1)
    {
LABEL_47:
      LogPrintF((uint64_t)v50, (uint64_t)"-[CUBluetoothClient _btAccessoryPlacementChanged:device:]", 0x3Cu, (uint64_t)"### Placement changed: BTDeviceGetAddressString failed: %#m\n", v22, v23, v24, v25, (v49 + 310000));
      return;
    }
    if (_LogCategory_Initialize((uint64_t)v50, 0x3Cu))
    {
      v50 = self->_ucat;
      goto LABEL_47;
    }
  }
}

- (BTDeviceImpl)_btDeviceWithID:(id)a3 error:(id *)a4
{
  id v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BTDeviceImpl *v31;
  uint64_t v33;
  int v34;
  __int16 v35;
  BTDeviceImpl *v36;
  __int128 v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v36 = 0;
  v6 = objc_retainAutorelease(a3);
  v7 = (char *)objc_msgSend(v6, "UTF8String");
  if (!v7)
  {
    if (!a4)
      goto LABEL_21;
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960591, (uint64_t)"Bad device ID UTF-8: '%@'", v8, v9, v10, v11, v12, (uint64_t)v6);
    goto LABEL_24;
  }
  v13 = v7;
  v37 = 0uLL;
  if (!StringToUUIDEx(v7, 0xFFFFFFFFFFFFFFFFLL, 0, 0, &v37, v10, v11, v12))
  {
    v24 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceFromIdentifier_2037[0])((uint64_t)self->_btSession, (uint64_t)&v37, (uint64_t)&v36);
    if (v24 == -310000)
      v30 = 4294960596;
    else
      v30 = (v24 + 310000);
    if (!v24)
      goto LABEL_14;
    if (!a4)
      goto LABEL_21;
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], v30, (uint64_t)"BTDeviceFromIdentifier failed", v25, v26, v27, v28, v29, v33);
LABEL_24:
    v31 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v35 = 0;
  v34 = 0;
  v14 = TextToHardwareAddress(v13, 0xFFFFFFFFFFFFFFFFLL, 6, &v34);
  if ((_DWORD)v14)
  {
    if (a4)
    {
      v21 = v14;
      v22 = (void *)*MEMORY[0x1E0CB2F90];
      v33 = (uint64_t)v13;
      v23 = "Bad device ID format: '%s'";
      goto LABEL_20;
    }
LABEL_21:
    v31 = 0;
    goto LABEL_15;
  }
  v20 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceFromAddress_2040[0])((uint64_t)self->_btSession, (uint64_t)&v34, (uint64_t)&v36);
  if (v20 == -310000)
    v21 = 4294960596;
  else
    v21 = (v20 + 310000);
  if (v20)
  {
    if (a4)
    {
      v22 = (void *)*MEMORY[0x1E0CB2F90];
      v23 = "BTDeviceFromAddress failed";
LABEL_20:
      NSErrorF_safe(v22, v21, (uint64_t)v23, v15, v16, v17, v18, v19, v33);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    goto LABEL_21;
  }
LABEL_14:
  v31 = v36;
LABEL_15:

  return v31;
}

- (void)centralManagerDidUpdateState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  LogCategory *ucat;
  const char *v11;
  void *v12;
  void *v13;

  v4 = objc_msgSend(a3, "state");
  if ((unint64_t)(v4 - 1) > 9)
    v9 = 0;
  else
    v9 = dword_18D51E02C[v4 - 1];
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_12;
      ucat = self->_ucat;
    }
    if (v9 > 0xA)
      v11 = "?";
    else
      v11 = off_1E25DC628[v9];
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient centralManagerDidUpdateState:]", 0x1Eu, (uint64_t)"Bluetooth state changed: central, %s\n", v5, v6, v7, v8, (uint64_t)v11);
  }
LABEL_12:
  self->_bluetoothState = v9;
  v12 = _Block_copy(self->_bluetoothStateChangedHandler);
  v13 = v12;
  if (v12)
  {
    -[CUBluetoothClient _externalInvokeBlock:](self, "_externalInvokeBlock:", v12);
    v12 = v13;
  }
  if (self->_btSessionStarted)
  {
    -[CUBluetoothClient _btEnsureStarted](self, "_btEnsureStarted");
    v12 = v13;
  }

}

- (id)_createCUBluetoothDeviceWithBTDevice:(BTDeviceImpl *)a3
{
  CUBluetoothDevice *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  LogCategory *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  LogCategory *ucat;
  void *v21;
  void *v22;
  unsigned int v24;
  unsigned __int16 v25;
  _BYTE v26[32];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(CUBluetoothDevice);
  v26[0] = 0;
  v6 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetAddressString_1991[0])((uint64_t)a3, (uint64_t)v26, 32);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUBluetoothDevice setAddressString:](v5, "setAddressString:", v13);
    v25 = 0;
    v24 = 0;
    v14 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTDeviceAddressFromString[0])((uint64_t)v26, (uint64_t)&v24);
    if (v14)
    {
      v19 = v14;
      ucat = self->_ucat;
      if (ucat->var0 <= 60)
      {
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
            goto LABEL_13;
          ucat = self->_ucat;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _createCUBluetoothDeviceWithBTDevice:]", 0x3Cu, (uint64_t)"### BTDeviceAddressFromString failed: %#m\n", v15, v16, v17, v18, (v19 + 310000));
      }
    }
    else
    {
      -[CUBluetoothDevice setAddress:](v5, "setAddress:", v24 | ((unint64_t)v25 << 32));
      -[CBCentralManager retrievePeripheralWithAddress:](self->_btCentralManager, "retrievePeripheralWithAddress:", v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUBluetoothDevice setIdentifier:](v5, "setIdentifier:", v22);

    }
LABEL_13:

    goto LABEL_14;
  }
  v11 = v6;
  v12 = self->_ucat;
  if (v12->var0 <= 60)
  {
    if (v12->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v12, 0x3Cu))
        goto LABEL_14;
      v12 = self->_ucat;
    }
    LogPrintF((uint64_t)v12, (uint64_t)"-[CUBluetoothClient _createCUBluetoothDeviceWithBTDevice:]", 0x3Cu, (uint64_t)"### BTDeviceGetAddressString failed: %#m\n", v7, v8, v9, v10, (v11 + 310000));
  }
LABEL_14:
  -[CUBluetoothDevice setPresent:](v5, "setPresent:", 1);
  -[CUBluetoothClient updateDevice:btDevice:](self, "updateDevice:btDevice:", v5, a3);
  return v5;
}

- (void)_handleBluetoothAddressChanged
{
  void *v3;
  void *v4;
  NSData *v5;
  uint64_t v6;
  uint64_t v7;
  LogCategory *ucat;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  NSData *v17;
  void *v18;

  -[CBPeripheralManager advertisingAddress](self->_btPeripheralManager, "advertisingAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  if (objc_msgSend(v4, "length") == 6
    && (v5 = objc_retainAutorelease(v4), v6 = -[NSData bytes](v5, "bytes"),
                                         *(_DWORD *)v6 | *(unsigned __int16 *)(v6 + 4))
    || (v5 = self->_btLocalDeviceAddr, v4, -[NSData length](v5, "length") == 6)
    && (v5 = objc_retainAutorelease(v5), v7 = -[NSData bytes](v5, "bytes"),
                                         *(_DWORD *)v7 | *(unsigned __int16 *)(v7 + 4)))
  {
    if ((-[NSData isEqual:](self->_btAdvertisingAddress, "isEqual:", v5) & 1) == 0)
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
            goto LABEL_14;
          ucat = self->_ucat;
        }
        if (-[NSData length](v5, "length") == 6)
          v13 = -[NSData bytes](objc_retainAutorelease(v5), "bytes");
        else
          v13 = 0;
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _handleBluetoothAddressChanged]", 0x1Eu, (uint64_t)"Bluetooth address changed: %.6a\n", v9, v10, v11, v12, v13);
      }
LABEL_14:
      objc_storeStrong((id *)&self->_btAdvertisingAddress, v5);
      v14 = _Block_copy(self->_bluetoothAddressChangedHandler);
      v15 = v14;
      if (v14)
      {
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __51__CUBluetoothClient__handleBluetoothAddressChanged__block_invoke;
        v16[3] = &unk_1E25DE600;
        v18 = v14;
        v17 = v5;
        -[CUBluetoothClient _externalInvokeBlock:](self, "_externalInvokeBlock:", v16);

      }
    }
  }

}

- (void)_handleConnectedDevicesInit
{
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  LogCategory *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  LogCategory *ucat;
  uint64_t v23;
  uint64_t v24;
  int ConnectedServices_1967;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  LogCategory *v32;
  int v33;
  unsigned int requiredServices;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  LogCategory *v40;
  LogCategory *v41;
  void *v42;
  NSMutableDictionary *btConnectedDevices;
  NSMutableDictionary *v44;
  NSMutableDictionary *v45;
  void *v46;
  void *v47;
  LogCategory *v48;
  uint64_t v49;
  _QWORD v50[4];
  id v51;
  void *v52;
  int v53;
  unint64_t v54;

  if (!self->_btLocalDevice)
    return;
  v54 = 0;
  v3 = 5;
  v4 = 256;
  do
  {
    v5 = malloc_type_malloc(8 * v4, 0x2004093837F09uLL);
    if (!v5)
    {
      ucat = self->_ucat;
      if (ucat->var0 > 90)
        return;
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
          return;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _handleConnectedDevicesInit]", 0x5Au, (uint64_t)"### Malloc connected device array failed (%zu bytes)", v6, v7, v8, v9, v4);
      return;
    }
    v10 = v5;
    v11 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTLocalDeviceGetConnectedDevices[0])((uint64_t)self->_btLocalDevice, (uint64_t)v5, (uint64_t)&v54, v4);
    if (!v11)
    {
      if (!v54)
      {
LABEL_49:
        free(v10);
        return;
      }
      v23 = 0;
      while (1)
      {
        v24 = *((_QWORD *)v10 + v23);
        if (!self->_requiredServices)
        {
LABEL_27:
          -[CUBluetoothClient _createCUBluetoothDeviceWithBTDevice:](self, "_createCUBluetoothDeviceWithBTDevice:", v24);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (v39)
          {
            v40 = self->_ucat;
            if (v40->var0 <= 30)
            {
              if (v40->var0 != -1)
                goto LABEL_30;
              if (_LogCategory_Initialize((uint64_t)v40, 0x1Eu))
              {
                v40 = self->_ucat;
LABEL_30:
                LogPrintF((uint64_t)v40, (uint64_t)"-[CUBluetoothClient _handleConnectedDevicesInit]", 0x1Eu, (uint64_t)"Connected device: %@\n", v35, v36, v37, v38, (uint64_t)v39);
              }
            }
            objc_msgSend(v39, "addressString");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if (v42)
            {
              btConnectedDevices = self->_btConnectedDevices;
              if (!btConnectedDevices)
              {
                v44 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
                v45 = self->_btConnectedDevices;
                self->_btConnectedDevices = v44;

                btConnectedDevices = self->_btConnectedDevices;
              }
              -[NSMutableDictionary setObject:forKeyedSubscript:](btConnectedDevices, "setObject:forKeyedSubscript:", v39, v42);
              -[CUBluetoothClient updateStatusFlags](self, "updateStatusFlags");
              v46 = _Block_copy(self->_deviceConnectedHandler);
              v47 = v46;
              if (v46)
              {
                v50[0] = MEMORY[0x1E0C809B0];
                v50[1] = 3221225472;
                v50[2] = __48__CUBluetoothClient__handleConnectedDevicesInit__block_invoke;
                v50[3] = &unk_1E25DE600;
                v52 = v46;
                v51 = v39;
                -[CUBluetoothClient _externalInvokeBlock:](self, "_externalInvokeBlock:", v50);

              }
            }

          }
          goto LABEL_43;
        }
        v53 = 0;
        ConnectedServices_1967 = softLinkBTDeviceGetConnectedServices_1967(v24, &v53);
        v30 = (ConnectedServices_1967 + 310000);
        if (ConnectedServices_1967 && (_DWORD)v30 != 0)
        {
          v32 = self->_ucat;
          if (v32->var0 <= 90)
          {
            if (v32->var0 != -1)
              goto LABEL_24;
            if (_LogCategory_Initialize((uint64_t)v32, 0x5Au))
              break;
          }
        }
LABEL_26:
        v33 = v53;
        requiredServices = self->_requiredServices;
        if ((requiredServices & ~v53) == 0)
          goto LABEL_27;
        v41 = self->_ucat;
        if (v41->var0 <= 30)
        {
          if (v41->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)v41, 0x1Eu))
              goto LABEL_43;
            v41 = self->_ucat;
            requiredServices = self->_requiredServices;
            v33 = v53;
          }
          LogPrintF((uint64_t)v41, (uint64_t)"-[CUBluetoothClient _handleConnectedDevicesInit]", 0x1Eu, (uint64_t)"BTService connect ignoring due to missing services: %#{flags}\n", v26, v27, v28, v29, requiredServices & ~v33);
        }
LABEL_43:
        if (++v23 >= v54)
          goto LABEL_49;
      }
      v32 = self->_ucat;
LABEL_24:
      LogPrintF((uint64_t)v32, (uint64_t)"-[CUBluetoothClient _handleConnectedDevicesInit]", 0x5Au, (uint64_t)"### BTDeviceGetConnectedServices failed: initial, %#m\n", v26, v27, v28, v29, v30);
      goto LABEL_26;
    }
    v16 = v11;
    v17 = self->_ucat;
    if (v17->var0 > 60)
      goto LABEL_9;
    if (v17->var0 != -1)
      goto LABEL_7;
    if (_LogCategory_Initialize((uint64_t)v17, 0x3Cu))
    {
      v17 = self->_ucat;
LABEL_7:
      LogPrintF((uint64_t)v17, (uint64_t)"-[CUBluetoothClient _handleConnectedDevicesInit]", 0x3Cu, (uint64_t)"### BTLocalDeviceGetPairedDevices failed: %#m\n", v12, v13, v14, v15, (v16 + 310000));
    }
LABEL_9:
    free(v10);
    v4 *= 2;
    --v3;
  }
  while (v3);
  v48 = self->_ucat;
  if (v48->var0 <= 90)
  {
    if (v48->var0 != -1)
      goto LABEL_52;
    if (_LogCategory_Initialize((uint64_t)v48, 0x5Au))
    {
      v48 = self->_ucat;
LABEL_52:
      LogPrintF((uint64_t)v48, (uint64_t)"-[CUBluetoothClient _handleConnectedDevicesInit]", 0x5Au, (uint64_t)"### Get connected devices failed (too many)", v18, v19, v20, v21, v49);
    }
  }
}

- (void)_handleDeviceConnected:(BTDeviceImpl *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  LogCategory *ucat;
  NSMutableDictionary *btConnectedDevices;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  void *v21;

  -[CUBluetoothClient _createCUBluetoothDeviceWithBTDevice:](self, "_createCUBluetoothDeviceWithBTDevice:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addressString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_15;
  if ((self->_flags & 0x100) == 0)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_btConnectedDevices, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_15;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_btConnectedDevices, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  if (v7)
    objc_msgSend(v4, "setStreamState:", objc_msgSend(v7, "streamState"));
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_10;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _handleDeviceConnected:]", 0x1Eu, (uint64_t)"Device connected: %@\n", v8, v9, v10, v11, (uint64_t)v4);
  }
LABEL_10:
  btConnectedDevices = self->_btConnectedDevices;
  if (!btConnectedDevices)
  {
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v16 = self->_btConnectedDevices;
    self->_btConnectedDevices = v15;

    btConnectedDevices = self->_btConnectedDevices;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](btConnectedDevices, "setObject:forKeyedSubscript:", v4, v5);
  -[CUBluetoothClient updateStatusFlags](self, "updateStatusFlags");
  v17 = _Block_copy(self->_deviceConnectedHandler);
  v18 = v17;
  if (v17)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __44__CUBluetoothClient__handleDeviceConnected___block_invoke;
    v19[3] = &unk_1E25DE600;
    v21 = v17;
    v20 = v4;
    -[CUBluetoothClient _externalInvokeBlock:](self, "_externalInvokeBlock:", v19);

  }
LABEL_15:

}

- (void)_handleDeviceDisconnected:(BTDeviceImpl *)a3 reason:(int)a4
{
  uint64_t v4;
  int ConnectedServices_1967;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  LogCategory *ucat;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  LogCategory *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  LogCategory *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  void *v32;
  int v33;
  _BYTE v34[32];
  uint64_t v35;

  v4 = *(_QWORD *)&a4;
  v35 = *MEMORY[0x1E0C80C00];
  v33 = 0;
  ConnectedServices_1967 = softLinkBTDeviceGetConnectedServices_1967(a3, &v33);
  if (ConnectedServices_1967)
  {
    v12 = ConnectedServices_1967;
    ucat = self->_ucat;
    if (ucat->var0 <= 60)
    {
      if (ucat->var0 != -1)
      {
LABEL_4:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _handleDeviceDisconnected:reason:]", 0x3Cu, (uint64_t)"### BTDeviceGetConnectedServices failed: %#m\n", v8, v9, v10, v11, (v12 + 310000));
        goto LABEL_6;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
      {
        ucat = self->_ucat;
        goto LABEL_4;
      }
    }
  }
LABEL_6:
  if (v33)
    return;
  v34[0] = 0;
  v14 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetAddressString_1991[0])((uint64_t)a3, (uint64_t)v34, 32);
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v34);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_btConnectedDevices, "objectForKeyedSubscript:", v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
LABEL_24:

      return;
    }
    v27 = self->_ucat;
    if (v27->var0 <= 30)
    {
      if (v27->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v27, 0x1Eu))
          goto LABEL_19;
        v27 = self->_ucat;
      }
      LogPrintF((uint64_t)v27, (uint64_t)"-[CUBluetoothClient _handleDeviceDisconnected:reason:]", 0x1Eu, (uint64_t)"Device disconnected: %@, reason %#m\n", v22, v23, v24, v25, (uint64_t)v26);
    }
LABEL_19:
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_btConnectedDevices, "setObject:forKeyedSubscript:", 0, v21);
    if (!objc_msgSend(v26, "disconnectReason"))
      objc_msgSend(v26, "setDisconnectReason:", v4);
    -[CUBluetoothClient updateStatusFlags](self, "updateStatusFlags");
    v28 = _Block_copy(self->_deviceDisconnectedHandler);
    v29 = v28;
    if (v28)
    {
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __54__CUBluetoothClient__handleDeviceDisconnected_reason___block_invoke;
      v30[3] = &unk_1E25DE600;
      v32 = v28;
      v31 = v26;
      -[CUBluetoothClient _externalInvokeBlock:](self, "_externalInvokeBlock:", v30);

    }
    goto LABEL_24;
  }
  v19 = v14;
  v20 = self->_ucat;
  if (v20->var0 <= 60)
  {
    if (v20->var0 != -1)
    {
LABEL_11:
      LogPrintF((uint64_t)v20, (uint64_t)"-[CUBluetoothClient _handleDeviceDisconnected:reason:]", 0x3Cu, (uint64_t)"### BTDeviceGetAddressString failed: %#m\n", v15, v16, v17, v18, (v19 + 310000));
      return;
    }
    if (_LogCategory_Initialize((uint64_t)v20, 0x3Cu))
    {
      v20 = self->_ucat;
      goto LABEL_11;
    }
  }
}

- (void)_handleDeviceEvent:(unsigned int)a3 device:(BTDeviceImpl *)a4
{
  void *v7;
  void *v8;
  LogCategory *ucat;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[6];
  unsigned int v15;

  v7 = _Block_copy(self->_deviceEventHandler);
  if (v7)
  {
    -[CUBluetoothClient _createCUBluetoothDeviceWithBTDevice:](self, "_createCUBluetoothDeviceWithBTDevice:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
LABEL_8:

      goto LABEL_9;
    }
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
          goto LABEL_7;
        ucat = self->_ucat;
      }
      BTServiceSpecificEventToString_2021(a3);
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _handleDeviceEvent:device:]", 0x1Eu, (uint64_t)"Device event: %@, event %s\n", v10, v11, v12, v13, (uint64_t)v8);
    }
LABEL_7:
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __47__CUBluetoothClient__handleDeviceEvent_device___block_invoke;
    v14[3] = &unk_1E25DCD20;
    v14[4] = v8;
    v14[5] = v7;
    v15 = a3;
    -[CUBluetoothClient _externalInvokeBlock:](self, "_externalInvokeBlock:", v14);
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_handlePairingStatusChanged
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  LogCategory *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t (**v27)();
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  LogCategory *v35;
  void *v36;
  CUBluetoothDevice *v37;
  CUBluetoothDevice *v38;
  void *v39;
  void *v40;
  NSMutableDictionary *btPairedDevices;
  NSMutableDictionary *v42;
  NSMutableDictionary *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  LogCategory *ucat;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  LogCategory *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  LogCategory *v71;
  uint64_t v72;
  unint64_t v73;
  _QWORD v74[4];
  id v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[4];
  CUBluetoothDevice *v82;
  void *v83;
  unsigned int v84;
  unsigned __int16 v85;
  unint64_t v86;
  _BYTE v87[128];
  _BYTE v88[32];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v86 = 0;
  v3 = 256;
  v4 = 5;
  do
  {
    v5 = malloc_type_malloc(8 * v3, 0x2004093837F09uLL);
    if (!v5)
    {
      NSErrorWithOSStatusF(4294960568, (uint64_t)"Malloc paired device array failed (%zu bytes)", v6, v7, v8, v9, v10, v11, v3);
      goto LABEL_57;
    }
    v12 = v5;
    v13 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTLocalDeviceGetPairedDevices[0])((uint64_t)self->_btLocalDevice, (uint64_t)v5, (uint64_t)&v86, v3);
    if (!v13)
    {
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_btPairedDevices, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_1990);
      if (v86)
      {
        v26 = 0;
        v27 = getFBSDisplayLayoutElementControlCenterIdentifier;
        do
        {
          v28 = v12[v26];
          v88[0] = 0;
          v29 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v27[300])(v28, (uint64_t)v88, 32);
          if (!v29)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v88);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKeyedSubscript:](self->_btPairedDevices, "objectForKeyedSubscript:", v36);
            v37 = (CUBluetoothDevice *)objc_claimAutoreleasedReturnValue();
            if (v37)
            {
              v38 = v37;
              -[CUBluetoothDevice setPresent:](v37, "setPresent:", 1);
LABEL_35:

              goto LABEL_36;
            }
            v38 = objc_alloc_init(CUBluetoothDevice);
            -[CBCentralManager retrievePeripheralWithAddress:](self->_btCentralManager, "retrievePeripheralWithAddress:", v36);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "identifier");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[CUBluetoothDevice setIdentifier:](v38, "setIdentifier:", v40);

            v85 = 0;
            v84 = 0;
            if (!((unsigned int (*)(uint64_t, uint64_t))softLinkBTDeviceAddressFromString[0])((uint64_t)v88, (uint64_t)&v84))
            {
              v73 = v73 & 0xFFFF000000000000 | v84 | ((unint64_t)v85 << 32);
              -[CUBluetoothDevice setAddress:](v38, "setAddress:");
            }
            -[CUBluetoothDevice setAddressString:](v38, "setAddressString:", v36);
            -[CUBluetoothDevice setPresent:](v38, "setPresent:", 1);
            -[CUBluetoothClient updateDevice:btDevice:](self, "updateDevice:btDevice:", v38, v28);
            btPairedDevices = self->_btPairedDevices;
            if (!btPairedDevices)
            {
              v42 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
              v43 = self->_btPairedDevices;
              self->_btPairedDevices = v42;

              btPairedDevices = self->_btPairedDevices;
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](btPairedDevices, "setObject:forKeyedSubscript:", v38, v36);
            ucat = self->_ucat;
            if (ucat->var0 <= 30)
            {
              if (ucat->var0 != -1)
                goto LABEL_25;
              if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
              {
                ucat = self->_ucat;
LABEL_25:
                LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient _handlePairingStatusChanged]", 0x1Eu, (uint64_t)"Found %@\n", v44, v45, v46, v47, (uint64_t)v38);
              }
            }
            -[CUBluetoothClient updateStatusFlags](self, "updateStatusFlags");
            if (self->_btPairedDevicesInitialized || (self->_flags & 1) != 0)
            {
              v49 = _Block_copy(self->_devicePairedHandler);
              v50 = v49;
              if (v49)
              {
                v81[0] = MEMORY[0x1E0C809B0];
                v81[1] = 3221225472;
                v81[2] = __48__CUBluetoothClient__handlePairingStatusChanged__block_invoke_2;
                v81[3] = &unk_1E25DE600;
                v83 = v49;
                v82 = v38;
                -[CUBluetoothClient _externalInvokeBlock:](self, "_externalInvokeBlock:", v81);

              }
            }

            v27 = getFBSDisplayLayoutElementControlCenterIdentifier;
            goto LABEL_35;
          }
          v34 = v29;
          v35 = self->_ucat;
          if (v35->var0 <= 60)
          {
            if (v35->var0 == -1)
            {
              if (!_LogCategory_Initialize((uint64_t)v35, 0x3Cu))
                goto LABEL_36;
              v35 = self->_ucat;
            }
            LogPrintF((uint64_t)v35, (uint64_t)"-[CUBluetoothClient _handlePairingStatusChanged]", 0x3Cu, (uint64_t)"### BTDeviceGetAddressString failed: %#m\n", v30, v31, v32, v33, (v34 + 310000));
          }
LABEL_36:
          ++v26;
        }
        while (v26 < v86);
      }
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      -[NSMutableDictionary allKeys](self->_btPairedDevices, "allKeys");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
      if (!v52)
        goto LABEL_56;
      v53 = v52;
      v54 = *(_QWORD *)v78;
LABEL_41:
      v55 = 0;
      while (1)
      {
        if (*(_QWORD *)v78 != v54)
          objc_enumerationMutation(v51);
        v56 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * v55);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_btPairedDevices, "objectForKeyedSubscript:", v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v57, "present") & 1) != 0)
          goto LABEL_52;
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_btPairedDevices, "setObject:forKeyedSubscript:", 0, v56);
        v62 = self->_ucat;
        if (v62->var0 <= 30)
        {
          if (v62->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)v62, 0x1Eu))
              goto LABEL_49;
            v62 = self->_ucat;
          }
          LogPrintF((uint64_t)v62, (uint64_t)"-[CUBluetoothClient _handlePairingStatusChanged]", 0x1Eu, (uint64_t)"Lost %@\n", v58, v59, v60, v61, (uint64_t)v57);
        }
LABEL_49:
        -[CUBluetoothClient updateStatusFlags](self, "updateStatusFlags");
        v63 = _Block_copy(self->_deviceUnpairedHandler);
        v64 = v63;
        if (v63)
        {
          v74[0] = MEMORY[0x1E0C809B0];
          v74[1] = 3221225472;
          v74[2] = __48__CUBluetoothClient__handlePairingStatusChanged__block_invoke_3;
          v74[3] = &unk_1E25DE600;
          v76 = v63;
          v75 = v57;
          -[CUBluetoothClient _externalInvokeBlock:](self, "_externalInvokeBlock:", v74);

        }
LABEL_52:

        if (v53 == ++v55)
        {
          v65 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
          v53 = v65;
          if (!v65)
          {
LABEL_56:

            self->_btPairedDevicesInitialized = 1;
            free(v12);
            v66 = 0;
            goto LABEL_62;
          }
          goto LABEL_41;
        }
      }
    }
    v18 = (v13 + 310000);
    v19 = self->_ucat;
    if (v19->var0 > 60)
      goto LABEL_8;
    if (v19->var0 != -1)
      goto LABEL_6;
    if (_LogCategory_Initialize((uint64_t)v19, 0x3Cu))
    {
      v19 = self->_ucat;
LABEL_6:
      LogPrintF((uint64_t)v19, (uint64_t)"-[CUBluetoothClient _handlePairingStatusChanged]", 0x3Cu, (uint64_t)"### BTLocalDeviceGetPairedDevices failed: %#m\n", v14, v15, v16, v17, v18);
    }
LABEL_8:
    free(v12);
    v3 *= 2;
    --v4;
  }
  while (v4);
  NSErrorWithOSStatusF(v18, (uint64_t)"Get paired devices failed", v20, v21, v22, v23, v24, v25, v72);
LABEL_57:
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (v66)
  {
    v71 = self->_ucat;
    if (v71->var0 <= 60)
    {
      if (v71->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v71, 0x3Cu))
          goto LABEL_62;
        v71 = self->_ucat;
      }
      LogPrintF((uint64_t)v71, (uint64_t)"-[CUBluetoothClient _handlePairingStatusChanged]", 0x3Cu, (uint64_t)"### Handle pairing status change failed: %{error}\n", v67, v68, v69, v70, (uint64_t)v66);
    }
  }
LABEL_62:

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  LogCategory *ucat;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("advertisingAddress"), a4, a5, a6))
  {
    -[CBPeripheralManager advertisingAddress](self->_btPeripheralManager, "advertisingAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v7, "copy");

    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_4:
        if (objc_msgSend(v14, "length") == 6)
          v13 = objc_msgSend(objc_retainAutorelease(v14), "bytes");
        else
          v13 = 0;
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient observeValueForKeyPath:ofObject:change:context:]", 0x1Eu, (uint64_t)"Bluetooth advertising address: %.6a\n", v9, v10, v11, v12, v13);
        goto LABEL_11;
      }
      if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_4;
      }
    }
LABEL_11:
    -[CUBluetoothClient _handleBluetoothAddressChanged](self, "_handleBluetoothAddressChanged");

  }
}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  id v4;
  LogCategory *ucat;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  _BOOL4 v12;
  id v13;

  v4 = a3;
  ucat = self->_ucat;
  v13 = v4;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      v6 = objc_msgSend(v4, "state");
      if (v6 > 0xA)
        v11 = "?";
      else
        v11 = off_1E25DC628[v6];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient peripheralManagerDidUpdateState:]", 0x1Eu, (uint64_t)"Bluetooth state changed: peripheral, %s\n", v7, v8, v9, v10, (uint64_t)v11);
      v4 = v13;
      goto LABEL_9;
    }
    v12 = _LogCategory_Initialize((uint64_t)ucat, 0x1Eu);
    v4 = v13;
    if (v12)
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_9:
  if (self->_btSessionStarted)
  {
    -[CUBluetoothClient _btEnsureStarted](self, "_btEnsureStarted");
    v4 = v13;
  }

}

- (void)updateDevice:(id)a3 btDevice:(BTDeviceImpl *)a4
{
  id v6;
  uint64_t *p_btAccessoryManager;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int ConnectedServices_1967;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  LogCategory *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  LogCategory *ucat;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  LogCategory *v40;
  int v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  LogCategory *v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  LogCategory *v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  LogCategory *v64;
  void *v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  LogCategory *v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  LogCategory *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  LogCategory *v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  LogCategory *v99;
  int v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  LogCategory *v106;
  unsigned int v107;
  unsigned int v108;
  uint64_t v109;
  int v110;
  unsigned int v111;
  unsigned int v112;
  int v113;
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  char v119;
  char v120;
  _QWORD v121[33];

  v121[32] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v113 = 0;
  p_btAccessoryManager = (uint64_t *)&self->_btAccessoryManager;
  if (!self->_btAccessoryManager)
  {
    v26 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTAccessoryManagerGetDefault[0])((uint64_t)self->_btSession, (uint64_t)&self->_btAccessoryManager);
    if (v26)
    {
      v31 = v26;
      ucat = self->_ucat;
      if (ucat->var0 <= 60)
      {
        if (ucat->var0 != -1)
        {
LABEL_23:
          LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient updateDevice:btDevice:]", 0x3Cu, (uint64_t)"### BTAccessoryManagerGetDefault failed: %#m\n", v27, v28, v29, v30, (v31 + 310000));
          goto LABEL_2;
        }
        if (_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
        {
          ucat = self->_ucat;
          goto LABEL_23;
        }
      }
    }
  }
LABEL_2:
  v8 = objc_msgSend(v6, "address");
  if (!softLinkBTAccessoryManagerReadDeviceVersionInfo(v8, (int)&v120, 32, (int)&v119, 128, (int)v118, 128, (int)v117, 128, (uint64_t)v116, 128, (uint64_t)v115, 128, (uint64_t)v114, 128))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v118);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setManufacturer:", v9);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v117);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setModelNumber:", v10);

  }
  if (*p_btAccessoryManager)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 8000);
    v121[0] = 0;
    v12 = *p_btAccessoryManager;
    v13 = objc_retainAutorelease(v11);
    v14 = objc_msgSend(v13, "mutableBytes");
    v15 = objc_msgSend(v13, "length");
    if (!((unsigned int (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTAccessoryManagerGetAccessoryInfo[0])(v12, (uint64_t)a4, v14, (uint64_t)v121, v15)&& v121[0])
    {
      objc_msgSend(v13, "setLength:");
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v13, 0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("AACPVersionInfo"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)objc_msgSend(v17, "count") >= 0xB)
        {
          objc_msgSend(v17, "objectAtIndexedSubscript:", 10);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v6, "setFirmwareVersion:", v18);

        }
      }

    }
  }
  v112 = 0;
  ConnectedServices_1967 = softLinkBTDeviceGetConnectedServices_1967(a4, &v112);
  if (ConnectedServices_1967)
  {
    v24 = ConnectedServices_1967;
    v25 = self->_ucat;
    if (v25->var0 > 60)
      goto LABEL_26;
    if (v25->var0 != -1)
      goto LABEL_19;
    if (_LogCategory_Initialize((uint64_t)v25, 0x3Cu))
    {
      v25 = self->_ucat;
LABEL_19:
      LogPrintF((uint64_t)v25, (uint64_t)"-[CUBluetoothClient updateDevice:btDevice:]", 0x3Cu, (uint64_t)"### BTDeviceGetConnectedServices failed: %#m\n", v20, v21, v22, v23, (v24 + 310000));
    }
  }
  else
  {
    objc_msgSend(v6, "setConnectedServices:", v112);
  }
LABEL_26:
  v33 = *p_btAccessoryManager;
  if (!*p_btAccessoryManager)
    goto LABEL_33;
  LODWORD(v121[0]) = 0;
  v34 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTAccessoryManagerGetDeviceColor[0])(v33, (uint64_t)a4, (uint64_t)v121);
  if (v34)
  {
    v39 = v34;
    v40 = self->_ucat;
    if (v40->var0 > 60)
      goto LABEL_33;
    if (v40->var0 != -1)
      goto LABEL_30;
    if (_LogCategory_Initialize((uint64_t)v40, 0x3Cu))
    {
      v40 = self->_ucat;
LABEL_30:
      LogPrintF((uint64_t)v40, (uint64_t)"-[CUBluetoothClient updateDevice:btDevice:]", 0x3Cu, (uint64_t)"### BTAccessoryManagerGetDeviceColor failed: %#m\n", v35, v36, v37, v38, (v39 + 310000));
    }
  }
  else
  {
    objc_msgSend(v6, "setColorCode:", LODWORD(v121[0]));
  }
LABEL_33:
  v111 = 0;
  ((void (*)(uint64_t, uint64_t))softLinkBTDeviceGetDeviceType[0])((uint64_t)a4, (uint64_t)&v111);
  objc_msgSend(v6, "setDeviceType:", v111);
  if (v111 == 17 || v111 == 22)
    v42 = 4;
  else
    v42 = 0;
  v43 = *p_btAccessoryManager;
  if (*p_btAccessoryManager)
  {
    v113 = 0;
    v44 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTAccessoryManagerGetFeatureCapability[0])(v43, (uint64_t)a4, 1, (uint64_t)&v113);
    if (v44)
    {
      v49 = v44;
      v50 = self->_ucat;
      if (v50->var0 > 60)
        goto LABEL_47;
      if (v50->var0 != -1)
        goto LABEL_43;
      if (_LogCategory_Initialize((uint64_t)v50, 0x3Cu))
      {
        v50 = self->_ucat;
LABEL_43:
        LogPrintF((uint64_t)v50, (uint64_t)"-[CUBluetoothClient updateDevice:btDevice:]", 0x3Cu, (uint64_t)"### BTAccessoryManagerGetFeatureCapability in-ear detect failed: %#m\n", v45, v46, v47, v48, (v49 + 310000));
      }
    }
    else if (v113)
    {
      v42 |= 0x80u;
    }
  }
LABEL_47:
  v113 = 0;
  v51 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTDeviceGetMagicPairingStatus[0])((uint64_t)a4, (uint64_t)&v113);
  if (v51)
  {
    v56 = v51;
    v57 = self->_ucat;
    if (v57->var0 > 60)
      goto LABEL_53;
    if (v57->var0 != -1)
      goto LABEL_50;
    if (_LogCategory_Initialize((uint64_t)v57, 0x3Cu))
    {
      v57 = self->_ucat;
LABEL_50:
      LogPrintF((uint64_t)v57, (uint64_t)"-[CUBluetoothClient updateDevice:btDevice:]", 0x3Cu, (uint64_t)"### BTDeviceGetMagicPairingStatus failed: %#m\n", v52, v53, v54, v55, (v56 + 310000));
    }
  }
  else
  {
    objc_msgSend(v6, "setMagicPaired:", v113 != 0);
  }
LABEL_53:
  LOBYTE(v121[0]) = 0;
  v58 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetName[0])((uint64_t)a4, (uint64_t)v121, 256);
  if (v58)
  {
    v63 = v58;
    v64 = self->_ucat;
    if (v64->var0 > 60)
      goto LABEL_59;
    if (v64->var0 != -1)
      goto LABEL_56;
    if (_LogCategory_Initialize((uint64_t)v64, 0x3Cu))
    {
      v64 = self->_ucat;
LABEL_56:
      LogPrintF((uint64_t)v64, (uint64_t)"-[CUBluetoothClient updateDevice:btDevice:]", 0x3Cu, (uint64_t)"### BTDeviceGetName failed: %#m\n", v59, v60, v61, v62, (v63 + 310000));
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v121);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setName:", v65);

  }
LABEL_59:
  v66 = *p_btAccessoryManager;
  if (!*p_btAccessoryManager)
    goto LABEL_82;
  v110 = 0;
  v67 = softLinkBTAccessoryManagerGetInEarDetectionEnable(v66, (uint64_t)a4, (uint64_t)&v110);
  if (v67)
  {
    v72 = v67;
    v73 = self->_ucat;
    if (v73->var0 <= 60)
    {
      if (v73->var0 != -1)
      {
LABEL_63:
        LogPrintF((uint64_t)v73, (uint64_t)"-[CUBluetoothClient updateDevice:btDevice:]", 0x3Cu, (uint64_t)"### BTAccessoryManagerGetInEarDetectionEnable failed: %#m\n", v68, v69, v70, v71, (v72 + 310000));
        goto LABEL_65;
      }
      if (_LogCategory_Initialize((uint64_t)v73, 0x3Cu))
      {
        v73 = self->_ucat;
        goto LABEL_63;
      }
    }
  }
LABEL_65:
  v109 = 0x300000003;
  if (!v110)
  {
LABEL_74:
    v81 = 7;
    goto LABEL_76;
  }
  v74 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTAccessoryManagerGetInEarStatus[0])(*p_btAccessoryManager, (uint64_t)a4, (uint64_t)&v109 + 4, (uint64_t)&v109);
  if (v74)
  {
    v79 = v74;
    v80 = self->_ucat;
    if (v80->var0 <= 60)
    {
      if (v80->var0 != -1)
      {
LABEL_69:
        LogPrintF((uint64_t)v80, (uint64_t)"-[CUBluetoothClient updateDevice:btDevice:]", 0x3Cu, (uint64_t)"### BTAccessoryManagerGetInEarStatus failed: %#m\n", v75, v76, v77, v78, (v79 + 310000));
        goto LABEL_71;
      }
      if (_LogCategory_Initialize((uint64_t)v80, 0x3Cu))
      {
        v80 = self->_ucat;
        goto LABEL_69;
      }
    }
  }
LABEL_71:
  if (!v110)
    goto LABEL_74;
  if (HIDWORD(v109) > 0xD)
    v81 = 0;
  else
    v81 = dword_18D51E054[HIDWORD(v109)];
LABEL_76:
  objc_msgSend(v6, "setPrimaryPlacement:", v81);
  if (v110)
  {
    if (v109 > 0xD)
      v82 = 0;
    else
      v82 = dword_18D51E054[v109];
  }
  else
  {
    v82 = 7;
  }
  objc_msgSend(v6, "setSecondaryPlacement:", v82);
LABEL_82:
  v110 = 0;
  v109 = 0;
  v108 = 0;
  if (!((unsigned int (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetDeviceId[0])((uint64_t)a4, (uint64_t)&v110, (uint64_t)&v109 + 4, (uint64_t)&v109, (uint64_t)&v108))
  {
    objc_msgSend(v6, "setProductIdentifier:", v109);
    objc_msgSend(v6, "setVersionID:", v108);
  }
  v83 = *p_btAccessoryManager;
  if (*p_btAccessoryManager)
  {
    v113 = 0;
    v84 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTAccessoryManagerGetFeatureCapability[0])(v83, (uint64_t)a4, 26, (uint64_t)&v113);
    if (v84)
    {
      v89 = v84;
      v90 = self->_ucat;
      if (v90->var0 <= 60)
      {
        if (v90->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v90, 0x3Cu))
            goto LABEL_92;
          v90 = self->_ucat;
        }
        LogPrintF((uint64_t)v90, (uint64_t)"-[CUBluetoothClient updateDevice:btDevice:]", 0x3Cu, (uint64_t)"### BTAccessoryManagerGetFeatureCapability software volume failed: %#m\n", v85, v86, v87, v88, (v89 + 310000));
      }
LABEL_92:
      v113 = 0;
      goto LABEL_93;
    }
    if (v113)
      v42 |= 8u;
  }
LABEL_93:
  v107 = 0;
  if (!((unsigned int (*)(uint64_t, uint64_t))softLinkBTDeviceGetSupportedServices[0])((uint64_t)a4, (uint64_t)&v107))objc_msgSend(v6, "setSupportsAACPService:", (v107 >> 19) & 1);
  if (objc_msgSend(v6, "supportsAACPService"))
    LODWORD(v91) = v42 | 2;
  else
    LODWORD(v91) = v42;
  v113 = 0;
  ((void (*)(uint64_t, uint64_t))softLinkBTDeviceIsTemporaryPaired[0])((uint64_t)a4, (uint64_t)&v113);
  if (v113)
    v91 = v91 | 0x10;
  else
    v91 = v91;
  v92 = *p_btAccessoryManager;
  if (*p_btAccessoryManager)
  {
    v113 = 0;
    v93 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTAccessoryManagerGetFeatureCapability[0])(v92, (uint64_t)a4, 32, (uint64_t)&v113);
    if (v93)
    {
      v98 = v93;
      v99 = self->_ucat;
      if (v99->var0 > 60)
        goto LABEL_109;
      if (v99->var0 != -1)
        goto LABEL_105;
      if (_LogCategory_Initialize((uint64_t)v99, 0x3Cu))
      {
        v99 = self->_ucat;
LABEL_105:
        LogPrintF((uint64_t)v99, (uint64_t)"-[CUBluetoothClient updateDevice:btDevice:]", 0x3Cu, (uint64_t)"### BTAccessoryManagerGetFeatureCapability tipi failed: %#m\n", v94, v95, v96, v97, (v98 + 310000));
      }
    }
    else if (v113)
    {
      v91 = v91 | 0x20;
    }
  }
LABEL_109:
  v113 = 0;
  if (MobileBluetoothLibrary_sOnce_1977 != -1)
    dispatch_once(&MobileBluetoothLibrary_sOnce_1977, &__block_literal_global_623);
  if (MobileBluetoothLibrary_sLib_1978
    && dlsym((void *)MobileBluetoothLibrary_sLib_1978, "BTDeviceIsWirelessSplitterSupported"))
  {
    v100 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTDeviceIsWirelessSplitterSupported[0])((uint64_t)a4, (uint64_t)&v113);
    if (v100)
    {
      v105 = v100;
      v106 = self->_ucat;
      if (v106->var0 <= 60)
      {
        if (v106->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v106, 0x3Cu))
            goto LABEL_119;
          v106 = self->_ucat;
        }
        LogPrintF((uint64_t)v106, (uint64_t)"-[CUBluetoothClient updateDevice:btDevice:]", 0x3Cu, (uint64_t)"### BTDeviceIsWS failed: %#m\n", v101, v102, v103, v104, (v105 + 310000));
      }
    }
    else
    {
      v91 = v91 | (v113 != 0);
    }
  }
LABEL_119:
  objc_msgSend(v6, "setDeviceFlags:", v91);

}

- (void)updateStatusFlags
{
  uint64_t statusFlags;
  uint64_t v4;
  NSMutableDictionary *btConnectedDevices;
  NSMutableDictionary *btPairedDevices;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  LogCategory *ucat;
  _QWORD v12[5];
  _QWORD v13[5];

  statusFlags = self->_statusFlags;
  self->_statusFlags = 0;
  v4 = MEMORY[0x1E0C809B0];
  btConnectedDevices = self->_btConnectedDevices;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __38__CUBluetoothClient_updateStatusFlags__block_invoke;
  v13[3] = &unk_1E25DC470;
  v13[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](btConnectedDevices, "enumerateKeysAndObjectsUsingBlock:", v13);
  btPairedDevices = self->_btPairedDevices;
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __38__CUBluetoothClient_updateStatusFlags__block_invoke_2;
  v12[3] = &unk_1E25DC470;
  v12[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](btPairedDevices, "enumerateKeysAndObjectsUsingBlock:", v12);
  if (self->_statusFlags != (_DWORD)statusFlags)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_4:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBluetoothClient updateStatusFlags]", 0x1Eu, (uint64_t)"Status flags changed: %#{flags} -> %#{flags}\n", v7, v8, v9, v10, statusFlags);
        return;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_4;
      }
    }
  }
}

- (int)bluetoothState
{
  return self->_bluetoothState;
}

- (void)setBluetoothState:(int)a3
{
  self->_bluetoothState = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (NSString)label
{
  return self->_label;
}

- (unsigned)requiredServices
{
  return self->_requiredServices;
}

- (void)setRequiredServices:(unsigned int)a3
{
  self->_requiredServices = a3;
}

- (void)setStatusFlags:(unsigned int)a3
{
  self->_statusFlags = a3;
}

- (id)bluetoothAddressChangedHandler
{
  return self->_bluetoothAddressChangedHandler;
}

- (void)setBluetoothAddressChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (id)bluetoothStateChangedHandler
{
  return self->_bluetoothStateChangedHandler;
}

- (void)setBluetoothStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (id)deviceConnectedHandler
{
  return self->_deviceConnectedHandler;
}

- (void)setDeviceConnectedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (id)deviceDisconnectedHandler
{
  return self->_deviceDisconnectedHandler;
}

- (void)setDeviceDisconnectedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (id)deviceEventHandler
{
  return self->_deviceEventHandler;
}

- (void)setDeviceEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (id)devicePairedHandler
{
  return self->_devicePairedHandler;
}

- (void)setDevicePairedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (id)deviceUnpairedHandler
{
  return self->_deviceUnpairedHandler;
}

- (void)setDeviceUnpairedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_deviceUnpairedHandler, 0);
  objc_storeStrong(&self->_devicePairedHandler, 0);
  objc_storeStrong(&self->_deviceEventHandler, 0);
  objc_storeStrong(&self->_deviceDisconnectedHandler, 0);
  objc_storeStrong(&self->_deviceConnectedHandler, 0);
  objc_storeStrong(&self->_bluetoothStateChangedHandler, 0);
  objc_storeStrong(&self->_bluetoothAddressChangedHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_findDeviceRequests, 0);
  objc_storeStrong((id *)&self->_btPairedDevices, 0);
  objc_storeStrong((id *)&self->_btConnectedDevices, 0);
  objc_storeStrong((id *)&self->_btLocalDeviceAddr, 0);
  objc_storeStrong((id *)&self->_btPeripheralManager, 0);
  objc_storeStrong((id *)&self->_btCentralManager, 0);
  objc_storeStrong((id *)&self->_btAdvertisingAddress, 0);
}

void __38__CUBluetoothClient_updateStatusFlags__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  char v4;
  int v5;
  int v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "deviceFlags");
  if ((v4 & 1) != 0)
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 244) |= 8u;
  if ((v4 & 4) != 0)
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 244) |= 0x10u;
  if (objc_msgSend(v7, "supportsAACPService"))
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 244) |= 4u;
  v5 = objc_msgSend(v7, "primaryPlacement");
  if (v5 == 1 || v5 == 4 || (v6 = objc_msgSend(v7, "secondaryPlacement"), v6 == 4) || v6 == 1)
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 244) |= 1u;

}

uint64_t __38__CUBluetoothClient_updateStatusFlags__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "supportsAACPService");
  if ((_DWORD)result)
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 244) |= 2u;
  return result;
}

uint64_t __48__CUBluetoothClient__handlePairingStatusChanged__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __48__CUBluetoothClient__handlePairingStatusChanged__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __48__CUBluetoothClient__handlePairingStatusChanged__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setPresent:", 0);
}

uint64_t __47__CUBluetoothClient__handleDeviceEvent_device___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48));
}

uint64_t __54__CUBluetoothClient__handleDeviceDisconnected_reason___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __44__CUBluetoothClient__handleDeviceConnected___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __48__CUBluetoothClient__handleConnectedDevicesInit__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __51__CUBluetoothClient__handleBluetoothAddressChanged__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __57__CUBluetoothClient__btAccessoryPlacementChanged_device___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __59__CUBluetoothClient__btAccessoryStreamStateChanged_device___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __45__CUBluetoothClient__btAccessoryNameChanged___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __37__CUBluetoothClient__btEnsureStopped__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend(v4, "setDisconnectReason:", 4294896145);
  v9 = *(int **)(*(_QWORD *)(a1 + 32) + 224);
  if (*v9 <= 30)
  {
    if (*v9 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v9, (uint64_t)"-[CUBluetoothClient _btEnsureStopped]_block_invoke", 0x1Eu, (uint64_t)"Device disconnected: %@\n", v5, v6, v7, v8, (uint64_t)v4);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)v9, 0x1Eu))
    {
      v9 = *(int **)(*(_QWORD *)(a1 + 32) + 224);
      goto LABEL_3;
    }
  }
LABEL_5:
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
  {
    v11 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __37__CUBluetoothClient__btEnsureStopped__block_invoke_2;
    v12[3] = &unk_1E25DE600;
    v14 = v10;
    v13 = v4;
    objc_msgSend(v11, "_externalInvokeBlock:", v12);

  }
}

uint64_t __37__CUBluetoothClient__btEnsureStopped__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __61__CUBluetoothClient_setDeviceFlags_mask_deviceID_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setDeviceFlags:mask:deviceID:completion:", *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __52__CUBluetoothClient_findDeviceByAddress_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_findDeviceByAddress:completion:", *(unsigned int *)(a1 + 48) | ((unint64_t)*(unsigned __int16 *)(a1 + 52) << 32), *(_QWORD *)(a1 + 40));
}

uint64_t __31__CUBluetoothClient_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int *v11;
  _BOOL4 v12;
  uint64_t v13;

  v8 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v8 + 216))
  {
    v9 = result;
    *(_BYTE *)(v8 + 216) = 1;
    v10 = *(_QWORD **)(result + 32);
    v11 = (int *)v10[28];
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
        v10 = *(_QWORD **)(v9 + 32);
        if (!v12)
          goto LABEL_6;
        v11 = (int *)v10[28];
      }
      LogPrintF((uint64_t)v11, (uint64_t)"-[CUBluetoothClient invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidating\n", a5, a6, a7, a8, v13);
      v10 = *(_QWORD **)(v9 + 32);
    }
LABEL_6:
    objc_msgSend(v10, "_processFindDeviceRequests");
    objc_msgSend(*(id *)(v9 + 32), "_btEnsureStopped");
    return objc_msgSend(*(id *)(v9 + 32), "_invalidated");
  }
  return result;
}

uint64_t __29__CUBluetoothClient_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int *v10;
  _BOOL4 v11;
  int v12;
  int v13;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(int **)(v9 + 224);
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUBluetoothClient activate]_block_invoke", 0x1Eu, (uint64_t)"Activate: %#{flags}, RS %#{flags}\n", a5, a6, a7, a8, *(unsigned int *)(v9 + 236));
      v9 = *(_QWORD *)(a1 + 32);
      goto LABEL_5;
    }
    v11 = _LogCategory_Initialize(*(_QWORD *)(v9 + 224), 0x1Eu);
    v9 = *(_QWORD *)(a1 + 32);
    if (v11)
    {
      v10 = *(int **)(v9 + 224);
      goto LABEL_3;
    }
  }
LABEL_5:
  if (*(_QWORD *)(v9 + 264))
  {
    *(_BYTE *)(v9 + 40) = 1;
    v9 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v9 + 272))
  {
    *(_BYTE *)(v9 + 24) = 1;
    v9 = *(_QWORD *)(a1 + 32);
  }
  v12 = *(_DWORD *)(v9 + 236);
  if ((v12 & 0x18) != 0 || *(_QWORD *)(v9 + 280) || *(_QWORD *)(v9 + 288))
  {
    *(_BYTE *)(v9 + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 160) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 106) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = 1;
    v9 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v9 + 304) || *(_QWORD *)(v9 + 312))
  {
    *(_BYTE *)(v9 + 160) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 106) = 1;
    v9 = *(_QWORD *)(a1 + 32);
  }
  v13 = *(_DWORD *)(v9 + 236);
  if ((v13 & 2) != 0)
  {
    *(_BYTE *)(v9 + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 106) = 1;
    v9 = *(_QWORD *)(a1 + 32);
    v13 = *(_DWORD *)(v9 + 236);
    if ((v13 & 4) == 0)
    {
LABEL_18:
      if ((v13 & 0x40) == 0)
        goto LABEL_19;
LABEL_24:
      *(_BYTE *)(v9 + 80) = 1;
      v9 = *(_QWORD *)(a1 + 32);
      if ((v12 & 8) == 0)
        return objc_msgSend((id)v9, "_btEnsureStarted");
      goto LABEL_20;
    }
  }
  else if ((v13 & 4) == 0)
  {
    goto LABEL_18;
  }
  *(_BYTE *)(v9 + 24) = 1;
  v9 = *(_QWORD *)(a1 + 32);
  if ((*(_DWORD *)(v9 + 236) & 0x40) != 0)
    goto LABEL_24;
LABEL_19:
  if ((v12 & 8) != 0)
  {
LABEL_20:
    *(_BYTE *)(v9 + 80) = 1;
    v9 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend((id)v9, "_btEnsureStarted");
}

@end
