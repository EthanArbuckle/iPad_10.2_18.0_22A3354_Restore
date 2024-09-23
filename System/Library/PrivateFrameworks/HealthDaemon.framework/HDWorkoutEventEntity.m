@implementation HDWorkoutEventEntity

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)databaseTable
{
  return CFSTR("workout_events");
}

+ (Class)ownerEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)ownerEntityReferenceColumn
{
  return CFSTR("data_id");
}

+ (Class)workoutEventClass
{
  return (Class)objc_opt_class();
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 8;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_51;
}

+ (id)foreignKeys
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("owner_id");
  v3 = objc_alloc(MEMORY[0x1E0D29858]);
  v4 = objc_msgSend(a1, "ownerEntityClass");
  objc_msgSend(a1, "ownerEntityReferenceColumn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithEntityClass:property:deletionAction:", v4, v5, 2);
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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

+ (id)insertPersistableWorkoutEvent:(id)a3 ownerID:(id)a4 database:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[8];

  v22[7] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v22[0] = CFSTR("owner_id");
  v22[1] = CFSTR("date");
  v22[2] = CFSTR("type");
  v22[3] = CFSTR("duration");
  v22[4] = CFSTR("metadata");
  v22[5] = CFSTR("session_uuid");
  v22[6] = CFSTR("error");
  v12 = (void *)MEMORY[0x1E0C99D20];
  v13 = a5;
  objc_msgSend(v12, "arrayWithObjects:count:", v22, 7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __77__HDWorkoutEventEntity_insertPersistableWorkoutEvent_ownerID_database_error___block_invoke;
  v19[3] = &unk_1E6CE89A8;
  v20 = v11;
  v21 = v10;
  v15 = v10;
  v16 = v11;
  objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 1, v13, v14, a6, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __77__HDWorkoutEventEntity_insertPersistableWorkoutEvent_ownerID_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  MEMORY[0x1BCCAB12C](a2, CFSTR("owner_id"), *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "dateInterval");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("date"), v4);

  MEMORY[0x1BCCAB114](a2, CFSTR("type"), objc_msgSend(*(id *)(a1 + 40), "workoutEventType"));
  objc_msgSend(v10, "duration");
  MEMORY[0x1BCCAB0F0](a2, CFSTR("duration"));
  objc_msgSend(*(id *)(a1 + 40), "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "hk_codableMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1BCCAB0D8](a2, CFSTR("metadata"), v7);

  }
  else
  {
    MEMORY[0x1BCCAB120](a2, CFSTR("metadata"));
  }
  objc_msgSend(*(id *)(a1 + 40), "sessionUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB168](a2, CFSTR("session_uuid"), v8);

  objc_msgSend(*(id *)(a1 + 40), "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindSecureCodingObjectToProperty();

}

+ (BOOL)insertWorkoutEventsFromWorkout:(id)a3 ownerID:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  objc_msgSend(a5, "databaseForEntityClass:", a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v10, "workoutEvents", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(a1, "insertPersistableWorkoutEvent:ownerID:database:error:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), v11, v12, a6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          v19 = 0;
          goto LABEL_11;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v15)
        continue;
      break;
    }
  }
  v19 = 1;
LABEL_11:

  return v19;
}

+ (id)workoutEventsWithOwnerID:(id)a3 database:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  _QWORD v25[7];

  v25[6] = *MEMORY[0x1E0C80C00];
  v25[0] = CFSTR("date");
  v25[1] = CFSTR("type");
  v25[2] = CFSTR("duration");
  v25[3] = CFSTR("metadata");
  v25[4] = CFSTR("session_uuid");
  v25[5] = CFSTR("error");
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", v25, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D29838];
  _HDSQLiteValueForNumber();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "predicateWithProperty:equalToValue:", CFSTR("owner_id"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "queryWithDatabase:predicate:", v9, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(a1, "workoutEventClass");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __64__HDWorkoutEventEntity_workoutEventsWithOwnerID_database_error___block_invoke;
  v22[3] = &unk_1E6CF9508;
  v23 = v17;
  v24 = v16;
  v18 = v17;
  if (objc_msgSend(v15, "enumerateProperties:error:enumerationHandler:", v11, a5, v22))
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  return v20;
}

