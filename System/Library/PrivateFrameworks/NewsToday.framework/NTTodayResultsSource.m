@implementation NTTodayResultsSource

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

void __71__NTTodayResultsSource_fetchLatestResultsWithOperationInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("marker"));
  objc_msgSend(v4, "setBool:forKey:", 1, CFSTR("marker"));
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(*(id *)(a1 + 48), "qualityOfService");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __71__NTTodayResultsSource_fetchLatestResultsWithOperationInfo_completion___block_invoke_2;
  v11[3] = &unk_24DB5E628;
  v11[4] = *(_QWORD *)(a1 + 32);
  v14 = *(id *)(a1 + 56);
  v15 = v3;
  v12 = *(id *)(a1 + 40);
  v13 = v4;
  v9 = v4;
  v10 = v3;
  objc_msgSend(v6, "_fetchTodayModuleDescriptorsWithContentRequest:requireRefreshedAppConfig:qualityOfService:completion:", v7, v5, v8, v11);

}

uint64_t __91__NTTodayResultsSource_placeholderResultsWithFetchDescriptor_contentContext_operationInfo___block_invoke()
{
  return objc_msgSend(MEMORY[0x24BDBCE30], "fc_array:", &__block_literal_global_33);
}

void __71__NTTodayResultsSource_fetchLatestResultsWithOperationInfo_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[6];
  __int128 v19;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __71__NTTodayResultsSource_fetchLatestResultsWithOperationInfo_completion___block_invoke_3;
    v18[3] = &unk_24DB5E5D8;
    v18[4] = *(_QWORD *)(a1 + 32);
    v18[5] = v6;
    v19 = *(_OWORD *)(a1 + 56);
    v8 = (id)v19;
    __71__NTTodayResultsSource_fetchLatestResultsWithOperationInfo_completion___block_invoke_3((uint64_t)v18);

  }
  else
  {
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __71__NTTodayResultsSource_fetchLatestResultsWithOperationInfo_completion___block_invoke_4;
    v13[3] = &unk_24DB5E600;
    v11 = *(id *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 32);
    v14 = v11;
    v15 = v12;
    v16 = *(id *)(a1 + 56);
    v17 = *(id *)(a1 + 64);
    objc_msgSend(v9, "_fetchLatestResultsWithOperationInfo:prefetchedContent:completion:", v10, a3, v13);

  }
}

NTSection *__91__NTTodayResultsSource_placeholderResultsWithFetchDescriptor_contentContext_operationInfo___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NTSection *v6;
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
  void *v19;
  void *v21;
  NTSection *v22;
  void *v23;
  void *v24;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "aggregatedItemsBySectionDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "allowSectionTitles"))
    {
      if ((objc_msgSend(*(id *)(a1 + 40), "preferCompactSectionName") & 1) != 0)
        objc_msgSend(v3, "compactName");
      else
        objc_msgSend(v3, "name");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    v24 = (void *)v7;
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setName:", v7);
    objc_msgSend(v3, "nameColorLight");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNameColorLight:", v9);

    objc_msgSend(v3, "nameColorDark");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNameColorDark:", v10);

    objc_msgSend(v3, "actionTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActionTitle:", v11);

    objc_msgSend(v3, "actionURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActionURL:", v12);

    v22 = [NTSection alloc];
    objc_msgSend(v3, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subidentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "actionTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "actionURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "personalizationFeatureID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "referralBarName");
    v23 = v5;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "backingTagID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NTSection initWithIdentifier:subidentifier:actionTitle:actionURL:personalizationFeatureID:items:rankingFeedback:displayDescriptor:referralBarName:backingTagID:](v22, "initWithIdentifier:subidentifier:actionTitle:actionURL:personalizationFeatureID:items:rankingFeedback:displayDescriptor:referralBarName:backingTagID:", v21, v13, v14, v15, v16, v17, 0, v8, v18, v19);

    v5 = v23;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __91__NTTodayResultsSource_placeholderResultsWithFetchDescriptor_contentContext_operationInfo___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  NTHeadline *v3;
  void *v4;
  void *v5;
  NTHeadline *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v2 = 10;
  do
  {
    v3 = [NTHeadline alloc];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NTHeadline initWithIdentifier:](v3, "initWithIdentifier:", v5);

    objc_msgSend(CFSTR("—"), "fc_stringByMultiplyingStringByCount:", 500);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTHeadline setTitle:](v6, "setTitle:", v7);

    objc_msgSend(CFSTR("—"), "fc_stringByMultiplyingStringByCount:", 8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTHeadline setSourceName:](v6, "setSourceName:", v8);

    -[NTHeadline setNeedsPlaceholderThumbnail:](v6, "setNeedsPlaceholderThumbnail:", 1);
    objc_msgSend(v9, "addObject:", v6);

    --v2;
  }
  while (v2);

}

