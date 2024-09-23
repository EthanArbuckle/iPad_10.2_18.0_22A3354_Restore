@implementation CSSSRXPCClient

- (CSSSRXPCClient)init
{
  CSSSRXPCClient *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  OS_dispatch_queue *xpcConnectionQueue;
  uint64_t v7;
  id remoteObjectProxy;
  NSObject *v9;
  NSObject *v10;
  CSSSRXPCClient *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)CSSSRXPCClient;
  v2 = -[CSSSRXPCClient init](&v13, sel_init);
  if (!v2)
  {
LABEL_5:
    v11 = v2;
    goto LABEL_9;
  }
  CSLogInitIfNeeded();
  objc_msgSend(MEMORY[0x1E0D19260], "getSerialQueue:qualityOfService:", CFSTR("com.apple.CoreSpeech.Connection.SSR.Client"), 33);
  v3 = objc_claimAutoreleasedReturnValue();
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v3;

  objc_msgSend(MEMORY[0x1E0D19260], "getSerialQueue:qualityOfService:", CFSTR("com.apple.CoreSpeech.Connection.SSR"), 33);
  v5 = objc_claimAutoreleasedReturnValue();
  xpcConnectionQueue = v2->_xpcConnectionQueue;
  v2->_xpcConnectionQueue = (OS_dispatch_queue *)v5;

  -[CSSSRXPCClient _getRemoteServiceProxyObject](v2, "_getRemoteServiceProxyObject");
  v7 = objc_claimAutoreleasedReturnValue();
  remoteObjectProxy = v2->_remoteObjectProxy;
  v2->_remoteObjectProxy = (id)v7;

  v9 = *MEMORY[0x1E0D18F60];
  v10 = *MEMORY[0x1E0D18F60];
  if (v2->_remoteObjectProxy)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CSSSRXPCClient init]";
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Successfully created SSR connection", buf, 0xCu);
    }
    goto LABEL_5;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CSSSRXPCClient init]";
    _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s SSR Remote Object Proxy is nil", buf, 0xCu);
  }
  v11 = 0;
LABEL_9:

  return v11;
}

- (void)invalidate
{
  NSXPCConnection *ssrConnection;

  -[NSXPCConnection invalidate](self->_ssrConnection, "invalidate");
  ssrConnection = self->_ssrConnection;
  self->_ssrConnection = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[CSSSRXPCClient invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CSSSRXPCClient;
  -[CSSSRXPCClient dealloc](&v3, sel_dealloc);
}

- (void)startXPCConnection
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CSSSRXPCClient_startXPCConnection__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)_getRemoteServiceProxyObject
{
  id remoteObjectProxy;
  os_log_t *v4;
  NSObject *v5;
  NSXPCConnection *ssrConnection;
  void *v7;
  id v8;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  remoteObjectProxy = self->_remoteObjectProxy;
  if (!remoteObjectProxy || !self->_ssrConnection)
  {
    v4 = (os_log_t *)MEMORY[0x1E0D18F60];
    v5 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[CSSSRXPCClient _getRemoteServiceProxyObject]";
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Creating RemoteServiceProxy", buf, 0xCu);
    }
    ssrConnection = self->_ssrConnection;
    if (ssrConnection
      || (-[CSSSRXPCClient _createClientConnection](self, "_createClientConnection"),
          (ssrConnection = self->_ssrConnection) != 0))
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __46__CSSSRXPCClient__getRemoteServiceProxyObject__block_invoke;
      v11[3] = &unk_1E7C285E8;
      v11[4] = self;
      -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](ssrConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
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
        v13 = "-[CSSSRXPCClient _getRemoteServiceProxyObject]";
        _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s ERR: SSR ssrConnection is nil", buf, 0xCu);
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
  NSXPCConnection *ssrConnection;
  void *v5;
  void *v6;
  NSXPCConnection *v7;
  uint64_t v8;
  NSXPCConnection *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.corespeech.corespeechd.ssr.service"), 4096);
  ssrConnection = self->_ssrConnection;
  self->_ssrConnection = v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF7C57B0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_ssrConnection, "setRemoteObjectInterface:", v5);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF79E530);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](self->_ssrConnection, "setExportedInterface:", v6);

  -[NSXPCConnection setExportedObject:](self->_ssrConnection, "setExportedObject:", self);
  -[NSXPCConnection _setQueue:](self->_ssrConnection, "_setQueue:", self->_xpcConnectionQueue);
  objc_initWeak(&location, self);
  v7 = self->_ssrConnection;
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __41__CSSSRXPCClient__createClientConnection__block_invoke;
  v12[3] = &unk_1E7C27FF0;
  objc_copyWeak(&v13, &location);
  -[NSXPCConnection setInterruptionHandler:](v7, "setInterruptionHandler:", v12);
  v9 = self->_ssrConnection;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __41__CSSSRXPCClient__createClientConnection__block_invoke_2;
  v10[3] = &unk_1E7C27FF0;
  objc_copyWeak(&v11, &location);
  -[NSXPCConnection setInvalidationHandler:](v9, "setInvalidationHandler:", v10);
  -[NSXPCConnection resume](self->_ssrConnection, "resume");
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)didReceiveSpeakerRecognitionScoreCard:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  NSObject *queue;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0D18F60];
  v6 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[CSSSRXPCClient didReceiveSpeakerRecognitionScoreCard:]";
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (v4)
  {
    queue = self->_queue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__CSSSRXPCClient_didReceiveSpeakerRecognitionScoreCard___block_invoke;
    v9[3] = &unk_1E7C292A0;
    v9[4] = self;
    v10 = v4;
    dispatch_async(queue, v9);

  }
  else
  {
    v8 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[CSSSRXPCClient didReceiveSpeakerRecognitionScoreCard:]";
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s scoreCard is nil!", buf, 0xCu);
    }
  }

}

