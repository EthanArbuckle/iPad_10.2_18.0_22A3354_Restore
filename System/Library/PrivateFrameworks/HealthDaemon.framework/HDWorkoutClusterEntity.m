@implementation HDWorkoutClusterEntity

+ (id)entityForClusterUUID:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  objc_msgSend(a4, "databaseForEntityClass:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDWorkoutClusterEntity _workoutClusterEntityForUUID:database:error:]((uint64_t)a1, v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_workoutClusterEntityForUUID:(void *)a3 database:(_QWORD *)a4 error:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  id v12;
  id v14;

  v6 = a2;
  v7 = a3;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("uuid"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  +[HDSQLiteEntity anyInDatabase:predicate:error:](HDWorkoutClusterEntity, "anyInDatabase:predicate:error:", v7, v8, &v14);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (unint64_t)v14;
  v11 = (void *)v10;
  if (v9 | v10)
  {
    v12 = (id)v10;
    if (v11)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v12);
      else
        _HKLogDroppedError();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 118, CFSTR("Cluster (%@) not found"), v6);
  }

  return (id)v9;
}

+ (id)insertWorkoutCluster:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__208;
  v25 = __Block_byref_object_dispose__208;
  v26 = 0;
  objc_msgSend(v9, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__HDWorkoutClusterEntity_insertWorkoutCluster_profile_error___block_invoke;
  v16[3] = &unk_1E6CF39E0;
  v20 = a1;
  v11 = v8;
  v17 = v11;
  v19 = &v21;
  v12 = v9;
  v18 = v12;
  LODWORD(a5) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v10, a5, v16);

  if ((_DWORD)a5)
    v13 = (void *)v22[5];
  else
    v13 = 0;
  v14 = v13;

  _Block_object_dispose(&v21, 8);
  return v14;
}

uint64_t __61__HDWorkoutClusterEntity_insertWorkoutCluster_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(id *, uint64_t);
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "lastWorkoutUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDWorkoutClusterEntity _workoutEntityForUUID:database:error:](v7, v8, v6, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "bestWorkoutUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDWorkoutClusterEntity _workoutEntityForUUID:database:error:](v10, v11, v6, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "workoutRouteSnapshot");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDRaceRouteSnapshotEntity insertSnapshotData:transaction:error:](HDRaceRouteSnapshotEntity, "insertSnapshotData:transaction:error:", v13, v5, a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      +[HDWorkoutClusterEntity _baseEntityProperties]();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "arrayByAddingObject:", CFSTR("snapshot_id"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = *(void **)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 40), "database");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = MEMORY[0x1E0C809B0];
      v28 = 3221225472;
      v29 = __61__HDWorkoutClusterEntity_insertWorkoutCluster_profile_error___block_invoke_2;
      v30 = &unk_1E6CFD150;
      v31 = *(id *)(a1 + 32);
      v32 = v9;
      v33 = v12;
      v19 = v14;
      v34 = v19;
      objc_msgSend(v17, "insertOrReplaceEntity:healthDatabase:properties:error:bindingHandler:", 0, v18, v16, a3, &v27);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v20;

      v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (v23)
      {
        objc_msgSend(*(id *)(a1 + 32), "workoutUUIDs", v27, v28, v29, v30, v31, v32, v33);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[HDWorkoutClusterEntity _associateWorkoutUUIDs:transaction:error:](v23, v24, v5, a3);

      }
      else
      {
        v25 = 0;
      }

    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

+ (id)_workoutEntityForUUID:(void *)a3 database:(_QWORD *)a4 error:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  id v13;

  v6 = a2;
  v7 = a3;
  objc_opt_self();
  HDDataEntityPredicateForDataUUID();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  +[HDDataEntity anyInDatabase:predicate:error:](HDWorkoutEntity, "anyInDatabase:predicate:error:", v7, v8, &v13);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (unint64_t)v13;
  if (v9 | v10)
  {
    v11 = (id)v10;
    if (v10)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 118, CFSTR("Workout (%@) not found"), v6);
  }

  return (id)v9;
}

