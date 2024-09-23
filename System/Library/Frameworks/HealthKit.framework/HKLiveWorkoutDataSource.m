@implementation HKLiveWorkoutDataSource

- (HKLiveWorkoutDataSource)initWithHealthStore:(HKHealthStore *)healthStore workoutConfiguration:(HKWorkoutConfiguration *)configuration
{
  HKHealthStore *v7;
  HKWorkoutConfiguration *v8;
  HKLiveWorkoutDataSource *v9;
  uint64_t v10;
  NSUUID *identifier;
  uint64_t v12;
  HKWorkoutConfiguration *workoutConfiguration;
  uint64_t v14;
  OS_dispatch_queue *queue;
  HKTaskServerProxyProvider *v16;
  HKTaskServerProxyProvider *proxyProvider;
  NSObject *v18;
  _QWORD block[4];
  HKLiveWorkoutDataSource *v21;
  objc_super v22;

  v7 = healthStore;
  v8 = configuration;
  v22.receiver = self;
  v22.super_class = (Class)HKLiveWorkoutDataSource;
  v9 = -[HKLiveWorkoutDataSource init](&v22, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v10;

    objc_storeStrong((id *)&v9->_healthStore, healthStore);
    v12 = -[HKWorkoutConfiguration copy](v8, "copy");
    workoutConfiguration = v9->_workoutConfiguration;
    v9->_workoutConfiguration = (HKWorkoutConfiguration *)v12;

    v9->_collectsDefaultTypes = 1;
    HKCreateSerialDispatchQueue(v9, CFSTR("queue"));
    v14 = objc_claimAutoreleasedReturnValue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v14;

    v16 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:]([HKTaskServerProxyProvider alloc], "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v9->_healthStore, CFSTR("HKLiveWorkoutDataSourceServerIdentifier"), v9, v9->_identifier);
    proxyProvider = v9->_proxyProvider;
    v9->_proxyProvider = v16;

    v18 = v9->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__HKLiveWorkoutDataSource_initWithHealthStore_workoutConfiguration___block_invoke;
    block[3] = &unk_1E37E6770;
    v21 = v9;
    dispatch_async(v18, block);

  }
  return v9;
}

uint64_t __68__HKLiveWorkoutDataSource_initWithHealthStore_workoutConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_finishSetup");
}

- (NSSet)typesToCollect
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__32;
  v10 = __Block_byref_object_dispose__32;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__HKLiveWorkoutDataSource_typesToCollect__block_invoke;
  v5[3] = &unk_1E37E6810;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

void __41__HKLiveWorkoutDataSource_typesToCollect__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)enableCollectionForType:(HKQuantityType *)quantityType predicate:(NSPredicate *)predicate
{
  HKQuantityType *v6;
  NSPredicate *v7;
  NSObject *queue;
  NSPredicate *v9;
  HKQuantityType *v10;
  _QWORD block[5];
  HKQuantityType *v12;
  NSPredicate *v13;

  v6 = quantityType;
  v7 = predicate;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__HKLiveWorkoutDataSource_enableCollectionForType_predicate___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __61__HKLiveWorkoutDataSource_enableCollectionForType_predicate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "hk_filterRepresentationForDataTypes:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 40));

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_queue_dataSourceConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  v9[4] = v6;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__HKLiveWorkoutDataSource_enableCollectionForType_predicate___block_invoke_2;
  v10[3] = &unk_1E37F0DC0;
  v11 = v5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__HKLiveWorkoutDataSource_enableCollectionForType_predicate___block_invoke_3;
  v9[3] = &unk_1E37E6A70;
  v8 = v5;
  objc_msgSend(v7, "fetchProxyWithHandler:errorHandler:", v10, v9);

}

uint64_t __61__HKLiveWorkoutDataSource_enableCollectionForType_predicate___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setDataSourceConfiguration:", *(_QWORD *)(a1 + 32));
}

