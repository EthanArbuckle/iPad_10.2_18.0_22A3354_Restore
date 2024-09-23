@implementation HDConceptIndexEntity

+ (id)databaseTable
{
  return CFSTR("concept_index");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 8;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_34;
}

+ (id)indices
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  const __CFString *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D29860]);
  v3 = objc_opt_class();
  v13 = CFSTR("object_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithEntity:name:columns:", v3, CFSTR("objects"), v4);
  v14[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D29860]);
  v7 = objc_opt_class();
  v12[0] = CFSTR("concept_identifier");
  v12[1] = CFSTR("key_path");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithEntity:name:columns:", v7, CFSTR("concept_identifier_key_paths"), v8);
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("object_id");
  +[HDDataEntity defaultForeignKey](HDDataEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("uuid")))
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = (void *)MEMORY[0x1E0D29870];
    objc_msgSend(a1, "disambiguatedDatabaseTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "innerJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v7, objc_opt_class(), 0, CFSTR("object_id"), CFSTR("data_id"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___HDConceptIndexEntity;
    objc_msgSendSuper2(&v11, sel_joinClausesForProperty_, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (BOOL)insertConceptIndexEntries:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDConceptIndexEntity.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("conceptIndexEntries"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDConceptIndexEntity.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v11, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __64__HDConceptIndexEntity_insertConceptIndexEntries_profile_error___block_invoke;
  v18[3] = &unk_1E6CEF660;
  v19 = v9;
  v20 = a1;
  v13 = v9;
  v14 = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v12, a5, v18);

  return v14;
}

uint64_t __64__HDConceptIndexEntity_insertConceptIndexEntries_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  uint64_t i;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id obj;
  uint64_t v22;
  uint64_t v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  _BYTE v34[128];
  _QWORD v35[9];

  v35[7] = *MEMORY[0x1E0C80C00];
  v25 = a2;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = *(id *)(a1 + 32);
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v27 != v22)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v25, "protectedDatabase");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v5;
        v8 = v6;
        v9 = (void *)objc_opt_self();
        v35[0] = CFSTR("object_id");
        v35[1] = CFSTR("concept_identifier");
        v35[2] = CFSTR("version");
        v35[3] = CFSTR("key_path");
        v35[4] = CFSTR("compound_index");
        v35[5] = CFSTR("type");
        v35[6] = CFSTR("ontology_version");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "sampleUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        HDDataEntityPredicateForDataUUID();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0;
        +[HDDataEntity anyInDatabase:predicate:error:](HDSampleEntity, "anyInDatabase:predicate:error:", v8, v12, &v33);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v33;

        if (v13)
          v15 = 1;
        else
          v15 = v14 == 0;
        if (!v15)
        {
          if (a3)
            *a3 = objc_retainAutorelease(v14);
          else
            _HKLogDroppedError();

LABEL_20:
          v19 = 0;
          goto LABEL_21;
        }
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __64__HDConceptIndexEntity__insertConceptIndexEntry_database_error___block_invoke;
        v30[3] = &unk_1E6CE89A8;
        v16 = v13;
        v31 = v16;
        v17 = v7;
        v32 = v17;
        objc_msgSend(v9, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 1, v8, v10, a3, v30);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
          goto LABEL_20;
      }
      v19 = 1;
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v23)
        continue;
      break;
    }
  }
  else
  {
    v19 = 1;
  }
LABEL_21:

  return v19;
}

+ (BOOL)removeAllConceptIndexEntriesWithProfile:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  char v9;
  void *v11;
  _QWORD v12[5];

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDConceptIndexEntity.m"), 117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile"));

  }
  objc_msgSend(v7, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__HDConceptIndexEntity_removeAllConceptIndexEntriesWithProfile_error___block_invoke;
  v12[3] = &__block_descriptor_40_e35_B24__0__HDDatabaseTransaction_8__16l;
  v12[4] = a1;
  v9 = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v8, a4, v12);

  return v9;
}

