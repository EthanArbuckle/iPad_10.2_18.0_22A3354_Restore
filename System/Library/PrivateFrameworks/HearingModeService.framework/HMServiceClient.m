@implementation HMServiceClient

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t clientID;
  uint64_t internalFlags;
  id v7;

  v4 = a3;
  clientID = self->_clientID;
  v7 = v4;
  if ((_DWORD)clientID)
  {
    objc_msgSend(v4, "encodeInt64:forKey:", clientID, CFSTR("cid"));
    v4 = v7;
  }
  internalFlags = self->_internalFlags;
  if ((_DWORD)internalFlags)
  {
    objc_msgSend(v7, "encodeInt64:forKey:", internalFlags, CFSTR("inf"));
    v4 = v7;
  }

}

- (HMServiceClient)initWithCoder:(id)a3
{
  id v4;
  HMServiceClient *v5;
  HMServiceClient *v6;

  v4 = a3;
  v5 = -[HMServiceClient init](self, "init");
  if (v5)
  {
    if (NSDecodeSInt64RangedIfPresent())
      v5->_clientID = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_internalFlags = 0;
    v6 = v5;
  }

  return v5;
}

- (id)description
{
  NSAppendPrintF();
  return 0;
}

- (HMServiceClient)init
{
  HMServiceClient *v2;
  HMServiceClient *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMServiceClient;
  v2 = -[HMServiceClient init](&v5, sel_init);
  if (v2)
  {
    v2->_clientID = HMXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v3 = v2;
  }

  return v2;
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
  v7[2] = __42__HMServiceClient_activateWithCompletion___block_invoke;
  v7[3] = &unk_250EB8400;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __42__HMServiceClient_activateWithCompletion___block_invoke(uint64_t a1)
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
    if (gLogCategory_HMServiceClient <= 90
      && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

  }
  else
  {
    *(_BYTE *)(v2 + 8) = 1;
    v3 = MEMORY[0x2426487B0](*(_QWORD *)(a1 + 40));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    objc_msgSend(*(id *)(a1 + 32), "_activate");
  }
}

- (void)_activate
{
  void (**v3)(_QWORD, _QWORD);
  id activateCompletion;
  void *v5;
  uint64_t v6;
  NSXPCConnection *xpcCnx;
  void *v8;
  uint64_t clientID;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];

  if (self->_deviceDiagnosticRecordFoundHandler)
    self->_internalFlags |= 1u;
  if (self->_invalidateCalled)
  {
    NSErrorF();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_HMServiceClient <= 90
      && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x2426487B0](self->_activateCompletion);
    activateCompletion = self->_activateCompletion;
    self->_activateCompletion = 0;

    if (v3)
      ((void (**)(_QWORD, id))v3)[2](v3, v10);

  }
  else
  {
    if (gLogCategory_HMServiceClient <= 30
      && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
    {
      clientID = self->_clientID;
      LogPrintF();
    }
    -[HMServiceClient _ensureXPCStarted](self, "_ensureXPCStarted", clientID);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[HMServiceClient _reportError:](self, "_reportError:", v5);
    }
    else
    {
      v6 = MEMORY[0x24BDAC760];
      xpcCnx = self->_xpcCnx;
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __28__HMServiceClient__activate__block_invoke;
      v12[3] = &unk_250EB8428;
      v12[4] = self;
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v6;
      v11[1] = 3221225472;
      v11[2] = __28__HMServiceClient__activate__block_invoke_2;
      v11[3] = &unk_250EB8428;
      v11[4] = self;
      objc_msgSend(v8, "clientActivate:completion:", self, v11);

    }
  }
}

void __28__HMServiceClient__activate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (gLogCategory_HMServiceClient <= 90)
  {
    if (gLogCategory_HMServiceClient != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      v5 = v3;
      LogPrintF();
      v3 = v6;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_reportError:", v3, v5);

}

void __28__HMServiceClient__activate__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  int v5;
  void (**v6)(_QWORD, _QWORD);
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v3 = a2;
  v10 = v3;
  if (v3)
  {
    v4 = v3;
    if (gLogCategory_HMServiceClient <= 90)
    {
      if (gLogCategory_HMServiceClient != -1 || (v5 = _LogCategory_Initialize(), v4 = v10, v5))
      {
        v9 = v4;
        LogPrintF();
        v4 = v10;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_reportError:", v4, v9);
  }
  else
  {
    if (gLogCategory_HMServiceClient <= 30
      && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x2426487B0](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 16);
    *(_QWORD *)(v7 + 16) = 0;

    if (v6)
      v6[2](v6, 0);

  }
}

- (id)_ensureXPCStarted
{
  void *v3;
  NSXPCConnection *v4;
  NSXPCConnection *xpcCnx;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[5];

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256D1A3F8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_xpcCnx)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.HearingModeService"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v4;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v3);
    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    v6 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __36__HMServiceClient__ensureXPCStarted__block_invoke;
    v10[3] = &unk_250EB83D8;
    v10[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v10);
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __36__HMServiceClient__ensureXPCStarted__block_invoke_2;
    v9[3] = &unk_250EB83D8;
    v9[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v9);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256D1A458);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
  }

  return 0;
}

