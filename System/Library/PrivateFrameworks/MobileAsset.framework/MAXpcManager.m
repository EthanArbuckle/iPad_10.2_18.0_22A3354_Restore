@implementation MAXpcManager

- (void)sendAsync:(id)a3 clientHandler:(id)a4 taskDescriptor:(id)a5 withRetry:(BOOL)a6 retryInitialReconnectionCount:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *stateQueue;
  id v21;
  id v22;
  id v23;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  _QWORD *v28;
  unint64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;
  MAXpcManager *v33;
  id v34;
  _QWORD *v35;
  id v36;
  BOOL v37;
  id location;
  _QWORD v39[5];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0;
  -[MAXpcManager setClientName:](self, "setClientName:", v12);
  objc_initWeak(&location, self);
  v15 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __95__MAXpcManager_sendAsync_clientHandler_taskDescriptor_withRetry_retryInitialReconnectionCount___block_invoke;
  v30[3] = &unk_1E5D5DE38;
  v37 = a6;
  v35 = v39;
  objc_copyWeak(&v36, &location);
  v16 = v12;
  v31 = v16;
  v17 = v13;
  v33 = self;
  v34 = v17;
  v32 = v14;
  v18 = v14;
  v19 = (void *)MEMORY[0x1AF44EFD8](v30);
  stateQueue = self->_stateQueue;
  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __95__MAXpcManager_sendAsync_clientHandler_taskDescriptor_withRetry_retryInitialReconnectionCount___block_invoke_4;
  block[3] = &unk_1E5D5DE88;
  block[4] = self;
  v25 = v16;
  v28 = v39;
  v29 = a7;
  v26 = v19;
  v27 = v17;
  v21 = v17;
  v22 = v19;
  v23 = v16;
  dispatch_async(stateQueue, block);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);
  _Block_object_dispose(v39, 8);
}

- (void)sendAsync:(id)a3 clientHandler:(id)a4 taskDescriptor:(id)a5 withRetry:(BOOL)a6
{
  -[MAXpcManager sendAsync:clientHandler:taskDescriptor:withRetry:retryInitialReconnectionCount:](self, "sendAsync:clientHandler:taskDescriptor:withRetry:retryInitialReconnectionCount:", a3, a4, a5, a6, 0);
}

- (void)sendAsync:(id)a3 clientHandler:(id)a4 taskDescriptor:(id)a5
{
  -[MAXpcManager sendAsync:clientHandler:taskDescriptor:withRetry:](self, "sendAsync:clientHandler:taskDescriptor:withRetry:", a3, a4, a5, 1);
}

- (MAXpcManager)initWithServiceName:(id)a3 callbackQueue:(id)a4
{
  id v7;
  id v8;
  void *v9;
  MAXpcManager *v10;
  MAXpcManager *v11;
  id v12;
  const char *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *stateQueue;
  id v17;
  const char *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *progressQueue;
  uint64_t v22;
  NSMutableDictionary *progressHandlers;
  MAXpcConnection *maConnection;
  NSMutableArray *postConnectionRetryCallbacks;
  objc_super v27;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v27.receiver = self;
    v27.super_class = (Class)MAXpcManager;
    v11 = -[MAXpcManager init](&v27, sel_init);
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v7, CFSTR(".maxpcmanager.state"));
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v13 = (const char *)objc_msgSend(v12, "UTF8String");
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = dispatch_queue_create(v13, v14);
      stateQueue = v11->_stateQueue;
      v11->_stateQueue = (OS_dispatch_queue *)v15;

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v7, CFSTR(".maxpcmanager.progress"));
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v18 = (const char *)objc_msgSend(v17, "UTF8String");
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = dispatch_queue_create(v18, v19);
      progressQueue = v11->_progressQueue;
      v11->_progressQueue = (OS_dispatch_queue *)v20;

      objc_storeStrong((id *)&v11->_callbackQueue, a4);
      objc_storeStrong((id *)&v11->_serviceName, a3);
      v22 = objc_opt_new();
      progressHandlers = v11->_progressHandlers;
      v11->_progressHandlers = (NSMutableDictionary *)v22;

      maConnection = v11->_maConnection;
      v11->_maConnection = 0;

      postConnectionRetryCallbacks = v11->_postConnectionRetryCallbacks;
      v11->_connectionRetryCount = 1;
      v11->_postConnectionRetryCallbacks = 0;

    }
    self = v11;
    v10 = self;
  }

  return v10;
}

