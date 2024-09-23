@implementation HDWorkoutClusterServer

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  HDWorkoutClusterManager *v18;
  void *v19;
  HDWorkoutClusterManager *v20;
  BOOL v21;
  id v22;
  HDWorkoutClusterServer *v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v13, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "profileExtensionWithIdentifier:", CFSTR("com.apple.health.RacePreviousRoute"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "raceRouteClusterManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = [HDWorkoutClusterManager alloc];
  objc_msgSend(v13, "profile");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[HDWorkoutClusterManager initWithProfile:](v18, "initWithProfile:", v19);

  if (v17)
    v21 = v20 == 0;
  else
    v21 = 1;
  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_featureUnavailableForProfileError");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      if (a7)
        *a7 = objc_retainAutorelease(v22);
      else
        _HKLogDroppedError();
    }

    v23 = 0;
  }
  else
  {
    v23 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:]([HDWorkoutClusterServer alloc], "initWithUUID:configuration:client:delegate:", v11, v12, v13, v14);
    objc_storeStrong((id *)&v23->_raceRouteClusterManager, v17);
    objc_storeStrong((id *)&v23->_workoutClusterManager, v20);
    -[HDWorkoutClusterManager takeAccessibilityAssertionIfNeeded](v23->_workoutClusterManager, "takeAccessibilityAssertionIfNeeded");
    v23->_maxWorkoutBatchSize = 400;
    v23->_maxRouteCoordinateBatchSize = 7200;
  }

  return v23;
}

- (void)remote_fetchWorkoutCountWithFilter:(id)a3 completion:(id)a4
{
  HDWorkoutClusterManager *workoutClusterManager;
  void (**v6)(id, void *, id);
  void *v7;
  id v8;
  id v9;

  workoutClusterManager = self->_workoutClusterManager;
  v9 = 0;
  v6 = (void (**)(id, void *, id))a4;
  -[HDWorkoutClusterManager workoutCountWithFilter:error:](workoutClusterManager, "workoutCountWithFilter:error:", a3, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  v6[2](v6, v7, v8);

}

- (void)remote_fetchWorkoutsWithFilter:(id)a3 anchor:(id)a4 limit:(unint64_t)a5 completion:(id)a6
{
  void (**v10)(id, void *, id, id);
  unint64_t maxWorkoutBatchSize;
  unint64_t v12;
  HDWorkoutClusterManager *workoutClusterManager;
  unint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = (void (**)(id, void *, id, id))a6;
  maxWorkoutBatchSize = self->_maxWorkoutBatchSize;
  if (a5 >= maxWorkoutBatchSize)
    v12 = self->_maxWorkoutBatchSize;
  else
    v12 = a5;
  if (a5)
    maxWorkoutBatchSize = v12;
  workoutClusterManager = self->_workoutClusterManager;
  if (self)
    v14 = maxWorkoutBatchSize;
  else
    v14 = 0;
  v23 = 0;
  v24 = 0;
  -[HDWorkoutClusterManager workoutsWithFilter:anchor:limit:newAnchor:error:](workoutClusterManager, "workoutsWithFilter:anchor:limit:newAnchor:error:", a3, a4, v14, &v24, &v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v24;
  v17 = v23;
  _HKInitializeLogging();
  v18 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    v19 = v18;
    v20 = objc_msgSend(v15, "count");
    HKStringFromBool();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v26 = v20;
    v27 = 2114;
    v28 = v21;
    v29 = 2112;
    v30 = v16;
    v31 = 2114;
    v32 = v22;
    _os_log_debug_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEBUG, "Fetched %lu workouts with success=%{public}@, newAnchor=%@, error=%{public}@", buf, 0x2Au);

  }
  v10[2](v10, v15, v16, v17);

}

