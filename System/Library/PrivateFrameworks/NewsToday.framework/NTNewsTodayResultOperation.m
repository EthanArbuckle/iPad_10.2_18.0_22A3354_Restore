@implementation NTNewsTodayResultOperation

+ (void)initialize
{
  uint64_t v2;
  id v3;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("tempID"));

  }
}

- (NTNewsTodayResultOperation)init
{
  NTNewsTodayResultOperation *v2;
  uint64_t v3;
  NSMutableSet *articleIDsToExclude;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTNewsTodayResultOperation;
  v2 = -[NTTodayResultOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    articleIDsToExclude = v2->_articleIDsToExclude;
    v2->_articleIDsToExclude = (NSMutableSet *)v3;

  }
  return v2;
}

- (BOOL)validateOperation
{
  void *v3;
  void *v4;
  BOOL v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;

  -[NTTodayResultOperation contentContext](self, "contentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultOperation validateOperation].cold.7();
  -[NTTodayResultOperation feedPersonalizerFactory](self, "feedPersonalizerFactory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultOperation validateOperation].cold.6();
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  v6 = !v5;
  -[NTTodayResultOperation operationInfo](self, "operationInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultOperation validateOperation].cold.5();
  if (v7)
    v8 = v6;
  else
    v8 = 0;
  objc_msgSend(v7, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultOperation validateOperation].cold.4();
  if (!v10)
    v8 = 0;
  -[NTTodayResultOperation prefetchedContent](self, "prefetchedContent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultOperation validateOperation].cold.3();
  if (v11)
    v12 = v8;
  else
    v12 = 0;
  if (v10)
  {
    objc_msgSend(v11, "todayConfigsByRequestID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[NTNewsTodayResultOperation validateOperation].cold.2();
    if (!v14)
      v12 = 0;

  }
  -[NTTodayResultOperation headlineResultCompletionHandler](self, "headlineResultCompletionHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultOperation validateOperation].cold.1();
  if (v15)
    v16 = v12;
  else
    v16 = 0;

  return v16;
}

- (void)prepareOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];

  -[NTTodayResultOperation operationInfo](self, "operationInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTTodayResultOperation prefetchedContent](self, "prefetchedContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "todayConfigsByRequestID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTNewsTodayResultOperation setTodayConfig:](self, "setTodayConfig:", v8);

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTNewsTodayResultOperation _firstRefreshDateDefaultsKey](self, "_firstRefreshDateDefaultsKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    NTSharedLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_2197E6000, v12, OS_LOG_TYPE_INFO, "no existing date for first refresh. setting to current date", v15, 2u);
    }

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTNewsTodayResultOperation _firstRefreshDateDefaultsKey](self, "_firstRefreshDateDefaultsKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v13, v14);

  }
}

- (void)performOperation
{
  void *v3;
  double v4;
  NTTodayResults *v5;
  void *v6;
  void *v7;
  NTTodayResults *v8;
  double v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  _QWORD *v19;
  double v20;
  _QWORD v21[4];
  NSObject *v22;
  _QWORD *v23;
  _QWORD v24[5];
  id v25;

  -[NTTodayResultOperation operationInfo](self, "operationInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "slotsLimit");
  if (v4 == 0.0)
  {
    v5 = [NTTodayResults alloc];
    v6 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NTTodayResults initWithSourceIdentifier:sections:expirationDate:headlineScale:](v5, "initWithSourceIdentifier:sections:expirationDate:headlineScale:", CFSTR("news"), v6, v7, 1.0);
    -[NTNewsTodayResultOperation setResultTodayResults:](self, "setResultTodayResults:", v8);

    -[FCOperation finishedPerformingOperationWithError:](self, "finishedPerformingOperationWithError:", 0);
  }
  else
  {
    v9 = v4;
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__0;
    v24[4] = __Block_byref_object_dispose__0;
    v25 = 0;
    v10 = dispatch_group_create();
    dispatch_group_enter(v10);
    v11 = objc_alloc(MEMORY[0x24BE6CBD8]);
    FCURLForTodayPersonalizationUpdateStore();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithFileURL:", v12);

    v14 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __46__NTNewsTodayResultOperation_performOperation__block_invoke;
    v21[3] = &unk_24DB5EF30;
    v23 = v24;
    v15 = v10;
    v22 = v15;
    objc_msgSend(v13, "readWithAccessor:", v21);
    -[NTNewsTodayResultOperation qualityOfService](self, "qualityOfService");
    FCDispatchQueueForQualityOfService();
    v16 = objc_claimAutoreleasedReturnValue();
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __46__NTNewsTodayResultOperation_performOperation__block_invoke_2;
    v17[3] = &unk_24DB5EFD0;
    v17[4] = self;
    v19 = v24;
    v18 = v3;
    v20 = v9;
    dispatch_group_notify(v15, v16, v17);

    _Block_object_dispose(v24, 8);
  }

}

void __46__NTNewsTodayResultOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__NTNewsTodayResultOperation_performOperation__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  unsigned int v27;
  unsigned int v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;

  objc_msgSend(*(id *)(a1 + 32), "contentContext");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "appConfigurationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "prefetchedContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "todayConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v3;
  objc_msgSend(v3, "privateData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personalizationTreatment");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "derivedPersonalizationData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x24BE6CB40]);
    v10 = (id)objc_msgSend(v11, "initWithAggregates:scoringType:decayRate:", MEMORY[0x24BDBD1B8], 0, 0.0);
  }
  v12 = v10;
  v40 = v10;

  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CCF0]), "initWithGenerator:", v12);
  objc_msgSend(v26, "processTodayPersonalizationUpdates:withConfigurableValues:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v7);
  v37 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v2, "feldsparID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentTreatment");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "segmentSetIDs");
  v35 = (void *)v7;
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "treatmentIDs");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "onboardingVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = *(void **)(a1 + 32);
  v28 = objc_msgSend(*(id *)(a1 + 40), "allowOnlyWatchEligibleSections");
  v27 = objc_msgSend(*(id *)(a1 + 40), "respectsWidgetVisibleSectionsPerQueueLimit");
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __46__NTNewsTodayResultOperation_performOperation__block_invoke_3;
  v42[3] = &unk_24DB5EFA8;
  v16 = *(void **)(a1 + 40);
  v42[4] = *(_QWORD *)(a1 + 32);
  v43 = v26;
  v44 = v2;
  v45 = v6;
  v46 = v5;
  v17 = v16;
  v57 = *(_QWORD *)(a1 + 56);
  v47 = v17;
  v48 = v39;
  v49 = v4;
  v50 = v13;
  v51 = v30;
  v52 = v14;
  v53 = v33;
  v54 = v15;
  v55 = v37;
  v56 = v35;
  v25 = v35;
  v38 = v37;
  v36 = v15;
  v34 = v33;
  v32 = v14;
  v31 = v30;
  v18 = v13;
  v19 = v4;
  v20 = v39;
  v21 = v5;
  v22 = v6;
  v23 = v2;
  v24 = v26;
  objc_msgSend(v29, "_assembleQueueDescriptorsWithConfig:allowOnlyWatchEligibleSections:respectsWidgetVisibleSectionsLimit:personalizationTreatment:aggregateStore:appConfiguration:todayData:completion:", v19, v28, v27, v25, v24, v21, v22, v42);

}

