@implementation AACloudServicesClient

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t internalFlags;

  internalFlags = self->_internalFlags;
  if ((_DWORD)internalFlags)
    objc_msgSend(a3, "encodeInt64:forKey:", internalFlags, CFSTR("inf"));
}

- (AACloudServicesClient)initWithCoder:(id)a3
{
  id v4;
  AACloudServicesClient *v5;
  AACloudServicesClient *v6;

  v4 = a3;
  v5 = -[AACloudServicesClient init](self, "init");
  if (v5)
  {
    if (NSDecodeSInt64RangedIfPresent())
      v5->_internalFlags = 0;
    v6 = v5;
  }

  return v5;
}

- (AACloudServicesClient)init
{
  AACloudServicesClient *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *dispatchQueue;
  AACloudServicesClient *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AACloudServicesClient;
  v2 = -[AACloudServicesClient init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("AACloudServicesClient", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = v2;
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
  v7[2] = __48__AACloudServicesClient_activateWithCompletion___block_invoke;
  v7[3] = &unk_25081CD40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __48__AACloudServicesClient_activateWithCompletion___block_invoke(uint64_t a1)
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
    if (gLogCategory_AACloudServicesClient <= 90
      && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
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
  uint64_t v3;
  void (**v4)(_QWORD);
  void *v5;
  NSXPCConnection *xpcCnx;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t clientID;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  v3 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __34__AACloudServicesClient__activate__block_invoke;
  v14[3] = &unk_25081D448;
  v14[4] = self;
  v14[5] = &v15;
  v4 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](v14, a2);
  if (self->_invalidateCalled)
  {
    BTErrorF();
    v8 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v16[5];
    v16[5] = v8;
  }
  else
  {
    if (gLogCategory_AACloudServicesClient <= 30
      && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      clientID = self->_clientID;
      LogPrintF();
    }
    -[AACloudServicesClient _ensureXPCStarted](self, "_ensureXPCStarted", clientID);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      BTErrorF();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v16[5];
      v16[5] = v9;

    }
    else
    {
      xpcCnx = self->_xpcCnx;
      v13[0] = v3;
      v13[1] = 3221225472;
      v13[2] = __34__AACloudServicesClient__activate__block_invoke_2;
      v13[3] = &unk_25081CE58;
      v13[4] = self;
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v3;
      v12[1] = 3221225472;
      v12[2] = __34__AACloudServicesClient__activate__block_invoke_3;
      v12[3] = &unk_25081CE58;
      v12[4] = self;
      objc_msgSend(v7, "cloudServicesClientActivate:completion:", self, v12);

    }
  }

  v4[2](v4);
  _Block_object_dispose(&v15, 8);

}

uint64_t __34__AACloudServicesClient__activate__block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
    return objc_msgSend(*(id *)(result + 32), "_reportError:");
  return result;
}

