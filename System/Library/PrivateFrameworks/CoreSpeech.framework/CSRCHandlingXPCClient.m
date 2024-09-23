@implementation CSRCHandlingXPCClient

- (CSRCHandlingXPCClient)init
{
  CSRCHandlingXPCClient *v2;
  uint64_t v3;
  OS_dispatch_queue *xpcConnectionQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSRCHandlingXPCClient;
  v2 = -[CSRCHandlingXPCClient init](&v6, sel_init);
  if (v2)
  {
    CSLogInitIfNeeded();
    objc_msgSend(MEMORY[0x1E0D19260], "getSerialQueue:qualityOfService:", CFSTR("com.apple.corespeech.rchandling.xpc.connection"), 33);
    v3 = objc_claimAutoreleasedReturnValue();
    xpcConnectionQueue = v2->_xpcConnectionQueue;
    v2->_xpcConnectionQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)invalidate
{
  NSXPCConnection *rcXPCConnection;

  -[NSXPCConnection invalidate](self->_rcXPCConnection, "invalidate");
  rcXPCConnection = self->_rcXPCConnection;
  self->_rcXPCConnection = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[CSRCHandlingXPCClient invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CSRCHandlingXPCClient;
  -[CSRCHandlingXPCClient dealloc](&v3, sel_dealloc);
}

- (void)processRCWithId:(unint64_t)a3 requestId:(id)a4 speechPackage:(id)a5 taskId:(id)a6 forceAccept:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v9 = a7;
  v26 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v18 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136315650;
    v21 = "-[CSRCHandlingXPCClient processRCWithId:requestId:speechPackage:taskId:forceAccept:completionHandler:]";
    v22 = 2048;
    v23 = a3;
    v24 = 1024;
    v25 = v9;
    _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEFAULT, "%s Received RC with id: %lu, forceAccept: %d", (uint8_t *)&v20, 0x1Cu);
  }
  -[CSRCHandlingXPCClient _getRemoteServiceProxyObject](self, "_getRemoteServiceProxyObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "processRCWithId:requestId:speechPackage:taskId:forceAccept:completionHandler:", a3, v14, v15, v16, v9, v17);

}

- (void)getMitigationDecisionForRCIdWithCompletion:(unint64_t)a3 requestId:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315394;
    v13 = "-[CSRCHandlingXPCClient getMitigationDecisionForRCIdWithCompletion:requestId:completion:]";
    v14 = 2048;
    v15 = a3;
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s Getting mitigation decision for rdId: %lu", (uint8_t *)&v12, 0x16u);
  }
  -[CSRCHandlingXPCClient _getRemoteServiceProxyObject](self, "_getRemoteServiceProxyObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getMitigationDecisionForRCIdWithCompletion:requestId:completion:", a3, v8, v9);

}

- (id)_getRemoteServiceProxyObject
{
  id remoteObjectProxy;
  os_log_t *v4;
  NSObject *v5;
  NSXPCConnection *rcXPCConnection;
  void *v7;
  id v8;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  remoteObjectProxy = self->_remoteObjectProxy;
  if (!remoteObjectProxy || !self->_rcXPCConnection)
  {
    v4 = (os_log_t *)MEMORY[0x1E0D18F60];
    v5 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[CSRCHandlingXPCClient _getRemoteServiceProxyObject]";
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Creating RemoteServiceProxy", buf, 0xCu);
    }
    rcXPCConnection = self->_rcXPCConnection;
    if (rcXPCConnection
      || (-[CSRCHandlingXPCClient _createClientConnection](self, "_createClientConnection"),
          (rcXPCConnection = self->_rcXPCConnection) != 0))
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __53__CSRCHandlingXPCClient__getRemoteServiceProxyObject__block_invoke;
      v11[3] = &unk_1E7C285E8;
      v11[4] = self;
      -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](rcXPCConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = self->_remoteObjectProxy;
      self->_remoteObjectProxy = v7;
    }
    else
    {
      v10 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v13 = "-[CSRCHandlingXPCClient _getRemoteServiceProxyObject]";
        _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s ERR: RCProcessing rcProcConnection is nil", buf, 0xCu);
      }
      v8 = self->_remoteObjectProxy;
      self->_remoteObjectProxy = 0;
    }

    remoteObjectProxy = self->_remoteObjectProxy;
  }
  return remoteObjectProxy;
}