uint64_t __70__HDConceptIndexEntity_removeAllConceptIndexEntriesWithProfile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a2;
  v5 = (void *)objc_opt_class();
  objc_msgSend(v4, "protectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "queryWithDatabase:predicate:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "deleteAllEntitiesWithError:", a3);
  return v8;
}

+ (id)conceptIndexEntriesForSampleUUID:(id)a3 type:(unint64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;

  v11 = a3;
  v12 = a5;
  v13 = v12;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDConceptIndexEntity.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sampleUUID"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDConceptIndexEntity.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile"));

LABEL_3:
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("uuid"), v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "predicateWithProperty:equalToValue:", CFSTR("type"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v14, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __76__HDConceptIndexEntity_conceptIndexEntriesForSampleUUID_type_profile_error___block_invoke;
  v26[3] = &unk_1E6CF3D58;
  v27 = v19;
  v20 = v19;
  if (objc_msgSend(a1, "enumerateConceptIndexEntriesWithPredicate:profile:error:enumerationHandler:", v18, v13, a6, v26))v21 = v20;
  else
    v21 = 0;
  v22 = v21;

  return v22;
}

uint64_t __76__HDConceptIndexEntity_conceptIndexEntriesForSampleUUID_type_profile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

+ (BOOL)enumerateConceptIndexEntriesWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v10 = a3;
  v11 = a6;
  objc_msgSend(a4, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __99__HDConceptIndexEntity_enumerateConceptIndexEntriesWithPredicate_profile_error_enumerationHandler___block_invoke;
  v16[3] = &unk_1E6CF2DE0;
  v18 = v11;
  v19 = a1;
  v17 = v10;
  v13 = v11;
  v14 = v10;
  LOBYTE(a5) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v12, a5, v16);

  return (char)a5;
}

uint64_t __99__HDConceptIndexEntity_enumerateConceptIndexEntriesWithPredicate_profile_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  __CFString *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  void *v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  const __CFString *v21;
  const __CFString *v22;
  __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v6 = (__CFString *)*(id *)(a1 + 40);
  v7 = a2;
  v8 = v5;
  v9 = objc_opt_self();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel__enumerateConceptIndexEntriesWithPredicate_transaction_error_handler_, v9, CFSTR("HDConceptIndexEntity.m"), 259, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transaction"));

    if (v6)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", sel__enumerateConceptIndexEntriesWithPredicate_transaction_error_handler_, v9, CFSTR("HDConceptIndexEntity.m"), 260, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

    goto LABEL_3;
  }
  if (!v6)
    goto LABEL_5;
LABEL_3:
  v10 = (void *)objc_opt_class();
  objc_msgSend(v7, "protectedDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "queryWithDatabase:predicate:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v19 = CFSTR("uuid");
  v20 = (uint64_t)CFSTR("concept_identifier");
  v21 = CFSTR("version");
  v22 = CFSTR("key_path");
  v23 = CFSTR("compound_index");
  v24 = CFSTR("type");
  v25 = CFSTR("ontology_version");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (const __CFString *)MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = (const __CFString *)__93__HDConceptIndexEntity__enumerateConceptIndexEntriesWithPredicate_transaction_error_handler___block_invoke;
  v22 = (const __CFString *)&unk_1E6CE84F0;
  v23 = v6;
  v14 = v6;
  v15 = objc_msgSend(v12, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v13, a3, &v19);

  return v15;
}

