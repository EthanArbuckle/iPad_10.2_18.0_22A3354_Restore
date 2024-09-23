@implementation WDElectrocardiogramFilterDataProvider

- (WDElectrocardiogramFilterDataProvider)initWithProfile:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  WDElectrocardiogramFilterDataProvider *v8;
  WDElectrocardiogramFilterDataProvider *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSArray *filterTypes;
  NSMutableDictionary *v17;
  NSMutableDictionary *counts;
  uint64_t v19;
  OS_dispatch_queue *clientQueue;
  uint64_t v21;
  OS_dispatch_queue *resourceQueue;
  NSObject *v23;
  int64_t activeAlgorithmVersion;
  WDElectrocardiogramFilterDataProvider *v25;
  NSObject *v26;
  id v28;
  objc_super v29;
  uint8_t buf[4];
  WDElectrocardiogramFilterDataProvider *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)WDElectrocardiogramFilterDataProvider;
  v8 = -[WDElectrocardiogramFilterDataProvider init](&v29, sel_init);
  v9 = v8;
  if (!v8)
  {
LABEL_6:
    v25 = v9;
    goto LABEL_10;
  }
  objc_storeWeak((id *)&v8->_profile, v6);
  objc_storeWeak((id *)&v9->_delegate, v7);
  v10 = (void *)MEMORY[0x24BDD3B70];
  objc_msgSend(v6, "healthStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v10, "versionWithHealthStore:error:", v11, &v28);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v28;

  if (v12)
  {
    v14 = objc_msgSend(v12, "integerValue");
    v9->_activeAlgorithmVersion = v14;
    -[WDElectrocardiogramFilterDataProvider _filterTypesForActiveAlgorithmVersion:](v9, "_filterTypesForActiveAlgorithmVersion:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    filterTypes = v9->_filterTypes;
    v9->_filterTypes = (NSArray *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    counts = v9->_counts;
    v9->_counts = v17;

    HKCreateSerialDispatchQueue();
    v19 = objc_claimAutoreleasedReturnValue();
    clientQueue = v9->_clientQueue;
    v9->_clientQueue = (OS_dispatch_queue *)v19;

    HKCreateSerialDispatchQueue();
    v21 = objc_claimAutoreleasedReturnValue();
    resourceQueue = v9->_resourceQueue;
    v9->_resourceQueue = (OS_dispatch_queue *)v21;

    _HKInitializeLogging();
    v23 = *MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
    {
      activeAlgorithmVersion = v9->_activeAlgorithmVersion;
      *(_DWORD *)buf = 138543618;
      v31 = v9;
      v32 = 1024;
      v33 = activeAlgorithmVersion;
      _os_log_impl(&dword_215814000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Initialized with alg ver: %i.", buf, 0x12u);
    }

    goto LABEL_6;
  }
  _HKInitializeLogging();
  v26 = *MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
    -[WDElectrocardiogramFilterDataProvider initWithProfile:delegate:].cold.1((uint64_t)v13, v26);

  v25 = 0;
LABEL_10:

  return v25;
}

- (int64_t)filterTypeCount
{
  void *v2;
  int64_t v3;

  -[WDElectrocardiogramFilterDataProvider filterTypes](self, "filterTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)start
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[WDElectrocardiogramFilterDataProvider stop](self, "stop");
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[WDElectrocardiogramFilterDataProvider setCounts:](self, "setCounts:", v3);

  -[WDElectrocardiogramFilterDataProvider profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3B80], "electrocardiogramType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:forType:", self, v6);

  -[WDElectrocardiogramFilterDataProvider filterTypes](self, "filterTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramFilterDataProvider _countQueriesForFilterTypes:](self, "_countQueriesForFilterTypes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramFilterDataProvider setCountQueries:](self, "setCountQueries:", v8);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[WDElectrocardiogramFilterDataProvider countQueries](self, "countQueries", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13);
        -[WDElectrocardiogramFilterDataProvider profile](self, "profile");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "healthStore");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "executeQuery:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

}

- (void)stop
{
  void *v3;
  void *v4;
  void *v5;

  -[WDElectrocardiogramFilterDataProvider profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3B80], "electrocardiogramType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forType:", self, v5);

  -[WDElectrocardiogramFilterDataProvider _stopQueries](self, "_stopQueries");
}

- (int64_t)countForType:(int64_t)a3
{
  NSObject *v5;
  int64_t v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[WDElectrocardiogramFilterDataProvider resourceQueue](self, "resourceQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__WDElectrocardiogramFilterDataProvider_countForType___block_invoke;
  block[3] = &unk_24D38D118;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v5, block);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __54__WDElectrocardiogramFilterDataProvider_countForType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_rQueue_countForType:", *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)displayStringCountForType:(int64_t)a3
{
  int64_t v3;
  __CFString *v4;
  int64_t v5;
  void *v6;
  void *v7;

  v3 = -[WDElectrocardiogramFilterDataProvider countForType:](self, "countForType:", a3);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = &stru_24D38E7C8;
  }
  else
  {
    v5 = v3;
    HKIntegerFormatter();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromNumber:", v7);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)updateController:(id)a3 didReceiveUpdateForType:(id)a4 samplesAdded:(id)a5 objectsRemoved:(id)a6 recoveringFromError:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  id v16;

  v7 = a7;
  v16 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x24BDD3B80];
  v13 = a4;
  objc_msgSend(v12, "electrocardiogramType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqual:", v14);

  if (v15 && (objc_msgSend(v16, "count") || objc_msgSend(v11, "count") || v7))
    -[WDElectrocardiogramFilterDataProvider start](self, "start");

}

+ (id)cellTitleForType:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  switch(a3)
  {
    case 0:
      WDBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("ALL_DATA_TITLE");
      goto LABEL_8;
    case 1:
      WDBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("SINUS_RHYTHM_TITLE");
      goto LABEL_8;
    case 2:
      WDBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("ATRIAL_FIBRILLATION_TITLE");
      goto LABEL_8;
    case 3:
      WDBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("HIGH_LOW_HEART_RATE_TITLE");
      goto LABEL_8;
    case 4:
      WDBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("INCONCLUSIVE_TITLE");
      goto LABEL_8;
    case 5:
      WDBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("INCONCLUSIVE_POOR_RECORDING_TITLE");
LABEL_8:
      objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      HKConditionallyRedactedHeartRhythmString();
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v3;
  }
  return v3;
}

