@implementation ASDPersonalizationStore

+ (id)interface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3926D0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_getClusterMappingsWithCompletionBlock_, 0, 1);

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_getAppEventsWithCompletionBlock_, 0, 1);

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_setClusterMappings_completionBlock_, 0, 0);

  return v2;
}

- (ASDPersonalizationStore)init
{
  void *v3;
  id v4;
  ASDPersonalizationStore *v5;
  objc_super v7;

  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
  {
    v7.receiver = self;
    v7.super_class = (Class)ASDPersonalizationStore;
    v5 = -[ASDPersonalizationStore init](&v7, sel_init);
    self = v5;
    if (v5)
      objc_storeStrong((id *)&v5->_serviceBroker, v3);
  }

  return self;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__ASDPersonalizationStore_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECFFAB88 != -1)
    dispatch_once(&qword_1ECFFAB88, block);
  return (id)_MergedGlobals_52;
}

void __41__ASDPersonalizationStore_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_52;
  _MergedGlobals_52 = (uint64_t)v1;

}

- (void)flushMetricsWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  ASDServiceBroker *serviceBroker;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] flushMetricsWithCompletionBlock", buf, 0xCu);

  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__ASDPersonalizationStore_flushMetricsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BFAD0;
  v10 = v4;
  v8 = v4;
  -[ASDServiceBroker getPersonalizationServiceWithCompletionHandler:](serviceBroker, "getPersonalizationServiceWithCompletionHandler:", v9);

}

void __59__ASDPersonalizationStore_flushMetricsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__ASDPersonalizationStore_flushMetricsWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E37BDB60;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __59__ASDPersonalizationStore_flushMetricsWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E37BDB88;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "flushMetricsWithCompletionBlock:", v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __59__ASDPersonalizationStore_flushMetricsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__ASDPersonalizationStore_flushMetricsWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getClusterMappingsWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  ASDServiceBroker *serviceBroker;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: getClusterMappingsWithCompletionBlock", buf, 0xCu);

  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__ASDPersonalizationStore_getClusterMappingsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BFAD0;
  v10 = v4;
  v8 = v4;
  -[ASDServiceBroker getPersonalizationServiceWithCompletionHandler:](serviceBroker, "getPersonalizationServiceWithCompletionHandler:", v9);

}

void __65__ASDPersonalizationStore_getClusterMappingsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__ASDPersonalizationStore_getClusterMappingsWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E37BDB60;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __65__ASDPersonalizationStore_getClusterMappingsWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E37BDBD8;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "getClusterMappingsWithCompletionBlock:", v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __65__ASDPersonalizationStore_getClusterMappingsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__ASDPersonalizationStore_getClusterMappingsWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getTasteProfileToken:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  ASDServiceBroker *serviceBroker;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: getTasteProfileToken", buf, 0xCu);

  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__ASDPersonalizationStore_getTasteProfileToken___block_invoke;
  v9[3] = &unk_1E37BFAD0;
  v10 = v4;
  v8 = v4;
  -[ASDServiceBroker getPersonalizationServiceWithCompletionHandler:](serviceBroker, "getPersonalizationServiceWithCompletionHandler:", v9);

}

void __48__ASDPersonalizationStore_getTasteProfileToken___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__ASDPersonalizationStore_getTasteProfileToken___block_invoke_2;
    v8[3] = &unk_1E37BDB60;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __48__ASDPersonalizationStore_getTasteProfileToken___block_invoke_3;
    v6[3] = &unk_1E37BFAF8;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "getGroupingToken:", v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __48__ASDPersonalizationStore_getTasteProfileToken___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __48__ASDPersonalizationStore_getTasteProfileToken___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getGroupingToken:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  ASDServiceBroker *serviceBroker;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: getGroupingToken", buf, 0xCu);

  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__ASDPersonalizationStore_getGroupingToken___block_invoke;
  v9[3] = &unk_1E37BFAD0;
  v10 = v4;
  v8 = v4;
  -[ASDServiceBroker getPersonalizationServiceWithCompletionHandler:](serviceBroker, "getPersonalizationServiceWithCompletionHandler:", v9);

}

void __44__ASDPersonalizationStore_getGroupingToken___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __44__ASDPersonalizationStore_getGroupingToken___block_invoke_2;
    v8[3] = &unk_1E37BDB60;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __44__ASDPersonalizationStore_getGroupingToken___block_invoke_3;
    v6[3] = &unk_1E37BFAF8;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "getGroupingToken:", v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __44__ASDPersonalizationStore_getGroupingToken___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __44__ASDPersonalizationStore_getGroupingToken___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getAppEventsWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  ASDServiceBroker *serviceBroker;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] getPersonalizationEventsWithCompletionBlock", buf, 0xCu);

  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__ASDPersonalizationStore_getAppEventsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BFAD0;
  v10 = v4;
  v8 = v4;
  -[ASDServiceBroker getPersonalizationServiceWithCompletionHandler:](serviceBroker, "getPersonalizationServiceWithCompletionHandler:", v9);

}

