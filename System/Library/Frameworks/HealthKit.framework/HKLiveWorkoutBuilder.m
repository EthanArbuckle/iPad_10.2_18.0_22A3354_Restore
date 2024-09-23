@implementation HKLiveWorkoutBuilder

- (HKLiveWorkoutBuilder)initWithHealthStore:(id)a3 session:(id)a4 builderConfiguration:(id)a5 builderIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HKLiveWorkoutBuilder *v15;
  NSArray *additionalDataSources;
  objc_super v18;

  v10 = a4;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  objc_msgSend(v10, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAssociatedSessionUUID:", v14);

  v18.receiver = self;
  v18.super_class = (Class)HKLiveWorkoutBuilder;
  v15 = -[HKWorkoutBuilder initWithHealthStore:builderConfiguration:builderIdentifier:](&v18, sel_initWithHealthStore_builderConfiguration_builderIdentifier_, v13, v12, v11);

  if (v15)
  {
    objc_storeWeak((id *)&v15->_workoutSession, v10);
    additionalDataSources = v15->_additionalDataSources;
    v15->_additionalDataSources = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v15;
}

- (HKLiveWorkoutBuilder)initWithHealthStore:(id)a3 builderConfiguration:(id)a4 builderIdentifier:(id)a5
{
  return -[HKLiveWorkoutBuilder initWithHealthStore:session:builderConfiguration:builderIdentifier:](self, "initWithHealthStore:session:builderConfiguration:builderIdentifier:", a3, 0, a4, a5);
}

- (HKLiveWorkoutBuilder)initWithHealthStore:(HKHealthStore *)healthStore configuration:(HKWorkoutConfiguration *)configuration device:(HKDevice *)device
{
  HKDevice *v8;
  HKWorkoutConfiguration *v9;
  HKHealthStore *v10;
  HKWorkoutBuilderConfiguration *v11;
  void *v12;
  HKLiveWorkoutBuilder *v13;

  v8 = device;
  v9 = configuration;
  v10 = healthStore;
  v11 = objc_alloc_init(HKWorkoutBuilderConfiguration);
  -[HKWorkoutBuilderConfiguration setDevice:](v11, "setDevice:", v8);

  -[HKWorkoutBuilderConfiguration setWorkoutConfiguration:](v11, "setWorkoutConfiguration:", v9);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HKLiveWorkoutBuilder initWithHealthStore:session:builderConfiguration:builderIdentifier:](self, "initWithHealthStore:session:builderConfiguration:builderIdentifier:", v10, 0, v11, v12);

  return v13;
}

- (BOOL)shouldCollectWorkoutEvents
{
  HKLiveWorkoutBuilder *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[HKWorkoutBuilder resourceQueue](self, "resourceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__HKLiveWorkoutBuilder_shouldCollectWorkoutEvents__block_invoke;
  v5[3] = &unk_1E37E6810;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __50__HKLiveWorkoutBuilder_shouldCollectWorkoutEvents__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "shouldCollectWorkoutEvents");

}

- (void)setShouldCollectWorkoutEvents:(BOOL)shouldCollectWorkoutEvents
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HKWorkoutBuilder resourceQueue](self, "resourceQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__HKLiveWorkoutBuilder_setShouldCollectWorkoutEvents___block_invoke;
  v6[3] = &unk_1E37E8990;
  v6[4] = self;
  v7 = shouldCollectWorkoutEvents;
  dispatch_sync(v5, v6);

}

void __54__HKLiveWorkoutBuilder_setShouldCollectWorkoutEvents___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  id WeakRetained;
  void *v6;
  void *v7;
  _QWORD v8[4];
  char v9;

  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldCollectWorkoutEvents");
  v4 = *(unsigned __int8 *)(a1 + 40);
  if (v4 != v3)
  {
    objc_msgSend(v2, "setShouldCollectWorkoutEvents:", v4 != 0);
    objc_msgSend(*(id *)(a1 + 32), "setConfiguration:", v2);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 240));
    objc_msgSend(WeakRetained, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "proxyProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __54__HKLiveWorkoutBuilder_setShouldCollectWorkoutEvents___block_invoke_2;
      v8[3] = &__block_descriptor_33_e43_v16__0___HKWorkoutBuilderServerInterface__8l;
      v9 = *(_BYTE *)(a1 + 40);
      objc_msgSend(v7, "fetchProxyWithHandler:errorHandler:", v8, &__block_literal_global_116);

    }
  }

}