void __46__NTNewsTodayResultOperation_performOperation__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NTNewsTodayResultsSourceFetchHelper *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NTNewsTodayResultsSourceFetchHelper *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  NTNewsTodayResultsSourceFetchHelper *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;

  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a3);
  }
  else
  {
    v6 = -[NTNewsTodayResultsSourceFetchHelper initWithSectionQueueDescriptors:]([NTNewsTodayResultsSourceFetchHelper alloc], "initWithSectionQueueDescriptors:", v5);
    objc_msgSend(*(id *)(a1 + 32), "feedPersonalizerFactory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "newFeedPersonalizerWithAggregateStore:appConfigurationManager:todayPrivateData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CCB0]), "initWithAppConfiguration:", *(_QWORD *)(a1 + 64));
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CC38]), "initWithFeedPersonalizer:functionProvider:", v8, v9);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __46__NTNewsTodayResultOperation_performOperation__block_invoke_4;
    v15[3] = &unk_24DB5EF80;
    v16 = *(id *)(a1 + 72);
    v32 = *(_QWORD *)(a1 + 152);
    v17 = *(id *)(a1 + 80);
    v18 = v10;
    v11 = *(id *)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 32);
    v19 = v11;
    v20 = v12;
    v21 = v6;
    v22 = *(id *)(a1 + 64);
    v23 = *(id *)(a1 + 88);
    v24 = *(id *)(a1 + 96);
    v25 = *(id *)(a1 + 104);
    v26 = *(id *)(a1 + 112);
    v27 = *(id *)(a1 + 120);
    v28 = *(id *)(a1 + 128);
    v29 = *(id *)(a1 + 136);
    v30 = *(id *)(a1 + 144);
    v31 = *(id *)(a1 + 40);
    v13 = v6;
    v14 = v10;
    objc_msgSend(v14, "prepareForUseWithCompletionHandler:", v15);

  }
}

void __46__NTNewsTodayResultOperation_performOperation__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NTNewsTodayResultsExplicitAllocationAggregator *v5;
  void *v6;
  NTNewsTodayResultsExplicitAllocationAggregator *v7;
  NTNewsTodayResultsContentFillAggregator *v8;
  double v9;
  double v10;
  double v11;
  NTNewsTodayResultsContentFillAggregator *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "sectionSlotCostInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSectionSlotCostInfo:", v3);

  objc_msgSend(v2, "setRespectMinMaxLimit:", objc_msgSend(*(id *)(a1 + 32), "respectsWidgetSlotsLimit"));
  objc_msgSend(v2, "setSlotsLimit:", *(double *)(a1 + 160));
  objc_msgSend(v2, "setAllowSectionTitles:", objc_msgSend(*(id *)(a1 + 32), "allowSectionTitles"));
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [NTNewsTodayResultsExplicitAllocationAggregator alloc];
  objc_msgSend(*(id *)(a1 + 40), "configurationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NTNewsTodayResultsExplicitAllocationAggregator initWithConfigurationManager:feedPersonalizer:filterDate:todayData:](v5, "initWithConfigurationManager:feedPersonalizer:filterDate:todayData:", v6, *(_QWORD *)(a1 + 48), v4, *(_QWORD *)(a1 + 56));

  v8 = [NTNewsTodayResultsContentFillAggregator alloc];
  objc_msgSend(*(id *)(a1 + 32), "minHeadlineScale");
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "maxHeadlineScale");
  v12 = -[NTNewsTodayResultsContentFillAggregator initWithAggregator:minHeadlineScale:maxHeadlineScale:](v8, "initWithAggregator:minHeadlineScale:maxHeadlineScale:", v7, v10, v11);
  v13 = *(void **)(a1 + 64);
  v14 = *(_QWORD *)(a1 + 72);
  v15 = *(_QWORD *)(a1 + 80);
  v16 = *(_QWORD *)(a1 + 48);
  v17 = *(_QWORD *)(a1 + 56);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __46__NTNewsTodayResultOperation_performOperation__block_invoke_5;
  v18[3] = &unk_24DB5EF58;
  v18[4] = v13;
  v19 = *(id *)(a1 + 32);
  v20 = *(id *)(a1 + 80);
  v21 = *(id *)(a1 + 88);
  v22 = *(id *)(a1 + 96);
  v23 = *(id *)(a1 + 104);
  v24 = *(id *)(a1 + 112);
  v25 = *(id *)(a1 + 120);
  v26 = *(id *)(a1 + 40);
  v27 = *(id *)(a1 + 128);
  v28 = *(id *)(a1 + 56);
  v29 = *(id *)(a1 + 136);
  v30 = *(id *)(a1 + 144);
  v31 = *(id *)(a1 + 152);
  objc_msgSend(v13, "_fetchTodayResultsWithFetchHelper:aggregator:budgetInfo:appConfiguration:feedPersonalizer:todayData:completion:", v14, v12, v2, v15, v16, v17, v18);

}

