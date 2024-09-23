@implementation NTSectionFeedFilterTransformation

- (NTFeedTransforming)underlyingTransformation
{
  return self->_underlyingTransformation;
}

void __56__NTSectionFeedFilterTransformation_transformFeedItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "feedTransformationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_5;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v5 = objc_msgSend(*(id *)(a1 + 32), "count");
  v6 = v8;
  if (v4 < v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isEqual:", v7))
    {

      goto LABEL_7;
    }
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

LABEL_5:
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
LABEL_7:
    v6 = v8;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingTransformation, 0);
}

BOOL __56__NTSectionFeedFilterTransformation_transformFeedItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "feedTransformationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NTSectionFeedFilterTransformation)init
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
    v8 = "-[NTSectionFeedFilterTransformation init]";
    v9 = 2080;
    v10 = "NTSectionFeedFilterTransformation.m";
    v11 = 1024;
    v12 = 65;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTSectionFeedFilterTransformation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTSectionFeedFilterTransformation)initWithTodayData:(id)a3 configurationManager:(id)a4 readArticlesFilterMethod:(int)a5 seenArticlesFilterMethod:(int)a6 minimumTimeSinceFirstSeenToFilter:(double)a7 supplementalFeedFilterOptions:(unint64_t)a8 otherArticleIDs:(id)a9 otherClusterIDs:(id)a10 filterDate:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NTSectionFeedFilterTransformation *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  NTFeedTransformationItemFeedTransformation *v46;
  NTFeedTransforming *underlyingTransformation;
  void *v49;
  unint64_t v50;
  id v51;
  int v52;
  void *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  double v65;
  unint64_t v66;
  int v67;
  int v68;
  objc_super v69;

  v18 = a3;
  v19 = a4;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  if (!v19 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTSectionFeedFilterTransformation initWithTodayData:configurationManager:readArticlesFilterMethod:seenArticlesFilterMethod:minimumTimeSinceFirstSeenToFilter:supplementalFeedFilterOptions:otherArticleIDs:otherClusterIDs:filterDate:].cold.4();
    if (v20)
      goto LABEL_6;
  }
  else if (v20)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTSectionFeedFilterTransformation initWithTodayData:configurationManager:readArticlesFilterMethod:seenArticlesFilterMethod:minimumTimeSinceFirstSeenToFilter:supplementalFeedFilterOptions:otherArticleIDs:otherClusterIDs:filterDate:].cold.3();
LABEL_6:
  if (!v21 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTSectionFeedFilterTransformation initWithTodayData:configurationManager:readArticlesFilterMethod:seenArticlesFilterMethod:minimumTimeSinceFirstSeenToFilter:supplementalFeedFilterOptions:otherArticleIDs:otherClusterIDs:filterDate:].cold.2();
    if (v22)
      goto LABEL_11;
  }
  else if (v22)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTSectionFeedFilterTransformation initWithTodayData:configurationManager:readArticlesFilterMethod:seenArticlesFilterMethod:minimumTimeSinceFirstSeenToFilter:supplementalFeedFilterOptions:otherArticleIDs:otherClusterIDs:filterDate:].cold.1();
