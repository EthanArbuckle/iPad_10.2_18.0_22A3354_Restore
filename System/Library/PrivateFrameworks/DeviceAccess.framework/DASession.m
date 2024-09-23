@implementation DASession

- (DASession)init
{
  DASession *v2;
  uint64_t v3;
  NSMutableDictionary *deviceMap;
  DASession *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DASession;
  v2 = -[DASession init](&v7, sel_init);
  if (v2)
  {
    v2->_clientID = CUXPCGetNextClientID();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    deviceMap = v2->_deviceMap;
    v2->_deviceMap = (NSMutableDictionary *)v3;

    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v5 = v2;
  }

  return v2;
}

- (DASession)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  DASession *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  DASession *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a3;
  v7 = -[DASession init](self, "init");
  if (!v7)
  {
    if (!a4)
      goto LABEL_14;
    v24 = objc_opt_class();
    DAErrorF(350001, (uint64_t)"%@ init failed", v17, v18, v19, v20, v21, v22, v24);
LABEL_13:
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (MEMORY[0x2199CAB58](v6) != MEMORY[0x24BDACFA0])
  {
    if (!a4)
      goto LABEL_14;
    DAErrorF(350004, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v23);
    goto LABEL_13;
  }
  if (!CUXPCDecodeNSString())
    goto LABEL_14;
  v14 = CUXPCDecodeUInt64RangedEx();
  if (v14 != 6)
  {
    if (v14 != 5)
      goto LABEL_7;
LABEL_14:
    v15 = 0;
    goto LABEL_8;
  }
  v7->_clientID = 0;
LABEL_7:
  v15 = v7;
LABEL_8:

  return v15;
}

- (void)encodeWithXPCObject:(id)a3
{
  const char *v4;
  uint64_t clientID;
  xpc_object_t xdict;

  xdict = a3;
  v4 = -[NSString UTF8String](objc_retainAutorelease(self->_bundleID), "UTF8String");
  if (v4)
    xpc_dictionary_set_string(xdict, "bndI", v4);
  clientID = self->_clientID;
  if ((_DWORD)clientID)
    xpc_dictionary_set_uint64(xdict, "cid", clientID);

}

- (id)description
{
  return -[DASession descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  __CFString *v5;
  NSString *bundleID;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  NSString *v11;

  if ((a3 & 0x8000000) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    CUAppendF();
    v4 = 0;
  }
  CUAppendF();
  v5 = (__CFString *)v4;

  bundleID = self->_bundleID;
  if (bundleID)
  {
    v11 = bundleID;
    CUAppendF();
    v7 = v5;

    v5 = v7;
  }
  v8 = &stru_24D169BB8;
  if (v5)
    v8 = v5;
  v9 = v8;

  return v9;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __21__DASession_activate__block_invoke;
  block[3] = &unk_24D169168;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __21__DASession_activate__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 16))
  {
    *(_BYTE *)(v1 + 16) = 1;
    return objc_msgSend(*(id *)(result + 32), "_activateStart:", 0);
  }
  return result;
}

- (void)_activateStart:(BOOL)a3
{
  xpc_object_t v4;
  _xpc_connection_s *v5;
  NSObject *dispatchQueue;
  _QWORD handler[5];

  if (a3)
  {
    if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
LABEL_7:
      LogPrintF();
  }
  else if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  v4 = xpc_dictionary_create(0, 0, 0);
  -[DASession encodeWithXPCObject:](self, "encodeWithXPCObject:", v4);
  xpc_dictionary_set_uint64(v4, "dvFl", self->_deviceFlags);
  xpc_dictionary_set_string(v4, "mTyp", "SesA");
  -[DASession _ensureXPCStarted](self, "_ensureXPCStarted");
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __28__DASession__activateStart___block_invoke;
  handler[3] = &unk_24D169318;
  handler[4] = self;
  xpc_connection_send_message_with_reply(v5, v4, dispatchQueue, handler);

}

uint64_t __28__DASession__activateStart___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateXPCCompleted:", a2);
}

- (void)_activateXPCCompleted:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD);
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  DASession *v11;
  DAEventDevicesPresent *v12;
  uint64_t *v13;
  id v14;
  DASession *v15;
  _QWORD applier[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD aBlock[6];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v4 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__4;
  v34 = __Block_byref_object_dispose__4;
  v35 = 0;
  v5 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__DASession__activateXPCCompleted___block_invoke;
  aBlock[3] = &unk_24D169340;
  aBlock[4] = self;
  aBlock[5] = &v30;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  CUXPCDecodeNSErrorIfNeeded();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v31[5];
  v31[5] = v7;

  if (!v31[5])
  {
    if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      v15 = self;
      LogPrintF();
    }
    xpc_dictionary_get_array(v4, "devs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_10;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__4;
    v27 = __Block_byref_object_dispose__4;
    v28 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__4;
    v21 = __Block_byref_object_dispose__4;
    v22 = 0;
    applier[0] = v5;
    applier[1] = 3221225472;
    applier[2] = __35__DASession__activateXPCCompleted___block_invoke_2;
    applier[3] = &unk_24D169718;
    applier[4] = &v17;
    applier[5] = &v23;
    xpc_array_apply(v9, applier);
    v10 = (void *)v18[5];
    if (v10)
    {
      v13 = v31;
      v14 = v10;
      v11 = (DASession *)v13[5];
      v13[5] = (uint64_t)v14;
    }
    else
    {
      v11 = self;
      objc_sync_enter(v11);
      objc_storeStrong((id *)&v11->_deviceMap, (id)v24[5]);
      objc_sync_exit(v11);
    }

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);

    if (!v10)
    {
LABEL_10:
      -[DASession _reportEventType:](self, "_reportEventType:", 10, v15);
      if (xpc_dictionary_get_BOOL(v4, "dvPr"))
      {
        v12 = -[DAEventDevicesPresent initWithPresent:devicesMigrated:]([DAEventDevicesPresent alloc], "initWithPresent:devicesMigrated:", 1, 0);
        -[DASession _reportEvent:](self, "_reportEvent:", v12);

      }
      LOBYTE(v23) = 0;
      CUXPCDecodeBool();
      if ((_BYTE)v23
        && gLogCategory_DASession <= 90
        && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }

  }
  v6[2](v6);

  _Block_object_dispose(&v30, 8);
}

