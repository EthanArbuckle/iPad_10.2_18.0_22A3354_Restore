@implementation HDActiveDataCollectionObserverServer

- (HDActiveDataCollectionObserverServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  HDActiveDataCollectionObserverServer *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  NSSet *v9;
  NSSet *observedTypes;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HDActiveDataCollectionObserverServer;
  v6 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v12, sel_initWithUUID_configuration_client_delegate_, a3, a4, a5, a6);
  if (v6)
  {
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    observedTypes = v6->_observedTypes;
    v6->_observedTypes = v9;

  }
  return v6;
}

+ (void)launchObservingProcessesForTypes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  _BYTE v14[12];
  void *v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_self();
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AD8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AE8], v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v14[4] = v7;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AF0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v4, "intersectsSet:", v11);
  if ((_DWORD)v6)
  {
    notify_post((const char *)*MEMORY[0x1E0CB7650]);
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543362;
      *(_QWORD *)v14 = a1;
      _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Posting notification for Bluetooth to start collection", (uint8_t *)&v13, 0xCu);
    }
  }
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0CB4650];
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6260], "serverInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6260], "clientInterface");
}

- (void)remote_subscribeForQuantityTypes:(id)a3
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
  block[2] = __73__HDActiveDataCollectionObserverServer_remote_subscribeForQuantityTypes___block_invoke;
  block[3] = &unk_1E6CE8080;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __73__HDActiveDataCollectionObserverServer_remote_subscribeForQuantityTypes___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count") && objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "profile");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dataCollectionManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __73__HDActiveDataCollectionObserverServer_remote_subscribeForQuantityTypes___block_invoke_2;
    v12[3] = &unk_1E6CF99B8;
    v12[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "_setAggregatorConfigurationChangeHandler:", v12);

    objc_msgSend(*(id *)(a1 + 32), "profile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "workoutManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerCurrentWorkoutObserver:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setByAddingObjectsFromArray:", *(_QWORD *)(a1 + 40));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 48);
  *(_QWORD *)(v7 + 48) = v6;

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "workoutManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentWorkoutSessionServer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDActiveDataCollectionObserverServer _queue_computeActivelyCollectedTypesForWorkout:alwaysNotify:](*(_QWORD *)(a1 + 32), v11, 1);
}

void __73__HDActiveDataCollectionObserverServer_remote_subscribeForQuantityTypes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__HDActiveDataCollectionObserverServer_remote_subscribeForQuantityTypes___block_invoke_3;
  v7[3] = &unk_1E6CE8080;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __73__HDActiveDataCollectionObserverServer_remote_subscribeForQuantityTypes___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 40));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(*(id *)(v1 + 48), "containsObject:", v5))
      {
        objc_msgSend((id)v1, "profile");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "workoutManager");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "currentWorkoutSessionServer");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        -[HDActiveDataCollectionObserverServer _queue_computeActivelyCollectedTypesForWorkout:alwaysNotify:](v1, v4, 0);
      }
    }
  }

}

- (void)_queue_computeActivelyCollectedTypesForWorkout:(char)a3 alwaysNotify:
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  id v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  int v37;
  id obj;
  int v39;
  _QWORD v40[5];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (!a1)
    goto LABEL_38;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
  v5 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend((id)a1, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataCollectionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v33 = a1;
  objc_msgSend((id)a1, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "workoutManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v10, "isInHeartRateRecovery");

  v39 = objc_msgSend(v4, "isActive");
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v5;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  v36 = v8;
  if (!v11)
    goto LABEL_27;
  v12 = v11;
  v13 = *(_QWORD *)v42;
  v34 = *MEMORY[0x1E0CB5C38];
  v32 = *MEMORY[0x1E0CB7560];
  v35 = v7;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v42 != v13)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
      objc_msgSend(v7, "aggregatorForType:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "configuration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        if (v39)
          v18 = objc_msgSend(v17, "hasActiveWorkout");
        else
          v18 = 0;
        if (objc_msgSend(v15, "code") == 5)
        {
          if (((v18 | v37) & 1) != 0)
            goto LABEL_24;
        }
        else if ((objc_msgSend(v4, "isGymKit") & 1) == 0 && ((v18 ^ 1) & 1) == 0)
        {
          v19 = v15;
          v20 = v4;
          objc_msgSend(v19, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", v34);

          if (!v22
            || (objc_msgSend(v20, "currentActivityConfiguration"),
                v23 = (void *)objc_claimAutoreleasedReturnValue(),
                v24 = objc_msgSend(v23, "locationType"),
                v23,
                v24 != 3))
          {

            v7 = v35;
            v8 = v36;
LABEL_24:
            objc_msgSend(v8, "addObject:", v15);
            goto LABEL_25;
          }
          objc_msgSend((id)v33, "client");
          v25 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v25, "sourceBundleIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          LOBYTE(v25) = objc_msgSend(v26, "isEqualToString:", v32);
          v7 = v35;
          v8 = v36;
          if ((v25 & 1) == 0)
            goto LABEL_24;
        }
      }
      else if (objc_msgSend(v15, "code") == 5 && objc_msgSend(v17, "hasForegroundObserver"))
      {
        goto LABEL_24;
      }
LABEL_25:

    }
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  }
  while (v12);