uint64_t __54__HKLiveWorkoutBuilder_setShouldCollectWorkoutEvents___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setShouldCollectEvents:", *(unsigned __int8 *)(a1 + 32));
}

void __54__HKLiveWorkoutBuilder_setShouldCollectWorkoutEvents___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __54__HKLiveWorkoutBuilder_setShouldCollectWorkoutEvents___block_invoke_3_cold_1();

}

- (id)_privateDelegate
{
  void *v2;
  void *v3;
  id v4;

  -[HKLiveWorkoutBuilder delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE40FFA8))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (HKWorkoutActivity)currentWorkoutActivity
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__52;
  v11 = __Block_byref_object_dispose__52;
  v12 = 0;
  -[HKWorkoutBuilder resourceQueue](self, "resourceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__HKLiveWorkoutBuilder_currentWorkoutActivity__block_invoke;
  v6[3] = &unk_1E37E6810;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HKWorkoutActivity *)v4;
}

void __46__HKLiveWorkoutBuilder_currentWorkoutActivity__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_resourceQueue_updateElapsedTimeCache
{
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  HKLiveWorkoutBuilder *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKLiveWorkoutBuilder;
  -[HKWorkoutBuilder _resourceQueue_updateElapsedTimeCache](&v9, sel__resourceQueue_updateElapsedTimeCache);
  -[HKLiveWorkoutBuilder delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HKWorkoutBuilder healthStore](self, "healthStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61__HKLiveWorkoutBuilder__resourceQueue_updateElapsedTimeCache__block_invoke;
    v6[3] = &unk_1E37E6980;
    v7 = v3;
    v8 = self;
    dispatch_async(v5, v6);

  }
}

uint64_t __61__HKLiveWorkoutBuilder__resourceQueue_updateElapsedTimeCache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workoutBuilderDidCollectEvent:", *(_QWORD *)(a1 + 40));
}

- (void)_resourceQueue_updateEvents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  HKLiveWorkoutBuilder *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKLiveWorkoutBuilder;
  -[HKWorkoutBuilder _resourceQueue_updateEvents:](&v12, sel__resourceQueue_updateEvents_, v4);
  -[HKLiveWorkoutBuilder _privateDelegate](self, "_privateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HKWorkoutBuilder healthStore](self, "healthStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__HKLiveWorkoutBuilder__resourceQueue_updateEvents___block_invoke;
    block[3] = &unk_1E37E6738;
    v9 = v4;
    v10 = v5;
    v11 = self;
    dispatch_async(v7, block);

  }
}

void __52__HKLiveWorkoutBuilder__resourceQueue_updateEvents___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "workoutBuilder:didCollectEvent:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)setAdditionalDataSources:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HKWorkoutBuilder resourceQueue](self, "resourceQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__HKLiveWorkoutBuilder_setAdditionalDataSources___block_invoke;
  v7[3] = &unk_1E37E6980;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __49__HKLiveWorkoutBuilder_setAdditionalDataSources___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_minus:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_minus:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "proxyProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __49__HKLiveWorkoutBuilder_setAdditionalDataSources___block_invoke_2;
  v16 = &unk_1E37F5760;
  v17 = v4;
  v18 = v5;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v6, "fetchProxyWithHandler:errorHandler:", &v13, &__block_literal_global_72);

  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", *(_QWORD *)(a1 + 40), v13, v14, v15, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "array");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 224);
  *(_QWORD *)(v11 + 224) = v10;

}

