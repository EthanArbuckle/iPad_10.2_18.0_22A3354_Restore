@implementation HDRaceRouteClusterEntity

uint64_t __102__HDRaceRouteClusterEntity__insertRacingCluster_routeSnapshot_syncIdentity_transaction_profile_error___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

+ (id)_baseEntityProperties
{
  _QWORD v1[24];

  v1[23] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v1[0] = CFSTR("uuid");
  v1[1] = CFSTR("workout_cluster_uuid");
  v1[2] = CFSTR("relevance");
  v1[3] = CFSTR("workout_activity_type");
  v1[4] = CFSTR("workout_cluster_size");
  v1[5] = CFSTR("last_workout_uuid");
  v1[6] = CFSTR("last_workout_date");
  v1[7] = CFSTR("last_workout_distance");
  v1[8] = CFSTR("last_workout_duration");
  v1[9] = CFSTR("last_workout_rowid");
  v1[10] = CFSTR("best_workout_uuid");
  v1[11] = CFSTR("best_workout_date");
  v1[12] = CFSTR("best_workout_distance");
  v1[13] = CFSTR("best_workout_duration");
  v1[14] = CFSTR("best_workout_rowid");
  v1[15] = CFSTR("snapshot_id");
  v1[16] = CFSTR("route_label");
  v1[17] = CFSTR("modified_date");
  v1[18] = CFSTR("sync_provenance");
  v1[19] = CFSTR("frozen");
  v1[20] = CFSTR("sync_anchor");
  v1[21] = CFSTR("relevance_anchor");
  v1[22] = CFSTR("sync_identity");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 23);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __102__HDRaceRouteClusterEntity__insertRacingCluster_routeSnapshot_syncIdentity_transaction_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(*(id *)(a1 + 32), "clusterUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB168](a2, CFSTR("uuid"), v4);

  objc_msgSend(*(id *)(a1 + 32), "workoutClusterUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB168](a2, CFSTR("workout_cluster_uuid"), v5);

  objc_msgSend(*(id *)(a1 + 32), "relevanceValue");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("relevance"));
  MEMORY[0x1BCCAB114](a2, CFSTR("workout_activity_type"), objc_msgSend(*(id *)(a1 + 32), "workoutActivityType"));
  MEMORY[0x1BCCAB114](a2, CFSTR("workout_cluster_size"), objc_msgSend(*(id *)(a1 + 32), "clusterSize"));
  objc_msgSend(*(id *)(a1 + 32), "lastWorkoutUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB168](a2, CFSTR("last_workout_uuid"), v6);

  objc_msgSend(*(id *)(a1 + 32), "lastWorkoutDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("last_workout_date"), v7);

  objc_msgSend(*(id *)(a1 + 32), "lastWorkoutDistance");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("last_workout_distance"));
  objc_msgSend(*(id *)(a1 + 32), "lastWorkoutDuration");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("last_workout_duration"));
  MEMORY[0x1BCCAB114](a2, CFSTR("last_workout_rowid"), objc_msgSend(*(id *)(a1 + 40), "persistentID"));
  objc_msgSend(*(id *)(a1 + 32), "bestWorkoutUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB168](a2, CFSTR("best_workout_uuid"), v8);

  objc_msgSend(*(id *)(a1 + 32), "bestWorkoutDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("best_workout_date"), v9);

  objc_msgSend(*(id *)(a1 + 32), "bestWorkoutDistance");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("best_workout_distance"));
  objc_msgSend(*(id *)(a1 + 32), "bestWorkoutDuration");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("best_workout_duration"));
  MEMORY[0x1BCCAB114](a2, CFSTR("best_workout_rowid"), objc_msgSend(*(id *)(a1 + 48), "persistentID"));
  MEMORY[0x1BCCAB114](a2, CFSTR("snapshot_id"), objc_msgSend(*(id *)(a1 + 56), "persistentID"));
  objc_msgSend(*(id *)(a1 + 32), "workoutRouteLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("route_label"), v10);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("modified_date"), v11);

  MEMORY[0x1BCCAB114](a2, CFSTR("sync_provenance"), 0);
  MEMORY[0x1BCCAB0CC](a2, CFSTR("frozen"), 1);
  MEMORY[0x1BCCAB114](a2, CFSTR("sync_anchor"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  MEMORY[0x1BCCAB114](a2, CFSTR("relevance_anchor"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  JUMPOUT(0x1BCCAB114);
}

+ (id)insertOrUpdateRacingCluster:(id)a3 routeSnapshot:(id)a4 syncIdentity:(int64_t)a5 transaction:(id)a6 profile:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  HDRaceRouteClusterEntity *v25;
  HDRaceRouteClusterEntity *v26;
  id v27;
  HDRaceRouteClusterEntity *v28;
  HDRaceRouteClusterEntity *v29;
  id v31;
  void *v32;
  id v33;
  id v34;
  id *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id *v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  uint64_t v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  HDRaceRouteClusterEntity *v60;
  id v61;
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  HDRaceRouteClusterEntity *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  id v76;
  uint64_t *v77;
  int64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t);
  void *v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v63 = a7;
  objc_msgSend(v15, "databaseForEntityClass:", a1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastWorkoutUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bestWorkoutUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0;
  v19 = v17;
  v20 = v18;
  v21 = v16;
  objc_opt_self();
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v87 = -1;
  v22 = MEMORY[0x1E0C809B0];
  v69 = MEMORY[0x1E0C809B0];
  v70 = 3221225472;
  v71 = __85__HDRaceRouteClusterEntity__entityForLastWorkoutUUID_bestWorkoutUUID_database_error___block_invoke;
  v72 = &unk_1E6CE7750;
  v23 = v19;
  v73 = v23;
  v24 = v20;
  v74 = v24;
  v79 = v22;
  v80 = 3221225472;
  v81 = __85__HDRaceRouteClusterEntity__entityForLastWorkoutUUID_bestWorkoutUUID_database_error___block_invoke_2;
  v82 = &unk_1E6CE8540;
  v83 = &v84;
  if (!objc_msgSend(v21, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT ROWID FROM RacePreviousRoute_concrete_cluster WHERE last_workout_uuid = ? AND best_workout_uuid = ?"), &v68, &v69, &v79)|| v85[3] == -1)
  {
    v26 = 0;
  }
  else
  {
    v25 = [HDRaceRouteClusterEntity alloc];
    v26 = -[HDSQLiteEntity initWithPersistentID:](v25, "initWithPersistentID:", v85[3]);
  }

  _Block_object_dispose(&v84, 8);
  v27 = v68;

  if (!v26)
  {
    if (v27)
    {
      if (a8)
      {
        v29 = 0;
        *a8 = objc_retainAutorelease(v27);
      }
      else
      {
        _HKLogDroppedError();
        v29 = 0;
      }
      goto LABEL_9;
    }
    v31 = v13;
    v32 = v14;
    v33 = v31;
    v56 = v32;
    v57 = v32;
    v55 = v15;
    v34 = v15;
    v35 = a8;
    v36 = v34;
    v61 = v63;
    v52 = objc_opt_self();
    objc_msgSend(v33, "lastWorkoutUUID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDWorkoutClusterEntity workoutEntityForUUID:transaction:error:](HDWorkoutClusterEntity, "workoutEntityForUUID:transaction:error:", v37, v36, v35);
    v29 = (HDRaceRouteClusterEntity *)objc_claimAutoreleasedReturnValue();

    v59 = v36;
    v60 = v29;
    if (!v29)
    {
      v43 = v33;
      v45 = v57;
LABEL_30:

      v15 = v55;
      v14 = v56;
      goto LABEL_9;
    }
    v53 = v33;
    objc_msgSend(v33, "bestWorkoutUUID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDWorkoutClusterEntity workoutEntityForUUID:transaction:error:](HDWorkoutClusterEntity, "workoutEntityForUUID:transaction:error:", v38, v36, v35);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v39)
    {
      v29 = 0;
      v43 = v53;
      v45 = v57;
LABEL_29:

      goto LABEL_30;
    }
    v51 = v39;
    v40 = v35;
    +[HDRaceRouteWorkoutEntity createRaceRouteWorkoutFromWorkout:transaction:profile:error:](HDRaceRouteWorkoutEntity, "createRaceRouteWorkoutFromWorkout:transaction:profile:error:", v29, v36, v61, v35);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v41)
    {
      v29 = 0;
      v43 = v53;
      v45 = v57;
      v39 = v51;
LABEL_28:

      goto LABEL_29;
    }
    v50 = v41;
    v42 = -[HDSQLiteEntity persistentID](v29, "persistentID");
    if (v42 == objc_msgSend(v51, "persistentID"))
    {
      v49 = v50;
      v44 = (void *)v52;
      v43 = v53;
      v45 = v57;
      v46 = v40;
    }
    else
    {
      v47 = v36;
      v46 = v35;
      +[HDRaceRouteWorkoutEntity createRaceRouteWorkoutFromWorkout:transaction:profile:error:](HDRaceRouteWorkoutEntity, "createRaceRouteWorkoutFromWorkout:transaction:profile:error:", v51, v47, v61, v35);
      v44 = (void *)v52;
      v43 = v53;
      v45 = v57;
      v49 = (id)objc_claimAutoreleasedReturnValue();
      if (!v49)
      {
        v29 = 0;
        v39 = v51;
LABEL_27:
        v41 = v50;
        goto LABEL_28;
      }
    }
    objc_msgSend(v59, "databaseForEntityClass:", v44);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = 0;
    v85 = &v84;
    v86 = 0x2020000000;
    v87 = -1;
    v79 = v22;
    v80 = 3221225472;
    v81 = __102__HDRaceRouteClusterEntity__insertRacingCluster_routeSnapshot_syncIdentity_transaction_profile_error___block_invoke;
    v82 = &unk_1E6CE8540;
    v83 = &v84;
    v58 = v48;
    v39 = v51;
    if ((objc_msgSend(v48, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT COALESCE(MAX(relevance_anchor) + 1,1) FROM RacePreviousRoute_concrete_cluster"), v46, 0, &v79) & 1) != 0)
    {
      +[HDRaceRouteClusterEntity _baseEntityProperties]();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v22;
      v70 = 3221225472;
      v71 = __102__HDRaceRouteClusterEntity__insertRacingCluster_routeSnapshot_syncIdentity_transaction_profile_error___block_invoke_2;
      v72 = &unk_1E6CF5F28;
      v73 = v43;
      v74 = v50;
      v75 = v49;
      v76 = v45;
      v77 = &v84;
      v78 = a5;
      objc_msgSend(v44, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 0, v58, v54, v46, &v69);
      v29 = (HDRaceRouteClusterEntity *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v29 = 0;
    }
    _Block_object_dispose(&v84, 8);

    goto LABEL_27;
  }
  v64[0] = v22;
  v64[1] = 3221225472;
  v64[2] = __109__HDRaceRouteClusterEntity_insertOrUpdateRacingCluster_routeSnapshot_syncIdentity_transaction_profile_error___block_invoke;
  v64[3] = &unk_1E6CE7C30;
  v65 = v14;
  v66 = v13;
  v28 = v26;
  v67 = v28;
  v29 = 0;
  if (objc_msgSend(v21, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("UPDATE RacePreviousRoute_concrete_cluster SET relevance_anchor = (SELECT COALESCE(MAX(relevance_anchor) + 1,1) FROM RacePreviousRoute_concrete_cluster),sync_anchor = (CASE WHEN snapshot_id = ? AND route_label = ? THEN sync_anchor ELSE (SELECT COALESCE(MAX(relevance_anchor) + 1,1) FROM RacePreviousRoute_concrete_cluster) END),relevance = ?,workout_cluster_uuid = ?,snapshot_id = ?,route_label = ?,modified_date = ? WHERE ROWID = ? AND (relevance != ? OR workout_cluster_uuid != ? OR snapshot_id != ? OR route_label != ?)"), a8, v64, 0))v29 = v28;

LABEL_9:
  return v29;
}

void __109__HDRaceRouteClusterEntity_insertOrUpdateRacingCluster_routeSnapshot_syncIdentity_transaction_profile_error___block_invoke(id *a1, sqlite3_stmt *a2)
{
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  id v11;

  sqlite3_bind_int64(a2, 1, objc_msgSend(a1[4], "persistentID"));
  objc_msgSend(a1[5], "workoutRouteLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(a1[5], "relevanceValue");
  sqlite3_bind_double(a2, 3, v5);
  objc_msgSend(a1[5], "workoutClusterUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 5, objc_msgSend(a1[4], "persistentID"));
  objc_msgSend(a1[5], "workoutRouteLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 8, objc_msgSend(a1[6], "persistentID"));
  objc_msgSend(a1[5], "relevanceValue");
  sqlite3_bind_double(a2, 9, v9);
  objc_msgSend(a1[5], "workoutClusterUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 11, objc_msgSend(a1[4], "persistentID"));
  objc_msgSend(a1[5], "workoutRouteLabel");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

}

+ (id)raceRouteClustersForActivityType:(unint64_t)a3 profile:(id)a4 error:(id *)a5
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
  v9 = a4;
  v10 = objc_alloc_init(v8);
  objc_msgSend(v9, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__HDRaceRouteClusterEntity_raceRouteClustersForActivityType_profile_error___block_invoke;
  v15[3] = &unk_1E6CF5F78;
  v17 = a1;
  v18 = a3;
  v12 = v10;
  v16 = v12;
  LODWORD(a5) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v11, a5, v15);

  if ((_DWORD)a5)
    v13 = (void *)objc_msgSend(v12, "copy");
  else
    v13 = 0;

  return v13;
}

uint64_t __75__HDRaceRouteClusterEntity_raceRouteClustersForActivityType_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
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
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  _QWORD v23[4];
  id v24;
  id v25;
  void *v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(v4, "databaseForEntityClass:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithProperty:equalToValue:", CFSTR("workout_activity_type"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("frozen"), MEMORY[0x1E0C9AAB0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D29840];
  v27[0] = v8;
  v27[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateMatchingAllPredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("relevance"), *(_QWORD *)(a1 + 40), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(void **)(a1 + 40);
  v15 = *MEMORY[0x1E0D29968];
  v26 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v5, v12, v15, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDRaceRouteClusterEntity _baseEntityProperties]();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __75__HDRaceRouteClusterEntity_raceRouteClustersForActivityType_profile_error___block_invoke_2;
  v23[3] = &unk_1E6CF5F50;
  v24 = v4;
  v25 = *(id *)(a1 + 32);
  v19 = v4;
  v20 = objc_msgSend(v17, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v18, a3, v23);

  return v20;
}

uint64_t __75__HDRaceRouteClusterEntity_raceRouteClustersForActivityType_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  HDRaceRouteSnapshotEntity *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  BOOL v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;

  HDSQLiteColumnWithNameAsUUID();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsUUID();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDouble();
  v10 = v9;
  v37 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsUUID();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDouble();
  v14 = v13;
  HDSQLiteColumnWithNameAsDouble();
  v16 = v15;
  HDSQLiteColumnWithNameAsUUID();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDouble();
  v18 = v17;
  HDSQLiteColumnWithNameAsDouble();
  v20 = v19;
  v21 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsString();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[HDSQLiteEntity initWithPersistentID:]([HDRaceRouteSnapshotEntity alloc], "initWithPersistentID:", v21);
  -[HDRaceRouteSnapshotEntity snapshotDataWithTransaction:error:](v23, "snapshotDataWithTransaction:error:", *(_QWORD *)(a1 + 32), a5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v39 = v12;
    v40 = v11;
    v25 = v8;
    v26 = v7;
    v27 = HDSQLiteColumnWithNameAsInt64();
    v28 = *(_QWORD *)(a1 + 32);
    v43 = 0;
    +[HDRaceRouteWorkoutEntity startingPointForWorkoutWithPersistentID:transaction:error:](HDRaceRouteWorkoutEntity, "startingPointForWorkoutWithPersistentID:transaction:error:", v27, v28, &v43);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v43;
    v31 = v30;
    if (v29)
      v32 = 1;
    else
      v32 = v30 == 0;
    v33 = v32;
    if (v32)
    {
      v34 = *(void **)(a1 + 40);
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6A98]), "_initWithUUID:workoutClusterUUID:clusterSize:relevanceValue:workoutActivityType:lastWorkoutUUID:lastWorkoutDate:lastWorkoutDistance:lastWorkoutDuration:lastWorkoutStartingPoint:bestWorkoutUUID:bestWorkoutDate:bestWorkoutDistance:bestWorkoutDuration:workoutRouteSnapshot:workoutRouteLabel:", v26, v25, v38, v37, v40, v39, v10, v14, v16, v18, v20, v29, v42, v41, v24,
                      v22);
      objc_msgSend(v34, "addObject:", v35);

    }
    else if (a5)
    {
      *a5 = objc_retainAutorelease(v30);
    }
    else
    {
      _HKLogDroppedError();
    }

    v7 = v26;
    v8 = v25;
    v12 = v39;
    v11 = v40;
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

+ (BOOL)pruneRaceRouteClustersWithEligibleEntities:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  id v14;
  void *v15;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(a3, "hk_map:", &__block_literal_global_84);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29848], "doesNotContainPredicateWithProperty:values:", CFSTR("ROWID"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[HDRaceRouteClusterEntity _deleteClusterBackingDataWithPredicate:transaction:error:]((uint64_t)a1, v10, v8, (uint64_t)a5))
  {
    objc_msgSend(v8, "databaseForEntityClass:", a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(a1, "deleteEntitiesInDatabase:predicate:error:", v11, v10, a5);
    v20 = 0;
    v13 = +[HDRaceRouteWorkoutEntity pruneWorkoutsMarkedForDeletionInTransaction:error:](HDRaceRouteWorkoutEntity, "pruneWorkoutsMarkedForDeletionInTransaction:error:", v8, &v20);
    v14 = v20;
    if (!v13)
    {
      _HKInitializeLogging();
      v15 = (void *)*MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        v17 = v15;
        v18 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v22 = v18;
        v23 = 2114;
        v24 = v14;
        v19 = v18;
        _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to prune workouts marked for deletion: %{public}@", buf, 0x16u);

      }
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __89__HDRaceRouteClusterEntity_pruneRaceRouteClustersWithEligibleEntities_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a2, "persistentID"));
}

+ (uint64_t)_deleteClusterBackingDataWithPredicate:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_opt_self();
  objc_msgSend(v6, "databaseForEntityClass:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queryWithDatabase:predicate:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = CFSTR("last_workout_rowid");
  v17[1] = CFSTR("best_workout_rowid");
  v17[2] = CFSTR("snapshot_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__HDRaceRouteClusterEntity__deleteClusterBackingDataWithPredicate_transaction_error___block_invoke;
  v15[3] = &unk_1E6CF6008;
  v16 = v6;
  v12 = v6;
  v13 = objc_msgSend(v10, "enumerateProperties:error:enumerationHandler:", v11, a4, v15);

  return v13;
}

+ (BOOL)enumerateRoutePointsForClusterUUID:(id)a3 workoutSelection:(unint64_t)a4 timestampAnchor:(double)a5 limit:(unint64_t)a6 profile:(id)a7 error:(id *)a8 dataHandler:(id)a9
{
  return +[HDRaceRouteClusterEntity _enumerateRoutePointsForClusterUUID:workoutSelection:timestampAnchor:limit:startDuration:finishDuration:profile:error:dataHandler:](a5, 0.0, 0.0, (uint64_t)a1, a3, a4, a6, a7, (uint64_t)a8, a9);
}

+ (uint64_t)_enumerateRoutePointsForClusterUUID:(double)a3 workoutSelection:(uint64_t)a4 timestampAnchor:(void *)a5 limit:(uint64_t)a6 startDuration:(uint64_t)a7 finishDuration:(void *)a8 profile:(uint64_t)a9 error:(void *)a10 dataHandler:
{
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  _QWORD v27[4];
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  double v34;
  double v35;

  v18 = a5;
  v19 = a10;
  v20 = a8;
  v21 = (void *)objc_opt_self();
  objc_msgSend(v20, "database");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __158__HDRaceRouteClusterEntity__enumerateRoutePointsForClusterUUID_workoutSelection_timestampAnchor_limit_startDuration_finishDuration_profile_error_dataHandler___block_invoke;
  v27[3] = &unk_1E6CF60A0;
  v30 = v21;
  v31 = a6;
  v32 = a1;
  v33 = a7;
  v34 = a2;
  v35 = a3;
  v28 = v18;
  v29 = v19;
  v23 = v19;
  v24 = v18;
  v25 = objc_msgSend(v21, "performReadTransactionWithHealthDatabase:error:block:", v22, a9, v27);

  return v25;
}

+ (BOOL)unitTest_deleteAllClusterAndBackingDataInTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;

  v6 = a3;
  if (+[HDRaceRouteClusterEntity _deleteClusterBackingDataWithPredicate:transaction:error:]((uint64_t)a1, 0, v6, (uint64_t)a4))
  {
    objc_msgSend(v6, "databaseForEntityClass:", a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[HDSQLiteEntity deleteEntitiesInDatabase:predicate:error:](HDRaceRouteWorkoutEntity, "deleteEntitiesInDatabase:predicate:error:", v7, 0, a4))
    {
      v8 = objc_msgSend(a1, "deleteEntitiesInDatabase:predicate:error:", v7, 0, a4);
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (HDRaceRouteClusterEntity)_entityForClusterUUID:(void *)a3 database:(_QWORD *)a4 error:
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  int v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  HDRaceRouteClusterEntity *v15;
  HDRaceRouteClusterEntity *v16;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a2;
  v7 = a3;
  objc_opt_self();
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = -1;
  v21 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __65__HDRaceRouteClusterEntity__entityForClusterUUID_database_error___block_invoke;
  v19[3] = &unk_1E6CE9508;
  v9 = v6;
  v20 = v9;
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __65__HDRaceRouteClusterEntity__entityForClusterUUID_database_error___block_invoke_2;
  v18[3] = &unk_1E6CE8540;
  v18[4] = &v22;
  v10 = objc_msgSend(v7, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT ROWID FROM RacePreviousRoute_concrete_cluster WHERE uuid = ?"), &v21, v19, v18);
  v11 = v21;
  v12 = v11;
  if (v10 && v23[3] == -1 && !v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 118, CFSTR("Racing cluster (%@) not found"), v9);
  }
  else
  {
    v13 = v11;
    v14 = v13;
    if (v13)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v13);
      else
        _HKLogDroppedError();
    }

    if (!v10)
      goto LABEL_12;
  }
  if (v23[3] < 0)
  {
LABEL_12:
    v16 = 0;
    goto LABEL_13;
  }
  v15 = [HDRaceRouteClusterEntity alloc];
  v16 = -[HDSQLiteEntity initWithPersistentID:](v15, "initWithPersistentID:", v23[3]);
LABEL_13:

  _Block_object_dispose(&v22, 8);
  return v16;
}

uint64_t __65__HDRaceRouteClusterEntity__entityForClusterUUID_database_error___block_invoke()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __65__HDRaceRouteClusterEntity__entityForClusterUUID_database_error___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

uint64_t __85__HDRaceRouteClusterEntity__entityForLastWorkoutUUID_bestWorkoutUUID_database_error___block_invoke()
{
  HDSQLiteBindFoundationValueToStatement();
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __85__HDRaceRouteClusterEntity__entityForLastWorkoutUUID_bestWorkoutUUID_database_error___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

void __69__HDRaceRouteClusterEntity__workoutIDForSelection_transaction_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 40);
  v8 = v12;
  if (v7 == 1)
    goto LABEL_4;
  if (v7 == 2)
  {
    v8 = v5;
LABEL_4:
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = v8;
    v11 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;

  }
}

- (uint64_t)_fetchWorkoutIDsWithTransaction:(uint64_t)a3 error:(void *)a4 handler:
{
  id v7;
  void (**v8)(id, uint64_t, uint64_t);
  void *v9;
  uint64_t v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v7 = a2;
  v8 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__77;
  v24 = __Block_byref_object_dispose__77;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__77;
  v18 = __Block_byref_object_dispose__77;
  v19 = 0;
  objc_msgSend(v7, "databaseForEntity:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = &v14;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__HDRaceRouteClusterEntity__fetchWorkoutIDsWithTransaction_error_handler___block_invoke;
  v13[3] = &unk_1E6CE9508;
  v13[4] = a1;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__HDRaceRouteClusterEntity__fetchWorkoutIDsWithTransaction_error_handler___block_invoke_2;
  v12[3] = &unk_1E6CEB2A8;
  v12[4] = &v20;
  v10 = objc_msgSend(v9, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT last_workout_rowid, best_workout_rowid FROM RacePreviousRoute_concrete_cluster WHERE ROWID = ?"), a3, v13, v12);

  v8[2](v8, v21[5], v15[5]);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

uint64_t __85__HDRaceRouteClusterEntity__deleteClusterBackingDataWithPredicate_transaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  HDRaceRouteSnapshotEntity *v6;
  uint64_t v7;

  if (!+[HDRaceRouteWorkoutEntity markForDeletionWorkoutDataWithPersistentID:transaction:error:](HDRaceRouteWorkoutEntity, "markForDeletionWorkoutDataWithPersistentID:transaction:error:", HDSQLiteColumnAsInt64(), *(_QWORD *)(a1 + 32), a4)|| !+[HDRaceRouteWorkoutEntity markForDeletionWorkoutDataWithPersistentID:transaction:error:](HDRaceRouteWorkoutEntity, "markForDeletionWorkoutDataWithPersistentID:transaction:error:", HDSQLiteColumnAsInt64(), *(_QWORD *)(a1 + 32), a4))
  {
    return 0;
  }
  v6 = -[HDSQLiteEntity initWithPersistentID:]([HDRaceRouteSnapshotEntity alloc], "initWithPersistentID:", HDSQLiteColumnAsInt64());
  v7 = -[HDRaceRouteSnapshotEntity deleteDataWithTransaction:error:](v6, "deleteDataWithTransaction:error:", *(_QWORD *)(a1 + 32), a4);

  return v7;
}

uint64_t __59__HDRaceRouteClusterEntity__isFrozenWithTransaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
}

uint64_t __59__HDRaceRouteClusterEntity__isFrozenWithTransaction_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = MEMORY[0x1BCCAB174](a2, 0);
  return 0;
}

uint64_t __102__HDRaceRouteClusterEntity__applyIncrementalChangeWithRelevance_workoutClusterUUID_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;

  sqlite3_bind_double(a2, 1, *(double *)(a1 + 48));
  HDSQLiteBindFoundationValueToStatement();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  return sqlite3_bind_int64(a2, 4, objc_msgSend(*(id *)(a1 + 40), "persistentID"));
}

uint64_t __97__HDRaceRouteClusterEntity__applyIncrementalChangeWithRouteLabel_snapshotData_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;

  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 40), "persistentID"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  return sqlite3_bind_int64(a2, 4, objc_msgSend(*(id *)(a1 + 48), "persistentID"));
}

void __57__HDRaceRouteClusterEntity__freezeWithTransaction_error___block_invoke()
{
  JUMPOUT(0x1BCCAB0CCLL);
}

void __99__HDRaceRouteClusterEntity__insertCodableLastRoutePoints_codableBestRoutePoints_transaction_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

uint64_t __107__HDRaceRouteClusterEntity__pruneRaceRouteClustersFromWorkoutClusterUUID_eligibleEntity_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  return sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 40), "persistentID"));
}

BOOL __107__HDRaceRouteClusterEntity__pruneRaceRouteClustersFromWorkoutClusterUUID_eligibleEntity_transaction_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _BOOL8 result;

  v5 = HDSQLiteColumnAsInt64();
  v6 = HDSQLiteColumnAsInt64();
  result = +[HDRaceRouteWorkoutEntity markForDeletionWorkoutDataWithPersistentID:transaction:error:](HDRaceRouteWorkoutEntity, "markForDeletionWorkoutDataWithPersistentID:transaction:error:", v5, *(_QWORD *)(a1 + 32), a3);
  if (result)
    return +[HDRaceRouteWorkoutEntity markForDeletionWorkoutDataWithPersistentID:transaction:error:](HDRaceRouteWorkoutEntity, "markForDeletionWorkoutDataWithPersistentID:transaction:error:", v6, *(_QWORD *)(a1 + 32), a3);
  return result;
}

uint64_t __107__HDRaceRouteClusterEntity__pruneRaceRouteClustersFromWorkoutClusterUUID_eligibleEntity_transaction_error___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  return sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 40), "persistentID"));
}

