@implementation _DPPrivacyBudget

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_5);
}

- (_DPPrivacyBudget)init
{

  return 0;
}

- (_DPPrivacyBudget)initWithName:(id)a3 budgetProperties:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _DPPrivacyBudget *v10;
  _DPPrivacyBudget *v11;
  _DPPrivacyBudget *v12;
  _DPPrivacyBudgetRecord *budgetRecord;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v15.receiver = self;
    v15.super_class = (Class)_DPPrivacyBudget;
    v11 = -[_DPPrivacyBudget init](&v15, sel_init);
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_name, a3);
      objc_storeStrong((id *)&v12->_budgetProperties, a4);
      budgetRecord = v12->_budgetRecord;
      v12->_budgetRecord = 0;

    }
    self = v12;
    v10 = self;
  }

  return v10;
}

+ (_DPPrivacyBudget)budgetWithName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (id)gAllBudgets;
  objc_sync_enter(v5);
  objc_msgSend((id)gAllBudgets, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[_DPPrivacyBudgetProperties budgetPropertiesForKey:](_DPPrivacyBudgetProperties, "budgetPropertiesForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:budgetProperties:", v4, v7);
    if (v6)
      objc_msgSend((id)gAllBudgets, "setObject:forKeyedSubscript:", v6, v4);

  }
  objc_sync_exit(v5);

  return (_DPPrivacyBudget *)v6;
}

+ (void)removeBudgetWithName:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = (id)gAllBudgets;
  objc_sync_enter(v3);
  if (v4)
    objc_msgSend((id)gAllBudgets, "removeObjectForKey:", v4);
  objc_sync_exit(v3);

}

+ (BOOL)debit:(unint64_t)a3 budgetWithName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = (id)gAllBudgets;
  objc_sync_enter(v6);
  objc_msgSend((id)gAllBudgets, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "budgetRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBalance:", objc_msgSend(v8, "balance") - a3);

  objc_sync_exit(v6);
  return 1;
}

+ (BOOL)debitCohortAggregate:(double)a3 budgetWithName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;

  v5 = a4;
  v6 = (id)gAllBudgets;
  objc_sync_enter(v6);
  objc_msgSend((id)gAllBudgets, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "budgetRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cohortAggregateBalance");
  objc_msgSend(v8, "setCohortAggregateBalance:", v9 - a3);

  objc_sync_exit(v6);
  return 1;
}

+ (BOOL)credit:(unint64_t)a3 budgetWithName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = (id)gAllBudgets;
  objc_sync_enter(v6);
  objc_msgSend((id)gAllBudgets, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "budgetRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBalance:", objc_msgSend(v8, "balance") + a3);

  objc_sync_exit(v6);
  return 1;
}

+ (BOOL)creditCohortAggregate:(double)a3 budgetWithName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;

  v5 = a4;
  v6 = (id)gAllBudgets;
  objc_sync_enter(v6);
  objc_msgSend((id)gAllBudgets, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "budgetRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cohortAggregateBalance");
  objc_msgSend(v8, "setCohortAggregateBalance:", v9 + a3);

  objc_sync_exit(v6);
  return 1;
}

+ (int64_t)balanceForBudgetWithName:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v3 = a3;
  v4 = (id)gAllBudgets;
  objc_sync_enter(v4);
  objc_msgSend((id)gAllBudgets, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "budgetRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "balance");

  objc_sync_exit(v4);
  return v7;
}

+ (double)balanceForCohortAggregateBudgetWithName:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v3 = a3;
  v4 = (id)gAllBudgets;
  objc_sync_enter(v4);
  objc_msgSend((id)gAllBudgets, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "budgetRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cohortAggregateBalance");
  v8 = v7;

  objc_sync_exit(v4);
  return v8;
}

