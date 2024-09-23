@implementation HDRaceRouteClusterManager

- (HDRaceRouteClusterManager)initWithProfile:(id)a3
{
  id v4;
  HDRaceRouteClusterManager *v5;
  HDRaceRouteClusterManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDRaceRouteClusterManager;
  v5 = -[HDRaceRouteClusterManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_profile, v4);

  return v6;
}

- (id)raceRouteClustersForActivityType:(unint64_t)a3 error:(id *)a4
{
  id WeakRetained;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  +[HDRaceRouteClusterEntity raceRouteClustersForActivityType:profile:error:](HDRaceRouteClusterEntity, "raceRouteClustersForActivityType:profile:error:", a3, WeakRetained, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)generateRaceRouteClustersWithLimit:(unint64_t)a3 error:(id *)a4
{
  HDProfile **p_profile;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  id v13;
  void *v14;
  BOOL v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  _QWORD v22[5];

  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __70__HDRaceRouteClusterManager_generateRaceRouteClustersWithLimit_error___block_invoke;
  v22[3] = &__block_descriptor_40_e35_B24__0__HDDatabaseTransaction_8__16l;
  v22[4] = a3;
  LODWORD(a3) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDRaceRouteGenerationQueueEntity, "performWriteTransactionWithHealthDatabase:error:block:", v9, a4, v22);

  if (!(_DWORD)a3)
    return 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  while (1)
  {
    v10 = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(v10, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __70__HDRaceRouteClusterManager_generateRaceRouteClustersWithLimit_error___block_invoke_2;
    v17[3] = &unk_1E6CEF700;
    v17[4] = self;
    v17[5] = &v18;
    v12 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDRaceRouteClusterEntity, "performWriteTransactionWithHealthDatabase:error:block:", v11, a4, v17);

    if (!v12)
      break;
    if (!*((_BYTE *)v19 + 24))
    {
      v13 = objc_loadWeakRetained((id *)p_profile);
      objc_msgSend(v13, "database");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDRaceRouteClusterEntity, "performWriteTransactionWithHealthDatabase:error:block:", v14, a4, &__block_literal_global_249);

      goto LABEL_8;
    }
  }
  v15 = 0;
LABEL_8:
  _Block_object_dispose(&v18, 8);
  return v15;
}

BOOL __70__HDRaceRouteClusterManager_generateRaceRouteClustersWithLimit_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  _BOOL8 v7;

  v5 = a2;
  +[HDWorkoutClusterEntity clusterEntitiesWithTransaction:limit:error:](HDWorkoutClusterEntity, "clusterEntitiesWithTransaction:limit:error:", v5, *(_QWORD *)(a1 + 32), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = +[HDRaceRouteGenerationQueueEntity populateWithWorkoutClusters:transaction:error:](HDRaceRouteGenerationQueueEntity, "populateWithWorkoutClusters:transaction:error:", v6, v5, a3);
  else
    v7 = 0;

  return v7;
}