uint64_t __74__HDRaceRouteClusterEntity__fetchWorkoutIDsWithTransaction_error_handler___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
}

uint64_t __74__HDRaceRouteClusterEntity__fetchWorkoutIDsWithTransaction_error_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", HDSQLiteColumnAsInt64());
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", HDSQLiteColumnAsInt64());
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return 0;
}

BOOL __158__HDRaceRouteClusterEntity__enumerateRoutePointsForClusterUUID_workoutSelection_timestampAnchor_limit_startDuration_finishDuration_profile_error_dataHandler___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _BOOL8 v11;
  id v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  _QWORD v19[4];
  id v20;
  double v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDRaceRouteClusterEntity _entityForClusterUUID:database:error:](*(_QWORD *)(a1 + 48), *(void **)(a1 + 32), v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 56);
    v9 = v5;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__77;
    v27 = __Block_byref_object_dispose__77;
    v28 = 0;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __69__HDRaceRouteClusterEntity__workoutIDForSelection_transaction_error___block_invoke;
    v22[3] = &unk_1E6CF5FE0;
    v22[4] = &v23;
    v22[5] = v8;
    if (-[HDRaceRouteClusterEntity _fetchWorkoutIDsWithTransaction:error:handler:]((uint64_t)v7, v9, (uint64_t)a3, v22))v10 = (void *)v24[5];
    else
      v10 = 0;
    v12 = v10;
    _Block_object_dispose(&v23, 8);

    if (v12)
    {
      v13 = objc_msgSend(v12, "longLongValue");
      v14 = *(double *)(a1 + 64);
      v15 = *(_QWORD *)(a1 + 72);
      v16 = *(double *)(a1 + 80);
      v17 = *(double *)(a1 + 88);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __158__HDRaceRouteClusterEntity__enumerateRoutePointsForClusterUUID_workoutSelection_timestampAnchor_limit_startDuration_finishDuration_profile_error_dataHandler___block_invoke_2;
      v19[3] = &unk_1E6CF6078;
      v21 = v16;
      v20 = *(id *)(a1 + 40);
      v11 = +[HDRaceRouteWorkoutEntity enumerateRoutePointsForWorkoutPersistentID:timestampAnchor:limit:startDuration:finishDuration:transaction:error:handler:](HDRaceRouteWorkoutEntity, "enumerateRoutePointsForWorkoutPersistentID:timestampAnchor:limit:startDuration:finishDuration:transaction:error:handler:", v13, v15, v9, a3, v19, v14, v16, v17);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __158__HDRaceRouteClusterEntity__enumerateRoutePointsForClusterUUID_workoutSelection_timestampAnchor_limit_startDuration_finishDuration_profile_error_dataHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;

  v3 = (objc_class *)MEMORY[0x1E0C9E410];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "latitude_deg");
  v7 = v6;
  objc_msgSend(v4, "longitude_deg");
  v9 = v8;
  objc_msgSend(v4, "altitude_m");
  v11 = v10;
  objc_msgSend(v4, "odometer_m");
  v13 = v12;
  objc_msgSend(v4, "timestamp_s");
  v15 = v14 - *(double *)(a1 + 40);
  v16 = objc_msgSend(v4, "signalEnvironmentType");

  v17 = (void *)objc_msgSend(v5, "initWithLatitude:longitude:altitude:odometer:timestamp:signalEnvironmentType:", v16, v7, v9, v11, v13, v15);
  v18 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v18;
}

