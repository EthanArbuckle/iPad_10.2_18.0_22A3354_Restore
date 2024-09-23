@implementation HDMedicalUserDomainConceptCategoryTypesEntity

+ (id)databaseTable
{
  return CFSTR("medical_user_domain_concept_category_types");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 3;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_50;
}

+ (id)uniquedColumns
{
  return &unk_1E6DF8FA8;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("udc_id");
  +[HDUserDomainConceptEntity defaultForeignKey](HDMedicalUserDomainConceptEntity, "defaultForeignKey");
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

+ (BOOL)insertDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  BOOL v16;
  id v18;
  id obj;
  _QWORD v20[6];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend(a5, "protectedDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v9, "categoryTypes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v18 = v9;
    v13 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __118__HDMedicalUserDomainConceptCategoryTypesEntity_insertDataForUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2;
        v20[3] = &unk_1E6CE82D8;
        v20[4] = v15;
        v20[5] = a4;
        if (!objc_msgSend(v10, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &insertDataForUserDomainConcept_userDomainConceptID_transaction_error__statementKey_0, a6, &__block_literal_global_92, v20, 0, v18))
        {
          v16 = 0;
          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v12)
        continue;
      break;
    }
    v16 = 1;
LABEL_11:
    v9 = v18;
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

const __CFString *__118__HDMedicalUserDomainConceptCategoryTypesEntity_insertDataForUserDomainConcept_userDomainConceptID_transaction_error___block_invoke()
{
  return CFSTR("INSERT OR REPLACE INTO medical_user_domain_concept_category_types (udc_id, category_type) VALUES (?, ?)");
}

uint64_t __118__HDMedicalUserDomainConceptCategoryTypesEntity_insertDataForUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 40));
  return sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
}

+ (BOOL)retrieveDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 mutableUserDomainConceptProperties:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  int v16;
  _QWORD v18[4];
  id v19;

  v11 = a3;
  v12 = (objc_class *)MEMORY[0x1E0C99DE8];
  v13 = a6;
  v14 = objc_alloc_init(v12);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __155__HDMedicalUserDomainConceptCategoryTypesEntity_retrieveDataForUserDomainConcept_userDomainConceptID_mutableUserDomainConceptProperties_transaction_error___block_invoke;
  v18[3] = &unk_1E6CF79D0;
  v15 = v14;
  v19 = v15;
  v16 = +[HDMedicalUserDomainConceptCategoryTypesEntity _enumerateCategoryTypesWithUserDomainConceptID:transaction:error:enumerationHandler:]((uint64_t)a1, a4, v13, (uint64_t)a7, v18);

  if (v16)
    objc_msgSend(v11, "_setCategoryTypes:", v15);

  return v16;
}

uint64_t __155__HDMedicalUserDomainConceptCategoryTypesEntity_retrieveDataForUserDomainConcept_userDomainConceptID_mutableUserDomainConceptProperties_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

+ (uint64_t)_enumerateCategoryTypesWithUserDomainConceptID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t, uint64_t);
  void *v20;
  id v21;
  _QWORD v22[5];

  v8 = a5;
  v9 = a3;
  objc_opt_self();
  v10 = MEMORY[0x1E0C809B0];
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __133__HDMedicalUserDomainConceptCategoryTypesEntity__enumerateCategoryTypesWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke;
  v20 = &unk_1E6CE82B0;
  v21 = v8;
  v11 = v8;
  v12 = &v17;
  v13 = v9;
  objc_opt_self();
  objc_msgSend(v13, "protectedDatabase", v17, v18, v19, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = __136__HDMedicalUserDomainConceptCategoryTypesEntity__enumerateCategoryTypeRowsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke_2;
  v22[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v22[4] = a2;
  v15 = objc_msgSend(v14, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_enumerateCategoryTypeRowsWithUserDomainConceptID_transaction_error_enumerationHandler__statementKey, a4, &__block_literal_global_204_1, v22, v12);

  return v15;
}

+ (BOOL)willDeleteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  return 1;
}

+ (BOOL)addPropertyDataToCodable:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v10 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __112__HDMedicalUserDomainConceptCategoryTypesEntity_addPropertyDataToCodable_userDomainConceptID_transaction_error___block_invoke;
  v13[3] = &unk_1E6CF79D0;
  v14 = v10;
  v11 = v10;
  LOBYTE(a6) = +[HDMedicalUserDomainConceptCategoryTypesEntity _enumerateCategoryTypesWithUserDomainConceptID:transaction:error:enumerationHandler:]((uint64_t)a1, a4, a5, (uint64_t)a6, v13);

  return (char)a6;
}

uint64_t __112__HDMedicalUserDomainConceptCategoryTypesEntity_addPropertyDataToCodable_userDomainConceptID_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addCategoryTypes:", objc_msgSend(a2, "longLongValue"));
  return 1;
}

const __CFString *__136__HDMedicalUserDomainConceptCategoryTypesEntity__enumerateCategoryTypeRowsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke()
{
  return CFSTR("SELECT category_type FROM medical_user_domain_concept_category_types WHERE udc_id = ? ORDER BY ROWID");
}

uint64_t __136__HDMedicalUserDomainConceptCategoryTypesEntity__enumerateCategoryTypeRowsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t __133__HDMedicalUserDomainConceptCategoryTypesEntity__enumerateCategoryTypesWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a1 + 32);
  MEMORY[0x1BCCAB1C8](a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v4 + 16))(v4, v5, a3);

  return v6;
}

@end