void __35__DASession__activateXPCCompleted___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  DAEvent *v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    if (gLogCategory_DASession <= 90 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    v2 = *(void **)(a1 + 32);
    v4 = -[DAEvent initWithEventType:error:]([DAEvent alloc], "initWithEventType:error:", 10, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(v2, "_reportEvent:", v4);

  }
}

BOOL __35__DASession__activateXPCCompleted___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  DADevice *v5;
  uint64_t v6;
  DADevice *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _BOOL8 v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id obj;

  v4 = a3;
  v5 = [DADevice alloc];
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v6 + 40);
  v7 = -[DADevice initWithXPCObject:error:](v5, "initWithXPCObject:error:", v4, &obj);

  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    -[DADevice identifier](v7, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 != 0;
    if (v14)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v7, v14);
    }
    else
    {
      DAErrorF(350001, (uint64_t)"No device ID", v8, v9, v10, v11, v12, v13, v20);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (DAAppContext)appContext
{
  DAAppContext **p_appContext;
  DAAppContext *v4;
  DAAppContext *v5;
  OS_xpc_object *v6;
  OS_xpc_object **p_xpcEndpoint;
  OS_xpc_object *xpcEndpoint;
  xpc_endpoint_t v9;
  DAAppContext *v10;
  _QWORD handler[5];

  p_appContext = &self->_appContext;
  v4 = self->_appContext;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v6 = self->_xpcListener;
    if (!v6)
    {
      v6 = xpc_connection_create(0, (dispatch_queue_t)self->_dispatchQueue);
      objc_storeStrong((id *)&self->_xpcListener, v6);
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __23__DASession_appContext__block_invoke;
      handler[3] = &unk_24D169318;
      handler[4] = self;
      xpc_connection_set_event_handler(v6, handler);
      xpc_connection_activate(v6);
    }
    xpcEndpoint = self->_xpcEndpoint;
    p_xpcEndpoint = &self->_xpcEndpoint;
    v9 = xpcEndpoint;
    if (!v9)
    {
      v9 = xpc_endpoint_create(v6);
      objc_storeStrong((id *)p_xpcEndpoint, v9);
    }
    v10 = objc_alloc_init(DAAppContext);
    -[DAAppContext setXpcEndpoint:](v10, "setXpcEndpoint:", v9);
    objc_storeStrong((id *)p_appContext, v10);
    v5 = v10;

  }
  return v5;
}

uint64_t __23__DASession_appContext__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_xpcListenerEvent:", a2);
}

- (id)_ensureXPCStarted
{
  OS_xpc_object **p_xpcCnx;
  OS_xpc_object *v4;
  OS_xpc_object *v5;
  OS_xpc_object *v6;
  OS_xpc_object *v7;
  _xpc_connection_s *mach_service;
  _QWORD handler[5];

  p_xpcCnx = &self->_xpcCnx;
  v4 = self->_xpcCnx;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v6 = self->_xpcListenerEndpoint;
    v7 = v6;
    if (v6)
    {
      mach_service = xpc_connection_create_from_endpoint(v6);
      xpc_connection_set_target_queue(mach_service, (dispatch_queue_t)self->_dispatchQueue);
    }
    else
    {
      mach_service = xpc_connection_create_mach_service("com.apple.DeviceAccess.xpc", (dispatch_queue_t)self->_dispatchQueue, 0);
    }
    objc_storeStrong((id *)p_xpcCnx, mach_service);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __30__DASession__ensureXPCStarted__block_invoke;
    handler[3] = &unk_24D169318;
    handler[4] = self;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_activate(mach_service);
    v5 = mach_service;

  }
  return v5;
}

uint64_t __30__DASession__ensureXPCStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "xpcReceivedMessage:", a2);
}

- (void)_interrupted
{
  DASession *v3;

  if (!self->_invalidateCalled)
  {
    if (gLogCategory_DASession <= 90 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      v3 = self;
      LogPrintF();
    }
    -[DASession _reportEventType:](self, "_reportEventType:", 60, v3);
    -[DASession _activateStart:](self, "_activateStart:", 1);
  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__DASession_invalidate__block_invoke;
  block[3] = &unk_24D169168;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __23__DASession_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _xpc_connection_s *v3;
  _xpc_connection_s *v4;
  uint64_t v5;
  _xpc_connection_s *v6;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 32))
  {
    *(_BYTE *)(v1 + 32) = 1;
    if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      v5 = *(_QWORD *)(a1 + 32);
      LogPrintF();
    }
    v3 = (_xpc_connection_s *)*(id *)(*(_QWORD *)(a1 + 32) + 96);
    v6 = v3;
    if (v3)
      xpc_connection_cancel(v3);
    v4 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 32) + 48);
    if (v4)
      xpc_connection_cancel(v4);
    objc_msgSend(*(id *)(a1 + 32), "_invalidated", v5);

  }
}

