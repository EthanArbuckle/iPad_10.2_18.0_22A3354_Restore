@implementation AFUIBridgeClient

- (AFUIBridgeClient)initWithDelegate:(id)a3
{
  return -[AFUIBridgeClient initWithDelegate:delegateQueue:](self, "initWithDelegate:delegateQueue:", a3, MEMORY[0x1E0C80D38]);
}

- (AFUIBridgeClient)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v6;
  id v7;
  AFUIBridgeClient *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AFUIBridgeClient;
  v8 = -[AFUIBridgeClient init](&v14, sel_init);
  if (v8)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INTERACTIVE, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = dispatch_queue_create("com.apple.siri.uibridge-client", v10);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v8->_delegateQueue, a4);
    objc_storeWeak((id *)&v8->_delegate, v6);
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AFUIBridgeClient;
  -[AFUIBridgeClient dealloc](&v3, sel_dealloc);
}

- (id)_connection
{
  NSXPCConnection *xpcConnection;
  void *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  void *v8;
  NSXPCConnection *v9;
  void *v10;
  NSXPCConnection *v11;
  AFUIBridgeServiceProxy *v12;
  NSXPCConnection *v13;
  uint64_t v14;
  NSXPCConnection *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    +[AFInstanceContext defaultContext](AFInstanceContext, "defaultContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createXPCConnectionWithMachServiceName:options:", CFSTR("com.apple.assistant.request-dispatcher.uibridge-service"), 0);
    v5 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
    v6 = self->_xpcConnection;
    self->_xpcConnection = v5;

    v7 = self->_xpcConnection;
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3EBBB0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v7, "setRemoteObjectInterface:", v8);

    v9 = self->_xpcConnection;
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3EBDC8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v9, "setExportedInterface:", v10);

    v11 = self->_xpcConnection;
    v12 = -[AFUIBridgeServiceProxy initWithClient:]([AFUIBridgeServiceProxy alloc], "initWithClient:", self);
    -[NSXPCConnection setExportedObject:](v11, "setExportedObject:", v12);

    -[NSXPCConnection _setQueue:](self->_xpcConnection, "_setQueue:", self->_queue);
    objc_initWeak(&location, self);
    v13 = self->_xpcConnection;
    v14 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __31__AFUIBridgeClient__connection__block_invoke;
    v19[3] = &unk_1E3A35AE0;
    objc_copyWeak(&v20, &location);
    -[NSXPCConnection setInvalidationHandler:](v13, "setInvalidationHandler:", v19);
    v15 = self->_xpcConnection;
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __31__AFUIBridgeClient__connection__block_invoke_2;
    v17[3] = &unk_1E3A35AE0;
    objc_copyWeak(&v18, &location);
    -[NSXPCConnection setInterruptionHandler:](v15, "setInterruptionHandler:", v17);
    -[NSXPCConnection resume](self->_xpcConnection, "resume");
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    xpcConnection = self->_xpcConnection;
  }
  return xpcConnection;
}

- (id)_uiBridgeService
{
  void *v2;
  void *v3;

  -[AFUIBridgeClient _connection](self, "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_uiBridgeServiceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AFUIBridgeClient _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)preheat
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__AFUIBridgeClient_preheat__block_invoke;
  v4[3] = &unk_1E3A35AE0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)siriDismissed
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__AFUIBridgeClient_siriDismissed__block_invoke;
  v4[3] = &unk_1E3A35AE0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)siriWillPrompt
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__AFUIBridgeClient_siriWillPrompt__block_invoke;
  v4[3] = &unk_1E3A35AE0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)siriPrompted
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__AFUIBridgeClient_siriPrompted__block_invoke;
  v4[3] = &unk_1E3A35AE0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)startAttending
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__AFUIBridgeClient_startAttending__block_invoke;
  v4[3] = &unk_1E3A35AE0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)stopAttendingWithReason:(unint64_t)a3
{
  NSObject *queue;
  _QWORD block[4];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__AFUIBridgeClient_stopAttendingWithReason___block_invoke;
  block[3] = &unk_1E3A33538;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (AFUIBridgeClientDelegate)delegate
{
  return (AFUIBridgeClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __44__AFUIBridgeClient_stopAttendingWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_uiBridgeService");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopAttendingWithReason:", *(_QWORD *)(a1 + 40));

    WeakRetained = v4;
  }

}

void __34__AFUIBridgeClient_startAttending__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  char v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_uiBridgeService");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    WeakRetained = v5;
    if ((v3 & 1) != 0)
    {
      objc_msgSend(v5, "_uiBridgeService");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "startAttending");

      WeakRetained = v5;
    }
  }

}

void __32__AFUIBridgeClient_siriPrompted__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_uiBridgeService");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "siriPrompted");

    WeakRetained = v3;
  }

}

void __34__AFUIBridgeClient_siriWillPrompt__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  char v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_uiBridgeService");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    WeakRetained = v5;
    if ((v3 & 1) != 0)
    {
      objc_msgSend(v5, "_uiBridgeService");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "siriWillPrompt");

      WeakRetained = v5;
    }
  }

}

void __33__AFUIBridgeClient_siriDismissed__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_uiBridgeService");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "siriDismissed");

    WeakRetained = v3;
  }

}

void __27__AFUIBridgeClient_preheat__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_uiBridgeService");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "preheat");

    WeakRetained = v3;
  }

}

void __31__AFUIBridgeClient__connection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[AFUIBridgeClient _connection]_block_invoke";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s UIBridge Connection Invalidated", buf, 0xCu);
  }
  v3 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[4];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __31__AFUIBridgeClient__connection__block_invoke_67;
    block[3] = &unk_1E3A35AE0;
    objc_copyWeak(&v8, v3);
    dispatch_async(v6, block);
    objc_destroyWeak(&v8);
  }

}

void __31__AFUIBridgeClient__connection__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[AFUIBridgeClient _connection]_block_invoke_2";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s UIBridge Connection Interrupted", buf, 0xCu);
  }
  v3 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[4];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __31__AFUIBridgeClient__connection__block_invoke_69;
    block[3] = &unk_1E3A35AE0;
    objc_copyWeak(&v8, v3);
    dispatch_async(v6, block);
    objc_destroyWeak(&v8);
  }

}

void __31__AFUIBridgeClient__connection__block_invoke_69(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[1], "invalidate");
    v2 = v3[1];
    v3[1] = 0;

    WeakRetained = v3;
  }

}

void __31__AFUIBridgeClient__connection__block_invoke_67(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

@end
