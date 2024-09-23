@implementation BTCloudServicesClient

- (BTCloudServicesClient)init
{
  BTCloudServicesClient *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *dispatchQueue;
  BTCloudServicesClient *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BTCloudServicesClient;
  v2 = -[BTCloudServicesClient init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("BTCloudServicesClient", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = v2;
  }

  return v2;
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
      v5 = (NSXPCConnection *)objc_msgSend(v4, "initWithMachServiceName:options:", CFSTR("com.apple.BluetoothCloudServices"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v5;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256448CF0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v7);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    v8 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __42__BTCloudServicesClient__ensureXPCStarted__block_invoke;
    v12[3] = &unk_25081CE30;
    v12[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v12);
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __42__BTCloudServicesClient__ensureXPCStarted__block_invoke_2;
    v11[3] = &unk_25081CE30;
    v11[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v11);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256448FF0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v9);
    -[NSXPCConnection resume](self->_xpcCnx, "resume");

  }
  return 0;
}

uint64_t __42__BTCloudServicesClient__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __42__BTCloudServicesClient__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_interrupted
{
  void (**v3)(void);
  void (**v4)(void);

  if (gLogCategory_BTRootCloudServicesClient <= 50
    && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
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
  block[2] = __35__BTCloudServicesClient_invalidate__block_invoke;
  block[3] = &unk_25081CE30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__BTCloudServicesClient_invalidate__block_invoke(uint64_t result)
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
      && gLogCategory_BTRootCloudServicesClient <= 30
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
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
  uint64_t v3;
  void *v4;
  id interruptionHandler;
  id invalidationHandler;
  NSXPCConnection *xpcCnx;

  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_BTRootCloudServicesClient <= 50
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
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
      if (gLogCategory_BTRootCloudServicesClient <= 10
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

- (void)createDeviceRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BTCloudServicesClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__BTCloudServicesClient_createDeviceRecord_completion___block_invoke;
  block[3] = &unk_25081D3A8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __55__BTCloudServicesClient_createDeviceRecord_completion___block_invoke(id *a1)
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
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  v2 = a1[4];
  v3 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __55__BTCloudServicesClient_createDeviceRecord_completion___block_invoke_72;
  v14[3] = &unk_25081D380;
  v17 = &v18;
  v15 = a1[4];
  v16 = a1[6];
  v4 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](v14);
  if (v2)
  {
    objc_msgSend(a1[5], "_ensureXPCStarted");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      BTErrorF();
      v11 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v19[5];
      v19[5] = v11;
    }
    else
    {
      if (gLogCategory_BTRootCloudServicesClient <= 30
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v6 = a1[6];
      v7 = (void *)*((_QWORD *)a1[5] + 2);
      v12[0] = v3;
      v12[1] = 3221225472;
      v12[2] = __55__BTCloudServicesClient_createDeviceRecord_completion___block_invoke_3;
      v12[3] = &unk_25081CE08;
      v13 = v6;
      objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "createDeviceRecord:completion:", a1[4], a1[6]);

      v9 = v13;
    }

  }
  else
  {
    BTErrorF();
    v10 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v19[5];
    v19[5] = v10;
  }

  v4[2](v4);
  _Block_object_dispose(&v18, 8);

}

uint64_t __55__BTCloudServicesClient_createDeviceRecord_completion___block_invoke_72(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __55__BTCloudServicesClient_createDeviceRecord_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)modifyDeviceRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BTCloudServicesClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__BTCloudServicesClient_modifyDeviceRecord_completion___block_invoke;
  block[3] = &unk_25081D3A8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __55__BTCloudServicesClient_modifyDeviceRecord_completion___block_invoke(id *a1)
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
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  v2 = a1[4];
  v3 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __55__BTCloudServicesClient_modifyDeviceRecord_completion___block_invoke_2;
  v14[3] = &unk_25081D380;
  v17 = &v18;
  v15 = a1[4];
  v16 = a1[6];
  v4 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](v14);
  if (v2)
  {
    objc_msgSend(a1[5], "_ensureXPCStarted");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      BTErrorF();
      v11 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v19[5];
      v19[5] = v11;
    }
    else
    {
      if (gLogCategory_BTRootCloudServicesClient <= 30
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v6 = a1[6];
      v7 = (void *)*((_QWORD *)a1[5] + 2);
      v12[0] = v3;
      v12[1] = 3221225472;
      v12[2] = __55__BTCloudServicesClient_modifyDeviceRecord_completion___block_invoke_3;
      v12[3] = &unk_25081CE08;
      v13 = v6;
      objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "modifyDeviceRecord:completion:", a1[4], a1[6]);

      v9 = v13;
    }

  }
  else
  {
    BTErrorF();
    v10 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v19[5];
    v19[5] = v10;
  }

  v4[2](v4);
  _Block_object_dispose(&v18, 8);

}