LABEL_11:
  v69.receiver = self;
  v69.super_class = (Class)NTSectionFeedFilterTransformation;
  v23 = -[NTSectionFeedFilterTransformation init](&v69, sel_init);
  if (v23)
  {
    v52 = a6;
    v53 = v20;
    v54 = v19;
    v24 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v18, "rankedAllSubscribedTagIDs");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setWithArray:", v25);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "mutedTagIDs");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v50 = a8;
    if (v26)
      v28 = v26;
    else
      v28 = (id)objc_opt_new();
    v29 = v28;

    objc_msgSend(v18, "recentlyReadHistoryItems");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "allValues");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v31;
    v33 = (void *)MEMORY[0x24BDBD1A8];
    if (v31)
      v34 = (void *)v31;
    else
      v34 = (void *)MEMORY[0x24BDBD1A8];
    v35 = v34;

    objc_msgSend(v18, "recentlySeenHistoryItems");
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)v36;
    if (v36)
      v38 = (void *)v36;
    else
      v38 = v33;
    v39 = v38;

    v40 = (void *)MEMORY[0x24BDBCE30];
    v55[0] = MEMORY[0x24BDAC760];
    v55[1] = 3221225472;
    v55[2] = __233__NTSectionFeedFilterTransformation_initWithTodayData_configurationManager_readArticlesFilterMethod_seenArticlesFilterMethod_minimumTimeSinceFirstSeenToFilter_supplementalFeedFilterOptions_otherArticleIDs_otherClusterIDs_filterDate___block_invoke;
    v55[3] = &unk_24DB5EBD0;
    v67 = a5;
    v56 = v35;
    v68 = v52;
    v57 = v22;
    v58 = v39;
    v65 = a7;
    v66 = v50;
    v59 = v18;
    v60 = v54;
    v61 = v53;
    v62 = v21;
    v63 = v49;
    v64 = v29;
    v51 = v29;
    v41 = v49;
    v42 = v39;
    v43 = v35;
    objc_msgSend(v40, "fc_array:", v55);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CB88]), "initWithFeedTransformations:", v44);
    v46 = -[NTFeedTransformationItemFeedTransformation initWithFeedItemTransformation:]([NTFeedTransformationItemFeedTransformation alloc], "initWithFeedItemTransformation:", v45);
    underlyingTransformation = v23->_underlyingTransformation;
    v23->_underlyingTransformation = (NTFeedTransforming *)v46;

    v19 = v54;
    v20 = v53;

  }
  return v23;
}

void __233__NTSectionFeedFilterTransformation_initWithTodayData_configurationManager_readArticlesFilterMethod_seenArticlesFilterMethod_minimumTimeSinceFirstSeenToFilter_supplementalFeedFilterOptions_otherArticleIDs_otherClusterIDs_filterDate___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  id v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;

  v3 = (objc_class *)MEMORY[0x24BE6CBC0];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = *(_DWORD *)(a1 + 120);
  if (v6 == 1)
    v7 = 1;
  else
    v7 = 2 * (v6 == 0);
  v21 = (id)objc_msgSend(v5, "initWithFilterMethod:consumedArticleItems:minimumTimeSinceFirstConsumedToFilter:filterDate:articleIDProvider:dateOfArticleIDConsumptionProvider:maxVersionConsumedProvider:dateOfMaxVersionConsumptionProvider:", v7, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), &__block_literal_global_5, &__block_literal_global_18, &__block_literal_global_21, 0.0, &__block_literal_global_22);
  objc_msgSend(v4, "addObject:", v21);
  v8 = objc_alloc(MEMORY[0x24BE6CBC0]);
  v9 = *(_DWORD *)(a1 + 124);
  if (v9 == 1)
    v10 = 1;
  else
    v10 = 2 * (v9 == 2);
  v11 = (void *)objc_msgSend(v8, "initWithFilterMethod:consumedArticleItems:minimumTimeSinceFirstConsumedToFilter:filterDate:articleIDProvider:dateOfArticleIDConsumptionProvider:maxVersionConsumedProvider:dateOfMaxVersionConsumptionProvider:", v10, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), &__block_literal_global_24, &__block_literal_global_26, &__block_literal_global_28, *(double *)(a1 + 104), &__block_literal_global_29);
  objc_msgSend(v4, "addObject:", v11);
  v12 = *(_QWORD *)(a1 + 112) | 0x31ALL;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CCA0]), "initWithPurchaseProvider:bundleSubscriptionProvider:configurationManager:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v14 = (void *)MEMORY[0x24BE6CB90];
  v15 = *(_QWORD *)(a1 + 72);
  v16 = *(_QWORD *)(a1 + 80);
  v17 = *(_QWORD *)(a1 + 88);
  v18 = *(_QWORD *)(a1 + 96);
  objc_msgSend(*(id *)(a1 + 56), "bundleSubscription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "transformationWithFilterOptions:otherArticleIDs:otherClusterIDs:subscribedTagIDs:mutedTagIDs:readingHistoryItems:playlistArticleIDs:downloadedArticleIDs:briefingsTagID:paidAccessChecker:bundleSubscription:", v12, v15, v16, v17, v18, 0, 0, 0, 0, v13, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v20);

}

uint64_t __233__NTSectionFeedFilterTransformation_initWithTodayData_configurationManager_readArticlesFilterMethod_seenArticlesFilterMethod_minimumTimeSinceFirstSeenToFilter_supplementalFeedFilterOptions_otherArticleIDs_otherClusterIDs_filterDate___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "articleID");
}

