@implementation AFAnalyticsConnection

- (AFAnalyticsConnection)init
{
  AFAnalyticsConnection *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  dispatch_group_t v7;
  OS_dispatch_group *group;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AFAnalyticsConnection;
  v2 = -[AFAnalyticsConnection init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.assistant.analytics.connection", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v7;

  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[AFAnalyticsConnection dealloc]";
    _os_log_debug_impl(&dword_19AF50000, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  -[AFAnalyticsConnection _stopIdleTimer](self, "_stopIdleTimer");
  -[AFAnalyticsConnection _cleanUpConnection](self, "_cleanUpConnection");
  v4.receiver = self;
  v4.super_class = (Class)AFAnalyticsConnection;
  -[AFAnalyticsConnection dealloc](&v4, sel_dealloc);
}

- (void)stageEvents:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  NSObject *queue;
  id v10;
  NSObject *group;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  void (**v15)(_QWORD);
  _QWORD block[5];
  id v17;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = MEMORY[0x1E0C809B0];
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__AFAnalyticsConnection_stageEvents_completion___block_invoke;
    block[3] = &unk_1E3A36FC8;
    block[4] = self;
    v10 = v6;
    v17 = v10;
    dispatch_async(queue, block);
    group = self->_group;
    v12 = self->_queue;
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __48__AFAnalyticsConnection_stageEvents_completion___block_invoke_2;
    v13[3] = &unk_1E3A36E10;
    v13[4] = self;
    v14 = v10;
    v15 = v7;
    dispatch_group_notify(group, v12, v13);

  }
  else if (v7)
  {
    v7[2](v7);
  }

}

- (void)beginEventsGrouping
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[AFAnalyticsConnection beginEventsGrouping]";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  dispatch_group_enter((dispatch_group_t)self->_group);
}

- (void)endEventsGrouping
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[AFAnalyticsConnection endEventsGrouping]";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  dispatch_group_leave((dispatch_group_t)self->_group);
}

- (void)logInstrumentationOfType:(id)a3 machAbsoluteTime:(unint64_t)a4 turnIdentifier:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__AFAnalyticsConnection_logInstrumentationOfType_machAbsoluteTime_turnIdentifier___block_invoke;
  v13[3] = &unk_1E3A32C20;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

- (void)stageUEIEventData:(id)a3 timestamp:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__AFAnalyticsConnection_stageUEIEventData_timestamp_completion___block_invoke;
  v13[3] = &unk_1E3A2F350;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

- (void)_stageUEIEventData:(id)a3 timestamp:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[AFAnalyticsConnection _stageUEIEventData:timestamp:completion:]";
    _os_log_debug_impl(&dword_19AF50000, v10, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  -[AFAnalyticsConnection _stopIdleTimer](self, "_stopIdleTimer");
  v11 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __65__AFAnalyticsConnection__stageUEIEventData_timestamp_completion___block_invoke;
  v24[3] = &unk_1E3A36FA0;
  v24[4] = self;
  v25 = v9;
  v12 = v9;
  v13 = (void *)MEMORY[0x1A1AC0C3C](v24);
  -[AFAnalyticsConnection _connection](self, "_connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __65__AFAnalyticsConnection__stageUEIEventData_timestamp_completion___block_invoke_2;
  v21[3] = &unk_1E3A32F48;
  v22 = v8;
  v15 = v13;
  v23 = v15;
  v16 = v8;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __65__AFAnalyticsConnection__stageUEIEventData_timestamp_completion___block_invoke_5;
  v19[3] = &unk_1E3A36BB8;
  v20 = v15;
  v18 = v15;
  objc_msgSend(v17, "stageUEIEventData:timestamp:completion:", v16, a4, v19);

}

- (void)flushStagedEventsWithReply:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__AFAnalyticsConnection_flushStagedEventsWithReply___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "barrier:", v7);

}

- (void)boostQueuedEvents:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
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
    v11 = "-[AFAnalyticsConnection boostQueuedEvents:]";
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__AFAnalyticsConnection_boostQueuedEvents___block_invoke;
  v8[3] = &unk_1E3A36FA0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "boostQueuedEvents:", v8);

}

