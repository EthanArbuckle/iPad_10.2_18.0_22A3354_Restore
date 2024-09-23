@implementation HDMedicalUserDomainConceptEntity

+ (id)databaseTable
{
  return CFSTR("medical_user_domain_concepts");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 2;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_68;
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

+ (id)privateSubEntities
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
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
  _HDMedicalUserDomainConceptEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDMedicalUserDomainConceptEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

+ (id)privateDataEntities
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
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
  v13[2] = __106__HDMedicalUserDomainConceptEntity_insertConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2;
  v13[3] = &unk_1E6CE82D8;
  v14 = v9;
  v15 = a4;
  v11 = v9;
  LOBYTE(a6) = objc_msgSend(v10, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &insertConcreteUserDomainConcept_userDomainConceptID_transaction_error__statementKey_0, a6, &__block_literal_global_170, v13, 0);

  return (char)a6;
}

const __CFString *__106__HDMedicalUserDomainConceptEntity_insertConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke()
{
  return CFSTR("INSERT OR REPLACE INTO medical_user_domain_concepts (udc_id, country_code) VALUES (?, ?)");
}

void __106__HDMedicalUserDomainConceptEntity_insertConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  id v3;

  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "countryCode");
  v3 = (id)objc_claimAutoreleasedReturnValue();
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
  v13[2] = __106__HDMedicalUserDomainConceptEntity_updateConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2;
  v13[3] = &unk_1E6CE82D8;
  v14 = v9;
  v15 = a4;
  v11 = v9;
  LOBYTE(a6) = objc_msgSend(v10, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &updateConcreteUserDomainConcept_userDomainConceptID_transaction_error__statementKey_0, a6, &__block_literal_global_209_4, v13, 0);

  return (char)a6;
}

const __CFString *__106__HDMedicalUserDomainConceptEntity_updateConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke()
{
  return CFSTR("UPDATE medical_user_domain_concepts SET (country_code) = (?) WHERE udc_id = ?");
}

uint64_t __106__HDMedicalUserDomainConceptEntity_updateConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "countryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindStringToStatement();

  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

+ (BOOL)willDeleteConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  char v18;
  _QWORD v20[4];
  id v21;
  id v22;

  v11 = a3;
  v12 = a6;
  v13 = a7;
  objc_msgSend(v12, "daemon");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "behavior");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "supportsOntology");

  if (v16)
  {
    objc_msgSend(v12, "ontologyDatabase");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __133__HDMedicalUserDomainConceptEntity_willDeleteConcreteUserDomainConcept_userDomainConceptID_syncProvenance_profile_transaction_error___block_invoke;
    v20[3] = &unk_1E6CE9D30;
    v21 = v11;
    v22 = v12;
    v18 = objc_msgSend(v17, "performTransactionWithDatabaseTransaction:error:transactionHandler:", v13, a8, v20);

  }
  else
  {
    v18 = 1;
  }

  return v18;
}

