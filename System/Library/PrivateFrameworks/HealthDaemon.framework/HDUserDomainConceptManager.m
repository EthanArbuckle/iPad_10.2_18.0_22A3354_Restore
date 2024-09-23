@implementation HDUserDomainConceptManager

- (HDUserDomainConceptManager)init
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

- (HDUserDomainConceptManager)initWithProfile:(id)a3
{
  id v4;
  HDUserDomainConceptManager *v5;
  HDUserDomainConceptManager *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  HDUserDomainConceptObserver *userDomainConceptObservers;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  HDUserDomainConceptSynchronousObserver *synchronousUserDomainConceptObservers;
  NSMutableArray *v17;
  NSMutableArray *pendingUserDomainConceptObserverRecords;
  NSMutableArray *v19;
  NSMutableArray *pendingUserDomainConceptSynchronousObserverRecords;
  HDUserDomainConceptProcessingManager *v21;
  HDUserDomainConceptProcessingManager *processingManager;
  HDUserDomainConceptSyncRequester *v23;
  HDUserDomainConceptSyncRequester *syncRequester;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HDUserDomainConceptManager;
  v5 = -[HDUserDomainConceptManager init](&v26, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = objc_alloc(MEMORY[0x1E0CB6988]);
    NSStringFromProtocol((Protocol *)&unk_1EF1C8D08);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HKLogHealthOntology();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "initWithName:loggingCategory:", v8, v9);
    userDomainConceptObservers = v6->_userDomainConceptObservers;
    v6->_userDomainConceptObservers = (HDUserDomainConceptObserver *)v10;

    v12 = objc_alloc(MEMORY[0x1E0CB6CA8]);
    NSStringFromProtocol((Protocol *)&unk_1EF252638);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HKLogHealthOntology();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "initWithName:loggingCategory:", v13, v14);
    synchronousUserDomainConceptObservers = v6->_synchronousUserDomainConceptObservers;
    v6->_synchronousUserDomainConceptObservers = (HDUserDomainConceptSynchronousObserver *)v15;

    v6->_userDomainConceptObserverLock._os_unfair_lock_opaque = 0;
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingUserDomainConceptObserverRecords = v6->_pendingUserDomainConceptObserverRecords;
    v6->_pendingUserDomainConceptObserverRecords = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingUserDomainConceptSynchronousObserverRecords = v6->_pendingUserDomainConceptSynchronousObserverRecords;
    v6->_pendingUserDomainConceptSynchronousObserverRecords = v19;

    v21 = -[HDUserDomainConceptProcessingManager initWithProfile:]([HDUserDomainConceptProcessingManager alloc], "initWithProfile:", v4);
    processingManager = v6->_processingManager;
    v6->_processingManager = v21;

    v23 = -[HDUserDomainConceptSyncRequester initWithUserDomainConceptManager:]([HDUserDomainConceptSyncRequester alloc], "initWithUserDomainConceptManager:", v6);
    syncRequester = v6->_syncRequester;
    v6->_syncRequester = v23;

  }
  return v6;
}

- (BOOL)updateUserDomainConcept:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = -[HDUserDomainConceptManager modifyUserDomainConcepts:method:error:](self, "modifyUserDomainConcepts:method:error:", v8, 1, a4, v10, v11);
  return (char)a4;
}

- (BOOL)updateUserDomainConcepts:(id)a3 error:(id *)a4
{
  return -[HDUserDomainConceptManager modifyUserDomainConcepts:method:error:](self, "modifyUserDomainConcepts:method:error:", a3, 1, a4);
}

- (BOOL)deleteUserDomainConcept:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = -[HDUserDomainConceptManager modifyUserDomainConcepts:method:error:](self, "modifyUserDomainConcepts:method:error:", v8, 3, a4, v10, v11);
  return (char)a4;
}

- (BOOL)deleteUserDomainConcepts:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  BOOL v8;
  int v10;
  HDUserDomainConceptManager *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _HKInitializeLogging();
  HKLogHealthOntology();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: deleteUserDomainConcepts: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  v8 = -[HDUserDomainConceptManager modifyUserDomainConcepts:method:error:](self, "modifyUserDomainConcepts:method:error:", v6, 3, a4);
  return v8;
}