- (void)fetchLatestResultsWithOperationInfo:(id)a3 completion:(id)a4
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
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  NTTodayResultsSource *v24;
  id v25;
  id v26;
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v8, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BE6D2D0], "nt_defaultModule");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "availableContents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fc_onlyObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "request");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRequest:", v13);

  }
  v14 = (void *)MEMORY[0x24BE6CAD0];
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __71__NTTodayResultsSource_fetchLatestResultsWithOperationInfo_completion___block_invoke;
  v23 = &unk_24DB5E650;
  v24 = self;
  v25 = v8;
  v26 = v6;
  v27 = v7;
  v15 = v7;
  v16 = v6;
  v17 = v8;
  objc_msgSend(v14, "asyncBlockOperationWithBlock:", &v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setQualityOfService:", objc_msgSend(v16, "qualityOfService", v20, v21, v22, v23, v24));
  -[NTTodayResultsSource serialQueue](self, "serialQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "enqueueOperation:", v18);

}

+ (id)placeholderResultsWithFetchDescriptor:(id)a3 contentContext:(id)a4 operationInfo:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NTNewsTodayResultsExplicitAllocationAggregator *v14;
  void *v15;
  void *v16;
  NTNewsTodayResultsContentFillAggregator *v17;
  double v18;
  double v19;
  double v20;
  NTNewsTodayResultsContentFillAggregator *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  NTTodayResults *v26;
  void *v27;
  void *v28;
  void *v29;
  NTTodayResults *v30;
  void *v32;
  void *v33;
  NTNewsTodayResultsExplicitAllocationAggregator *v34;
  _QWORD v35[4];
  id v36;
  id v37;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    +[NTTodayResultsSource placeholderResultsWithFetchDescriptor:contentContext:operationInfo:].cold.3();
    if (v8)
      goto LABEL_6;
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    +[NTTodayResultsSource placeholderResultsWithFetchDescriptor:contentContext:operationInfo:].cold.2();
LABEL_6:
  if (!v9 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    +[NTTodayResultsSource placeholderResultsWithFetchDescriptor:contentContext:operationInfo:].cold.1();
  objc_msgSend(v9, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "placeholderSectionDescriptorsWithContentRequest:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "fc_dictionaryWithValueBlock:", &__block_literal_global_1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  objc_msgSend(v9, "sectionSlotCostInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSectionSlotCostInfo:", v13);

  objc_msgSend(v12, "setRespectMinMaxLimit:", objc_msgSend(v9, "respectsWidgetSlotsLimit"));
  objc_msgSend(v9, "slotsLimit");
  objc_msgSend(v12, "setSlotsLimit:");
  objc_msgSend(v12, "setAllowSectionTitles:", objc_msgSend(v9, "allowSectionTitles"));
  v14 = [NTNewsTodayResultsExplicitAllocationAggregator alloc];
  objc_msgSend(v8, "news_core_ConfigurationManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[NTNewsTodayResultsExplicitAllocationAggregator initWithConfigurationManager:feedPersonalizer:filterDate:todayData:](v14, "initWithConfigurationManager:feedPersonalizer:filterDate:todayData:", v15, 0, v16, 0);

  v17 = [NTNewsTodayResultsContentFillAggregator alloc];
  objc_msgSend(v9, "minHeadlineScale");
  v19 = v18;
  objc_msgSend(v9, "maxHeadlineScale");
  v21 = -[NTNewsTodayResultsContentFillAggregator initWithAggregator:minHeadlineScale:maxHeadlineScale:](v17, "initWithAggregator:minHeadlineScale:maxHeadlineScale:", v34, v19, v20);
  -[NTNewsTodayResultsContentFillAggregator aggregateSections:itemsBySectionDescriptor:budgetInfo:](v21, "aggregateSections:itemsBySectionDescriptor:budgetInfo:", v11, v33, v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __91__NTTodayResultsSource_placeholderResultsWithFetchDescriptor_contentContext_operationInfo___block_invoke_3;
  v35[3] = &unk_24DB5E6F8;
  v36 = v22;
  v37 = v9;
  v23 = v9;
  v24 = v22;
  objc_msgSend(v11, "fc_orderedSetByTransformingWithBlock:", v35);
  v32 = v8;
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = [NTTodayResults alloc];
  v27 = v7;
  objc_msgSend(v7, "sourceIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "headlineScale");
  v30 = -[NTTodayResults initWithSourceIdentifier:sections:expirationDate:headlineScale:](v26, "initWithSourceIdentifier:sections:expirationDate:headlineScale:", v28, v25, v29);

  return v30;
}

- (NTTodayResultsSource)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTTodayResultsSource init]";
    v9 = 2080;
    v10 = "NTTodayResultsSource.m";
    v11 = 1024;
    v12 = 58;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTTodayResultsSource init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTTodayResultsSource)initWithFetchDescriptor:(id)a3 feedPersonalizerFactory:(id)a4 privateDataStorage:(id)a5 contentContext:(id)a6 fetchQueue:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NTTodayResultsSource *v17;
  uint64_t v18;
  NTTodayResultsFetchDescriptor *fetchDescriptor;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v12 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTTodayResultsSource initWithFetchDescriptor:feedPersonalizerFactory:privateDataStorage:contentContext:fetchQueue:].cold.5();
    if (v13)
      goto LABEL_6;
  }
  else if (v13)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayResultsSource initWithFetchDescriptor:feedPersonalizerFactory:privateDataStorage:contentContext:fetchQueue:].cold.4();
