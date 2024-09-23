@implementation CUBLEAdvertiser

- (CUBLEAdvertiser)init
{
  CUBLEAdvertiser *v2;
  CUBLEAdvertiser *v3;
  CUBLEAdvertiser *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUBLEAdvertiser;
  v2 = -[CUBLEAdvertiser init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v3->_ucat = (LogCategory *)&gLogCategory_CUBLEAdvertiser;
    v4 = v3;
  }

  return v3;
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
  v4.super_class = (Class)CUBLEAdvertiser;
  -[CUBLEAdvertiser dealloc](&v4, sel_dealloc);
}

- (void)setAdvertiseFlags:(unsigned int)a3
{
  CUBLEAdvertiser *v4;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = self;
  objc_sync_enter(v4);
  if (v4->_advertiseFlags != a3)
  {
    v4->_advertiseFlags = a3;
    if (v4->_activateCalled)
    {
      dispatchQueue = v4->_dispatchQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __37__CUBLEAdvertiser_setAdvertiseFlags___block_invoke;
      block[3] = &unk_1E25DF2A0;
      block[4] = v4;
      dispatch_async(dispatchQueue, block);
    }
  }
  objc_sync_exit(v4);

}

- (void)setAppleManufacturerData:(id)a3
{
  id v4;
  void *v5;
  CUBLEAdvertiser *v6;
  NSData *appleManufacturerData;
  NSData *v8;
  NSData *v9;
  NSData *v10;
  char v11;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  v6 = self;
  objc_sync_enter(v6);
  appleManufacturerData = v6->_appleManufacturerData;
  v8 = v5;
  v9 = appleManufacturerData;
  if (v8 == v9)
  {

  }
  else
  {
    v10 = v9;
    if ((v8 == 0) != (v9 != 0))
    {
      v11 = -[NSData isEqual:](v8, "isEqual:", v9);

      if ((v11 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&v6->_appleManufacturerData, v5);
    if (v6->_activateCalled)
    {
      dispatchQueue = v6->_dispatchQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __44__CUBLEAdvertiser_setAppleManufacturerData___block_invoke;
      block[3] = &unk_1E25DF2A0;
      block[4] = v6;
      dispatch_async(dispatchQueue, block);
    }
  }
LABEL_9:
  objc_sync_exit(v6);

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
  v7 = qword_1EE0665F0;
  v14 = objc_retainAutorelease(v5);
  objc_msgSend(v14, "UTF8String");
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);

}

- (void)setLgBTAddress:(id)a3
{
  id v4;
  void *v5;
  CUBLEAdvertiser *v6;
  NSData *lgBTAddress;
  NSData *v8;
  NSData *v9;
  NSData *v10;
  char v11;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  v6 = self;
  objc_sync_enter(v6);
  lgBTAddress = v6->_lgBTAddress;
  v8 = v5;
  v9 = lgBTAddress;
  if (v8 == v9)
  {

  }
  else
  {
    v10 = v9;
    if ((v8 == 0) != (v9 != 0))
    {
      v11 = -[NSData isEqual:](v8, "isEqual:", v9);

      if ((v11 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&v6->_lgBTAddress, v5);
    if (v6->_activateCalled)
    {
      dispatchQueue = v6->_dispatchQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __34__CUBLEAdvertiser_setLgBTAddress___block_invoke;
      block[3] = &unk_1E25DF2A0;
      block[4] = v6;
      dispatch_async(dispatchQueue, block);
    }
  }
LABEL_9:
  objc_sync_exit(v6);

}

- (void)setLgDeviceID:(id)a3
{
  id v4;
  void *v5;
  CUBLEAdvertiser *v6;
  NSData *lgDeviceID;
  NSData *v8;
  NSData *v9;
  NSData *v10;
  char v11;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  v6 = self;
  objc_sync_enter(v6);
  lgDeviceID = v6->_lgDeviceID;
  v8 = v5;
  v9 = lgDeviceID;
  if (v8 == v9)
  {

  }
  else
  {
    v10 = v9;
    if ((v8 == 0) != (v9 != 0))
    {
      v11 = -[NSData isEqual:](v8, "isEqual:", v9);

      if ((v11 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&v6->_lgDeviceID, v5);
    if (v6->_activateCalled)
    {
      dispatchQueue = v6->_dispatchQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __33__CUBLEAdvertiser_setLgDeviceID___block_invoke;
      block[3] = &unk_1E25DF2A0;
      block[4] = v6;
      dispatch_async(dispatchQueue, block);
    }
  }
LABEL_9:
  objc_sync_exit(v6);

}

- (void)activate
{
  CUBLEAdvertiser *v2;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  v2->_activateCalled = 1;
  dispatchQueue = v2->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__CUBLEAdvertiser_activate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = v2;
  dispatch_async(dispatchQueue, block);
  objc_sync_exit(v2);

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__CUBLEAdvertiser_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  -[CUBLEAdvertiser _ensureStopped](self, "_ensureStopped");
  -[CUBLEAdvertiser _invalidated](self, "_invalidated");
}

- (void)_invalidated
{
  void (**invalidationHandler)(id, SEL);
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  LogCategory *ucat;
  uint64_t v10;

  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2](invalidationHandler, a2);
      v4 = self->_invalidationHandler;
    }
    else
    {
      v4 = 0;
    }
    self->_invalidationHandler = 0;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_8:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEAdvertiser _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v5, v6, v7, v8, v10);
        return;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_8;
      }
    }
  }
}