uint64_t __55__BTCloudServicesClient_modifyDeviceRecord_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __55__BTCloudServicesClient_modifyDeviceRecord_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteDeviceRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BTCloudServicesClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__BTCloudServicesClient_deleteDeviceRecord_completion___block_invoke;
  block[3] = &unk_25081D3A8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __55__BTCloudServicesClient_deleteDeviceRecord_completion___block_invoke(id *a1)
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
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v2 = a1[4];
  v3 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __55__BTCloudServicesClient_deleteDeviceRecord_completion___block_invoke_2;
  v14[3] = &unk_25081D380;
  v16 = &v17;
  v14[4] = v2;
  v15 = a1[6];
  v4 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](v14);
  if (a1[4])
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
      if (gLogCategory_BTRootCloudServicesClient <= 30
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v6 = a1[6];
      v7 = (void *)*((_QWORD *)a1[5] + 2);
      v12[0] = v3;
      v12[1] = 3221225472;
      v12[2] = __55__BTCloudServicesClient_deleteDeviceRecord_completion___block_invoke_3;
      v12[3] = &unk_25081CE08;
      v13 = v6;
      objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deleteDeviceRecord:completion:", a1[4], a1[6]);

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

uint64_t __55__BTCloudServicesClient_deleteDeviceRecord_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __55__BTCloudServicesClient_deleteDeviceRecord_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deviceRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BTCloudServicesClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__BTCloudServicesClient_deviceRecord_completion___block_invoke;
  block[3] = &unk_25081D3A8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __49__BTCloudServicesClient_deviceRecord_completion___block_invoke(id *a1)
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
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v2 = a1[4];
  v3 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __49__BTCloudServicesClient_deviceRecord_completion___block_invoke_2;
  v14[3] = &unk_25081D380;
  v16 = &v17;
  v14[4] = v2;
  v15 = a1[6];
  v4 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](v14);
  if (a1[4])
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
      if (gLogCategory_BTRootCloudServicesClient <= 30
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v6 = a1[6];
      v7 = (void *)*((_QWORD *)a1[5] + 2);
      v12[0] = v3;
      v12[1] = 3221225472;
      v12[2] = __49__BTCloudServicesClient_deviceRecord_completion___block_invoke_3;
      v12[3] = &unk_25081CE08;
      v13 = v6;
      objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fetchDeviceRecord:completion:", a1[4], a1[6]);

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

uint64_t __49__BTCloudServicesClient_deviceRecord_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __49__BTCloudServicesClient_deviceRecord_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deviceRecordsWithCompletion:(id)a3
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
  v7[2] = __53__BTCloudServicesClient_deviceRecordsWithCompletion___block_invoke;
  v7[3] = &unk_25081CD90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __53__BTCloudServicesClient_deviceRecordsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  v2 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __53__BTCloudServicesClient_deviceRecordsWithCompletion___block_invoke_2;
  v12[3] = &unk_25081D3D0;
  v14 = &v15;
  v13 = *(id *)(a1 + 40);
  v3 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](v12);
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    BTErrorF();
    v9 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v16[5];
    v16[5] = v9;
  }
  else
  {
    v5 = *(void **)(a1 + 40);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v10[0] = v2;
    v10[1] = 3221225472;
    v10[2] = __53__BTCloudServicesClient_deviceRecordsWithCompletion___block_invoke_3;
    v10[3] = &unk_25081CE08;
    v11 = v5;
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchDeviceRecordsWithCompletion:", *(_QWORD *)(a1 + 40));

    v8 = v11;
  }

  v3[2](v3);
  _Block_object_dispose(&v15, 8);

}

