@implementation HKWorkoutClusterStore

- (HKWorkoutClusterStore)initWithHealthStore:(id)a3
{
  id v4;
  HKWorkoutClusterStore *v5;
  HKTaskServerProxyProvider *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HKTaskServerProxyProvider *proxyProvider;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKWorkoutClusterStore;
  v5 = -[HKWorkoutClusterStore init](&v12, sel_init);
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v6, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, v7, v5, v8);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v9;

  }
  return v5;
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)fetchWorkoutCountWithPredicate:(id)a3 completion:(id)a4
{
  HKTaskServerProxyProvider *proxyProvider;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  HKTaskServerProxyProvider *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  proxyProvider = self->_proxyProvider;
  v7 = a3;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKWorkoutClusterStore _workoutFilterForPredicate:](self, "_workoutFilterForPredicate:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v11 = self->_proxyProvider;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__HKWorkoutClusterStore_fetchWorkoutCountWithPredicate_completion___block_invoke;
  v16[3] = &unk_1E37E7038;
  v17 = v9;
  v18 = v8;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __67__HKWorkoutClusterStore_fetchWorkoutCountWithPredicate_completion___block_invoke_2;
  v14[3] = &unk_1E37E6B38;
  v15 = v18;
  v12 = v18;
  v13 = v9;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](v11, "fetchProxyWithHandler:errorHandler:", v16, v14);

}

uint64_t __67__HKWorkoutClusterStore_fetchWorkoutCountWithPredicate_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchWorkoutCountWithFilter:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __67__HKWorkoutClusterStore_fetchWorkoutCountWithPredicate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchWorkoutsWithPredicate:(id)a3 anchor:(id)a4 limit:(unint64_t)a5 completion:(id)a6
{
  id v10;
  HKTaskServerProxyProvider *proxyProvider;
  id v12;
  void *v13;
  void *v14;
  HKTaskServerProxyProvider *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  unint64_t v26;

  v10 = a4;
  proxyProvider = self->_proxyProvider;
  v12 = a3;
  -[HKProxyProvider clientQueueDoubleObjectHandlerWithCompletion:](proxyProvider, "clientQueueDoubleObjectHandlerWithCompletion:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKWorkoutClusterStore _workoutFilterForPredicate:](self, "_workoutFilterForPredicate:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = self->_proxyProvider;
  v16 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __76__HKWorkoutClusterStore_fetchWorkoutsWithPredicate_anchor_limit_completion___block_invoke;
  v22[3] = &unk_1E37E7060;
  v23 = v14;
  v24 = v10;
  v26 = a5;
  v25 = v13;
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __76__HKWorkoutClusterStore_fetchWorkoutsWithPredicate_anchor_limit_completion___block_invoke_2;
  v20[3] = &unk_1E37E6B38;
  v21 = v25;
  v17 = v25;
  v18 = v10;
  v19 = v14;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](v15, "fetchProxyWithHandler:errorHandler:", v22, v20);

}

uint64_t __76__HKWorkoutClusterStore_fetchWorkoutsWithPredicate_anchor_limit_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchWorkoutsWithFilter:anchor:limit:completion:", a1[4], a1[5], a1[7], a1[6]);
}

uint64_t __76__HKWorkoutClusterStore_fetchWorkoutsWithPredicate_anchor_limit_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchWorkoutsWithPredicate:(id)a3 limit:(unint64_t)a4 sortDescriptors:(id)a5 completion:(id)a6
{
  id v10;
  HKTaskServerProxyProvider *proxyProvider;
  id v12;
  void *v13;
  void *v14;
  HKTaskServerProxyProvider *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  unint64_t v26;

  v10 = a5;
  proxyProvider = self->_proxyProvider;
  v12 = a3;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](proxyProvider, "clientQueueObjectHandlerWithCompletion:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKWorkoutClusterStore _workoutFilterForPredicate:](self, "_workoutFilterForPredicate:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = self->_proxyProvider;
  v16 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __85__HKWorkoutClusterStore_fetchWorkoutsWithPredicate_limit_sortDescriptors_completion___block_invoke;
  v22[3] = &unk_1E37E7060;
  v26 = a4;
  v23 = v14;
  v24 = v10;
  v25 = v13;
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __85__HKWorkoutClusterStore_fetchWorkoutsWithPredicate_limit_sortDescriptors_completion___block_invoke_2;
  v20[3] = &unk_1E37E6B38;
  v21 = v25;
  v17 = v25;
  v18 = v10;
  v19 = v14;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](v15, "fetchProxyWithHandler:errorHandler:", v22, v20);

}