- (void)_ensureStarted
{
  CBPeripheralManager *peripheralManager;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  LogCategory *v10;
  const char *v11;
  CBPeripheralManager *v12;
  CBPeripheralManager *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CBPeripheralManager *v18;
  CURetrier *v19;
  CURetrier *retrier;
  void *v21;
  NSDictionary *advertiseParametersCurrent;
  NSDictionary *v23;
  NSDictionary *v24;
  NSDictionary *v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSDictionary *v31;
  LogCategory *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  LogCategory *ucat;
  LogCategory *v39;
  LogCategory *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSDictionary *v46;
  uint64_t v47;
  _QWORD v48[5];
  uint64_t v49;

  peripheralManager = self->_peripheralManager;
  if (!peripheralManager)
  {
    v12 = (CBPeripheralManager *)objc_msgSend(objc_alloc((Class)getCBPeripheralManagerClass[0]()), "initWithDelegate:queue:", self, self->_dispatchQueue);
    v13 = self->_peripheralManager;
    self->_peripheralManager = v12;

    v18 = self->_peripheralManager;
    if (!v18)
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
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEAdvertiser _ensureStarted]", 0x5Au, (uint64_t)"### Create CBPeripheralManager failed\n", v14, v15, v16, v17, v49);
      return;
    }
    if (-[CBPeripheralManager state](v18, "state") != 5)
      return;
LABEL_9:
    if (!self->_retrier)
    {
      v19 = objc_alloc_init(CURetrier);
      retrier = self->_retrier;
      self->_retrier = v19;

      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __33__CUBLEAdvertiser__ensureStarted__block_invoke;
      v48[3] = &unk_1E25DF2A0;
      v48[4] = self;
      -[CURetrier setActionHandler:](self->_retrier, "setActionHandler:", v48);
      -[CURetrier setDispatchQueue:](self->_retrier, "setDispatchQueue:", self->_dispatchQueue);
      -[CURetrier setStartTime:](self->_retrier, "setStartTime:", CFAbsoluteTimeGetCurrent());
    }
    if (self->_startAdvertisingCalled)
    {
      if (!self->_changesPending)
        return;
      -[CUBLEAdvertiser _advertiseParameters](self, "_advertiseParameters");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      advertiseParametersCurrent = self->_advertiseParametersCurrent;
      v23 = v21;
      v24 = advertiseParametersCurrent;
      if (v23 == v24)
      {

        self->_changesPending = 0;
      }
      else
      {
        v25 = v24;
        if ((v23 == 0) == (v24 != 0))
        {

          self->_changesPending = 0;
          goto LABEL_30;
        }
        v26 = -[NSDictionary isEqual:](v23, "isEqual:", v24);

        self->_changesPending = 0;
        if ((v26 & 1) == 0)
        {
LABEL_30:
          v40 = self->_ucat;
          if (v40->var0 <= 30)
          {
            if (v40->var0 == -1)
            {
              if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
                goto LABEL_42;
              v40 = self->_ucat;
            }
            -[CUBLEAdvertiser _advertiseParametersSummary:](self, "_advertiseParametersSummary:", v23);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF((uint64_t)v40, (uint64_t)"-[CUBLEAdvertiser _ensureStarted]", 0x1Eu, (uint64_t)"Advertiser update: %@\n", v42, v43, v44, v45, (uint64_t)v41);

          }
LABEL_42:
          objc_storeStrong((id *)&self->_advertiseParametersCurrent, v21);
          -[CBPeripheralManager stopAdvertising](self->_peripheralManager, "stopAdvertising");
          goto LABEL_43;
        }
      }
      v39 = self->_ucat;
      if (v39->var0 <= 10)
      {
        if (v39->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v39, 0xAu))
            goto LABEL_44;
          v39 = self->_ucat;
        }
        LogPrintF((uint64_t)v39, (uint64_t)"-[CUBLEAdvertiser _ensureStarted]", 0xAu, (uint64_t)"Advertiser no changes\n", v27, v28, v29, v30, v47);
      }
