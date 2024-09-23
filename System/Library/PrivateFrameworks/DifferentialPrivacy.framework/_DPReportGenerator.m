@implementation _DPReportGenerator

+ (id)filterNonConformingRecordsFrom:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", &__block_literal_global_14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v5, "removeObjectsAtIndexes:", v4);
  return v5;
}

+ (unint64_t)queryRecordCountForKey:(id)a3 withPredicate:(id)a4 storage:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  dispatch_semaphore_t v15;
  NSObject *v16;
  unint64_t v17;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t *v21;
  SEL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    +[_DPKeyNames keyPropertiesForKey:](_DPKeyNames, "keyPropertiesForKey:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DPRecordQueryPredicates entityForKey:](_DPRecordQueryPredicates, "entityForKey:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v11)
      v14 = v12 == 0;
    else
      v14 = 1;
    if (v14)
    {
      v17 = 0;
    }
    else
    {
      v15 = dispatch_semaphore_create(0);
      v23 = 0;
      v24 = &v23;
      v25 = 0x2020000000;
      v26 = 0;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __67___DPReportGenerator_queryRecordCountForKey_withPredicate_storage___block_invoke;
      v19[3] = &unk_1E95D9E18;
      v21 = &v23;
      v22 = a2;
      v16 = v15;
      v20 = v16;
      objc_msgSend(v10, "fetchRecordCountForEntity:predicate:completion:", v13, v9, v19);
      dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
      v17 = v24[3];

      _Block_object_dispose(&v23, 8);
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)queryRecordsForKey:(id)a3 storage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  dispatch_semaphore_t v20;
  NSObject *v21;
  _QWORD v23[4];
  NSObject *v24;
  uint64_t *v25;
  SEL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)MEMORY[0x1D8256B78]();
    +[_DPKeyNames keyPropertiesForKey:](_DPKeyNames, "keyPropertiesForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "budget");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      +[_DPPrivacyBudgetProperties budgetPropertiesForKey:](_DPPrivacyBudgetProperties, "budgetPropertiesForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "intervalBudgetValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "unsignedIntegerValue");

      if (v15 >= 0x28)
        v16 = 40;
      else
        v16 = v15;

    }
    else
    {
      v16 = 40;
    }
    +[_DPRecordQueryPredicates entityForKey:](_DPRecordQueryPredicates, "entityForKey:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (objc_msgSend(v10, "keyPatternsAllowed"))
        +[_DPRecordQueryPredicates predicateForRecordsNotSubmittedForKeyBeginsWith:](_DPRecordQueryPredicates, "predicateForRecordsNotSubmittedForKeyBeginsWith:", v6);
      else
        +[_DPRecordQueryPredicates predicateForRecordsNotSubmittedForKey:](_DPRecordQueryPredicates, "predicateForRecordsNotSubmittedForKey:", v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      v28 = &v27;
      v29 = 0x3032000000;
      v30 = __Block_byref_object_copy__8;
      v31 = __Block_byref_object_dispose__8;
      v32 = 0;
      v20 = dispatch_semaphore_create(0);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __49___DPReportGenerator_queryRecordsForKey_storage___block_invoke;
      v23[3] = &unk_1E95D99D0;
      v25 = &v27;
      v26 = a2;
      v21 = v20;
      v24 = v21;
      objc_msgSend(v7, "fetchRecordsFor:predicate:fetchLimit:fetchOffset:randomizeOrder:withCompletion:", v18, v19, v16, 0, 1, v23);
      dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
      v17 = (id)v28[5];

      _Block_object_dispose(&v27, 8);
    }
    else
    {
      v17 = (id)MEMORY[0x1E0C9AA60];
    }

    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v17 = (id)MEMORY[0x1E0C9AA60];
  }

  return v17;
}

