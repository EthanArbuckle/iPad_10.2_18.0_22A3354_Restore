@implementation ACHEarnedInstanceEntity

+ (void)setSyncedEarnedInstancesObserver:(id)a3
{
  id v3;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&syncObserverLock);
  objc_storeWeak(&_syncObserver, v3);

  os_unfair_lock_unlock((os_unfair_lock_t)&syncObserverLock);
}

+ (ACHEarnedInstanceEntitySyncedEarnedInstancesObserver)syncedEarnedInstancesObserver
{
  id WeakRetained;

  os_unfair_lock_lock((os_unfair_lock_t)&syncObserverLock);
  WeakRetained = objc_loadWeakRetained(&_syncObserver);
  os_unfair_lock_unlock((os_unfair_lock_t)&syncObserverLock);
  return (ACHEarnedInstanceEntitySyncedEarnedInstancesObserver *)WeakRetained;
}

+ (void)setJournalEntryAppliedObserver:(id)a3
{
  id v3;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&journalAppliedObserverLock);
  objc_storeWeak(&_journalEntryAppliedObserver, v3);

  os_unfair_lock_unlock((os_unfair_lock_t)&journalAppliedObserverLock);
}

+ (ACHEarnedInstanceEntityJournalEntryAppliedObserver)journalEntryAppliedObserver
{
  id WeakRetained;

  os_unfair_lock_lock((os_unfair_lock_t)&journalAppliedObserverLock);
  WeakRetained = objc_loadWeakRetained(&_journalEntryAppliedObserver);
  os_unfair_lock_unlock((os_unfair_lock_t)&journalAppliedObserverLock);
  return (ACHEarnedInstanceEntityJournalEntryAppliedObserver *)WeakRetained;
}

+ (id)databaseTable
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_earned_instances"), *MEMORY[0x24BE01218]);
}

+ (id)createTableSQL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "databaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("CREATE TABLE IF NOT EXISTS %@             (%@ INTEGER PRIMARY KEY AUTOINCREMENT,             %@ TEXT,             %@ REAL,             %@ TEXT,             %@ REAL,             %@ TEXT,             %@ TEXT,             %@ INTEGER,             %@ INTEGER,             %@ INTEGER NOT NULL)"), v3, *MEMORY[0x24BE40D48], CFSTR("template_unique_name"), CFSTR("created_date"), CFSTR("earned_date"), CFSTR("value_in_canonical_unit"), CFSTR("value_canonical_unit"), CFSTR("external_identifier"), CFSTR("creator_device"), CFSTR("sync_provenance"), CFSTR("sync_identity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 10;
  return (const $27325D3925FB5ACF38BB0AF4A70276FF *)columnDefinitionsWithCount__columnDefinitions;
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
  ACHEarnedInstanceEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([ACHEarnedInstanceEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

+ (id)insertEarnedInstances:(id)a3 provenance:(int64_t)a4 useLegacySyncIdentity:(BOOL)a5 profile:(id)a6 databaseContext:(id)a7 error:(id *)a8
{
  _BOOL8 v10;
  id v13;
  id v14;
  id v15;
  void *v16;

  v10 = a5;
  v13 = a7;
  v14 = a6;
  v15 = a3;
  objc_msgSend((id)objc_opt_class(), "_insertEarnedInstances:provenance:useLegacySyncIdentity:profile:databaseContext:error:", v15, a4, v10, v14, v13, a8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)allEarnedInstancesWithProfile:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BE40E48];
  v6 = a3;
  objc_msgSend(v5, "truePredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_earnedInstancesWithPredicate:profile:error:", v7, v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)mostRecentEarnedInstanceForTemplateUniqueName:(id)a3 profile:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = (void *)MEMORY[0x24BE40E18];
  v8 = a4;
  objc_msgSend(v7, "predicateWithProperty:equalToValue:", CFSTR("template_unique_name"), a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_earnedInstancesWithPredicate:limit:ascendingByEarnedDate:profile:error:", v9, 1, 0, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)earnedInstancesForTemplateUniqueName:(id)a3 profile:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v7 = (void *)MEMORY[0x24BE40E18];
  v8 = a4;
  objc_msgSend(v7, "predicateWithProperty:equalToValue:", CFSTR("template_unique_name"), a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_earnedInstancesWithPredicate:profile:error:", v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (unint64_t)countOfEarnedInstancesForTemplateUniqueName:(id)a3 profile:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;

  v7 = (void *)MEMORY[0x24BE40E18];
  v8 = a4;
  objc_msgSend(v7, "predicateWithProperty:equalToValue:", CFSTR("template_unique_name"), a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend((id)objc_opt_class(), "_countOfEarnedInstancesWithPredicate:profile:error:", v9, v8, a5);

  return v10;
}

+ (id)earnedInstancesForDateComponents:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  ACHYearMonthDayStringFromDateComponents();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE40E18], "predicateWithProperty:equalToValue:", CFSTR("earned_date"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_earnedInstancesWithPredicate:profile:error:", v8, v6, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BDD0FC8];
    v15[0] = CFSTR("Unable to parse date components");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ActivityAchievements"), 133, v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v12);
      else
        _HKLogDroppedError();
    }

    v9 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v9;
}

+ (BOOL)removeEarnedInstances:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  char v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    ACHEarnedInstancePredicateUsingKey(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __63__ACHEarnedInstanceEntity_removeEarnedInstances_profile_error___block_invoke;
    v19[3] = &unk_24D13A9F0;
    v22 = a1;
    v20 = v10;
    v21 = v9;
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __63__ACHEarnedInstanceEntity_removeEarnedInstances_profile_error___block_invoke_2;
    v16[3] = &unk_24D13AA18;
    v17 = v8;
    v18 = v21;
    v13 = v10;
    v14 = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v11, a5, v19, v16);

  }
  else
  {
    v14 = 1;
  }

  return v14;
}