- (void)_invalidated
{
  id eventHandler;

  if (self->_invalidateCalled && !self->_invalidateDone && !self->_xpcCnx && !self->_xpcListener)
  {
    -[DASession _reportEventType:](self, "_reportEventType:", 20);
    eventHandler = self->_eventHandler;
    self->_eventHandler = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

- (NSArray)availableDevices
{
  DASession *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_deviceMap;
  v4 = v3;
  if (v3)
  {
    -[NSMutableDictionary allValues](v3, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }

  objc_sync_exit(v2);
  return (NSArray *)v5;
}

- (void)removeDeviceAccess:(id)a3 completionHandler:(id)a4
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__DASession_removeDeviceAccess_completionHandler___block_invoke;
  block[3] = &unk_24D169408;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __50__DASession_removeDeviceAccess_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "RvAi");
  CUXPCEncodeObject();
  CUXPCEncodeObject();
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__DASession_removeDeviceAccess_completionHandler___block_invoke_2;
  v6[3] = &unk_24D169390;
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  xpc_connection_send_message_with_reply(v3, v2, v5, v6);

}

void __50__DASession_removeDeviceAccess_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  id v5;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v2;
  if (gLogCategory_DASession <= 30)
  {
    if (gLogCategory_DASession != -1 || (v3 = _LogCategory_Initialize(), v2 = (uint64_t)v5, v3))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v2 = (uint64_t)v5;
    }
  }
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v2);

}

- (void)setDeviceAppAccessInfo:(id)a3 device:(id)a4 completionHandler:(id)a5
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
  DASession *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __61__DASession_setDeviceAppAccessInfo_device_completionHandler___block_invoke;
  v15[3] = &unk_24D169480;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(dispatchQueue, v15);

}

void __61__DASession_setDeviceAppAccessInfo_device_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  xpc_object_t v8;
  _xpc_connection_s *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD handler[4];
  id v16;
  id v17;

  if ((objc_msgSend(*(id *)(a1 + 32), "flags") & 8) != 0)
  {
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, "mTyp", "SAAi");
    CUXPCEncodeObject();
    CUXPCEncodeObject();
    CUXPCEncodeObject();
    objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
    v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 48);
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __61__DASession_setDeviceAppAccessInfo_device_completionHandler___block_invoke_2;
    handler[3] = &unk_24D169390;
    v16 = v10;
    v17 = *(id *)(a1 + 56);
    xpc_connection_send_message_with_reply(v9, v8, v11, handler);

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 56);
    DAErrorF(350001, (uint64_t)"Device missing accessory setup flag", v2, v3, v4, v5, v6, v7, v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v14);

  }
}

void __61__DASession_setDeviceAppAccessInfo_device_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  id v5;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v2;
  if (gLogCategory_DASession <= 30)
  {
    if (gLogCategory_DASession != -1 || (v3 = _LogCategory_Initialize(), v2 = (uint64_t)v5, v3))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v2 = (uint64_t)v5;
    }
  }
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v2);

}

- (void)getAuthorizedDevices:(id)a3
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
  v7[2] = __34__DASession_getAuthorizedDevices___block_invoke;
  v7[3] = &unk_24D169230;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __34__DASession_getAuthorizedDevices___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "GADv");
  CUXPCEncodeObject();
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 80);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__DASession_getAuthorizedDevices___block_invoke_2;
  v7[3] = &unk_24D169390;
  v7[4] = v4;
  v8 = v5;
  xpc_connection_send_message_with_reply(v3, v2, v6, v7);

}

uint64_t __34__DASession_getAuthorizedDevices___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getAuthorizedDevicesCompleted:completionHandler:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_getAuthorizedDevicesCompleted:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD aBlock[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  v20 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__DASession__getAuthorizedDevicesCompleted_completionHandler___block_invoke;
  aBlock[3] = &unk_24D1693B8;
  v14 = &v15;
  v7 = v6;
  v13 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  CUXPCDecodeNSErrorIfNeeded();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v16[5];
  v16[5] = v9;

  if (!v16[5])
  {
    objc_opt_class();
    CUXPCDecodeNSArrayOfClass();
    if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSObjectOneLine();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);

  }
  v8[2](v8);

  _Block_object_dispose(&v15, 8);
}

uint64_t __62__DASession__getAuthorizedDevicesCompleted_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_DASession <= 90 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

- (void)getDevicesWithFlags:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__DASession_getDevicesWithFlags_completionHandler___block_invoke;
  block[3] = &unk_24D169740;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __51__DASession_getDevicesWithFlags_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "GDvs");
  xpc_dictionary_set_uint64(v2, "dvFl", *(_QWORD *)(a1 + 48));
  CUXPCEncodeObject();
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 80);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__DASession_getDevicesWithFlags_completionHandler___block_invoke_2;
  v7[3] = &unk_24D169390;
  v7[4] = v4;
  v8 = v5;
  xpc_connection_send_message_with_reply(v3, v2, v6, v7);

}

uint64_t __51__DASession_getDevicesWithFlags_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getDevicesCompleted:completionHandler:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_getDevicesCompleted:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD aBlock[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  v20 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__DASession__getDevicesCompleted_completionHandler___block_invoke;
  aBlock[3] = &unk_24D1693B8;
  v14 = &v15;
  v7 = v6;
  v13 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  CUXPCDecodeNSErrorIfNeeded();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v16[5];
  v16[5] = v9;

  if (!v16[5])
  {
    objc_opt_class();
    CUXPCDecodeNSArrayOfClass();
    if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSObjectOneLine();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);

  }
  v8[2](v8);

  _Block_object_dispose(&v15, 8);
}

uint64_t __52__DASession__getDevicesCompleted_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_DASession <= 90 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

+ (id)getDevicesWithFlags:(unint64_t)a3 session:(id)a4 error:(id *)a5
{
  id v7;
  xpc_object_t v8;
  NSObject *v9;
  NSObject *v10;
  _xpc_connection_s *mach_service;
  xpc_object_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v23;

  v7 = a4;
  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, "mTyp", "GDvs");
  xpc_dictionary_set_uint64(v8, "dvFl", a3);
  CUXPCEncodeObject();

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = dispatch_queue_create("DASession-GetInfo", v9);

  mach_service = xpc_connection_create_mach_service("com.apple.DeviceAccess.xpc", v10, 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_1);
  xpc_connection_activate(mach_service);
  v12 = xpc_connection_send_message_with_reply_sync(mach_service, v8);
  xpc_connection_cancel(mach_service);
  if (v12)
  {
    CUXPCDecodeNSErrorIfNeeded();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      *a5 = objc_retainAutorelease(v19);
      v21 = (id)MEMORY[0x24BDBD1A8];
    }
    else
    {
      objc_opt_class();
      CUXPCDecodeNSArrayOfClass();
      v21 = 0;

    }
  }
  else
  {
    DAErrorF(350000, (uint64_t)"No reply", v13, v14, v15, v16, v17, v18, v23);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v21 = (id)MEMORY[0x24BDBD1A8];
  }

  return v21;
}

