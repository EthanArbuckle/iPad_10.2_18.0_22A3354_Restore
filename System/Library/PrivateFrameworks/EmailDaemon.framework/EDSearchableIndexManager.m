@implementation EDSearchableIndexManager

- (void)enableIndexingAndBeginScheduling:(BOOL)a3 budgetConfiguration:(id)a4
{
  _BOOL4 v4;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 37, a4))
  {
    +[EDSearchableIndexManager log](EDSearchableIndexManager, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[EDSearchableIndexManager enableIndexingAndBeginScheduling:budgetConfiguration:].cold.1(v6);

    -[EDSearchableIndexManager index](self, "index");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIndexingDisabledForPPT:", 1);

  }
  else
  {
    if (v4)
    {
      -[EDSearchableIndexManager index](self, "index");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPersistenceAvailable:", 1);

      -[EDSearchableIndexManager scheduler](self, "scheduler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setScheduling:", 1);
    }
    else
    {
      -[EDSearchableIndexManager scheduler](self, "scheduler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setScheduling:", 0);
    }

    if (-[EDSearchableIndexManager needsToRedonate](self, "needsToRedonate"))
    {
      -[EDSearchableIndexManager index](self, "index");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "redonateAllItemsWithAcknowledgementHandler:", 0);

      -[EDSearchableIndexManager setNeedsToRedonate:](self, "setNeedsToRedonate:", 0);
    }
    if (-[EDSearchableIndexManager needsToScheduleRecurringActivity](self, "needsToScheduleRecurringActivity"))
    {
      -[EDSearchableIndexManager scheduleRecurringActivity](self, "scheduleRecurringActivity");
      -[EDSearchableIndexManager setNeedsToScheduleRecurringActivity:](self, "setNeedsToScheduleRecurringActivity:", 0);
    }
  }
}

- (BOOL)needsToScheduleRecurringActivity
{
  return self->_needsToScheduleRecurringActivity;
}

- (EDSearchableIndexManager)initWithDatabase:(id)a3 messagePersistence:(id)a4 richLinkPersistence:(id)a5 hookResponder:(id)a6
{
  id v9;
  id v10;
  EDSearchableIndexManager *v11;
  EDSearchableIndexManager *v12;
  EDSearchableIndexManager *v13;
  void *v14;
  int v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)EDSearchableIndexManager;
  v11 = -[EDSearchableIndexManager init](&v17, sel_init);
  v12 = v11;
  v13 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_database, a3);
    objc_storeStrong((id *)&v12->_messagePersistence, a4);
  }
  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isInternal");

  if (v15)
    -[EDSearchableIndexManager _startObservingTurboModeToggle](v13, "_startObservingTurboModeToggle");

  return v13;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__EDSearchableIndexManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_78 != -1)
    dispatch_once(&log_onceToken_78, block);
  return (OS_os_log *)(id)log_log_78;
}

void __31__EDSearchableIndexManager_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_78;
  log_log_78 = (uint64_t)v1;

}

+ (NSString)searchableIndexBundleID
{
  return (NSString *)CFSTR("com.apple.mobilemail");
}

+ (NSString)searchableIndexName
{
  return (NSString *)CFSTR("com.apple.mobilemail.contentIndex");
}

+ (BOOL)shouldCancelSearchQuery
{
  return 0;
}

+ (id)searchableItemResultForExpression:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v22;
  id v23;
  void *v24;
  uint8_t v25[8];
  id v26;
  _QWORD aBlock[4];
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t v32[16];
  uint8_t buf[16];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(a1, "shouldCancelSearchQuery"))
  {
    +[EDSearchableIndexManager log](EDSearchableIndexManager, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_INFO, "searchableItemResultForExpression - canceling before querying Spotlight", buf, 2u);
    }
