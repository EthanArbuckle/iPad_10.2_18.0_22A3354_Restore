@implementation AAAudioRoutingControl

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AAAudioRoutingControl)init
{
  AAAudioRoutingControl *v2;
  AAAudioRoutingControl *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AAAudioRoutingControl;
  v2 = -[AAAudioRoutingControl init](&v5, sel_init);
  if (v2)
  {
    v2->_clientID = AAXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v3 = v2;
  }

  return v2;
}

- (AAAudioRoutingControl)initWithCoder:(id)a3
{
  id v4;
  AAAudioRoutingControl *v5;
  id v6;
  id v7;
  AAAudioRoutingControl *v8;

  v4 = a3;
  v5 = -[AAAudioRoutingControl init](self, "init");
  if (v5)
  {
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    if (NSDecodeSInt64RangedIfPresent())
      v5->_clientID = 0;
    v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *appBundleID;
  uint64_t clientID;
  NSString *deviceAddress;
  id v8;

  v4 = a3;
  appBundleID = self->_appBundleID;
  v8 = v4;
  if (appBundleID)
  {
    objc_msgSend(v4, "encodeObject:forKey:", appBundleID, CFSTR("aid"));
    v4 = v8;
  }
  clientID = self->_clientID;
  if ((_DWORD)clientID)
  {
    objc_msgSend(v8, "encodeInt64:forKey:", clientID, CFSTR("cid"));
    v4 = v8;
  }
  deviceAddress = self->_deviceAddress;
  if (deviceAddress)
  {
    objc_msgSend(v8, "encodeObject:forKey:", deviceAddress, CFSTR("dAdr"));
    v4 = v8;
  }

}

- (id)description
{
  NSAppendPrintF();
  return 0;
}

- (void)hrmSessionStateChanged:(BOOL)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *dispatchQueue;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  v7 = v6;
  if (self->_activateCalled)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__AAAudioRoutingControl_hrmSessionStateChanged_completion___block_invoke;
    block[3] = &unk_25081D5E8;
    block[4] = self;
    v10 = v6;
    v11 = a3;
    dispatch_async(dispatchQueue, block);

  }
}

void __59__AAAudioRoutingControl_hrmSessionStateChanged_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
  {
    if (gLogCategory_AAAudioRoutingControl <= 90
      && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_AAAudioRoutingControl <= 30
      && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v2 = *(void **)(a1 + 40);
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __59__AAAudioRoutingControl_hrmSessionStateChanged_completion___block_invoke_2;
    v5[3] = &unk_25081CE08;
    v6 = v2;
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeHRMSessionChanged:hrmState:completion:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

  }
}

uint64_t __59__AAAudioRoutingControl_hrmSessionStateChanged_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)activateWithCompletion:(id)a3
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
  v7[2] = __48__AAAudioRoutingControl_activateWithCompletion___block_invoke;
  v7[3] = &unk_25081CD40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __48__AAAudioRoutingControl_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 8))
  {
    NSErrorF();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_AAAudioRoutingControl <= 90
      && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

  }
  else
  {
    *(_BYTE *)(v2 + 8) = 1;
    v3 = MEMORY[0x23B7FD6BC](*(_QWORD *)(a1 + 40));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    objc_msgSend(*(id *)(a1 + 32), "_activate");
  }
}

- (void)_activate
{
  BOOL v3;
  BOOL v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id activateCompletion;
  id v8;
  _QWORD v9[5];

  if (gLogCategory_AAAudioRoutingControl <= 30
    && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_testListenerEndpoint)
    v3 = 1;
  else
    v3 = gAAServicesDaemon == 0;
  v4 = !v3;
  self->_direct = v4;
  if (gLogCategory_AAAudioRoutingControl <= 30
    && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_invalidateCalled)
  {
    NSErrorF();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_AAAudioRoutingControl <= 90
      && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x23B7FD6BC](self->_activateCompletion);
    activateCompletion = self->_activateCompletion;
    self->_activateCompletion = 0;

    if (v6)
      ((void (**)(_QWORD, id))v6)[2](v6, v8);

  }
  else
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __34__AAAudioRoutingControl__activate__block_invoke;
    v9[3] = &unk_25081CE58;
    v9[4] = self;
    v5 = (void *)MEMORY[0x23B7FD6BC](v9);
    if (self->_direct)
      -[AAAudioRoutingControl _activateDirect:](self, "_activateDirect:", v5);
    else
      -[AAAudioRoutingControl _activateXPC:](self, "_activateXPC:", v5);

  }
}