- (void)_getPartialIPsCompleted:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD aBlock[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  v20 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__DASession__getPartialIPsCompleted_completionHandler___block_invoke;
  aBlock[3] = &unk_24D1693B8;
  v14 = &v15;
  v7 = v6;
  v13 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  CUXPCDecodeNSErrorIfNeeded();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v16[5];
  v16[5] = v9;

  if (!v16[5])
  {
    objc_opt_class();
    CUXPCDecodeNSArrayOfClass();
    if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSObjectOneLine();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);

  }
  v8[2](v8);

  _Block_object_dispose(&v15, 8);
}

uint64_t __55__DASession__getPartialIPsCompleted_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_DASession <= 90 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

- (void)_reportEvent:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v4 = _Block_copy(self->_eventHandler);
  v5 = v4;
  if (v4)
    (*((void (**)(void *, id))v4 + 2))(v4, v6);

}

- (void)_reportEventType:(int64_t)a3
{
  DAEvent *v4;

  v4 = -[DAEvent initWithEventType:]([DAEvent alloc], "initWithEventType:", a3);
  -[DASession _reportEvent:](self, "_reportEvent:", v4);

}

- (void)setState:(int64_t)a3 device:(id)a4 completionHandler:(id)a5
{
  -[DASession setState:device:simulateApp:completionHandler:](self, "setState:device:simulateApp:completionHandler:", a3, a4, 0, a5);
}

- (void)setState:(int64_t)a3 device:(id)a4 simulateApp:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *dispatchQueue;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  DASession *v17;
  id v18;
  int64_t v19;
  BOOL v20;

  v10 = a4;
  v11 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__DASession_setState_device_simulateApp_completionHandler___block_invoke;
  block[3] = &unk_24D169790;
  v16 = v10;
  v17 = self;
  v20 = a5;
  v18 = v11;
  v19 = a3;
  v13 = v11;
  v14 = v10;
  dispatch_async(dispatchQueue, block);

}

void __59__DASession_setState_device_simulateApp_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  xpc_object_t v3;
  _xpc_connection_s *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD handler[4];
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;

  if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
  {
    v2 = *(_QWORD *)(a1 + 32);
    DADeviceStateToString(*(_QWORD *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64);
    v10 = v2;
    LogPrintF();

  }
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "mTyp", "SDvS");
  CUXPCEncodeObject();
  xpc_dictionary_set_int64(v3, "dvSt", *(_QWORD *)(a1 + 56));
  CUXPCEncodeObject();
  if (*(_BYTE *)(a1 + 64))
    xpc_dictionary_set_BOOL(v3, "simA", 1);
  objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted", v10, v11, v12);
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __59__DASession_setState_device_simulateApp_completionHandler___block_invoke_2;
  handler[3] = &unk_24D169768;
  v7 = v5;
  v8 = *(void **)(a1 + 48);
  v17 = *(_QWORD *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 40);
  v14 = v7;
  v15 = v9;
  v16 = v8;
  xpc_connection_send_message_with_reply(v4, v3, v6, handler);

}

void __59__DASession_setState_device_simulateApp_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  CUXPCDecodeNSErrorIfNeeded();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
  {
    DADeviceStateToString(*(_QWORD *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSError();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v6, v2, v3);

}

+ (BOOL)setState:(int64_t)a3 device:(id)a4 session:(id)a5 error:(id *)a6
{
  return objc_msgSend(a1, "setState:device:session:simulateApp:error:", a3, a4, a5, 0, a6);
}

+ (BOOL)setState:(int64_t)a3 device:(id)a4 session:(id)a5 simulateApp:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  void *v13;
  xpc_object_t v14;
  NSObject *v15;
  NSObject *v16;
  _xpc_connection_s *mach_service;
  xpc_object_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  BOOL v27;
  uint64_t v29;
  void *v30;

  v8 = a6;
  v11 = a4;
  v12 = a5;
  if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
  {
    DADeviceStateToString(a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (uint64_t)v11;
    LogPrintF();

  }
  v14 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v14, "mTyp", "SDvS");
  CUXPCEncodeObject();
  xpc_dictionary_set_int64(v14, "dvSt", a3);
  CUXPCEncodeObject();
  if (v8)
    xpc_dictionary_set_BOOL(v14, "simA", 1);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = dispatch_queue_create("DASession-GetInfo", v15);

  mach_service = xpc_connection_create_mach_service("com.apple.DeviceAccess.xpc", v16, 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_58);
  xpc_connection_activate(mach_service);
  v18 = xpc_connection_send_message_with_reply_sync(mach_service, v14);
  xpc_connection_cancel(mach_service);
  if (v18)
  {
    CUXPCDecodeNSErrorIfNeeded();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    v27 = v25 == 0;
    if (v25 && a7)
      *a7 = objc_retainAutorelease(v25);

  }
  else if (a7)
  {
    DAErrorF(350000, (uint64_t)"No reply", v19, v20, v21, v22, v23, v24, v29);
    v27 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

+ (BOOL)setDeviceAppAccessInfo:(id)a3 device:(id)a4 session:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  xpc_object_t v18;
  NSObject *v19;
  NSObject *v20;
  _xpc_connection_s *mach_service;
  xpc_object_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  BOOL v31;
  id v33;
  uint64_t v34;
  id v35;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
  {
    v33 = v9;
    v35 = v10;
    LogPrintF();
  }
  if ((objc_msgSend(v10, "flags", v33, v35) & 8) != 0)
  {
    v18 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v18, "mTyp", "SAAi");
    CUXPCEncodeObject();
    CUXPCEncodeObject();
    CUXPCEncodeObject();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("DASession-GetInfo", v19);

    mach_service = xpc_connection_create_mach_service("com.apple.DeviceAccess.xpc", v20, 0);
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_60);
    xpc_connection_activate(mach_service);
    v22 = xpc_connection_send_message_with_reply_sync(mach_service, v18);
    xpc_connection_cancel(mach_service);
    if (v22)
    {
      CUXPCDecodeNSErrorIfNeeded();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      v31 = v29 == 0;
      if (v29 && a6)
        *a6 = objc_retainAutorelease(v29);

    }
    else if (a6)
    {
      DAErrorF(350000, (uint64_t)"No reply", v23, v24, v25, v26, v27, v28, v34);
      v31 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = 0;
    }

  }
  else if (a6)
  {
    DAErrorF(350001, (uint64_t)"Device missing accessory setup flag", v12, v13, v14, v15, v16, v17, v34);
    v31 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (id)bluetoothAccessInfoAndReturnError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;

  if (a3)
  {
    DAErrorF(350002, (uint64_t)"Not implemented yet", (uint64_t)a3, v3, v4, v5, v6, v7, v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (void)getBluetoothAccessInfoWithCompletionHandler:(id)a3
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
  v7[2] = __57__DASession_getBluetoothAccessInfoWithCompletionHandler___block_invoke;
  v7[3] = &unk_24D169230;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __57__DASession_getBluetoothAccessInfoWithCompletionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "BTIG");
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 80);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__DASession_getBluetoothAccessInfoWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_24D169390;
  v7[4] = v4;
  v8 = v5;
  xpc_connection_send_message_with_reply(v3, v2, v6, v7);

}