- (void)remote_fetchWorkoutsWithFilter:(id)a3 limit:(unint64_t)a4 sortDescriptors:(id)a5 completion:(id)a6
{
  void (**v10)(id, void *, id);
  unint64_t maxWorkoutBatchSize;
  unint64_t v12;
  unint64_t v13;
  HDWorkoutClusterManager *workoutClusterManager;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = (void (**)(id, void *, id))a6;
  maxWorkoutBatchSize = self->_maxWorkoutBatchSize;
  if (a4 >= maxWorkoutBatchSize)
    v12 = self->_maxWorkoutBatchSize;
  else
    v12 = a4;
  if (a4)
    maxWorkoutBatchSize = v12;
  if (self)
    v13 = maxWorkoutBatchSize;
  else
    v13 = 0;
  workoutClusterManager = self->_workoutClusterManager;
  v22 = 0;
  -[HDWorkoutClusterManager workoutsWithFilter:limit:sortDescriptors:error:](workoutClusterManager, "workoutsWithFilter:limit:sortDescriptors:error:", a3, v13, a5, &v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v22;
  _HKInitializeLogging();
  v17 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    v18 = v17;
    v19 = objc_msgSend(v15, "count");
    HKStringFromBool();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v24 = v19;
    v25 = 2114;
    v26 = v20;
    v27 = 2114;
    v28 = v21;
    _os_log_debug_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEBUG, "Fetched %lu workouts with success=%{public}@, error=%{public}@", buf, 0x20u);

  }
  v10[2](v10, v15, v16);

}

- (void)remote_fetchRouteCoordinatesForWorkoutUUID:(id)a3 startDate:(id)a4 limit:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, id);
  unint64_t maxRouteCoordinateBatchSize;
  unint64_t v14;
  unint64_t v15;
  id v16;
  HDWorkoutClusterManager *workoutClusterManager;
  id v18;
  _BOOL4 v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  unint64_t v26;
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[4];

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD, id))a6;
  maxRouteCoordinateBatchSize = self->_maxRouteCoordinateBatchSize;
  if (a5 >= maxRouteCoordinateBatchSize)
    v14 = self->_maxRouteCoordinateBatchSize;
  else
    v14 = a5;
  if (a5)
    maxRouteCoordinateBatchSize = v14;
  if (self)
    v15 = maxRouteCoordinateBatchSize;
  else
    v15 = 0;
  v16 = objc_alloc_init(MEMORY[0x1E0CB6468]);
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__54;
  v28[4] = __Block_byref_object_dispose__54;
  v29 = 0;
  workoutClusterManager = self->_workoutClusterManager;
  v27 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __96__HDWorkoutClusterServer_remote_fetchRouteCoordinatesForWorkoutUUID_startDate_limit_completion___block_invoke;
  v22[3] = &unk_1E6CF1F90;
  v22[4] = self;
  v18 = v16;
  v23 = v18;
  v24 = v30;
  v25 = v28;
  v26 = v15;
  v19 = -[HDWorkoutClusterManager enumerateRouteLocationsForWorkoutUUID:startDate:limit:error:handler:](workoutClusterManager, "enumerateRouteLocationsForWorkoutUUID:startDate:limit:error:handler:", v10, v11, v15 + 1, &v27, v22);
  v20 = v27;
  if (v19)
    v21 = v18;
  else
    v21 = 0;
  ((void (**)(id, id, id))v12)[2](v12, v21, v20);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);

}

uint64_t __96__HDWorkoutClusterServer_remote_fetchRouteCoordinatesForWorkoutUUID_startDate_limit_completion___block_invoke(_QWORD *a1, void *a2)
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  id obj;

  v3 = a1[4];
  v2 = (void *)a1[5];
  v4 = a1[8];
  v5 = (unint64_t *)(*(_QWORD *)(a1[6] + 8) + 24);
  v6 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v6 + 40);
  v7 = -[HDWorkoutClusterServer _processLocation:forCoordinateSeries:limit:locationsSeen:lastSentTimestamp:](v3, a2, v2, v4, v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  return v7;
}

