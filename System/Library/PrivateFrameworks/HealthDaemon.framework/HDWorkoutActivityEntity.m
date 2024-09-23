@implementation HDWorkoutActivityEntity

+ (id)databaseTable
{
  return CFSTR("workout_activities");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  const $74B29A3897B97E76C443A7D6635F6E34 *result;

  if (objc_msgSend(a1, "supportsNullableEndDate"))
    result = (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__nullableEndDateDefinitions;
  else
    result = (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__nonNullableEndDateDefinitions_0;
  *a3 = 12;
  return result;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("owner_id");
  objc_msgSend((id)objc_msgSend(a1, "ownerEntityClass"), "defaultForeignKey");
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

+ (Class)ownerEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)indices
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D29860]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "databaseTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@_owners"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("owner_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithEntity:name:columns:", a1, v6, v7);
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)insertSubActivities:(id)a3 ownerID:(unint64_t)a4 database:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        if (!objc_msgSend(a1, "_insertOrReplaceWorkoutActivity:shouldReplace:ownerID:isPrimaryActivity:database:error:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), 0, a4, 0, v11, a6, (_QWORD)v19))
        {
          v17 = 0;
          goto LABEL_11;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v14)
        continue;
      break;
    }
  }
  v17 = 1;
LABEL_11:

  return v17;
}

+ (BOOL)insertPrimaryActivity:(id)a3 ownerID:(unint64_t)a4 database:(id)a5 error:(id *)a6
{
  return objc_msgSend(a1, "_insertOrReplaceWorkoutActivity:shouldReplace:ownerID:isPrimaryActivity:database:error:", a3, 0, a4, 1, a5, a6);
}

+ (id)subActivitiesWithOwnerID:(unint64_t)a3 database:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithProperty:equalToValue:", CFSTR("owner_id"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("is_primary_activity"), MEMORY[0x1E0C9AAA0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryWithDatabase:predicate:", v8, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_allProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __67__HDWorkoutActivityEntity_subActivitiesWithOwnerID_database_error___block_invoke;
  v22[3] = &unk_1E6CEDF88;
  v24 = v9;
  v25 = a1;
  v23 = v8;
  v17 = v9;
  v18 = v8;
  LODWORD(a5) = objc_msgSend(v15, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v16, a5, v22);

  if ((_DWORD)a5)
    v19 = v17;
  else
    v19 = 0;
  v20 = v19;

  return v20;
}

uint64_t __67__HDWorkoutActivityEntity_subActivitiesWithOwnerID_database_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  id v17;

  objc_msgSend(*(id *)(a1 + 48), "_workoutActivityFromRow:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 32);
  v17 = 0;
  objc_msgSend(v9, "_statisticsForWorkoutActivityWithPersistentId:workoutActivity:database:error:", a2, v8, v10, &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v17;
  v13 = v12;
  if (v11)
    v14 = 1;
  else
    v14 = v12 == 0;
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v8, "_setAllStatistics:", v11);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
  }
  else if (a5)
  {
    *a5 = objc_retainAutorelease(v12);
  }
  else
  {
    _HKLogDroppedError();
  }

  return v15;
}

+ (id)primaryWorkoutActivityForOwnerID:(unint64_t)a3 database:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  BOOL (*v22)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v23;
  id v24;
  uint64_t *v25;
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v8 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__33;
  v31 = __Block_byref_object_dispose__33;
  v32 = 0;
  objc_msgSend(a1, "_primaryActivityPredicateForOwnerID:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryWithDatabase:predicate:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_allProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __75__HDWorkoutActivityEntity_primaryWorkoutActivityForOwnerID_database_error___block_invoke;
  v23 = &unk_1E6CEDFB0;
  v25 = &v27;
  v26 = a1;
  v12 = v8;
  v24 = v12;
  LODWORD(v8) = objc_msgSend(v10, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v11, a5, &v20);

  if (!(_DWORD)v8)
  {
    v13 = 0;
    goto LABEL_7;
  }
  v13 = (void *)v28[5];
  if (v13)
  {
LABEL_7:
    v18 = v13;
    goto LABEL_8;
  }
  v14 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hk_error:format:", 118, CFSTR("Cannot find main activity for workout with persistent ID %@"), v15, v20, v21, v22, v23);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v16);
    else
      _HKLogDroppedError();
  }

  v18 = 0;
LABEL_8:

  _Block_object_dispose(&v27, 8);
  return v18;
}

BOOL __75__HDWorkoutActivityEntity_primaryWorkoutActivityForOwnerID_database_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  objc_msgSend(*(id *)(a1 + 48), "_workoutActivityFromRow:", a4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(*(id *)(a1 + 48), "_statisticsForWorkoutActivityWithPersistentId:workoutActivity:database:error:", a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32), a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "_setAllStatistics:", v11);

  return v11 != 0;
}

