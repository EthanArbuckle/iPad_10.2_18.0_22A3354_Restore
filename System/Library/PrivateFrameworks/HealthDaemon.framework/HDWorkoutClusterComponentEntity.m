@implementation HDWorkoutClusterComponentEntity

+ (BOOL)associateWorkout:(id)a3 withCluster:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v26[0] = CFSTR("cluster_id");
  v26[1] = CFSTR("workout_id");
  v12 = (void *)MEMORY[0x1E0C99D20];
  v13 = a5;
  objc_msgSend(v12, "arrayWithObjects:count:", v26, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "databaseForEntityClass:", a1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __82__HDWorkoutClusterComponentEntity_associateWorkout_withCluster_transaction_error___block_invoke;
  v23[3] = &unk_1E6CEF160;
  v24 = v14;
  v25 = a1;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __82__HDWorkoutClusterComponentEntity_associateWorkout_withCluster_transaction_error___block_invoke_2;
  v20[3] = &unk_1E6CE7750;
  v21 = v11;
  v22 = v10;
  v16 = v10;
  v17 = v11;
  v18 = v14;
  LOBYTE(a6) = objc_msgSend(v15, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &associateWorkout_withCluster_transaction_error__insertKey, a6, v23, v20, 0);

  return (char)a6;
}

uint64_t __82__HDWorkoutClusterComponentEntity_associateWorkout_withCluster_transaction_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "insertSQLForProperties:shouldReplace:", *(_QWORD *)(a1 + 32), 1);
}

uint64_t __82__HDWorkoutClusterComponentEntity_associateWorkout_withCluster_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
  return sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 40), "persistentID"));
}

+ (BOOL)removeWorkout:(id)a3 fromCluster:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = a5;
  objc_msgSend(a1, "databaseTable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ = ? AND %@ = ?"), v14, CFSTR("cluster_id"), CFSTR("workout_id"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "databaseForEntityClass:", a1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __79__HDWorkoutClusterComponentEntity_removeWorkout_fromCluster_transaction_error___block_invoke;
  v20[3] = &unk_1E6CE7750;
  v21 = v11;
  v22 = v10;
  v17 = v10;
  v18 = v11;
  LOBYTE(a6) = objc_msgSend(v16, "executeSQL:error:bindingHandler:enumerationHandler:", v15, a6, v20, 0);

  return (char)a6;
}

uint64_t __79__HDWorkoutClusterComponentEntity_removeWorkout_fromCluster_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
  return sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 40), "persistentID"));
}

+ (BOOL)enumerateWorkoutsForCluster:(id)a3 transaction:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];

  v10 = a3;
  v11 = a6;
  objc_msgSend(a4, "databaseForEntityClass:", a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v10;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __87__HDWorkoutClusterComponentEntity_enumerateWorkoutsForCluster_transaction_error_block___block_invoke;
  v20[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v20[4] = a1;
  v17 = v11;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __87__HDWorkoutClusterComponentEntity_enumerateWorkoutsForCluster_transaction_error_block___block_invoke_2;
  v18[3] = &unk_1E6CE9508;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __87__HDWorkoutClusterComponentEntity_enumerateWorkoutsForCluster_transaction_error_block___block_invoke_3;
  v16[3] = &unk_1E6CE82B0;
  v13 = v11;
  v14 = v10;
  LOBYTE(a5) = objc_msgSend(v12, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &enumerateWorkoutsForCluster_transaction_error_block__enumerationKey, a5, v20, v18, v16);

  return (char)a5;
}

id __87__HDWorkoutClusterComponentEntity_enumerateWorkoutsForCluster_transaction_error_block___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "databaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@ = ?"), CFSTR("workout_id"), v2, CFSTR("cluster_id"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __87__HDWorkoutClusterComponentEntity_enumerateWorkoutsForCluster_transaction_error_block___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
}

uint64_t __87__HDWorkoutClusterComponentEntity_enumerateWorkoutsForCluster_transaction_error_block___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v3 = *(id *)(a1 + 32);
  v1 = HKWithAutoreleasePool();

  return v1;
}

uint64_t __87__HDWorkoutClusterComponentEntity_enumerateWorkoutsForCluster_transaction_error_block___block_invoke_4(uint64_t a1)
{
  HDWorkoutEntity *v2;
  uint64_t v3;

  v2 = -[HDSQLiteEntity initWithPersistentID:]([HDWorkoutEntity alloc], "initWithPersistentID:", HDSQLiteColumnAsInt64());
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v3;
}

+ (id)numberOfWorkoutsInCluster:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v8 = a3;
  v9 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "databaseTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("SELECT COUNT(*) FROM %@ WHERE %@ = ?"), v11, CFSTR("cluster_id"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "databaseForEntityClass:", a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __79__HDWorkoutClusterComponentEntity_numberOfWorkoutsInCluster_transaction_error___block_invoke;
  v19[3] = &unk_1E6CE9508;
  v15 = v8;
  v20 = v15;
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __79__HDWorkoutClusterComponentEntity_numberOfWorkoutsInCluster_transaction_error___block_invoke_2;
  v18[3] = &unk_1E6CE8540;
  v18[4] = &v21;
  if (objc_msgSend(v13, "executeSQL:error:bindingHandler:enumerationHandler:", v12, a5, v19, v18))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v22[3]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  _Block_object_dispose(&v21, 8);
  return v16;
}

uint64_t __79__HDWorkoutClusterComponentEntity_numberOfWorkoutsInCluster_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
}

uint64_t __79__HDWorkoutClusterComponentEntity_numberOfWorkoutsInCluster_transaction_error___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

+ (id)databaseTable
{
  return CFSTR("RacePreviousRoute_workout_cluster_components");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 2;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_111;
}

+ (id)uniquedColumns
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("cluster_id");
  v3[1] = CFSTR("workout_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("cluster_id");
  +[HDHealthEntity defaultForeignKey](HDWorkoutClusterEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("workout_id");
  v7[0] = v2;
  +[HDDataEntity defaultForeignKey](HDWorkoutEntity, "defaultForeignKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (int64_t)protectionClass
{
  return 2;
}

@end