+ (BOOL)isMultiDayIntervalBudgetWithName:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  BOOL v9;

  v3 = a3;
  v4 = (id)gAllBudgets;
  objc_sync_enter(v4);
  objc_msgSend((id)gAllBudgets, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "budgetProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");
  v9 = v8 > kSecondsIn24Hours;

  objc_sync_exit(v4);
  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPPrivacyBudget name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPPrivacyBudget budgetRecord](self, "budgetRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPPrivacyBudget budgetProperties](self, "budgetProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { name=%@ ; budgetRecord=%@ ; budgetProperties=%@ ; }"),
    v5,
    v6,
    v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)resetLastUpdateDateForName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v3 = (id)gAllBudgets;
  objc_sync_enter(v3);
  objc_msgSend((id)gAllBudgets, "objectForKeyedSubscript:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "budgetRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLastUpdate:", 0.0);

  objc_sync_exit(v3);
}

+ (void)updateAllBudgetsIn:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = (id)gAllBudgets;
  objc_sync_enter(v3);
  objc_msgSend((id)objc_opt_class(), "updateAllBudgetsUnsafeIn:", v4);
  objc_sync_exit(v3);

}

+ (void)updateAllBudgetsUnsafeIn:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  double v21;
  _BOOL4 v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  id obj;
  void *v48;
  uint64_t i;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  v50 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  +[_DPPrivacyBudgetProperties budgetMaintenanceSchedule](_DPPrivacyBudgetProperties, "budgetMaintenanceSchedule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (id)gAllBudgets;
  objc_sync_enter(v43);
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v3;
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  if (v46)
  {
    v45 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v46; ++i)
      {
        if (*(_QWORD *)v62 != v45)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        objc_msgSend(obj, "objectForKeyedSubscript:", v4, v43);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "allObjects");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v4;
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v51 = v5;
        v6 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
        if (v6)
        {
          v53 = *(_QWORD *)v58;
          do
          {
            v7 = 0;
            v54 = v6;
            do
            {
              if (*(_QWORD *)v58 != v53)
                objc_enumerationMutation(v51);
              v8 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v7);
              v9 = (void *)MEMORY[0x1D8256B78]();
              objc_msgSend((id)gAllBudgets, "objectForKeyedSubscript:", v8);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = (void *)MEMORY[0x1E0C99D68];
              objc_msgSend(v10, "budgetRecord");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "lastUpdate");
              objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "timeIntervalSinceDate:", v13);
              v16 = v15;

              objc_msgSend(v56, "doubleValue");
              if (v17 <= v16)
              {
                v18 = objc_msgSend(v56, "unsignedIntegerValue");
                v19 = objc_msgSend(v56, "unsignedIntegerValue");
                v20 = (unint64_t)v16 / v18;
                v21 = (double)(v20 * v19);
                v23 = v16 < v21 || v20 > 1;
                if (v23)
                  v20 = 1;
                v55 = v20;
                if (v23)
                  v24 = v16;
                else
                  v24 = v21;
                objc_msgSend(v10, "budgetProperties");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "intervalBudgetValue");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = objc_msgSend(v26, "unsignedIntegerValue");
                objc_msgSend(v10, "budgetProperties");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "intervalChunksValue");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v28, "unsignedIntegerValue");

                objc_msgSend(v10, "budgetProperties");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "intervalCohortAggregateBudgetValue");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "doubleValue");
                v33 = v32;
                objc_msgSend(v10, "budgetProperties");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "intervalChunksValue");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = objc_msgSend(v35, "unsignedIntegerValue");

                objc_msgSend(v10, "budgetRecord");
                v37 = (void *)objc_claimAutoreleasedReturnValue();

                if (v37)
                {
                  objc_msgSend(v10, "budgetRecord");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "lastUpdate");
                  objc_msgSend(v38, "setLastUpdate:", v24 + v39);

                  objc_msgSend(v10, "budgetRecord");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "setBalance:", v52 * v55 * v29);

                  objc_msgSend(v10, "budgetRecord");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "setCohortAggregateBalance:", v33 * (double)v55 * (double)v36);

                  objc_msgSend(v10, "budgetRecord");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "addObject:", v42);

                }
              }

              objc_autoreleasePoolPop(v9);
              ++v7;
            }
            while (v54 != v7);
            v6 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
          }
          while (v6);
        }

      }
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    }
    while (v46);
  }

  objc_msgSend(v44, "updateRecords:withCompletion:", v50, 0);
  objc_sync_exit(v43);

}

