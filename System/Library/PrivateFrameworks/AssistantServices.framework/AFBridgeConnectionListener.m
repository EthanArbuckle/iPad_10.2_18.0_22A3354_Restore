@implementation AFBridgeConnectionListener

- (AFBridgeConnectionListener)initWithBridgeName:(id)a3 machService:(id)a4 withServiceInterface:(id)a5 withDelegateInterface:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AFBridgeConnectionListener *v15;
  AFBridgeConnectionListener *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  uint64_t v20;
  NSXPCListener *listener;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)AFBridgeConnectionListener;
  v15 = -[AFBridgeConnectionListener init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_bridgeName, a3);
    objc_storeStrong((id *)&v16->_machServiceName, a4);
    objc_storeStrong((id *)&v16->_exportedInterface, a5);
    objc_storeStrong((id *)&v16->_remoteInterface, a6);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("AFBridgeConnectionListener", v17);

    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v18;

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", v12);
    listener = v16->_listener;
    v16->_listener = (NSXPCListener *)v20;

    -[NSXPCListener setDelegate:](v16->_listener, "setDelegate:", v16);
  }

  return v16;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSString *machServiceName;
  void *v10;
  int v11;
  uint64_t v12;
  NSObject *queue;
  id v14;
  NSObject *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  AFBridgeConnectionListener *v21;
  id v22;
  _QWORD v23[5];
  int v24;
  _QWORD v25[5];
  int v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  NSString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    machServiceName = self->_machServiceName;
    *(_DWORD *)buf = 136315394;
    v28 = "-[AFBridgeConnectionListener listener:shouldAcceptNewConnection:]";
    v29 = 2112;
    v30 = machServiceName;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s Incoming connection request for: %@", buf, 0x16u);
  }
  objc_msgSend(v7, "valueForEntitlement:", self->_machServiceName);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v7, "setExportedInterface:", self->_exportedInterface);
    objc_msgSend(v7, "setExportedObject:", self->_bridgeProxy);
    objc_msgSend(v7, "setRemoteObjectInterface:", self->_remoteInterface);
    v11 = objc_msgSend(v7, "processIdentifier");
    v12 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __65__AFBridgeConnectionListener_listener_shouldAcceptNewConnection___block_invoke;
    v25[3] = &unk_1E3A333B0;
    v26 = v11;
    v25[4] = self;
    objc_msgSend(v7, "setInvalidationHandler:", v25);
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __65__AFBridgeConnectionListener_listener_shouldAcceptNewConnection___block_invoke_2;
    v23[3] = &unk_1E3A333B0;
    v24 = v11;
    v23[4] = self;
    objc_msgSend(v7, "setInterruptionHandler:", v23);
    queue = self->_queue;
    v17 = v12;
    v18 = 3221225472;
    v19 = __65__AFBridgeConnectionListener_listener_shouldAcceptNewConnection___block_invoke_3;
    v20 = &unk_1E3A36FC8;
    v21 = self;
    v14 = v7;
    v22 = v14;
    dispatch_async(queue, &v17);
    objc_msgSend(v14, "resume", v17, v18, v19, v20, v21);

  }
  else
  {
    v15 = AFSiriLogContextDaemon;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[AFBridgeConnectionListener listener:shouldAcceptNewConnection:]";
      _os_log_error_impl(&dword_19AF50000, v15, OS_LOG_TYPE_ERROR, "%s Entitlement missing on incoming connection request", buf, 0xCu);
    }
  }

  return v10 != 0;
}

- (void)resumeConnectionWithBridgeProxy:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__AFBridgeConnectionListener_resumeConnectionWithBridgeProxy___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)notifyClientWithBlock:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__AFBridgeConnectionListener_notifyClientWithBlock___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (NSString)bridgeName
{
  return self->_bridgeName;
}

- (void)setBridgeName:(id)a3
{
  objc_storeStrong((id *)&self->_bridgeName, a3);
}

- (AFBridgeConnectionListenerDelegate)delegate
{
  return (AFBridgeConnectionListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bridgeName, 0);
  objc_storeStrong(&self->_bridgeProxy, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_remoteInterface, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

void __52__AFBridgeConnectionListener_notifyClientWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL4 v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteObjectProxy");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = (void *)AFSiriLogContextDaemon;
    v4 = os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (v2)
    {
      if (v4)
      {
        v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
        v6 = v3;
        objc_msgSend(v5, "remoteObjectProxy");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 136315394;
        v12 = "-[AFBridgeConnectionListener notifyClientWithBlock:]_block_invoke";
        v13 = 2112;
        v14 = v7;
        _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s Sending a message to remote object: %@", (uint8_t *)&v11, 0x16u);

LABEL_7:
      }
    }
    else if (v4)
    {
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      v6 = v3;
      v11 = 136315394;
      v12 = "-[AFBridgeConnectionListener notifyClientWithBlock:]_block_invoke";
      v13 = 1026;
      LODWORD(v14) = objc_msgSend(v8, "processIdentifier");
      _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s RemoteObjectProxy is nil for client PID (%{public}d)", (uint8_t *)&v11, 0x12u);
      goto LABEL_7;
    }
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteObjectProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
}

void __62__AFBridgeConnectionListener_resumeConnectionWithBridgeProxy___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = AFSiriLogContextDaemon;
  if (*(_QWORD *)(v2 + 56))
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(v2 + 64);
      v5 = *(_QWORD *)(v2 + 40);
      v7 = 136315650;
      v8 = "-[AFBridgeConnectionListener resumeConnectionWithBridgeProxy:]_block_invoke";
      v9 = 2112;
      v10 = v4;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s Resuming AFBridgeConnectionListener for bridge: %@, service: %@", (uint8_t *)&v7, 0x20u);
      v2 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend(*(id *)(v2 + 8), "resume");
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(v2 + 40);
    v7 = 136315394;
    v8 = "-[AFBridgeConnectionListener resumeConnectionWithBridgeProxy:]_block_invoke";
    v9 = 2112;
    v10 = v6;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s Bridge proxy not passed for listener: %@", (uint8_t *)&v7, 0x16u);
  }
}

void __65__AFBridgeConnectionListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v3 = *(_DWORD *)(a1 + 40);
    v5 = 136315394;
    v6 = "-[AFBridgeConnectionListener listener:shouldAcceptNewConnection:]_block_invoke";
    v7 = 1024;
    v8 = v3;
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s AFBridgeConnectionListener connection invalidated (client pid=%d)", (uint8_t *)&v5, 0x12u);
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectionInvalidated");

}

void __65__AFBridgeConnectionListener_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v3 = *(_DWORD *)(a1 + 40);
    v5 = 136315394;
    v6 = "-[AFBridgeConnectionListener listener:shouldAcceptNewConnection:]_block_invoke";
    v7 = 1024;
    v8 = v3;
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s AFBridgeConnectionListener connection interrupted (client pid=%d)", (uint8_t *)&v5, 0x12u);
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectionInterrupted");

}

void __65__AFBridgeConnectionListener_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

@end