void __34__AAAudioRoutingControl__activate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void (**v5)(_QWORD, _QWORD);
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;
  id v11;

  v3 = a2;
  v11 = v3;
  if (v3)
  {
    if (gLogCategory_AAAudioRoutingControl <= 90
      && ((v4 = v3, gLogCategory_AAAudioRoutingControl != -1) || (v8 = _LogCategory_Initialize(), v4 = v11, v8)))
    {
      v10 = v4;
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 32), "_reportError:", v11, v10);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_reportError:", v11, v9);
    }
  }
  else
  {
    v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x23B7FD6BC](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = 0;

    if (v5)
      v5[2](v5, 0);

  }
}

- (void)_activateDirect:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (gLogCategory_AAAudioRoutingControl <= 30
    && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5 = (void *)gAAServicesDaemon;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__AAAudioRoutingControl__activateDirect___block_invoke;
  v7[3] = &unk_25081CDB8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "activateAudioRoutingControl:completion:", self, v7);

}

void __41__AAAudioRoutingControl__activateDirect___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__AAAudioRoutingControl__activateDirect___block_invoke_2;
  v7[3] = &unk_25081CD90;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __41__AAAudioRoutingControl__activateDirect___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)_activateXPC:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  NSXPCConnection *xpcCnx;
  uint64_t v7;
  void (**v8)(id, void *);
  void *v9;
  uint64_t clientID;
  _QWORD v11[4];
  void (**v12)(id, void *);
  _QWORD v13[4];
  void (**v14)(id, void *);

  v4 = (void (**)(id, void *))a3;
  if (gLogCategory_AAAudioRoutingControl <= 30
    && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
  {
    clientID = self->_clientID;
    LogPrintF();
  }
  -[AAAudioRoutingControl _ensureXPCStarted](self, "_ensureXPCStarted", clientID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v4[2](v4, v5);
  }
  else
  {
    xpcCnx = self->_xpcCnx;
    v7 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __38__AAAudioRoutingControl__activateXPC___block_invoke;
    v13[3] = &unk_25081CE08;
    v8 = v4;
    v14 = v8;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __38__AAAudioRoutingControl__activateXPC___block_invoke_2;
    v11[3] = &unk_25081CE08;
    v12 = v8;
    objc_msgSend(v9, "audioRoutingControlActivate:completion:", self, v11);

  }
}

void __38__AAAudioRoutingControl__activateXPC___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (gLogCategory_AAAudioRoutingControl <= 90
    && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

uint64_t __38__AAAudioRoutingControl__activateXPC___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setArbitrationBlockingModeWithCompletion:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, void *);
  const char *v7;
  void *v8;
  NSXPCConnection *xpcCnx;
  uint64_t v10;
  void (**v11)(id, void *);
  void *v12;
  const char *v13;
  uint64_t clientID;
  NSString *appBundleID;
  _QWORD v16[4];
  void (**v17)(id, void *);
  _QWORD v18[4];
  void (**v19)(id, void *);

  v4 = a3;
  v6 = (void (**)(id, void *))a4;
  if (gLogCategory_AAAudioRoutingControl <= 30
    && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
  {
    v7 = "no";
    if (v4)
      v7 = "yes";
    clientID = self->_clientID;
    appBundleID = self->_appBundleID;
    v13 = v7;
    LogPrintF();
  }
  -[AAAudioRoutingControl _ensureXPCStarted](self, "_ensureXPCStarted", v13, clientID, appBundleID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (gLogCategory_AAAudioRoutingControl <= 90
      && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v6[2](v6, v8);
  }
  else
  {
    if (!self->_xpcCnx
      && gLogCategory_AAAudioRoutingControl <= 90
      && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    xpcCnx = self->_xpcCnx;
    v10 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __77__AAAudioRoutingControl_setArbitrationBlockingModeWithCompletion_completion___block_invoke;
    v18[3] = &unk_25081CE08;
    v11 = v6;
    v19 = v11;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __77__AAAudioRoutingControl_setArbitrationBlockingModeWithCompletion_completion___block_invoke_2;
    v16[3] = &unk_25081CE08;
    v17 = v11;
    objc_msgSend(v12, "setHijackBlockingMode:mode:completion:", self, v4, v16);

  }
}

void __77__AAAudioRoutingControl_setArbitrationBlockingModeWithCompletion_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (gLogCategory_AAAudioRoutingControl <= 90
    && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

uint64_t __77__AAAudioRoutingControl_setArbitrationBlockingModeWithCompletion_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_handleServerDied
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__AAAudioRoutingControl__handleServerDied__block_invoke;
  block[3] = &unk_25081CE30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __42__AAAudioRoutingControl__handleServerDied__block_invoke(uint64_t a1)
{
  id v2;

  if (gLogCategory_AAAudioRoutingControl <= 50
    && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", AAAudioRoutingControlAudioAccessorydDiedNotification, *(_QWORD *)(a1 + 32));

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
      v5 = (NSXPCConnection *)objc_msgSend(v4, "initWithMachServiceName:options:", CFSTR("com.apple.AudioAccessoryServices"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v5;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2564489E8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v7);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    v8 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __42__AAAudioRoutingControl__ensureXPCStarted__block_invoke;
    v12[3] = &unk_25081CE30;
    v12[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v12);
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __42__AAAudioRoutingControl__ensureXPCStarted__block_invoke_2;
    v11[3] = &unk_25081CE30;
    v11[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v11);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256448A48);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v9);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
  }
  return 0;
}

uint64_t __42__AAAudioRoutingControl__ensureXPCStarted__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_interrupted");
  return objc_msgSend(*(id *)(a1 + 32), "_handleServerDied");
}

_BYTE *__42__AAAudioRoutingControl__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _BYTE *result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_invalidated");
  result = *(_BYTE **)(a1 + 32);
  if (!result[25])
    return (_BYTE *)objc_msgSend(result, "_handleServerDied");
  return result;
}

