@implementation AFSecurityConnection

- (AFSecurityConnection)initWithInstanceContext:(id)a3
{
  id v5;
  AFSecurityConnection *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *connectionQueue;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *callbackQueue;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AFSecurityConnection;
  v6 = -[AFSecurityConnection init](&v14, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.assistant.security.connection", v7);

    connectionQueue = v6->_connectionQueue;
    v6->_connectionQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.assistant.security.callback", v10);

    callbackQueue = v6->_callbackQueue;
    v6->_callbackQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v6->_instanceContext, a3);
  }

  return v6;
}

- (AFSecurityConnection)init
{
  return -[AFSecurityConnection initWithInstanceContext:](self, "initWithInstanceContext:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[AFSecurityConnection _invalidateConnection](self, "_invalidateConnection");
  v3.receiver = self;
  v3.super_class = (Class)AFSecurityConnection;
  -[AFSecurityConnection dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  NSObject *connectionQueue;
  _QWORD block[5];

  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__AFSecurityConnection_invalidate__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(connectionQueue, block);
}

- (void)processData:(id)a3 usingProcedure:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *connectionQueue;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    if (a4)
    {
      if (v8)
      {
        connectionQueue = self->_connectionQueue;
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __62__AFSecurityConnection_processData_usingProcedure_completion___block_invoke;
        v13[3] = &unk_1E3A2F350;
        v13[4] = self;
        v14 = v8;
        v16 = a4;
        v15 = v9;
        dispatch_async(connectionQueue, v13);

        goto LABEL_8;
      }
      v11 = 1603;
    }
    else
    {
      v11 = 1600;
    }
    +[AFError errorWithCode:](AFError, "errorWithCode:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFSecurityConnection _dispatchCallbackForProcessedData:error:completion:](self, "_dispatchCallbackForProcessedData:error:completion:", 0, v12, v9);

  }
LABEL_8:

}

- (void)processDataMap:(id)a3 usingProcedure:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *connectionQueue;
  void *v11;
  void *v12;
  void **v13;
  const __CFString **v14;
  void *v15;
  _QWORD block[5];
  id v17;
  id v18;
  int64_t v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    if (a4)
    {
      if (v8)
      {
        connectionQueue = self->_connectionQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __65__AFSecurityConnection_processDataMap_usingProcedure_completion___block_invoke;
        block[3] = &unk_1E3A2F350;
        block[4] = self;
        v17 = v8;
        v19 = a4;
        v18 = v9;
        dispatch_async(connectionQueue, block);

        goto LABEL_8;
      }
      v20 = CFSTR("error");
      +[AFError errorWithCode:](AFError, "errorWithCode:", 1603);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v11;
      v12 = (void *)MEMORY[0x1E0C99D80];
      v13 = &v21;
      v14 = &v20;
    }
    else
    {
      v22 = CFSTR("error");
      +[AFError errorWithCode:](AFError, "errorWithCode:", 1600);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v11;
      v12 = (void *)MEMORY[0x1E0C99D80];
      v13 = (void **)v23;
      v14 = &v22;
    }
    objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFSecurityConnection _dispatchCallbackForProcessedDataMap:errorMap:completion:](self, "_dispatchCallbackForProcessedDataMap:errorMap:completion:", 0, v15, v9);

  }
LABEL_8:

}

- (void)setKeychainValue:(id)a3 forKey:(id)a4 accountIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  OS_dispatch_queue *v14;
  uint64_t v15;
  OS_dispatch_queue *v16;
  id v17;
  void *v18;
  NSObject *connectionQueue;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  OS_dispatch_queue *v30;
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self->_callbackQueue;
  v15 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __77__AFSecurityConnection_setKeychainValue_forKey_accountIdentifier_completion___block_invoke;
  v29[3] = &unk_1E3A32F48;
  v30 = v14;
  v31 = v13;
  v16 = v14;
  v17 = v13;
  v18 = (void *)MEMORY[0x1A1AC0C3C](v29);
  connectionQueue = self->_connectionQueue;
  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __77__AFSecurityConnection_setKeychainValue_forKey_accountIdentifier_completion___block_invoke_3;
  block[3] = &unk_1E3A2CF60;
  v27 = v12;
  v28 = v18;
  block[4] = self;
  v25 = v10;
  v26 = v11;
  v20 = v12;
  v21 = v11;
  v22 = v10;
  v23 = v18;
  dispatch_async(connectionQueue, block);

}