- (void)setClientConnectionHandler
{
  _xpc_connection_s *v3;
  _QWORD handler[5];

  -[MAXpcConnection connection](self->_maConnection, "connection");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __42__MAXpcManager_setClientConnectionHandler__block_invoke;
  handler[3] = &unk_1E5D5DED8;
  handler[4] = self;
  xpc_connection_set_event_handler(v3, handler);

}

void __95__MAXpcManager_sendAsync_clientHandler_taskDescriptor_withRetry_retryInitialReconnectionCount___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD block[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  objc_msgSend(*(id *)(a1 + 32), "ensureConnection");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v2, "connectionId");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v3, "connectionIdentifier", (const char *)objc_msgSend(v4, "UTF8String"));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __95__MAXpcManager_sendAsync_clientHandler_taskDescriptor_withRetry_retryInitialReconnectionCount___block_invoke_5;
    v25[3] = &unk_1E5D5DE60;
    v30 = &v31;
    v7 = v5;
    v26 = v7;
    v27 = *(id *)(a1 + 40);
    v8 = v6;
    v28 = v8;
    v29 = *(id *)(a1 + 48);
    v9 = MEMORY[0x1AF44EFD8](v25);
    v14 = (void *)v9;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) <= *(_QWORD *)(a1 + 72))
    {
      _MobileAssetLog(0, 6, (uint64_t)"-[MAXpcManager sendAsync:clientHandler:taskDescriptor:withRetry:retryInitialReconnectionCount:]_block_invoke_4", CFSTR("Need to wait to retry message send: originalReconnectionCount = %llu, currentReconnectionCount = %llu"), v10, v11, v12, v13, *(_QWORD *)(a1 + 72));
      if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)(a1 + 32);
        v19 = *(void **)(v18 + 64);
        *(_QWORD *)(v18 + 64) = v17;

      }
      *((_BYTE *)v32 + 24) = 1;
      v20 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
      v21 = (void *)objc_msgSend(v14, "copy");
      objc_msgSend(v20, "addObject:", v21);

    }
    else
    {
      (*(void (**)(uint64_t))(v9 + 16))(v9);
    }

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 40), "Result", 1);
    v15 = *(void **)(a1 + 56);
    if (!v15)
      return;
    v16 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__MAXpcManager_sendAsync_clientHandler_taskDescriptor_withRetry_retryInitialReconnectionCount___block_invoke_6;
    block[3] = &unk_1E5D5CD38;
    v24 = v15;
    v23 = *(id *)(a1 + 40);
    dispatch_async(v16, block);

    v7 = v24;
  }

}