uint64_t __63__ACHEarnedInstanceEntity_removeEarnedInstances_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "deleteEntitiesWithPredicate:healthDatabase:error:", v4, v6, a3);

  return v7;
}

uint64_t __63__ACHEarnedInstanceEntity_removeEarnedInstances_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  ACHEarnedInstanceJournalEntry *v12;
  ACHEarnedInstanceJournalEntry *v13;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        v12 = [ACHEarnedInstanceJournalEntry alloc];
        v13 = -[ACHEarnedInstanceJournalEntry initWithEarnedInstance:provenance:useLegacySyncIdentity:action:](v12, "initWithEarnedInstance:provenance:useLegacySyncIdentity:action:", v11, 0, 0, 1, (_QWORD)v17);
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(a1 + 40), "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "addJournalEntries:error:", v5, a3);

  return v15;
}

+ (BOOL)removeEarnedInstancesForTemplateUniqueName:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a4;
  objc_msgSend(a1, "earnedInstancesForTemplateUniqueName:profile:error:", a3, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend((id)objc_opt_class(), "removeEarnedInstances:profile:error:", v9, v8, a5);

  return (char)a5;
}

+ (BOOL)removeAllEarnedInstancesWithProfile:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "allEarnedInstancesWithProfile:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend((id)objc_opt_class(), "removeEarnedInstances:profile:error:", v6, v5, a4);

  return (char)a4;
}

+ (unint64_t)_countOfEarnedInstancesWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  unint64_t v10;

  v8 = a3;
  objc_msgSend(a4, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "countOfObjectsWithPredicate:healthDatabase:error:", v8, v9, a5);

  return v10;
}

+ (id)_earnedInstancesWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "_earnedInstancesWithPredicate:limit:ascendingByEarnedDate:profile:error:", a3, *MEMORY[0x24BE40E68], 1, a4, a5);
}