BOOL __70__HDRaceRouteClusterManager_generateRaceRouteClustersWithLimit_error___block_invoke_2(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id WeakRetained;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  _BOOL8 v34;
  void *v35;
  _QWORD *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  id v46;
  _QWORD *v47;
  void *v48;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  _QWORD v63[9];
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;
  double *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;

  v5 = a2;
  +[HDRaceRouteGenerationQueueEntity nextWorkoutClusterWithTransaction:error:](HDRaceRouteGenerationQueueEntity, "nextWorkoutClusterWithTransaction:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = v6;
    v10 = v5;
    if (v8)
    {
      v86 = 0;
      v87 = &v86;
      v88 = 0x3032000000;
      v89 = __Block_byref_object_copy__212;
      v90 = __Block_byref_object_dispose__212;
      v91 = 0;
      v80 = 0;
      v81 = &v80;
      v82 = 0x3032000000;
      v83 = __Block_byref_object_copy__212;
      v84 = __Block_byref_object_dispose__212;
      v85 = 0;
      v74 = 0;
      v75 = &v74;
      v76 = 0x3032000000;
      v77 = __Block_byref_object_copy__212;
      v78 = __Block_byref_object_dispose__212;
      v79 = 0;
      v70 = 0;
      v71 = (double *)&v70;
      v72 = 0x2020000000;
      v73 = 0;
      v64 = 0;
      v65 = &v64;
      v66 = 0x3032000000;
      v67 = __Block_byref_object_copy__212;
      v68 = __Block_byref_object_dispose__212;
      v69 = 0;
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __79__HDRaceRouteClusterManager__racingClusterForWorkoutCluster_transaction_error___block_invoke;
      v63[3] = &unk_1E6D11998;
      v63[4] = &v86;
      v63[5] = &v80;
      v63[6] = &v74;
      v63[7] = &v70;
      v63[8] = &v64;
      if ((objc_msgSend(v9, "modelPropertiesWithTransaction:error:handler:", v10, a3, v63) & 1) != 0)
      {
        objc_msgSend(v9, "numberOfWorkoutsWithTransaction:error:", v10, a3);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v11)
        {
          v56 = a1;
          v58 = (void *)v11;
          v60 = v10;
          v61 = v9;
          v13 = v81[5];
          WeakRetained = objc_loadWeakRetained((id *)(v8 + 8));
          objc_msgSend(WeakRetained, "metadataManager");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[HDRaceRouteClusterWorkout clusterWorkoutWithWorkoutEntity:transaction:metadataManager:error:](HDRaceRouteClusterWorkout, "clusterWorkoutWithWorkoutEntity:transaction:metadataManager:error:", v13, v10, v15, a3);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v17 = v75[5];
            v18 = objc_loadWeakRetained((id *)(v8 + 8));
            objc_msgSend(v18, "metadataManager");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            +[HDRaceRouteClusterWorkout clusterWorkoutWithWorkoutEntity:transaction:metadataManager:error:](HDRaceRouteClusterWorkout, "clusterWorkoutWithWorkoutEntity:transaction:metadataManager:error:", v17, v60, v19, a3);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              v12 = v58;
              v21 = objc_alloc_init(MEMORY[0x1E0C99D50]);
              v22 = objc_alloc(MEMORY[0x1E0CB6A98]);
              objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = v87[5];
              v50 = objc_msgSend(v58, "unsignedIntegerValue");
              v24 = v71[3];
              v25 = objc_msgSend(v16, "activityType");
              objc_msgSend(v16, "workoutUUID");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "startDate");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "distance");
              v27 = v26;
              objc_msgSend(v16, "duration");
              v29 = v28;
              objc_msgSend(v20, "workoutUUID");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "startDate");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "distance");
              v31 = v30;
              objc_msgSend(v20, "duration");
              v33 = (void *)objc_msgSend(v22, "_initWithUUID:workoutClusterUUID:clusterSize:relevanceValue:workoutActivityType:lastWorkoutUUID:lastWorkoutDate:lastWorkoutDistance:lastWorkoutDuration:lastWorkoutStartingPoint:bestWorkoutUUID:bestWorkoutDate:bestWorkoutDistance:bestWorkoutDuration:workoutRouteSnapshot:workoutRouteLabel:", v23, v51, v50, v25, v55, v54, v24, v27, v29, v31, v32, 0, v53, v52,
                              v21,
                              v65[5]);

            }
            else
            {
              v33 = 0;
              v12 = v58;
            }

          }
          else
          {
            v33 = 0;
            v12 = v58;
          }

          v10 = v60;
          v9 = v61;
          a1 = v56;
        }
        else
        {
          v33 = 0;
        }

      }
      else
      {
        v33 = 0;
      }
      _Block_object_dispose(&v64, 8);

      _Block_object_dispose(&v70, 8);
      _Block_object_dispose(&v74, 8);

      _Block_object_dispose(&v80, 8);
      _Block_object_dispose(&v86, 8);

    }
    else
    {
      v33 = 0;
    }

    if (v33)
    {
      objc_msgSend(v9, "snapshotEntityWithTransaction:error:", v10, a3);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        v57 = v7;
        v59 = v5;
        v62 = v9;
        v36 = a3;
        v37 = v10;
        v38 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
        objc_msgSend(v38, "syncIdentityManager");
        v39 = a1;
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "currentSyncIdentity");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "entity");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "persistentID");
        v44 = objc_loadWeakRetained((id *)(*(_QWORD *)(v39 + 32) + 8));
        v45 = v43;
        v46 = v37;
        v47 = v36;
        +[HDRaceRouteClusterEntity insertOrUpdateRacingCluster:routeSnapshot:syncIdentity:transaction:profile:error:](HDRaceRouteClusterEntity, "insertOrUpdateRacingCluster:routeSnapshot:syncIdentity:transaction:profile:error:", v33, v35, v45, v46, v44, v36);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        if (v48)
          v34 = +[HDRaceRouteGenerationQueueEntity finishWorkoutCluster:concreteCluster:transaction:error:](HDRaceRouteGenerationQueueEntity, "finishWorkoutCluster:concreteCluster:transaction:error:", v62, v48, v46, v47);
        else
          v34 = 0;
        v7 = v57;
        v5 = v59;

      }
      else
      {
        v34 = 0;
      }

    }
    else
    {
      v34 = 0;
    }

  }
  else if (a3 && *a3)
  {
    v34 = 0;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    v34 = 1;
  }

  return v34;
}

BOOL __70__HDRaceRouteClusterManager_generateRaceRouteClustersWithLimit_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  _BOOL8 v6;

  v4 = a2;
  +[HDRaceRouteGenerationQueueEntity clearQueueWithTransaction:error:](HDRaceRouteGenerationQueueEntity, "clearQueueWithTransaction:error:", v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5
    && +[HDRaceRouteSnapshotEntity pruneUnreachableDataWithTransaction:error:](HDRaceRouteSnapshotEntity, "pruneUnreachableDataWithTransaction:error:", v4, a3)&& +[HDRaceRouteClusterEntity pruneRaceRouteClustersWithEligibleEntities:transaction:error:](HDRaceRouteClusterEntity, "pruneRaceRouteClustersWithEligibleEntities:transaction:error:", v5, v4, a3);

  return v6;
}

void __79__HDRaceRouteClusterManager__racingClusterForWorkoutCluster_transaction_error___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = *(_QWORD *)(a1[4] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v11;
  v28 = v11;
  v17 = a5;

  v18 = *(_QWORD *)(a1[5] + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v12;
  v20 = v12;

  v21 = *(_QWORD *)(a1[6] + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v13;
  v23 = v13;

  objc_msgSend(v17, "doubleValue");
  v25 = v24;

  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = v25;
  v26 = *(_QWORD *)(a1[8] + 8);
  v27 = *(void **)(v26 + 40);
  *(_QWORD *)(v26 + 40) = v14;

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
}

@end