void __61__HKLiveWorkoutDataSource_enableCollectionForType_predicate___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __61__HKLiveWorkoutDataSource_enableCollectionForType_predicate___block_invoke_3_cold_1();

}

- (void)disableCollectionForType:(HKQuantityType *)quantityType
{
  HKQuantityType *v4;
  NSObject *queue;
  HKQuantityType *v6;
  _QWORD v7[5];
  HKQuantityType *v8;

  v4 = quantityType;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HKLiveWorkoutDataSource_disableCollectionForType___block_invoke;
  v7[3] = &unk_1E37E6980;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __52__HKLiveWorkoutDataSource_disableCollectionForType___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_queue_dataSourceConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  v6[4] = v3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HKLiveWorkoutDataSource_disableCollectionForType___block_invoke_2;
  v7[3] = &unk_1E37F0DC0;
  v8 = v2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__HKLiveWorkoutDataSource_disableCollectionForType___block_invoke_3;
  v6[3] = &unk_1E37E6A70;
  v5 = v2;
  objc_msgSend(v4, "fetchProxyWithHandler:errorHandler:", v7, v6);

}

uint64_t __52__HKLiveWorkoutDataSource_disableCollectionForType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setDataSourceConfiguration:", *(_QWORD *)(a1 + 32));
}

void __52__HKLiveWorkoutDataSource_disableCollectionForType___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __61__HKLiveWorkoutDataSource_enableCollectionForType_predicate___block_invoke_3_cold_1();

}

- (id)_queue_dataSourceConfiguration
{
  HKWorkoutDataSourceConfiguration *v3;
  HKWorkoutConfiguration *workoutConfiguration;
  NSMutableSet *mutableSampleTypesToCollect;
  NSMutableDictionary *mutableFiltersBySampleType;
  void *v7;
  HKWorkoutDataSourceConfiguration *v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = [HKWorkoutDataSourceConfiguration alloc];
  workoutConfiguration = self->_workoutConfiguration;
  mutableSampleTypesToCollect = self->_mutableSampleTypesToCollect;
  mutableFiltersBySampleType = self->_mutableFiltersBySampleType;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKWorkoutDataSourceConfiguration initWithWorkoutConfiguration:sampleTypesToCollect:filters:eventTypesToCollect:collectsDefaultTypes:](v3, "initWithWorkoutConfiguration:sampleTypesToCollect:filters:eventTypesToCollect:collectsDefaultTypes:", workoutConfiguration, mutableSampleTypesToCollect, mutableFiltersBySampleType, v7, self->_collectsDefaultTypes);

  return v8;
}

- (void)workoutBuilderDidFinish
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__HKLiveWorkoutDataSource_workoutBuilderDidFinish__block_invoke;
  block[3] = &unk_1E37E6770;
  block[4] = self;
  dispatch_async(queue, block);
}

void __50__HKLiveWorkoutDataSource_workoutBuilderDidFinish__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = 0;

}

- (void)unitTest_synchronizeWithCompletion:(id)a3
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
  v7[2] = __62__HKLiveWorkoutDataSource_unitTest_synchronizeWithCompletion___block_invoke;
  v7[3] = &unk_1E37E66E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __62__HKLiveWorkoutDataSource_unitTest_synchronizeWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__HKLiveWorkoutDataSource_unitTest_synchronizeWithCompletion___block_invoke_2;
  v7[3] = &unk_1E37F0DE8;
  v8 = v2;
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __62__HKLiveWorkoutDataSource_unitTest_synchronizeWithCompletion___block_invoke_3;
  v5[3] = &unk_1E37E6B38;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "fetchProxyWithHandler:errorHandler:", v7, v5);

}

uint64_t __62__HKLiveWorkoutDataSource_unitTest_synchronizeWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_synchronizeWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __62__HKLiveWorkoutDataSource_unitTest_synchronizeWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)clientInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40F6A8);
}

+ (id)serverInterface
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40F708);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_remote_setDataSourceConfiguration_, 0, 0);

  return v2;
}

