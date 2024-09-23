@implementation CBUserController

- (void)recordEventWithStarting:(BOOL)a3 useCase:(unsigned int)a4
{
  NSObject *dispatchQueue;
  _QWORD v5[5];
  unsigned int v6;
  BOOL v7;

  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__CBUserController_recordEventWithStarting_useCase___block_invoke;
  v5[3] = &unk_1E53FF960;
  v6 = a4;
  v5[4] = self;
  v7 = a3;
  dispatch_async(dispatchQueue, v5);
}

void __52__CBUserController_recordEventWithStarting_useCase___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(_QWORD);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  _QWORD v15[5];
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v2 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __52__CBUserController_recordEventWithStarting_useCase___block_invoke_2;
  v15[3] = &unk_1E53FF938;
  v15[4] = &v17;
  v16 = *(_DWORD *)(a1 + 40);
  v3 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v15);
  if ((objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted") & 1) != 0)
  {
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v14[0] = v2;
    v14[1] = 3221225472;
    v14[2] = __52__CBUserController_recordEventWithStarting_useCase___block_invoke_3;
    v14[3] = &unk_1E53FF8E8;
    v14[4] = &v17;
    objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recordEventWithStarting:useCase:", *(unsigned __int8 *)(a1 + 44), *(unsigned int *)(a1 + 40));
  }
  else
  {
    CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v4, v5, v6, v7, v8, v9, v13);
    v12 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v18[5];
    v18[5] = v12;
  }

  v3[2](v3);
  _Block_object_dispose(&v17, 8);

}

void __52__CBUserController_recordEventWithStarting_useCase___block_invoke_2(uint64_t a1)
{
  void *v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)
    && gLogCategory_CBUserController <= 90
    && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
}

- (BOOL)_ensureXPCStarted
{
  NSXPCListenerEndpoint *v3;
  id v4;
  NSXPCConnection *v5;
  NSXPCConnection *xpcCnx;
  void *v7;
  uint64_t v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  id activateCompletion;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  if (!self->_xpcCnx)
  {
    v3 = self->_testListenerEndpoint;
    v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
    if (v3)
      v5 = (NSXPCConnection *)objc_msgSend(v4, "initWithListenerEndpoint:", v3);
    else
      v5 = (NSXPCConnection *)objc_msgSend(v4, "initWithMachServiceName:options:", CFSTR("com.apple.bluetoothuser.xpc"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v5;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    CBUserControllerXPCInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v7);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    location = 0;
    objc_initWeak(&location, self);
    v8 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __37__CBUserController__ensureXPCStarted__block_invoke;
    v15[3] = &unk_1E53FF7A8;
    objc_copyWeak(&v16, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v15);
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __37__CBUserController__ensureXPCStarted__block_invoke_2;
    v13[3] = &unk_1E53FF7A8;
    objc_copyWeak(&v14, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v13);
    CBUserControllerXPCInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v9);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_CBUserController <= 30
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_activateCompletion);
    activateCompletion = self->_activateCompletion;
    self->_activateCompletion = 0;

    if (v10)
      v10[2](v10, 0);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
  return 1;
}

- (CBUserController)init
{
  CBUserController *v2;
  CBUserController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CBUserController;
  v2 = -[CBUserController init](&v5, sel_init);
  if (v2)
  {
    v2->_clientID = CBXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v2->_ucat = (LogCategory *)&gLogCategory_CBUserController;
    v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  void (**v3)(_QWORD);
  int var0;
  CBUserController *v5;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  LogCategory *ucat;
  id interruptionHandler;
  id invalidationHandler;
  objc_super v11;

  v3 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](self->_invalidationHandler, a2);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v5 = self;
    objc_sync_enter(v5);
    v6 = v5->_xpcCnx;
    v7 = v6;
    if (v6)
      -[NSXPCConnection invalidate](v6, "invalidate");

    objc_sync_exit(v5);
    ucat = self->_ucat;
    if (ucat && (ucat->var3 & 0x40000) != 0)
    {
      LogCategory_Remove();
      self->_ucat = 0;
    }
    interruptionHandler = v5->_interruptionHandler;
    v5->_interruptionHandler = 0;

    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    if (v3)
      v3[2](v3);
  }

  v11.receiver = self;
  v11.super_class = (Class)CBUserController;
  -[CBUserController dealloc](&v11, sel_dealloc);
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  CBUserController *v5;
  uint64_t v6;
  id activateCompletion;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5->_activateCalled)
  {
    v5->_activateCalled = 1;
    v6 = MEMORY[0x1A85D1CE4](v4);
    activateCompletion = v5->_activateCompletion;
    v5->_activateCompletion = (id)v6;

    dispatchQueue = v5->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__CBUserController_activateWithCompletion___block_invoke;
    block[3] = &unk_1E53FF780;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);

}

