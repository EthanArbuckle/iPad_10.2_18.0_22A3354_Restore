@implementation BTAudioRoutingRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BTAudioRoutingRequest)init
{
  BTAudioRoutingRequest *v2;
  BTAudioRoutingRequest *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BTAudioRoutingRequest;
  v2 = -[BTAudioRoutingRequest init](&v5, sel_init);
  if (v2)
  {
    v2->_clientID = BTXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v3 = v2;
  }

  return v2;
}

- (BTAudioRoutingRequest)initWithCoder:(id)a3
{
  id v4;
  BTAudioRoutingRequest *v5;
  id v6;
  id v7;
  id v8;
  BTAudioRoutingRequest *v9;

  v4 = a3;
  v5 = -[BTAudioRoutingRequest init](self, "init");
  if (v5)
  {
    if (NSDecodeSInt64RangedIfPresent())
      v5->_audioScore = 0;
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    if (NSDecodeSInt64RangedIfPresent())
      v5->_clientID = 0;
    v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    if (NSDecodeSInt64RangedIfPresent())
      v5->_flags = 0;
    v8 = v7;
    objc_opt_class();
    NSDecodeStandardContainerIfPresent();

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t audioScore;
  NSString *appBundleID;
  uint64_t clientID;
  NSString *deviceAddress;
  uint64_t flags;
  NSDictionary *options;
  id v11;

  v4 = a3;
  audioScore = self->_audioScore;
  v11 = v4;
  if ((_DWORD)audioScore)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", audioScore, CFSTR("auSc"));
    v4 = v11;
  }
  appBundleID = self->_appBundleID;
  if (appBundleID)
  {
    objc_msgSend(v11, "encodeObject:forKey:", appBundleID, CFSTR("aid"));
    v4 = v11;
  }
  clientID = self->_clientID;
  if ((_DWORD)clientID)
  {
    objc_msgSend(v11, "encodeInt64:forKey:", clientID, CFSTR("cid"));
    v4 = v11;
  }
  deviceAddress = self->_deviceAddress;
  if (deviceAddress)
  {
    objc_msgSend(v11, "encodeObject:forKey:", deviceAddress, CFSTR("dAdr"));
    v4 = v11;
  }
  flags = self->_flags;
  if ((_DWORD)flags)
  {
    objc_msgSend(v11, "encodeInt64:forKey:", flags, CFSTR("flgs"));
    v4 = v11;
  }
  options = self->_options;
  if (options)
  {
    objc_msgSend(v11, "encodeObject:forKey:", options, CFSTR("opts"));
    v4 = v11;
  }

}

- (id)description
{
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
  block[2] = __33__BTAudioRoutingRequest_activate__block_invoke;
  block[3] = &unk_25081CE30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __33__BTAudioRoutingRequest_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  void *v3;
  uint64_t v4;
  NSXPCConnection *xpcCnx;
  void *v6;
  uint64_t clientID;
  _QWORD v8[5];
  _QWORD v9[5];

  if (gLogCategory_BTAudioRoutingRequest <= 30
    && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
  {
    clientID = self->_clientID;
    LogPrintF();
  }
  -[BTAudioRoutingRequest _ensureXPCStarted](self, "_ensureXPCStarted", clientID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[BTAudioRoutingRequest _reportError:](self, "_reportError:", v3);
  }
  else
  {
    v4 = MEMORY[0x24BDAC760];
    xpcCnx = self->_xpcCnx;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __34__BTAudioRoutingRequest__activate__block_invoke;
    v9[3] = &unk_25081CE58;
    v9[4] = self;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __34__BTAudioRoutingRequest__activate__block_invoke_2;
    v8[3] = &unk_25081D420;
    v8[4] = self;
    objc_msgSend(v6, "audioRoutingRequest:responseHandler:", self, v8);

  }
}

void __34__BTAudioRoutingRequest__activate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (gLogCategory_BTAudioRoutingRequest <= 90)
  {
    if (gLogCategory_BTAudioRoutingRequest != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      v5 = v3;
      LogPrintF();
      v3 = v6;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_reportError:", v3, v5);

}

void __34__BTAudioRoutingRequest__activate__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (gLogCategory_BTAudioRoutingRequest <= 90
      && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
    {
      v7 = v3;
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "_reportError:", v3, v7);
  }
  else
  {
    if (gLogCategory_BTAudioRoutingRequest <= 30
      && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x23B7FD6BC](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 72);
      *(_QWORD *)(v5 + 72) = 0;

      ((void (**)(_QWORD, id))v4)[2](v4, v8);
    }

  }
}

