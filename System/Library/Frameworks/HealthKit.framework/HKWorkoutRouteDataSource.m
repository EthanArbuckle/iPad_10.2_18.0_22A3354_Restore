@implementation HKWorkoutRouteDataSource

- (HKWorkoutRouteDataSource)initWithWorkoutSession:(id)a3
{
  id v4;
  HKWorkoutRouteDataSource *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  NSUUID *sessionIdentifier;
  HKTaskServerProxyProvider *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  HKTaskServerProxyProvider *proxyProvider;
  HKTaskServerProxyProvider *v15;
  uint64_t v16;
  _QWORD v18[4];
  HKWorkoutRouteDataSource *v19;
  _QWORD v20[4];
  HKWorkoutRouteDataSource *v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HKWorkoutRouteDataSource;
  v5 = -[HKWorkoutRouteDataSource init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    objc_msgSend(v4, "identifier");
    v8 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSUUID *)v8;

    v10 = [HKTaskServerProxyProvider alloc];
    objc_msgSend(v4, "healthStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "serverIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v10, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v11, v12, v5, v5->_identifier);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v13;

    v15 = v5->_proxyProvider;
    v16 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __51__HKWorkoutRouteDataSource_initWithWorkoutSession___block_invoke;
    v20[3] = &unk_1E37F3668;
    v21 = v5;
    v18[0] = v16;
    v18[1] = 3221225472;
    v18[2] = __51__HKWorkoutRouteDataSource_initWithWorkoutSession___block_invoke_2;
    v18[3] = &unk_1E37E6A70;
    v19 = v21;
    -[HKProxyProvider fetchProxyWithHandler:errorHandler:](v15, "fetchProxyWithHandler:errorHandler:", v20, v18);

  }
  return v5;
}

uint64_t __51__HKWorkoutRouteDataSource_initWithWorkoutSession___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setupWithSessionIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

void __51__HKWorkoutRouteDataSource_initWithWorkoutSession___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __51__HKWorkoutRouteDataSource_initWithWorkoutSession___block_invoke_2_cold_1();

}

+ (id)serverIdentifier
{
  return CFSTR("HKWorkoutRouteDataSourceServerIdentifier");
}

- (void)workoutBuilderDidFinish
{
  HKTaskServerProxyProvider *proxyProvider;

  proxyProvider = self->_proxyProvider;
  self->_proxyProvider = 0;

}

- (void)clientRemote_didUpdateElevation:(id)a3
{
  HKWorkoutRouteDataSourceDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "workoutRouteDataSourceDidUpdateElevation:", v4);

}

- (void)clientRemote_didUpdateRoute:(id)a3
{
  HKWorkoutRouteDataSourceDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "workoutRouteDataSourceDidUpdateRoute:", v4);

}

- (void)clientRemote_didUpdateAltitude:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "workoutRouteDataSource:didUpdateAltitude:", self, v7);

  }
}

+ (id)clientInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3DB470);
}

+ (id)serverInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40FDC8);
}

- (id)exportedInterface
{
  return +[HKWorkoutRouteDataSource clientInterface](HKWorkoutRouteDataSource, "clientInterface");
}

- (id)remoteInterface
{
  return +[HKWorkoutRouteDataSource serverInterface](HKWorkoutRouteDataSource, "serverInterface");
}

- (void)connectionInterrupted
{
  HKTaskServerProxyProvider *proxyProvider;
  _QWORD v3[5];
  _QWORD v4[5];

  proxyProvider = self->_proxyProvider;
  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__HKWorkoutRouteDataSource_connectionInterrupted__block_invoke;
  v4[3] = &unk_1E37F3668;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__HKWorkoutRouteDataSource_connectionInterrupted__block_invoke_2;
  v3[3] = &unk_1E37E6A70;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v4, v3);
}

uint64_t __49__HKWorkoutRouteDataSource_connectionInterrupted__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setupWithSessionIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

void __49__HKWorkoutRouteDataSource_connectionInterrupted__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __49__HKWorkoutRouteDataSource_connectionInterrupted__block_invoke_2_cold_1();

}

- (HKWorkoutRouteDataSourceDelegate)delegate
{
  return (HKWorkoutRouteDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __51__HKWorkoutRouteDataSource_initWithWorkoutSession___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "Unable to setup workout route data source %@ with error: %{public}@");
}

void __49__HKWorkoutRouteDataSource_connectionInterrupted__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "Unable to fetch workout route data source %@ proxy after interrupted connection with error: %{public}@");
}

@end
