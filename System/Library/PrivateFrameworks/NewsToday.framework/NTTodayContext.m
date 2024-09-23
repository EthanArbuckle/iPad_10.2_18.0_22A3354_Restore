@implementation NTTodayContext

void __65__NTTodayContext_fetchLatestResultsWithOperationInfo_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "todayResultsSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __65__NTTodayContext_fetchLatestResultsWithOperationInfo_completion___block_invoke_2;
  v4[3] = &unk_24DB5F810;
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "fetchLatestResultsWithOperationInfo:completion:", v3, v4);

}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

void __65__NTTodayContext_fetchLatestResultsWithOperationInfo_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v13 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v11)
    NTPossiblySimulateCrashWithError(v11);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchLatestResultsWithOperationInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTTodayContext fetchLatestResultsWithOperationInfo:completion:].cold.2();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayContext fetchLatestResultsWithOperationInfo:completion:].cold.1();
LABEL_6:
  -[NTTodayContext accessQueue](self, "accessQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__NTTodayContext_fetchLatestResultsWithOperationInfo_completion___block_invoke;
  block[3] = &unk_24DB5F838;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (NTSourceAvailabilityManager)sourceAvailabilityManager
{
  return self->_sourceAvailabilityManager;
}

- (id)placeholderResultsWithOperationInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[NTTodayContext sourceAvailabilityManager](self, "sourceAvailabilityManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredSourceFetchDescriptorClass");
  v6 = (void *)objc_opt_new();

  -[NTTodayContext contentContext](self, "contentContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTTodayResultsSource placeholderResultsWithFetchDescriptor:contentContext:operationInfo:](NTTodayResultsSource, "placeholderResultsWithFetchDescriptor:contentContext:operationInfo:", v6, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NTTodayResultsSource)todayResultsSource
{
  return self->_todayResultsSource;
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (NTTodayContext)init
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
    v8 = "-[NTTodayContext init]";
    v9 = 2080;
    v10 = "NTTodayContext.m";
    v11 = 1024;
    v12 = 93;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTTodayContext init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTTodayContext)initWithContentContext:(id)a3 feedPersonalizerFactory:(id)a4 processVariant:(unint64_t)a5 accessQueue:(id)a6 fetchQueue:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NTTodayContext *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  FCWritablePrivateDataStorage *writablePrivateDataStorage;
  uint64_t v27;
  FCReadablePrivateDataStorage *readablePrivateDataStorage;
  uint64_t v29;
  NTTodayContext *v30;
  id v32;
  _QWORD v33[4];
  NTTodayContext *v34;
  _QWORD block[4];
  dispatch_queue_t v36;
  NTTodayContext *v37;
  objc_super v38;
  uint64_t v39;
  _QWORD v40[3];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (!v12 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTTodayContext initWithContentContext:feedPersonalizerFactory:processVariant:accessQueue:fetchQueue:].cold.4();
    if (v13)
      goto LABEL_6;
  }
  else if (v13)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayContext initWithContentContext:feedPersonalizerFactory:processVariant:accessQueue:fetchQueue:].cold.3();
LABEL_6:
  if (!v14 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTTodayContext initWithContentContext:feedPersonalizerFactory:processVariant:accessQueue:fetchQueue:].cold.2();
    if (v15)
      goto LABEL_11;
  }
  else if (v15)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayContext initWithContentContext:feedPersonalizerFactory:processVariant:accessQueue:fetchQueue:].cold.1();
LABEL_11:
  v38.receiver = self;
  v38.super_class = (Class)NTTodayContext;
  v16 = -[NTTodayContext init](&v38, sel_init);
  if (v16)
  {
    NewsCoreUserDefaults();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = *MEMORY[0x24BE6CA70];
    v40[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v32 = v12;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "registerDefaults:", v18);

    objc_storeStrong((id *)&v16->_contentContext, a3);
    objc_storeStrong((id *)&v16->_feedPersonalizerFactory, a4);
    v19 = objc_alloc(MEMORY[0x24BE6CBE0]);
    FCURLForTodayPrivateDataTransactionQueue();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithFileURL:", v20);

    v22 = objc_alloc(MEMORY[0x24BE6CBD0]);
    FCURLForTodayDropbox();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithFileURL:", v23);

    v25 = objc_msgSend(objc_alloc(MEMORY[0x24BE6CD38]), "initWithDropbox:transactionQueue:", v24, v21);
    writablePrivateDataStorage = v16->_writablePrivateDataStorage;
    v16->_writablePrivateDataStorage = (FCWritablePrivateDataStorage *)v25;

    v27 = objc_msgSend(objc_alloc(MEMORY[0x24BE6CCD8]), "initWithDropbox:transactionQueue:", v24, v21);
    readablePrivateDataStorage = v16->_readablePrivateDataStorage;
    v16->_readablePrivateDataStorage = (FCReadablePrivateDataStorage *)v27;

    objc_storeStrong((id *)&v16->_accessQueue, a6);
    objc_storeStrong((id *)&v16->_fetchQueue, a7);
    v29 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __103__NTTodayContext_initWithContentContext_feedPersonalizerFactory_processVariant_accessQueue_fetchQueue___block_invoke;
    block[3] = &unk_24DB5F798;
    v36 = (dispatch_queue_t)v14;
    v30 = v16;
    v37 = v30;
    v12 = v32;
    dispatch_sync(v36, block);
    v33[0] = v29;
    v33[1] = 3221225472;
    v33[2] = __103__NTTodayContext_initWithContentContext_feedPersonalizerFactory_processVariant_accessQueue_fetchQueue___block_invoke_4;
    v33[3] = &unk_24DB5E300;
    v34 = v30;
    dispatch_async(MEMORY[0x24BDAC9B8], v33);

  }
  return v16;
}