- (BOOL)enumerateUserDomainConceptsWithPredicate:(id)a3 enumerationOptions:(unint64_t)a4 limit:(int64_t)a5 orderingTerms:(id)a6 transaction:(id)a7 error:(id *)a8 enumerationHandler:(id)a9
{
  char v13;
  id v16;
  id v17;
  id v18;
  void *v19;
  id WeakRetained;

  v13 = a4;
  v16 = a9;
  v17 = a7;
  v18 = a6;
  +[HDUserDomainConceptManager _enumerationPredicateWithOptions:existingPredicate:]((uint64_t)HDUserDomainConceptManager, v13, a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LOBYTE(a8) = +[HDUserDomainConceptEntity enumerateUserDomainConceptsWithPredicate:limit:orderingTerms:profile:transaction:error:enumerationHandler:](HDUserDomainConceptEntity, "enumerateUserDomainConceptsWithPredicate:limit:orderingTerms:profile:transaction:error:enumerationHandler:", v19, a5, v18, WeakRetained, v17, a8, v16);

  return (char)a8;
}

+ (id)_enumerationPredicateWithOptions:(void *)a3 existingPredicate:
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_opt_self();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "hk_addNonNilObject:", v4);

  if ((a2 & 1) == 0)
  {
    objc_opt_self();
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("deleted"), MEMORY[0x1E0C9AAA0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  if ((a2 & 2) == 0)
  {
    +[HDUserDomainConceptEntity ignoreHiddenConceptsPredicate](HDUserDomainConceptEntity, "ignoreHiddenConceptsPredicate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)enumerateUserDomainConceptsWithPredicate:(id)a3 enumerationOptions:(unint64_t)a4 limit:(int64_t)a5 orderingTerms:(id)a6 error:(id *)a7 enumerationHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id WeakRetained;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  unint64_t v27;
  int64_t v28;

  v14 = a3;
  v15 = a6;
  v16 = a8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __135__HDUserDomainConceptManager_enumerateUserDomainConceptsWithPredicate_enumerationOptions_limit_orderingTerms_error_enumerationHandler___block_invoke;
  v23[3] = &unk_1E6D0BFB8;
  v23[4] = self;
  v24 = v14;
  v27 = a4;
  v28 = a5;
  v25 = v15;
  v26 = v16;
  v19 = v16;
  v20 = v15;
  v21 = v14;
  LOBYTE(a7) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDUserDomainConceptEntity, "performReadTransactionWithHealthDatabase:error:block:", v18, a7, v23);

  return (char)a7;
}

uint64_t __135__HDUserDomainConceptManager_enumerateUserDomainConceptsWithPredicate_enumerationOptions_limit_orderingTerms_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateUserDomainConceptsWithPredicate:enumerationOptions:limit:orderingTerms:transaction:error:enumerationHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), a2, a3, *(_QWORD *)(a1 + 56));
}

- (BOOL)enumerateUserDomainConceptsWithPredicate:(id)a3 limit:(int64_t)a4 orderingTerms:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  return -[HDUserDomainConceptManager enumerateUserDomainConceptsWithPredicate:enumerationOptions:limit:orderingTerms:error:enumerationHandler:](self, "enumerateUserDomainConceptsWithPredicate:enumerationOptions:limit:orderingTerms:error:enumerationHandler:", a3, 0, a4, a5, a6, a7);
}

- (BOOL)enumerateUserDomainConceptsWithPredicate:(id)a3 error:(id *)a4 enumerationHandler:(id)a5
{
  return -[HDUserDomainConceptManager enumerateUserDomainConceptsWithPredicate:limit:orderingTerms:error:enumerationHandler:](self, "enumerateUserDomainConceptsWithPredicate:limit:orderingTerms:error:enumerationHandler:", a3, 0, 0, a4, a5);
}

- (id)userDomainConceptAnalyticsWithError:(id *)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__173;
  v14 = __Block_byref_object_dispose__173;
  v15 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__HDUserDomainConceptManager_userDomainConceptAnalyticsWithError___block_invoke;
  v9[3] = &unk_1E6CEE6D0;
  v9[4] = &v10;
  LODWORD(a3) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDUserDomainConceptEntity, "performReadTransactionWithHealthDatabase:error:block:", v5, a3, v9);

  if ((_DWORD)a3)
    v6 = (void *)v11[5];
  else
    v6 = 0;
  v7 = v6;
  _Block_object_dispose(&v10, 8);

  return v7;
}

