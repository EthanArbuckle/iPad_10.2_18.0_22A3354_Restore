@implementation HDActivityCacheEntity

+ (BOOL)supportsObjectMerging
{
  return 1;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
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
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = (void *)objc_opt_class();
  if ((objc_msgSend(v15, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDActivityCacheEntity.m"), 204, CFSTR("Subclasses must override %s"), "+[HDActivityCacheEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");

  }
  objc_opt_self();
  objc_msgSend(v12, "dailyEnergyBurnedStatistics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16
    && (v17 = (void *)MEMORY[0x1E0CB36F8],
        objc_msgSend(v12, "dailyEnergyBurnedStatistics"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v17, "archivedDataWithRootObject:requiringSecureCoding:error:", v18, 1, a7),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v18,
        !v16))
  {
    v28 = 0;
  }
  else
  {
    objc_msgSend(v12, "dailyMoveMinutesStatistics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19
      && (v20 = (void *)MEMORY[0x1E0CB36F8],
          objc_msgSend(v12, "dailyMoveMinutesStatistics"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v20, "archivedDataWithRootObject:requiringSecureCoding:error:", v21, 1, a7),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v21,
          !v19))
    {
      v28 = 0;
    }
    else
    {
      objc_msgSend(v12, "dailyBriskMinutesStatistics");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22
        && (v23 = (void *)MEMORY[0x1E0CB36F8],
            objc_msgSend(v12, "dailyBriskMinutesStatistics"),
            v24 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v23, "archivedDataWithRootObject:requiringSecureCoding:error:", v24, 1, a7),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v24,
            !v22))
      {
        v28 = 0;
      }
      else
      {
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __87__HDActivityCacheEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
        v31[3] = &unk_1E6D00D08;
        v25 = v14;
        v32 = v25;
        v33 = v12;
        v34 = v16;
        v35 = v19;
        v36 = v22;
        v26 = v22;
        if (objc_msgSend(v13, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO activity_caches (data_id, cache_index, sequence, activity_mode, paused, wheelchair_use, energy_burned, energy_burned_goal, energy_burned_goal_date, move_minutes, move_minutes_goal, move_minutes_goal_date, brisk_minutes, brisk_minutes_goal, brisk_minutes_goal_date, active_hours, active_hours_goal, active_hours_goal_date, steps, pushes, walk_distance, deep_breathing_duration, flights, energy_burned_stats, move_minutes_stats, brisk_minutes_stats, version) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"), a7, v31, 0))v27 = v25;
        else
          v27 = 0;
        v28 = v27;

      }
    }

  }
  return v28;
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3)
    objc_msgSend(a4, "addActivityCaches:", a3);
  return a3 != 0;
}

+ (id)databaseTable
{
  return CFSTR("activity_caches");
}

uint64_t __87__HDActivityCacheEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;

  sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 40), "cacheIndex"));
  sqlite3_bind_int64(a2, 3, objc_msgSend(*(id *)(a1 + 40), "sequence"));
  sqlite3_bind_int64(a2, 4, objc_msgSend(*(id *)(a1 + 40), "activityMoveMode"));
  sqlite3_bind_int(a2, 5, objc_msgSend(*(id *)(a1 + 40), "isPaused"));
  if (objc_msgSend(*(id *)(a1 + 40), "hasWheelchairUse"))
    sqlite3_bind_int64(a2, 6, objc_msgSend(*(id *)(a1 + 40), "wheelchairUse"));
  else
    sqlite3_bind_null(a2, 6);
  if (objc_msgSend(*(id *)(a1 + 40), "hasEnergyBurned"))
  {
    objc_msgSend(*(id *)(a1 + 40), "energyBurned");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "kilocalorieUnit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValueForUnit:", v5);
    sqlite3_bind_double(a2, 7, v6);

  }
  else
  {
    sqlite3_bind_null(a2, 7);
  }
  if (objc_msgSend(*(id *)(a1 + 40), "hasEnergyBurnedGoal"))
  {
    objc_msgSend(*(id *)(a1 + 40), "energyBurnedGoal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "kilocalorieUnit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValueForUnit:", v8);
    sqlite3_bind_double(a2, 8, v9);

    objc_msgSend(*(id *)(a1 + 40), "energyBurnedGoalDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    sqlite3_bind_double(a2, 9, v11);

  }
  else
  {
    sqlite3_bind_null(a2, 8);
    sqlite3_bind_null(a2, 9);
  }
  if (objc_msgSend(*(id *)(a1 + 40), "hasMoveMinutes"))
  {
    objc_msgSend(*(id *)(a1 + 40), "moveMinutes");
    sqlite3_bind_double(a2, 10, v12);
  }
  else
  {
    sqlite3_bind_null(a2, 10);
  }
  if (objc_msgSend(*(id *)(a1 + 40), "hasMoveMinutesGoal"))
  {
    objc_msgSend(*(id *)(a1 + 40), "moveMinutesGoal");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValueForUnit:", v14);
    sqlite3_bind_double(a2, 11, v15);

    objc_msgSend(*(id *)(a1 + 40), "moveMinutesGoalDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceReferenceDate");
    sqlite3_bind_double(a2, 12, v17);

  }
  else
  {
    sqlite3_bind_null(a2, 11);
    sqlite3_bind_null(a2, 12);
  }
  if (objc_msgSend(*(id *)(a1 + 40), "hasBriskMinutes"))
  {
    objc_msgSend(*(id *)(a1 + 40), "briskMinutes");
    sqlite3_bind_double(a2, 13, v18);
  }
  else
  {
    sqlite3_bind_null(a2, 13);
  }
  if (objc_msgSend(*(id *)(a1 + 40), "hasBriskMinutesGoal"))
  {
    objc_msgSend(*(id *)(a1 + 40), "briskMinutesGoal");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValueForUnit:", v20);
    sqlite3_bind_double(a2, 14, v21);

  }
  else
  {
    sqlite3_bind_null(a2, 14);
  }
  if (objc_msgSend(*(id *)(a1 + 40), "hasBriskMinutesGoalDate"))
  {
    objc_msgSend(*(id *)(a1 + 40), "briskMinutesGoalDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "timeIntervalSinceReferenceDate");
    sqlite3_bind_double(a2, 15, v23);

  }
  else
  {
    sqlite3_bind_null(a2, 15);
  }
  if (objc_msgSend(*(id *)(a1 + 40), "hasActiveHours"))
  {
    objc_msgSend(*(id *)(a1 + 40), "activeHours");
    sqlite3_bind_double(a2, 16, v24);
  }
  else
  {
    sqlite3_bind_null(a2, 16);
  }
  if (objc_msgSend(*(id *)(a1 + 40), "hasActiveHoursGoal"))
  {
    objc_msgSend(*(id *)(a1 + 40), "activeHoursGoal");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValueForUnit:", v26);
    sqlite3_bind_double(a2, 17, v27);

  }
  else
  {
    sqlite3_bind_null(a2, 17);
  }
  if (objc_msgSend(*(id *)(a1 + 40), "hasActiveHoursGoalDate"))
  {
    objc_msgSend(*(id *)(a1 + 40), "activeHoursGoalDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "timeIntervalSinceReferenceDate");
    sqlite3_bind_double(a2, 18, v29);

  }
  else
  {
    sqlite3_bind_null(a2, 18);
  }
  if (objc_msgSend(*(id *)(a1 + 40), "hasStepCount"))
    sqlite3_bind_int64(a2, 19, objc_msgSend(*(id *)(a1 + 40), "stepCount"));
  else
    sqlite3_bind_null(a2, 19);
  if (objc_msgSend(*(id *)(a1 + 40), "hasPushCount"))
    sqlite3_bind_int64(a2, 20, objc_msgSend(*(id *)(a1 + 40), "pushCount"));
  else
    sqlite3_bind_null(a2, 20);
  if (objc_msgSend(*(id *)(a1 + 40), "hasWalkingAndRunningDistance"))
  {
    objc_msgSend(*(id *)(a1 + 40), "walkingAndRunningDistance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "doubleValueForUnit:", v31);
    sqlite3_bind_double(a2, 21, v32);

  }
  else
  {
    sqlite3_bind_null(a2, 21);
  }
  if (objc_msgSend(*(id *)(a1 + 40), "hasDeepBreathingDuration"))
  {
    objc_msgSend(*(id *)(a1 + 40), "deepBreathingDuration");
    sqlite3_bind_double(a2, 22, v33);
  }
  else
  {
    sqlite3_bind_null(a2, 22);
  }
  if (objc_msgSend(*(id *)(a1 + 40), "hasFlightsClimbed"))
    sqlite3_bind_int64(a2, 23, objc_msgSend(*(id *)(a1 + 40), "flightsClimbed"));
  else
    sqlite3_bind_null(a2, 23);
  if (objc_msgSend(*(id *)(a1 + 40), "hasDailyEnergyBurnedStatistics"))
  {
    _HDSQLiteValueForData();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteBindFoundationValueToStatement();

  }
  else
  {
    sqlite3_bind_null(a2, 24);
  }
  if (objc_msgSend(*(id *)(a1 + 40), "hasDailyMoveMinutesStatistics"))
  {
    _HDSQLiteValueForData();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteBindFoundationValueToStatement();

  }
  else
  {
    sqlite3_bind_null(a2, 25);
  }
  if (objc_msgSend(*(id *)(a1 + 40), "hasDailyBriskMinutesStatistics"))
  {
    _HDSQLiteValueForData();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteBindFoundationValueToStatement();

  }
  else
  {
    sqlite3_bind_null(a2, 26);
  }
  return sqlite3_bind_int64(a2, 27, objc_msgSend(*(id *)(a1 + 40), "version"));
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 27;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_73;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("data_id");
  +[HDDataEntity defaultForeignKey](HDSampleEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)indices
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D29860]);
  v3 = objc_opt_class();
  v9[0] = CFSTR("cache_index");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithEntity:name:columns:", v3, CFSTR("cache_index"), v4);

  v8 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)activityCacheForIndex:(int64_t)a3 profile:(id)a4 encodingOptions:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v9 = a5;
  v10 = a4;
  HDActivityCacheEntityPredicateForCacheIndex(a3, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6978], "activityCacheType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSampleEntity anySampleOfType:profile:encodingOptions:predicate:error:](HDActivityCacheEntity, "anySampleOfType:profile:encodingOptions:predicate:error:", v12, v10, v9, v11, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)mergeDataObject:(id)a3 provenance:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7 insertHandler:(id)a8
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  NSObject *v33;
  void (**v36)(id, id, id *);
  id v37;
  id v38;
  id v39;
  _QWORD v40[6];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  id v45;
  id v46;
  uint8_t v47[4];
  id v48;
  __int16 v49;
  id v50;
  _BYTE buf[24];
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v38 = a4;
  v14 = a5;
  v37 = a6;
  v36 = (void (**)(id, id, id *))a8;
  HDActivityCacheEntityPredicateForCacheIndex(objc_msgSend(v13, "cacheIndex"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "sourceID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HDDataEntityPredicateForSourceIdentifier((uint64_t)v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v17, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "sequence") < 1)
  {
    _HKInitializeLogging();
    v24 = *MEMORY[0x1E0CB5268];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5268], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v13;
      _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "Attempting to merge new activity cache (%@) with no sequence number, defaulting to old behavior of always replacing", buf, 0xCu);
    }
    v21 = 0;
LABEL_16:
    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v52 = __Block_byref_object_copy__145;
    v53 = __Block_byref_object_dispose__145;
    v54 = 0;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __92__HDActivityCacheEntity_mergeDataObject_provenance_profile_transaction_error_insertHandler___block_invoke;
    v40[3] = &unk_1E6CFA9A8;
    v40[4] = &v41;
    v40[5] = buf;
    objc_msgSend(a1, "deleteSamplesWithPredicate:limit:generateDeletedObjects:transaction:profile:recursiveDeleteAuthorizationBlock:completionHandler:", v18, 0, 0, v37, v14, 0, v40);
    if (*((_BYTE *)v42 + 24))
    {
      v39 = 0;
      v36[2](v36, v13, &v39);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (uint64_t)v39;
      if (!(v27 | v28))
      {
        _HKInitializeLogging();
        v29 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)v47 = 138543618;
          v48 = v13;
          v49 = 2114;
          v50 = v38;
          _os_log_fault_impl(&dword_1B7802000, v29, OS_LOG_TYPE_FAULT, "Unable to insert %{public}@ for %{public}@ when replacing existing cache, and no error was returned", v47, 0x16u);
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 124, CFSTR("Failed to insert activity cache during merge replacement"));
        v28 = objc_claimAutoreleasedReturnValue();
      }
      v30 = (id)v28;
      v31 = v30;
      if (v30)
      {
        if (a7)
          *a7 = objc_retainAutorelease(v30);
        else
          _HKLogDroppedError();
      }

      goto LABEL_36;
    }
    v32 = *(id *)(*(_QWORD *)&buf[8] + 40);
    v31 = v32;
    if (v32)
    {
      if (a7)
      {
        v31 = objc_retainAutorelease(v32);
        v27 = 0;
        *a7 = v31;
LABEL_36:

        _Block_object_dispose(buf, 8);
        _Block_object_dispose(&v41, 8);
        goto LABEL_37;
      }
      _HKLogDroppedError();
    }
    v27 = 0;
    goto LABEL_36;
  }
  objc_msgSend(MEMORY[0x1E0CB6978], "activityCacheType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  v46 = 0;
  objc_msgSend(a1, "mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:", v19, v14, 0, v18, &v46, &v45);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v46;
  v22 = v45;

  if (!v20 && v22)
  {
    _HKInitializeLogging();
    v23 = *MEMORY[0x1E0CB5268];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5268], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v22;
      _os_log_error_impl(&dword_1B7802000, v23, OS_LOG_TYPE_ERROR, "Error retreiving most recent activity cache: %@", buf, 0xCu);
    }
    if (a7)
      *a7 = objc_retainAutorelease(v22);
    else
      _HKLogDroppedError();

    v27 = 0;
    goto LABEL_37;
  }
  if (!v20 || (v25 = objc_msgSend(v13, "sequence"), v25 > objc_msgSend(v20, "sequence")))
  {
    _HKInitializeLogging();
    v26 = *MEMORY[0x1E0CB5268];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5268], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      _os_log_debug_impl(&dword_1B7802000, v26, OS_LOG_TYPE_DEBUG, "Replacing existing activity cache (%@) with new activity cache (%@)", buf, 0x16u);
    }

    goto LABEL_16;
  }
  _HKInitializeLogging();
  v33 = *MEMORY[0x1E0CB5268];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5268], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v20;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v13;
    _os_log_impl(&dword_1B7802000, v33, OS_LOG_TYPE_DEFAULT, "Not replacing existing activity cache (%@) with new activity cache (%@)", buf, 0x16u);
  }

  v21 = v21;
  v27 = (uint64_t)v21;