uint64_t __43__CBUserController_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  int var0;
  void (**v4)(_QWORD, _QWORD);
  id activateCompletion;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_invalidateCalled)
  {
    NSErrorF();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_activateCompletion);
    activateCompletion = self->_activateCompletion;
    self->_activateCompletion = 0;

    if (v4)
    {
      ((void (**)(_QWORD, id))v4)[2](v4, v9);
    }
    else
    {
      v6 = MEMORY[0x1A85D1CE4](self->_errorHandler);
      v7 = (void *)v6;
      if (v6)
        (*(void (**)(uint64_t, id))(v6 + 16))(v6, v9);

    }
  }
  else
  {
    -[CBUserController _activateXPCStart:](self, "_activateXPCStart:", 0);
  }
}

- (void)_activateXPCStart:(BOOL)a3
{
  int var0;
  CBUserController *v5;

  var0 = self->_ucat->var0;
  if (a3)
  {
    if (var0 > 30 || var0 == -1 && !_LogCategory_Initialize())
    {
LABEL_10:
      v5 = self;
      goto LABEL_8;
    }
  }
  else if (var0 > 30 || var0 == -1 && !_LogCategory_Initialize())
  {
    goto LABEL_10;
  }
  LogPrintF_safe();
  v5 = self;
LABEL_8:
  -[CBUserController _ensureXPCStarted](v5, "_ensureXPCStarted");
}

void __37__CBUserController__ensureXPCStarted__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_interrupted");

}

void __37__CBUserController__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidated");

}