BOOL __66__HDUserDomainConceptManager_userDomainConceptAnalyticsWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  int v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v43;
  id v44;
  id v46;
  id v48;
  id v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_self();
  v46 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  objc_opt_self();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v6 = objc_msgSend(&unk_1E6DFA490, "countByEnumeratingWithState:objects:count:", &v52, &v50, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v53;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v53 != v8)
          objc_enumerationMutation(&unk_1E6DFA490);
        v10 = v4;
        v48 = v4;
        v49 = v5;
        v11 = HKWithAutoreleasePool();

        if (!v11)
        {
          v12 = 0;
          v4 = v10;
          goto LABEL_11;
        }
        v4 = v10;
      }
      v7 = objc_msgSend(&unk_1E6DFA490, "countByEnumeratingWithState:objects:count:", &v52, &v50, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = v5;
LABEL_11:

  v13 = v46;
  if (v12)
  {
    objc_msgSend(v46, "addEntriesFromDictionary:", v12);
    v44 = v4;
    v43 = v4;
    objc_opt_self();
    objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("modification_date"), objc_opt_class(), 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0D29840];
    HDListUserDomainConceptEntityPredicateForListType(1, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v16;
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("user_domain_concept_links.link_type"), &unk_1E6DFE6F0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "predicateMatchingAllPredicates:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_alloc_init(MEMORY[0x1E0D298A0]);
    objc_msgSend(v20, "setEntityClass:", objc_opt_class());
    objc_msgSend(v20, "setLimitCount:", 1);
    objc_msgSend(v20, "setPredicate:", v19);
    objc_msgSend(v20, "setGroupBy:", CFSTR("udc_id"));
    v21 = (void *)v14;
    *(_QWORD *)&v52 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setOrderingTerms:", v22);

    v23 = *MEMORY[0x1E0D29620];
    v24 = *MEMORY[0x1E0D297B8];
    objc_msgSend(v43, "protectedDatabase");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    +[HDSQLiteEntity aggregateSingleValueForProperty:function:queryDescriptor:database:error:](HDListUserDomainConceptEntity, "aggregateSingleValueForProperty:function:queryDescriptor:database:error:", v23, v24, v20, v25, a3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v26, "allValues");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "numberWithInteger:", objc_msgSend(v29, "integerValue"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v30 = 0;
    }

    if (v30)
    {
      v13 = v46;
      objc_msgSend(v46, "setObject:forKeyedSubscript:", v30, CFSTR("countNumberLabConceptsPinned"));
      v32 = v43;
      v33 = objc_opt_self();
      HDMedicalUserDomainConceptEntityPredicateForCategoryType((uint64_t)&unk_1E6DFE6A8, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x1E0D29840];
      HDUserDomainConceptEducationContentEntityPredicateForEducationContent(0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v36;
      v51 = v34;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "predicateMatchingAllPredicates:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      +[HDUserDomainConceptManager _countOfMedicalUserDomainConceptsWithPredicate:transaction:error:](v33, v38, v32, a3);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        objc_msgSend(v46, "setObject:forKeyedSubscript:", v39, CFSTR("countNumberLabConceptsWithEducation"));
        v31 = objc_msgSend(v46, "copy");
      }
      else
      {
        v31 = 0;
      }

    }
    else
    {
      v31 = 0;
      v13 = v46;
    }

    v4 = v44;
  }
  else
  {
    v31 = 0;
  }

  v40 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v41 = *(void **)(v40 + 40);
  *(_QWORD *)(v40 + 40) = v31;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

- (id)orderingTermsForSortDescriptors:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  const __CFString *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v26;
  uint64_t v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    v10 = *MEMORY[0x1E0CB60A8];
    v27 = *MEMORY[0x1E0CB60B0];
    v26 = *MEMORY[0x1E0CB60A0];
    obj = v6;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v12, "key");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v10);

        v15 = CFSTR("creation_date");
        if ((v14 & 1) == 0)
        {
          objc_msgSend(v12, "key");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", v27);

          v15 = CFSTR("modification_date");
          if ((v17 & 1) == 0)
          {
            objc_msgSend(v12, "key");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isEqualToString:", v26);

            v15 = CFSTR("sync_anchor");
            if ((v19 & 1) == 0)
            {
              v22 = (void *)MEMORY[0x1E0CB35C8];
              objc_msgSend(v12, "key");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "hk_assignError:code:format:", a4, 3, CFSTR("We don't have have any sort descriptor key defined for key: '%@'. Please add them here"), v23);

              v6 = obj;
              v21 = 0;
              goto LABEL_13;
            }
          }
        }
        objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", v15, objc_opt_class(), objc_msgSend(v12, "ascending"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v20);

      }
      v6 = obj;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v8)
        continue;
      break;
    }
  }

  v21 = v5;
