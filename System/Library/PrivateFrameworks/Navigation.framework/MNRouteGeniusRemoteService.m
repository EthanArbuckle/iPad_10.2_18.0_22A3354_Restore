@implementation MNRouteGeniusRemoteService

- (BOOL)_q_openConnectionIfNecessary
{
  NSXPCConnection **p_connection;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  p_connection = &self->_connection;
  if (!self->_connection)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEEDF6D8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_didUpdateRouteGenius_, 0, 0);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.navd.routegenius"), 4096);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEF09580);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRemoteObjectInterface:", v9);

    objc_msgSend(v8, "setExportedInterface:", v4);
    objc_msgSend(v8, "setExportedObject:", self);
    objc_initWeak(&location, self);
    v10 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __58__MNRouteGeniusRemoteService__q_openConnectionIfNecessary__block_invoke;
    v14[3] = &unk_1E61D6EB8;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v8, "setInvalidationHandler:", v14);
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __58__MNRouteGeniusRemoteService__q_openConnectionIfNecessary__block_invoke_3;
    v12[3] = &unk_1E61D6EB8;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v8, "setInterruptionHandler:", v12);
    objc_storeStrong((id *)p_connection, v8);
    objc_msgSend(v8, "resume");
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
  return 1;
}

void __58__MNRouteGeniusRemoteService__q_openConnectionIfNecessary__block_invoke(uint64_t a1)
{
  id *v1;
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__MNRouteGeniusRemoteService__q_openConnectionIfNecessary__block_invoke_2;
    block[3] = &unk_1E61D6EB8;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v6);
  }

}

void __58__MNRouteGeniusRemoteService__q_openConnectionIfNecessary__block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)WeakRetained[1];
  WeakRetained[1] = 0;

  *((_BYTE *)WeakRetained + 24) = 0;
}

void __58__MNRouteGeniusRemoteService__q_openConnectionIfNecessary__block_invoke_3(uint64_t a1)
{
  id *v1;
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__MNRouteGeniusRemoteService__q_openConnectionIfNecessary__block_invoke_4;
    block[3] = &unk_1E61D6EB8;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v6);
  }

}

void __58__MNRouteGeniusRemoteService__q_openConnectionIfNecessary__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_q_closeConnection");

}

- (void)_q_closeConnection
{
  NSXPCConnection *connection;

  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", 0);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", 0);
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  self->_started = 0;
}

- (MNRouteGeniusRemoteService)initWithDelegate:(id)a3
{
  id v5;
  MNRouteGeniusRemoteService *v6;
  MNRouteGeniusRemoteService *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MNRouteGeniusRemoteService;
  v6 = -[MNRouteGeniusRemoteService init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("MNRouteGeniusRemoteQueue", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

  }
  return v7;
}

- (void)dealloc
{
  NSXPCConnection *connection;
  OS_dispatch_queue *queue;
  objc_super v5;

  -[MNRouteGeniusRemoteService _q_closeConnection](self, "_q_closeConnection");
  connection = self->_connection;
  self->_connection = 0;

  queue = self->_queue;
  self->_queue = 0;

  v5.receiver = self;
  v5.super_class = (Class)MNRouteGeniusRemoteService;
  -[MNRouteGeniusRemoteService dealloc](&v5, sel_dealloc);
}

- (void)forceReroute
{
  OS_dispatch_queue *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  _QWORD v11[4];
  OS_dispatch_queue *v12;
  id v13;
  id location;

  objc_initWeak(&location, self);
  v3 = self->_queue;
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__MNRouteGeniusRemoteService_forceReroute__block_invoke;
  v11[3] = &unk_1E61D6EE0;
  v12 = v3;
  v5 = v3;
  objc_copyWeak(&v13, &location);
  v6 = (void *)MEMORY[0x1B5E0E364](v11);
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __42__MNRouteGeniusRemoteService_forceReroute__block_invoke_2;
  block[3] = &unk_1E61D6F08;
  objc_copyWeak(&v10, &location);
  v9 = v6;
  v7 = v6;
  dispatch_async(v5, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
}

void __42__MNRouteGeniusRemoteService_forceReroute__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_ERROR, "MNRouteGeniusRemoteService force reroute error : %@", buf, 0xCu);
  }

  v5 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MNRouteGeniusRemoteService_forceReroute__block_invoke_62;
  block[3] = &unk_1E61D6EB8;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  dispatch_async(v5, block);
  objc_destroyWeak(&v7);

}

void __42__MNRouteGeniusRemoteService_forceReroute__block_invoke_62(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)*((_QWORD *)WeakRetained + 1);
    *((_QWORD *)WeakRetained + 1) = 0;

    *((_BYTE *)WeakRetained + 24) = 0;
    objc_msgSend(*((id *)WeakRetained + 4), "didUpdateRouteGenius:", 0);
  }

}