uint64_t __85__HKWorkoutClusterStore_fetchWorkoutsWithPredicate_limit_sortDescriptors_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchWorkoutsWithFilter:limit:sortDescriptors:completion:", a1[4], a1[7], a1[5], a1[6]);
}

uint64_t __85__HKWorkoutClusterStore_fetchWorkoutsWithPredicate_limit_sortDescriptors_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_workoutFilterForPredicate:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = [v3 alloc];
  +[HKObjectType workoutType](HKSampleType, "workoutType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithObjects:", v6, 0);

  objc_msgSend(v4, "hk_filterRepresentationForDataTypes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)fetchRouteCoordinatesForWorkoutUUID:(id)a3 startDate:(id)a4 limit:(unint64_t)a5 handler:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  HKWorkoutClusterStore *v27;
  id v28;
  id v29;
  unint64_t v30;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v17 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __96__HKWorkoutClusterStore_fetchRouteCoordinatesForWorkoutUUID_startDate_limit_handler_completion___block_invoke;
  v24[3] = &unk_1E37E7088;
  v25 = v12;
  v26 = v13;
  v30 = a5;
  v27 = self;
  v28 = v14;
  v29 = v15;
  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __96__HKWorkoutClusterStore_fetchRouteCoordinatesForWorkoutUUID_startDate_limit_handler_completion___block_invoke_2;
  v22[3] = &unk_1E37E6B38;
  v23 = v29;
  v18 = v29;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v24, v22);

}

void __96__HKWorkoutClusterStore_fetchRouteCoordinatesForWorkoutUUID_startDate_limit_handler_completion___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  v2 = a1[4];
  v3 = a1[5];
  v4 = (void *)a1[6];
  v5 = a1[7];
  v7 = a1[8];
  v6 = a1[9];
  v8 = a2;
  objc_msgSend(v4, "_coordinatesHandlerWithCallback:completion:", v5, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remote_fetchRouteCoordinatesForWorkoutUUID:startDate:limit:completion:", v2, v3, v6, v9);

}

uint64_t __96__HKWorkoutClusterStore_fetchRouteCoordinatesForWorkoutUUID_startDate_limit_handler_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchRouteCoordinatesForWorkoutUUID:(id)a3 dateInterval:(id)a4 limit:(unint64_t)a5 handler:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  HKWorkoutClusterStore *v27;
  id v28;
  id v29;
  unint64_t v30;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v17 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __99__HKWorkoutClusterStore_fetchRouteCoordinatesForWorkoutUUID_dateInterval_limit_handler_completion___block_invoke;
  v24[3] = &unk_1E37E7088;
  v25 = v12;
  v26 = v13;
  v30 = a5;
  v27 = self;
  v28 = v14;
  v29 = v15;
  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __99__HKWorkoutClusterStore_fetchRouteCoordinatesForWorkoutUUID_dateInterval_limit_handler_completion___block_invoke_2;
  v22[3] = &unk_1E37E6B38;
  v23 = v29;
  v18 = v29;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v24, v22);

}

void __99__HKWorkoutClusterStore_fetchRouteCoordinatesForWorkoutUUID_dateInterval_limit_handler_completion___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  v2 = a1[4];
  v3 = a1[5];
  v4 = (void *)a1[6];
  v5 = a1[7];
  v7 = a1[8];
  v6 = a1[9];
  v8 = a2;
  objc_msgSend(v4, "_coordinatesHandlerWithCallback:completion:", v5, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remote_fetchRouteCoordinatesForWorkoutUUID:dateInterval:limit:completion:", v2, v3, v6, v9);

}

uint64_t __99__HKWorkoutClusterStore_fetchRouteCoordinatesForWorkoutUUID_dateInterval_limit_handler_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_coordinatesHandlerWithCallback:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__HKWorkoutClusterStore__coordinatesHandlerWithCallback_completion___block_invoke;
  v11[3] = &unk_1E37E70B0;
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  v9 = _Block_copy(v11);

  return v9;
}