void __46__NTNewsTodayResultOperation_performOperation__block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint8_t buf[4];
  int v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v7 = *(void **)(a1 + 32);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  objc_msgSend(v7, "setResultTodayResults:", v10);
  objc_msgSend(*(id *)(a1 + 32), "setResultAssetHandlesByAssetID:", v9);

  v11 = (void *)objc_opt_new();
  objc_msgSend(v10, "sections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 40), "fetchWidgetConfig"))
  {
    v14 = (void *)objc_opt_new();
    objc_msgSend(v14, "setMinimumArticleExposureDurationToBePreseen:", objc_msgSend(*(id *)(a1 + 48), "widgetMinimumArticleExposureDurationToBePreseenInMilliseconds"));
    objc_msgSend(v14, "setMinimumNumberOfTimesPreseenToBeSeen:", objc_msgSend(*(id *)(a1 + 48), "widgetMinimumNumberOfTimesPreseenToBeSeen"));
    objc_msgSend(*(id *)(a1 + 48), "prerollLoadingTimeout");
    objc_msgSend(v14, "setPrerollLoadingTimeout:");
    objc_msgSend(*(id *)(a1 + 48), "externalAnalyticsConfigurations");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setExternalAnalyticsConfigurations:", v15);

    objc_msgSend(v13, "backgroundColorLight");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColorLight:", v16);

    v48 = v13;
    objc_msgSend(v13, "backgroundColorDark");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColorDark:", v17);

    objc_msgSend(*(id *)(a1 + 56), "audioIndicatorColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAudioIndicatorColor:", v18);

    objc_msgSend(v14, "setContentPrefetchEnabled:", objc_msgSend(*(id *)(a1 + 48), "widgetContentPrefetchEnabled"));
    objc_msgSend(v14, "setWidgetBackgroundInteractionEnabled:", objc_msgSend(*(id *)(a1 + 48), "widgetBackgroundInteractionEnabled"));
    objc_msgSend(*(id *)(a1 + 32), "operationInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "widgetSize");

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_firstRefreshDateDefaultsKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = *(void **)(a1 + 48);
    v49 = v8;
    if (v20 == 1)
      v25 = objc_msgSend(v24, "smallWidgetSystemHoneymoonDuration");
    else
      v25 = objc_msgSend(v24, "widgetSystemHoneymoonDuration");
    v26 = v25;
    objc_msgSend(v23, "dateByAddingTimeInterval:", (double)v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "fc_isEarlierThan:", v27);
    NTSharedLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109890;
      v51 = v29;
      v52 = 2114;
      v53 = v23;
      v54 = 2048;
      v55 = v26;
      v56 = 2114;
      v57 = v27;
      _os_log_impl(&dword_2197E6000, v30, OS_LOG_TYPE_INFO, "in honeymoon: %d, determined from first refresh date of %{public}@, honeymoon duration of %lld, and honeymoon end of %{public}@", buf, 0x26u);
    }

    v31 = *(void **)(a1 + 48);
    if (v29)
    {
      if (v20 == 1)
      {
        objc_msgSend(v14, "setWidgetSystemReloadInterval:", objc_msgSend(v31, "smallWidgetSystemReloadIntervalHoneymoon"));
        v32 = objc_msgSend(*(id *)(a1 + 48), "smallWidgetSystemReloadJitterMaxHoneymoon");
      }
      else
      {
        objc_msgSend(v14, "setWidgetSystemReloadInterval:", objc_msgSend(v31, "widgetSystemReloadIntervalHoneymoon"));
        v32 = objc_msgSend(*(id *)(a1 + 48), "widgetSystemReloadJitterMaxHoneymoon");
      }
    }
    else if (v20 == 1)
    {
      objc_msgSend(v14, "setWidgetSystemReloadInterval:", objc_msgSend(v31, "smallWidgetSystemReloadInterval"));
      v32 = objc_msgSend(*(id *)(a1 + 48), "smallWidgetSystemReloadJitterMax");
    }
    else
    {
      objc_msgSend(v14, "setWidgetSystemReloadInterval:", objc_msgSend(v31, "widgetSystemReloadInterval"));
      v32 = objc_msgSend(*(id *)(a1 + 48), "widgetSystemReloadJitterMax");
    }
    v13 = v48;
    objc_msgSend(v14, "setWidgetSystemReloadJitterMax:", v32);
    objc_msgSend(v11, "setWidgetConfig:", v14);

    v8 = v49;
  }
  v33 = *(void **)(a1 + 64);
  if (v33)
  {
    v34 = v33;
  }
  else
  {
    NewsCoreSensitiveUserDefaults();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = *MEMORY[0x24BE6CA78];
    objc_msgSend(v35, "stringForKey:", *MEMORY[0x24BE6CA78]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v37)
    {
      v34 = v37;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "UUIDString");
      v34 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "setObject:forKey:", v34, v36);
    }

  }
  objc_msgSend(v11, "setTodaySourceIdentifier:", CFSTR("news"));
  objc_msgSend(v11, "setAppConfigTreatmentID:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v11, "setUserSegmentationSegmentSetIDs:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v11, "setUserSegmentationTreatmentIDs:", *(_QWORD *)(a1 + 88));
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLocale:", v40);

  objc_msgSend(v11, "setUserID:", v34);
  objc_msgSend(*(id *)(a1 + 96), "contentStoreFrontID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentStoreFrontID:", v41);

  objc_msgSend(*(id *)(a1 + 96), "contentEnvironment");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentEnvironment:", v42);

  objc_msgSend(MEMORY[0x24BE6CC58], "sharedNetworkReachability");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWifiReachable:", objc_msgSend(v43, "isNetworkReachableViaWiFi"));
  objc_msgSend(v11, "setCellularRadioAccessTechnology:", objc_msgSend(v43, "cellularRadioAccessTechnology"));
  objc_msgSend(v11, "setReachabilityStatus:", objc_msgSend(v43, "reachabilityStatus"));
  objc_msgSend(v11, "setOnboardingVersion:", objc_msgSend(*(id *)(a1 + 104), "integerValue"));
  objc_msgSend(*(id *)(a1 + 112), "bundleSubscription");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIsBundleSubscriber:", (unint64_t)objc_msgSend(v44, "subscriptionState") < 2);

  objc_msgSend(*(id *)(a1 + 112), "bundleSubscription");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "bundlePurchaseID");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBundleIap:", v46);

  objc_msgSend(*(id *)(a1 + 32), "_sectionCTRsWithTodayConfig:personalizationTreatment:aggregateStore:", *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCTRByPersonalizationFeatureID:", v47);

  objc_msgSend(*(id *)(a1 + 32), "setResultFetchInfo:", v11);
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v8);

}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *, void *, void *, id);

  v4 = a3;
  -[NTTodayResultOperation headlineResultCompletionHandler](self, "headlineResultCompletionHandler");
  v8 = (void (**)(id, void *, void *, void *, id))objc_claimAutoreleasedReturnValue();
  -[NTNewsTodayResultOperation resultTodayResults](self, "resultTodayResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTNewsTodayResultOperation resultAssetHandlesByAssetID](self, "resultAssetHandlesByAssetID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTNewsTodayResultOperation resultFetchInfo](self, "resultFetchInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v5, v6, v7, v4);

}

- (unint64_t)maxRetries
{
  return 1;
}

- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;

  v6 = a3;
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE6C9A8]))
    goto LABEL_7;
  v8 = objc_msgSend(v6, "code");

  if (v8 != 21)
  {
    v12 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v6, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE6C9B0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_46);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    v12 = v11 != 0;
    if (v11)
    {
      -[NTNewsTodayResultOperation articleIDsToExclude](self, "articleIDsToExclude");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "unionSet:", v14);

      *a4 = (id)objc_opt_new();
    }

  }
  else
  {
LABEL_7:
    v12 = 0;
  }

LABEL_10:
  return v12;
}

uint64_t __59__NTNewsTodayResultOperation_canRetryWithError_retryAfter___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPrefix:", CFSTR("A"));
}

- (id)_sectionCTRsWithTodayConfig:(id)a3 personalizationTreatment:(id)a4 aggregateStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[4];
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultOperation _sectionCTRsWithTodayConfig:personalizationTreatment:aggregateStore:].cold.3();
    if (v9)
      goto LABEL_6;
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultOperation _sectionCTRsWithTodayConfig:personalizationTreatment:aggregateStore:].cold.2();
LABEL_6:
  if (!v10 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultOperation _sectionCTRsWithTodayConfig:personalizationTreatment:aggregateStore:].cold.1();
  v11 = (void *)objc_opt_new();
  objc_msgSend(v8, "todayQueueConfigs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __98__NTNewsTodayResultOperation__sectionCTRsWithTodayConfig_personalizationTreatment_aggregateStore___block_invoke;
  v25[3] = &unk_24DB5F060;
  v14 = v11;
  v26 = v14;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v25);

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setPersonalizationTreatment:", v9);
  objc_msgSend(v15, "setAggregateStore:", v10);
  objc_msgSend(v15, "setLookupRequests:", v14);
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __98__NTNewsTodayResultOperation__sectionCTRsWithTodayConfig_personalizationTreatment_aggregateStore___block_invoke_3;
  v18[3] = &unk_24DB5F0C8;
  v18[4] = &v19;
  objc_msgSend(v15, "setLookupCompletion:", v18);
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v15);
  objc_msgSend(v15, "start");
  objc_msgSend(v15, "waitUntilFinished");
  v16 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v16;
}