void __49__HKLiveWorkoutBuilder_setAdditionalDataSources___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_map:", &__block_literal_global_70);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remote_addDataSourcesWithIdentifiers:", v6);

  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hk_map:", &__block_literal_global_71_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remote_removeDataSourcesWithIdentifiers:", v7);

}

uint64_t __49__HKLiveWorkoutBuilder_setAdditionalDataSources___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __49__HKLiveWorkoutBuilder_setAdditionalDataSources___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __49__HKLiveWorkoutBuilder_setAdditionalDataSources___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __49__HKLiveWorkoutBuilder_setAdditionalDataSources___block_invoke_5_cold_1();

}

- (NSArray)additionalDataSources
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__52;
  v11 = __Block_byref_object_dispose__52;
  v12 = 0;
  -[HKWorkoutBuilder resourceQueue](self, "resourceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__HKLiveWorkoutBuilder_additionalDataSources__block_invoke;
  v6[3] = &unk_1E37E6810;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __45__HKLiveWorkoutBuilder_additionalDataSources__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (HKLiveWorkoutDataSource)dataSource
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__52;
  v11 = __Block_byref_object_dispose__52;
  v12 = 0;
  -[HKWorkoutBuilder resourceQueue](self, "resourceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__HKLiveWorkoutBuilder_dataSource__block_invoke;
  v6[3] = &unk_1E37E6810;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HKLiveWorkoutDataSource *)v4;
}

void __34__HKLiveWorkoutBuilder_dataSource__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 216));
}

- (void)setDataSource:(HKLiveWorkoutDataSource *)dataSource
{
  HKLiveWorkoutDataSource *v4;
  NSObject *v5;
  HKLiveWorkoutDataSource *v6;
  _QWORD v7[5];
  HKLiveWorkoutDataSource *v8;

  v4 = dataSource;
  -[HKWorkoutBuilder resourceQueue](self, "resourceQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__HKLiveWorkoutBuilder_setDataSource___block_invoke;
  v7[3] = &unk_1E37E6980;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __38__HKLiveWorkoutBuilder_setDataSource___block_invoke(uint64_t a1)
{
  id *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];

  v2 = *(id **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = v2[27];
  if (v4 != v3)
  {
    v5 = MEMORY[0x1E0C809B0];
    if (v4)
    {
      objc_msgSend(v2, "proxyProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v5;
      v11[1] = 3221225472;
      v11[2] = __38__HKLiveWorkoutBuilder_setDataSource___block_invoke_2;
      v11[3] = &unk_1E37E6A48;
      v11[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v6, "fetchProxyWithHandler:errorHandler:", v11, &__block_literal_global_75);

      v2 = *(id **)(a1 + 32);
      v3 = *(id *)(a1 + 40);
    }
    if (v3)
    {
      objc_msgSend(v2, "proxyProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = v5;
      v9[1] = 3221225472;
      v9[2] = __38__HKLiveWorkoutBuilder_setDataSource___block_invoke_76;
      v9[3] = &unk_1E37E6A48;
      v10 = *(id *)(a1 + 40);
      objc_msgSend(v7, "fetchProxyWithHandler:errorHandler:", v9, &__block_literal_global_78);

      v2 = *(id **)(a1 + 32);
      v8 = *(void **)(a1 + 40);
    }
    else
    {
      v8 = 0;
    }
    objc_storeStrong(v2 + 27, v8);
  }
}

void __38__HKLiveWorkoutBuilder_setDataSource___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 216);
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remote_removeDataSourcesWithIdentifiers:", v5);

}

void __38__HKLiveWorkoutBuilder_setDataSource___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __49__HKLiveWorkoutBuilder_setAdditionalDataSources___block_invoke_5_cold_1();

}

void __38__HKLiveWorkoutBuilder_setDataSource___block_invoke_76(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remote_addDataSourcesWithIdentifiers:", v5);

}

void __38__HKLiveWorkoutBuilder_setDataSource___block_invoke_2_77(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __49__HKLiveWorkoutBuilder_setAdditionalDataSources___block_invoke_5_cold_1();

}

- (void)stateMachine:(id)a3 didEnterState:(id)a4 date:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  HKWorkoutActivity *currentActivity;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HKWorkoutBuilder resourceQueue](self, "resourceQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  v25.receiver = self;
  v25.super_class = (Class)HKLiveWorkoutBuilder;
  -[HKWorkoutBuilder stateMachine:didEnterState:date:error:](&v25, sel_stateMachine_didEnterState_date_error_, v10, v11, v12, v13);
  if (objc_msgSend(v11, "index") == 3)
  {
    currentActivity = self->super._currentActivity;
    self->super._currentActivity = 0;

    -[HKLiveWorkoutDataSource workoutBuilderDidFinish](self->_dataSource, "workoutBuilderDidFinish");
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v16 = self->_additionalDataSources;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v22;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v20++), "workoutBuilderDidFinish", (_QWORD)v21);
        }
        while (v18 != v20);
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v18);
    }

  }
}

