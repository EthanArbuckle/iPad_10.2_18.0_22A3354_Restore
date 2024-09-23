@implementation HDAlarmEventEntity

+ (BOOL)enumerateAllAlarmEventsWithClientIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;

  v10 = (void *)MEMORY[0x1E0D29838];
  v11 = a6;
  v12 = a4;
  objc_msgSend(v10, "predicateWithProperty:equalToValue:", CFSTR("client_identifier"), a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = +[HDAlarmEventEntity _enumerateAllAlarmEventsWithTransaction:predicate:error:enumerationHandler:]((uint64_t)a1, v12, v13, (uint64_t)a5, v11);

  return (char)a5;
}

+ (uint64_t)_enumerateAllAlarmEventsWithTransaction:(void *)a3 predicate:(uint64_t)a4 error:(void *)a5 enumerationHandler:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  _QWORD v20[4];
  id v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  v10 = a2;
  v11 = (void *)objc_opt_self();
  objc_msgSend(v10, "databaseForEntityClass:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", *MEMORY[0x1E0D29618], v11, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v12, v9, 0, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  HDAlarmEventEntityAllProperties();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __97__HDAlarmEventEntity__enumerateAllAlarmEventsWithTransaction_predicate_error_enumerationHandler___block_invoke;
  v20[3] = &unk_1E6CEED78;
  v21 = v8;
  v22 = v11;
  v17 = v8;
  v18 = objc_msgSend(v15, "enumerateProperties:error:enumerationHandler:", v16, a4, v20);

  return v18;
}

+ (BOOL)enumerateAllAlarmEventsWithTransaction:(id)a3 error:(id *)a4 enumerationHandler:(id)a5
{
  return +[HDAlarmEventEntity _enumerateAllAlarmEventsWithTransaction:predicate:error:enumerationHandler:]((uint64_t)a1, a3, 0, (uint64_t)a4, a5);
}

uint64_t __97__HDAlarmEventEntity__enumerateAllAlarmEventsWithTransaction_predicate_error_enumerationHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[HDAlarmEventEntity _alarmEventFromAllPropertiesRow:]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v3;
}

+ (id)_alarmEventFromAllPropertiesRow:
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_opt_self();
  HDSQLiteColumnWithNameAsString();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  HDSQLiteColumnWithNameAsObject();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = HDSQLiteColumnWithNameAsInt64();
  v5 = -[HDAlarmEvent _initWithClientIdentifier:eventIdentifier:dueDate:dueDateComponents:eventOptions:clientOptions:]([HDAlarmEvent alloc], "_initWithClientIdentifier:eventIdentifier:dueDate:dueDateComponents:eventOptions:clientOptions:", v0, v1, v2, v3, v4, HDSQLiteColumnWithNameAsInt64());

  return v5;
}

+ (id)insertOrReplaceAlarmEvent:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v8 = a3;
  objc_msgSend(a4, "databaseForEntityClass:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HDAlarmEventEntityAllProperties();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__HDAlarmEventEntity_insertOrReplaceAlarmEvent_transaction_error___block_invoke;
  v14[3] = &unk_1E6CE84C8;
  v15 = v8;
  v11 = v8;
  objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 1, v9, v10, a5, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __66__HDAlarmEventEntity_insertOrReplaceAlarmEvent_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("client_identifier"), v4);

  objc_msgSend(*(id *)(a1 + 32), "eventIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("event_identifier"), v5);

  objc_msgSend(*(id *)(a1 + 32), "dueDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("due_date"), v6);

  objc_msgSend(*(id *)(a1 + 32), "dueDateComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindSecureCodingObjectToProperty();

  MEMORY[0x1BCCAB114](a2, CFSTR("event_options"), objc_msgSend(*(id *)(a1 + 32), "eventOptions"));
  objc_msgSend(*(id *)(a1 + 32), "clientOptions");
  JUMPOUT(0x1BCCAB114);
}

+ (BOOL)insertOrReplaceAlarmEvents:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(a1, "insertOrReplaceAlarmEvent:transaction:error:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), v9, a5, (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          v16 = 0;
          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v12)
        continue;
      break;
    }
  }
  v16 = 1;
