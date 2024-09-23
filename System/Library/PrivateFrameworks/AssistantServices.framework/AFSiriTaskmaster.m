@implementation AFSiriTaskmaster

- (AFSiriTaskmaster)initWithTaskDeliverer:(id)a3
{
  id v5;
  AFSiriTaskmaster *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  NSMapTable *executorForRequest;
  uint64_t v12;
  NSXPCListener *usageResultListener;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AFSiriTaskmaster;
  v6 = -[AFSiriTaskmaster init](&v15, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("Siri Taskmaster", v7);

    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_taskDeliverer, a3);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    executorForRequest = v6->_executorForRequest;
    v6->_executorForRequest = (NSMapTable *)v10;

    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v12 = objc_claimAutoreleasedReturnValue();
    usageResultListener = v6->_usageResultListener;
    v6->_usageResultListener = (NSXPCListener *)v12;

    -[NSXPCListener setDelegate:](v6->_usageResultListener, "setDelegate:", v6);
    -[NSXPCListener resume](v6->_usageResultListener, "resume");
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener setDelegate:](self->_usageResultListener, "setDelegate:", 0);
  -[NSXPCListener invalidate](self->_usageResultListener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AFSiriTaskmaster;
  -[AFSiriTaskmaster dealloc](&v3, sel_dealloc);
}

- (void)_handleFailureOfRequest:(id)a3 error:(id)a4 atTime:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[NSMapTable objectForKey:](self->_executorForRequest, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "handleFailureOfRequest:error:atTime:", v8, v9, a5);
  }
  else
  {
    v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315394;
      v14 = "-[AFSiriTaskmaster _handleFailureOfRequest:error:atTime:]";
      v15 = 2112;
      v16 = v8;
      _os_log_error_impl(&dword_19AF50000, v12, OS_LOG_TYPE_ERROR, "%s No execution for this request, it can not be failed %@", (uint8_t *)&v13, 0x16u);
    }
  }

}

- (void)handleFailureOfRequest:(id)a3 error:(id)a4 atTime:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  unint64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[AFSiriTaskmaster handleFailureOfRequest:error:atTime:]";
    v20 = 2112;
    v21 = v9;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_19AF50000, v10, OS_LOG_TYPE_INFO, "%s Unexpected failure %@ of request %@", buf, 0x20u);
  }
  queue = self->_queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__AFSiriTaskmaster_handleFailureOfRequest_error_atTime___block_invoke;
  v14[3] = &unk_1E3A32C20;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = a5;
  v12 = v9;
  v13 = v8;
  dispatch_async(queue, v14);

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("<"));
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(" %p; "), self);
  objc_msgSend(v3, "appendString:", CFSTR("taskDeliverer="));
  -[AFSiriTaskDelivering description](self->_taskDeliverer, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  objc_msgSend(v3, "appendString:", CFSTR(", taskExecutions="));
  NSAllMapTableValues(self->_executorForRequest);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v7);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (void)handleSiriRequest:(id)a3 deliveryHandler:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *queue;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD block[4];
  id v22;
  AFSiriTaskmaster *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFSiriTaskmaster.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logEventWithType:context:", 701, 0);

  v13 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    v15 = (void *)MEMORY[0x1A1AC0C3C](v11);
    *(_DWORD *)buf = 136315650;
    v27 = "-[AFSiriTaskmaster handleSiriRequest:deliveryHandler:completionHandler:]";
    v28 = 2112;
    v29 = v9;
    v30 = 2112;
    v31 = v15;
    _os_log_impl(&dword_19AF50000, v14, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__AFSiriTaskmaster_handleSiriRequest_deliveryHandler_completionHandler___block_invoke;
  block[3] = &unk_1E3A32790;
  v22 = v9;
  v23 = self;
  v24 = v10;
  v25 = v11;
  v17 = v11;
  v18 = v10;
  v19 = v9;
  dispatch_async(queue, block);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v9[4];
  id v10;
  AFSiriTaskmaster *v11;

  v5 = a4;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__AFSiriTaskmaster_listener_shouldAcceptNewConnection___block_invoke;
  v9[3] = &unk_1E3A36FC8;
  v10 = v5;
  v11 = self;
  v7 = v5;
  dispatch_async(queue, v9);

  return 1;
}

- (void)handleSiriTaskUsageResult:(id)a3 fromRequest:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  NSXPCListener *usageResultListener;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0D88338];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v8, "_originatingAceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOriginalCommandId:", v10);

  objc_msgSend(v7, "requestName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v11;
  objc_msgSend(v8, "_resultDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOutcomes:", v13);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "taskmaster:didReceivePunchoutOutcome:", self, v9);

  -[NSXPCListener setDelegate:](self->_usageResultListener, "setDelegate:", 0);
  -[NSXPCListener invalidate](self->_usageResultListener, "invalidate");
  usageResultListener = self->_usageResultListener;
  self->_usageResultListener = 0;

}