- (void)clientRemote_didUpdateStatistics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  HKLiveWorkoutBuilder *v10;
  id v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKLiveWorkoutBuilder;
  -[HKWorkoutBuilder clientRemote_didUpdateStatistics:](&v12, sel_clientRemote_didUpdateStatistics_, v4);
  -[HKLiveWorkoutBuilder delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HKWorkoutBuilder healthStore](self, "healthStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__HKLiveWorkoutBuilder_clientRemote_didUpdateStatistics___block_invoke;
    block[3] = &unk_1E37E6738;
    v9 = v5;
    v10 = self;
    v11 = v4;
    dispatch_async(v7, block);

  }
}

void __57__HKLiveWorkoutBuilder_clientRemote_didUpdateStatistics___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "allTypes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "workoutBuilder:didCollectDataOfTypes:", v2, v3);

}

- (void)clientRemote_didUpdateMetadata:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  HKLiveWorkoutBuilder *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKLiveWorkoutBuilder;
  -[HKWorkoutBuilder clientRemote_didUpdateMetadata:](&v10, sel_clientRemote_didUpdateMetadata_, a3);
  -[HKLiveWorkoutBuilder _privateDelegate](self, "_privateDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HKWorkoutBuilder healthStore](self, "healthStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__HKLiveWorkoutBuilder_clientRemote_didUpdateMetadata___block_invoke;
    v7[3] = &unk_1E37E6980;
    v8 = v4;
    v9 = self;
    dispatch_async(v6, v7);

  }
}

uint64_t __55__HKLiveWorkoutBuilder_clientRemote_didUpdateMetadata___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workoutBuilderDidChangeMetadata:", *(_QWORD *)(a1 + 40));
}

- (void)clientRemote_didBeginActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  HKLiveWorkoutBuilder *v10;
  id v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKLiveWorkoutBuilder;
  -[HKWorkoutBuilder clientRemote_didBeginActivity:](&v12, sel_clientRemote_didBeginActivity_, v4);
  -[HKLiveWorkoutBuilder delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HKWorkoutBuilder healthStore](self, "healthStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__HKLiveWorkoutBuilder_clientRemote_didBeginActivity___block_invoke;
    block[3] = &unk_1E37E6738;
    v9 = v5;
    v10 = self;
    v11 = v4;
    dispatch_async(v7, block);

  }
}

uint64_t __54__HKLiveWorkoutBuilder_clientRemote_didBeginActivity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workoutBuilder:didBeginActivity:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)clientRemote_didEndActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  HKLiveWorkoutBuilder *v10;
  id v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKLiveWorkoutBuilder;
  -[HKWorkoutBuilder clientRemote_didEndActivity:](&v12, sel_clientRemote_didEndActivity_, v4);
  -[HKLiveWorkoutBuilder delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HKWorkoutBuilder healthStore](self, "healthStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__HKLiveWorkoutBuilder_clientRemote_didEndActivity___block_invoke;
    block[3] = &unk_1E37E6738;
    v9 = v5;
    v10 = self;
    v11 = v4;
    dispatch_async(v7, block);

  }
}