uint64_t __57__DASession_getBluetoothAccessInfoWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getBluetoothAccessInfoCompleted:completionHandler:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_getBluetoothAccessInfoCompleted:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  void *v10;
  id *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id obj;
  _QWORD aBlock[4];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v5 = a3;
  v6 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__4;
  v29 = __Block_byref_object_dispose__4;
  v30 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__DASession__getBluetoothAccessInfoCompleted_completionHandler___block_invoke;
  aBlock[3] = &unk_24D1693B8;
  v24 = &v25;
  v7 = v6;
  v23 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  CUXPCDecodeNSErrorIfNeeded();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v26[5];
  v26[5] = v9;

  if (!v26[5])
  {
    objc_opt_class();
    v11 = (id *)(v26 + 5);
    obj = (id)v26[5];
    CUXPCDecodeObject();
    objc_storeStrong(v11, obj);
    if (!v26[5])
    {
      DAErrorF(350004, (uint64_t)"No error, but no info", v12, v13, v14, v15, v16, v17, v20);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v26[5];
      v26[5] = v18;

    }
  }
  v8[2](v8);

  _Block_object_dispose(&v25, 8);
}

uint64_t __64__DASession__getBluetoothAccessInfoCompleted_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_DASession <= 90 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

- (BOOL)appIsUsingDeviceAccess
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;
  void *bundleID;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC79E8]), "initWithExtensionPointIdentifier:", CFSTR("com.apple.discovery-extension"));
  objc_msgSend(MEMORY[0x24BDC79F0], "executeQuery:", v3);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v18 = v3;
    v7 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v9, "bundleIdentifier", bundleID, v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByDeletingPathExtension");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (self->_bundleID && (objc_msgSend(v11, "isEqual:") & 1) == 0)
        {
          if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
          {
            bundleID = self->_bundleID;
            v17 = v11;
            LogPrintF();
          }
        }
        else
        {
          objc_msgSend(v9, "entitlementNamed:ofClass:", CFSTR("com.apple.developer.media-device-discovery-extension"), objc_opt_class());
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "BOOLValue");

          if ((v13 & 1) != 0)
          {

            v14 = 1;
            goto LABEL_22;
          }
          if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
          {
            objc_msgSend(v9, "bundleIdentifier");
            bundleID = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF();

          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v6)
        continue;
      break;
    }
    v14 = 0;
LABEL_22:
    v3 = v18;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)diagnosticShow:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "diagnosticShow:endpoint:error:", a3, 0, a4);
}

+ (id)diagnosticShow:(id)a3 endpoint:(id)a4 error:(id *)a5
{
  id v6;
  xpc_object_t v7;
  NSObject *v8;
  NSObject *v9;
  _xpc_endpoint_s *v10;
  _xpc_endpoint_s *v11;
  _xpc_connection_s *mach_service;
  xpc_object_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v32;

  v6 = a4;
  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "mTyp", "DgSh");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create("DASession-GetInfo", v8);

  v10 = (_xpc_endpoint_s *)v6;
  v11 = v10;
  if (v10)
  {
    mach_service = xpc_connection_create_from_endpoint(v10);
    xpc_connection_set_target_queue(mach_service, v9);
  }
  else
  {
    mach_service = xpc_connection_create_mach_service("com.apple.DeviceAccess.xpc", v9, 0);
  }
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_75);
  xpc_connection_activate(mach_service);
  v13 = xpc_connection_send_message_with_reply_sync(mach_service, v7);
  xpc_connection_cancel(mach_service);
  if (v13)
  {
    CUXPCDecodeNSErrorIfNeeded();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      v29 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v20);
    }
    else
    {
      v22 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      v29 = v22;
      if (v22)
      {
        v30 = v22;
      }
      else if (a5)
      {
        DAErrorF(350004, (uint64_t)"Convert reply to CF failed", v23, v24, v25, v26, v27, v28, v32);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
  }
  else if (a5)
  {
    DAErrorF(350000, (uint64_t)"No reply", v14, v15, v16, v17, v18, v19, v32);
    v29 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (void)diagnosticShow:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  DASession *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__DASession_diagnosticShow_completionHandler___block_invoke;
  block[3] = &unk_24D1697F8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __46__DASession_diagnosticShow_completionHandler___block_invoke(uint64_t a1)
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
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD handler[4];
  id v18;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "DgSh");
  v3 = *(id *)(a1 + 32);
  if (v3)
  {
    v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (!v4)
    {
      v14 = *(_QWORD *)(a1 + 48);
      DAErrorF(350000, (uint64_t)"Params conversion failed", v5, v6, v7, v8, v9, v10, v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v15);

      goto LABEL_5;
    }
    v11 = v4;
    xpc_dictionary_set_value(v2, "parm", v4);

  }
  objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(a1 + 48);
  v13 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __46__DASession_diagnosticShow_completionHandler___block_invoke_2;
  handler[3] = &unk_24D1693E0;
  v18 = v12;
  xpc_connection_send_message_with_reply((xpc_connection_t)v3, v2, v13, handler);

LABEL_5:
}