LABEL_20:

    v5 = 0;
    goto LABEL_21;
  }
  if (objc_msgSend(v4, "isValid"))
  {
    objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__EDSearchableIndexManager_searchableItemResultForExpression___block_invoke;
    aBlock[3] = &unk_1E94A0FB0;
    v31 = a1;
    v8 = v6;
    v28 = v8;
    v23 = v7;
    v29 = v23;
    v9 = v22;
    v30 = v9;
    v24 = _Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0D1E328], "queryWithExpression:builder:", v4, v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "progress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "addSearchQueryCancelable:", v11);

    objc_msgSend(v10, "start");
    objc_msgSend(v9, "future");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 5.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v12, "resultBeforeDate:error:", v13, &v26);
    v5 = objc_claimAutoreleasedReturnValue();
    v14 = v26;

    if (!v5 && objc_msgSend(v14, "ef_isTimeoutError"))
    {
      +[EDSearchableIndexManager log](EDSearchableIndexManager, "log");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v14, "ef_publicDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[EDSearchableIndexManager searchableItemResultForExpression:].cold.2(v16, buf, v15);
      }

      objc_msgSend(v10, "cancel");
    }
    objc_msgSend(v10, "progress");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "removeSearchQueryCancelable:", v17);

    if (!v5)
    {
      +[EDSearchableIndex log](EDSearchableIndex, "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v14, "ef_publicDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[EDSearchableIndexManager searchableItemResultForExpression:].cold.1(v19, v32, v18);
      }

    }
  }
  else
  {
    v5 = 0;
  }
  if (objc_msgSend(a1, "shouldCancelSearchQuery"))
  {
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1D2F2C000, v20, OS_LOG_TYPE_INFO, "searchableItemResultForExpression - Canceling after querying Spotlight", v25, 2u);
    }

    goto LABEL_20;
  }
LABEL_21:

  return v5;
}

void __62__EDSearchableIndexManager_searchableItemResultForExpression___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1[7], "searchableIndexBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBundleID:", v4);

  if (_os_feature_enabled_impl())
  {
    v5 = *MEMORY[0x1E0CA6A70];
    v18[0] = *MEMORY[0x1E0CA6800];
    v18[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = *MEMORY[0x1E0CA6800];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  objc_msgSend(v3, "setFetchAttributes:", v6);

  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__EDSearchableIndexManager_searchableItemResultForExpression___block_invoke_2;
  v13[3] = &unk_1E949B390;
  v14 = a1[4];
  v15 = a1[5];
  v16 = a1[6];
  objc_msgSend(v3, "setCompletionBlock:", v13);
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __62__EDSearchableIndexManager_searchableItemResultForExpression___block_invoke_4;
  v10[3] = &unk_1E949D480;
  v11 = a1[4];
  v12 = a1[5];
  objc_msgSend(v3, "setResultsBlock:", v10);
  objc_msgSend(a1[6], "errorOnlyCompletionHandlerAdapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFailureBlock:", v9);

}

void __62__EDSearchableIndexManager_searchableItemResultForExpression___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__EDSearchableIndexManager_searchableItemResultForExpression___block_invoke_3;
  v7[3] = &unk_1E94A0F60;
  v3 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v6 = v2;
  v9 = v6;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);
  v4 = *(void **)(a1 + 48);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E330]), "initWithIdentifiers:snippetData:", *(_QWORD *)(a1 + 32), v6);
  objc_msgSend(v4, "finishWithResult:", v5);

}

void __62__EDSearchableIndexManager_searchableItemResultForExpression___block_invoke_3(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = a2;
  v5 = (void *)objc_opt_new();
  if (a3 <= 0x1F3)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v11 = (void *)MEMORY[0x1E0D1E280];
          objc_msgSend(v10, "attribute");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "snippetHintZoneFromString:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "tokens");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v13);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

  }
  if (objc_msgSend(v5, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E338]), "initWithSearchableItemIdentifier:snippetHints:", v16, v5);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v15);

  }
}

void __62__EDSearchableIndexManager_searchableItemResultForExpression___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __62__EDSearchableIndexManager_searchableItemResultForExpression___block_invoke_5;
  v13 = &unk_1E94A0F88;
  v14 = *(id *)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", &v10);
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(*(id *)(a1 + 40), "allValues", v10, v11, v12, v13, v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDSearchableIndexManager log](EDSearchableIndexManager, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = objc_msgSend(v5, "count");
      if (v7)
      {
        v9 = (void *)MEMORY[0x1E0D1E100];
        objc_msgSend(v5, "firstObject");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "publicDescriptionForSnippetHintsArray:", v2);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = CFSTR("No values found.");
      }
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_debug_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEBUG, "Regular query collected snippet hints first value: %@", buf, 0xCu);
      if (v7)
      {

      }
    }

  }
}

