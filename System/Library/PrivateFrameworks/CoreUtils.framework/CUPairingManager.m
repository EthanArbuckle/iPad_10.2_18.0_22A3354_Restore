@implementation CUPairingManager

- (CUPairingManager)init
{
  CUPairingManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CUPairingManager;
  v2 = -[CUPairingManager init](&v4, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, 0);
  objc_storeStrong(&self->_pairedPeerChangedHandler, 0);
  objc_storeStrong(&self->_pairedPeerRemovedHandler, 0);
  objc_storeStrong(&self->_pairedPeerAddedHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_identityDeletedHandler, 0);
  objc_storeStrong(&self->_identityCreatedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id identityCreatedHandler;
  id identityDeletedHandler;
  id interruptionHandler;
  id invalidationHandler;
  id pairedPeerAddedHandler;
  id pairedPeerRemovedHandler;
  id pairedPeerChangedHandler;
  objc_super v16;

  if (self->_xpcCnx)
    FatalErrorF((uint64_t)"XPC connection still active during dealloc", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)v16.receiver);
  identityCreatedHandler = self->_identityCreatedHandler;
  self->_identityCreatedHandler = 0;

  identityDeletedHandler = self->_identityDeletedHandler;
  self->_identityDeletedHandler = 0;

  interruptionHandler = self->_interruptionHandler;
  self->_interruptionHandler = 0;

  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  pairedPeerAddedHandler = self->_pairedPeerAddedHandler;
  self->_pairedPeerAddedHandler = 0;

  pairedPeerRemovedHandler = self->_pairedPeerRemovedHandler;
  self->_pairedPeerRemovedHandler = 0;

  pairedPeerChangedHandler = self->_pairedPeerChangedHandler;
  self->_pairedPeerChangedHandler = 0;

  v16.receiver = self;
  v16.super_class = (Class)CUPairingManager;
  -[CUPairingManager dealloc](&v16, sel_dealloc);
}

- (int)_ensureXPCStarted
{
  NSXPCListenerEndpoint *testListenerEndpoint;
  id v4;
  NSXPCConnection *v5;
  NSXPCConnection *xpcCnx;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];

  if (self->_xpcCnx)
    return 0;
  if (!self->_invalidateCalled && !self->_invalidateDone)
  {
    testListenerEndpoint = self->_testListenerEndpoint;
    v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
    if (testListenerEndpoint)
      v5 = (NSXPCConnection *)objc_msgSend(v4, "initWithListenerEndpoint:", self->_testListenerEndpoint);
    else
      v5 = (NSXPCConnection *)objc_msgSend(v4, "initWithMachServiceName:options:", CFSTR("com.apple.PairingManager"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v5;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    v7 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __37__CUPairingManager__ensureXPCStarted__block_invoke;
    v15[3] = &unk_1E25DF2A0;
    v15[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v15);
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __37__CUPairingManager__ensureXPCStarted__block_invoke_2;
    v14[3] = &unk_1E25DF2A0;
    v14[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v14);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE075A80);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v8);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0758F0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_getPairedPeersWithOptions_completion_, 0, 1);
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v9);
    -[NSXPCConnection resume](self->_xpcCnx, "resume");

    return 0;
  }
  return -6724;
}

- (void)_interrupted
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void (**interruptionHandler)(void);
  uint64_t v13;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingManager <= 50
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x32u)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _interrupted]", 0x32u, (uint64_t)"### Interrupted\n", v3, v4, v5, v6, v13);
  }
  if (self->_monitoring && !-[CUPairingManager _ensureXPCStarted](self, "_ensureXPCStarted"))
  {
    if (gLogCategory_CUPairingManager <= 50
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x32u)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _interrupted]", 0x32u, (uint64_t)"Restarting monitor after interruption\n", v7, v8, v9, v10, v13);
    }
    -[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startMonitoringWithOptions:", self->_monitorOptions);

  }
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler)
    interruptionHandler[2]();
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CUPairingManager_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSXPCConnection *xpcCnx;
  NSXPCConnection *v8;
  uint64_t v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (!self->_invalidateDone
      && gLogCategory_CUPairingManager <= 30
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _invalidate]", 0x1Eu, (uint64_t)"Invalidating\n", v3, v4, v5, v6, v9);
    }
    xpcCnx = self->_xpcCnx;
    if (xpcCnx)
    {
      -[NSXPCConnection invalidate](xpcCnx, "invalidate");
      v8 = self->_xpcCnx;
      self->_xpcCnx = 0;

    }
    else
    {
      -[CUPairingManager _invalidated](self, "_invalidated");
    }
  }
}

