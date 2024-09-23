@implementation CNAutocompleteDelegateWrapper

+ (id)responseScheduler
{
  return (id)objc_msgSend(MEMORY[0x1E0D13B68], "operationQueueSchedulerWithMaxConcurrentOperationCount:", 1);
}

- (CNAutocompleteDelegateWrapper)initWithDelegate:(id)a3 userSession:(id)a4 fetchRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  CNAutocompleteDelegateWrapper *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "responseScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CNAutocompleteDelegateWrapper initWithDelegate:userSession:fetchRequest:scheduler:](self, "initWithDelegate:userSession:fetchRequest:scheduler:", v10, v9, v8, v11);

  return v12;
}

- (CNAutocompleteDelegateWrapper)initWithDelegate:(id)a3 userSession:(id)a4 fetchRequest:(id)a5 scheduler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CNAutocompleteDelegateWrapper *v14;
  _CNAutocompleteFetchDelegateSafeWrapper *v15;
  CNAutocompleteFetchDelegate *delegate;
  CNCancelationToken *v17;
  CNCancelationToken *cancelationToken;
  CNAutocompleteQueryResponsePreparer *v19;
  CNAutocompleteQueryResponsePreparer *responsePreparer;
  CNAutocompleteDelegateWrapper *v21;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)CNAutocompleteDelegateWrapper;
  v14 = -[CNAutocompleteDelegateWrapper init](&v23, sel_init);
  if (v14)
  {
    v15 = -[_CNAutocompleteFetchDelegateSafeWrapper initWithDelegate:]([_CNAutocompleteFetchDelegateSafeWrapper alloc], "initWithDelegate:", v10);
    delegate = v14->_delegate;
    v14->_delegate = (CNAutocompleteFetchDelegate *)v15;

    objc_storeStrong((id *)&v14->_scheduler, a6);
    v17 = (CNCancelationToken *)objc_alloc_init(MEMORY[0x1E0D139B8]);
    cancelationToken = v14->_cancelationToken;
    v14->_cancelationToken = v17;

    objc_storeStrong((id *)&v14->_userSession, a4);
    objc_storeStrong((id *)&v14->_fetchRequest, a5);
    v19 = -[CNAutocompleteQueryResponsePreparer initWithDelegate:fetchRequest:]([CNAutocompleteQueryResponsePreparer alloc], "initWithDelegate:fetchRequest:", v14->_delegate, v14->_fetchRequest);
    responsePreparer = v14->_responsePreparer;
    v14->_responsePreparer = v19;

    v21 = v14;
  }

  return v14;
}

- (id)addDiagnosticLog:(id)a3
{
  CNAutocompleteQueryResponsePreparer *v4;
  CNAutocompleteQueryResponsePreparer *responsePreparer;

  -[CNAutocompleteQueryResponsePreparer addDiagnosticLog:](self->_responsePreparer, "addDiagnosticLog:", a3);
  v4 = (CNAutocompleteQueryResponsePreparer *)objc_claimAutoreleasedReturnValue();
  responsePreparer = self->_responsePreparer;
  self->_responsePreparer = v4;

  return self;
}

- (id)sortResults
{
  CNAutocompleteQueryResponsePreparer *v3;
  CNAutocompleteQueryResponsePreparer *responsePreparer;

  -[CNAutocompleteQueryResponsePreparer sortResults](self->_responsePreparer, "sortResults");
  v3 = (CNAutocompleteQueryResponsePreparer *)objc_claimAutoreleasedReturnValue();
  responsePreparer = self->_responsePreparer;
  self->_responsePreparer = v3;

  return self;
}

- (id)askDelegateToAdjustResults
{
  CNAutocompleteQueryResponsePreparer *v3;
  CNAutocompleteQueryResponsePreparer *responsePreparer;

  -[CNAutocompleteQueryResponsePreparer askDelegateToAdjustResults](self->_responsePreparer, "askDelegateToAdjustResults");
  v3 = (CNAutocompleteQueryResponsePreparer *)objc_claimAutoreleasedReturnValue();
  responsePreparer = self->_responsePreparer;
  self->_responsePreparer = v3;

  return self;
}

