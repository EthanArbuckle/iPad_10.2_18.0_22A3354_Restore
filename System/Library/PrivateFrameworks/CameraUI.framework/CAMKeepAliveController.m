@implementation CAMKeepAliveController

- (CAMKeepAliveController)init
{
  CAMKeepAliveController *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *keepAliveQueue;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *heartbeatQueue;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  CAMKeepAliveController *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CAMKeepAliveController;
  v2 = -[CAMKeepAliveController init](&v14, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.camera.keep-alive-connection", v3);
    keepAliveQueue = v2->__keepAliveQueue;
    v2->__keepAliveQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.camera.keep-alive-heartbeat", v6);
    heartbeatQueue = v2->__heartbeatQueue;
    v2->__heartbeatQueue = (OS_dispatch_queue *)v7;

    v9 = v2->__heartbeatQueue;
    dispatch_get_global_queue(-2, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v9, v10);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel__handleApplicationWillEnterForeground_, *MEMORY[0x1E0DC4860], 0);
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel__handleApplicationDidEnterBackground_, *MEMORY[0x1E0DC4768], 0);
    v12 = v2;

  }
  return v2;
}

- (void)startKeepAliveSession
{
  NSObject *v3;
  uint8_t v4[16];

  if (+[CAMApplication appOrPlugInState](CAMApplication, "appOrPlugInState") == 2)
  {
    v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring attempt to start keep-alive session while backgrounded.", v4, 2u);
    }

  }
  else
  {
    -[CAMKeepAliveController _setupConnectionIfNecessary](self, "_setupConnectionIfNecessary");
  }
}

- (void)_setupConnectionIfNecessary
{
  NSObject *v3;
  _QWORD block[5];

  -[CAMKeepAliveController _keepAliveQueue](self, "_keepAliveQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CAMKeepAliveController__setupConnectionIfNecessary__block_invoke;
  block[3] = &unk_1EA328868;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (OS_dispatch_queue)_keepAliveQueue
{
  return self->__keepAliveQueue;
}

uint64_t __53__CAMKeepAliveController__setupConnectionIfNecessary__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_keepAliveQueueCreateConnectionIfNecessary");
  return objc_msgSend(*(id *)(a1 + 32), "_keepAliveQueueCreateHeartbeatIfNecessary");
}

- (void)_keepAliveQueueCreateConnectionIfNecessary
{
  const char *v3;
  NSObject *v4;
  OS_xpc_object *mach_service;
  OS_xpc_object *connection;

  if (!self->__connection)
  {
    v3 = (const char *)*MEMORY[0x1E0D742D8];
    dispatch_get_global_queue(-2, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    mach_service = xpc_connection_create_mach_service(v3, v4, 0);
    connection = self->__connection;
    self->__connection = mach_service;

    xpc_connection_set_event_handler(self->__connection, &__block_literal_global_39);
    xpc_connection_resume(self->__connection);
  }
}

- (void)_keepAliveQueueCreateHeartbeatIfNecessary
{
  NSObject *v3;
  OS_dispatch_source *v4;
  OS_dispatch_source *heartbeatSource;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (!self->__heartbeatSource)
  {
    objc_initWeak(&location, self);
    -[CAMKeepAliveController _heartbeatQueue](self, "_heartbeatQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v3);
    heartbeatSource = self->__heartbeatSource;
    self->__heartbeatSource = v4;

    v6 = self->__heartbeatSource;
    v7 = dispatch_time(0, 0);
    dispatch_source_set_timer(v6, v7, 0x77359400uLL, 0x989680uLL);
    v8 = self->__heartbeatSource;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __67__CAMKeepAliveController__keepAliveQueueCreateHeartbeatIfNecessary__block_invoke;
    v9[3] = &unk_1EA329490;
    objc_copyWeak(&v10, &location);
    dispatch_source_set_event_handler(v8, v9);
    dispatch_resume((dispatch_object_t)self->__heartbeatSource);
    objc_destroyWeak(&v10);

    objc_destroyWeak(&location);
  }
}

- (OS_dispatch_queue)_heartbeatQueue
{
  return self->__heartbeatQueue;
}

void __67__CAMKeepAliveController__keepAliveQueueCreateHeartbeatIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleHeartbeatSourceEvent");

}

- (void)_handleHeartbeatSourceEvent
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  xpc_object_t v7;
  _xpc_connection_s *v8;
  dispatch_semaphore_t v9;
  _xpc_connection_s *v10;
  NSObject *v11;
  _QWORD barrier[4];
  NSObject *v13;
  _QWORD handler[4];
  id v15;
  id location;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD block[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  -[CAMKeepAliveController _keepAliveQueue](self, "_keepAliveQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CAMKeepAliveController__handleHeartbeatSourceEvent__block_invoke;
  block[3] = &unk_1EA32AB70;
  block[4] = self;
  block[5] = &v25;
  dispatch_sync(v3, block);

  if (!*((_BYTE *)v26 + 24))
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__14;
    v22 = __Block_byref_object_dispose__14;
    v23 = 0;
    -[CAMKeepAliveController _keepAliveQueue](self, "_keepAliveQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v17[0] = v4;
    v17[1] = 3221225472;
    v17[2] = __53__CAMKeepAliveController__handleHeartbeatSourceEvent__block_invoke_11;
    v17[3] = &unk_1EA32C0D8;
    v17[4] = self;
    v17[5] = &v18;
    dispatch_sync(v5, v17);

    if (v19[5])
    {
      objc_initWeak(&location, self);
      -[CAMKeepAliveController _heartbeatQueue](self, "_heartbeatQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = xpc_dictionary_create(0, 0, 0);
      v8 = (_xpc_connection_s *)v19[5];
      handler[0] = v4;
      handler[1] = 3221225472;
      handler[2] = __53__CAMKeepAliveController__handleHeartbeatSourceEvent__block_invoke_2;
      handler[3] = &unk_1EA32D8C0;
      objc_copyWeak(&v15, &location);
      xpc_connection_send_message_with_reply(v8, v7, v6, handler);
      v9 = dispatch_semaphore_create(0);
      v10 = (_xpc_connection_s *)v19[5];
      barrier[0] = v4;
      barrier[1] = 3221225472;
      barrier[2] = __53__CAMKeepAliveController__handleHeartbeatSourceEvent__block_invoke_3;
      barrier[3] = &unk_1EA328868;
      v11 = v9;
      v13 = v11;
      xpc_connection_send_barrier(v10, barrier);
      dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    _Block_object_dispose(&v18, 8);

  }
  _Block_object_dispose(&v25, 8);
}

void __53__CAMKeepAliveController__handleHeartbeatSourceEvent__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_heartbeatSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 == 0;

}

- (OS_dispatch_source)_heartbeatSource
{
  return self->__heartbeatSource;
}

- (OS_xpc_object)_connection
{
  return self->__connection;
}

- (void)_handleHeartbeatConnectionReply:(id)a3
{
  id v4;
  NSObject *v5;
  const char *string;
  NSObject *v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[CAMKeepAliveController _keepAliveQueue](self, "_keepAliveQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__CAMKeepAliveController__handleHeartbeatConnectionReply___block_invoke;
  v8[3] = &unk_1EA32AB70;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v5, v8);

  if (!*((_BYTE *)v10 + 24) && MEMORY[0x1DF0B5D08](v4) == MEMORY[0x1E0C81310])
  {
    string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E0C81270]);
    v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = string;
      _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "Cancelling assetsd keep-alive because a reply was received with an error! (%s)", buf, 0xCu);
    }

    -[CAMKeepAliveController _teardownHeartbeat](self, "_teardownHeartbeat");
  }
  _Block_object_dispose(&v9, 8);

}