+ (id)_earnedInstancesWithPredicate:(id)a3 limit:(unint64_t)a4 ascendingByEarnedDate:(BOOL)a5 profile:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  id v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v12 = a3;
  v13 = a6;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2;
  v30 = __Block_byref_object_dispose__2;
  v31 = (id)MEMORY[0x24BDBD1A8];
  objc_msgSend(v13, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __99__ACHEarnedInstanceEntity__earnedInstancesWithPredicate_limit_ascendingByEarnedDate_profile_error___block_invoke;
  v19[3] = &unk_24D13AA68;
  v23 = a1;
  v15 = v13;
  v20 = v15;
  v16 = v12;
  v24 = a4;
  v25 = a5;
  v21 = v16;
  v22 = &v26;
  objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v14, a7, v19);

  v17 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v17;
}

uint64_t __99__ACHEarnedInstanceEntity__earnedInstancesWithPredicate_limit_ascendingByEarnedDate_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:", *(_QWORD *)(a1 + 32), v5, 1, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 64);
  objc_msgSend(MEMORY[0x24BE40E40], "orderingTermWithProperty:entityClass:ascending:", CFSTR("earned_date"), v9, *(unsigned __int8 *)(a1 + 72));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v6, v8, v10, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "orderedProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __99__ACHEarnedInstanceEntity__earnedInstancesWithPredicate_limit_ascendingByEarnedDate_profile_error___block_invoke_2;
  v19[3] = &unk_24D13AA40;
  v20 = v7;
  v21 = *(id *)(a1 + 32);
  v22 = v5;
  v23 = *(_QWORD *)(a1 + 48);
  v15 = v5;
  v16 = v7;
  v17 = objc_msgSend(v13, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v14, a3, v19);

  return v17;
}

BOOL __99__ACHEarnedInstanceEntity__earnedInstancesWithPredicate_limit_ascendingByEarnedDate_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  id v18;
  id v19;

  v3 = *(void **)(a1 + 32);
  v19 = 0;
  objc_msgSend(v3, "objectForPersistentID:row:error:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v19;
  v6 = HDSQLiteColumnWithNameAsInt64();
  objc_msgSend(*(id *)(a1 + 40), "syncIdentityManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 48);
  v18 = v5;
  objc_msgSend(v7, "identityForEntityID:transaction:error:", v6, v8, &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v18;

  if (v9)
  {
    objc_msgSend(v9, "identity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    achSyncIdentity(v11);
    v12 = objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(v4, "setSyncIdentity:", v12);
    v13 = v4 != 0;
    if (v4)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "arrayByAddingObject:", v4);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v16 = *(NSObject **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;
    }
    else
    {
      ACHLogDatabase();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __99__ACHEarnedInstanceEntity__earnedInstancesWithPredicate_limit_ascendingByEarnedDate_profile_error___block_invoke_2_cold_2();
    }

  }
  else
  {
    ACHLogDatabase();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __99__ACHEarnedInstanceEntity__earnedInstancesWithPredicate_limit_ascendingByEarnedDate_profile_error___block_invoke_2_cold_1();
    v13 = 0;
  }

  return v13;
}

+ (id)_insertEarnedInstances:(id)a3 provenance:(int64_t)a4 useLegacySyncIdentity:(BOOL)a5 profile:(id)a6 databaseContext:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  char v23;
  NSObject *v24;
  void *v25;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  int64_t v32;
  BOOL v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  int64_t v39;
  BOOL v40;

  v13 = a3;
  v14 = a6;
  v15 = a7;
  v16 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BE40AB0], "contextForWritingProtectedData");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "database", a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "copyForWritingProtectedData");
  v19 = MEMORY[0x24BDAC760];
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __113__ACHEarnedInstanceEntity__insertEarnedInstances_provenance_useLegacySyncIdentity_profile_databaseContext_error___block_invoke;
  v34[3] = &unk_24D13AA90;
  v35 = v13;
  v40 = a5;
  v36 = v14;
  v38 = a1;
  v39 = a4;
  v20 = v16;
  v37 = v20;
  v29[0] = v19;
  v29[1] = 3221225472;
  v29[2] = __113__ACHEarnedInstanceEntity__insertEarnedInstances_provenance_useLegacySyncIdentity_profile_databaseContext_error___block_invoke_2;
  v29[3] = &unk_24D13AAB8;
  v21 = v35;
  v30 = v21;
  v32 = a4;
  v33 = a5;
  v22 = v36;
  v31 = v22;
  v23 = objc_msgSend(v17, "performTransactionWithContext:error:block:inaccessibilityHandler:", v18, v28, v34, v29);

  if ((v23 & 1) == 0)
  {
    ACHLogDatabase();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      +[ACHEarnedInstanceEntity _insertEarnedInstances:provenance:useLegacySyncIdentity:profile:databaseContext:error:].cold.1();

  }
  ACHSortedEarnedInstances();
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

