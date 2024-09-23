@implementation NTCatchUpOperationForYouRequest

- (NTCatchUpOperationForYouRequest)init
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
    v8 = "-[NTCatchUpOperationForYouRequest init]";
    v9 = 2080;
    v10 = "NTCatchUpOperationRequest.m";
    v11 = 1024;
    v12 = 15;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTCatchUpOperationForYouRequest init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTCatchUpOperationForYouRequest)initWithForYouTodaySectionSpecificConfig:(id)a3 appConfiguration:(id)a4 topStoriesChannelID:(id)a5 hiddenFeedIDs:(id)a6 allowPaidBundleFeed:(BOOL)a7 mutedTagIDs:(id)a8 purchasedTagIDs:(id)a9 rankedAllSubscribedTagIDs:(id)a10 bundleSubscriptionProvider:(id)a11 throttlingIdentifier:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NTCatchUpOperationForYouRequest *v25;
  uint64_t v26;
  NSString *topStoriesChannelID;
  uint64_t v28;
  NSSet *hiddenFeedIDs;
  uint64_t v30;
  NSSet *mutedTagIDs;
  uint64_t v32;
  NSSet *purchasedTagIDs;
  uint64_t v34;
  NSArray *rankedSubscribedTagIDs;
  int v36;
  uint64_t v37;
  uint64_t v38;
  NSString *throttlingIdentifier;
  uint64_t v40;
  double v41;
  id v44;
  objc_super v45;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v44 = a11;
  v24 = a12;
  if (!v17 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTCatchUpOperationForYouRequest initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:].cold.6();
    if (v20)
      goto LABEL_6;
  }
  else if (v20)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTCatchUpOperationForYouRequest initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:].cold.5();
LABEL_6:
  if (!v21 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTCatchUpOperationForYouRequest initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:].cold.4();
    if (v22)
      goto LABEL_11;
  }
  else if (v22)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTCatchUpOperationForYouRequest initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:].cold.3();
LABEL_11:
  if (!v23 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTCatchUpOperationForYouRequest initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:].cold.2();
    if (v24)
      goto LABEL_16;
  }
  else if (v24)
  {
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTCatchUpOperationForYouRequest initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:].cold.1();
LABEL_16:
  v45.receiver = self;
  v45.super_class = (Class)NTCatchUpOperationForYouRequest;
  v25 = -[NTCatchUpOperationForYouRequest init](&v45, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v19, "copy");
    topStoriesChannelID = v25->_topStoriesChannelID;
    v25->_topStoriesChannelID = (NSString *)v26;

    v28 = objc_msgSend(v20, "copy");
    hiddenFeedIDs = v25->_hiddenFeedIDs;
    v25->_hiddenFeedIDs = (NSSet *)v28;

    v25->_allowPaidBundleFeed = a7;
    v30 = objc_msgSend(v21, "copy");
    mutedTagIDs = v25->_mutedTagIDs;
    v25->_mutedTagIDs = (NSSet *)v30;

    v32 = objc_msgSend(v22, "copy");
    purchasedTagIDs = v25->_purchasedTagIDs;
    v25->_purchasedTagIDs = (NSSet *)v32;

    objc_msgSend(v23, "fc_subarrayWithMaxCount:", objc_msgSend(v17, "subscriptionsFetchCount"));
    v34 = objc_claimAutoreleasedReturnValue();
    rankedSubscribedTagIDs = v25->_rankedSubscribedTagIDs;
    v25->_rankedSubscribedTagIDs = (NSArray *)v34;

    objc_storeStrong((id *)&v25->_bundleSubscriptionProvider, a11);
    v25->_cutoffTime = objc_msgSend(v17, "cutoffTime");
    v25->_headlinesPerFeedFetchCount = objc_msgSend(v17, "headlinesPerFeedFetchCount");
    v25->_feedMaxCount = objc_msgSend(v17, "feedMaxCount");
    v36 = objc_msgSend(v17, "fetchingBin");
    v37 = v36 == 1;
    if (v36 == 2)
      v37 = 2;
    v25->_fetchingBin = v37;
    v38 = objc_msgSend(v24, "copy");
    throttlingIdentifier = v25->_throttlingIdentifier;
    v25->_throttlingIdentifier = (NSString *)v38;

    v40 = objc_msgSend(v18, "widgetForYouBackgroundMinimumUpdateInterval");
    if (objc_msgSend(v17, "hasMinimumUpdateInterval"))
      v41 = (double)(unint64_t)objc_msgSend(v17, "minimumUpdateInterval");
    else
      v41 = (double)v40;
    v25->_minimumUpdateInterval = v41;
  }

  return v25;
}

- (NSString)topStoriesChannelID
{
  return self->_topStoriesChannelID;
}

- (NSSet)hiddenFeedIDs
{
  return self->_hiddenFeedIDs;
}

- (BOOL)allowPaidBundleFeed
{
  return self->_allowPaidBundleFeed;
}

- (NSSet)mutedTagIDs
{
  return self->_mutedTagIDs;
}

- (NSSet)purchasedTagIDs
{
  return self->_purchasedTagIDs;
}

- (NSArray)rankedSubscribedTagIDs
{
  return self->_rankedSubscribedTagIDs;
}

- (FCBundleSubscriptionProviderType)bundleSubscriptionProvider
{
  return self->_bundleSubscriptionProvider;
}

- (int64_t)cutoffTime
{
  return self->_cutoffTime;
}

- (unint64_t)headlinesPerFeedFetchCount
{
  return self->_headlinesPerFeedFetchCount;
}

- (unint64_t)feedMaxCount
{
  return self->_feedMaxCount;
}

- (int64_t)fetchingBin
{
  return self->_fetchingBin;
}

- (NSString)throttlingIdentifier
{
  return self->_throttlingIdentifier;
}

- (double)minimumUpdateInterval
{
  return self->_minimumUpdateInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttlingIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleSubscriptionProvider, 0);
  objc_storeStrong((id *)&self->_rankedSubscribedTagIDs, 0);
  objc_storeStrong((id *)&self->_purchasedTagIDs, 0);
  objc_storeStrong((id *)&self->_mutedTagIDs, 0);
  objc_storeStrong((id *)&self->_hiddenFeedIDs, 0);
  objc_storeStrong((id *)&self->_topStoriesChannelID, 0);
}

- (void)initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"throttlingIdentifier", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:.cold.2()
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

- (void)initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:.cold.3()
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

- (void)initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:.cold.4()
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

- (void)initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:.cold.5()
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

- (void)initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"forYouTodaySectionSpecificConfig", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