LABEL_11:

  return v16;
}

+ (BOOL)deleteAlarmEvent:(id)a3 transaction:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0D29838];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "clientIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithProperty:equalToValue:", CFSTR("client_identifier"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(v10, "eventIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "predicateWithProperty:equalToValue:", CFSTR("event_identifier"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D29840];
  v21[0] = v12;
  v21[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "predicateMatchingAllPredicates:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "databaseForEntityClass:", a1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = objc_msgSend(a1, "deleteEntitiesInDatabase:predicate:error:", v19, v18, a5);
  return (char)a5;
}

+ (BOOL)deleteAlarmEvents:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        if (!objc_msgSend(a1, "deleteAlarmEvent:transaction:error:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), v9, a5, (_QWORD)v17))
        {
          v15 = 0;
          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
        continue;
      break;
    }
  }
  v15 = 1;
LABEL_11:

  return v15;
}

+ (BOOL)deleteAllAlarmEventsWithClientIdentifier:(id)a3 transaction:(id)a4 enumerationHandler:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v10 = a3;
  v11 = a5;
  objc_msgSend(a4, "databaseForEntityClass:", a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ = ? RETURNING *"), v14, CFSTR("client_identifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = a1;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __100__HDAlarmEventEntity_deleteAllAlarmEventsWithClientIdentifier_transaction_enumerationHandler_error___block_invoke;
  v22[3] = &unk_1E6CE9508;
  v23 = v10;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __100__HDAlarmEventEntity_deleteAllAlarmEventsWithClientIdentifier_transaction_enumerationHandler_error___block_invoke_2;
  v19[3] = &unk_1E6CEEDA0;
  v20 = v11;
  v16 = v11;
  v17 = v10;
  LOBYTE(a6) = objc_msgSend(v12, "executeSQL:error:bindingHandler:enumerationHandler:", v15, a6, v22, v19);

  return (char)a6;
}

uint64_t __100__HDAlarmEventEntity_deleteAllAlarmEventsWithClientIdentifier_transaction_enumerationHandler_error___block_invoke()
{
  return HDSQLiteBindStringToStatement();
}

uint64_t __100__HDAlarmEventEntity_deleteAllAlarmEventsWithClientIdentifier_transaction_enumerationHandler_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[HDAlarmEventEntity _alarmEventFromAllPropertiesRow:]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v3;
}

+ (BOOL)deleteAllAlarmEventsWithClientIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = (void *)MEMORY[0x1E0D29838];
  v9 = a4;
  objc_msgSend(v8, "predicateWithProperty:equalToValue:", CFSTR("client_identifier"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseForEntityClass:", a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = objc_msgSend(a1, "deleteEntitiesInDatabase:predicate:error:", v11, v10, a5);
  return (char)a5;
}

- (id)alarmEventWithTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__38;
  v17 = __Block_byref_object_dispose__38;
  v18 = 0;
  HDAlarmEventEntityAllProperties();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseForEntity:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__HDAlarmEventEntity_alarmEventWithTransaction_error___block_invoke;
  v12[3] = &unk_1E6CEEDC8;
  v12[4] = &v13;
  LODWORD(a4) = -[HDSQLiteEntity getValuesForProperties:database:error:handler:](self, "getValuesForProperties:database:error:handler:", v7, v8, a4, v12);

  if ((_DWORD)a4)
    v9 = (void *)v14[5];
  else
    v9 = 0;
  v10 = v9;
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __54__HDAlarmEventEntity_alarmEventWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[HDAlarmEventEntity _alarmEventFromAllPropertiesRow:]();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)databaseTable
{
  return CFSTR("alarm_events");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 7;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_19;
}

+ (id)uniquedColumns
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("client_identifier");
  v3[1] = CFSTR("event_identifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)checkConstraints
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D298A8], "checkConstraintWithSQL:", CFSTR("(due_date IS NULL AND due_date_components IS NOT NULL) OR (due_date IS NOT NULL AND due_date_components IS NULL)"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