void __68__HKWorkoutClusterStore__coordinatesHandlerWithCallback_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v5, "coordinates", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v13 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v12, "latitude");
        v15 = v14;
        objc_msgSend(v12, "longitude");
        (*(void (**)(uint64_t, double, double))(v13 + 16))(v13, v15, v16);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v5, "hasResumeDate"))
  {
    v17 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v5, "resumeDate");
    objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)createWorkoutCluster:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__HKWorkoutClusterStore_createWorkoutCluster_completion___block_invoke;
  v14[3] = &unk_1E37E7038;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __57__HKWorkoutClusterStore_createWorkoutCluster_completion___block_invoke_2;
  v12[3] = &unk_1E37E6B38;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __57__HKWorkoutClusterStore_createWorkoutCluster_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_createWorkoutCluster:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __57__HKWorkoutClusterStore_createWorkoutCluster_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchWorkoutClustersWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
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
  v10[2] = __60__HKWorkoutClusterStore_fetchWorkoutClustersWithCompletion___block_invoke;
  v10[3] = &unk_1E37E70D8;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __60__HKWorkoutClusterStore_fetchWorkoutClustersWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __60__HKWorkoutClusterStore_fetchWorkoutClustersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchWorkoutClustersWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __60__HKWorkoutClusterStore_fetchWorkoutClustersWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchWorkoutClusterContainingWorkoutUUID:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__HKWorkoutClusterStore_fetchWorkoutClusterContainingWorkoutUUID_completion___block_invoke;
  v14[3] = &unk_1E37E7038;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __77__HKWorkoutClusterStore_fetchWorkoutClusterContainingWorkoutUUID_completion___block_invoke_2;
  v12[3] = &unk_1E37E6B38;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __77__HKWorkoutClusterStore_fetchWorkoutClusterContainingWorkoutUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchWorkoutClusterContainingWorkoutUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __77__HKWorkoutClusterStore_fetchWorkoutClusterContainingWorkoutUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchWorkoutClustersContainingWorkoutUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__HKWorkoutClusterStore_fetchWorkoutClustersContainingWorkoutUUIDs_completion___block_invoke;
  v14[3] = &unk_1E37E7038;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __79__HKWorkoutClusterStore_fetchWorkoutClustersContainingWorkoutUUIDs_completion___block_invoke_2;
  v12[3] = &unk_1E37E6B38;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __79__HKWorkoutClusterStore_fetchWorkoutClustersContainingWorkoutUUIDs_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchWorkoutClustersContainingWorkoutUUIDs:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __79__HKWorkoutClusterStore_fetchWorkoutClustersContainingWorkoutUUIDs_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchWorkoutUUIDsForClusterUUID:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__HKWorkoutClusterStore_fetchWorkoutUUIDsForClusterUUID_completion___block_invoke;
  v14[3] = &unk_1E37E7038;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __68__HKWorkoutClusterStore_fetchWorkoutUUIDsForClusterUUID_completion___block_invoke_2;
  v12[3] = &unk_1E37E6B38;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __68__HKWorkoutClusterStore_fetchWorkoutUUIDsForClusterUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchWorkoutUUIDsForClusterUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __68__HKWorkoutClusterStore_fetchWorkoutUUIDsForClusterUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchWorkoutRouteSnapshotForClusterUUID:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__HKWorkoutClusterStore_fetchWorkoutRouteSnapshotForClusterUUID_completion___block_invoke;
  v14[3] = &unk_1E37E7038;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __76__HKWorkoutClusterStore_fetchWorkoutRouteSnapshotForClusterUUID_completion___block_invoke_2;
  v12[3] = &unk_1E37E6B38;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __76__HKWorkoutClusterStore_fetchWorkoutRouteSnapshotForClusterUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchWorkoutRouteSnapshotForClusterUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __76__HKWorkoutClusterStore_fetchWorkoutRouteSnapshotForClusterUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateWorkoutRouteSnapshot:(id)a3 forClusterUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __78__HKWorkoutClusterStore_updateWorkoutRouteSnapshot_forClusterUUID_completion___block_invoke;
  v18[3] = &unk_1E37E7100;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __78__HKWorkoutClusterStore_updateWorkoutRouteSnapshot_forClusterUUID_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v21;
  v13 = v21;
  v14 = v9;
  v15 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