void __73__MAXpcManager_sendSync_gettingResponseCode_codeForXpcError_loggingName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _xpc_connection_s *v9;
  xpc_object_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _xpc_connection_s *v21;
  xpc_object_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;

  objc_msgSend(*(id *)(a1 + 32), "ensureConnection");
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v6)
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v6, "connectionId");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v7, "connectionIdentifier", (const char *)objc_msgSend(v8, "UTF8String"));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "connection");
    v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v10 = xpc_connection_send_message_with_reply_sync(v9, *(xpc_object_t *)(a1 + 40));
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v13 = MEMORY[0x1AF44F218](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v18 = MEMORY[0x1E0C81310];
    if (v13 != MEMORY[0x1E0C81310])
      return;
    v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v19 == MEMORY[0x1E0C81258])
    {
      _MobileAssetLog(0, 6, (uint64_t)"-[MAXpcManager sendSync:gettingResponseCode:codeForXpcError:loggingName:]_block_invoke", CFSTR("%@ mobileassetd connection interrupted - retrying sync message: %@"), v14, v15, v16, v17, *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "connection");
      v21 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      v22 = xpc_connection_send_message_with_reply_sync(v21, *(xpc_object_t *)(a1 + 40));
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v24 = *(void **)(v23 + 40);
      *(_QWORD *)(v23 + 40) = v22;

      if (MEMORY[0x1AF44F218](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)) != v18)
        return;
      v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    }
    if (v19 == MEMORY[0x1E0C81260])
      objc_msgSend(*(id *)(a1 + 32), "clearConnection:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    _MobileAssetLog(0, 6, (uint64_t)"-[MAXpcManager sendSync:gettingResponseCode:codeForXpcError:loggingName:]_block_invoke", CFSTR("No active XPC connection to mobileassetd"), v2, v3, v4, v5, v25);
    v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v20)
      xpc_dictionary_set_int64(v20, "Result", 1);
  }
}

- (void)ensureConnection
{
  MAXpcConnection *v3;
  MAXpcConnection *maConnection;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _xpc_connection_s *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (self->_serviceName && !self->_maConnection)
  {
    v3 = -[MAXpcConnection initWithServiceName:]([MAXpcConnection alloc], "initWithServiceName:", self->_serviceName);
    maConnection = self->_maConnection;
    self->_maConnection = v3;

    if (self->_maConnection)
    {
      -[MAXpcManager setClientConnectionHandler](self, "setClientConnectionHandler");
      -[MAXpcConnection connection](self->_maConnection, "connection");
      v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_activate(v9);

      -[MAXpcConnection connectionId](self->_maConnection, "connectionId");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      _MobileAssetLog(0, 6, (uint64_t)"-[MAXpcManager ensureConnection]", CFSTR("Creating client/daemon connection: %@"), v10, v11, v12, v13, (uint64_t)v14);

    }
    else
    {
      _MobileAssetLog(0, 3, (uint64_t)"-[MAXpcManager ensureConnection]", CFSTR("Could not ensure maConnection, xpc communication will fail"), v5, v6, v7, v8, v15);
    }
  }
}

void __95__MAXpcManager_sendAsync_clientHandler_taskDescriptor_withRetry_retryInitialReconnectionCount___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    _MobileAssetLog(0, 6, (uint64_t)"-[MAXpcManager sendAsync:clientHandler:taskDescriptor:withRetry:retryInitialReconnectionCount:]_block_invoke_5", CFSTR("Retrying message send"), a5, a6, a7, a8, v9);
  xpc_connection_send_message_with_reply(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40), *(dispatch_queue_t *)(a1 + 48), *(xpc_handler_t *)(a1 + 56));
}

- (id)sendSync:(id)a3 gettingResponseCode:(int64_t *)a4 codeForXpcError:(int64_t)int64 loggingName:(id)a6
{
  id v10;
  id v11;
  NSObject *stateQueue;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  id v21;
  _QWORD block[5];
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v10 = a3;
  v11 = a6;
  -[MAXpcManager setClientName:](self, "setClientName:", v10);
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3;
  v31 = __Block_byref_object_dispose__3;
  v32 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__MAXpcManager_sendSync_gettingResponseCode_codeForXpcError_loggingName___block_invoke;
  block[3] = &unk_1E5D5DDE8;
  block[4] = self;
  v13 = v10;
  v24 = v13;
  v26 = &v27;
  v14 = v11;
  v25 = v14;
  dispatch_sync(stateQueue, block);
  if (v28[5])
  {
    v15 = MEMORY[0x1AF44F218]();
    if (v15 == MEMORY[0x1E0C812F8])
    {
      int64 = xpc_dictionary_get_int64((xpc_object_t)v28[5], "Result");
      if (!a4)
        goto LABEL_9;
      goto LABEL_8;
    }
    if (v15 == MEMORY[0x1E0C81310])
      v20 = CFSTR("%@ Received XPC error for message sent to mobileassetd");
    else
      v20 = CFSTR("%@ Received XPC error for message sent to mobileassetd: unexpected xpc type for reply");
    _MobileAssetLog(0, 6, (uint64_t)"-[MAXpcManager sendSync:gettingResponseCode:codeForXpcError:loggingName:]", v20, v16, v17, v18, v19, (uint64_t)v14);
  }
  if (a4)
LABEL_8:
    *a4 = int64;
LABEL_9:
  v21 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v21;
}