+ (id)databaseTable
{
  return CFSTR("RacePreviousRoute_concrete_cluster");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 24;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_43;
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
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29858]), "initWithEntityClass:property:deletionAction:isDeferred:", objc_opt_class(), CFSTR("ROWID"), 0, 1);
  v5 = CFSTR("snapshot_id");
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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

+ (id)propertyForSyncProvenance
{
  return CFSTR("sync_provenance");
}

+ (id)propertyForSyncIdentity
{
  return CFSTR("sync_identity");
}

+ (id)propertyForSyncAnchor
{
  return CFSTR("relevance_anchor");
}

+ (id)insertCodableCluster:(id)a3 syncProvenance:(int64_t)a4 syncIdentity:(int64_t)a5 transaction:(id)a6 error:(id *)a7
{
  id v11;
  void *v12;
  void *v13;
  void (*v14)(uint64_t);
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  os_log_t *v28;
  NSObject *v29;
  void (*v30)(uint64_t);
  void (*v31)(uint64_t);
  id v32;
  void *v33;
  void (*v34)(uint64_t);
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void (*v42)(uint64_t);
  void (*v43)(uint64_t);
  void (*v44)(uint64_t);
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  int v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  NSObject *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _BOOL4 v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void (*v69)(uint64_t);
  id v70;
  void *v71;
  uint64_t v72;
  void (*v73)(uint64_t);
  void (*v74)(uint64_t);
  _BYTE *v75;
  int v76;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  int v84;
  void *v85;
  void *v86;
  id v87;
  _QWORD v88[4];
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  int64_t v95;
  int64_t v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  _BYTE *v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  void (*v109)(uint64_t);
  _BYTE buf[24];
  uint64_t (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  void (*v113)(uint64_t);
  void (*v114)(uint64_t);
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v87 = a6;
  v12 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(v11, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hk_UUIDWithData:", v13);
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v87, "databaseForEntityClass:", a1);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = 0;
  +[HDRaceRouteClusterEntity _entityForClusterUUID:database:error:]((uint64_t)a1, v86, v85, &v97);
  v14 = (void (*)(uint64_t))objc_claimAutoreleasedReturnValue();
  v15 = v97;
  v82 = v15;
  if (v14)
  {
    v16 = v87;
    v98 = 0;
    v99 = (uint64_t)&v98;
    v100 = 0x2020000000;
    LOBYTE(v101) = 0;
    objc_msgSend(v16, "databaseForEntity:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __59__HDRaceRouteClusterEntity__isFrozenWithTransaction_error___block_invoke;
    v111 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6CE9508;
    v112 = v14;
    v104 = MEMORY[0x1E0C809B0];
    v105 = 3221225472;
    v106 = (uint64_t)__59__HDRaceRouteClusterEntity__isFrozenWithTransaction_error___block_invoke_2;
    v107 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6CE8540;
    v108 = (void (*)(uint64_t))&v98;
    v19 = objc_msgSend(v17, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT frozen FROM RacePreviousRoute_concrete_cluster WHERE ROWID = ?"), a7, buf, &v104);

    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v99 + 24));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
    _Block_object_dispose(&v98, 8);

    if (!v20)
      goto LABEL_37;
    if (objc_msgSend(v20, "BOOLValue"))
    {
      v25 = (void *)MEMORY[0x1E0CB3A28];
      objc_msgSend(v11, "workoutClusterUUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "hk_UUIDWithData:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      _HKInitializeLogging();
      v28 = (os_log_t *)MEMORY[0x1E0CB5380];
      v29 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v86;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v27;
        _os_log_impl(&dword_1B7802000, v29, OS_LOG_TYPE_DEFAULT, "Updating relevance value for re-synced cluster UUID: %{public}@ (workout cluster %{public}@)", buf, 0x16u);
      }
      objc_msgSend(v11, "relevance");
      v31 = v30;
      v32 = v27;
      objc_msgSend(v16, "databaseForEntity:", v14);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = v18;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __102__HDRaceRouteClusterEntity__applyIncrementalChangeWithRelevance_workoutClusterUUID_transaction_error___block_invoke;
      v111 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6CF0080;
      v114 = v31;
      v34 = (void (*)(uint64_t))v32;
      v112 = v34;
      v113 = v14;
      LODWORD(v32) = objc_msgSend(v33, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("UPDATE RacePreviousRoute_concrete_cluster SET relevance = ?,workout_cluster_uuid = ?,modified_date = ? WHERE ROWID = ?"), a7, buf, 0);

      if ((_DWORD)v32)
      {
        if (!objc_msgSend(v11, "hasRouteSnapshot") || !objc_msgSend(v11, "hasRouteLabel"))
          goto LABEL_22;
        _HKInitializeLogging();
        v35 = *v28;
        if (os_log_type_enabled(*v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v86;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v34;
          _os_log_impl(&dword_1B7802000, v35, OS_LOG_TYPE_DEFAULT, "Updating route snapshot/label for re-synced cluster UUID: %{public}@ (workout cluster %{public}@)", buf, 0x16u);
        }
        objc_msgSend(v11, "routeLabel");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "routeSnapshot");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v36;
        v39 = v16;
        +[HDRaceRouteSnapshotEntity insertSnapshotData:transaction:error:](HDRaceRouteSnapshotEntity, "insertSnapshotData:transaction:error:", v37, v39, a7);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v40)
        {
          objc_msgSend(v39, "databaseForEntity:", v14);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = v18;
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __97__HDRaceRouteClusterEntity__applyIncrementalChangeWithRouteLabel_snapshotData_transaction_error___block_invoke;
          v111 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6CE7C30;
          v42 = (void (*)(uint64_t))v38;
          v112 = v42;
          v43 = v40;
          v113 = v43;
          v114 = v14;
          v84 = objc_msgSend(v41, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("UPDATE RacePreviousRoute_concrete_cluster SET route_label = ?,snapshot_id = ?,modified_date = ? WHERE ROWID = ?"), a7, buf, 0);

          if (v84)
          {
LABEL_22:
            v44 = v14;
LABEL_65:

            goto LABEL_66;
          }
        }
        else
        {

        }
      }
      v44 = 0;
      goto LABEL_65;
    }
    objc_msgSend(v11, "lastWorkoutMetrics");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "routePoints");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bestWorkoutMetrics");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "routePoints");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v45;
    v49 = v47;
    v50 = v16;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v111 = __Block_byref_object_copy__77;
    v112 = __Block_byref_object_dispose__77;
    v113 = 0;
    v104 = 0;
    v105 = (uint64_t)&v104;
    v106 = 0x3032000000;
    v107 = __Block_byref_object_copy__77;
    v108 = __Block_byref_object_dispose__77;
    v109 = 0;
    v98 = v18;
    v99 = 3221225472;
    v100 = (uint64_t)__99__HDRaceRouteClusterEntity__insertCodableLastRoutePoints_codableBestRoutePoints_transaction_error___block_invoke;
    v101 = &unk_1E6CF6050;
    v102 = buf;
    v103 = &v104;
    if ((-[HDRaceRouteClusterEntity _fetchWorkoutIDsWithTransaction:error:handler:]((uint64_t)v14, v50, (uint64_t)a7, &v98) & 1) == 0|| objc_msgSend(v48, "count")&& !+[HDRaceRouteWorkoutEntity insertCodableRoutePoints:workoutPersistentID:transaction:error:](HDRaceRouteWorkoutEntity, "insertCodableRoutePoints:workoutPersistentID:transaction:error:", v48, objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "longLongValue"), v50, a7))
    {
      goto LABEL_32;
    }
    if (!objc_msgSend(v49, "count")
      || +[HDRaceRouteWorkoutEntity insertCodableRoutePoints:workoutPersistentID:transaction:error:](HDRaceRouteWorkoutEntity, "insertCodableRoutePoints:workoutPersistentID:transaction:error:", v49, objc_msgSend(*(id *)(v105 + 40), "longLongValue"), v50, a7))
    {
      v51 = 1;
    }
    else
    {
LABEL_32:
      v51 = 0;
    }
    _Block_object_dispose(&v104, 8);

    _Block_object_dispose(buf, 8);
    if (!v51)
      goto LABEL_37;
    if (objc_msgSend(v11, "final"))
    {
      *(_QWORD *)buf = CFSTR("frozen");
      v54 = (void *)MEMORY[0x1E0C99D20];
      v55 = v50;
      objc_msgSend(v54, "arrayWithObjects:count:", buf, 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "databaseForEntity:", v14);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v55) = objc_msgSend(v14, "updateProperties:database:error:bindingHandler:", v56, v57, a7, &__block_literal_global_270_0);
      if ((v55 & 1) == 0)
      {
LABEL_37:
        v44 = 0;
LABEL_66:

        goto LABEL_67;
      }
    }

    goto LABEL_56;
  }
  if ((objc_msgSend(v15, "hk_isObjectNotFoundError") & 1) == 0)
  {
    v52 = v82;
    v53 = v52;
    if (v52)
    {
      if (a7)
        *a7 = objc_retainAutorelease(v52);
      else
        _HKLogDroppedError();
    }

    goto LABEL_51;
  }
  objc_msgSend(v11, "lastWorkoutMetrics");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bestWorkoutMetrics");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21 || !v80)
  {
    _HKInitializeLogging();
    v58 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B7802000, v58, OS_LOG_TYPE_ERROR, "Resetting received sync anchors due to last or best metric being nil.", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 1403, CFSTR("Last or best metric is nil."));
    v59 = (id)objc_claimAutoreleasedReturnValue();
    v60 = v59;
    if (v59)
    {
      if (a7)
        *a7 = objc_retainAutorelease(v59);
      else
        _HKLogDroppedError();
    }