uint64_t __113__ACHEarnedInstanceEntity__insertEarnedInstances_provenance_useLegacySyncIdentity_profile_databaseContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = *(void **)(a1 + 32);
  v6 = 1;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("key"), 1);
  v29 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v9;
  v23 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        ACHEarnedInstanceSyncIdentityFromEarnedInstance(v11, *(unsigned __int8 *)(a1 + 72), *(void **)(a1 + 40), v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_opt_class();
        v14 = *(_QWORD *)(a1 + 64);
        objc_msgSend(v12, "entity");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "persistentID");
        objc_msgSend(v4, "protectedDatabase");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_insertEarnedInstance:provenance:syncIdentity:database:error:", v11, v14, v16, v17, a3);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = (void *)objc_msgSend(v11, "copy");
        objc_msgSend(v19, "setKey:", objc_msgSend(v18, "persistentID"));
        if (!v19)
        {

          v6 = 0;
          goto LABEL_11;
        }
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v19);

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v23)
        continue;
      break;
    }
    v6 = 1;
  }
LABEL_11:

  return v6;
}

uint64_t __113__ACHEarnedInstanceEntity__insertEarnedInstances_provenance_useLegacySyncIdentity_profile_databaseContext_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  ACHEarnedInstanceJournalEntry *v12;
  ACHEarnedInstanceJournalEntry *v13;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        v12 = [ACHEarnedInstanceJournalEntry alloc];
        v13 = -[ACHEarnedInstanceJournalEntry initWithEarnedInstance:provenance:useLegacySyncIdentity:action:](v12, "initWithEarnedInstance:provenance:useLegacySyncIdentity:action:", v11, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), 0, (_QWORD)v17);
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(a1 + 40), "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "addJournalEntries:error:", v5, a3);

  return v15;
}

+ (id)_insertEarnedInstance:(id)a3 provenance:(int64_t)a4 syncIdentity:(int64_t)a5 database:(id)a6 error:(id *)a7
{
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  int64_t v21;
  int64_t v22;

  v12 = a3;
  v13 = _insertEarnedInstance_provenance_syncIdentity_database_error__onceToken;
  v14 = a6;
  if (v13 != -1)
    dispatch_once(&_insertEarnedInstance_provenance_syncIdentity_database_error__onceToken, &__block_literal_global_244);
  v15 = _insertEarnedInstance_provenance_syncIdentity_database_error__earnedInstanceProperties;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __88__ACHEarnedInstanceEntity__insertEarnedInstance_provenance_syncIdentity_database_error___block_invoke_2;
  v19[3] = &unk_24D13AB00;
  v20 = v12;
  v21 = a4;
  v22 = a5;
  v16 = v12;
  objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 1, v14, v15, a7, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __88__ACHEarnedInstanceEntity__insertEarnedInstance_provenance_syncIdentity_database_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  ACHEarnedInstanceAllKeys();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_insertEarnedInstance_provenance_syncIdentity_database_error__earnedInstanceProperties;
  _insertEarnedInstance_provenance_syncIdentity_database_error__earnedInstanceProperties = v0;

}