void __98__NTNewsTodayResultOperation__sectionCTRsWithTodayConfig_personalizationTreatment_aggregateStore___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a2, "todaySectionConfigs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __98__NTNewsTodayResultOperation__sectionCTRsWithTodayConfig_personalizationTreatment_aggregateStore___block_invoke_2;
  v4[3] = &unk_24DB5F038;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void __98__NTNewsTodayResultOperation__sectionCTRsWithTodayConfig_personalizationTreatment_aggregateStore___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;

  v3 = a2;
  v8 = (id)objc_opt_new();
  v4 = (void *)MEMORY[0x24BE6CCA8];
  objc_msgSend(v3, "personalizedPresenceFeatureID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureForFreeValuedIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPersonalizationFeature:", v6);

  objc_msgSend(v8, "setClickPrior:", (double)(unint64_t)objc_msgSend(v3, "personalizedPresenceFeatureClickPrior"));
  v7 = objc_msgSend(v3, "personalizedPresenceFeatureImpressionPrior");

  objc_msgSend(v8, "setImpressionPrior:", (double)v7);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

}

void __98__NTNewsTodayResultOperation__sectionCTRsWithTodayConfig_personalizationTreatment_aggregateStore___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "fc_dictionaryByTransformingKeysWithBlock:", &__block_literal_global_64);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __98__NTNewsTodayResultOperation__sectionCTRsWithTodayConfig_personalizationTreatment_aggregateStore___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "personalizationIdentifier");
}

- (void)_assembleQueueDescriptorsWithConfig:(id)a3 allowOnlyWatchEligibleSections:(BOOL)a4 respectsWidgetVisibleSectionsLimit:(BOOL)a5 personalizationTreatment:(id)a6 aggregateStore:(id)a7 appConfiguration:(id)a8 todayData:(id)a9 completion:(id)a10
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  void (**v44)(_QWORD, _QWORD);
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v53;
  void *v54;
  id v56;
  id v57;
  void *v58;
  char v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  void *v65;
  _QWORD v66[4];
  void (**v67)(_QWORD, _QWORD);
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  id v73;
  id v74;
  id v75;
  id v76;
  char v77;
  BOOL v78;
  _QWORD v79[4];
  id v80;
  _QWORD v81[4];
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[4];
  id v88;
  id v89;
  char v90;
  BOOL v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  v61 = a9;
  v17 = a10;
  if (!v13 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultOperation _assembleQueueDescriptorsWithConfig:allowOnlyWatchEligibleSections:respectsWidgetVisibleSectionsLimit:personalizationTreatment:aggregateStore:appConfiguration:todayData:completion:].cold.5();
    if (v14)
      goto LABEL_6;
  }
  else if (v14)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultOperation _assembleQueueDescriptorsWithConfig:allowOnlyWatchEligibleSections:respectsWidgetVisibleSectionsLimit:personalizationTreatment:aggregateStore:appConfiguration:todayData:completion:].cold.4();
LABEL_6:
  if (!v15 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultOperation _assembleQueueDescriptorsWithConfig:allowOnlyWatchEligibleSections:respectsWidgetVisibleSectionsLimit:personalizationTreatment:aggregateStore:appConfiguration:todayData:completion:].cold.3();
    if (v16)
      goto LABEL_11;
  }
  else if (v16)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultOperation _assembleQueueDescriptorsWithConfig:allowOnlyWatchEligibleSections:respectsWidgetVisibleSectionsLimit:personalizationTreatment:aggregateStore:appConfiguration:todayData:completion:].cold.2();
LABEL_11:
  v53 = v16;
  v54 = v17;
  v56 = v15;
  v57 = v14;
  if (!v17 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultOperation _assembleQueueDescriptorsWithConfig:allowOnlyWatchEligibleSections:respectsWidgetVisibleSectionsLimit:personalizationTreatment:aggregateStore:appConfiguration:todayData:completion:].cold.1();
  NewsCoreUserDefaults();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v18, "BOOLForKey:", *MEMORY[0x24BE6CA28]);

  v19 = (void *)MEMORY[0x24BDBCE30];
  v58 = v13;
  objc_msgSend(v13, "todayQueueConfigs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "arrayWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v22 = v21;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v92, v97, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v93;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v93 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * i);
        objc_msgSend(v27, "todaySectionConfigs");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "sortedArrayUsingComparator:", &__block_literal_global_70);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v29, "mutableCopy");

        v31 = (void *)objc_opt_new();
        v87[0] = MEMORY[0x24BDAC760];
        v87[1] = 3221225472;
        v87[2] = __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_2;
        v87[3] = &unk_24DB5F130;
        v90 = v59;
        v91 = a4;
        v88 = v61;
        v89 = v31;
        v32 = v31;
        objc_msgSend(v30, "enumerateObjectsUsingBlock:", v87);
        objc_msgSend(v30, "removeObjectsAtIndexes:", v32);
        objc_msgSend(v27, "setTodaySectionConfigs:", v30);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v92, v97, 16);
    }
    while (v24);
  }

  v65 = (void *)objc_opt_new();
  v63 = (void *)objc_opt_new();
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v33 = v22;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v84;
    v37 = MEMORY[0x24BDAC760];
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v84 != v36)
          objc_enumerationMutation(v33);
        objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * j), "todaySectionConfigs");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v81[0] = v37;
        v81[1] = 3221225472;
        v81[2] = __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_3;
        v81[3] = &unk_24DB5F038;
        v82 = v65;
        objc_msgSend(v39, "enumerateObjectsUsingBlock:", v81);
        v79[0] = v37;
        v79[1] = 3221225472;
        v79[2] = __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_4;
        v79[3] = &unk_24DB5F158;
        v80 = v63;
        objc_msgSend(v39, "fc_enumerateObjectsPairwiseUsingBlock:", v79);

      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
    }
    while (v35);
  }

  v40 = MEMORY[0x24BDAC760];
  v72[0] = MEMORY[0x24BDAC760];
  v72[1] = 3221225472;
  v72[2] = __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_5;
  v72[3] = &unk_24DB5F1A8;
  v41 = v33;
  v73 = v41;
  v42 = v53;
  v74 = v42;
  v62 = v61;
  v75 = v62;
  v77 = v59;
  v78 = a5;
  v43 = v54;
  v76 = v43;
  v44 = (void (**)(_QWORD, _QWORD))MEMORY[0x219A33CDC](v72);
  v45 = v65;
  v46 = v63;
  if (objc_msgSend(v65, "count") || objc_msgSend(v63, "count"))
  {
    v60 = v42;
    v47 = (void *)objc_opt_new();
    v48 = v57;
    objc_msgSend(v47, "setPersonalizationTreatment:", v57);
    v49 = v56;
    objc_msgSend(v47, "setAggregateStore:", v56);
    objc_msgSend(v47, "setRelativeRequests:", v63);
    objc_msgSend(v47, "setAbsoluteRequests:", v65);
    v70[0] = v40;
    v70[1] = 3221225472;
    v70[2] = __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_7;
    v70[3] = &unk_24DB5F1F8;
    v50 = v41;
    v71 = v50;
    objc_msgSend(v47, "setRelativePresenceHandler:", v70);
    v68[0] = v40;
    v68[1] = 3221225472;
    v68[2] = __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_81;
    v68[3] = &unk_24DB5F1F8;
    v46 = v63;
    v51 = v50;
    v45 = v65;
    v69 = v51;
    objc_msgSend(v47, "setAbsolutePresenceHandler:", v68);
    v66[0] = v40;
    v66[1] = 3221225472;
    v66[2] = __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_3_83;
    v66[3] = &unk_24DB5F248;
    v67 = v44;
    objc_msgSend(v47, "setPersonalizationCompletion:", v66);
    -[FCOperation associateChildOperation:](self, "associateChildOperation:", v47);
    objc_msgSend(v47, "start");

    v42 = v60;
  }
  else
  {
    v44[2](v44, 0);
    v49 = v56;
    v48 = v57;
  }

}