LABEL_51:
    v14 = 0;
LABEL_52:
    v44 = 0;
    goto LABEL_67;
  }
  +[HDRaceRouteWorkoutEntity insertCodableRacingMetrics:transaction:error:](HDRaceRouteWorkoutEntity, "insertCodableRacingMetrics:transaction:error:", v21, v87, a7);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v79)
    goto LABEL_48;
  objc_msgSend(v21, "workoutUUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "workoutUUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "isEqualToData:", v23);

  if (!v24)
  {
    +[HDRaceRouteWorkoutEntity insertCodableRacingMetrics:transaction:error:](HDRaceRouteWorkoutEntity, "insertCodableRacingMetrics:transaction:error:", v80, v87, a7);
    v78 = (id)objc_claimAutoreleasedReturnValue();
    if (v78)
      goto LABEL_46;
LABEL_48:
    v14 = 0;
    v64 = 1;
    goto LABEL_55;
  }
  v78 = v79;
LABEL_46:
  objc_msgSend(v11, "routeSnapshot");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDRaceRouteSnapshotEntity insertSnapshotData:transaction:error:](HDRaceRouteSnapshotEntity, "insertSnapshotData:transaction:error:", v61, v87, a7);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    +[HDRaceRouteClusterEntity _baseEntityProperties]();
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = __95__HDRaceRouteClusterEntity_insertCodableCluster_syncProvenance_syncIdentity_transaction_error___block_invoke;
    v88[3] = &unk_1E6CF6308;
    v89 = v11;
    v90 = v21;
    v91 = v79;
    v92 = v80;
    v93 = v78;
    v94 = v62;
    v95 = a4;
    v96 = a5;
    objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 0, v85, v63, a7, v88);
    v14 = (void (*)(uint64_t))objc_claimAutoreleasedReturnValue();

    v64 = v14 == 0;
  }
  else
  {
    v14 = 0;
    v64 = 1;
  }