void __59__ASDPersonalizationStore_getAppEventsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__ASDPersonalizationStore_getAppEventsWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E37BDB60;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __59__ASDPersonalizationStore_getAppEventsWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E37BDBD8;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "getAppEventsWithCompletionBlock:", v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __59__ASDPersonalizationStore_getAppEventsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__ASDPersonalizationStore_getAppEventsWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)recordLaunchesWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  ASDServiceBroker *serviceBroker;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] recordLaunchesCompletionBlock", buf, 0xCu);

  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__ASDPersonalizationStore_recordLaunchesWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BFAD0;
  v10 = v4;
  v8 = v4;
  -[ASDServiceBroker getPersonalizationServiceWithCompletionHandler:](serviceBroker, "getPersonalizationServiceWithCompletionHandler:", v9);

}

void __61__ASDPersonalizationStore_recordLaunchesWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__ASDPersonalizationStore_recordLaunchesWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E37BDB60;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __61__ASDPersonalizationStore_recordLaunchesWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E37BDB88;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "recordLaunchesWithCompletionBlock:", v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __61__ASDPersonalizationStore_recordLaunchesWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__ASDPersonalizationStore_recordLaunchesWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)recordMetricsWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  ASDServiceBroker *serviceBroker;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] recordMetricsWithCompletionBlock", buf, 0xCu);

  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__ASDPersonalizationStore_recordMetricsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BFAD0;
  v10 = v4;
  v8 = v4;
  -[ASDServiceBroker getPersonalizationServiceWithCompletionHandler:](serviceBroker, "getPersonalizationServiceWithCompletionHandler:", v9);

}

void __60__ASDPersonalizationStore_recordMetricsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__ASDPersonalizationStore_recordMetricsWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E37BDB60;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __60__ASDPersonalizationStore_recordMetricsWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E37BDB88;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "recordMetricsWithCompletionBlock:", v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __60__ASDPersonalizationStore_recordMetricsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__ASDPersonalizationStore_recordMetricsWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reportAppEvent:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  ASDServiceBroker *serviceBroker;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ASDLogHandleForCategory(12);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = (id)objc_opt_class();
    v9 = v17;
    _os_log_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: reportAppEvent", buf, 0xCu);

  }
  serviceBroker = self->_serviceBroker;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__ASDPersonalizationStore_reportAppEvent_completionBlock___block_invoke;
  v13[3] = &unk_1E37BFB20;
  v14 = v6;
  v15 = v7;
  v11 = v6;
  v12 = v7;
  -[ASDServiceBroker getPersonalizationServiceWithCompletionHandler:](serviceBroker, "getPersonalizationServiceWithCompletionHandler:", v13);

}

void __58__ASDPersonalizationStore_reportAppEvent_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__ASDPersonalizationStore_reportAppEvent_completionBlock___block_invoke_2;
    v9[3] = &unk_1E37BDB60;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __58__ASDPersonalizationStore_reportAppEvent_completionBlock___block_invoke_3;
    v7[3] = &unk_1E37BDB88;
    v6 = *(_QWORD *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "reportAppEvent:completionBlock:", v6, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __58__ASDPersonalizationStore_reportAppEvent_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__ASDPersonalizationStore_reportAppEvent_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)resetActorIDWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  ASDServiceBroker *serviceBroker;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] resetMetricsWithCompletionBlock", buf, 0xCu);

  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__ASDPersonalizationStore_resetActorIDWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BFAD0;
  v10 = v4;
  v8 = v4;
  -[ASDServiceBroker getPersonalizationServiceWithCompletionHandler:](serviceBroker, "getPersonalizationServiceWithCompletionHandler:", v9);

}

void __59__ASDPersonalizationStore_resetActorIDWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__ASDPersonalizationStore_resetActorIDWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E37BDB60;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __59__ASDPersonalizationStore_resetActorIDWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E37BDB88;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "resetActorIDWithCompletionBlock:", v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __59__ASDPersonalizationStore_resetActorIDWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__ASDPersonalizationStore_resetActorIDWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reloadClusterMappingsWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  ASDServiceBroker *serviceBroker;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: resetMetricsWithCompletionBlock", buf, 0xCu);

  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__ASDPersonalizationStore_reloadClusterMappingsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BFAD0;
  v10 = v4;
  v8 = v4;
  -[ASDServiceBroker getPersonalizationServiceWithCompletionHandler:](serviceBroker, "getPersonalizationServiceWithCompletionHandler:", v9);

}

void __68__ASDPersonalizationStore_reloadClusterMappingsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__ASDPersonalizationStore_reloadClusterMappingsWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E37BDB60;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __68__ASDPersonalizationStore_reloadClusterMappingsWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E37BDB88;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "reloadClusterMappingsWithCompletionBlock:", v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __68__ASDPersonalizationStore_reloadClusterMappingsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__ASDPersonalizationStore_reloadClusterMappingsWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)resetMetricsWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  ASDServiceBroker *serviceBroker;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] resetMetricsWithCompletionBlock", buf, 0xCu);

  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__ASDPersonalizationStore_resetMetricsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BFAD0;
  v10 = v4;
  v8 = v4;
  -[ASDServiceBroker getPersonalizationServiceWithCompletionHandler:](serviceBroker, "getPersonalizationServiceWithCompletionHandler:", v9);

}

