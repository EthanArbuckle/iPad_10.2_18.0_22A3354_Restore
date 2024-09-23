@implementation HDWorkoutRouteDataSource

- (HDWorkoutRouteDataSource)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  HDWorkoutRouteDataSource *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  HKUnit *elevationUnit;
  id v11;
  uint64_t v12;
  HKDataFlowLink *workoutDataFlowLink;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HDWorkoutRouteDataSource;
  v6 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v15, sel_initWithUUID_configuration_client_delegate_, a3, a4, a5, a6);
  if (v6)
  {
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnitWithMetricPrefix:", 5);
    v9 = objc_claimAutoreleasedReturnValue();
    elevationUnit = v6->_elevationUnit;
    v6->_elevationUnit = (HKUnit *)v9;

    _HKInitializeLogging();
    v11 = objc_alloc(MEMORY[0x1E0CB6588]);
    v12 = objc_msgSend(v11, "initWithProcessor:sourceProtocol:destinationProtocol:loggingCategory:", v6, &unk_1EF1A1298, &unk_1EF1B99A8, *MEMORY[0x1E0CB5380]);
    workoutDataFlowLink = v6->_workoutDataFlowLink;
    v6->_workoutDataFlowLink = (HKDataFlowLink *)v12;

  }
  return v6;
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0CB74C8];
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HDStandardTaskServer taskUUID](self, "taskUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)remote_setupWithSessionIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  HDWorkoutRouteDataSource *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(v4, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = self;
    v15 = 2114;
    v16 = v7;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "[routes] Will setup route data source: %{public}@, session: %{public}@", buf, 0x16u);

  }
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workoutManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__HDWorkoutRouteDataSource_remote_setupWithSessionIdentifier___block_invoke;
  v11[3] = &unk_1E6CE7FE0;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v9, "sessionServerFromSessionIdentifier:completion:", v10, v11);

}

void __62__HDWorkoutRouteDataSource_remote_setupWithSessionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __62__HDWorkoutRouteDataSource_remote_setupWithSessionIdentifier___block_invoke_2;
  block[3] = &unk_1E6CE7FB8;
  block[1] = 3221225472;
  v10 = v3;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v8 = v3;
  dispatch_async(v5, block);

}

void __62__HDWorkoutRouteDataSource_remote_setupWithSessionIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 48) + 40), v2);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 40));
    objc_msgSend(WeakRetained, "addObserver:queue:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 96));

    objc_msgSend(*(id *)(a1 + 48), "_queue_setupLocationDataCollector");
  }
  else
  {
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v5 = *(void **)(a1 + 40);
      v6 = v4;
      objc_msgSend(v5, "UUIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Couldn't link workout route data source to session %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
}

- (void)workoutSession:(id)a3 didChangeToState:(int64_t)a4 fromState:(int64_t)a5 date:(id)a6
{
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  switch(a4)
  {
    case 7:
      v9 = 1;
      if (a5 != 8 && a5 != 17)
      {
        if ((objc_msgSend(v13, "workoutConfiguration"),
              a4 = objc_claimAutoreleasedReturnValue(),
              v10 = objc_msgSend((id)a4, "activityType"),
              v10 != 67)
          && v10 != 61
          || (_os_feature_enabled_impl() & 1) == 0)
        {
          v9 = 0;
        }
      }
      if (a5 != 8 && a5 != 17)

      if (v9)
      {
        -[HDLocationDataCollector resumeUpdates](self->_locationDataCollector, "resumeUpdates");
      }
      else if (a5 != 9)
      {
        -[HDLocationDataCollector startUpdates](self->_locationDataCollector, "startUpdates");
      }
      break;
    case 8:
      -[HDLocationDataCollector pauseUpdates](self->_locationDataCollector, "pauseUpdates");
      break;
    case 9:
      objc_msgSend(v13, "workoutConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "activityType");
      if ((v12 == 67 || v12 == 61) && (_os_feature_enabled_impl() & 1) != 0)
      {

        -[HDLocationDataCollector pauseUpdatesAfterDelay:](self->_locationDataCollector, "pauseUpdatesAfterDelay:", 15);
      }
      else
      {

      }
      break;
    case 10:
      goto LABEL_20;
    case 16:
      if (a5 == 17 || a5 == 8)
LABEL_20:
        -[HDLocationDataCollector stopUpdates](self->_locationDataCollector, "stopUpdates");
      break;
    default:
      break;
  }

}

- (void)elevationUpdated:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__HDWorkoutRouteDataSource_elevationUpdated___block_invoke;
  v4[3] = &unk_1E6CE8058;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __45__HDWorkoutRouteDataSource_elevationUpdated___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), (double)*(unint64_t *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
    *(_DWORD *)buf = 138412546;
    v26 = v2;
    v27 = 2112;
    v28 = v4;
    _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "[routes] Add elevation: %@ to elevation: %@", buf, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 72);
  if (v6)
  {
    objc_msgSend(v6, "_quantityByAddingQuantity:", v2);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 72);
    *(_QWORD *)(v8 + 72) = v7;
  }
  else
  {
    v10 = v2;
    v9 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v10;
  }

  v23 = *MEMORY[0x1E0CB54F8];
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 56);
  v14 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __45__HDWorkoutRouteDataSource_elevationUpdated___block_invoke_301;
  v20[3] = &unk_1E6CE8008;
  v21 = v11;
  v22 = v12;
  v15 = v11;
  objc_msgSend(v13, "sendToDestinationProcessors:", v20);
  objc_msgSend(*(id *)(a1 + 32), "client");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "connection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __45__HDWorkoutRouteDataSource_elevationUpdated___block_invoke_2;
  v19[3] = &unk_1E6CE8030;
  v19[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v17, "remoteObjectProxyWithErrorHandler:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "clientRemote_didUpdateElevation:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
}

