@implementation HDAdHocConceptEntity

+ (id)databaseTable
{
  return CFSTR("ad_hoc_concepts");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_79;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)adHocConceptForIdentifier:(id)a3 options:(unint64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v10 = a3;
  v11 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__156;
  v26 = __Block_byref_object_dispose__156;
  v27 = 0;
  objc_msgSend(v11, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__HDAdHocConceptEntity_adHocConceptForIdentifier_options_profile_error___block_invoke;
  v17[3] = &unk_1E6D02450;
  v19 = &v22;
  v20 = a1;
  v13 = v10;
  v18 = v13;
  v21 = a4;
  LODWORD(a6) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v12, a6, v17);

  if ((_DWORD)a6)
    v14 = (void *)v23[5];
  else
    v14 = 0;
  v15 = v14;

  _Block_object_dispose(&v22, 8);
  return v15;
}

BOOL __72__HDAdHocConceptEntity_adHocConceptForIdentifier_options_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[7];
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(id *)(a1 + 32);
  v8 = a2;
  v9 = objc_opt_self();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__156;
  v26 = __Block_byref_object_dispose__156;
  v27 = 0;
  objc_msgSend(v8, "protectedDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __77__HDAdHocConceptEntity__adHocConceptForIdentifier_options_transaction_error___block_invoke;
  v21[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v21[4] = v9;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __77__HDAdHocConceptEntity__adHocConceptForIdentifier_options_transaction_error___block_invoke_2;
  v19[3] = &unk_1E6CE9508;
  v12 = v7;
  v20 = v12;
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __77__HDAdHocConceptEntity__adHocConceptForIdentifier_options_transaction_error___block_invoke_3;
  v18[3] = &unk_1E6D024A0;
  v18[4] = &v22;
  v18[5] = v9;
  v18[6] = v6;
  LOBYTE(v9) = objc_msgSend(v10, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_adHocConceptForIdentifier_options_transaction_error__statementKey, a3, v21, v19, v18);

  if ((v9 & 1) != 0)
  {
    v13 = (void *)v23[5];
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 118, CFSTR("No adHoc concept found for identifier %@"), v12);
      v13 = (void *)v23[5];
    }
    v14 = v13;
  }
  else
  {
    v14 = 0;
  }

  _Block_object_dispose(&v22, 8);
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

+ (id)adHocConceptForCodingCollection:(id)a3 options:(unint64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v10 = a3;
  v11 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__156;
  v26 = __Block_byref_object_dispose__156;
  v27 = 0;
  objc_msgSend(v11, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78__HDAdHocConceptEntity_adHocConceptForCodingCollection_options_profile_error___block_invoke;
  v17[3] = &unk_1E6D02450;
  v19 = &v22;
  v20 = a1;
  v13 = v10;
  v18 = v13;
  v21 = a4;
  LODWORD(a6) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v12, a6, v17);

  if ((_DWORD)a6)
    v14 = (void *)v23[5];
  else
    v14 = 0;
  v15 = v14;

  _Block_object_dispose(&v22, 8);
  return v15;
}

BOOL __78__HDAdHocConceptEntity_adHocConceptForCodingCollection_options_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  +[HDAdHocConceptEntity _adHocConceptForCodingCollection:options:transaction:error:](*(_QWORD *)(a1 + 48), *(void **)(a1 + 32), *(_QWORD *)(a1 + 56), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

+ (id)_adHocConceptForCodingCollection:(uint64_t)a3 options:(void *)a4 transaction:(uint64_t)a5 error:
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[7];
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a2;
  v9 = a4;
  v10 = objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB64E0], "adHocCodingForCodingCollection:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "code");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__156;
  v27 = __Block_byref_object_dispose__156;
  v28 = 0;
  objc_msgSend(v9, "protectedDatabase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __83__HDAdHocConceptEntity__adHocConceptForCodingCollection_options_transaction_error___block_invoke;
  v22[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v22[4] = v10;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __83__HDAdHocConceptEntity__adHocConceptForCodingCollection_options_transaction_error___block_invoke_2;
  v20[3] = &unk_1E6CE9508;
  v15 = v12;
  v21 = v15;
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __83__HDAdHocConceptEntity__adHocConceptForCodingCollection_options_transaction_error___block_invoke_3;
  v19[3] = &unk_1E6D024A0;
  v19[4] = &v23;
  v19[5] = v10;
  v19[6] = a3;
  LOBYTE(a3) = objc_msgSend(v13, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_adHocConceptForCodingCollection_options_transaction_error__statementKey, a5, v22, v20, v19);

  if ((a3 & 1) != 0)
  {
    v16 = (void *)v24[5];
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 118, CFSTR("No adHoc concept found for code %@"), v15);
      v16 = (void *)v24[5];
    }
    v17 = v16;
  }
  else
  {
    v17 = 0;
  }

  _Block_object_dispose(&v23, 8);
  return v17;
}