- (void)setInternalAuthAppleConnectServiceTicket:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *v8;
  uint64_t v9;
  OS_dispatch_queue *v10;
  id v11;
  void *v12;
  NSObject *connectionQueue;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  _QWORD v19[4];
  OS_dispatch_queue *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = self->_callbackQueue;
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __76__AFSecurityConnection_setInternalAuthAppleConnectServiceTicket_completion___block_invoke;
  v19[3] = &unk_1E3A32F48;
  v20 = v8;
  v21 = v7;
  v10 = v8;
  v11 = v7;
  v12 = (void *)MEMORY[0x1A1AC0C3C](v19);
  connectionQueue = self->_connectionQueue;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __76__AFSecurityConnection_setInternalAuthAppleConnectServiceTicket_completion___block_invoke_3;
  block[3] = &unk_1E3A36E10;
  v17 = v6;
  v18 = v12;
  block[4] = self;
  v14 = v6;
  v15 = v12;
  dispatch_async(connectionQueue, block);

}

- (void)setInternalAuthSessionToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *v8;
  uint64_t v9;
  OS_dispatch_queue *v10;
  id v11;
  void *v12;
  NSObject *connectionQueue;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  _QWORD v19[4];
  OS_dispatch_queue *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = self->_callbackQueue;
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __63__AFSecurityConnection_setInternalAuthSessionToken_completion___block_invoke;
  v19[3] = &unk_1E3A32F48;
  v20 = v8;
  v21 = v7;
  v10 = v8;
  v11 = v7;
  v12 = (void *)MEMORY[0x1A1AC0C3C](v19);
  connectionQueue = self->_connectionQueue;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __63__AFSecurityConnection_setInternalAuthSessionToken_completion___block_invoke_3;
  block[3] = &unk_1E3A36E10;
  v17 = v6;
  v18 = v12;
  block[4] = self;
  v14 = v6;
  v15 = v12;
  dispatch_async(connectionQueue, block);

}

- (void)internalAuthAppleConnectServiceTicket:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  uint64_t v6;
  OS_dispatch_queue *v7;
  id v8;
  void *v9;
  NSObject *connectionQueue;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  OS_dispatch_queue *v15;
  id v16;

  v4 = a3;
  v5 = self->_callbackQueue;
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__AFSecurityConnection_internalAuthAppleConnectServiceTicket___block_invoke;
  v14[3] = &unk_1E3A2CF88;
  v15 = v5;
  v16 = v4;
  v7 = v5;
  v8 = v4;
  v9 = (void *)MEMORY[0x1A1AC0C3C](v14);
  connectionQueue = self->_connectionQueue;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __62__AFSecurityConnection_internalAuthAppleConnectServiceTicket___block_invoke_3;
  v12[3] = &unk_1E3A36FA0;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  dispatch_async(connectionQueue, v12);

}

- (void)internalAuthSessionToken:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  uint64_t v6;
  OS_dispatch_queue *v7;
  id v8;
  void *v9;
  NSObject *connectionQueue;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  OS_dispatch_queue *v15;
  id v16;

  v4 = a3;
  v5 = self->_callbackQueue;
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__AFSecurityConnection_internalAuthSessionToken___block_invoke;
  v14[3] = &unk_1E3A2CF88;
  v15 = v5;
  v16 = v4;
  v7 = v5;
  v8 = v4;
  v9 = (void *)MEMORY[0x1A1AC0C3C](v14);
  connectionQueue = self->_connectionQueue;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __49__AFSecurityConnection_internalAuthSessionToken___block_invoke_3;
  v12[3] = &unk_1E3A36FA0;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  dispatch_async(connectionQueue, v12);

}