uint64_t __45__HDWorkoutRouteDataSource_elevationUpdated___block_invoke_301(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addMetadata:dataSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __45__HDWorkoutRouteDataSource_elevationUpdated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of elevation update: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)workoutRouteUpdated:(id)a3
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
  v7[2] = __48__HDWorkoutRouteDataSource_workoutRouteUpdated___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __48__HDWorkoutRouteDataSource_workoutRouteUpdated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v11[2] = __48__HDWorkoutRouteDataSource_workoutRouteUpdated___block_invoke_2;
  v11[3] = &unk_1E6CE8008;
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v5 = v2;
  v6 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v6;
  objc_msgSend(v3, "sendToDestinationProcessors:", v11);
  objc_msgSend(*(id *)(a1 + 32), "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __48__HDWorkoutRouteDataSource_workoutRouteUpdated___block_invoke_3;
  v10[3] = &unk_1E6CE8030;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "clientRemote_didUpdateRoute:", *(_QWORD *)(a1 + 40));
}

void __48__HDWorkoutRouteDataSource_workoutRouteUpdated___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addOtherSamples:dataSource:", v5, *(_QWORD *)(a1 + 40), v6, v7);

}

void __48__HDWorkoutRouteDataSource_workoutRouteUpdated___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of route update: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)altitudeUpdated:(double)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__HDWorkoutRouteDataSource_altitudeUpdated___block_invoke;
  v4[3] = &unk_1E6CE8058;
  *(double *)&v4[5] = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

void __44__HDWorkoutRouteDataSource_altitudeUpdated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v2 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3, *(double *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(id **)(a1 + 32);
  if (!v5[10])
    goto LABEL_4;
  if (objc_msgSend(v5[10], "compare:", v4))
  {
    v5 = *(id **)(a1 + 32);
LABEL_4:
    objc_msgSend(v5, "client");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__HDWorkoutRouteDataSource_altitudeUpdated___block_invoke_2;
    v9[3] = &unk_1E6CE8030;
    v9[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "clientRemote_didUpdateAltitude:", v4);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), v4);

  }
}

void __44__HDWorkoutRouteDataSource_altitudeUpdated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of altitude update: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (id)_workoutBuilderServer
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 56), "allDestinationProcessors");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "hk_firstObjectPassingTest:", &__block_literal_global_1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void __58__HDWorkoutRouteDataSource__queue_recoverCurrentElevation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of elevation update: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

