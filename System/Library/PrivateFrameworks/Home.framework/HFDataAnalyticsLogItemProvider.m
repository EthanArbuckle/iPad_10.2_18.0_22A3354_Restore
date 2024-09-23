@implementation HFDataAnalyticsLogItemProvider

+ (BOOL)prefersNonBlockingReloads
{
  return 1;
}

- (HFDataAnalyticsLogItemProvider)initWithMediaProfileContainer:(id)a3
{
  id v6;
  HFDataAnalyticsLogItemProvider *v7;
  HFDataAnalyticsLogItemProvider *v8;
  uint64_t v9;
  NSMutableSet *logItems;
  uint64_t v11;
  NSMapTable *logEntryUniqueIdentifierToLogItemMap;
  void *v14;
  objc_super v15;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFDataAnalyticsLogItemProvider.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaProfileContainer"));

  }
  v15.receiver = self;
  v15.super_class = (Class)HFDataAnalyticsLogItemProvider;
  v7 = -[HFItemProvider init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_mediaProfileContainer, a3);
    v9 = objc_opt_new();
    logItems = v8->_logItems;
    v8->_logItems = (NSMutableSet *)v9;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v11 = objc_claimAutoreleasedReturnValue();
    logEntryUniqueIdentifierToLogItemMap = v8->_logEntryUniqueIdentifierToLogItemMap;
    v8->_logEntryUniqueIdentifierToLogItemMap = (NSMapTable *)v11;

  }
  return v8;
}

- (HFDataAnalyticsLogItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithMediaProfileContainer_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFDataAnalyticsLogItemProvider.m"), 45, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFDataAnalyticsLogItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFDataAnalyticsLogItemProvider mediaProfileContainer](self, "mediaProfileContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithMediaProfileContainer:", v5);

  return v6;
}

- (NAFuture)logFetchFuture
{
  NAFuture *logFetchFuture;
  void *v4;
  NAFuture *v5;
  NAFuture *v6;

  logFetchFuture = self->_logFetchFuture;
  if (!logFetchFuture)
  {
    -[HFDataAnalyticsLogItemProvider mediaProfileContainer](self, "mediaProfileContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_fetchLogListWithTimeout:", *(double *)&kHFDataAnalyticsFetchLogListTimeout);
    v5 = (NAFuture *)objc_claimAutoreleasedReturnValue();
    v6 = self->_logFetchFuture;
    self->_logFetchFuture = v5;

    logFetchFuture = self->_logFetchFuture;
  }
  return logFetchFuture;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  _QWORD v6[5];
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[HFDataAnalyticsLogItemProvider logFetchFuture](self, "logFetchFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__HFDataAnalyticsLogItemProvider_reloadItems__block_invoke;
  v6[3] = &unk_1EA73A878;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  objc_msgSend(v3, "flatMap:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return v4;
}

id __45__HFDataAnalyticsLogItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD aBlock[4];
  id v13;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__HFDataAnalyticsLogItemProvider_reloadItems__block_invoke_2;
  aBlock[3] = &unk_1EA73A7F0;
  v5 = (id *)(a1 + 40);
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v6 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", v3, &__block_literal_global_172, &__block_literal_global_15_12, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __45__HFDataAnalyticsLogItemProvider_reloadItems__block_invoke_5;
  v10[3] = &unk_1EA726E30;
  objc_copyWeak(&v11, v5);
  objc_msgSend(v7, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v11);

  objc_destroyWeak(&v13);
  return v8;
}

HFDataAnalyticsLogItem *__45__HFDataAnalyticsLogItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  HFDataAnalyticsLogItem *v6;
  HFDataAnalyticsLogItem *v7;
  void *v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "logEntryUniqueIdentifierToLogItemMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v3);
  v6 = (HFDataAnalyticsLogItem *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = [HFDataAnalyticsLogItem alloc];
    objc_msgSend(WeakRetained, "mediaProfileContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HFDataAnalyticsLogItem initWithMediaProfileContainer:name:](v7, "initWithMediaProfileContainer:name:", v8, v3);

  }
  return v6;
}

id __45__HFDataAnalyticsLogItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __45__HFDataAnalyticsLogItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

id __45__HFDataAnalyticsLogItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "logItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "logItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(WeakRetained, "setLogFetchFuture:", 0);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HFDataAnalyticsLogItemProvider;
  -[HFItemProvider invalidationReasons](&v5, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", CFSTR("accessory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (void)setLogFetchFuture:(id)a3
{
  objc_storeStrong((id *)&self->_logFetchFuture, a3);
}

- (NSMutableSet)logItems
{
  return self->_logItems;
}

- (NSMapTable)logEntryUniqueIdentifierToLogItemMap
{
  return self->_logEntryUniqueIdentifierToLogItemMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEntryUniqueIdentifierToLogItemMap, 0);
  objc_storeStrong((id *)&self->_logItems, 0);
  objc_storeStrong((id *)&self->_logFetchFuture, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
}

@end