- (void)_interrupted
{
  uint64_t v3;
  void *v4;

  if (gLogCategory_CBUserController <= 50
    && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  v3 = MEMORY[0x1A85D1CE4](self->_interruptionHandler);
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t))(v3 + 16))(v3);

  -[CBUserController _activateXPCStart:](self, "_activateXPCStart:", 1);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CBUserController_invalidate__block_invoke;
  block[3] = &unk_1E53FF780;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __30__CBUserController_invalidate__block_invoke(uint64_t result)
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
      && gLogCategory_CBUserController <= 30
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v3 = *(id **)(v2 + 32);
    if (v3[5])
    {
      objc_msgSend(v3[5], "invalidate");
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
      && gLogCategory_CBUserController <= 50
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v3 = MEMORY[0x1A85D1CE4](self->_invalidationHandler, a2);
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
    if (gLogCategory_CBUserController < 11
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
}

- (void)diagnosticShow:(id)a3 completion:(id)a4
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
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CBUserController_diagnosticShow_completion___block_invoke;
  block[3] = &unk_1E53FF820;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

void __46__CBUserController_diagnosticShow_completion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  void (**v4)(_QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
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
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v1 = *(void **)(a1 + 48);
  if (v1)
  {
    v3 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __46__CBUserController_diagnosticShow_completion___block_invoke_2;
    v18[3] = &unk_1E53FF7D0;
    v20 = &v21;
    v19 = v1;
    v4 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v18);
    if ((objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted") & 1) != 0)
    {
      v11 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      if (v11)
      {
        v16[0] = v3;
        v16[1] = 3221225472;
        v16[2] = __46__CBUserController_diagnosticShow_completion___block_invoke_3;
        v16[3] = &unk_1E53FF7F8;
        v17 = *(id *)(a1 + 48);
        objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "diagnosticShow:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

        v13 = v17;
LABEL_5:

        v4[2](v4);
        goto LABEL_6;
      }
      CBErrorF(-6753, (uint64_t)"NO XPC", v5, v6, v7, v8, v9, v10, v15);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v5, v6, v7, v8, v9, v10, v15);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)v22[5];
    v22[5] = v14;
    goto LABEL_5;
  }
  if (gLogCategory_CBUserController <= 90
    && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_6:
  _Block_object_dispose(&v21, 8);

}

uint64_t __46__CBUserController_diagnosticShow_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

uint64_t __46__CBUserController_diagnosticShow_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)appleAudioAccessoryLimitedLoggingWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__CBUserController_appleAudioAccessoryLimitedLoggingWithCompletion___block_invoke;
  v7[3] = &unk_1E53FF5F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __68__CBUserController_appleAudioAccessoryLimitedLoggingWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  void (**v4)(_QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
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
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v3 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __68__CBUserController_appleAudioAccessoryLimitedLoggingWithCompletion___block_invoke_2;
    v18[3] = &unk_1E53FF7D0;
    v20 = &v21;
    v19 = v1;
    v4 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v18);
    if ((objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted") & 1) != 0)
    {
      v11 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      if (v11)
      {
        v16[0] = v3;
        v16[1] = 3221225472;
        v16[2] = __68__CBUserController_appleAudioAccessoryLimitedLoggingWithCompletion___block_invoke_3;
        v16[3] = &unk_1E53FF7F8;
        v17 = *(id *)(a1 + 40);
        objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "appleAudioAccessoryLimitedLoggingWithCompletion:", *(_QWORD *)(a1 + 40));

        v13 = v17;
LABEL_5:

        v4[2](v4);
        goto LABEL_6;
      }
      CBErrorF(-6753, (uint64_t)"NO XPC", v5, v6, v7, v8, v9, v10, v15);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v5, v6, v7, v8, v9, v10, v15);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)v22[5];
    v22[5] = v14;
    goto LABEL_5;
  }
  if (gLogCategory_CBUserController <= 90
    && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_6:
  _Block_object_dispose(&v21, 8);

}

uint64_t __68__CBUserController_appleAudioAccessoryLimitedLoggingWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

uint64_t __68__CBUserController_appleAudioAccessoryLimitedLoggingWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setAppleAudioAccessoryLimitedLogging:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__CBUserController_setAppleAudioAccessoryLimitedLogging_completion___block_invoke;
  block[3] = &unk_1E53FF848;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __68__CBUserController_setAppleAudioAccessoryLimitedLogging_completion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  void (**v4)(_QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v3 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __68__CBUserController_setAppleAudioAccessoryLimitedLogging_completion___block_invoke_2;
    v19[3] = &unk_1E53FF7D0;
    v21 = &v22;
    v20 = v1;
    v4 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v19);
    if ((objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted") & 1) != 0)
    {
      v11 = *(void **)(a1 + 40);
      v12 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      v17[0] = v3;
      v17[1] = 3221225472;
      v17[2] = __68__CBUserController_setAppleAudioAccessoryLimitedLogging_completion___block_invoke_3;
      v17[3] = &unk_1E53FF7F8;
      v18 = v11;
      objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAppleAudioAccessoryLimitedLogging:completion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

      v14 = v18;
    }
    else
    {
      CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v5, v6, v7, v8, v9, v10, v16);
      v15 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v23[5];
      v23[5] = v15;
    }

    v4[2](v4);
  }
  else if (gLogCategory_CBUserController <= 90
         && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  _Block_object_dispose(&v22, 8);

}

uint64_t __68__CBUserController_setAppleAudioAccessoryLimitedLogging_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

