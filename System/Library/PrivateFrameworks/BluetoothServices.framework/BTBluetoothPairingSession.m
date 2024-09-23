@implementation BTBluetoothPairingSession

- (BTBluetoothPairingSession)init
{
  BTBluetoothPairingSession *v2;
  BTBluetoothPairingSession *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BTBluetoothPairingSession;
  v2 = -[BTBluetoothPairingSession init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v3->_ucat = (LogCategory *)&gLogCategory_BTBluetoothPairingSession;
  }
  return v3;
}

- (void)dealloc
{
  BTBluetoothPairingSession *v2;
  SEL v3;
  objc_super v4;

  if (self->_btSession)
  {
    FatalErrorF();
    goto LABEL_6;
  }
  if (self->_btSessionAttaching)
  {
LABEL_6:
    FatalErrorF();
    goto LABEL_7;
  }
  if (!self->_completionHandler)
  {
    v4.receiver = self;
    v4.super_class = (Class)BTBluetoothPairingSession;
    -[BTBluetoothPairingSession dealloc](&v4, sel_dealloc);
    return;
  }
LABEL_7:
  v2 = (BTBluetoothPairingSession *)FatalErrorF();
  -[BTBluetoothPairingSession activate](v2, v3);
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__BTBluetoothPairingSession_activate__block_invoke;
  block[3] = &unk_24CEE54F0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__BTBluetoothPairingSession_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  int var0;
  const char *v4;
  const char *v5;
  const char *v6;
  OS_os_transaction *v7;
  OS_os_transaction *transaction;
  int v9;
  OS_dispatch_source *v10;
  OS_dispatch_source *timeoutTimer;
  NSObject *v12;
  WPClient *v13;
  WPClient *wpClient;
  uint64_t v15;
  int v16;
  NSString *deviceAddress;
  NSString *guestAddress;
  const char *v19;
  const char *v20;
  const char *v21;
  _QWORD handler[5];

  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v4 = "yes";
    if (self->_guestMode)
      v5 = "yes";
    else
      v5 = "no";
    if (self->_disconnectOnly)
      v6 = "yes";
    else
      v6 = "no";
    if (!self->_userNotInContacts)
      v4 = "no";
    v20 = v6;
    v21 = v4;
    guestAddress = self->_guestAddress;
    v19 = v5;
    deviceAddress = self->_deviceAddress;
    LogPrintF();
  }
  self->_startTime = CFAbsoluteTimeGetCurrent();
  if (!self->_transaction)
  {
    v7 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v7;

    if (!self->_transaction)
    {
      v9 = self->_ucat->var0;
      if (v9 <= 60 && (v9 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
  }
  if (self->_timeoutTimer)
  {
LABEL_22:
    v13 = (WPClient *)objc_msgSend(objc_alloc((Class)getWPClientClass[0]()), "initWithQueue:machName:", self->_dispatchQueue, 0);
    wpClient = self->_wpClient;
    self->_wpClient = v13;

    -[WPClient disableScanning](self->_wpClient, "disableScanning");
    v15 = -[BTBluetoothPairingSession _btEnsureStarted](self, "_btEnsureStarted");
    if (!(_DWORD)v15)
      return;
    goto LABEL_23;
  }
  v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = v10;

  v12 = self->_timeoutTimer;
  if (v12)
  {
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __38__BTBluetoothPairingSession__activate__block_invoke;
    handler[3] = &unk_24CEE54F0;
    handler[4] = self;
    dispatch_source_set_event_handler(v12, handler);
    CUDispatchTimerSet();
    dispatch_resume((dispatch_object_t)self->_timeoutTimer);
    goto LABEL_22;
  }
  v16 = self->_ucat->var0;
  if (v16 <= 60 && (v16 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v15 = 4294960567;
LABEL_23:
  -[BTBluetoothPairingSession _completed:](self, "_completed:", v15, deviceAddress, guestAddress, v19, v20, v21);
}

uint64_t __38__BTBluetoothPairingSession__activate__block_invoke(uint64_t a1)
{
  _DWORD **v2;
  int v3;
  int v4;

  v2 = *(_DWORD ***)(a1 + 32);
  v3 = *v2[17];
  if (v3 <= 60)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_DWORD ***)(a1 + 32), v4))
    {
      LogPrintF();
      v2 = *(_DWORD ***)(a1 + 32);
    }
  }
  return objc_msgSend(v2, "_completed:", 4294960574);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__BTBluetoothPairingSession_invalidate__block_invoke;
  block[3] = &unk_24CEE54F0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __39__BTBluetoothPairingSession_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  int var0;

  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  self->_invalidateCalled = 1;
  -[BTBluetoothPairingSession _completed:](self, "_completed:", 4294960573);
}

