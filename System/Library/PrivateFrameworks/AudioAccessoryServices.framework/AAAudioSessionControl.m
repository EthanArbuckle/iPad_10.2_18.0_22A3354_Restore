@implementation AAAudioSessionControl

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AAAudioSessionControl)initWithCoder:(id)a3
{
  id v4;
  AAAudioSessionControl *v5;
  AAAudioSessionControl *v6;

  v4 = a3;
  v5 = -[AAAudioSessionControl init](self, "init");
  if (v5)
  {
    if (NSDecodeSInt64RangedIfPresent())
      v5->_clientID = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_conversationDetectSignal = 0;
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t clientID;
  uint64_t conversationDetectSignal;
  id v7;

  v4 = a3;
  clientID = self->_clientID;
  v7 = v4;
  if ((_DWORD)clientID)
  {
    objc_msgSend(v4, "encodeInt64:forKey:", clientID, CFSTR("cid"));
    v4 = v7;
  }
  conversationDetectSignal = self->_conversationDetectSignal;
  if ((_DWORD)conversationDetectSignal)
  {
    objc_msgSend(v7, "encodeInteger:forKey:", conversationDetectSignal, CFSTR("cds"));
    v4 = v7;
  }

}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  void *v7;

  NSAppendPrintF();
  v3 = 0;
  v4 = v3;
  if (self->_direct)
  {
    v7 = v3;
    NSAppendPrintF_safe();
    v5 = v7;

    v4 = v5;
  }
  return v4;
}

- (AAAudioSessionControl)init
{
  AAAudioSessionControl *v2;
  AAAudioSessionControl *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AAAudioSessionControl;
  v2 = -[AAAudioSessionControl init](&v5, sel_init);
  if (v2)
  {
    v2->_clientID = AAXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v3 = v2;
  }

  return v2;
}

- (void)setConversationDetectSignal:(int)a3
{
  AAAudioSessionControl *v4;
  NSObject *dispatchQueue;
  _QWORD v6[5];
  int v7;

  v4 = self;
  objc_sync_enter(v4);
  if (v4->_activateCalled)
  {
    dispatchQueue = v4->_dispatchQueue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __53__AAAudioSessionControl_setConversationDetectSignal___block_invoke;
    v6[3] = &unk_25081CCF0;
    v6[4] = v4;
    v7 = a3;
    dispatch_async(dispatchQueue, v6);
  }
  else
  {
    v4->_conversationDetectSignal = a3;
  }
  objc_sync_exit(v4);

}

void __53__AAAudioSessionControl_setConversationDetectSignal___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24) = *(_DWORD *)(a1 + 40);
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 28))
  {
    objc_msgSend((id)gAAServicesDaemon, "updateAudioSessionControl:");
  }
  else
  {
    objc_msgSend(*(id *)(v1 + 32), "remoteObjectProxy");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "audioSessionControlUpdate:", *(_QWORD *)(a1 + 32));

  }
}

- (void)setMuteAction:(int)a3 auditToken:(id *)a4
{
  __int128 v4;
  _OWORD v5[2];

  v4 = *(_OWORD *)&a4->var0[4];
  v5[0] = *(_OWORD *)a4->var0;
  v5[1] = v4;
  -[AAAudioSessionControl setMuteAction:auditToken:bundleIdentifier:](self, "setMuteAction:auditToken:bundleIdentifier:", *(_QWORD *)&a3, v5, 0);
}