uint64_t __68__CBUserController_setAppleAudioAccessoryLimitedLogging_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getDistributedLoggingStatusWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__CBUserController_getDistributedLoggingStatusWithCompletion___block_invoke;
  v7[3] = &unk_1E53FF5F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __62__CBUserController_getDistributedLoggingStatusWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  void (**v4)(_QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v3 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __62__CBUserController_getDistributedLoggingStatusWithCompletion___block_invoke_2;
    v19[3] = &unk_1E53FF7D0;
    v21 = &v22;
    v20 = v1;
    v4 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v19);
    if ((objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted") & 1) != 0)
    {
      v11 = *(void **)(a1 + 40);
      v12 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      v17[0] = v3;
      v17[1] = 3221225472;
      v17[2] = __62__CBUserController_getDistributedLoggingStatusWithCompletion___block_invoke_3;
      v17[3] = &unk_1E53FF7F8;
      v18 = v11;
      objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "getDistributedLoggingStatusWithCompletion:", *(_QWORD *)(a1 + 40));

      v14 = v18;
    }
    else
    {
      CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v5, v6, v7, v8, v9, v10, v16);
      v15 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v23[5];
      v23[5] = v15;
    }

    v4[2](v4);
  }
  else if (gLogCategory_CBUserController <= 90
         && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  _Block_object_dispose(&v22, 8);

}

uint64_t __62__CBUserController_getDistributedLoggingStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

uint64_t __62__CBUserController_getDistributedLoggingStatusWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setDistributedLoggingStatus:(unsigned int)a3 completion:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CBUserController_setDistributedLoggingStatus_completion___block_invoke;
  block[3] = &unk_1E53FF870;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __59__CBUserController_setDistributedLoggingStatus_completion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  void (**v4)(_QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v3 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __59__CBUserController_setDistributedLoggingStatus_completion___block_invoke_2;
    v19[3] = &unk_1E53FF7D0;
    v21 = &v22;
    v20 = v1;
    v4 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v19);
    if ((objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted") & 1) != 0)
    {
      v11 = *(void **)(a1 + 40);
      v12 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      v17[0] = v3;
      v17[1] = 3221225472;
      v17[2] = __59__CBUserController_setDistributedLoggingStatus_completion___block_invoke_3;
      v17[3] = &unk_1E53FF7F8;
      v18 = v11;
      objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDistributedLoggingStatus:completion:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));

      v14 = v18;
    }
    else
    {
      CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v5, v6, v7, v8, v9, v10, v16);
      v15 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v23[5];
      v23[5] = v15;
    }

    v4[2](v4);
  }
  else if (gLogCategory_CBUserController <= 90
         && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  _Block_object_dispose(&v22, 8);

}

uint64_t __59__CBUserController_setDistributedLoggingStatus_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

uint64_t __59__CBUserController_setDistributedLoggingStatus_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getCurrentUserGivenNameWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__CBUserController_getCurrentUserGivenNameWithCompletion___block_invoke;
  v7[3] = &unk_1E53FF5F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __58__CBUserController_getCurrentUserGivenNameWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  void (**v4)(_QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v3 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __58__CBUserController_getCurrentUserGivenNameWithCompletion___block_invoke_2;
    v19[3] = &unk_1E53FF7D0;
    v21 = &v22;
    v20 = v1;
    v4 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v19);
    if ((objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted") & 1) != 0)
    {
      v11 = *(void **)(a1 + 40);
      v12 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      v17[0] = v3;
      v17[1] = 3221225472;
      v17[2] = __58__CBUserController_getCurrentUserGivenNameWithCompletion___block_invoke_3;
      v17[3] = &unk_1E53FF7F8;
      v18 = v11;
      objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "getCurrentUserGivenNameWithCompletion:", *(_QWORD *)(a1 + 40));

      v14 = v18;
    }
    else
    {
      CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v5, v6, v7, v8, v9, v10, v16);
      v15 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v23[5];
      v23[5] = v15;
    }

    v4[2](v4);
  }
  else if (gLogCategory_CBUserController <= 90
         && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  _Block_object_dispose(&v22, 8);

}

uint64_t __58__CBUserController_getCurrentUserGivenNameWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