LABEL_13:

  return v21;
}

- (void)addUserDomainConceptObserver:(id)a3 queue:(id)a4
{
  -[HDUserDomainConceptObserver registerObserver:queue:](self->_userDomainConceptObservers, "registerObserver:queue:", a3, a4);
}

- (void)removeUserDomainConceptObserver:(id)a3
{
  -[HDUserDomainConceptObserver unregisterObserver:](self->_userDomainConceptObservers, "unregisterObserver:", a3);
}

- (void)addSynchronousUserDomainConceptObserver:(id)a3
{
  -[HDUserDomainConceptSynchronousObserver registerObserver:](self->_synchronousUserDomainConceptObservers, "registerObserver:", a3);
}

- (void)removeSynchronousUserDomainConceptObserver:(id)a3
{
  -[HDUserDomainConceptSynchronousObserver unregisterObserver:](self->_synchronousUserDomainConceptObservers, "unregisterObserver:", a3);
}

- (BOOL)modifyUserDomainConcepts:(id)a3 method:(int64_t)a4 syncProvenance:(int64_t)a5 syncIdentity:(int64_t)a6 syncVersion:(id)a7 error:(id *)a8
{
  id v14;
  _HDUserDomainConceptManagerModificationOperation *v15;
  id WeakRetained;
  _BOOL4 v17;
  void *v18;

  v14 = a3;
  if (self)
  {
    v15 = -[_HDUserDomainConceptManagerModificationOperation initWithUserDomainConcepts:method:syncProvenance:syncIdentity:syncVersion:]([_HDUserDomainConceptManagerModificationOperation alloc], "initWithUserDomainConcepts:method:syncProvenance:syncIdentity:syncVersion:", v14, a4, a5, a6, a7);
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v17 = -[HDJournalableOperation performOrJournalWithProfile:error:](v15, "performOrJournalWithProfile:error:", WeakRetained, a8);

    if (v17 && -[HDJournalableOperation didJournal](v15, "didJournal"))
    {
      objc_msgSend(v14, "hk_map:", &__block_literal_global_213);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock(&self->_userDomainConceptObserverLock);
      -[NSMutableArray addObjectsFromArray:](self->_pendingUserDomainConceptObserverRecords, "addObjectsFromArray:", v18);
      os_unfair_lock_unlock(&self->_userDomainConceptObserverLock);
      -[HDUserDomainConceptManager _callObserversIfPossible]((uint64_t)self);

    }
  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (BOOL)modifyUserDomainConcepts:(id)a3 method:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a3;
  -[HDUserDomainConceptManager profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[HDUserDomainConceptManager modifyUserDomainConcepts:method:syncProvenance:syncIdentity:syncVersion:error:](self, "modifyUserDomainConcepts:method:syncProvenance:syncIdentity:syncVersion:error:", v8, a4, 0, objc_msgSend(v9, "currentSyncIdentityPersistentID"), 0x400000000, a5);

  return (char)a5;
}

- (void)openObserverTransaction
{
  os_unfair_lock_s *p_userDomainConceptObserverLock;

  p_userDomainConceptObserverLock = &self->_userDomainConceptObserverLock;
  os_unfair_lock_lock(&self->_userDomainConceptObserverLock);
  ++self->_userDomainConceptObserverOpenTransactionsCount;
  os_unfair_lock_unlock(p_userDomainConceptObserverLock);
}

- (void)closeObserverTransaction
{
  os_unfair_lock_s *p_userDomainConceptObserverLock;
  int64_t userDomainConceptObserverOpenTransactionsCount;
  void *v6;

  p_userDomainConceptObserverLock = &self->_userDomainConceptObserverLock;
  os_unfair_lock_lock(&self->_userDomainConceptObserverLock);
  userDomainConceptObserverOpenTransactionsCount = self->_userDomainConceptObserverOpenTransactionsCount;
  if (userDomainConceptObserverOpenTransactionsCount <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDUserDomainConceptManager.m"), 332, CFSTR("No open transactions"));

    userDomainConceptObserverOpenTransactionsCount = self->_userDomainConceptObserverOpenTransactionsCount;
  }
  self->_userDomainConceptObserverOpenTransactionsCount = userDomainConceptObserverOpenTransactionsCount - 1;
  os_unfair_lock_unlock(p_userDomainConceptObserverLock);
  -[HDUserDomainConceptManager _callObserversIfPossible]((uint64_t)self);
}

- (void)_callObserversIfPossible
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    -[HDUserDomainConceptManager _synthesizeSummaryForCallToObserversAndFlushRecordsIsSynchronous:](a1, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      _HKInitializeLogging();
      HKLogHealthOntology();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v2, "addedConcepts");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "count");
        objc_msgSend(v2, "updatedConcepts");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "count");
        objc_msgSend(v2, "journaledConcepts");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count");
        objc_msgSend(v2, "removedConcepts");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v15 = a1;
        v16 = 2048;
        v17 = v5;
        v18 = 2048;
        v19 = v7;
        v20 = 2048;
        v21 = v9;
        v22 = 2048;
        v23 = objc_msgSend(v10, "count");
        _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: notify UDC observers about: added=%ld, updated=%ld, journaled=%ld, deleted=%ld", buf, 0x34u);

      }
      v11 = *(void **)(a1 + 8);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __54__HDUserDomainConceptManager__callObserversIfPossible__block_invoke;
      v12[3] = &unk_1E6D0C048;
      v12[4] = a1;
      v13 = v2;
      objc_msgSend(v11, "notifyObservers:", v12);

    }
  }
}