uint64_t __52__HKLiveWorkoutBuilder_clientRemote_didEndActivity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workoutBuilder:didEndActivity:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)clientRemote_didUpdateActivities:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  HKLiveWorkoutBuilder *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKLiveWorkoutBuilder;
  -[HKWorkoutBuilder clientRemote_didUpdateActivities:](&v10, sel_clientRemote_didUpdateActivities_, a3);
  -[HKLiveWorkoutBuilder _privateDelegate](self, "_privateDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HKWorkoutBuilder healthStore](self, "healthStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__HKLiveWorkoutBuilder_clientRemote_didUpdateActivities___block_invoke;
    v7[3] = &unk_1E37E6980;
    v8 = v4;
    v9 = self;
    dispatch_async(v6, v7);

  }
}

uint64_t __57__HKLiveWorkoutBuilder_clientRemote_didUpdateActivities___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "workoutBuilderUpdateActivities:", *(_QWORD *)(a1 + 40));
}

- (void)connectionInterrupted
{
  void *v3;
  objc_super v4;
  _QWORD v5[5];
  _QWORD v6[5];

  -[HKWorkoutBuilder proxyProvider](self, "proxyProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__HKLiveWorkoutBuilder_connectionInterrupted__block_invoke;
  v6[3] = &unk_1E37E6D68;
  v6[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__HKLiveWorkoutBuilder_connectionInterrupted__block_invoke_2_97;
  v5[3] = &unk_1E37E6A70;
  objc_msgSend(v3, "fetchProxyWithHandler:errorHandler:", v6, v5);

  v4.receiver = self;
  v4.super_class = (Class)HKLiveWorkoutBuilder;
  -[HKWorkoutBuilder connectionInterrupted](&v4, sel_connectionInterrupted);
}

void __45__HKLiveWorkoutBuilder_connectionInterrupted__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "resourceQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__HKLiveWorkoutBuilder_connectionInterrupted__block_invoke_2;
  block[3] = &unk_1E37E6980;
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  dispatch_sync(v4, block);

}

void __45__HKLiveWorkoutBuilder_connectionInterrupted__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v11 = 138543362;
    v12 = v3;
    _os_log_impl(&dword_19A0E6000, v2, OS_LOG_TYPE_INFO, "%{public}@: Recovering data sources after server interruption.", (uint8_t *)&v11, 0xCu);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "hk_map:", &__block_literal_global_95);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 216);
  if (v7)
  {
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

    v6 = *(_QWORD *)(a1 + 32);
  }
  WeakRetained = objc_loadWeakRetained((id *)(v6 + 240));
  objc_msgSend(WeakRetained, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v5, "addObject:", v10);
  objc_msgSend(*(id *)(a1 + 40), "remote_addDataSourcesWithIdentifiers:", v5);

}

uint64_t __45__HKLiveWorkoutBuilder_connectionInterrupted__block_invoke_94(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __45__HKLiveWorkoutBuilder_connectionInterrupted__block_invoke_2_97(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  v4 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __45__HKLiveWorkoutBuilder_connectionInterrupted__block_invoke_2_97_cold_1(a1, (uint64_t)v3, v4);

}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (HKWorkoutSession)workoutSession
{
  return (HKWorkoutSession *)objc_loadWeakRetained((id *)&self->_workoutSession);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_workoutSession);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_additionalDataSources, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

void __54__HKLiveWorkoutBuilder_setShouldCollectWorkoutEvents___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "Unable to change should collecte events configuration property with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __49__HKLiveWorkoutBuilder_setAdditionalDataSources___block_invoke_5_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "Unable to update workout builder server's data sources with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __45__HKLiveWorkoutBuilder_connectionInterrupted__block_invoke_2_97_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_19A0E6000, log, OS_LOG_TYPE_ERROR, "%{public}@: Failed to recover data sources after connection invalidation: %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_3();
}

@end