+ (id)_baseEntityProperties
{
  _QWORD v1[7];

  v1[6] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v1[0] = CFSTR("uuid");
  v1[1] = CFSTR("relevance");
  v1[2] = CFSTR("last_workout_id");
  v1[3] = CFSTR("best_workout_id");
  v1[4] = CFSTR("route_label");
  v1[5] = CFSTR("modified_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __61__HDWorkoutClusterEntity_insertWorkoutCluster_profile_error___block_invoke_2(id *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1[4], "clusterUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB168](a2, CFSTR("uuid"), v4);

  objc_msgSend(a1[4], "relevanceValue");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("relevance"));
  MEMORY[0x1BCCAB114](a2, CFSTR("last_workout_id"), objc_msgSend(a1[5], "persistentID"));
  MEMORY[0x1BCCAB114](a2, CFSTR("best_workout_id"), objc_msgSend(a1[6], "persistentID"));
  MEMORY[0x1BCCAB114](a2, CFSTR("snapshot_id"), objc_msgSend(a1[7], "persistentID"));
  objc_msgSend(a1[4], "workoutRouteLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("route_label"), v5);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("modified_date"), v6);

}

- (uint64_t)_associateWorkoutUUIDs:(void *)a3 transaction:(_QWORD *)a4 error:
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  uint64_t v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v14 = v8;
        v15 = v13;
        objc_msgSend(v14, "databaseForEntity:", a1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[HDWorkoutClusterEntity _workoutEntityForUUID:database:error:]((uint64_t)HDWorkoutClusterEntity, v15, v16, a4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {

LABEL_13:
          v19 = 0;
          goto LABEL_14;
        }
        v18 = +[HDWorkoutClusterComponentEntity associateWorkout:withCluster:transaction:error:](HDWorkoutClusterComponentEntity, "associateWorkout:withCluster:transaction:error:", v17, a1, v14, a4);

        if (!v18)
          goto LABEL_13;
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v19 = 1;
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v19 = 1;
  }
LABEL_14:

  return v19;
}

+ (id)clusterEntitiesWithTransaction:(id)a3 limit:(unint64_t)a4 error:(id *)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v8 = (objc_class *)MEMORY[0x1E0C99DE8];
  v9 = a3;
  v10 = objc_alloc_init(v8);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT ROWID FROM RacePreviousRoute_workout_cluster ORDER BY relevance DESC LIMIT %lu"), a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseForEntityClass:", a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__HDWorkoutClusterEntity_clusterEntitiesWithTransaction_limit_error___block_invoke;
  v16[3] = &unk_1E6CE8CF8;
  v13 = v10;
  v17 = v13;
  LODWORD(v10) = objc_msgSend(v12, "executeSQL:error:bindingHandler:enumerationHandler:", v11, a5, 0, v16);

  v14 = 0;
  if ((_DWORD)v10)
    v14 = (void *)objc_msgSend(v13, "copy");

  return v14;
}

uint64_t __69__HDWorkoutClusterEntity_clusterEntitiesWithTransaction_limit_error___block_invoke(uint64_t a1)
{
  void *v1;
  HDWorkoutClusterEntity *v2;

  v1 = *(void **)(a1 + 32);
  v2 = -[HDSQLiteEntity initWithPersistentID:]([HDWorkoutClusterEntity alloc], "initWithPersistentID:", HDSQLiteColumnAsInt64());
  objc_msgSend(v1, "addObject:", v2);

  return 1;
}

+ (id)workoutClustersForProfile:(id)a3 limit:(unint64_t)a4 error:(id *)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  unint64_t v18;

  v8 = (objc_class *)MEMORY[0x1E0C99DE8];
  v9 = a3;
  v10 = objc_alloc_init(v8);
  objc_msgSend(v9, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__HDWorkoutClusterEntity_workoutClustersForProfile_limit_error___block_invoke;
  v15[3] = &unk_1E6CF5F78;
  v17 = a1;
  v18 = a4;
  v12 = v10;
  v16 = v12;
  LODWORD(a5) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v11, a5, v15);

  if ((_DWORD)a5)
    v13 = (void *)objc_msgSend(v12, "copy");
  else
    v13 = 0;

  return v13;
}