LABEL_55:
  if (v64)
    goto LABEL_52;
  if (!objc_msgSend(v11, "final"))
    goto LABEL_61;
LABEL_56:
  v65 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(v11, "workoutClusterUUID");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "hk_UUIDWithData:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = v67;
  v69 = v14;
  v70 = v87;
  objc_msgSend(v70, "databaseForEntityClass:", objc_opt_self());
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = MEMORY[0x1E0C809B0];
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __107__HDRaceRouteClusterEntity__pruneRaceRouteClustersFromWorkoutClusterUUID_eligibleEntity_transaction_error___block_invoke;
  v111 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6CE7750;
  v73 = (void (*)(uint64_t))v68;
  v112 = v73;
  v74 = v69;
  v113 = v74;
  v98 = v72;
  v99 = 3221225472;
  v100 = (uint64_t)__107__HDRaceRouteClusterEntity__pruneRaceRouteClustersFromWorkoutClusterUUID_eligibleEntity_transaction_error___block_invoke_2;
  v101 = &unk_1E6CE8CF8;
  v75 = v70;
  v102 = v75;
  if (objc_msgSend(v71, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT last_workout_rowid, best_workout_rowid FROM RacePreviousRoute_concrete_cluster WHERE workout_cluster_uuid = ? AND ROWID != ?"), a7, buf, &v98))
  {
    v104 = v72;
    v105 = 3221225472;
    v106 = (uint64_t)__107__HDRaceRouteClusterEntity__pruneRaceRouteClustersFromWorkoutClusterUUID_eligibleEntity_transaction_error___block_invoke_3;
    v107 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6CE7750;
    v108 = v73;
    v109 = v74;
    v76 = objc_msgSend(v71, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("DELETE FROM RacePreviousRoute_concrete_cluster WHERE workout_cluster_uuid = ? AND ROWID != ?"), a7, &v104, 0);

  }
  else
  {
    v76 = 0;
  }

  if (!v76)
  {
    v44 = 0;
    v14 = v74;
  }
  else
  {
LABEL_61:
    v14 = v14;
    v44 = v14;
  }
LABEL_67:

  return v44;
}

void __95__HDRaceRouteClusterEntity_insertCodableCluster_syncProvenance_syncIdentity_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0D8](a2, CFSTR("uuid"), v4);

  objc_msgSend(*(id *)(a1 + 32), "workoutClusterUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0D8](a2, CFSTR("workout_cluster_uuid"), v5);

  objc_msgSend(*(id *)(a1 + 32), "relevance");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("relevance"));
  MEMORY[0x1BCCAB114](a2, CFSTR("workout_activity_type"), (int)objc_msgSend(*(id *)(a1 + 32), "activityType"));
  MEMORY[0x1BCCAB114](a2, CFSTR("workout_cluster_size"), (int)objc_msgSend(*(id *)(a1 + 32), "clusterSize"));
  objc_msgSend(*(id *)(a1 + 40), "workoutUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0D8](a2, CFSTR("last_workout_uuid"), v6);

  objc_msgSend(*(id *)(a1 + 40), "startDate");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("last_workout_date"));
  objc_msgSend(*(id *)(a1 + 40), "distance");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("last_workout_distance"));
  objc_msgSend(*(id *)(a1 + 40), "duration");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("last_workout_duration"));
  MEMORY[0x1BCCAB114](a2, CFSTR("last_workout_rowid"), objc_msgSend(*(id *)(a1 + 48), "persistentID"));
  objc_msgSend(*(id *)(a1 + 56), "workoutUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0D8](a2, CFSTR("best_workout_uuid"), v7);

  objc_msgSend(*(id *)(a1 + 56), "startDate");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("best_workout_date"));
  objc_msgSend(*(id *)(a1 + 56), "distance");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("best_workout_distance"));
  objc_msgSend(*(id *)(a1 + 56), "duration");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("best_workout_duration"));
  MEMORY[0x1BCCAB114](a2, CFSTR("best_workout_rowid"), objc_msgSend(*(id *)(a1 + 64), "persistentID"));
  MEMORY[0x1BCCAB114](a2, CFSTR("snapshot_id"), objc_msgSend(*(id *)(a1 + 72), "persistentID"));
  objc_msgSend(*(id *)(a1 + 32), "routeLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("route_label"), v8);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("modified_date"), v9);

  MEMORY[0x1BCCAB114](a2, CFSTR("sync_provenance"), *(_QWORD *)(a1 + 80));
  MEMORY[0x1BCCAB0CC](a2, CFSTR("frozen"), objc_msgSend(*(id *)(a1 + 32), "final"));
  MEMORY[0x1BCCAB114](a2, CFSTR("sync_anchor"), 0);
  MEMORY[0x1BCCAB114](a2, CFSTR("relevance_anchor"), 0);
  JUMPOUT(0x1BCCAB114);
}