- (id)exportedInterface
{
  return +[HKLiveWorkoutDataSource clientInterface](HKLiveWorkoutDataSource, "clientInterface");
}

- (id)remoteInterface
{
  return +[HKLiveWorkoutDataSource serverInterface](HKLiveWorkoutDataSource, "serverInterface");
}

- (void)connectionInterrupted
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__HKLiveWorkoutDataSource_connectionInterrupted__block_invoke;
  block[3] = &unk_1E37E6770;
  block[4] = self;
  dispatch_async(queue, block);
}

void __48__HKLiveWorkoutDataSource_connectionInterrupted__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_queue_dataSourceConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  v6[4] = v3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__HKLiveWorkoutDataSource_connectionInterrupted__block_invoke_2;
  v7[3] = &unk_1E37F0DC0;
  v8 = v2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__HKLiveWorkoutDataSource_connectionInterrupted__block_invoke_3;
  v6[3] = &unk_1E37E6A70;
  v5 = v2;
  objc_msgSend(v4, "fetchProxyWithHandler:errorHandler:", v7, v6);

}

uint64_t __48__HKLiveWorkoutDataSource_connectionInterrupted__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setDataSourceConfiguration:", *(_QWORD *)(a1 + 32));
}

void __48__HKLiveWorkoutDataSource_connectionInterrupted__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __48__HKLiveWorkoutDataSource_connectionInterrupted__block_invoke_3_cold_1();

}

- (void)clientRemote_didUpdateDataSourceConfiguration:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__HKLiveWorkoutDataSource_clientRemote_didUpdateDataSourceConfiguration___block_invoke;
  block[3] = &unk_1E37E6980;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __73__HKLiveWorkoutDataSource_clientRemote_didUpdateDataSourceConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 40), "sampleTypesToCollect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mutableCopy");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v3;

  objc_msgSend(*(id *)(a1 + 40), "filtersBySampleType");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v9, "mutableCopy");
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 56);
  *(_QWORD *)(v7 + 56) = v6;

}

- (void)_queue_finishSetup
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_ERROR, "Error getting activity mode %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

uint64_t __45__HKLiveWorkoutDataSource__queue_finishSetup__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startTaskServerIfNeeded");
}

void __45__HKLiveWorkoutDataSource__queue_finishSetup__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __45__HKLiveWorkoutDataSource__queue_finishSetup__block_invoke_2_cold_1();

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

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableSet)mutableSampleTypesToCollect
{
  return self->_mutableSampleTypesToCollect;
}

- (void)setMutableSampleTypesToCollect:(id)a3
{
  objc_storeStrong((id *)&self->_mutableSampleTypesToCollect, a3);
}

- (NSMutableDictionary)mutableFiltersBySampleType
{
  return self->_mutableFiltersBySampleType;
}

- (void)setMutableFiltersBySampleType:(id)a3
{
  objc_storeStrong((id *)&self->_mutableFiltersBySampleType, a3);
}

- (BOOL)collectsDefaultTypes
{
  return self->_collectsDefaultTypes;
}

- (void)setCollectsDefaultTypes:(BOOL)a3
{
  self->_collectsDefaultTypes = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_mutableFiltersBySampleType, 0);
  objc_storeStrong((id *)&self->_mutableSampleTypesToCollect, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_workoutConfiguration, 0);
}

void __61__HKLiveWorkoutDataSource_enableCollectionForType_predicate___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "Unable to set data source %@ configuration with error: %@");
  OUTLINED_FUNCTION_3();
}

void __48__HKLiveWorkoutDataSource_connectionInterrupted__block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "Unable to fetch data source %@ proxy after interrupted connection with error: %@");
  OUTLINED_FUNCTION_3();
}

void __45__HKLiveWorkoutDataSource__queue_finishSetup__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "Unable to start task server %@ with error: %@");
  OUTLINED_FUNCTION_3();
}

@end