+ (id)queryKeysForPattern:(id)a3 storage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_semaphore_t v11;
  NSObject *v12;
  id v13;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  SEL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)MEMORY[0x1D8256B78]();
    +[_DPRecordQueryPredicates entityForKey:](_DPRecordQueryPredicates, "entityForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      +[_DPRecordQueryPredicates predicateForRecordsNotSubmittedForKeyBeginsWith:](_DPRecordQueryPredicates, "predicateForRecordsNotSubmittedForKeyBeginsWith:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      v20 = &v19;
      v21 = 0x3032000000;
      v22 = __Block_byref_object_copy__8;
      v23 = __Block_byref_object_dispose__8;
      v24 = 0;
      v11 = dispatch_semaphore_create(0);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __50___DPReportGenerator_queryKeysForPattern_storage___block_invoke;
      v15[3] = &unk_1E95D99D0;
      v17 = &v19;
      v18 = a2;
      v12 = v11;
      v16 = v12;
      objc_msgSend(v7, "fetchKeynamesFor:predicate:fetchLimit:fetchOffset:withCompletion:", v9, v10, 100, 0, v15);
      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
      v13 = (id)v20[5];

      _Block_object_dispose(&v19, 8);
    }
    else
    {
      v13 = (id)MEMORY[0x1E0C9AA60];
    }

    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v13 = (id)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

- (_DPReportGenerator)init
{
  void *v3;
  _DPReportGenerator *v4;

  +[_DPCoreAnalyticsCollector sharedInstance](_DPCoreAnalyticsCollector, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_DPReportGenerator initWithMetricsCollector:](self, "initWithMetricsCollector:", v3);

  return v4;
}

- (_DPReportGenerator)initWithMetricsCollector:(id)a3
{
  id v5;
  _DPReportGenerator *v6;
  _DPReportGenerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DPReportGenerator;
  v6 = -[_DPReportGenerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_metricsCollector, a3);

  return v7;
}

- (BOOL)markSubmitted:(id)a3 storage:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D8256B78]();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "setSubmitted:", 1, (_QWORD)v14);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

    objc_msgSend(v6, "updateRecords:withCompletion:", v8, 0);
    objc_autoreleasePoolPop(v7);
  }

  return v6 != 0;
}

- (id)generateReportUsing:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  id obj;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *context;
  uint64_t v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  +[_DPLog daemon](_DPLog, "daemon");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_DPDediscoReporter reportDediscoRecords:].cold.4(a2, v5);

  if (!+[_DPDeviceInfo isDataCollectionEnabled](_DPDeviceInfo, "isDataCollectionEnabled"))
  {
    +[_DPLog daemon](_DPLog, "daemon");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[_DPReportGenerator generateReportUsing:].cold.2(a2);
    goto LABEL_9;
  }
  if (+[_DPDeviceInfo isDisabledByTaskingForCrashCopier](_DPDeviceInfo, "isDisabledByTaskingForCrashCopier"))
  {
    +[_DPLog daemon](_DPLog, "daemon");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[_DPReportGenerator generateReportUsing:].cold.1(a2);
LABEL_9:

    v7 = 0;
    goto LABEL_31;
  }
  v27 = (void *)MEMORY[0x1D8256B78]();
  +[_DPKeyNames keyNamesGroupedByPropertyName](_DPKeyNames, "keyNamesGroupedByPropertyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v30 = v8;
  objc_msgSend(v8, "allKeys");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "randomizeKeys:andSortByPriority:", v26, 1);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v31)
  {
    v29 = *(_QWORD *)v41;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v41 != v29)
          objc_enumerationMutation(obj);
        v33 = v9;
        v10 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v9);
        context = (void *)MEMORY[0x1D8256B78]();
        objc_msgSend(v30, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "mutableCopy");

        v13 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v14 = v12;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v37 != v17)
                objc_enumerationMutation(v14);
              v19 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
              +[_DPKeyNames keyPropertiesForKey:](_DPKeyNames, "keyPropertiesForKey:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v20, "keyPatternsAllowed"))
              {
                objc_msgSend(v13, "addObject:", v19);
                objc_msgSend((id)objc_opt_class(), "queryKeysForPattern:storage:", v19, v35);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v21, "count"))
                {
                  objc_msgSend((id)objc_opt_class(), "randomizeKeys:andSortByPriority:", v21, 0);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "addObjectsFromArray:", v22);

                }
              }

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          }
          while (v16);
        }

        objc_msgSend(v14, "removeObjectsInArray:", v13);
        v23 = (void *)objc_msgSend(v14, "copy");
        if (objc_msgSend(v23, "count"))
        {
          objc_msgSend((id)objc_opt_class(), "randomizeKeys:andSortByPriority:", v23, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addObjectsFromArray:", v24);

        }
        objc_autoreleasePoolPop(context);
        v9 = v33 + 1;
      }
      while (v33 + 1 != v31);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v31);
  }

  -[_DPReportGenerator generateReportForKeys:storage:](self, "generateReportForKeys:storage:", v34, v35);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v27);