- (void)_completed:(int)a3
{
  uint64_t v3;
  OS_dispatch_source *retryTimer;
  NSObject *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *timeoutTimer;
  NSObject *v9;
  OS_dispatch_source *v10;
  WPClient *wpClient;
  int var0;
  void (**completionHandler)(id, void *);
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  id v22;
  OS_os_transaction *transaction;
  double v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];

  v3 = *(_QWORD *)&a3;
  v27[1] = *MEMORY[0x24BDAC8D0];
  -[BTBluetoothPairingSession _btEnsureStopped](self, "_btEnsureStopped");
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    v6 = retryTimer;
    dispatch_source_cancel(v6);
    v7 = self->_retryTimer;
    self->_retryTimer = 0;

  }
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v9 = timeoutTimer;
    dispatch_source_cancel(v9);
    v10 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
  -[WPClient invalidate](self->_wpClient, "invalidate");
  wpClient = self->_wpClient;
  self->_wpClient = 0;

  if (self->_completionHandler)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v25 = v3;
      v24 = CFAbsoluteTimeGetCurrent() - self->_startTime;
      LogPrintF();
    }
    completionHandler = (void (**)(id, void *))self->_completionHandler;
    if ((_DWORD)v3)
    {
      v14 = (void *)MEMORY[0x24BDD1540];
      v15 = *MEMORY[0x24BDD1100];
      v16 = (int)v3;
      v26 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DebugGetErrorString());
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      v19 = CFSTR("?");
      if (v17)
        v19 = (const __CFString *)v17;
      v27[0] = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1, *(_QWORD *)&v24, v25);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, v16, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      completionHandler[2](completionHandler, v21);

    }
    else
    {
      completionHandler[2](self->_completionHandler, 0);
    }
    v22 = self->_completionHandler;
    self->_completionHandler = 0;

  }
  transaction = self->_transaction;
  self->_transaction = 0;

}