LABEL_44:

      return;
    }
    -[CUBLEAdvertiser _advertiseParameters](self, "_advertiseParameters");
    v31 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v32 = self->_ucat;
    if (v32->var0 <= 30)
    {
      if (v32->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
          goto LABEL_36;
        v32 = self->_ucat;
      }
      -[CUBLEAdvertiser _advertiseParametersSummary:](self, "_advertiseParametersSummary:", v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)v32, (uint64_t)"-[CUBLEAdvertiser _ensureStarted]", 0x1Eu, (uint64_t)"Advertiser start: %@\n", v34, v35, v36, v37, (uint64_t)v33);

    }
LABEL_36:
    v46 = self->_advertiseParametersCurrent;
    self->_advertiseParametersCurrent = v31;
    v23 = v31;

    self->_changesPending = 0;
    self->_startAdvertisingCalled = 1;
LABEL_43:
    -[CBPeripheralManager startAdvertising:](self->_peripheralManager, "startAdvertising:", v23);
    goto LABEL_44;
  }
  v4 = -[CBPeripheralManager state](peripheralManager, "state");
  if (v4 == 5)
    goto LABEL_9;
  v9 = v4;
  v10 = self->_ucat;
  if (v10->var0 > 30)
    return;
  if (v10->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)v10, 0x1Eu))
      return;
    v10 = self->_ucat;
  }
  if (v9 > 0xA)
    v11 = "?";
  else
    v11 = off_1E25DC5B8[v9];
  LogPrintF((uint64_t)v10, (uint64_t)"-[CUBLEAdvertiser _ensureStarted]", 0x1Eu, (uint64_t)"Deferring until Bluetooth powered: %s\n", v5, v6, v7, v8, (uint64_t)v11);
}

- (void)_ensureStopped
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CURetrier *retrier;
  CURetrier *v8;
  LogCategory *ucat;
  CBPeripheralManager *peripheralManager;
  CBPeripheralManager *v11;
  uint64_t v12;

  retrier = self->_retrier;
  if (retrier)
  {
    -[CURetrier invalidateDirect](retrier, "invalidateDirect");
    v8 = self->_retrier;
    self->_retrier = 0;

  }
  self->_changesPending = 0;
  if (self->_startAdvertisingCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
          goto LABEL_8;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEAdvertiser _ensureStopped]", 0x1Eu, (uint64_t)"Advertising stop\n", v2, v3, v4, v5, v12);
    }
LABEL_8:
    self->_startAdvertisingCalled = 0;
    -[CBPeripheralManager stopAdvertising](self->_peripheralManager, "stopAdvertising");
  }
  peripheralManager = self->_peripheralManager;
  if (peripheralManager)
  {
    -[CBPeripheralManager setDelegate:](peripheralManager, "setDelegate:", 0);
    v11 = self->_peripheralManager;
    self->_peripheralManager = 0;

  }
}

- (id)_advertiseParameters
{
  id v3;
  CUBLEAdvertiser *v4;
  NSData *v5;
  size_t v6;
  char *v7;
  void *v8;
  void *v9;
  unsigned int advertiseFlags;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = self;
  objc_sync_enter(v4);
  if (-[NSData length](v4->_lgDeviceID, "length") == 6)
    -[CUBLEAdvertiser _advertiseParametersAddLGWake:](v4, "_advertiseParametersAddLGWake:", v3);
  if ((v4->_advertiseFlags & 8) != 0)
    -[CUBLEAdvertiser _advertiseParametersAddOSR](v4, "_advertiseParametersAddOSR");
  v5 = v4->_appleManufacturerData;
  v6 = -[NSData length](v5, "length");
  if (v6 - 1 <= 0x19)
  {
    MEMORY[0x1E0C80A78]();
    v7 = (char *)v15 - ((v6 + 19) & 0xFFFFFFFFFFFFFFF0);
    *v7 = v6 + 3;
    *(_WORD *)(v7 + 1) = 19711;
    v7[3] = 0;
    memcpy(v7 + 4, -[NSData bytes](objc_retainAutorelease(v5), "bytes"), v6);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v7, v6 + 4);
    getCBAdvertisementDataAppleMfgData[0]();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, v9);

  }
  advertiseFlags = v4->_advertiseFlags;
  getCBAdvertisementDataIsConnectable[0]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((advertiseFlags & 2) != 0)
    v12 = MEMORY[0x1E0C9AAB0];
  else
    v12 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v11);

  if ((v4->_advertiseFlags & 4) != 0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("kCBAdvDataIsExtended"));
  getCBManagerIsPrivilegedDaemonKey[0]();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v13);

  objc_sync_exit(v4);
  return v3;
}