uint64_t __64__HDWorkoutClusterEntity_workoutClustersForProfile_limit_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  __int128 v16;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("relevance"), *(_QWORD *)(a1 + 40), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v20[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v5, 0, v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDWorkoutClusterEntity _baseEntityProperties]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__HDWorkoutClusterEntity_workoutClustersForProfile_limit_error___block_invoke_2;
  v17[3] = &unk_1E6CEDF88;
  v18 = v5;
  v16 = *(_OWORD *)(a1 + 32);
  v12 = (id)v16;
  v19 = v16;
  v13 = v5;
  v14 = objc_msgSend(v10, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v11, a3, v17);

  return v14;
}

BOOL __64__HDWorkoutClusterEntity_workoutClustersForProfile_limit_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;

  +[HDWorkoutClusterEntity _clusterModelForSQLiteRow:database:error:](*(_QWORD *)(a1 + 48), a4, *(void **)(a1 + 32), a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

  return v6 != 0;
}

+ (id)_clusterModelForSQLiteRow:(void *)a3 database:(uint64_t)a4 error:
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = objc_opt_self();
  HDSQLiteColumnWithNameAsUUID();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = HDSQLiteColumnWithNameAsInt64();
  v9 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDouble();
  v11 = v10;
  HDSQLiteColumnWithNameAsString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDWorkoutClusterEntity _workoutUUIDForPersistentID:database:error:](v6, v8, v5, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    +[HDWorkoutClusterEntity _workoutUUIDForPersistentID:database:error:](v6, v9, v5, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6E08]), "_initWithUUID:workoutUUIDs:lastWorkoutUUID:bestWorkoutUUID:relevanceValue:workoutRouteSnapshot:workoutRouteLabel:", v7, 0, v13, v14, 0, v12, v11);
    else
      v15 = 0;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)workoutClusterContainingWorkoutUUID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__208;
  v23 = __Block_byref_object_dispose__208;
  v24 = 0;
  objc_msgSend(v9, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__HDWorkoutClusterEntity_workoutClusterContainingWorkoutUUID_profile_error___block_invoke;
  v15[3] = &unk_1E6CEC9E0;
  v18 = a1;
  v11 = v8;
  v16 = v11;
  v17 = &v19;
  LODWORD(a5) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v10, a5, v15);

  if ((_DWORD)a5)
    v12 = (void *)v20[5];
  else
    v12 = 0;
  v13 = v12;

  _Block_object_dispose(&v19, 8);
  return v13;
}