void __34__AACloudServicesClient__activate__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (gLogCategory_AACloudServicesClient <= 90)
  {
    if (gLogCategory_AACloudServicesClient != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      v5 = v3;
      LogPrintF();
      v3 = v6;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_reportError:", v3, v5);

}

void __34__AACloudServicesClient__activate__block_invoke_3(uint64_t a1, void *a2)
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
    if (gLogCategory_AACloudServicesClient <= 90)
    {
      if (gLogCategory_AACloudServicesClient != -1 || (v5 = _LogCategory_Initialize(), v4 = v10, v5))
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
    if (gLogCategory_AACloudServicesClient <= 30
      && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x23B7FD6BC](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
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
  NSXPCListenerEndpoint *v4;
  id v5;
  NSXPCConnection *v6;
  NSXPCConnection *xpcCnx;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[5];

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256448CF0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_xpcCnx)
  {
    v4 = self->_testListenerEndpoint;
    v5 = objc_alloc(MEMORY[0x24BDD1988]);
    if (v4)
      v6 = (NSXPCConnection *)objc_msgSend(v5, "initWithListenerEndpoint:", v4);
    else
      v6 = (NSXPCConnection *)objc_msgSend(v5, "initWithMachServiceName:options:", CFSTR("com.apple.BluetoothCloudServices"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v6;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v3);
    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    v8 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __42__AACloudServicesClient__ensureXPCStarted__block_invoke;
    v12[3] = &unk_25081CE30;
    v12[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v12);
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __42__AACloudServicesClient__ensureXPCStarted__block_invoke_2;
    v11[3] = &unk_25081CE30;
    v11[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v11);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256448FF0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v9);
    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_AACloudServicesClient <= 30
      && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
  return 0;
}

uint64_t __42__AACloudServicesClient__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __42__AACloudServicesClient__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_interrupted
{
  void (**v3)(void);
  void (**v4)(void);

  if (gLogCategory_AACloudServicesClient <= 50
    && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = (void (**)(void))MEMORY[0x23B7FD6BC](self->_interruptionHandler);
  if (v3)
  {
    v4 = v3;
    v3[2]();
    v3 = v4;
  }

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__AACloudServicesClient_invalidate__block_invoke;
  block[3] = &unk_25081CE30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__AACloudServicesClient_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  id *v3;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 25)
      && gLogCategory_AACloudServicesClient <= 30
      && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = *(id **)(v2 + 32);
    if (v3[4])
    {
      objc_msgSend(v3[4], "invalidate");
      v3 = *(id **)(v2 + 32);
    }
    return objc_msgSend(v3, "_invalidated");
  }
  return result;
}

- (void)_invalidated
{
  uint64_t v3;
  void *v4;
  id interruptionHandler;
  id invalidationHandler;
  NSXPCConnection *xpcCnx;

  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_AACloudServicesClient <= 50
      && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_xpcCnx)
    {
      v3 = MEMORY[0x23B7FD6BC](self->_invalidationHandler, a2);
      v4 = (void *)v3;
      if (v3)
        (*(void (**)(uint64_t))(v3 + 16))(v3);

      interruptionHandler = self->_interruptionHandler;
      self->_interruptionHandler = 0;

      invalidationHandler = self->_invalidationHandler;
      self->_invalidationHandler = 0;

      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_AACloudServicesClient <= 10
        && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

- (void)fetchAAProxCardsInfoForDeviceWithAddress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  AACloudServicesClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__AACloudServicesClient_fetchAAProxCardsInfoForDeviceWithAddress_completion___block_invoke;
  block[3] = &unk_25081D778;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

void __77__AACloudServicesClient_fetchAAProxCardsInfoForDeviceWithAddress_completion___block_invoke(id *a1)
{
  uint64_t v2;
  void (**v3)(_QWORD);
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  v2 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __77__AACloudServicesClient_fetchAAProxCardsInfoForDeviceWithAddress_completion___block_invoke_2;
  v14[3] = &unk_25081D3D0;
  v16 = &v17;
  v15 = a1[6];
  v3 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](v14);
  if (gLogCategory_AACloudServicesClient <= 30
    && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (a1[4])
  {
    objc_msgSend(a1[5], "_ensureXPCStarted");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      BTErrorF();
      v11 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v18[5];
      v18[5] = v11;
    }
    else
    {
      v5 = a1[6];
      v6 = (void *)*((_QWORD *)a1[5] + 4);
      v12[0] = v2;
      v12[1] = 3221225472;
      v12[2] = __77__AACloudServicesClient_fetchAAProxCardsInfoForDeviceWithAddress_completion___block_invoke_3;
      v12[3] = &unk_25081CE08;
      v13 = v5;
      objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "uppercaseString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fetchAAProxCardsInfoForDeviceWithAddress:completion:", v8, a1[6]);

      v9 = v13;
    }

  }
  else
  {
    BTErrorF();
    v10 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v18[5];
    v18[5] = v10;
  }

  v3[2](v3);
  _Block_object_dispose(&v17, 8);

}

uint64_t __77__AACloudServicesClient_fetchAAProxCardsInfoForDeviceWithAddress_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_AACloudServicesClient <= 90
      && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

