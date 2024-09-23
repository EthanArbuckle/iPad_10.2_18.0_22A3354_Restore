@implementation BMMiningTask

- (BMMiningTask)initWithDomain:(id)a3 types:(id)a4 targetTypes:(id)a5 samplingInterval:(double)a6 absoluteSupport:(unint64_t)a7 confidence:(double)a8 rulePersistBatchSize:(unint64_t)a9 miningInterval:(double)a10
{
  id v18;
  id v19;
  id v20;
  void *v21;
  BMMiningTask *v22;
  uint64_t v23;
  NSString *domain;

  v18 = a3;
  v19 = a5;
  v20 = a4;
  BMStorageURLForDomain(v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[BMMiningTask initWithStorageURL:types:targetTypes:samplingInterval:absoluteSupport:confidence:rulePersistBatchSize:miningInterval:](self, "initWithStorageURL:types:targetTypes:samplingInterval:absoluteSupport:confidence:rulePersistBatchSize:miningInterval:", v21, v20, v19, a7, a9, a6, a8, a10);

  if (v22)
  {
    v23 = objc_msgSend(v18, "copy");
    domain = v22->_domain;
    v22->_domain = (NSString *)v23;

  }
  return v22;
}

- (BMMiningTask)initWithStorageURL:(id)a3 types:(id)a4 targetTypes:(id)a5 samplingInterval:(double)a6 absoluteSupport:(unint64_t)a7 confidence:(double)a8 rulePersistBatchSize:(unint64_t)a9
{
  return -[BMMiningTask initWithStorageURL:types:targetTypes:samplingInterval:absoluteSupport:confidence:rulePersistBatchSize:miningInterval:](self, "initWithStorageURL:types:targetTypes:samplingInterval:absoluteSupport:confidence:rulePersistBatchSize:miningInterval:", a3, a4, a5, a7, a9, a6, a8, 0.0);
}

- (BMMiningTask)initWithStorageURL:(id)a3 types:(id)a4 targetTypes:(id)a5 samplingInterval:(double)a6 absoluteSupport:(unint64_t)a7 confidence:(double)a8
{
  return -[BMMiningTask initWithStorageURL:types:targetTypes:samplingInterval:absoluteSupport:confidence:rulePersistBatchSize:miningInterval:](self, "initWithStorageURL:types:targetTypes:samplingInterval:absoluteSupport:confidence:rulePersistBatchSize:miningInterval:", a3, a4, a5, a7, 500, a6, a8, 0.0);
}

- (BMMiningTask)initWithStorageURL:(id)a3 types:(id)a4 targetTypes:(id)a5 samplingInterval:(double)a6 absoluteSupport:(unint64_t)a7 confidence:(double)a8 rulePersistBatchSize:(unint64_t)a9 miningInterval:(double)a10
{
  id v18;
  id v19;
  id v20;
  BMMiningTask *v21;
  BMMiningTask *v22;
  uint64_t v23;
  NSURL *storageURL;
  BMMiningTaskConfig *v25;
  BMMiningTaskConfig *bmMiningTaskConfig;
  uint64_t v27;
  NSMutableDictionary *coreAnalyticsDict;
  objc_super v30;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v30.receiver = self;
  v30.super_class = (Class)BMMiningTask;
  v21 = -[BMMiningTask init](&v30, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_miningInterval = a10;
    v21->_completionStatus = -2;
    v23 = objc_msgSend(v18, "copy");
    storageURL = v22->_storageURL;
    v22->_storageURL = (NSURL *)v23;

    objc_storeStrong((id *)&v22->_types, a4);
    objc_storeStrong((id *)&v22->_targetTypes, a5);
    v22->_samplingInterval = a6;
    v22->_absoluteSupport = a7;
    v22->_confidence = a8;
    v22->_rulePersistBatchSize = a9;
    v22->_maxItemsetSize = 0;
    v25 = objc_alloc_init(BMMiningTaskConfig);
    bmMiningTaskConfig = v22->_bmMiningTaskConfig;
    v22->_bmMiningTaskConfig = v25;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v27 = objc_claimAutoreleasedReturnValue();
    coreAnalyticsDict = v22->_coreAnalyticsDict;
    v22->_coreAnalyticsDict = (NSMutableDictionary *)v27;

  }
  return v22;
}

- (BMMiningTask)init
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
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
  BMMiningTask *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;

  v19 = (void *)MEMORY[0x24BDBCF20];
  +[BMItemType locationIdentifier](BMItemType, "locationIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMItemType interactionPhotoScene](BMItemType, "interactionPhotoScene");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMItemType interactionPhotoContact](BMItemType, "interactionPhotoContact");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMItemType interactionRecipients](BMItemType, "interactionRecipients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMItemType interactionContentURL](BMItemType, "interactionContentURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMItemType interactionUTIType](BMItemType, "interactionUTIType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMItemType interactionSharingSourceBundleID](BMItemType, "interactionSharingSourceBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMItemType interactionTargetBundleID](BMItemType, "interactionTargetBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMItemType interactionExtractedTopicFromAttachment](BMItemType, "interactionExtractedTopicFromAttachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMItemType bundleIdOfShareExtensionOpened](BMItemType, "bundleIdOfShareExtensionOpened");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMItemType bundleIdOfHostOpenedShareExtension](BMItemType, "bundleIdOfHostOpenedShareExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithObjects:", v18, v23, v22, v2, v3, v4, v5, v6, v7, v8, v9, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDBCF20];
  +[BMItemType interactionRecipients](BMItemType, "interactionRecipients");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMItemType bundleIdOfShareExtensionOpened](BMItemType, "bundleIdOfShareExtensionOpened");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMItemType interactionTargetBundleID](BMItemType, "interactionTargetBundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithObjects:", v11, v12, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[BMBehaviorStorage defaultURL](BMBehaviorStorage, "defaultURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[BMMiningTask initWithStorageURL:types:targetTypes:samplingInterval:absoluteSupport:confidence:](self, "initWithStorageURL:types:targetTypes:samplingInterval:absoluteSupport:confidence:", v15, v20, v14, 2, 0.0, 0.1);

  return v16;
}

+ (id)supergreenMiningTask
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BMMiningTask *v9;
  void *v10;
  BMMiningTask *v11;

  v2 = (void *)MEMORY[0x24BDBCF20];
  +[BMItemType relevanceIntentHash](BMItemType, "relevanceIntentHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMItemType relevanceCoarseIntentHash](BMItemType, "relevanceCoarseIntentHash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMItemType relevanceAppActivityHash](BMItemType, "relevanceAppActivityHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMItemType relevanceCoarseAppActivityHash](BMItemType, "relevanceCoarseAppActivityHash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMItemType locationIdentifier](BMItemType, "locationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [BMMiningTask alloc];
  +[BMBehaviorStorage defaultURL](BMBehaviorStorage, "defaultURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BMMiningTask initWithStorageURL:types:targetTypes:samplingInterval:absoluteSupport:confidence:](v9, "initWithStorageURL:types:targetTypes:samplingInterval:absoluteSupport:confidence:", v10, v8, v8, 2, 600.0, 0.1);

  return v11;
}

+ (BOOL)supportsTaskSpecificEvents
{
  return 1;
}

- (void)finishWithError:(id)a3
{
  id v4;
  BMMiningTask *v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  BMLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[BMMiningTask finishWithError:].cold.1();

  -[BMMiningTask delegate](v5, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[BMMiningTask delegate](v5, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "miningTask:didError:", v5, v4);

  }
  -[BMMiningTask finishWithCompletionStatus:](v5, "finishWithCompletionStatus:", 2);
  objc_sync_exit(v5);

}

- (void)finishWithCompletionStatus:(int64_t)a3
{
  BMMiningTask *v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  double v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = self;
  objc_sync_enter(v4);
  if (!-[BMMiningTask isFinished](v4, "isFinished"))
  {
    -[BMMiningTask start](v4, "start");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceNow");
    v7 = v6;

    BMLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 134218242;
      v14 = -v7;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_2147C2000, v8, OS_LOG_TYPE_DEFAULT, "Finished behavioral mining with elapsed time %.2f seconds, completion status: %@.", (uint8_t *)&v13, 0x16u);

    }
    -[BMMiningTask setCompletionStatus:](v4, "setCompletionStatus:", a3);
    -[BMMiningTask delegate](v4, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[BMMiningTask delegate](v4, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "miningTaskDidFinish:", v4);

    }
  }
  objc_sync_exit(v4);

}

