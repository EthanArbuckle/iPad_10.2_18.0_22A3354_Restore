@implementation HKSharedSummaryCloudSyncManager

- (HKSharedSummaryCloudSyncManager)initWithHealthStore:(id)a3
{
  id v4;
  HKSharedSummaryCloudSyncManager *v5;
  HKTaskServerProxyProvider *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  HKProxyProvider *proxyProvider;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKSharedSummaryCloudSyncManager;
  v5 = -[HKSharedSummaryCloudSyncManager init](&v13, sel_init);
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v6, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, v8, v5, v9);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKProxyProvider *)v10;

  }
  return v5;
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)fetchAccountInfoWithCompletion:(id)a3
{
  void *v4;
  HKProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__HKSharedSummaryCloudSyncManager_fetchAccountInfoWithCompletion___block_invoke;
  v10[3] = &unk_1E37EA948;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __66__HKSharedSummaryCloudSyncManager_fetchAccountInfoWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __66__HKSharedSummaryCloudSyncManager_fetchAccountInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAccountInfoWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __66__HKSharedSummaryCloudSyncManager_fetchAccountInfoWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  v4 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
    __66__HKSharedSummaryCloudSyncManager_fetchAccountInfoWithCompletion___block_invoke_2_cold_1((uint64_t)v3, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)pushWithCompletion:(id)a3
{
  void *v4;
  HKProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__HKSharedSummaryCloudSyncManager_pushWithCompletion___block_invoke;
  v10[3] = &unk_1E37EA948;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __54__HKSharedSummaryCloudSyncManager_pushWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E69F8;
  v8[4] = self;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __54__HKSharedSummaryCloudSyncManager_pushWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_pushWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __54__HKSharedSummaryCloudSyncManager_pushWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR))
    __54__HKSharedSummaryCloudSyncManager_pushWithCompletion___block_invoke_2_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)pullWithCompletion:(id)a3
{
  void *v4;
  HKProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__HKSharedSummaryCloudSyncManager_pullWithCompletion___block_invoke;
  v10[3] = &unk_1E37EA948;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __54__HKSharedSummaryCloudSyncManager_pullWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E69F8;
  v8[4] = self;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __54__HKSharedSummaryCloudSyncManager_pullWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_pullWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __54__HKSharedSummaryCloudSyncManager_pullWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR))
    __54__HKSharedSummaryCloudSyncManager_pullWithCompletion___block_invoke_2_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)exportedInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "clientInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "serverInterface");
}

+ (id)clientInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3B6B88);
}

+ (id)serverInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E8C8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

void __66__HKSharedSummaryCloudSyncManager_fetchAccountInfoWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch account info with error: %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

void __54__HKSharedSummaryCloudSyncManager_pushWithCompletion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "[summary-sharing] %{public}@: Failed to push with error: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __54__HKSharedSummaryCloudSyncManager_pullWithCompletion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "[summary-sharing] %{public}@: Failed to pull with error: %{public}@");
  OUTLINED_FUNCTION_3();
}

@end