+ (void)resetAllBudgetRecordsIn:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *context;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  context = (void *)MEMORY[0x1D8256B78]();
  obj = (id)gAllBudgets;
  objc_sync_enter(obj);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend((id)gAllBudgets, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
        objc_msgSend((id)objc_opt_class(), "fetchBudgetRecordFrom:key:", v3, v8, context);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "count"))
        {
          objc_msgSend(v9, "firstObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)gAllBudgets, "objectForKeyedSubscript:", v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setBudgetRecord:", v10);

        }
        else
        {
          objc_msgSend((id)gAllBudgets, "objectForKeyedSubscript:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setBudgetRecord:", 0);
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  objc_sync_exit(obj);
  objc_autoreleasePoolPop(context);

}

+ (void)createBudgetRecordsIn:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *context;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  context = (void *)MEMORY[0x1D8256B78]();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  +[_DPPrivacyBudgetProperties allBudgetPropertiesKeys](_DPPrivacyBudgetProperties, "allBudgetPropertiesKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        +[_DPPrivacyBudgetProperties budgetPropertiesForKey:](_DPPrivacyBudgetProperties, "budgetPropertiesForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "intervalBudgetValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "integerValue");
        objc_msgSend(v9, "intervalChunksValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "integerValue") * v11;

        objc_msgSend(v9, "intervalCohortAggregateBudgetValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "doubleValue");
        v16 = v15;
        objc_msgSend(v9, "intervalChunksValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v16 * (double)objc_msgSend(v17, "integerValue");

        +[_DPPrivacyBudget createDatabaseRecordIfMissingIn:key:balance:cohortAggregateBalance:](_DPPrivacyBudget, "createDatabaseRecordIfMissingIn:key:balance:cohortAggregateBalance:", v3, v8, v13, v18);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(context);
}

+ (id)fetchBudgetRecordFrom:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  void *v8;
  dispatch_semaphore_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  SEL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__5;
  v22 = __Block_byref_object_dispose__5;
  v23 = 0;
  +[_DPRecordQueryPredicates predicateForKey:](_DPRecordQueryPredicates, "predicateForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = dispatch_semaphore_create(0);
  +[_DPPrivacyBudgetRecord entityName](_DPPrivacyBudgetRecord, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __46___DPPrivacyBudget_fetchBudgetRecordFrom_key___block_invoke;
  v14[3] = &unk_1E95D99A8;
  v16 = &v18;
  v17 = a2;
  v11 = v9;
  v15 = v11;
  objc_msgSend(v6, "fetchRecordsFor:predicate:fetchLimit:fetchOffset:withCompletion:", v10, v8, 1, 0, v14);

  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v12;
}

+ (id)fetchBudgetKeyNamesFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  id v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  SEL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1D8256B78]();
    +[_DPPrivacyBudgetRecord entityName](_DPPrivacyBudgetRecord, "entityName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[_DPRecordQueryPredicates predicateForAllRecords](_DPRecordQueryPredicates, "predicateForAllRecords");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v17 = &v16;
      v18 = 0x3032000000;
      v19 = __Block_byref_object_copy__5;
      v20 = __Block_byref_object_dispose__5;
      v21 = 0;
      v8 = dispatch_semaphore_create(0);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __44___DPPrivacyBudget_fetchBudgetKeyNamesFrom___block_invoke;
      v12[3] = &unk_1E95D99D0;
      v14 = &v16;
      v15 = a2;
      v9 = v8;
      v13 = v9;
      objc_msgSend(v4, "fetchKeynamesFor:predicate:fetchLimit:fetchOffset:withCompletion:", v6, v7, 300, 0, v12);
      dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
      v10 = (id)v17[5];

      _Block_object_dispose(&v16, 8);
    }
    else
    {
      v10 = (id)MEMORY[0x1E0C9AA60];
    }

    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v10 = (id)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

- (BOOL)initializeBudgetRecordFrom:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D8256B78]();
  v6 = (id)gAllBudgets;
  objc_sync_enter(v6);
  -[_DPPrivacyBudget budgetRecord](self, "budgetRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "fetchBudgetRecordFrom:key:", v4, self->_name);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    v8 = v10 != 0;
    if (v10)
    {
      objc_msgSend(v9, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DPPrivacyBudget setBudgetRecord:](self, "setBudgetRecord:", v11);

    }
  }
  objc_sync_exit(v6);

  objc_autoreleasePoolPop(v5);
  return v8;
}

+ (BOOL)createDatabaseRecordIfMissingIn:(id)a3 key:(id)a4 balance:(int64_t)a5 cohortAggregateBalance:(double)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  _DPPrivacyBudgetRecord *v18;
  void *v19;
  _QWORD v21[5];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void *)MEMORY[0x1D8256B78]();
  v13 = (id)gAllBudgets;
  objc_sync_enter(v13);
  objc_msgSend((id)objc_opt_class(), "fetchBudgetRecordFrom:key:", v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceReferenceDate");
    v18 = -[_DPPrivacyBudgetRecord initWithKey:creationDate:lastUpdate:balance:cohortAggregateBalance:objectId:]([_DPPrivacyBudgetRecord alloc], "initWithKey:creationDate:lastUpdate:balance:cohortAggregateBalance:objectId:", v11, a5, 0, v17, v17, a6);
    v22[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __87___DPPrivacyBudget_createDatabaseRecordIfMissingIn_key_balance_cohortAggregateBalance___block_invoke;
    v21[3] = &__block_descriptor_40_e20_v20__0B8__NSError_12l;
    v21[4] = a2;
    objc_msgSend(v10, "updateRecords:withCompletion:", v19, v21);

  }
  objc_sync_exit(v13);

  objc_autoreleasePoolPop(v12);
  return v15 == 0;
}