- (void)_sendEvents:(id)a3 numberOfRetries:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  unint64_t v23;

  v8 = a3;
  v9 = a5;
  -[AFAnalyticsConnection _connection](self, "_connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __64__AFAnalyticsConnection__sendEvents_numberOfRetries_completion___block_invoke;
  v20[3] = &unk_1E3A2E258;
  v20[4] = self;
  v12 = v8;
  v21 = v12;
  v23 = a4;
  v13 = v9;
  v22 = v13;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __64__AFAnalyticsConnection__sendEvents_numberOfRetries_completion___block_invoke_3;
  v17[3] = &unk_1E3A36E10;
  v17[4] = self;
  v18 = v12;
  v19 = v13;
  v15 = v13;
  v16 = v12;
  objc_msgSend(v14, "stageEvents:completion:", v16, v17);

}

- (void)_handleFailureCallbackForEvents:(id)a3 error:(id)a4 numberOfRetries:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  dispatch_time_t v14;
  NSObject *queue;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  void (**v21)(id, void *);
  unint64_t v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *))a6;
  v13 = (void *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
  {
    v18 = v13;
    *(_DWORD *)buf = 136315906;
    v24 = "-[AFAnalyticsConnection _handleFailureCallbackForEvents:error:numberOfRetries:completion:]";
    v25 = 2048;
    v26 = objc_msgSend(v10, "count");
    v27 = 2112;
    v28 = v11;
    v29 = 2048;
    v30 = a5;
    _os_log_error_impl(&dword_19AF50000, v18, OS_LOG_TYPE_ERROR, "%s Failed to send %tu events due to %@. (numberOfRetries = %tu)", buf, 0x2Au);

  }
  if (a5 > 2)
  {
    v16 = AFSiriLogContextAnalytics;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[AFAnalyticsConnection _handleFailureCallbackForEvents:error:numberOfRetries:completion:]";
      v25 = 2112;
      v26 = (uint64_t)v10;
      _os_log_error_impl(&dword_19AF50000, v16, OS_LOG_TYPE_ERROR, "%s Dropping %@ because the maximum number of retries was reached.", buf, 0x16u);
      if (!v12)
        goto LABEL_8;
    }
    else if (!v12)
    {
      goto LABEL_8;
    }
    +[AFError errorWithCode:description:underlyingError:](AFError, "errorWithCode:description:underlyingError:", 2202, 0, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v17);

    goto LABEL_8;
  }
  v14 = dispatch_time(0, 1000000000);
  queue = self->_queue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __90__AFAnalyticsConnection__handleFailureCallbackForEvents_error_numberOfRetries_completion___block_invoke;
  v19[3] = &unk_1E3A2F350;
  v19[4] = self;
  v20 = v10;
  v22 = a5;
  v21 = v12;
  dispatch_after(v14, queue, v19);

LABEL_8:
}

- (void)_handleSuccessCallbackForEvents:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)_willStartSendingEvents:(id)a3
{
  unint64_t v4;

  v4 = self->_numberOfEventsBeingSent + objc_msgSend(a3, "count");
  self->_numberOfEventsBeingSent = v4;
  if (v4)
    -[AFAnalyticsConnection _stopIdleTimer](self, "_stopIdleTimer");
}

- (void)_didFinishSendingEvents:(id)a3
{
  unint64_t v4;

  v4 = self->_numberOfEventsBeingSent - objc_msgSend(a3, "count");
  self->_numberOfEventsBeingSent = v4;
  if (!v4)
    -[AFAnalyticsConnection _startIdleTimer](self, "_startIdleTimer");
}

