@implementation AFSiriTether

- (AFSiriTether)init
{
  void *v3;
  AFSiriTether *v4;

  +[AFInstanceContext currentContext](AFInstanceContext, "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AFSiriTether initWithInstanceContext:](self, "initWithInstanceContext:", v3);

  return v4;
}

- (AFSiriTether)initWithInstanceContext:(id)a3
{
  id v4;
  AFSiriTether *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  AFInstanceContext *v9;
  AFInstanceContext *instanceContext;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFSiriTether;
  v5 = -[AFSiriTether init](&v12, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create(0, v6);

    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    v5->_notifyToken = -1;
    if (v4)
    {
      v9 = (AFInstanceContext *)v4;
    }
    else
    {
      +[AFInstanceContext defaultContext](AFInstanceContext, "defaultContext");
      v9 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue();
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v9;

  }
  return v5;
}

- (void)dealloc
{
  int notifyToken;
  objc_super v4;

  notifyToken = self->_notifyToken;
  if (notifyToken != -1)
    notify_cancel(notifyToken);
  v4.receiver = self;
  v4.super_class = (Class)AFSiriTether;
  -[AFSiriTether dealloc](&v4, sel_dealloc);
}

- (void)attach:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  AFAnalyticsEventCreateCurrent(1920, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__AFSiriTether_attach___block_invoke;
  block[3] = &unk_1E3A36E10;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(queue, block);

}

- (void)waitForAttachment:(double)a3
{
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  intptr_t v12;
  NSObject *v13;
  void *v14;
  NSObject *queue;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[4];
  NSObject *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a3 > 0.0 && (v5 = dispatch_group_create()) != 0)
  {
    v6 = v5;
    dispatch_group_enter(v5);
    v7 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __34__AFSiriTether_waitForAttachment___block_invoke;
    v21[3] = &unk_1E3A34448;
    v8 = v6;
    v22 = v8;
    -[AFSiriTether attach:](self, "attach:", v21);
    AFAnalyticsEventCreateCurrent(1918, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[AFSiriTether waitForAttachment:]";
      v25 = 2048;
      v26 = a3;
      _os_log_impl(&dword_19AF50000, v10, OS_LOG_TYPE_INFO, "%s Waiting for attachment %lf", buf, 0x16u);
    }
    v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    v12 = dispatch_group_wait(v8, v11);
    v13 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[AFSiriTether waitForAttachment:]";
      v25 = 1024;
      LODWORD(v26) = v12 == 0;
      _os_log_impl(&dword_19AF50000, v13, OS_LOG_TYPE_INFO, "%s Wait finished %d", buf, 0x12u);
    }
    AFAnalyticsEventCreateCurrent(1919, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __34__AFSiriTether_waitForAttachment___block_invoke_8;
    v18[3] = &unk_1E3A36B90;
    v18[4] = self;
    v19 = v9;
    v20 = v14;
    v16 = v14;
    v17 = v9;
    dispatch_async(queue, v18);

  }
  else
  {
    -[AFSiriTether attach:](self, "attach:", 0);
  }
}

- (void)setAttachmentStatusChangedHandler:(id)a3
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
  v7[2] = __50__AFSiriTether_setAttachmentStatusChangedHandler___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)_connection
{
  OS_xpc_object *connection;
  void *v4;
  NSObject *v5;
  OS_xpc_object **p_connection;
  OS_xpc_object *v7;
  AFInstanceContext *instanceContext;
  _QWORD handler[4];
  id v11;
  id v12;
  id from;
  _BYTE location[12];
  __int16 v15;
  AFInstanceContext *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  connection = self->_connection;
  if (!connection)
  {
    -[AFInstanceContext createXPCConnectionForMachService:targetQueue:flags:](self->_instanceContext, "createXPCConnectionForMachService:targetQueue:flags:", AFSiriTetherMachService, self->_queue, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_initWeak((id *)location, self);
      objc_initWeak(&from, v4);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __27__AFSiriTether__connection__block_invoke;
      handler[3] = &unk_1E3A34470;
      objc_copyWeak(&v11, (id *)location);
      objc_copyWeak(&v12, &from);
      xpc_connection_set_event_handler((xpc_connection_t)v4, handler);
      xpc_connection_activate((xpc_connection_t)v4);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&from);
      objc_destroyWeak((id *)location);
    }
    else
    {
      v5 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        instanceContext = self->_instanceContext;
        *(_DWORD *)location = 136315394;
        *(_QWORD *)&location[4] = "-[AFSiriTether _connection]";
        v15 = 2112;
        v16 = instanceContext;
        _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s Unable to create XPC connection from %@.", location, 0x16u);
      }
    }
    v7 = self->_connection;
    p_connection = &self->_connection;
    *p_connection = (OS_xpc_object *)v4;

    connection = *p_connection;
  }
  return connection;
}

- (void)_connectionInterrupted:(id)a3
{
  if (self->_connection == a3)
    -[AFSiriTether _attachmentStatusUpdate:](self, "_attachmentStatusUpdate:", 0);
}

- (void)_connectionInvalid:(id)a3
{
  OS_xpc_object *connection;
  OS_xpc_object *v6;

  connection = self->_connection;
  if (connection == a3 && connection != 0)
  {
    xpc_connection_cancel((xpc_connection_t)a3);
    v6 = self->_connection;
    self->_connection = 0;

    -[AFSiriTether _attachmentStatusUpdate:](self, "_attachmentStatusUpdate:", 0);
  }
}