+ (id)enforceBudgetForRecords:(id)a3 withKey:(id)a4 inDatabase:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (+[_DPEnhancedPrivacyAlgorithm isEnhancedPrivacyAlgorithm:](_DPEnhancedPrivacyAlgorithm, "isEnhancedPrivacyAlgorithm:", v12))
    {
      objc_msgSend(a1, "enforceEnhancedBudgetForRecords:withKey:inDatabase:", v8, v9, v10);
    }
    else
    {
      objc_msgSend(a1, "enforceSimpleBudgetForRecords:withKey:inDatabase:", v8, v9, v10);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
    v12 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v13;
}

+ (void)updateBudgetForRecords:(id)a3 withKey:(id)a4 inDatabase:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "metadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (+[_DPEnhancedPrivacyAlgorithm isEnhancedPrivacyAlgorithm:](_DPEnhancedPrivacyAlgorithm, "isEnhancedPrivacyAlgorithm:", v11))
    {
      objc_msgSend(a1, "updateEnhancedBudgetForRecords:withKey:inDatabase:", v12, v8, v9);
    }
    else
    {
      objc_msgSend(a1, "updateSimpleBudgetForRecords:withKey:inDatabase:", v12, v8, v9);
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA70];
  }

}

+ (id)enforceEnhancedBudgetForRecords:(id)a3 withKey:(id)a4 inDatabase:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  double v41;
  double v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  id obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "metadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (+[_DPEnhancedPrivacyAlgorithm isMetadataValid:](_DPEnhancedPrivacyAlgorithm, "isMetadataValid:", v11)&& +[_DPEnhancedPrivacyAlgorithm verifyEnhancedDPParamsForKey:withMetadata:](_DPEnhancedPrivacyAlgorithm, "verifyEnhancedDPParamsForKey:withMetadata:", v8, v11))
    {
      +[_DPEnhancedPrivacyAlgorithm allowedDataTypesForKey:withMetadata:](_DPEnhancedPrivacyAlgorithm, "allowedDataTypesForKey:withMetadata:", v8, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v49 = v8;
        +[_DPKeyNames keyPropertiesForKey:](_DPKeyNames, "keyPropertiesForKey:", v8);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "namespaceName");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        +[_DPNamespaceParameters initParametersForNamespace:](_DPNamespaceParameters, "initParametersForNamespace:");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "budget");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "initializeBudgetRecordFrom:", v9);

        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v48 = v12;
        v14 = v12;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
        if (v15)
        {
          v16 = v15;
          v17 = 0;
          v18 = *(_QWORD *)v57;
          do
          {
            v19 = 0;
            v20 = v17;
            do
            {
              if (*(_QWORD *)v57 != v18)
                objc_enumerationMutation(v14);
              +[_DPDataTypeParameters initParametersForDataType:](_DPDataTypeParameters, "initParametersForDataType:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v19));
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v17, "budget");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "initializeBudgetRecordFrom:", v9);

              ++v19;
              v20 = v17;
            }
            while (v16 != v19);
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
          }
          while (v16);
        }
        else
        {
          v17 = 0;
        }

        v23 = (void *)MEMORY[0x1D8256B78]();
        +[_DPPrivacyBudget updateAllBudgetsIn:](_DPPrivacyBudget, "updateAllBudgetsIn:", v9);
        objc_autoreleasePoolPop(v23);
        v24 = v50;
        objc_msgSend(v50, "budget");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "name");
        v26 = objc_claimAutoreleasedReturnValue();

        v27 = +[_DPPrivacyBudget balanceForBudgetWithName:](_DPPrivacyBudget, "balanceForBudgetWithName:", v26);
        v45 = (void *)v26;
        +[_DPPrivacyBudget balanceForCohortAggregateBudgetWithName:](_DPPrivacyBudget, "balanceForCohortAggregateBudgetWithName:", v26);
        v29 = v28;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("EnhancedDifferentialPrivacyParameters"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("cohortAggregateDifferentialPrivacyBudget"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "doubleValue");
        v32 = v31;

        v22 = (id)MEMORY[0x1E0C9AA60];
        if (v27 >= 1 && v29 - v32 >= 0.0)
        {
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          obj = v14;
          v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v53;
            while (2)
            {
              v36 = 0;
              v37 = v17;
              do
              {
                if (*(_QWORD *)v53 != v35)
                  objc_enumerationMutation(obj);
                +[_DPDataTypeParameters initParametersForDataType:](_DPDataTypeParameters, "initParametersForDataType:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v36));
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v17, "budget");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "name");
                v39 = (void *)objc_claimAutoreleasedReturnValue();

                v40 = +[_DPPrivacyBudget balanceForBudgetWithName:](_DPPrivacyBudget, "balanceForBudgetWithName:", v39);
                +[_DPPrivacyBudget balanceForCohortAggregateBudgetWithName:](_DPPrivacyBudget, "balanceForCohortAggregateBudgetWithName:", v39);
                v42 = v41;

                if (v40 < 1 || v42 - v32 < 0.0)
                {

                  v22 = (id)MEMORY[0x1E0C9AA60];
                  goto LABEL_30;
                }
                ++v36;
                v37 = v17;
              }
              while (v34 != v36);
              v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16, v42 - v32);
              if (v34)
                continue;
              break;
            }
          }

          v22 = (id)objc_msgSend(v7, "copy");