void __46__DASession_diagnosticShow_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
      DAErrorF(350000, (uint64_t)"No error, no response", v4, v5, v6, v7, v8, v9, v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);

    }
  }

}

+ (BOOL)networkingAllowedWithUUID:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;
  id v13;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:isDirectory:", CFSTR("/var/mobile/Library/com.apple.DeviceAccess/DANetworkUUIDs.plist"), 0);
  v13 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfURL:error:", v6, &v13);
  v8 = v13;
  objc_msgSend(v5, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogCategory_DASession <= 20 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  if (a4 && !v10)
    *a4 = objc_retainAutorelease(v8);

  return v10 != 0;
}

+ (BOOL)processAllowedWithAuditToken:(id *)a3 error:(id *)a4
{
  __int128 v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  void *v15;
  _OWORD v16[2];
  id v17;

  v17 = 0;
  v5 = *(_OWORD *)&a3->var0[4];
  v16[0] = *(_OWORD *)a3->var0;
  v16[1] = v5;
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordForAuditToken:error:", v16, &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v17;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v6, "extensionPointRecord"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "identifier"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.discovery-extension")),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "extensionPointRecord");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.accessory-setup-extension"));

      if (!a4)
        goto LABEL_10;
    }
    else
    {
      v11 = 0;
      if (!a4)
        goto LABEL_10;
    }
    if ((v11 & 1) == 0)
    {
      v11 = 0;
      *a4 = objc_retainAutorelease(v7);
    }
  }
LABEL_10:
  if (gLogCategory_DASession <= 20 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  return v11;
}

+ (id)getPartialIPsWithAppBundleID:(id)a3 error:(id *)a4
{
  id v5;
  xpc_object_t v6;
  id v7;
  id v8;
  const char *v9;
  NSObject *v10;
  NSObject *v11;
  _xpc_connection_s *mach_service;
  xpc_object_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v24;
  void *v25;

  v5 = a3;
  if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
  {
    v24 = (uint64_t)v5;
    LogPrintF();
  }
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "mTyp", "GIFs");
  v7 = v6;
  v8 = objc_retainAutorelease(v5);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");
  if (v9)
    xpc_dictionary_set_string(v7, "bndI", v9);

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_queue_create("DASession-GetInfo", v10);

  mach_service = xpc_connection_create_mach_service("com.apple.DeviceAccess.xpc", v11, 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_96);
  xpc_connection_activate(mach_service);
  v13 = xpc_connection_send_message_with_reply_sync(mach_service, v7);
  xpc_connection_cancel(mach_service);
  if (v13)
  {
    CUXPCDecodeNSErrorIfNeeded();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v20);
      v22 = (id)MEMORY[0x24BDBD1A8];
    }
    else
    {
      objc_opt_class();
      CUXPCDecodeNSArrayOfClass();
      if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSObjectOneLine();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      v22 = 0;

    }
  }
  else
  {
    if (a4)
    {
      DAErrorF(350000, (uint64_t)"No reply", v14, v15, v16, v17, v18, v19, v24);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v22 = (id)MEMORY[0x24BDBD1A8];
  }

  return v22;
}

+ (id)getPartialIPsWithAuditToken:(id *)a3 error:(id *)a4
{
  __int128 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _OWORD v12[2];
  uint64_t v13;

  if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v13 = 0;
  v6 = *(_OWORD *)&a3->var0[4];
  v12[0] = *(_OWORD *)a3->var0;
  v12[1] = v6;
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordForAuditToken:error:", v12, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByDeletingPathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[DASession getPartialIPsWithAppBundleID:error:](DASession, "getPartialIPsWithAppBundleID:error:", v9, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v10;
}

- (void)modifyDeviceWithIdentifier:(id)a3 settings:(id)a4 completionHandler:(id)a5
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
  DASession *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __67__DASession_modifyDeviceWithIdentifier_settings_completionHandler___block_invoke;
  v15[3] = &unk_24D1694A8;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(dispatchQueue, v15);

}

void __67__DASession_modifyDeviceWithIdentifier_settings_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  id v4;
  const char *v5;
  _xpc_connection_s *v6;
  void *v7;
  NSObject *v8;
  _QWORD handler[4];
  id v10;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "MdSt");
  v3 = *(void **)(a1 + 32);
  v4 = v2;
  v5 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
  if (v5)
    xpc_dictionary_set_string(v4, "id", v5);

  CUXPCEncodeObject();
  CUXPCEncodeObject();
  objc_msgSend(*(id *)(a1 + 48), "_ensureXPCStarted");
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 56);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 80);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __67__DASession_modifyDeviceWithIdentifier_settings_completionHandler___block_invoke_2;
  handler[3] = &unk_24D1693E0;
  v10 = v7;
  xpc_connection_send_message_with_reply(v6, v4, v8, handler);

}

void __67__DASession_modifyDeviceWithIdentifier_settings_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