uint64_t __76__HDWorkoutClusterEntity_workoutClusterContainingWorkoutUUID_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v27;
  void *v28;
  _QWORD *v29;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDWorkoutClusterEntity _workoutEntityForUUID:database:error:](*(_QWORD *)(a1 + 48), *(void **)(a1 + 32), v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v29 = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v6, "persistentID"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0D29870];
    objc_msgSend(*(id *)(a1 + 48), "databaseTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "innerJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v9, objc_opt_class(), 0, *MEMORY[0x1E0D29618], CFSTR("cluster_id"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0D29878];
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v28, 0);
    objc_msgSend(v10, "predicateWithJoinClauses:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0D298B0];
    v14 = (void *)MEMORY[0x1E0CB3940];
    +[HDWorkoutClusterComponentEntity databaseTable](HDWorkoutClusterComponentEntity, "databaseTable");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@.%@ = ?"), v15, CFSTR("workout_id"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "predicateWithSQL:overProperties:values:", v16, MEMORY[0x1E0C9AA60], v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v12, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("modified_date"), *(_QWORD *)(a1 + 48), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(void **)(a1 + 48);
    v33 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v5, v19, 1, v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    +[HDWorkoutClusterEntity _baseEntityProperties]();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __76__HDWorkoutClusterEntity_workoutClusterContainingWorkoutUUID_profile_error___block_invoke_2;
    v30[3] = &unk_1E6CEDFB0;
    v32 = *(_OWORD *)(a1 + 40);
    v31 = v5;
    v25 = objc_msgSend(v23, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v24, v29, v30);

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

BOOL __76__HDWorkoutClusterEntity_workoutClusterContainingWorkoutUUID_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  +[HDWorkoutClusterEntity _clusterModelForSQLiteRow:database:error:](*(_QWORD *)(a1 + 48), a4, *(void **)(a1 + 32), a5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

+ (id)clusterUUIDsForWorkoutUUIDs:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = (objc_class *)MEMORY[0x1E0C99DE8];
  v10 = a4;
  v11 = objc_alloc_init(v9);
  objc_msgSend(v10, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68__HDWorkoutClusterEntity_clusterUUIDsForWorkoutUUIDs_profile_error___block_invoke;
  v17[3] = &unk_1E6CE9280;
  v20 = a1;
  v18 = v8;
  v13 = v11;
  v19 = v13;
  v14 = v8;
  LODWORD(a5) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v12, a5, v17);

  if ((_DWORD)a5)
    v15 = (void *)objc_msgSend(v13, "copy");
  else
    v15 = 0;

  return v15;
}

uint64_t __68__HDWorkoutClusterEntity_clusterUUIDsForWorkoutUUIDs_profile_error___block_invoke(id *a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  const __CFString *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v17;
  void *v18;
  id v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  objc_msgSend(a2, "databaseForEntityClass:", a1[6]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc(MEMORY[0x1E0CB37A0]);
  objc_msgSend(a1[6], "databaseTable");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "databaseTable");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDWorkoutClusterComponentEntity databaseTable](HDWorkoutClusterComponentEntity, "databaseTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "databaseTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D29618];
  +[HDDataEntity databaseTable](HDDataEntity, "databaseTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDataEntity databaseTable](HDDataEntity, "databaseTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDataEntity databaseTable](HDDataEntity, "databaseTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("SELECT %@.%@ FROM %@ INNER JOIN %@ ON %@.%@ = %@ INNER JOIN %@ ON %@.%@ = %@ WHERE %@.%@ IN ("), v18, CFSTR("uuid"), v17, v4, v5, v6, CFSTR("cluster_id"), v7, v8, CFSTR("data_id"), CFSTR("workout_id"), v9, CFSTR("uuid"), 0);

  if (objc_msgSend(a1[4], "count"))
  {
    v11 = 0;
    v12 = CFSTR("?");
    do
    {
      objc_msgSend(v10, "appendFormat:", v12);
      ++v11;
      v13 = objc_msgSend(a1[4], "count");
      v12 = CFSTR(",?");
    }
    while (v13 > v11);
  }
  objc_msgSend(v10, "appendString:", CFSTR(")"));
  v14 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __68__HDWorkoutClusterEntity_clusterUUIDsForWorkoutUUIDs_profile_error___block_invoke_2;
  v24[3] = &unk_1E6CE9508;
  v25 = a1[4];
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __68__HDWorkoutClusterEntity_clusterUUIDsForWorkoutUUIDs_profile_error___block_invoke_3;
  v22[3] = &unk_1E6CE8CF8;
  v23 = a1[5];
  v15 = objc_msgSend(v21, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", v10, a3, v24, v22);

  return v15;
}

uint64_t __68__HDWorkoutClusterEntity_clusterUUIDsForWorkoutUUIDs_profile_error___block_invoke_2()
{
  return HDSQLiteBindFoundationValuesToStatement();
}

uint64_t __68__HDWorkoutClusterEntity_clusterUUIDsForWorkoutUUIDs_profile_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  MEMORY[0x1BCCAB1E0](a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return 1;
}

+ (id)workoutEntityForUUID:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  objc_msgSend(a4, "databaseForEntityClass:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDWorkoutClusterEntity _workoutEntityForUUID:database:error:]((uint64_t)HDWorkoutClusterEntity, v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)workoutUUIDsForClusterUUID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__208;
  v23 = __Block_byref_object_dispose__208;
  v24 = 0;
  objc_msgSend(v9, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__HDWorkoutClusterEntity_workoutUUIDsForClusterUUID_profile_error___block_invoke;
  v15[3] = &unk_1E6CEC9E0;
  v18 = a1;
  v11 = v8;
  v16 = v11;
  v17 = &v19;
  LODWORD(a5) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDWorkoutClusterEntity, "performReadTransactionWithHealthDatabase:error:block:", v10, a5, v15);

  if ((_DWORD)a5)
    v12 = (void *)v20[5];
  else
    v12 = 0;
  v13 = v12;

  _Block_object_dispose(&v19, 8);
  return v13;
}

BOOL __67__HDWorkoutClusterEntity_workoutUUIDsForClusterUUID_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;

  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDWorkoutClusterEntity _workoutClusterEntityForUUID:database:error:](*(_QWORD *)(a1 + 48), *(void **)(a1 + 32), v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "workoutUUIDsWithTransaction:error:", v5, a3);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)workoutUUIDsWithTransaction:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  BOOL (*v15)(uint64_t, void *, uint64_t);
  void *v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "databaseForEntity:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __60__HDWorkoutClusterEntity_workoutUUIDsWithTransaction_error___block_invoke;
  v16 = &unk_1E6D11188;
  v9 = v8;
  v17 = v9;
  v10 = v7;
  v18 = v10;
  if (self
    && +[HDWorkoutClusterComponentEntity enumerateWorkoutsForCluster:transaction:error:block:](HDWorkoutClusterComponentEntity, "enumerateWorkoutsForCluster:transaction:error:block:", self, v6, a4, &v13))
  {
    v11 = (void *)objc_msgSend(v10, "copy", v13, v14, v15, v16, v17, v18);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

BOOL __60__HDWorkoutClusterEntity_workoutUUIDsWithTransaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;

  +[HDWorkoutClusterEntity _workoutUUIDForPersistentID:database:error:]((uint64_t)HDWorkoutClusterEntity, objc_msgSend(a2, "persistentID"), *(void **)(a1 + 32), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

  return v4 != 0;
}

+ (id)_workoutUUIDForPersistentID:(void *)a3 database:(uint64_t)a4 error:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDDataEntityPredicateForRowID((uint64_t)v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDSQLiteEntity propertyValueForAnyInDatabase:property:predicate:error:](HDDataEntity, "propertyValueForAnyInDatabase:property:predicate:error:", v6, CFSTR("uuid"), v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _HDUUIDForSQLiteValue();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)updateWorkoutClusterWithUUID:(id)a3 routeSnapshot:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v10 = a3;
  v11 = a4;
  objc_msgSend(a5, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __83__HDWorkoutClusterEntity_updateWorkoutClusterWithUUID_routeSnapshot_profile_error___block_invoke;
  v16[3] = &unk_1E6CE9280;
  v18 = v11;
  v19 = a1;
  v17 = v10;
  v13 = v11;
  v14 = v10;
  LOBYTE(a6) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v12, a6, v16);

  return (char)a6;
}

uint64_t __83__HDWorkoutClusterEntity_updateWorkoutClusterWithUUID_routeSnapshot_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDWorkoutClusterEntity _workoutClusterEntityForUUID:database:error:](*(_QWORD *)(a1 + 48), *(void **)(a1 + 32), v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "snapshotEntityWithTransaction:error:", v5, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      v11 = objc_msgSend(v9, "updateSnapshotData:transaction:error:", *(_QWORD *)(a1 + 40), v5, a3);
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)updateWorkoutClusterWithUUID:(id)a3 routeLabel:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v10 = a3;
  v11 = a4;
  objc_msgSend(a5, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__HDWorkoutClusterEntity_updateWorkoutClusterWithUUID_routeLabel_profile_error___block_invoke;
  v16[3] = &unk_1E6CE9280;
  v18 = v11;
  v19 = a1;
  v17 = v10;
  v13 = v11;
  v14 = v10;
  LOBYTE(a6) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v12, a6, v16);

  return (char)a6;
}

