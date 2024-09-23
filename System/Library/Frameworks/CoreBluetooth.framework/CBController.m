@implementation CBController

+ (BOOL)bluetoothModificationAllowed
{
  return 0;
}

+ (unint64_t)numberOfPointingDevices
{
  return 0;
}

+ (unint64_t)bluetoothPointingDeviceCount
{
  return 0;
}

+ (unint64_t)nonBluetoothPointingDeviceCount
{
  return 0;
}

+ (BOOL)setBluetoothModificationAllowed:(BOOL)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;

  if (a4)
  {
    CBErrorF(-6735, (uint64_t)"Not supported on this platform. Use MDM instead.", a3, (uint64_t)a4, v4, v5, v6, v7, v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (unsigned)featureFlags
{
  if (qword_1ECF9A158 != -1)
    dispatch_once(&qword_1ECF9A158, &__block_literal_global_0);
  return _MergedGlobals;
}

void __28__CBController_featureFlags__block_invoke()
{
  _MergedGlobals = 1;
}

+ (BOOL)safeToPowerOffBluetooth
{
  return 1;
}

+ (unsigned)getAllowedToPowerOffBluetoothState
{
  return 0;
}

+ (BOOL)systemHasOnlyBluetoothPointingDevices
{
  return 0;
}

- (CBController)init
{
  CBController *v2;
  CBController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CBController;
  v2 = -[CBController init](&v5, sel_init);
  if (v2)
  {
    v2->_clientID = CBXPCGetNextClientID();
    v2->_direct = gCBDaemonServer != 0;
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v2->_ucat = (LogCategory *)&gLogCategory_CBController;
    v3 = v2;
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
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CBController;
  -[CBController dealloc](&v4, sel_dealloc);
}

- (CBController)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CBController *v13;
  int v14;
  int v15;
  int v16;
  CBController *v17;
  const char *v19;
  uint64_t v20;

  v6 = a3;
  v13 = -[CBController init](self, "init");
  if (!v13)
  {
    if (!a4)
      goto LABEL_20;
    v19 = "CBController init failed";
LABEL_19:
    CBErrorF(-6756, (uint64_t)v19, v7, v8, v9, v10, v11, v12, v20);
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (MEMORY[0x1A85D2194](v6) != MEMORY[0x1E0C812F8])
  {
    if (!a4)
      goto LABEL_20;
    v19 = "XPC non-dict";
    goto LABEL_19;
  }
  v14 = CUXPCDecodeUInt64RangedEx();
  if (v14 == 6)
  {
    v13->_assertionFlags = 0;
  }
  else if (v14 == 5)
  {
    goto LABEL_20;
  }
  v15 = CUXPCDecodeUInt64RangedEx();
  if (v15 == 6)
  {
    v13->_clientID = 0;
  }
  else if (v15 == 5)
  {
    goto LABEL_20;
  }
  v16 = CUXPCDecodeUInt64RangedEx();
  if (v16 == 6)
  {
    v13->_internalFlags = 0;
    goto LABEL_12;
  }
  if (v16 == 5)
  {
LABEL_20:
    v17 = 0;
    goto LABEL_14;
  }
LABEL_12:
  objc_opt_class();
  if (!CUXPCDecodeObject())
    goto LABEL_20;
  v17 = v13;
LABEL_14:

  return v17;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  uint64_t assertionFlags;
  uint64_t clientID;
  uint64_t internalFlags;
  xpc_object_t xdict;

  v4 = a3;
  assertionFlags = self->_assertionFlags;
  xdict = v4;
  if ((_DWORD)assertionFlags)
    xpc_dictionary_set_uint64(v4, "asrF", assertionFlags);
  clientID = self->_clientID;
  if ((_DWORD)clientID)
    xpc_dictionary_set_uint64(xdict, "cid", clientID);
  internalFlags = self->_internalFlags;
  if ((_DWORD)internalFlags)
    xpc_dictionary_set_uint64(xdict, "intF", internalFlags);
  CUXPCEncodeObject();

}

- (id)description
{
  return -[CBController descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  id v5;
  CBDevice *remoteDevice;
  id v7;
  void *v9;
  CBDevice *v10;

  NSAppendPrintF_safe();
  v4 = 0;
  if (self->_assertionFlags)
  {
    CUPrintFlags32();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v5 = v4;

    v4 = v5;
  }
  remoteDevice = self->_remoteDevice;
  if (remoteDevice)
  {
    v10 = remoteDevice;
    NSAppendPrintF_safe();
    v7 = v4;

    v4 = v7;
  }
  return v4;
}

- (void)setLabel:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_label, a3);
  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "UTF8String");
  LogCategoryReplaceF();

}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  CBController *v5;
  uint64_t v6;
  id activateCompletion;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5->_activateCalled)
  {
    v5->_activateCalled = 1;
    v6 = MEMORY[0x1A85D1CE4](v4);
    activateCompletion = v5->_activateCompletion;
    v5->_activateCompletion = (id)v6;

    dispatchQueue = v5->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__CBController_activateWithCompletion___block_invoke;
    block[3] = &unk_1E53FF780;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);

}

uint64_t __39__CBController_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int var0;
  void (**v10)(_QWORD, _QWORD);
  id activateCompletion;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  if (self->_bluetoothStateChangedHandler)
    self->_internalFlags |= 1u;
  if (self->_relayMessageHandler)
    self->_internalFlags |= 0x40u;
  if (self->_tipiChangedHandler)
    self->_internalFlags |= 0x200u;
  if (self->_invalidateCalled)
  {
    CBErrorF(-71148, (uint64_t)"Activate after invalidate", v2, v3, v4, v5, v6, v7, v14);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_activateCompletion);
    activateCompletion = self->_activateCompletion;
    self->_activateCompletion = 0;

    if (v10)
    {
      ((void (**)(_QWORD, id))v10)[2](v10, v16);
    }
    else
    {
      v12 = MEMORY[0x1A85D1CE4](self->_errorHandler);
      v13 = (void *)v12;
      if (v12)
        (*(void (**)(uint64_t, id))(v12 + 16))(v12, v16);

    }
  }
  else if (self->_direct)
  {
    -[CBController _activateDirectStart](self, "_activateDirectStart");
  }
  else
  {
    -[CBController _activateXPCStart:](self, "_activateXPCStart:", 0);
  }
}

- (void)_activateDirectStart
{
  int var0;
  uint64_t clientID;
  _QWORD v5[5];

  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    clientID = self->_clientID;
    LogPrintF_safe();
  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__CBController__activateDirectStart__block_invoke;
  v5[3] = &unk_1E53FFB18;
  v5[4] = self;
  objc_msgSend((id)gCBDaemonServer, "activateCBController:completion:", self, v5, clientID);
}

void __36__CBController__activateDirectStart__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 88);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__CBController__activateDirectStart__block_invoke_2;
  v7[3] = &unk_1E53FF5A0;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __36__CBController__activateDirectStart__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, _QWORD);

  v9 = (void (**)(id, _QWORD))MEMORY[0x1A85D1CE4](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_QWORD *)(a1 + 40))
  {
    if (v4 <= 90 && (v4 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    if (v9)
    {
      v9[2](v9, *(_QWORD *)(a1 + 40));
    }
    else
    {
      v5 = MEMORY[0x1A85D1CE4](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
      v6 = (void *)v5;
      if (v5)
        (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, *(_QWORD *)(a1 + 40));

    }
    goto LABEL_17;
  }
  if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  v7 = v9;
  if (v9)
  {
    v9[2](v9, 0);
LABEL_17:
    v7 = v9;
  }

}

- (void)_activateXPCStart:(BOOL)a3
{
  int var0;
  xpc_object_t v5;
  _xpc_connection_s *v6;
  NSObject *dispatchQueue;
  _QWORD handler[5];

  var0 = self->_ucat->var0;
  if (a3)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
LABEL_7:
      LogPrintF_safe();
  }
  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  v5 = xpc_dictionary_create(0, 0, 0);
  -[CBController encodeWithXPCObject:](self, "encodeWithXPCObject:", v5);
  xpc_dictionary_set_string(v5, "mTyp", "CtrA");
  -[CBController _ensureXPCStarted](self, "_ensureXPCStarted");
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __34__CBController__activateXPCStart___block_invoke;
  handler[3] = &unk_1E53FFB40;
  handler[4] = self;
  xpc_connection_send_message_with_reply(v6, v5, dispatchQueue, handler);

}

uint64_t __34__CBController__activateXPCStart___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateXPCCompleted:", a2);
}