uint64_t __233__NTSectionFeedFilterTransformation_initWithTodayData_configurationManager_readArticlesFilterMethod_seenArticlesFilterMethod_minimumTimeSinceFirstSeenToFilter_supplementalFeedFilterOptions_otherArticleIDs_otherClusterIDs_filterDate___block_invoke_3()
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
}

uint64_t __233__NTSectionFeedFilterTransformation_initWithTodayData_configurationManager_readArticlesFilterMethod_seenArticlesFilterMethod_minimumTimeSinceFirstSeenToFilter_supplementalFeedFilterOptions_otherArticleIDs_otherClusterIDs_filterDate___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "maxVersionRead");
}

uint64_t __233__NTSectionFeedFilterTransformation_initWithTodayData_configurationManager_readArticlesFilterMethod_seenArticlesFilterMethod_minimumTimeSinceFirstSeenToFilter_supplementalFeedFilterOptions_otherArticleIDs_otherClusterIDs_filterDate___block_invoke_5()
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
}

uint64_t __233__NTSectionFeedFilterTransformation_initWithTodayData_configurationManager_readArticlesFilterMethod_seenArticlesFilterMethod_minimumTimeSinceFirstSeenToFilter_supplementalFeedFilterOptions_otherArticleIDs_otherClusterIDs_filterDate___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "articleID");
}

uint64_t __233__NTSectionFeedFilterTransformation_initWithTodayData_configurationManager_readArticlesFilterMethod_seenArticlesFilterMethod_minimumTimeSinceFirstSeenToFilter_supplementalFeedFilterOptions_otherArticleIDs_otherClusterIDs_filterDate___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "firstSeenAt");
}

uint64_t __233__NTSectionFeedFilterTransformation_initWithTodayData_configurationManager_readArticlesFilterMethod_seenArticlesFilterMethod_minimumTimeSinceFirstSeenToFilter_supplementalFeedFilterOptions_otherArticleIDs_otherClusterIDs_filterDate___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "maxVersionSeen");
}

uint64_t __233__NTSectionFeedFilterTransformation_initWithTodayData_configurationManager_readArticlesFilterMethod_seenArticlesFilterMethod_minimumTimeSinceFirstSeenToFilter_supplementalFeedFilterOptions_otherArticleIDs_otherClusterIDs_filterDate___block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "firstSeenAtOfMaxVersionSeen");
}

- (id)transformFeedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[4];

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTSectionFeedFilterTransformation transformFeedItems:].cold.1();
  objc_msgSend(v4, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_37);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTSectionFeedFilterTransformation underlyingTransformation](self, "underlyingTransformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transformFeedItems:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __56__NTSectionFeedFilterTransformation_transformFeedItems___block_invoke_2;
  v14[3] = &unk_24DB5EC38;
  v17 = v18;
  v9 = v7;
  v15 = v9;
  v10 = v8;
  v16 = v10;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v14);
  v11 = v16;
  v12 = v10;

  _Block_object_dispose(v18, 8);
  return v12;
}

- (void)initWithTodayData:configurationManager:readArticlesFilterMethod:seenArticlesFilterMethod:minimumTimeSinceFirstSeenToFilter:supplementalFeedFilterOptions:otherArticleIDs:otherClusterIDs:filterDate:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"filterDate", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithTodayData:configurationManager:readArticlesFilterMethod:seenArticlesFilterMethod:minimumTimeSinceFirstSeenToFilter:supplementalFeedFilterOptions:otherArticleIDs:otherClusterIDs:filterDate:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"otherClusterIDs", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithTodayData:configurationManager:readArticlesFilterMethod:seenArticlesFilterMethod:minimumTimeSinceFirstSeenToFilter:supplementalFeedFilterOptions:otherArticleIDs:otherClusterIDs:filterDate:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"otherArticleIDs", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithTodayData:configurationManager:readArticlesFilterMethod:seenArticlesFilterMethod:minimumTimeSinceFirstSeenToFilter:supplementalFeedFilterOptions:otherArticleIDs:otherClusterIDs:filterDate:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"configurationManager", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)transformFeedItems:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"feedItems", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
