@implementation ATSessionProxyListener

- (ATSessionProxyListener)initWithSession:(id)a3
{
  id v5;
  ATSessionProxyListener *v6;
  NSMutableArray *v7;
  NSMutableArray *connections;
  uint64_t v9;
  NSXPCListener *listener;
  void *v11;
  objc_class *v12;
  const char *Name;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ATSessionProxyListener;
  v6 = -[ATSessionProxyListener init](&v17, sel_init);
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    connections = v6->_connections;
    v6->_connections = v7;

    objc_storeStrong((id *)&v6->_session, a3);
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v9 = objc_claimAutoreleasedReturnValue();
    listener = v6->_listener;
    v6->_listener = (NSXPCListener *)v9;

    -[NSXPCListener setDelegate:](v6->_listener, "setDelegate:", v6);
    -[NSXPCListener endpoint](v6->_listener, "endpoint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATSession setEndpoint:](v6->_session, "setEndpoint:", v11);

    v12 = (objc_class *)objc_opt_class();
    Name = class_getName(v12);
    v14 = dispatch_queue_create(Name, 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v14;

  }
  return v6;
}

- (void)start
{
  NSObject *v3;
  int v4;
  ATSessionProxyListener *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting", (uint8_t *)&v4, 0xCu);
  }

  -[ATSession addObserver:](self->_session, "addObserver:", self);
  -[NSXPCListener resume](self->_listener, "resume");
}

- (void)stop
{
  NSObject *v3;
  int v4;
  ATSessionProxyListener *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ stop", (uint8_t *)&v4, 0xCu);
  }

  -[NSXPCListener invalidate](self->_listener, "invalidate");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  ATSessionProxyConnection *v10;
  uint64_t v11;
  NSObject *queue;
  ATSessionProxyConnection *v13;
  _QWORD v15[5];
  id v16;
  int v17;
  _QWORD v18[5];
  int v19;
  _QWORD block[5];
  ATSessionProxyConnection *v21;
  uint8_t buf[4];
  ATSessionProxyListener *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "processIdentifier");
  _ATLogCategoryXPC();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v23 = self;
    v24 = 1024;
    v25 = v8;
    _os_log_impl(&dword_1D19F1000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Got connection from pid %i", buf, 0x12u);
  }

  v10 = -[ATSessionProxyConnection initWithSession:connection:]([ATSessionProxyConnection alloc], "initWithSession:connection:", self->_session, v7);
  v11 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__ATSessionProxyListener_listener_shouldAcceptNewConnection___block_invoke;
  block[3] = &unk_1E928CDD8;
  block[4] = self;
  v13 = v10;
  v21 = v13;
  dispatch_sync(queue, block);
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __61__ATSessionProxyListener_listener_shouldAcceptNewConnection___block_invoke_2;
  v18[3] = &unk_1E928CAA0;
  v18[4] = self;
  v19 = v8;
  objc_msgSend(v7, "setInterruptionHandler:", v18);
  objc_initWeak((id *)buf, v13);
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __61__ATSessionProxyListener_listener_shouldAcceptNewConnection___block_invoke_3;
  v15[3] = &unk_1E928CB58;
  v15[4] = self;
  v17 = v8;
  objc_copyWeak(&v16, (id *)buf);
  objc_msgSend(v7, "setInvalidationHandler:", v15);
  -[ATSessionProxyConnection start](v13, "start");
  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (void)sessionDidFinish:(id)a3
{
  id v4;

  +[ATSessionServerListener sharedSessionServer](ATSessionServerListener, "sharedSessionServer", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeSession:", self->_session);

}

- (ATSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

uint64_t __61__ATSessionProxyListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

void __61__ATSessionProxyListener_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryXPC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_DWORD *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 1024;
    v8 = v4;
    _os_log_impl(&dword_1D19F1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection interrupted from pid: %i", (uint8_t *)&v5, 0x12u);
  }

}

void __61__ATSessionProxyListener_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryXPC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    v12 = v3;
    v13 = 1024;
    v14 = v4;
    _os_log_impl(&dword_1D19F1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection invalidated from pid: %i", buf, 0x12u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "stop");
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 24);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__ATSessionProxyListener_listener_shouldAcceptNewConnection___block_invoke_4;
    v9[3] = &unk_1E928CDD8;
    v9[4] = v7;
    v10 = v6;
    dispatch_sync(v8, v9);

  }
}

uint64_t __61__ATSessionProxyListener_listener_shouldAcceptNewConnection___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

@end
