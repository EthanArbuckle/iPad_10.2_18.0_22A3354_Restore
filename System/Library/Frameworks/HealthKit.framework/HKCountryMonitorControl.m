@implementation HKCountryMonitorControl

- (HKCountryMonitorControl)initWithHealthStore:(id)a3
{
  id v4;
  HKCountryMonitorControl *v5;
  HKTaskServerProxyProvider *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HKProxyProvider *proxyProvider;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKCountryMonitorControl;
  v5 = -[HKCountryMonitorControl init](&v12, sel_init);
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v6, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, v7, v5, v8);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKProxyProvider *)v9;

    -[HKProxyProvider setShouldRetryOnInterruption:](v5->_proxyProvider, "setShouldRetryOnInterruption:", 0);
  }

  return v5;
}

- (void)dealloc
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_0_9(v0);
  OUTLINED_FUNCTION_1_7(&dword_19A0E6000, v2, v3, "[%{public}@:%p] Deallocating", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (void)checkCurrentCountry
{
  HKHealthStore *v3;

  v3 = objc_alloc_init(HKHealthStore);
  objc_msgSend(a1, "checkCurrentCountryWithHealthStore:", v3);

}

+ (void)checkCurrentCountryWithHealthStore:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHealthStore:", v4);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__HKCountryMonitorControl_checkCurrentCountryWithHealthStore___block_invoke;
  v7[3] = &unk_1E37EE9F0;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v6, "fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion:", v7);

}

void __62__HKCountryMonitorControl_checkCurrentCountryWithHealthStore___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = *(_QWORD *)(a1 + 32);
    v10 = 138543874;
    v11 = v7;
    v12 = 2048;
    v13 = v8;
    v14 = 2114;
    v15 = v5;
    v9 = v7;
    _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Completed fetch of current ISO country code with error: %{public}@", (uint8_t *)&v10, 0x20u);

  }
}

- (void)fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  HKProxyProvider *proxyProvider;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[5];
  id v18;

  v4 = a3;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    HKLogInfrastructure();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[HKCountryMonitorControl fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion:].cold.1();

  }
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__HKCountryMonitorControl_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion___block_invoke;
  aBlock[3] = &unk_1E37EEA40;
  aBlock[4] = self;
  v18 = v4;
  v9 = v4;
  v10 = _Block_copy(aBlock);
  proxyProvider = self->_proxyProvider;
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __86__HKCountryMonitorControl_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion___block_invoke_3;
  v15[3] = &unk_1E37EEA68;
  v16 = v10;
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __86__HKCountryMonitorControl_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion___block_invoke_4;
  v13[3] = &unk_1E37E69F8;
  v13[4] = self;
  v14 = v16;
  v12 = v16;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v15, v13);

}

void __86__HKCountryMonitorControl_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v7 = a2;
  v8 = a4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __86__HKCountryMonitorControl_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion___block_invoke_2;
  v12[3] = &unk_1E37EEA18;
  v15 = *(id *)(a1 + 40);
  v16 = a3;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, v12);

}

uint64_t __86__HKCountryMonitorControl_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[7], a1[5]);
  return result;
}

uint64_t __86__HKCountryMonitorControl_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __86__HKCountryMonitorControl_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __86__HKCountryMonitorControl_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion___block_invoke_4_cold_1(a1, (uint64_t)v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

- (void)fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_0_9(v0);
  OUTLINED_FUNCTION_1_7(&dword_19A0E6000, v2, v3, "[%{public}@:%p] Fetching current country ISO country code and notifying observers", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

void __86__HKCountryMonitorControl_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion___block_invoke_4_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  uint64_t v7;
  id v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_opt_class();
  v7 = *(_QWORD *)(a1 + 32);
  v9 = 138543874;
  v10 = v6;
  v11 = 2048;
  v12 = v7;
  v13 = 2114;
  v14 = a2;
  v8 = v6;
  _os_log_error_impl(&dword_19A0E6000, a3, OS_LOG_TYPE_ERROR, "[%{public}@:%p] Failed to communicate with task server to fetch current ISO country code and notify observers: %{public}@", (uint8_t *)&v9, 0x20u);

}

@end