BOOL __133__HDMedicalUserDomainConceptEntity_willDeleteConcreteUserDomainConcept_userDomainConceptID_syncProvenance_profile_transaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDMedicalUserDomainConceptGenerator remapMedicalRecordsIfNeededForUserDomainConcept:shouldExcludeExistingConcept:profile:ontologyTransaction:error:](HDMedicalUserDomainConceptGenerator, "remapMedicalRecordsIfNeededForUserDomainConcept:shouldExcludeExistingConcept:profile:ontologyTransaction:error:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40), a2, a3);
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
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HDUserDomainConceptEntityPredicateForConceptUUID((uint64_t)v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "countryCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0D29840];
    objc_msgSend(v3, "typeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HDUserDomainConceptEntityPredicateForConceptsWithTypeIdentifier(v5);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v7)
    {
      v17[0] = v9;
      objc_msgSend(v3, "medicalCoding");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HDUserDomainConceptEntityPredicateForMedicalCoding(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v12;
      objc_msgSend(v3, "countryCode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("country_code"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[2] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "predicateMatchingAllPredicates:", v15);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18[0] = v9;
      objc_msgSend(v3, "medicalCoding");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HDUserDomainConceptEntityPredicateForMedicalCoding(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v12;
      objc_msgSend(MEMORY[0x1E0D29880], "isNullPredicateWithProperty:", CFSTR("country_code"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "predicateMatchingAllPredicates:", v14);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v6;
}

+ (id)newUserDomainConceptForRefreshWithCodingCollection:(id)a3 propertyCollection:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x1E0CB6870];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  v9 = (void *)objc_msgSend(v8, "initWithCategoryTypes:countryCode:codingCollection:propertyCollection:", MEMORY[0x1E0C9AA60], 0, v7, v6);

  return v9;
}

+ (id)predicateMatchingSemanticDuplicatesOf:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "firstOntologyCoding");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstAdhocCoding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if ((v4 || (v6 = v5) != 0)
    && (HDUserDomainConceptEntityPredicateForMedicalCoding(v6), (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = (void *)v7;
    v20 = (void *)MEMORY[0x1E0D29840];
    v23 = v5;
    v9 = (void *)MEMORY[0x1E0D29838];
    objc_msgSend(v3, "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateWithProperty:notEqualToValue:", CFSTR("uuid"), v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v21;
    v10 = (void *)MEMORY[0x1E0D29838];
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "code"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateWithProperty:equalToValue:", CFSTR("type"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v14;
    v24[2] = v8;
    objc_msgSend(v3, "countryCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("country_code"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "predicateMatchingAllPredicates:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v23;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

+ (id)deduplicateUserDomainConcept:(id)a3 with:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  return +[HDUserDomainConceptCollapser collapseUserDomainConcept:with:profile:transaction:error:](HDMedicalUserDomainConceptCollapser, "collapseUserDomainConcept:with:profile:transaction:error:", a3, a4, a5, a6, a7);
}

+ (id)refreshOntologyContentForUserDomainConcept:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  return +[HDUserDomainConceptOntologyContentRefresher refreshOntologyContentForUserDomainConcept:profile:transaction:error:](HDMedicalUserDomainConceptGenerator, "refreshOntologyContentForUserDomainConcept:profile:transaction:error:", a3, a4, a5, a6);
}

+ (BOOL)supportsSyncStore:(id)a3
{
  return objc_msgSend(a3, "syncStoreType") != 1;
}

+ (id)pruneWithProfile:(id)a3 nowDate:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v10 = a3;
  v11 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__138;
  v28 = __Block_byref_object_dispose__138;
  v29 = 0;
  objc_msgSend(v10, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __73__HDMedicalUserDomainConceptEntity_pruneWithProfile_nowDate_limit_error___block_invoke;
  v18[3] = &unk_1E6CFFEB8;
  v21 = &v24;
  v22 = a1;
  v13 = v10;
  v19 = v13;
  v14 = v11;
  v20 = v14;
  v23 = a5;
  LODWORD(a6) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v12, a6, v18);

  if ((_DWORD)a6)
    v15 = (void *)v25[5];
  else
    v15 = 0;
  v16 = v15;

  _Block_object_dispose(&v24, 8);
  return v16;
}

BOOL __73__HDMedicalUserDomainConceptEntity_pruneWithProfile_nowDate_limit_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  uint64_t v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  uint64_t *v54;
  _QWORD v55[5];
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, sqlite3_stmt *);
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;

  v6 = *(void **)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 64);
  v8 = *(id *)(a1 + 32);
  v9 = a2;
  v10 = v6;
  objc_opt_self();
  v11 = v9;
  v12 = objc_opt_self();
  objc_msgSend(v11, "protectedDatabase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v48 = MEMORY[0x1E0C809B0];
  v49 = 3221225472;
  v50 = __107__HDMedicalUserDomainConceptEntity__clearPendingPruneDateForMappedUDCsWithTransaction_nowDate_limit_error___block_invoke;
  v51 = &__block_descriptor_40_e15___NSString_8__0l;
  v52 = (id)v12;
  v60 = MEMORY[0x1E0C809B0];
  v61 = 3221225472;
  v62 = __107__HDMedicalUserDomainConceptEntity__clearPendingPruneDateForMappedUDCsWithTransaction_nowDate_limit_error___block_invoke_2;
  v63 = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v64 = (id)v12;
  v65 = v7;
  LOBYTE(v12) = objc_msgSend(v13, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_clearPendingPruneDateForMappedUDCsWithTransaction_nowDate_limit_error__statementKey, a3, &v48, &v60, 0);

  if ((v12 & 1) != 0)
  {
    v47 = v10;
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "protectedDatabase");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "numberWithInt:", objc_msgSend(v16, "getChangesCount"));
    v17 = (id)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = objc_msgSend(v17, "integerValue");
      v10 = v47;
      if (v7 > v18)
      {
        v45 = v7 - v18;
        v41 = v8;
        v42 = v8;
        v19 = v11;
        v20 = v47;
        v21 = objc_opt_self();
        v56 = 0;
        v57 = &v56;
        v58 = 0x2020000000;
        v59 = 0;
        objc_msgSend(v19, "protectedDatabase");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v55[0] = v14;
        v55[1] = 3221225472;
        v55[2] = __105__HDMedicalUserDomainConceptEntity__tombstoneOldUnmappedUDCsWithProfile_transaction_nowDate_limit_error___block_invoke;
        v55[3] = &__block_descriptor_40_e15___NSString_8__0l;
        v55[4] = v21;
        v60 = v14;
        v61 = 3221225472;
        v62 = __105__HDMedicalUserDomainConceptEntity__tombstoneOldUnmappedUDCsWithProfile_transaction_nowDate_limit_error___block_invoke_2;
        v63 = &unk_1E6CE8518;
        v65 = v21;
        v44 = v20;
        v64 = v44;
        v66 = v45;
        v48 = v14;
        v49 = 3221225472;
        v50 = __105__HDMedicalUserDomainConceptEntity__tombstoneOldUnmappedUDCsWithProfile_transaction_nowDate_limit_error___block_invoke_3;
        v51 = &unk_1E6CFFEE0;
        v54 = &v56;
        v23 = v42;
        v52 = v23;
        v24 = v19;
        v53 = v24;
        LODWORD(v21) = objc_msgSend(v22, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_tombstoneOldUnmappedUDCsWithProfile_transaction_nowDate_limit_error__statementKey, a3, v55, &v60, &v48);

        if ((_DWORD)v21)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v57[3]);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v25 = 0;
        }

        _Block_object_dispose(&v56, 8);
        if (v25)
        {
          v27 = objc_msgSend(v25, "integerValue");
          v28 = v45 - v27;
          if (v45 > v27)
          {
            v40 = v27;
            v43 = v25;
            v29 = v24;
            v46 = v44;
            v30 = (void *)objc_opt_self();
            objc_msgSend(v29, "protectedDatabase");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = v14;
            v49 = 3221225472;
            v50 = __92__HDMedicalUserDomainConceptEntity__markNewUnmappedUDCsWithTransaction_nowDate_limit_error___block_invoke;
            v51 = &__block_descriptor_40_e15___NSString_8__0l;
            v52 = v30;
            v60 = v14;
            v61 = 3221225472;
            v62 = __92__HDMedicalUserDomainConceptEntity__markNewUnmappedUDCsWithTransaction_nowDate_limit_error___block_invoke_2;
            v63 = &unk_1E6CE8518;
            v32 = v46;
            v64 = v32;
            v65 = (uint64_t)v30;
            v66 = v28;
            v33 = objc_msgSend(v31, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_markNewUnmappedUDCsWithTransaction_nowDate_limit_error__statementKey, a3, &v48, &v60, 0);

            v34 = 0;
            if (v33)
            {
              v35 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v29, "protectedDatabase");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "numberWithInt:", objc_msgSend(v36, "getChangesCount"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();

            }
            if (v34)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v34, "integerValue") + v40);
              v26 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v26 = 0;
            }
            v8 = v41;
            v25 = v43;

            goto LABEL_21;
          }
          v26 = v25;
        }
        else
        {
          v26 = 0;
        }
        v8 = v41;
