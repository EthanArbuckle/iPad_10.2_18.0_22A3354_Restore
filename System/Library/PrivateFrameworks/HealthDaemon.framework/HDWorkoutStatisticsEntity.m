@implementation HDWorkoutStatisticsEntity

+ (id)databaseTable
{
  return CFSTR("workout_statistics");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__nonNullableEndDateDefinitions;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("workout_activity_id");
  objc_msgSend((id)objc_msgSend(a1, "ownerEntityClass"), "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)uniquedColumns
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("workout_activity_id");
  v3[1] = CFSTR("data_type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (Class)ownerEntityClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)insertWorkoutStatistics:(id)a3 workoutActivityId:(unint64_t)a4 database:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  unint64_t v22;

  v10 = a3;
  v11 = a5;
  objc_msgSend(v10, "quantityType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "canonicalUnit");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_allProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __86__HDWorkoutStatisticsEntity_insertWorkoutStatistics_workoutActivityId_database_error___block_invoke;
  v19[3] = &unk_1E6CE8268;
  v21 = v13;
  v22 = a4;
  v20 = v10;
  v15 = v13;
  v16 = v10;
  objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 0, v11, v14, a6, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17 != 0;
}

void __86__HDWorkoutStatisticsEntity_insertWorkoutStatistics_workoutActivityId_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  MEMORY[0x1BCCAB114](a2, CFSTR("workout_activity_id"), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "quantityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB114](a2, CFSTR("data_type"), objc_msgSend(v4, "code"));

  objc_msgSend(*(id *)(a1 + 32), "quantity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", *(_QWORD *)(a1 + 40));
  v7 = v6;

  MEMORY[0x1BCCAB0F0](a2, CFSTR("quantity"), v7);
  objc_msgSend(*(id *)(a1 + 32), "min");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "min");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValueForUnit:", *(_QWORD *)(a1 + 40));
    v11 = v10;

    MEMORY[0x1BCCAB0F0](a2, CFSTR("min"), v11);
  }
  else
  {
    MEMORY[0x1BCCAB120](a2, CFSTR("min"));
  }
  objc_msgSend(*(id *)(a1 + 32), "max");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "max");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValueForUnit:", *(_QWORD *)(a1 + 40));

    JUMPOUT(0x1BCCAB0F0);
  }
  JUMPOUT(0x1BCCAB120);
}

+ (BOOL)enumerateWorkoutStatisticsForActivityId:(unint64_t)a3 database:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  _QWORD v16[5];

  v10 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __92__HDWorkoutStatisticsEntity_enumerateWorkoutStatisticsForActivityId_database_error_handler___block_invoke;
  v16[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v16[4] = a1;
  v14 = v10;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __92__HDWorkoutStatisticsEntity_enumerateWorkoutStatisticsForActivityId_database_error_handler___block_invoke_2;
  v15[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v15[4] = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __92__HDWorkoutStatisticsEntity_enumerateWorkoutStatisticsForActivityId_database_error_handler___block_invoke_3;
  v13[3] = &unk_1E6CE82B0;
  v11 = v10;
  LOBYTE(a5) = objc_msgSend(a4, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &enumerateWorkoutStatisticsForActivityId_database_error_handler__enumerationKey, a5, v16, v15, v13);

  return (char)a5;
}

id __92__HDWorkoutStatisticsEntity_enumerateWorkoutStatisticsForActivityId_database_error_handler___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT %@, %@, %@, %@ FROM %@ WHERE %@ = ?"), CFSTR("data_type"), CFSTR("quantity"), CFSTR("min"), CFSTR("max"), v2, CFSTR("workout_activity_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __92__HDWorkoutStatisticsEntity_enumerateWorkoutStatisticsForActivityId_database_error_handler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_double(a2, 1, (double)*(unint64_t *)(a1 + 32));
}

