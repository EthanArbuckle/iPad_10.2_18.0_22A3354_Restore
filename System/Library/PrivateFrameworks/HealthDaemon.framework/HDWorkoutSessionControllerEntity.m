@implementation HDWorkoutSessionControllerEntity

+ (id)databaseTable
{
  return CFSTR("workout_session_controllers");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_90;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("workout_session_id");
  +[HDHealthEntity defaultForeignKey](HDWorkoutSessionEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)uniquedColumns
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("workout_session_id");
  v3[1] = CFSTR("recovery_identifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)storeArchivedStateWithRecoveryIdentifier:(id)a3 archivedState:(id)a4 workoutSession:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v28[0] = CFSTR("workout_session_id");
  v28[1] = CFSTR("recovery_identifier");
  v28[2] = CFSTR("archived_state");
  v15 = (void *)MEMORY[0x1E0C99D20];
  v16 = a6;
  objc_msgSend(v15, "arrayWithObjects:count:", v28, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "databaseForEntityClass:", a1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __124__HDWorkoutSessionControllerEntity_storeArchivedStateWithRecoveryIdentifier_archivedState_workoutSession_transaction_error___block_invoke;
  v24[3] = &unk_1E6CFD128;
  v25 = v14;
  v26 = v12;
  v27 = v13;
  v19 = v13;
  v20 = v12;
  v21 = v14;
  objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 1, v18, v17, a7, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22 != 0;
}

void __124__HDWorkoutSessionControllerEntity_storeArchivedStateWithRecoveryIdentifier_archivedState_workoutSession_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1BCCAB114](a2, CFSTR("workout_session_id"), objc_msgSend(*(id *)(a1 + 32), "persistentID"));
  MEMORY[0x1BCCAB144](a2, CFSTR("recovery_identifier"), *(_QWORD *)(a1 + 40));
  JUMPOUT(0x1BCCAB0D8);
}

+ (BOOL)retrieveArchivedStateFromRecoveryIdentifier:(id)a3 workoutSession:(id)a4 transaction:(id)a5 error:(id *)a6 block:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  _QWORD v32[4];
  id v33;
  id v34;
  const __CFString *v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a7;
  v14 = a5;
  v15 = a4;
  v16 = v12;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("recovery_identifier"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D29838];
  v19 = (void *)MEMORY[0x1E0CB37E8];
  v20 = objc_msgSend(v15, "persistentID");

  objc_msgSend(v19, "numberWithLongLong:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "predicateWithProperty:equalToValue:", CFSTR("workout_session_id"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0D29840];
  v36[0] = v17;
  v36[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "predicateMatchingAllPredicates:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "databaseForEntityClass:", a1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "queryWithDatabase:predicate:", v26, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = CFSTR("archived_state");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __119__HDWorkoutSessionControllerEntity_retrieveArchivedStateFromRecoveryIdentifier_workoutSession_transaction_error_block___block_invoke;
  v32[3] = &unk_1E6D0BF90;
  v33 = v16;
  v34 = v13;
  v29 = v16;
  v30 = v13;
  LOBYTE(a6) = objc_msgSend(v27, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v28, a6, v32);

  return (char)a6;
}

uint64_t __119__HDWorkoutSessionControllerEntity_retrieveArchivedStateFromRecoveryIdentifier_workoutSession_transaction_error_block___block_invoke(uint64_t a1)
{
  void *v2;

  HDSQLiteColumnWithNameAsData();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return 0;
}

@end
