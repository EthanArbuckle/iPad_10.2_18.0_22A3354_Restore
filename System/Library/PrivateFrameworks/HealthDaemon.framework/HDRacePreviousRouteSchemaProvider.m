@implementation HDRacePreviousRouteSchemaProvider

+ (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3
{
  return 16 * (a3 != 1);
}

+ (id)databaseEntitiesForProtectionClass:(int64_t)a3
{
  void *v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  if (a3 == 2)
  {
    v5[0] = objc_opt_class();
    v5[1] = objc_opt_class();
    v5[2] = objc_opt_class();
    v5[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v3;
}

+ (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  if (a3 == 2)
  {
    v4 = a4;
    objc_opt_self();
    objc_msgSend(v4, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", CFSTR("RacePreviousRoute"), 11, 0, &__block_literal_global_10);

    v5 = v4;
    objc_opt_self();
    objc_msgSend(v5, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", CFSTR("RacePreviousRoute"), 12, 0, &__block_literal_global_208);

    v6 = v5;
    objc_opt_self();
    objc_msgSend(v6, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", CFSTR("RacePreviousRoute"), 13, 0, &__block_literal_global_213);

    v7 = v6;
    objc_opt_self();
    objc_msgSend(v7, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", CFSTR("RacePreviousRoute"), 14, 0, &__block_literal_global_226);

    v8 = v7;
    objc_opt_self();
    objc_msgSend(v8, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", CFSTR("RacePreviousRoute"), 15, 0, &__block_literal_global_303);

    v9 = v8;
    objc_opt_self();
    objc_msgSend(v9, "addMigrationForSchema:toVersion:foreignKeyStatus:handler:", CFSTR("RacePreviousRoute"), 16, 0, &__block_literal_global_320);

  }
}

uint64_t __83__HDRacePreviousRouteSchemaProvider__addWorkoutAndRacingClusterTablesWithMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v6;

  objc_msgSend(a3, "protectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v6, "executeSQLStatements:error:", &unk_1E6DF88B8, a5);

  return a5 ^ 1;
}

uint64_t __74__HDRacePreviousRouteSchemaProvider__addGenerationQueueTableWithMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v6;

  objc_msgSend(a3, "protectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v6, "executeSQLStatements:error:", &unk_1E6DF88D0, a5);

  return a5 ^ 1;
}

uint64_t __80__HDRacePreviousRouteSchemaProvider__addConcreteClusterSyncAnchorsWithMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v6;

  objc_msgSend(a3, "protectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v6, "executeSQLStatements:error:", &unk_1E6DF88E8, a5);

  return a5 ^ 1;
}

uint64_t __72__HDRacePreviousRouteSchemaProvider__addRouteSnapshotTableWithMigrator___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  _QWORD v16[4];
  id v17;
  __CFString *v18;
  __CFString *v19;
  uint64_t *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _QWORD v26[4];
  id v27;
  __CFString *v28;
  __CFString *v29;
  uint64_t *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  _QWORD v36[5];

  v7 = a2;
  v8 = a3;
  objc_msgSend(v8, "protectedDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 1;
  if (objc_msgSend(v9, "executeSQLStatements:error:", &unk_1E6DF8900, a5))
  {
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    v36[3] = 0;
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 1;
    v11 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __72__HDRacePreviousRouteSchemaProvider__addRouteSnapshotTableWithMigrator___block_invoke_2;
    v26[3] = &unk_1E6CE9558;
    v12 = v9;
    v27 = v12;
    v28 = CFSTR("INSERT INTO RacePreviousRoute_route_snapshot (data) VALUES (?)");
    v30 = &v32;
    v31 = v36;
    v29 = CFSTR("INSERT INTO RacePreviousRoute_workout_cluster_new (uuid, relevance, last_workout_id, best_workout_id, snapshot_id, route_label, modified_date) VALUES (?, ?, ?, ?, ?, ?, ?)");
    if (objc_msgSend(v12, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT uuid, relevance, last_workout_id, best_workout_id, route_snapshot, route_label, modified_date FROM RacePreviousRoute_workout_cluster"), a5, 0, v26)&& *((_BYTE *)v33 + 24))
    {
      v13 = v11;
      v10 = 1;
      if ((objc_msgSend(v12, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO RacePreviousRoute_concrete_cluster_new (uuid, workout_cluster_uuid, relevance, workout_activity_type, workout_cluster_size, last_workout_uuid, last_workout_date, last_workout_distance, last_workout_duration, last_route_key, best_workout_uuid, best_workout_date, best_workout_distance, best_workout_duration, best_route_key, snapshot_id, route_label, modified_date, sync_provenance, frozen, sync_anchor, relevance_anchor) SELECT cc.uuid, workout_cluster_uuid, cc.relevance, workout_activity_type, workout_cluster_size, last_workout_uuid, last_workout_date, last_workout_distance, last_workout_duration, last_route_key, best_workout_uuid, best_workout_date, best_workout_distance, best_workout_duration, best_route_key, nwc.snapshot_id, cc.route_label, cc.modified_date, sync_provenance, frozen, sync_anchor, relevance_anchor FROM RacePreviousRoute_concrete_cluster cc  INNER JOIN RacePreviousRoute_workout_cluster_new nwc ON cc.workout_cluster_uuid = nwc.uuid"), a5, 0, 0) & 1) != 0)
      {
        v22 = 0;
        v23 = &v22;
        v24 = 0x2020000000;
        v25 = 1;
        v16[0] = v13;
        v16[1] = 3221225472;
        v16[2] = __72__HDRacePreviousRouteSchemaProvider__addRouteSnapshotTableWithMigrator___block_invoke_5;
        v16[3] = &unk_1E6CE9558;
        v14 = v12;
        v17 = v14;
        v18 = CFSTR("INSERT INTO RacePreviousRoute_route_snapshot (data) VALUES (?)");
        v20 = &v22;
        v21 = v36;
        v19 = CFSTR("INSERT INTO RacePreviousRoute_concrete_cluster_new (uuid, workout_cluster_uuid, relevance, workout_activity_type, workout_cluster_size, last_workout_uuid, last_workout_date, last_workout_distance, last_workout_duration, last_route_key, best_workout_uuid, best_workout_date, best_workout_distance, best_workout_duration, best_route_key, snapshot_id, route_label, modified_date, sync_provenance, frozen, sync_anchor, relevance_anchor) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        if (objc_msgSend(v14, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT uuid, workout_cluster_uuid, relevance, workout_activity_type, workout_cluster_size, last_workout_uuid, last_workout_date, last_workout_distance, last_workout_duration, last_route_key, best_workout_uuid, best_workout_date, best_workout_distance, best_workout_duration, best_route_key, route_snapshot, route_label, modified_date, sync_provenance, frozen, sync_anchor, relevance_anchor FROM RacePreviousRoute_concrete_cluster WHERE uuid NOT IN (SELECT uuid FROM RacePreviousRoute_concrete_cluster_new)"), a5, 0, v16)&& *((_BYTE *)v23 + 24))
        {
          v10 = objc_msgSend(v14, "executeSQLStatements:error:", &unk_1E6DF8918, a5) ^ 1;
        }
        else
        {
          v10 = 1;
        }

        _Block_object_dispose(&v22, 8);
      }
    }
    else
    {
      v10 = 1;
    }

    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(v36, 8);
  }

  return v10;
}

uint64_t __72__HDRacePreviousRouteSchemaProvider__addRouteSnapshotTableWithMigrator___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;

  HDSQLiteColumnWithNameAsData();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)a1[4];
  v7 = a1[5];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __72__HDRacePreviousRouteSchemaProvider__addRouteSnapshotTableWithMigrator___block_invoke_3;
  v32[3] = &unk_1E6CE9508;
  v8 = v5;
  v33 = v8;
  if ((objc_msgSend(v6, "executeSQL:error:bindingHandler:enumerationHandler:", v7, a3, v32, 0) & 1) != 0)
  {
    ++*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24);
    HDSQLiteColumnWithNameAsUUID();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsDouble();
    v11 = v10;
    v12 = HDSQLiteColumnWithNameAsInt64();
    v13 = HDSQLiteColumnWithNameAsInt64();
    HDSQLiteColumnWithNameAsString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsDate();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)a1[4];
    v16 = a1[6];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __72__HDRacePreviousRouteSchemaProvider__addRouteSnapshotTableWithMigrator___block_invoke_4;
    v24[3] = &unk_1E6CE9530;
    v17 = v9;
    v29 = v11;
    v30 = v12;
    v31 = v13;
    v18 = a1[8];
    v25 = v17;
    v28 = v18;
    v19 = v14;
    v26 = v19;
    v20 = v15;
    v27 = v20;
    v21 = objc_msgSend(v23, "executeSQL:error:bindingHandler:enumerationHandler:", v16, a3, v24, 0);
    if ((v21 & 1) == 0)
      *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;

  }
  else
  {
    v21 = 0;
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
  }

  return v21;
}

uint64_t __72__HDRacePreviousRouteSchemaProvider__addRouteSnapshotTableWithMigrator___block_invoke_3()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __72__HDRacePreviousRouteSchemaProvider__addRouteSnapshotTableWithMigrator___block_invoke_4(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_double(a2, 2, *(double *)(a1 + 64));
  sqlite3_bind_int64(a2, 3, *(_QWORD *)(a1 + 72));
  sqlite3_bind_int64(a2, 4, *(_QWORD *)(a1 + 80));
  sqlite3_bind_int64(a2, 5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  HDSQLiteBindFoundationValueToStatement();
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __72__HDRacePreviousRouteSchemaProvider__addRouteSnapshotTableWithMigrator___block_invoke_5(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD v74[4];
  id v75;

  HDSQLiteColumnWithNameAsData();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)a1[4];
  v7 = a1[5];
  v8 = MEMORY[0x1E0C809B0];
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __72__HDRacePreviousRouteSchemaProvider__addRouteSnapshotTableWithMigrator___block_invoke_6;
  v74[3] = &unk_1E6CE9508;
  v9 = v5;
  v75 = v9;
  if ((objc_msgSend(v6, "executeSQL:error:bindingHandler:enumerationHandler:", v7, a3, v74, 0) & 1) != 0)
  {
    v50 = v9;
    ++*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24);
    HDSQLiteColumnWithNameAsUUID();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsUUID();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsDouble();
    v13 = v12;
    v46 = HDSQLiteColumnWithNameAsInt64();
    v49 = a3;
    v14 = HDSQLiteColumnWithNameAsInt64();
    HDSQLiteColumnWithNameAsUUID();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsDate();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsDouble();
    v17 = v16;
    HDSQLiteColumnWithNameAsDouble();
    v19 = v18;
    v44 = HDSQLiteColumnWithNameAsInt64();
    HDSQLiteColumnWithNameAsUUID();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsDate();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsDouble();
    v22 = v21;
    HDSQLiteColumnWithNameAsDouble();
    v24 = v23;
    v42 = HDSQLiteColumnWithNameAsInt64();
    HDSQLiteColumnWithNameAsString();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsDate();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = HDSQLiteColumnWithNameAsInt64();
    v38 = HDSQLiteColumnWithNameAsInt64();
    v25 = HDSQLiteColumnWithNameAsInt64();
    v26 = HDSQLiteColumnWithNameAsInt64();
    v37 = (void *)a1[4];
    v27 = a1[6];
    v51[0] = v8;
    v51[1] = 3221225472;
    v51[2] = __72__HDRacePreviousRouteSchemaProvider__addRouteSnapshotTableWithMigrator___block_invoke_7;
    v51[3] = &unk_1E6CE9580;
    v48 = v10;
    v52 = v48;
    v47 = v11;
    v53 = v47;
    v61 = v13;
    v62 = v46;
    v63 = v14;
    v28 = v15;
    v54 = v28;
    v29 = v45;
    v55 = v29;
    v64 = v17;
    v65 = v19;
    v66 = v44;
    v30 = v20;
    v56 = v30;
    v31 = v43;
    v67 = v22;
    v68 = v24;
    v69 = v42;
    v32 = a1[8];
    v57 = v31;
    v60 = v32;
    v33 = v41;
    v58 = v33;
    v34 = v40;
    v59 = v34;
    v70 = v39;
    v71 = v38;
    v72 = v25;
    v73 = v26;
    v35 = objc_msgSend(v37, "executeSQL:error:bindingHandler:enumerationHandler:", v27, v49, v51, 0);
    if ((v35 & 1) == 0)
      *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;

    v9 = v50;
  }
  else
  {
    v35 = 0;
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
  }

  return v35;
}

uint64_t __72__HDRacePreviousRouteSchemaProvider__addRouteSnapshotTableWithMigrator___block_invoke_6()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __72__HDRacePreviousRouteSchemaProvider__addRouteSnapshotTableWithMigrator___block_invoke_7(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_double(a2, 3, *(double *)(a1 + 104));
  sqlite3_bind_int64(a2, 4, *(_QWORD *)(a1 + 112));
  sqlite3_bind_int64(a2, 5, *(_QWORD *)(a1 + 120));
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_double(a2, 8, *(double *)(a1 + 128));
  sqlite3_bind_double(a2, 9, *(double *)(a1 + 136));
  sqlite3_bind_int64(a2, 10, *(_QWORD *)(a1 + 144));
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_double(a2, 13, *(double *)(a1 + 152));
  sqlite3_bind_double(a2, 14, *(double *)(a1 + 160));
  sqlite3_bind_int64(a2, 15, *(_QWORD *)(a1 + 168));
  sqlite3_bind_int64(a2, 16, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24));
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 19, *(_QWORD *)(a1 + 176));
  sqlite3_bind_int64(a2, 20, *(_QWORD *)(a1 + 184));
  sqlite3_bind_int64(a2, 21, *(_QWORD *)(a1 + 192));
  return sqlite3_bind_int64(a2, 22, *(_QWORD *)(a1 + 200));
}

uint64_t __66__HDRacePreviousRouteSchemaProvider__addWorkoutTableWithMigrator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  objc_msgSend(v6, "protectedDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "executeSQLStatements:error:", &unk_1E6DF8930, a5);

  if (v8)
  {
    objc_msgSend(v6, "protectedDatabase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__HDRacePreviousRouteSchemaProvider__addWorkoutTableWithMigrator___block_invoke_2;
    v13[3] = &unk_1E6CE8CF8;
    v10 = v9;
    v14 = v10;
    if (objc_msgSend(v10, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT uuid, workout_cluster_uuid, relevance, workout_activity_type, workout_cluster_size, last_workout_uuid, last_workout_date, last_workout_distance, last_workout_duration, last_route_key, best_workout_uuid, best_workout_date, best_workout_distance, best_workout_duration, best_route_key, snapshot_id, route_label, modified_date, sync_provenance, frozen, sync_anchor, relevance_anchor FROM RacePreviousRoute_concrete_cluster"), a5, 0, v13))v11 = objc_msgSend(v10, "executeSQLStatements:error:", &unk_1E6DF8948, a5) ^ 1;
    else
      v11 = 1;

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

uint64_t __66__HDRacePreviousRouteSchemaProvider__addWorkoutTableWithMigrator___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  id *v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD v74[4];
  id v75[2];
  _QWORD v76[4];
  id v77;
  uint64_t v78;

  HDSQLiteColumnWithNameAsUUID();
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsUUID();
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDouble();
  v5 = v4;
  v42 = HDSQLiteColumnWithNameAsInt64();
  v41 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsUUID();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDouble();
  v8 = v7;
  HDSQLiteColumnWithNameAsDouble();
  v10 = v9;
  v11 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsUUID();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDouble();
  v13 = v12;
  HDSQLiteColumnWithNameAsDouble();
  v15 = v14;
  v40 = (void *)HDSQLiteColumnWithNameAsInt64();
  v39 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsString();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = HDSQLiteColumnWithNameAsInt64();
  v17 = HDSQLiteColumnWithNameAsInt64();
  v18 = HDSQLiteColumnWithNameAsInt64();
  v19 = HDSQLiteColumnWithNameAsInt64();
  v20 = *(void **)(a1 + 32);
  v21 = MEMORY[0x1E0C809B0];
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __66__HDRacePreviousRouteSchemaProvider__addWorkoutTableWithMigrator___block_invoke_3;
  v76[3] = &unk_1E6CE82D8;
  v22 = v6;
  v77 = v22;
  v78 = v11;
  if (objc_msgSend(v20, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO RacePreviousRoute_workout (workout_uuid, route_key, date_to_delete) VALUES (?, ?, ?)"), a3, v76, 0))
  {
    v36 = v19;
    v37 = v18;
    v38 = v16;
    objc_msgSend(*(id *)(a1 + 32), "lastInsertRowID");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v40 != (void *)v11)
    {
      v25 = *(void **)(a1 + 32);
      v74[0] = v21;
      v74[1] = 3221225472;
      v74[2] = __66__HDRacePreviousRouteSchemaProvider__addWorkoutTableWithMigrator___block_invoke_4;
      v74[3] = &unk_1E6CE82D8;
      v75[0] = v47;
      v75[1] = v40;
      if (!objc_msgSend(v25, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO RacePreviousRoute_workout (workout_uuid, route_key, date_to_delete) VALUES (?, ?, ?)"), a3, v74, 0))
      {
        v33 = 0;
        v34 = v75;
        v31 = v23;
        v27 = v46;
        v29 = v47;
        v28 = v44;
        v30 = v45;
        v32 = v43;
        goto LABEL_8;
      }
      objc_msgSend(*(id *)(a1 + 32), "lastInsertRowID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v26 = *(void **)(a1 + 32);
    v51[0] = v21;
    v51[1] = 3221225472;
    v51[2] = __66__HDRacePreviousRouteSchemaProvider__addWorkoutTableWithMigrator___block_invoke_5;
    v51[3] = &unk_1E6CE95C8;
    v52 = v48;
    v27 = v46;
    v53 = v46;
    v62 = v5;
    v63 = v42;
    v64 = v41;
    v54 = v22;
    v28 = v44;
    v55 = v44;
    v65 = v8;
    v66 = v10;
    v56 = v23;
    v29 = v47;
    v57 = v47;
    v30 = v45;
    v58 = v45;
    v67 = v13;
    v68 = v15;
    v31 = v24;
    v59 = v31;
    v69 = v39;
    v32 = v43;
    v60 = v43;
    v61 = v49;
    v70 = v38;
    v71 = v17;
    v72 = v37;
    v73 = v36;
    v33 = objc_msgSend(v26, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO RacePreviousRoute_concrete_cluster_new (uuid, workout_cluster_uuid, relevance, workout_activity_type, workout_cluster_size, last_workout_uuid, last_workout_date, last_workout_distance, last_workout_duration, last_workout_rowid, best_workout_uuid, best_workout_date, best_workout_distance, best_workout_duration, best_workout_rowid, snapshot_id, route_label, modified_date, sync_provenance, frozen, sync_anchor, relevance_anchor) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"), a3, v51, 0);

    v34 = &v52;
LABEL_8:

    goto LABEL_9;
  }
  v33 = 0;
  v27 = v46;
  v29 = v47;
  v28 = v44;
  v30 = v45;
  v32 = v43;
LABEL_9:

  return v33;
}

uint64_t __66__HDRacePreviousRouteSchemaProvider__addWorkoutTableWithMigrator___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
  return sqlite3_bind_null(a2, 3);
}

uint64_t __66__HDRacePreviousRouteSchemaProvider__addWorkoutTableWithMigrator___block_invoke_4(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
  return sqlite3_bind_null(a2, 3);
}

uint64_t __66__HDRacePreviousRouteSchemaProvider__addWorkoutTableWithMigrator___block_invoke_5(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_double(a2, 3, *(double *)(a1 + 112));
  sqlite3_bind_int64(a2, 4, *(_QWORD *)(a1 + 120));
  sqlite3_bind_int64(a2, 5, *(_QWORD *)(a1 + 128));
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_double(a2, 8, *(double *)(a1 + 136));
  sqlite3_bind_double(a2, 9, *(double *)(a1 + 144));
  sqlite3_bind_int64(a2, 10, objc_msgSend(*(id *)(a1 + 64), "longLongValue"));
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_double(a2, 13, *(double *)(a1 + 152));
  sqlite3_bind_double(a2, 14, *(double *)(a1 + 160));
  sqlite3_bind_int64(a2, 15, objc_msgSend(*(id *)(a1 + 88), "longLongValue"));
  sqlite3_bind_int64(a2, 16, *(_QWORD *)(a1 + 168));
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 19, *(_QWORD *)(a1 + 176));
  sqlite3_bind_int64(a2, 20, *(_QWORD *)(a1 + 184));
  sqlite3_bind_int64(a2, 21, *(_QWORD *)(a1 + 192));
  return sqlite3_bind_int64(a2, 22, *(_QWORD *)(a1 + 200));
}

uint64_t __88__HDRacePreviousRouteSchemaProvider__addSyncIdentityToConcreteClusterTableWithMigrator___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[5];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(v8, "protectedDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "executeUncachedSQL:error:", CFSTR("CREATE TABLE RacePreviousRoute_concrete_cluster_new (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, uuid BLOB NOT NULL, workout_cluster_uuid BLOB NOT NULL, relevance REAL NOT NULL, workout_activity_type INTEGER NOT NULL, workout_cluster_size INTEGER NOT NULL, last_workout_uuid BLOB NOT NULL, last_workout_date REAL NOT NULL, last_workout_distance REAL NOT NULL, last_workout_duration REAL NOT NULL, last_workout_rowid INTEGER NOT NULL, best_workout_uuid BLOB NOT NULL, best_workout_date REAL NOT NULL, best_workout_distance REAL NOT NULL, best_workout_duration REAL NOT NULL, best_workout_rowid INTEGER NOT NULL, snapshot_id INTEGER NOT NULL REFERENCES RacePreviousRoute_route_snapshot (ROWID) ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED, route_label TEXT NOT NULL, modified_date REAL NOT NULL, sync_provenance INTEGER NOT NULL, frozen INTEGER NOT NULL, sync_anchor INTEGER NOT NULL, relevance_anchor INTEGER NOT NULL, sync_identity INTEGER NOT NULL, UNIQUE(uuid));"),
                        a5)
    || (v10 = objc_msgSend(v7, "fetchLegacySyncIdentity:error:", v8, a5), v10 == -1))
  {
    v14 = 1;
  }
  else
  {
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT INTO RacePreviousRoute_concrete_cluster_new (ROWID, uuid, workout_cluster_uuid, relevance, workout_activity_type, workout_cluster_size, last_workout_uuid, last_workout_date, last_workout_distance, last_workout_duration, last_workout_rowid, best_workout_uuid, best_workout_date, best_workout_distance, best_workout_duration, best_workout_rowid, snapshot_id, route_label, modified_date, sync_provenance, frozen, sync_anchor, relevance_anchor, sync_identity) SELECT ROWID, uuid, workout_cluster_uuid, relevance, workout_activity_type, workout_cluster_size, last_workout_uuid, last_workout_date, last_workout_distance, last_workout_duration, last_workout_rowid, best_workout_uuid, best_workout_date, best_workout_distance, best_workout_duration, best_workout_rowid, snapshot_id, route_label, modified_date, sync_provenance, frozen, sync_anchor, relevance_anchor, ? FROM RacePreviousRoute_concrete_cluster;"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __88__HDRacePreviousRouteSchemaProvider__addSyncIdentityToConcreteClusterTableWithMigrator___block_invoke_2;
    v16[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
    v16[4] = v11;
    if (objc_msgSend(v9, "executeSQL:error:bindingHandler:enumerationHandler:", v12, a5, v16, 0))
    {
      v17[0] = CFSTR("DROP TABLE RacePreviousRoute_concrete_cluster;");
      v17[1] = CFSTR("ALTER TABLE RacePreviousRoute_concrete_cluster_new RENAME TO RacePreviousRoute_concrete_cluster;");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v9, "executeSQLStatements:error:", v13, a5) ^ 1;

    }
    else
    {
      v14 = 1;
    }

  }
  return v14;
}

uint64_t __88__HDRacePreviousRouteSchemaProvider__addSyncIdentityToConcreteClusterTableWithMigrator___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

@end