uint64_t __49__HDWorkoutRouteDataSource__workoutBuilderServer__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_queue_setupLocationDataCollector
{
  void *v3;
  HDWorkoutSessionServer **p_sessionServer;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  HKQuantity *v15;
  HKQuantity *currentElevation;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HDLocationDataCollector *v21;
  HDLocationDataCollector *locationDataCollector;
  id v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  _BYTE v30[24];
  void *v31;
  HDWorkoutRouteDataSource *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_locationDataCollector)
  {
    -[HDWorkoutRouteDataSource _workoutBuilderServer]((uint64_t)self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_18;
    p_sessionServer = &self->_sessionServer;
    WeakRetained = objc_loadWeakRetained((id *)&self->_sessionServer);

    if (!WeakRetained)
      goto LABEL_18;
    v6 = objc_loadWeakRetained((id *)&self->_sessionServer);
    objc_msgSend(v6, "currentActivity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "workoutConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      v11 = objc_loadWeakRetained((id *)&self->_sessionServer);
      objc_msgSend(v11, "workoutConfiguration");
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v10, "locationType");
    objc_msgSend(v10, "activityType");
    objc_msgSend(v10, "swimmingLocationType");
    if ((_HKWorkoutActivityTypeIsRouteable() & 1) == 0)
    {
      _HKInitializeLogging();
      v24 = (void *)*MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      {
        v25 = v24;
        v26 = objc_loadWeakRetained((id *)p_sessionServer);
        objc_msgSend(v26, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v30 = 138543618;
        *(_QWORD *)&v30[4] = v27;
        *(_WORD *)&v30[12] = 2112;
        *(_QWORD *)&v30[14] = v10;
        _os_log_impl(&dword_1B7802000, v25, OS_LOG_TYPE_DEFAULT, "[routes] Workout route will not be tracked because activity is not routeable for session %{public}@, workout configuration %@", v30, 0x16u);

      }
      goto LABEL_17;
    }
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    -[HDWorkoutRouteDataSource _workoutBuilderServer]((uint64_t)self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "currentMetadata");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0CB54F8]);
      v15 = (HKQuantity *)objc_claimAutoreleasedReturnValue();
      currentElevation = self->_currentElevation;
      self->_currentElevation = v15;

      if (self->_currentElevation)
      {
        -[HDStandardTaskServer client](self, "client");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "connection");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)v30 = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v30[8] = 3221225472;
        *(_QWORD *)&v30[16] = __58__HDWorkoutRouteDataSource__queue_recoverCurrentElevation__block_invoke;
        v31 = &unk_1E6CE8030;
        v32 = self;
        objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:", v30);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "clientRemote_didUpdateElevation:", self->_currentElevation);
      }
    }

    objc_msgSend(v3, "taskUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDWorkoutRouteDataSource _queue_createLocationDataCollectorWithConfiguration:workoutUUID:](self, "_queue_createLocationDataCollectorWithConfiguration:workoutUUID:", v10, v20);
    v21 = (HDLocationDataCollector *)objc_claimAutoreleasedReturnValue();
    locationDataCollector = self->_locationDataCollector;
    self->_locationDataCollector = v21;

    -[HDLocationDataCollector setDelegate:](self->_locationDataCollector, "setDelegate:", self);
    v23 = objc_loadWeakRetained((id *)&self->_sessionServer);
    if (objc_msgSend(v23, "state") == 7)
    {

    }
    else
    {
      v28 = objc_loadWeakRetained((id *)&self->_sessionServer);
      v29 = objc_msgSend(v28, "state");

      if (v29 != 9)
      {
LABEL_17:

LABEL_18:
        return;
      }
    }
    -[HDLocationDataCollector startUpdates](self->_locationDataCollector, "startUpdates");
    goto LABEL_17;
  }
}

