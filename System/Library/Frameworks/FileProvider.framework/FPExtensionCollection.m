@implementation FPExtensionCollection

- (BOOL)isCollectionValidForItem:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  BOOL v7;
  FPExtensionCollection *v8;
  FPItemID *v9;

  v4 = a3;
  -[FPExtensionCollection enumeratedItemID](self, "enumeratedItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[FPExtensionCollection item:isValidForObservedItemID:](FPExtensionCollection, "item:isValidForObservedItemID:", v4, v5);

  if (v6)
  {
    v7 = 1;
  }
  else
  {
    v8 = self;
    objc_sync_enter(v8);
    v9 = v8->_alternateID;
    objc_sync_exit(v8);

    if (v9)
    {
      v7 = +[FPExtensionCollection item:isValidForObservedItemID:](FPExtensionCollection, "item:isValidForObservedItemID:", v4, v9);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isRootItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[FPExtensionEnumerationSettings enumeratedItemID](self->_settings, "enumeratedItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[FPExtensionEnumerationSettings enumeratedURL](self->_settings, "enumeratedURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v8 = 0;
      goto LABEL_9;
    }
    -[FPExtensionEnumerationSettings enumeratedURL](self->_settings, "enumeratedURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "fp_relationshipToItemAtURL:", v9) == 1;
    goto LABEL_7;
  }
  objc_msgSend(v4, "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPExtensionEnumerationSettings enumeratedItemID](self->_settings, "enumeratedItemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v7) & 1) == 0)
  {
    objc_msgSend(v4, "formerItemID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPExtensionEnumerationSettings enumeratedItemID](self->_settings, "enumeratedItemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "isEqual:", v10);

LABEL_7:
    goto LABEL_8;
  }
  v8 = 1;
LABEL_8:

LABEL_9:
  return v8;
}

- (id)enumeratedItemID
{
  return -[FPExtensionEnumerationSettings enumeratedItemID](self->_settings, "enumeratedItemID");
}

+ (BOOL)item:(id)a3 isValidForObservedItemID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  char v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"));

  if ((v9 & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("NSFileProviderSearchContainerItemIdentifier"));

  if ((v11 & 1) != 0
    || (objc_msgSend(a1, "_item:isCollectionRootForObservedItemID:", v6, v7) & 1) != 0
    || (objc_msgSend(v7, "providerID"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "hasPrefix:", CFSTR("com.apple.Document")),
        v12,
        (v13 & 1) != 0))
  {
LABEL_5:
    v14 = 1;
  }
  else
  {
    objc_msgSend(v6, "parentItemIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqualToString:", v17))
    {
      objc_msgSend(v6, "providerDomainID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "providerDomainID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v18, "isEqualToString:", v19) & 1) != 0)
      {
        v14 = 1;
      }
      else
      {
        objc_msgSend(v6, "fp_parentDomainIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "domainIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v20, "isEqualToString:", v21);

      }
    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

+ (BOOL)_item:(id)a3 isCollectionRootForObservedItemID:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  objc_msgSend(a3, "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToItemID:", v5);

  return v7;
}

- (FPExtensionCollection)initWithSettings:(id)a3
{
  id v5;
  FPExtensionCollection *v6;
  FPExtensionCollection *v7;
  uint64_t v8;
  FPExtensionCollectionDSCopySubscriber *dsCopySubscriber;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPExtensionCollection;
  v6 = -[FPItemCollection init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    v8 = objc_opt_new();
    dsCopySubscriber = v7->_dsCopySubscriber;
    v7->_dsCopySubscriber = (FPExtensionCollectionDSCopySubscriber *)v8;

  }
  return v7;
}