- (id)_connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
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

  -[AFAnalyticsConnection _cleanUpConnectionIfNeeded](self, "_cleanUpConnectionIfNeeded");
  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.assistant.analytics"), 0);
    v5 = self->_connection;
    self->_connection = v4;

    -[NSXPCConnection _setQueue:](self->_connection, "_setQueue:", self->_queue);
    v6 = self->_connection;
    AFAnalyticsServiceGetXPCInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    v8 = self->_connection;
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3F1228);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v8, "setExportedInterface:", v9);

    objc_initWeak(&location, self);
    v10 = self->_connection;
    v11 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __36__AFAnalyticsConnection__connection__block_invoke;
    v16[3] = &unk_1E3A35AE0;
    objc_copyWeak(&v17, &location);
    -[NSXPCConnection setInterruptionHandler:](v10, "setInterruptionHandler:", v16);
    v12 = self->_connection;
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __36__AFAnalyticsConnection__connection__block_invoke_2;
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
  NSObject *queue;
  _QWORD block[5];

  -[AFAnalyticsConnection setNeedsCleanUpConnection:](self, "setNeedsCleanUpConnection:", 1);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AFAnalyticsConnection__connectionInterrupted__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_connectionInvalidated
{
  NSObject *queue;
  _QWORD block[5];

  -[AFAnalyticsConnection setNeedsCleanUpConnection:](self, "setNeedsCleanUpConnection:", 1);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AFAnalyticsConnection__connectionInvalidated__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_cleanUpConnectionIfNeeded
{
  if (-[AFAnalyticsConnection needsCleanUpConnection](self, "needsCleanUpConnection"))
    -[AFAnalyticsConnection _cleanUpConnection](self, "_cleanUpConnection");
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
  -[AFAnalyticsConnection setNeedsCleanUpConnection:](self, "setNeedsCleanUpConnection:", 0);
}

- (void)_startIdleTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *idleTimer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  if (!self->_idleTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
    idleTimer = self->_idleTimer;
    self->_idleTimer = v3;

    v5 = self->_idleTimer;
    v6 = dispatch_time(0, 4000000000);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak(&location, self);
    v7 = self->_idleTimer;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __40__AFAnalyticsConnection__startIdleTimer__block_invoke;
    v8[3] = &unk_1E3A35AE0;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler(v7, v8);
    dispatch_resume((dispatch_object_t)self->_idleTimer);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_stopIdleTimer
{
  NSObject *idleTimer;
  OS_dispatch_source *v4;

  idleTimer = self->_idleTimer;
  if (idleTimer)
  {
    dispatch_source_cancel(idleTimer);
    v4 = self->_idleTimer;
    self->_idleTimer = 0;

  }
}

- (void)_idleTimerFired
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[AFAnalyticsConnection _idleTimerFired]";
    _os_log_debug_impl(&dword_19AF50000, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v4, 0xCu);
  }
  -[AFAnalyticsConnection _stopIdleTimer](self, "_stopIdleTimer");
  -[AFAnalyticsConnection _cleanUpConnection](self, "_cleanUpConnection");
}

- (BOOL)needsCleanUpConnection
{
  return self->_needsCleanUpConnection;
}

- (void)setNeedsCleanUpConnection:(BOOL)a3
{
  self->_needsCleanUpConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __40__AFAnalyticsConnection__startIdleTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_idleTimerFired");

}

uint64_t __47__AFAnalyticsConnection__connectionInvalidated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanUpConnectionIfNeeded");
}

uint64_t __47__AFAnalyticsConnection__connectionInterrupted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanUpConnectionIfNeeded");
}

void __36__AFAnalyticsConnection__connection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInterrupted");

}

void __36__AFAnalyticsConnection__connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInvalidated");

}

uint64_t __90__AFAnalyticsConnection__handleFailureCallbackForEvents_error_numberOfRetries_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendEvents:numberOfRetries:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56) + 1, *(_QWORD *)(a1 + 48));
}

void __64__AFAnalyticsConnection__sendEvents_numberOfRetries_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  v4 = a1[4];
  v5 = (void *)a1[5];
  v6 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__AFAnalyticsConnection__sendEvents_numberOfRetries_completion___block_invoke_2;
  block[3] = &unk_1E3A2E230;
  block[4] = v4;
  v10 = v5;
  v11 = v3;
  v7 = (void *)a1[6];
  v13 = a1[7];
  v12 = v7;
  v8 = v3;
  dispatch_async(v6, block);

}