- (void)_attach:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  _xpc_connection_s *v6;
  NSObject *v7;
  xpc_object_t v8;
  NSObject *queue;
  _QWORD handler[5];
  void (**v11)(_QWORD, _QWORD);
  xpc_object_t values;
  _BYTE buf[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (self->_isAttached)
  {
    if (v4)
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
  else
  {
    -[AFSiriTether _listenForLaunchNotification](self, "_listenForLaunchNotification");
    -[AFSiriTether _connection](self, "_connection");
    v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[AFSiriTether _attach:]";
        _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s Sending attachment message", buf, 0xCu);
      }
      *(_QWORD *)buf = "attach";
      values = xpc_BOOL_create(1);
      v8 = xpc_dictionary_create((const char *const *)buf, &values, 1uLL);
      queue = self->_queue;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __24__AFSiriTether__attach___block_invoke;
      handler[3] = &unk_1E3A35578;
      handler[4] = self;
      v11 = v5;
      xpc_connection_send_message_with_reply(v6, v8, queue, handler);

    }
    else if (v5)
    {
      v5[2](v5, 0);
    }

  }
}

- (void)_attachmentStatusUpdate:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void (**attachmentStatusChangedHandler)(id, BOOL);
  int v9;
  const char *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_isAttached != a3)
  {
    v3 = a3;
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v9 = 136315394;
      v10 = "-[AFSiriTether _attachmentStatusUpdate:]";
      v11 = 1024;
      v12 = v3;
      _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v9, 0x12u);
    }
    self->_isAttached = v3;
    if (v3)
      v6 = 1922;
    else
      v6 = 1923;
    AFAnalyticsEventCreateCurrent(v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFSiriTether _logEvent:](self, "_logEvent:", v7);

    attachmentStatusChangedHandler = (void (**)(id, BOOL))self->_attachmentStatusChangedHandler;
    if (attachmentStatusChangedHandler)
      attachmentStatusChangedHandler[2](attachmentStatusChangedHandler, self->_isAttached);
  }
}

- (void)_listenForLaunchNotification
{
  const char *EffectiveNotification;
  NSObject *queue;
  uint32_t v5;
  NSObject *v6;
  _QWORD handler[4];
  id v8;
  id location;
  int out_token;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint32_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_notifyToken == -1)
  {
    out_token = -1;
    objc_initWeak(&location, self);
    EffectiveNotification = (const char *)AFNotifyGetEffectiveNotification((uint64_t)"com.apple.siri.daemon_launched", self->_instanceContext);
    queue = self->_queue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __44__AFSiriTether__listenForLaunchNotification__block_invoke;
    handler[3] = &unk_1E3A344A0;
    objc_copyWeak(&v8, &location);
    v5 = notify_register_dispatch(EffectiveNotification, &out_token, queue, handler);
    if (v5)
    {
      v6 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[AFSiriTether _listenForLaunchNotification]";
        v13 = 1024;
        v14 = v5;
        _os_log_error_impl(&dword_19AF50000, v6, OS_LOG_TYPE_ERROR, "%s Notify register failed %u", buf, 0x12u);
      }
    }
    else
    {
      self->_notifyToken = out_token;
    }
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_logEvent:(id)a3
{
  id v4;
  NSMutableArray *pendingEvents;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  id v12;

  v4 = a3;
  pendingEvents = self->_pendingEvents;
  v12 = v4;
  if (self->_isAttached)
  {
    if (-[NSMutableArray count](pendingEvents, "count"))
    {
      v6 = self->_pendingEvents;
      self->_pendingEvents = 0;
      v7 = v6;

      +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logEvents:", v7);

    }
    +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logEvent:", v12);

  }
  else
  {
    if (!pendingEvents)
    {
      v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v11 = self->_pendingEvents;
      self->_pendingEvents = v10;

      v4 = v12;
      pendingEvents = self->_pendingEvents;
    }
    -[NSMutableArray addObject:](pendingEvents, "addObject:", v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong(&self->_attachmentStatusChangedHandler, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __44__AFSiriTether__listenForLaunchNotification__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "attach:", 0);

}

uint64_t __24__AFSiriTether__attach___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  const char *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1A1AC0F84](a2);
  v4 = AFSiriLogContextConnection;
  v5 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
  v6 = MEMORY[0x1E0C812F8];
  if (v5)
  {
    v9 = 136315394;
    v10 = "-[AFSiriTether _attach:]_block_invoke";
    v11 = 1024;
    v12 = v3 == MEMORY[0x1E0C812F8];
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s Attachment Reply %d", (uint8_t *)&v9, 0x12u);
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, v3 == v6);
  return objc_msgSend(*(id *)(a1 + 32), "_attachmentStatusUpdate:", v3 == v6);
}

void __27__AFSiriTether__connection__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  id WeakRetained;

  if (MEMORY[0x1A1AC0F84](a2) == MEMORY[0x1E0C81310])
  {
    if (a2 == MEMORY[0x1E0C81258])
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      v4 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(WeakRetained, "_connectionInterrupted:", v4);
    }
    else
    {
      if (a2 != MEMORY[0x1E0C81260])
        return;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      v4 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(WeakRetained, "_connectionInvalid:", v4);
    }

  }
}

void __50__AFSiriTether_setAttachmentStatusChangedHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A1AC0C3C](*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __34__AFSiriTether_waitForAttachment___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __34__AFSiriTether_waitForAttachment___block_invoke_8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_logEvent:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_logEvent:", *(_QWORD *)(a1 + 48));
}

void __23__AFSiriTether_attach___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_logEvent:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __23__AFSiriTether_attach___block_invoke_2;
  v3[3] = &unk_1E3A34420;
  v3[4] = v2;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_attach:", v3);

}

uint64_t __23__AFSiriTether_attach___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t result;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v9 = CFSTR("attached");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AFAnalyticsEventCreateCurrent(1921, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_logEvent:", v7);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

@end