uint64_t __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(a2, "fallbackOrder"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend(v5, "fallbackOrder");

  objc_msgSend(v7, "numberWithUnsignedLongLong:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

void __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "mutingTagID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 48) && !objc_msgSend(v8, "shownInFavoritesOnlyMode")
    || *(_BYTE *)(a1 + 49) && !objc_msgSend(v8, "glanceable")
    || v5
    && (objc_msgSend(*(id *)(a1 + 32), "mutedTagIDs"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "containsObject:", v5),
        v6,
        v7))
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
  }

}

void __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_3(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v3 = objc_msgSend(v12, "presenceDeterminedByPersonalization");
  v4 = v12;
  if (v3)
  {
    objc_msgSend(v12, "personalizedPresenceConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "personalizationMethod"))
    {
      v6 = (void *)objc_opt_new();
      v7 = (void *)MEMORY[0x24BE6CCA8];
      objc_msgSend(v12, "personalizedPresenceFeatureID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "featureForFreeValuedIdentifier:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFeature:", v9);

      objc_msgSend(v6, "setFeatureClickPrior:", (double)(unint64_t)objc_msgSend(v12, "personalizedPresenceFeatureClickPrior"));
      objc_msgSend(v6, "setFeatureImpressionPrior:", (double)(unint64_t)objc_msgSend(v12, "personalizedPresenceFeatureImpressionPrior"));
      objc_msgSend(v12, "personalizedPresenceConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "absoluteConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAbsolutePresenceConfig:", v11);

      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    }

    v4 = v12;
  }

}

void __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
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
  void *v15;
  id v16;

  v16 = a2;
  v5 = a3;
  if (objc_msgSend(v16, "presenceDeterminedByPersonalization"))
  {
    objc_msgSend(v16, "personalizedPresenceConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "personalizationMethod") == 1)
    {
      v7 = (void *)objc_opt_new();
      v8 = (void *)MEMORY[0x24BE6CCA8];
      objc_msgSend(v16, "personalizedPresenceFeatureID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "featureForFreeValuedIdentifier:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTargetSectionFeature:", v10);

      objc_msgSend(v7, "setTargetSectionFeatureClickPrior:", (double)(unint64_t)objc_msgSend(v16, "personalizedPresenceFeatureClickPrior"));
      objc_msgSend(v7, "setTargetSectionFeatureImpressionPrior:", (double)(unint64_t)objc_msgSend(v16, "personalizedPresenceFeatureImpressionPrior"));
      v11 = (void *)MEMORY[0x24BE6CCA8];
      objc_msgSend(v5, "personalizedPresenceFeatureID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "featureForFreeValuedIdentifier:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCompetingSectionFeature:", v13);

      objc_msgSend(v7, "setCompetingSectionFeatureClickPrior:", (double)(unint64_t)objc_msgSend(v5, "personalizedPresenceFeatureClickPrior"));
      objc_msgSend(v7, "setCompetingSectionFeatureImpressionPrior:", (double)(unint64_t)objc_msgSend(v5, "personalizedPresenceFeatureImpressionPrior"));
      objc_msgSend(v16, "personalizedPresenceConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "relativeConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "scalar");
      objc_msgSend(v7, "setScalar:");

      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    }

  }
}

void __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_5(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  __int16 v10;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_6;
  v7[3] = &unk_24DB5F180;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = *(_WORD *)(a1 + 64);
  v5 = a2;
  objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

NTQueueConfigSectionQueueDescriptor *__210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  NTQueueConfigSectionQueueDescriptor *v4;

  v3 = a2;
  v4 = -[NTQueueConfigSectionQueueDescriptor initWithQueueConfig:appConfiguration:todayData:inFavoritesOnlyMode:respectsWidgetVisibleSectionsLimit:]([NTQueueConfigSectionQueueDescriptor alloc], "initWithQueueConfig:appConfiguration:todayData:inFavoritesOnlyMode:respectsWidgetVisibleSectionsLimit:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));

  return v4;
}

void __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  uint64_t j;
  uint64_t v12;
  void *v13;
  id obj;
  _QWORD v15[4];
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "todaySectionConfigs");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_opt_new();
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_8;
        v15[3] = &unk_24DB5F1D0;
        v16 = v3;
        v10 = v9;
        v17 = v10;
        objc_msgSend(v8, "fc_enumerateObjectsPairwiseUsingBlock:", v15);
        for (j = objc_msgSend(v10, "firstIndex"); ; j = objc_msgSend(v10, "indexGreaterThanIndex:", v12))
        {
          v12 = j;
          if (j == 0x7FFFFFFFFFFFFFFFLL)
            break;
          objc_msgSend(v8, "objectAtIndex:", j + 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "removeObjectAtIndex:", v12 + 1);
          objc_msgSend(v8, "insertObject:atIndex:", v13, v12);

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

}

void __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_8(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  if (objc_msgSend(v7, "presenceDeterminedByPersonalization"))
  {
    objc_msgSend(v7, "personalizedPresenceConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "personalizationMethod");

    if (v10 == 1)
    {
      v11 = (void *)MEMORY[0x24BE6CCA8];
      objc_msgSend(v7, "personalizedPresenceFeatureID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "featureForFreeValuedIdentifier:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v16 = objc_msgSend(v14, "BOOLValue");
        NTSharedLog();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
        if (v16)
        {
          if (v18)
          {
            objc_msgSend(v7, "identifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "identifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = 138543618;
            v24 = v19;
            v25 = 2114;
            v26 = v20;
            _os_log_impl(&dword_2197E6000, v17, OS_LOG_TYPE_INFO, "personalized presence not swapping %{public}@ with %{public}@", (uint8_t *)&v23, 0x16u);

          }
        }
        else
        {
          if (v18)
          {
            objc_msgSend(v7, "identifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "identifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = 138543618;
            v24 = v21;
            v25 = 2114;
            v26 = v22;
            _os_log_impl(&dword_2197E6000, v17, OS_LOG_TYPE_INFO, "personalized presence swapping %{public}@ with %{public}@", (uint8_t *)&v23, 0x16u);

          }
          objc_msgSend(*(id *)(a1 + 40), "addIndex:", a4);
        }
      }

    }
  }

}

void __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_81(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id obj;
  _QWORD v13[4];
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    v7 = MEMORY[0x24BDAC760];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8), "todaySectionConfigs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_opt_new();
        v13[0] = v7;
        v13[1] = 3221225472;
        v13[2] = __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_2_82;
        v13[3] = &unk_24DB5F220;
        v14 = v3;
        v15 = v10;
        v11 = v10;
        objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);
        objc_msgSend(v9, "removeObjectsAtIndexes:", v11);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

}

void __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_2_82(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x24BE6CCA8];
  objc_msgSend(a2, "personalizedPresenceFeatureID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureForFreeValuedIdentifier:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "BOOLValue") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);

}

uint64_t __210__NTNewsTodayResultOperation__assembleQueueDescriptorsWithConfig_allowOnlyWatchEligibleSections_respectsWidgetVisibleSectionsLimit_personalizationTreatment_aggregateStore_appConfiguration_todayData_completion___block_invoke_3_83(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchTodayResultsWithFetchHelper:(id)a3 aggregator:(id)a4 budgetInfo:(id)a5 appConfiguration:(id)a6 feedPersonalizer:(id)a7 todayData:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NTTodayResults *v29;
  NTTodayResults *v30;
  id v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  NTNewsTodayResultOperation *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  NTTodayResults *v42;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v31 = a8;
  v20 = a9;
  if (!v15 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultOperation _fetchTodayResultsWithFetchHelper:aggregator:budgetInfo:appConfiguration:feedPersonalizer:todayData:completion:].cold.2();
    if (v20)
      goto LABEL_6;
  }
  else if (v20)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultOperation _fetchTodayResultsWithFetchHelper:aggregator:budgetInfo:appConfiguration:feedPersonalizer:todayData:completion:].cold.1();
LABEL_6:
  v21 = v17;
  objc_msgSend(v15, "sectionDescriptorsAtHeadsOfQueues");
  v32 = v15;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count"))
  {
    -[NTTodayResultOperation prefetchedContent](self, "prefetchedContent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_opt_new();
    objc_msgSend(v24, "setAppConfiguration:", v18);
    -[NTTodayResultOperation contentContext](self, "contentContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setContentContext:", v25);

    objc_msgSend(v24, "setFeedPersonalizer:", v19);
    objc_msgSend(v23, "prefetchedHeldRecordsByType");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTodayConfigOperationHeldRecordsByType:", v26);

    objc_msgSend(v22, "makeObjectsPerformSelector:withObject:", sel_configureCatchUpOperationWithFetchRequest_, v24);
    -[NTNewsTodayResultOperation articleIDsToExclude](self, "articleIDsToExclude");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addArticleIDsToExclude:", v27);

    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __141__NTNewsTodayResultOperation__fetchTodayResultsWithFetchHelper_aggregator_budgetInfo_appConfiguration_feedPersonalizer_todayData_completion___block_invoke;
    v33[3] = &unk_24DB5F328;
    v42 = (NTTodayResults *)v20;
    v34 = v22;
    v35 = self;
    v36 = v16;
    v37 = v21;
    v38 = v18;
    v39 = v19;
    v28 = v31;
    v40 = v31;
    v41 = v32;
    objc_msgSend(v24, "setCatchUpCompletionHandler:", v33);
    -[FCOperation associateChildOperation:](self, "associateChildOperation:", v24);
    objc_msgSend(v24, "start");

    v29 = v42;
  }
  else
  {
    v30 = [NTTodayResults alloc];
    v23 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[NTTodayResults initWithSourceIdentifier:sections:expirationDate:headlineScale:](v30, "initWithSourceIdentifier:sections:expirationDate:headlineScale:", CFSTR("news"), v23, v24, 1.0);
    (*((void (**)(id, NTTodayResults *, _QWORD, _QWORD))v20 + 2))(v20, v29, MEMORY[0x24BDBD1B8], 0);
    v28 = v31;
  }

}

void __141__NTNewsTodayResultOperation__fetchTodayResultsWithFetchHelper_aggregator_budgetInfo_appConfiguration_feedPersonalizer_todayData_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    v8 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __141__NTNewsTodayResultOperation__fetchTodayResultsWithFetchHelper_aggregator_budgetInfo_appConfiguration_feedPersonalizer_todayData_completion___block_invoke_2;
    v28[3] = &unk_24DB5F270;
    v9 = v5;
    v29 = v9;
    objc_msgSend(v7, "fc_dictionaryWithValueBlock:", v28);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isForYouEnabled"))
    {
      objc_msgSend(v9, "forYouFetchInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(*(id *)(a1 + 40), "_registerForYouFetchWithForYouFetchInfo:", v11);

    }
    v12 = *(void **)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v10, "fc_dictionaryByTransformingValuesWithBlock:", &__block_literal_global_91);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "aggregateSections:itemsBySectionDescriptor:budgetInfo:", v13, v14, *(_QWORD *)(a1 + 56));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "aggregatedItemsBySectionDescriptor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v8;
    v26[1] = 3221225472;
    v26[2] = __141__NTNewsTodayResultOperation__fetchTodayResultsWithFetchHelper_aggregator_budgetInfo_appConfiguration_feedPersonalizer_todayData_completion___block_invoke_2_92;
    v26[3] = &unk_24DB5F2D8;
    v17 = v10;
    v27 = v17;
    objc_msgSend(v16, "fc_dictionaryByTransformingValuesWithKeyAndValueBlock:", v26);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "unusedSectionDescriptors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count"))
    {
      objc_msgSend(*(id *)(a1 + 88), "removeSectionDescriptors:", v19);
      objc_msgSend(*(id *)(a1 + 40), "_fetchTodayResultsWithFetchHelper:aggregator:budgetInfo:appConfiguration:feedPersonalizer:todayData:completion:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 96));
    }
    else
    {
      objc_msgSend(v18, "allKeys");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v8;
      v24[1] = 3221225472;
      v24[2] = __141__NTNewsTodayResultOperation__fetchTodayResultsWithFetchHelper_aggregator_budgetInfo_appConfiguration_feedPersonalizer_todayData_completion___block_invoke_3;
      v24[3] = &unk_24DB5F300;
      v25 = *(id *)(a1 + 32);
      objc_msgSend(v20, "sortedArrayUsingComparator:", v24);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "headlineScale");
      objc_msgSend(*(id *)(a1 + 40), "setResultHeadlineScaleFactor:");
      if (v21)
        v22 = v21;
      else
        v22 = (void *)MEMORY[0x24BDBD1A8];
      if (v18)
        v23 = v18;
      else
        v23 = (void *)MEMORY[0x24BDBD1B8];
      objc_msgSend(*(id *)(a1 + 40), "_finalizeTodayResultsWithSectionDescriptors:catchUpOperationResultsBySectionDescriptor:appConfiguration:feedPersonalizer:todayData:completion:", v22, v23, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 96));

    }
  }

}

