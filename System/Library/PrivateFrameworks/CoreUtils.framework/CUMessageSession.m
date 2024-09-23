@implementation CUMessageSession

- (CUMessageSession)init
{
  CUMessageSession *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CUMessageSession;
  v2 = -[CUMessageSession init](&v4, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUMessageSession;
  }
  return v2;
}

- (CUMessageSession)initWithCoder:(id)a3
{
  id v4;
  CUMessageSession *v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[CUMessageSession init](self, "init");
  if (v5)
  {
    v6 = objc_opt_class();
    NSDecodeObjectIfPresent(v4, CFSTR("lep"), v6, (void **)&v5->_listenerEndpoint);
  }

  return v5;
}

- (CUMessageSession)initWithTemplate:(id)a3
{
  id v4;
  CUMessageSession *v5;
  uint64_t v6;
  NSXPCListenerEndpoint *listenerEndpoint;

  v4 = a3;
  v5 = -[CUMessageSession init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "listenerEndpoint");
    v6 = objc_claimAutoreleasedReturnValue();
    listenerEndpoint = v5->_listenerEndpoint;
    v5->_listenerEndpoint = (NSXPCListenerEndpoint *)v6;

  }
  return v5;
}

- (void)dealloc
{
  LogCategory *ucat;
  objc_super v4;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CUMessageSession;
  -[CUMessageSession dealloc](&v4, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  NSXPCListenerEndpoint *listenerEndpoint;

  listenerEndpoint = self->_listenerEndpoint;
  if (listenerEndpoint)
    objc_msgSend(a3, "encodeObject:forKey:", listenerEndpoint, CFSTR("lep"));
}

- (void)_cleanup
{
  id activateHandler;
  id invalidateHandler;
  id invalidationHandler;
  id registerRequestHandler;
  id sendRequestHandler;

  activateHandler = self->_activateHandler;
  self->_activateHandler = 0;

  invalidateHandler = self->_invalidateHandler;
  self->_invalidateHandler = 0;

  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  registerRequestHandler = self->_registerRequestHandler;
  self->_registerRequestHandler = 0;

  sendRequestHandler = self->_sendRequestHandler;
  self->_sendRequestHandler = 0;

}

- (void)setLabel:(id)a3
{
  id v5;
  uint64_t *p_ucat;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  objc_storeStrong((id *)&self->_label, a3);
  v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  v7 = qword_1EE0655B0;
  v14 = objc_retainAutorelease(v5);
  objc_msgSend(v14, "UTF8String");
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);

}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__CUMessageSession_activate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_ensureXPCStarted
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSXPCListenerEndpoint *v7;
  NSXPCConnection *v8;
  NSXPCConnection *xpcCnx;
  void *v10;
  uint64_t v11;
  void *v12;
  LogCategory *ucat;
  uint64_t v14[5];
  _QWORD v15[5];

  if (!self->_xpcCnx)
  {
    v7 = self->_listenerEndpoint;
    if (v7)
    {
      v8 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v7);
      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = v8;

      -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0735B0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v10);

      -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
      v11 = MEMORY[0x1E0C809B0];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __37__CUMessageSession__ensureXPCStarted__block_invoke;
      v15[3] = &unk_1E25DF2A0;
      v15[4] = self;
      -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v15);
      v14[0] = v11;
      v14[1] = 3221225472;
      v14[2] = (uint64_t)__37__CUMessageSession__ensureXPCStarted__block_invoke_2;
      v14[3] = (uint64_t)&unk_1E25DF2A0;
      v14[4] = (uint64_t)self;
      -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v14);
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE073C18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v12);

      -[NSXPCConnection resume](self->_xpcCnx, "resume");
    }
    else
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 60)
      {
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
            goto LABEL_8;
          ucat = self->_ucat;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUMessageSession _ensureXPCStarted]", 0x3Cu, (uint64_t)"### No XPC listener endpoint\n", v3, v4, v5, v6, v14[0]);
      }
    }
LABEL_8:

  }
}