uint64_t __53__BTCloudServicesClient_deviceRecordsWithCompletion___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

uint64_t __53__BTCloudServicesClient_deviceRecordsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)createDeviceSupportInformationRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BTCloudServicesClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__BTCloudServicesClient_createDeviceSupportInformationRecord_completion___block_invoke;
  block[3] = &unk_25081D3A8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __73__BTCloudServicesClient_createDeviceSupportInformationRecord_completion___block_invoke(id *a1)
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
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  v2 = a1[4];
  v3 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __73__BTCloudServicesClient_createDeviceSupportInformationRecord_completion___block_invoke_2;
  v14[3] = &unk_25081D380;
  v17 = &v18;
  v15 = a1[4];
  v16 = a1[6];
  v4 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](v14);
  if (v2)
  {
    objc_msgSend(a1[5], "_ensureXPCStarted");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      BTErrorF();
      v11 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v19[5];
      v19[5] = v11;
    }
    else
    {
      if (gLogCategory_BTRootCloudServicesClient <= 30
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v6 = a1[6];
      v7 = (void *)*((_QWORD *)a1[5] + 2);
      v12[0] = v3;
      v12[1] = 3221225472;
      v12[2] = __73__BTCloudServicesClient_createDeviceSupportInformationRecord_completion___block_invoke_3;
      v12[3] = &unk_25081CE08;
      v13 = v6;
      objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "createDeviceSupportInformationRecord:completion:", a1[4], a1[6]);

      v9 = v13;
    }

  }
  else
  {
    BTErrorF();
    v10 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v19[5];
    v19[5] = v10;
  }

  v4[2](v4);
  _Block_object_dispose(&v18, 8);

}

uint64_t __73__BTCloudServicesClient_createDeviceSupportInformationRecord_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __73__BTCloudServicesClient_createDeviceSupportInformationRecord_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)modifyDeviceSupportInformationRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BTCloudServicesClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__BTCloudServicesClient_modifyDeviceSupportInformationRecord_completion___block_invoke;
  block[3] = &unk_25081D3A8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __73__BTCloudServicesClient_modifyDeviceSupportInformationRecord_completion___block_invoke(id *a1)
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
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  v2 = a1[4];
  v3 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __73__BTCloudServicesClient_modifyDeviceSupportInformationRecord_completion___block_invoke_2;
  v14[3] = &unk_25081D380;
  v17 = &v18;
  v15 = a1[4];
  v16 = a1[6];
  v4 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](v14);
  if (v2)
  {
    objc_msgSend(a1[5], "_ensureXPCStarted");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      BTErrorF();
      v11 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v19[5];
      v19[5] = v11;
    }
    else
    {
      if (gLogCategory_BTRootCloudServicesClient <= 30
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v6 = a1[6];
      v7 = (void *)*((_QWORD *)a1[5] + 2);
      v12[0] = v3;
      v12[1] = 3221225472;
      v12[2] = __73__BTCloudServicesClient_modifyDeviceSupportInformationRecord_completion___block_invoke_3;
      v12[3] = &unk_25081CE08;
      v13 = v6;
      objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "modifyDeviceSupportInformationRecord:completion:", a1[4], a1[6]);

      v9 = v13;
    }

  }
  else
  {
    BTErrorF();
    v10 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v19[5];
    v19[5] = v10;
  }

  v4[2](v4);
  _Block_object_dispose(&v18, 8);

}

