@implementation HDUserDomainConceptLinkEntity

+ (id)databaseTable
{
  return CFSTR("user_domain_concept_links");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_26;
}

+ (id)uniquedColumns
{
  return &unk_1E6DF8D08;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("udc_id");
  +[HDUserDomainConceptEntity defaultForeignKey](HDUserDomainConceptEntity, "defaultForeignKey");
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
  objc_msgSend(v9, "linkCollection");
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
        v20[2] = __102__HDUserDomainConceptLinkEntity_insertDataForUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2;
        v20[3] = &unk_1E6CE82D8;
        v20[4] = v15;
        v20[5] = a4;
        if (!objc_msgSend(v10, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &insertDataForUserDomainConcept_userDomainConceptID_transaction_error__statementKey, a6, &__block_literal_global_59, v20, 0, v18))
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

const __CFString *__102__HDUserDomainConceptLinkEntity_insertDataForUserDomainConcept_userDomainConceptID_transaction_error___block_invoke()
{
  return CFSTR("INSERT OR REPLACE INTO user_domain_concept_links (udc_id, target_uuid, link_type) SELECT ?, ?, ? WHERE NOT EXISTS (SELECT 1 FROM user_domain_concepts WHERE uuid = ? AND deleted)");
}

void __102__HDUserDomainConceptLinkEntity_insertDataForUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  id v5;

  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "targetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 3, objc_msgSend(*(id *)(a1 + 32), "type"));
  objc_msgSend(*(id *)(a1 + 32), "targetUUID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

}

+ (BOOL)retrieveDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 mutableUserDomainConceptProperties:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void *v26;
  id v27;
  _QWORD v28[4];
  uint64_t *v29;

  v10 = a3;
  v11 = a6;
  objc_msgSend(v10, "linkCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = MEMORY[0x1E0C809B0];
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __139__HDUserDomainConceptLinkEntity_retrieveDataForUserDomainConcept_userDomainConceptID_mutableUserDomainConceptProperties_transaction_error___block_invoke;
    v26 = &unk_1E6CF20A8;
    v16 = v14;
    v27 = v16;
    v17 = &v23;
    v18 = v11;
    v19 = objc_opt_self();
    v28[0] = v15;
    v28[1] = 3221225472;
    v28[2] = __116__HDUserDomainConceptLinkEntity__enumerateConceptLinksWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke;
    v28[3] = &unk_1E6CE82B0;
    v29 = v17;
    v20 = v17;
    v13 = +[HDUserDomainConceptLinkEntity _enumerateConceptLinkRowsWithUserDomainConceptID:transaction:error:enumerationHandler:](v19, a4, v18, (uint64_t)a7, v28);

    if (v13)
    {
      if (objc_msgSend(v16, "count", v23, v24, v25, v26))
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6D00]), "_initWithLinks:", v16);
      else
        v21 = 0;
      objc_msgSend(v10, "_setLinkCollection:", v21);

    }
  }

  return v13;
}

uint64_t __139__HDUserDomainConceptLinkEntity_retrieveDataForUserDomainConcept_userDomainConceptID_mutableUserDomainConceptProperties_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

+ (BOOL)willDeleteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v10 = a3;
  objc_msgSend(a7, "protectedDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __122__HDUserDomainConceptLinkEntity_willDeleteUserDomainConcept_userDomainConceptID_syncProvenance_profile_transaction_error___block_invoke_2;
  v14[3] = &unk_1E6CE9508;
  v15 = v10;
  v12 = v10;
  LOBYTE(a8) = objc_msgSend(v11, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &willDeleteUserDomainConcept_userDomainConceptID_syncProvenance_profile_transaction_error__statementKey, a8, &__block_literal_global_209, v14, 0);

  return (char)a8;
}

const __CFString *__122__HDUserDomainConceptLinkEntity_willDeleteUserDomainConcept_userDomainConceptID_syncProvenance_profile_transaction_error___block_invoke()
{
  return CFSTR("DELETE FROM user_domain_concept_links WHERE target_uuid = ? ");
}

void __122__HDUserDomainConceptLinkEntity_willDeleteUserDomainConcept_userDomainConceptID_syncProvenance_profile_transaction_error___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

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
  v13[2] = __96__HDUserDomainConceptLinkEntity_addPropertyDataToCodable_userDomainConceptID_transaction_error___block_invoke;
  v13[3] = &unk_1E6CE8CF8;
  v14 = v10;
  v11 = v10;
  LOBYTE(a6) = +[HDUserDomainConceptLinkEntity _enumerateConceptLinkRowsWithUserDomainConceptID:transaction:error:enumerationHandler:]((uint64_t)a1, a4, a5, (uint64_t)a6, v13);

  return (char)a6;
}

uint64_t __96__HDUserDomainConceptLinkEntity_addPropertyDataToCodable_userDomainConceptID_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  HDCodableUserDomainConceptLink *v4;
  void *v5;

  v4 = objc_alloc_init(HDCodableUserDomainConceptLink);
  MEMORY[0x1BCCAB18C](a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableUserDomainConceptLink setTargetUUID:](v4, "setTargetUUID:", v5);

  -[HDCodableUserDomainConceptLink setType:](v4, "setType:", HDSQLiteColumnAsInt64());
  objc_msgSend(*(id *)(a1 + 32), "addLinks:", v4);

  return 1;
}

+ (uint64_t)_enumerateConceptLinkRowsWithUserDomainConceptID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[5];

  v8 = a5;
  v9 = a3;
  objc_opt_self();
  objc_msgSend(v9, "protectedDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __119__HDUserDomainConceptLinkEntity__enumerateConceptLinkRowsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke_2;
  v13[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v13[4] = a2;
  v11 = objc_msgSend(v10, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_enumerateConceptLinkRowsWithUserDomainConceptID_transaction_error_enumerationHandler__statementKey, a4, &__block_literal_global_220_0, v13, v8);

  return v11;
}

+ (BOOL)unitTesting_enumerateConceptLinksWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  v11 = a3;
  objc_msgSend(a4, "databaseForEntityClass:", a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryWithDatabase:predicate:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __117__HDUserDomainConceptLinkEntity_unitTesting_enumerateConceptLinksWithPredicate_transaction_error_enumerationHandler___block_invoke;
  v16[3] = &unk_1E6CE84F0;
  v17 = v10;
  v14 = v10;
  LOBYTE(a5) = objc_msgSend(v13, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", &unk_1E6DF8D20, a5, v16);

  return (char)a5;
}

uint64_t __117__HDUserDomainConceptLinkEntity_unitTesting_enumerateConceptLinksWithPredicate_transaction_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v6;
  uint64_t v7;

  MEMORY[0x1BCCAB1E0](a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6CF8]), "initWithTarget:type:", v5, HDSQLiteColumnAsInt64());
  v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v7;
}

const __CFString *__119__HDUserDomainConceptLinkEntity__enumerateConceptLinkRowsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke()
{
  return CFSTR("SELECT target_uuid, link_type FROM user_domain_concept_links WHERE udc_id = ? ORDER BY ROWID");
}

uint64_t __119__HDUserDomainConceptLinkEntity__enumerateConceptLinkRowsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t __116__HDUserDomainConceptLinkEntity__enumerateConceptLinksWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = objc_alloc(MEMORY[0x1E0CB6CF8]);
  MEMORY[0x1BCCAB1E0](a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithTarget:type:", v5, HDSQLiteColumnAsInt64());

  v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return v7;
}

@end
