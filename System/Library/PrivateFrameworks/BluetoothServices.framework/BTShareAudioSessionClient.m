@implementation BTShareAudioSessionClient

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BTShareAudioSessionClient)init
{
  BTShareAudioSessionClient *v2;
  BTShareAudioSessionClient *v3;
  BTShareAudioSessionClient *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BTShareAudioSessionClient;
  v2 = -[BTShareAudioSessionClient init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v4 = v3;
  }

  return v3;
}

- (BTShareAudioSessionClient)initWithCoder:(id)a3
{
  id v4;
  BTShareAudioSessionClient *v5;
  BTShareAudioSessionClient *v6;

  v4 = a3;
  v5 = -[BTShareAudioSessionClient init](self, "init");
  if (v5)
  {
    if (NSDecodeSInt64RangedIfPresent())
      v5->_mode = 0;
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t mode;

  mode = self->_mode;
  if ((_DWORD)mode)
    objc_msgSend(a3, "encodeInteger:forKey:", mode, CFSTR("mode"));
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__BTShareAudioSessionClient_activate__block_invoke;
  block[3] = &unk_24CEE54F0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__BTShareAudioSessionClient_activate__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    *(_BYTE *)(v1 + 8) = 1;
    return objc_msgSend(*(id *)(result + 32), "_activate:", 0);
  }
  return result;
}

- (void)_activate:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  NSXPCConnection *xpcCnx;
  void *v8;
  _QWORD v9[4];
  BOOL v10;
  _QWORD v11[4];
  BOOL v12;

  if (a3)
  {
    if (gLogCategory_BTShareAudioSessionClient <= 30
      && (gLogCategory_BTShareAudioSessionClient != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_BTShareAudioSessionClient <= 30
         && (gLogCategory_BTShareAudioSessionClient != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  -[BTShareAudioSessionClient _ensureXPCStarted](self, "_ensureXPCStarted");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (gLogCategory_BTShareAudioSessionClient <= 90
      && (gLogCategory_BTShareAudioSessionClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    v6 = MEMORY[0x24BDAC760];
    xpcCnx = self->_xpcCnx;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __39__BTShareAudioSessionClient__activate___block_invoke;
    v11[3] = &__block_descriptor_33_e17_v16__0__NSError_8l;
    v12 = a3;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __39__BTShareAudioSessionClient__activate___block_invoke_2;
    v9[3] = &__block_descriptor_33_e17_v16__0__NSError_8l;
    v10 = a3;
    objc_msgSend(v8, "shareAudioSessionActivate:completion:", self, v9);

  }
}

void __39__BTShareAudioSessionClient__activate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  void *v6;
  id v7;
  id v8;

  v3 = a2;
  if (*(_BYTE *)(a1 + 32))
  {
    if (gLogCategory_BTShareAudioSessionClient <= 90)
    {
      if (gLogCategory_BTShareAudioSessionClient != -1 || (v7 = v3, v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        v6 = v3;
        LogPrintF();

        return;
      }
    }
  }
  else if (gLogCategory_BTShareAudioSessionClient <= 90)
  {
    if (gLogCategory_BTShareAudioSessionClient != -1)
      goto LABEL_7;
    v8 = v3;
    v5 = _LogCategory_Initialize();
    v3 = v8;
    if (v5)
      goto LABEL_7;
  }

}

void __39__BTShareAudioSessionClient__activate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  id v9;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (*(_BYTE *)(a1 + 32))
    {
      if (gLogCategory_BTShareAudioSessionClient <= 90)
      {
        v9 = v3;
        if (gLogCategory_BTShareAudioSessionClient != -1 || (v5 = _LogCategory_Initialize(), v4 = v9, v5))
        {
LABEL_15:
          LogPrintF();
          v4 = v9;
        }
      }
    }
    else if (gLogCategory_BTShareAudioSessionClient <= 90)
    {
      v9 = v3;
      if (gLogCategory_BTShareAudioSessionClient != -1)
        goto LABEL_15;
      v7 = _LogCategory_Initialize();
      v4 = v9;
      if (v7)
        goto LABEL_15;
    }
  }
  else if (*(_BYTE *)(a1 + 32))
  {
    if (gLogCategory_BTShareAudioSessionClient <= 30)
    {
      v9 = 0;
      if (gLogCategory_BTShareAudioSessionClient != -1)
        goto LABEL_15;
      v6 = _LogCategory_Initialize();
      v4 = 0;
      if (v6)
        goto LABEL_15;
    }
  }
  else if (gLogCategory_BTShareAudioSessionClient <= 30)
  {
    v9 = 0;
    if (gLogCategory_BTShareAudioSessionClient != -1)
      goto LABEL_15;
    v8 = _LogCategory_Initialize();
    v4 = 0;
    if (v8)
      goto LABEL_15;
  }

}

- (id)_ensureXPCStarted
{
  NSXPCListenerEndpoint *v3;
  id v4;
  NSXPCConnection *v5;
  NSXPCConnection *xpcCnx;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  NSXPCListenerEndpoint *v21;
  _QWORD v22[5];
  _QWORD v23[6];

  if (!self->_xpcCnx)
  {
    v3 = self->_testListenerEndpoint;
    v4 = objc_alloc(MEMORY[0x24BDD1988]);
    v21 = v3;
    if (v3)
      v5 = (NSXPCConnection *)objc_msgSend(v4, "initWithListenerEndpoint:", v3);
    else
      v5 = (NSXPCConnection *)objc_msgSend(v4, "initWithMachServiceName:options:", CFSTR("com.apple.BluetoothServices"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v5;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B6EB30);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BDBCF20]);
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = (void *)objc_msgSend(v7, "initWithObjects:", v8, v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
    objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_shareAudioProgressEvent_info_, 1, 0);
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v20);
    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    v17 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __46__BTShareAudioSessionClient__ensureXPCStarted__block_invoke;
    v23[3] = &unk_24CEE54F0;
    v23[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v23);
    v22[0] = v17;
    v22[1] = 3221225472;
    v22[2] = __46__BTShareAudioSessionClient__ensureXPCStarted__block_invoke_2;
    v22[3] = &unk_24CEE54F0;
    v22[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v22);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B6EB90);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v18);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_BTShareAudioSessionClient <= 30
      && (gLogCategory_BTShareAudioSessionClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
  return 0;
}