uint64_t __73__BTCloudServicesClient_modifyDeviceSupportInformationRecord_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __73__BTCloudServicesClient_modifyDeviceSupportInformationRecord_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteDeviceSupportInformationRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BTCloudServicesClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__BTCloudServicesClient_deleteDeviceSupportInformationRecord_completion___block_invoke;
  block[3] = &unk_25081D3A8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __73__BTCloudServicesClient_deleteDeviceSupportInformationRecord_completion___block_invoke(id *a1)
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
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v2 = a1[4];
  v3 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __73__BTCloudServicesClient_deleteDeviceSupportInformationRecord_completion___block_invoke_2;
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
      if (gLogCategory_BTRootCloudServicesClient <= 30
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v6 = a1[6];
      v7 = (void *)*((_QWORD *)a1[5] + 2);
      v12[0] = v3;
      v12[1] = 3221225472;
      v12[2] = __73__BTCloudServicesClient_deleteDeviceSupportInformationRecord_completion___block_invoke_3;
      v12[3] = &unk_25081CE08;
      v13 = v6;
      objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deleteDeviceSupportInformationRecord:completion:", a1[4], a1[6]);

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

uint64_t __73__BTCloudServicesClient_deleteDeviceSupportInformationRecord_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __73__BTCloudServicesClient_deleteDeviceSupportInformationRecord_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deviceSupportInformationRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BTCloudServicesClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__BTCloudServicesClient_deviceSupportInformationRecord_completion___block_invoke;
  block[3] = &unk_25081D3A8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __67__BTCloudServicesClient_deviceSupportInformationRecord_completion___block_invoke(id *a1)
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
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v2 = a1[4];
  v3 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __67__BTCloudServicesClient_deviceSupportInformationRecord_completion___block_invoke_2;
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
      if (gLogCategory_BTRootCloudServicesClient <= 30
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v6 = a1[6];
      v7 = (void *)*((_QWORD *)a1[5] + 2);
      v12[0] = v3;
      v12[1] = 3221225472;
      v12[2] = __67__BTCloudServicesClient_deviceSupportInformationRecord_completion___block_invoke_3;
      v12[3] = &unk_25081CE08;
      v13 = v6;
      objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fetchBTCloudDeviceSupportInformation:completion:", a1[4], a1[6]);

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

uint64_t __67__BTCloudServicesClient_deviceSupportInformationRecord_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __67__BTCloudServicesClient_deviceSupportInformationRecord_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deviceSupportInformationRecordsWithCompletion:(id)a3
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
  v7[2] = __71__BTCloudServicesClient_deviceSupportInformationRecordsWithCompletion___block_invoke;
  v7[3] = &unk_25081CD90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __71__BTCloudServicesClient_deviceSupportInformationRecordsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  v2 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __71__BTCloudServicesClient_deviceSupportInformationRecordsWithCompletion___block_invoke_2;
  v12[3] = &unk_25081D3D0;
  v14 = &v15;
  v13 = *(id *)(a1 + 40);
  v3 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](v12);
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    BTErrorF();
    v9 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v16[5];
    v16[5] = v9;
  }
  else
  {
    v5 = *(void **)(a1 + 40);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v10[0] = v2;
    v10[1] = 3221225472;
    v10[2] = __71__BTCloudServicesClient_deviceSupportInformationRecordsWithCompletion___block_invoke_3;
    v10[3] = &unk_25081CE08;
    v11 = v5;
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchAllBTCloudDeviceSupportInformationWithCompletion:", *(_QWORD *)(a1 + 40));

    v8 = v11;
  }

  v3[2](v3);
  _Block_object_dispose(&v15, 8);

}

uint64_t __71__BTCloudServicesClient_deviceSupportInformationRecordsWithCompletion___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

uint64_t __71__BTCloudServicesClient_deviceSupportInformationRecordsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)createMagicSettingsRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BTCloudServicesClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__BTCloudServicesClient_createMagicSettingsRecord_completion___block_invoke;
  block[3] = &unk_25081D3A8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __62__BTCloudServicesClient_createMagicSettingsRecord_completion___block_invoke(id *a1)
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
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v2 = a1[4];
  v3 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __62__BTCloudServicesClient_createMagicSettingsRecord_completion___block_invoke_2;
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
      if (gLogCategory_BTRootCloudServicesClient <= 30
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v6 = a1[6];
      v7 = (void *)*((_QWORD *)a1[5] + 2);
      v12[0] = v3;
      v12[1] = 3221225472;
      v12[2] = __62__BTCloudServicesClient_createMagicSettingsRecord_completion___block_invoke_3;
      v12[3] = &unk_25081CE08;
      v13 = v6;
      objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "createMagicSettingsRecord:completion:", a1[4], a1[6]);

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