id __141__NTNewsTodayResultOperation__fetchTodayResultsWithFetchHelper_aggregator_budgetInfo_appConfiguration_feedPersonalizer_todayData_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "assembleResultsWithCatchUpOperation:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NTSharedLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    objc_msgSend(v3, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218242;
    v11 = v7;
    v12 = 2114;
    v13 = v8;
    _os_log_impl(&dword_2197E6000, v5, OS_LOG_TYPE_INFO, "Unpacking %ld results from catchUpOperation for section with identifier %{public}@.", (uint8_t *)&v10, 0x16u);

  }
  return v4;
}

uint64_t __141__NTNewsTodayResultOperation__fetchTodayResultsWithFetchHelper_aggregator_budgetInfo_appConfiguration_feedPersonalizer_todayData_completion___block_invoke_89(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "items");
}

id __141__NTNewsTodayResultOperation__fetchTodayResultsWithFetchHelper_aggregator_budgetInfo_appConfiguration_feedPersonalizer_todayData_completion___block_invoke_2_92(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithItems:", v5);

  return v7;
}

uint64_t __141__NTNewsTodayResultOperation__fetchTodayResultsWithFetchHelper_aggregator_budgetInfo_appConfiguration_feedPersonalizer_todayData_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(v5, "indexOfObject:", a2);
  v8 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v6);

  if (v7 < v8)
    return -1;
  else
    return v7 > v8;
}