+ (id)entityForClusterUUID:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  objc_msgSend(a4, "databaseForEntityClass:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDRaceRouteClusterEntity _entityForClusterUUID:database:error:]((uint64_t)a1, v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __79__HDRaceRouteClusterEntity__enumerateClusterUUIDsForProfile_error_dataHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__HDRaceRouteClusterEntity__enumerateClusterUUIDsForProfile_error_dataHandler___block_invoke_2;
  v8[3] = &unk_1E6CE82B0;
  v9 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT uuid FROM RacePreviousRoute_concrete_cluster"), a3, 0, v8);

  return v6;
}

uint64_t __79__HDRaceRouteClusterEntity__enumerateClusterUUIDsForProfile_error_dataHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  MEMORY[0x1BCCAB18C](a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", CFSTR("RacePreviousRoute"), 1);
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  int64_t v12;

  v10 = a3;
  objc_msgSend(a5, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(a1, "nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:", a4, 0, v10, v11, a6);

  return v12;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end;
  int64_t start;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  int v25;
  HDCodableRacingCluster *v26;
  HDCodableRacingCluster *v27;
  _QWORD *v28;
  id v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  void *v33;
  BOOL v34;
  char v35;
  void *v37;
  void *v39;
  _QWORD v40[4];
  HDCodableRacingCluster *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  uint64_t *v47;
  uint64_t *v48;
  _QWORD *v49;
  uint64_t *v50;
  id v51;
  int64_t v52;
  int64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  int64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[4];
  const __CFString *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, void *, uint64_t);
  void *v71;
  id v72;
  void *v73;
  uint64_t v74;

  end = a4.end;
  start = a4.start;
  v74 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v37 = v12;
  v15 = objc_msgSend(v12, "maxEncodedBytesPerChangeSetForSyncEntityClass:", a1);
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x2020000000;
  v67[3] = 0;
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = start;
  objc_opt_self();
  +[HDRaceRouteClusterEntity _baseEntityProperties]();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = CFSTR("modified_date");
  v69 = (uint64_t)CFSTR("sync_provenance");
  v70 = (uint64_t (*)(uint64_t, void *, uint64_t))CFSTR("frozen");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "arrayByExcludingObjectsInArray:", v18);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "componentsJoinedByString:", CFSTR(","));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "database");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __103__HDRaceRouteClusterEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v42[3] = &unk_1E6CF63A8;
  v51 = a1;
  v21 = v19;
  v43 = v21;
  v47 = &v55;
  v52 = start;
  v53 = end;
  v48 = &v59;
  v22 = v13;
  v44 = v22;
  v49 = v67;
  v23 = v16;
  v45 = v23;
  v50 = &v63;
  v54 = v15;
  v24 = v14;
  v46 = v24;
  v25 = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v20, a7, v42);

  if (!*((_BYTE *)v60 + 24))
  {
    if (v25)
      goto LABEL_8;
LABEL_10:
    v35 = 0;
    goto LABEL_11;
  }
  v26 = objc_alloc_init(HDCodableRacingCluster);
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __103__HDRaceRouteClusterEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_5;
  v40[3] = &unk_1E6CF63D0;
  v27 = v26;
  v41 = v27;
  v28 = v40;
  v29 = v22;
  v30 = (void *)objc_opt_self();
  objc_msgSend(v29, "database");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = (const __CFString *)MEMORY[0x1E0C809B0];
  v69 = 3221225472;
  v70 = __79__HDRaceRouteClusterEntity__enumerateClusterUUIDsForProfile_error_dataHandler___block_invoke;
  v71 = &unk_1E6CF6330;
  v72 = v28;
  v73 = v30;
  v32 = v28;
  LOBYTE(v28) = objc_msgSend(v30, "performReadTransactionWithHealthDatabase:error:block:", v31, a7, &v68);

  if ((v28 & 1) == 0)
  {

    goto LABEL_10;
  }
  -[HDCodableRacingCluster eligibleClusterUUIDs](v27, "eligibleClusterUUIDs");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "count") == 0;

  if (!v34)
    objc_msgSend(v23, "addObject:", v27);

  if ((v25 & 1) == 0)
    goto LABEL_10;