- (void)setMuteAction:(int)a3 auditToken:(id *)a4 bundleIdentifier:(id)a5
{
  id v8;
  AAAudioSessionControl *v9;
  NSObject *dispatchQueue;
  __int128 v11;
  _QWORD block[5];
  id v13;
  int v14;
  __int128 v15;
  __int128 v16;

  v8 = a5;
  if (gLogCategory_AAAudioSessionControl <= 30
    && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v9 = self;
  objc_sync_enter(v9);
  if (v9->_activateCalled)
  {
    dispatchQueue = v9->_dispatchQueue;
    block[1] = 3221225472;
    v11 = *(_OWORD *)&a4->var0[4];
    v15 = *(_OWORD *)a4->var0;
    block[0] = MEMORY[0x24BDAC760];
    block[2] = __67__AAAudioSessionControl_setMuteAction_auditToken_bundleIdentifier___block_invoke;
    block[3] = &unk_25081CD18;
    block[4] = v9;
    v14 = a3;
    v16 = v11;
    v13 = v8;
    dispatch_async(dispatchQueue, block);

  }
  else if (gLogCategory_AAAudioSessionControl <= 90
         && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_sync_exit(v9);

}

void __67__AAAudioSessionControl_setMuteAction_auditToken_bundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  _OWORD v6[2];

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 28))
  {
    if (gLogCategory_AAAudioSessionControl <= 90
      && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_AAAudioSessionControl <= 30
      && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteObjectProxy");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(unsigned int *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_OWORD *)(a1 + 68);
    v6[0] = *(_OWORD *)(a1 + 52);
    v6[1] = v5;
    objc_msgSend(v2, "setMuteAction:auditToken:bundleIdentifier:", v3, v6, v4);

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
  v7[2] = __48__AAAudioSessionControl_activateWithCompletion___block_invoke;
  v7[3] = &unk_25081CD40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __48__AAAudioSessionControl_activateWithCompletion___block_invoke(uint64_t a1)
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
    if (gLogCategory_AAAudioSessionControl <= 90
      && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
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
  _BOOL8 v3;
  BOOL v5;
  BOOL v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id activateCompletion;
  id v10;
  _QWORD v11[5];
  BOOL v12;

  v3 = a3;
  if (gLogCategory_AAAudioSessionControl <= 30
    && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_testListenerEndpoint)
    v5 = 1;
  else
    v5 = gAAServicesDaemon == 0;
  v6 = !v5;
  self->_direct = v6;
  if (self->_invalidateCalled)
  {
    NSErrorF();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_AAAudioSessionControl <= 90
      && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x23B7FD6BC](self->_activateCompletion);
    activateCompletion = self->_activateCompletion;
    self->_activateCompletion = 0;

    if (v8)
      ((void (**)(_QWORD, id))v8)[2](v8, v10);

  }
  else
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __35__AAAudioSessionControl__activate___block_invoke;
    v11[3] = &unk_25081CD68;
    v11[4] = self;
    v12 = v3;
    v7 = (void *)MEMORY[0x23B7FD6BC](v11);
    if (self->_direct)
      -[AAAudioSessionControl _activateDirect:](self, "_activateDirect:", v7);
    else
      -[AAAudioSessionControl _activateXPC:reactivate:](self, "_activateXPC:reactivate:", v7, v3);

  }
}

void __35__AAAudioSessionControl__activate___block_invoke(uint64_t a1, void *a2)
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
    if (gLogCategory_AAAudioSessionControl <= 90)
    {
      if (gLogCategory_AAAudioSessionControl != -1 || (v5 = _LogCategory_Initialize(), v4 = v10, v5))
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
    if (gLogCategory_AAAudioSessionControl > 30
      || gLogCategory_AAAudioSessionControl == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_17;
    }
  }
  else if (gLogCategory_AAAudioSessionControl > 30
         || gLogCategory_AAAudioSessionControl == -1 && !_LogCategory_Initialize())
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

- (void)_activateDirect:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (gLogCategory_AAAudioSessionControl <= 30
    && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5 = (void *)gAAServicesDaemon;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__AAAudioSessionControl__activateDirect___block_invoke;
  v7[3] = &unk_25081CDB8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "activateAudioSessionControl:completion:", self, v7);

}