uint64_t __80__HDWorkoutClusterEntity_updateWorkoutClusterWithUUID_routeLabel_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDWorkoutClusterEntity _workoutClusterEntityForUUID:database:error:](*(_QWORD *)(a1 + 48), *(void **)(a1 + 32), v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v12[0] = CFSTR("route_label");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __80__HDWorkoutClusterEntity_updateWorkoutClusterWithUUID_routeLabel_profile_error___block_invoke_2;
    v10[3] = &unk_1E6CE84C8;
    v11 = *(id *)(a1 + 40);
    v8 = objc_msgSend(v6, "updateProperties:database:error:bindingHandler:", v7, v5, a3, v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __80__HDWorkoutClusterEntity_updateWorkoutClusterWithUUID_routeLabel_profile_error___block_invoke_2()
{
  JUMPOUT(0x1BCCAB144);
}

+ (BOOL)updateWorkoutClusterWithUUID:(id)a3 relevanceValue:(id)a4 lastWorkoutUUID:(id)a5 bestWorkoutUUID:(id)a6 workoutUUIDsToAssociate:(id)a7 workoutUUIDsToRemove:(id)a8 profile:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  objc_msgSend(a9, "database");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __161__HDWorkoutClusterEntity_updateWorkoutClusterWithUUID_relevanceValue_lastWorkoutUUID_bestWorkoutUUID_workoutUUIDsToAssociate_workoutUUIDsToRemove_profile_error___block_invoke;
  v30[3] = &unk_1E6D111D8;
  v36 = v21;
  v37 = a1;
  v31 = v16;
  v32 = v17;
  v33 = v18;
  v34 = v19;
  v35 = v20;
  v23 = v21;
  v24 = v20;
  v25 = v19;
  v26 = v18;
  v27 = v17;
  v28 = v16;
  LOBYTE(a1) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v22, a10, v30);

  return (char)a1;
}