- (BOOL)isFinished
{
  return -[BMMiningTask completionStatus](self, "completionStatus") >= 0;
}

- (void)mine
{
  OUTLINED_FUNCTION_2(&dword_2147C2000, a1, a3, "Attempting to start mining task when it is already mining.", a5, a6, a7, a8, 0);
}

BOOL __20__BMMiningTask_mine__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  v6 = v3;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "miningTask:filteredRulesForExtractedRules:", *(_QWORD *)(a1 + 32), v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "miningTask:didExtractRules:", *(_QWORD *)(a1 + 32), v6);

  }
  v11 = *(id *)(a1 + 32);
  objc_sync_enter(v11);
  v12 = *(void **)(a1 + 40);
  v15 = 0;
  objc_msgSend(v12, "saveRules:error:", v6, &v15);
  v13 = v15;
  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v13);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v3, "count");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v6, "count");
  }

  objc_sync_exit(v11);
  return v13 != 0;
}

- (void)terminateEarly
{
  BMMiningTask *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v2 = self;
  objc_sync_enter(v2);
  BMLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_2147C2000, v3, OS_LOG_TYPE_DEFAULT, "Stopping mining task with early termination completion status.", v12, 2u);
  }

  -[BMMiningTask eventExtractor](v2, "eventExtractor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[BMMiningTask eventExtractor](v2, "eventExtractor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "terminateEarly");

  }
  -[BMMiningTask basketExtractor](v2, "basketExtractor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[BMMiningTask basketExtractor](v2, "basketExtractor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "terminateEarly");

  }
  -[BMMiningTask patternMiner](v2, "patternMiner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[BMMiningTask patternMiner](v2, "patternMiner");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "terminateEarly");

  }
  -[BMMiningTask ruleExtractor](v2, "ruleExtractor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[BMMiningTask ruleExtractor](v2, "ruleExtractor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "terminateEarly");

  }
  -[BMMiningTask finishWithCompletionStatus:](v2, "finishWithCompletionStatus:", 1);
  objc_sync_exit(v2);

}