+ (id)subActivityEntityWithUUID:(id)a3 ownerID:(unint64_t)a4 database:(id)a5 error:(id *)a6
{
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v10 = (void *)MEMORY[0x1E0D29838];
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = a5;
  v13 = a3;
  objc_msgSend(v11, "numberWithUnsignedLongLong:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithProperty:equalToValue:", CFSTR("owner_id"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("is_primary_activity"), MEMORY[0x1E0C9AAA0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("uuid"), v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v15;
  v22[1] = v16;
  v22[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "anyInDatabase:predicate:error:", v12, v19, a6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)activityEntityWithUUID:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a3;
  objc_msgSend(a4, "databaseForEntityClass:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("uuid"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "anyInDatabase:predicate:error:", v9, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)enumerateActivityEntitiesForOwnerID:(unint64_t)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;

  v10 = a6;
  objc_msgSend(a4, "databaseForEntityClass:", a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateWithProperty:equalToValue:", CFSTR("owner_id"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "queryWithDatabase:predicate:", v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __100__HDWorkoutActivityEntity_enumerateActivityEntitiesForOwnerID_transaction_error_enumerationHandler___block_invoke;
  v18[3] = &unk_1E6CEDFD8;
  v19 = v10;
  v20 = a1;
  v16 = v10;
  LOBYTE(a5) = objc_msgSend(v15, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", 0, a5, v18);

  return (char)a5;
}

uint64_t __100__HDWorkoutActivityEntity_enumerateActivityEntitiesForOwnerID_transaction_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithPersistentID:", a2);
  v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v4;
}

+ (id)activityTypeForPrimaryActivityOwnerID:(unint64_t)a3 transaction:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "_numberProperty:primaryActivityOwnerID:transaction:error:", CFSTR("activity_type"), a3, a4, a5);
}

+ (id)durationForPrimaryActivityOwnerID:(unint64_t)a3 transaction:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "_numberProperty:primaryActivityOwnerID:transaction:error:", CFSTR("duration"), a3, a4, a5);
}

- (id)UUIDInTransaction:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(v5, "databaseForEntityClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDSQLiteEntity UUIDForProperty:database:](self, "UUIDForProperty:database:", CFSTR("uuid"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)setEndDate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "databaseForEntityClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = CFSTR("end_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__HDWorkoutActivityEntity_setEndDate_transaction_error___block_invoke;
  v14[3] = &unk_1E6CE84C8;
  v15 = v8;
  v12 = v8;
  LOBYTE(a5) = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](self, "updateProperties:database:error:bindingHandler:", v11, v10, a5, v14);

  return (char)a5;
}

void __56__HDWorkoutActivityEntity_setEndDate_transaction_error___block_invoke()
{
  JUMPOUT(0x1BCCAB0E4);
}

- (BOOL)setDuration:(double)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(v8, "databaseForEntityClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__HDWorkoutActivityEntity_setDuration_transaction_error___block_invoke;
  v12[3] = &__block_descriptor_40_e34_v16__0__HDSQLiteStatementBinder__8l;
  *(double *)&v12[4] = a3;
  LOBYTE(a5) = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](self, "updateProperties:database:error:bindingHandler:", v10, v9, a5, v12);

  return (char)a5;
}

void __57__HDWorkoutActivityEntity_setDuration_transaction_error___block_invoke()
{
  JUMPOUT(0x1BCCAB0F0);
}

- (BOOL)setMetadata:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "databaseForEntityClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = CFSTR("metadata");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__HDWorkoutActivityEntity_setMetadata_transaction_error___block_invoke;
  v14[3] = &unk_1E6CE84C8;
  v15 = v8;
  v12 = v8;
  LOBYTE(a5) = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](self, "updateProperties:database:error:bindingHandler:", v11, v10, a5, v14);

  return (char)a5;
}

uint64_t __57__HDWorkoutActivityEntity_setMetadata_transaction_error___block_invoke()
{
  return HDSQLiteBindSecureCodingObjectToProperty();
}

- (BOOL)unitTest_validateInTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__33;
  v18 = __Block_byref_object_dispose__33;
  v19 = 0;
  objc_msgSend(v6, "databaseForEntityClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = CFSTR("lap_length");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__HDWorkoutActivityEntity_unitTest_validateInTransaction_error___block_invoke;
  v13[3] = &unk_1E6CEE020;
  v13[4] = &v20;
  v13[5] = &v14;
  -[HDSQLiteEntity getValuesForProperties:database:handler:](self, "getValuesForProperties:database:handler:", v8, v7, v13);

  if (*((_BYTE *)v21 + 24))
  {
    v9 = 1;
  }
  else
  {
    v10 = (id)v15[5];
    v11 = v10;
    v9 = v10 == 0;
    if (v10)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v10);
      else
        _HKLogDroppedError();
    }

  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v9;
}

