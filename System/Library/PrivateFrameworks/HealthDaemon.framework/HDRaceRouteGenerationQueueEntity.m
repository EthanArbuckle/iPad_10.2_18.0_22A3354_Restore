@implementation HDRaceRouteGenerationQueueEntity

+ (BOOL)populateWithWorkoutClusters:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  char v13;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("INSERT OR IGNORE INTO RacePreviousRoute_generation_queue (workout_cluster_id) VALUES (?)"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v8, "count") >= 2)
    {
      v11 = 1;
      do
      {
        objc_msgSend(v10, "appendString:", CFSTR(",(?)"));
        ++v11;
      }
      while (objc_msgSend(v8, "count") > v11);
    }
    objc_msgSend(v9, "databaseForEntityClass:", a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __82__HDRaceRouteGenerationQueueEntity_populateWithWorkoutClusters_transaction_error___block_invoke;
    v15[3] = &unk_1E6CE9508;
    v16 = v8;
    v13 = objc_msgSend(v12, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", v10, a5, v15, 0);

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

unint64_t __82__HDRaceRouteGenerationQueueEntity_populateWithWorkoutClusters_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  unint64_t result;
  unint64_t v5;
  unint64_t v6;
  void *v7;

  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result)
  {
    v5 = 0;
    do
    {
      v6 = v5 + 1;
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      sqlite3_bind_int64(a2, v6, objc_msgSend(v7, "persistentID"));

      result = objc_msgSend(*(id *)(a1 + 32), "count");
      v5 = v6;
    }
    while (result > v6);
  }
  return result;
}

+ (id)nextWorkoutClusterWithTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__56;
  v16 = __Block_byref_object_dispose__56;
  v17 = 0;
  objc_msgSend(v6, "databaseForEntityClass:", a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__HDRaceRouteGenerationQueueEntity_nextWorkoutClusterWithTransaction_error___block_invoke;
  v11[3] = &unk_1E6CE8540;
  v11[4] = &v12;
  LODWORD(a4) = objc_msgSend(v7, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT workout_cluster_id FROM RacePreviousRoute_generation_queue WHERE concrete_cluster_id IS NULL LIMIT 1"), a4, 0, v11);

  if ((_DWORD)a4)
    v8 = (void *)v13[5];
  else
    v8 = 0;
  v9 = v8;
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __76__HDRaceRouteGenerationQueueEntity_nextWorkoutClusterWithTransaction_error___block_invoke(uint64_t a1)
{
  HDWorkoutClusterEntity *v2;
  uint64_t v3;
  void *v4;

  v2 = -[HDSQLiteEntity initWithPersistentID:]([HDWorkoutClusterEntity alloc], "initWithPersistentID:", HDSQLiteColumnAsInt64());
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return 0;
}

+ (BOOL)finishWorkoutCluster:(id)a3 concreteCluster:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;

  v10 = a3;
  v11 = a4;
  objc_msgSend(a5, "databaseForEntityClass:", a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __91__HDRaceRouteGenerationQueueEntity_finishWorkoutCluster_concreteCluster_transaction_error___block_invoke;
  v16[3] = &unk_1E6CE7750;
  v17 = v11;
  v18 = v10;
  v13 = v10;
  v14 = v11;
  LOBYTE(a6) = objc_msgSend(v12, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("UPDATE RacePreviousRoute_generation_queue SET concrete_cluster_id = ? WHERE workout_cluster_id = ?"), a6, v16, 0);

  return (char)a6;
}

uint64_t __91__HDRaceRouteGenerationQueueEntity_finishWorkoutCluster_concreteCluster_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
  return sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 40), "persistentID"));
}

+ (id)clearQueueWithTransaction:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  int v10;
  _QWORD v12[4];
  id v13;

  objc_msgSend(a3, "databaseForEntityClass:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__HDRaceRouteGenerationQueueEntity_clearQueueWithTransaction_error___block_invoke;
  v12[3] = &unk_1E6CE8CF8;
  v7 = v6;
  v13 = v7;
  v8 = 0;
  if (objc_msgSend(v5, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT concrete_cluster_id FROM RacePreviousRoute_generation_queue WHERE concrete_cluster_id IS NOT NULL"), a4, 0, v12))
  {
    v9 = v5;
    objc_opt_self();
    v10 = objc_msgSend(v9, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("DELETE FROM RacePreviousRoute_generation_queue"), a4, 0, 0);

    v8 = 0;
    if (v10)
      v8 = (void *)objc_msgSend(v7, "copy");
  }

  return v8;
}

uint64_t __68__HDRaceRouteGenerationQueueEntity_clearQueueWithTransaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  HDRaceRouteClusterEntity *v2;

  v1 = *(void **)(a1 + 32);
  v2 = -[HDSQLiteEntity initWithPersistentID:]([HDRaceRouteClusterEntity alloc], "initWithPersistentID:", HDSQLiteColumnAsInt64());
  objc_msgSend(v1, "addObject:", v2);

  return 1;
}

+ (id)databaseTable
{
  return CFSTR("RacePreviousRoute_generation_queue");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 2;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_28;
}

+ (id)uniquedColumns
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("workout_cluster_id");
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
  v5 = CFSTR("workout_cluster_id");
  +[HDHealthEntity defaultForeignKey](HDWorkoutClusterEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (int64_t)protectionClass
{
  return 2;
}

@end