- (void)setClientName:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%s"), getprogname());
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_string(v4, "clientName", (const char *)objc_msgSend(v5, "UTF8String"));

}

void __95__MAXpcManager_sendAsync_clientHandler_taskDescriptor_withRetry_retryInitialReconnectionCount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id WeakRetained;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD block[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v3 = a2;
  if (MEMORY[0x1AF44F218]() == MEMORY[0x1E0C81310])
  {
    if (v3 == (id)MEMORY[0x1E0C81258])
    {
      if (*(_BYTE *)(a1 + 80))
      {
        _MobileAssetLog(0, 6, (uint64_t)"-[MAXpcManager sendAsync:clientHandler:taskDescriptor:withRetry:retryInitialReconnectionCount:]_block_invoke", CFSTR("Retrying message (original _connectionRetryCount: %llu"), v4, v5, v6, v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
        objc_msgSend(WeakRetained, "sendAsync:clientHandler:taskDescriptor:withRetry:retryInitialReconnectionCount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));

        goto LABEL_6;
      }
    }
    else if (v3 == (id)MEMORY[0x1E0C81260])
    {
      v13 = *(_QWORD *)(a1 + 48);
      v14 = *(NSObject **)(v13 + 16);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __95__MAXpcManager_sendAsync_clientHandler_taskDescriptor_withRetry_retryInitialReconnectionCount___block_invoke_2;
      v18[3] = &unk_1E5D5DE10;
      v18[4] = v13;
      v19 = *(id *)(a1 + 32);
      dispatch_async(v14, v18);

    }
    else
    {
      _MobileAssetLog(0, 6, (uint64_t)"-[MAXpcManager sendAsync:clientHandler:taskDescriptor:withRetry:retryInitialReconnectionCount:]_block_invoke", CFSTR("xpc error that can be ignored"), v4, v5, v6, v7, v15);
    }
  }
  v8 = *(_QWORD *)(a1 + 56);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  v9 = *(void **)(a1 + 40);
  if (v9)
  {
    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(NSObject **)(v10 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__MAXpcManager_sendAsync_clientHandler_taskDescriptor_withRetry_retryInitialReconnectionCount___block_invoke_3;
    block[3] = &unk_1E5D5DE10;
    block[4] = v10;
    v17 = v9;
    dispatch_async(v11, block);

  }
LABEL_6:

}

- (void)clearConnection:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  MAXpcConnection *v13;
  const char *string;
  void *v15;
  MAXpcConnection *maConnection;
  void *v17;
  int v18;
  uint64_t v19;
  xpc_object_t xdict;

  xdict = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (!self->_maConnection)
  {
    _MobileAssetLog(0, 6, (uint64_t)"-[MAXpcManager clearConnection:]", CFSTR("Connection invalid, connection already nil so ignoring"), v4, v5, v6, v7, v19);
    goto LABEL_13;
  }
  _MobileAssetLog(0, 3, (uint64_t)"-[MAXpcManager clearConnection:]", CFSTR("Connection invalid, checking connection"), v4, v5, v6, v7, v19);
  if (xdict && !-[MAXpcConnection notValid](self->_maConnection, "notValid"))
  {
    string = xpc_dictionary_get_string(xdict, "connectionIdentifier");
    if (string)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      maConnection = self->_maConnection;
      if (maConnection && v15)
      {
        -[MAXpcConnection connectionId](maConnection, "connectionId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", v15);

        if (!v18)
          goto LABEL_13;
        goto LABEL_4;
      }
    }
    else
    {
      v15 = 0;
    }

    goto LABEL_13;
  }
LABEL_4:
  -[MAXpcConnection connectionId](self->_maConnection, "connectionId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _MobileAssetLog(0, 6, (uint64_t)"-[MAXpcManager clearConnection:]", CFSTR("connection cleared: %@"), v9, v10, v11, v12, (uint64_t)v8);

  v13 = self->_maConnection;
  self->_maConnection = 0;

LABEL_13:
}

uint64_t __95__MAXpcManager_sendAsync_clientHandler_taskDescriptor_withRetry_retryInitialReconnectionCount___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clearConnection:", *(_QWORD *)(a1 + 40));
}

void __95__MAXpcManager_sendAsync_clientHandler_taskDescriptor_withRetry_retryInitialReconnectionCount___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }
}