uint64_t __161__HDWorkoutClusterEntity_updateWorkoutClusterWithUUID_relevanceValue_lastWorkoutUUID_bestWorkoutUUID_workoutUUIDsToAssociate_workoutUUIDsToRemove_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t i;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v26;
  void *v27;
  id obj;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 80));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDWorkoutClusterEntity _workoutClusterEntityForUUID:database:error:](*(_QWORD *)(a1 + 80), *(void **)(a1 + 32), v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v9 = v8;
    if (*(_QWORD *)(a1 + 40))
      objc_msgSend(v8, "appendFormat:", CFSTR(", %@ = ?"), CFSTR("relevance"));
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(v9, "appendFormat:", CFSTR(", %@ = ?"), CFSTR("last_workout_id"));
      +[HDWorkoutClusterEntity _workoutEntityForUUID:database:error:](*(_QWORD *)(a1 + 80), *(void **)(a1 + 48), v6, a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10
        || !+[HDWorkoutClusterComponentEntity associateWorkout:withCluster:transaction:error:](HDWorkoutClusterComponentEntity, "associateWorkout:withCluster:transaction:error:", v10, v7, v5, a3))
      {
        v11 = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    else
    {
      v10 = 0;
    }
    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(v9, "appendFormat:", CFSTR(", %@ = ?"), CFSTR("best_workout_id"));
      +[HDWorkoutClusterEntity _workoutEntityForUUID:database:error:](*(_QWORD *)(a1 + 80), *(void **)(a1 + 56), v6, a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12
        || !+[HDWorkoutClusterComponentEntity associateWorkout:withCluster:transaction:error:](HDWorkoutClusterComponentEntity, "associateWorkout:withCluster:transaction:error:", v12, v7, v5, a3))
      {
        v11 = 0;
LABEL_33:

        goto LABEL_34;
      }
    }
    else
    {
      v12 = 0;
    }
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 80), "databaseTable");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = ?%@ WHERE %@ = ?"), v14, CFSTR("modified_date"), v9, *MEMORY[0x1E0D29618]);
    v15 = objc_claimAutoreleasedReturnValue();

    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __161__HDWorkoutClusterEntity_updateWorkoutClusterWithUUID_relevanceValue_lastWorkoutUUID_bestWorkoutUUID_workoutUUIDsToAssociate_workoutUUIDsToRemove_profile_error___block_invoke_2;
    v34[3] = &unk_1E6D111B0;
    v35 = *(id *)(a1 + 40);
    v36 = v10;
    v30 = v12;
    v37 = v30;
    v16 = v7;
    v38 = v16;
    v29 = (void *)v15;
    if (objc_msgSend(v6, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", v15, a3, v34, 0)&& -[HDWorkoutClusterEntity _associateWorkoutUUIDs:transaction:error:]((uint64_t)v16, *(void **)(a1 + 64), v5, a3))
    {
      v17 = *(id *)(a1 + 72);
      v33 = v5;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      obj = v17;
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v32)
      {
        v31 = *(_QWORD *)v40;
        v26 = v10;
        v27 = v9;
        while (2)
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v40 != v31)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            v20 = v33;
            v21 = v19;
            objc_msgSend(v20, "databaseForEntity:", v16);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            +[HDWorkoutClusterEntity _workoutEntityForUUID:database:error:]((uint64_t)HDWorkoutClusterEntity, v21, v22, a3);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v23)
            {

LABEL_30:
              v11 = 0;
              v10 = v26;
              v9 = v27;
              goto LABEL_31;
            }
            v24 = +[HDWorkoutClusterComponentEntity removeWorkout:fromCluster:transaction:error:](HDWorkoutClusterComponentEntity, "removeWorkout:fromCluster:transaction:error:", v23, v16, v20, a3);

            if (!v24)
              goto LABEL_30;
          }
          v11 = 1;
          v10 = v26;
          v9 = v27;
          v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
          if (v32)
            continue;
          break;
        }
      }
      else
      {
        v11 = 1;
      }
