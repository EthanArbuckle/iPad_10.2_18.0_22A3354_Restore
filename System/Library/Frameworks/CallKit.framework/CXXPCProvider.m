@implementation CXXPCProvider

- (CXXPCProvider)initWithConfiguration:(id)a3
{
  CXXPCProvider *v3;
  CXXPCProvider *v4;
  void *v5;
  NSObject *v6;
  CXXPCProvider *v7;
  _QWORD block[4];
  CXXPCProvider *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CXXPCProvider;
  v3 = -[CXProvider initWithConfiguration:](&v11, sel_initWithConfiguration_, a3);
  v4 = v3;
  if (v3)
  {
    -[CXProvider abstractProvider](v3, "abstractProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__CXXPCProvider_initWithConfiguration___block_invoke;
    block[3] = &unk_1E4B88AE8;
    v7 = v4;
    v10 = v7;
    dispatch_async(v6, block);

    -[CXProvider registerCurrentConfiguration](v7, "registerCurrentConfiguration");
  }
  return v4;
}

void __39__CXXPCProvider_initWithConfiguration___block_invoke(uint64_t a1)
{
  int *v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(int **)(a1 + 32);
  objc_msgSend(v2, "abstractProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__CXXPCProvider_initWithConfiguration___block_invoke_2;
  v5[3] = &unk_1E4B89100;
  objc_copyWeak(&v6, &location);
  notify_register_dispatch("com.apple.callkit.callsourcehost.started", v2 + 12, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __39__CXXPCProvider_initWithConfiguration___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "com.apple.callkit.callsourcehost.started";
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Handling %s by setting up XPC connection", (uint8_t *)&v3, 0xCu);
  }

  objc_msgSend(WeakRetained, "registerCurrentConfiguration");
}

- (NSXPCConnection)connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.callkit.callsourcehost"), 0);
    v5 = self->_connection;
    self->_connection = v4;

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    objc_msgSend(MEMORY[0x1E0CB3B50], "cx_providerVendorInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", v6);

    objc_msgSend(MEMORY[0x1E0CB3B50], "cx_providerHostInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v7);

    objc_initWeak(&location, self);
    v8 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __27__CXXPCProvider_connection__block_invoke;
    v13[3] = &unk_1E4B88CA8;
    objc_copyWeak(&v14, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v13);
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __27__CXXPCProvider_connection__block_invoke_2;
    v11[3] = &unk_1E4B88CA8;
    objc_copyWeak(&v12, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v11);
    -[NSXPCConnection resume](self->_connection, "resume");
    -[CXProvider abstractProvider](self, "abstractProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendDidBeginForProvider:", self);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

void __27__CXXPCProvider_connection__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  _QWORD *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CXDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = WeakRetained[7];
      *(_DWORD *)buf = 138412546;
      v8 = v3;
      v9 = 2112;
      v10 = WeakRetained;
      _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Connection %@ interrupted for XPC provider %@", buf, 0x16u);
    }

    objc_msgSend(WeakRetained, "abstractProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__CXXPCProvider_connection__block_invoke_3;
    block[3] = &unk_1E4B88AE8;
    block[4] = WeakRetained;
    dispatch_async(v5, block);

  }
}

void __27__CXXPCProvider_connection__block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "abstractProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleConnectionInterruptionForProvider:", *(_QWORD *)(a1 + 32));

}

void __27__CXXPCProvider_connection__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  _QWORD *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CXDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = WeakRetained[7];
      *(_DWORD *)buf = 138412546;
      v8 = v3;
      v9 = 2112;
      v10 = WeakRetained;
      _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Connection %@ invalidated for XPC provider %@", buf, 0x16u);
    }

    objc_msgSend(WeakRetained, "abstractProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__CXXPCProvider_connection__block_invoke_4;
    block[3] = &unk_1E4B88AE8;
    block[4] = WeakRetained;
    dispatch_async(v5, block);

  }
}

void __27__CXXPCProvider_connection__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = 0;

  objc_msgSend(*(id *)(a1 + 32), "abstractProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleConnectionInterruptionForProvider:", *(_QWORD *)(a1 + 32));

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  notify_cancel(-[CXXPCProvider notifyToken](self, "notifyToken"));
  v3.receiver = self;
  v3.super_class = (Class)CXXPCProvider;
  -[CXXPCProvider dealloc](&v3, sel_dealloc);
}

- (id)hostProtocolDelegate
{
  void *v2;
  void *v3;

  -[CXXPCProvider connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)requiresProxyingAVAudioSessionState
{
  return 1;
}

- (void)invalidate
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[CXProvider abstractProvider](self, "abstractProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__CXXPCProvider_invalidate__block_invoke;
  block[3] = &unk_1E4B88AE8;
  block[4] = self;
  dispatch_async(v4, block);

}

void __27__CXXPCProvider_invalidate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "self: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