uint64_t __36__HMServiceClient__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __36__HMServiceClient__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_interrupted
{
  void *v3;
  id activateCompletion;
  void (**interruptionHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_HMServiceClient <= 50
    && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  NSErrorF();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMServiceClient _reportError:](self, "_reportError:", v3);

  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler)
    interruptionHandler[2]();
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__HMServiceClient_invalidate__block_invoke;
  block[3] = &unk_250EB83D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __29__HMServiceClient_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *);

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25)
      && gLogCategory_HMServiceClient <= 30
      && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 40);
    if (v4)
    {
      objc_msgSend(v4, "invalidate");
      v3 = *(_QWORD *)(a1 + 32);
    }
    v8 = (void (**)(id, void *))MEMORY[0x2426487B0](*(_QWORD *)(v3 + 16));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = 0;

    if (v8)
    {
      NSErrorF();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v7);

    }
    objc_msgSend(*(id *)(a1 + 32), "_invalidated");

  }
}

- (void)_invalidated
{
  id activateCompletion;
  void *v4;
  id deviceRecordChangedHandler;
  id interruptionHandler;
  void (**v7)(_QWORD);
  id invalidationHandler;
  NSMutableDictionary *recordMap;
  NSXPCConnection *xpcCnx;
  void (**v11)(id, void *);

  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_HMServiceClient <= 50
      && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_xpcCnx)
    {
      v11 = (void (**)(id, void *))MEMORY[0x2426487B0](self->_activateCompletion, a2);
      activateCompletion = self->_activateCompletion;
      self->_activateCompletion = 0;

      if (v11)
      {
        NSErrorF();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v11[2](v11, v4);

      }
      deviceRecordChangedHandler = self->_deviceRecordChangedHandler;
      self->_deviceRecordChangedHandler = 0;

      interruptionHandler = self->_interruptionHandler;
      self->_interruptionHandler = 0;

      v7 = (void (**)(_QWORD))MEMORY[0x2426487B0](self->_invalidationHandler);
      invalidationHandler = self->_invalidationHandler;
      self->_invalidationHandler = 0;

      if (v7)
        v7[2](v7);
      -[NSMutableDictionary removeAllObjects](self->_recordMap, "removeAllObjects");
      recordMap = self->_recordMap;
      self->_recordMap = 0;

      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_HMServiceClient <= 10
        && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
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
  if (gLogCategory_HMServiceClient <= 90
    && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x2426487B0](self->_activateCompletion);
  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  if (v4)
    ((void (**)(_QWORD, id))v4)[2](v4, v6);

}

- (id)fetchHearingModeDeviceRecordForIdentifier:(id)a3
{
  id v4;
  HMServiceClient *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_recordMap, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  if (gLogCategory_HMServiceClient <= 30
    && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return v6;
}

- (void)modifyDeviceConfig:(id)a3 identifier:(id)a4 completion:(id)a5
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
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __60__HMServiceClient_modifyDeviceConfig_identifier_completion___block_invoke;
  v15[3] = &unk_250EB8478;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(dispatchQueue, v15);

}

void __60__HMServiceClient_modifyDeviceConfig_identifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
  {
    NSErrorF();
    v2 = objc_claimAutoreleasedReturnValue();
    v12 = (id)v2;
    if (gLogCategory_HMServiceClient <= 90)
    {
      if (gLogCategory_HMServiceClient != -1 || (v3 = _LogCategory_Initialize(), v2 = (uint64_t)v12, v3))
      {
        LogPrintF();
        v2 = (uint64_t)v12;
      }
    }
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v2);

  }
  else
  {
    if (gLogCategory_HMServiceClient <= 30
      && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 48);
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted", v10, v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      v5 = MEMORY[0x24BDAC760];
      v6 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __60__HMServiceClient_modifyDeviceConfig_identifier_completion___block_invoke_2;
      v15[3] = &unk_250EB8450;
      v16 = *(id *)(a1 + 56);
      objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v15);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      v13[0] = v5;
      v13[1] = 3221225472;
      v13[2] = __60__HMServiceClient_modifyDeviceConfig_identifier_completion___block_invoke_3;
      v13[3] = &unk_250EB8450;
      v14 = *(id *)(a1 + 56);
      objc_msgSend(v7, "clientModifyDeviceConfig:identifier:completion:", v8, v9, v13);

    }
  }
}

