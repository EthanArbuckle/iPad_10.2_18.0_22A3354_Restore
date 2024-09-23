@implementation AADeviceManager

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AADeviceManager)initWithCoder:(id)a3
{
  id v4;
  AADeviceManager *v5;
  AADeviceManager *v6;

  v4 = a3;
  v5 = -[AADeviceManager init](self, "init");
  if (v5)
  {
    if (NSDecodeSInt64RangedIfPresent())
      v5->_clientID = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_headGestureUpdateFlags = 0;
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t clientID;
  uint64_t headGestureUpdateFlags;
  id v7;

  v4 = a3;
  clientID = self->_clientID;
  v7 = v4;
  if ((_DWORD)clientID)
  {
    objc_msgSend(v4, "encodeInt64:forKey:", clientID, CFSTR("cid"));
    v4 = v7;
  }
  headGestureUpdateFlags = self->_headGestureUpdateFlags;
  if ((_DWORD)headGestureUpdateFlags)
  {
    objc_msgSend(v7, "encodeInt64:forKey:", headGestureUpdateFlags, CFSTR("cmcf"));
    v4 = v7;
  }

}

- (id)description
{
  NSAppendPrintF();
  return 0;
}

- (AADeviceManager)init
{
  AADeviceManager *v2;
  AADeviceManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AADeviceManager;
  v2 = -[AADeviceManager init](&v5, sel_init);
  if (v2)
  {
    v2->_clientID = AAXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v3 = v2;
  }

  return v2;
}

- (void)setHeadGestureUpdateFlags:(unsigned int)a3
{
  AADeviceManager *v4;
  NSObject *dispatchQueue;
  _QWORD v6[5];
  unsigned int v7;

  v4 = self;
  objc_sync_enter(v4);
  if (v4->_activateCalled)
  {
    dispatchQueue = v4->_dispatchQueue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __45__AADeviceManager_setHeadGestureUpdateFlags___block_invoke;
    v6[3] = &unk_25081CCF0;
    v6[4] = v4;
    v7 = a3;
    dispatch_async(dispatchQueue, v6);
  }
  else
  {
    v4->_headGestureUpdateFlags = a3;
  }
  objc_sync_exit(v4);

}

void __45__AADeviceManager_setHeadGestureUpdateFlags___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48) = *(_DWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x24BDAC760];
  v4 = *(void **)(v2 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__AADeviceManager_setHeadGestureUpdateFlags___block_invoke_2;
  v6[3] = &unk_25081CE58;
  v6[4] = v2;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceManagerUpdate:completion:", v3, 3221225472, __45__AADeviceManager_setHeadGestureUpdateFlags___block_invoke_3, &unk_25081CE58, *(_QWORD *)(a1 + 32));

}

uint64_t __45__AADeviceManager_setHeadGestureUpdateFlags___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reportError:", a2);
}