LABEL_37:

  return (id)v27;
}

void __92__HDActivityCacheEntity_mergeDataObject_provenance_profile_transaction_error_insertHandler___block_invoke(uint64_t a1, char a2, int a3, int a4, int a5, int a6, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)objc_msgSend(a3, "activityCaches");
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDActivityCacheEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDActivityCacheEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (BOOL)validateEntityWithProfile:(id)a3 error:(id *)a4 validationErrorHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  __CFString *v13;
  id v14;
  id v15;

  v8 = a5;
  objc_msgSend(a3, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__HDActivityCacheEntity_validateEntityWithProfile_error_validationErrorHandler___block_invoke;
  v12[3] = &unk_1E6CF2DE0;
  v13 = CFSTR("SELECT ROWID, activity_mode, energy_burned, energy_burned_goal, move_minutes, move_minutes_goal, brisk_minutes, brisk_minutes_goal, active_hours, active_hours_goal, steps, pushes, walk_distance, flights, deep_breathing_duration FROM activity_caches");
  v14 = v8;
  v15 = a1;
  v10 = v8;
  LOBYTE(a4) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v9, a4, v12);

  return (char)a4;
}

uint64_t __80__HDActivityCacheEntity_validateEntityWithProfile_error_validationErrorHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  objc_msgSend(a2, "protectedDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__HDActivityCacheEntity_validateEntityWithProfile_error_validationErrorHandler___block_invoke_2;
  v11[3] = &unk_1E6CEEDA0;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v12 = v7;
  v13 = v8;
  v9 = objc_msgSend(v5, "executeSQL:error:bindingHandler:enumerationHandler:", v6, a3, 0, v11);

  return v9;
}