- (void)notifyObserversForAddedUDC:(id)a3 transaction:(id)a4
{
  -[HDUserDomainConceptManager _notifyObserversForUDC:type:transaction:]((uint64_t)self, a3, 1, a4);
}

- (void)_notifyObserversForUDC:(uint64_t)a3 type:(void *)a4 transaction:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _HDUserDomainConceptObserverRecord *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  id v19;

  v7 = a4;
  if (a1)
  {
    v8 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    v9 = *(void **)(a1 + 56);
    if (!v9)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v11 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v10;

      objc_msgSend(v7, "protectedDatabase");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __70__HDUserDomainConceptManager__notifyObserversForUDC_type_transaction___block_invoke;
      v18[3] = &unk_1E6CF9188;
      v18[4] = a1;
      v14 = v7;
      v19 = v14;
      objc_msgSend(v12, "beforeCommit:", v18);

      v16[4] = a1;
      v17[0] = v13;
      v17[1] = 3221225472;
      v17[2] = __70__HDUserDomainConceptManager__notifyObserversForUDC_type_transaction___block_invoke_2;
      v17[3] = &unk_1E6CE80E8;
      v17[4] = a1;
      v16[0] = v13;
      v16[1] = 3221225472;
      v16[2] = __70__HDUserDomainConceptManager__notifyObserversForUDC_type_transaction___block_invoke_3;
      v16[3] = &unk_1E6CE8030;
      objc_msgSend(v14, "onCommit:orRollback:", v17, v16);

      v9 = *(void **)(a1 + 56);
    }
    v15 = -[_HDUserDomainConceptObserverRecord initWithUserDomainConcept:modificationType:]([_HDUserDomainConceptObserverRecord alloc], "initWithUserDomainConcept:modificationType:", v8, a3);

    objc_msgSend(v9, "addObject:", v15);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  }

}