void __45__AADeviceManager_setHeadGestureUpdateFlags___block_invoke_3(uint64_t a1, void *a2)
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
    if (gLogCategory_AADeviceManager <= 90)
    {
      if (gLogCategory_AADeviceManager != -1 || (v5 = _LogCategory_Initialize(), v4 = v10, v5))
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
    if (gLogCategory_AADeviceManager <= 30
      && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
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
  v7[2] = __42__AADeviceManager_activateWithCompletion___block_invoke;
  v7[3] = &unk_25081CD40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __42__AADeviceManager_activateWithCompletion___block_invoke(uint64_t a1)
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
    if (gLogCategory_AADeviceManager <= 90
      && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
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

    objc_msgSend(*(id *)(a1 + 32), "_activate:", 0);
  }
}

- (void)_activate:(BOOL)a3
{
  void (**v5)(_QWORD, _QWORD);
  id activateCompletion;
  void *v7;
  NSXPCConnection *xpcCnx;
  uint64_t v9;
  void *v10;
  uint64_t clientID;
  id v12;
  _QWORD v13[5];
  BOOL v14;
  _QWORD v15[5];
  BOOL v16;

  if (!self->_invalidateCalled)
  {
    if (a3)
    {
      if (gLogCategory_AADeviceManager <= 30
        && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
      {
LABEL_11:
        clientID = self->_clientID;
        LogPrintF();
      }
    }
    else if (gLogCategory_AADeviceManager <= 30
           && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_11;
    }
    -[AADeviceManager _ensureXPCStarted](self, "_ensureXPCStarted", clientID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[AADeviceManager _reportError:](self, "_reportError:", v7);
    }
    else
    {
      xpcCnx = self->_xpcCnx;
      v9 = MEMORY[0x24BDAC760];
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __29__AADeviceManager__activate___block_invoke;
      v15[3] = &unk_25081CD68;
      v16 = a3;
      v15[4] = self;
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v9;
      v13[1] = 3221225472;
      v13[2] = __29__AADeviceManager__activate___block_invoke_2;
      v13[3] = &unk_25081CD68;
      v13[4] = self;
      v14 = a3;
      objc_msgSend(v10, "deviceManagerActivate:completion:", self, v13);

    }
    return;
  }
  NSErrorF();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_AADeviceManager <= 90
    && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x23B7FD6BC](self->_activateCompletion);
  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  if (v5)
    ((void (**)(_QWORD, id))v5)[2](v5, v12);

}

void __29__AADeviceManager__activate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  id v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (*(_BYTE *)(a1 + 40))
  {
    if (gLogCategory_AADeviceManager <= 30)
    {
      if (gLogCategory_AADeviceManager != -1 || (v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
        v6 = v3;
LABEL_8:
        LogPrintF();
        v3 = v7;
      }
    }
  }
  else if (gLogCategory_AADeviceManager <= 90)
  {
    if (gLogCategory_AADeviceManager != -1 || (v5 = _LogCategory_Initialize(), v3 = v7, v5))
    {
      v6 = v3;
      goto LABEL_8;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_reportError:", v3, v6);

}

void __29__AADeviceManager__activate___block_invoke_2(uint64_t a1, void *a2)
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
    if (gLogCategory_AADeviceManager <= 90)
    {
      if (gLogCategory_AADeviceManager != -1 || (v5 = _LogCategory_Initialize(), v4 = v10, v5))
      {
        v9 = v4;
        LogPrintF();
        v4 = v10;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_reportError:", v4, v9);
    goto LABEL_20;
  }
  if (*(_BYTE *)(a1 + 40))
  {
    if (gLogCategory_AADeviceManager > 30
      || gLogCategory_AADeviceManager == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_17;
    }
  }
  else if (gLogCategory_AADeviceManager > 30
         || gLogCategory_AADeviceManager == -1 && !_LogCategory_Initialize())
  {
    goto LABEL_17;
  }
  LogPrintF();
LABEL_17:
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x23B7FD6BC](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = 0;

  if (v6)
    v6[2](v6, 0);

LABEL_20:
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
    v12[2] = __36__AADeviceManager__ensureXPCStarted__block_invoke;
    v12[3] = &unk_25081CE30;
    v12[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v12);
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __36__AADeviceManager__ensureXPCStarted__block_invoke_2;
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

uint64_t __36__AADeviceManager__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __36__AADeviceManager__ensureXPCStarted__block_invoke_2(uint64_t a1)
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
  if (gLogCategory_AADeviceManager <= 50
    && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  BTErrorF();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AADeviceManager _reportError:](self, "_reportError:", v3);

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
  block[2] = __29__AADeviceManager_invalidate__block_invoke;
  block[3] = &unk_25081CE30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __29__AADeviceManager_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *);

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 32))
  {
    *(_BYTE *)(v1 + 32) = 1;
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 33)
      && gLogCategory_AADeviceManager <= 30
      && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
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
    v8 = (void (**)(id, void *))MEMORY[0x23B7FD6BC](*(_QWORD *)(v3 + 16));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = 0;

    if (v8)
    {
      BTErrorF();
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
  void (**v5)(_QWORD);
  id invalidationHandler;
  NSMutableDictionary *deviceDictionary;
  id deviceFoundHandler;
  id deviceLostHandler;
  id interruptionHandler;
  NSXPCConnection *xpcCnx;
  void (**v12)(id, void *);

  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_AADeviceManager <= 50
      && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_xpcCnx)
    {
      v12 = (void (**)(id, void *))MEMORY[0x23B7FD6BC](self->_activateCompletion, a2);
      activateCompletion = self->_activateCompletion;
      self->_activateCompletion = 0;

      if (v12)
      {
        BTErrorF();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v12[2](v12, v4);

      }
      v5 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](self->_invalidationHandler);
      invalidationHandler = self->_invalidationHandler;
      self->_invalidationHandler = 0;

      if (v5)
        v5[2](v5);
      -[NSMutableDictionary removeAllObjects](self->_deviceDictionary, "removeAllObjects");
      deviceDictionary = self->_deviceDictionary;
      self->_deviceDictionary = 0;

      deviceFoundHandler = self->_deviceFoundHandler;
      self->_deviceFoundHandler = 0;

      deviceLostHandler = self->_deviceLostHandler;
      self->_deviceLostHandler = 0;

      interruptionHandler = self->_interruptionHandler;
      self->_interruptionHandler = 0;

      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_AADeviceManager <= 10
        && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

    }
  }
}

- (void)_reset
{
  uint64_t v3;
  void (**v4)(_QWORD);
  NSMutableDictionary *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  if (!self->_resetOngoing)
  {
    self->_resetOngoing = 1;
    if (gLogCategory_AADeviceManager <= 50
      && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = MEMORY[0x24BDAC760];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __25__AADeviceManager__reset__block_invoke;
    v7[3] = &unk_25081CE30;
    v7[4] = self;
    v4 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](v7);
    v5 = self->_deviceDictionary;
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __25__AADeviceManager__reset__block_invoke_2;
    v6[3] = &unk_25081D1E0;
    v6[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v5, "enumerateKeysAndObjectsUsingBlock:", v6);
    -[AADeviceManager _activate:](self, "_activate:", 1);
    if (gLogCategory_AADeviceManager <= 10
      && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    v4[2](v4);
  }
}

uint64_t __25__AADeviceManager__reset__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 34) = 0;
  return result;
}

