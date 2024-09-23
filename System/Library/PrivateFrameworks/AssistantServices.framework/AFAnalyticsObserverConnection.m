@implementation AFAnalyticsObserverConnection

- (AFAnalyticsObserverConnection)initWithObservation:(id)a3
{
  id v4;
  AFAnalyticsObserverConnection *v5;
  dispatch_semaphore_t v6;
  OS_dispatch_semaphore *semaphore;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  id observationHandler;
  NSObject *v14;
  _QWORD block[4];
  AFAnalyticsObserverConnection *v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AFAnalyticsObserverConnection;
  v5 = -[AFAnalyticsObserverConnection init](&v18, sel_init);
  if (v5)
  {
    v6 = dispatch_semaphore_create(0);
    semaphore = v5->_semaphore;
    v5->_semaphore = (OS_dispatch_semaphore *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = dispatch_queue_create("com.apple.assistant.analytics-observation.connection", v9);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v10;

    v12 = MEMORY[0x1A1AC0C3C](v4);
    observationHandler = v5->_observationHandler;
    v5->_observationHandler = (id)v12;

    v14 = v5->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__AFAnalyticsObserverConnection_initWithObservation___block_invoke;
    block[3] = &unk_1E3A36F30;
    v17 = v5;
    dispatch_async(v14, block);

  }
  return v5;
}

- (void)waitUntilInvalidated
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)flushWithCompletion:(id)a3
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
  v5 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[AFAnalyticsObserverConnection flushWithCompletion:]";
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s begin", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__AFAnalyticsObserverConnection_flushWithCompletion___block_invoke;
  v8[3] = &unk_1E3A36FA0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

- (void)dealloc
{
  objc_super v3;

  -[AFAnalyticsObserverConnection _cleanUpConnection](self, "_cleanUpConnection");
  v3.receiver = self;
  v3.super_class = (Class)AFAnalyticsObserverConnection;
  -[AFAnalyticsObserverConnection dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AFAnalyticsObserverConnection_invalidate__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)didObserveEvents:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void (**observationHandler)(id, id);
  id v8;

  v8 = a3;
  v6 = (void (**)(_QWORD))a4;
  observationHandler = (void (**)(id, id))self->_observationHandler;
  if (observationHandler)
    observationHandler[2](observationHandler, v8);
  if (v6)
    v6[2](v6);

}

- (void)_cleanUpConnection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;

  connection = self->_connection;
  if (connection)
  {
    -[NSXPCConnection setExportedObject:](connection, "setExportedObject:", 0);
    -[NSXPCConnection invalidate](self->_connection, "invalidate");
    v4 = self->_connection;
    self->_connection = 0;

  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
}

- (id)_connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  id v7;
  NSXPCConnection *v8;
  void *v9;
  NSXPCConnection *v10;
  uint64_t v11;
  NSXPCConnection *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.assistant.analytics-observation"), 0);
    v5 = self->_connection;
    self->_connection = v4;

    -[NSXPCConnection _setQueue:](self->_connection, "_setQueue:", self->_queue);
    v6 = self->_connection;
    v7 = (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE432558);
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);

    v8 = self->_connection;
    AFAnalyticsObserverGetXPCInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v8, "setExportedInterface:", v9);

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    objc_initWeak(&location, self);
    v10 = self->_connection;
    v11 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __44__AFAnalyticsObserverConnection__connection__block_invoke;
    v16[3] = &unk_1E3A35AE0;
    objc_copyWeak(&v17, &location);
    -[NSXPCConnection setInterruptionHandler:](v10, "setInterruptionHandler:", v16);
    v12 = self->_connection;
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __44__AFAnalyticsObserverConnection__connection__block_invoke_2;
    v14[3] = &unk_1E3A35AE0;
    objc_copyWeak(&v15, &location);
    -[NSXPCConnection setInvalidationHandler:](v12, "setInvalidationHandler:", v14);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

- (void)_connectionInterrupted
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[AFAnalyticsObserverConnection _connectionInterrupted]";
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__AFAnalyticsObserverConnection__connectionInterrupted__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_connectionInvalidated
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[AFAnalyticsObserverConnection _connectionInvalidated]";
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__AFAnalyticsObserverConnection__connectionInvalidated__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observationHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __55__AFAnalyticsObserverConnection__connectionInvalidated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanUpConnection");
}

uint64_t __55__AFAnalyticsObserverConnection__connectionInterrupted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanUpConnection");
}

void __44__AFAnalyticsObserverConnection__connection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInterrupted");

}

void __44__AFAnalyticsObserverConnection__connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInvalidated");

}

uint64_t __43__AFAnalyticsObserverConnection_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanUpConnection");
}

void __53__AFAnalyticsObserverConnection_flushWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_36829);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__AFAnalyticsObserverConnection_flushWithCompletion___block_invoke_4;
  v4[3] = &unk_1E3A36BB8;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "flushWithCompletion:", v4);

}

uint64_t __53__AFAnalyticsObserverConnection_flushWithCompletion___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[AFAnalyticsObserverConnection flushWithCompletion:]_block_invoke";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s end", (uint8_t *)&v4, 0xCu);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __53__AFAnalyticsObserverConnection_flushWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFAnalyticsObserverConnection flushWithCompletion:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s end with error %@", (uint8_t *)&v4, 0x16u);
  }

}

void __53__AFAnalyticsObserverConnection_initWithObservation___block_invoke(uint64_t a1)
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
  v7[2] = __53__AFAnalyticsObserverConnection_initWithObservation___block_invoke_2;
  v7[3] = &unk_1E3A36A00;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __53__AFAnalyticsObserverConnection_initWithObservation___block_invoke_2;
  v5[3] = &unk_1E3A36F30;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "observeWithCompletion:", v5);

}

void __53__AFAnalyticsObserverConnection_initWithObservation___block_invoke_2(uint64_t a1, void *a2)
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
  v4 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[AFAnalyticsObserverConnection initWithObservation:]_block_invoke_2";
    v7 = 2112;
    v8 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v5, 0x16u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 16));

}

intptr_t __53__AFAnalyticsObserverConnection_initWithObservation___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 16));
}

@end