void __60__HMServiceClient_modifyDeviceConfig_identifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (gLogCategory_HMServiceClient <= 90)
  {
    if (gLogCategory_HMServiceClient != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      LogPrintF();
      v3 = v6;
    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

void __60__HMServiceClient_modifyDeviceConfig_identifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    if (gLogCategory_HMServiceClient <= 90)
    {
      if (gLogCategory_HMServiceClient != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        v3 = v6;
      }
    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

- (void)triggerOnDemandDiagnosticCheckForDeviceIdentifier:(id)a3 completion:(id)a4
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
  block[2] = __80__HMServiceClient_triggerOnDemandDiagnosticCheckForDeviceIdentifier_completion___block_invoke;
  block[3] = &unk_250EB84C8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

void __80__HMServiceClient_triggerOnDemandDiagnosticCheckForDeviceIdentifier_completion___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[24])
  {
    NSErrorF();
    v3 = objc_claimAutoreleasedReturnValue();
    v11 = (id)v3;
    if (gLogCategory_HMServiceClient <= 90)
    {
      if (gLogCategory_HMServiceClient != -1 || (v5 = _LogCategory_Initialize(), v3 = (uint64_t)v11, v5))
      {
        LogPrintF();
        v3 = (uint64_t)v11;
      }
    }
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v3);

  }
  else
  {
    objc_msgSend(v2, "_ensureXPCStarted");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      if (gLogCategory_HMServiceClient <= 30
        && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v6 = MEMORY[0x24BDAC760];
      v7 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __80__HMServiceClient_triggerOnDemandDiagnosticCheckForDeviceIdentifier_completion___block_invoke_2;
      v14[3] = &unk_250EB84A0;
      v8 = *(id *)(a1 + 48);
      v14[4] = 0;
      v15 = v8;
      objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v6;
      v12[1] = 3221225472;
      v12[2] = __80__HMServiceClient_triggerOnDemandDiagnosticCheckForDeviceIdentifier_completion___block_invoke_3;
      v12[3] = &unk_250EB8450;
      v10 = *(_QWORD *)(a1 + 40);
      v13 = *(id *)(a1 + 48);
      objc_msgSend(v9, "clientTriggerOnDemandDiagnosticCheckForDeviceIdentifier:completion:", v10, v12);

    }
  }
}

uint64_t __80__HMServiceClient_triggerOnDemandDiagnosticCheckForDeviceIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __80__HMServiceClient_triggerOnDemandDiagnosticCheckForDeviceIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    if (gLogCategory_HMServiceClient <= 90)
    {
      if (gLogCategory_HMServiceClient != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        v3 = v6;
      }
    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

- (void)clientHMDeviceRecordChanged:(id)a3
{
  HMServiceClient *v4;
  void *v5;
  NSMutableDictionary *recordMap;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  id v9;

  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v9, "bluetoothUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    recordMap = v4->_recordMap;
    if (!recordMap)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v8 = v4->_recordMap;
      v4->_recordMap = v7;

      recordMap = v4->_recordMap;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](recordMap, "setObject:forKeyedSubscript:", v9, v5);

    objc_sync_exit(v4);
    if (v4->_deviceRecordChangedHandler)
    {
      if (gLogCategory_HMServiceClient <= 30
        && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      (*((void (**)(id, id))v4->_deviceRecordChangedHandler + 2))(v4->_deviceRecordChangedHandler, v9);
    }
    else if (gLogCategory_HMServiceClient <= 10
           && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    objc_sync_exit(v4);

  }
}

- (void)clientHMDeviceRecordLost:(id)a3
{
  HMServiceClient *v4;
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v6, "bluetoothUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_recordMap, "setObject:forKeyedSubscript:", 0, v5);

    objc_sync_exit(v4);
    if (gLogCategory_HMServiceClient <= 30
      && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    objc_sync_exit(v4);

  }
}

- (void)clientHMDeviceDiagnosticRecordFound:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_deviceDiagnosticRecordFoundHandler)
  {
    if (gLogCategory_HMServiceClient <= 30
      && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, id))self->_deviceDiagnosticRecordFoundHandler + 2))(self->_deviceDiagnosticRecordFoundHandler, v4);
  }
  else if (gLogCategory_HMServiceClient <= 10
         && (gLogCategory_HMServiceClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)deviceRecordChangedHandler
{
  return self->_deviceRecordChangedHandler;
}

- (void)setDeviceRecordChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)deviceDiagnosticRecordFoundHandler
{
  return self->_deviceDiagnosticRecordFoundHandler;
}

- (void)setDeviceDiagnosticRecordFoundHandler:(id)a3
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

- (unsigned)internalFlags
{
  return self->_internalFlags;
}

- (void)setInternalFlags:(unsigned int)a3
{
  self->_internalFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceDiagnosticRecordFoundHandler, 0);
  objc_storeStrong(&self->_deviceRecordChangedHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_recordMap, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

@end