uint64_t __58__CBUserController_getCurrentUserGivenNameWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getControllerInfoForDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CBUserController *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CBUserController_getControllerInfoForDevice_completion___block_invoke;
  block[3] = &unk_1E53FF820;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

void __58__CBUserController_getControllerInfoForDevice_completion___block_invoke(id *a1)
{
  uint64_t v2;
  void (**v3)(_QWORD);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  if (a1[6])
  {
    v2 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __58__CBUserController_getControllerInfoForDevice_completion___block_invoke_2;
    v20[3] = &unk_1E53FF898;
    v23 = &v24;
    v21 = a1[4];
    v22 = a1[6];
    v3 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v20);
    if ((objc_msgSend(a1[5], "_ensureXPCStarted") & 1) != 0)
    {
      v10 = a1[6];
      v11 = (void *)*((_QWORD *)a1[5] + 5);
      v15 = v2;
      v16 = 3221225472;
      v17 = __58__CBUserController_getControllerInfoForDevice_completion___block_invoke_3;
      v18 = &unk_1E53FF7F8;
      v19 = v10;
      objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", &v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "getControllerInfoForDevice:completion:", a1[4], a1[6], v15, v16, v17, v18);

      v13 = v19;
    }
    else
    {
      CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v4, v5, v6, v7, v8, v9, v15);
      v14 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v25[5];
      v25[5] = v14;
    }

    v3[2](v3);
  }
  else if (gLogCategory_CBUserController <= 90
         && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  _Block_object_dispose(&v24, 8);

}

uint64_t __58__CBUserController_getControllerInfoForDevice_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  return result;
}

uint64_t __58__CBUserController_getControllerInfoForDevice_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)storeControllerInfo:(id)a3 completion:(id)a4
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
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CBUserController_storeControllerInfo_completion___block_invoke;
  block[3] = &unk_1E53FF820;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

void __51__CBUserController_storeControllerInfo_completion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  void (**v4)(_QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
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
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v1 = *(void **)(a1 + 48);
  if (v1)
  {
    v3 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __51__CBUserController_storeControllerInfo_completion___block_invoke_2;
    v18[3] = &unk_1E53FF7D0;
    v20 = &v21;
    v19 = v1;
    v4 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v18);
    if ((objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted") & 1) != 0)
    {
      v11 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      v16[0] = v3;
      v16[1] = 3221225472;
      v16[2] = __51__CBUserController_storeControllerInfo_completion___block_invoke_3;
      v16[3] = &unk_1E53FF7F8;
      v17 = *(id *)(a1 + 48);
      objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "storeControllerInfo:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

      v13 = v17;
    }
    else
    {
      CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v5, v6, v7, v8, v9, v10, v15);
      v14 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v22[5];
      v22[5] = v14;
    }

    v4[2](v4);
  }
  else if (gLogCategory_CBUserController <= 90
         && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  _Block_object_dispose(&v21, 8);

}

uint64_t __51__CBUserController_storeControllerInfo_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

uint64_t __51__CBUserController_storeControllerInfo_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getCloudPairedDevicesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__CBUserController_getCloudPairedDevicesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E53FF5F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __63__CBUserController_getCloudPairedDevicesWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  void (**v4)(_QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v3 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __63__CBUserController_getCloudPairedDevicesWithCompletionHandler___block_invoke_2;
    v19[3] = &unk_1E53FF7D0;
    v21 = &v22;
    v20 = v1;
    v4 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v19);
    if ((objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted") & 1) != 0)
    {
      v11 = *(void **)(a1 + 40);
      v12 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      v17[0] = v3;
      v17[1] = 3221225472;
      v17[2] = __63__CBUserController_getCloudPairedDevicesWithCompletionHandler___block_invoke_3;
      v17[3] = &unk_1E53FF7F8;
      v18 = v11;
      objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "getCloudPairedDevicesWithCompletionHandler:", *(_QWORD *)(a1 + 40));

      v14 = v18;
    }
    else
    {
      CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v5, v6, v7, v8, v9, v10, v16);
      v15 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v23[5];
      v23[5] = v15;
    }

    v4[2](v4);
  }
  else if (gLogCategory_CBUserController <= 90
         && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  _Block_object_dispose(&v22, 8);

}