LABEL_6:
  if (!v14 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTTodayResultsSource initWithFetchDescriptor:feedPersonalizerFactory:privateDataStorage:contentContext:fetchQueue:].cold.3();
    if (v15)
      goto LABEL_11;
  }
  else if (v15)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayResultsSource initWithFetchDescriptor:feedPersonalizerFactory:privateDataStorage:contentContext:fetchQueue:].cold.2();
LABEL_11:
  if (!v16 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayResultsSource initWithFetchDescriptor:feedPersonalizerFactory:privateDataStorage:contentContext:fetchQueue:].cold.1();
  v21.receiver = self;
  v21.super_class = (Class)NTTodayResultsSource;
  v17 = -[NTTodayResultsSource init](&v21, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    fetchDescriptor = v17->_fetchDescriptor;
    v17->_fetchDescriptor = (NTTodayResultsFetchDescriptor *)v18;

    objc_storeStrong((id *)&v17->_feedPersonalizerFactory, a4);
    objc_storeStrong((id *)&v17->_privateDataStorage, a5);
    objc_storeStrong((id *)&v17->_contentContext, a6);
    objc_storeStrong((id *)&v17->_serialQueue, a7);
  }

  return v17;
}

- (void)fetchModuleDescriptorsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BE6CAD0];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__NTTodayResultsSource_fetchModuleDescriptorsWithCompletion___block_invoke;
  v9[3] = &unk_24DB5E5B0;
  v10 = v4;
  v11 = 25;
  v9[4] = self;
  v6 = v4;
  objc_msgSend(v5, "asyncBlockOperationWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setQualityOfService:", 25);
  -[NTTodayResultsSource serialQueue](self, "serialQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enqueueOperation:", v7);

}

void __61__NTTodayResultsSource_fetchModuleDescriptorsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__NTTodayResultsSource_fetchModuleDescriptorsWithCompletion___block_invoke_2;
  v7[3] = &unk_24DB5E588;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "_fetchTodayModuleDescriptorsWithContentRequest:requireRefreshedAppConfig:qualityOfService:completion:", 0, 0, v5, v7);

}