- (void)_interrupted
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  LogCategory *ucat;
  uint64_t v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  ucat = self->_ucat;
  if (ucat->var0 <= 60)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUMessageSession _interrupted]", 0x3Cu, (uint64_t)"### Interrupted\n", v3, v4, v5, v6, v8);
      return;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CUMessageSession_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidated
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  LogCategory *ucat;
  void (**invalidationHandler)(void);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  LogCategory *v13;
  uint64_t v14;
  uint64_t v15;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateDone)
    return;
  if (!self->_invalidateCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 60)
    {
      if (ucat->var0 != -1)
      {
LABEL_5:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUMessageSession _invalidated]", 0x3Cu, (uint64_t)"### Unexpectedly invalidated\n", v3, v4, v5, v6, v14);
        goto LABEL_7;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
      {
        ucat = self->_ucat;
        goto LABEL_5;
      }
    }
  }
LABEL_7:
  invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler)
    invalidationHandler[2]();
  -[CUMessageSession _cleanup](self, "_cleanup");
  self->_invalidateDone = 1;
  v13 = self->_ucat;
  if (v13->var0 <= 30)
  {
    if (v13->var0 != -1)
    {
LABEL_11:
      LogPrintF((uint64_t)v13, (uint64_t)"-[CUMessageSession _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v9, v10, v11, v12, v15);
      return;
    }
    if (_LogCategory_Initialize((uint64_t)v13, 0x1Eu))
    {
      v13 = self->_ucat;
      goto LABEL_11;
    }
  }
}

- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
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
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__CUMessageSession_registerRequestID_options_handler___block_invoke;
  v15[3] = &unk_1E25DE2C8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(dispatchQueue, v15);

}

- (void)_registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  CUMessageRequestEntry *v11;
  NSMutableDictionary *requestMap;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  NSXPCConnection *xpcCnx;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  CUMessageSession *v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(CUMessageRequestEntry);
  -[CUMessageRequestEntry setHandler:](v11, "setHandler:", v10);

  if (v9)
    -[CUMessageRequestEntry setOptions:](v11, "setOptions:", v9);
  requestMap = self->_requestMap;
  if (!requestMap)
  {
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = self->_requestMap;
    self->_requestMap = v13;

    requestMap = self->_requestMap;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](requestMap, "setObject:forKeyedSubscript:", v11, v8);
  -[CUMessageSession _ensureXPCStarted](self, "_ensureXPCStarted");
  xpcCnx = self->_xpcCnx;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __55__CUMessageSession__registerRequestID_options_handler___block_invoke;
  v21 = &unk_1E25DCCA8;
  v22 = self;
  v23 = v8;
  v16 = v8;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", &v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "remoteRegisterRequestID:options:", v16, v9, v18, v19, v20, v21, v22);

}

- (void)sendRequestID:(id)a3 options:(id)a4 request:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *dispatchQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CUMessageSession_sendRequestID_options_request_responseHandler___block_invoke;
  block[3] = &unk_1E25DCCD0;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(dispatchQueue, block);

}

- (void)_sendRequestID:(id)a3 options:(id)a4 request:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSXPCConnection *xpcCnx;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[CUMessageSession _ensureXPCStarted](self, "_ensureXPCStarted");
  xpcCnx = self->_xpcCnx;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __67__CUMessageSession__sendRequestID_options_request_responseHandler___block_invoke;
  v17[3] = &unk_1E25DD0A8;
  v18 = v10;
  v15 = v10;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "remoteSendRequestID:options:request:responseHandler:", v13, v12, v11, v15);

}

- (void)remoteRequestID:(id)a3 options:(id)a4 request:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  LogCategory *v25;
  LogCategory *ucat;
  id v27;

  v27 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_requestMap, "objectForKeyedSubscript:", v27);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v13;
  if (v13)
  {
    objc_msgSend(v13, "handler");
    v19 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v19;
    if (v19)
    {
      (*(void (**)(uint64_t, id, id, id))(v19 + 16))(v19, v10, v11, v12);
    }
    else
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 60)
      {
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
            goto LABEL_13;
          ucat = self->_ucat;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUMessageSession remoteRequestID:options:request:responseHandler:]", 0x3Cu, (uint64_t)"### No handler for request ID '%@'\n", v20, v21, v22, v23, (uint64_t)v27);
      }
    }