void __88__ACHEarnedInstanceEntity__insertEarnedInstance_provenance_syncIdentity_database_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "templateUniqueName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2199C8B18](a2, CFSTR("template_unique_name"), v4);

  objc_msgSend(*(id *)(a1 + 32), "createdDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2199C8ADC](a2, CFSTR("created_date"), v5);

  objc_msgSend(*(id *)(a1 + 32), "earnedDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ACHYearMonthDayStringFromDateComponents();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2199C8B18](a2, CFSTR("earned_date"), v7);

  MEMORY[0x2199C8B00](a2, CFSTR("creator_device"), objc_msgSend(*(id *)(a1 + 32), "creatorDevice"));
  MEMORY[0x2199C8B00](a2, CFSTR("sync_provenance"), *(_QWORD *)(a1 + 40));
  MEMORY[0x2199C8B00](a2, CFSTR("sync_identity"), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ACHCanonicalEarnedInstanceUnitForQuantity();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValueForUnit:", v10);
    v13 = v12;

    MEMORY[0x2199C8AE8](a2, CFSTR("value_in_canonical_unit"), v13);
    objc_msgSend(v10, "unitString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x2199C8B18](a2, CFSTR("value_canonical_unit"), v14);

  }
  else
  {
    MEMORY[0x2199C8B0C](a2, CFSTR("value_in_canonical_unit"));
    MEMORY[0x2199C8B0C](a2, CFSTR("value_canonical_unit"));
  }
  objc_msgSend(*(id *)(a1 + 32), "externalIdentifier");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2199C8B18](a2, CFSTR("external_identifier"), v15);

}

+ (BOOL)supportsSyncStore:(id)a3
{
  return objc_msgSend(a3, "syncStoreType") == 1;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  id v2;

  v2 = objc_alloc(MEMORY[0x24BE40C70]);
  return (HDSyncEntityIdentifier *)(id)objc_msgSend(v2, "initWithEntityIdentifier:schemaIdentifier:", *MEMORY[0x24BE01310], *MEMORY[0x24BE01218]);
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BE017F0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithData:", v4);

  return v5;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (id)propertyForSyncProvenance
{
  return CFSTR("sync_provenance");
}

+ (id)propertyForSyncIdentity
{
  return CFSTR("sync_identity");
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  int64_t v12;
  NSObject *v13;

  v10 = a3;
  objc_msgSend(a5, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(a1, "nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:", a4, 0, v10, v11, a6);

  ACHLogSync();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    +[ACHEarnedInstanceEntity nextSyncAnchorWithSession:startSyncAnchor:profile:error:].cold.1();

  return v12;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t var1;
  int64_t var0;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  int v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, void *, uint64_t);
  void *v39;
  id v40;
  id v41;
  id v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t *v46;
  id v47;
  int64_t v48;
  int64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint8_t buf[4];
  id v68;
  __int16 v69;
  int64_t v70;
  __int16 v71;
  int64_t v72;
  uint64_t v73;

  var1 = a4.var1;
  var0 = a4.var0;
  v73 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a5;
  v35 = a6;
  v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = -1;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v16 = objc_msgSend(v13, "maxEncodedBytesPerCodableChangeForSyncEntityClass:", a1);
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  ACHLogSync();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v68 = v13;
    v69 = 2048;
    v70 = var0;
    v71 = 2048;
    v72 = var1;
    _os_log_debug_impl(&dword_21407B000, v17, OS_LOG_TYPE_DEBUG, "Earned Instance Entity generating sync objects for session (%@), Anchor Range Start (%lld), Anchor Range End (%lld)", buf, 0x20u);
  }

  objc_msgSend(v14, "database");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = MEMORY[0x24BDAC760];
  v37 = 3221225472;
  v38 = __102__ACHEarnedInstanceEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v39 = &unk_24D13AB50;
  v47 = a1;
  v19 = v14;
  v40 = v19;
  v20 = v13;
  v48 = var0;
  v49 = var1;
  v41 = v20;
  v43 = &v63;
  v44 = &v51;
  v45 = &v55;
  v50 = v16;
  v21 = v15;
  v42 = v21;
  v46 = &v59;
  v22 = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v18, a7, &v36);

  if (v22)
  {
    ACHLogSync();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v24;
      _os_log_impl(&dword_21407B000, v23, OS_LOG_TYPE_DEFAULT, "Earned Instance sync generated (%{public}@} objects for sync.", buf, 0xCu);

    }
    if (v52[3] > 999 || v56[3] >= v16)
    {
      v25 = v60[3];
      v64[3] = v25;
    }
    else
    {
      v25 = v64[3];
    }
    v33 = objc_msgSend(v35, "sendCodableChange:resultAnchor:sequence:done:error:", v21, v25, 0, 1, a7, v35, v36, v37, v38, v39, v40, v41);
  }
  else
  {
    ACHLogSync();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      +[ACHEarnedInstanceEntity generateSyncObjectsForSession:syncAnchorRange:profile:messageHandler:error:].cold.1((uint64_t)a7, v26, v27, v28, v29, v30, v31, v32);

    v33 = 0;
  }

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);

  return v33;
}