LABEL_21:
        v10 = v47;

        goto LABEL_22;
      }
      v17 = v17;
      v26 = v17;
    }
    else
    {
      v26 = 0;
      v10 = v47;
    }
  }
  else
  {

    v17 = 0;
    v26 = 0;
  }
LABEL_22:

  v37 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v38 = *(void **)(v37 + 40);
  *(_QWORD *)(v37 + 40) = v26;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
}

id __107__HDMedicalUserDomainConceptEntity__clearPendingPruneDateForMappedUDCsWithTransaction_nowDate_limit_error___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc(MEMORY[0x1E0CB3940]);
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDUserDomainConceptPropertyEntity, "disambiguatedDatabaseTable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDMedicalUserDomainConceptEntity _recursiveSQLForMappedUDCs]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v0, "initWithFormat:", CFSTR("DELETE FROM %@ WHERE (%@ IN (%@) SELECT %@ FROM %@) AND %@ = ?) LIMIT ?"), v1, CFSTR("udc_id"), v2, CFSTR("udc_id"), CFSTR("recursive_mapped_concepts"), CFSTR("property_type"));

  return v3;
}

+ (id)_recursiveSQLForMappedUDCs
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_opt_self();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDUserDomainConceptEntity, "disambiguatedDatabaseTable");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDMedicalUserDomainConceptMappingEntity, "disambiguatedDatabaseTable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDUserDomainConceptLinkEntity, "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99D20];
  HKWeakConceptLinkTypes();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_arrayWithCount:generator:", objc_msgSend(v4, "count"), &__block_literal_global_233_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WITH RECURSIVE %@(%@, %@) AS (SELECT %@, %@ FROM %@ INNER JOIN %@ USING(%@) UNION SELECT %@.%@, %@.%@ FROM %@ INNER JOIN %@ USING (%@) INNER JOIN %@ ON %@.%@ = %@ WHERE %@ NOT IN (%@) UNION SELECT %@.%@, %@.%@ FROM %@ INNER JOIN %@ ON %@ = %@.%@ INNER JOIN %@ ON %@.%@ = %@.%@ WHERE %@ NOT IN (%@)"), CFSTR("recursive_mapped_concepts"), CFSTR("udc_id"), CFSTR("uuid"), CFSTR("udc_id"), CFSTR("uuid"), v0, v1, CFSTR("udc_id"), v0, CFSTR("udc_id"), v0, CFSTR("uuid"), v0, v2, CFSTR("udc_id"), CFSTR("recursive_mapped_concepts"),
    CFSTR("recursive_mapped_concepts"),
    CFSTR("uuid"),
    CFSTR("target_uuid"),
    CFSTR("link_type"),
    v6,
    v0,
    CFSTR("udc_id"),
    v0,
    CFSTR("uuid"),
    v0,
    v2,
    CFSTR("target_uuid"),
    v0,
    CFSTR("uuid"),
    CFSTR("recursive_mapped_concepts"),
    CFSTR("recursive_mapped_concepts"),
    CFSTR("udc_id"),
    v2,
    CFSTR("udc_id"),
    CFSTR("link_type"),
    v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __107__HDMedicalUserDomainConceptEntity__clearPendingPruneDateForMappedUDCsWithTransaction_nowDate_limit_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  int v4;
  int v6;

  v6 = 1;
  +[HDMedicalUserDomainConceptEntity _bindRecursiveMappedUDCStatement:bindingIndex:](*(_QWORD *)(a1 + 32), (uint64_t)a2, &v6);
  v4 = v6 + 1;
  sqlite3_bind_int64(a2, v6, 1);
  return sqlite3_bind_int64(a2, v4, *(_QWORD *)(a1 + 40));
}