uint64_t __63__CBUserController_getCloudPairedDevicesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

uint64_t __63__CBUserController_getCloudPairedDevicesWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteControllerInfoForDevice:(id)a3 completion:(id)a4
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
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__CBUserController_deleteControllerInfoForDevice_completion___block_invoke;
  block[3] = &unk_1E53FF820;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

void __61__CBUserController_deleteControllerInfoForDevice_completion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  void (**v4)(_QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
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
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v1 = *(void **)(a1 + 48);
  if (v1)
  {
    v3 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __61__CBUserController_deleteControllerInfoForDevice_completion___block_invoke_2;
    v18[3] = &unk_1E53FF7D0;
    v20 = &v21;
    v19 = v1;
    v4 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v18);
    if ((objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted") & 1) != 0)
    {
      v11 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      v16[0] = v3;
      v16[1] = 3221225472;
      v16[2] = __61__CBUserController_deleteControllerInfoForDevice_completion___block_invoke_3;
      v16[3] = &unk_1E53FF7F8;
      v17 = *(id *)(a1 + 48);
      objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "deleteControllerInfoForDevice:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

      v13 = v17;
    }
    else
    {
      CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v5, v6, v7, v8, v9, v10, v15);
      v14 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v22[5];
      v22[5] = v14;
    }

    v4[2](v4);
  }
  else if (gLogCategory_CBUserController <= 90
         && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  _Block_object_dispose(&v21, 8);

}

uint64_t __61__CBUserController_deleteControllerInfoForDevice_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

uint64_t __61__CBUserController_deleteControllerInfoForDevice_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)recordEventWithDeviceIdentifier:(id)a3 initiator:(BOOL)a4 starting:(BOOL)a5 useCase:(unsigned int)a6
{
  id v10;
  NSObject *dispatchQueue;
  id v12;
  _QWORD block[4];
  id v14;
  CBUserController *v15;
  unsigned int v16;
  BOOL v17;
  BOOL v18;

  v10 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__CBUserController_recordEventWithDeviceIdentifier_initiator_starting_useCase___block_invoke;
  block[3] = &unk_1E53FF910;
  v14 = v10;
  v15 = self;
  v17 = a4;
  v18 = a5;
  v16 = a6;
  v12 = v10;
  dispatch_async(dispatchQueue, block);

}

void __79__CBUserController_recordEventWithDeviceIdentifier_initiator_starting_useCase___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(_QWORD);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  _QWORD v15[4];
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
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v2 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__CBUserController_recordEventWithDeviceIdentifier_initiator_starting_useCase___block_invoke_2;
  v15[3] = &unk_1E53FF8C0;
  v17 = &v18;
  v16 = *(id *)(a1 + 32);
  v3 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v15);
  if ((objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted") & 1) != 0)
  {
    v10 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
    v14[0] = v2;
    v14[1] = 3221225472;
    v14[2] = __79__CBUserController_recordEventWithDeviceIdentifier_initiator_starting_useCase___block_invoke_3;
    v14[3] = &unk_1E53FF8E8;
    v14[4] = &v18;
    objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recordEventWithDeviceIdentifier:initiator:starting:useCase:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 52), *(unsigned __int8 *)(a1 + 53), *(unsigned int *)(a1 + 48));
  }
  else
  {
    CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v4, v5, v6, v7, v8, v9, v13);
    v12 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v19[5];
    v19[5] = v12;
  }

  v3[2](v3);
  _Block_object_dispose(&v18, 8);

}

void __79__CBUserController_recordEventWithDeviceIdentifier_initiator_starting_useCase___block_invoke_2(uint64_t a1)
{
  void *v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
    && gLogCategory_CBUserController <= 90
    && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
}