- (void)didFinishSpeakerRecognition:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[CSSSRXPCClient didFinishSpeakerRecognition:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__CSSSRXPCClient_didFinishSpeakerRecognition___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

- (CSSSRXPCClientDelegate)delegate
{
  return (CSSSRXPCClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)ssrConnection
{
  return self->_ssrConnection;
}

- (void)setSsrConnection:(id)a3
{
  objc_storeStrong((id *)&self->_ssrConnection, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
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
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_ssrConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __46__CSSSRXPCClient_didFinishSpeakerRecognition___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v4, "didFinishSpeakerRecognition:", *(_QWORD *)(a1 + 40));

  }
}

void __56__CSSSRXPCClient_didReceiveSpeakerRecognitionScoreCard___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v4, "didReceiveSpeakerRecognitionScoreCard:", *(_QWORD *)(a1 + 40));

  }
}

void __41__CSSSRXPCClient__createClientConnection__block_invoke(uint64_t a1)
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
    objc_msgSend(WeakRetained, "ssrConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "ssrConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v10 = "-[CSSSRXPCClient _createClientConnection]_block_invoke";
    v11 = 2114;
    v12 = v4;
    v13 = 1026;
    v14 = objc_msgSend(v5, "processIdentifier");
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Client Interruption Handler: %{public}@, client PID: %{public}d)", buf, 0x1Cu);

  }
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "ssrConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(WeakRetained, "queue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__CSSSRXPCClient__createClientConnection__block_invoke_17;
      block[3] = &unk_1E7C292C8;
      block[4] = WeakRetained;
      dispatch_async(v7, block);

    }
  }

}

void __41__CSSSRXPCClient__createClientConnection__block_invoke_2(uint64_t a1)
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
    objc_msgSend(WeakRetained, "ssrConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "ssrConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v10 = "-[CSSSRXPCClient _createClientConnection]_block_invoke_2";
    v11 = 2114;
    v12 = v4;
    v13 = 1026;
    v14 = objc_msgSend(v5, "processIdentifier");
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Client Invalidation Handler: %{public}@, client PID: %{public}d exited", buf, 0x1Cu);

  }
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "ssrConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(WeakRetained, "queue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__CSSSRXPCClient__createClientConnection__block_invoke_18;
      block[3] = &unk_1E7C292C8;
      block[4] = WeakRetained;
      dispatch_async(v7, block);

    }
  }

}

uint64_t __41__CSSSRXPCClient__createClientConnection__block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSsrConnection:", 0);
}

uint64_t __41__CSSSRXPCClient__createClientConnection__block_invoke_17(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "ssrConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  return objc_msgSend(*(id *)(a1 + 32), "setSsrConnection:", 0);
}

void __46__CSSSRXPCClient__getRemoteServiceProxyObject__block_invoke(uint64_t a1, void *a2)
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
      v11 = "-[CSSSRXPCClient _getRemoteServiceProxyObject]_block_invoke";
      v12 = 2050;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s ERR: SSR Remote Object Proxy returned error : %{public}ld (%{public}@)", (uint8_t *)&v10, 0x20u);

    }
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = 0;

  }
}

void __36__CSSSRXPCClient_startXPCConnection__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_getRemoteServiceProxyObject");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startXPCConnection");

}

@end