id __55__FPExtensionCollection__startMonitoringDSCopyProgress__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v3 = a2;
  if (objc_msgSend(v3, "fp_isAccountedAsCopyProgress"))
  {
    objc_msgSend(v3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB30F0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[FPItemManager defaultManager](FPItemManager, "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __55__FPExtensionCollection__startMonitoringDSCopyProgress__block_invoke_3;
    v19[3] = &unk_1E444AEE0;
    v19[4] = *(_QWORD *)(a1 + 32);
    v8 = (id *)(a1 + 40);
    objc_copyWeak(&v22, v8);
    v9 = v3;
    v20 = v9;
    v10 = v5;
    v21 = v10;
    objc_msgSend(v6, "_fetchItemForURL:synchronously:skipURLValidation:completionHandler:", v10, 0, 1, v19);

    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __55__FPExtensionCollection__startMonitoringDSCopyProgress__block_invoke_32;
    v15[3] = &unk_1E444AF08;
    objc_copyWeak(&v18, v8);
    v16 = v9;
    v17 = v10;
    v11 = v10;
    v12 = (void *)MEMORY[0x1A1B00850](v15);
    v13 = (void *)MEMORY[0x1A1B00850]();

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v22);

  }
  else
  {
    v13 = &__block_literal_global_7;
  }

  return v13;
}

- (void)updateRootItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *p_super;
  NSObject *v9;
  FPExtensionCollection *v10;
  FPItemID *alternateID;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  FPExtensionCollection *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  FPItemID *v23;

  v4 = a3;
  -[FPExtensionEnumerationSettings enumeratedURL](self->_settings, "enumeratedURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FPExtensionEnumerationSettings enumeratedURL](self->_settings, "enumeratedURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fp_relativePathOf:", v7);
    p_super = objc_claimAutoreleasedReturnValue();

    if (!p_super || -[NSObject length](p_super, "length"))
    {
      fp_current_or_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[FPExtensionCollection updateRootItem:].cold.2();

      v10 = self;
      objc_sync_enter(v10);
      alternateID = v10->_alternateID;
      v10->_alternateID = 0;

      objc_sync_exit(v10);
      -[FPExtensionEnumerationSettings setNullableEnumeratedItemID:](self->_settings, "setNullableEnumeratedItemID:", 0);
      -[FPItemCollection dataSource](v10, "dataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "invalidate");

      -[FPItemCollection dataSource](v10, "dataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderErrorDomain"), -1002, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPItemCollection dataSource:wasInvalidatedWithError:](v10, "dataSource:wasInvalidatedWithError:", v13, v14);

      goto LABEL_19;
    }
    -[FPExtensionEnumerationSettings nullableEnumeratedItemID](self->_settings, "nullableEnumeratedItemID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend(v4, "itemID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPExtensionEnumerationSettings setNullableEnumeratedItemID:](self->_settings, "setNullableEnumeratedItemID:", v16);

      fp_current_or_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[FPExtensionCollection updateRootItem:].cold.3();

    }
  }
  v18 = self;
  objc_sync_enter(v18);
  if (v18->_alternateID)
  {
    objc_sync_exit(v18);
    p_super = &v18->super.super;
  }
  else
  {
    objc_msgSend(v4, "itemID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPExtensionEnumerationSettings enumeratedItemID](self->_settings, "enumeratedItemID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (v21)
      objc_msgSend(v4, "formerItemID");
    else
      objc_msgSend(v4, "itemID");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v18->_alternateID;
    v18->_alternateID = (FPItemID *)v22;

    objc_sync_exit(v18);
    fp_current_or_default_log();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
      -[FPExtensionCollection updateRootItem:].cold.1();
  }
LABEL_19:

}

- (void)stopObserving
{
  objc_super v3;

  -[FPExtensionCollection _stopMonitoringDomains](self, "_stopMonitoringDomains");
  -[FPExtensionCollectionDSCopySubscriber stopMonitoring](self->_dsCopySubscriber, "stopMonitoring");
  v3.receiver = self;
  v3.super_class = (Class)FPExtensionCollection;
  -[FPItemCollection stopObserving](&v3, sel_stopObserving);
}