LABEL_13:

    goto LABEL_14;
  }
  v25 = self->_ucat;
  if (v25->var0 <= 60)
  {
    if (v25->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v25, 0x3Cu))
        goto LABEL_14;
      v25 = self->_ucat;
    }
    LogPrintF((uint64_t)v25, (uint64_t)"-[CUMessageSession remoteRequestID:options:request:responseHandler:]", 0x3Cu, (uint64_t)"### No entry for request ID '%@'\n", v14, v15, v16, v17, (uint64_t)v27);
  }
LABEL_14:

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)label
{
  return self->_label;
}

- (id)activateHandler
{
  return self->_activateHandler;
}

- (void)setActivateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)invalidateHandler
{
  return self->_invalidateHandler;
}

- (void)setInvalidateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (void)setListenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_listenerEndpoint, a3);
}

- (id)registerRequestHandler
{
  return self->_registerRequestHandler;
}

- (void)setRegisterRequestHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)sendRequestHandler
{
  return self->_sendRequestHandler;
}

- (void)setSendRequestHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_requestMap, 0);
  objc_storeStrong(&self->_sendRequestHandler, 0);
  objc_storeStrong(&self->_registerRequestHandler, 0);
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_invalidateHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_activateHandler, 0);
}

uint64_t __67__CUMessageSession__sendRequestID_options_request_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    v3 = NSErrorToOSStatusEx(a2, 0);
  else
    v3 = 4294960596;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, v3, 0, 0);
}

uint64_t __66__CUMessageSession_sendRequestID_options_request_responseHandler___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t result;
  uint64_t v11;

  result = a1[4];
  if (!*(_BYTE *)(result + 73))
  {
    v11 = *(_QWORD *)(result + 56);
    if (v11)
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v11 + 16))(*(_QWORD *)(result + 56), a1[5], a1[6], a1[7], a1[8]);
      result = a1[4];
      if (!*(_QWORD *)(result + 40))
        return result;
    }
    else if (!*(_QWORD *)(result + 40))
    {
      result = *(_QWORD *)(result + 64);
      if (*(int *)result > 60)
        return result;
      if (*(_DWORD *)result == -1)
      {
        result = _LogCategory_Initialize(result, 0x3Cu);
        if (!(_DWORD)result)
          return result;
        result = *(_QWORD *)(a1[4] + 64);
      }
      return LogPrintF(result, (uint64_t)"-[CUMessageSession sendRequestID:options:request:responseHandler:]_block_invoke", 0x3Cu, (uint64_t)"### No handler or endpoint to send requests\n", a5, a6, a7, a8, a9);
    }
    return objc_msgSend((id)result, "_sendRequestID:options:request:responseHandler:", a1[5], a1[6], a1[7], a1[8]);
  }
  result = *(_QWORD *)(result + 64);
  if (*(int *)result <= 60)
  {
    if (*(_DWORD *)result != -1)
      return LogPrintF(result, (uint64_t)"-[CUMessageSession sendRequestID:options:request:responseHandler:]_block_invoke", 0x3Cu, (uint64_t)"### SendRequestID '%@' after invalidate\n", a5, a6, a7, a8, a1[5]);
    result = _LogCategory_Initialize(result, 0x3Cu);
    if ((_DWORD)result)
    {
      result = *(_QWORD *)(a1[4] + 64);
      return LogPrintF(result, (uint64_t)"-[CUMessageSession sendRequestID:options:request:responseHandler:]_block_invoke", 0x3Cu, (uint64_t)"### SendRequestID '%@' after invalidate\n", a5, a6, a7, a8, a1[5]);
    }
  }
  return result;
}

void __55__CUMessageSession__registerRequestID_options_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  _BOOL4 v10;
  id v11;

  v3 = a2;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(int **)(v8 + 64);
  v11 = v3;
  if (*v9 <= 60)
  {
    if (*v9 == -1)
    {
      v10 = _LogCategory_Initialize((uint64_t)v9, 0x3Cu);
      v8 = *(_QWORD *)(a1 + 32);
      if (!v10)
        goto LABEL_5;
      v9 = *(int **)(v8 + 64);
    }
    LogPrintF((uint64_t)v9, (uint64_t)"-[CUMessageSession _registerRequestID:options:handler:]_block_invoke", 0x3Cu, (uint64_t)"### RegisterRequestID '%@' failed: %{error}\n", v4, v5, v6, v7, *(_QWORD *)(a1 + 40));
    v8 = *(_QWORD *)(a1 + 32);
  }