- (void)_interrupted
{
  id v3;

  if (gLogCategory_AAAudioRoutingControl <= 50
    && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  BTErrorF();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AAAudioRoutingControl _reportError:](self, "_reportError:", v3);

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__AAAudioRoutingControl_invalidate__block_invoke;
  block[3] = &unk_25081CE30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __35__AAAudioRoutingControl_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void (**v7)(id, void *);

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 25))
  {
    *(_BYTE *)(v1 + 25) = 1;
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 26)
      && gLogCategory_AAAudioRoutingControl <= 30
      && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v3 + 24))
    {
      objc_msgSend((id)v3, "_invalidateDirect");
      v3 = *(_QWORD *)(a1 + 32);
    }
    if (*(_QWORD *)(v3 + 32))
    {
      objc_msgSend(*(id *)(v3 + 32), "invalidate");
      v3 = *(_QWORD *)(a1 + 32);
    }
    v7 = (void (**)(id, void *))MEMORY[0x23B7FD6BC](*(_QWORD *)(v3 + 16));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = 0;

    if (v7)
    {
      BTErrorF();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v6);

    }
    objc_msgSend(*(id *)(a1 + 32), "_invalidated");

  }
}

- (void)_invalidateDirect
{
  objc_msgSend((id)gAAServicesDaemon, "invalidateAudioRoutingControl:completion:");
}

void __42__AAAudioRoutingControl__invalidateDirect__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 64);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__AAAudioRoutingControl__invalidateDirect__block_invoke_2;
  block[3] = &unk_25081CE30;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __42__AAAudioRoutingControl__invalidateDirect__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_invalidated
{
  id activateCompletion;
  void *v4;
  NSXPCConnection *xpcCnx;
  void (**v6)(id, void *);

  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_AAAudioRoutingControl <= 50
      && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_direct && !self->_xpcCnx)
    {
      v6 = (void (**)(id, void *))MEMORY[0x23B7FD6BC](self->_activateCompletion, a2);
      activateCompletion = self->_activateCompletion;
      self->_activateCompletion = 0;

      if (v6)
      {
        BTErrorF();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, v4);

      }
      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_AAAudioRoutingControl <= 10
        && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

    }
  }
}

- (void)_reportError:(id)a3
{
  void (**v4)(_QWORD, _QWORD);
  id activateCompletion;
  id v6;

  v6 = a3;
  if (gLogCategory_AAAudioRoutingControl <= 90
    && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x23B7FD6BC](self->_activateCompletion);
  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  if (v4)
    ((void (**)(_QWORD, id))v4)[2](v4, v6);

}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (void)setAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
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
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_deviceAddress, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

@end