uint64_t __102__ACHEarnedInstanceEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 88), "entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:", *(_QWORD *)(a1 + 32), v5, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 88);
  objc_msgSend(v6, "orderedProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24;
  v10 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __102__ACHEarnedInstanceEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v21[3] = &unk_24D13AB28;
  v26 = *(_QWORD *)(a1 + 64);
  v22 = v6;
  v23 = *(id *)(a1 + 32);
  v24 = v5;
  v12 = *(_QWORD *)(a1 + 112);
  v27 = *(_QWORD *)(a1 + 72);
  v29 = v12;
  v13 = *(id *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 80);
  v25 = v13;
  v28 = v14;
  v16 = *(_QWORD *)(a1 + 96);
  v15 = *(_QWORD *)(a1 + 104);
  v17 = v5;
  v18 = v6;
  v19 = objc_msgSend(v7, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v8, 0, v10, v16, v15, 0, v9, v11, a3, v21);

  return v19;
}

BOOL __102__ACHEarnedInstanceEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7, uint64_t a8)
{
  id v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v33;

  v13 = a2;
  v14 = v13;
  if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) < 1000)
  {
    objc_msgSend(*(id *)(a1 + 32), "codableRepresentationForPersistentID:row:error:", objc_msgSend(v13, "persistentID"), a4, a8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = HDSQLiteColumnWithNameAsInt64();
    objc_msgSend(*(id *)(a1 + 40), "syncIdentityManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identityForEntityID:transaction:error:", v17, *(_QWORD *)(a1 + 48), a8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v33 = a5;
      v20 = objc_alloc_init(MEMORY[0x24BE01808]);
      objc_msgSend(v19, "identity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "hardwareIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "hk_dataForUUIDBytes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setHardwareIdentifier:", v23);

      objc_msgSend(v19, "identity");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "databaseIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "hk_dataForUUIDBytes");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setDatabaseIdentifier:", v26);

      objc_msgSend(v19, "identity");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "instanceDiscriminator");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setInstanceDiscriminator:", v28);

      objc_msgSend(v16, "setSyncIdentity:", v20);
      v15 = v16 != 0;
      if (v16)
      {
        v29 = objc_msgSend(v16, "encodedByteCount");
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) += v29;
        ACHLogSync();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          __102__ACHEarnedInstanceEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2_cold_1(a1 + 72, v29, v30);

        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) >= *(_QWORD *)(a1 + 88))
        {
          *a7 = 1;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v16);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v33;
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        }
      }
      else
      {
        ACHLogSync();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          __102__ACHEarnedInstanceEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2_cold_2();

      }
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 1;
    *a7 = 1;
  }

  return v15;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  id WeakRetained;
  NSObject *v26;
  _BOOL4 v27;
  id v28;
  char v29;
  NSObject *v30;
  void *v31;
  id v32;
  NSObject *v33;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  ACHLogSync();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v42 = v13;
    _os_log_impl(&dword_21407B000, v12, OS_LOG_TYPE_DEFAULT, "Earned Instance Entity received sync objects, count: %{public}@", buf, 0xCu);

  }
  if (objc_msgSend(v9, "count"))
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v15 = v9;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v37;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v37 != v18)
            objc_enumerationMutation(v15);
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE01830]), "initWithCodable:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v19));
          if (v20)
            -[NSObject addObject:](v14, "addObject:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v17);
    }

    v21 = -[NSObject count](v14, "count");
    ACHLogSync();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v21)
    {
      if (v23)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSObject count](v14, "count"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v42 = v24;
        _os_log_impl(&dword_21407B000, v22, OS_LOG_TYPE_DEFAULT, "Decoded %{public}@ earned instances from sync.", buf, 0xCu);

      }
      os_unfair_lock_lock((os_unfair_lock_t)&syncObserverLock);
      WeakRetained = objc_loadWeakRetained(&_syncObserver);

      ACHLogSync();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      if (WeakRetained)
      {
        if (v27)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21407B000, v26, OS_LOG_TYPE_DEFAULT, "Earned Instance Entity received sync objects and sync observer is set, passing to sync observer", buf, 2u);
        }

        v28 = objc_loadWeakRetained(&_syncObserver);
        v29 = objc_msgSend(v28, "earnedInstanceEntityDidReceiveSyncedEarnedInstances:provenance:", v14, objc_msgSend(v10, "syncProvenance"));

        if ((v29 & 1) != 0)
          goto LABEL_35;
        ACHLogSync();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          +[ACHEarnedInstanceEntity receiveSyncObjects:version:syncStore:profile:error:].cold.2(v30);
      }
      else
      {
        if (v27)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21407B000, v26, OS_LOG_TYPE_DEFAULT, "Earned Instance Entity received sync objects, but no sync observer is registered yet. Writing directly to database.", buf, 2u);
        }

        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v14);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 0;
        v32 = (id)objc_msgSend((id)objc_opt_class(), "insertEarnedInstances:provenance:useLegacySyncIdentity:profile:databaseContext:error:", v31, objc_msgSend(v10, "syncProvenance"), 1, v11, 0, &v35);
        v30 = v35;
        if (v30)
        {
          ACHLogSync();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            +[ACHEarnedInstanceEntity receiveSyncObjects:version:syncStore:profile:error:].cold.1();

        }
      }