uint64_t __95__MAXpcManager_sendAsync_clientHandler_taskDescriptor_withRetry_retryInitialReconnectionCount___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __42__MAXpcManager_setClientConnectionHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15[5];
  _QWORD v16[5];

  v3 = a2;
  v4 = MEMORY[0x1AF44F218]();
  if (v4 == MEMORY[0x1E0C812E0])
  {
    v9 = CFSTR("The client got a connection request");
    v10 = 6;
    goto LABEL_7;
  }
  if (v4 == MEMORY[0x1E0C81310])
  {
    if (v3 == (id)MEMORY[0x1E0C81260])
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(NSObject **)(v11 + 16);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __42__MAXpcManager_setClientConnectionHandler__block_invoke_2;
      v16[3] = &unk_1E5D5DEB0;
      v16[4] = v11;
      v13 = v16;
    }
    else
    {
      if (v3 == (id)MEMORY[0x1E0C81288])
      {
        v9 = CFSTR("termination imminent");
        goto LABEL_5;
      }
      if (v3 != (id)MEMORY[0x1E0C81258])
      {
        v9 = CFSTR("Unknown Error");
        goto LABEL_5;
      }
      _MobileAssetLog(0, 5, (uint64_t)"-[MAXpcManager setClientConnectionHandler]_block_invoke", CFSTR("MobileAsset XPC connection interrupted"), v5, v6, v7, v8, v15[0]);
      v14 = *(_QWORD *)(a1 + 32);
      v12 = *(NSObject **)(v14 + 16);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = (uint64_t)__42__MAXpcManager_setClientConnectionHandler__block_invoke_3;
      v15[3] = (uint64_t)&unk_1E5D5DEB0;
      v15[4] = v14;
      v13 = v15;
    }
    dispatch_async(v12, v13);
    goto LABEL_8;
  }
  if (v4 != MEMORY[0x1E0C812F8])
  {
    v9 = CFSTR("Client connection handler received unknown");
LABEL_5:
    v10 = 3;
LABEL_7:
    _MobileAssetLog(0, v10, (uint64_t)"-[MAXpcManager setClientConnectionHandler]_block_invoke", v9, v5, v6, v7, v8, v15[0]);
    goto LABEL_8;
  }
  if (xpc_dictionary_get_int64(v3, "messageAction") == 11)
    objc_msgSend(*(id *)(a1 + 32), "notifyClientsOfProgress:", v3);
LABEL_8:

}

uint64_t __42__MAXpcManager_setClientConnectionHandler__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clearConnection:", 0);
}

uint64_t __42__MAXpcManager_setClientConnectionHandler__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _MobileAssetLog(0, 6, (uint64_t)"-[MAXpcManager setClientConnectionHandler]_block_invoke_3", CFSTR("Incrementing _connectionRetryCount: %llu"), a5, a6, a7, a8, ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++) + 16))();
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeAllObjects");
}