- (void)_activateXPCCompleted:(id)a3
{
  id v4;
  void *v5;
  int var0;
  int v7;
  void (**v8)(_QWORD, _QWORD);
  id activateCompletion;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;

  v4 = a3;
  CUXPCDecodeNSErrorIfNeeded();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_activateCompletion);
    activateCompletion = self->_activateCompletion;
    self->_activateCompletion = 0;

    if (v8)
    {
      ((void (**)(_QWORD, void *))v8)[2](v8, v5);
    }
    else
    {
      v10 = MEMORY[0x1A85D1CE4](self->_errorHandler);
      v11 = (void *)v10;
      if (v10)
        (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v5);

    }
  }
  else
  {
    if (CUXPCDecodeSInt64RangedEx() == 6)
      self->_bluetoothState = 0;
    if (CUXPCDecodeSInt64RangedEx() == 6)
      self->_discoverableState = 0;
    if (CUXPCDecodeSInt64RangedEx() == 6)
      self->_inquiryState = 0;
    v7 = self->_ucat->var0;
    if (v7 <= 30 && (v7 != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_activateCompletion);
    v12 = self->_activateCompletion;
    self->_activateCompletion = 0;

    if (v8)
      v8[2](v8, 0);
  }

}

- (id)_ensureXPCStarted
{
  CBController *v2;
  OS_xpc_object *v3;
  _xpc_endpoint_s *v4;
  _xpc_endpoint_s *v5;
  _xpc_connection_s *mach_service;
  _QWORD v8[5];
  OS_xpc_object *v9;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_xpcCnx;
  if (!v3)
  {
    v4 = v2->_testListenerEndpoint;
    v5 = v4;
    if (v4)
    {
      mach_service = xpc_connection_create_from_endpoint(v4);
      xpc_connection_set_target_queue(mach_service, (dispatch_queue_t)v2->_dispatchQueue);
    }
    else
    {
      mach_service = xpc_connection_create_mach_service("com.apple.bluetooth.xpc", (dispatch_queue_t)v2->_dispatchQueue, 0);
    }
    objc_storeStrong((id *)&v2->_xpcCnx, mach_service);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __33__CBController__ensureXPCStarted__block_invoke;
    v8[3] = &unk_1E53FFB68;
    v8[4] = v2;
    v3 = mach_service;
    v9 = v3;
    xpc_connection_set_event_handler(v3, v8);
    xpc_connection_activate(v3);

  }
  objc_sync_exit(v2);

  return v3;
}

_QWORD *__33__CBController__ensureXPCStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[5] == *(_QWORD *)(a1 + 40))
    return (_QWORD *)objc_msgSend(result, "xpcReceivedMessage:", a2);
  return result;
}

- (void)_interrupted
{
  int var0;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (!self->_invalidateCalled)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v4 = MEMORY[0x1A85D1CE4](self->_interruptionHandler);
    v5 = (void *)v4;
    if (v4)
      (*(void (**)(uint64_t))(v4 + 16))(v4);

    self->_bluetoothState = 1;
    v6 = MEMORY[0x1A85D1CE4](self->_bluetoothStateChangedHandler);
    v7 = (void *)v6;
    if (v6)
      (*(void (**)(uint64_t))(v6 + 16))(v6);

    if (self->_activateCalled)
      -[CBController _activateXPCStart:](self, "_activateXPCStart:", 1);
    if (self->_activateAssertionCalled)
      -[CBController _activateAssertionWithFlagsXPC:completion:](self, "_activateAssertionWithFlagsXPC:completion:", self->_assertionFlags, 0);
  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__CBController_invalidate__block_invoke;
  block[3] = &unk_1E53FF780;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__CBController_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  id v6;
  _xpc_connection_s *v7;
  _xpc_connection_s *v8;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 26))
  {
    v2 = result;
    *(_BYTE *)(v1 + 26) = 1;
    v3 = *(_QWORD *)(result + 32);
    v4 = **(_DWORD **)(v3 + 32);
    if (v4 <= 30)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = *(_QWORD *)(v2 + 32), v5))
      {
        LogPrintF_safe();
        v3 = *(_QWORD *)(v2 + 32);
      }
    }
    if (*(_BYTE *)(v3 + 25))
    {
      objc_msgSend((id)v3, "_invalidateDirect");
      v3 = *(_QWORD *)(v2 + 32);
    }
    v6 = (id)v3;
    objc_sync_enter(v6);
    v7 = (_xpc_connection_s *)*(id *)(*(_QWORD *)(v2 + 32) + 40);
    v8 = v7;
    if (v7)
      xpc_connection_cancel(v7);

    objc_sync_exit(v6);
    return objc_msgSend(*(id *)(v2 + 32), "_invalidated");
  }
  return result;
}

- (void)_invalidateDirect
{
  objc_msgSend((id)gCBDaemonServer, "invalidateCBController:completion:");
}

void __33__CBController__invalidateDirect__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 88);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__CBController__invalidateDirect__block_invoke_2;
  block[3] = &unk_1E53FF780;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __33__CBController__invalidateDirect__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_invalidated
{
  CBController *v3;
  OS_xpc_object *xpcCnx;
  id bluetoothStateChangedHandler;
  id discoverableStateChangedHandler;
  id errorHandler;
  id inquiryStateChangedHandler;
  id interruptionHandler;
  id invalidationHandler;
  id relayMessageHandler;
  id tipiChangedHandler;
  void *v13;
  int var0;
  int v15;
  uint64_t v16;

  if (self->_invalidateCalled && !self->_invalidateDone && !self->_direct)
  {
    v3 = self;
    objc_sync_enter(v3);
    xpcCnx = v3->_xpcCnx;
    objc_sync_exit(v3);

    if (!xpcCnx)
    {
      bluetoothStateChangedHandler = v3->_bluetoothStateChangedHandler;
      v3->_bluetoothStateChangedHandler = 0;

      discoverableStateChangedHandler = v3->_discoverableStateChangedHandler;
      v3->_discoverableStateChangedHandler = 0;

      errorHandler = v3->_errorHandler;
      v3->_errorHandler = 0;

      inquiryStateChangedHandler = v3->_inquiryStateChangedHandler;
      v3->_inquiryStateChangedHandler = 0;

      interruptionHandler = v3->_interruptionHandler;
      v3->_interruptionHandler = 0;

      v16 = MEMORY[0x1A85D1CE4](v3->_invalidationHandler);
      invalidationHandler = v3->_invalidationHandler;
      v3->_invalidationHandler = 0;

      relayMessageHandler = v3->_relayMessageHandler;
      v3->_relayMessageHandler = 0;

      tipiChangedHandler = v3->_tipiChangedHandler;
      v3->_tipiChangedHandler = 0;

      v13 = (void *)v16;
      if (v16)
      {
        (*(void (**)(uint64_t))(v16 + 16))(v16);
        v13 = (void *)v16;
      }
      self->_invalidateDone = 1;
      var0 = v3->_ucat->var0;
      if (var0 <= 30)
      {
        if (var0 != -1 || (v15 = _LogCategory_Initialize(), v13 = (void *)v16, v15))
        {
          LogPrintF_safe();
          v13 = (void *)v16;
        }
      }

    }
  }
}

