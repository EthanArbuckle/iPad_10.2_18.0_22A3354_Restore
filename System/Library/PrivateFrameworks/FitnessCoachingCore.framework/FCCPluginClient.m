@implementation FCCPluginClient

- (FCCPluginClient)initWithHealthStore:(id)a3
{
  id v4;
  FCCPluginClient *v5;
  uint64_t v6;
  OS_dispatch_queue *dispatchQueue;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  HKTaskServerProxyProvider *proxyProvider;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FCCPluginClient;
  v5 = -[FCCPluginClient init](&v14, sel_init);
  if (v5)
  {
    HKCreateSerialDispatchQueueWithQOSClass();
    v6 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v5->_dispatchQueue;
    v5->_dispatchQueue = (OS_dispatch_queue *)v6;

    v8 = objc_alloc(MEMORY[0x1E0CB6CC0]);
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, v9, v5, v10);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v11;

  }
  return v5;
}

+ (id)taskIdentifier
{
  return CFSTR("com.apple.fitnesscoaching.HealthServer");
}

- (void)pluginMessage:(unint64_t)a3 data:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a4;
  v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__FCCPluginClient_pluginMessage_data_completionHandler___block_invoke;
  v13[3] = &unk_1E6210290;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(dispatchQueue, v13);

}

uint64_t __56__FCCPluginClient_pluginMessage_data_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pluginMessage:data:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_pluginMessage:(unint64_t)a3 data:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  unint64_t v18;

  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__FCCPluginClient__pluginMessage_data_completionHandler___block_invoke;
  v15[3] = &unk_1E62102B8;
  v18 = a3;
  v16 = v8;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __57__FCCPluginClient__pluginMessage_data_completionHandler___block_invoke_2;
  v13[3] = &unk_1E62102E0;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[FCCPluginClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v15, v13);

}

uint64_t __57__FCCPluginClient__pluginMessage_data_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "pluginMessage:data:completionHandler:", a1[6], a1[4], a1[5]);
}

void __57__FCCPluginClient__pluginMessage_data_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_ERROR))
    __57__FCCPluginClient__pluginMessage_data_completionHandler___block_invoke_2_cold_1((uint64_t)v3, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_remoteProxy:(id)a3 errorHandler:(id)a4
{
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](self->_proxyProvider, "fetchProxyWithHandler:errorHandler:", a3, a4);
}

- (id)exportedInterface
{
  return 0;
}

- (void)connectionInvalidated
{
  NSObject *v2;
  uint8_t v3[16];

  _HKInitializeLogging();
  v2 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B0C58000, v2, OS_LOG_TYPE_DEFAULT, "[FCCPluginClient] XPC connection invalidated", v3, 2u);
  }
}

- (void)connectionInterrupted
{
  NSObject *v2;
  uint8_t v3[16];

  _HKInitializeLogging();
  v2 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B0C58000, v2, OS_LOG_TYPE_DEFAULT, "[FCCPluginClient] XPC connection interrupted", v3, 2u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

void __57__FCCPluginClient__pluginMessage_data_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B0C58000, a2, OS_LOG_TYPE_ERROR, "[FCCPluginClient] Sending message failed: %@", (uint8_t *)&v2, 0xCu);
}

@end
