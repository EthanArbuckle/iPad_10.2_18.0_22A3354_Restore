@implementation HDRaceRouteSnapshotEntity

+ (id)insertSnapshotData:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  HDRaceRouteSnapshotEntity *v13;
  HDRaceRouteSnapshotEntity *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "databaseForEntityClass:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = -1;
  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __66__HDRaceRouteSnapshotEntity_insertSnapshotData_transaction_error___block_invoke;
  v20[3] = &unk_1E6CE9508;
  v12 = v8;
  v21 = v12;
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __66__HDRaceRouteSnapshotEntity_insertSnapshotData_transaction_error___block_invoke_2;
  v19[3] = &unk_1E6CE8540;
  v19[4] = &v22;
  if ((objc_msgSend(v10, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT ROWID FROM RacePreviousRoute_route_snapshot WHERE data = ?"), a5, v20, v19) & 1) != 0)
  {
    if (v23[3] < 0)
    {
      v26[0] = CFSTR("data");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v11;
      v17[1] = 3221225472;
      v17[2] = __66__HDRaceRouteSnapshotEntity_insertSnapshotData_transaction_error___block_invoke_3;
      v17[3] = &unk_1E6CE84C8;
      v18 = v12;
      objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 0, v10, v15, a5, v17);
      v14 = (HDRaceRouteSnapshotEntity *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = [HDRaceRouteSnapshotEntity alloc];
      v14 = -[HDSQLiteEntity initWithPersistentID:](v13, "initWithPersistentID:", v23[3]);
    }
  }
  else
  {
    v14 = 0;
  }

  _Block_object_dispose(&v22, 8);
  return v14;
}

uint64_t __66__HDRaceRouteSnapshotEntity_insertSnapshotData_transaction_error___block_invoke()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __66__HDRaceRouteSnapshotEntity_insertSnapshotData_transaction_error___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

void __66__HDRaceRouteSnapshotEntity_insertSnapshotData_transaction_error___block_invoke_3()
{
  JUMPOUT(0x1BCCAB0D8);
}

+ (BOOL)pruneUnreachableDataWithTransaction:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  +[HDWorkoutClusterEntity databaseTable](HDWorkoutClusterEntity, "databaseTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDRaceRouteClusterEntity databaseTable](HDRaceRouteClusterEntity, "databaseTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("DELETE FROM RacePreviousRoute_route_snapshot WHERE (NOT EXISTS (SELECT * FROM %@ WHERE %@ = RacePreviousRoute_route_snapshot.ROWID)) AND (NOT EXISTS (SELECT * FROM %@ WHERE %@ = RacePreviousRoute_route_snapshot.ROWID))"), v8, CFSTR("snapshot_id"), v9, CFSTR("snapshot_id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "databaseForEntityClass:", a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = objc_msgSend(v11, "executeSQL:error:bindingHandler:enumerationHandler:", v10, a4, 0, 0);
  return (char)a4;
}

- (BOOL)updateSnapshotData:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v17[0] = CFSTR("data");
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a4;
  objc_msgSend(v9, "arrayWithObjects:count:", v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "databaseForEntity:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__HDRaceRouteSnapshotEntity_updateSnapshotData_transaction_error___block_invoke;
  v15[3] = &unk_1E6CE84C8;
  v16 = v8;
  v13 = v8;
  LOBYTE(a5) = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](self, "updateProperties:database:error:bindingHandler:", v11, v12, a5, v15);

  return (char)a5;
}

void __66__HDRaceRouteSnapshotEntity_updateSnapshotData_transaction_error___block_invoke()
{
  JUMPOUT(0x1BCCAB0D8);
}

- (id)snapshotDataWithTransaction:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
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
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__202;
  v16 = __Block_byref_object_dispose__202;
  v17 = 0;
  v18[0] = CFSTR("data");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "databaseForEntity:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__HDRaceRouteSnapshotEntity_snapshotDataWithTransaction_error___block_invoke;
  v11[3] = &unk_1E6CEEDC8;
  v11[4] = &v12;
  LODWORD(self) = -[HDSQLiteEntity getValuesForProperties:database:handler:](self, "getValuesForProperties:database:handler:", v6, v7, v11);

  if ((_DWORD)self)
    v8 = (void *)v13[5];
  else
    v8 = 0;
  v9 = v8;
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __63__HDRaceRouteSnapshotEntity_snapshotDataWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  HDSQLiteColumnWithNameAsData();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)deleteDataWithTransaction:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  +[HDWorkoutClusterEntity databaseTable](HDWorkoutClusterEntity, "databaseTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDRaceRouteClusterEntity databaseTable](HDRaceRouteClusterEntity, "databaseTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("DELETE FROM RacePreviousRoute_route_snapshot WHERE ROWID = ? AND((SELECT COUNT(*) FROM %@ WHERE %@ = RacePreviousRoute_route_snapshot.ROWID) + (SELECT COUNT(*) FROM %@ WHERE %@ = RacePreviousRoute_route_snapshot.ROWID) <= 1)"), v8, CFSTR("snapshot_id"), v9, CFSTR("snapshot_id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "databaseForEntity:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__HDRaceRouteSnapshotEntity_deleteDataWithTransaction_error___block_invoke;
  v13[3] = &unk_1E6CE9508;
  v13[4] = self;
  LOBYTE(a4) = objc_msgSend(v11, "executeSQL:error:bindingHandler:enumerationHandler:", v10, a4, v13, 0);

  return (char)a4;
}

uint64_t __61__HDRaceRouteSnapshotEntity_deleteDataWithTransaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
}

+ (id)databaseTable
{
  return CFSTR("RacePreviousRoute_route_snapshot");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 2;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_101;
}

+ (int64_t)protectionClass
{
  return 2;
}

@end
