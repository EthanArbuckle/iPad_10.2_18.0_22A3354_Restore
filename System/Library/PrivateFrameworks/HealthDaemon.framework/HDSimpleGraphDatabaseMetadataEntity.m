@implementation HDSimpleGraphDatabaseMetadataEntity

- (HDSimpleGraphDatabaseMetadataEntity)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

+ (BOOL)setMetadataValue:(id)a3 forKey:(id)a4 database:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)();
  void *v30;
  id v31;
  id v32;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (v13)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSimpleGraphDatabaseMetadataEntity.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSimpleGraphDatabaseMetadataEntity.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

LABEL_3:
  if ((objc_msgSend(v13, "isWriter") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSimpleGraphDatabaseMetadataEntity.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database.isWriter"));

    if (v11)
      goto LABEL_5;
LABEL_9:
    v23 = v12;
    v24 = v13;
    objc_opt_self();
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __76__HDSimpleGraphDatabaseMetadataEntity__deleteMetadataForKey_database_error___block_invoke;
    v30 = &unk_1E6CE9508;
    v31 = v23;
    v25 = v23;
    v19 = objc_msgSend(v24, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("DELETE FROM metadata WHERE key = ?"), a6, &v27, 0);

    goto LABEL_10;
  }
  if (!v11)
    goto LABEL_9;
LABEL_5:
  v14 = v11;
  v15 = v12;
  v16 = v13;
  objc_opt_self();
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __76__HDSimpleGraphDatabaseMetadataEntity__setMetadataValue_key_database_error___block_invoke_2;
  v30 = &unk_1E6CE7750;
  v31 = v15;
  v32 = v14;
  v17 = v14;
  v18 = v15;
  v19 = objc_msgSend(v16, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_setMetadataValue_key_database_error__statementKey, a6, &__block_literal_global_219_0, &v27, 0);

LABEL_10:
  return v19;
}

+ (BOOL)metadataValueForKey:(id)a3 valueOut:(id *)a4 database:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  char v15;
  BOOL v16;
  char v17;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v11 = a3;
  v12 = a5;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSimpleGraphDatabaseMetadataEntity.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database"));

  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__23;
  v27 = __Block_byref_object_dispose__23;
  v28 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __83__HDSimpleGraphDatabaseMetadataEntity_metadataValueForKey_valueOut_database_error___block_invoke_2;
  v21[3] = &unk_1E6CE9508;
  v14 = v11;
  v22 = v14;
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __83__HDSimpleGraphDatabaseMetadataEntity_metadataValueForKey_valueOut_database_error___block_invoke_3;
  v20[3] = &unk_1E6CE8540;
  v20[4] = &v23;
  v15 = objc_msgSend(v12, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &metadataValueForKey_valueOut_database_error__statementKey, a6, &__block_literal_global_29, v21, v20);
  v16 = v15;
  if (a4)
    v17 = v15;
  else
    v17 = 0;
  if ((v17 & 1) != 0)
    *a4 = objc_retainAutorelease((id)v24[5]);

  _Block_object_dispose(&v23, 8);
  return v16;
}

const __CFString *__83__HDSimpleGraphDatabaseMetadataEntity_metadataValueForKey_valueOut_database_error___block_invoke()
{
  return CFSTR("SELECT metadata.value FROM metadata WHERE metadata.key = ?");
}

uint64_t __83__HDSimpleGraphDatabaseMetadataEntity_metadataValueForKey_valueOut_database_error___block_invoke_2()
{
  return HDSQLiteBindStringToStatement();
}

uint64_t __83__HDSimpleGraphDatabaseMetadataEntity_metadataValueForKey_valueOut_database_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  MEMORY[0x1BCCAB1D4](a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 1;
}

+ (BOOL)enumerateMetadataValuesWithPredicate:(id)a3 database:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v20[0] = CFSTR("key");
  v20[1] = CFSTR("value");
  v11 = (void *)MEMORY[0x1E0C99D20];
  v12 = a4;
  v13 = a3;
  objc_msgSend(v11, "arrayWithObjects:count:", v20, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0D29968];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __110__HDSimpleGraphDatabaseMetadataEntity_enumerateMetadataValuesWithPredicate_database_error_enumerationHandler___block_invoke;
  v18[3] = &unk_1E6CE91B8;
  v19 = v10;
  v16 = v10;
  LOBYTE(a5) = objc_msgSend(a1, "enumerateQueryResultsFromColumns:properties:predicate:groupBy:orderingTerms:limit:database:error:enumerationHandler:", v14, v14, v13, 0, 0, v15, v12, a5, v18);

  return (char)a5;
}

uint64_t __110__HDSimpleGraphDatabaseMetadataEntity_enumerateMetadataValuesWithPredicate_database_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;

  MEMORY[0x1BCCAB1D4](a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1D4](a3, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v7;
}

+ (id)databaseTable
{
  return CFSTR("metadata");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 3;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_13;
}

uint64_t __76__HDSimpleGraphDatabaseMetadataEntity__deleteMetadataForKey_database_error___block_invoke()
{
  return HDSQLiteBindStringToStatement();
}

const __CFString *__76__HDSimpleGraphDatabaseMetadataEntity__setMetadataValue_key_database_error___block_invoke()
{
  return CFSTR("INSERT INTO metadata (key, value) VALUES (?, ?) ON CONFLICT(key) DO UPDATE SET value = ?");
}

uint64_t __76__HDSimpleGraphDatabaseMetadataEntity__setMetadataValue_key_database_error___block_invoke_2()
{
  HDSQLiteBindStringToStatement();
  HDSQLiteBindFoundationValueToStatement();
  return HDSQLiteBindFoundationValueToStatement();
}

@end