- (void)_invalidated
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (**invalidationHandler)(void);
  id identityCreatedHandler;
  id identityDeletedHandler;
  id interruptionHandler;
  id v11;
  id pairedPeerAddedHandler;
  id pairedPeerRemovedHandler;
  id pairedPeerChangedHandler;
  NSXPCConnection *xpcCnx;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_CUPairingManager <= 50
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x32u)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _invalidated]", 0x32u, (uint64_t)"### Unexpectedly invalidated\n", v3, v4, v5, v6, v20);
    }
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2]();
    identityCreatedHandler = self->_identityCreatedHandler;
    self->_identityCreatedHandler = 0;

    identityDeletedHandler = self->_identityDeletedHandler;
    self->_identityDeletedHandler = 0;

    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    v11 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    pairedPeerAddedHandler = self->_pairedPeerAddedHandler;
    self->_pairedPeerAddedHandler = 0;

    pairedPeerRemovedHandler = self->_pairedPeerRemovedHandler;
    self->_pairedPeerRemovedHandler = 0;

    pairedPeerChangedHandler = self->_pairedPeerChangedHandler;
    self->_pairedPeerChangedHandler = 0;

    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_CUPairingManager <= 30
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v16, v17, v18, v19, v21);
    }
  }
}

- (void)getPairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *dispatchQueue;
  id v9;
  _QWORD block[5];
  id v11;
  unint64_t v12;
  os_activity_scope_state_s state;

  v6 = a4;
  v7 = _os_activity_create(&dword_18D40C000, "CoreUtils/CUPairingManager/getPairingIdentityWithOptions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__CUPairingManager_getPairingIdentityWithOptions_completion___block_invoke;
  block[3] = &unk_1E25DD058;
  v11 = v6;
  v12 = a3;
  block[4] = self;
  v9 = v6;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

- (void)_getPairingIdentityWithOptions:(unint64_t)a3 tryCount:(unsigned int)a4 completion:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (**v12)(id, _QWORD, void *);
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSXPCConnection *xpcCnx;
  void (**v19)(id, _QWORD, void *);
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  unint64_t v32;
  unsigned int v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v12 = (void (**)(id, _QWORD, void *))a5;
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _getPairingIdentityWithOptions:tryCount:completion:]", 0x1Eu, (uint64_t)"GetPairingIdentity %#{flags}\n", v8, v9, v10, v11, a3);
  }
  v13 = -[CUPairingManager _ensureXPCStarted](self, "_ensureXPCStarted");
  if (v13)
  {
    v21 = v13;
    if (gLogCategory_CUPairingManager <= 60
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _getPairingIdentityWithOptions:tryCount:completion:]", 0x3Cu, (uint64_t)"### GetPairingIdentity %#{flags} failed: %#m\n", v14, v15, v16, v17, a3);
    }
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2F90];
    v24 = v21;
    v34 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, v21, 0, 0));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    v27 = CFSTR("?");
    if (v25)
      v27 = (const __CFString *)v25;
    v35[0] = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, v24, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, v29);

  }
  else
  {
    xpcCnx = self->_xpcCnx;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __71__CUPairingManager__getPairingIdentityWithOptions_tryCount_completion___block_invoke;
    v30[3] = &unk_1E25DD080;
    v33 = a4;
    v30[4] = self;
    v32 = a3;
    v19 = v12;
    v31 = v19;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v30);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "getPairingIdentityWithOptions:completion:", a3, v19);

  }
}