- (void)_updateIfNeededWithBlock:(id)a3
{
  uint64_t (**v4)(_QWORD);
  CBController *v5;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = (uint64_t (**)(_QWORD))a3;
  v5 = self;
  objc_sync_enter(v5);
  if ((v4[2](v4) & 1) != 0 && v5->_activateCalled && !v5->_changesPending)
  {
    v5->_changesPending = 1;
    dispatchQueue = v5->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__CBController__updateIfNeededWithBlock___block_invoke;
    block[3] = &unk_1E53FF780;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);

}

uint64_t __41__CBController__updateIfNeededWithBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

- (void)_update
{
  CBController *v2;
  _BOOL4 changesPending;
  int var0;

  if (!self->_invalidateCalled)
  {
    v2 = self;
    objc_sync_enter(v2);
    changesPending = v2->_changesPending;
    v2->_changesPending = 0;
    objc_sync_exit(v2);

    var0 = v2->_ucat->var0;
    if (changesPending)
    {
      if (var0 > 30 || var0 == -1 && !_LogCategory_Initialize())
        return;
    }
    else if (var0 > 10 || var0 == -1 && !_LogCategory_Initialize())
    {
      return;
    }
    LogPrintF_safe();
  }
}

- (void)xpcReceivedMessage:(id)a3
{
  id v4;
  int var0;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  int v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  CBController *v21;
  OS_xpc_object *xpcCnx;
  void *v23;
  void *v24;
  id v25;

  v4 = a3;
  var0 = self->_ucat->var0;
  v25 = v4;
  if (var0 <= 9)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), v4 = v25, v6))
    {
      CUPrintXPC();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

      v4 = v25;
    }
  }
  if (MEMORY[0x1A85D2194](v4) == MEMORY[0x1E0C812F8])
  {
    -[CBController _xpcReceivedMessage:](self, "_xpcReceivedMessage:", v25);
    goto LABEL_26;
  }
  if (v25 == (id)MEMORY[0x1E0C81258])
  {
    -[CBController _interrupted](self, "_interrupted");
    goto LABEL_26;
  }
  if (v25 != (id)MEMORY[0x1E0C81260])
  {
    CUXPCDecodeNSErrorIfNeeded();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v7;
    if (v7)
    {
      v15 = v7;

      v16 = self->_ucat->var0;
      if (v16 > 90)
        goto LABEL_21;
    }
    else
    {
      CBErrorF(-6700, (uint64_t)"XPC event error", v8, v9, v10, v11, v12, v13, (uint64_t)v23);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      v16 = self->_ucat->var0;
      if (v16 > 90)
      {
LABEL_21:
        v19 = MEMORY[0x1A85D1CE4](self->_errorHandler);
        v20 = (void *)v19;
        if (v19)
          (*(void (**)(uint64_t, id))(v19 + 16))(v19, v15);

        goto LABEL_26;
      }
    }
    if (v16 != -1 || _LogCategory_Initialize())
    {
      CUPrintNSError();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      CUPrintXPC();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    goto LABEL_21;
  }
  if (!self->_invalidateCalled)
  {
    v17 = self->_ucat->var0;
    if (v17 <= 90 && (v17 != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
  }
  v21 = self;
  objc_sync_enter(v21);
  xpcCnx = v21->_xpcCnx;
  v21->_xpcCnx = 0;

  objc_sync_exit(v21);
  -[CBController _invalidated](v21, "_invalidated");
LABEL_26:

}

- (void)_xpcReceivedMessage:(id)a3
{
  const char *string;
  const char *v5;
  int v6;
  int var0;
  id v8;

  v8 = a3;
  string = xpc_dictionary_get_string(v8, "mTyp");
  if (!string)
  {
    var0 = self->_ucat->var0;
    if (var0 > 90 || var0 == -1 && !_LogCategory_Initialize())
      goto LABEL_13;
LABEL_12:
    LogPrintF_safe();
LABEL_13:

    return;
  }
  v5 = string;
  if (!strcmp(string, "DscC"))
  {
    -[CBController _xpcReceivedDiscoverableStateChanged:](self, "_xpcReceivedDiscoverableStateChanged:", v8);

  }
  else if (!strcmp(v5, "InqC"))
  {
    -[CBController _xpcReceivedInquiryStateChanged:](self, "_xpcReceivedInquiryStateChanged:", v8);

  }
  else if (!strcmp(v5, "PwrC"))
  {
    -[CBController _xpcReceivedPowerStateChanged:](self, "_xpcReceivedPowerStateChanged:", v8);

  }
  else if (!strcmp(v5, "RlMR"))
  {
    -[CBController _xpcReceivedRelayMessage:](self, "_xpcReceivedRelayMessage:", v8);

  }
  else
  {
    if (strcmp(v5, "TpiC"))
    {
      v6 = self->_ucat->var0;
      if (v6 > 90 || v6 == -1 && !_LogCategory_Initialize())
        goto LABEL_13;
      goto LABEL_12;
    }
    -[CBController _xpcReceivedTipiChanged:](self, "_xpcReceivedTipiChanged:", v8);

  }
}

- (void)_xpcReceivedDiscoverableStateChanged:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int var0;

  v4 = a3;
  if (MEMORY[0x1A85D2194]() == MEMORY[0x1E0C812F8])
  {
    if (CUXPCDecodeSInt64RangedEx() == 6)
      self->_discoverableState = 0;
    v5 = MEMORY[0x1A85D1CE4](self->_discoverableStateChangedHandler);
    v6 = (void *)v5;
    if (v5)
      (*(void (**)(uint64_t))(v5 + 16))(v5);

    goto LABEL_7;
  }
  var0 = self->_ucat->var0;
  if (var0 > 90 || var0 == -1 && !_LogCategory_Initialize())
  {
LABEL_7:

    return;
  }
  LogPrintF_safe();

}

- (void)_xpcReceivedInquiryStateChanged:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int var0;

  v4 = a3;
  if (MEMORY[0x1A85D2194]() == MEMORY[0x1E0C812F8])
  {
    if (CUXPCDecodeSInt64RangedEx() == 6)
      self->_inquiryState = 0;
    v5 = MEMORY[0x1A85D1CE4](self->_inquiryStateChangedHandler);
    v6 = (void *)v5;
    if (v5)
      (*(void (**)(uint64_t))(v5 + 16))(v5);

    goto LABEL_7;
  }
  var0 = self->_ucat->var0;
  if (var0 > 90 || var0 == -1 && !_LogCategory_Initialize())
  {
LABEL_7:

    return;
  }
  LogPrintF_safe();

}

- (void)_xpcReceivedPowerStateChanged:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int var0;

  v4 = a3;
  if (MEMORY[0x1A85D2194]() == MEMORY[0x1E0C812F8])
  {
    if (CUXPCDecodeSInt64RangedEx() == 6)
      self->_bluetoothState = 0;
    v5 = MEMORY[0x1A85D1CE4](self->_bluetoothStateChangedHandler);
    v6 = (void *)v5;
    if (v5)
      (*(void (**)(uint64_t))(v5 + 16))(v5);

    goto LABEL_7;
  }
  var0 = self->_ucat->var0;
  if (var0 > 90 || var0 == -1 && !_LogCategory_Initialize())
  {
LABEL_7:

    return;
  }
  LogPrintF_safe();

}

