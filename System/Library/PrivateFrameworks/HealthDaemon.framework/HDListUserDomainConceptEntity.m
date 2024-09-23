@implementation HDListUserDomainConceptEntity

+ (id)databaseTable
{
  return CFSTR("list_user_domain_concepts");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 3;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_64;
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

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDListUserDomainConceptEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDListUserDomainConceptEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

+ (id)privateDataEntities
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)insertConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  int64_t v15;

  v9 = a3;
  objc_msgSend(a5, "protectedDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __103__HDListUserDomainConceptEntity_insertConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2;
  v13[3] = &unk_1E6CE82D8;
  v14 = v9;
  v15 = a4;
  v11 = v9;
  LOBYTE(a6) = objc_msgSend(v10, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &insertConcreteUserDomainConcept_userDomainConceptID_transaction_error__statementKey, a6, &__block_literal_global_153, v13, 0);

  return (char)a6;
}

const __CFString *__103__HDListUserDomainConceptEntity_insertConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke()
{
  return CFSTR("INSERT OR REPLACE INTO list_user_domain_concepts (udc_id, list_type, list_name) VALUES (?, ?, ?)");
}

void __103__HDListUserDomainConceptEntity_insertConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  id v4;

  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 40));
  sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 32), "listType"));
  objc_msgSend(*(id *)(a1 + 32), "listName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

}

+ (BOOL)updateConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  int64_t v15;

  v9 = a3;
  objc_msgSend(a5, "protectedDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __103__HDListUserDomainConceptEntity_updateConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2;
  v13[3] = &unk_1E6CE82D8;
  v14 = v9;
  v15 = a4;
  v11 = v9;
  LOBYTE(a6) = objc_msgSend(v10, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &updateConcreteUserDomainConcept_userDomainConceptID_transaction_error__statementKey, a6, &__block_literal_global_206, v13, 0);

  return (char)a6;
}

const __CFString *__103__HDListUserDomainConceptEntity_updateConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke()
{
  return CFSTR("UPDATE list_user_domain_concepts SET (list_type, list_name) = (?, ?) WHERE udc_id = ?");
}

uint64_t __103__HDListUserDomainConceptEntity_updateConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;

  sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "listType"));
  objc_msgSend(*(id *)(a1 + 32), "listName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  return sqlite3_bind_int64(a2, 3, *(_QWORD *)(a1 + 40));
}

+ (BOOL)willDeleteConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  id v11;
  NSObject *v12;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  int64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  _HKInitializeLogging();
  HKLogHealthOntology();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138413058;
    v15 = a1;
    v16 = 2112;
    v17 = v11;
    v18 = 2048;
    v19 = a4;
    v20 = 2048;
    v21 = a5;
    _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "%@ will delete list UDC %@, udc_id=%ld, sync_provenance=%ld", (uint8_t *)&v14, 0x2Au);
  }

  return 1;
}

+ (Class)userDomainConceptClass
{
  return (Class)objc_opt_class();
}

+ (Class)userDomainConceptSemanticIdentifierClass
{
  return (Class)objc_opt_class();
}

+ (id)predicateMatchingSemanticIdentifier:(id)a3
{
  return HDListUserDomainConceptEntityPredicateForListType(objc_msgSend(a3, "listType"), 1);
}

+ (id)newUserDomainConceptForRefreshWithCodingCollection:(id)a3 propertyCollection:(id)a4
{
  return 0;
}

+ (id)predicateMatchingSemanticDuplicatesOf:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D29840];
  v4 = (void *)MEMORY[0x1E0D29838];
  v5 = a3;
  objc_msgSend(v5, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithProperty:notEqualToValue:", CFSTR("uuid"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D29838];
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "identifier", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "code"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithProperty:equalToValue:", CFSTR("type"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v12;
  v13 = (void *)MEMORY[0x1E0D29838];
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = objc_msgSend(v5, "listType");

  objc_msgSend(v14, "numberWithUnsignedInteger:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateWithProperty:equalToValue:", CFSTR("list_type"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateMatchingAllPredicates:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)deduplicateUserDomainConcept:(id)a3 with:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  return +[HDUserDomainConceptCollapser collapseUserDomainConcept:with:profile:transaction:error:](HDListUserDomainConceptCollapser, "collapseUserDomainConcept:with:profile:transaction:error:", a3, a4, a5, a6, a7);
}

@end