- (void)notifyObserversForUpdatedUDC:(id)a3 transaction:(id)a4
{
  -[HDUserDomainConceptManager _notifyObserversForUDC:type:transaction:]((uint64_t)self, a3, 2, a4);
}

- (void)notifyObserversForDeletedUDC:(id)a3 transaction:(id)a4
{
  -[HDUserDomainConceptManager _notifyObserversForUDC:type:transaction:]((uint64_t)self, a3, 3, a4);
}

+ (id)countOfUserDomainConceptsMatchingPredicate:(id)a3 options:(unint64_t)a4 transaction:(id)a5 error:(id *)a6
{
  char v7;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v7 = a4;
  v10 = a5;
  +[HDUserDomainConceptManager _enumerationPredicateWithOptions:existingPredicate:]((uint64_t)a1, v7, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  v13 = v11;
  v14 = objc_opt_self();
  v15 = (void *)objc_opt_class();
  +[HDUserDomainConceptManager _countOfUserDomainConceptsWithEntity:predicate:transaction:error:](v14, v15, v13, v12, (uint64_t)a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

BOOL __129__HDUserDomainConceptManager__enumerateAndDeleteSemanticDuplicatesOfConceptIfSupportsHidingSemanticDuplicates_transaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id *v6;
  id v7;
  id WeakRetained;
  _BOOL8 v9;

  v6 = (id *)(*(_QWORD *)(a1 + 32) + 64);
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  v9 = +[HDUserDomainConceptEntity deleteUserDomainConcept:profile:transaction:error:](HDUserDomainConceptEntity, "deleteUserDomainConcept:profile:transaction:error:", v7, WeakRetained, *(_QWORD *)(a1 + 40), a4);

  return v9;
}

+ (id)_countOfUserDomainConceptsWithEntity:(void *)a3 predicate:(void *)a4 transaction:(uint64_t)a5 error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  objc_opt_self();
  objc_msgSend(v8, "protectedDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a2, "countDistinctForProperty:predicate:database:error:", CFSTR("udc_id"), v9, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_countOfMedicalUserDomainConceptsWithPredicate:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a2;
  v8 = objc_opt_self();
  v9 = (void *)objc_opt_class();
  +[HDUserDomainConceptManager _countOfUserDomainConceptsWithEntity:predicate:transaction:error:](v8, v9, v7, v6, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

BOOL __95__HDUserDomainConceptManager__analyticsForMedicalUserDomainConceptCountsWithTransaction_error___block_invoke(id *a1, uint64_t a2)
{
  uint64_t v4;
  __CFString *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a1[4], "integerValue");
  objc_opt_self();
  if ((unint64_t)(v4 - 1) >= 7)
  {
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x1E0CB52D8];
    v11 = 1;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_INFO))
    {
      v13 = v12;
      HKStringFromMedicalRecordCategoryType();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v14;
      _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_INFO, "Health records category %@ not supported in daily analytics", (uint8_t *)&v16, 0xCu);

    }
    v5 = 0;
  }
  else
  {
    v5 = off_1E6D0C090[v4 - 1];
    v6 = a1[5];
    v7 = objc_opt_self();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HDMedicalUserDomainConceptEntityPredicateForCategoryType((uint64_t)v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[HDUserDomainConceptManager _countOfMedicalUserDomainConceptsWithPredicate:transaction:error:](v7, v9, v6, a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v10 != 0;
    if (v10)
      objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v10, v5);

  }
  return v11;
}

_HDUserDomainConceptObserverRecord *__73__HDUserDomainConceptManager__notifyObserversIfPossibleForJournaledUDCs___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _HDUserDomainConceptObserverRecord *v3;

  v2 = a2;
  v3 = -[_HDUserDomainConceptObserverRecord initWithUserDomainConcept:modificationType:]([_HDUserDomainConceptObserverRecord alloc], "initWithUserDomainConcept:modificationType:", v2, 4);

  return v3;
}

