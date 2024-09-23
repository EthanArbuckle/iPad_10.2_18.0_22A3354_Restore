@implementation AFFlowServiceConnection

- (id)_init
{
  AFFlowServiceConnection *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AFFlowServiceConnection;
  v2 = -[AFFlowServiceConnection init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("AFFlowServiceConnection", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)invokeMethodOnRemoteWithBlock:(id)a3 onError:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__AFFlowServiceConnection_invokeMethodOnRemoteWithBlock_onError___block_invoke;
  block[3] = &unk_1E3A2D470;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (void)_clearConnection
{
  NSObject *v3;
  NSXPCConnection *v4;
  NSXPCConnection *connection;
  int v6;
  const char *v7;
  __int16 v8;
  NSXPCConnection *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    connection = self->_connection;
    v6 = 136315394;
    v7 = "-[AFFlowServiceConnection _clearConnection]";
    v8 = 2112;
    v9 = connection;
    _os_log_debug_impl(&dword_19AF50000, v3, OS_LOG_TYPE_DEBUG, "%s cleared connection: %@", (uint8_t *)&v6, 0x16u);
  }
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v4 = self->_connection;
  self->_connection = 0;

}

- (id)_connection
{
  NSXPCConnection *connection;
  NSObject *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  NSXPCConnection *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _BYTE location[12];
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  connection = self->_connection;
  if (!connection)
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "-[AFFlowServiceConnection _connection]";
      v14 = 2112;
      v15 = 0;
      _os_log_debug_impl(&dword_19AF50000, v4, OS_LOG_TYPE_DEBUG, "%s created new connection: %@", location, 0x16u);
    }
    v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.assistant.flow_service"), 0);
    v6 = self->_connection;
    self->_connection = v5;

    -[NSXPCConnection _setQueue:](self->_connection, "_setQueue:", self->_queue);
    objc_initWeak((id *)location, self);
    v7 = self->_connection;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __38__AFFlowServiceConnection__connection__block_invoke;
    v11[3] = &unk_1E3A35AE0;
    objc_copyWeak(&v12, (id *)location);
    -[NSXPCConnection setInvalidationHandler:](v7, "setInvalidationHandler:", v11);
    v8 = self->_connection;
    AFFlowServiceXPCInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v9);

    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)location);
    connection = self->_connection;
  }
  return connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __38__AFFlowServiceConnection__connection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_clearConnection");

}

void __65__AFFlowServiceConnection_invokeMethodOnRemoteWithBlock_onError___block_invoke(uint64_t a1)
{
  AFSafetyBlock *v2;
  uint64_t v3;
  AFSafetyBlock *v4;
  void *v5;
  AFSafetyBlock *v6;
  void *v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, _QWORD *);
  AFSafetyBlock *v10;
  _QWORD v11[5];
  AFSafetyBlock *v12;
  _QWORD v13[4];
  AFSafetyBlock *v14;
  id v15;
  _QWORD v16[5];

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v2 = [AFSafetyBlock alloc];
  v3 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__AFFlowServiceConnection_invokeMethodOnRemoteWithBlock_onError___block_invoke_2;
  v16[3] = &unk_1E3A313B0;
  v16[4] = *(_QWORD *)(a1 + 32);
  v4 = -[AFSafetyBlock initWithBlock:](v2, "initWithBlock:", v16);
  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __65__AFFlowServiceConnection_invokeMethodOnRemoteWithBlock_onError___block_invoke_3;
  v13[3] = &unk_1E3A32F48;
  v15 = *(id *)(a1 + 40);
  v6 = v4;
  v14 = v6;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 48);
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __65__AFFlowServiceConnection_invokeMethodOnRemoteWithBlock_onError___block_invoke_5;
  v11[3] = &unk_1E3A36FC8;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v9 = *(void (**)(uint64_t, void *, _QWORD *))(v8 + 16);
  v10 = v6;
  v9(v8, v7, v11);

}

_QWORD *__65__AFFlowServiceConnection_invokeMethodOnRemoteWithBlock_onError___block_invoke_2(uint64_t a1)
{
  _QWORD *result;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  result = *(_QWORD **)(a1 + 32);
  if (!result[2])
    return (_QWORD *)objc_msgSend(result, "_clearConnection");
  return result;
}

void __65__AFFlowServiceConnection_invokeMethodOnRemoteWithBlock_onError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[AFFlowServiceConnection invokeMethodOnRemoteWithBlock:onError:]_block_invoke_3";
    v7 = 2112;
    v8 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s Error accessing remote proxy: %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "invoke");

}

void __65__AFFlowServiceConnection_invokeMethodOnRemoteWithBlock_onError___block_invoke_5(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__AFFlowServiceConnection_invokeMethodOnRemoteWithBlock_onError___block_invoke_2_6;
  block[3] = &unk_1E3A36F30;
  v4 = v1;
  dispatch_async(v2, block);

}

uint64_t __65__AFFlowServiceConnection_invokeMethodOnRemoteWithBlock_onError___block_invoke_2_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invoke");
}

+ (id)sharedConnection
{
  if (sharedConnection_onceToken != -1)
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global_2013);
  return (id)sharedConnection_sConnection;
}

void __43__AFFlowServiceConnection_sharedConnection__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AFFlowServiceConnection _init]([AFFlowServiceConnection alloc], "_init");
  v1 = (void *)sharedConnection_sConnection;
  sharedConnection_sConnection = (uint64_t)v0;

}

@end
