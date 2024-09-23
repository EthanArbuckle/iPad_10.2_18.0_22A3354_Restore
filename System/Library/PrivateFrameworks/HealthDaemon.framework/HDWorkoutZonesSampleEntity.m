@implementation HDWorkoutZonesSampleEntity

+ (id)databaseTable
{
  return CFSTR("workout_zones_samples");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 2;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_16;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;

  v10 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend(a3, "zones");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __92__HDWorkoutZonesSampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
    v19[3] = &unk_1E6CE7750;
    v15 = v11;
    v20 = v15;
    v21 = v14;
    if (objc_msgSend(v10, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO workout_zones_samples (data_id, zones) VALUES (?, ?)"), a7, v19, 0))v16 = v15;
    else
      v16 = 0;
    v17 = v16;

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

uint64_t __92__HDWorkoutZonesSampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  return HDSQLiteBindFoundationValueToStatement();
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)objc_msgSend(a3, "workoutZones");
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3)
    objc_msgSend(a4, "addWorkoutZones:", a3);
  return a3 != 0;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDWorkoutZonesSampleEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDWorkoutZonesSampleEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

@end