+ (BOOL)setPartialIPsWithAuditToken:(id *)a3 partialIPs:(id)a4 error:(id *)a5
{
  id v7;
  __int128 v8;
  void *v9;
  void *v10;
  BOOL v11;
  _OWORD v13[2];
  uint64_t v14;

  v7 = a4;
  if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v14 = 0;
  v8 = *(_OWORD *)&a3->var0[4];
  v13[0] = *(_OWORD *)a3->var0;
  v13[1] = v8;
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordForAuditToken:error:", v13, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[DASession setPartialIPsForAppBundleID:partialIPs:error:](DASession, "setPartialIPsForAppBundleID:partialIPs:error:", v10, v7, a5);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)setPartialIPsForAppBundleID:(id)a3 partialIPs:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  xpc_object_t v9;
  id v10;
  const char *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  _xpc_connection_s *mach_service;
  xpc_object_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  BOOL v25;
  id v27;
  uint64_t v28;
  id v29;

  v7 = a3;
  v8 = a4;
  if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
  {
    v27 = v7;
    v29 = v8;
    LogPrintF();
  }
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v9, "mTyp", "SIFs");
  if (v7)
  {
    v10 = v9;
    v11 = (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    if (v11)
      xpc_dictionary_set_string(v10, "bndI", v11);

  }
  if ((unint64_t)objc_msgSend(v8, "count", v27, v29) < 0xB)
  {
    CUXPCEncodeNSArrayOfObjects();
  }
  else
  {
    if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
      LogPrintF();
    objc_msgSend(v8, "subarrayWithRange:", 0, 10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CUXPCEncodeNSArrayOfObjects();

  }
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = dispatch_queue_create("DASession-GetInfo", v13);

  mach_service = xpc_connection_create_mach_service("com.apple.DeviceAccess.xpc", v14, 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_106);
  xpc_connection_activate(mach_service);
  v16 = xpc_connection_send_message_with_reply_sync(mach_service, v9);
  xpc_connection_cancel(mach_service);
  if (v16)
  {
    CUXPCDecodeNSErrorIfNeeded();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = v23 == 0;
    if (v23 && a5)
      *a5 = objc_retainAutorelease(v23);

  }
  else if (a5)
  {
    DAErrorF(350000, (uint64_t)"No reply", v17, v18, v19, v20, v21, v22, v28);
    v25 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)setPartialIPsWithAuditToken:(id *)a3 partialIPs:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  __int128 v10;
  void *v11;
  void *v12;
  _OWORD v13[2];
  uint64_t v14;

  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v14 = 0;
  v10 = *(_OWORD *)&a3->var0[4];
  v13[0] = *(_OWORD *)a3->var0;
  v13[1] = v10;
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordForAuditToken:error:", v13, &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DASession setPartialIPsForAppBundleID:partialIPs:completionHandler:](self, "setPartialIPsForAppBundleID:partialIPs:completionHandler:", v12, v8, v9);

  }
  else
  {
    v9[2](v9, 0);
  }

}

- (void)setPartialIPsForAppBundleID:(id)a3 partialIPs:(id)a4 completionHandler:(id)a5
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
  DASession *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __70__DASession_setPartialIPsForAppBundleID_partialIPs_completionHandler___block_invoke;
  v15[3] = &unk_24D1694A8;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(dispatchQueue, v15);

}

void __70__DASession_setPartialIPsForAppBundleID_partialIPs_completionHandler___block_invoke(id *a1)
{
  xpc_object_t v2;
  id v3;
  id v4;
  const char *v5;
  _xpc_connection_s *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "SIFs");
  v3 = a1[4];
  if (v3)
  {
    v4 = v2;
    v5 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
    if (v5)
      xpc_dictionary_set_string(v4, "bndI", v5);

  }
  CUXPCEncodeNSArrayOfObjects();
  objc_msgSend(a1[6], "_ensureXPCStarted");
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v7 = *((_QWORD *)a1[6] + 10);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__DASession_setPartialIPsForAppBundleID_partialIPs_completionHandler___block_invoke_2;
  v8[3] = &unk_24D169390;
  v9 = a1[4];
  v10 = a1[7];
  xpc_connection_send_message_with_reply(v6, v2, v7, v8);

}

void __70__DASession_setPartialIPsForAppBundleID_partialIPs_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  id v5;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v2;
  if (gLogCategory_DASession <= 30)
  {
    if (gLogCategory_DASession != -1 || (v3 = _LogCategory_Initialize(), v2 = (uint64_t)v5, v3))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v2 = (uint64_t)v5;
    }
  }
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v2);

}

- (void)getPartialIPsWithAuditToken:(id *)a3 completionHandler:(id)a4
{
  id v6;
  __int128 v7;
  void *v8;
  void *v9;
  _OWORD v10[2];
  uint64_t v11;
  __int128 v12;
  __int128 v13;

  v6 = a4;
  if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v12 = 0u;
  v13 = 0u;
  xpc_connection_get_audit_token();
  v11 = 0;
  v7 = *(_OWORD *)&a3->var0[4];
  v10[0] = *(_OWORD *)a3->var0;
  v10[1] = v7;
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordForAuditToken:error:", v10, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DASession getPartialIPsWithAppBundleID:completionHandler:](self, "getPartialIPsWithAppBundleID:completionHandler:", v9, v6);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, MEMORY[0x24BDBD1A8], 0);
  }

}

- (void)getPartialIPsWithAppBundleID:(id)a3 completionHandler:(id)a4
{
  id v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__DASession_getPartialIPsWithAppBundleID_completionHandler___block_invoke;
  v8[3] = &unk_24D169230;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(dispatchQueue, v8);

}

void __60__DASession_getPartialIPsWithAppBundleID_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "GIFs");
  CUXPCEncodeObject();
  CUXPCEncodeObject();
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 80);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__DASession_getPartialIPsWithAppBundleID_completionHandler___block_invoke_2;
  v7[3] = &unk_24D169390;
  v7[4] = v4;
  v8 = v5;
  xpc_connection_send_message_with_reply(v3, v2, v6, v7);

}