+ (id)viewControllerTitleForType:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  switch(a3)
  {
    case 0:
      WDBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("ALL_DATA_VIEW_CONTROLLER_TITLE");
      goto LABEL_8;
    case 1:
      WDBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("SINUS_RHYTHM_TITLE");
      goto LABEL_8;
    case 2:
      WDBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("ATRIAL_FIBRILLATION_TITLE");
      goto LABEL_8;
    case 3:
      WDBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("HIGH_LOW_HEART_RATE_TITLE");
      goto LABEL_8;
    case 4:
      WDBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("INCONCLUSIVE_TITLE");
      goto LABEL_8;
    case 5:
      WDBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("INCONCLUSIVE_POOR_RECORDING_TITLE");
LABEL_8:
      objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      HKConditionallyRedactedHeartRhythmString();
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v3;
  }
  return v3;
}

- (id)electrocardiogramPredicateForType:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  switch(a3)
  {
    case 1:
      v3 = (void *)objc_opt_class();
      v4 = 3;
      goto LABEL_9;
    case 2:
      -[WDElectrocardiogramFilterDataProvider _atrialFibrillationClassificationsWithActiveAlgorithmVersion:](self, "_atrialFibrillationClassificationsWithActiveAlgorithmVersion:", -[WDElectrocardiogramFilterDataProvider activeAlgorithmVersion](self, "activeAlgorithmVersion"));
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      -[WDElectrocardiogramFilterDataProvider _highLowHeartRateClassificationsWithActiveAlgorithmVersion:](self, "_highLowHeartRateClassificationsWithActiveAlgorithmVersion:", -[WDElectrocardiogramFilterDataProvider activeAlgorithmVersion](self, "activeAlgorithmVersion"));
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4:
      -[WDElectrocardiogramFilterDataProvider _inconclusiveClassificationsWithActiveAlgorithmVersion:](self, "_inconclusiveClassificationsWithActiveAlgorithmVersion:", -[WDElectrocardiogramFilterDataProvider activeAlgorithmVersion](self, "activeAlgorithmVersion"));
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v7 = (void *)v6;
      objc_msgSend((id)objc_opt_class(), "_atrialFibrillationClassificationPredicateWithClassifications:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 5:
      v3 = (void *)objc_opt_class();
      v4 = 1;
LABEL_9:
      objc_msgSend(v3, "_atrialFibrillationClassificationPredicateWithValue:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)_atrialFibrillationClassificationsWithActiveAlgorithmVersion:(int64_t)a3
{
  if (a3 == 1)
    return &unk_24D3A61E8;
  else
    return &unk_24D3A6200;
}

- (id)_highLowHeartRateClassificationsWithActiveAlgorithmVersion:(int64_t)a3
{
  if (a3 == 1)
    return &unk_24D3A6218;
  else
    return &unk_24D3A6230;
}

- (id)_inconclusiveClassificationsWithActiveAlgorithmVersion:(int64_t)a3
{
  if (a3 == 1)
    return &unk_24D3A6248;
  else
    return &unk_24D3A6260;
}

+ (id)_atrialFibrillationClassificationPredicateWithValues:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "hk_map:", &__block_literal_global_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14C0], "orPredicateWithSubpredicates:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __94__WDElectrocardiogramFilterDataProvider__atrialFibrillationClassificationPredicateWithValues___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD3E88], "predicateForElectrocardiogramsWithPrivateClassification:", objc_msgSend(a2, "integerValue"));
}

+ (id)_atrialFibrillationClassificationPredicateWithValue:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD3E88], "predicateForElectrocardiogramsWithPrivateClassification:", a3);
}