void __58__CAMKeepAliveController__handleHeartbeatConnectionReply___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_heartbeatSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 == 0;

}

- (void)_teardownConnection
{
  NSObject *v3;
  _QWORD block[5];

  -[CAMKeepAliveController _keepAliveQueue](self, "_keepAliveQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CAMKeepAliveController__teardownConnection__block_invoke;
  block[3] = &unk_1EA328868;
  block[4] = self;
  dispatch_sync(v3, block);

  -[CAMKeepAliveController _teardownHeartbeat](self, "_teardownHeartbeat");
}

uint64_t __45__CAMKeepAliveController__teardownConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_keepAliveQueueTeardownConnection");
}

- (void)_keepAliveQueueTeardownConnection
{
  _xpc_connection_s *v3;

  if (self->__connection)
  {
    -[CAMKeepAliveController _connection](self, "_connection");
    v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_cancel(v3);
    -[CAMKeepAliveController _setConnection:](self, "_setConnection:", 0);

  }
}

void __68__CAMKeepAliveController__keepAliveQueueCreateConnectionIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  const char *string;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (MEMORY[0x1DF0B5D08]() == MEMORY[0x1E0C81310])
  {
    string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x1E0C81270]);
    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = string;
      _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "Lost keep-alive connection to assetsd! (%s)", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)_setConnection:(id)a3
{
  objc_storeStrong((id *)&self->__connection, a3);
}

- (void)_teardownHeartbeat
{
  NSObject *v3;
  _QWORD block[5];

  -[CAMKeepAliveController _keepAliveQueue](self, "_keepAliveQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CAMKeepAliveController__teardownHeartbeat__block_invoke;
  block[3] = &unk_1EA328868;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __44__CAMKeepAliveController__teardownHeartbeat__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_keepAliveQueueTeardownHeartbeat");
}

- (void)_keepAliveQueueTeardownHeartbeat
{
  NSObject *v3;
  NSObject *v4;

  -[CAMKeepAliveController _heartbeatSource](self, "_heartbeatSource");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    dispatch_source_cancel(v3);
    -[CAMKeepAliveController _setHeartbeatSource:](self, "_setHeartbeatSource:", 0);
    v3 = v4;
  }

}

- (void)_setHeartbeatSource:(id)a3
{
  objc_storeStrong((id *)&self->__heartbeatSource, a3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CAMKeepAliveController stopKeepAliveSession](self, "stopKeepAliveSession");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CAMKeepAliveController;
  -[CAMKeepAliveController dealloc](&v4, sel_dealloc);
}

void __53__CAMKeepAliveController__handleHeartbeatSourceEvent__block_invoke_11(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __53__CAMKeepAliveController__handleHeartbeatSourceEvent__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleHeartbeatConnectionReply:", v3);

}

intptr_t __53__CAMKeepAliveController__handleHeartbeatSourceEvent__block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__heartbeatQueue, 0);
  objc_storeStrong((id *)&self->__heartbeatSource, 0);
  objc_storeStrong((id *)&self->__keepAliveQueue, 0);
  objc_storeStrong((id *)&self->__connection, 0);
}

@end