- (id)_connection
{
  NSXPCConnection *connection;
  AFInstanceContext *instanceContext;
  AFInstanceContext *v5;
  AFInstanceContext *v6;
  NSXPCConnection *v7;
  NSXPCConnection *v8;
  NSXPCConnection *v9;
  void *v10;
  NSXPCConnection *v11;
  uint64_t v12;
  NSXPCConnection *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  connection = self->_connection;
  if (!connection)
  {
    instanceContext = self->_instanceContext;
    if (!instanceContext)
    {
      +[AFInstanceContext defaultContext](AFInstanceContext, "defaultContext");
      v5 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue();
      v6 = self->_instanceContext;
      self->_instanceContext = v5;

      instanceContext = self->_instanceContext;
    }
    -[AFInstanceContext createXPCConnectionWithMachServiceName:options:](instanceContext, "createXPCConnectionWithMachServiceName:options:", CFSTR("com.apple.assistant.security"), 0);
    v7 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
    v8 = self->_connection;
    self->_connection = v7;

    -[NSXPCConnection _setQueue:](self->_connection, "_setQueue:", self->_connectionQueue);
    v9 = self->_connection;
    AFSecurityServiceGetXPCInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v9, "setRemoteObjectInterface:", v10);

    objc_initWeak(&location, self);
    v11 = self->_connection;
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __35__AFSecurityConnection__connection__block_invoke;
    v17[3] = &unk_1E3A35AE0;
    objc_copyWeak(&v18, &location);
    -[NSXPCConnection setInterruptionHandler:](v11, "setInterruptionHandler:", v17);
    v13 = self->_connection;
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __35__AFSecurityConnection__connection__block_invoke_2;
    v15[3] = &unk_1E3A35AE0;
    objc_copyWeak(&v16, &location);
    -[NSXPCConnection setInvalidationHandler:](v13, "setInvalidationHandler:", v15);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

- (void)_invalidateConnection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;

  connection = self->_connection;
  if (connection)
  {
    -[NSXPCConnection invalidate](connection, "invalidate");
    v4 = self->_connection;
    self->_connection = 0;

  }
}

- (void)_connectionInterrupted
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v3 = 136315138;
    v4 = "-[AFSecurityConnection _connectionInterrupted]";
    _os_log_error_impl(&dword_19AF50000, v2, OS_LOG_TYPE_ERROR, "%s ", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_connectionInvalidated
{
  NSObject *v3;
  NSObject *connectionQueue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[AFSecurityConnection _connectionInvalidated]";
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s ", buf, 0xCu);
  }
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__AFSecurityConnection__connectionInvalidated__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(connectionQueue, block);
}

- (void)_processData:(id)a3 usingProcedure:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v8 = a3;
  v9 = a5;
  -[AFSecurityConnection _connection](self, "_connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_initWeak(&location, self);
    v11 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __63__AFSecurityConnection__processData_usingProcedure_completion___block_invoke;
    v18[3] = &unk_1E3A2CFD8;
    objc_copyWeak(&v20, &location);
    v12 = v9;
    v19 = v12;
    objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __63__AFSecurityConnection__processData_usingProcedure_completion___block_invoke_2;
    v15[3] = &unk_1E3A2D000;
    objc_copyWeak(&v17, &location);
    v16 = v12;
    objc_msgSend(v13, "processData:usingProcedure:completion:", v8, a4, v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    +[AFError errorWithCode:](AFError, "errorWithCode:", 1606);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFSecurityConnection _dispatchCallbackForProcessedData:error:completion:](self, "_dispatchCallbackForProcessedData:error:completion:", 0, v14, v9);

  }
}