- (void)_xpcReceivedRelayMessage:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD);
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85D1CE4](self->_relayMessageHandler);
  if (v5)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__1;
    v16 = __Block_byref_object_dispose__1;
    v17 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __41__CBController__xpcReceivedRelayMessage___block_invoke;
    v11[3] = &unk_1E53FF8C0;
    v11[4] = self;
    v11[5] = &v12;
    v6 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v11);
    if (MEMORY[0x1A85D2194](v4) == MEMORY[0x1E0C812F8])
    {
      objc_opt_class();
      CUXPCDecodeObject();
      v7 = 0;
      CUPrintNSError();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSPrintF_safe();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v13[5];
      v13[5] = v8;

    }
    else
    {
      v7 = (id)v13[5];
      v13[5] = (uint64_t)CFSTR("non-dict message");
    }

    v6[2](v6);
    _Block_object_dispose(&v12, 8);

  }
}

uint64_t __41__CBController__xpcReceivedRelayMessage___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
  {
    result = *(_QWORD *)(*(_QWORD *)(result + 32) + 32);
    if (*(int *)result <= 90)
    {
      if (*(_DWORD *)result != -1)
        return LogPrintF_safe();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF_safe();
    }
  }
  return result;
}

- (void)_xpcReceivedTipiChanged:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD);
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85D1CE4](self->_tipiChangedHandler);
  if (v5)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__1;
    v16 = __Block_byref_object_dispose__1;
    v17 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __40__CBController__xpcReceivedTipiChanged___block_invoke;
    v11[3] = &unk_1E53FF8C0;
    v11[4] = self;
    v11[5] = &v12;
    v6 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v11);
    if (MEMORY[0x1A85D2194](v4) == MEMORY[0x1E0C812F8])
    {
      objc_opt_class();
      CUXPCDecodeObject();
      v7 = 0;
      CUPrintNSError();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSPrintF_safe();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v13[5];
      v13[5] = v8;

    }
    else
    {
      v7 = (id)v13[5];
      v13[5] = (uint64_t)CFSTR("non-dict message");
    }

    v6[2](v6);
    _Block_object_dispose(&v12, 8);

  }
}

uint64_t __40__CBController__xpcReceivedTipiChanged___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
  {
    result = *(_QWORD *)(*(_QWORD *)(result + 32) + 32);
    if (*(int *)result <= 90)
    {
      if (*(_DWORD *)result != -1)
        return LogPrintF_safe();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF_safe();
    }
  }
  return result;
}

- (void)activateAssertionWithFlags:(unsigned int)a3 completion:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CBController_activateAssertionWithFlags_completion___block_invoke;
  block[3] = &unk_1E54006C0;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __54__CBController_activateAssertionWithFlags_completion___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = *(_DWORD *)(a1 + 48);
  v2 = *(_BYTE **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(unsigned int *)(a1 + 48);
  if (v2[25])
    return objc_msgSend(v2, "_activateAssertionWithFlagsDirect:completion:", v4, v3);
  else
    return objc_msgSend(v2, "_activateAssertionWithFlagsXPC:completion:", v4, v3);
}

- (void)_activateAssertionWithFlagsDirect:(unsigned int)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  v6 = (void *)gCBDaemonServer;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__CBController__activateAssertionWithFlagsDirect_completion___block_invoke;
  v8[3] = &unk_1E54006E8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "activateCBController:completion:", self, v8);

}

void __61__CBController__activateAssertionWithFlagsDirect_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__CBController__activateAssertionWithFlagsDirect_completion___block_invoke_2;
  block[3] = &unk_1E53FF820;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v7;
  v12 = v6;
  v8 = v3;
  dispatch_async(v5, block);

}

void __61__CBController__activateAssertionWithFlagsDirect_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void (**v3)(_QWORD, _QWORD);
  id v4;

  v2 = a1[6];
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, a1[4]);
  }
  else if (a1[4])
  {
    v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](*(_QWORD *)(a1[5] + 96));
    if (v3)
    {
      v4 = v3;
      v3[2](v3, a1[4]);
      v3 = (void (**)(_QWORD, _QWORD))v4;
    }

  }
}

- (void)_activateAssertionWithFlagsXPC:(unsigned int)a3 completion:(id)a4
{
  id v5;
  xpc_object_t v6;
  _xpc_connection_s *v7;
  NSObject *dispatchQueue;
  id v9;
  _QWORD v10[5];
  id v11;

  v5 = a4;
  v6 = xpc_dictionary_create(0, 0, 0);
  -[CBController encodeWithXPCObject:](self, "encodeWithXPCObject:", v6);
  xpc_dictionary_set_string(v6, "mTyp", "CtrA");
  -[CBController _ensureXPCStarted](self, "_ensureXPCStarted");
  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = self->_dispatchQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__CBController__activateAssertionWithFlagsXPC_completion___block_invoke;
  v10[3] = &unk_1E5400710;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  xpc_connection_send_message_with_reply(v7, v6, dispatchQueue, v10);

}

void __58__CBController__activateAssertionWithFlagsXPC_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v6 = v2;
    (*(void (**)(void))(v3 + 16))();
LABEL_7:
    v2 = v6;
    goto LABEL_8;
  }
  if (v2)
  {
    v6 = v2;
    v4 = MEMORY[0x1A85D1CE4](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
    v5 = (void *)v4;
    if (v4)
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);

    goto LABEL_7;
  }
LABEL_8:

}

+ (id)controllerInfoAndReturnError:(id *)a3
{
  return (id)objc_msgSend(a1, "controllerInfoWithEndpoint:error:", 0, a3);
}

+ (id)controllerInfoWithEndpoint:(id)a3 error:(id *)a4
{
  id v5;
  xpc_object_t v6;
  NSObject *v7;
  NSObject *v8;
  _xpc_endpoint_s *v9;
  _xpc_endpoint_s *v10;
  _xpc_connection_s *mach_service;
  xpc_object_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  CBControllerInfo *v27;
  id v28;
  id v29;
  CBControllerInfo *v30;
  uint64_t v32;
  id v33;

  v5 = a3;
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "mTyp", "GCtI");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = dispatch_queue_create("CBController-GetInfo", v7);

  v9 = (_xpc_endpoint_s *)v5;
  v10 = v9;
  if (v9)
  {
    mach_service = xpc_connection_create_from_endpoint(v9);
    xpc_connection_set_target_queue(mach_service, v8);
  }
  else
  {
    mach_service = xpc_connection_create_mach_service("com.apple.bluetooth.xpc", v8, 0);
  }
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_70);
  xpc_connection_activate(mach_service);
  v12 = xpc_connection_send_message_with_reply_sync(mach_service, v6);
  xpc_connection_cancel(mach_service);
  if (v12)
  {
    CUXPCDecodeNSErrorIfNeeded();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v29 = v19;
      if (a4)
      {
        v29 = objc_retainAutorelease(v19);
        v27 = 0;
        *a4 = v29;
      }
      else
      {
        v27 = 0;
      }
    }
    else
    {
      xpc_dictionary_get_value(v12, "ctrI");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v33 = 0;
        v27 = -[CBControllerInfo initWithXPCObject:error:]([CBControllerInfo alloc], "initWithXPCObject:error:", v26, &v33);
        v28 = v33;
        v29 = v28;
        if (v27)
        {
          v30 = v27;
        }
        else if (a4)
        {
          *a4 = objc_retainAutorelease(v28);
        }

      }
      else if (a4)
      {
        CBErrorF(-6762, (uint64_t)"No controller info", v20, v21, v22, v23, v24, v25, v32);
        v27 = 0;
        v29 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v27 = 0;
        v29 = 0;
      }

    }
  }
  else if (a4)
  {
    CBErrorF(-6700, (uint64_t)"No reply", v13, v14, v15, v16, v17, v18, v32);
    v27 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void)getControllerInfoWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__CBController_getControllerInfoWithCompletion___block_invoke;
  v7[3] = &unk_1E54007A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __48__CBController_getControllerInfoWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "encodeWithXPCObject:", v2);
  xpc_dictionary_set_string(v2, "mTyp", "GCtI");
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __48__CBController_getControllerInfoWithCompletion___block_invoke_2;
  handler[3] = &unk_1E5400778;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __48__CBController_getControllerInfoWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  CBControllerInfo *v12;
  id v13;
  CBControllerInfo *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;

  v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v13 = (id)v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    xpc_dictionary_get_value(v3, "ctrI");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v19 = 0;
      v12 = -[CBControllerInfo initWithXPCObject:error:]([CBControllerInfo alloc], "initWithXPCObject:error:", v11, &v19);
      v13 = v19;
      if (v12)
      {
        v14 = v12;
        v15 = 0;
      }
      else
      {
        v14 = 0;
        v15 = v13;
      }
      (*(void (**)(_QWORD, CBControllerInfo *, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v14, v15);

    }
    else
    {
      v16 = *(_QWORD *)(a1 + 32);
      CBErrorF(-6762, (uint64_t)"No controller info", v5, v6, v7, v8, v9, v10, v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v17);

      v13 = 0;
    }

  }
}