void __41__AAAudioSessionControl__activateDirect___block_invoke(uint64_t a1, void *a2)
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
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__AAAudioSessionControl__activateDirect___block_invoke_2;
  v7[3] = &unk_25081CD90;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __41__AAAudioSessionControl__activateDirect___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)_activateXPC:(id)a3 reactivate:(BOOL)a4
{
  _BOOL4 v4;
  void (**v6)(id, void *);
  void *v7;
  uint64_t v8;
  NSXPCConnection *xpcCnx;
  void (**v10)(id, void *);
  void *v11;
  uint64_t clientID;
  _QWORD v13[4];
  void (**v14)(id, void *);
  _QWORD v15[4];
  void (**v16)(id, void *);
  BOOL v17;

  v4 = a4;
  v6 = (void (**)(id, void *))a3;
  if (v4)
  {
    if (gLogCategory_AAAudioSessionControl > 30)
      goto LABEL_15;
    if (gLogCategory_AAAudioSessionControl == -1 && !_LogCategory_Initialize())
      goto LABEL_11;
    goto LABEL_7;
  }
  if (gLogCategory_AAAudioSessionControl > 30)
    goto LABEL_15;
  if (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize())
LABEL_7:
    LogPrintF();
LABEL_11:
  if (gLogCategory_AAAudioSessionControl <= 30
    && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
  {
    clientID = self->_clientID;
    LogPrintF();
  }
LABEL_15:
  -[AAAudioSessionControl _ensureXPCStarted](self, "_ensureXPCStarted", clientID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v6[2](v6, v7);
  }
  else
  {
    v8 = MEMORY[0x24BDAC760];
    xpcCnx = self->_xpcCnx;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __49__AAAudioSessionControl__activateXPC_reactivate___block_invoke;
    v15[3] = &unk_25081CDE0;
    v17 = v4;
    v10 = v6;
    v16 = v10;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __49__AAAudioSessionControl__activateXPC_reactivate___block_invoke_2;
    v13[3] = &unk_25081CE08;
    v14 = v10;
    objc_msgSend(v11, "audioSessionControlActivate:completion:", self, v13);

  }
}

void __49__AAAudioSessionControl__activateXPC_reactivate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (*(_BYTE *)(a1 + 40))
  {
    if (gLogCategory_AAAudioSessionControl <= 30
      && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_AAAudioSessionControl <= 90
         && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

uint64_t __49__AAAudioSessionControl__activateXPC_reactivate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
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
    v12[2] = __42__AAAudioSessionControl__ensureXPCStarted__block_invoke;
    v12[3] = &unk_25081CE30;
    v12[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v12);
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __42__AAAudioSessionControl__ensureXPCStarted__block_invoke_2;
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

uint64_t __42__AAAudioSessionControl__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __42__AAAudioSessionControl__ensureXPCStarted__block_invoke_2(uint64_t a1)
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
  void *v3;
  id activateCompletion;
  void (**interruptionHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_AAAudioSessionControl <= 50
    && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  BTErrorF();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAAudioSessionControl _reportError:](self, "_reportError:", v3);

  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  if (self->_activateCalled)
    -[AAAudioSessionControl _activate:](self, "_activate:", 1);
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
  block[2] = __35__AAAudioSessionControl_invalidate__block_invoke;
  block[3] = &unk_25081CE30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __35__AAAudioSessionControl_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void (**v7)(id, void *);

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 29))
  {
    *(_BYTE *)(v1 + 29) = 1;
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 30)
      && gLogCategory_AAAudioSessionControl <= 30
      && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v3 + 28))
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
  objc_msgSend((id)gAAServicesDaemon, "invalidateAudioSessionControl:completion:");
}

void __42__AAAudioSessionControl__invalidateDirect__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 48);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__AAAudioSessionControl__invalidateDirect__block_invoke_2;
  block[3] = &unk_25081CE30;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __42__AAAudioSessionControl__invalidateDirect__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_invalidated
{
  id activateCompletion;
  void *v4;
  void (**v5)(_QWORD);
  id invalidationHandler;
  NSXPCConnection *xpcCnx;
  void (**v8)(id, void *);

  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_AAAudioSessionControl <= 50
      && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_direct && !self->_xpcCnx)
    {
      v8 = (void (**)(id, void *))MEMORY[0x23B7FD6BC](self->_activateCompletion, a2);
      activateCompletion = self->_activateCompletion;
      self->_activateCompletion = 0;

      if (v8)
      {
        BTErrorF();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v8[2](v8, v4);

      }
      v5 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](self->_invalidationHandler);
      invalidationHandler = self->_invalidationHandler;
      self->_invalidationHandler = 0;

      if (v5)
        v5[2](v5);
      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_AAAudioSessionControl <= 10
        && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
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
  if (gLogCategory_AAAudioSessionControl <= 90
    && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x23B7FD6BC](self->_activateCompletion);
  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  if (v4)
    ((void (**)(_QWORD, id))v4)[2](v4, v6);

}

- (int)conversationDetectSignal
{
  return self->_conversationDetectSignal;
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