- (void)startObserving
{
  objc_super v3;

  -[FPExtensionCollection _stopMonitoringDomains](self, "_stopMonitoringDomains");
  -[FPExtensionCollection _startMonitoringDSCopyProgress](self, "_startMonitoringDSCopyProgress");
  v3.receiver = self;
  v3.super_class = (Class)FPExtensionCollection;
  -[FPItemCollection startObserving](&v3, sel_startObserving);
}

- (FPExtensionEnumerationSettings)settings
{
  return (FPExtensionEnumerationSettings *)objc_getProperty(self, a2, 232, 1);
}

- (id)createDataSourceWithSortDescriptors:(id)a3
{
  void *v4;
  FPExtensionCollection *v5;
  FPItemID *alternateID;
  FPExtensionDataSource *v7;
  void *v8;
  FPExtensionDataSource *v9;

  -[FPEnumerationSettings setSortDescriptors:](self->_settings, "setSortDescriptors:", a3);
  -[FPExtensionEnumerationSettings enumeratedURL](self->_settings, "enumeratedURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FPExtensionEnumerationSettings setNullableEnumeratedItemID:](self->_settings, "setNullableEnumeratedItemID:", 0);
    v5 = self;
    objc_sync_enter(v5);
    alternateID = v5->_alternateID;
    v5->_alternateID = 0;

    objc_sync_exit(v5);
  }
  v7 = [FPExtensionDataSource alloc];
  v8 = (void *)-[FPExtensionEnumerationSettings copy](self->_settings, "copy");
  v9 = -[FPExtensionDataSource initWithEnumerationSettings:](v7, "initWithEnumerationSettings:", v8);

  return v9;
}

- (void)_stopMonitoringDomains
{
  NSObject *v3;
  id providerDomainMonitoringContext;

  -[FPItemCollection workingQueue](self, "workingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (self->_providerDomainMonitoringContext)
  {
    +[FPProviderDomain endMonitoringProviderDomainChanges:](FPProviderDomain, "endMonitoringProviderDomainChanges:");
    providerDomainMonitoringContext = self->_providerDomainMonitoringContext;
    self->_providerDomainMonitoringContext = 0;

  }
}

- (void)_startMonitoringDSCopyProgress
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A0A34000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] _startMonitoringDSCopyProgress skipped as process not entitled to query fileproviderd", v1, 2u);
}

- (id)scopedSearchQuery
{
  FPExtensionCollection *v2;
  FPItemID *v3;
  NSFileProviderSearchQuery *v4;
  void *v5;
  NSFileProviderSearchQuery *v6;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_alternateID;
  objc_sync_exit(v2);

  v4 = [NSFileProviderSearchQuery alloc];
  -[FPExtensionCollection enumeratedItemID](v2, "enumeratedItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSFileProviderSearchQuery initWithSearchScopedToItemID:alternateItemID:](v4, "initWithSearchScopedToItemID:alternateItemID:", v5, v3);

  return v6;
}

- (void)_failMonitoringWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[FPItemCollection workingQueue](self, "workingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[FPExtensionCollection _failMonitoringWithError:].cold.1((uint64_t)self, v4, v6);

  -[FPItemCollection delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "fp_unwrappedInternalError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collection:didEncounterError:", self, v8);

  }
  -[FPExtensionCollection _stopMonitoringDomains](self, "_stopMonitoringDomains");

}

- (void)_startMonitoringDomains
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] %@: wait for domain authentication", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__FPExtensionCollection__startMonitoringDomains__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workingQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__FPExtensionCollection__startMonitoringDomains__block_invoke_2;
  block[3] = &unk_1E444AB48;
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, block);

}

void __48__FPExtensionCollection__startMonitoringDomains__block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v3 = a1 + 4;
  v2 = a1[4];
  if (*(_QWORD *)(v2 + 248))
  {
    if (a1[5])
    {
      objc_msgSend((id)v2, "_failMonitoringWithError:");
    }
    else
    {
      v4 = (void *)a1[6];
      objc_msgSend(*(id *)(v2 + 232), "enumeratedItemID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "providerDomainID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7 && (objc_msgSend(v7, "needsAuthentication") & 1) == 0 && objc_msgSend(v7, "isEnabled"))
      {
        fp_current_or_default_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          __48__FPExtensionCollection__startMonitoringDomains__block_invoke_2_cold_1(v3, (uint64_t)v7, v8);

        objc_msgSend((id)*v3, "startObserving");
      }

    }
  }
}