+ (id)numberOfIndexedConceptsWithProfile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__67;
  v16 = __Block_byref_object_dispose__67;
  v17 = 0;
  objc_msgSend(v6, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__HDConceptIndexEntity_numberOfIndexedConceptsWithProfile_error___block_invoke;
  v11[3] = &unk_1E6CF3A30;
  v11[4] = &v12;
  v11[5] = a1;
  LODWORD(a4) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v7, a4, v11);

  if ((_DWORD)a4)
    v8 = (void *)v13[5];
  else
    v8 = 0;
  v9 = v8;
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __65__HDConceptIndexEntity_numberOfIndexedConceptsWithProfile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];

  objc_msgSend(a2, "protectedDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__HDConceptIndexEntity_numberOfIndexedConceptsWithProfile_error___block_invoke_2;
  v10[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v6 = *(_QWORD *)(a1 + 32);
  v10[4] = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__HDConceptIndexEntity_numberOfIndexedConceptsWithProfile_error___block_invoke_3;
  v9[3] = &unk_1E6CE8540;
  v9[4] = v6;
  v7 = objc_msgSend(v5, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &HDConceptIndexEntityPropertyOntologyVersion_block_invoke_statementKey, a3, v10, 0, v9);

  return v7;
}

id __65__HDConceptIndexEntity_numberOfIndexedConceptsWithProfile_error___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("SELECT COUNT(DISTINCT %@) FROM %@"), CFSTR("concept_identifier"), v3);

  return v4;
}

uint64_t __65__HDConceptIndexEntity_numberOfIndexedConceptsWithProfile_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  MEMORY[0x1BCCAB1C8](a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 1;
}

+ (id)unitTesting_allConceptIndexEntriesWithProfile:(id)a3 error:(id *)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v13;
  _QWORD v14[4];
  id v15;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDConceptIndexEntity.m"), 189, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile"));

  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__HDConceptIndexEntity_unitTesting_allConceptIndexEntriesWithProfile_error___block_invoke;
  v14[3] = &unk_1E6CF3D58;
  v15 = v8;
  v9 = v8;
  if (objc_msgSend(a1, "enumerateConceptIndexEntriesWithPredicate:profile:error:enumerationHandler:", 0, v7, a4, v14))v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

uint64_t __76__HDConceptIndexEntity_unitTesting_allConceptIndexEntriesWithProfile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

void __64__HDConceptIndexEntity__insertConceptIndexEntry_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  MEMORY[0x1BCCAB114](a2, CFSTR("object_id"), objc_msgSend(*(id *)(a1 + 32), "persistentID"));
  MEMORY[0x1BCCAB114](a2, CFSTR("concept_identifier"), objc_msgSend(*(id *)(a1 + 40), "conceptIdentifier"));
  MEMORY[0x1BCCAB114](a2, CFSTR("version"), objc_msgSend(*(id *)(a1 + 40), "conceptVersion"));
  objc_msgSend(*(id *)(a1 + 40), "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("key_path"), v4);

  MEMORY[0x1BCCAB114](a2, CFSTR("compound_index"), objc_msgSend(*(id *)(a1 + 40), "compoundIndex"));
  MEMORY[0x1BCCAB114](a2, CFSTR("type"), objc_msgSend(*(id *)(a1 + 40), "type"));
  objc_msgSend(*(id *)(a1 + 40), "ontologyVersion");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("ontology_version"), v5);

}

uint64_t __93__HDConceptIndexEntity__enumerateConceptIndexEntriesWithPredicate_transaction_error_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  HDConceptIndexEntry *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  void *v20;

  HDSQLiteColumnWithNameAsUUID();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HDSQLiteColumnWithNameAsInt64();
  v8 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = HDSQLiteColumnWithNameAsInt64();
  v11 = HDSQLiteColumnWithNameAsInt64();
  v12 = objc_alloc(MEMORY[0x1E0CB69C0]);
  HDSQLiteColumnWithNameAsString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithString:", v13);

  v15 = -[HDConceptIndexEntry initWithSampleUUID:conceptIdentifier:conceptVersion:keyPath:compoundIndex:type:ontologyVersion:]([HDConceptIndexEntry alloc], "initWithSampleUUID:conceptIdentifier:conceptVersion:keyPath:compoundIndex:type:ontologyVersion:", v6, v7, v8, v9, v10, v11, v14);
  v16 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v17 = 0;
  v18 = v17;
  if ((v16 & 1) == 0)
  {
    v19 = v17;
    v20 = v19;
    if (v19)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v19);
      else
        _HKLogDroppedError();
    }

  }
  return v16;
}

@end