- (void)deletePairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *dispatchQueue;
  id v9;
  _QWORD block[5];
  id v11;
  unint64_t v12;
  os_activity_scope_state_s state;

  v6 = a4;
  v7 = _os_activity_create(&dword_18D40C000, "CoreUtils/CUPairingManager/deletePairingIdentityWithOptions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__CUPairingManager_deletePairingIdentityWithOptions_completion___block_invoke;
  block[3] = &unk_1E25DD058;
  v11 = v6;
  v12 = a3;
  block[4] = self;
  v9 = v6;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

- (void)_deletePairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(id, void *);
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSXPCConnection *xpcCnx;
  void (**v17)(id, void *);
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  void (**v29)(id, void *);
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v10 = (void (**)(id, void *))a4;
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _deletePairingIdentityWithOptions:completion:]", 0x1Eu, (uint64_t)"DeletePairingIdentity %#{flags}\n", v6, v7, v8, v9, a3);
  }
  v11 = -[CUPairingManager _ensureXPCStarted](self, "_ensureXPCStarted");
  if (v11)
  {
    v20 = v11;
    if (gLogCategory_CUPairingManager <= 60
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _deletePairingIdentityWithOptions:completion:]", 0x3Cu, (uint64_t)"### DeletePairingIdentity %#{flags} failed: %#m\n", v12, v13, v14, v15, a3);
    }
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2F90];
    v23 = v20;
    v30 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, v20, 0, 0));
    v24 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v24;
    v25 = CFSTR("?");
    if (v24)
      v25 = (const __CFString *)v24;
    v31[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, v23, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v27);

  }
  else
  {
    xpcCnx = self->_xpcCnx;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __65__CUPairingManager__deletePairingIdentityWithOptions_completion___block_invoke;
    v28[3] = &unk_1E25DD0A8;
    v17 = v10;
    v29 = v17;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v28);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "deletePairingIdentityWithOptions:completion:", a3, v17);

    v19 = v29;
  }

}

- (void)getPairedPeersWithGroupID:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__CUPairingManager_getPairedPeersWithGroupID_options_completion___block_invoke;
  v12[3] = &unk_1E25DD0D0;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[CUPairingManager getPairedPeersWithOptions:completion:](self, "getPairedPeersWithOptions:completion:", a4, v12);

}

- (void)getPairedPeersWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *dispatchQueue;
  id v9;
  _QWORD block[5];
  id v11;
  unint64_t v12;
  os_activity_scope_state_s state;

  v6 = a4;
  v7 = _os_activity_create(&dword_18D40C000, "CoreUtils/CUPairingManager/getPairedPeersWithOptions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CUPairingManager_getPairedPeersWithOptions_completion___block_invoke;
  block[3] = &unk_1E25DD058;
  v11 = v6;
  v12 = a3;
  block[4] = self;
  v9 = v6;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

- (void)_getPairedPeersWithOptions:(unint64_t)a3 completion:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(id, _QWORD, void *);
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSXPCConnection *xpcCnx;
  void (**v17)(id, _QWORD, void *);
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v10 = (void (**)(id, _QWORD, void *))a4;
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _getPairedPeersWithOptions:completion:]", 0x1Eu, (uint64_t)"GetPairedPeers %#{flags}\n", v6, v7, v8, v9, a3);
  }
  v11 = -[CUPairingManager _ensureXPCStarted](self, "_ensureXPCStarted");
  if (v11)
  {
    v20 = v11;
    if (gLogCategory_CUPairingManager <= 60
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _getPairedPeersWithOptions:completion:]", 0x3Cu, (uint64_t)"### GetPairedPeers %#{flags} failed: %#m\n", v12, v13, v14, v15, a3);
    }
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2F90];
    v23 = v20;
    v30 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, v20, 0, 0));
    v24 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v24;
    v25 = CFSTR("?");
    if (v24)
      v25 = (const __CFString *)v24;
    v31[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, v23, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v27);

  }
  else
  {
    xpcCnx = self->_xpcCnx;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __58__CUPairingManager__getPairedPeersWithOptions_completion___block_invoke;
    v28[3] = &unk_1E25DD0A8;
    v17 = v10;
    v29 = v17;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v28);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "getPairedPeersWithOptions:completion:", a3, v17);

    v19 = v29;
  }

}

- (void)findPairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  unint64_t v17;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a5;
  v10 = _os_activity_create(&dword_18D40C000, "CoreUtils/CUPairingManager/findPairedPeer", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  dispatchQueue = self->_dispatchQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__CUPairingManager_findPairedPeer_options_completion___block_invoke;
  v14[3] = &unk_1E25DD0F8;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = a4;
  v12 = v9;
  v13 = v8;
  dispatch_async(dispatchQueue, v14);

  os_activity_scope_leave(&state);
}