uint64_t __80__HDActivityCacheEntity_validateEntityWithProfile_error_validationErrorHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  MEMORY[0x1BCCAB1C8](a2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsNumber();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && ((int)objc_msgSend(v5, "intValue") < 1 || (int)objc_msgSend(v6, "intValue") >= 3))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid HKActivityMoveMode %@"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDActivityCacheEntity _createValidationError:rowId:](v8, v9, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v10);

  }
  +[HDActivityCacheEntity _validateNonNegativeNumericProperty:row:rowId:validationErrorHandler:](*(_QWORD *)(a1 + 40), CFSTR("energy_burned"), a2, v4, *(void **)(a1 + 32));
  +[HDActivityCacheEntity _validateNonNegativeNumericProperty:row:rowId:validationErrorHandler:](*(_QWORD *)(a1 + 40), CFSTR("energy_burned_goal"), a2, v4, *(void **)(a1 + 32));
  +[HDActivityCacheEntity _validateNonNegativeNumericProperty:row:rowId:validationErrorHandler:](*(_QWORD *)(a1 + 40), CFSTR("move_minutes"), a2, v4, *(void **)(a1 + 32));
  +[HDActivityCacheEntity _validateNonNegativeNumericProperty:row:rowId:validationErrorHandler:](*(_QWORD *)(a1 + 40), CFSTR("move_minutes_goal"), a2, v4, *(void **)(a1 + 32));
  +[HDActivityCacheEntity _validateNonNegativeNumericProperty:row:rowId:validationErrorHandler:](*(_QWORD *)(a1 + 40), CFSTR("brisk_minutes"), a2, v4, *(void **)(a1 + 32));
  +[HDActivityCacheEntity _validateNonNegativeNumericProperty:row:rowId:validationErrorHandler:](*(_QWORD *)(a1 + 40), CFSTR("brisk_minutes_goal"), a2, v4, *(void **)(a1 + 32));
  +[HDActivityCacheEntity _validateNonNegativeNumericProperty:row:rowId:validationErrorHandler:](*(_QWORD *)(a1 + 40), CFSTR("active_hours"), a2, v4, *(void **)(a1 + 32));
  +[HDActivityCacheEntity _validateNonNegativeNumericProperty:row:rowId:validationErrorHandler:](*(_QWORD *)(a1 + 40), CFSTR("active_hours_goal"), a2, v4, *(void **)(a1 + 32));
  +[HDActivityCacheEntity _validateNonNegativeNumericProperty:row:rowId:validationErrorHandler:](*(_QWORD *)(a1 + 40), CFSTR("steps"), a2, v4, *(void **)(a1 + 32));
  +[HDActivityCacheEntity _validateNonNegativeNumericProperty:row:rowId:validationErrorHandler:](*(_QWORD *)(a1 + 40), CFSTR("pushes"), a2, v4, *(void **)(a1 + 32));
  +[HDActivityCacheEntity _validateNonNegativeNumericProperty:row:rowId:validationErrorHandler:](*(_QWORD *)(a1 + 40), CFSTR("walk_distance"), a2, v4, *(void **)(a1 + 32));
  +[HDActivityCacheEntity _validateNonNegativeNumericProperty:row:rowId:validationErrorHandler:](*(_QWORD *)(a1 + 40), CFSTR("deep_breathing_duration"), a2, v4, *(void **)(a1 + 32));
  +[HDActivityCacheEntity _validateNonNegativeNumericProperty:row:rowId:validationErrorHandler:](*(_QWORD *)(a1 + 40), CFSTR("flights"), a2, v4, *(void **)(a1 + 32));

  return 1;
}

+ (id)_createValidationError:(void *)a3 rowId:
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = a2;
  v6 = (void *)objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 120, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = *MEMORY[0x1E0CB4DE8];
  objc_msgSend(v6, "databaseTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CB3388];
  v16[0] = v8;
  v16[1] = v7;
  v10 = *MEMORY[0x1E0CB4DE0];
  v15[1] = v9;
  v15[2] = v10;
  v16[2] = v4;
  v15[3] = *MEMORY[0x1E0CB4DF8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ROWID %@"), v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:userInfo:", 120, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (void)_validateNonNegativeNumericProperty:(uint64_t)a3 row:(void *)a4 rowId:(void *)a5 validationErrorHandler:
{
  id v7;
  void (**v8)(id, void *);
  uint64_t v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v7 = a4;
  v8 = a5;
  v9 = objc_opt_self();
  HDSQLiteColumnWithNameAsNumber();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  if (v11 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Property value cannot be negative, name %@ value %@"), v14, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDActivityCacheEntity _createValidationError:rowId:](v9, v12, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v13);

  }
}

@end