- (void)getControllerSettingsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__CBController_getControllerSettingsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E54007A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __59__CBController_getControllerSettingsWithCompletionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "encodeWithXPCObject:", v2);
  xpc_dictionary_set_string(v2, "mTyp", "GCtS");
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __59__CBController_getControllerSettingsWithCompletionHandler___block_invoke_2;
  handler[3] = &unk_1E5400778;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __59__CBController_getControllerSettingsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v12 = (void *)v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_opt_class();
    CUXPCDecodeObject();
    v5 = 0;
    v12 = v5;
    v13 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      (*(void (**)(uint64_t))(v13 + 16))(v13);
    }
    else
    {
      CBErrorF(-6762, (uint64_t)"No settings", v6, v7, v8, v9, v10, v11, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

    }
  }

}

- (void)modifyControllerSettings:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CBController_modifyControllerSettings_completionHandler___block_invoke;
  block[3] = &unk_1E54007C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __59__CBController_modifyControllerSettings_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  NSObject *v4;
  _QWORD handler[4];
  id v6;

  v2 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "encodeWithXPCObject:", v2);
  xpc_dictionary_set_string(v2, "mTyp", "MCtS");
  CUXPCEncodeObject();
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __59__CBController_modifyControllerSettings_completionHandler___block_invoke_2;
  handler[3] = &unk_1E5400778;
  v6 = *(id *)(a1 + 48);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);

}

void __59__CBController_modifyControllerSettings_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)getDevicesWithFlags:(unsigned int)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CBController_getDevicesWithFlags_completionHandler___block_invoke;
  block[3] = &unk_1E54006C0;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __54__CBController_getDevicesWithFlags_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t v3;
  _xpc_connection_s *v4;
  void *v5;
  NSObject *v6;
  _QWORD handler[4];
  id v8;

  v2 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "encodeWithXPCObject:", v2);
  xpc_dictionary_set_string(v2, "mTyp", "GtDv");
  v3 = *(unsigned int *)(a1 + 48);
  if ((_DWORD)v3)
    xpc_dictionary_set_uint64(v2, "gDvF", v3);
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __54__CBController_getDevicesWithFlags_completionHandler___block_invoke_2;
  handler[3] = &unk_1E5400778;
  v8 = v5;
  xpc_connection_send_message_with_reply(v4, v2, v6, handler);

}

void __54__CBController_getDevicesWithFlags_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v12 = (void *)v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_opt_class();
    CUXPCDecodeNSArrayOfClass();
    v5 = 0;
    v12 = v5;
    v13 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      (*(void (**)(uint64_t))(v13 + 16))(v13);
    }
    else
    {
      CBErrorF(-6762, (uint64_t)"No device array", v6, v7, v8, v9, v10, v11, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

    }
  }

}

+ (id)performDeviceRequest:(id)a3 device:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "performDeviceRequest:device:xpcEndpoint:error:", a3, a4, 0, a5);
}

+ (id)performDeviceRequest:(id)a3 device:(id)a4 xpcEndpoint:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  xpc_object_t v12;
  NSObject *v13;
  NSObject *v14;
  _xpc_endpoint_s *v15;
  _xpc_endpoint_s *v16;
  _xpc_connection_s *mach_service;
  xpc_object_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v29;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v12, "mTyp", "PfDR");
  CUXPCEncodeObject();

  CUXPCEncodeObject();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = dispatch_queue_create("CBController-Perform", v13);

  v15 = (_xpc_endpoint_s *)v9;
  v16 = v15;
  if (v15)
  {
    mach_service = xpc_connection_create_from_endpoint(v15);
    xpc_connection_set_target_queue(mach_service, v14);
  }
  else
  {
    mach_service = xpc_connection_create_mach_service("com.apple.bluetooth.xpc", v14, 0);
  }
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_87);
  xpc_connection_activate(mach_service);
  v18 = xpc_connection_send_message_with_reply_sync(mach_service, v12);
  xpc_connection_cancel(mach_service);
  if (v18)
  {
    CUXPCDecodeNSErrorIfNeeded();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v27 = v25;
      if (a6)
      {
        v27 = objc_retainAutorelease(v25);
        *a6 = v27;
      }
    }
    else
    {
      objc_opt_class();
      CUXPCDecodeObject();
      v26 = 0;
      v27 = v26;
      if (a6)
        *a6 = objc_retainAutorelease(v26);

    }
  }
  else if (a6)
  {
    CBErrorF(-6700, (uint64_t)"No reply", v19, v20, v21, v22, v23, v24, v29);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (void)performDeviceRequest:(id)a3 device:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__CBController_performDeviceRequest_device_completion___block_invoke;
  v15[3] = &unk_1E5400810;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(dispatchQueue, v15);

}

void __55__CBController_performDeviceRequest_device_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  NSObject *v4;
  _QWORD handler[4];
  id v6;

  v2 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "encodeWithXPCObject:", v2);
  xpc_dictionary_set_string(v2, "mTyp", "PfDR");
  CUXPCEncodeObject();
  CUXPCEncodeObject();
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __55__CBController_performDeviceRequest_device_completion___block_invoke_2;
  handler[3] = &unk_1E5400778;
  v6 = *(id *)(a1 + 56);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);

}

void __55__CBController_performDeviceRequest_device_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  CBDeviceResponse *v12;
  id v13;
  CBDeviceResponse *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;

  v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v13 = (id)v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    xpc_dictionary_get_value(v3, "dvRs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v19 = 0;
      v12 = -[CBDeviceResponse initWithXPCObject:error:]([CBDeviceResponse alloc], "initWithXPCObject:error:", v11, &v19);
      v13 = v19;
      if (v12)
      {
        v14 = v12;
        v15 = 0;
      }
      else
      {
        v14 = 0;
        v15 = v13;
      }
      (*(void (**)(_QWORD, CBDeviceResponse *, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v14, v15);

    }
    else
    {
      v16 = *(_QWORD *)(a1 + 32);
      CBErrorF(-6762, (uint64_t)"No device response", v5, v6, v7, v8, v9, v10, v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v17);

      v13 = 0;
    }

  }
}

- (void)deleteDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CBController_deleteDevice_completion___block_invoke;
  block[3] = &unk_1E54007C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __40__CBController_deleteDevice_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  NSObject *v4;
  _QWORD handler[4];
  id v6;

  v2 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "encodeWithXPCObject:", v2);
  xpc_dictionary_set_string(v2, "mTyp", "DltD");
  CUXPCEncodeObject();
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __40__CBController_deleteDevice_completion___block_invoke_2;
  handler[3] = &unk_1E5400778;
  v6 = *(id *)(a1 + 48);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);

}

void __40__CBController_deleteDevice_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)modifyDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CBController_modifyDevice_completion___block_invoke;
  block[3] = &unk_1E54007C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __40__CBController_modifyDevice_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  NSObject *v4;
  _QWORD handler[4];
  id v6;

  v2 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "encodeWithXPCObject:", v2);
  xpc_dictionary_set_string(v2, "mTyp", "UpDv");
  CUXPCEncodeObject();
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __40__CBController_modifyDevice_completion___block_invoke_2;
  handler[3] = &unk_1E5400778;
  v6 = *(id *)(a1 + 48);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);

}