uint64_t __92__HDWorkoutStatisticsEntity_enumerateWorkoutStatisticsForActivityId_database_error_handler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  _HDWorkoutStatistics *v17;
  uint64_t v18;

  objc_msgSend(MEMORY[0x1E0CB6A70], "_quantityTypeWithCode:", HDSQLiteColumnAsInt64());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1BCCAB1A4](a2, 1);
  v6 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(v4, "canonicalUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "quantityWithUnit:doubleValue:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if ((MEMORY[0x1BCCAB204](a2, 2) & 1) == 0)
  {
    v10 = MEMORY[0x1BCCAB1A4](a2, 2);
    v11 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v4, "canonicalUnit");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "quantityWithUnit:doubleValue:", v12, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if ((MEMORY[0x1BCCAB204](a2, 3) & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    v14 = MEMORY[0x1BCCAB1A4](a2, 3);
    v15 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v4, "canonicalUnit");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "quantityWithUnit:doubleValue:", v16, v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v17 = -[_HDWorkoutStatistics initWithQuantityType:quantity:min:max:]([_HDWorkoutStatistics alloc], "initWithQuantityType:quantity:min:max:", v4, v8, v9, v13);
  v18 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v18;
}

+ (id)workoutStatisticsForActivityId:(unint64_t)a3 quantityType:(id)a4 database:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  _QWORD v20[4];
  id v21;
  unint64_t v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v10 = a4;
  v11 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__4;
  v28 = __Block_byref_object_dispose__4;
  v29 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v22 = a3;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __88__HDWorkoutStatisticsEntity_workoutStatisticsForActivityId_quantityType_database_error___block_invoke;
  v23[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v23[4] = a1;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __88__HDWorkoutStatisticsEntity_workoutStatisticsForActivityId_quantityType_database_error___block_invoke_2;
  v20[3] = &unk_1E6CE82D8;
  v21 = v10;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __88__HDWorkoutStatisticsEntity_workoutStatisticsForActivityId_quantityType_database_error___block_invoke_3;
  v17[3] = &unk_1E6CE8300;
  v13 = v21;
  v18 = v13;
  v19 = &v24;
  if (objc_msgSend(v11, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &workoutStatisticsForActivityId_quantityType_database_error__enumerationKey, a6, v23, v20, v17))v14 = (void *)v25[5];
  else
    v14 = 0;
  v15 = v14;

  _Block_object_dispose(&v24, 8);
  return v15;
}

id __88__HDWorkoutStatisticsEntity_workoutStatisticsForActivityId_quantityType_database_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT %@, %@, %@ FROM %@ WHERE %@ = ? AND %@ = ?"), CFSTR("quantity"), CFSTR("min"), CFSTR("max"), v2, CFSTR("workout_activity_id"), CFSTR("data_type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __88__HDWorkoutStatisticsEntity_workoutStatisticsForActivityId_quantityType_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_double(a2, 1, (double)*(unint64_t *)(a1 + 40));
  return sqlite3_bind_double(a2, 2, (double)objc_msgSend(*(id *)(a1 + 32), "code"));
}

uint64_t __88__HDWorkoutStatisticsEntity_workoutStatisticsForActivityId_quantityType_database_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  _HDWorkoutStatistics *v16;
  uint64_t v17;
  void *v18;

  v4 = MEMORY[0x1BCCAB1A4](a2, 0);
  v5 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(*(id *)(a1 + 32), "canonicalUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantityWithUnit:doubleValue:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if ((MEMORY[0x1BCCAB204](a2, 1) & 1) == 0)
  {
    v9 = MEMORY[0x1BCCAB1A4](a2, 1);
    v10 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(*(id *)(a1 + 32), "canonicalUnit");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "quantityWithUnit:doubleValue:", v11, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if ((MEMORY[0x1BCCAB204](a2, 2) & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v13 = MEMORY[0x1BCCAB1A4](a2, 2);
    v14 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(*(id *)(a1 + 32), "canonicalUnit");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "quantityWithUnit:doubleValue:", v15, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v16 = -[_HDWorkoutStatistics initWithQuantityType:quantity:min:max:]([_HDWorkoutStatistics alloc], "initWithQuantityType:quantity:min:max:", *(_QWORD *)(a1 + 32), v7, v8, v12);
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;

  return 0;
}

+ (id)_allProperties
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("workout_activity_id");
  v3[1] = CFSTR("data_type");
  v3[2] = CFSTR("quantity");
  v3[3] = CFSTR("min");
  v3[4] = CFSTR("max");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
