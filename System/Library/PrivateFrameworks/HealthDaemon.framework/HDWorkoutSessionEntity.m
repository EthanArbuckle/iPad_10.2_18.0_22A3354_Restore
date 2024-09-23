@implementation HDWorkoutSessionEntity

+ (id)lookupSessionWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = (void *)MEMORY[0x1E0D29838];
  v9 = a4;
  objc_msgSend(v8, "predicateWithProperty:equalToValue:", CFSTR("uuid"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "anyWithPredicate:healthDatabase:error:", v10, v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)createSessionWithIdentifier:(id)a3 source:(id)a4 configuration:(id)a5 state:(int64_t)a6 profile:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  int64_t v29;
  _QWORD v30[8];

  v30[7] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v30[0] = CFSTR("uuid");
  v30[1] = CFSTR("workout_configuration");
  v30[2] = CFSTR("source_id");
  v30[3] = CFSTR("state");
  v30[4] = CFSTR("requested_target_state");
  v30[5] = CFSTR("creation_date");
  v30[6] = CFSTR("latest_activity_date");
  v16 = (void *)MEMORY[0x1E0C99D20];
  v17 = a7;
  objc_msgSend(v16, "arrayWithObjects:count:", v30, 7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "database");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __95__HDWorkoutSessionEntity_createSessionWithIdentifier_source_configuration_state_profile_error___block_invoke;
  v25[3] = &unk_1E6CF5C90;
  v26 = v13;
  v27 = v15;
  v28 = v14;
  v29 = a6;
  v20 = v14;
  v21 = v15;
  v22 = v13;
  +[HDHealthEntity insertOrReplaceEntity:healthDatabase:properties:error:bindingHandler:](HDWorkoutSessionEntity, "insertOrReplaceEntity:healthDatabase:properties:error:bindingHandler:", 0, v19, v18, a8, v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

void __95__HDWorkoutSessionEntity_createSessionWithIdentifier_source_configuration_state_profile_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v4;
  id v5;

  MEMORY[0x1BCCAB168](a2, CFSTR("uuid"), a1[4]);
  HDSQLiteBindSecureCodingObjectToProperty();
  v4 = (void *)a1[6];
  if (v4)
    MEMORY[0x1BCCAB114](a2, CFSTR("source_id"), objc_msgSend(v4, "persistentID"));
  else
    MEMORY[0x1BCCAB120](a2, CFSTR("source_id"));
  MEMORY[0x1BCCAB114](a2, CFSTR("state"), a1[7]);
  MEMORY[0x1BCCAB114](a2, CFSTR("requested_target_state"), 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("creation_date"), v5);
  MEMORY[0x1BCCAB0E4](a2, CFSTR("latest_activity_date"), v5);

}

+ (id)sessionsForSource:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  int v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v8 = a4;
  if (a3)
  {
    v9 = (void *)MEMORY[0x1E0D29838];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a3, "persistentID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateWithProperty:equalToValue:", CFSTR("source_id"), v10);
    a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v8, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __58__HDWorkoutSessionEntity_sessionsForSource_profile_error___block_invoke;
  v19[3] = &unk_1E6CE9280;
  v21 = v11;
  v22 = a1;
  v20 = a3;
  v13 = v11;
  v14 = a3;
  v15 = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v12, a5, v19);

  if (v15)
    v16 = v13;
  else
    v16 = 0;
  v17 = v16;

  return v17;
}

uint64_t __58__HDWorkoutSessionEntity_sessionsForSource_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v5 = *(void **)(a1 + 48);
  objc_msgSend(a2, "databaseForEntityClass:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__HDWorkoutSessionEntity_sessionsForSource_profile_error___block_invoke_2;
  v10[3] = &unk_1E6CF6438;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v8 = objc_msgSend(v5, "enumerateEntitiesInDatabase:predicate:error:enumerationHandler:", v6, v7, a3, v10);

  return v8;
}