void __40__CBController_modifyDevice_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)modifyDevice:(id)a3 connectionPriorityDevices:(id)a4 timeoutSeconds:(double)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *dispatchQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  double v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__CBController_modifyDevice_connectionPriorityDevices_timeoutSeconds_completionHandler___block_invoke;
  block[3] = &unk_1E5400838;
  block[4] = self;
  v18 = v10;
  v21 = a5;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(dispatchQueue, block);

}

void __88__CBController_modifyDevice_connectionPriorityDevices_timeoutSeconds_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  double v3;
  _xpc_connection_s *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "encodeWithXPCObject:", v2);
  xpc_dictionary_set_string(v2, "mTyp", "UpDv");
  CUXPCEncodeObject();
  CUXPCEncodeNSArrayOfNSString();
  v3 = *(double *)(a1 + 64);
  if (v3 != 0.0)
    xpc_dictionary_set_double(v2, "timO", v3);
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __88__CBController_modifyDevice_connectionPriorityDevices_timeoutSeconds_completionHandler___block_invoke_2;
  handler[3] = &unk_1E5400778;
  v7 = *(id *)(a1 + 56);
  xpc_connection_send_message_with_reply(v4, v2, v5, handler);

}

void __88__CBController_modifyDevice_connectionPriorityDevices_timeoutSeconds_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)modifyDevice:(id)a3 peerSourceDevice:(id)a4 peerSourceState:(char)a5 completionHandler:(id)a6
{
  -[CBController modifyDevice:peerSourceDevice:peerSourceState:requestFlags:completionHandler:](self, "modifyDevice:peerSourceDevice:peerSourceState:requestFlags:completionHandler:", a3, a4, a5, 0, a6);
}

- (void)modifyDevice:(id)a3 peerSourceDevice:(id)a4 peerSourceState:(char)a5 requestFlags:(unsigned int)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *dispatchQueue;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  unsigned int v23;
  char v24;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__CBController_modifyDevice_peerSourceDevice_peerSourceState_requestFlags_completionHandler___block_invoke;
  block[3] = &unk_1E5400860;
  block[4] = self;
  v20 = v12;
  v24 = a5;
  v23 = a6;
  v21 = v13;
  v22 = v14;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  dispatch_async(dispatchQueue, block);

}

void __93__CBController_modifyDevice_peerSourceDevice_peerSourceState_requestFlags_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t v3;
  _xpc_connection_s *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "encodeWithXPCObject:", v2);
  xpc_dictionary_set_string(v2, "mTyp", "UpDv");
  CUXPCEncodeObject();
  CUXPCEncodeObject();
  if (*(_BYTE *)(a1 + 68))
    xpc_dictionary_set_int64(v2, "prSS", *(char *)(a1 + 68));
  v3 = *(unsigned int *)(a1 + 64);
  if ((_DWORD)v3)
    xpc_dictionary_set_uint64(v2, "dvRF", v3);
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __93__CBController_modifyDevice_peerSourceDevice_peerSourceState_requestFlags_completionHandler___block_invoke_2;
  handler[3] = &unk_1E5400778;
  v7 = *(id *)(a1 + 56);
  xpc_connection_send_message_with_reply(v4, v2, v5, handler);

}

void __93__CBController_modifyDevice_peerSourceDevice_peerSourceState_requestFlags_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)modifyDevice:(id)a3 settings:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __49__CBController_modifyDevice_settings_completion___block_invoke;
  v15[3] = &unk_1E5400810;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(dispatchQueue, v15);

}

void __49__CBController_modifyDevice_settings_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  NSObject *v4;
  _QWORD handler[4];
  id v6;

  v2 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "encodeWithXPCObject:", v2);
  xpc_dictionary_set_string(v2, "mTyp", "UpDv");
  CUXPCEncodeObject();
  CUXPCEncodeObject();
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __49__CBController_modifyDevice_settings_completion___block_invoke_2;
  handler[3] = &unk_1E5400778;
  v6 = *(id *)(a1 + 56);
  xpc_connection_send_message_with_reply(v3, v2, v4, handler);

}

void __49__CBController_modifyDevice_settings_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)diagnosticControl:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CBController_diagnosticControl_completion___block_invoke;
  block[3] = &unk_1E54007C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __45__CBController_diagnosticControl_completion___block_invoke(id *a1)
{
  xpc_object_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  uint64_t v15;
  _QWORD handler[4];
  id v17;

  v2 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(a1[4], "encodeWithXPCObject:", v2);
  xpc_dictionary_set_string(v2, "mTyp", "DiCt");
  v3 = a1[5];
  if (v3)
  {
    v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (!v4)
    {
      v13 = (void (**)(id, _QWORD, void *))a1[6];
      CBErrorF(-6700, (uint64_t)"Params conversion failed", v5, v6, v7, v8, v9, v10, v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, 0, v14);

      goto LABEL_5;
    }
    v11 = v4;
    xpc_dictionary_set_value(v2, "parm", v4);

  }
  objc_msgSend(a1[4], "_ensureXPCStarted");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v12 = *((_QWORD *)a1[4] + 11);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __45__CBController_diagnosticControl_completion___block_invoke_2;
  handler[3] = &unk_1E5400778;
  v17 = a1[6];
  xpc_connection_send_message_with_reply((xpc_connection_t)v3, v2, v12, handler);

LABEL_5:
}

void __45__CBController_diagnosticControl_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v10 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    v11 = *(_QWORD *)(a1 + 32);
    if (v10)
    {
      (*(void (**)(uint64_t, void *, _QWORD))(v11 + 16))(v11, v10, 0);
    }
    else
    {
      CBErrorF(-6700, (uint64_t)"No error, no response", v4, v5, v6, v7, v8, v9, v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);

    }
  }

}

- (void)diagnosticLog:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CBController_diagnosticLog_completion___block_invoke;
  block[3] = &unk_1E54007C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __41__CBController_diagnosticLog_completion___block_invoke(id *a1)
{
  xpc_object_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  uint64_t v15;
  _QWORD handler[4];
  id v17;

  v2 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(a1[4], "encodeWithXPCObject:", v2);
  xpc_dictionary_set_string(v2, "mTyp", "DiLg");
  v3 = a1[5];
  if (v3)
  {
    v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (!v4)
    {
      v13 = (void (**)(id, _QWORD, void *))a1[6];
      CBErrorF(-6700, (uint64_t)"Params conversion failed", v5, v6, v7, v8, v9, v10, v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, 0, v14);

      goto LABEL_5;
    }
    v11 = v4;
    xpc_dictionary_set_value(v2, "parm", v4);

  }
  objc_msgSend(a1[4], "_ensureXPCStarted");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v12 = *((_QWORD *)a1[4] + 11);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __41__CBController_diagnosticLog_completion___block_invoke_2;
  handler[3] = &unk_1E5400778;
  v17 = a1[6];
  xpc_connection_send_message_with_reply((xpc_connection_t)v3, v2, v12, handler);

LABEL_5:
}

void __41__CBController_diagnosticLog_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v10 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    v11 = *(_QWORD *)(a1 + 32);
    if (v10)
    {
      (*(void (**)(uint64_t, void *, _QWORD))(v11 + 16))(v11, v10, 0);
    }
    else
    {
      CBErrorF(-6700, (uint64_t)"No error, no response", v4, v5, v6, v7, v8, v9, v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);

    }
  }

}

