@implementation CompletionListVendorForHistoryService

- (void)getCompletionListItemsForQuery:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id completionListItemsCallback;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "copy");
  completionListItemsCallback = self->_completionListItemsCallback;
  self->_completionListItemsCallback = v7;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__CompletionListVendorForHistoryService_getCompletionListItemsForQuery_completionHandler___block_invoke;
  v10[3] = &unk_1E9CF1830;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __90__CompletionListVendorForHistoryService_getCompletionListItemsForQuery_completionHandler___block_invoke(uint64_t a1)
{
  CompletionList *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = [CompletionList alloc];
  +[UniversalSearchSession sharedSession](UniversalSearchSession, "sharedSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_browserController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CompletionList initWithParsecSearchSession:browserController:](v2, "initWithParsecSearchSession:browserController:", v3, v4);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setShouldIncludeNetworkedSearchSuggestions:", objc_msgSend(*(id *)(a1 + 32), "_shouldUseNetworkedSearchSuggestions"));
  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A860]), "initWithQueryString:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setQuery:", v8);

}

- (void)completionListDidUpdate:(id)a3 forQuery:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  id v12;
  NSTimer *v13;
  NSTimer *completionListUpdatesDidSettleTimer;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  -[NSTimer invalidate](self->_completionListUpdatesDidSettleTimer, "invalidate");
  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x1E0C99E88];
  -[CompletionListVendorForHistoryService _timeIntervalForUpdatesToSettle](self, "_timeIntervalForUpdatesToSettle");
  v10 = v9;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __74__CompletionListVendorForHistoryService_completionListDidUpdate_forQuery___block_invoke;
  v19 = &unk_1E9CF5828;
  objc_copyWeak(&v22, &location);
  v11 = v7;
  v20 = v11;
  v12 = v6;
  v21 = v12;
  objc_msgSend(v8, "timerWithTimeInterval:repeats:block:", 0, &v16, v10);
  v13 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  completionListUpdatesDidSettleTimer = self->_completionListUpdatesDidSettleTimer;
  self->_completionListUpdatesDidSettleTimer = v13;

  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop", v16, v17, v18, v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addTimer:forMode:", self->_completionListUpdatesDidSettleTimer, *MEMORY[0x1E0C99748]);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __74__CompletionListVendorForHistoryService_completionListDidUpdate_forQuery___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "queryString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_completionListDidUpdateForQuery:completionList:", v2, *(_QWORD *)(a1 + 40));

  }
}

- (BOOL)completionListHasScheduledDismissal:(id)a3
{
  return 0;
}

- (void)_setExportedInterfaceAndObjectForConnection:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB3B50];
  v6 = a3;
  objc_msgSend(v4, "interfaceWithProtocol:", &unk_1F01DB3C0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v5);

  objc_msgSend(v6, "setExportedObject:", self);
}

- (id)_browserController
{
  void *v2;
  void *v3;

  -[WBSCompletionListVendorForHistoryService dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "browserControllerForCompletionListVendorForHistoryService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_completionListDidUpdateForQuery:(id)a3 completionList:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  const __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void (**completionListItemsCallback)(id, void *);
  void *v22;
  id v23;
  uint64_t v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_completionListItemsCallback)
  {
    v24 = (uint64_t)v6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "numberOfGroups"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "numberOfGroups"))
    {
      v10 = 0;
      v11 = MEMORY[0x1E0C9AA60];
      do
      {
        objc_msgSend(v8, "titleForGroupAtIndex:", v10);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "completionsForGroupAtIndex:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          v14 = v12;
        else
          v14 = &stru_1E9CFDBB0;
        v25[0] = CFSTR("section");
        v25[1] = CFSTR("results");
        v26[0] = v14;
        v15 = v12;
        objc_msgSend(v13, "safari_mapObjectsUsingBlock:", &__block_literal_global_25);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v16)
          v18 = v16;
        else
          v18 = v11;
        v26[1] = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "addObject:", v19);
        ++v10;
      }
      while (v10 < objc_msgSend(v8, "numberOfGroups"));
    }
    v6 = (id)v24;
    if ((objc_msgSend(MEMORY[0x1E0D89BE8], "isSearchEvaluationLoggingEnabled") & 1) != 0)
    {
      v20 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[CompletionListVendorForHistoryService _completionListDidUpdateForQuery:completionList:].cold.1(v24, (uint64_t)v9, v20);
    }
    completionListItemsCallback = (void (**)(id, void *))self->_completionListItemsCallback;
    v22 = (void *)objc_msgSend(v9, "copy");
    completionListItemsCallback[2](completionListItemsCallback, v22);

    v23 = self->_completionListItemsCallback;
    self->_completionListItemsCallback = 0;

  }
}

- (double)_timeIntervalForUpdatesToSettle
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_doubleForKey:defaultValue:", *MEMORY[0x1E0D8B698], 2.0);
  v4 = v3;

  return v4;
}

- (BOOL)_shouldUseNetworkedSearchSuggestions
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safari_BOOLForKey:defaultValue:", *MEMORY[0x1E0D8AF40], 1);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionListUpdatesDidSettleTimer, 0);
  objc_storeStrong(&self->_completionListItemsCallback, 0);
  objc_storeStrong((id *)&self->_completionList, 0);
}

- (void)_completionListDidUpdateForQuery:(os_log_t)log completionList:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1D7CA3000, log, OS_LOG_TYPE_DEBUG, "Completion list tool output for query %@: %@", (uint8_t *)&v3, 0x16u);
}

@end