- (void)_findPairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSXPCConnection *xpcCnx;
  void (**v21)(id, _QWORD, void *);
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, _QWORD, void *))a5;
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _findPairedPeer:options:completion:]", 0x1Eu, (uint64_t)"FindPairedPeer %@, %#{flags}\n", v11, v12, v13, v14, (uint64_t)v10);

  }
  v15 = -[CUPairingManager _ensureXPCStarted](self, "_ensureXPCStarted");
  if (v15)
  {
    v24 = v15;
    if (gLogCategory_CUPairingManager <= 60
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _findPairedPeer:options:completion:]", 0x3Cu, (uint64_t)"### FindPairedPeer %#{flags} failed: %#m\n", v16, v17, v18, v19, a4);
    }
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2F90];
    v27 = v24;
    v34 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, v24, 0, 0));
    v28 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v28;
    v29 = CFSTR("?");
    if (v28)
      v29 = (const __CFString *)v28;
    v35[0] = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, v27, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v31);

  }
  else
  {
    xpcCnx = self->_xpcCnx;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __55__CUPairingManager__findPairedPeer_options_completion___block_invoke;
    v32[3] = &unk_1E25DD0A8;
    v21 = v9;
    v33 = v21;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v32);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "findPairedPeer:options:completion:", v8, a4, v21);

    v23 = v33;
  }

}

- (void)savePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  unint64_t v17;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a5;
  v10 = _os_activity_create(&dword_18D40C000, "CoreUtils/CUPairingManager/savePairedPeer", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  dispatchQueue = self->_dispatchQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__CUPairingManager_savePairedPeer_options_completion___block_invoke;
  v14[3] = &unk_1E25DD0F8;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = a4;
  v12 = v9;
  v13 = v8;
  dispatch_async(dispatchQueue, v14);

  os_activity_scope_leave(&state);
}

- (void)_savePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  NSXPCConnection *xpcCnx;
  void (**v17)(id, void *);
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  void (**v34)(id, void *);
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _savePairedPeer:options:completion:]", 0x1Eu, (uint64_t)"SavePairedPeer %@, %#{flags}\n", v11, v12, v13, v14, (uint64_t)v10);

  }
  v15 = -[CUPairingManager _ensureXPCStarted](self, "_ensureXPCStarted");
  if (v15)
  {
    v20 = v15;
    if (gLogCategory_CUPairingManager <= 60
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x3Cu)))
    {
      objc_msgSend(v8, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _savePairedPeer:options:completion:]", 0x3Cu, (uint64_t)"### SavePairedPeer %@, %#{flags} failed: %#m\n", v22, v23, v24, v25, (uint64_t)v21);

    }
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2F90];
    v28 = v20;
    v35 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, v20, 0, 0));
    v29 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v29;
    v30 = CFSTR("?");
    if (v29)
      v30 = (const __CFString *)v29;
    v36[0] = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, v28, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v32);

  }
  else
  {
    xpcCnx = self->_xpcCnx;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __55__CUPairingManager__savePairedPeer_options_completion___block_invoke;
    v33[3] = &unk_1E25DD0A8;
    v17 = v9;
    v34 = v17;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v33);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "savePairedPeer:options:completion:", v8, a4, v17);

    v19 = v34;
  }

}

- (void)removePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  unint64_t v17;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a5;
  v10 = _os_activity_create(&dword_18D40C000, "CoreUtils/CUPairingManager/removePairedPeer", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  dispatchQueue = self->_dispatchQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__CUPairingManager_removePairedPeer_options_completion___block_invoke;
  v14[3] = &unk_1E25DD0F8;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = a4;
  v12 = v9;
  v13 = v8;
  dispatch_async(dispatchQueue, v14);

  os_activity_scope_leave(&state);
}