- (void)_processDataMap:(id)a3 usingProcedure:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[AFSecurityConnection _connection](self, "_connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_initWeak(&location, self);
    v11 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __66__AFSecurityConnection__processDataMap_usingProcedure_completion___block_invoke;
    v19[3] = &unk_1E3A2CFD8;
    objc_copyWeak(&v21, &location);
    v12 = v9;
    v20 = v12;
    objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __66__AFSecurityConnection__processDataMap_usingProcedure_completion___block_invoke_2;
    v16[3] = &unk_1E3A2D028;
    objc_copyWeak(&v18, &location);
    v17 = v12;
    objc_msgSend(v13, "processDataMap:usingProcedure:completion:", v8, a4, v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    v23 = CFSTR("error");
    +[AFError errorWithCode:](AFError, "errorWithCode:", 1606);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFSecurityConnection _dispatchCallbackForProcessedDataMap:errorMap:completion:](self, "_dispatchCallbackForProcessedDataMap:errorMap:completion:", 0, v15, v9);

  }
}

- (void)_dispatchCallbackForProcessedData:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *callbackQueue;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__AFSecurityConnection__dispatchCallbackForProcessedData_error_completion___block_invoke;
    block[3] = &unk_1E3A36E10;
    v16 = v10;
    v14 = v8;
    v15 = v9;
    dispatch_async(callbackQueue, block);

  }
}

- (void)_dispatchCallbackForProcessedDataMap:(id)a3 errorMap:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *callbackQueue;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__AFSecurityConnection__dispatchCallbackForProcessedDataMap_errorMap_completion___block_invoke;
    block[3] = &unk_1E3A36E10;
    v16 = v10;
    v14 = v8;
    v15 = v9;
    dispatch_async(callbackQueue, block);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

uint64_t __81__AFSecurityConnection__dispatchCallbackForProcessedDataMap_errorMap_completion___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __75__AFSecurityConnection__dispatchCallbackForProcessedData_error_completion___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __66__AFSecurityConnection__processDataMap_usingProcedure_completion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v7 = CFSTR("error");
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_dispatchCallbackForProcessedDataMap:errorMap:completion:", 0, v6, *(_QWORD *)(a1 + 32));

}

void __66__AFSecurityConnection__processDataMap_usingProcedure_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_dispatchCallbackForProcessedDataMap:errorMap:completion:", v7, v6, *(_QWORD *)(a1 + 32));

}

void __63__AFSecurityConnection__processData_usingProcedure_completion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_dispatchCallbackForProcessedData:error:completion:", 0, v4, *(_QWORD *)(a1 + 32));

}

void __63__AFSecurityConnection__processData_usingProcedure_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_dispatchCallbackForProcessedData:error:completion:", v7, v6, *(_QWORD *)(a1 + 32));

}

uint64_t __46__AFSecurityConnection__connectionInvalidated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
}

void __35__AFSecurityConnection__connection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInterrupted");

}

void __35__AFSecurityConnection__connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInvalidated");

}

void __49__AFSecurityConnection_internalAuthSessionToken___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__AFSecurityConnection_internalAuthSessionToken___block_invoke_2;
    block[3] = &unk_1E3A36E10;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

void __49__AFSecurityConnection_internalAuthSessionToken___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__AFSecurityConnection_internalAuthSessionToken___block_invoke_4;
  v7[3] = &unk_1E3A35B08;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __49__AFSecurityConnection_internalAuthSessionToken___block_invoke_5;
  v5[3] = &unk_1E3A2CFB0;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "internalAuthSessionToken:", v5);

}

uint64_t __49__AFSecurityConnection_internalAuthSessionToken___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __49__AFSecurityConnection_internalAuthSessionToken___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __49__AFSecurityConnection_internalAuthSessionToken___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __62__AFSecurityConnection_internalAuthAppleConnectServiceTicket___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__AFSecurityConnection_internalAuthAppleConnectServiceTicket___block_invoke_2;
    block[3] = &unk_1E3A36E10;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