LABEL_8:
  v35 = objc_msgSend(v24, "sendCodableChange:resultAnchor:sequence:done:error:", v23, v56[3], v64[3], 1, a7);
LABEL_11:

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(v67, 8);

  return v35;
}

uint64_t __103__HDRaceRouteClusterEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  int8x16_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;

  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 96));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT %@ FROM RacePreviousRoute_concrete_cluster WHERE relevance_anchor > %lld AND relevance_anchor <= %lld ORDER BY relevance_anchor ASC"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(_QWORD *)(a1 + 112));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __103__HDRaceRouteClusterEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v16[3] = &unk_1E6CF6380;
  v8 = *(_OWORD *)(a1 + 104);
  v21 = vextq_s8(*(int8x16_t *)(a1 + 64), *(int8x16_t *)(a1 + 64), 8uLL);
  v24 = v8;
  v25 = *(_QWORD *)(a1 + 96);
  v17 = v5;
  v9 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 80);
  v18 = v9;
  v22 = v10;
  v11 = *(id *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 88);
  v19 = v11;
  v23 = v12;
  v26 = *(_QWORD *)(a1 + 120);
  v20 = *(id *)(a1 + 56);
  v13 = v5;
  v14 = objc_msgSend(v6, "executeSQL:error:bindingHandler:enumerationHandler:", v7, a3, 0, v16);

  return v14;
}