uint64_t __61__NTTodayResultsSource_fetchModuleDescriptorsWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __71__NTTodayResultsSource_fetchLatestResultsWithOperationInfo_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "fetchDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTodaySourceIdentifier:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __71__NTTodayResultsSource_fetchLatestResultsWithOperationInfo_completion___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(*(id *)(a1 + 32), "setBool:forKey:", 0, CFSTR("marker"));
  v12 = v10;
  v13 = v12;
  if (!v12)
  {
    v13 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 40), "fetchDescriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sourceIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTodaySourceIdentifier:", v15);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (id)placeholderResultsWithOperationInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayResultsSource placeholderResultsWithOperationInfo:].cold.1();
  v5 = (void *)objc_opt_class();
  -[NTTodayResultsSource fetchDescriptor](self, "fetchDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTTodayResultsSource contentContext](self, "contentContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placeholderResultsWithFetchDescriptor:contentContext:operationInfo:", v6, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_fetchTodayModuleDescriptorsWithContentRequest:(id)a3 requireRefreshedAppConfig:(BOOL)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a4;
  v10 = a6;
  v11 = a3;
  -[NTTodayResultsSource fetchDescriptor](self, "fetchDescriptor");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[NTTodayResultsSource contentContext](self, "contentContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "descriptorsOperationClass");
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setContentRequest:", v11);

  objc_msgSend(v13, "setContentContext:", v12);
  -[NTTodayResultsSource privateDataStorage](self, "privateDataStorage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPrivateDataStorage:", v14);

  objc_msgSend(v13, "setRequireRefreshedAppConfig:", v7);
  objc_msgSend(v13, "setQualityOfService:", a5);
  objc_msgSend(v13, "setRelativePriority:", FCInferRelativePriorityFromQualityOfService());
  objc_msgSend(v13, "setDescriptorsCompletion:", v10);

  objc_msgSend(v13, "start");
}

- (void)_fetchLatestResultsWithOperationInfo:(id)a3 prefetchedContent:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  NTSharedLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "slotsLimit");
    *(_DWORD *)buf = 134217984;
    v23 = v12;
    _os_log_impl(&dword_2197E6000, v11, OS_LOG_TYPE_INFO, "Requesting %f slots from headline results source", buf, 0xCu);
  }

  if (!v8 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTTodayResultsSource _fetchLatestResultsWithOperationInfo:prefetchedContent:completion:].cold.2();
    if (v9)
      goto LABEL_8;
  }
  else if (v9)
  {
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayResultsSource _fetchLatestResultsWithOperationInfo:prefetchedContent:completion:].cold.1();
LABEL_8:
  -[NTTodayResultsSource fetchDescriptor](self, "fetchDescriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTTodayResultsSource contentContext](self, "contentContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fetchOperationClass");
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setContentContext:", v14);
  -[NTTodayResultsSource feedPersonalizerFactory](self, "feedPersonalizerFactory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFeedPersonalizerFactory:", v16);

  objc_msgSend(v15, "setPrefetchedContent:", v10);
  objc_msgSend(v15, "setOperationInfo:", v8);
  objc_msgSend(v15, "setQualityOfService:", objc_msgSend(v8, "qualityOfService"));
  objc_msgSend(v15, "setRelativePriority:", FCInferRelativePriorityFromQualityOfService());
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __90__NTTodayResultsSource__fetchLatestResultsWithOperationInfo_prefetchedContent_completion___block_invoke;
  v19[3] = &unk_24DB5E748;
  v19[4] = self;
  v20 = v14;
  v21 = v9;
  v17 = v9;
  v18 = v14;
  objc_msgSend(v15, "setHeadlineResultCompletionHandler:", v19);
  objc_msgSend(v15, "start");

}