LABEL_31:

  return v7;
}

+ (id)randomizeKeys:(id)a3 andSortByPriority:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  uint32_t v7;
  void *v8;
  void *i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = a4;
  v5 = a3;
  v6 = (void *)MEMORY[0x1D8256B78]();
  v7 = objc_msgSend(v5, "count");
  v8 = (void *)objc_msgSend(v5, "mutableCopy");
  for (i = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy"); objc_msgSend(v8, "count"); --v7)
  {
    v10 = arc4random_uniform(v7);
    objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectAtIndex:", v10);
    objc_msgSend(i, "addObject:", v11);

  }
  if (v4)
  {
    objc_msgSend(i, "sortedArrayWithOptions:usingComparator:", 16, &__block_literal_global_12_0);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = objc_msgSend(i, "copy");
  }
  v13 = (void *)v12;

  objc_autoreleasePoolPop(v6);
  return v13;
}

- (void)reportMetricsForKey:(id)a3 toBeSubmitted:(id)a4 currentDate:(id)a5 storage:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _DPReportGenerator *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  _QWORD v43[4];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[4];

  v46[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (+[_DPDeviceInfo isInternalBuild](_DPDeviceInfo, "isInternalBuild"))
  {
    +[_DPKeyNames keyPropertiesForKey:](_DPKeyNames, "keyPropertiesForKey:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v32 = self;
      v41 = v14;
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v12, -604800.0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v12, -86400.0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DPRecordQueryPredicates predicateForRecordsInDateRangeStart:end:](_DPRecordQueryPredicates, "predicateForRecordsInDateRangeStart:end:", v40, v12);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DPRecordQueryPredicates predicateForRecordsInDateRangeStart:end:](_DPRecordQueryPredicates, "predicateForRecordsInDateRangeStart:end:", v39, v12);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DPRecordQueryPredicates predicateForRecordsMatchingKey:](_DPRecordQueryPredicates, "predicateForRecordsMatchingKey:", v10);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB3528];
      v46[0] = v15;
      v46[1] = v38;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "andPredicateWithSubpredicates:", v17);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x1E0CB3528];
      v45[0] = v15;
      v45[1] = v37;
      v35 = (void *)v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "andPredicateWithSubpredicates:", v19);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = objc_msgSend((id)objc_opt_class(), "queryRecordCountForKey:withPredicate:storage:", v10, v36, v13);
      v20 = objc_msgSend((id)objc_opt_class(), "queryRecordCountForKey:withPredicate:storage:", v10, v34, v13);
      v21 = (void *)MEMORY[0x1E0CB3528];
      v44[0] = v15;
      +[_DPRecordQueryPredicates predicateForRecordsNotSubmitted](_DPRecordQueryPredicates, "predicateForRecordsNotSubmitted");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v44[1] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "andPredicateWithSubpredicates:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = objc_msgSend((id)objc_opt_class(), "queryRecordCountForKey:withPredicate:storage:", v10, v24, v13);
      v26 = (double)(unint64_t)objc_msgSend(v11, "count") / (double)v25;
      v43[0] = v10;
      v42[0] = CFSTR("useCase");
      v42[1] = CFSTR("countLastWeek");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v43[1] = v27;
      v42[2] = CFSTR("countLastDay");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v33);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v43[2] = v28;
      v42[3] = CFSTR("proportionSubmitted");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v43[3] = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      -[_DPReportGenerator metricsCollector](v32, "metricsCollector");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "reportMetricsForEvent:withMetrics:", CFSTR("com.apple.DifferentialPrivacy.usage"), v30);

      v14 = v41;
    }

  }
}

