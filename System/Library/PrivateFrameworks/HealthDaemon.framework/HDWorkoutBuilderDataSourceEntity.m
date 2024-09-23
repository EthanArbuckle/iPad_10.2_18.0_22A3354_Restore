@implementation HDWorkoutBuilderDataSourceEntity

+ (BOOL)storeDataSourceWithIdentifier:(id)a3 archivedState:(id)a4 workoutBuilder:(id)a5 transaction:(id)a6 error:(id *)a7
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
  v28[0] = CFSTR("workout_builder_id");
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
  v24[2] = __113__HDWorkoutBuilderDataSourceEntity_storeDataSourceWithIdentifier_archivedState_workoutBuilder_transaction_error___block_invoke;
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

void __113__HDWorkoutBuilderDataSourceEntity_storeDataSourceWithIdentifier_archivedState_workoutBuilder_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1BCCAB114](a2, CFSTR("workout_builder_id"), objc_msgSend(*(id *)(a1 + 32), "persistentID"));
  MEMORY[0x1BCCAB144](a2, CFSTR("recovery_identifier"), *(_QWORD *)(a1 + 40));
  JUMPOUT(0x1BCCAB0D8);
}

+ (BOOL)removeDataSourceWithIdentifier:(id)a3 fromWorkoutBuilder:(id)a4 transaction:(id)a5 error:(id *)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v10 = (void *)MEMORY[0x1E0D29838];
  v11 = a5;
  v12 = a4;
  objc_msgSend(v10, "predicateWithProperty:equalToValue:", CFSTR("recovery_identifier"), a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D29838];
  v15 = (void *)MEMORY[0x1E0CB37E8];
  v16 = objc_msgSend(v12, "persistentID");

  objc_msgSend(v15, "numberWithLongLong:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "predicateWithProperty:equalToValue:", CFSTR("workout_builder_id"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0D29840];
  v24[0] = v13;
  v24[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "predicateMatchingAllPredicates:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "databaseForEntityClass:", a1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a6) = objc_msgSend(a1, "deleteEntitiesInDatabase:predicate:error:", v22, v21, a6);
  return (char)a6;
}

+ (BOOL)enumerateDataSourcesForWorkoutBuilder:(id)a3 transaction:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = (void *)MEMORY[0x1E0D29838];
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = a4;
  objc_msgSend(v12, "numberWithLongLong:", objc_msgSend(a3, "persistentID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateWithProperty:equalToValue:", CFSTR("workout_builder_id"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "databaseForEntityClass:", a1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "queryWithDatabase:predicate:", v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = CFSTR("recovery_identifier");
  v23[1] = CFSTR("archived_state");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __98__HDWorkoutBuilderDataSourceEntity_enumerateDataSourcesForWorkoutBuilder_transaction_error_block___block_invoke;
  v21[3] = &unk_1E6CE91B8;
  v22 = v10;
  v19 = v10;
  LOBYTE(a5) = objc_msgSend(v17, "enumerateProperties:error:enumerationHandler:", v18, a5, v21);

  return (char)a5;
}

uint64_t __98__HDWorkoutBuilderDataSourceEntity_enumerateDataSourcesForWorkoutBuilder_transaction_error_block___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  HDSQLiteColumnWithNameAsString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsData();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v4;
}

+ (id)databaseTable
{
  return CFSTR("workout_builder_data_sources");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_107;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("workout_builder_id");
  +[HDHealthEntity defaultForeignKey](HDWorkoutBuilderEntity, "defaultForeignKey");
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

@end