void __64__AFAnalyticsConnection__sendEvents_numberOfRetries_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__AFAnalyticsConnection__sendEvents_numberOfRetries_completion___block_invoke_4;
  block[3] = &unk_1E3A36E10;
  block[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __64__AFAnalyticsConnection__sendEvents_numberOfRetries_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSuccessCallbackForEvents:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __64__AFAnalyticsConnection__sendEvents_numberOfRetries_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleFailureCallbackForEvents:error:numberOfRetries:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

void __43__AFAnalyticsConnection_boostQueuedEvents___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  dispatch_block_t v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_DWORD *)buf = 136315394;
    v9 = "-[AFAnalyticsConnection boostQueuedEvents:]_block_invoke";
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s Boosting XPC queue %@", buf, 0x16u);
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__AFAnalyticsConnection_boostQueuedEvents___block_invoke_7;
  v6[3] = &unk_1E3A36FA0;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_DEFAULT, 0, v6);
  dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8), v5);

}

uint64_t __43__AFAnalyticsConnection_boostQueuedEvents___block_invoke_7(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = 136315394;
    v6 = "-[AFAnalyticsConnection boostQueuedEvents:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s Completed boosting XPC queue %@", (uint8_t *)&v5, 0x16u);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __52__AFAnalyticsConnection_flushStagedEventsWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  AFAnalyticsEventCreateCurrent(2, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(a1 + 32);
  v5 = MEMORY[0x1E0C809B0];
  v6 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AFAnalyticsConnection_flushStagedEventsWithReply___block_invoke_2;
  block[3] = &unk_1E3A36FC8;
  block[4] = v4;
  v7 = v3;
  v17 = v7;
  dispatch_async(v6, block);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v10 = *(NSObject **)(v8 + 40);
  v11 = *(NSObject **)(v8 + 8);
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __52__AFAnalyticsConnection_flushStagedEventsWithReply___block_invoke_3;
  v13[3] = &unk_1E3A36E10;
  v13[4] = v8;
  v14 = v7;
  v15 = v9;
  v12 = v7;
  dispatch_group_notify(v10, v11, v13);

}

uint64_t __52__AFAnalyticsConnection_flushStagedEventsWithReply___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_willStartSendingEvents:", *(_QWORD *)(a1 + 40));
}

void __52__AFAnalyticsConnection_flushStagedEventsWithReply___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__AFAnalyticsConnection_flushStagedEventsWithReply___block_invoke_4;
  v4[3] = &unk_1E3A32E00;
  v4[4] = v3;
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "_sendEvents:numberOfRetries:completion:", v5, 0, v4);

}

void __52__AFAnalyticsConnection_flushStagedEventsWithReply___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_didFinishSendingEvents:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

uint64_t __65__AFAnalyticsConnection__stageUEIEventData_timestamp_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_startIdleTimer");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __65__AFAnalyticsConnection__stageUEIEventData_timestamp_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[AFAnalyticsConnection _stageUEIEventData:timestamp:completion:]_block_invoke_2";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s Failed to stage UEI event: %@ error: %@", (uint8_t *)&v6, 0x20u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __65__AFAnalyticsConnection__stageUEIEventData_timestamp_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__AFAnalyticsConnection_stageUEIEventData_timestamp_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stageUEIEventData:timestamp:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __82__AFAnalyticsConnection_logInstrumentationOfType_machAbsoluteTime_turnIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_6309);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logInstrumentationOfType:machAbsoluteTime:turnIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

void __82__AFAnalyticsConnection_logInstrumentationOfType_machAbsoluteTime_turnIdentifier___block_invoke_2(uint64_t a1, void *a2)
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
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[AFAnalyticsConnection logInstrumentationOfType:machAbsoluteTime:turnIdentifier:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s Error with remoteObjectProxy: %@", (uint8_t *)&v4, 0x16u);
  }

}

uint64_t __48__AFAnalyticsConnection_stageEvents_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_willStartSendingEvents:", *(_QWORD *)(a1 + 40));
}

void __48__AFAnalyticsConnection_stageEvents_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__AFAnalyticsConnection_stageEvents_completion___block_invoke_3;
  v4[3] = &unk_1E3A32E00;
  v4[4] = v3;
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "_sendEvents:numberOfRetries:completion:", v5, 0, v4);

}

uint64_t __48__AFAnalyticsConnection_stageEvents_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_didFinishSendingEvents:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