- (void)_registerForYouFetchWithForYouFetchInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NTCatchUpOperationForYouFetchInfo *v8;
  NTCatchUpOperationForYouFetchInfo *v9;
  void *v10;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultOperation _registerForYouFetchWithForYouFetchInfo:].cold.1();
  -[NTNewsTodayResultOperation forYouFetchInfo](self, "forYouFetchInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "attemptedCachedOnly"))
      v7 = objc_msgSend(v4, "attemptedCachedOnly");
    else
      v7 = 0;
    v9 = [NTCatchUpOperationForYouFetchInfo alloc];
    objc_msgSend(v4, "feedContextByFeedID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NTCatchUpOperationForYouFetchInfo initWithAttemptedCachedOnly:feedContextByFeedID:](v9, "initWithAttemptedCachedOnly:feedContextByFeedID:", v7, v10);

  }
  else
  {
    v8 = (NTCatchUpOperationForYouFetchInfo *)v4;
  }
  -[NTNewsTodayResultOperation setForYouFetchInfo:](self, "setForYouFetchInfo:", v8);

}

- (void)_finalizeTodayResultsWithSectionDescriptors:(id)a3 catchUpOperationResultsBySectionDescriptor:(id)a4 appConfiguration:(id)a5 feedPersonalizer:(id)a6 todayData:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  NTNewsTodayResultOperation *v35;
  id v36;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (!v14 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultOperation _finalizeTodayResultsWithSectionDescriptors:catchUpOperationResultsBySectionDescriptor:appConfiguration:feedPersonalizer:todayData:completion:].cold.6();
    if (v15)
      goto LABEL_6;
  }
  else if (v15)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultOperation _finalizeTodayResultsWithSectionDescriptors:catchUpOperationResultsBySectionDescriptor:appConfiguration:feedPersonalizer:todayData:completion:].cold.5();
LABEL_6:
  v20 = objc_msgSend(v14, "count");
  objc_msgSend(v15, "nf_objectsForKeysWithoutMarker:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v20 != v22 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultOperation _finalizeTodayResultsWithSectionDescriptors:catchUpOperationResultsBySectionDescriptor:appConfiguration:feedPersonalizer:todayData:completion:].cold.4();
    if (v16)
      goto LABEL_11;
  }
  else if (v16)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultOperation _finalizeTodayResultsWithSectionDescriptors:catchUpOperationResultsBySectionDescriptor:appConfiguration:feedPersonalizer:todayData:completion:].cold.3();
LABEL_11:
  if (!v17 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultOperation _finalizeTodayResultsWithSectionDescriptors:catchUpOperationResultsBySectionDescriptor:appConfiguration:feedPersonalizer:todayData:completion:].cold.2();
    if (v19)
      goto LABEL_16;
  }
  else if (v19)
  {
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultOperation _finalizeTodayResultsWithSectionDescriptors:catchUpOperationResultsBySectionDescriptor:appConfiguration:feedPersonalizer:todayData:completion:].cold.1();
LABEL_16:
  -[NTTodayResultOperation operationInfo](self, "operationInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_opt_new();
  objc_msgSend(v24, "setCatchUpOperationResultsBySectionDescriptor:", v15);
  objc_msgSend(v24, "setAppConfiguration:", v16);
  -[NTTodayResultOperation contentContext](self, "contentContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setContentContext:", v25);

  objc_msgSend(v24, "setFeedPersonalizer:", v17);
  objc_msgSend(v24, "setTodayData:", v18);
  -[NTNewsTodayResultOperation forYouFetchInfo](self, "forYouFetchInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setForYouFetchInfo:", v26);

  objc_msgSend(v24, "setOperationInfo:", v23);
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __172__NTNewsTodayResultOperation__finalizeTodayResultsWithSectionDescriptors_catchUpOperationResultsBySectionDescriptor_appConfiguration_feedPersonalizer_todayData_completion___block_invoke;
  v31[3] = &unk_24DB5F378;
  v35 = self;
  v36 = v19;
  v32 = v14;
  v33 = v15;
  v34 = v23;
  v27 = v23;
  v28 = v15;
  v29 = v14;
  v30 = v19;
  objc_msgSend(v24, "setTodayItemCompletion:", v31);
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v24);
  objc_msgSend(v24, "start");

}

void __172__NTNewsTodayResultOperation__finalizeTodayResultsWithSectionDescriptors_catchUpOperationResultsBySectionDescriptor_appConfiguration_feedPersonalizer_todayData_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NTTodayResults *v19;
  uint64_t v20;
  uint64_t v21;
  NTTodayResults *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  int v39;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v15)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v16 = (void *)objc_opt_new();
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__0;
    v34 = __Block_byref_object_dispose__0;
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v17 = *(void **)(a1 + 32);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __172__NTNewsTodayResultOperation__finalizeTodayResultsWithSectionDescriptors_catchUpOperationResultsBySectionDescriptor_appConfiguration_feedPersonalizer_todayData_completion___block_invoke_2;
    v23[3] = &unk_24DB5F350;
    v24 = v11;
    v25 = *(id *)(a1 + 40);
    v26 = *(id *)(a1 + 48);
    v18 = v16;
    v27 = v18;
    v28 = &v30;
    v29 = &v36;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v23);
    v19 = [NTTodayResults alloc];
    v20 = *((unsigned int *)v37 + 6);
    v21 = v31[5];
    objc_msgSend(*(id *)(a1 + 56), "resultHeadlineScaleFactor");
    v22 = -[NTTodayResults initWithSourceIdentifier:sections:promotionCriterion:expirationDate:headlineScale:assetsHoldToken:recordsHoldToken:](v19, "initWithSourceIdentifier:sections:promotionCriterion:expirationDate:headlineScale:assetsHoldToken:recordsHoldToken:", CFSTR("news"), v18, v20, v21, v14, v13);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v36, 8);

  }
}