+ (id)_atrialFibrillationClassificationPredicateWithClassifications:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  v5 = (void *)objc_opt_class();
  v6 = v5;
  if (v4 == 1)
  {
    objc_msgSend(v3, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "_atrialFibrillationClassificationPredicateWithValue:", objc_msgSend(v7, "integerValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v7;
  }
  else
  {
    objc_msgSend(v5, "_atrialFibrillationClassificationPredicateWithValues:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_filterTypesForActiveAlgorithmVersion:(int64_t)a3
{
  if (a3 == 1)
    return &unk_24D3A6278;
  else
    return &unk_24D3A6290;
}

- (id)_countQueriesForFilterTypes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[WDElectrocardiogramFilterDataProvider _countQueryForType:](self, "_countQueryForType:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "integerValue", (_QWORD)v13));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_countQueryForType:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  int64_t v13;

  objc_msgSend(MEMORY[0x24BDD3B80], "electrocardiogramType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramFilterDataProvider electrocardiogramPredicateForType:](self, "electrocardiogramPredicateForType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BDD3EE0]);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__WDElectrocardiogramFilterDataProvider__countQueryForType___block_invoke;
  v11[3] = &unk_24D38D1A8;
  v12 = v5;
  v13 = a3;
  v11[4] = self;
  v8 = v5;
  v9 = (void *)objc_msgSend(v7, "initWithSampleType:predicate:resultsHandler:", v8, v6, v11);

  return v9;
}

void __60__WDElectrocardiogramFilterDataProvider__countQueryForType___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      __60__WDElectrocardiogramFilterDataProvider__countQueryForType___block_invoke_cold_1(a1, (uint64_t)v9, v10);
  }
  else if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "resourceQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __60__WDElectrocardiogramFilterDataProvider__countQueryForType___block_invoke_244;
    v14[3] = &unk_24D38D180;
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v8;
    v12 = *(id *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 48);
    v16 = v12;
    v17 = v13;
    dispatch_async(v11, v14);

  }
}

