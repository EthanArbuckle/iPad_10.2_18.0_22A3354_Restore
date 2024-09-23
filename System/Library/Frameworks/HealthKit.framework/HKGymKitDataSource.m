@implementation HKGymKitDataSource

- (HKGymKitDataSource)initWithHealthStore:(id)a3 workoutConfiguration:(id)a4
{
  id v7;
  id v8;
  HKGymKitDataSource *v9;
  uint64_t v10;
  NSUUID *identifier;
  void *v12;
  HKTaskServerProxyProvider *v13;
  HKTaskServerProxyProvider *proxyProvider;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HKGymKitDataSource;
  v9 = -[HKGymKitDataSource init](&v16, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v10;

    objc_storeStrong((id *)&v9->_healthStore, a3);
    +[HKGymKitDataSource defaultConfigurationWithWorkoutConfiguration:](HKGymKitDataSource, "defaultConfigurationWithWorkoutConfiguration:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:]([HKTaskServerProxyProvider alloc], "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v9->_healthStore, CFSTR("HKGymKitDataSourceServerIdentifier"), v9, v9->_identifier);
    proxyProvider = v9->_proxyProvider;
    v9->_proxyProvider = v13;

    -[HKTaskServerProxyProvider setTaskConfiguration:](v9->_proxyProvider, "setTaskConfiguration:", v12);
    -[HKGymKitDataSource _startTaskServerIfNeeded](v9, "_startTaskServerIfNeeded");

  }
  return v9;
}

+ (id)defaultConfigurationWithWorkoutConfiguration:(id)a3
{
  id v3;
  void *v4;
  HKWorkoutDataSourceConfiguration *v5;
  void *v6;
  HKWorkoutDataSourceConfiguration *v7;

  v3 = a3;
  +[HKWorkoutDataSource observedTypesForActivityType:isIndoor:connectedToFitnessMachine:activityMode:](HKWorkoutDataSource, "observedTypesForActivityType:isIndoor:connectedToFitnessMachine:activityMode:", objc_msgSend(v3, "activityType"), objc_msgSend(v3, "locationType") == 2, 1, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [HKWorkoutDataSourceConfiguration alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKWorkoutDataSourceConfiguration initWithWorkoutConfiguration:sampleTypesToCollect:filters:eventTypesToCollect:collectsDefaultTypes:](v5, "initWithWorkoutConfiguration:sampleTypesToCollect:filters:eventTypesToCollect:collectsDefaultTypes:", v3, v4, MEMORY[0x1E0C9AA70], v6, 1);

  return v7;
}

- (void)workoutBuilderDidFinish
{
  HKTaskServerProxyProvider *proxyProvider;

  proxyProvider = self->_proxyProvider;
  self->_proxyProvider = 0;

}

+ (id)clientInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E688);
}

+ (id)serverInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E6E8);
}

- (id)exportedInterface
{
  return +[HKGymKitDataSource clientInterface](HKGymKitDataSource, "clientInterface");
}

- (id)remoteInterface
{
  return +[HKGymKitDataSource serverInterface](HKGymKitDataSource, "serverInterface");
}

- (void)connectionInterrupted
{
  HKTaskServerProxyProvider *proxyProvider;
  _QWORD v3[5];

  proxyProvider = self->_proxyProvider;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__HKGymKitDataSource_connectionInterrupted__block_invoke_2;
  v3[3] = &unk_1E37E6A70;
  v3[4] = self;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", &__block_literal_global_13, v3);
}

uint64_t __43__HKGymKitDataSource_connectionInterrupted__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startTaskServerIfNeeded");
}

void __43__HKGymKitDataSource_connectionInterrupted__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __43__HKGymKitDataSource_connectionInterrupted__block_invoke_2_cold_1();

}

- (void)_startTaskServerIfNeeded
{
  HKTaskServerProxyProvider *proxyProvider;
  _QWORD v3[5];

  proxyProvider = self->_proxyProvider;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__HKGymKitDataSource__startTaskServerIfNeeded__block_invoke_2;
  v3[3] = &unk_1E37E6A70;
  v3[4] = self;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", &__block_literal_global_57, v3);
}

uint64_t __46__HKGymKitDataSource__startTaskServerIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startTaskServerIfNeeded");
}

void __46__HKGymKitDataSource__startTaskServerIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __46__HKGymKitDataSource__startTaskServerIfNeeded__block_invoke_2_cold_1();

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

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __43__HKGymKitDataSource_connectionInterrupted__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "HKGymKitDataSource: Unable to fetch data source %@ proxy after interrupted connection with error: %@");
}

void __46__HKGymKitDataSource__startTaskServerIfNeeded__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "HKGymKitDataSource: Unable to start task server %@ with error: %@");
}

@end