uint64_t __58__HDWorkoutSessionEntity_sessionsForSource_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

+ (id)sessionsExcludingIdentifiers:(id)a3 profile:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = (void *)MEMORY[0x1E0D29848];
  v9 = a4;
  objc_msgSend(v8, "doesNotContainPredicateWithProperty:values:", CFSTR("uuid"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v9, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __69__HDWorkoutSessionEntity_sessionsExcludingIdentifiers_profile_error___block_invoke;
  v18[3] = &unk_1E6CE9280;
  v20 = v11;
  v21 = a1;
  v19 = v10;
  v13 = v11;
  v14 = v10;
  LODWORD(a5) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v12, a5, v18);

  if ((_DWORD)a5)
    v15 = v13;
  else
    v15 = 0;
  v16 = v15;

  return v16;
}

uint64_t __69__HDWorkoutSessionEntity_sessionsExcludingIdentifiers_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v5 = *(void **)(a1 + 48);
  objc_msgSend(a2, "databaseForEntityClass:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__HDWorkoutSessionEntity_sessionsExcludingIdentifiers_profile_error___block_invoke_2;
  v10[3] = &unk_1E6CF6438;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v8 = objc_msgSend(v5, "enumerateEntitiesInDatabase:predicate:error:enumerationHandler:", v6, v7, a3, v10);

  return v8;
}

uint64_t __69__HDWorkoutSessionEntity_sessionsExcludingIdentifiers_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

+ (id)sessionIdentifierForRecoveryInProfile:(id)a3 expirationInterval:(double)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  id v20;
  double v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@ >= ? ORDER BY %@ DESC LIMIT 1"), CFSTR("uuid"), v10, CFSTR("latest_activity_date"), CFSTR("creation_date"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__168;
  v26 = __Block_byref_object_dispose__168;
  v27 = 0;
  objc_msgSend(v8, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __89__HDWorkoutSessionEntity_sessionIdentifierForRecoveryInProfile_expirationInterval_error___block_invoke;
  v17[3] = &unk_1E6CF6410;
  v20 = a1;
  v13 = v11;
  v21 = a4;
  v18 = v13;
  v19 = &v22;
  LODWORD(a5) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v12, a5, v17);

  if ((_DWORD)a5)
    v14 = (void *)v23[5];
  else
    v14 = 0;
  v15 = v14;

  _Block_object_dispose(&v22, 8);
  return v15;
}

uint64_t __89__HDWorkoutSessionEntity_sessionIdentifierForRecoveryInProfile_expirationInterval_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];

  objc_msgSend(a2, "databaseForEntityClass:", a1[6]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __89__HDWorkoutSessionEntity_sessionIdentifierForRecoveryInProfile_expirationInterval_error___block_invoke_2;
  v10[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v10[4] = a1[7];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __89__HDWorkoutSessionEntity_sessionIdentifierForRecoveryInProfile_expirationInterval_error___block_invoke_3;
  v9[3] = &unk_1E6CE8540;
  v6 = a1[4];
  v9[4] = a1[5];
  v7 = objc_msgSend(v5, "executeSQL:error:bindingHandler:enumerationHandler:", v6, a3, v10, v9);

  return v7;
}

uint64_t __89__HDWorkoutSessionEntity_sessionIdentifierForRecoveryInProfile_expirationInterval_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  double v3;

  v3 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 32);
  return sqlite3_bind_double(a2, 1, v3);
}

uint64_t __89__HDWorkoutSessionEntity_sessionIdentifierForRecoveryInProfile_expirationInterval_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  HDSQLiteColumnWithNameAsUUID();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return 1;
}