void __62__AFSecurityConnection_internalAuthAppleConnectServiceTicket___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__AFSecurityConnection_internalAuthAppleConnectServiceTicket___block_invoke_4;
  v7[3] = &unk_1E3A35B08;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __62__AFSecurityConnection_internalAuthAppleConnectServiceTicket___block_invoke_5;
  v5[3] = &unk_1E3A2CFB0;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "internalAuthAppleConnectServiceTicket:", v5);

}

uint64_t __62__AFSecurityConnection_internalAuthAppleConnectServiceTicket___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62__AFSecurityConnection_internalAuthAppleConnectServiceTicket___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62__AFSecurityConnection_internalAuthAppleConnectServiceTicket___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __63__AFSecurityConnection_setInternalAuthSessionToken_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__AFSecurityConnection_setInternalAuthSessionToken_completion___block_invoke_2;
    v6[3] = &unk_1E3A36FA0;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

void __63__AFSecurityConnection_setInternalAuthSessionToken_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__AFSecurityConnection_setInternalAuthSessionToken_completion___block_invoke_4;
  v8[3] = &unk_1E3A35B08;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __63__AFSecurityConnection_setInternalAuthSessionToken_completion___block_invoke_5;
  v6[3] = &unk_1E3A35B08;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "setInternalAuthSessionToken:completion:", v5, v6);

}

uint64_t __63__AFSecurityConnection_setInternalAuthSessionToken_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __63__AFSecurityConnection_setInternalAuthSessionToken_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __63__AFSecurityConnection_setInternalAuthSessionToken_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __76__AFSecurityConnection_setInternalAuthAppleConnectServiceTicket_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __76__AFSecurityConnection_setInternalAuthAppleConnectServiceTicket_completion___block_invoke_2;
    v6[3] = &unk_1E3A36FA0;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

void __76__AFSecurityConnection_setInternalAuthAppleConnectServiceTicket_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__AFSecurityConnection_setInternalAuthAppleConnectServiceTicket_completion___block_invoke_4;
  v8[3] = &unk_1E3A35B08;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __76__AFSecurityConnection_setInternalAuthAppleConnectServiceTicket_completion___block_invoke_5;
  v6[3] = &unk_1E3A35B08;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "setInternalAuthAppleConnectServiceTicket:completion:", v5, v6);

}

uint64_t __76__AFSecurityConnection_setInternalAuthAppleConnectServiceTicket_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__AFSecurityConnection_setInternalAuthAppleConnectServiceTicket_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__AFSecurityConnection_setInternalAuthAppleConnectServiceTicket_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __77__AFSecurityConnection_setKeychainValue_forKey_accountIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __77__AFSecurityConnection_setKeychainValue_forKey_accountIdentifier_completion___block_invoke_2;
    v6[3] = &unk_1E3A36FA0;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

void __77__AFSecurityConnection_setKeychainValue_forKey_accountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__AFSecurityConnection_setKeychainValue_forKey_accountIdentifier_completion___block_invoke_4;
  v10[3] = &unk_1E3A35B08;
  v11 = *(id *)(a1 + 64);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __77__AFSecurityConnection_setKeychainValue_forKey_accountIdentifier_completion___block_invoke_5;
  v8[3] = &unk_1E3A35B08;
  v7 = *(_QWORD *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  objc_msgSend(v4, "setKeychainValue:forKey:accountIdentifier:completion:", v5, v6, v7, v8);

}

uint64_t __77__AFSecurityConnection_setKeychainValue_forKey_accountIdentifier_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__AFSecurityConnection_setKeychainValue_forKey_accountIdentifier_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__AFSecurityConnection_setKeychainValue_forKey_accountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __65__AFSecurityConnection_processDataMap_usingProcedure_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processDataMap:usingProcedure:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t __62__AFSecurityConnection_processData_usingProcedure_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processData:usingProcedure:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t __34__AFSecurityConnection_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
}

@end