LABEL_35:
      os_unfair_lock_unlock((os_unfair_lock_t)&syncObserverLock);
      goto LABEL_36;
    }
    if (v23)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21407B000, v22, OS_LOG_TYPE_DEFAULT, "Received zero decodable earned instances from sync, nothing to do.", buf, 2u);
    }

  }
  else
  {
    ACHLogSync();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21407B000, v14, OS_LOG_TYPE_DEFAULT, "Received zero earned instance sync objects, nothing to do.", buf, 2u);
    }
  }
LABEL_36:

  return 0;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  NSObject *v3;
  unint64_t v4;
  NSObject *v5;
  uint8_t v7[16];
  uint8_t buf[16];

  if (a3 > 7)
  {
    v4 = 3;
  }
  else
  {
    ACHLogSync();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21407B000, v3, OS_LOG_TYPE_DEFAULT, "Earned Instnace got sync protocol version less than supported, returing direction: None", buf, 2u);
    }

    v4 = 0;
  }
  ACHLogSync();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "Earned Instance got supported sync protocol version, returing direction: Both", v7, 2u);
  }

  return v4;
}

+ (id)codableEarnedInstanceForEarnedInstanceInDatabase:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  ACHEarnedInstancePredicateForKey(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __90__ACHEarnedInstanceEntity_codableEarnedInstanceForEarnedInstanceInDatabase_profile_error___block_invoke;
  v16[3] = &unk_24D13ABA0;
  v20 = a1;
  v12 = v9;
  v17 = v12;
  v13 = v10;
  v18 = v13;
  v19 = &v21;
  objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v11, a5, v16);

  v14 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v14;
}