uint64_t __62__BTCloudServicesClient_createMagicSettingsRecord_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __62__BTCloudServicesClient_createMagicSettingsRecord_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)modifyMagicSettingsRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BTCloudServicesClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__BTCloudServicesClient_modifyMagicSettingsRecord_completion___block_invoke;
  block[3] = &unk_25081D3A8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __62__BTCloudServicesClient_modifyMagicSettingsRecord_completion___block_invoke(id *a1)
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
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v2 = a1[4];
  v3 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __62__BTCloudServicesClient_modifyMagicSettingsRecord_completion___block_invoke_2;
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
      if (gLogCategory_BTRootCloudServicesClient <= 30
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v6 = a1[6];
      v7 = (void *)*((_QWORD *)a1[5] + 2);
      v12[0] = v3;
      v12[1] = 3221225472;
      v12[2] = __62__BTCloudServicesClient_modifyMagicSettingsRecord_completion___block_invoke_3;
      v12[3] = &unk_25081CE08;
      v13 = v6;
      objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "modifyMagicSettingsRecord:completion:", a1[4], a1[6]);

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

uint64_t __62__BTCloudServicesClient_modifyMagicSettingsRecord_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __62__BTCloudServicesClient_modifyMagicSettingsRecord_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteMagicSettingsRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BTCloudServicesClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__BTCloudServicesClient_deleteMagicSettingsRecord_completion___block_invoke;
  block[3] = &unk_25081D3A8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __62__BTCloudServicesClient_deleteMagicSettingsRecord_completion___block_invoke(id *a1)
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
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v2 = a1[4];
  v3 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __62__BTCloudServicesClient_deleteMagicSettingsRecord_completion___block_invoke_2;
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
      if (gLogCategory_BTRootCloudServicesClient <= 30
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v6 = a1[6];
      v7 = (void *)*((_QWORD *)a1[5] + 2);
      v12[0] = v3;
      v12[1] = 3221225472;
      v12[2] = __62__BTCloudServicesClient_deleteMagicSettingsRecord_completion___block_invoke_3;
      v12[3] = &unk_25081CE08;
      v13 = v6;
      objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deleteMagicSettingsRecord:completion:", a1[4], a1[6]);

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

uint64_t __62__BTCloudServicesClient_deleteMagicSettingsRecord_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __62__BTCloudServicesClient_deleteMagicSettingsRecord_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)magicSettingsRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BTCloudServicesClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__BTCloudServicesClient_magicSettingsRecord_completion___block_invoke;
  block[3] = &unk_25081D3A8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __56__BTCloudServicesClient_magicSettingsRecord_completion___block_invoke(id *a1)
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
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v2 = a1[4];
  v3 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __56__BTCloudServicesClient_magicSettingsRecord_completion___block_invoke_2;
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
      if (gLogCategory_BTRootCloudServicesClient <= 30
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v6 = a1[6];
      v7 = (void *)*((_QWORD *)a1[5] + 2);
      v12[0] = v3;
      v12[1] = 3221225472;
      v12[2] = __56__BTCloudServicesClient_magicSettingsRecord_completion___block_invoke_3;
      v12[3] = &unk_25081CE08;
      v13 = v6;
      objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fetchMagicSettingsRecord:completion:", a1[4], a1[6]);

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

uint64_t __56__BTCloudServicesClient_magicSettingsRecord_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __56__BTCloudServicesClient_magicSettingsRecord_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)magicSettingsRecordsWithCompletion:(id)a3
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
  v7[2] = __60__BTCloudServicesClient_magicSettingsRecordsWithCompletion___block_invoke;
  v7[3] = &unk_25081CD40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __60__BTCloudServicesClient_magicSettingsRecordsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __60__BTCloudServicesClient_magicSettingsRecordsWithCompletion___block_invoke_2;
    v6[3] = &unk_25081CE08;
    v7 = v3;
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchAllMagicSettingsRecordsWithCompletion:", *(_QWORD *)(a1 + 40));

  }
}