BOOL __103__HDRaceRouteClusterEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  HDCodableRacingCluster *v6;
  void *v7;
  void *v8;
  HDCodableRacingMetrics *v9;
  void *v10;
  HDCodableRacingMetrics *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HDCodableRacingCluster *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HDRaceRouteSnapshotEntity *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  unint64_t v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  uint64_t *v63;
  char v64;
  int v65;
  uint64_t v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  _BOOL8 v73;
  void *v75;
  void *v76;
  void *v77;
  HDRaceRouteSnapshotEntity *v78;
  void *v79;
  void *v80;
  HDCodableRacingCluster *v81;
  _QWORD v83[4];
  id v84;
  uint64_t *v85;
  uint64_t *v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  _QWORD v92[4];
  id v93;
  uint64_t *v94;
  uint64_t *v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  double *v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  double *v106;
  uint64_t v107;
  unint64_t v108;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = HDSQLiteColumnWithNameAsInt64();
  v4 = HDSQLiteColumnWithNameAsInt64();
  v5 = *(_QWORD *)(a1 + 96);
  objc_opt_self();
  v6 = objc_alloc_init(HDCodableRacingCluster);
  HDSQLiteColumnWithNameAsData();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableRacingCluster setUuid:](v6, "setUuid:", v7);

  HDSQLiteColumnWithNameAsData();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableRacingCluster setWorkoutClusterUUID:](v6, "setWorkoutClusterUUID:", v8);

  HDSQLiteColumnWithNameAsDouble();
  -[HDCodableRacingCluster setRelevance:](v6, "setRelevance:");
  if (v4 > v5)
  {
    -[HDCodableRacingCluster setActivityType:](v6, "setActivityType:", HDSQLiteColumnWithNameAsInt64());
    -[HDCodableRacingCluster setClusterSize:](v6, "setClusterSize:", HDSQLiteColumnWithNameAsInt64());
    v9 = objc_alloc_init(HDCodableRacingMetrics);
    HDSQLiteColumnWithNameAsData();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableRacingMetrics setWorkoutUUID:](v9, "setWorkoutUUID:", v10);

    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableRacingMetrics setStartDate:](v9, "setStartDate:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableRacingMetrics setDistance:](v9, "setDistance:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableRacingMetrics setDuration:](v9, "setDuration:");
    -[HDCodableRacingCluster setLastWorkoutMetrics:](v6, "setLastWorkoutMetrics:", v9);
    v11 = objc_alloc_init(HDCodableRacingMetrics);
    HDSQLiteColumnWithNameAsData();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableRacingMetrics setWorkoutUUID:](v11, "setWorkoutUUID:", v12);

    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableRacingMetrics setStartDate:](v11, "setStartDate:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableRacingMetrics setDistance:](v11, "setDistance:");
    HDSQLiteColumnWithNameAsDouble();
    -[HDCodableRacingMetrics setDuration:](v11, "setDuration:");
    -[HDCodableRacingCluster setBestWorkoutMetrics:](v6, "setBestWorkoutMetrics:", v11);
    HDSQLiteColumnWithNameAsString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableRacingCluster setRouteLabel:](v6, "setRouteLabel:", v13);

  }
  v15 = *(void **)(a1 + 32);
  v14 = *(void **)(a1 + 40);
  v16 = v6;
  v17 = v14;
  v18 = v15;
  objc_opt_self();
  v19 = HDSQLiteColumnWithNameAsInt64();
  objc_msgSend(v17, "syncIdentityManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "identityForEntityID:transaction:error:", v19, v18, a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {

    v73 = 0;
    goto LABEL_42;
  }
  objc_msgSend(v21, "identity");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "codableSyncIdentity");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableRacingCluster setSyncIdentity:](v16, "setSyncIdentity:", v23);

  if (v4 <= v5)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) += -[PBCodable encodedByteCount](v16, "encodedByteCount");
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v16);
    v73 = 1;
    goto LABEL_42;
  }
  v24 = (void *)MEMORY[0x1E0CB3A28];
  -[HDCodableRacingCluster uuid](v16, "uuid");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hk_UUIDWithData:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = -[HDSQLiteEntity initWithPersistentID:]([HDRaceRouteSnapshotEntity alloc], "initWithPersistentID:", HDSQLiteColumnWithNameAsInt64());
  -[HDRaceRouteSnapshotEntity snapshotDataWithTransaction:error:](v27, "snapshotDataWithTransaction:error:", *(_QWORD *)(a1 + 32), a3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v27;
  if (!v28)
  {
    v73 = 0;
    goto LABEL_41;
  }
  v80 = v26;
  v77 = v28;
  -[HDCodableRacingCluster setRouteSnapshot:](v16, "setRouteSnapshot:", v28);
  v105 = 0;
  v106 = (double *)&v105;
  v107 = 0x2020000000;
  v108 = 0xBFF0000000000000;
  v101 = 0;
  v102 = (double *)&v101;
  v103 = 0x2020000000;
  v104 = 0xBFF0000000000000;
  v29 = (void *)MEMORY[0x1E0CB3A28];
  v81 = v16;
  -[HDCodableRacingCluster bestWorkoutMetrics](v16, "bestWorkoutMetrics");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "workoutUUID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "hk_UUIDWithData:", v31);
  v32 = objc_claimAutoreleasedReturnValue();

  v33 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "metadataManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDRaceRouteClusterWorkout clusterWorkoutWithWorkoutUUID:transaction:metadataManager:error:](HDRaceRouteClusterWorkout, "clusterWorkoutWithWorkoutUUID:transaction:metadataManager:error:", v32, v33, v34, a3);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = (void *)v32;

  if (!v35)
  {
    v73 = 0;
    v26 = v80;
    goto LABEL_40;
  }
  v36 = (void *)MEMORY[0x1E0CB3A28];
  -[HDCodableRacingCluster lastWorkoutMetrics](v16, "lastWorkoutMetrics");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "workoutUUID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "hk_UUIDWithData:", v38);
  v39 = objc_claimAutoreleasedReturnValue();

  v40 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "metadataManager");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDRaceRouteClusterWorkout clusterWorkoutWithWorkoutUUID:transaction:metadataManager:error:](HDRaceRouteClusterWorkout, "clusterWorkoutWithWorkoutUUID:transaction:metadataManager:error:", v39, v40, v41, a3);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = (void *)v39;

  v26 = v80;
  if (!v42)
  {
    v73 = 0;
    goto LABEL_39;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
  v79 = v42;
  while (1)
  {
    v43 = (void *)-[HDCodableRacingCluster copy](v16, "copy");
    v44 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    v45 = objc_msgSend(v43, "encodedByteCount");
    v46 = *(_QWORD *)(a1 + 112);
    v47 = *(_QWORD *)(a1 + 120) - v45 - v44;
    if (v47 >= 150)
      v48 = v47 / 50;
    else
      v48 = 2;
    v97 = 0;
    v98 = &v97;
    v99 = 0x2020000000;
    v100 = 0;
    v49 = v102[3];
    objc_msgSend(v42, "startDuration");
    v51 = v50;
    objc_msgSend(v42, "finishDuration");
    v53 = v52;
    v54 = vcvtpd_u64_f64((double)v48 * 0.5);
    v55 = *(void **)(a1 + 40);
    v92[0] = MEMORY[0x1E0C809B0];
    v92[1] = 3221225472;
    v92[2] = __103__HDRaceRouteClusterEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_3;
    v92[3] = &unk_1E6CF6358;
    v94 = &v97;
    v96 = v54;
    v56 = v43;
    v93 = v56;
    v95 = &v101;
    if ((+[HDRaceRouteClusterEntity _enumerateRoutePointsForClusterUUID:workoutSelection:timestampAnchor:limit:startDuration:finishDuration:profile:error:dataHandler:](v49, v51, v53, v46, v26, 1, v54 + 1, v55, a3, v92) & 1) == 0)
    {
      v65 = 1;
      v64 = 1;
      goto LABEL_29;
    }
    v57 = v35;
    v88 = 0;
    v89 = &v88;
    v90 = 0x2020000000;
    v91 = 0;
    objc_msgSend(v56, "lastWorkoutMetrics");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "workoutUUID");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "bestWorkoutMetrics");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "workoutUUID");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v59, "isEqualToData:", v61);

    if (v62)
    {
      v63 = v98;
    }
    else
    {
      v66 = *(_QWORD *)(a1 + 112);
      v67 = v106[3];
      v35 = v57;
      objc_msgSend(v57, "startDuration");
      v26 = v80;
      v69 = v68;
      objc_msgSend(v57, "finishDuration");
      v71 = v70;
      v72 = *(void **)(a1 + 40);
      v83[0] = MEMORY[0x1E0C809B0];
      v83[1] = 3221225472;
      v83[2] = __103__HDRaceRouteClusterEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_4;
      v83[3] = &unk_1E6CF6358;
      v85 = &v88;
      v87 = v54;
      v84 = v56;
      v86 = &v105;
      LODWORD(v72) = +[HDRaceRouteClusterEntity _enumerateRoutePointsForClusterUUID:workoutSelection:timestampAnchor:limit:startDuration:finishDuration:profile:error:dataHandler:](v67, v69, v71, v66, v80, 2, v54 + 1, v72, a3, v83);

      if (!(_DWORD)v72)
      {
        v65 = 1;
        v64 = 1;
        goto LABEL_26;
      }
      if (v98[3] > v54)
      {
LABEL_20:
        v64 = 1;
        goto LABEL_21;
      }
      v63 = v89;
    }
    if (v63[3] > v54)
      goto LABEL_20;
    objc_msgSend(v56, "setFinal:", 1);
    v64 = 0;
LABEL_21:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) += objc_msgSend(v56, "encodedByteCount");
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v56);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) > *(_QWORD *)(a1 + 120))
    {
      v42 = v79;
      v26 = v80;
      v35 = v57;
      if ((objc_msgSend(*(id *)(a1 + 56), "sendCodableChange:resultAnchor:sequence:done:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), 0, a3) & 1) != 0)
      {
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
        objc_msgSend(*(id *)(a1 + 48), "removeAllObjects");
        v65 = 0;
      }
      else
      {
        v65 = 1;
      }
      goto LABEL_28;
    }
    v65 = 0;
    v26 = v80;
    v35 = v57;
LABEL_26:
    v42 = v79;
LABEL_28:
    _Block_object_dispose(&v88, 8);
LABEL_29:

    _Block_object_dispose(&v97, 8);
    v73 = v65 == 0;
    if (v65)
      break;
    v16 = v81;
    if ((v64 & 1) == 0)
      goto LABEL_39;
  }
  v16 = v81;
LABEL_39:

LABEL_40:
  _Block_object_dispose(&v101, 8);
  _Block_object_dispose(&v105, 8);
  v28 = v77;
LABEL_41:

LABEL_42:
  return v73;
}

uint64_t __103__HDRaceRouteClusterEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) <= *(_QWORD *)(a1 + 56))
  {
    objc_msgSend(a2, "codableRepresentationForSync");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "lastWorkoutMetrics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addRoutePoints:", v3);

    objc_msgSend(v3, "timestamp");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5;

  }
  return 1;
}

uint64_t __103__HDRaceRouteClusterEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) <= *(_QWORD *)(a1 + 56))
  {
    objc_msgSend(a2, "codableRepresentationForSync");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "bestWorkoutMetrics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addRoutePoints:", v3);

    objc_msgSend(v3, "timestamp");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5;

  }
  return 1;
}

uint64_t __103__HDRaceRouteClusterEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_5(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addEligibleClusterUUIDs:", a2);
  return 1;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3;
  HDCodableRacingCluster *v4;

  v3 = a3;
  v4 = -[HDCodableRacingCluster initWithData:]([HDCodableRacingCluster alloc], "initWithData:", v3);

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  HDInsertRacingClustersOperation *v12;

  v10 = a6;
  v11 = a3;
  v12 = -[HDInsertRacingClustersOperation initWithClusters:provenance:]([HDInsertRacingClustersOperation alloc], "initWithClusters:provenance:", v11, objc_msgSend(a5, "syncProvenance"));

  LODWORD(a7) = -[HDJournalableOperation performOrJournalWithProfile:error:](v12, "performOrJournalWithProfile:error:", v10, a7);
  return a7 ^ 1;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (BOOL)supportsSyncStore:(id)a3
{
  return objc_msgSend(a3, "syncStoreType") == 1;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 1;
}

@end