- (void)_createClientConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *rcXPCConnection;
  NSXPCConnection *v5;
  void *v6;
  NSXPCConnection *v7;
  uint64_t v8;
  NSXPCConnection *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.corespeech.corespeechd.rchandling.service"), 4096);
  rcXPCConnection = self->_rcXPCConnection;
  self->_rcXPCConnection = v3;

  v5 = self->_rcXPCConnection;
  CSRCHandlingXPCServiceGetXPCInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", v6);

  -[NSXPCConnection setExportedObject:](self->_rcXPCConnection, "setExportedObject:", self);
  -[NSXPCConnection _setQueue:](self->_rcXPCConnection, "_setQueue:", self->_xpcConnectionQueue);
  objc_initWeak(&location, self);
  v7 = self->_rcXPCConnection;
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__CSRCHandlingXPCClient__createClientConnection__block_invoke;
  v12[3] = &unk_1E7C27FF0;
  objc_copyWeak(&v13, &location);
  -[NSXPCConnection setInterruptionHandler:](v7, "setInterruptionHandler:", v12);
  v9 = self->_rcXPCConnection;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __48__CSRCHandlingXPCClient__createClientConnection__block_invoke_2;
  v10[3] = &unk_1E7C27FF0;
  objc_copyWeak(&v11, &location);
  -[NSXPCConnection setInvalidationHandler:](v9, "setInvalidationHandler:", v10);
  -[NSXPCConnection resume](self->_rcXPCConnection, "resume");
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (NSXPCConnection)rcXPCConnection
{
  return self->_rcXPCConnection;
}

- (void)setRcXPCConnection:(id)a3
{
  objc_storeStrong((id *)&self->_rcXPCConnection, a3);
}

- (OS_dispatch_queue)xpcConnectionQueue
{
  return self->_xpcConnectionQueue;
}

- (void)setXpcConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnectionQueue, a3);
}

- (id)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (void)setRemoteObjectProxy:(id)a3
{
  objc_storeStrong(&self->_remoteObjectProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);
  objc_storeStrong((id *)&self->_rcXPCConnection, 0);
}

void __48__CSRCHandlingXPCClient__createClientConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    objc_msgSend(WeakRetained, "rcXPCConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "rcXPCConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v10 = "-[CSRCHandlingXPCClient _createClientConnection]_block_invoke";
    v11 = 2114;
    v12 = v4;
    v13 = 1026;
    v14 = objc_msgSend(v5, "processIdentifier");
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Client Interruption Handler: %{public}@, client PID: %{public}d)", buf, 0x1Cu);

  }
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "rcXPCConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(WeakRetained, "xpcConnectionQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__CSRCHandlingXPCClient__createClientConnection__block_invoke_7;
      block[3] = &unk_1E7C292C8;
      block[4] = WeakRetained;
      dispatch_async(v7, block);

    }
  }

}

void __48__CSRCHandlingXPCClient__createClientConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    objc_msgSend(WeakRetained, "rcXPCConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "rcXPCConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v10 = "-[CSRCHandlingXPCClient _createClientConnection]_block_invoke_2";
    v11 = 2114;
    v12 = v4;
    v13 = 1026;
    v14 = objc_msgSend(v5, "processIdentifier");
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Client Invalidation Handler: %{public}@, client PID: %{public}d exited", buf, 0x1Cu);

  }
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "rcXPCConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(WeakRetained, "xpcConnectionQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__CSRCHandlingXPCClient__createClientConnection__block_invoke_9;
      block[3] = &unk_1E7C292C8;
      block[4] = WeakRetained;
      dispatch_async(v7, block);

    }
  }

}

uint64_t __48__CSRCHandlingXPCClient__createClientConnection__block_invoke_9(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setRcXPCConnection:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setRemoteObjectProxy:", 0);
}

uint64_t __48__CSRCHandlingXPCClient__createClientConnection__block_invoke_7(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "rcXPCConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setRcXPCConnection:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setRemoteObjectProxy:", 0);
}

void __53__CSRCHandlingXPCClient__getRemoteServiceProxyObject__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v7 = v4;
      v8 = objc_msgSend(v3, "code");
      objc_msgSend(v3, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315650;
      v11 = "-[CSRCHandlingXPCClient _getRemoteServiceProxyObject]_block_invoke";
      v12 = 2050;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s ERR: RC Processing Remote Object Proxy returned error : %{public}ld (%{public}@)", (uint8_t *)&v10, 0x20u);

    }
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 8);
    *(_QWORD *)(v5 + 8) = 0;

  }
}

@end