void __55__FPExtensionCollection__startMonitoringDSCopyProgress__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  void *v12;

  v5 = a2;
  v6 = a3;
  if (v5 && objc_msgSend(*(id *)(a1 + 32), "isCollectionValidForItem:", v5))
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __55__FPExtensionCollection__startMonitoringDSCopyProgress__block_invoke_3_cold_1(a1, v5, v7);

    +[FPProgressManager defaultManager](FPProgressManager, "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "itemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerCopyProgress:forItemID:", v9, v10);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v5, "itemID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "forceRefreshOfItemWithItemID:", v12);

  }
}

void __55__FPExtensionCollection__startMonitoringDSCopyProgress__block_invoke_32(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  NSObject *v6;
  BOOL v7;
  id v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  +[FPProgressManager defaultManager](FPProgressManager, "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeCopyProgress:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = objc_loadWeakRetained(v2);
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138413058;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v5;
    v17 = 2112;
    v18 = v10;
    _os_log_debug_impl(&dword_1A0A34000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: DSCopy: Detaching progress %@ from %@ at %@", (uint8_t *)&v11, 0x2Au);

  }
  if (v5)
    v7 = WeakRetained == 0;
  else
    v7 = 1;
  if (!v7)
    objc_msgSend(WeakRetained, "forceRefreshOfItemWithItemID:", v5);

}

void __55__FPExtensionCollection__startMonitoringDSCopyProgress__block_invoke_34(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[32], "startMonitoringWithURL:publishingHandler:", v5, *(_QWORD *)(a1 + 32));

}

- (BOOL)recoverFromError:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FPExtensionCollection;
  return -[FPItemCollection recoverFromError:](&v4, sel_recoverFromError_, a3);
}

- (BOOL)shouldRetryError:(id)a3
{
  id v4;
  char v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FPExtensionCollection;
  if (-[FPItemCollection shouldRetryError:](&v8, sel_shouldRetryError_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v4, "fp_unwrappedInternalError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "fp_isFileProviderInternalError:", 12) & 1) != 0)
      v5 = 1;
    else
      v5 = objc_msgSend(v6, "fp_isFileProviderError:", -2001);

  }
  return v5;
}

- (id)description
{
  FPExtensionCollection *v2;
  FPItemID *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_alternateID;
  objc_sync_exit(v2);

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  if (v3)
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@:%p [%@, %@]>"), v5, v2, v2->_settings, v3);
  else
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@:%p %@>"), v5, v2, v2->_settings, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setSettings:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 232);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsCopySubscriber, 0);
  objc_storeStrong(&self->_providerDomainMonitoringContext, 0);
  objc_storeStrong((id *)&self->_alternateID, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)updateRootItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] %@ learned alternate identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateRootItem:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] Enumerated URL changed, resetting %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateRootItem:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] %@ learned enumerated item identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_failMonitoringWithError:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_11(&dword_1A0A34000, a3, v6, "[DEBUG] %@: monitoring of domain failed with error %@", (uint8_t *)&v7);

}

void __48__FPExtensionCollection__startMonitoringDomains__block_invoke_2_cold_1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_11(&dword_1A0A34000, a3, (uint64_t)a3, "[DEBUG] %@: domain %@ is authenticated, restart observation", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3();
}

void __55__FPExtensionCollection__startMonitoringDSCopyProgress__block_invoke_3_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  id WeakRetained;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138413058;
  v11 = WeakRetained;
  v12 = 2112;
  v13 = v7;
  v14 = 2112;
  v15 = v8;
  v16 = 2112;
  v17 = v9;
  _os_log_debug_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: DSCopy: Attaching progress %@ to %@ at %@", (uint8_t *)&v10, 0x2Au);

}

@end