- (id)activateSync
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__BTAudioRoutingRequest_activateSync__block_invoke;
  v5[3] = &unk_25081D448;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __37__BTAudioRoutingRequest_activateSync__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_activateSync");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_activateSync
{
  void *v3;
  id v4;
  uint64_t v5;
  NSXPCConnection *xpcCnx;
  void *v7;
  uint64_t clientID;
  _QWORD v10[6];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  if (gLogCategory_BTAudioRoutingRequest <= 30
    && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
  {
    clientID = self->_clientID;
    LogPrintF();
  }
  -[BTAudioRoutingRequest _ensureXPCStarted](self, "_ensureXPCStarted", clientID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[BTAudioRoutingRequest _reportError:](self, "_reportError:", v3);
    v4 = 0;
  }
  else
  {
    v5 = MEMORY[0x24BDAC760];
    xpcCnx = self->_xpcCnx;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __38__BTAudioRoutingRequest__activateSync__block_invoke;
    v11[3] = &unk_25081CE58;
    v11[4] = self;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](xpcCnx, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __38__BTAudioRoutingRequest__activateSync__block_invoke_2;
    v10[3] = &unk_25081D470;
    v10[4] = self;
    v10[5] = &v12;
    objc_msgSend(v7, "audioRoutingRequest:responseHandler:", self, v10);

    v4 = (id)v13[5];
  }

  _Block_object_dispose(&v12, 8);
  return v4;
}

void __38__BTAudioRoutingRequest__activateSync__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (gLogCategory_BTAudioRoutingRequest <= 90)
  {
    if (gLogCategory_BTAudioRoutingRequest != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      v5 = v3;
      LogPrintF();
      v3 = v6;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_reportError:", v3, v5);

}

void __38__BTAudioRoutingRequest__activateSync__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = 0;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  objc_msgSend(v8, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (gLogCategory_BTAudioRoutingRequest <= 90
      && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 32), "_reportError:", v6, v6);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_reportError:", v6, v7);
    }
  }
  else if (gLogCategory_BTAudioRoutingRequest <= 30
         && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)_handleServerDied
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__BTAudioRoutingRequest__handleServerDied__block_invoke;
  block[3] = &unk_25081CE30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __42__BTAudioRoutingRequest__handleServerDied__block_invoke(uint64_t a1)
{
  id v2;

  if (gLogCategory_BTAudioRoutingRequest <= 50
    && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", AudioAccessorydDiedNotification, *(_QWORD *)(a1 + 32));

}

- (id)_ensureXPCStarted
{
  NSXPCListenerEndpoint *v3;
  id v4;
  NSXPCConnection *v5;
  NSXPCConnection *xpcCnx;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[5];

  if (!self->_xpcCnx)
  {
    v3 = self->_testListenerEndpoint;
    v4 = objc_alloc(MEMORY[0x24BDD1988]);
    if (v3)
      v5 = (NSXPCConnection *)objc_msgSend(v4, "initWithListenerEndpoint:", v3);
    else
      v5 = (NSXPCConnection *)objc_msgSend(v4, "initWithMachServiceName:options:", CFSTR("com.apple.BluetoothServices"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v5;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2564490A0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v7);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    v8 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __42__BTAudioRoutingRequest__ensureXPCStarted__block_invoke;
    v12[3] = &unk_25081CE30;
    v12[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v12);
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __42__BTAudioRoutingRequest__ensureXPCStarted__block_invoke_2;
    v11[3] = &unk_25081CE30;
    v11[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v11);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2564491F0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v9);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
  }
  return 0;
}

uint64_t __42__BTAudioRoutingRequest__ensureXPCStarted__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_interrupted");
  return objc_msgSend(*(id *)(a1 + 32), "_handleServerDied");
}

_BYTE *__42__BTAudioRoutingRequest__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _BYTE *result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_invalidated");
  result = *(_BYTE **)(a1 + 32);
  if (!result[8])
    return (_BYTE *)objc_msgSend(result, "_handleServerDied");
  return result;
}