- (id)sessionIdentifierWithTransaction:(id)a3 error:(id *)a4
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
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__168;
  v17 = __Block_byref_object_dispose__168;
  v18 = 0;
  v19[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseForEntity:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__HDWorkoutSessionEntity_sessionIdentifierWithTransaction_error___block_invoke;
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

void __65__HDWorkoutSessionEntity_sessionIdentifierWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  HDSQLiteColumnWithNameAsUUID();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)workoutConfigurationWithTransaction:(id)a3 error:(id *)a4
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
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__168;
  v17 = __Block_byref_object_dispose__168;
  v18 = 0;
  v19[0] = CFSTR("workout_configuration");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseForEntity:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__HDWorkoutSessionEntity_workoutConfigurationWithTransaction_error___block_invoke;
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

void __68__HDWorkoutSessionEntity_workoutConfigurationWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_opt_class();
  HDSQLiteColumnWithNameAsObject();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)setWorkoutConfiguration:(id)a3 transaction:(id)a4 error:(id *)a5
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
  v17[0] = CFSTR("workout_configuration");
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a4;
  objc_msgSend(v9, "arrayWithObjects:count:", v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "databaseForEntity:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__HDWorkoutSessionEntity_setWorkoutConfiguration_transaction_error___block_invoke;
  v15[3] = &unk_1E6CE84C8;
  v16 = v8;
  v13 = v8;
  LOBYTE(a5) = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](self, "updateProperties:database:error:bindingHandler:", v11, v12, a5, v15);

  return (char)a5;
}

uint64_t __68__HDWorkoutSessionEntity_setWorkoutConfiguration_transaction_error___block_invoke()
{
  return HDSQLiteBindSecureCodingObjectToProperty();
}

- (id)currentActivityWithTransaction:(id)a3 error:(id *)a4
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
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__168;
  v17 = __Block_byref_object_dispose__168;
  v18 = 0;
  v19[0] = CFSTR("current_activity");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseForEntity:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__HDWorkoutSessionEntity_currentActivityWithTransaction_error___block_invoke;
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

void __63__HDWorkoutSessionEntity_currentActivityWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_opt_class();
  HDSQLiteColumnWithNameAsObject();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)setCurrentActivity:(id)a3 transaction:(id)a4 error:(id *)a5
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
  v17[0] = CFSTR("current_activity");
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a4;
  objc_msgSend(v9, "arrayWithObjects:count:", v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "databaseForEntity:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__HDWorkoutSessionEntity_setCurrentActivity_transaction_error___block_invoke;
  v15[3] = &unk_1E6CE84C8;
  v16 = v8;
  v13 = v8;
  LOBYTE(a5) = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](self, "updateProperties:database:error:bindingHandler:", v11, v12, a5, v15);

  return (char)a5;
}

uint64_t __63__HDWorkoutSessionEntity_setCurrentActivity_transaction_error___block_invoke()
{
  return HDSQLiteBindSecureCodingObjectToProperty();
}

- (id)activityConfigurationsWithTransaction:(id)a3 error:(id *)a4
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
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__168;
  v17 = __Block_byref_object_dispose__168;
  v18 = 0;
  v19[0] = CFSTR("activity_configurations");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseForEntity:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__HDWorkoutSessionEntity_activityConfigurationsWithTransaction_error___block_invoke;
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

void __70__HDWorkoutSessionEntity_activityConfigurationsWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (HDSQLiteColumnWithNameIsNull())
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    v5 = objc_opt_class();
    objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsObjectWithClasses();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v3 = v9;
  }

}

- (BOOL)setActivityConfigurations:(id)a3 transaction:(id)a4 error:(id *)a5
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
  v17[0] = CFSTR("activity_configurations");
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a4;
  objc_msgSend(v9, "arrayWithObjects:count:", v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "databaseForEntity:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__HDWorkoutSessionEntity_setActivityConfigurations_transaction_error___block_invoke;
  v15[3] = &unk_1E6CE84C8;
  v16 = v8;
  v13 = v8;
  LOBYTE(a5) = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](self, "updateProperties:database:error:bindingHandler:", v11, v12, a5, v15);

  return (char)a5;
}

uint64_t __70__HDWorkoutSessionEntity_setActivityConfigurations_transaction_error___block_invoke()
{
  return HDSQLiteBindSecureCodingObjectToProperty();
}

