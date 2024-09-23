@implementation AFSiriTaskService

- (AFSiriTaskService)initWithMachServiceName:(id)a3
{
  id v4;
  NSObject *v5;
  AFSiriTaskService *v6;
  id v7;
  const char *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  NSXPCListener *listener;
  AFSiriTaskDeliveryHandler *v14;
  AFSiriTaskDeliveryHandler *deliveryHandler;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[AFSiriTaskService initWithMachServiceName:]";
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  v17.receiver = self;
  v17.super_class = (Class)AFSiriTaskService;
  v6 = -[AFSiriTaskService init](&v17, sel_init);
  if (v6)
  {
    objc_msgSend(CFSTR("SiriTaskService-"), "stringByAppendingString:", v4);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create(v8, v9);

    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", v4);
    listener = v6->_listener;
    v6->_listener = (NSXPCListener *)v12;

    -[NSXPCListener setDelegate:](v6->_listener, "setDelegate:", v6);
    v14 = objc_alloc_init(AFSiriTaskDeliveryHandler);
    deliveryHandler = v6->_deliveryHandler;
    v6->_deliveryHandler = v14;

    -[AFSiriTaskDeliveryHandler setQueue:](v6->_deliveryHandler, "setQueue:", v6->_queue);
    -[AFSiriTaskDeliveryHandler setService:](v6->_deliveryHandler, "setService:", v6);

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AFSiriTaskService;
  -[AFSiriTaskService dealloc](&v3, sel_dealloc);
}

- (void)resume
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__AFSiriTaskService_resume__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setDelegate:(id)a3
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
  v7[2] = __33__AFSiriTaskService_setDelegate___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  char v7;
  NSObject *queue;
  id v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  AFSiriTaskService *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.siri.task.client"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) != 0)
  {
    queue = self->_queue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__AFSiriTaskService_listener_shouldAcceptNewConnection___block_invoke;
    v13[3] = &unk_1E3A36FC8;
    v9 = v5;
    v14 = v9;
    v15 = self;
    dispatch_async(queue, v13);
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[AFSiriTaskService listener:shouldAcceptNewConnection:]";
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_19AF50000, v10, OS_LOG_TYPE_INFO, "%s accepting incoming connection (%@)", buf, 0x16u);
    }

  }
  else
  {
    v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v17 = "-[AFSiriTaskService listener:shouldAcceptNewConnection:]";
      v18 = 2112;
      v19 = v5;
      v20 = 2112;
      v21 = CFSTR("com.apple.siri.task.client");
      _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s rejecting incoming connection (%@) because it doesn't have the \"%@\" entitlement", buf, 0x20u);
    }
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryHandler, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __56__AFSiriTaskService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3B50], "af_siriTaskDeliveringInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setExportedInterface:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setExportedObject:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  return objc_msgSend(*(id *)(a1 + 32), "resume");
}

uint64_t __33__AFSiriTaskService_setDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDelegate:", *(_QWORD *)(a1 + 40));
}

uint64_t __27__AFSiriTaskService_resume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resume");
}

+ (id)_machServiceNameForAppTaskServiceWithBundleIdentifier:(id)a3
{
  return (id)objc_msgSend(CFSTR("com.apple.siri.task.app."), "stringByAppendingString:", a3);
}

+ (id)appTaskService
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("AFSiriTaskService.m"), 48, CFSTR("Cannot create an app task service for a process without a bundle"));

  }
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_machServiceNameForAppTaskServiceWithBundleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMachServiceName:", v6);

  return v7;
}

@end