- (uint64_t)_processLocation:(void *)a3 forCoordinateSeries:(unint64_t)a4 limit:(unint64_t *)a5 locationsSeen:(id *)a6 lastSentTimestamp:
{
  id v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  double v16;

  v11 = a2;
  v12 = a3;
  if (a1)
  {
    v13 = *a5 + 1;
    *a5 = v13;
    if (v13 <= a4)
    {
      v15 = objc_alloc_init(MEMORY[0x1E0CB6460]);
      objc_msgSend(v11, "coordinate");
      objc_msgSend(v15, "setLatitude:");
      objc_msgSend(v11, "coordinate");
      objc_msgSend(v15, "setLongitude:", v16);
      objc_msgSend(v12, "addCoordinates:", v15);
      objc_msgSend(v11, "timestamp");
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      v14 = 1;
      goto LABEL_6;
    }
    objc_msgSend(*a6, "timeIntervalSinceReferenceDate");
    objc_msgSend(v12, "setResumeDate:");
  }
  v14 = 0;
LABEL_6:

  return v14;
}

- (void)remote_fetchRouteCoordinatesForWorkoutUUID:(id)a3 dateInterval:(id)a4 limit:(unint64_t)a5 completion:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD, id);
  unint64_t maxRouteCoordinateBatchSize;
  id v13;
  HDWorkoutClusterManager *workoutClusterManager;
  void *v15;
  unint64_t v16;
  id v17;
  id v18;
  _BOOL4 v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  HDWorkoutClusterServer *v25;
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  unint64_t v29;
  id v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];

  v22 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, id))a6;
  maxRouteCoordinateBatchSize = self->_maxRouteCoordinateBatchSize;
  v13 = objc_alloc_init(MEMORY[0x1E0CB6468]);
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__54;
  v31[4] = __Block_byref_object_dispose__54;
  v32 = 0;
  workoutClusterManager = self->_workoutClusterManager;
  objc_msgSend(v10, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 >= maxRouteCoordinateBatchSize)
    v16 = maxRouteCoordinateBatchSize;
  else
    v16 = a5;
  if (a5)
    maxRouteCoordinateBatchSize = v16;
  v30 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __99__HDWorkoutClusterServer_remote_fetchRouteCoordinatesForWorkoutUUID_dateInterval_limit_completion___block_invoke;
  v23[3] = &unk_1E6CF1FB8;
  v17 = v10;
  v24 = v17;
  v25 = self;
  v18 = v13;
  v26 = v18;
  v27 = v33;
  v28 = v31;
  v29 = maxRouteCoordinateBatchSize;
  v19 = -[HDWorkoutClusterManager enumerateRouteLocationsForWorkoutUUID:startDate:limit:error:handler:](workoutClusterManager, "enumerateRouteLocationsForWorkoutUUID:startDate:limit:error:handler:", v22, v15, maxRouteCoordinateBatchSize + 1, &v30, v23);
  v20 = v30;

  if (v19)
    v21 = v18;
  else
    v21 = 0;
  ((void (**)(id, id, id))v11)[2](v11, v21, v20);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);

}

uint64_t __99__HDWorkoutClusterServer_remote_fetchRouteCoordinatesForWorkoutUUID_dateInterval_limit_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t *v13;
  uint64_t v14;
  id obj;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_4;
  v5 = (void *)v4;
  objc_msgSend(v3, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "hk_isAfterDate:", v7);

  if ((v8 & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
LABEL_4:
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 72);
    v13 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v14 + 40);
    v9 = -[HDWorkoutClusterServer _processLocation:forCoordinateSeries:limit:locationsSeen:lastSentTimestamp:](v10, v3, v11, v12, v13, &obj);
    objc_storeStrong((id *)(v14 + 40), obj);
  }

  return v9;
}

- (void)remote_createWorkoutCluster:(id)a3 completion:(id)a4
{
  id v6;
  HDWorkoutClusterManager *workoutClusterManager;
  void (**v8)(id, uint64_t, id);
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  workoutClusterManager = self->_workoutClusterManager;
  v16 = 0;
  v8 = (void (**)(id, uint64_t, id))a4;
  v9 = -[HDWorkoutClusterManager createWorkoutCluster:error:](workoutClusterManager, "createWorkoutCluster:error:", v6, &v16);
  v10 = v16;
  _HKInitializeLogging();
  v11 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    objc_msgSend(v6, "clusterUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HKStringFromBool();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v13;
    v19 = 2114;
    v20 = v14;
    v21 = 2114;
    v22 = v15;
    _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "Created workout cluster (%{public}@) with success=%{public}@, error=%{public}@", buf, 0x20u);

  }
  v8[2](v8, v9, v10);

}