void __103__NTTodayContext_initWithContentContext_feedPersonalizerFactory_processVariant_accessQueue_fetchQueue___block_invoke(uint64_t a1)
{
  void *v2;
  NTNewsSourceAvailabilityEntry *v3;
  void *v4;
  void *v5;
  NTSourceAvailabilityManager *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  objc_msgSend(MEMORY[0x24BE6CC58], "sharedNetworkReachability");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[NTNewsSourceAvailabilityEntry initWithNetworkReachability:queue:]([NTNewsSourceAvailabilityEntry alloc], "initWithNetworkReachability:queue:", v2, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, *(id *)(a1 + 40));
  v6 = -[NTSourceAvailabilityManager initWithAvailabilityEntriesInPreferredOrder:queue:]([NTSourceAvailabilityManager alloc], "initWithAvailabilityEntriesInPreferredOrder:queue:", v5, *(_QWORD *)(a1 + 32));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 48), v6);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __103__NTTodayContext_initWithContentContext_feedPersonalizerFactory_processVariant_accessQueue_fetchQueue___block_invoke_2;
  v7[3] = &unk_24DB5F6C8;
  v8 = *(id *)(a1 + 32);
  objc_copyWeak(&v9, &location);
  -[NTSourceAvailabilityManager setPreferredSourceChangedNotificationBlock:](v6, "setPreferredSourceChangedNotificationBlock:", v7);
  objc_msgSend(*(id *)(a1 + 40), "_setupTodayResultsSource");
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __103__NTTodayContext_initWithContentContext_feedPersonalizerFactory_processVariant_accessQueue_fetchQueue___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  FCPerformIfNonNil();

}

void __103__NTTodayContext_initWithContentContext_feedPersonalizerFactory_processVariant_accessQueue_fetchQueue___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void (**v3)(void);
  id v4;

  v4 = a2;
  objc_msgSend(v4, "_setupTodayResultsSource");
  objc_msgSend(v4, "newResultsHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v4, "newResultsHandler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

void __103__NTTodayContext_initWithContentContext_feedPersonalizerFactory_processVariant_accessQueue_fetchQueue___block_invoke_4(uint64_t a1)
{
  id v2;

  v2 = (id)objc_opt_new();
  objc_msgSend(v2, "addObserver:", *(_QWORD *)(a1 + 32));

}

- (void)networkReachabilityDidChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  if (objc_msgSend(a3, "isNetworkReachable"))
  {
    -[NTTodayContext accessQueue](self, "accessQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__NTTodayContext_networkReachabilityDidChange___block_invoke;
    block[3] = &unk_24DB5E300;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

void __47__NTTodayContext_networkReachabilityDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "newResultsHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "newResultsHandler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

- (void)fetchModuleDescriptorsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayContext fetchModuleDescriptorsWithCompletion:].cold.1();
  -[NTTodayContext accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__NTTodayContext_fetchModuleDescriptorsWithCompletion___block_invoke;
  v7[3] = &unk_24DB5F7E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __55__NTTodayContext_fetchModuleDescriptorsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "todayResultsSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__NTTodayContext_fetchModuleDescriptorsWithCompletion___block_invoke_2;
  v3[3] = &unk_24DB5F7C0;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "fetchModuleDescriptorsWithCompletion:", v3);

}

void __55__NTTodayContext_fetchModuleDescriptorsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
    NTPossiblySimulateCrashWithError(v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)writeUserDidSeeHeadlinesWithAnalyticsElements:(id)a3 atDate:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTTodayContext writeUserDidSeeHeadlinesWithAnalyticsElements:atDate:withCompletion:].cold.2();
    if (v9)
      goto LABEL_6;
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayContext writeUserDidSeeHeadlinesWithAnalyticsElements:atDate:withCompletion:].cold.1();
LABEL_6:
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __86__NTTodayContext_writeUserDidSeeHeadlinesWithAnalyticsElements_atDate_withCompletion___block_invoke;
  v14[3] = &unk_24DB5F860;
  v15 = v9;
  v11 = v9;
  objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTTodayContext writablePrivateDataStorage](self, "writablePrivateDataStorage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "writeSeenHistoryItems:withCompletion:", v12, v10);

}