void __64__HDWorkoutActivityEntity_unitTest_validateInTransaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  MEMORY[0x1BCCAB18C](a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3710];
    v6 = objc_opt_class();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v7 + 40);
    objc_msgSend(v5, "unarchivedObjectOfClass:fromData:error:", v6, v4, &obj);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v7 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8 != 0;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

}

+ (id)_allProperties
{
  _QWORD v3[12];

  v3[11] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("uuid");
  v3[1] = CFSTR("owner_id");
  v3[2] = CFSTR("is_primary_activity");
  v3[3] = CFSTR("activity_type");
  v3[4] = CFSTR("location_type");
  v3[5] = CFSTR("swimming_location_type");
  v3[6] = CFSTR("lap_length");
  v3[7] = CFSTR("start_date");
  v3[8] = CFSTR("end_date");
  v3[9] = CFSTR("duration");
  v3[10] = CFSTR("metadata");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 11);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)_insertOrReplaceWorkoutActivity:(id)a3 shouldReplace:(BOOL)a4 ownerID:(unint64_t)a5 isPrimaryActivity:(BOOL)a6 database:(id)a7 error:(id *)a8
{
  _BOOL8 v12;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  _HDWorkoutStatistics *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  _HDWorkoutStatistics *v33;
  _BOOL4 v34;
  id v36;
  id obj;
  void *v38;
  uint64_t v39;
  id *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  id v49;
  unint64_t v50;
  BOOL v51;
  _BYTE v52[128];
  uint64_t v53;

  v12 = a4;
  v53 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a7;
  objc_msgSend(v14, "workoutConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_allProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __114__HDWorkoutActivityEntity__insertOrReplaceWorkoutActivity_shouldReplace_ownerID_isPrimaryActivity_database_error___block_invoke;
  v47[3] = &unk_1E6CEE048;
  v18 = v14;
  v48 = v18;
  v50 = a5;
  v51 = a6;
  v19 = v16;
  v49 = v19;
  v42 = v15;
  v40 = a8;
  objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", v12, v15, v17, a8, v47);
  v20 = objc_claimAutoreleasedReturnValue();

  v41 = (void *)v20;
  if (v20)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(v18, "allStatistics");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    if (v21)
    {
      v22 = v21;
      v36 = v19;
      v39 = *(_QWORD *)v44;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v44 != v39)
            objc_enumerationMutation(obj);
          v24 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          v25 = v18;
          objc_msgSend(v18, "allStatistics");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", v24);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = [_HDWorkoutStatistics alloc];
          objc_msgSend(v27, "sumQuantity");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (uint64_t)v29;
          if (!v29)
          {
            objc_msgSend(v27, "averageQuantity");
            v30 = objc_claimAutoreleasedReturnValue();
            v38 = (void *)v30;
          }
          objc_msgSend(v27, "minimumQuantity");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "maximumQuantity");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = -[_HDWorkoutStatistics initWithQuantityType:quantity:min:max:](v28, "initWithQuantityType:quantity:min:max:", v24, v30, v31, v32);

          if (!v29)
          v34 = +[HDWorkoutStatisticsEntity insertWorkoutStatistics:workoutActivityId:database:error:](HDWorkoutStatisticsEntity, "insertWorkoutStatistics:workoutActivityId:database:error:", v33, objc_msgSend(v41, "persistentID"), v42, v40);

          if (!v34)
          {
            LOBYTE(v20) = 0;
            v18 = v25;
            goto LABEL_16;
          }
          v18 = v25;
        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
        if (v22)
          continue;
        break;
      }
      LOBYTE(v20) = 1;
LABEL_16:
      v19 = v36;
    }
    else
    {
      LOBYTE(v20) = 1;
    }

  }
  return v20;
}

void __114__HDWorkoutActivityEntity__insertOrReplaceWorkoutActivity_shouldReplace_ownerID_isPrimaryActivity_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB168](a2, CFSTR("uuid"), v4);

  MEMORY[0x1BCCAB114](a2, CFSTR("owner_id"), *(_QWORD *)(a1 + 48));
  MEMORY[0x1BCCAB0CC](a2, CFSTR("is_primary_activity"), *(unsigned __int8 *)(a1 + 56));
  MEMORY[0x1BCCAB114](a2, CFSTR("activity_type"), objc_msgSend(*(id *)(a1 + 40), "activityType"));
  MEMORY[0x1BCCAB114](a2, CFSTR("location_type"), objc_msgSend(*(id *)(a1 + 40), "locationType"));
  MEMORY[0x1BCCAB114](a2, CFSTR("swimming_location_type"), objc_msgSend(*(id *)(a1 + 40), "swimmingLocationType"));
  objc_msgSend(*(id *)(a1 + 40), "lapLength");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindSecureCodingObjectToProperty();

  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("start_date"), v6);

  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("end_date"), v7);

  objc_msgSend(*(id *)(a1 + 32), "duration");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("duration"));
  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindSecureCodingObjectToProperty();

}