+ (void)_bindRecursiveMappedUDCStatement:(_DWORD *)a3 bindingIndex:
{
  char v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v4 = 1;
  do
  {
    v5 = v4;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    HKWeakConceptLinkTypes();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          HDSQLiteBindFoundationValueToStatement();
          ++*a3;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    v4 = 0;
  }
  while ((v5 & 1) != 0);
}

id __105__HDMedicalUserDomainConceptEntity__tombstoneOldUnmappedUDCsWithProfile_transaction_nowDate_limit_error___block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDMedicalUserDomainConceptEntity, "disambiguatedDatabaseTable");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDUserDomainConceptPropertyEntity, "disambiguatedDatabaseTable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDUserDomainConceptEntity, "disambiguatedDatabaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDMedicalUserDomainConceptEntity _recursiveSQLForMappedUDCs]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("SELECT %@, %@ FROM %@ INNER JOIN %@ USING(%@) INNER JOIN %@ USING(%@) WHERE NOT EXISTS (%@) SELECT 1 FROM %@ WHERE %@.%@ = %@.%@) AND property_type = ? AND date_value <= ? LIMIT ?"), CFSTR("uuid"), CFSTR("creation_date"), v0, v3, CFSTR("udc_id"), v1, CFSTR("udc_id"), v4, CFSTR("recursive_mapped_concepts"), CFSTR("recursive_mapped_concepts"), CFSTR("udc_id"), v0, CFSTR("udc_id"));

  return v5;
}