- (int)_btEnsureStarted
{
  int v3;
  int var0;
  int v5;
  uint64_t *p_btDevice;
  __int128 v7;
  int v8;
  int v9;
  NSString *deviceAddress;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  NSString *guestAddress;
  int v16;
  int v17;
  LogCategory *ucat;
  BTBluetoothPairingSession *v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  const char *v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  NSString *v33;
  NSUInteger v34;
  int v35;
  const char *v36;
  NSUInteger v37;
  int v38;
  int v39;
  int v40;
  int v41;
  uint64_t v42;
  NSString *v43;
  int v44;
  uint64_t v45;
  const char *v46;
  int v47;
  int v48;
  uint64_t v49;
  int v50;
  int v51;
  int v52;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  unint64_t v64;
  NSUInteger v65;
  int v66;
  __int16 v67;
  _OWORD v68[2];
  __int128 v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  self->_btStarted = 1;
  if (!self->_btSessionAttaching && !self->_btSession)
  {
    *(_QWORD *)&v68[0] = 0;
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    *(_QWORD *)&v68[0] = _btSessionEventHandler;
    v19 = self;
    v20 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, void *))softLinkBTSessionAttachWithQueue[0])((uint64_t)self->_ucat->var4, (uint64_t)v68, (uint64_t)v19, v19->_dispatchQueue);
    if (v20)
    {
      v21 = v20;
      CFRelease(v19);
      v22 = (v21 + 310000);
      v23 = self->_ucat->var0;
      if (v23 > 60 || v23 == -1 && !_LogCategory_Initialize())
        goto LABEL_49;
      v64 = (v21 + 310000);
      goto LABEL_168;
    }
    self->_btSessionAttaching = 1;
  }
  if (!self->_btSessionAddedServiceCallback && self->_btSession)
  {
    v3 = self->_ucat->var0;
    if (v3 <= 30 && (v3 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v5 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTServiceAddCallbacks[0])((uint64_t)self->_btSession, (uint64_t)_btServiceEventHandler, (uint64_t)self);
    if (v5)
    {
      v22 = (v5 + 310000);
      v54 = self->_ucat->var0;
      if (v54 <= 60 && (v54 != -1 || _LogCategory_Initialize()))
      {
        v64 = v22;
        LogPrintF();
      }
      goto LABEL_49;
    }
    self->_btSessionAddedServiceCallback = 1;
  }
  p_btDevice = (uint64_t *)&self->_btDevice;
  if (self->_btDevice || !self->_btSession)
    goto LABEL_15;
  v9 = self->_ucat->var0;
  if (v9 <= 30 && (v9 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  deviceAddress = self->_deviceAddress;
  if (deviceAddress)
  {
    WORD2(v68[0]) = 0;
    LODWORD(v68[0]) = 0;
    v11 = -[NSString UTF8String](deviceAddress, "UTF8String");
    v12 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTDeviceAddressFromString[0])(v11, (uint64_t)v68);
    if (v12)
    {
      v22 = (v12 + 310000);
      v56 = self->_ucat->var0;
      if (v56 > 60 || v56 == -1 && !_LogCategory_Initialize())
        goto LABEL_49;
      v64 = (unint64_t)self->_deviceAddress;
      goto LABEL_168;
    }
    v13 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceFromAddress[0])((uint64_t)self->_btSession, (uint64_t)v68, (uint64_t)&self->_btDevice);
    if (v13)
    {
      v22 = (v13 + 310000);
      v57 = self->_ucat->var0;
      if (v57 > 60 || v57 == -1 && !_LogCategory_Initialize())
        goto LABEL_49;
      v64 = (unint64_t)self->_deviceAddress;
      v65 = v22;
      goto LABEL_168;
    }
    v14 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetAddressString[0])((uint64_t)self->_btDevice, (uint64_t)self->_btAddrStr, 32);
    if (v14)
    {
      v22 = (v14 + 310000);
      v58 = self->_ucat->var0;
      if (v58 > 60 || v58 == -1 && !_LogCategory_Initialize())
        goto LABEL_49;
      v64 = (unint64_t)self->_deviceAddress;
      v65 = v22;
      goto LABEL_168;
    }
    guestAddress = self->_guestAddress;
    if (guestAddress)
    {
      v16 = self->_ucat->var0;
      if (v16 > 30)
        goto LABEL_15;
      if (v16 == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_15;
        guestAddress = self->_guestAddress;
      }
      v64 = (unint64_t)self->_deviceAddress;
      v65 = (NSUInteger)guestAddress;
    }
    else
    {
      v66 = 0;
      v17 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTDeviceGetPairingStatus[0])((uint64_t)self->_btDevice, (uint64_t)&v66);
      ucat = self->_ucat;
      if (v17)
      {
        if (ucat->var0 > 60)
          goto LABEL_15;
        if (ucat->var0 != -1 || (v25 = _LogCategory_Initialize(), ucat = self->_ucat, v25))
        {
          v64 = (v17 + 310000);
          LogPrintF();
          ucat = self->_ucat;
        }
      }
      if (ucat->var0 > 30 || ucat->var0 == -1 && !_LogCategory_Initialize())
        goto LABEL_15;
      if (v66)
        v26 = "already paired";
      else
        v26 = "not paired";
      v64 = (unint64_t)self->_deviceAddress;
      v65 = (NSUInteger)v26;
    }
    LogPrintF();