- (void)remote_fetchWorkoutClustersWithCompletion:(id)a3
{
  HDWorkoutClusterManager *workoutClusterManager;
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  workoutClusterManager = self->_workoutClusterManager;
  v12 = 0;
  v4 = (void (**)(id, void *, id))a3;
  -[HDWorkoutClusterManager allWorkoutClustersWithError:](workoutClusterManager, "allWorkoutClustersWithError:", &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = objc_msgSend(v5, "count");
    HKStringFromBool();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    v17 = 2114;
    v18 = v11;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "Fetched all workout clusters (count %lu) with success=%{public}@, error=%{public}@", buf, 0x20u);

  }
  v4[2](v4, v5, v6);

}

- (void)remote_fetchWorkoutClusterContainingWorkoutUUID:(id)a3 completion:(id)a4
{
  id v6;
  HDWorkoutClusterManager *workoutClusterManager;
  void (**v8)(id, void *, id);
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  workoutClusterManager = self->_workoutClusterManager;
  v16 = 0;
  v8 = (void (**)(id, void *, id))a4;
  -[HDWorkoutClusterManager workoutClusterContainingWorkoutUUID:error:](workoutClusterManager, "workoutClusterContainingWorkoutUUID:error:", v6, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  _HKInitializeLogging();
  v11 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    objc_msgSend(v9, "clusterUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HKStringFromBool();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v18 = v13;
    v19 = 2114;
    v20 = v6;
    v21 = 2114;
    v22 = v14;
    v23 = 2114;
    v24 = v15;
    _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "Fetched cluster (%{public}@) for workout UUID %{public}@ with success=%{public}@, error=%{public}@", buf, 0x2Au);

  }
  v8[2](v8, v9, v10);

}

- (void)remote_fetchWorkoutClustersContainingWorkoutUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  HDWorkoutClusterManager *workoutClusterManager;
  void (**v8)(id, void *, id);
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  workoutClusterManager = self->_workoutClusterManager;
  v17 = 0;
  v8 = (void (**)(id, void *, id))a4;
  -[HDWorkoutClusterManager workoutClustersContainingWorkoutUUIDs:error:](workoutClusterManager, "workoutClustersContainingWorkoutUUIDs:error:", v6, &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v17;
  _HKInitializeLogging();
  v11 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = objc_msgSend(v9, "count");
    v14 = objc_msgSend(v6, "count");
    HKStringFromBool();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v19 = v13;
    v20 = 2048;
    v21 = v14;
    v22 = 2114;
    v23 = v15;
    v24 = 2114;
    v25 = v16;
    _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "Fetched clusters (count %lu) for workouts (count %lu) with success=%{public}@, error=%{public}@", buf, 0x2Au);

  }
  v8[2](v8, v9, v10);

}

- (void)remote_fetchWorkoutUUIDsForClusterUUID:(id)a3 completion:(id)a4
{
  id v6;
  HDWorkoutClusterManager *workoutClusterManager;
  void (**v8)(id, void *, id);
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  workoutClusterManager = self->_workoutClusterManager;
  v16 = 0;
  v8 = (void (**)(id, void *, id))a4;
  -[HDWorkoutClusterManager allWorkoutUUIDsForClusterUUID:error:](workoutClusterManager, "allWorkoutUUIDsForClusterUUID:error:", v6, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  _HKInitializeLogging();
  v11 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = objc_msgSend(v9, "count");
    HKStringFromBool();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v18 = v6;
    v19 = 2048;
    v20 = v13;
    v21 = 2114;
    v22 = v14;
    v23 = 2114;
    v24 = v15;
    _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "Fetched workout UUIDs (cluster=%{public}@, count %lu) with success=%{public}@, error=%{public}@", buf, 0x2Au);

  }
  v8[2](v8, v9, v10);

}

