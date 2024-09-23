@implementation HDWorkoutBuilderAssociatedObjectEntity

+ (int64_t)associateObject:(id)a3 timestamp:(double)a4 withBuilder:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  char v16;
  id v17;
  void *v18;
  int64_t v19;
  _QWORD v21[4];
  id v22;
  id v23;
  double v24;
  _QWORD v25[5];
  id v26;

  v11 = a3;
  v12 = a5;
  objc_msgSend(a6, "databaseForEntityClass:", a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __98__HDWorkoutBuilderAssociatedObjectEntity_associateObject_timestamp_withBuilder_transaction_error___block_invoke;
  v25[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v25[4] = a1;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __98__HDWorkoutBuilderAssociatedObjectEntity_associateObject_timestamp_withBuilder_transaction_error___block_invoke_2;
  v21[3] = &unk_1E6CF0080;
  v14 = v12;
  v22 = v14;
  v15 = v11;
  v23 = v15;
  v24 = a4;
  v16 = objc_msgSend(v13, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &associateObject_timestamp_withBuilder_transaction_error__insertKey, &v26, v25, v21, 0);
  v17 = v26;
  v18 = v17;
  if ((v16 & 1) != 0)
  {
    v19 = 1;
  }
  else if (objc_msgSend(v17, "hd_isConstraintViolation"))
  {
    v19 = 2;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

id __98__HDWorkoutBuilderAssociatedObjectEntity_associateObject_timestamp_withBuilder_transaction_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v5[0] = CFSTR("workout_builder_id");
  v5[1] = CFSTR("object_uuid");
  v5[2] = CFSTR("timestamp");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "insertSQLForProperties:shouldReplace:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __98__HDWorkoutBuilderAssociatedObjectEntity_associateObject_timestamp_withBuilder_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;

  sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  return sqlite3_bind_double(a2, 3, *(double *)(a1 + 48));
}

+ (BOOL)enumerateAssociatedUUIDsForBuilder:(id)a3 transaction:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];

  v10 = a3;
  v11 = a6;
  objc_msgSend(a4, "databaseForEntityClass:", a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v10;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __101__HDWorkoutBuilderAssociatedObjectEntity_enumerateAssociatedUUIDsForBuilder_transaction_error_block___block_invoke;
  v20[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v20[4] = a1;
  v17 = v11;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __101__HDWorkoutBuilderAssociatedObjectEntity_enumerateAssociatedUUIDsForBuilder_transaction_error_block___block_invoke_2;
  v18[3] = &unk_1E6CE9508;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __101__HDWorkoutBuilderAssociatedObjectEntity_enumerateAssociatedUUIDsForBuilder_transaction_error_block___block_invoke_3;
  v16[3] = &unk_1E6CE82B0;
  v13 = v11;
  v14 = v10;
  LOBYTE(a5) = objc_msgSend(v12, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &enumerateAssociatedUUIDsForBuilder_transaction_error_block__enumerationKey, a5, v20, v18, v16);

  return (char)a5;
}

id __101__HDWorkoutBuilderAssociatedObjectEntity_enumerateAssociatedUUIDsForBuilder_transaction_error_block___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT DISTINCT %@ FROM %@ WHERE %@ = ?"), CFSTR("object_uuid"), v2, CFSTR("workout_builder_id"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __101__HDWorkoutBuilderAssociatedObjectEntity_enumerateAssociatedUUIDsForBuilder_transaction_error_block___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
}

uint64_t __101__HDWorkoutBuilderAssociatedObjectEntity_enumerateAssociatedUUIDsForBuilder_transaction_error_block___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v3 = *(id *)(a1 + 32);
  v1 = HKWithAutoreleasePool();

  return v1;
}

uint64_t __101__HDWorkoutBuilderAssociatedObjectEntity_enumerateAssociatedUUIDsForBuilder_transaction_error_block___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 32);
  MEMORY[0x1BCCAB1E0](*(_QWORD *)(a1 + 40), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v4, a2);

  return v5;
}

+ (BOOL)removeAssociationFromBuilder:(id)a3 toUUID:(id)a4 transaction:(id)a5 error:(id *)a6
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
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = a5;
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ = ? AND %@ = ?"), v14, CFSTR("workout_builder_id"), CFSTR("object_uuid"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "databaseForEntityClass:", a1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __96__HDWorkoutBuilderAssociatedObjectEntity_removeAssociationFromBuilder_toUUID_transaction_error___block_invoke;
  v20[3] = &unk_1E6CE7750;
  v21 = v10;
  v22 = v11;
  v17 = v11;
  v18 = v10;
  LOBYTE(a6) = objc_msgSend(v16, "executeSQL:error:bindingHandler:enumerationHandler:", v15, a6, v20, 0);

  return (char)a6;
}

uint64_t __96__HDWorkoutBuilderAssociatedObjectEntity_removeAssociationFromBuilder_toUUID_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
  return HDSQLiteBindFoundationValueToStatement();
}

+ (id)databaseTable
{
  return CFSTR("workout_builder_associated_objects");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 3;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_57;
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
  v3[1] = CFSTR("object_uuid");
  v3[2] = CFSTR("timestamp");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)protectionClass
{
  return 1;
}

@end