uint64_t __60__DASession_getPartialIPsWithAppBundleID_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getAuthorizedDevicesCompleted:completionHandler:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_xpcListenerEvent:(id)a3
{
  void *v4;
  int v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  if (MEMORY[0x2199CAB58]() == MEMORY[0x24BDACF88])
  {
    -[DASession _xpcConnectionAccept:](self, "_xpcConnectionAccept:", v8);
    goto LABEL_7;
  }
  v4 = v8;
  if (v8 == (id)MEMORY[0x24BDACF38])
  {
    if (gLogCategory_DASession <= 30)
    {
      if (gLogCategory_DASession != -1 || (v6 = _LogCategory_Initialize(), v4 = v8, v6))
      {
        LogPrintF();
        goto LABEL_7;
      }
    }
  }
  else if (gLogCategory_DASession <= 90)
  {
    if (gLogCategory_DASession != -1 || (v5 = _LogCategory_Initialize(), v4 = v8, v5))
    {
      CUPrintXPC();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

LABEL_7:
      v4 = v8;
    }
  }

}

- (void)xpcReceivedMessage:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  OS_xpc_object *xpcCnx;
  DASession *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  v18 = v4;
  if (gLogCategory_DASession <= 9)
  {
    if (gLogCategory_DASession != -1 || (v5 = _LogCategory_Initialize(), v4 = v18, v5))
    {
      CUPrintXPC();
      v15 = self;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v4 = v18;
    }
  }
  if (MEMORY[0x2199CAB58](v4) == MEMORY[0x24BDACFA0])
  {
    -[DASession _xpcReceivedMessage:](self, "_xpcReceivedMessage:", v18);
  }
  else if (v18 == (id)MEMORY[0x24BDACF30])
  {
    -[DASession _interrupted](self, "_interrupted");
  }
  else if (v18 == (id)MEMORY[0x24BDACF38])
  {
    if (!self->_invalidateCalled
      && gLogCategory_DASession <= 90
      && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    -[DASession _invalidated](self, "_invalidated");
  }
  else
  {
    DAErrorF(350000, (uint64_t)"XPC event error", v6, v7, v8, v9, v10, v11, (uint64_t)v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_DASession <= 90 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      CUPrintXPC();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
  }

}

- (void)_xpcReceivedMessage:(id)a3
{
  const char *string;
  id v5;

  v5 = a3;
  string = xpc_dictionary_get_string(v5, "mTyp");
  if (string)
  {
    if (!strcmp(string, "Evnt"))
    {
      -[DASession _xpcReceivedDAEvent:](self, "_xpcReceivedDAEvent:", v5);
      goto LABEL_13;
    }
    if (gLogCategory_DASession <= 90 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
      goto LABEL_8;
  }
  else if (gLogCategory_DASession <= 90 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
  {
LABEL_8:
    LogPrintF();
  }
LABEL_13:

}

- (void)_xpcReceivedDAEvent:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSMutableDictionary *deviceMap;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v4 = a3;
  if (MEMORY[0x2199CAB58]() == MEMORY[0x24BDACFA0])
  {
    v18 = 0;
    v5 = +[DAEvent allocInitWithXPCObject:error:](DAEvent, "allocInitWithXPCObject:error:", v4, &v18);
    v6 = v18;
    if (!v5)
    {
      if (gLogCategory_DASession > 90 || gLogCategory_DASession == -1 && !_LogCategory_Initialize())
        goto LABEL_32;
      CUPrintNSError();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
      goto LABEL_31;
    }
    if (gLogCategory_DASession <= 30 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    {
      v17 = v5;
      LogPrintF();
    }
    v7 = objc_msgSend(v5, "eventType", v17);
    if (v7 <= 40)
    {
      if (v7 == 15)
        goto LABEL_29;
      if (v7 != 40)
      {
LABEL_32:

        goto LABEL_33;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_18:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(v5, "device");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMap, "setObject:forKeyedSubscript:", v12, v13);

          }
          goto LABEL_29;
        }
      }
      objc_msgSend(v5, "device");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        deviceMap = self->_deviceMap;
        v11 = v8;
LABEL_27:
        -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v11, v9);
      }
    }
    else
    {
      if (v7 != 41)
      {
        if (v7 != 42)
        {
          if (v7 != 50)
            goto LABEL_32;
          goto LABEL_29;
        }
        goto LABEL_18;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_32;
      }
      objc_msgSend(v5, "device");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        deviceMap = self->_deviceMap;
        v11 = 0;
        goto LABEL_27;
      }
    }
    v14 = objc_msgSend(v8, "flags");

    if ((v14 & 8) != 0)
    {
LABEL_29:
      v15 = _Block_copy(self->_eventHandler);
      v16 = v15;
      if (v15)
        (*((void (**)(void *, id))v15 + 2))(v15, v5);
LABEL_31:

      goto LABEL_32;
    }
    goto LABEL_32;
  }
  if (gLogCategory_DASession <= 90 && (gLogCategory_DASession != -1 || _LogCategory_Initialize()))
    LogPrintF();
LABEL_33:

}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)deviceFlags
{
  return self->_deviceFlags;
}

- (void)setDeviceFlags:(unint64_t)a3
{
  self->_deviceFlags = a3;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_clientID = a3;
}

- (OS_xpc_object)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
  objc_storeStrong((id *)&self->_xpcCnx, a3);
}

- (OS_xpc_object)xpcListenerEndpoint
{
  return self->_xpcListenerEndpoint;
}

- (void)setXpcListenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_xpcListenerEndpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcEndpoint, 0);
  objc_storeStrong((id *)&self->_deviceMap, 0);
  objc_storeStrong((id *)&self->_appContext, 0);
}

@end