void __25__AADeviceManager__reset__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (gLogCategory_AADeviceManager <= 30
    && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
  {
    v6 = v5;
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "deviceManagerLostDevice:", v5, v6);

}

- (void)sendDeviceConfig:(id)a3 device:(id)a4 completion:(id)a5
{
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = (void (**)(id, void *))a5;
  objc_msgSend(a4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[AADeviceManager sendDeviceConfig:identifier:completion:](self, "sendDeviceConfig:identifier:completion:", v11, v9, v8);
  }
  else
  {
    NSErrorF();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v10);

  }
}

- (void)sendDeviceConfig:(id)a3 identifier:(id)a4 completion:(id)a5
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
  v15[2] = __58__AADeviceManager_sendDeviceConfig_identifier_completion___block_invoke;
  v15[3] = &unk_25081D208;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(dispatchQueue, v15);

}

void __58__AADeviceManager_sendDeviceConfig_identifier_completion___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[8])
  {
    objc_msgSend(v2, "_ensureXPCStarted");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      v4 = MEMORY[0x24BDAC760];
      v5 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __58__AADeviceManager_sendDeviceConfig_identifier_completion___block_invoke_2;
      v12[3] = &unk_25081CE08;
      v13 = *(id *)(a1 + 56);
      objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 48);
      v10[0] = v4;
      v10[1] = 3221225472;
      v10[2] = __58__AADeviceManager_sendDeviceConfig_identifier_completion___block_invoke_3;
      v10[3] = &unk_25081CE08;
      v11 = *(id *)(a1 + 56);
      objc_msgSend(v6, "deviceManagerSendDeviceConfig:identifier:completion:", v7, v8, v10);

    }
  }
  else
  {
    NSErrorF();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

void __58__AADeviceManager_sendDeviceConfig_identifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (gLogCategory_AADeviceManager <= 90)
  {
    if (gLogCategory_AADeviceManager != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
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

void __58__AADeviceManager_sendDeviceConfig_identifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    if (gLogCategory_AADeviceManager <= 90)
    {
      if (gLogCategory_AADeviceManager != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
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

- (void)_reportError:(id)a3
{
  void (**v4)(_QWORD, _QWORD);
  id activateCompletion;
  id v6;

  v6 = a3;
  if (gLogCategory_AADeviceManager <= 90
    && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x23B7FD6BC](self->_activateCompletion);
  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  if (v4)
    ((void (**)(_QWORD, id))v4)[2](v4, v6);

}

- (NSArray)discoveredDevices
{
  AADeviceManager *v2;
  NSMutableDictionary *deviceDictionary;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  deviceDictionary = v2->_deviceDictionary;
  if (deviceDictionary)
  {
    -[NSMutableDictionary allValues](deviceDictionary, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }
  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (void)deviceManagerFoundDevice:(id)a3
{
  AADeviceManager *v4;
  void *v5;
  NSMutableDictionary *deviceDictionary;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void (**deviceFoundHandler)(id, id);
  id v10;

  v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v10, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    deviceDictionary = v4->_deviceDictionary;
    if (!deviceDictionary)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v8 = v4->_deviceDictionary;
      v4->_deviceDictionary = v7;

      deviceDictionary = v4->_deviceDictionary;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](deviceDictionary, "setObject:forKeyedSubscript:", v10, v5);

    objc_sync_exit(v4);
    deviceFoundHandler = (void (**)(id, id))v4->_deviceFoundHandler;
    if (deviceFoundHandler)
    {
      deviceFoundHandler[2](deviceFoundHandler, v10);
    }
    else if (gLogCategory_AADeviceManager <= 10
           && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    objc_sync_exit(v4);

  }
}

- (void)deviceManagerLostDevice:(id)a3
{
  AADeviceManager *v4;
  void *v5;
  void (**deviceLostHandler)(id, id);
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v7, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_deviceDictionary, "setObject:forKeyedSubscript:", 0, v5);

    objc_sync_exit(v4);
    if (gLogCategory_AADeviceManager <= 30
      && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    deviceLostHandler = (void (**)(id, id))v4->_deviceLostHandler;
    if (deviceLostHandler)
      deviceLostHandler[2](deviceLostHandler, v7);
  }
  else
  {
    objc_sync_exit(v4);

  }
}

- (void)aaServicesRequireReset
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_AADeviceManager <= 30
    && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[AADeviceManager _reset](self, "_reset");
}

- (void)deviceHeadGestureDetected:(id)a3
{
  void (**headGestureUpdatedHandler)(id, id);
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  headGestureUpdatedHandler = (void (**)(id, id))self->_headGestureUpdatedHandler;
  if (headGestureUpdatedHandler)
  {
    headGestureUpdatedHandler[2](headGestureUpdatedHandler, v5);
  }
  else if (gLogCategory_AADeviceManager <= 10
         && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)headGestureUpdatedHandler
{
  return self->_headGestureUpdatedHandler;
}

- (void)setHeadGestureUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (unsigned)headGestureUpdateFlags
{
  return self->_headGestureUpdateFlags;
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
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
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_headGestureUpdatedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_deviceDictionary, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

@end
