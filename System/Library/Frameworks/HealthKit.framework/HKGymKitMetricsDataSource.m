@implementation HKGymKitMetricsDataSource

- (HKGymKitMetricsDataSource)initWithHealthStore:(id)a3 workoutConfiguration:(id)a4
{
  id v7;
  id v8;
  HKGymKitMetricsDataSource *v9;
  uint64_t v10;
  NSUUID *identifier;
  HKTaskServerProxyProvider *v12;
  HKTaskServerProxyProvider *proxyProvider;
  _QWORD v15[4];
  HKGymKitMetricsDataSource *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HKGymKitMetricsDataSource;
  v9 = -[HKGymKitMetricsDataSource init](&v17, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v10;

    objc_storeStrong((id *)&v9->_healthStore, a3);
    objc_storeStrong((id *)&v9->_workoutConfiguration, a4);
    v12 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:]([HKTaskServerProxyProvider alloc], "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v9->_healthStore, CFSTR("HKGymKitMetricsDataSourceServerIdentifier"), v9, v9->_identifier);
    proxyProvider = v9->_proxyProvider;
    v9->_proxyProvider = v12;

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __70__HKGymKitMetricsDataSource_initWithHealthStore_workoutConfiguration___block_invoke;
    v15[3] = &unk_1E37E6BD8;
    v16 = v9;
    -[HKGymKitMetricsDataSource _startTaskServerIfNeededWithCompletion:](v16, "_startTaskServerIfNeededWithCompletion:", v15);

  }
  return v9;
}

void __70__HKGymKitMetricsDataSource_initWithHealthStore_workoutConfiguration___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
      __70__HKGymKitMetricsDataSource_initWithHealthStore_workoutConfiguration___block_invoke_cold_1(a1, v6);
  }

}

- (void)workoutBuilderDidFinish
{
  HKTaskServerProxyProvider *proxyProvider;

  proxyProvider = self->_proxyProvider;
  self->_proxyProvider = 0;

}

- (void)clientRemote_didReceiveMetrics:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HKGymKitMetricsDataSource *v9;
  id v10;
  id to;

  v4 = a3;
  objc_copyWeak(&to, (id *)&self->_delegate);
  -[HKHealthStore clientQueue](self->_healthStore, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__HKGymKitMetricsDataSource_clientRemote_didReceiveMetrics___block_invoke;
  v7[3] = &unk_1E37F83F8;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v10, &to);
  v9 = self;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&to);
}

void __60__HKGymKitMetricsDataSource_clientRemote_didReceiveMetrics___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id WeakRetained;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  +[HKUnit wattUnit](HKUnit, "wattUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("J/s"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__HKGymKitMetricsDataSource_clientRemote_didReceiveMetrics___block_invoke_2;
  v9[3] = &unk_1E37F83D0;
  v10 = v2;
  v11 = v3;
  v5 = v3;
  v8 = v2;
  objc_msgSend(v4, "hk_map:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "gymKitMetricsDataSource:didReceiveMetrics:", *(_QWORD *)(a1 + 40), v6);

}

void __60__HKGymKitMetricsDataSource_clientRemote_didReceiveMetrics___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  void (**v7)(id, id, id);
  uint64_t v8;
  id v9;
  double v10;
  double v11;
  id v12;

  v12 = a2;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = a3;
  if (objc_msgSend(v9, "isCompatibleWithUnit:", v8))
  {
    objc_msgSend(v9, "doubleValueForUnit:", *(_QWORD *)(a1 + 32));
    v11 = v10;

    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", *(_QWORD *)(a1 + 40), v11);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7[2](v7, v12, v9);

}

+ (id)clientInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE410368);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_clientRemote_didReceiveMetrics_, 0, 0);

  return v2;
}

+ (id)serverInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE4103C8);
}

- (id)exportedInterface
{
  return +[HKGymKitMetricsDataSource clientInterface](HKGymKitMetricsDataSource, "clientInterface");
}

- (id)remoteInterface
{
  return +[HKGymKitMetricsDataSource serverInterface](HKGymKitMetricsDataSource, "serverInterface");
}

- (void)connectionInterrupted
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __50__HKGymKitMetricsDataSource_connectionInterrupted__block_invoke;
  v2[3] = &unk_1E37E6BD8;
  v2[4] = self;
  -[HKGymKitMetricsDataSource _startTaskServerIfNeededWithCompletion:](self, "_startTaskServerIfNeededWithCompletion:", v2);
}

void __50__HKGymKitMetricsDataSource_connectionInterrupted__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
      __50__HKGymKitMetricsDataSource_connectionInterrupted__block_invoke_cold_1(a1, v6);
  }

}

- (void)_startTaskServerIfNeededWithCompletion:(id)a3
{
  id v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__HKGymKitMetricsDataSource__startTaskServerIfNeededWithCompletion___block_invoke;
  v10[3] = &unk_1E37F8420;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __68__HKGymKitMetricsDataSource__startTaskServerIfNeededWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __68__HKGymKitMetricsDataSource__startTaskServerIfNeededWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "remote_startTaskServerIfNeeded");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__HKGymKitMetricsDataSource__startTaskServerIfNeededWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (HKGymKitMetricsDataSourceDelegate)delegate
{
  return (HKGymKitMetricsDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (void)setProxyProvider:(id)a3
{
  objc_storeStrong((id *)&self->_proxyProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_workoutConfiguration, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __70__HKGymKitMetricsDataSource_initWithHealthStore_workoutConfiguration___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_3_8(a1, a2);
  v3 = (objc_class *)OUTLINED_FUNCTION_4_7();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_19();
  OUTLINED_FUNCTION_1_16(&dword_19A0E6000, v5, v6, "%{public}@: Unable to start task server %@ with error: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_5_1();
}

void __50__HKGymKitMetricsDataSource_connectionInterrupted__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_3_8(a1, a2);
  v3 = (objc_class *)OUTLINED_FUNCTION_4_7();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_19();
  OUTLINED_FUNCTION_1_16(&dword_19A0E6000, v5, v6, "%{public}@: Unable to fetch data source %@ proxy after interrupted connection with error: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_5_1();
}

@end