- (id)suppressResultsWithAddresses:(id)a3
{
  CNAutocompleteQueryResponsePreparer *v4;
  CNAutocompleteQueryResponsePreparer *responsePreparer;

  -[CNAutocompleteQueryResponsePreparer suppressResultsWithAddresses:](self->_responsePreparer, "suppressResultsWithAddresses:", a3);
  v4 = (CNAutocompleteQueryResponsePreparer *)objc_claimAutoreleasedReturnValue();
  responsePreparer = self->_responsePreparer;
  self->_responsePreparer = v4;

  return self;
}

- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__CNAutocompleteDelegateWrapper_autocompleteFetch_didReceiveResults___block_invoke;
  v10[3] = &unk_1E70DEF28;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[CNAutocompleteDelegateWrapper queueMessageToDelegate:](self, "queueMessageToDelegate:", v10);

}

void __69__CNAutocompleteDelegateWrapper_autocompleteFetch_didReceiveResults___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "responsePreparer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prepareResults:forFetch:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "userSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didReceiveResults:forRequest:", v3, v5);

  v6 = objc_msgSend(v3, "count");
  CNALoggingContextDebug();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1B9950000, v7, OS_LOG_TYPE_DEFAULT, "About to tell our delegate about %@ results", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject autocompleteFetch:didReceiveResults:](v7, "autocompleteFetch:didReceiveResults:", *(_QWORD *)(a1 + 48), v3);
  }
  else if (v8)
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_1B9950000, v7, OS_LOG_TYPE_DEFAULT, "No results to return to delegate", (uint8_t *)&v10, 2u);
  }

}

- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CNALoggingContextDebug();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v7;
    _os_log_impl(&dword_1B9950000, v8, OS_LOG_TYPE_DEFAULT, "About to tell our delegate about error %@", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__CNAutocompleteDelegateWrapper_autocompleteFetch_didFailWithError___block_invoke;
  v11[3] = &unk_1E70DEF28;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[CNAutocompleteDelegateWrapper queueMessageToDelegate:](self, "queueMessageToDelegate:", v11);

}

void __68__CNAutocompleteDelegateWrapper_autocompleteFetch_didFailWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autocompleteFetch:didFailWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)autocompleteFetchDidBeginNetworkActivity:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__CNAutocompleteDelegateWrapper_autocompleteFetchDidBeginNetworkActivity___block_invoke;
  v6[3] = &unk_1E70DEBB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CNAutocompleteDelegateWrapper queueMessageToDelegate:](self, "queueMessageToDelegate:", v6);

}

void __74__CNAutocompleteDelegateWrapper_autocompleteFetchDidBeginNetworkActivity___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id from;
  id location;

  v2 = objc_msgSend(*(id *)(a1 + 32), "openNetworkActivityCalls");
  objc_msgSend(*(id *)(a1 + 32), "setOpenNetworkActivityCalls:", objc_msgSend(*(id *)(a1 + 32), "openNetworkActivityCalls") + 1);
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "autocompleteFetchDidBeginNetworkActivity:", *(_QWORD *)(a1 + 40));

    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&from, *(id *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "cancelationToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __74__CNAutocompleteDelegateWrapper_autocompleteFetchDidBeginNetworkActivity___block_invoke_2;
    v7[3] = &unk_1E70DEF78;
    objc_copyWeak(&v9, &location);
    objc_copyWeak(&v10, &from);
    v6 = v4;
    v8 = v6;
    objc_msgSend(v5, "addCancelationBlock:", v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&from);

    objc_destroyWeak(&location);
  }
}

void __74__CNAutocompleteDelegateWrapper_autocompleteFetchDidBeginNetworkActivity___block_invoke_2(id *a1)
{
  id WeakRetained;
  _QWORD v3[5];
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__CNAutocompleteDelegateWrapper_autocompleteFetchDidBeginNetworkActivity___block_invoke_3;
  v3[3] = &unk_1E70DEF50;
  objc_copyWeak(&v5, a1 + 6);
  v3[4] = WeakRetained;
  v4 = a1[4];
  objc_msgSend(WeakRetained, "queueUncancelableMessageToDelegate:", v3);

  objc_destroyWeak(&v5);
}

void __74__CNAutocompleteDelegateWrapper_autocompleteFetchDidBeginNetworkActivity___block_invoke_3(id *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (objc_msgSend(a1[4], "openNetworkActivityCalls"))
  {
    objc_msgSend(a1[4], "setOpenNetworkActivityCalls:", 0);
    objc_msgSend(a1[5], "autocompleteFetchDidEndNetworkActivity:", WeakRetained);
  }

}

