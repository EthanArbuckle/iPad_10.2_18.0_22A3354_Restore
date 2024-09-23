@implementation ASDAppMetricsService

+ (id)interface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE391E30);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_getMetricsEventsForType_withReplyHandler_, 0, 1);

  return v2;
}

- (ASDAppMetricsService)init
{
  void *v3;
  ASDAppMetricsService *v4;

  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ASDAppMetricsService _initWithServiceBroker:](self, "_initWithServiceBroker:", v3);

  return v4;
}

+ (id)defaultService
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__ASDAppMetricsService_defaultService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECFFA9A0 != -1)
    dispatch_once(&qword_1ECFFA9A0, block);
  return (id)_MergedGlobals_24;
}

void __38__ASDAppMetricsService_defaultService__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_24;
  _MergedGlobals_24 = (uint64_t)v1;

}

- (id)_initWithServiceBroker:(id)a3
{
  id v4;
  ASDAppMetricsService *v5;
  ASDAppMetricsService *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ASDAppMetricsService;
  v5 = -[ASDAppMetricsService init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_serviceBroker, v4);

  return v6;
}

- (void)getMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v6 = a4;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__ASDAppMetricsService_getMetricsEventsForType_withReplyHandler___block_invoke;
  v9[3] = &unk_1E37BDF38;
  v9[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  objc_msgSend(v7, "getAppMetricsServiceWithCompletionHandler:", v9);

}

