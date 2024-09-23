@implementation HDRaceRouteWorkoutEntity

+ (id)insertCodableRacingMetrics:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "routePoints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDRaceRouteLocationSeriesEntity insertCodableRoutePoints:transaction:error:](HDRaceRouteLocationSeriesEntity, "insertCodableRoutePoints:transaction:error:", v10, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB3A28];
    objc_msgSend(v8, "workoutUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hk_UUIDWithData:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[HDRaceRouteWorkoutEntity _insertWithWorkoutUUID:seriesKey:transaction:error:]((uint64_t)a1, v14, objc_msgSend(v11, "longLongValue"), v9, (uint64_t)a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)_insertWithWorkoutUUID:(uint64_t)a3 seriesKey:(void *)a4 transaction:(uint64_t)a5 error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a4;
  v10 = (void *)objc_opt_self();
  objc_msgSend(v9, "databaseForEntityClass:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = CFSTR("workout_uuid");
  v19[1] = CFSTR("route_key");
  v19[2] = CFSTR("date_to_delete");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__HDRaceRouteWorkoutEntity__insertWithWorkoutUUID_seriesKey_transaction_error___block_invoke;
  v16[3] = &unk_1E6CECA50;
  v17 = v8;
  v18 = a3;
  v13 = v8;
  objc_msgSend(v10, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 0, v11, v12, a5, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (BOOL)insertCodableRoutePoints:(id)a3 workoutPersistentID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;

  v10 = a3;
  v11 = a5;
  +[HDRaceRouteWorkoutEntity _routeKeyForPersistentID:transaction:error:]((uint64_t)a1, a4, v11, (uint64_t)a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v14 = +[HDRaceRouteLocationSeriesEntity insertCodableRoutePoints:seriesKey:transaction:error:](HDRaceRouteLocationSeriesEntity, "insertCodableRoutePoints:seriesKey:transaction:error:", v10, objc_msgSend(v12, "longLongValue"), v11, a6);
  else
    v14 = 0;

  return v14;
}

+ (id)_routeKeyForPersistentID:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_self();
  objc_msgSend(v6, "databaseForEntityClass:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithProperty:equalToValue:", CFSTR("ROWID"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__131;
  v21 = __Block_byref_object_dispose__131;
  v22 = 0;
  objc_msgSend(v7, "queryWithDatabase:predicate:", v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = CFSTR("route_key");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__HDRaceRouteWorkoutEntity__routeKeyForPersistentID_transaction_error___block_invoke;
  v16[3] = &unk_1E6CF04E8;
  v16[4] = &v17;
  objc_msgSend(v12, "enumerateProperties:error:enumerationHandler:", v13, a4, v16);

  v14 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v14;
}

+ (id)createRaceRouteWorkoutFromWorkout:(id)a3 transaction:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = a3;
  v11 = a4;
  +[HDRaceRouteLocationSeriesEntity createRoutePointsFromWorkout:transaction:profile:error:](HDRaceRouteLocationSeriesEntity, "createRoutePointsFromWorkout:transaction:profile:error:", v10, v11, a5, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v11, "databaseForEntity:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDForProperty:database:", CFSTR("uuid"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      +[HDRaceRouteWorkoutEntity _insertWithWorkoutUUID:seriesKey:transaction:error:]((uint64_t)a1, v14, objc_msgSend(v12, "longLongValue"), v11, (uint64_t)a6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (BOOL)markForDeletionWorkoutDataWithPersistentID:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  int64_t v17;
  _QWORD v18[5];

  objc_msgSend(a4, "databaseForEntityClass:", a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6EB8], "workoutType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "maximumAllowedDuration");
  v11 = v10;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = a3;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __89__HDRaceRouteWorkoutEntity_markForDeletionWorkoutDataWithPersistentID_transaction_error___block_invoke;
  v18[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v18[4] = a1;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__HDRaceRouteWorkoutEntity_markForDeletionWorkoutDataWithPersistentID_transaction_error___block_invoke_2;
  v15[3] = &unk_1E6CE82D8;
  v16 = v12;
  v13 = v12;
  LOBYTE(a5) = objc_msgSend(v8, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &markForDeletionWorkoutDataWithPersistentID_transaction_error__updateDateKey, a5, v18, v15, 0);

  return (char)a5;
}

id __89__HDRaceRouteWorkoutEntity_markForDeletionWorkoutDataWithPersistentID_transaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "databaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = ? WHERE %@ = ? AND %@ IS NULL"), v2, CFSTR("date_to_delete"), CFSTR("ROWID"), CFSTR("date_to_delete"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __89__HDRaceRouteWorkoutEntity_markForDeletionWorkoutDataWithPersistentID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

+ (BOOL)pruneWorkoutsMarkedForDeletionInTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  char v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "databaseForEntityClass:", a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithProperty:lessThanValue:", CFSTR("date_to_delete"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "queryWithDatabase:predicate:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = CFSTR("route_key");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78__HDRaceRouteWorkoutEntity_pruneWorkoutsMarkedForDeletionInTransaction_error___block_invoke;
  v17[3] = &unk_1E6CF6008;
  v13 = v6;
  v18 = v13;
  v14 = objc_msgSend(v11, "enumerateProperties:error:enumerationHandler:", v12, a4, v17);

  if (v14)
    v15 = objc_msgSend(a1, "deleteEntitiesInDatabase:predicate:error:", v7, v10, a4);
  else
    v15 = 0;

  return v15;
}

BOOL __78__HDRaceRouteWorkoutEntity_pruneWorkoutsMarkedForDeletionInTransaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[HDRaceRouteLocationSeriesEntity deleteSeriesDataWithIdentifier:transaction:error:](HDRaceRouteLocationSeriesEntity, "deleteSeriesDataWithIdentifier:transaction:error:", HDSQLiteColumnWithNameAsInt64(), *(_QWORD *)(a1 + 32), a4);
}

+ (BOOL)enumerateRoutePointsForWorkoutUUID:(id)a3 timestampAnchor:(double)a4 limit:(unint64_t)a5 profile:(id)a6 error:(id *)a7 dataHandler:(id)a8
{
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  double v24;
  unint64_t v25;

  v14 = a3;
  v15 = a8;
  objc_msgSend(a6, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __111__HDRaceRouteWorkoutEntity_enumerateRoutePointsForWorkoutUUID_timestampAnchor_limit_profile_error_dataHandler___block_invoke;
  v20[3] = &unk_1E6CFEE78;
  v22 = v15;
  v23 = a1;
  v24 = a4;
  v25 = a5;
  v21 = v14;
  v17 = v15;
  v18 = v14;
  LOBYTE(a7) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v16, a7, v20);

  return (char)a7;
}

BOOL __111__HDRaceRouteWorkoutEntity_enumerateRoutePointsForWorkoutUUID_timestampAnchor_limit_profile_error_dataHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  _BOOL8 v13;
  _QWORD v15[4];
  id v16;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 48), "entityForWorkoutUUID:transaction:error:", *(_QWORD *)(a1 + 32), v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "numberForProperty:transaction:error:", CFSTR("route_key"), v5, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(v8, "longLongValue");
      v11 = *(double *)(a1 + 56);
      v12 = *(_QWORD *)(a1 + 64);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __111__HDRaceRouteWorkoutEntity_enumerateRoutePointsForWorkoutUUID_timestampAnchor_limit_profile_error_dataHandler___block_invoke_2;
      v15[3] = &unk_1E6CFEE50;
      v16 = *(id *)(a1 + 40);
      v13 = +[HDRaceRouteLocationSeriesEntity enumerateRoutePointsForSeries:timestampAnchor:limit:transaction:error:handler:](HDRaceRouteLocationSeriesEntity, "enumerateRoutePointsForSeries:timestampAnchor:limit:transaction:error:handler:", v10, v12, v5, a3, v15, v11);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __111__HDRaceRouteWorkoutEntity_enumerateRoutePointsForWorkoutUUID_timestampAnchor_limit_profile_error_dataHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)enumerateRoutePointsForWorkoutPersistentID:(int64_t)a3 timestampAnchor:(double)a4 limit:(unint64_t)a5 startDuration:(double)a6 finishDuration:(double)a7 transaction:(id)a8 error:(id *)a9 handler:(id)a10
{
  id v18;
  id v19;
  void *v20;
  void *v21;
  BOOL v22;

  v18 = a8;
  v19 = a10;
  +[HDRaceRouteWorkoutEntity _routeKeyForPersistentID:transaction:error:]((uint64_t)a1, a3, v18, (uint64_t)a9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
    v22 = +[HDRaceRouteLocationSeriesEntity enumerateRoutePointsForSeries:timestampAnchor:limit:startDuration:finishDuration:transaction:error:handler:](HDRaceRouteLocationSeriesEntity, "enumerateRoutePointsForSeries:timestampAnchor:limit:startDuration:finishDuration:transaction:error:handler:", objc_msgSend(v20, "longLongValue"), a5, v18, a9, v19, a4, a6, a7);
  else
    v22 = 0;

  return v22;
}

+ (id)entityForWorkoutUUID:(id)a3 transaction:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = (void *)MEMORY[0x1E0D29838];
  v9 = a4;
  objc_msgSend(v8, "predicateWithProperty:equalToValue:", CFSTR("workout_uuid"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseForEntityClass:", a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "anyInDatabase:predicate:error:", v11, v10, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)startingPointForWorkoutWithPersistentID:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v8 = a4;
  +[HDRaceRouteWorkoutEntity _routeKeyForPersistentID:transaction:error:]((uint64_t)a1, a3, v8, (uint64_t)a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__131;
    v20 = __Block_byref_object_dispose__131;
    v21 = 0;
    v11 = objc_msgSend(v9, "longLongValue");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __86__HDRaceRouteWorkoutEntity_startingPointForWorkoutWithPersistentID_transaction_error___block_invoke;
    v15[3] = &unk_1E6CFEEA0;
    v15[4] = &v16;
    if (+[HDRaceRouteLocationSeriesEntity enumerateRoutePointsForSeries:timestampAnchor:limit:transaction:error:handler:](HDRaceRouteLocationSeriesEntity, "enumerateRoutePointsForSeries:timestampAnchor:limit:transaction:error:handler:", v11, 1, v8, a5, v15, -1.0))
    {
      v12 = (void *)v17[5];
    }
    else
    {
      v12 = 0;
    }
    v13 = v12;
    _Block_object_dispose(&v16, 8);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __86__HDRaceRouteWorkoutEntity_startingPointForWorkoutWithPersistentID_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (objc_class *)MEMORY[0x1E0C9E3B8];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "latitude_deg");
  v7 = v6;
  objc_msgSend(v4, "longitude_deg");
  v9 = v8;

  v10 = objc_msgSend(v5, "initWithLatitude:longitude:", v7, v9);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  return 0;
}

- (id)dateToDeleteInTransaction:(id)a3 error:(id *)a4
{
  return -[HDHealthEntity dateForProperty:transaction:error:](self, "dateForProperty:transaction:error:", CFSTR("date_to_delete"), a3, a4);
}

- (BOOL)setDateToDelete:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return -[HDHealthEntity setDate:forProperty:transaction:error:](self, "setDate:forProperty:transaction:error:", a3, CFSTR("date_to_delete"), a4, a5);
}

+ (id)databaseTable
{
  return CFSTR("RacePreviousRoute_workout");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_67;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)privateSubEntities
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __71__HDRaceRouteWorkoutEntity__routeKeyForPersistentID_transaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  HDSQLiteColumnWithNameAsNumber();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return 0;
}

void __79__HDRaceRouteWorkoutEntity__insertWithWorkoutUUID_seriesKey_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1BCCAB168](a2, CFSTR("workout_uuid"), *(_QWORD *)(a1 + 32));
  MEMORY[0x1BCCAB114](a2, CFSTR("route_key"), *(_QWORD *)(a1 + 40));
  JUMPOUT(0x1BCCAB120);
}

@end