uint64_t __60__WDElectrocardiogramFilterDataProvider__countQueryForType___block_invoke_244(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_rQueue_setCount:forType:", objc_msgSend(v3, "integerValue"), *(_QWORD *)(a1 + 56));

  return objc_msgSend(*(id *)(a1 + 32), "_rQueue_notifyDelegateDidUpdateCountForType:", *(_QWORD *)(a1 + 56));
}

- (void)_stopQueries
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[WDElectrocardiogramFilterDataProvider countQueries](self, "countQueries", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[WDElectrocardiogramFilterDataProvider _safelyStopQuery:](self, "_safelyStopQuery:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_safelyStopQuery:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[WDElectrocardiogramFilterDataProvider profile](self, "profile");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "healthStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopQuery:", v4);

  }
}

- (void)_rQueue_notifyDelegateDidUpdateCountForType:(int64_t)a3
{
  NSObject *v5;
  int64_t v6;
  NSObject *v7;
  _QWORD block[7];

  -[WDElectrocardiogramFilterDataProvider resourceQueue](self, "resourceQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = -[WDElectrocardiogramFilterDataProvider _rQueue_countForType:](self, "_rQueue_countForType:", a3);
  -[WDElectrocardiogramFilterDataProvider clientQueue](self, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__WDElectrocardiogramFilterDataProvider__rQueue_notifyDelegateDidUpdateCountForType___block_invoke;
  block[3] = &unk_24D38D1D0;
  block[4] = self;
  block[5] = v6;
  block[6] = a3;
  dispatch_async(v7, block);

}

void __85__WDElectrocardiogramFilterDataProvider__rQueue_notifyDelegateDidUpdateCountForType___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "electrocardiogramFilterDataProvider:didUpdateCount:type:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (int64_t)_rQueue_countForType:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;

  -[WDElectrocardiogramFilterDataProvider resourceQueue](self, "resourceQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[WDElectrocardiogramFilterDataProvider counts](self, "counts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    return 0x7FFFFFFFFFFFFFFFLL;
  -[WDElectrocardiogramFilterDataProvider counts](self, "counts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  return v12;
}

- (void)_rQueue_setCount:(int64_t)a3 forType:(int64_t)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;

  -[WDElectrocardiogramFilterDataProvider resourceQueue](self, "resourceQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramFilterDataProvider counts](self, "counts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);

}

- (WDProfile)profile
{
  return (WDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (WDElectrocardiogramFilterDataProviderDelegate)delegate
{
  return (WDElectrocardiogramFilterDataProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)activeAlgorithmVersion
{
  return self->_activeAlgorithmVersion;
}

- (void)setActiveAlgorithmVersion:(int64_t)a3
{
  self->_activeAlgorithmVersion = a3;
}

- (NSArray)filterTypes
{
  return self->_filterTypes;
}

- (void)setFilterTypes:(id)a3
{
  objc_storeStrong((id *)&self->_filterTypes, a3);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clientQueue, a3);
}

- (OS_dispatch_queue)resourceQueue
{
  return self->_resourceQueue;
}

- (void)setResourceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_resourceQueue, a3);
}

- (NSMutableDictionary)counts
{
  return self->_counts;
}

- (void)setCounts:(id)a3
{
  objc_storeStrong((id *)&self->_counts, a3);
}

- (NSArray)countQueries
{
  return self->_countQueries;
}

- (void)setCountQueries:(id)a3
{
  objc_storeStrong((id *)&self->_countQueries, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countQueries, 0);
  objc_storeStrong((id *)&self->_counts, 0);
  objc_storeStrong((id *)&self->_resourceQueue, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_filterTypes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)initWithProfile:(uint64_t)a1 delegate:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_215814000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch active algorithm version with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __60__WDElectrocardiogramFilterDataProvider__countQueryForType___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = 134349314;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_215814000, log, OS_LOG_TYPE_ERROR, "Failed to fetch count for type: %{public}ld, error: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