+ (id)generateAdHocConceptForCodingCollection:(id)a3 options:(unint64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v10 = a3;
  v11 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__156;
  v26 = __Block_byref_object_dispose__156;
  v27 = 0;
  objc_msgSend(v11, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __86__HDAdHocConceptEntity_generateAdHocConceptForCodingCollection_options_profile_error___block_invoke;
  v17[3] = &unk_1E6D02450;
  v19 = &v22;
  v20 = a1;
  v13 = v10;
  v18 = v13;
  v21 = a4;
  LODWORD(a6) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v12, a6, v17);

  if ((_DWORD)a6)
    v14 = (void *)v23[5];
  else
    v14 = 0;
  v15 = v14;

  _Block_object_dispose(&v22, 8);
  return v15;
}

BOOL __86__HDAdHocConceptEntity_generateAdHocConceptForCodingCollection_options_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  _QWORD v24[5];

  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(id *)(a1 + 32);
  v8 = a2;
  v9 = objc_opt_self();
  v10 = (void *)MEMORY[0x1E0CB64E0];
  objc_msgSend(MEMORY[0x1E0CB64B0], "inMemoryConceptIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "synthesizeConceptWithIdentifier:forCodingCollection:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v12;
  v14 = v8;
  v15 = objc_opt_self();
  objc_msgSend(v14, "protectedDatabase");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v13;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __62__HDAdHocConceptEntity__insertAdHocConcept_transaction_error___block_invoke;
  v24[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v24[4] = v15;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __62__HDAdHocConceptEntity__insertAdHocConcept_transaction_error___block_invoke_2;
  v22[3] = &unk_1E6CE9508;
  v17 = v13;
  LODWORD(v15) = objc_msgSend(v16, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_insertAdHocConcept_transaction_error__statementKey, a3, v24, v22, 0);

  v18 = 0;
  if ((_DWORD)v15)
  {
    +[HDAdHocConceptEntity _adHocConceptForCodingCollection:options:transaction:error:](v9, v7, v6, v14, a3);
    v18 = objc_claimAutoreleasedReturnValue();
  }

  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v18;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

+ (BOOL)enumerateAdHocConceptWithRawIdentifiers:(id)a3 options:(unint64_t)a4 profile:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  unint64_t v22;

  v12 = a7;
  v13 = (void *)MEMORY[0x1E0D29848];
  v14 = a5;
  objc_msgSend(v13, "containsPredicateWithProperty:values:", CFSTR("concept_identifier"), a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __105__HDAdHocConceptEntity_enumerateAdHocConceptWithRawIdentifiers_options_profile_error_enumerationHandler___block_invoke;
  v19[3] = &unk_1E6D02478;
  v20 = v12;
  v21 = a1;
  v22 = a4;
  v17 = v12;
  LOBYTE(a6) = objc_msgSend(a1, "enumerateProperties:withPredicate:healthDatabase:error:enumerationHandler:", &unk_1E6DF9ED8, v15, v16, a6, v19);

  return (char)a6;
}

uint64_t __105__HDAdHocConceptEntity_enumerateAdHocConceptWithRawIdentifiers_options_profile_error_enumerationHandler___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v6 = a1[4];
  +[HDAdHocConceptEntity _conceptForRow:options:](a1[5], a4, a1[6]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v6 + 16))(v6, v7, a5);

  return v8;
}