- (id)firstActivityConfigurationWithTransaction:(id)a3 error:(id *)a4
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
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__168;
  v17 = __Block_byref_object_dispose__168;
  v18 = 0;
  v19[0] = CFSTR("first_activity_configuration");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseForEntity:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__HDWorkoutSessionEntity_firstActivityConfigurationWithTransaction_error___block_invoke;
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

void __74__HDWorkoutSessionEntity_firstActivityConfigurationWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_opt_class();
  HDSQLiteColumnWithNameAsObject();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)setFirstActivityConfiguration:(id)a3 transaction:(id)a4 error:(id *)a5
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
  v17[0] = CFSTR("first_activity_configuration");
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a4;
  objc_msgSend(v9, "arrayWithObjects:count:", v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "databaseForEntity:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__HDWorkoutSessionEntity_setFirstActivityConfiguration_transaction_error___block_invoke;
  v15[3] = &unk_1E6CE84C8;
  v16 = v8;
  v13 = v8;
  LOBYTE(a5) = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](self, "updateProperties:database:error:bindingHandler:", v11, v12, a5, v15);

  return (char)a5;
}

uint64_t __74__HDWorkoutSessionEntity_setFirstActivityConfiguration_transaction_error___block_invoke()
{
  return HDSQLiteBindSecureCodingObjectToProperty();
}

- (id)isMirroringInTransaction:(id)a3 error:(id *)a4
{
  return -[HDHealthEntity numberForProperty:transaction:error:](self, "numberForProperty:transaction:error:", CFSTR("is_mirroring"), a3, a4);
}

- (BOOL)setIsMirroring:(BOOL)a3 transaction:(id)a4 error:(id *)a5
{
  _BOOL8 v6;
  void *v8;
  id v9;
  void *v10;

  v6 = a3;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a4;
  objc_msgSend(v8, "numberWithBool:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[HDHealthEntity setNumber:forProperty:transaction:error:](self, "setNumber:forProperty:transaction:error:", v10, CFSTR("is_mirroring"), v9, a5);

  return (char)a5;
}

- (id)requestedStartDateInTransaction:(id)a3 error:(id *)a4
{
  return -[HDHealthEntity dateForProperty:transaction:error:](self, "dateForProperty:transaction:error:", CFSTR("requested_start_date"), a3, a4);
}

- (BOOL)setRequestedStartDate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return -[HDHealthEntity setDate:forProperty:transaction:error:](self, "setDate:forProperty:transaction:error:", a3, CFSTR("requested_start_date"), a4, a5);
}

- (id)startDateInTransaction:(id)a3 error:(id *)a4
{
  return -[HDHealthEntity dateForProperty:transaction:error:](self, "dateForProperty:transaction:error:", CFSTR("start_date"), a3, a4);
}

- (BOOL)setStartDate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return -[HDHealthEntity setDate:forProperty:transaction:error:](self, "setDate:forProperty:transaction:error:", a3, CFSTR("start_date"), a4, a5);
}

- (id)requestedEndDateInTransaction:(id)a3 error:(id *)a4
{
  return -[HDHealthEntity dateForProperty:transaction:error:](self, "dateForProperty:transaction:error:", CFSTR("requested_end_date"), a3, a4);
}

- (BOOL)setRequestedEndDate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return -[HDHealthEntity setDate:forProperty:transaction:error:](self, "setDate:forProperty:transaction:error:", a3, CFSTR("requested_end_date"), a4, a5);
}

- (id)endDateInTransaction:(id)a3 error:(id *)a4
{
  return -[HDHealthEntity dateForProperty:transaction:error:](self, "dateForProperty:transaction:error:", CFSTR("end_date"), a3, a4);
}

- (BOOL)setEndDate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return -[HDHealthEntity setDate:forProperty:transaction:error:](self, "setDate:forProperty:transaction:error:", a3, CFSTR("end_date"), a4, a5);
}