uint64_t __105__HDMedicalUserDomainConceptEntity__tombstoneOldUnmappedUDCsWithProfile_transaction_nowDate_limit_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  int v4;
  int v5;
  double v6;
  int v8;

  v8 = 1;
  +[HDMedicalUserDomainConceptEntity _bindRecursiveMappedUDCStatement:bindingIndex:](*(_QWORD *)(a1 + 40), (uint64_t)a2, &v8);
  v4 = v8;
  v5 = v8 + 1;
  sqlite3_bind_int64(a2, v8, 1);
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  sqlite3_bind_double(a2, v5, v6);
  return sqlite3_bind_int64(a2, v4 + 2, *(_QWORD *)(a1 + 48));
}

BOOL __105__HDMedicalUserDomainConceptEntity__tombstoneOldUnmappedUDCsWithProfile_transaction_nowDate_limit_error___block_invoke_3(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  _BOOL8 v8;

  ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  MEMORY[0x1BCCAB1E0](a2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1A4](a2, 1);
  objc_msgSend(MEMORY[0x1E0CB6CE8], "deletedUserDomainConceptWithUUID:creationTimestamp:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[HDUserDomainConceptEntity storeUserDomainConcept:method:profile:transaction:error:](HDUserDomainConceptEntity, "storeUserDomainConcept:method:profile:transaction:error:", v7, 3, a1[4], a1[5], a3) != 0;

  return v8;
}

id __92__HDMedicalUserDomainConceptEntity__markNewUnmappedUDCsWithTransaction_nowDate_limit_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v5;

  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDMedicalUserDomainConceptEntity, "disambiguatedDatabaseTable");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDUserDomainConceptPropertyEntity, "disambiguatedDatabaseTable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  +[HDMedicalUserDomainConceptEntity _recursiveSQLForMappedUDCs]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("INSERT OR REPLACE INTO %@ (%@, %@, %@, %@, %@, %@, %@) SELECT %@, ?, ?, ?, ?, ?, ? FROM %@ WHERE (NOT EXISTS (%@) SELECT 1 FROM %@ WHERE %@.%@ = %@.%@) AND NOT EXISTS (SELECT 1 FROM %@ WHERE(%@.%@ = %@.%@ AND %@ = ?))) LIMIT ?"), v1, CFSTR("udc_id"), CFSTR("category"), CFSTR("property_type"), CFSTR("version"), CFSTR("timestamp"), CFSTR("value_type"), CFSTR("date_value"), CFSTR("udc_id"), v0, v2, CFSTR("recursive_mapped_concepts"), v0, CFSTR("udc_id"), CFSTR("recursive_mapped_concepts"), CFSTR("udc_id"),
                 v1,
                 v0,
                 CFSTR("udc_id"),
                 v1,
                 CFSTR("udc_id"),
                 CFSTR("property_type"));

  return v3;
}

uint64_t __92__HDMedicalUserDomainConceptEntity__markNewUnmappedUDCsWithTransaction_nowDate_limit_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  double v4;
  double v5;
  int v6;
  int v8;

  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  v5 = v4;
  sqlite3_bind_int64(a2, 1, 2);
  sqlite3_bind_int64(a2, 2, 1);
  sqlite3_bind_int64(a2, 3, 0);
  sqlite3_bind_double(a2, 4, v5);
  sqlite3_bind_int64(a2, 5, 5);
  v8 = 7;
  sqlite3_bind_double(a2, 6, v5 + 2592000.0);
  +[HDMedicalUserDomainConceptEntity _bindRecursiveMappedUDCStatement:bindingIndex:](*(_QWORD *)(a1 + 40), (uint64_t)a2, &v8);
  v6 = v8 + 1;
  sqlite3_bind_int64(a2, v8, 1);
  return sqlite3_bind_int64(a2, v6, *(_QWORD *)(a1 + 48));
}

const __CFString *__62__HDMedicalUserDomainConceptEntity__recursiveSQLForMappedUDCs__block_invoke()
{
  return CFSTR("?");
}

@end