LABEL_15:
    if (!self->_connectOnly
      && !self->_disconnectOnly
      && !self->_guestAddress
      && !self->_btPairingAgent
      && self->_btSession)
    {
      v7 = 0uLL;
      v69 = 0u;
      memset(v68, 0, sizeof(v68));
      v8 = self->_ucat->var0;
      if (v8 <= 30)
      {
        if (v8 != -1 || (v27 = _LogCategory_Initialize(), v7 = 0uLL, v27))
        {
          LogPrintF();
          v7 = 0uLL;
        }
      }
      v69 = *((unint64_t *)&v7 + 1);
      *(_OWORD *)((char *)v68 + 8) = v7;
      *(_QWORD *)&v68[0] = _btPairingAgentStatusHandler;
      *((_QWORD *)&v68[1] + 1) = _btPairingAgentUserConfirmationHandler;
      v28 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTPairingAgentCreate[0])((uint64_t)self->_btSession, (uint64_t)v68, (uint64_t)self, (uint64_t)&self->_btPairingAgent);
      if (v28)
      {
        v22 = (v28 + 310000);
        v62 = self->_ucat->var0;
        if (v62 <= 60 && (v62 != -1 || _LogCategory_Initialize()))
        {
          v64 = v22;
          goto LABEL_168;
        }
        goto LABEL_49;
      }
      v29 = self->_ucat->var0;
      if (v29 <= 30 && (v29 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      v30 = ((uint64_t (*)(uint64_t))softLinkBTPairingAgentStart[0])((uint64_t)self->_btPairingAgent);
      if (v30)
      {
        v22 = (v30 + 310000);
        v63 = self->_ucat->var0;
        if (v63 <= 60 && (v63 != -1 || _LogCategory_Initialize()))
        {
          v64 = v22;
          goto LABEL_168;
        }
        goto LABEL_49;
      }
    }
    if (!*p_btDevice)
    {
LABEL_148:
      LODWORD(v22) = 0;
      return v22;
    }
    if ((self->_btConfigured || !self->_guestAddress)
      && (self->_btConnecting || !self->_btPairingAgentStarted && !self->_connectOnly))
    {
      if (self->_btDisconnected || !self->_disconnectOnly)
        goto LABEL_148;
      v31 = self->_ucat->var0;
      if (v31 <= 30 && (v31 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      v42 = ((uint64_t (*)(uint64_t))softLinkBTDeviceDisconnect[0])(*p_btDevice);
      if ((_DWORD)v42)
      {
        v43 = (NSString *)v42;
        v44 = self->_ucat->var0;
        if (v44 <= 60 && (v44 != -1 || _LogCategory_Initialize()))
        {
          v64 = (unint64_t)v43;
          v65 = ((_DWORD)v43 + 310000);
          LogPrintF();
        }
      }
      self->_btDisconnected = 1;
      goto LABEL_147;
    }
    if (!self->_guestAddress)
      goto LABEL_225;
    if (MobileBluetoothLibrary_sOnce != -1)
      dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_294);
    if (!MobileBluetoothLibrary_sLib || !dlsym((void *)MobileBluetoothLibrary_sLib, "BTDeviceConfigureLinkKey"))
    {
      if (!self->_guestMode)
        goto LABEL_226;
LABEL_225:
      if (MobileBluetoothLibrary_sOnce != -1)
        dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_294);
      if (MobileBluetoothLibrary_sLib
        && dlsym((void *)MobileBluetoothLibrary_sLib, "BTDeviceConnectServicesWithParameters"))
      {
        v35 = self->_ucat->var0;
        if (v35 <= 30 && (v35 != -1 || _LogCategory_Initialize()))
        {
          if (self->_guestPermanent)
            v36 = "yes";
          else
            v36 = "no";
          v37 = -[NSData length](self->_guestKey, "length", v64, v65);
          v64 = (unint64_t)v36;
          v65 = v37;
          LogPrintF();
        }
        v68[0] = 0uLL;
        if (-[NSData length](self->_guestKey, "length", v64, v65) == 16)
        {
          v68[0] = *(_OWORD *)-[NSData bytes](self->_guestKey, "bytes");
          if (self->_guestPermanent)
          {
            v49 = 16;
          }
          else if (self->_userNotInContacts)
          {
            v49 = 4;
          }
          else
          {
            v49 = 2;
          }
        }
        else if (self->_guestPermanent)
        {
          v49 = 16;
        }
        else
        {
          v49 = 1;
        }
        v50 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTDeviceConnectServicesWithParameters[0])(*p_btDevice, 4294959103, v49, (uint64_t)v68);
        if (v50)
        {
          v22 = (v50 + 310000);
          v51 = self->_ucat->var0;
          if (v51 > 60 || v51 == -1 && !_LogCategory_Initialize())
            goto LABEL_49;
          v64 = v22;
          goto LABEL_168;
        }
      }
      else
      {
        if (!self->_aggregate)
          goto LABEL_111;
LABEL_226:
        if (MobileBluetoothLibrary_sOnce != -1)
          dispatch_once(&MobileBluetoothLibrary_sOnce, &__block_literal_global_294);
        if (MobileBluetoothLibrary_sLib
          && dlsym((void *)MobileBluetoothLibrary_sLib, "BTDeviceConnectServicesWithParameters"))
        {
          v38 = self->_ucat->var0;
          if (v38 <= 30 && (v38 != -1 || _LogCategory_Initialize()))
            LogPrintF();
          v68[0] = 0uLL;
          v52 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTDeviceConnectServicesWithParameters[0])(*p_btDevice, 4294959103, 0, (uint64_t)v68);
          if (v52)
          {
            v22 = (v52 + 310000);
            v61 = self->_ucat->var0;
            if (v61 <= 60 && (v61 != -1 || _LogCategory_Initialize()))
            {
              v64 = v22;
              goto LABEL_168;
            }
            goto LABEL_49;
          }
        }
        else
        {
LABEL_111:
          v39 = self->_ucat->var0;
          if (v39 <= 30 && (v39 != -1 || _LogCategory_Initialize()))
            LogPrintF();
          v40 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTDeviceConnectServices[0])(*p_btDevice, 4294959103);
          if (v40)
          {
            v22 = (v40 + 310000);
            v41 = self->_ucat->var0;
            if (v41 > 60 || v41 == -1 && !_LogCategory_Initialize())
              goto LABEL_49;
            v64 = v22;
            goto LABEL_168;
          }
        }
      }
      LODWORD(v22) = 0;
      self->_btConnecting = 1;
      return v22;
    }
    v32 = self->_ucat->var0;
    if (v32 <= 30 && (v32 != -1 || _LogCategory_Initialize()))
    {
      v33 = self->_guestAddress;
      v34 = -[NSData length](self->_guestKey, "length", v64, v65);
      v64 = (unint64_t)v33;
      v65 = v34;
      LogPrintF();
    }
    v68[0] = 0uLL;
    if (-[NSData length](self->_guestKey, "length", v64, v65) == 16)
    {
      v68[0] = *(_OWORD *)-[NSData bytes](self->_guestKey, "bytes");
      v45 = 0xFFFFFFFFLL;
    }
    else
    {
      v45 = 0;
    }
    v67 = 0;
    v66 = 0;
    v46 = -[NSString UTF8String](self->_guestAddress, "UTF8String");
    v47 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTDeviceAddressFromString[0])((uint64_t)v46, (uint64_t)&v66);
    if (!v47)
    {
      v48 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTDeviceConfigureLinkKey[0])(*p_btDevice, (uint64_t)&v66, (uint64_t)v68, v45);
      if (!v48)
      {
        self->_btConfigured = 1;
LABEL_147:
        -[BTBluetoothPairingSession _completed:](self, "_completed:", 0, v64, v65);
        goto LABEL_148;
      }
      v22 = (v48 + 310000);
      v60 = self->_ucat->var0;
      if (v60 <= 60 && (v60 != -1 || _LogCategory_Initialize()))
      {
        v64 = v22;
        goto LABEL_168;
      }