id __86__NTTodayContext_writeUserDidSeeHeadlinesWithAnalyticsElements_atDate_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (objc_msgSend(v3, "needsSeenStateTracking"))
  {
    objc_opt_class();
    FCCheckedDynamicCast();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_new();
    objc_msgSend(v4, "articleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setArticleID:", v6);

    objc_msgSend(v5, "setMaxVersionSeen:", objc_msgSend(v4, "articleVersion"));
    objc_msgSend(v5, "setFirstSeenAt:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v5, "setFirstSeenAtOfMaxVersionSeen:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)writeUserDidReadHeadlineWithAnalyticsElement:(id)a3 atDate:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTTodayContext writeUserDidReadHeadlineWithAnalyticsElement:atDate:withCompletion:].cold.2();
    if (v9)
      goto LABEL_6;
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTTodayContext writeUserDidReadHeadlineWithAnalyticsElement:atDate:withCompletion:].cold.1();
LABEL_6:
  v11 = (void *)objc_opt_new();
  objc_msgSend(v8, "articleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setArticleID:", v12);

  objc_msgSend(v11, "setMaxVersionRead:", objc_msgSend(v8, "articleVersion"));
  objc_msgSend(v11, "setLastVisitedAt:", v9);
  v13 = v11;
  -[NTTodayContext writablePrivateDataStorage](self, "writablePrivateDataStorage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "writeReadHistoryItem:withCompletion:", v13, v10);

}

- (void)_setupTodayResultsSource
{
  void *v3;
  NTTodayResultsSource *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NTTodayResultsSource *v9;
  NTTodayResultsSource *todayResultsSource;
  id v11;

  -[NTTodayContext sourceAvailabilityManager](self, "sourceAvailabilityManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredSourceFetchDescriptorClass");
  v11 = (id)objc_opt_new();

  v4 = [NTTodayResultsSource alloc];
  -[NTTodayContext feedPersonalizerFactory](self, "feedPersonalizerFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTTodayContext readablePrivateDataStorage](self, "readablePrivateDataStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTTodayContext contentContext](self, "contentContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTTodayContext fetchQueue](self, "fetchQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NTTodayResultsSource initWithFetchDescriptor:feedPersonalizerFactory:privateDataStorage:contentContext:fetchQueue:](v4, "initWithFetchDescriptor:feedPersonalizerFactory:privateDataStorage:contentContext:fetchQueue:", v11, v5, v6, v7, v8);
  todayResultsSource = self->_todayResultsSource;
  self->_todayResultsSource = v9;

}

- (id)newResultsHandler
{
  return self->_newResultsHandler;
}

- (void)setNewResultsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (FCFeedPersonalizerFactoryType)feedPersonalizerFactory
{
  return self->_feedPersonalizerFactory;
}

- (FCReadablePrivateDataStorage)readablePrivateDataStorage
{
  return self->_readablePrivateDataStorage;
}

- (FCWritablePrivateDataStorage)writablePrivateDataStorage
{
  return self->_writablePrivateDataStorage;
}

- (void)setTodayResultsSource:(id)a3
{
  objc_storeStrong((id *)&self->_todayResultsSource, a3);
}

- (FCAsyncSerialQueue)fetchQueue
{
  return self->_fetchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_todayResultsSource, 0);
  objc_storeStrong((id *)&self->_sourceAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_writablePrivateDataStorage, 0);
  objc_storeStrong((id *)&self->_readablePrivateDataStorage, 0);
  objc_storeStrong((id *)&self->_feedPersonalizerFactory, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong(&self->_newResultsHandler, 0);
}

- (void)initWithContentContext:feedPersonalizerFactory:processVariant:accessQueue:fetchQueue:.cold.1()
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

- (void)initWithContentContext:feedPersonalizerFactory:processVariant:accessQueue:fetchQueue:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"accessQueue", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithContentContext:feedPersonalizerFactory:processVariant:accessQueue:fetchQueue:.cold.3()
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

- (void)initWithContentContext:feedPersonalizerFactory:processVariant:accessQueue:fetchQueue:.cold.4()
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

- (void)fetchModuleDescriptorsWithCompletion:.cold.1()
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

- (void)fetchLatestResultsWithOperationInfo:completion:.cold.1()
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

- (void)fetchLatestResultsWithOperationInfo:completion:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"operationInfo", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)writeUserDidSeeHeadlinesWithAnalyticsElements:atDate:withCompletion:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)writeUserDidSeeHeadlinesWithAnalyticsElements:atDate:withCompletion:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"analyticsElements", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)writeUserDidReadHeadlineWithAnalyticsElement:atDate:withCompletion:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)writeUserDidReadHeadlineWithAnalyticsElement:atDate:withCompletion:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"analyticsElement", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