+ (id)_workoutActivityFromRow:(HDSQLiteRow *)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  HDSQLiteColumnWithNameAsUUID();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0CB6E20]);
  objc_msgSend(v4, "setActivityType:", HDSQLiteColumnWithNameAsInt64());
  objc_msgSend(v4, "setLocationType:", HDSQLiteColumnWithNameAsInt64());
  objc_msgSend(v4, "setSwimmingLocationType:", HDSQLiteColumnWithNameAsInt64());
  objc_opt_class();
  HDSQLiteColumnWithNameAsObject();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLapLength:", v5);

  HDSQLiteColumnWithNameAsDate();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDouble();
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "hk_secureCodingClasses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsObjectWithClasses();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0CB6DD8]);
  v13 = (void *)objc_msgSend(v12, "_initWithUUID:workoutConfiguration:startDate:endDate:workoutEvents:startsPaused:duration:metadata:statisticsPerType:", v3, v4, v6, v7, MEMORY[0x1E0C9AA60], 0, v9, v11, 0);

  return v13;
}

+ (id)_statisticsForWorkoutActivityWithPersistentId:(unint64_t)a3 workoutActivity:(id)a4 database:(id)a5 error:(id *)a6
{
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;

  v9 = a4;
  v10 = (objc_class *)MEMORY[0x1E0C99E08];
  v11 = a5;
  v12 = objc_alloc_init(v10);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __104__HDWorkoutActivityEntity__statisticsForWorkoutActivityWithPersistentId_workoutActivity_database_error___block_invoke;
  v18[3] = &unk_1E6CEE070;
  v19 = v9;
  v20 = v12;
  v13 = v12;
  v14 = v9;
  LODWORD(a6) = +[HDWorkoutStatisticsEntity enumerateWorkoutStatisticsForActivityId:database:error:handler:](HDWorkoutStatisticsEntity, "enumerateWorkoutStatisticsForActivityId:database:error:handler:", a3, v11, a6, v18);

  if ((_DWORD)a6)
    v15 = v13;
  else
    v15 = 0;
  v16 = v15;

  return v16;
}

uint64_t __104__HDWorkoutActivityEntity__statisticsForWorkoutActivityWithPersistentId_workoutActivity_database_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0CB6C68]);
  objc_msgSend(v3, "quantityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithDataType:startDate:endDate:", v5, v6, v7);

  objc_msgSend(v3, "quantityType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "aggregationStyle");

  objc_msgSend(v3, "quantity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v8, "setAverageQuantity:", v11);
  else
    objc_msgSend(v8, "setSumQuantity:", v11);

  objc_msgSend(v3, "min");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMinimumQuantity:", v12);

  objc_msgSend(v3, "max");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMaximumQuantity:", v13);

  v14 = *(void **)(a1 + 40);
  objc_msgSend(v3, "quantityType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v8, v15);

  return 1;
}

+ (BOOL)supportsNullableEndDate
{
  return 0;
}

+ (id)_primaryActivityPredicateForOwnerID:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithProperty:equalToValue:", CFSTR("owner_id"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("is_primary_activity"), MEMORY[0x1E0C9AAB0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_numberProperty:(id)a3 primaryActivityOwnerID:(unint64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v10 = a3;
  v11 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__33;
  v25 = __Block_byref_object_dispose__33;
  v26 = 0;
  objc_msgSend(v11, "databaseForEntityClass:", a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE (%@=1) AND (%@=?)"), v10, v14, CFSTR("is_primary_activity"), CFSTR("owner_id"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __84__HDWorkoutActivityEntity__numberProperty_primaryActivityOwnerID_transaction_error___block_invoke;
  v20[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v20[4] = a4;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __84__HDWorkoutActivityEntity__numberProperty_primaryActivityOwnerID_transaction_error___block_invoke_2;
  v19[3] = &unk_1E6CE8540;
  v19[4] = &v21;
  if (objc_msgSend(v12, "executeSQL:error:bindingHandler:enumerationHandler:", v15, a6, v20, v19))
    v16 = (void *)v22[5];
  else
    v16 = 0;
  v17 = v16;

  _Block_object_dispose(&v21, 8);
  return v17;
}

uint64_t __84__HDWorkoutActivityEntity__numberProperty_primaryActivityOwnerID_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t __84__HDWorkoutActivityEntity__numberProperty_primaryActivityOwnerID_transaction_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  MEMORY[0x1BCCAB1C8](a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

@end