void __172__NTNewsTodayResultOperation__finalizeTodayResultsWithSectionDescriptors_catchUpOperationResultsBySectionDescriptor_appConfiguration_feedPersonalizer_todayData_completion___block_invoke_2(id *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NTSection *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id *v50;
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v51 = v6;
    v52 = v7;
    v50 = a1;
    v48 = a3;
    if (objc_msgSend(a1[6], "allowSectionTitles"))
    {
      if ((objc_msgSend(a1[6], "preferCompactSectionName") & 1) != 0)
        objc_msgSend(v5, "compactName");
      else
        objc_msgSend(v5, "name");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    v9 = (void *)objc_opt_new();
    v49 = (void *)v8;
    objc_msgSend(v9, "setName:", v8);
    objc_msgSend(v5, "nameColorLight");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNameColorLight:", v10);

    objc_msgSend(v5, "nameColorDark");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNameColorDark:", v11);

    objc_msgSend(v5, "actionTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActionTitle:", v12);

    objc_msgSend(v5, "actionURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActionURL:", v13);

    objc_msgSend(v5, "nameActionURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNameActionURL:", v14);

    objc_msgSend(v5, "backgroundColorLight");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColorLight:", v15);

    objc_msgSend(v5, "backgroundColorDark");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColorDark:", v16);

    v45 = [NTSection alloc];
    objc_msgSend(v5, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subidentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionTitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personalizationFeatureID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "rankingFeedback");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "referralBarName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backingTagID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v9;
    v25 = -[NTSection initWithIdentifier:subidentifier:actionTitle:actionURL:personalizationFeatureID:items:rankingFeedback:displayDescriptor:referralBarName:backingTagID:](v45, "initWithIdentifier:subidentifier:actionTitle:actionURL:personalizationFeatureID:items:rankingFeedback:displayDescriptor:referralBarName:backingTagID:", v17, v18, v19, v20, v21, v51, v22, v9, v23, v24);

    v46 = (void *)v25;
    objc_msgSend(v50[7], "addObject:", v25);
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc_msgSend(v52, "items");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v54;
      do
      {
        v32 = 0;
        v33 = v26;
        v34 = v27;
        do
        {
          if (*(_QWORD *)v54 != v31)
            objc_enumerationMutation(v28);
          v35 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v32);
          objc_msgSend(v35, "cacheCutoffTimeRelativeDate");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "earlierDate:", v36);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v35, "cacheExpirationDate");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "earlierDate:", v37);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          ++v32;
          v33 = v26;
          v34 = v27;
        }
        while (v30 != v32);
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
      }
      while (v30);
    }

    objc_msgSend(v26, "dateByAddingTimeInterval:", (double)(unint64_t)objc_msgSend(v5, "cachedResultCutoffTime"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "earlierDate:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*((_QWORD *)v50[8] + 1) + 40), "earlierDate:", v39);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = *((_QWORD *)v50[8] + 1);
    v42 = *(void **)(v41 + 40);
    *(_QWORD *)(v41 + 40) = v40;

    if (!v48)
    {
      *(_DWORD *)(*((_QWORD *)v50[9] + 1) + 24) = objc_msgSend(v5, "promotionCriterion");
      if (NFInternalBuild())
      {
        NewsCoreUserDefaults();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "integerForKey:", CFSTR("widget_promotion_criterion"));

        if (v44)
          *(_DWORD *)(*((_QWORD *)v50[9] + 1) + 24) = v44;
      }
    }

    v6 = v51;
    v7 = v52;
  }

}

- (id)_firstRefreshDateDefaultsKey
{
  void *v3;
  int v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[NTTodayResultOperation operationInfo](self, "operationInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "widgetSize");

  v5 = CFSTR("first_widget_refresh_date");
  if (v4 == 1)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[NTTodayResultOperation operationInfo](self, "operationInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTTodayResultOperation operationInfo](self, "operationInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@_%@-%d"), CFSTR("first_widget_refresh_date"), v9, objc_msgSend(v10, "widgetSize"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (NSMutableSet)articleIDsToExclude
{
  return self->_articleIDsToExclude;
}

- (void)setArticleIDsToExclude:(id)a3
{
  objc_storeStrong((id *)&self->_articleIDsToExclude, a3);
}

- (NTPBTodayConfig)todayConfig
{
  return self->_todayConfig;
}

- (void)setTodayConfig:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSDate)filterDate
{
  return self->_filterDate;
}

- (void)setFilterDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NTCatchUpOperationForYouFetchInfo)forYouFetchInfo
{
  return self->_forYouFetchInfo;
}

- (void)setForYouFetchInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (double)resultHeadlineScaleFactor
{
  return self->_resultHeadlineScaleFactor;
}

- (void)setResultHeadlineScaleFactor:(double)a3
{
  self->_resultHeadlineScaleFactor = a3;
}

- (NTTodayResults)resultTodayResults
{
  return self->_resultTodayResults;
}

- (void)setResultTodayResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (NSDictionary)resultAssetHandlesByAssetID
{
  return self->_resultAssetHandlesByAssetID;
}

- (void)setResultAssetHandlesByAssetID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NTPBTodayResultOperationFetchInfo)resultFetchInfo
{
  return self->_resultFetchInfo;
}

- (void)setResultFetchInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultFetchInfo, 0);
  objc_storeStrong((id *)&self->_resultAssetHandlesByAssetID, 0);
  objc_storeStrong((id *)&self->_resultTodayResults, 0);
  objc_storeStrong((id *)&self->_forYouFetchInfo, 0);
  objc_storeStrong((id *)&self->_filterDate, 0);
  objc_storeStrong((id *)&self->_todayConfig, 0);
  objc_storeStrong((id *)&self->_articleIDsToExclude, 0);
}

- (void)validateOperation
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("News today result operation must have a content context"));
  v2[0] = 136315906;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_3_0();
}

- (void)_sectionCTRsWithTodayConfig:personalizationTreatment:aggregateStore:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"aggregateStore", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_sectionCTRsWithTodayConfig:personalizationTreatment:aggregateStore:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"personalizationTreatment", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_sectionCTRsWithTodayConfig:personalizationTreatment:aggregateStore:.cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"todayConfig", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_assembleQueueDescriptorsWithConfig:allowOnlyWatchEligibleSections:respectsWidgetVisibleSectionsLimit:personalizationTreatment:aggregateStore:appConfiguration:todayData:completion:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_assembleQueueDescriptorsWithConfig:allowOnlyWatchEligibleSections:respectsWidgetVisibleSectionsLimit:personalizationTreatment:aggregateStore:appConfiguration:todayData:completion:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"appConfiguration", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_assembleQueueDescriptorsWithConfig:allowOnlyWatchEligibleSections:respectsWidgetVisibleSectionsLimit:personalizationTreatment:aggregateStore:appConfiguration:todayData:completion:.cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"aggregateStore", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_assembleQueueDescriptorsWithConfig:allowOnlyWatchEligibleSections:respectsWidgetVisibleSectionsLimit:personalizationTreatment:aggregateStore:appConfiguration:todayData:completion:.cold.4()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"personalizationTreatment", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_assembleQueueDescriptorsWithConfig:allowOnlyWatchEligibleSections:respectsWidgetVisibleSectionsLimit:personalizationTreatment:aggregateStore:appConfiguration:todayData:completion:.cold.5()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"todayConfig", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_fetchTodayResultsWithFetchHelper:aggregator:budgetInfo:appConfiguration:feedPersonalizer:todayData:completion:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_fetchTodayResultsWithFetchHelper:aggregator:budgetInfo:appConfiguration:feedPersonalizer:todayData:completion:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"fetchHelper", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_registerForYouFetchWithForYouFetchInfo:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"forYouFetchInfo", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_finalizeTodayResultsWithSectionDescriptors:catchUpOperationResultsBySectionDescriptor:appConfiguration:feedPersonalizer:todayData:completion:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_finalizeTodayResultsWithSectionDescriptors:catchUpOperationResultsBySectionDescriptor:appConfiguration:feedPersonalizer:todayData:completion:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"feedPersonalizer", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_finalizeTodayResultsWithSectionDescriptors:catchUpOperationResultsBySectionDescriptor:appConfiguration:feedPersonalizer:todayData:completion:.cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"appConfiguration", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_finalizeTodayResultsWithSectionDescriptors:catchUpOperationResultsBySectionDescriptor:appConfiguration:feedPersonalizer:todayData:completion:.cold.4()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sectionDescriptors.count == [catchUpOperationResultsBySectionDescriptor nf_objectsForKeysWithoutMarker:sectionDescriptors].count", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_finalizeTodayResultsWithSectionDescriptors:catchUpOperationResultsBySectionDescriptor:appConfiguration:feedPersonalizer:todayData:completion:.cold.5()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"catchUpOperationResultsBySectionDescriptor", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_finalizeTodayResultsWithSectionDescriptors:catchUpOperationResultsBySectionDescriptor:appConfiguration:feedPersonalizer:todayData:completion:.cold.6()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sectionDescriptors", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