- (AFSiriTaskmasterDelegate)delegate
{
  return (AFSiriTaskmasterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_executorForRequest, 0);
  objc_storeStrong((id *)&self->_usageResultListener, 0);
  objc_storeStrong((id *)&self->_taskDeliverer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __55__AFSiriTaskmaster_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E3F0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setExportedInterface:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setExportedObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "resume");
}

void __72__AFSiriTaskmaster_handleSiriRequest_deliveryHandler_completionHandler___block_invoke(uint64_t a1)
{
  AFSiriTaskExecution *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *, void *);
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v2 = -[AFSiriTaskExecution initWithRequest:taskDeliverer:usageResultListener:]([AFSiriTaskExecution alloc], "initWithRequest:taskDeliverer:usageResultListener:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setObject:forKey:", v2, *(_QWORD *)(a1 + 32));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v3 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__AFSiriTaskmaster_handleSiriRequest_deliveryHandler_completionHandler___block_invoke_2;
  v12[3] = &unk_1E3A36FA0;
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 48);
  -[AFSiriTaskExecution setDeliveryHandler:](v2, "setDeliveryHandler:", v12);
  v5 = v3;
  v6 = 3221225472;
  v7 = __72__AFSiriTaskmaster_handleSiriRequest_deliveryHandler_completionHandler___block_invoke_3;
  v8 = &unk_1E3A32768;
  v9 = *(_QWORD *)(a1 + 40);
  objc_copyWeak(&v11, &location);
  v10 = *(id *)(a1 + 56);
  -[AFSiriTaskExecution setCompletionHandler:](v2, "setCompletionHandler:", &v5);
  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics", v5, v6, v7, v8, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logEventWithType:context:", 702, 0);

  -[AFSiriTaskExecution start](v2, "start");
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __72__AFSiriTaskmaster_handleSiriRequest_deliveryHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logEventWithType:context:", 703, 0);
  NSClassFromString(CFSTR("STGenericIntentRequest"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_af_analyticsContextDescription");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logEventWithType:context:", 503, v2);

  }
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(void))(v3 + 16))();

}

void __72__AFSiriTaskmaster_handleSiriRequest_deliveryHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logEventWithType:context:", 704, 0);

  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__AFSiriTaskmaster_handleSiriRequest_deliveryHandler_completionHandler___block_invoke_4;
  block[3] = &unk_1E3A32740;
  objc_copyWeak(&v16, (id *)(a1 + 48));
  v9 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v14 = v6;
  v15 = v9;
  v13 = v5;
  v10 = v6;
  v11 = v5;
  dispatch_async(v8, block);

  objc_destroyWeak(&v16);
}

void __72__AFSiriTaskmaster_handleSiriRequest_deliveryHandler_completionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", WeakRetained);
    WeakRetained = v4;
  }
  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    WeakRetained = v4;
  }

}

uint64_t __56__AFSiriTaskmaster_handleFailureOfRequest_error_atTime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleFailureOfRequest:error:atTime:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

+ (id)taskmasterForUIApplicationWithBundleIdentifier:(id)a3
{
  id v5;
  AFUIApplicationSiriTaskDeliverer *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("AFUIApplicationSiriTaskDeliverer.m"), 385, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  v6 = -[AFUIApplicationSiriTaskDeliverer initWithAppBundleIdentifier:]([AFUIApplicationSiriTaskDeliverer alloc], "initWithAppBundleIdentifier:", v5);
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTaskDeliverer:", v6);
  -[AFUIApplicationSiriTaskDeliverer setTaskmaster:](v6, "setTaskmaster:", v7);

  return v7;
}

+ (id)taskmasterForMachServiceWithName:(id)a3
{
  id v4;
  id v5;
  AFMachServiceSiriTaskDeliverer *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = -[AFMachServiceSiriTaskDeliverer initWithMachServiceName:]([AFMachServiceSiriTaskDeliverer alloc], "initWithMachServiceName:", v4);

  v7 = (void *)objc_msgSend(v5, "initWithTaskDeliverer:", v6);
  return v7;
}

+ (id)taskmasterForMachServiceForAppWithBundleIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  +[AFMachServiceSiriTaskDeliverer machServiceSiriTaskDelivererForAppWithBundleIdentifier:](AFMachServiceSiriTaskDeliverer, "machServiceSiriTaskDelivererForAppWithBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithTaskDeliverer:", v6);
  return v7;
}

@end