uint64_t __90__ACHEarnedInstanceEntity_codableEarnedInstanceForEarnedInstanceInDatabase_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  objc_msgSend(*(id *)(a1 + 56), "entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:", *(_QWORD *)(a1 + 32), a2, 1, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 56);
  objc_msgSend(v5, "orderedProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __90__ACHEarnedInstanceEntity_codableEarnedInstanceForEarnedInstanceInDatabase_profile_error___block_invoke_2;
  v14[3] = &unk_24D13AB78;
  v10 = *(_QWORD *)(a1 + 48);
  v15 = v5;
  v16 = v10;
  v11 = v5;
  v12 = objc_msgSend(v6, "enumerateProperties:withPredicate:healthDatabase:error:enumerationHandler:", v7, v8, v9, a3, v14);

  return v12;
}

BOOL __90__ACHEarnedInstanceEntity_codableEarnedInstanceForEarnedInstanceInDatabase_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;

  v7 = *(void **)(a1 + 32);
  v12 = 0;
  objc_msgSend(v7, "codableRepresentationForPersistentID:row:error:", a2, a4, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v8);
  }
  else
  {
    ACHLogDatabase();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __90__ACHEarnedInstanceEntity_codableEarnedInstanceForEarnedInstanceInDatabase_profile_error___block_invoke_2_cold_1();

    if (*a5)
      *a5 = objc_retainAutorelease(v9);
  }

  return v8 != 0;
}

void __99__ACHEarnedInstanceEntity__earnedInstancesWithPredicate_limit_ascendingByEarnedDate_profile_error___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_21407B000, v0, v1, "Error fetching sync identity for earned instance: %{public}@, %{public}@");
  OUTLINED_FUNCTION_1();
}

void __99__ACHEarnedInstanceEntity__earnedInstancesWithPredicate_limit_ascendingByEarnedDate_profile_error___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error instantiating earned instance during database retrieval: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_insertEarnedInstances:provenance:useLegacySyncIdentity:profile:databaseContext:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_21407B000, v0, v1, "Error inserting earned instances %{public}@: %{public}@");
  OUTLINED_FUNCTION_1();
}

+ (void)nextSyncAnchorWithSession:startSyncAnchor:profile:error:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_21407B000, v0, OS_LOG_TYPE_DEBUG, "Earned Instance Entity returning next sync anchor: %lld", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

+ (void)generateSyncObjectsForSession:(uint64_t)a3 syncAnchorRange:(uint64_t)a4 profile:(uint64_t)a5 messageHandler:(uint64_t)a6 error:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21407B000, a2, a3, "Earned Instance sync object generation was not successful: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __102__ACHEarnedInstanceEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 24);
  v4 = 134218240;
  v5 = a2;
  v6 = 2048;
  v7 = v3;
  _os_log_debug_impl(&dword_21407B000, log, OS_LOG_TYPE_DEBUG, "codeable encodedByteCount (%lld), accumulated bytes (%lld)", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __102__ACHEarnedInstanceEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_21407B000, v0, v1, "Error creating codable representation of Earned Instance (%@): %@");
  OUTLINED_FUNCTION_1();
}

+ (void)receiveSyncObjects:version:syncStore:profile:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error directly applying earned instance sync objects to database (doesn't fail sync though): %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)receiveSyncObjects:(os_log_t)log version:syncStore:profile:error:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21407B000, log, OS_LOG_TYPE_ERROR, "Earned instance entity sync received failed (doesn't fail sync though)", v1, 2u);
}

void __90__ACHEarnedInstanceEntity_codableEarnedInstanceForEarnedInstanceInDatabase_profile_error___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error instantiating codable during database retrieval: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