void __42__MNRouteGeniusRemoteService_forceReroute__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  __int16 v5[8];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_BYTE *)WeakRetained + 24))
    {
      objc_msgSend(WeakRetained[1], "remoteObjectProxyWithErrorHandler:", *(_QWORD *)(a1 + 32));
      v4 = objc_claimAutoreleasedReturnValue();
      -[NSObject forceReroute](v4, "forceReroute");
    }
    else
    {
      GEOFindOrCreateLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v5[0] = 0;
        _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_DEBUG, "Cancelling reroute, MNRouteGeniusRemoteService is not started", (uint8_t *)v5, 2u);
      }
    }

  }
}

- (void)start
{
  OS_dispatch_queue *v3;
  uint64_t v4;
  OS_dispatch_queue *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  OS_dispatch_queue *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  OS_dispatch_queue *v14;
  id v15;
  id location;

  objc_initWeak(&location, self);
  v3 = self->_queue;
  v4 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __35__MNRouteGeniusRemoteService_start__block_invoke;
  v13[3] = &unk_1E61D6EE0;
  v5 = v3;
  v14 = v5;
  objc_copyWeak(&v15, &location);
  v6 = (void *)MEMORY[0x1B5E0E364](v13);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __35__MNRouteGeniusRemoteService_start__block_invoke_2;
  v9[3] = &unk_1E61D6F30;
  objc_copyWeak(&v12, &location);
  v10 = v5;
  v11 = v6;
  v7 = v5;
  v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

void __35__MNRouteGeniusRemoteService_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_ERROR, "MNRouteGeniusRemoteService start connection error : %@", buf, 0xCu);
  }

  v5 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__MNRouteGeniusRemoteService_start__block_invoke_64;
  block[3] = &unk_1E61D6EB8;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  dispatch_async(v5, block);
  objc_destroyWeak(&v7);

}

void __35__MNRouteGeniusRemoteService_start__block_invoke_64(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)*((_QWORD *)WeakRetained + 1);
    *((_QWORD *)WeakRetained + 1) = 0;

    *((_BYTE *)WeakRetained + 24) = 0;
    objc_msgSend(*((id *)WeakRetained + 4), "didUpdateRouteGenius:", 0);
  }

}

void __35__MNRouteGeniusRemoteService_start__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[16];

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_q_openConnectionIfNecessary");
    if (!*((_BYTE *)v4 + 24))
    {
      GEOFindOrCreateLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEBUG, "MNRouteGeniusRemoteService is starting a connection", buf, 2u);
      }

      *((_BYTE *)v4 + 24) = 1;
      objc_msgSend(*((id *)v4 + 1), "remoteObjectProxyWithErrorHandler:", *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __35__MNRouteGeniusRemoteService_start__block_invoke_65;
      v7[3] = &unk_1E61D6F78;
      v8 = *(id *)(a1 + 32);
      objc_copyWeak(&v9, v2);
      objc_msgSend(v6, "startWithHandler:", v7);

      objc_destroyWeak(&v9);
    }
  }

}

void __35__MNRouteGeniusRemoteService_start__block_invoke_65(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__MNRouteGeniusRemoteService_start__block_invoke_2_66;
  block[3] = &unk_1E61D6EB8;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __35__MNRouteGeniusRemoteService_start__block_invoke_2_66(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  uint8_t v5[16];

  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_DEBUG, "MNRouteGeniusRemoteService is closing the connection", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_q_closeConnection");

}

- (void)stop
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__MNRouteGeniusRemoteService_stop__block_invoke;
  v4[3] = &unk_1E61D6EB8;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __34__MNRouteGeniusRemoteService_stop__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && WeakRetained[24])
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEBUG, "MNRouteGeniusRemoteService is stopping the connection", v5, 2u);
    }

    *((_BYTE *)v2 + 24) = 0;
    objc_msgSend(v2, "_q_openConnectionIfNecessary");
    objc_msgSend(*((id *)v2 + 1), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_27);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopWithHandler:", &__block_literal_global_69);

  }
}

void __34__MNRouteGeniusRemoteService_stop__block_invoke_67(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_ERROR, "MNRouteGeniusRemoteService stop connection error : %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)didUpdateRouteGenius:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MNRouteGeniusRemoteService_didUpdateRouteGenius___block_invoke;
  block[3] = &unk_1E61D6F78;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__MNRouteGeniusRemoteService_didUpdateRouteGenius___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      GEOFindOrCreateLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEBUG, "received a 'didUpdateRouteGenius' with data", v7, 2u);
      }

      v4 = WeakRetained[4];
      v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
      objc_msgSend(v4, "didUpdateRouteGenius:", v5);

    }
    else
    {
      GEOFindOrCreateLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEBUG, "received a 'didUpdateRouteGenius' with nil", buf, 2u);
      }

      objc_msgSend(WeakRetained[4], "didUpdateRouteGenius:", *(_QWORD *)(a1 + 32));
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