void __79__CBUserController_recordEventWithDeviceIdentifier_initiator_starting_useCase___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __52__CBUserController_recordEventWithStarting_useCase___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)readPrefKeys:(id)a3 source:(unsigned int)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  CBUserController *v15;
  id v16;
  unsigned int v17;

  v8 = a3;
  v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__CBUserController_readPrefKeys_source_completion___block_invoke;
  v13[3] = &unk_1E53FF988;
  v14 = v8;
  v15 = self;
  v17 = a4;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(dispatchQueue, v13);

}

void __51__CBUserController_readPrefKeys_source_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(_QWORD);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16[4];
  id v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  v2 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __51__CBUserController_readPrefKeys_source_completion___block_invoke_2;
  v19[3] = &unk_1E53FF8C0;
  v21 = &v22;
  v20 = *(id *)(a1 + 32);
  v3 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v19);
  if ((objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted") & 1) != 0)
  {
    v10 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
    v18[0] = v2;
    v18[1] = 3221225472;
    v18[2] = __51__CBUserController_readPrefKeys_source_completion___block_invoke_3;
    v18[3] = &unk_1E53FF8E8;
    v18[4] = &v22;
    objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(unsigned int *)(a1 + 56);
    v16[0] = v2;
    v16[1] = 3221225472;
    v16[2] = (uint64_t)__51__CBUserController_readPrefKeys_source_completion___block_invoke_4;
    v16[3] = (uint64_t)&unk_1E53FF618;
    v17 = *(id *)(a1 + 48);
    objc_msgSend(v11, "readPrefKeys:source:completion:", v12, v13, v16);

    v14 = v17;
  }
  else
  {
    CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v4, v5, v6, v7, v8, v9, v16[0]);
    v15 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v23[5];
    v23[5] = v15;
  }

  v3[2](v3);
  _Block_object_dispose(&v22, 8);

}

void __51__CBUserController_readPrefKeys_source_completion___block_invoke_2(uint64_t a1)
{
  void *v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
    && gLogCategory_CBUserController <= 90
    && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
}

void __51__CBUserController_readPrefKeys_source_completion___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __51__CBUserController_readPrefKeys_source_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)writePrefKey:(id)a3 value:(id)a4 source:(unsigned int)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *dispatchQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  CBUserController *v19;
  id v20;
  id v21;
  unsigned int v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CBUserController_writePrefKey_value_source_completion___block_invoke;
  block[3] = &unk_1E53FF9B0;
  v18 = v10;
  v19 = self;
  v22 = a5;
  v20 = v11;
  v21 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(dispatchQueue, block);

}

void __57__CBUserController_writePrefKey_value_source_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(_QWORD);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17[4];
  id v18;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v2 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __57__CBUserController_writePrefKey_value_source_completion___block_invoke_2;
  v20[3] = &unk_1E53FF8C0;
  v22 = &v23;
  v21 = *(id *)(a1 + 32);
  v3 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v20);
  if ((objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted") & 1) != 0)
  {
    v10 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
    v19[0] = v2;
    v19[1] = 3221225472;
    v19[2] = __57__CBUserController_writePrefKey_value_source_completion___block_invoke_3;
    v19[3] = &unk_1E53FF8E8;
    v19[4] = &v23;
    objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(unsigned int *)(a1 + 64);
    v17[0] = v2;
    v17[1] = 3221225472;
    v17[2] = (uint64_t)__57__CBUserController_writePrefKey_value_source_completion___block_invoke_4;
    v17[3] = (uint64_t)&unk_1E53FF7F8;
    v14 = *(_QWORD *)(a1 + 48);
    v18 = *(id *)(a1 + 56);
    objc_msgSend(v11, "writePrefKey:value:source:completion:", v12, v14, v13, v17);

    v15 = v18;
  }
  else
  {
    CBErrorF(-6753, (uint64_t)"Unable to establish connection to Bluetooth User Daemon", v4, v5, v6, v7, v8, v9, v17[0]);
    v16 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v24[5];
    v24[5] = v16;
  }

  v3[2](v3);
  _Block_object_dispose(&v23, 8);

}

void __57__CBUserController_writePrefKey_value_source_completion___block_invoke_2(uint64_t a1)
{
  void *v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
    && gLogCategory_CBUserController <= 90
    && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
}

void __57__CBUserController_writePrefKey_value_source_completion___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __57__CBUserController_writePrefKey_value_source_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)readPrefKeys:(id)a3 source:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  dispatch_queue_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  id *v24;
  _QWORD v25[5];
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy_;
  v25[4] = __Block_byref_object_dispose_;
  v8 = MEMORY[0x1E0C809B0];
  v26 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __46__CBUserController_readPrefKeys_source_error___block_invoke;
  v21[3] = &unk_1E53FF9D8;
  v23 = v25;
  v9 = v7;
  v22 = v9;
  v24 = a5;
  v10 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v21);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = dispatch_queue_create("CBUserController-ReadPrefs", v11);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.bluetoothuser.xpc"), 0);
  objc_msgSend(v13, "_setQueue:", v12);
  CBUserControllerXPCInterface();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setExportedInterface:", v14);

  CBUserControllerXPCInterface();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRemoteObjectInterface:", v15);

  objc_msgSend(v13, "resume");
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __46__CBUserController_readPrefKeys_source_error___block_invoke_2;
  v20[3] = &unk_1E53FF8E8;
  v20[4] = v25;
  objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __46__CBUserController_readPrefKeys_source_error___block_invoke_3;
  v19[3] = &unk_1E53FFA00;
  v19[4] = &v27;
  objc_msgSend(v16, "readPrefKeys:source:completion:", v9, v6, v19);

  v17 = (id)v28[5];
  v10[2](v10);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

  return v17;
}