+ (id)_conceptForRow:(uint64_t)a3 options:
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  objc_opt_self();
  v5 = HDSQLiteColumnAsInt64();
  MEMORY[0x1BCCAB1D4](a2, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HDSQLiteColumnAsInt64();
  MEMORY[0x1BCCAB1D4](a2, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1D4](a2, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB64A8]), "initWithType:value:version:deleted:", 2, v6, v7, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB64A8]), "initWithType:value:version:deleted:", 959, v8, v7, 0);
  v13 = (void *)objc_msgSend(v10, "initWithObjects:", v11, v12, 0);

  if (v9)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB64A8]), "initWithType:value:version:deleted:", 1012, v9, v7, 0);
    objc_msgSend(v13, "addObject:", v14);

  }
  v15 = objc_alloc(MEMORY[0x1E0CB64A0]);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB64B0]), "initWithRawIdentifier:", v5);
  v17 = (void *)objc_msgSend(v15, "initWithIdentifier:attributes:relationships:version:deleted:options:", v16, v13, MEMORY[0x1E0C9AA60], v7, 0, a3);

  return v17;
}

+ (BOOL)deleteNonIndexedConceptsWithTransaction:(id)a3 error:(id *)a4
{
  void *v6;
  _QWORD v8[5];

  objc_msgSend(a3, "protectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__HDAdHocConceptEntity_deleteNonIndexedConceptsWithTransaction_error___block_invoke;
  v8[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v8[4] = a1;
  LOBYTE(a4) = objc_msgSend(v6, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &deleteNonIndexedConceptsWithTransaction_error__statementKey, a4, v8, 0, 0);

  return (char)a4;
}

id __70__HDAdHocConceptEntity_deleteNonIndexedConceptsWithTransaction_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDConceptIndexEntity, "disambiguatedDatabaseTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedSQLForProperty:", CFSTR("concept_identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDConceptIndexEntity, "disambiguatedSQLForProperty:", 0x1E6D240B8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("DELETE FROM %@ WHERE NOT EXISTS (SELECT 1 FROM %@ WHERE %@ = %@)"), v3, v4, v5, v6);

  return v7;
}

id __77__HDAdHocConceptEntity__adHocConceptForIdentifier_options_transaction_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("SELECT %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ?"), CFSTR("concept_identifier"), CFSTR("code"), CFSTR("version"), CFSTR("valid_regions"), CFSTR("display_name"), v3, CFSTR("concept_identifier"));

  return v4;
}

uint64_t __77__HDAdHocConceptEntity__adHocConceptForIdentifier_options_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "rawIdentifier"));
}

uint64_t __77__HDAdHocConceptEntity__adHocConceptForIdentifier_options_transaction_error___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  +[HDAdHocConceptEntity _conceptForRow:options:](a1[5], a2, a1[6]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[4] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

id __83__HDAdHocConceptEntity__adHocConceptForCodingCollection_options_transaction_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("SELECT %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ?"), CFSTR("concept_identifier"), CFSTR("code"), CFSTR("version"), CFSTR("valid_regions"), CFSTR("display_name"), v3, CFSTR("code"));

  return v4;
}

uint64_t __83__HDAdHocConceptEntity__adHocConceptForCodingCollection_options_transaction_error___block_invoke_2()
{
  return HDSQLiteBindStringToStatement();
}

uint64_t __83__HDAdHocConceptEntity__adHocConceptForCodingCollection_options_transaction_error___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  +[HDAdHocConceptEntity _conceptForRow:options:](a1[5], a2, a1[6]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[4] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

id __62__HDAdHocConceptEntity__insertAdHocConcept_transaction_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("INSERT OR IGNORE INTO %@ (%@, %@, %@, %@, %@, %@) VALUES ((COALESCE((SELECT MAX(%@) + 1 FROM %@), %lld)), ?, ?, ?, ?, ?)"), v3, CFSTR("concept_identifier"), CFSTR("code"), CFSTR("version"), CFSTR("valid_regions"), CFSTR("display_name"), CFSTR("creation_date"), CFSTR("concept_identifier"), v4, 0x1000000000000);

  return v5;
}

uint64_t __62__HDAdHocConceptEntity__insertAdHocConcept_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double Current;

  objc_msgSend(*(id *)(a1 + 32), "adHocCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindStringToStatement();

  sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 32), "version"));
  objc_msgSend(*(id *)(a1 + 32), "firstAttributeForType:", 959);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindStringToStatement();

  objc_msgSend(*(id *)(a1 + 32), "preferredName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  Current = CFAbsoluteTimeGetCurrent();
  return sqlite3_bind_double(a2, 5, Current);
}

@end