- (id)generateReportForKeys:(id)a3 storage:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _UNKNOWN **v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _DPJSONSegment *v30;
  void *v31;
  void *v32;
  _DPJSONSegment *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *context;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  id v62;
  id v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    v38 = &stru_1E95DA470;
    goto LABEL_51;
  }
  context = (void *)MEMORY[0x1D8256B78]();
  v7 = (void *)MEMORY[0x1E0C9AA60];
  v58 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v60 = (void *)objc_msgSend(v7, "mutableCopy");
  v57 = (void *)objc_msgSend(v7, "mutableCopy");
  v67 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v56 = v5;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
  if (!v9)
    goto LABEL_33;
  v10 = v9;
  v61 = 40;
  v62 = v6;
  v11 = &off_1E95D8000;
  v12 = *(_QWORD *)v73;
  v64 = v8;
  v65 = *(_QWORD *)v73;
  while (2)
  {
    v13 = 0;
    v66 = v10;
    do
    {
      if (*(_QWORD *)v73 != v12)
        objc_enumerationMutation(v8);
      v14 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * v13);
      v15 = (void *)MEMORY[0x1D8256B78]();
      objc_msgSend(v11[100], "keyPropertiesForKey:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16 && objc_msgSend(v16, "transport") != 4)
      {
        objc_msgSend(v17, "budget");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "initializeBudgetRecordFrom:", v6);

        objc_msgSend(v17, "budget");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = +[_DPPrivacyBudget balanceForBudgetWithName:](_DPPrivacyBudget, "balanceForBudgetWithName:", v20);
        objc_msgSend(v67, "objectForKeyedSubscript:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "unsignedIntegerValue");

        v24 = v21 - v23;
        if (v24 < 1)
        {
LABEL_27:
          v12 = v65;

          v10 = v66;
          v11 = &off_1E95D8000;
          goto LABEL_28;
        }
        v25 = objc_msgSend(v17, "transport");
        v26 = (void *)MEMORY[0x1D8256B78]();
        objc_msgSend((id)objc_opt_class(), "queryRecordsForKey:storage:", v14, v6);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "filterNonConformingRecordsFrom:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "count"))
        {

          objc_autoreleasePoolPop(v26);
          if (objc_msgSend(v28, "count") <= (unint64_t)v24)
          {
            v27 = v28;
          }
          else
          {
            objc_msgSend(v28, "subarrayWithRange:", 0, v24);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v8 = v64;
          if (!objc_msgSend(v27, "count"))
            goto LABEL_26;
          v29 = objc_msgSend(v27, "count");
          if (v61 - v29 < 0)
          {

            objc_autoreleasePoolPop(v15);
            v6 = v62;
            goto LABEL_33;
          }
          v61 -= v29;
          v30 = [_DPJSONSegment alloc];
          objc_msgSend(v17, "serverAlgorithmString");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "parameterDictionary");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = -[_DPJSONSegment initWithKey:serverAlgorithmString:parameterDictionary:records:](v30, "initWithKey:serverAlgorithmString:parameterDictionary:records:", v14, v31, v32, v27);

          if (v33)
          {
            objc_msgSend(v60, "addObjectsFromArray:", v27);
            if (v25 == 2)
              objc_msgSend(v57, "addObject:", v33);
            -[_DPReportGenerator reportMetricsForKey:toBeSubmitted:currentDate:storage:](self, "reportMetricsForKey:toBeSubmitted:currentDate:storage:", v14, v27, v59, v62);
            if (+[_DPDeviceInfo isInternalBuild](_DPDeviceInfo, "isInternalBuild") || v25 != 2)
              objc_msgSend(v58, "addObject:", v33);
            objc_msgSend(v67, "objectForKeyedSubscript:", v20);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "unsignedIntegerValue");

            v36 = objc_msgSend(v27, "count");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v36 + v35);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "setObject:forKeyedSubscript:", v37, v20);

          }
        }
        else
        {

          objc_autoreleasePoolPop(v26);
        }
        v8 = v64;