LABEL_30:
          v24 = v50;
        }

        v12 = v48;
        v8 = v49;
      }
      else
      {
        v22 = (id)MEMORY[0x1E0C9AA60];
      }

    }
    else
    {
      v22 = (id)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    v22 = (id)MEMORY[0x1E0C9AA60];
    v11 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v22;
}

+ (id)enforceSimpleBudgetForRecords:(id)a3 withKey:(id)a4 inDatabase:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[_DPKeyNames keyPropertiesForKey:](_DPKeyNames, "keyPropertiesForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "budget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "initializeBudgetRecordFrom:", v9);

  v12 = (void *)MEMORY[0x1D8256B78]();
  +[_DPPrivacyBudget updateAllBudgetsIn:](_DPPrivacyBudget, "updateAllBudgetsIn:", v9);
  objc_autoreleasePoolPop(v12);
  objc_msgSend(v10, "budget");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = +[_DPPrivacyBudget balanceForBudgetWithName:](_DPPrivacyBudget, "balanceForBudgetWithName:", v14);
  if (v15 < 1)
  {
    v17 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v16 = v15;
    v17 = v7;
    if (objc_msgSend(v17, "count") > v16)
    {
      objc_msgSend(v17, "subarrayWithRange:", 0, v16);
      v18 = objc_claimAutoreleasedReturnValue();

      v17 = (id)v18;
    }
  }

  return v17;
}