- (BMMiningTaskDelegate)delegate
{
  return (BMMiningTaskDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)domain
{
  return self->_domain;
}

- (NSMutableDictionary)coreAnalyticsDict
{
  return self->_coreAnalyticsDict;
}

- (void)setCoreAnalyticsDict:(id)a3
{
  objc_storeStrong((id *)&self->_coreAnalyticsDict, a3);
}

- (int64_t)completionStatus
{
  return self->_completionStatus;
}

- (void)setCompletionStatus:(int64_t)a3
{
  self->_completionStatus = a3;
}

- (unint64_t)rulePersistBatchSize
{
  return self->_rulePersistBatchSize;
}

- (unint64_t)maxItemsetSize
{
  return self->_maxItemsetSize;
}

- (void)setMaxItemsetSize:(unint64_t)a3
{
  self->_maxItemsetSize = a3;
}

- (NSURL)storageURL
{
  return self->_storageURL;
}

- (double)miningInterval
{
  return self->_miningInterval;
}

- (NSDate)start
{
  return self->_start;
}

- (void)setStart:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BMEventExtractor)eventExtractor
{
  return self->_eventExtractor;
}

- (void)setEventExtractor:(id)a3
{
  objc_storeStrong((id *)&self->_eventExtractor, a3);
}

- (BMBasketExtractor)basketExtractor
{
  return self->_basketExtractor;
}

- (void)setBasketExtractor:(id)a3
{
  objc_storeStrong((id *)&self->_basketExtractor, a3);
}

- (BMPatternMiner)patternMiner
{
  return self->_patternMiner;
}

- (void)setPatternMiner:(id)a3
{
  objc_storeStrong((id *)&self->_patternMiner, a3);
}

- (BMRuleExtractor)ruleExtractor
{
  return self->_ruleExtractor;
}

- (void)setRuleExtractor:(id)a3
{
  objc_storeStrong((id *)&self->_ruleExtractor, a3);
}

- (NSSet)types
{
  return self->_types;
}

- (NSSet)targetTypes
{
  return self->_targetTypes;
}

- (double)samplingInterval
{
  return self->_samplingInterval;
}

- (unint64_t)absoluteSupport
{
  return self->_absoluteSupport;
}

- (double)confidence
{
  return self->_confidence;
}

- (BMMiningTaskConfig)bmMiningTaskConfig
{
  return self->_bmMiningTaskConfig;
}

- (void)setBmMiningTaskConfig:(id)a3
{
  objc_storeStrong((id *)&self->_bmMiningTaskConfig, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bmMiningTaskConfig, 0);
  objc_storeStrong((id *)&self->_targetTypes, 0);
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_ruleExtractor, 0);
  objc_storeStrong((id *)&self->_patternMiner, 0);
  objc_storeStrong((id *)&self->_basketExtractor, 0);
  objc_storeStrong((id *)&self->_eventExtractor, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_storageURL, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsDict, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)finishWithError:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_2147C2000, v0, OS_LOG_TYPE_ERROR, "Finished with error: %@", v1, 0xCu);
}

@end
