@implementation CNAutocompleteUserSession

- (CNAutocompleteUserSession)initWithProbeProvider:(id)a3
{
  id v5;
  CNAutocompleteUserSession *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *syncQueue;
  CNAutocompleteUsageMonitor *v10;
  CNAutocompleteUsageMonitor *usageMonitor;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNAutocompleteUserSession;
  v6 = -[CNAutocompleteUserSession init](&v13, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.contacts.contactsautocomplete.UserSession", v7);
    syncQueue = v6->_syncQueue;
    v6->_syncQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_probeProvider, a3);
    v10 = -[CNAutocompleteUsageMonitor initWithProbeProvider:]([CNAutocompleteUsageMonitor alloc], "initWithProbeProvider:", v5);
    usageMonitor = v6->_usageMonitor;
    v6->_usageMonitor = v10;

    v6->_currentBatch = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (void)willStartDuetRequestWithMatchingResultsFuture:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CNAutocompleteUserSession syncQueue](self, "syncQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__CNAutocompleteUserSession_willStartDuetRequestWithMatchingResultsFuture___block_invoke;
  block[3] = &unk_1E70DEBB0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __75__CNAutocompleteUserSession_willStartDuetRequestWithMatchingResultsFuture___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDuetResultsFuture:", *(_QWORD *)(a1 + 40));
}

- (void)willStartExecutingRequest:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[6];
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD block[5];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  -[CNAutocompleteUserSession syncQueue](self, "syncQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CNAutocompleteUserSession_willStartExecutingRequest___block_invoke;
  block[3] = &unk_1E70DEBD8;
  v21 = &v22;
  block[4] = self;
  v7 = v4;
  v20 = v7;
  dispatch_sync(v5, block);

  v8 = (void *)v23[5];
  if (v8 && objc_msgSend(v8, "relevantForRequest:", v7))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy_;
    v17 = __Block_byref_object_dispose_;
    v18 = 0;
    -[CNAutocompleteUserSession syncQueue](self, "syncQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __55__CNAutocompleteUserSession_willStartExecutingRequest___block_invoke_2;
    v12[3] = &unk_1E70DEC00;
    v12[4] = &v22;
    v12[5] = &v13;
    dispatch_sync(v9, v12);

    v10 = (void *)v14[5];
    if (v10)
    {
      v11[0] = v6;
      v11[1] = 3221225472;
      v11[2] = __55__CNAutocompleteUserSession_willStartExecutingRequest___block_invoke_3;
      v11[3] = &unk_1E70DEC28;
      v11[4] = self;
      v11[5] = &v22;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v11);
    }
    _Block_object_dispose(&v13, 8);

  }
  _Block_object_dispose(&v22, 8);

}

uint64_t __55__CNAutocompleteUserSession_willStartExecutingRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "lastDisplayedResults");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "setCurrentRequest:", *(_QWORD *)(a1 + 40));
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequestStartTime:", v6);

  objc_msgSend(*(id *)(a1 + 32), "setCurrentBatch:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setDuetResultsFuture:", 0);
}

void __55__CNAutocompleteUserSession_willStartExecutingRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "ignored") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setIgnored:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "datesByBatchIndexes");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v5, "copy");
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

void __55__CNAutocompleteUserSession_willStartExecutingRequest___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  id v13;

  v5 = (void *)MEMORY[0x1E0C99D68];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v6);
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "usageMonitor");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "request");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "userIgnoredResultsOfBatch:forRequest:afterDelay:", v11, v12, v10);

}

- (void)didReceiveResults:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD block[4];
  id v19;
  CNAutocompleteUserSession *v20;
  uint64_t *v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v6 = a3;
  v7 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0x7FFFFFFFFFFFFFFFLL;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy_;
  v23[4] = __Block_byref_object_dispose_;
  v24 = 0;
  -[CNAutocompleteUserSession syncQueue](self, "syncQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CNAutocompleteUserSession_didReceiveResults_forRequest___block_invoke;
  block[3] = &unk_1E70DEC50;
  v10 = v7;
  v19 = v10;
  v20 = self;
  v21 = &v25;
  v22 = v23;
  dispatch_sync(v8, block);

  if (v26[3] != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v6, "count"))
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __58__CNAutocompleteUserSession_didReceiveResults_forRequest___block_invoke_5;
    v13[3] = &unk_1E70DEC78;
    v13[4] = &v14;
    objc_msgSend(v6, "_cn_each:", v13);
    -[CNAutocompleteUserSession usageMonitor](self, "usageMonitor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "count");
    objc_msgSend(v11, "userSawNumberOfResults:forBatch:includingNumberOfSuggestions:forRequest:", v12, v26[3], v15[3], v10);

    _Block_object_dispose(&v14, 8);
  }

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);

}