- (void)diagnosticShow:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CBController_diagnosticShow_completion___block_invoke;
  block[3] = &unk_1E54007C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __42__CBController_diagnosticShow_completion___block_invoke(id *a1)
{
  xpc_object_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  uint64_t v15;
  _QWORD handler[4];
  id v17;

  v2 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(a1[4], "encodeWithXPCObject:", v2);
  xpc_dictionary_set_string(v2, "mTyp", "DiSh");
  v3 = a1[5];
  if (v3)
  {
    v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (!v4)
    {
      v13 = (void (**)(id, _QWORD, void *))a1[6];
      CBErrorF(-6700, (uint64_t)"Params conversion failed", v5, v6, v7, v8, v9, v10, v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, 0, v14);

      goto LABEL_5;
    }
    v11 = v4;
    xpc_dictionary_set_value(v2, "parm", v4);

  }
  objc_msgSend(a1[4], "_ensureXPCStarted");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v12 = *((_QWORD *)a1[4] + 11);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __42__CBController_diagnosticShow_completion___block_invoke_2;
  handler[3] = &unk_1E5400778;
  v17 = a1[6];
  xpc_connection_send_message_with_reply((xpc_connection_t)v3, v2, v12, handler);

LABEL_5:
}

void __42__CBController_diagnosticShow_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v10 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    v11 = *(_QWORD *)(a1 + 32);
    if (v10)
    {
      (*(void (**)(uint64_t, void *, _QWORD))(v11 + 16))(v11, v10, 0);
    }
    else
    {
      CBErrorF(-6700, (uint64_t)"No error, no response", v4, v5, v6, v7, v8, v9, v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);

    }
  }

}

- (void)setLowPowerModeWithReason:(int)a3 completion:(id)a4
{
  id v6;
  xpc_object_t v7;
  _xpc_connection_s *v8;
  NSObject *dispatchQueue;
  id v10;
  _QWORD handler[4];
  id v12;

  v6 = a4;
  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "mTyp", "LpmS");
  xpc_dictionary_set_int64(v7, "ctrP", a3);
  -[CBController _ensureXPCStarted](self, "_ensureXPCStarted");
  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_CBController <= 30 && (gLogCategory_CBController != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __53__CBController_setLowPowerModeWithReason_completion___block_invoke;
  handler[3] = &unk_1E5400778;
  v12 = v6;
  v10 = v6;
  xpc_connection_send_message_with_reply(v8, v7, dispatchQueue, handler);

}

void __53__CBController_setLowPowerModeWithReason_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  CUXPCDecodeNSErrorIfNeeded();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_CBController <= 30 && (gLogCategory_CBController != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (BOOL)setLowPowerModeWithReason:(int)a3 error:(id *)a4
{
  xpc_object_t v7;
  _xpc_connection_s *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  xpc_object_t v15;
  void *v16;
  void *v17;
  BOOL v18;
  uint64_t v20;

  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "mTyp", "LpmS");
  xpc_dictionary_set_int64(v7, "ctrP", a3);
  -[CBController _ensureXPCStarted](self, "_ensureXPCStarted");
  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v15 = xpc_connection_send_message_with_reply_sync(v8, v7);
  if (v15)
  {
    CUXPCDecodeNSErrorIfNeeded();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v16 == 0;
    if (v16 && a4)
      *a4 = objc_retainAutorelease(v16);

  }
  else if (a4)
  {
    CBErrorF(-6700, (uint64_t)"No reply", v9, v10, v11, v12, v13, v14, v20);
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (void)setOfflineAdvertisingParams:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend((id)gCBDaemonServer, "stackController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setOfflineAdvertisingParams:", v5);
  }
  else if (gLogCategory_CBController <= 90
         && (gLogCategory_CBController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();

    return;
  }

}

- (void)getPowerStateWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__CBController_getPowerStateWithCompletion___block_invoke;
  v7[3] = &unk_1E54007A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __44__CBController_getPowerStateWithCompletion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "encodeWithXPCObject:", v2);
  xpc_dictionary_set_string(v2, "mTyp", "PwrG");
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __44__CBController_getPowerStateWithCompletion___block_invoke_2;
  handler[3] = &unk_1E5400778;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __44__CBController_getPowerStateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 || (CUXPCDecodeSInt64RangedEx(), (v4 = 0) != 0))
  {
    v5 = v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)setPowerState:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CBController_setPowerState_completion___block_invoke;
  block[3] = &unk_1E5400888;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __41__CBController_setPowerState_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "encodeWithXPCObject:", v2);
  xpc_dictionary_set_string(v2, "mTyp", "PwrS");
  xpc_dictionary_set_int64(v2, "pwrS", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __41__CBController_setPowerState_completion___block_invoke_2;
  handler[3] = &unk_1E5400778;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __41__CBController_setPowerState_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

+ (id)readPrefKeys:(id)a3 error:(id *)a4
{
  id v5;
  xpc_object_t v6;
  NSObject *v7;
  NSObject *v8;
  _xpc_connection_s *mach_service;
  xpc_object_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v36;

  v5 = a3;
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "mTyp", "RdPf");
  CUXPCEncodeNSArrayOfNSString();

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = dispatch_queue_create("CBController-ReadPrefs", v7);

  mach_service = xpc_connection_create_mach_service("com.apple.bluetooth.xpc", v8, 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_115);
  xpc_connection_activate(mach_service);
  v10 = xpc_connection_send_message_with_reply_sync(mach_service, v6);
  xpc_connection_cancel(mach_service);
  if (v10)
  {
    CUXPCDecodeNSErrorIfNeeded();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v33 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v17);
    }
    else
    {
      xpc_dictionary_get_value(v10, "pfVs");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v26 = (void *)_CFXPCCreateCFObjectFromXPCObject();
        v33 = v26;
        if (v26)
        {
          v34 = v26;
        }
        else if (a4)
        {
          CBErrorF(-6700, (uint64_t)"Bad XPC prefs", v27, v28, v29, v30, v31, v32, v36);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
      else if (a4)
      {
        CBErrorF(-6762, (uint64_t)"No XPC prefs", v19, v20, v21, v22, v23, v24, v36);
        v33 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = 0;
      }

    }
  }
  else if (a4)
  {
    CBErrorF(-6700, (uint64_t)"No reply", v11, v12, v13, v14, v15, v16, v36);
    v33 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

+ (BOOL)writePrefKey:(id)a3 value:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  xpc_object_t v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  _xpc_connection_s *mach_service;
  xpc_object_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  BOOL v32;
  uint64_t v34;

  v7 = a4;
  v8 = a3;
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v9, "mTyp", "WrPf");
  v10 = v9;
  v11 = objc_retainAutorelease(v8);
  v12 = (const char *)objc_msgSend(v11, "UTF8String");

  if (v12)
    xpc_dictionary_set_string(v10, "pfKy", v12);

  v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v13)
  {
    xpc_dictionary_set_value(v10, "pfVl", v13);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create("CBController-WritePrefs", v20);

    mach_service = xpc_connection_create_mach_service("com.apple.bluetooth.xpc", v21, 0);
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_124);
    xpc_connection_activate(mach_service);
    v23 = xpc_connection_send_message_with_reply_sync(mach_service, v10);
    xpc_connection_cancel(mach_service);
    if (v23)
    {
      CUXPCDecodeNSErrorIfNeeded();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      v32 = v30 == 0;
      if (v30 && a5)
        *a5 = objc_retainAutorelease(v30);

    }
    else if (a5)
    {
      CBErrorF(-6700, (uint64_t)"No reply", v24, v25, v26, v27, v28, v29, v34);
      v32 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = 0;
    }

  }
  else if (a5)
  {
    CBErrorF(-6756, (uint64_t)"Bad value type", v14, v15, v16, v17, v18, v19, v34);
    v32 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (void)sendRelayMessageType:(unsigned __int8)a3 messageData:(id)a4 conduitDevice:(id)a5 destinationDevice:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *dispatchQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  CBController *v25;
  id v26;
  unsigned __int8 v27;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  dispatchQueue = self->_dispatchQueue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __99__CBController_sendRelayMessageType_messageData_conduitDevice_destinationDevice_completionHandler___block_invoke;
  v21[3] = &unk_1E54008F0;
  v27 = a3;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v25 = self;
  v26 = v15;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  dispatch_async(dispatchQueue, v21);

}