uint64_t __64__HDWorkoutEventEntity_workoutEventsWithOwnerID_database_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  HDSQLiteColumnWithNameAsDate();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDouble();
  v5 = v4;
  HDSQLiteColumnWithNameAsData();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCodableMetadataDictionary decodeMetadataFromData:](HDCodableMetadataDictionary, "decodeMetadataFromData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsUUID();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  HDSQLiteColumnWithNameAsObject();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v2, v5);
  v11 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithWorkoutEventType:sessionUUID:dateInterval:metadata:error:", v3, v8, v10, v7, v9);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);

  return 1;
}

+ (id)deleteStatementForWorkoutEventsWithTransaction:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "databaseForEntityClass:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "deleteStatementWithProperty:database:", CFSTR("owner_id"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)statementForEnumeratingEventsForOwnerInDatabase:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("SELECT %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ?"), CFSTR("date"), CFSTR("type"), CFSTR("duration"), CFSTR("metadata"), CFSTR("session_uuid"), CFSTR("error"), v7, CFSTR("owner_id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D298B8]), "initWithSQL:database:", v8, v6);
  return v9;
}

+ (BOOL)enumerateEventsForOwner:(int64_t)a3 withStatement:(id)a4 error:(id *)a5 eventHandler:(id)a6
{
  id v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];

  v12 = a6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__HDWorkoutEventEntity_enumerateEventsForOwner_withStatement_error_eventHandler___block_invoke;
  v13[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v13[4] = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__HDWorkoutEventEntity_enumerateEventsForOwner_withStatement_error_eventHandler___block_invoke_2;
  v11[3] = &unk_1E6CE82B0;
  v9 = v12;
  LOBYTE(a5) = objc_msgSend(a4, "enumerateStatementWithError:bindingHandler:block:", a5, v13, v11);

  return (char)a5;
}

uint64_t __81__HDWorkoutEventEntity_enumerateEventsForOwner_withStatement_error_eventHandler___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t __81__HDWorkoutEventEntity_enumerateEventsForOwner_withStatement_error_eventHandler___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  HDSQLiteColumnWithNameAsDouble();
  v3 = v2;
  HDSQLiteColumnWithNameAsDouble();
  v5 = v4;
  HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsData();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCodableMetadataDictionary decodeMetadataFromData:](HDCodableMetadataDictionary, "decodeMetadataFromData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsUUID();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  HDSQLiteColumnWithNameAsObject();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(v3, v5);

  return 1;
}

+ (id)workoutEventsForOwner:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  uint64_t v20;

  v8 = a3;
  objc_msgSend(a4, "databaseForEntityClass:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "statementForEnumeratingEventsForOwnerInDatabase:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_msgSend(a1, "workoutEventClass");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "persistentID");
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __64__HDWorkoutEventEntity_workoutEventsForOwner_transaction_error___block_invoke;
    v18[3] = &unk_1E6CF9530;
    v19 = v12;
    v20 = v11;
    v14 = v12;
    if (objc_msgSend(a1, "enumerateEventsForOwner:withStatement:error:eventHandler:", v13, v10, a5, v18))
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __64__HDWorkoutEventEntity_workoutEventsForOwner_transaction_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, double a6, double a7)
{
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v13 = (objc_class *)MEMORY[0x1E0CB3588];
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = [v13 alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v17, "initWithStartDate:duration:", v18, a7);

  v19 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithWorkoutEventType:sessionUUID:dateInterval:metadata:error:", a2, v15, v20, v16, v14);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v19);

}

@end