- (void)remote_fetchWorkoutRouteSnapshotForClusterUUID:(id)a3 completion:(id)a4
{
  id v6;
  HDWorkoutClusterManager *workoutClusterManager;
  void (**v8)(id, void *, id);
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  double v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  workoutClusterManager = self->_workoutClusterManager;
  v16 = 0;
  v8 = (void (**)(id, void *, id))a4;
  -[HDWorkoutClusterManager workoutRouteSnapshotForClusterUUID:error:](workoutClusterManager, "workoutRouteSnapshotForClusterUUID:error:", v6, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  _HKInitializeLogging();
  v11 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = (double)(unint64_t)objc_msgSend(v9, "length") * 0.0009765625;
    HKStringFromBool();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v18 = v6;
    v19 = 2048;
    v20 = v13;
    v21 = 2114;
    v22 = v14;
    v23 = 2114;
    v24 = v15;
    _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "Fetched route snapshot (cluster=%{public}@, %0.1lf kB) with success=%{public}@, error=%{public}@", buf, 0x2Au);

  }
  v8[2](v8, v9, v10);

}

- (void)remote_updateWorkoutRouteSnapshot:(id)a3 forClusterUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  HDWorkoutClusterManager *workoutClusterManager;
  void (**v11)(id, uint64_t, id);
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  double v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  workoutClusterManager = self->_workoutClusterManager;
  v19 = 0;
  v11 = (void (**)(id, uint64_t, id))a5;
  v12 = -[HDWorkoutClusterManager updateWorkoutClusterWithUUID:newRouteSnapshot:error:](workoutClusterManager, "updateWorkoutClusterWithUUID:newRouteSnapshot:error:", v9, v8, &v19);
  v13 = v19;
  _HKInitializeLogging();
  v14 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    v16 = (double)(unint64_t)objc_msgSend(v8, "length") * 0.0009765625;
    HKStringFromBool();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v21 = v9;
    v22 = 2048;
    v23 = v16;
    v24 = 2114;
    v25 = v17;
    v26 = 2114;
    v27 = v18;
    _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "Updated route snapshot (cluster=%{public}@, %0.1lf kB) with success=%{public}@, error=%{public}@", buf, 0x2Au);

  }
  v11[2](v11, v12, v13);

}

- (void)remote_updateWorkoutRouteLabel:(id)a3 forClusterUUID:(id)a4 completion:(id)a5
{
  id v8;
  HDWorkoutClusterManager *workoutClusterManager;
  void (**v10)(id, uint64_t, id);
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  workoutClusterManager = self->_workoutClusterManager;
  v17 = 0;
  v10 = (void (**)(id, uint64_t, id))a5;
  v11 = -[HDWorkoutClusterManager updateWorkoutClusterWithUUID:newRouteLabel:error:](workoutClusterManager, "updateWorkoutClusterWithUUID:newRouteLabel:error:", v8, a3, &v17);
  v12 = v17;
  _HKInitializeLogging();
  v13 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    HKStringFromBool();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v8;
    v20 = 2114;
    v21 = v15;
    v22 = 2114;
    v23 = v16;
    _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "Updated route label (cluster=%{public}@) with success=%{public}@, error=%{public}@", buf, 0x20u);

  }
  v10[2](v10, v11, v12);

}

- (void)remote_updateWorkoutClusterWithUUID:(id)a3 newRelevance:(id)a4 newLastWorkoutUUID:(id)a5 newBestWorkoutUUID:(id)a6 newWorkoutAssociations:(id)a7 workoutAssociationsToRemove:(id)a8 completion:(id)a9
{
  id v15;
  HDWorkoutClusterManager *workoutClusterManager;
  void (**v17)(id, uint64_t, id);
  uint64_t v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  workoutClusterManager = self->_workoutClusterManager;
  v24 = 0;
  v17 = (void (**)(id, uint64_t, id))a9;
  v18 = -[HDWorkoutClusterManager updateWorkoutClusterWithUUID:newRelevance:newLastWorkoutUUID:newBestWorkoutUUID:newWorkoutAssociations:workoutAssociationsToRemove:error:](workoutClusterManager, "updateWorkoutClusterWithUUID:newRelevance:newLastWorkoutUUID:newBestWorkoutUUID:newWorkoutAssociations:workoutAssociationsToRemove:error:", v15, a4, a5, a6, a7, a8, &v24);
  v19 = v24;
  _HKInitializeLogging();
  v20 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v21 = v20;
    HKStringFromBool();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v26 = v15;
    v27 = 2114;
    v28 = v22;
    v29 = 2114;
    v30 = v23;
    _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "Updated workout cluster (%{public}@) with success=%{public}@, error=%{public}@", buf, 0x20u);

  }
  v17[2](v17, v18, v19);

}