LABEL_5:
  objc_msgSend(*(id *)(v8 + 80), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));

}

uint64_t __54__CUMessageSession_registerRequestID_options_handler___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t result;
  uint64_t v11;

  result = a1[4];
  if (*(_BYTE *)(result + 73))
  {
    result = *(_QWORD *)(result + 64);
    if (*(int *)result <= 60)
    {
      if (*(_DWORD *)result != -1)
        return LogPrintF(result, (uint64_t)"-[CUMessageSession registerRequestID:options:handler:]_block_invoke", 0x3Cu, (uint64_t)"### RegisterRequestID '%@' after invalidate\n", a5, a6, a7, a8, a1[5]);
      result = _LogCategory_Initialize(result, 0x3Cu);
      if ((_DWORD)result)
      {
        result = *(_QWORD *)(a1[4] + 64);
        return LogPrintF(result, (uint64_t)"-[CUMessageSession registerRequestID:options:handler:]_block_invoke", 0x3Cu, (uint64_t)"### RegisterRequestID '%@' after invalidate\n", a5, a6, a7, a8, a1[5]);
      }
    }
  }
  else
  {
    v11 = *(_QWORD *)(result + 48);
    if (v11)
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v11 + 16))(*(_QWORD *)(result + 48), a1[5], a1[6], a1[7]);
      result = a1[4];
    }
    if (*(_QWORD *)(result + 40))
    {
      objc_msgSend((id)result, "_registerRequestID:options:handler:", a1[5], a1[6], a1[7]);
      result = a1[4];
    }
    if (!*(_QWORD *)(result + 48) && !*(_QWORD *)(result + 40))
    {
      result = *(_QWORD *)(result + 64);
      if (*(int *)result <= 60)
      {
        if (*(_DWORD *)result == -1)
        {
          result = _LogCategory_Initialize(result, 0x3Cu);
          if (!(_DWORD)result)
            return result;
          result = *(_QWORD *)(a1[4] + 64);
        }
        return LogPrintF(result, (uint64_t)"-[CUMessageSession registerRequestID:options:handler:]_block_invoke", 0x3Cu, (uint64_t)"### No handler or endpoint to register requests\n", a5, a6, a7, a8, a9);
      }
    }
  }
  return result;
}

void __30__CUMessageSession_invalidate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;
  int *v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;

  v8 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v8 + 73))
    return;
  *(_BYTE *)(v8 + 73) = 1;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(int **)(v10 + 64);
  if (*v11 <= 30)
  {
    if (*v11 == -1)
    {
      v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
      v10 = *(_QWORD *)(a1 + 32);
      if (!v12)
        goto LABEL_6;
      v11 = *(int **)(v10 + 64);
    }
    LogPrintF((uint64_t)v11, (uint64_t)"-[CUMessageSession invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidating\n", a5, a6, a7, a8, v19);
    v10 = *(_QWORD *)(a1 + 32);
  }
LABEL_6:
  v13 = *(_QWORD *)(v10 + 24);
  if (v13)
  {
    (*(void (**)(void))(v13 + 16))();
    v10 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v10 + 80), "removeAllObjects");
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 80);
  *(_QWORD *)(v14 + 80) = 0;

  v16 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  if (v16)
  {
    objc_msgSend(v16, "invalidate");
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 88);
    *(_QWORD *)(v17 + 88) = 0;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_invalidated");
  }
}

uint64_t __37__CUMessageSession__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __37__CUMessageSession__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

_QWORD *__28__CUMessageSession_activate__block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = *(_QWORD **)(a1 + 32);
  v3 = result[1];
  if (v3)
  {
    (*(void (**)(_QWORD))(v3 + 16))(result[1]);
    result = *(_QWORD **)(a1 + 32);
  }
  if (result[5])
    return (_QWORD *)objc_msgSend(result, "_ensureXPCStarted");
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