LABEL_31:

    }
    else
    {
      v11 = 0;
    }

    v12 = v30;
    goto LABEL_33;
  }
  v11 = 0;
LABEL_35:

  return v11;
}

uint64_t __161__HDWorkoutClusterEntity_updateWorkoutClusterWithUUID_relevanceValue_lastWorkoutUUID_bestWorkoutUUID_workoutUUIDsToAssociate_workoutUUIDsToRemove_profile_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  double v4;
  void *v5;
  double v6;
  int v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  sqlite3_bind_double(a2, 1, v4);
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    sqlite3_bind_double(a2, 2, v6);
    v7 = 3;
  }
  else
  {
    v7 = 2;
  }
  v8 = *(void **)(a1 + 40);
  if (v8)
    sqlite3_bind_int64(a2, v7++, objc_msgSend(v8, "persistentID"));
  v9 = *(void **)(a1 + 48);
  if (v9)
    sqlite3_bind_int64(a2, v7++, objc_msgSend(v9, "persistentID"));
  return sqlite3_bind_int64(a2, v7, objc_msgSend(*(id *)(a1 + 56), "persistentID"));
}

+ (BOOL)deleteWorkoutClusterWithUUID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a3;
  objc_msgSend(a4, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__HDWorkoutClusterEntity_deleteWorkoutClusterWithUUID_profile_error___block_invoke;
  v12[3] = &unk_1E6CEF660;
  v13 = v8;
  v14 = a1;
  v10 = v8;
  LOBYTE(a5) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v9, a5, v12);

  return (char)a5;
}