- (void)_removePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  NSXPCConnection *xpcCnx;
  void (**v17)(id, void *);
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  void (**v34)(id, void *);
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _removePairedPeer:options:completion:]", 0x1Eu, (uint64_t)"RemovePairedPeer %@, %#{flags}\n", v11, v12, v13, v14, (uint64_t)v10);

  }
  v15 = -[CUPairingManager _ensureXPCStarted](self, "_ensureXPCStarted");
  if (v15)
  {
    v20 = v15;
    if (gLogCategory_CUPairingManager <= 60
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x3Cu)))
    {
      objc_msgSend(v8, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _removePairedPeer:options:completion:]", 0x3Cu, (uint64_t)"### RemovePairedPeer %@, %#{flags} failed: %#m\n", v22, v23, v24, v25, (uint64_t)v21);

    }
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2F90];
    v28 = v20;
    v35 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, v20, 0, 0));
    v29 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v29;
    v30 = CFSTR("?");
    if (v29)
      v30 = (const __CFString *)v29;
    v36[0] = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, v28, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v32);

  }
  else
  {
    xpcCnx = self->_xpcCnx;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __57__CUPairingManager__removePairedPeer_options_completion___block_invoke;
    v33[3] = &unk_1E25DD0A8;
    v17 = v9;
    v34 = v17;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v33);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removePairedPeer:options:completion:", v8, a4, v17);

    v19 = v34;
  }

}

- (void)showWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18D40C000, "CoreUtils/CUPairingManager/showWithCompletion", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__CUPairingManager_showWithCompletion___block_invoke;
  v8[3] = &unk_1E25DE600;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

- (void)_showWithCompletion:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (**v8)(id, _QWORD, void *);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSXPCConnection *xpcCnx;
  void (**v15)(id, _QWORD, void *);
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, _QWORD, void *))a3;
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _showWithCompletion:]", 0x1Eu, (uint64_t)"Show\n", v4, v5, v6, v7, v26);
  }
  v9 = -[CUPairingManager _ensureXPCStarted](self, "_ensureXPCStarted");
  if ((_DWORD)v9)
  {
    v18 = v9;
    if (gLogCategory_CUPairingManager <= 60
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _showWithCompletion:]", 0x3Cu, (uint64_t)"### Show failed: %#m\n", v10, v11, v12, v13, v18);
    }
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2F90];
    v21 = (int)v18;
    v29 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, v18, 0, 0));
    v22 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v22;
    v23 = CFSTR("?");
    if (v22)
      v23 = (const __CFString *)v22;
    v30[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, v21, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v25);

  }
  else
  {
    xpcCnx = self->_xpcCnx;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __40__CUPairingManager__showWithCompletion___block_invoke;
    v27[3] = &unk_1E25DD0A8;
    v15 = v8;
    v28 = v15;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v27);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "showWithCompletion:", v15);

    v17 = v28;
  }

}

- (void)updatePairedPeersWithGroupID:(id)a3 groupInfo:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  CUPairingManager *v16;
  id v17;
  unint64_t v18;

  v10 = a4;
  v11 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__CUPairingManager_updatePairedPeersWithGroupID_groupInfo_options_completion___block_invoke;
  v14[3] = &unk_1E25DD148;
  v15 = v10;
  v16 = self;
  v17 = v11;
  v18 = a5;
  v12 = v10;
  v13 = v11;
  -[CUPairingManager getPairedPeersWithGroupID:options:completion:](self, "getPairedPeersWithGroupID:options:completion:", a3, a5, v14);

}

- (void)startMonitoringWithOptions:(unint64_t)a3
{
  NSObject *v5;
  NSObject *dispatchQueue;
  _QWORD v7[6];
  os_activity_scope_state_s state;

  v5 = _os_activity_create(&dword_18D40C000, "CoreUtils/CUPairingManager/startMonitoringWithOptions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__CUPairingManager_startMonitoringWithOptions___block_invoke;
  v7[3] = &unk_1E25DD170;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(dispatchQueue, v7);
  os_activity_scope_leave(&state);

}

- (void)_startMonitoringWithOptions:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _startMonitoringWithOptions:]", 0x1Eu, (uint64_t)"StartMonitoring %#{flags}\n", v3, v4, v5, v6, a3);
  }
  if (-[CUPairingManager _ensureXPCStarted](self, "_ensureXPCStarted"))
  {
    if (gLogCategory_CUPairingManager <= 60
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _startMonitoringWithOptions:]", 0x3Cu, (uint64_t)"### StartMonitoring %#{flags} failed: %#m\n", v9, v10, v11, v12, a3);
    }
  }
  else
  {
    -[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startMonitoringWithOptions:", a3);

    self->_monitoring = 1;
    self->_monitorOptions = a3;
  }
}