void __99__CBController_sendRelayMessageType_messageData_conduitDevice_destinationDevice_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  const char *v8;
  size_t v9;
  _xpc_connection_s *v10;
  void *v11;
  NSObject *v12;
  _QWORD handler[4];
  id v14;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "SnRM");
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v4 = objc_retainAutorelease(v3);
    v5 = v2;
    v6 = v4;
    v7 = objc_msgSend(v6, "bytes");
    if (v7)
      v8 = (const char *)v7;
    else
      v8 = "";
    v9 = objc_msgSend(v6, "length");

    xpc_dictionary_set_data(v5, "rlMD", v8, v9);
  }
  if (*(_BYTE *)(a1 + 72))
    xpc_dictionary_set_uint64(v2, "rlMT", *(unsigned __int8 *)(a1 + 72));
  CUXPCEncodeObject();
  CUXPCEncodeObject();
  objc_msgSend(*(id *)(a1 + 56), "_ensureXPCStarted");
  v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 64);
  v12 = *(NSObject **)(*(_QWORD *)(a1 + 56) + 88);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __99__CBController_sendRelayMessageType_messageData_conduitDevice_destinationDevice_completionHandler___block_invoke_2;
  handler[3] = &unk_1E5400778;
  v14 = v11;
  xpc_connection_send_message_with_reply(v10, v2, v12, handler);

}

void __99__CBController_sendRelayMessageType_messageData_conduitDevice_destinationDevice_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)sendSmartRoutingInformation:(id)a3 device:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  CBController *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__CBController_sendSmartRoutingInformation_device_completionHandler___block_invoke;
  v15[3] = &unk_1E5400810;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(dispatchQueue, v15);

}

void __69__CBController_sendSmartRoutingInformation_device_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  const char *v8;
  size_t v9;
  _xpc_connection_s *v10;
  void *v11;
  NSObject *v12;
  _QWORD handler[4];
  id v14;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "SnSR");
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v4 = objc_retainAutorelease(v3);
    v5 = v2;
    v6 = v4;
    v7 = objc_msgSend(v6, "bytes");
    if (v7)
      v8 = (const char *)v7;
    else
      v8 = "";
    v9 = objc_msgSend(v6, "length");

    xpc_dictionary_set_data(v5, "rlMD", v8, v9);
  }
  CUXPCEncodeObject();
  objc_msgSend(*(id *)(a1 + 48), "_ensureXPCStarted");
  v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 56);
  v12 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 88);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __69__CBController_sendSmartRoutingInformation_device_completionHandler___block_invoke_2;
  handler[3] = &unk_1E5400778;
  v14 = v11;
  xpc_connection_send_message_with_reply(v10, v2, v12, handler);

}

void __69__CBController_sendSmartRoutingInformation_device_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)sendConversationDetectMessage:(id)a3 device:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  CBController *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__CBController_sendConversationDetectMessage_device_completionHandler___block_invoke;
  v15[3] = &unk_1E5400810;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(dispatchQueue, v15);

}

void __71__CBController_sendConversationDetectMessage_device_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  const char *v8;
  size_t v9;
  _xpc_connection_s *v10;
  void *v11;
  NSObject *v12;
  _QWORD handler[4];
  id v14;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "SnCD");
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v4 = objc_retainAutorelease(v3);
    v5 = v2;
    v6 = v4;
    v7 = objc_msgSend(v6, "bytes");
    if (v7)
      v8 = (const char *)v7;
    else
      v8 = "";
    v9 = objc_msgSend(v6, "length");

    xpc_dictionary_set_data(v5, "cdMd", v8, v9);
  }
  CUXPCEncodeObject();
  objc_msgSend(*(id *)(a1 + 48), "_ensureXPCStarted");
  v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 56);
  v12 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 88);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __71__CBController_sendConversationDetectMessage_device_completionHandler___block_invoke_2;
  handler[3] = &unk_1E5400778;
  v14 = v11;
  xpc_connection_send_message_with_reply(v10, v2, v12, handler);

}

void __71__CBController_sendConversationDetectMessage_device_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)resetCBExtensionID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CBController_resetCBExtensionID_completionHandler___block_invoke;
  block[3] = &unk_1E54007C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __53__CBController_resetCBExtensionID_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  id v4;
  const char *v5;
  _xpc_connection_s *v6;
  NSObject *v7;
  _QWORD handler[4];
  id v9;

  v2 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "encodeWithXPCObject:", v2);
  xpc_dictionary_set_string(v2, "mTyp", "RstE");
  v3 = *(void **)(a1 + 40);
  v4 = v2;
  v5 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
  if (v5)
    xpc_dictionary_set_string(v4, "id", v5);

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __53__CBController_resetCBExtensionID_completionHandler___block_invoke_2;
  handler[3] = &unk_1E5400778;
  v9 = *(id *)(a1 + 48);
  xpc_connection_send_message_with_reply(v6, v4, v7, handler);

}

void __53__CBController_resetCBExtensionID_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)updateIdentities:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CBController *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CBController_updateIdentities_completion___block_invoke;
  block[3] = &unk_1E54007C8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __44__CBController_updateIdentities_completion___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  xpc_object_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  xpc_object_t v10;
  _xpc_connection_s *v11;
  void *v12;
  NSObject *v13;
  _QWORD handler[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "UpId");
  v3 = xpc_array_create(0, 0);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v10 = xpc_dictionary_create(0, 0, 0);
        objc_msgSend(v9, "encodeWithXPCObject:", v10);
        xpc_array_append_value(v3, v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  xpc_dictionary_set_value(v2, "idtA", v3);
  objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
  v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(a1 + 48);
  v13 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 88);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __44__CBController_updateIdentities_completion___block_invoke_2;
  handler[3] = &unk_1E5400778;
  v15 = v12;
  xpc_connection_send_message_with_reply(v11, v2, v13, handler);

}

void __44__CBController_updateIdentities_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (int64_t)bluetoothState
{
  return self->_bluetoothState;
}

- (id)bluetoothStateChangedHandler
{
  return self->_bluetoothStateChangedHandler;
}

- (void)setBluetoothStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)label
{
  return self->_label;
}

- (CBDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDevice, a3);
}

- (int)discoverableState
{
  return self->_discoverableState;
}

- (id)discoverableStateChangedHandler
{
  return self->_discoverableStateChangedHandler;
}

- (void)setDiscoverableStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (int)inquiryState
{
  return self->_inquiryState;
}

- (id)inquiryStateChangedHandler
{
  return self->_inquiryStateChangedHandler;
}

- (void)setInquiryStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)relayMessageHandler
{
  return self->_relayMessageHandler;
}

- (void)setRelayMessageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (id)tipiChangedHandler
{
  return self->_tipiChangedHandler;
}

- (void)setTipiChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (unsigned)assertionFlags
{
  return self->_assertionFlags;
}

- (void)setAssertionFlags:(unsigned int)a3
{
  self->_assertionFlags = a3;
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_clientID = a3;
}

- (unsigned)internalFlags
{
  return self->_internalFlags;
}

- (void)setInternalFlags:(unsigned int)a3
{
  self->_internalFlags = a3;
}

- (OS_xpc_object)testListenerEndpoint
{
  return self->_testListenerEndpoint;
}

- (void)setTestListenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong(&self->_tipiChangedHandler, 0);
  objc_storeStrong(&self->_relayMessageHandler, 0);
  objc_storeStrong(&self->_inquiryStateChangedHandler, 0);
  objc_storeStrong(&self->_discoverableStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_bluetoothStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

@end