- (void)_advertiseParametersAddLGWake:(id)a3
{
  id v4;
  id v5;
  NSData *v6;
  __int16 v7;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v7 = 196;
  objc_msgSend(v5, "appendBytes:length:", &v7, 2);
  v6 = self->_lgDeviceID;
  if (-[NSData length](v6, "length") == 6)
  {
    objc_msgSend(v5, "appendData:", v6);
    v7 = 7;
    objc_msgSend(v5, "appendBytes:length:", &v7, 2);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("kCBAdvDataManufacturerDataInternal"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("kCBAdvDataNonAppleMfgData"));
  }

}

- (void)_advertiseParametersAddOSR
{
  char v3;
  NSData *v4;
  NSData *appleManufacturerData;
  __int16 v6;
  char v7;
  char v8;

  v6 = 5952;
  v7 = 1;
  if (GestaltGetDeviceClass_sOnce != -1)
    dispatch_once(&GestaltGetDeviceClass_sOnce, &__block_literal_global_13066);
  v3 = 6;
  switch(GestaltGetDeviceClass_deviceClass)
  {
    case 1:
      v3 = 1;
      break;
    case 2:
      v3 = 2;
      break;
    case 3:
      v3 = 3;
      break;
    case 4:
      break;
    case 6:
      v3 = 7;
      break;
    case 7:
      v3 = 4;
      break;
    default:
      v3 = 0;
      break;
  }
  v8 = v3;
  v4 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v6, 4);
  appleManufacturerData = self->_appleManufacturerData;
  self->_appleManufacturerData = v4;

}

- (id)_advertiseParametersSummary:(id)a3
{
  const __CFDictionary *v3;
  id v4;
  CFTypeID TypeID;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  CFTypeID v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __CFString *v28;
  CFTypeID v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __CFString *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __CFString *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __CFString *v55;
  __CFString *v56;
  __CFString *v57;
  uint64_t v59;
  CFMutableStringRef v60;
  CFMutableStringRef v61;
  CFMutableStringRef v62;
  CFMutableStringRef v63;
  CFMutableStringRef v64;

  v3 = (const __CFDictionary *)a3;
  v4 = (id)getCBAdvertisementDataAppleMfgData[0]();
  TypeID = CFDataGetTypeID();
  CFDictionaryGetTypedValue(v3, v4, TypeID, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v64 = 0;
    v8 = objc_retainAutorelease(v6);
    v9 = objc_msgSend(v8, "bytes");
    objc_msgSend(v8, "length");
    NSAppendPrintF(&v64, (uint64_t)"AMD <%H>", v10, v11, v12, v13, v14, v15, v9);
    v16 = v64;
  }
  else
  {
    v16 = 0;
  }

  v17 = CFDataGetTypeID();
  CFDictionaryGetTypedValue(v3, CFSTR("kCBAdvDataManufacturerDataInternal"), v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v63 = v16;
    v20 = objc_retainAutorelease(v18);
    v21 = objc_msgSend(v20, "bytes");
    objc_msgSend(v20, "length");
    NSAppendPrintF(&v63, (uint64_t)"Mfr <%H>", v22, v23, v24, v25, v26, v27, v21);
    v28 = v63;

    v16 = v28;
  }

  v29 = CFDataGetTypeID();
  CFDictionaryGetTypedValue(v3, CFSTR("kCBAdvDataNonAppleMfgData"), v29, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    v62 = v16;
    v32 = objc_retainAutorelease(v30);
    v33 = objc_msgSend(v32, "bytes");
    objc_msgSend(v32, "length");
    NSAppendPrintF(&v62, (uint64_t)"Mfr <%H>", v34, v35, v36, v37, v38, v39, v33);
    v40 = v62;

    v16 = v40;
  }

  v41 = (id)getCBAdvertisementDataIsConnectable[0]();
  if (CFDictionaryGetInt64(v3, v41, 0))
  {
    v61 = v16;
    NSAppendPrintF(&v61, (uint64_t)", Cnx", v42, v43, v44, v45, v46, v47, v59);
    v48 = v61;

    v16 = v48;
  }
  if (CFDictionaryGetInt64(v3, CFSTR("kCBAdvDataIsExtended"), 0))
  {
    v60 = v16;
    NSAppendPrintF(&v60, (uint64_t)", Extended", v49, v50, v51, v52, v53, v54, v59);
    v55 = v60;

    v16 = v55;
  }
  if (v16)
    v56 = v16;
  else
    v56 = CFSTR("?");
  v57 = v56;

  return v57;
}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  NSObject *dispatchQueue;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  LogCategory *ucat;
  const char *v12;

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  v6 = objc_msgSend(v5, "state");

  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      if (v6 > 0xA)
        v12 = "?";
      else
        v12 = off_1E25DC628[v6];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEAdvertiser peripheralManagerDidUpdateState:]", 0x1Eu, (uint64_t)"Bluetooth advertiser state changed: %s\n", v7, v8, v9, v10, (uint64_t)v12);
      goto LABEL_9;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_9:
  if (v6 == 1 || v6 == 4)
  {
    self->_startAdvertisingCalled = 0;
  }
  else if (v6 == 5)
  {
    -[CUBLEAdvertiser _ensureStarted](self, "_ensureStarted");
  }
}

- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  LogCategory *ucat;
  int var0;
  uint64_t v13;
  id v14;

  v14 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  ucat = self->_ucat;
  var0 = ucat->var0;
  if (v6)
  {
    if (var0 <= 90)
    {
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
          goto LABEL_9;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEAdvertiser peripheralManagerDidStartAdvertising:error:]", 0x5Au, (uint64_t)"### Advertiser start failed: %{error}\n", v7, v8, v9, v10, (uint64_t)v6);
    }
LABEL_9:
    if ((objc_msgSend(v14, "isAdvertising") & 1) == 0)
      self->_startAdvertisingCalled = 0;
    -[CURetrier failed](self->_retrier, "failed");
    goto LABEL_12;
  }
  if (var0 <= 30)
  {
    if (var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_12;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEAdvertiser peripheralManagerDidStartAdvertising:error:]", 0x1Eu, (uint64_t)"Advertiser started\n", v7, v8, v9, v10, v13);
  }
LABEL_12:

}

- (NSData)appleManufacturerData
{
  return self->_appleManufacturerData;
}

- (unsigned)advertiseFlags
{
  return self->_advertiseFlags;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSData)lgBTAddress
{
  return self->_lgBTAddress;
}

- (NSData)lgDeviceID
{
  return self->_lgDeviceID;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_lgDeviceID, 0);
  objc_storeStrong((id *)&self->_lgBTAddress, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_appleManufacturerData, 0);
  objc_storeStrong((id *)&self->_retrier, 0);
  objc_storeStrong((id *)&self->_peripheralManager, 0);
  objc_storeStrong((id *)&self->_advertiseParametersCurrent, 0);
}

uint64_t __33__CUBLEAdvertiser__ensureStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ensureStarted");
}

uint64_t __29__CUBLEAdvertiser_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int *v11;
  _BOOL4 v12;
  uint64_t v13;

  v8 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v8 + 25))
  {
    v9 = result;
    *(_BYTE *)(v8 + 25) = 1;
    v10 = *(_QWORD **)(result + 32);
    v11 = (int *)v10[7];
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
        v10 = *(_QWORD **)(v9 + 32);
        if (!v12)
          return objc_msgSend(v10, "_invalidate");
        v11 = (int *)v10[7];
      }
      LogPrintF((uint64_t)v11, (uint64_t)"-[CUBLEAdvertiser invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidate\n", a5, a6, a7, a8, v13);
      v10 = *(_QWORD **)(v9 + 32);
    }
    return objc_msgSend(v10, "_invalidate");
  }
  return result;
}

uint64_t __27__CUBLEAdvertiser_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v9;
  int *v10;
  _BOOL4 v11;
  uint64_t v13;

  v9 = *(_QWORD **)(a1 + 32);
  v10 = (int *)v9[7];
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      v9 = *(_QWORD **)(a1 + 32);
      if (!v11)
        return objc_msgSend(v9, "_ensureStarted");
      v10 = (int *)v9[7];
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUBLEAdvertiser activate]_block_invoke", 0x1Eu, (uint64_t)"Activate\n", a5, a6, a7, a8, v13);
    v9 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v9, "_ensureStarted");
}

uint64_t __33__CUBLEAdvertiser_setLgDeviceID___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_ensureStarted");
}

uint64_t __34__CUBLEAdvertiser_setLgBTAddress___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_ensureStarted");
}

uint64_t __44__CUBLEAdvertiser_setAppleManufacturerData___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_ensureStarted");
}

uint64_t __37__CUBLEAdvertiser_setAdvertiseFlags___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_ensureStarted");
}

@end