- (void)remote_deleteWorkoutClusterWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  HDWorkoutClusterManager *workoutClusterManager;
  void (**v8)(id, uint64_t, id);
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  workoutClusterManager = self->_workoutClusterManager;
  v15 = 0;
  v8 = (void (**)(id, uint64_t, id))a4;
  v9 = -[HDWorkoutClusterManager deleteWorkoutClusterWithUUID:error:](workoutClusterManager, "deleteWorkoutClusterWithUUID:error:", v6, &v15);
  v10 = v15;
  _HKInitializeLogging();
  v11 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    HKStringFromBool();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v17 = v6;
    v18 = 2114;
    v19 = v13;
    v20 = 2114;
    v21 = v14;
    _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "Deleted workout cluster (%{public}@) with success=%{public}@, error=%{public}@", buf, 0x20u);

  }
  v8[2](v8, v9, v10);

}

- (void)remote_generateRaceRouteClustersWithLimit:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, id);
  double Current;
  HDWorkoutClusterManager *workoutClusterManager;
  uint64_t v9;
  id v10;
  double v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  id v20;
  uint8_t buf[4];
  double v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t, id))a4;
  Current = CFAbsoluteTimeGetCurrent();
  workoutClusterManager = self->_workoutClusterManager;
  v20 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __79__HDWorkoutClusterServer_remote_generateRaceRouteClustersWithLimit_completion___block_invoke;
  v19[3] = &unk_1E6CF1FE0;
  v19[4] = self;
  v19[5] = a3;
  v9 = -[HDWorkoutClusterManager performUsingAccessibilityAssertionWithError:block:](workoutClusterManager, "performUsingAccessibilityAssertionWithError:block:", &v20, v19);
  v10 = v20;
  v11 = CFAbsoluteTimeGetCurrent();
  _HKInitializeLogging();
  v12 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    HKStringFromBool();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v22 = v11 - Current;
    v23 = 2048;
    v24 = a3;
    v25 = 2114;
    v26 = v14;
    v27 = 2114;
    v28 = v15;
    _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "Generated Race Route clusters (%0.3lfs, limit %lu) with success=%{public}@, error=%{public}@", buf, 0x2Au);

  }
  if ((_DWORD)v9)
  {
    -[HDWorkoutClusterManager profile](self->_workoutClusterManager, "profile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "nanoSyncManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDWorkoutClusterManager accessibilityAssertion](self->_workoutClusterManager, "accessibilityAssertion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "syncHealthDataWithOptions:reason:accessibilityAssertion:completion:", 1, CFSTR("Race Route clusters generated"), v18, &__block_literal_global_58);

  }
  v6[2](v6, v9, v10);

}

uint64_t __79__HDWorkoutClusterServer_remote_generateRaceRouteClustersWithLimit_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "generateRaceRouteClustersWithLimit:error:", *(_QWORD *)(a1 + 40), a2);
}

void __79__HDWorkoutClusterServer_remote_generateRaceRouteClustersWithLimit_completion___block_invoke_191(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v4;
      _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "Failed to sync Racing clusters after generation: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }

}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6E10], "taskIdentifier");
}

- (unint64_t)maxWorkoutBatchSize
{
  return self->_maxWorkoutBatchSize;
}

- (void)setMaxWorkoutBatchSize:(unint64_t)a3
{
  self->_maxWorkoutBatchSize = a3;
}

- (unint64_t)maxRouteCoordinateBatchSize
{
  return self->_maxRouteCoordinateBatchSize;
}

- (void)setMaxRouteCoordinateBatchSize:(unint64_t)a3
{
  self->_maxRouteCoordinateBatchSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutClusterManager, 0);
  objc_storeStrong((id *)&self->_raceRouteClusterManager, 0);
}

@end