uint64_t __46__BTShareAudioSessionClient__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __46__BTShareAudioSessionClient__ensureXPCStarted__block_invoke_2(uint64_t a1)
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
  uint64_t v3;
  void *v4;

  if (gLogCategory_BTShareAudioSessionClient <= 50
    && (gLogCategory_BTShareAudioSessionClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = MEMORY[0x2199A7854](self->_progressHandler);
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, 30, 0);

  if (self->_activateCalled)
    -[BTShareAudioSessionClient _activate:](self, "_activate:", 1);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__BTShareAudioSessionClient_invalidate__block_invoke;
  block[3] = &unk_24CEE54F0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __39__BTShareAudioSessionClient_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  id *v3;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 9))
  {
    v2 = result;
    *(_BYTE *)(v1 + 9) = 1;
    if (gLogCategory_BTShareAudioSessionClient <= 30
      && (gLogCategory_BTShareAudioSessionClient != -1 || _LogCategory_Initialize()))
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
  id progressHandler;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_BTShareAudioSessionClient <= 50
      && (gLogCategory_BTShareAudioSessionClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_xpcCnx)
    {
      v3 = MEMORY[0x2199A7854](self->_progressHandler);
      v4 = (void *)v3;
      if (v3)
        (*(void (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, 20, 0);

      progressHandler = self->_progressHandler;
      self->_progressHandler = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_BTShareAudioSessionClient <= 10
        && (gLogCategory_BTShareAudioSessionClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

- (void)userConfirmed:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__BTShareAudioSessionClient_userConfirmed___block_invoke;
  v4[3] = &unk_24CEE5818;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

void __43__BTShareAudioSessionClient_userConfirmed___block_invoke(uint64_t a1)
{
  const char *v2;
  const char *v3;
  id v4;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    if (gLogCategory_BTShareAudioSessionClient <= 30
      && (gLogCategory_BTShareAudioSessionClient != -1 || _LogCategory_Initialize()))
    {
      if (*(_BYTE *)(a1 + 40))
        v2 = "yes";
      else
        v2 = "no";
      v3 = v2;
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxy", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shareAudioUserConfirmed:", *(unsigned __int8 *)(a1 + 40));

  }
  else if (gLogCategory_BTShareAudioSessionClient <= 90
         && (gLogCategory_BTShareAudioSessionClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)shareAudioProgressEvent:(int)a3 info:(id)a4
{
  uint64_t v4;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_BTShareAudioSessionClient <= 30
    && (gLogCategory_BTShareAudioSessionClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v6 = MEMORY[0x2199A7854](self->_progressHandler);
  v7 = (void *)v6;
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v4, v8);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
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
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end
