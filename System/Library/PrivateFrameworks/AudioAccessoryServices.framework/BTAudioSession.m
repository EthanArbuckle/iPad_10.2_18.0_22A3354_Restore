@implementation BTAudioSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BTAudioSession)init
{
  BTAudioSession *v2;
  BTAudioSession *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BTAudioSession;
  v2 = -[BTAudioSession init](&v5, sel_init);
  if (v2)
  {
    v2->_clientID = BTXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v2->_ucat = (LogCategory *)&gLogCategory_BTAudioSession;
    v3 = v2;
  }

  return v2;
}

- (BTAudioSession)initWithCoder:(id)a3
{
  id v4;
  BTAudioSession *v5;
  id v6;
  BTAudioSession *v7;

  v4 = a3;
  v5 = -[BTAudioSession init](self, "init");
  if (v5)
  {
    if (NSDecodeSInt64RangedIfPresent())
      v5->_category = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_clientID = 0;
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v7 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t category;
  uint64_t clientID;
  NSString *label;
  id v8;

  v4 = a3;
  category = self->_category;
  v8 = v4;
  if ((_DWORD)category)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", category, CFSTR("cat"));
    v4 = v8;
  }
  clientID = self->_clientID;
  if ((_DWORD)clientID)
  {
    objc_msgSend(v8, "encodeInt64:forKey:", clientID, CFSTR("cid"));
    v4 = v8;
  }
  label = self->_label;
  if (label)
  {
    objc_msgSend(v8, "encodeObject:forKey:", label, CFSTR("label"));
    v4 = v8;
  }

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
  v4.super_class = (Class)BTAudioSession;
  -[BTAudioSession dealloc](&v4, sel_dealloc);
}

- (id)description
{
  NSAppendPrintF();
  return 0;
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
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__BTAudioSession_activateWithCompletion___block_invoke;
  v7[3] = &unk_25081CD40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __41__BTAudioSession_activateWithCompletion___block_invoke(uint64_t a1)
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
    if (gLogCategory_BTAudioSession <= 90
      && (gLogCategory_BTAudioSession != -1 || _LogCategory_Initialize()))
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
  int var0;
  OS_dispatch_source *timeoutTimer;
  OS_dispatch_source **p_timeoutTimer;
  NSObject *v6;
  OS_dispatch_source *v7;
  dispatch_source_t v8;
  uint64_t v9;
  void *v10;
  NSXPCConnection *xpcCnx;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD handler[6];

  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  p_timeoutTimer = &self->_timeoutTimer;
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v6 = timeoutTimer;
    dispatch_source_cancel(v6);
    v7 = *p_timeoutTimer;
    *p_timeoutTimer = 0;

  }
  v8 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  objc_storeStrong((id *)&self->_timeoutTimer, v8);
  v9 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __27__BTAudioSession__activate__block_invoke;
  handler[3] = &unk_25081D4E0;
  handler[4] = v8;
  handler[5] = self;
  dispatch_source_set_event_handler(v8, handler);
  CUDispatchTimerSet();
  dispatch_activate(v8);
  -[BTAudioSession _ensureXPCStarted](self, "_ensureXPCStarted");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[BTAudioSession _reportError:](self, "_reportError:", v10);
  }
  else
  {
    xpcCnx = self->_xpcCnx;
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __27__BTAudioSession__activate__block_invoke_2;
    v14[3] = &unk_25081CE58;
    v14[4] = self;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __27__BTAudioSession__activate__block_invoke_3;
    v13[3] = &unk_25081CE58;
    v13[4] = self;
    objc_msgSend(v12, "audioSessionActivate:completion:", self, v13);

  }
}

void __27__BTAudioSession__activate__block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v1 = *(void **)(a1 + 32);
  if (v1 == *(void **)(*(_QWORD *)(a1 + 40) + 32))
  {
    if (v1)
    {
      v3 = v1;
      dispatch_source_cancel(v3);
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(void **)(v4 + 32);
      *(_QWORD *)(v4 + 32) = 0;

    }
    v6 = *(void **)(a1 + 40);
    BTErrorF();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_reportError:", v7);

  }
}

void __27__BTAudioSession__activate__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _DWORD **v4;
  int v5;
  int v6;
  id v7;
  id v8;

  v3 = a2;
  v4 = *(_DWORD ***)(a1 + 32);
  v5 = *v4[5];
  v8 = v3;
  if (v5 <= 90)
  {
    if (v5 == -1)
    {
      v6 = _LogCategory_Initialize();
      v4 = *(_DWORD ***)(a1 + 32);
      if (!v6)
      {
        v3 = v8;
        goto LABEL_6;
      }
      v3 = v8;
    }
    v7 = v3;
    LogPrintF();
    v3 = v8;
    v4 = *(_DWORD ***)(a1 + 32);
  }
LABEL_6:
  objc_msgSend(v4, "_reportError:", v3, v7);

}

