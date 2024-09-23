@implementation NTTagSectionFetchDescriptor

- (NTTagSectionFetchDescriptor)init
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
    v8 = "-[NTTagSectionFetchDescriptor init]";
    v9 = 2080;
    v10 = "NTTagSectionFetchDescriptor.m";
    v11 = 1024;
    v12 = 27;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTTagSectionFetchDescriptor init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTTagSectionFetchDescriptor)initWithTagConfiguration:(id)a3 appConfiguration:(id)a4 purchasedTagIDs:(id)a5 bundleSubscriptionProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NTTagSectionFetchDescriptor *v14;
  void *v15;
  NTCatchUpOperationTagRequest *v16;
  NTCatchUpOperationTagRequest *tagRequest;
  void *v18;
  NTCatchUpOperationForYouRequest *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NTCatchUpOperationForYouRequest *v25;
  uint64_t v26;
  NTCatchUpOperationForYouRequest *forYouRequest;
  id v29;
  objc_super v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTTagSectionFetchDescriptor initWithTagConfiguration:appConfiguration:purchasedTagIDs:bundleSubscriptionProvider:].cold.2();
    if (v11)
      goto LABEL_6;
  }
  else if (v11)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTagSectionFetchDescriptor initWithTagConfiguration:appConfiguration:purchasedTagIDs:bundleSubscriptionProvider:].cold.1();
LABEL_6:
  v30.receiver = self;
  v30.super_class = (Class)NTTagSectionFetchDescriptor;
  v14 = -[NTTagSectionFetchDescriptor init](&v30, sel_init);
  if (v14)
  {
    objc_msgSend(v10, "tagID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[NTCatchUpOperationTagRequest initWithTagTodaySectionSpecificConfig:tagID:]([NTCatchUpOperationTagRequest alloc], "initWithTagTodaySectionSpecificConfig:tagID:", v10, v15);
    tagRequest = v14->_tagRequest;
    v14->_tagRequest = v16;

    v18 = (void *)objc_opt_new();
    objc_msgSend(v18, "setCutoffTime:", objc_msgSend(v10, "cutoffTime"));
    objc_msgSend(v18, "setHeadlinesPerFeedFetchCount:", objc_msgSend(v10, "headlinesPerFeedFetchCount"));
    objc_msgSend(v18, "setFeedMaxCount:", -1);
    objc_msgSend(v18, "setSubscriptionsFetchCount:", 1);
    objc_msgSend(v18, "setFetchingBin:", objc_msgSend(v10, "fetchingBin"));
    v29 = v11;
    v19 = [NTCatchUpOperationForYouRequest alloc];
    v20 = v13;
    v21 = v12;
    v22 = (void *)objc_opt_new();
    v23 = (void *)objc_opt_new();
    v31[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v19;
    v11 = v29;
    v26 = -[NTCatchUpOperationForYouRequest initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:](v25, "initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:", v18, v29, 0, v22, 0, v23, v21, v24, v20, v15);
    forYouRequest = v14->_forYouRequest;
    v14->_forYouRequest = (NTCatchUpOperationForYouRequest *)v26;

    v12 = v21;
    v13 = v20;

  }
  return v14;
}

- (void)configureCatchUpOperationWithFetchRequest:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NTTagSectionFetchDescriptor forYouRequest](self, "forYouRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setForYouRequest:", v4);

  objc_msgSend(v5, "setForYouEnabled:", 1);
}

- (id)assembleResultsWithCatchUpOperation:(id)a3
{
  return (id)objc_msgSend(a3, "forYouResults");
}

- (id)incrementalSortTransformationWithFeedPersonalizer:(id)a3
{
  void *v3;
  NTFeedTransformationItemFeedTransformation *v4;

  objc_msgSend(MEMORY[0x24BE6CBB0], "transformationWithPersonalizer:configurationSet:", a3, 17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NTFeedTransformationItemFeedTransformation initWithFeedItemTransformation:]([NTFeedTransformationItemFeedTransformation alloc], "initWithFeedItemTransformation:", v3);

  return v4;
}

- (id)incrementalLimitTransformationWithFeedPersonalizer:(id)a3 limit:(unint64_t)a4 priorFeedItems:(id)a5
{
  id v7;
  void *v8;
  NTFeedTransformationIncrementalPersonalizedDiversifiedLimit *v9;
  NTFeedTransformationItemFeedTransformation *v10;

  v7 = a3;
  objc_msgSend(a5, "fc_arrayByTransformingWithBlock:", &__block_literal_global_10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NTFeedTransformationIncrementalPersonalizedDiversifiedLimit initWithFunctionProvider:limit:priorFeedItems:]([NTFeedTransformationIncrementalPersonalizedDiversifiedLimit alloc], "initWithFunctionProvider:limit:priorFeedItems:", v7, a4, v8);

  v10 = -[NTFeedTransformationItemFeedTransformation initWithFeedItemTransformation:]([NTFeedTransformationItemFeedTransformation alloc], "initWithFeedItemTransformation:", v9);
  return v10;
}

uint64_t __103__NTTagSectionFetchDescriptor_incrementalLimitTransformationWithFeedPersonalizer_limit_priorFeedItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "feedTransformationItem");
}

- (NTCatchUpOperationTagRequest)tagRequest
{
  return self->_tagRequest;
}

- (void)setTagRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NTCatchUpOperationForYouRequest)forYouRequest
{
  return self->_forYouRequest;
}

- (void)setForYouRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forYouRequest, 0);
  objc_storeStrong((id *)&self->_tagRequest, 0);
}

- (void)initWithTagConfiguration:appConfiguration:purchasedTagIDs:bundleSubscriptionProvider:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"appConfiguration", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithTagConfiguration:appConfiguration:purchasedTagIDs:bundleSubscriptionProvider:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"tagConfiguration", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