+ (void)updateEnhancedBudgetForRecords:(id)a3 withKey:(id)a4 inDatabase:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[_DPKeyNames keyPropertiesForKey:](_DPKeyNames, "keyPropertiesForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[_DPEnhancedPrivacyAlgorithm isMetadataValid:](_DPEnhancedPrivacyAlgorithm, "isMetadataValid:", v12)&& +[_DPEnhancedPrivacyAlgorithm verifyEnhancedDPParamsForKey:withMetadata:](_DPEnhancedPrivacyAlgorithm, "verifyEnhancedDPParamsForKey:withMetadata:", v8, v12))
  {
    v38 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    objc_msgSend(v10, "namespaceName");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DPNamespaceParameters initParametersForNamespace:](_DPNamespaceParameters, "initParametersForNamespace:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "budget");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v15 = objc_claimAutoreleasedReturnValue();

    +[_DPPrivacyBudget debit:budgetWithName:](_DPPrivacyBudget, "debit:budgetWithName:", 1, v15);
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("EnhancedDifferentialPrivacyParameters"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("cohortAggregateDifferentialPrivacyBudget"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v17;

    v40 = (void *)v15;
    +[_DPPrivacyBudget debitCohortAggregate:budgetWithName:](_DPPrivacyBudget, "debitCohortAggregate:budgetWithName:", v15, v18);
    objc_msgSend(v13, "budget");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "budgetRecord");
    v20 = v12;
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "addObject:", v21);
    v42 = v20;
    +[_DPEnhancedPrivacyAlgorithm allowedDataTypesForKey:withMetadata:](_DPEnhancedPrivacyAlgorithm, "allowedDataTypesForKey:withMetadata:", v8, v20);
    v22 = objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v23 = (void *)MEMORY[0x1E0C9AA60];
    if (v22)
      v23 = (void *)v22;
    v46 = 0uLL;
    v47 = 0uLL;
    obj = v23;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v24)
    {
      v25 = v24;
      v34 = v10;
      v35 = v9;
      v36 = v8;
      v37 = v7;
      v26 = 0;
      v27 = *(_QWORD *)v45;
      do
      {
        v28 = 0;
        v29 = v21;
        v30 = v26;
        do
        {
          if (*(_QWORD *)v45 != v27)
            objc_enumerationMutation(obj);
          +[_DPDataTypeParameters initParametersForDataType:](_DPDataTypeParameters, "initParametersForDataType:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v28));
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "budget");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "name");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          +[_DPPrivacyBudget debit:budgetWithName:](_DPPrivacyBudget, "debit:budgetWithName:", 1, v32);
          +[_DPPrivacyBudget debitCohortAggregate:budgetWithName:](_DPPrivacyBudget, "debitCohortAggregate:budgetWithName:", v32, v18);
          objc_msgSend(v26, "budget");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "budgetRecord");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v38, "addObject:", v21);
          ++v28;
          v29 = v21;
          v30 = v26;
        }
        while (v25 != v28);
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v25);

      v8 = v36;
      v7 = v37;
      v10 = v34;
      v9 = v35;
    }

    objc_msgSend(v9, "updateRecords:withCompletion:", v38, 0);
    v12 = v42;
  }

}

+ (void)updateSimpleBudgetForRecords:(id)a3 withKey:(id)a4 inDatabase:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  +[_DPKeyNames keyPropertiesForKey:](_DPKeyNames, "keyPropertiesForKey:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v9, "budget");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[_DPPrivacyBudget debit:budgetWithName:](_DPPrivacyBudget, "debit:budgetWithName:", objc_msgSend(v7, "count"), v11);
    objc_msgSend(v9, "budget");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "budgetRecord");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateRecords:withCompletion:", v14, 0);

  }
}

- (NSString)name
{
  return self->_name;
}

- (_DPPrivacyBudgetProperties)budgetProperties
{
  return self->_budgetProperties;
}

- (_DPPrivacyBudgetRecord)budgetRecord
{
  return (_DPPrivacyBudgetRecord *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBudgetRecord:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_budgetRecord, 0);
  objc_storeStrong((id *)&self->_budgetProperties, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
