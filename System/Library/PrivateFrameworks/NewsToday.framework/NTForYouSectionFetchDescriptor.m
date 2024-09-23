@implementation NTForYouSectionFetchDescriptor

- (NTForYouSectionFetchDescriptor)init
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
    v8 = "-[NTForYouSectionFetchDescriptor init]";
    v9 = 2080;
    v10 = "NTForYouSectionFetchDescriptor.m";
    v11 = 1024;
    v12 = 29;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTForYouSectionFetchDescriptor init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTForYouSectionFetchDescriptor)initWithForYouConfiguration:(id)a3 appConfiguration:(id)a4 topStoriesChannelID:(id)a5 hiddenFeedIDs:(id)a6 allowPaidBundleFeed:(BOOL)a7 mutedTagIDs:(id)a8 purchasedTagIDs:(id)a9 rankedAllSubscribedTagIDs:(id)a10 bundleSubscriptionProvider:(id)a11
{
  _BOOL8 v12;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NTForYouSectionFetchDescriptor *v24;
  NTCatchUpOperationForYouRequest *v25;
  NTCatchUpOperationForYouRequest *forYouRequest;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NTCatchUpOperationArticleIDsRequest *localNewsRequest;
  id v33;
  objc_super v34;
  _QWORD v35[2];

  v12 = a7;
  v35[1] = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = a4;
  v33 = a5;
  v19 = a6;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  if (!v17 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTForYouSectionFetchDescriptor initWithForYouConfiguration:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:].cold.6();
    if (v18)
      goto LABEL_6;
  }
  else if (v18)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTForYouSectionFetchDescriptor initWithForYouConfiguration:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:].cold.5();
LABEL_6:
  if (!v19 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTForYouSectionFetchDescriptor initWithForYouConfiguration:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:].cold.4();
    if (v20)
      goto LABEL_11;
  }
  else if (v20)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTForYouSectionFetchDescriptor initWithForYouConfiguration:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:].cold.3();
LABEL_11:
  if (!v21 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTForYouSectionFetchDescriptor initWithForYouConfiguration:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:].cold.2();
    if (v22)
      goto LABEL_16;
  }
  else if (v22)
  {
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTForYouSectionFetchDescriptor initWithForYouConfiguration:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:].cold.1();
LABEL_16:
  v34.receiver = self;
  v34.super_class = (Class)NTForYouSectionFetchDescriptor;
  v24 = -[NTForYouSectionFetchDescriptor init](&v34, sel_init);
  if (v24)
  {
    v25 = -[NTCatchUpOperationForYouRequest initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:]([NTCatchUpOperationForYouRequest alloc], "initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:", v17, v18, v33, v19, v12, v20, v21, v22, v23, &stru_24DB606B8);
    forYouRequest = v24->_forYouRequest;
    v24->_forYouRequest = v25;

    objc_msgSend(v17, "localNewsPromotedArticle");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    if (v27)
    {
      v35[0] = v27;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = (void *)MEMORY[0x24BDBD1A8];
    }
    NTArticleIDsRequestWithArticles(v29);
    v30 = objc_claimAutoreleasedReturnValue();
    localNewsRequest = v24->_localNewsRequest;
    v24->_localNewsRequest = (NTCatchUpOperationArticleIDsRequest *)v30;

    v24->_localNewsPromotionIndex = objc_msgSend(v17, "localNewsPromotionIndex");
  }

  return v24;
}

- (void)configureCatchUpOperationWithFetchRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NTForYouSectionFetchDescriptor forYouRequest](self, "forYouRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForYouRequest:", v5);

  objc_msgSend(v4, "setForYouEnabled:", 1);
  -[NTForYouSectionFetchDescriptor localNewsRequest](self, "localNewsRequest");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addArticleIDsRequest:", v6);

}

- (id)assembleResultsWithCatchUpOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "resultsByArticleIDsRequestID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTForYouSectionFetchDescriptor localNewsRequest](self, "localNewsRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "forYouResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "resultsByCombiningWithResults:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)incrementalSortTransformationWithFeedPersonalizer:(id)a3
{
  void *v4;
  NTFeedTransformationItemFeedTransformation *v5;
  NTLocalNewsPromotionTransformation *v6;
  void *v7;
  void *v8;
  void *v9;
  NTLocalNewsPromotionTransformation *v10;

  objc_msgSend(MEMORY[0x24BE6CBB0], "transformationWithPersonalizer:configurationSet:", a3, 16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NTFeedTransformationItemFeedTransformation initWithFeedItemTransformation:]([NTFeedTransformationItemFeedTransformation alloc], "initWithFeedItemTransformation:", v4);
  v6 = [NTLocalNewsPromotionTransformation alloc];
  -[NTForYouSectionFetchDescriptor localNewsRequest](self, "localNewsRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "articleIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NTLocalNewsPromotionTransformation initWithLocalNewsPromotedArticleID:localNewsPromotionIndex:baseTransformation:](v6, "initWithLocalNewsPromotedArticleID:localNewsPromotionIndex:baseTransformation:", v9, -[NTForYouSectionFetchDescriptor localNewsPromotionIndex](self, "localNewsPromotionIndex"), v5);

  return v10;
}

- (id)incrementalLimitTransformationWithFeedPersonalizer:(id)a3 limit:(unint64_t)a4 priorFeedItems:(id)a5
{
  id v7;
  void *v8;
  NTFeedTransformationIncrementalPersonalizedDiversifiedLimit *v9;
  NTFeedTransformationItemFeedTransformation *v10;

  v7 = a3;
  objc_msgSend(a5, "fc_arrayByTransformingWithBlock:", &__block_literal_global_2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NTFeedTransformationIncrementalPersonalizedDiversifiedLimit initWithFunctionProvider:limit:priorFeedItems:]([NTFeedTransformationIncrementalPersonalizedDiversifiedLimit alloc], "initWithFunctionProvider:limit:priorFeedItems:", v7, a4, v8);

  v10 = -[NTFeedTransformationItemFeedTransformation initWithFeedItemTransformation:]([NTFeedTransformationItemFeedTransformation alloc], "initWithFeedItemTransformation:", v9);
  return v10;
}

uint64_t __106__NTForYouSectionFetchDescriptor_incrementalLimitTransformationWithFeedPersonalizer_limit_priorFeedItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "feedTransformationItem");
}

- (NTCatchUpOperationForYouRequest)forYouRequest
{
  return self->_forYouRequest;
}

- (void)setForYouRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NTCatchUpOperationArticleIDsRequest)localNewsRequest
{
  return self->_localNewsRequest;
}

- (void)setLocalNewsRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)localNewsPromotionIndex
{
  return self->_localNewsPromotionIndex;
}

- (void)setLocalNewsPromotionIndex:(unint64_t)a3
{
  self->_localNewsPromotionIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localNewsRequest, 0);
  objc_storeStrong((id *)&self->_forYouRequest, 0);
}

- (void)initWithForYouConfiguration:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"rankedAllSubscribedTagIDs", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithForYouConfiguration:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"purchasedTagIDs", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithForYouConfiguration:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"mutedTagIDs", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithForYouConfiguration:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"hiddenFeedIDs", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithForYouConfiguration:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:.cold.5()
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

- (void)initWithForYouConfiguration:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"forYouConfiguration", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