void __58__CNAutocompleteUserSession_didReceiveResults_forRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _CNAutocompleteUserSessionDisplayedResults *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "currentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((_DWORD)v2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "currentBatch");
    objc_msgSend(*(id *)(a1 + 40), "setCurrentBatch:", objc_msgSend(*(id *)(a1 + 40), "currentBatch") + 1);
    objc_msgSend(*(id *)(a1 + 40), "requestStartTime");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "lastDisplayedResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v7, "isEqual:", v9);

    if ((v7 & 1) == 0)
    {
      v10 = -[_CNAutocompleteUserSessionDisplayedResults initWithRequest:]([_CNAutocompleteUserSessionDisplayedResults alloc], "initWithRequest:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 40), "setLastDisplayedResults:", v10);

    }
    objc_msgSend(*(id *)(a1 + 40), "duetResultsFuture");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 40), "duetResultsFuture");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      objc_msgSend(v12, "resultWithTimeout:error:", &v19, 0.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v19;

      if (!v13)
      {
        CNALoggingContextDebug();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v14;
          _os_log_impl(&dword_1B9950000, v15, OS_LOG_TYPE_DEFAULT, "Failed to retrieve duet results with error: %@", buf, 0xCu);
        }

      }
      v16 = objc_msgSend(v13, "count") != 0;
      objc_msgSend(*(id *)(a1 + 40), "lastDisplayedResults");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setContainsDuetResults:", v16);

      objc_msgSend(*(id *)(a1 + 40), "setDuetResultsFuture:", 0);
    }
    objc_msgSend(*(id *)(a1 + 40), "lastDisplayedResults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "didReceiveBatch:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

  }
}

BOOL __58__CNAutocompleteUserSession_didReceiveResults_forRequest___block_invoke_5(uint64_t a1, void *a2)
{
  _BOOL8 result;

  result = +[CNAutocompleteResult isSourceTypeConsideredSuggestion:](CNAutocompleteResult, "isSourceTypeConsideredSuggestion:", objc_msgSend(a2, "sourceType"));
  if (result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

- (void)didSelectResult:(id)a3 atSortedIndex:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[CNAutocompleteUserSession syncQueue](self, "syncQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CNAutocompleteUserSession_didSelectResult_atSortedIndex___block_invoke;
  block[3] = &unk_1E70DECA0;
  block[4] = self;
  block[5] = &v14;
  block[6] = &v10;
  dispatch_sync(v7, block);

  -[CNAutocompleteUserSession usageMonitor](self, "usageMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userSelectedResult:atSortedIndex:forRequest:gotResultsFromDuet:", v6, a4, v15[5], *((unsigned __int8 *)v11 + 24));

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

}

uint64_t __59__CNAutocompleteUserSession_didSelectResult_atSortedIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "currentRequest");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "lastDisplayedResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "containsDuetResults");

  return objc_msgSend(*(id *)(a1 + 32), "_resetState");
}

- (void)_resetState
{
  -[CNAutocompleteUserSession setCurrentRequest:](self, "setCurrentRequest:", 0);
  -[CNAutocompleteUserSession setCurrentBatch:](self, "setCurrentBatch:", 0x7FFFFFFFFFFFFFFFLL);
  -[CNAutocompleteUserSession setLastDisplayedResults:](self, "setLastDisplayedResults:", 0);
  -[CNAutocompleteUserSession setRequestStartTime:](self, "setRequestStartTime:", 0);
  -[CNAutocompleteUserSession setDuetResultsFuture:](self, "setDuetResultsFuture:", 0);
}

- (CNAutocompleteProbeProvider)probeProvider
{
  return self->_probeProvider;
}

- (CNAutocompleteFetchRequest)currentRequest
{
  return self->_currentRequest;
}

- (void)setCurrentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_currentRequest, a3);
}

- (unint64_t)currentBatch
{
  return self->_currentBatch;
}

- (void)setCurrentBatch:(unint64_t)a3
{
  self->_currentBatch = a3;
}

- (_CNAutocompleteUserSessionDisplayedResults)lastDisplayedResults
{
  return self->_lastDisplayedResults;
}

- (void)setLastDisplayedResults:(id)a3
{
  objc_storeStrong((id *)&self->_lastDisplayedResults, a3);
}

- (NSDate)requestStartTime
{
  return self->_requestStartTime;
}

- (void)setRequestStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_requestStartTime, a3);
}

- (CNAutocompleteUsageMonitor)usageMonitor
{
  return self->_usageMonitor;
}

- (void)setUsageMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_usageMonitor, a3);
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
  objc_storeStrong((id *)&self->_syncQueue, a3);
}

- (CNFuture)duetResultsFuture
{
  return self->_duetResultsFuture;
}

- (void)setDuetResultsFuture:(id)a3
{
  objc_storeStrong((id *)&self->_duetResultsFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duetResultsFuture, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_usageMonitor, 0);
  objc_storeStrong((id *)&self->_requestStartTime, 0);
  objc_storeStrong((id *)&self->_lastDisplayedResults, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_probeProvider, 0);
}

@end