LABEL_49:
      if (!(_DWORD)v22)
        return v22;
      goto LABEL_50;
    }
    v22 = (v47 + 310000);
    v59 = self->_ucat->var0;
    if (v59 > 60 || v59 == -1 && !_LogCategory_Initialize())
      goto LABEL_49;
    v64 = (unint64_t)self->_guestAddress;
LABEL_168:
    LogPrintF();
    goto LABEL_49;
  }
  v55 = self->_ucat->var0;
  if (v55 <= 60 && (v55 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v22 = 4294960551;
LABEL_50:
  v24 = self->_ucat->var0;
  if (v24 <= 60 && (v24 != -1 || _LogCategory_Initialize()))
  {
    v64 = v22;
    LogPrintF();
  }
  -[BTBluetoothPairingSession _completed:](self, "_completed:", v22, v64, v65);
  return v22;
}

- (void)_btEnsureStopped
{
  int var0;
  int v4;
  int v5;
  int v6;
  int v7;

  if (self->_btConnecting)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    ((void (*)(uint64_t))softLinkBTPairingAgentCancelPairing[0])((uint64_t)self->_btPairingAgent);
    self->_btConnecting = 0;
  }
  if (self->_btPairingAgentStarted)
  {
    v4 = self->_ucat->var0;
    if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    ((void (*)(uint64_t))softLinkBTPairingAgentStop[0])((uint64_t)self->_btPairingAgent);
    self->_btPairingAgentStarted = 0;
  }
  if (self->_btPairingAgent)
  {
    v5 = self->_ucat->var0;
    if (v5 <= 30 && (v5 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    ((void (*)(uint64_t))softLinkBTPairingAgentDestroy[0])((uint64_t)&self->_btPairingAgent);
    self->_btPairingAgent = 0;
  }
  if (self->_btSessionAddedServiceCallback)
  {
    if (self->_btSession)
    {
      v6 = self->_ucat->var0;
      if (v6 <= 30 && (v6 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      ((void (*)(uint64_t, uint64_t))softLinkBTServiceRemoveCallbacks[0])((uint64_t)self->_btSession, (uint64_t)_btServiceEventHandler);
    }
    self->_btSessionAddedServiceCallback = 0;
  }
  if (self->_btSession)
  {
    v7 = self->_ucat->var0;
    if (v7 <= 30 && (v7 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    ((void (*)(uint64_t))softLinkBTSessionDetachWithQueue[0])((uint64_t)&self->_btSession);
    self->_btSession = 0;
  }
  self->_btDevice = 0;
  self->_btStarted = 0;
}

- (void)_btDeletePairingAndRetry
{
  unsigned int retryCount;
  int v4;
  uint64_t v5;
  int var0;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  OS_dispatch_source *retryTimer;
  NSObject *v14;
  OS_dispatch_source *v15;
  OS_dispatch_source *v16;
  OS_dispatch_source *v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  _QWORD handler[5];

  retryCount = self->_retryCount;
  if (retryCount < 3)
  {
    v5 = retryCount + 1;
    self->_retryCount = v5;
    var0 = self->_ucat->var0;
    if (var0 <= 50)
    {
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_11;
        v5 = self->_retryCount;
      }
      v20 = v5;
      LogPrintF();
    }
LABEL_11:
    v7 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTPairingAgentDeletePairedDevice[0])((uint64_t)self->_btPairingAgent, (uint64_t)self->_btDevice);
    if (v7)
    {
      v8 = v7;
      v9 = self->_ucat->var0;
      if (v9 <= 60 && (v9 != -1 || _LogCategory_Initialize()))
      {
        v20 = (v8 + 310000);
        LogPrintF();
      }
    }
    if (self->_timeoutTimer)
    {
      v10 = self->_ucat->var0;
      if (v10 <= 50 && (v10 != -1 || _LogCategory_Initialize()))
      {
        v20 = 15;
        LogPrintF();
      }
      CUDispatchTimerSet();
    }
    v11 = self->_ucat->var0;
    if (self->_btSession)
    {
      if (v11 <= 50 && (v11 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      -[BTBluetoothPairingSession _btEnsureStopped](self, "_btEnsureStopped", v20);
    }
    else if (v11 <= 90 && (v11 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v12 = self->_ucat->var0;
    if (v12 <= 30 && (v12 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    retryTimer = self->_retryTimer;
    if (retryTimer)
    {
      v14 = retryTimer;
      dispatch_source_cancel(v14);
      v15 = self->_retryTimer;
      self->_retryTimer = 0;

    }
    v16 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    v17 = self->_retryTimer;
    self->_retryTimer = v16;

    v18 = self->_retryTimer;
    if (v18)
    {
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __53__BTBluetoothPairingSession__btDeletePairingAndRetry__block_invoke;
      handler[3] = &unk_24CEE54F0;
      handler[4] = self;
      dispatch_source_set_event_handler(v18, handler);
      CUDispatchTimerSet();
      dispatch_resume((dispatch_object_t)self->_retryTimer);
    }
    else
    {
      v19 = self->_ucat->var0;
      if (v19 <= 60 && (v19 != -1 || _LogCategory_Initialize()))
        goto LABEL_44;
    }
    return;
  }
  v4 = self->_ucat->var0;
  if (v4 <= 60 && (v4 != -1 || _LogCategory_Initialize()))
LABEL_44:
    LogPrintF();
}

uint64_t __53__BTBluetoothPairingSession__btDeletePairingAndRetry__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  int v8;
  int v10;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  if (v2)
  {
    v3 = v2;
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 104);
    *(_QWORD *)(v4 + 104) = 0;

  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = **(_DWORD **)(v6 + 136);
  if (*(_QWORD *)(v6 + 80))
  {
    if (v7 <= 30)
    {
      if (v7 != -1 || (v8 = _LogCategory_Initialize(), v6 = *(_QWORD *)(a1 + 32), v8))
      {
        LogPrintF();
        v6 = *(_QWORD *)(a1 + 32);
      }
    }
    *(_BYTE *)(v6 + 96) = 1;
    return objc_msgSend(*(id *)(a1 + 32), "_btEnsureStopped");
  }
  else
  {
    if (v7 <= 30)
    {
      if (v7 != -1 || (v10 = _LogCategory_Initialize(), v6 = *(_QWORD *)(a1 + 32), v10))
      {
        LogPrintF();
        v6 = *(_QWORD *)(a1 + 32);
      }
    }
    *(_BYTE *)(v6 + 96) = 0;
    return objc_msgSend(*(id *)(a1 + 32), "_btEnsureStarted");
  }
}

- (BOOL)aggregate
{
  return self->_aggregate;
}

- (void)setAggregate:(BOOL)a3
{
  self->_aggregate = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (BOOL)connectOnly
{
  return self->_connectOnly;
}

- (void)setConnectOnly:(BOOL)a3
{
  self->_connectOnly = a3;
}

- (NSString)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (unsigned)deviceVersion
{
  return self->_deviceVersion;
}

- (BOOL)disconnectOnly
{
  return self->_disconnectOnly;
}

- (void)setDisconnectOnly:(BOOL)a3
{
  self->_disconnectOnly = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSString)guestAddress
{
  return self->_guestAddress;
}

- (void)setGuestAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSData)guestKey
{
  return self->_guestKey;
}

- (void)setGuestKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (BOOL)guestMode
{
  return self->_guestMode;
}

- (void)setGuestMode:(BOOL)a3
{
  self->_guestMode = a3;
}

- (BOOL)guestPermanent
{
  return self->_guestPermanent;
}

- (void)setGuestPermanent:(BOOL)a3
{
  self->_guestPermanent = a3;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)softwareVolume
{
  return self->_softwareVolume;
}

- (BOOL)userNotInContacts
{
  return self->_userNotInContacts;
}

- (void)setUserNotInContacts:(BOOL)a3
{
  self->_userNotInContacts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_guestKey, 0);
  objc_storeStrong((id *)&self->_guestAddress, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_deviceAddress, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_wpClient, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
}

@end