void __62__EDSearchableIndexManager_searchableItemResultForExpression___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDSearchableIndexAttachmentItem attachmentPersistentIDFromItemIdentifier:](EDSearchableIndexAttachmentItem, "attachmentPersistentIDFromItemIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v10, "attributeSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "relatedUniqueIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") <= 0x1F3)
    {
      objc_msgSend(v10, "attributeSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "matchingHints");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v3);

    }
  }

}

- (void)test_tearDown
{
  id v4;
  id v5;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDSearchableIndexManager.m"), 166, CFSTR("%s can only be called from unit tests"), "-[EDSearchableIndexManager test_tearDown]");

  }
  -[EDSearchableIndexManager index](self, "index");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "test_tearDown");

}

- (void)scheduleRecurringActivity
{
  void *v3;
  id v4;

  -[EDSearchableIndexManager index](self, "index");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[EDSearchableIndexManager index](self, "index");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheduleRecurringActivity");

  }
  else
  {
    -[EDSearchableIndexManager setNeedsToScheduleRecurringActivity:](self, "setNeedsToScheduleRecurringActivity:", 1);
  }
}

- (void)_startObservingTurboModeToggle
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, int);
  void *v8;
  id v9;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0D1E1A8];
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __58__EDSearchableIndexManager__startObservingTurboModeToggle__block_invoke;
  v8 = &unk_1E94A0FD8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "observeChangesForPreference:usingBlock:", 27, &v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSearchableIndexManager setTurboModeObservationToken:](self, "setTurboModeObservationToken:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __58__EDSearchableIndexManager__startObservingTurboModeToggle__block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && a3)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "index");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "refresh");

    WeakRetained = v6;
  }

}

- (EDSearchableIndex)index
{
  -[EDSearchableIndexManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDSearchableIndexManager index]", "EDSearchableIndexManager.m", 189, "0");
}

- (EDSearchableIndexPersistence)persistence
{
  -[EDSearchableIndexManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDSearchableIndexManager persistence]", "EDSearchableIndexManager.m", 193, "0");
}

- (EDSearchableIndexScheduler)scheduler
{
  -[EDSearchableIndexManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDSearchableIndexManager scheduler]", "EDSearchableIndexManager.m", 197, "0");
}

- (void)enableIndexingAndBeginScheduling:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  +[EDSearchableIndexBudgetConfiguration defaultConfiguration](EDSearchableIndexBudgetConfiguration, "defaultConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[EDSearchableIndexManager enableIndexingAndBeginScheduling:budgetConfiguration:](self, "enableIndexingAndBeginScheduling:budgetConfiguration:", v3);

}

- (void)resetIndexForNewLibrary
{
  id v3;

  -[EDSearchableIndexManager setNeedsToRedonate:](self, "setNeedsToRedonate:", 0);
  -[EDSearchableIndexManager enableIndexingAndBeginScheduling:](self, "enableIndexingAndBeginScheduling:", 0);
  -[EDSearchableIndexManager index](self, "index");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetIndexForNewLibraryWithCompletionHandler:", 0);

}

- (void)setNeedsToRedonate
{
  NSObject *v3;
  uint8_t v4[16];

  if (!-[EDSearchableIndexManager needsToRedonate](self, "needsToRedonate"))
  {
    +[EDSearchableIndexManager log](EDSearchableIndexManager, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "Setting needs to redonate", v4, 2u);
    }

    -[EDSearchableIndexManager setNeedsToRedonate:](self, "setNeedsToRedonate:", 1);
  }
}

- (void)persistenceWillBeginUpdates
{
  id v2;

  -[EDSearchableIndexManager index](self, "index");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginUpdatesAffectingDataSourceAndIndex");

}