- (id)_queue_createLocationDataCollectorWithConfiguration:(id)a3 workoutUUID:(id)a4
{
  NSObject *queue;
  id v7;
  id v8;
  HDLocationDataCollector *v9;
  void *v10;
  void *v11;
  void *v12;
  HDLocationDataCollector *v13;

  queue = self->_queue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(queue);
  v9 = [HDLocationDataCollector alloc];
  -[HDStandardTaskServer profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDStandardTaskServer delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sampleSavingDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HDLocationDataCollector initWithProfile:sampleSavingDelegate:configuration:workoutUUID:](v9, "initWithProfile:sampleSavingDelegate:configuration:workoutUUID:", v10, v12, v8, v7);

  return v13;
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6E68], "serverInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6E68], "clientInterface");
}

- (void)connectionInvalidated
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__HDWorkoutRouteDataSource_connectionInvalidated__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __49__HDWorkoutRouteDataSource_connectionInvalidated__block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "stopUpdates");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "removeObserver:", *(_QWORD *)(a1 + 32));

}

- (HKDataFlowLink)workoutDataFlowLink
{
  return self->_workoutDataFlowLink;
}

- (void)workoutDataDestination:(id)a3 requestsDataFrom:(id)a4 to:(id)a5
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__HDWorkoutRouteDataSource_workoutDataDestination_requestsDataFrom_to___block_invoke;
  v9[3] = &unk_1E6CE8080;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, v9);

}

void __71__HDWorkoutRouteDataSource_workoutDataDestination_requestsDataFrom_to___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (os_log_t *)MEMORY[0x1E0CB5380];
  v3 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v4;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "[routes] Data destination requests data from route data source: %{public}@, data destination: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_setupLocationDataCollector");
  }
  else
  {
    _HKInitializeLogging();
    v6 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543362;
      v9 = v7;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@, Expected HDWorkoutBuilderServer as a direct data destination", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)workoutDataDestination:(id)a3 requestsFinalDataFrom:(id)a4 to:(id)a5 completion:(id)a6
{
  id v7;
  NSObject *queue;
  id v9;
  _QWORD block[4];
  id v11;

  v7 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__HDWorkoutRouteDataSource_workoutDataDestination_requestsFinalDataFrom_to_completion___block_invoke;
  block[3] = &unk_1E6CE7DE0;
  v11 = v7;
  v9 = v7;
  dispatch_async(queue, block);

}

uint64_t __87__HDWorkoutRouteDataSource_workoutDataDestination_requestsFinalDataFrom_to_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)workoutDataDestination:(id)a3 didUpdateConfiguration:(id)a4
{
  NSObject *v5;
  uint8_t v6[16];

  if (objc_msgSend(a4, "locationType", a3) == 2)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "[routes] Workout configuration updated to Indoor", v6, 2u);
    }
    -[HDLocationDataCollector stopUpdatesAndDiscardData](self->_locationDataCollector, "stopUpdatesAndDiscardData");
  }
}

- (void)workoutDataDestination:(id)a3 didBeginActivity:(id)a4
{
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(a4, "workoutConfiguration", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationType");
  objc_msgSend(v5, "activityType");
  objc_msgSend(v5, "swimmingLocationType");
  if ((_HKWorkoutActivityTypeIsRouteable() & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "[routes] Workout activity updated to Indoor. Stopping location updates", v7, 2u);
    }
    -[HDLocationDataCollector stopUpdates](self->_locationDataCollector, "stopUpdates");
  }

}

- (id)_unitTest_locationDataCollector
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
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__HDWorkoutRouteDataSource__unitTest_locationDataCollector__block_invoke;
  v5[3] = &unk_1E6CE8110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __59__HDWorkoutRouteDataSource__unitTest_locationDataCollector__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_workoutUUID, 0);
  objc_storeStrong((id *)&self->_latestAltitude, 0);
  objc_storeStrong((id *)&self->_currentElevation, 0);
  objc_storeStrong((id *)&self->_elevationUnit, 0);
  objc_storeStrong((id *)&self->_workoutDataFlowLink, 0);
  objc_storeStrong((id *)&self->_locationDataCollector, 0);
  objc_destroyWeak((id *)&self->_sessionServer);
}

@end