uint64_t __70__HDUserDomainConceptManager__notifyObserversForUDC_type_transaction___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v18;
  _BYTE v19[24];
  void *v20;
  __int128 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  if (v2)
  {
    -[HDUserDomainConceptManager _synthesizeSummaryForCallToObserversAndFlushRecordsIsSynchronous:](v2, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "journaledConcepts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      _HKInitializeLogging();
      HKLogHealthOntology();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "journaledConcepts");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v19 = 138543618;
        *(_QWORD *)&v19[4] = v2;
        *(_WORD *)&v19[12] = 2048;
        *(_QWORD *)&v19[14] = objc_msgSend(v18, "count");
        _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "%{public}@: synchronous observer cache summary contains %ld journaled records, but it should not have any", v19, 0x16u);

      }
    }
    _HKInitializeLogging();
    HKLogHealthOntology();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "addedConcepts");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");
      objc_msgSend(v4, "updatedConcepts");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");
      objc_msgSend(v4, "removedConcepts");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");
      *(_DWORD *)v19 = 138544130;
      *(_QWORD *)&v19[4] = v2;
      *(_WORD *)&v19[12] = 2048;
      *(_QWORD *)&v19[14] = v10;
      *(_WORD *)&v19[22] = 2048;
      v20 = (void *)v12;
      LOWORD(v21) = 2048;
      *(_QWORD *)((char *)&v21 + 2) = v14;
      _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: notify synchronous UDC observers about: added=%ld, updated=%ld, deleted=%ld", v19, 0x2Au);

    }
    v15 = *(void **)(v2 + 16);
    *(_QWORD *)v19 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v19[8] = 3221225472;
    *(_QWORD *)&v19[16] = __71__HDUserDomainConceptManager__callSynchronousObserversWithTransaction___block_invoke;
    v20 = &unk_1E6D0C070;
    *(_QWORD *)&v21 = v2;
    *((_QWORD *)&v21 + 1) = v4;
    v22 = v3;
    v16 = v4;
    objc_msgSend(v15, "notifyObservers:", v19);

  }
  return 1;
}

void __70__HDUserDomainConceptManager__notifyObserversForUDC_type_transaction___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  -[HDUserDomainConceptManager _callObserversIfPossible](*(_QWORD *)(a1 + 32));
}

void __70__HDUserDomainConceptManager__notifyObserversForUDC_type_transaction___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
}

- (_HDUserDomainConceptObserverRecordSummary)_synthesizeSummaryForCallToObserversAndFlushRecordsIsSynchronous:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  _HDUserDomainConceptObserverRecordSummary *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  os_unfair_lock_s *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  if ((a2 & 1) != 0)
  {
    v5 = 48;
  }
  else
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v6 = 0;
      goto LABEL_30;
    }
    v5 = 40;
  }
  v7 = *(id *)(a1 + v5);
  v21 = v4;
  os_unfair_lock_assert_owner(v4);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v8);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        switch(objc_msgSend(v17, "changeType"))
        {
          case 1:
            if (!v12)
              v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v17, "userDomainConcept");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v12;
            goto LABEL_24;
          case 2:
            if (!v13)
              v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v17, "userDomainConcept");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v13;
            goto LABEL_24;
          case 3:
            if (!v14)
              v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v17, "userDomainConcept");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v14;
            goto LABEL_24;
          case 4:
            if (!v11)
              v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v17, "userDomainConcept");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v11;
LABEL_24:
            objc_msgSend(v19, "addObject:", v18);

            break;
          default:
            continue;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
  }

  objc_msgSend(v8, "removeAllObjects");
  v6 = -[_HDUserDomainConceptObserverRecordSummary initWithJournaledConcepts:addedConcepts:updatedConcepts:removedConcepts:]([_HDUserDomainConceptObserverRecordSummary alloc], "initWithJournaledConcepts:addedConcepts:updatedConcepts:removedConcepts:", v11, v12, v13, v14);

  v4 = v21;
LABEL_30:
  os_unfair_lock_unlock(v4);
  return v6;
}