- (void)notifyClientsOfProgress:(id)a3
{
  id v4;
  NSObject *progressQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  MAXpcManager *v9;

  v4 = a3;
  progressQueue = self->_progressQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__MAXpcManager_notifyClientsOfProgress___block_invoke;
  v7[3] = &unk_1E5D5DE10;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(progressQueue, v7);

}

void __40__MAXpcManager_notifyClientsOfProgress___block_invoke(uint64_t a1)
{
  void *v2;
  int64_t int64;
  int64_t v4;
  const char *string;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  __CFString *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1AF44EE58]();
  int64 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "TotalExpected");
  v4 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "totalWritten");
  string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "taskDescriptor");
  if (!string)
  {
    _MobileAssetLog(0, 5, (uint64_t)"-[MAXpcManager notifyClientsOfProgress:]_block_invoke", CFSTR("Skipping progress notification for empty task descriptor char"), v6, v7, v8, v9, v40);
    v14 = 0;
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v32 = CFSTR("Skipping progress notification for empty task descriptor");
LABEL_12:
    _MobileAssetLog(0, 5, (uint64_t)"-[MAXpcManager notifyClientsOfProgress:]_block_invoke", v32, v10, v11, v12, v13, v40);
    goto LABEL_27;
  }
  v15 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
  if (!v15)
  {
    v32 = CFSTR("Notified of progress while not having any registered progress handlers");
    goto LABEL_12;
  }
  objc_msgSend(v15, "objectForKey:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = v16;
    objc_msgSend(v16, "callBackArray");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v23 = (void *)v18;
      v24 = (void *)objc_opt_new();
      if (v24)
      {
        v29 = v24;
        objc_msgSend(v24, "setTotalWritten:", v4);
        objc_msgSend(v29, "setTotalExpected:", int64);
        objc_msgSend(v29, "setExpectedTimeRemaining:", xpc_dictionary_get_double(*(xpc_object_t *)(a1 + 32), "TimeEstimate"));
        objc_msgSend(v29, "setIsStalled:", xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "IsStalled"));
        v30 = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "TaskID");
        if (v30)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v30, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setTaskDescription:", v31);

        }
        else
        {
          objc_msgSend(v29, "setTaskDescription:");
        }
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v33 = v23;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v41;
          do
          {
            v37 = 0;
            do
            {
              if (*(_QWORD *)v41 != v36)
                objc_enumerationMutation(v33);
              v38 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v37);
              v39 = (void *)MEMORY[0x1AF44EE58](v34);
              if (v38)
                (*(void (**)(uint64_t, void *))(v38 + 16))(v38, v29);
              objc_autoreleasePoolPop(v39);
              ++v37;
            }
            while (v35 != v37);
            v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
            v35 = v34;
          }
          while (v34);
        }

      }
      else
      {
        _MobileAssetLog(0, 5, (uint64_t)"-[MAXpcManager notifyClientsOfProgress:]_block_invoke", CFSTR("Skipping progress notification as object could not be allocated"), v25, v26, v27, v28, v40);

      }
    }
    else
    {
      _MobileAssetLog(0, 5, (uint64_t)"-[MAXpcManager notifyClientsOfProgress:]_block_invoke", CFSTR("Skipping progress notification for empty callBack array"), v19, v20, v21, v22, v40);
    }

  }
LABEL_27:

  objc_autoreleasePoolPop(v2);
}

- (void)attachProgressHandler:(id)a3 assetId:(id)a4 callBack:(id)a5 withPurpose:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *progressQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  MAXpcManager *v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  progressQueue = self->_progressQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__MAXpcManager_attachProgressHandler_assetId_callBack_withPurpose___block_invoke;
  block[3] = &unk_1E5D5DF00;
  v20 = v10;
  v21 = v11;
  v22 = v13;
  v23 = self;
  v24 = v12;
  v15 = v12;
  v16 = v13;
  v17 = v11;
  v18 = v10;
  dispatch_async(progressQueue, block);

}