void __46__CBUserController_readPrefKeys_source_error___block_invoke(uint64_t a1)
{
  void *v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    if (*(_QWORD *)(a1 + 48))
      **(_QWORD **)(a1 + 48) = objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
}

void __46__CBUserController_readPrefKeys_source_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __46__CBUserController_readPrefKeys_source_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (BOOL)writePrefKey:(id)a3 value:(id)a4 source:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD);
  NSObject *v14;
  dispatch_queue_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  _QWORD *v25;
  id *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  _QWORD v31[5];
  id v32;

  v7 = *(_QWORD *)&a5;
  v9 = a3;
  v10 = a4;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy_;
  v31[4] = __Block_byref_object_dispose_;
  v32 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v11 = MEMORY[0x1E0C809B0];
  v30 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __52__CBUserController_writePrefKey_value_source_error___block_invoke;
  v23[3] = &unk_1E53FF9D8;
  v25 = v31;
  v12 = v9;
  v24 = v12;
  v26 = a6;
  v13 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v23);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = dispatch_queue_create("CBUserController-WritePrefs", v14);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.bluetoothuser.xpc"), 0);
  objc_msgSend(v16, "_setQueue:", v15);
  CBUserControllerXPCInterface();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setExportedInterface:", v17);

  CBUserControllerXPCInterface();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setRemoteObjectInterface:", v18);

  objc_msgSend(v16, "resume");
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __52__CBUserController_writePrefKey_value_source_error___block_invoke_2;
  v22[3] = &unk_1E53FF8E8;
  v22[4] = v31;
  objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __52__CBUserController_writePrefKey_value_source_error___block_invoke_3;
  v21[3] = &unk_1E53FF8E8;
  v21[4] = &v27;
  objc_msgSend(v19, "writePrefKey:value:source:completion:", v12, v10, v7, v21);

  LODWORD(v7) = *((unsigned __int8 *)v28 + 24);
  v13[2](v13);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(v31, 8);

  return (_DWORD)v7 != 0;
}

void __52__CBUserController_writePrefKey_value_source_error___block_invoke(uint64_t a1)
{
  void *v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    if (gLogCategory_CBUserController <= 90
      && (gLogCategory_CBUserController != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    if (*(_QWORD *)(a1 + 48))
      **(_QWORD **)(a1 + 48) = objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
}

void __52__CBUserController_writePrefKey_value_source_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __52__CBUserController_writePrefKey_value_source_error___block_invoke_3(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2 == 0;
  return result;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
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
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

@end