uint64_t __69__HDWorkoutClusterEntity_deleteWorkoutClusterWithUUID_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("uuid"), *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v6;
  v9 = (void *)objc_opt_self();
  objc_msgSend(v7, "databaseForEntityClass:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "queryWithDatabase:predicate:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = CFSTR("snapshot_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __83__HDWorkoutClusterEntity__deleteClusterBackingDataWithPredicate_transaction_error___block_invoke;
  v19[3] = &unk_1E6CF6008;
  v20 = v7;
  v13 = v7;
  v14 = objc_msgSend(v11, "enumerateProperties:error:enumerationHandler:", v12, a3, v19);

  if (v14)
  {
    v15 = *(void **)(a1 + 40);
    objc_msgSend(v13, "databaseForEntityClass:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "deleteEntitiesInDatabase:predicate:error:", v16, v8, a3);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)snapshotEntityWithTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  HDRaceRouteSnapshotEntity *v9;
  HDRaceRouteSnapshotEntity *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = -1;
  v17[0] = CFSTR("snapshot_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseForEntity:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__HDWorkoutClusterEntity_snapshotEntityWithTransaction_error___block_invoke;
  v12[3] = &unk_1E6CEEDC8;
  v12[4] = &v13;
  LOBYTE(a4) = -[HDSQLiteEntity getValuesForProperties:database:error:handler:](self, "getValuesForProperties:database:error:handler:", v7, v8, a4, v12);

  if ((a4 & 1) != 0)
  {
    v9 = [HDRaceRouteSnapshotEntity alloc];
    v10 = -[HDSQLiteEntity initWithPersistentID:](v9, "initWithPersistentID:", v14[3]);
  }
  else
  {
    v10 = 0;
  }
  _Block_object_dispose(&v13, 8);

  return v10;
}

uint64_t __62__HDWorkoutClusterEntity_snapshotEntityWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = HDSQLiteColumnWithNameAsInt64();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)modelPropertiesWithTransaction:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _BOOL4 v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "databaseForEntity:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v22[0] = CFSTR("uuid");
  v22[1] = CFSTR("last_workout_id");
  v22[2] = CFSTR("best_workout_id");
  v22[3] = CFSTR("relevance");
  v22[4] = CFSTR("route_label");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__HDWorkoutClusterEntity_modelPropertiesWithTransaction_error_handler___block_invoke;
  v15[3] = &unk_1E6D11200;
  v12 = v9;
  v16 = v12;
  v17 = &v18;
  v13 = -[HDSQLiteEntity getValuesForProperties:database:error:handler:](self, "getValuesForProperties:database:error:handler:", v11, v10, a4, v15);

  if (v13)
    LOBYTE(v13) = *((_BYTE *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v13;
}

void __71__HDWorkoutClusterEntity_modelPropertiesWithTransaction_error_handler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  void *v6;
  HDWorkoutEntity *v7;
  HDWorkoutEntity *v8;
  uint64_t v9;
  void *v10;
  id v11;

  HDSQLiteColumnWithNameAsUUID();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v2 = HDSQLiteColumnWithNameAsInt64();
  v3 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDouble();
  v5 = v4;
  HDSQLiteColumnWithNameAsString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HDSQLiteEntity initWithPersistentID:]([HDWorkoutEntity alloc], "initWithPersistentID:", v2);
  v8 = -[HDSQLiteEntity initWithPersistentID:]([HDWorkoutEntity alloc], "initWithPersistentID:", v3);
  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, HDWorkoutEntity *, HDWorkoutEntity *, void *, void *))(v9 + 16))(v9, v11, v7, v8, v10, v6);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

- (id)numberOfWorkoutsWithTransaction:(id)a3 error:(id *)a4
{
  return +[HDWorkoutClusterComponentEntity numberOfWorkoutsInCluster:transaction:error:](HDWorkoutClusterComponentEntity, "numberOfWorkoutsInCluster:transaction:error:", self, a3, a4);
}

- (id)workoutRouteSnapshotWithTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[HDWorkoutClusterEntity snapshotEntityWithTransaction:error:](self, "snapshotEntityWithTransaction:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "snapshotDataWithTransaction:error:", v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __83__HDWorkoutClusterEntity__deleteClusterBackingDataWithPredicate_transaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  HDRaceRouteSnapshotEntity *v6;
  uint64_t v7;

  v6 = -[HDSQLiteEntity initWithPersistentID:]([HDRaceRouteSnapshotEntity alloc], "initWithPersistentID:", HDSQLiteColumnAsInt64());
  v7 = -[HDRaceRouteSnapshotEntity deleteDataWithTransaction:error:](v6, "deleteDataWithTransaction:error:", *(_QWORD *)(a1 + 32), a4);

  return v7;
}

+ (id)databaseTable
{
  return CFSTR("RacePreviousRoute_workout_cluster");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 8;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_108;
}

+ (id)uniquedColumns
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29858]), "initWithEntityClass:property:deletionAction:isDeferred:", objc_opt_class(), CFSTR("ROWID"), 0, 1);
  v7[0] = CFSTR("last_workout_id");
  +[HDDataEntity defaultForeignKey](HDWorkoutEntity, "defaultForeignKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v7[1] = CFSTR("best_workout_id");
  +[HDDataEntity defaultForeignKey](HDWorkoutEntity, "defaultForeignKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = CFSTR("snapshot_id");
  v8[1] = v4;
  v8[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)privateSubEntities
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)protectionClass
{
  return 2;
}

@end