void __67__MAXpcManager_attachProgressHandler_assetId_callBack_withPurpose___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  void *v10;
  void *v11;
  MAProgressHandler *v12;
  id v13;

  normalizedAssetType(*(_QWORD *)(a1 + 32), a2, a3, a4, a5, a6, a7, a8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  assembleTaskDescriptorWithPurpose((uint64_t)v9, *(_QWORD *)(a1 + 40), *(void **)(a1 + 48));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 48), "objectForKey:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "addCallBack:", *(_QWORD *)(a1 + 64));
  }
  else
  {
    v12 = -[MAProgressHandler initWithCallBack:]([MAProgressHandler alloc], "initWithCallBack:", *(_QWORD *)(a1 + 64));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 48), "setObject:forKey:", v12, v13);

  }
}

- (void)restoreProgressCallbacks:(id)a3 assetType:(id)a4 assetId:(id)a5 withPurpose:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *progressQueue;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  MAXpcManager *v19;
  id v20;

  v14 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v14 && objc_msgSend(v14, "count"))
  {
    progressQueue = self->_progressQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__MAXpcManager_restoreProgressCallbacks_assetType_assetId_withPurpose___block_invoke;
    block[3] = &unk_1E5D5DF28;
    v16 = v10;
    v17 = v11;
    v18 = v12;
    v19 = self;
    v20 = v14;
    dispatch_sync(progressQueue, block);

  }
}

void __71__MAXpcManager_restoreProgressCallbacks_assetType_assetId_withPurpose___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  MAProgressHandler *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  normalizedAssetType(*(_QWORD *)(a1 + 32), a2, a3, a4, a5, a6, a7, a8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  assembleTaskDescriptorWithPurpose((uint64_t)v9, *(_QWORD *)(a1 + 40), *(void **)(a1 + 48));
  v10 = objc_claimAutoreleasedReturnValue();

  v23 = (void *)v10;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 48), "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = a1;
  v13 = *(id *)(a1 + 64);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v17);
        if (v11)
        {
          objc_msgSend(v11, "callBackArray");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)MEMORY[0x1AF44EFD8](v18);
          v21 = objc_msgSend(v19, "containsObject:", v20);

          if ((v21 & 1) == 0)
            objc_msgSend(v11, "addCallBack:", v18);
        }
        else
        {
          v22 = -[MAProgressHandler initWithCallBack:]([MAProgressHandler alloc], "initWithCallBack:", v18);
          objc_msgSend(*(id *)(*(_QWORD *)(v12 + 56) + 48), "setObject:forKey:", v22, v23);

        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v15);
  }

}

- (id)progressCallbacksForAssetType:(id)a3 assetId:(id)a4 withPurpose:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *progressQueue;
  id v21;
  void *v22;
  void *v23;
  _QWORD block[5];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__3;
  v32 = __Block_byref_object_dispose__3;
  v33 = 0;
  normalizedAssetType((uint64_t)v8, v11, v12, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  assembleTaskDescriptorWithPurpose((uint64_t)v18, (uint64_t)v9, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  progressQueue = self->_progressQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MAXpcManager_progressCallbacksForAssetType_assetId_withPurpose___block_invoke;
  block[3] = &unk_1E5D5DB58;
  v27 = &v28;
  block[4] = self;
  v21 = v19;
  v26 = v21;
  dispatch_sync(progressQueue, block);
  v22 = (void *)v29[5];
  if (v22)
  {
    objc_msgSend(v22, "callBackArray");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }

  _Block_object_dispose(&v28, 8);
  return v23;
}

void __66__MAXpcManager_progressCallbacksForAssetType_assetId_withPurpose___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 48), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postConnectionRetryCallbacks, 0);
  objc_storeStrong((id *)&self->_progressHandlers, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_progressQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_maConnection, 0);
}

@end