- (void)persistenceDidFinishUpdates
{
  id v2;

  -[EDSearchableIndexManager index](self, "index");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endUpdatesAffectingDataSourceAndIndex");

}

- (void)persistenceDidAddMessages:(id)a3 generationWindow:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  -[EDSearchableIndexManager index](self, "index");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexMessages:includeBody:indexingType:", v6, 0, 0);

}

- (void)persistenceDidUpdateData:(id)a3 message:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "persistentID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    -[EDSearchableIndexManager index](self, "index");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexMessages:includeBody:indexingType:", v9, 1, 0);

  }
}

- (void)persistenceDidChangeFlags:(id)a3 messages:(id)a4 generationWindow:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  if (objc_msgSend(v9, "deleted"))
  {
    -[EDSearchableIndexManager _removeItemsForPersistedMessages:](self, "_removeItemsForPersistedMessages:", v7);
  }
  else
  {
    -[EDSearchableIndexManager index](self, "index");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexMessages:includeBody:indexingType:", v7, 0, 1);

  }
}

- (void)persistenceDidAddDataDetectionResults:(id)a3 generationWindow:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  -[EDSearchableIndexManager index](self, "index");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexMessages:includeBody:indexingType:", v6, 0, 4);

}

- (void)persistenceDidAddLabels:(id)a3 removeLabels:(id)a4 messages:(id)a5 generationWindow:(id)a6
{
  void *v7;
  id v8;

  v8 = a5;
  -[EDSearchableIndexManager index](self, "index");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexMessages:includeBody:indexingType:", v8, 0, 2);

}

- (void)_removeItemsForPersistedMessages:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[EDSearchableIndexManager index](self, "index");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ef_map:", &__block_literal_global_65);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemsWithIdentifiers:", v5);

}

id __61__EDSearchableIndexManager__removeItemsForPersistedMessages___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "persistentID");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)persistenceDidChangeCategorizationForMessages:(id)a3 generationWindow:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  -[EDSearchableIndexManager index](self, "index");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexMessages:includeBody:indexingType:", v6, 0, 7);

}

- (void)persistenceDidChangeCategoryForBusiness:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[EDSearchableIndexManager messagePersistence](self, "messagePersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistedMessagesForBusinessID:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[EDSearchableIndexManager index](self, "index");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexMessages:includeBody:indexingType:", v7, 0, 7);

}

- (void)persistenceDidChangeCategoryForAddressIDs:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[EDSearchableIndexManager messagePersistence](self, "messagePersistence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistedMessagesFromSendersWithAddressIDs:temporarilyUnavailableMessageObjectIDs:", v7, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDSearchableIndexManager index](self, "index");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexMessages:includeBody:indexingType:", v5, 0, 7);

}

- (BOOL)needsToRedonate
{
  return self->_needsToRedonate;
}

- (void)setNeedsToRedonate:(BOOL)a3
{
  self->_needsToRedonate = a3;
}

- (void)setNeedsToScheduleRecurringActivity:(BOOL)a3
{
  self->_needsToScheduleRecurringActivity = a3;
}

- (EFCancelable)turboModeObservationToken
{
  return self->_turboModeObservationToken;
}

- (void)setTurboModeObservationToken:(id)a3
{
  objc_storeStrong((id *)&self->_turboModeObservationToken, a3);
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EDSpotlightDaemonClient)spotlightDaemonClient
{
  return self->_spotlightDaemonClient;
}

- (void)setSpotlightDaemonClient:(id)a3
{
  objc_storeStrong((id *)&self->_spotlightDaemonClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightDaemonClient, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_turboModeObservationToken, 0);
}

+ (void)searchableItemResultForExpression:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_FAULT, "searchableItemResultForExpression - search failed: %{public}@", buf, 0xCu);

}

+ (void)searchableItemResultForExpression:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "searchableItemResultForExpression - Timed out waiting for results from spotlight: %{public}@", buf, 0xCu);

}

- (void)enableIndexingAndBeginScheduling:(os_log_t)log budgetConfiguration:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "WARNING: Indexing is disabled using internal settings. This is intended for testing purposes only.", v1, 2u);
}

@end