LABEL_27:

  if (objc_msgSend(v8, "count"))
    v27 = objc_msgSend(v4, "isPaused") | v37;
  else
    v27 = 1;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __100__HDActiveDataCollectionObserverServer__queue_computeActivelyCollectedTypesForWorkout_alwaysNotify___block_invoke;
  v40[3] = &unk_1E6CE8030;
  v40[4] = v33;
  objc_msgSend((id)v33, "remoteObjectProxyWithErrorHandler:", v40);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    if ((a3 & 1) != 0)
    {
      objc_msgSend(v36, "allObjects");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "client_updatedCollectedTypes:", v29);

      objc_storeStrong((id *)(v33 + 56), v36);
      goto LABEL_36;
    }
    if ((objc_msgSend(*(id *)(v33 + 56), "isEqualToSet:", v36) & 1) == 0
      && (objc_msgSend(v36, "allObjects"),
          v30 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v28, "client_updatedCollectedTypes:", v30),
          v30,
          objc_storeStrong((id *)(v33 + 56), v36),
          (a3 & 1) != 0)
      || *(unsigned __int8 *)(v33 + 64) != (_DWORD)v27)
    {
LABEL_36:
      objc_msgSend(v28, "client_didChangeAllowCollectionPause:", v27);
      *(_BYTE *)(v33 + 64) = v27;
    }
  }

LABEL_38:
}

- (void)remote_unsubscribeForQuantityTypes:(id)a3
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
  block[2] = __75__HDActiveDataCollectionObserverServer_remote_unsubscribeForQuantityTypes___block_invoke;
  block[3] = &unk_1E6CE8080;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __75__HDActiveDataCollectionObserverServer_remote_unsubscribeForQuantityTypes___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_minus:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v4;

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataCollectionManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setAggregatorConfigurationChangeHandler:", 0);

    objc_msgSend(*(id *)(a1 + 32), "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "workoutManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unregisterCurrentWorkoutObserver:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "workoutManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentWorkoutSessionServer");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[HDActiveDataCollectionObserverServer _queue_computeActivelyCollectedTypesForWorkout:alwaysNotify:](*(_QWORD *)(a1 + 32), v13, 0);
}

- (void)workoutManager:(id)a3 didUpdateCurrentWorkout:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__HDActiveDataCollectionObserverServer_workoutManager_didUpdateCurrentWorkout___block_invoke;
  block[3] = &unk_1E6CE8080;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(queue, block);

}

void __79__HDActiveDataCollectionObserverServer_workoutManager_didUpdateCurrentWorkout___block_invoke(uint64_t a1)
{
  -[HDActiveDataCollectionObserverServer _queue_didUpdateCurrentWorkout:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)_queue_didUpdateCurrentWorkout:(uint64_t)a1
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  id v9;

  v9 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    objc_msgSend((id)a1, "profile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "workoutManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isInHeartRateRecovery");

    v6 = objc_msgSend(v9, "isPaused");
    v7 = *(unsigned __int8 *)(a1 + 64);
    if (v7 != v6 || v7 != v5)
      -[HDActiveDataCollectionObserverServer _queue_computeActivelyCollectedTypesForWorkout:alwaysNotify:](a1, v9, 0);
  }

}

- (void)workoutManager:(id)a3 currentWorkout:(id)a4 didChangeToState:(int64_t)a5
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__HDActiveDataCollectionObserverServer_workoutManager_currentWorkout_didChangeToState___block_invoke;
  block[3] = &unk_1E6CE8080;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_sync(queue, block);

}

void __87__HDActiveDataCollectionObserverServer_workoutManager_currentWorkout_didChangeToState___block_invoke(uint64_t a1)
{
  -[HDActiveDataCollectionObserverServer _queue_didUpdateCurrentWorkout:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __100__HDActiveDataCollectionObserverServer__queue_computeActivelyCollectedTypesForWorkout_alwaysNotify___block_invoke(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of actively collected types: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlyNotifiedTypes, 0);
  objc_storeStrong((id *)&self->_observedTypes, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