uint64_t __60__BTCloudServicesClient_magicSettingsRecordsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)accountInfoWithCompletion:(id)a3
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
  v7[2] = __51__BTCloudServicesClient_accountInfoWithCompletion___block_invoke;
  v7[3] = &unk_25081CD90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __51__BTCloudServicesClient_accountInfoWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  v2 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __51__BTCloudServicesClient_accountInfoWithCompletion___block_invoke_2;
  v12[3] = &unk_25081D3D0;
  v14 = &v15;
  v13 = *(id *)(a1 + 40);
  v3 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](v12);
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    BTErrorF();
    v9 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v16[5];
    v16[5] = v9;
  }
  else
  {
    v5 = *(void **)(a1 + 40);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v10[0] = v2;
    v10[1] = 3221225472;
    v10[2] = __51__BTCloudServicesClient_accountInfoWithCompletion___block_invoke_3;
    v10[3] = &unk_25081CE08;
    v11 = v5;
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchCloudAccountInfoUpdatedWithCompletion:", *(_QWORD *)(a1 + 40));

    v8 = v11;
  }

  v3[2](v3);
  _Block_object_dispose(&v15, 8);

}

uint64_t __51__BTCloudServicesClient_accountInfoWithCompletion___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

uint64_t __51__BTCloudServicesClient_accountInfoWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cloudPairingIdentifierForPeripheral:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BTCloudServicesClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__BTCloudServicesClient_cloudPairingIdentifierForPeripheral_completion___block_invoke;
  block[3] = &unk_25081D3A8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __72__BTCloudServicesClient_cloudPairingIdentifierForPeripheral_completion___block_invoke(id *a1)
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
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  v2 = a1[4];
  v3 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __72__BTCloudServicesClient_cloudPairingIdentifierForPeripheral_completion___block_invoke_2;
  v15[3] = &unk_25081D380;
  v17 = &v18;
  v15[4] = v2;
  v16 = a1[6];
  v4 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](v15);
  if (v2)
  {
    if (gLogCategory_BTRootCloudServicesClient <= 30
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      v12 = v2;
      LogPrintF();
    }
    objc_msgSend(a1[5], "_ensureXPCStarted", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      BTErrorF();
      v11 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v19[5];
      v19[5] = v11;
    }
    else
    {
      v6 = a1[6];
      v7 = (void *)*((_QWORD *)a1[5] + 2);
      v13[0] = v3;
      v13[1] = 3221225472;
      v13[2] = __72__BTCloudServicesClient_cloudPairingIdentifierForPeripheral_completion___block_invoke_3;
      v13[3] = &unk_25081CE08;
      v14 = v6;
      objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fetchCloudPairingIdentifierForPeripheral:completion:", a1[4], a1[6]);

      v9 = v14;
    }

  }
  else
  {
    BTErrorF();
    v10 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v19[5];
    v19[5] = v10;
  }

  v4[2](v4);
  _Block_object_dispose(&v18, 8);

}

uint64_t __72__BTCloudServicesClient_cloudPairingIdentifierForPeripheral_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __72__BTCloudServicesClient_cloudPairingIdentifierForPeripheral_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)forceCloudPairingForIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BTCloudServicesClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__BTCloudServicesClient_forceCloudPairingForIdentifiers_completion___block_invoke;
  block[3] = &unk_25081D3A8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __68__BTCloudServicesClient_forceCloudPairingForIdentifiers_completion___block_invoke(id *a1)
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
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  v2 = a1[4];
  v3 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __68__BTCloudServicesClient_forceCloudPairingForIdentifiers_completion___block_invoke_2;
  v15[3] = &unk_25081D380;
  v17 = &v18;
  v15[4] = v2;
  v16 = a1[6];
  v4 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](v15);
  if (v2)
  {
    if (gLogCategory_BTRootCloudServicesClient <= 30
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      v12 = v2;
      LogPrintF();
    }
    objc_msgSend(a1[5], "_ensureXPCStarted", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      BTErrorF();
      v11 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v19[5];
      v19[5] = v11;
    }
    else
    {
      v6 = a1[6];
      v7 = (void *)*((_QWORD *)a1[5] + 2);
      v13[0] = v3;
      v13[1] = 3221225472;
      v13[2] = __68__BTCloudServicesClient_forceCloudPairingForIdentifiers_completion___block_invoke_3;
      v13[3] = &unk_25081CE08;
      v14 = v6;
      objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "forceCloudPairingForIdentifiers:completion:", v2, a1[6]);

      v9 = v14;
    }

  }
  else
  {
    BTErrorF();
    v10 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v19[5];
    v19[5] = v10;
  }

  v4[2](v4);
  _Block_object_dispose(&v18, 8);

}