void __59__ASDPersonalizationStore_resetMetricsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__ASDPersonalizationStore_resetMetricsWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E37BDB60;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __59__ASDPersonalizationStore_resetMetricsWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E37BDB88;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "resetMetricsWithCompletionBlock:", v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __59__ASDPersonalizationStore_resetMetricsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__ASDPersonalizationStore_resetMetricsWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendMetricsWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  ASDServiceBroker *serviceBroker;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sendMetricsWithCompletionBlock", buf, 0xCu);

  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__ASDPersonalizationStore_sendMetricsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BFAD0;
  v10 = v4;
  v8 = v4;
  -[ASDServiceBroker getPersonalizationServiceWithCompletionHandler:](serviceBroker, "getPersonalizationServiceWithCompletionHandler:", v9);

}

void __58__ASDPersonalizationStore_sendMetricsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__ASDPersonalizationStore_sendMetricsWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E37BDB60;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __58__ASDPersonalizationStore_sendMetricsWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E37BDB88;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "sendMetricsWithCompletionBlock:", v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __58__ASDPersonalizationStore_sendMetricsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__ASDPersonalizationStore_sendMetricsWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setClusterMapping:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  ASDServiceBroker *serviceBroker;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ASDLogHandleForCategory(12);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = (id)objc_opt_class();
    v9 = v17;
    _os_log_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: setClusterMapping", buf, 0xCu);

  }
  serviceBroker = self->_serviceBroker;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__ASDPersonalizationStore_setClusterMapping_completionBlock___block_invoke;
  v13[3] = &unk_1E37BFB20;
  v14 = v6;
  v15 = v7;
  v11 = v6;
  v12 = v7;
  -[ASDServiceBroker getPersonalizationServiceWithCompletionHandler:](serviceBroker, "getPersonalizationServiceWithCompletionHandler:", v13);

}

void __61__ASDPersonalizationStore_setClusterMapping_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__ASDPersonalizationStore_setClusterMapping_completionBlock___block_invoke_2;
    v9[3] = &unk_1E37BDB60;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __61__ASDPersonalizationStore_setClusterMapping_completionBlock___block_invoke_3;
    v7[3] = &unk_1E37BDB88;
    v6 = *(_QWORD *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "setClusterMapping:completionBlock:", v6, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __61__ASDPersonalizationStore_setClusterMapping_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__ASDPersonalizationStore_setClusterMapping_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setClusterMappings:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  ASDServiceBroker *serviceBroker;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ASDLogHandleForCategory(12);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = (id)objc_opt_class();
    v9 = v17;
    _os_log_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: setClusterMappings", buf, 0xCu);

  }
  serviceBroker = self->_serviceBroker;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__ASDPersonalizationStore_setClusterMappings_completionBlock___block_invoke;
  v13[3] = &unk_1E37BFB20;
  v14 = v6;
  v15 = v7;
  v11 = v6;
  v12 = v7;
  -[ASDServiceBroker getPersonalizationServiceWithCompletionHandler:](serviceBroker, "getPersonalizationServiceWithCompletionHandler:", v13);

}

void __62__ASDPersonalizationStore_setClusterMappings_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__ASDPersonalizationStore_setClusterMappings_completionBlock___block_invoke_2;
    v9[3] = &unk_1E37BDB60;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __62__ASDPersonalizationStore_setClusterMappings_completionBlock___block_invoke_3;
    v7[3] = &unk_1E37BDB88;
    v6 = *(_QWORD *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "setClusterMappings:completionBlock:", v6, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __62__ASDPersonalizationStore_setClusterMappings_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62__ASDPersonalizationStore_setClusterMappings_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)tasteProfileFeatureEnabled:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  ASDServiceBroker *serviceBroker;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Taste profile enabled", buf, 0xCu);

  }
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__ASDPersonalizationStore_tasteProfileFeatureEnabled___block_invoke;
  v9[3] = &unk_1E37BFAD0;
  v10 = v4;
  v8 = v4;
  -[ASDServiceBroker getPersonalizationServiceWithCompletionHandler:](serviceBroker, "getPersonalizationServiceWithCompletionHandler:", v9);

}

void __54__ASDPersonalizationStore_tasteProfileFeatureEnabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__ASDPersonalizationStore_tasteProfileFeatureEnabled___block_invoke_2;
    v8[3] = &unk_1E37BDB60;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __54__ASDPersonalizationStore_tasteProfileFeatureEnabled___block_invoke_3;
    v6[3] = &unk_1E37BDB88;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "tasteProfileFeatureEnabledWithCompletionBlock:", v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __54__ASDPersonalizationStore_tasteProfileFeatureEnabled___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __54__ASDPersonalizationStore_tasteProfileFeatureEnabled___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceBroker, 0);
}

@end