- (id)hasFailedInTransaction:(id)a3 error:(id *)a4
{
  return -[HDHealthEntity numberForProperty:transaction:error:](self, "numberForProperty:transaction:error:", CFSTR("has_failed"), a3, a4);
}

- (BOOL)setHasFailed:(BOOL)a3 transaction:(id)a4 error:(id *)a5
{
  _BOOL8 v6;
  void *v8;
  id v9;
  void *v10;

  v6 = a3;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a4;
  objc_msgSend(v8, "numberWithBool:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[HDHealthEntity setNumber:forProperty:transaction:error:](self, "setNumber:forProperty:transaction:error:", v10, CFSTR("has_failed"), v9, a5);

  return (char)a5;
}

- (id)clientBundleIdentifier:(id)a3 error:(id *)a4
{
  return -[HDHealthEntity stringForProperty:transaction:error:](self, "stringForProperty:transaction:error:", CFSTR("client_bundle_id"), a3, a4);
}

- (BOOL)setClientBundleIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return -[HDHealthEntity setString:forProperty:transaction:error:](self, "setString:forProperty:transaction:error:", a3, CFSTR("client_bundle_id"), a4, a5);
}

- (id)clientApplicationIdentifier:(id)a3 error:(id *)a4
{
  return -[HDHealthEntity stringForProperty:transaction:error:](self, "stringForProperty:transaction:error:", CFSTR("client_application_id"), a3, a4);
}

- (BOOL)setClientApplicationIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return -[HDHealthEntity setString:forProperty:transaction:error:](self, "setString:forProperty:transaction:error:", a3, CFSTR("client_application_id"), a4, a5);
}

- (id)sourceWithTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[HDHealthEntity foreignKeyEntity:forProperty:transaction:error:](self, "foreignKeyEntity:forProperty:transaction:error:", objc_opt_class(), CFSTR("source_id"), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)setSource:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return -[HDHealthEntity setForeignKeyEntity:forProperty:transaction:error:](self, "setForeignKeyEntity:forProperty:transaction:error:", a3, CFSTR("source_id"), a4, a5);
}

- (id)associatedBuilderWithTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[HDHealthEntity foreignKeyEntity:forProperty:transaction:error:](self, "foreignKeyEntity:forProperty:transaction:error:", objc_opt_class(), CFSTR("builder_id"), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)setAssociatedBuilder:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return -[HDHealthEntity setForeignKeyEntity:forProperty:transaction:error:](self, "setForeignKeyEntity:forProperty:transaction:error:", a3, CFSTR("builder_id"), a4, a5);
}

- (id)stateWithTransaction:(id)a3 error:(id *)a4
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
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__168;
  v17 = __Block_byref_object_dispose__168;
  v18 = 0;
  v19[0] = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseForEntity:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__HDWorkoutSessionEntity_stateWithTransaction_error___block_invoke;
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

void __53__HDWorkoutSessionEntity_stateWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  HDSQLiteColumnWithNameAsNumber();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)setState:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("state");
  v14[1] = CFSTR("latest_activity_date");
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a4;
  objc_msgSend(v8, "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseForEntity:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__HDWorkoutSessionEntity_setState_transaction_error___block_invoke;
  v13[3] = &__block_descriptor_40_e34_v16__0__HDSQLiteStatementBinder__8l;
  v13[4] = a3;
  LOBYTE(a5) = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](self, "updateProperties:database:error:bindingHandler:", v10, v11, a5, v13);

  return (char)a5;
}

void __53__HDWorkoutSessionEntity_setState_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  MEMORY[0x1BCCAB114](a2, CFSTR("state"), *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("latest_activity_date"), v3);

}

- (id)requestedTargetStateWithTransaction:(id)a3 error:(id *)a4
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
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__168;
  v17 = __Block_byref_object_dispose__168;
  v18 = 0;
  v19[0] = CFSTR("requested_target_state");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseForEntity:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__HDWorkoutSessionEntity_requestedTargetStateWithTransaction_error___block_invoke;
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