void __90__NTTodayResultsSource__fetchLatestResultsWithOperationInfo_prefetchedContent_completion___block_invoke(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  dispatch_time_t v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  NTSharedLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v35 = v9;
    _os_log_impl(&dword_2197E6000, v13, OS_LOG_TYPE_INFO, "Fetched %{public}@", buf, 0xCu);
  }

  if (v12)
  {
    NTSharedLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v12;
      _os_log_impl(&dword_2197E6000, v14, OS_LOG_TYPE_ERROR, "Attempt to fetch completed with error %@", buf, 0xCu);
    }

  }
  if ((objc_msgSend(a1[4], "hasFlushingBeenEnabled") & 1) == 0)
  {
    NTSharedLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2197E6000, v15, OS_LOG_TYPE_INFO, "Enabling flushing with zero interest threshold", buf, 2u);
    }

    objc_msgSend(a1[5], "assetManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "enableFlushingWithFlushingThreshold:", 1);
    objc_msgSend(a1[5], "enableFlushingWithFlushingThreshold:exceptForFlusher:", 0, v16);
    objc_msgSend(a1[4], "setFlushingHasBeenEnabled:", 1);

  }
  objc_msgSend(v9, "assetsHoldToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordsHoldToken");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setLatestResultRecordsHoldToken:", v18);

  v19 = dispatch_time(0, 20000000);
  FCDispatchQueueForQualityOfService();
  v20 = objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __90__NTTodayResultsSource__fetchLatestResultsWithOperationInfo_prefetchedContent_completion___block_invoke_50;
  v27[3] = &unk_24DB5E720;
  v21 = a1[6];
  v28 = v9;
  v29 = v10;
  v30 = v11;
  v31 = v12;
  v32 = v17;
  v33 = v21;
  v22 = v17;
  v23 = v12;
  v24 = v11;
  v25 = v10;
  v26 = v9;
  dispatch_after(v19, v20, v27);

}

uint64_t __90__NTTodayResultsSource__fetchLatestResultsWithOperationInfo_prefetchedContent_completion___block_invoke_50(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[9] + 16))(a1[9], a1[4], a1[5], a1[6], a1[7]);
}

- (NTTodayResultsFetchDescriptor)fetchDescriptor
{
  return self->_fetchDescriptor;
}

- (FCFeedPersonalizerFactoryType)feedPersonalizerFactory
{
  return self->_feedPersonalizerFactory;
}

- (FCReadablePrivateDataStorage)privateDataStorage
{
  return self->_privateDataStorage;
}

- (FCAsyncSerialQueue)serialQueue
{
  return self->_serialQueue;
}

- (BOOL)hasFlushingBeenEnabled
{
  return self->_flushingHasBeenEnabled;
}

- (void)setFlushingHasBeenEnabled:(BOOL)a3
{
  self->_flushingHasBeenEnabled = a3;
}

- (NSObject)latestResultRecordsHoldToken
{
  return self->_latestResultRecordsHoldToken;
}

- (void)setLatestResultRecordsHoldToken:(id)a3
{
  objc_storeStrong((id *)&self->_latestResultRecordsHoldToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestResultRecordsHoldToken, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_privateDataStorage, 0);
  objc_storeStrong((id *)&self->_feedPersonalizerFactory, 0);
  objc_storeStrong((id *)&self->_fetchDescriptor, 0);
}

- (void)initWithFetchDescriptor:feedPersonalizerFactory:privateDataStorage:contentContext:fetchQueue:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"fetchQueue", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithFetchDescriptor:feedPersonalizerFactory:privateDataStorage:contentContext:fetchQueue:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentContext", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithFetchDescriptor:feedPersonalizerFactory:privateDataStorage:contentContext:fetchQueue:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"privateDataStorage", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithFetchDescriptor:feedPersonalizerFactory:privateDataStorage:contentContext:fetchQueue:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"feedPersonalizerFactory", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithFetchDescriptor:feedPersonalizerFactory:privateDataStorage:contentContext:fetchQueue:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"fetchDescriptor", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)placeholderResultsWithOperationInfo:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"operationInfo != nil", v6, 2u);

  OUTLINED_FUNCTION_2();
}

+ (void)placeholderResultsWithFetchDescriptor:contentContext:operationInfo:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"operationInfo != nil", v6, 2u);

  OUTLINED_FUNCTION_2();
}

+ (void)placeholderResultsWithFetchDescriptor:contentContext:operationInfo:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentContext != nil", v6, 2u);

  OUTLINED_FUNCTION_2();
}

+ (void)placeholderResultsWithFetchDescriptor:contentContext:operationInfo:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"fetchDescriptor != nil", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_fetchLatestResultsWithOperationInfo:prefetchedContent:completion:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion != nil", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_fetchLatestResultsWithOperationInfo:prefetchedContent:completion:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"operationInfo != nil", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