LABEL_26:

        v6 = v62;
        goto LABEL_27;
      }
LABEL_28:

      objc_autoreleasePoolPop(v15);
      ++v13;
    }
    while (v10 != v13);
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
    if (v10)
      continue;
    break;
  }
LABEL_33:

  v39 = v58;
  if (!objc_msgSend(v58, "count"))
  {
    v38 = 0;
    v5 = v56;
    v41 = v57;
    goto LABEL_50;
  }
  v40 = (void *)MEMORY[0x1D8256B78]();
  v41 = v57;
  if (!objc_msgSend(v58, "count")
    || (+[_DPJSONOutputHelper submissionContentForSegments:](_DPJSONOutputHelper, "submissionContentForSegments:", v58), (v42 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_autoreleasePoolPop(v40);
    v38 = 0;
    goto LABEL_48;
  }
  v43 = (void *)v42;
  +[_DPUploadHelper writeFileForDA:](_DPUploadHelper, "writeFileForDA:", v42);
  v38 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v40);
  if (!v38)
  {
LABEL_48:
    v5 = v56;
    goto LABEL_50;
  }
  -[_DPReportGenerator markSubmitted:storage:](self, "markSubmitted:storage:", v60, v6);
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v44 = v67;
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v46; ++i)
      {
        if (*(_QWORD *)v69 != v47)
          objc_enumerationMutation(v44);
        v49 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i);
        objc_msgSend(v44, "objectForKeyedSubscript:", v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        +[_DPPrivacyBudget debit:budgetWithName:](_DPPrivacyBudget, "debit:budgetWithName:", objc_msgSend(v50, "unsignedIntegerValue"), v49);

      }
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
    }
    while (v46);
  }

  v51 = (void *)MEMORY[0x1D8256B78]();
  +[_DPPrivacyBudget updateAllBudgetsIn:](_DPPrivacyBudget, "updateAllBudgetsIn:", v6);
  objc_autoreleasePoolPop(v51);
  v41 = v57;
  v5 = v56;
  if (objc_msgSend(v57, "count"))
  {
    +[_DPJSONOutputHelper submissionContentForSegments:](_DPJSONOutputHelper, "submissionContentForSegments:", v57);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = +[_DPUploadHelper writeFileForParsec:](_DPUploadHelper, "writeFileForParsec:", v52);

  }
  v39 = v58;
LABEL_50:

  objc_autoreleasePoolPop(context);
LABEL_51:

  return v38;
}

- (void)scheduleMaintenanceWithName:(id)a3 database:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  _DPReportGenerator *v15;
  id v16;

  v6 = a4;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __59___DPReportGenerator_scheduleMaintenanceWithName_database___block_invoke;
  v14 = &unk_1E95D9618;
  v15 = self;
  v16 = v6;
  v7 = v6;
  v8 = a3;
  v9 = (void *)MEMORY[0x1D8256D34](&v11);
  +[_DPPeriodicTask taskWithName:period:handler:networkingRequired:](_DPPeriodicTask, "taskWithName:period:handler:networkingRequired:", v8, kSecondsIn18Hours, v9, 1, v11, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DPPeriodicTaskManager registerTask:](_DPPeriodicTaskManager, "registerTask:", v10);
}

- (_DPMetricsCollector)metricsCollector
{
  return self->_metricsCollector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsCollector, 0);
}

- (void)generateReportUsing:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_3(&dword_1D3FAA000, v2, v3, "%@: Disabled by Tasking - skipping report generation", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)generateReportUsing:(const char *)a1 .cold.2(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_3(&dword_1D3FAA000, v2, v3, "%@: Disabled by D&U switch - skipping report generation", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3();
}

@end