void __65__ASDAppMetricsService_getMetricsEventsForType_withReplyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __65__ASDAppMetricsService_getMetricsEventsForType_withReplyHandler___block_invoke_2;
    v14[3] = &unk_1E37BDEE8;
    v7 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v7;
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __65__ASDAppMetricsService_getMetricsEventsForType_withReplyHandler___block_invoke_2;
    v12[3] = &unk_1E37BDBD8;
    v9 = *(_QWORD *)(a1 + 48);
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v8, "getMetricsEventsForType:withReplyHandler:", v9, v12);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v17 = (id)objc_opt_class();
      v18 = 2114;
      v19 = v5;
      v11 = v17;
      _os_log_error_impl(&dword_19A03B000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to get results due to error: %{public}@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __65__ASDAppMetricsService_getMetricsEventsForType_withReplyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 2114;
    v10 = v3;
    v6 = v8;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to get events due to error: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  (*(void (**)(_QWORD, _QWORD, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v3, v5);

}

void __65__ASDAppMetricsService_getMetricsEventsForType_withReplyHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(21, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__ASDAppMetricsService_getMetricsEventsForType_withReplyHandler___block_invoke_2_3;
  block[3] = &unk_1E37BDF10;
  v8 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __65__ASDAppMetricsService_getMetricsEventsForType_withReplyHandler___block_invoke_2_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)postMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v6 = a4;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__ASDAppMetricsService_postMetricsEventsForType_withReplyHandler___block_invoke;
  v9[3] = &unk_1E37BDF38;
  v9[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  objc_msgSend(v7, "getAppMetricsServiceWithCompletionHandler:", v9);

}

void __66__ASDAppMetricsService_postMetricsEventsForType_withReplyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __66__ASDAppMetricsService_postMetricsEventsForType_withReplyHandler___block_invoke_2;
    v14[3] = &unk_1E37BDEE8;
    v7 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v7;
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __66__ASDAppMetricsService_postMetricsEventsForType_withReplyHandler___block_invoke_6;
    v12[3] = &unk_1E37BDB88;
    v9 = *(_QWORD *)(a1 + 48);
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v8, "postMetricsEventsForType:withReplyHandler:", v9, v12);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v17 = (id)objc_opt_class();
      v18 = 2114;
      v19 = v5;
      v11 = v17;
      _os_log_error_impl(&dword_19A03B000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to post due to error: %{public}@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __66__ASDAppMetricsService_postMetricsEventsForType_withReplyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 2114;
    v10 = v3;
    v6 = v8;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to post due to error: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  (*(void (**)(_QWORD, _QWORD, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v3, v5);

}

void __66__ASDAppMetricsService_postMetricsEventsForType_withReplyHandler___block_invoke_6(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  dispatch_get_global_queue(21, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__ASDAppMetricsService_postMetricsEventsForType_withReplyHandler___block_invoke_2_7;
  block[3] = &unk_1E37BDF60;
  v7 = *(id *)(a1 + 32);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __66__ASDAppMetricsService_postMetricsEventsForType_withReplyHandler___block_invoke_2_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)recordMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v6 = a4;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__ASDAppMetricsService_recordMetricsEventsForType_withReplyHandler___block_invoke;
  v9[3] = &unk_1E37BDF38;
  v9[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  objc_msgSend(v7, "getAppMetricsServiceWithCompletionHandler:", v9);

}

void __68__ASDAppMetricsService_recordMetricsEventsForType_withReplyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __68__ASDAppMetricsService_recordMetricsEventsForType_withReplyHandler___block_invoke_2;
    v14[3] = &unk_1E37BDEE8;
    v7 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v7;
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __68__ASDAppMetricsService_recordMetricsEventsForType_withReplyHandler___block_invoke_9;
    v12[3] = &unk_1E37BDB88;
    v9 = *(_QWORD *)(a1 + 48);
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v8, "recordMetricsEventsForType:withReplyHandler:", v9, v12);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v17 = (id)objc_opt_class();
      v18 = 2114;
      v19 = v5;
      v11 = v17;
      _os_log_error_impl(&dword_19A03B000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to record due to error: %{public}@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __68__ASDAppMetricsService_recordMetricsEventsForType_withReplyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 2114;
    v10 = v3;
    v6 = v8;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to record due to error: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  (*(void (**)(_QWORD, _QWORD, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v3, v5);

}

void __68__ASDAppMetricsService_recordMetricsEventsForType_withReplyHandler___block_invoke_9(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  dispatch_get_global_queue(21, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__ASDAppMetricsService_recordMetricsEventsForType_withReplyHandler___block_invoke_2_10;
  block[3] = &unk_1E37BDF60;
  v7 = *(id *)(a1 + 32);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __68__ASDAppMetricsService_recordMetricsEventsForType_withReplyHandler___block_invoke_2_10(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)resetMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v6 = a4;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__ASDAppMetricsService_resetMetricsEventsForType_withReplyHandler___block_invoke;
  v9[3] = &unk_1E37BDF38;
  v9[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  objc_msgSend(v7, "getAppMetricsServiceWithCompletionHandler:", v9);

}

void __67__ASDAppMetricsService_resetMetricsEventsForType_withReplyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __67__ASDAppMetricsService_resetMetricsEventsForType_withReplyHandler___block_invoke_2;
    v14[3] = &unk_1E37BDEE8;
    v7 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v7;
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __67__ASDAppMetricsService_resetMetricsEventsForType_withReplyHandler___block_invoke_11;
    v12[3] = &unk_1E37BDB88;
    v9 = *(_QWORD *)(a1 + 48);
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v8, "resetMetricsEventsForType:withReplyHandler:", v9, v12);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v17 = (id)objc_opt_class();
      v18 = 2114;
      v19 = v5;
      v11 = v17;
      _os_log_error_impl(&dword_19A03B000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to reset due to error: %{public}@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __67__ASDAppMetricsService_resetMetricsEventsForType_withReplyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 2114;
    v10 = v3;
    v6 = v8;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to reset due to error: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  (*(void (**)(_QWORD, _QWORD, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v3, v5);

}

void __67__ASDAppMetricsService_resetMetricsEventsForType_withReplyHandler___block_invoke_11(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  dispatch_get_global_queue(21, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__ASDAppMetricsService_resetMetricsEventsForType_withReplyHandler___block_invoke_2_12;
  block[3] = &unk_1E37BDF60;
  v7 = *(id *)(a1 + 32);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __67__ASDAppMetricsService_resetMetricsEventsForType_withReplyHandler___block_invoke_2_12(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_serviceBroker);
}

@end