- (void)pairingIdentityCreated:(id)a3 options:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (**identityCreatedHandler)(id, id, unint64_t);
  void *v12;
  id v13;

  v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    objc_msgSend(v13, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager pairingIdentityCreated:options:]", 0x1Eu, (uint64_t)"PairingIdentityCreated %@, %#{flags}\n", v7, v8, v9, v10, (uint64_t)v6);

  }
  identityCreatedHandler = (void (**)(id, id, unint64_t))self->_identityCreatedHandler;
  v12 = v13;
  if (identityCreatedHandler)
  {
    identityCreatedHandler[2](identityCreatedHandler, v13, a4);
    v12 = v13;
  }

}

- (void)pairingIdentityDeletedWithOptions:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (**identityDeletedHandler)(id, unint64_t);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager pairingIdentityDeletedWithOptions:]", 0x1Eu, (uint64_t)"PairingIdentityDeleted %#{flags}\n", v5, v6, v7, v8, a3);
  }
  identityDeletedHandler = (void (**)(id, unint64_t))self->_identityDeletedHandler;
  if (identityDeletedHandler)
    identityDeletedHandler[2](identityDeletedHandler, a3);
}

- (void)pairedPeerAdded:(id)a3 options:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (**pairedPeerAddedHandler)(id, id, unint64_t);
  void *v12;
  id v13;

  v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    objc_msgSend(v13, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager pairedPeerAdded:options:]", 0x1Eu, (uint64_t)"PairedPeerAdded %@, %#{flags}\n", v7, v8, v9, v10, (uint64_t)v6);

  }
  pairedPeerAddedHandler = (void (**)(id, id, unint64_t))self->_pairedPeerAddedHandler;
  v12 = v13;
  if (pairedPeerAddedHandler)
  {
    pairedPeerAddedHandler[2](pairedPeerAddedHandler, v13, a4);
    v12 = v13;
  }

}

- (void)pairedPeerRemoved:(id)a3 options:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (**pairedPeerRemovedHandler)(id, id, unint64_t);
  void *v12;
  id v13;

  v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    objc_msgSend(v13, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager pairedPeerRemoved:options:]", 0x1Eu, (uint64_t)"PairedPeerRemoved %@, %#{flags}\n", v7, v8, v9, v10, (uint64_t)v6);

  }
  pairedPeerRemovedHandler = (void (**)(id, id, unint64_t))self->_pairedPeerRemovedHandler;
  v12 = v13;
  if (pairedPeerRemovedHandler)
  {
    pairedPeerRemovedHandler[2](pairedPeerRemovedHandler, v13, a4);
    v12 = v13;
  }

}

- (void)pairedPeerChanged:(id)a3 options:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (**pairedPeerChangedHandler)(id, id, unint64_t);
  void *v12;
  id v13;

  v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    objc_msgSend(v13, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager pairedPeerChanged:options:]", 0x1Eu, (uint64_t)"PairedPeerChanged %@, %#{flags}\n", v7, v8, v9, v10, (uint64_t)v6);

  }
  pairedPeerChangedHandler = (void (**)(id, id, unint64_t))self->_pairedPeerChangedHandler;
  v12 = v13;
  if (pairedPeerChangedHandler)
  {
    pairedPeerChangedHandler[2](pairedPeerChangedHandler, v13, a4);
    v12 = v13;
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

- (id)identityCreatedHandler
{
  return self->_identityCreatedHandler;
}

- (void)setIdentityCreatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)identityDeletedHandler
{
  return self->_identityDeletedHandler;
}

- (void)setIdentityDeletedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
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

- (id)pairedPeerAddedHandler
{
  return self->_pairedPeerAddedHandler;
}

- (void)setPairedPeerAddedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)pairedPeerRemovedHandler
{
  return self->_pairedPeerRemovedHandler;
}

- (void)setPairedPeerRemovedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)pairedPeerChangedHandler
{
  return self->_pairedPeerChangedHandler;
}

- (void)setPairedPeerChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)targetUserSession
{
  return self->_targetUserSession;
}

- (void)setTargetUserSession:(BOOL)a3
{
  self->_targetUserSession = a3;
}

- (unsigned)targetUserID
{
  return self->_targetUserID;
}

- (void)setTargetUserID:(unsigned int)a3
{
  self->_targetUserID = a3;
}

- (NSXPCListenerEndpoint)testListenerEndpoint
{
  return self->_testListenerEndpoint;
}