uint64_t __68__BTCloudServicesClient_forceCloudPairingForIdentifiers_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __68__BTCloudServicesClient_forceCloudPairingForIdentifiers_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)createSoundProfileRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BTCloudServicesClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__BTCloudServicesClient_createSoundProfileRecord_completion___block_invoke;
  block[3] = &unk_25081D3A8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __61__BTCloudServicesClient_createSoundProfileRecord_completion___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v13[6];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  v2 = a1[4];
  v3 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __61__BTCloudServicesClient_createSoundProfileRecord_completion___block_invoke_2;
  v17[3] = &unk_25081D380;
  v20 = &v21;
  v18 = a1[4];
  v19 = a1[6];
  v4 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](v17);
  if (v2
    && (objc_msgSend(v2, "soundProfileData"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    if (gLogCategory_BTRootCloudServicesClient <= 30
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      v12 = v2;
      LogPrintF();
    }
    objc_msgSend(a1[5], "_ensureXPCStarted", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      BTErrorF();
      v11 = objc_claimAutoreleasedReturnValue();
      v7 = (id)v22[5];
      v22[5] = v11;
    }
    else
    {
      v7 = *((id *)a1[5] + 2);
      v15[0] = v3;
      v15[1] = 3221225472;
      v15[2] = __61__BTCloudServicesClient_createSoundProfileRecord_completion___block_invoke_3;
      v15[3] = &unk_25081CE08;
      v16 = a1[6];
      objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v3;
      v13[1] = 3221225472;
      v13[2] = __61__BTCloudServicesClient_createSoundProfileRecord_completion___block_invoke_4;
      v13[3] = &unk_25081D3F8;
      v9 = a1[6];
      v13[5] = v7;
      v14 = v9;
      v13[4] = v2;
      objc_msgSend(v8, "startSoundProfileRecordFileHandleSessionWithCompletion:", v13);

    }
  }
  else
  {
    BTErrorF();
    v10 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v22[5];
    v22[5] = v10;
  }

  v4[2](v4);
  _Block_object_dispose(&v21, 8);

}

uint64_t __61__BTCloudServicesClient_createSoundProfileRecord_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __61__BTCloudServicesClient_createSoundProfileRecord_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__BTCloudServicesClient_createSoundProfileRecord_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;

  v5 = a2;
  v6 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__0;
  v20[4] = __Block_byref_object_dispose__0;
  v21 = 0;
  v7 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __61__BTCloudServicesClient_createSoundProfileRecord_completion___block_invoke_5;
  v17[3] = &unk_25081D3D0;
  v19 = v20;
  v18 = *(id *)(a1 + 48);
  v8 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](v17);
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v9 = v5;
    if (v9)
    {
      if (gLogCategory_BTRootCloudServicesClient <= 40
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      objc_msgSend(*(id *)(a1 + 32), "soundProfileData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "writeData:", v10);

      if (gLogCategory_BTRootCloudServicesClient <= 40
        && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v15[0] = v7;
      v15[1] = 3221225472;
      v15[2] = __61__BTCloudServicesClient_createSoundProfileRecord_completion___block_invoke_6;
      v15[3] = &unk_25081CE08;
      v11 = *(void **)(a1 + 40);
      v16 = *(id *)(a1 + 48);
      objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "finishSoundProfileRecordSessionHandle:completion:", v9, *(_QWORD *)(a1 + 48));

      v13 = v16;
    }
    else
    {
      v14 = *(_QWORD *)(a1 + 48);
      BTErrorF();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v13);
    }

  }
  v8[2](v8);

  _Block_object_dispose(v20, 8);
}