void __27__BTAudioSession__activate__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  int v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  void (**v15)(_QWORD, _QWORD);
  uint64_t v16;
  void *v17;
  id v18;
  id v19;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v19 = v3;
  if (v3)
  {
    v5 = v3;
    v6 = **(_DWORD **)(v4 + 40);
    if (v6 <= 90)
    {
      if (v6 == -1)
      {
        v13 = _LogCategory_Initialize();
        v4 = *(_QWORD *)(a1 + 32);
        if (!v13)
        {
          v5 = v19;
          goto LABEL_12;
        }
        v5 = v19;
      }
      v18 = v5;
      LogPrintF();
      v5 = v19;
      v4 = *(_QWORD *)(a1 + 32);
    }
LABEL_12:
    objc_msgSend((id)v4, "_reportError:", v5, v18);
    goto LABEL_17;
  }
  v7 = *(void **)(v4 + 32);
  if (v7)
  {
    v8 = v7;
    dispatch_source_cancel(v8);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 32);
    *(_QWORD *)(v9 + 32) = 0;

  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = **(_DWORD **)(v11 + 40);
  if (v12 <= 30)
  {
    if (v12 != -1 || (v14 = _LogCategory_Initialize(), v11 = *(_QWORD *)(a1 + 32), v14))
    {
      LogPrintF();
      v11 = *(_QWORD *)(a1 + 32);
    }
  }
  v15 = (void (**)(_QWORD, _QWORD))MEMORY[0x23B7FD6BC](*(_QWORD *)(v11 + 16));
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 16);
  *(_QWORD *)(v16 + 16) = 0;

  if (v15)
    v15[2](v15, 0);

LABEL_17:
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
    v12[2] = __35__BTAudioSession__ensureXPCStarted__block_invoke;
    v12[3] = &unk_25081CE30;
    v12[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v12);
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __35__BTAudioSession__ensureXPCStarted__block_invoke_2;
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

uint64_t __35__BTAudioSession__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __35__BTAudioSession__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_interrupted
{
  id v3;

  if (gLogCategory_BTAudioSession <= 50
    && (gLogCategory_BTAudioSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  BTErrorF();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BTAudioSession _reportError:](self, "_reportError:", v3);

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__BTAudioSession_invalidate__block_invoke;
  block[3] = &unk_25081CE30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __28__BTAudioSession_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void (**v12)(id, void *);

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25)
      && gLogCategory_BTAudioSession <= 30
      && (gLogCategory_BTAudioSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    if (v3)
    {
      v4 = v3;
      dispatch_source_cancel(v4);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 32);
      *(_QWORD *)(v5 + 32) = 0;

    }
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 48);
    if (v8)
    {
      objc_msgSend(v8, "invalidate");
      v7 = *(_QWORD *)(a1 + 32);
    }
    v12 = (void (**)(id, void *))MEMORY[0x23B7FD6BC](*(_QWORD *)(v7 + 16));
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 16);
    *(_QWORD *)(v9 + 16) = 0;

    if (v12)
    {
      BTErrorF();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v11);

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
  OS_dispatch_source *timeoutTimer;
  NSObject *v8;
  OS_dispatch_source *v9;
  NSXPCConnection *xpcCnx;
  void (**v11)(id, void *);

  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_BTAudioSession <= 50
      && (gLogCategory_BTAudioSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_xpcCnx)
    {
      v11 = (void (**)(id, void *))MEMORY[0x23B7FD6BC](self->_activateCompletion, a2);
      activateCompletion = self->_activateCompletion;
      self->_activateCompletion = 0;

      if (v11)
      {
        BTErrorF();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v11[2](v11, v4);

      }
      v5 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](self->_invalidationHandler);
      invalidationHandler = self->_invalidationHandler;
      self->_invalidationHandler = 0;

      if (v5)
        v5[2](v5);
      timeoutTimer = self->_timeoutTimer;
      if (timeoutTimer)
      {
        v8 = timeoutTimer;
        dispatch_source_cancel(v8);
        v9 = self->_timeoutTimer;
        self->_timeoutTimer = 0;

      }
      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_BTAudioSession <= 10
        && (gLogCategory_BTAudioSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

    }
  }
}

- (void)_reportError:(id)a3
{
  OS_dispatch_source *timeoutTimer;
  NSObject *v5;
  OS_dispatch_source *v6;
  void (**v7)(_QWORD, _QWORD);
  id activateCompletion;
  id v9;

  v9 = a3;
  if (gLogCategory_BTAudioSession <= 90
    && (gLogCategory_BTAudioSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v5 = timeoutTimer;
    dispatch_source_cancel(v5);
    v6 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x23B7FD6BC](self->_activateCompletion);
  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  if (v7)
    ((void (**)(_QWORD, id))v7)[2](v7, v9);

}

- (int)audioArbitrationResult
{
  return self->_audioArbitrationResult;
}

- (void)setAudioArbitrationResult:(int)a3
{
  self->_audioArbitrationResult = a3;
}

- (int)category
{
  return self->_category;
}

- (void)setCategory:(int)a3
{
  self->_category = a3;
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

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)inAppRouting
{
  return self->_inAppRouting;
}

- (void)setInAppRouting:(BOOL)a3
{
  self->_inAppRouting = a3;
}

- (NSString)label
{
  return self->_label;
}

- (double)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(double)a3
{
  self->_timeoutSeconds = a3;
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
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
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

@end