- (void)setTestListenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, a3);
}

uint64_t __47__CUPairingManager_startMonitoringWithOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startMonitoringWithOptions:", *(_QWORD *)(a1 + 40));
}

void __78__CUPairingManager_updatePairedPeersWithGroupID_groupInfo_options_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id obj;
  _QWORD block[4];
  id v24;
  _QWORD *v25;
  _QWORD v26[4];
  NSObject *v27;
  _QWORD *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v21 = v5;
  if (v6)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__5994;
    v33[4] = __Block_byref_object_dispose__5995;
    v34 = 0;
    v7 = dispatch_group_create();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v5;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v30 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v11, "info");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v12, "mutableCopy");
          v14 = v13;
          if (v13)
            v15 = v13;
          else
            v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v16 = v15;

          objc_msgSend(v16, "setObject:forKeyedSubscript:", a1[4], CFSTR("groupInfo"));
          objc_msgSend(v11, "setInfo:", v16);
          dispatch_group_enter(v7);
          v17 = (void *)a1[5];
          v18 = a1[7];
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __78__CUPairingManager_updatePairedPeersWithGroupID_groupInfo_options_completion___block_invoke_77;
          v26[3] = &unk_1E25DEEE0;
          v28 = v33;
          v27 = v7;
          objc_msgSend(v17, "savePairedPeer:options:completion:", v11, v18, v26);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v8);
    }

    v19 = (void *)a1[6];
    v20 = *(NSObject **)(a1[5] + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__CUPairingManager_updatePairedPeersWithGroupID_groupInfo_options_completion___block_invoke_2;
    block[3] = &unk_1E25DD120;
    v24 = v19;
    v25 = v33;
    dispatch_group_notify(v7, v20, block);

    _Block_object_dispose(v33, 8);
    v6 = 0;
  }

}

void __78__CUPairingManager_updatePairedPeersWithGroupID_groupInfo_options_completion___block_invoke_77(uint64_t a1, void *a2)
{
  uint64_t v4;
  id *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(_QWORD *)(v4 + 40);
  v5 = (id *)(v4 + 40);
  if (!v6)
    objc_storeStrong(v5, a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __78__CUPairingManager_updatePairedPeersWithGroupID_groupInfo_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t __40__CUPairingManager__showWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __39__CUPairingManager_showWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showWithCompletion:", *(_QWORD *)(a1 + 40));
}

uint64_t __57__CUPairingManager__removePairedPeer_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__CUPairingManager_removePairedPeer_options_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removePairedPeer:options:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t __55__CUPairingManager__savePairedPeer_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __54__CUPairingManager_savePairedPeer_options_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_savePairedPeer:options:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t __55__CUPairingManager__findPairedPeer_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __54__CUPairingManager_findPairedPeer_options_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_findPairedPeer:options:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t __58__CUPairingManager__getPairedPeersWithOptions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__CUPairingManager_getPairedPeersWithOptions_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getPairedPeersWithOptions:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __65__CUPairingManager_getPairedPeersWithGroupID_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  const __CFDictionary *v14;
  CFTypeID TypeID;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    v22 = 0;
    goto LABEL_18;
  }
  v23 = v6;
  v24 = v5;
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v9)
    goto LABEL_16;
  v10 = v9;
  v11 = *(_QWORD *)v27;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v27 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      objc_msgSend(v13, "groupInfo");
      v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      TypeID = CFStringGetTypeID();
      CFDictionaryGetTypedValue(v14, CFSTR("groupID"), TypeID, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = *(void **)(a1 + 32);
      v18 = v16;
      v19 = v17;
      if (v18 == v19)
      {

LABEL_12:
        objc_msgSend(v25, "addObject:", v13);
        goto LABEL_14;
      }
      v20 = v19;
      if ((v18 == 0) != (v19 != 0))
      {
        v21 = objc_msgSend(v18, "isEqual:", v19);

        if (v21)
          goto LABEL_12;
      }
      else
      {

      }
LABEL_14:

    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  }
  while (v10);
LABEL_16:

  v7 = v23;
  v5 = v24;
  v22 = v25;