uint64_t __78__HKWorkoutClusterStore_updateWorkoutRouteSnapshot_forClusterUUID_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateWorkoutRouteSnapshot:forClusterUUID:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __78__HKWorkoutClusterStore_updateWorkoutRouteSnapshot_forClusterUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateWorkoutRouteLabel:(id)a3 forClusterUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __75__HKWorkoutClusterStore_updateWorkoutRouteLabel_forClusterUUID_completion___block_invoke;
  v18[3] = &unk_1E37E7100;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __75__HKWorkoutClusterStore_updateWorkoutRouteLabel_forClusterUUID_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v21;
  v13 = v21;
  v14 = v9;
  v15 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

uint64_t __75__HKWorkoutClusterStore_updateWorkoutRouteLabel_forClusterUUID_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateWorkoutRouteLabel:forClusterUUID:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __75__HKWorkoutClusterStore_updateWorkoutRouteLabel_forClusterUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateWorkoutClusterWithUUID:(id)a3 newRelevance:(id)a4 newLastWorkoutUUID:(id)a5 newBestWorkoutUUID:(id)a6 newWorkoutAssociations:(id)a7 workoutAssociationsToRemove:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v23 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __167__HKWorkoutClusterStore_updateWorkoutClusterWithUUID_newRelevance_newLastWorkoutUUID_newBestWorkoutUUID_newWorkoutAssociations_workoutAssociationsToRemove_completion___block_invoke;
  v33[3] = &unk_1E37E7128;
  v34 = v15;
  v35 = v16;
  v36 = v17;
  v37 = v18;
  v38 = v19;
  v39 = v20;
  v40 = v21;
  v31[0] = v23;
  v31[1] = 3221225472;
  v31[2] = __167__HKWorkoutClusterStore_updateWorkoutClusterWithUUID_newRelevance_newLastWorkoutUUID_newBestWorkoutUUID_newWorkoutAssociations_workoutAssociationsToRemove_completion___block_invoke_2;
  v31[3] = &unk_1E37E6B38;
  v32 = v40;
  v24 = v40;
  v25 = v20;
  v26 = v19;
  v27 = v18;
  v28 = v17;
  v29 = v16;
  v30 = v15;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v33, v31);

}

uint64_t __167__HKWorkoutClusterStore_updateWorkoutClusterWithUUID_newRelevance_newLastWorkoutUUID_newBestWorkoutUUID_newWorkoutAssociations_workoutAssociationsToRemove_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateWorkoutClusterWithUUID:newRelevance:newLastWorkoutUUID:newBestWorkoutUUID:newWorkoutAssociations:workoutAssociationsToRemove:completion:", a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10]);
}

uint64_t __167__HKWorkoutClusterStore_updateWorkoutClusterWithUUID_newRelevance_newLastWorkoutUUID_newBestWorkoutUUID_newWorkoutAssociations_workoutAssociationsToRemove_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteWorkoutClusterWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__HKWorkoutClusterStore_deleteWorkoutClusterWithUUID_completion___block_invoke;
  v14[3] = &unk_1E37E7038;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __65__HKWorkoutClusterStore_deleteWorkoutClusterWithUUID_completion___block_invoke_2;
  v12[3] = &unk_1E37E6B38;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __65__HKWorkoutClusterStore_deleteWorkoutClusterWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteWorkoutClusterWithUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __65__HKWorkoutClusterStore_deleteWorkoutClusterWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)generateRaceRouteClustersWithLimit:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  unint64_t v15;

  v6 = a4;
  if (a3)
  {
    -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = MEMORY[0x1E0C809B0];
    proxyProvider = self->_proxyProvider;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __71__HKWorkoutClusterStore_generateRaceRouteClustersWithLimit_completion___block_invoke;
    v13[3] = &unk_1E37E7150;
    v15 = a3;
    v14 = v7;
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __71__HKWorkoutClusterStore_generateRaceRouteClustersWithLimit_completion___block_invoke_2;
    v11[3] = &unk_1E37E6B38;
    v6 = v14;
    v12 = v6;
    -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v13, v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Cluster limit must be positive."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v10);

  }
}

uint64_t __71__HKWorkoutClusterStore_generateRaceRouteClustersWithLimit_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_generateRaceRouteClustersWithLimit:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __71__HKWorkoutClusterStore_generateRaceRouteClustersWithLimit_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end