void __68__HDWorkoutSessionEntity_requestedTargetStateWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  HDSQLiteColumnWithNameAsNumber();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)setRequestedTargetState:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("requested_target_state");
  v14[1] = CFSTR("latest_activity_date");
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a4;
  objc_msgSend(v8, "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseForEntity:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__HDWorkoutSessionEntity_setRequestedTargetState_transaction_error___block_invoke;
  v13[3] = &__block_descriptor_40_e34_v16__0__HDSQLiteStatementBinder__8l;
  v13[4] = a3;
  LOBYTE(a5) = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](self, "updateProperties:database:error:bindingHandler:", v10, v11, a5, v13);

  return (char)a5;
}

void __68__HDWorkoutSessionEntity_setRequestedTargetState_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  MEMORY[0x1BCCAB114](a2, CFSTR("requested_target_state"), *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("latest_activity_date"), v3);

}

- (BOOL)insertWorkoutEvent:(id)a3 transaction:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "numberWithLongLong:", -[HDSQLiteEntity persistentID](self, "persistentID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseForEntity:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDWorkoutEventEntity insertPersistableWorkoutEvent:ownerID:database:error:](HDWorkoutSessionEventEntity, "insertPersistableWorkoutEvent:ownerID:database:error:", v10, v11, v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13 != 0;
}

- (id)workoutEventsInTransaction:(id)a3 error:(id *)a4
{
  return +[HDWorkoutSessionEventEntity workoutEventsWithWorkoutSession:transaction:error:](HDWorkoutSessionEventEntity, "workoutEventsWithWorkoutSession:transaction:error:", self, a3, a4);
}

- (BOOL)finishWithTransaction:(id)a3 error:(id *)a4
{
  void *v6;

  objc_msgSend(a3, "databaseForEntity:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[HDSQLiteEntity deleteFromDatabase:error:](self, "deleteFromDatabase:error:", v6, a4);

  return (char)a4;
}

- (id)latestActivityDateInTransaction:(id)a3 error:(id *)a4
{
  return -[HDHealthEntity dateForProperty:transaction:error:](self, "dateForProperty:transaction:error:", CFSTR("latest_activity_date"), a3, a4);
}

- (BOOL)updateLatestActivityDateWithTransaction:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a3;
  objc_msgSend(v6, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[HDWorkoutSessionEntity updateLatestActivityDate:transaction:error:](self, "updateLatestActivityDate:transaction:error:", v8, v7, a4);

  return (char)a4;
}

- (BOOL)updateLatestActivityDate:(id)a3 transaction:(id)a4 error:(id *)a5
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
  v17[0] = CFSTR("latest_activity_date");
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a4;
  objc_msgSend(v9, "arrayWithObjects:count:", v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "databaseForEntity:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__HDWorkoutSessionEntity_updateLatestActivityDate_transaction_error___block_invoke;
  v15[3] = &unk_1E6CE84C8;
  v16 = v8;
  v13 = v8;
  LOBYTE(a5) = -[HDSQLiteEntity updateProperties:database:error:bindingHandler:](self, "updateProperties:database:error:bindingHandler:", v11, v12, a5, v15);

  return (char)a5;
}

void __69__HDWorkoutSessionEntity_updateLatestActivityDate_transaction_error___block_invoke()
{
  JUMPOUT(0x1BCCAB0E4);
}

+ (id)databaseTable
{
  return CFSTR("workout_sessions");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 20;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_88;
}

+ (id)foreignKeys
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("source_id");
  +[HDHealthEntity defaultForeignKey](HDSourceEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("builder_id");
  v8[0] = v2;
  v3 = objc_alloc(MEMORY[0x1E0D29858]);
  v4 = (void *)objc_msgSend(v3, "initWithEntityClass:property:deletionAction:", objc_opt_class(), *MEMORY[0x1E0D29618], 3);
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)privateSubEntities
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