LABEL_18:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __65__CUPairingManager__deletePairingIdentityWithOptions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__CUPairingManager_deletePairingIdentityWithOptions_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deletePairingIdentityWithOptions:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __71__CUPairingManager__getPairingIdentityWithOptions_tryCount_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "code") == 4097 && (v7 = *(unsigned int *)(a1 + 56), v7 <= 9))
  {
    if (gLogCategory_CUPairingManager <= 60)
    {
      if (gLogCategory_CUPairingManager != -1
        || (v8 = _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x3Cu),
            v7 = *(unsigned int *)(a1 + 56),
            v8))
      {
        LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _getPairingIdentityWithOptions:tryCount:completion:]_block_invoke", 0x3Cu, (uint64_t)"### GetPairingIdentity daemon restart...retrying %u of 10\n", v3, v4, v5, v6, v7);
        LODWORD(v7) = *(_DWORD *)(a1 + 56);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_getPairingIdentityWithOptions:tryCount:completion:", *(_QWORD *)(a1 + 48), (v7 + 1), *(_QWORD *)(a1 + 40));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __61__CUPairingManager_getPairingIdentityWithOptions_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getPairingIdentityWithOptions:tryCount:completion:", *(_QWORD *)(a1 + 48), 1, *(_QWORD *)(a1 + 40));
}

uint64_t __30__CUPairingManager_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __37__CUPairingManager__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __37__CUPairingManager__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

+ (id)copySystemPairingIdentifierAndReturnError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v41;
  void *v42;
  _DWORD *v43;
  unsigned int v44;

  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"+[CUPairingManager copySystemPairingIdentifierAndReturnError:]", 0x1Eu, (uint64_t)"CopySystemPairingIdentifier: trying direct", v3, v4, v5, v6, v41);
  }
  v8 = -[CUPairingDaemon initStandalone]([CUPairingDaemon alloc], "initStandalone");
  v44 = -6700;
  v9 = (void *)objc_msgSend(v8, "copyIdentityWithOptions:error:", 4, &v44);
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (gLogCategory_CUPairingManager <= 30
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"+[CUPairingManager copySystemPairingIdentifierAndReturnError:]", 0x1Eu, (uint64_t)"CopySystemPairingIdentifier: direct: %@", v15, v16, v17, v18, (uint64_t)v11);
    }
LABEL_33:
    v39 = v11;
    goto LABEL_34;
  }
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    NSPrintF((uint64_t)"%#m", v12, v13, v14, v15, v16, v17, v18, v44);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"+[CUPairingManager copySystemPairingIdentifierAndReturnError:]", 0x1Eu, (uint64_t)"CopySystemPairingIdentifier: direct failed (error=%@), trying XPC", v20, v21, v22, v23, (uint64_t)v19);

  }
  v43 = 0;
  PairingSessionCreate((uint64_t *)&v43, 0, 0);
  v31 = v43;
  if (v43)
  {
    v43[25] = 12;
    v42 = 0;
    v44 = PairingSessionCopyIdentity((uint64_t)v31, 1, (char **)&v42, 0, 0);
    if (v42)
    {
      v32 = objc_alloc(MEMORY[0x1E0CB3940]);
      v11 = (void *)objc_msgSend(v32, "initWithUTF8String:", v42);
      free(v42);
      CFRelease(v31);
      if (v11)
      {
        if (gLogCategory_CUPairingManager <= 30
          && (gLogCategory_CUPairingManager != -1
           || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
        {
          LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"+[CUPairingManager copySystemPairingIdentifierAndReturnError:]", 0x1Eu, (uint64_t)"CopySystemPairingIdentifier: XPC: %@", v27, v28, v29, v30, (uint64_t)v11);
        }
        goto LABEL_33;
      }
    }
    else
    {
      CFRelease(v31);
    }
  }
  if (gLogCategory_CUPairingManager <= 90
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x5Au)))
  {
    NSPrintF((uint64_t)"%#m", v24, v25, v26, v27, v28, v29, v30, v44);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"+[CUPairingManager copySystemPairingIdentifierAndReturnError:]", 0x5Au, (uint64_t)"### CopySystemPairingIdentifier failed: error=%@", v34, v35, v36, v37, (uint64_t)v33);

  }
  if (a3)
  {
    if (v44)
      v38 = v44;
    else
      v38 = 4294960596;
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], v38, (uint64_t)"CopySystemPairingIdentifier failed", v26, v27, v28, v29, v30, v41);
    v39 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = 0;
  }
LABEL_34:

  return v39;
}

@end