uint64_t __61__BTCloudServicesClient_createSoundProfileRecord_completion___block_invoke_5(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

uint64_t __61__BTCloudServicesClient_createSoundProfileRecord_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchSoundProfileRecordWithCompletion:(id)a3
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
  v7[2] = __63__BTCloudServicesClient_fetchSoundProfileRecordWithCompletion___block_invoke;
  v7[3] = &unk_25081CD90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __63__BTCloudServicesClient_fetchSoundProfileRecordWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  v2 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__BTCloudServicesClient_fetchSoundProfileRecordWithCompletion___block_invoke_2;
  v12[3] = &unk_25081D3D0;
  v14 = &v15;
  v13 = *(id *)(a1 + 40);
  v3 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](v12);
  if (gLogCategory_BTRootCloudServicesClient <= 30
    && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    BTErrorF();
    v9 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v16[5];
    v16[5] = v9;
  }
  else
  {
    v5 = *(void **)(a1 + 40);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v10[0] = v2;
    v10[1] = 3221225472;
    v10[2] = __63__BTCloudServicesClient_fetchSoundProfileRecordWithCompletion___block_invoke_3;
    v10[3] = &unk_25081CE08;
    v11 = v5;
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchSoundProfileRecordWithCompletion:", *(_QWORD *)(a1 + 40));

    v8 = v11;
  }

  v3[2](v3);
  _Block_object_dispose(&v15, 8);

}

uint64_t __63__BTCloudServicesClient_fetchSoundProfileRecordWithCompletion___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

uint64_t __63__BTCloudServicesClient_fetchSoundProfileRecordWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)modifySoundProfileRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BTCloudServicesClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__BTCloudServicesClient_modifySoundProfileRecord_completion___block_invoke;
  block[3] = &unk_25081D3A8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __61__BTCloudServicesClient_modifySoundProfileRecord_completion___block_invoke(id *a1)
{
  id v2;
  void (**v3)(_QWORD);
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  v2 = a1[4];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__BTCloudServicesClient_modifySoundProfileRecord_completion___block_invoke_2;
  v10[3] = &unk_25081D3D0;
  v12 = &v13;
  v11 = a1[6];
  v3 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](v10);
  if (v2
    && (objc_msgSend(v2, "soundProfileData"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    if (gLogCategory_BTRootCloudServicesClient <= 30
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      v9 = v2;
      LogPrintF();
    }
    objc_msgSend(a1[5], "_ensureXPCStarted", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      BTErrorF();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v14[5];
      v14[5] = v7;

    }
    else
    {
      objc_msgSend(a1[5], "createSoundProfileRecord:completion:", a1[4], a1[6]);
    }
  }
  else
  {
    BTErrorF();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v14[5];
    v14[5] = v5;
  }

  v3[2](v3);
  _Block_object_dispose(&v13, 8);

}

uint64_t __61__BTCloudServicesClient_modifySoundProfileRecord_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

- (void)deleteSoundProfileRecordWithCompletion:(id)a3
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
  v7[2] = __64__BTCloudServicesClient_deleteSoundProfileRecordWithCompletion___block_invoke;
  v7[3] = &unk_25081CD90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __64__BTCloudServicesClient_deleteSoundProfileRecordWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  v2 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __64__BTCloudServicesClient_deleteSoundProfileRecordWithCompletion___block_invoke_2;
  v12[3] = &unk_25081D3D0;
  v14 = &v15;
  v13 = *(id *)(a1 + 40);
  v3 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](v12);
  if (gLogCategory_BTRootCloudServicesClient <= 30
    && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    BTErrorF();
    v9 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v16[5];
    v16[5] = v9;
  }
  else
  {
    v5 = *(void **)(a1 + 40);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v10[0] = v2;
    v10[1] = 3221225472;
    v10[2] = __64__BTCloudServicesClient_deleteSoundProfileRecordWithCompletion___block_invoke_3;
    v10[3] = &unk_25081CE08;
    v11 = v5;
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deleteSoundProfileRecordWithCompletion:", *(_QWORD *)(a1 + 40));

    v8 = v11;
  }

  v3[2](v3);
  _Block_object_dispose(&v15, 8);

}

uint64_t __64__BTCloudServicesClient_deleteSoundProfileRecordWithCompletion___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_BTRootCloudServicesClient <= 90
      && (gLogCategory_BTRootCloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

uint64_t __64__BTCloudServicesClient_deleteSoundProfileRecordWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
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
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end