uint64_t __77__AACloudServicesClient_fetchAAProxCardsInfoForDeviceWithAddress_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)modifyAAProxCardsInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  AACloudServicesClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__AACloudServicesClient_modifyAAProxCardsInfo_completion___block_invoke;
  block[3] = &unk_25081D3A8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __58__AACloudServicesClient_modifyAAProxCardsInfo_completion___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  void (**v4)(_QWORD);
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  v2 = a1[4];
  v3 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __58__AACloudServicesClient_modifyAAProxCardsInfo_completion___block_invoke_2;
  v14[3] = &unk_25081D380;
  v16 = &v17;
  v14[4] = v2;
  v15 = a1[6];
  v4 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](v14);
  if (v2)
  {
    objc_msgSend(a1[5], "_ensureXPCStarted");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      BTErrorF();
      v11 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v18[5];
      v18[5] = v11;
    }
    else
    {
      if (gLogCategory_AACloudServicesClient <= 30
        && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v6 = a1[6];
      v7 = (void *)*((_QWORD *)a1[5] + 4);
      v12[0] = v3;
      v12[1] = 3221225472;
      v12[2] = __58__AACloudServicesClient_modifyAAProxCardsInfo_completion___block_invoke_3;
      v12[3] = &unk_25081CE08;
      v13 = v6;
      objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "modifyAAProxCardsInfo:completion:", v2, a1[6]);

      v9 = v13;
    }

  }
  else
  {
    BTErrorF();
    v10 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v18[5];
    v18[5] = v10;
  }

  v4[2](v4);
  _Block_object_dispose(&v17, 8);

}

uint64_t __58__AACloudServicesClient_modifyAAProxCardsInfo_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_AACloudServicesClient <= 90
      && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __58__AACloudServicesClient_modifyAAProxCardsInfo_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeAAProxCardsInfoForDeviceWithAddress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  AACloudServicesClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__AACloudServicesClient_removeAAProxCardsInfoForDeviceWithAddress_completion___block_invoke;
  block[3] = &unk_25081D778;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

void __78__AACloudServicesClient_removeAAProxCardsInfoForDeviceWithAddress_completion___block_invoke(id *a1)
{
  uint64_t v2;
  void (**v3)(_QWORD);
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  v2 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __78__AACloudServicesClient_removeAAProxCardsInfoForDeviceWithAddress_completion___block_invoke_2;
  v14[3] = &unk_25081D3D0;
  v16 = &v17;
  v15 = a1[6];
  v3 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](v14);
  if (gLogCategory_AACloudServicesClient <= 30
    && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (a1[4])
  {
    objc_msgSend(a1[5], "_ensureXPCStarted");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      BTErrorF();
      v11 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v18[5];
      v18[5] = v11;
    }
    else
    {
      v5 = a1[6];
      v6 = (void *)*((_QWORD *)a1[5] + 4);
      v12[0] = v2;
      v12[1] = 3221225472;
      v12[2] = __78__AACloudServicesClient_removeAAProxCardsInfoForDeviceWithAddress_completion___block_invoke_3;
      v12[3] = &unk_25081CE08;
      v13 = v5;
      objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "uppercaseString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeAAProxCardsInfoForDeviceWithAddress:completion:", v8, a1[6]);

      v9 = v13;
    }

  }
  else
  {
    BTErrorF();
    v10 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v18[5];
    v18[5] = v10;
  }

  v3[2](v3);
  _Block_object_dispose(&v17, 8);

}

uint64_t __78__AACloudServicesClient_removeAAProxCardsInfoForDeviceWithAddress_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_AACloudServicesClient <= 90
      && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

uint64_t __78__AACloudServicesClient_removeAAProxCardsInfoForDeviceWithAddress_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_reportError:(id)a3
{
  void (**v4)(_QWORD, _QWORD);
  id activateCompletion;
  id v6;

  v6 = a3;
  if (gLogCategory_AACloudServicesClient <= 90
    && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x23B7FD6BC](self->_activateCompletion);
  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  if (v4)
    ((void (**)(_QWORD, id))v4)[2](v4, v6);

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
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
  objc_storeStrong((id *)&self->_testListenerEndpoint, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

@end
