@implementation HDWorkoutBuilderAssociatedSeriesEntity

+ (int64_t)associateSeries:(id)a3 toWorkoutBuilderID:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  +[HDWorkoutBuilderEntity workoutBuilderEntityWithIdentifier:profile:error:](HDWorkoutBuilderEntity, "workoutBuilderEntityWithIdentifier:profile:error:", a4, v11, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v24[0] = CFSTR("workout_builder_id");
    v24[1] = CFSTR("series_uuid");
    v24[2] = CFSTR("series_type");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "database");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __91__HDWorkoutBuilderAssociatedSeriesEntity_associateSeries_toWorkoutBuilderID_profile_error___block_invoke;
    v21 = &unk_1E6CE89A8;
    v22 = v12;
    v23 = v10;
    objc_msgSend(a1, "insertOrReplaceEntity:healthDatabase:properties:error:bindingHandler:", 0, v14, v13, a6, &v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = 1;
    }
    else if (objc_msgSend(*a6, "hd_isConstraintViolation", v18, v19, v20, v21, v22))
    {
      v16 = 2;
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __91__HDWorkoutBuilderAssociatedSeriesEntity_associateSeries_toWorkoutBuilderID_profile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  MEMORY[0x1BCCAB114](a2, CFSTR("workout_builder_id"), objc_msgSend(*(id *)(a1 + 32), "persistentID"));
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB168](a2, CFSTR("series_uuid"), v4);

  objc_msgSend(*(id *)(a1 + 40), "sampleType");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB114](a2, CFSTR("series_type"), objc_msgSend(v5, "code"));

}

+ (id)seriesForBuilder:(id)a3 profile:(id)a4 error:(id *)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  id v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v8 = (objc_class *)MEMORY[0x1E0C99E08];
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(v8);
  v12 = (void *)MEMORY[0x1E0D29838];
  v13 = (void *)MEMORY[0x1E0CB37E8];
  v14 = objc_msgSend(v10, "persistentID");

  objc_msgSend(v13, "numberWithLongLong:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _HDSQLiteValueForNumber();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateWithProperty:equalToValue:", CFSTR("workout_builder_id"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = CFSTR("series_uuid");
  v28[1] = CFSTR("series_type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "database");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __73__HDWorkoutBuilderAssociatedSeriesEntity_seriesForBuilder_profile_error___block_invoke;
  v26 = &unk_1E6CE9FC0;
  v20 = v11;
  v27 = v20;
  LODWORD(a5) = objc_msgSend(a1, "enumerateProperties:withPredicate:healthDatabase:error:enumerationHandler:", v18, v17, v19, a5, &v23);

  if ((_DWORD)a5)
    v21 = (void *)objc_msgSend(v20, "copy", v23, v24, v25, v26);
  else
    v21 = 0;

  return v21;
}

uint64_t __73__HDWorkoutBuilderAssociatedSeriesEntity_seriesForBuilder_profile_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  HDSQLiteColumnWithNameAsUUID();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6B50], "dataTypeWithCode:", HDSQLiteColumnWithNameAsInt64());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v2);

  return 1;
}

+ (BOOL)enumerateSeriesForBuilder:(id)a3 transaction:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v10 = a3;
  v11 = a6;
  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = a4;
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@ = ?"), CFSTR("series_uuid"), v14, CFSTR("workout_builder_id"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "databaseForEntityClass:", a1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v11;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __92__HDWorkoutBuilderAssociatedSeriesEntity_enumerateSeriesForBuilder_transaction_error_block___block_invoke;
  v22[3] = &unk_1E6CE9508;
  v23 = v10;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __92__HDWorkoutBuilderAssociatedSeriesEntity_enumerateSeriesForBuilder_transaction_error_block___block_invoke_2;
  v20[3] = &unk_1E6CE82B0;
  v17 = v11;
  v18 = v10;
  LOBYTE(a5) = objc_msgSend(v16, "executeSQL:error:bindingHandler:enumerationHandler:", v15, a5, v22, v20);

  return (char)a5;
}

uint64_t __92__HDWorkoutBuilderAssociatedSeriesEntity_enumerateSeriesForBuilder_transaction_error_block___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
}

uint64_t __92__HDWorkoutBuilderAssociatedSeriesEntity_enumerateSeriesForBuilder_transaction_error_block___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  HDSQLiteColumnWithNameAsUUID();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v3;
}

+ (id)allBuilderAssociatedSeriesWithProfile:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  v16[0] = CFSTR("series_uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __86__HDWorkoutBuilderAssociatedSeriesEntity_allBuilderAssociatedSeriesWithProfile_error___block_invoke;
  v14[3] = &unk_1E6CE9FC0;
  v11 = v8;
  v15 = v11;
  LODWORD(a1) = objc_msgSend(a1, "enumerateProperties:withPredicate:healthDatabase:error:enumerationHandler:", v9, 0, v10, a4, v14);

  v12 = 0;
  if ((_DWORD)a1)
    v12 = (void *)objc_msgSend(v11, "copy");

  return v12;
}

uint64_t __86__HDWorkoutBuilderAssociatedSeriesEntity_allBuilderAssociatedSeriesWithProfile_error___block_invoke(uint64_t a1)
{
  void *v2;

  HDSQLiteColumnWithNameAsUUID();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);

  return 1;
}

+ (id)databaseTable
{
  return CFSTR("workout_builder_associated_series");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 3;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_36;
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

+ (id)uniquedColumns
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("workout_builder_id");
  v3[1] = CFSTR("series_uuid");
  v3[2] = CFSTR("series_type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)protectionClass
{
  return 1;
}

@end