- (void)_interrupted
{
  id v3;

  if (gLogCategory_BTAudioRoutingRequest <= 50
    && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  BTErrorF();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BTAudioRoutingRequest _reportError:](self, "_reportError:", v3);

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__BTAudioRoutingRequest_invalidate__block_invoke;
  block[3] = &unk_25081CE30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__BTAudioRoutingRequest_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  id *v3;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    v2 = result;
    *(_BYTE *)(v1 + 8) = 1;
    if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 9)
      && gLogCategory_BTAudioRoutingRequest <= 30
      && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = *(id **)(v2 + 32);
    if (v3[2])
    {
      objc_msgSend(v3[2], "invalidate");
      v3 = *(id **)(v2 + 32);
    }
    return objc_msgSend(v3, "_invalidated");
  }
  return result;
}

- (void)_invalidated
{
  id responseHandler;
  BTAudioRoutingResponse *v4;
  void *v5;
  NSXPCConnection *xpcCnx;
  void (**v7)(id, BTAudioRoutingResponse *);

  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_BTAudioRoutingRequest <= 50
      && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_xpcCnx)
    {
      v7 = (void (**)(id, BTAudioRoutingResponse *))MEMORY[0x23B7FD6BC](self->_responseHandler, a2);
      responseHandler = self->_responseHandler;
      self->_responseHandler = 0;

      if (v7)
      {
        v4 = objc_alloc_init(BTAudioRoutingResponse);
        BTErrorF();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[BTAudioRoutingResponse setError:](v4, "setError:", v5);

        v7[2](v7, v4);
      }
      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_BTAudioRoutingRequest <= 10
        && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

    }
  }
}

- (void)updateAudioState:(id)a3 withState:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  const char *v7;
  void *v8;
  NSXPCConnection *xpcCnx;
  void *v10;
  uint64_t clientID;
  const char *v12;
  id v13;
  _QWORD v14[5];

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (gLogCategory_BTAudioRoutingRequest <= 50
    && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
  {
    if (v4 > 2)
      v7 = "?";
    else
      v7 = off_25081D490[(int)v4];
    v12 = v7;
    v13 = v6;
    clientID = self->_clientID;
    LogPrintF();
  }
  -[BTAudioRoutingRequest _ensureXPCStarted](self, "_ensureXPCStarted", clientID, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (gLogCategory_BTAudioRoutingRequest > 90
      || gLogCategory_BTAudioRoutingRequest == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_19;
    }
LABEL_12:
    LogPrintF();
    goto LABEL_19;
  }
  xpcCnx = self->_xpcCnx;
  if (xpcCnx)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __52__BTAudioRoutingRequest_updateAudioState_withState___block_invoke;
    v14[3] = &unk_25081CE58;
    v14[4] = self;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "audioStateUpdate:withApps:", v4, v6);

    goto LABEL_19;
  }
  if (gLogCategory_BTAudioRoutingRequest <= 90
    && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_12;
  }
LABEL_19:

}

void __52__BTAudioRoutingRequest_updateAudioState_withState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (gLogCategory_BTAudioRoutingRequest <= 90)
  {
    if (gLogCategory_BTAudioRoutingRequest != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      v5 = v3;
      LogPrintF();
      v3 = v6;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_reportError:", v3, v5);

}

- (void)_reportError:(id)a3
{
  void (**v4)(_QWORD, _QWORD);
  id responseHandler;
  BTAudioRoutingResponse *v6;
  id v7;

  v7 = a3;
  if (gLogCategory_BTAudioRoutingRequest <= 90
    && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x23B7FD6BC](self->_responseHandler);
  if (v4)
  {
    responseHandler = self->_responseHandler;
    self->_responseHandler = 0;

    v6 = objc_alloc_init(BTAudioRoutingResponse);
    -[BTAudioRoutingResponse setError:](v6, "setError:", v7);
    ((void (**)(_QWORD, BTAudioRoutingResponse *))v4)[2](v4, v6);

  }
}

- (int)audioScore
{
  return self->_audioScore;
}

- (void)setAudioScore:(int)a3
{
  self->_audioScore = a3;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (void)setAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(id)a3
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

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_clientID = a3;
}

- (NSXPCListenerEndpoint)testListenerEndpoint
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
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_deviceAddress, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end