void __54__HDUserDomainConceptManager__callObserversIfPossible__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v18 = a2;
  v4 = v3;
  v5 = v4;
  if (v2)
  {
    objc_msgSend(v4, "journaledConcepts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      objc_msgSend(v5, "journaledConcepts");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "userDomainConceptManager:didJournalUserDomainConcepts:", v2, v8);

    }
    objc_msgSend(v5, "addedConcepts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      objc_msgSend(v5, "addedConcepts");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "userDomainConceptManager:didAddUserDomainConcepts:", v2, v11);

    }
    objc_msgSend(v5, "updatedConcepts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      objc_msgSend(v5, "updatedConcepts");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "userDomainConceptManager:didUpdateUserDomainConcepts:", v2, v14);

    }
    objc_msgSend(v5, "removedConcepts");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      objc_msgSend(v5, "removedConcepts");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "userDomainConceptManager:didDeleteUserDomainConcepts:", v2, v17);

    }
  }

}

void __71__HDUserDomainConceptManager__callSynchronousObserversWithTransaction___block_invoke(_QWORD *a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v3 = a1[4];
  v2 = (void *)a1[5];
  v4 = (void *)a1[6];
  v16 = a2;
  v5 = v2;
  v6 = v4;
  if (v3)
  {
    objc_msgSend(v5, "addedConcepts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      objc_msgSend(v5, "addedConcepts");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "userDomainConceptManager:didAddUserDomainConcepts:transaction:", v3, v9, v6);

    }
    objc_msgSend(v5, "updatedConcepts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      objc_msgSend(v5, "updatedConcepts");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "userDomainConceptManager:didUpdateUserDomainConcepts:transaction:", v3, v12, v6);

    }
    objc_msgSend(v5, "removedConcepts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      objc_msgSend(v5, "removedConcepts");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "userDomainConceptManager:didDeleteUserDomainConcepts:transaction:", v3, v15, v6);

    }
  }

}

- (id)keyValueDomain
{
  HDKeyValueDomain *v3;
  id WeakRetained;
  HDKeyValueDomain *v5;

  v3 = [HDKeyValueDomain alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v3, "initWithCategory:domainName:profile:", 100, CFSTR("com.apple.health.records.userdomain"), WeakRetained);

  return v5;
}

+ (id)predicateForAllPinnedConceptsMappingToRecordsWithUUIDs:(id)a3 pinnedConceptUUIDs:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0D29890];
  v6 = a4;
  HDMedicalUserDomainConceptEntityPredicateForMedicalRecordWithUUIDs((uint64_t)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDUserDomainConceptEntityPredicateForConceptUUIDs((uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "compoundPredicateWithPredicate:otherPredicate:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForListUserDomainConceptWithType:(unint64_t)a3
{
  return HDListUserDomainConceptEntityPredicateForListType(a3, 1);
}

+ (id)predicateForElementsOfListType:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0D298A0]);
  objc_msgSend(v4, "setEntityClass:", objc_opt_class());
  objc_msgSend(v4, "setLimitCount:", 1);
  HDListUserDomainConceptEntityPredicateForListType(a3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("modification_date"), objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOrderingTerms:", v7);

  v8 = (void *)MEMORY[0x1E0D29838];
  +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDUserDomainConceptLinkEntity, "disambiguatedSQLForProperty:", CFSTR("udc_id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = CFSTR("udc_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithProperty:comparisonType:subqueryDescriptor:subqueryProperties:", v9, 7, v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("user_domain_concept_links.link_type"), &unk_1E6DFE6F0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0D298A0]);
  objc_msgSend(v13, "setEntityClass:", objc_opt_class());
  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPredicate:", v14);

  v15 = (void *)MEMORY[0x1E0D29838];
  v19 = CFSTR("user_domain_concept_links.target_uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "predicateWithProperty:comparisonType:subqueryDescriptor:subqueryProperties:", CFSTR("uuid"), 7, v13, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (HDUserDomainConceptSyncRequester)syncRequester
{
  return self->_syncRequester;
}

- (HDUserDomainConceptProcessingManager)processingManager
{
  return self->_processingManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingManager, 0);
  objc_storeStrong((id *)&self->_syncRequester, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_transactionUserDomainConceptObserverRecords, 0);
  objc_storeStrong((id *)&self->_pendingUserDomainConceptSynchronousObserverRecords, 0);
  objc_storeStrong((id *)&self->_pendingUserDomainConceptObserverRecords, 0);
  objc_storeStrong((id *)&self->_synchronousUserDomainConceptObservers, 0);
  objc_storeStrong((id *)&self->_userDomainConceptObservers, 0);
}

@end