- (void)queueDidEndNetworkActivityMessageForFetch:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__CNAutocompleteDelegateWrapper_queueDidEndNetworkActivityMessageForFetch___block_invoke;
  v6[3] = &unk_1E70DEBB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CNAutocompleteDelegateWrapper queueUncancelableMessageToDelegate:](self, "queueUncancelableMessageToDelegate:", v6);

}

void __75__CNAutocompleteDelegateWrapper_queueDidEndNetworkActivityMessageForFetch___block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "openNetworkActivityCalls"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setOpenNetworkActivityCalls:", objc_msgSend(*(id *)(a1 + 32), "openNetworkActivityCalls") - 1);
    if (!objc_msgSend(*(id *)(a1 + 32), "openNetworkActivityCalls"))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "autocompleteFetchDidEndNetworkActivity:", *(_QWORD *)(a1 + 40));

    }
  }
}

- (void)autocompleteFetchDidFinish:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__CNAutocompleteDelegateWrapper_autocompleteFetchDidFinish___block_invoke;
  v6[3] = &unk_1E70DEBB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CNAutocompleteDelegateWrapper queueMessageToDelegate:](self, "queueMessageToDelegate:", v6);

}

void __60__CNAutocompleteDelegateWrapper_autocompleteFetchDidFinish___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autocompleteFetchDidFinish:", *(_QWORD *)(a1 + 40));

}

- (BOOL)autocompleteFetch:(id)a3 shouldExpectSupplementalResultsForRequest:(id)a4 completionHandler:(id)a5
{
  return -[CNAutocompleteFetchDelegate autocompleteFetch:shouldExpectSupplementalResultsForRequest:completionHandler:](self->_delegate, "autocompleteFetch:shouldExpectSupplementalResultsForRequest:completionHandler:", a3, a4, a5);
}

- (void)queueMessageToDelegate:(id)a3
{
  id v4;
  CNCancelationToken *v5;
  CNScheduler *scheduler;
  id v7;
  CNCancelationToken *v8;
  _QWORD v9[4];
  CNCancelationToken *v10;
  id v11;

  v4 = a3;
  v5 = self->_cancelationToken;
  scheduler = self->_scheduler;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__CNAutocompleteDelegateWrapper_queueMessageToDelegate___block_invoke;
  v9[3] = &unk_1E70DEFA0;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  -[CNScheduler performBlock:](scheduler, "performBlock:", v9);

}

uint64_t __56__CNAutocompleteDelegateWrapper_queueMessageToDelegate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCanceled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

- (void)queueUncancelableMessageToDelegate:(id)a3
{
  -[CNScheduler performBlock:](self->_scheduler, "performBlock:", a3);
}

- (void)cancel
{
  -[CNCancelationToken cancel](self->_cancelationToken, "cancel");
}

- (void)setPredictionResultsFuture:(id)a3
{
  CNAutocompleteUserSession *userSession;
  void *v5;
  id v6;

  -[CNAutocompleteQueryResponsePreparer setPriorityResultsFuture:](self->_responsePreparer, "setPriorityResultsFuture:", a3);
  v6 = objc_alloc_init(MEMORY[0x1E0D13B20]);
  -[CNAutocompleteQueryResponsePreparer setMatchingPriorityResultsPromise:](self->_responsePreparer, "setMatchingPriorityResultsPromise:", v6);
  userSession = self->_userSession;
  objc_msgSend(v6, "future");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteUserSession willStartDuetRequestWithMatchingResultsFuture:](userSession, "willStartDuetRequestWithMatchingResultsFuture:", v5);

}

- (CNAutocompleteFetchDelegate)delegate
{
  return self->_delegate;
}

- (CNScheduler)scheduler
{
  return self->_scheduler;
}

- (CNAutocompleteQueryResponsePreparer)responsePreparer
{
  return self->_responsePreparer;
}

- (unint64_t)openNetworkActivityCalls
{
  return self->_openNetworkActivityCalls;
}

- (void)setOpenNetworkActivityCalls:(unint64_t)a3
{
  self->_openNetworkActivityCalls = a3;
}

- (CNCancelationToken)cancelationToken
{
  return self->_cancelationToken;
}

- (CNAutocompleteUserSession)userSession
{
  return self->_userSession;
}

- (CNAutocompleteFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchRequest, 0);
  objc_storeStrong((id *)&self->_userSession, 0);
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong((id *)&self->_responsePreparer, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
