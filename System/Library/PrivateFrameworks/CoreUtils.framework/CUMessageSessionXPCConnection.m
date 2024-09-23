@implementation CUMessageSessionXPCConnection

- (void)connectionInvalidated
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUMessageSession <= 20
    && (gLogCategory_CUMessageSession != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMessageSession, 0x14u)))
  {
    v3 = -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier");
    LogPrintF((uint64_t)&gLogCategory_CUMessageSession, (uint64_t)"-[CUMessageSessionXPCConnection connectionInvalidated]", 0x14u, (uint64_t)"XPC connection invalidated from %#{pid}\n", v4, v5, v6, v7, v3);
  }
  self->_invalidated = 1;
  if (self->_server->_deregisterRequestHandler)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = self->_registeredRequestIDs;
    v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          (*((void (**)(void))self->_server->_deregisterRequestHandler + 2))();
        }
        v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
  -[NSMutableSet removeAllObjects](self->_registeredRequestIDs, "removeAllObjects");
}

- (void)remoteRegisterRequestID:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableSet *registeredRequestIDs;
  NSMutableSet *v13;
  NSMutableSet *v14;
  void (**registerRequestHandler)(id, id, id, _QWORD *);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidated)
  {
    if (gLogCategory_CUMessageSession <= 60
      && (gLogCategory_CUMessageSession != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMessageSession, 0x3Cu)))
    {
      -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier");
      LogPrintF((uint64_t)&gLogCategory_CUMessageSession, (uint64_t)"-[CUMessageSessionXPCConnection remoteRegisterRequestID:options:]", 0x3Cu, (uint64_t)"### RegisterRequestID '%@' from %#{pid} after invalidate\n", v8, v9, v10, v11, (uint64_t)v6);
    }
  }
  else if (self->_server->_registerRequestHandler)
  {
    registeredRequestIDs = self->_registeredRequestIDs;
    if (!registeredRequestIDs)
    {
      v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v14 = self->_registeredRequestIDs;
      self->_registeredRequestIDs = v13;

      registeredRequestIDs = self->_registeredRequestIDs;
    }
    -[NSMutableSet addObject:](registeredRequestIDs, "addObject:", v6);
    registerRequestHandler = (void (**)(id, id, id, _QWORD *))self->_server->_registerRequestHandler;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __65__CUMessageSessionXPCConnection_remoteRegisterRequestID_options___block_invoke;
    v20[3] = &unk_1E25DCCF8;
    v20[4] = self;
    v21 = v6;
    registerRequestHandler[2](registerRequestHandler, v21, v7, v20);

  }
  else if (gLogCategory_CUMessageSession <= 60
         && (gLogCategory_CUMessageSession != -1
          || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMessageSession, 0x3Cu)))
  {
    -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier");
    LogPrintF((uint64_t)&gLogCategory_CUMessageSession, (uint64_t)"-[CUMessageSessionXPCConnection remoteRegisterRequestID:options:]", 0x3Cu, (uint64_t)"### RegisterRequestID '%@' from %#{pid} with no handler\n", v16, v17, v18, v19, (uint64_t)v6);
  }

}

- (void)remoteSendRequestID:(id)a3 options:(id)a4 request:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (**sendRequestHandler)(id, id, id, id, id);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  v22 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidated)
  {
    if (gLogCategory_CUMessageSession <= 60
      && (gLogCategory_CUMessageSession != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMessageSession, 0x3Cu)))
    {
      -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier");
      LogPrintF((uint64_t)&gLogCategory_CUMessageSession, (uint64_t)"-[CUMessageSessionXPCConnection remoteSendRequestID:options:request:responseHandler:]", 0x3Cu, (uint64_t)"### SendRequestID '%@' from %#{pid} after invalidate\n", v13, v14, v15, v16, (uint64_t)v22);
    }
  }
  else
  {
    sendRequestHandler = (void (**)(id, id, id, id, id))self->_server->_sendRequestHandler;
    if (sendRequestHandler)
    {
      sendRequestHandler[2](sendRequestHandler, v22, v10, v11, v12);
    }
    else if (gLogCategory_CUMessageSession <= 60
           && (gLogCategory_CUMessageSession != -1
            || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMessageSession, 0x3Cu)))
    {
      -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier");
      LogPrintF((uint64_t)&gLogCategory_CUMessageSession, (uint64_t)"-[CUMessageSessionXPCConnection remoteSendRequestID:options:request:responseHandler:]", 0x3Cu, (uint64_t)"### SendRequestID '%@' from %#{pid} with no handler\n", v18, v19, v20, v21, (uint64_t)v22);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_registeredRequestIDs, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

void __65__CUMessageSessionXPCConnection_remoteRegisterRequestID_options___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8));
  v10 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v10 + 16))
  {
    if (gLogCategory_CUMessageSession <= 60)
    {
      if (gLogCategory_CUMessageSession == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)&gLogCategory_CUMessageSession, 0x3Cu))
          goto LABEL_7;
        v10 = *(_QWORD *)(a1 + 32);
      }
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(v10 + 40), "processIdentifier");
      LogPrintF((uint64_t)&gLogCategory_CUMessageSession, (uint64_t)"-[CUMessageSessionXPCConnection remoteRegisterRequestID:options:]_block_invoke", 0x3Cu, (uint64_t)"### RemoteRequestID '%@' to %#{pid} after invalidate\n", v12, v13, v14, v15, v11);
    }
LABEL_7:
    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v9 + 2))(v9, 4294960573, 0, 0);
    goto LABEL_8;
  }
  v16 = *(void **)(v10 + 40);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __65__CUMessageSessionXPCConnection_remoteRegisterRequestID_options___block_invoke_2;
  v20[3] = &unk_1E25DCCA8;
  v17 = *(id *)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 32);
  v21 = v17;
  v22 = v18;
  objc_msgSend(v16, "remoteObjectProxyWithErrorHandler:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "remoteRequestID:options:request:responseHandler:", *(_QWORD *)(a1 + 40), v7, v8, v9);

LABEL_8:
}

void __65__CUMessageSessionXPCConnection_remoteRegisterRequestID_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  id v11;

  v3 = a2;
  v4 = v3;
  if (gLogCategory_CUMessageSession <= 60)
  {
    v11 = v3;
    if (gLogCategory_CUMessageSession != -1
      || (v10 = _LogCategory_Initialize((uint64_t)&gLogCategory_CUMessageSession, 0x3Cu), v4 = v11, v10))
    {
      v5 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "processIdentifier");
      LogPrintF((uint64_t)&gLogCategory_CUMessageSession, (uint64_t)"-[CUMessageSessionXPCConnection remoteRegisterRequestID:options:]_block_invoke_2", 0x3Cu, (uint64_t)"### RemoteRequestID '%@' to %#{pid} failed: %{error}\n", v6, v7, v8, v9, v5);
      v4 = v11;
    }
  }

}

@end
