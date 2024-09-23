@implementation CNAutocompleteQueryResponsePreparer

- (CNAutocompleteQueryResponsePreparer)init
{
  return -[CNAutocompleteQueryResponsePreparer initWithDelegate:](self, "initWithDelegate:", 0);
}

- (CNAutocompleteQueryResponsePreparer)initWithDelegate:(id)a3
{
  return -[CNAutocompleteQueryResponsePreparer initWithDelegate:fetchRequest:](self, "initWithDelegate:fetchRequest:", a3, 0);
}

- (CNAutocompleteQueryResponsePreparer)initWithDelegate:(id)a3 fetchRequest:(id)a4
{
  id v6;
  id v7;
  CNAutocompleteQueryResponsePreparer *v8;
  NSMutableOrderedSet *v9;
  NSMutableOrderedSet *previouslyReturnedResults;
  CNAutocompleteQueryResponsePreparer *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNAutocompleteQueryResponsePreparer;
  v8 = -[CNAutocompleteQueryResponsePreparer init](&v13, sel_init);
  if (v8)
  {
    v9 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    previouslyReturnedResults = v8->_previouslyReturnedResults;
    v8->_previouslyReturnedResults = v9;

    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v8->_fetchRequest, a4);
    v11 = v8;
  }

  return v8;
}

- (id)prepareResults:(id)a3 forFetch:(id)a4
{
  id v5;
  NSObject *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  unint64_t v15;
  void *v16;
  NSObject *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  _BOOL4 v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  uint64_t v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  CNALoggingContextDebug();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v5, "count");
    if (v7 < 0x1F5)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v7, v42);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("first %lu of %lu"), 500, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v44 = v8;
    _os_log_impl(&dword_1B9950000, v6, OS_LOG_TYPE_DEFAULT, "Calling prepareResults: (%{public}@)", buf, 0xCu);

  }
  -[CNAutocompleteQueryResponsePreparer findUniqueResults:](self, "findUniqueResults:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CNALoggingContextDebug();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v9, "count");
    if (v11 < 0x1F5)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v11, v42);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("first %lu of %lu"), 500, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v44 = v12;
    _os_log_impl(&dword_1B9950000, v10, OS_LOG_TYPE_DEFAULT, "Found unique results: (%{public}@)", buf, 0xCu);

  }
  -[CNAutocompleteQueryResponsePreparer resultsNotPreviouslyReturned:](self, "resultsNotPreviouslyReturned:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CNALoggingContextDebug();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_msgSend(v13, "count");
    if (v15 < 0x1F5)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v15, v42);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("first %lu of %lu"), 500, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v44 = v16;
    _os_log_impl(&dword_1B9950000, v14, OS_LOG_TYPE_DEFAULT, "Found unique results not previously returned: (%{public}@)", buf, 0xCu);

  }
  CNALoggingContextDebug();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend(v13, "count");
    if (v18 < 0x1F5)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v18, v42);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("first %lu of %lu"), 500, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v44 = v19;
    _os_log_impl(&dword_1B9950000, v17, OS_LOG_TYPE_DEFAULT, "Found unique new results not previously returned: (%{public}@)", buf, 0xCu);

  }
  -[CNAutocompleteQueryResponsePreparer fetchRequest](self, "fetchRequest");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "searchString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "length");

  CNALoggingContextDebug();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if (v22)
  {
    if (v24)
    {
      v25 = objc_msgSend(v13, "count");
      if (v25 < 0x1F5)
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v25, v42);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("first %lu of %lu"), 500, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v27;
      _os_log_impl(&dword_1B9950000, v23, OS_LOG_TYPE_DEFAULT, "Search string has length > 0: (%{public}@)", buf, 0xCu);

    }
    -[CNAutocompleteQueryResponsePreparer applyPriorityResultsOrder:](self, "applyPriorityResultsOrder:", v13);
    v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v24)
    {
      v26 = objc_msgSend(v13, "count");
      if (v26 < 0x1F5)
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v26, v42);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("first %lu of %lu"), 500, v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v29;
      _os_log_impl(&dword_1B9950000, v23, OS_LOG_TYPE_DEFAULT, "Search string has length = 0: (%{public}@)", buf, 0xCu);

    }
    v28 = v13;
  }
  v30 = v28;
  CNALoggingContextDebug();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = objc_msgSend(v9, "count");
    if (v32 < 0x1F5)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v32, v42);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("first %lu of %lu"), 500, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_cn_take:", 500);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543619;
    v44 = v33;
    v45 = 2113;
    v46 = v34;
    _os_log_impl(&dword_1B9950000, v31, OS_LOG_TYPE_DEFAULT, "Unique results: (%{public}@): %{private}@", buf, 0x16u);

  }
  if (CNAutocompleteIsDebugLoggingEnabled())
  {
    v35 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v35, "removeObjectsInArray:", v13);
    CNALoggingContextDebug();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v44 = v35;
      _os_log_impl(&dword_1B9950000, v36, OS_LOG_TYPE_DEFAULT, "Dropping duplicate results: %{private}@", buf, 0xCu);
    }

    CNALoggingContextDebug();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = objc_msgSend(v30, "count");
      if (v38 < 0x1F5)
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v38, v42);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("first %lu of %lu"), 500, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "_cn_take:", 500);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543619;
      v44 = v39;
      v45 = 2113;
      v46 = v40;
      _os_log_impl(&dword_1B9950000, v37, OS_LOG_TYPE_DEFAULT, "Will return re-ranked results (%{public}@): %{private}@", buf, 0x16u);

    }
  }

  return v30;
}

- (id)findUniqueResults:(id)a3
{
  return +[CNAutocompleteQueryResponseUniqueResultFinder findUniqueResults:duplicateResultHandler:](CNAutocompleteQueryResponseUniqueResultFinder, "findUniqueResults:duplicateResultHandler:", a3, &__block_literal_global_25);
}

uint64_t __57__CNAutocompleteQueryResponsePreparer_findUniqueResults___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateUsingInformationFromRelatedResult:");
}

- (id)resultsNotPreviouslyReturned:(id)a3
{
  NSMutableOrderedSet *previouslyReturnedResults;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  previouslyReturnedResults = self->_previouslyReturnedResults;
  v5 = a3;
  v6 = -[NSMutableOrderedSet count](previouslyReturnedResults, "count");
  -[NSMutableOrderedSet addObjectsFromArray:](self->_previouslyReturnedResults, "addObjectsFromArray:", v5);

  v7 = -[NSMutableOrderedSet count](self->_previouslyReturnedResults, "count") - v6;
  -[NSMutableOrderedSet array](self->_previouslyReturnedResults, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subarrayWithRange:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)applyPriorityResultsOrder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0D13A38];
  v5 = a3;
  objc_msgSend(v4, "currentEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "suggestedResultPrioritization");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAutocompleteQueryResponsePreparer fetchRequest](self, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteQueryResponsePreparer matchingPriorityResultsPromise](self, "matchingPriorityResultsPromise");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applyPriorityOrderToResults:fetchRequest:andCompletePriorityResultsPromise:", v5, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)addDiagnosticLog:(id)a3
{
  id v4;
  _CNDiagnosticResponsePreparer *v5;
  void *v6;
  _CNDiagnosticResponsePreparer *v7;

  v4 = a3;
  v5 = [_CNDiagnosticResponsePreparer alloc];
  -[CNAutocompleteQueryResponsePreparer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_CNDiagnosticResponsePreparer initWithResponsePreparer:delegate:log:](v5, "initWithResponsePreparer:delegate:log:", self, v6, v4);

  return v7;
}

- (id)sortResults
{
  _CNSortingResponsePreparer *v3;
  void *v4;
  _CNSortingResponsePreparer *v5;

  v3 = [_CNSortingResponsePreparer alloc];
  -[CNAutocompleteQueryResponsePreparer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_CNAutocompleteResponsePreparerDecorator initWithResponsePreparer:delegate:](v3, "initWithResponsePreparer:delegate:", self, v4);

  return v5;
}

- (id)askDelegateToAdjustResults
{
  _CNDelegateAdjustingResponsePreparer *v3;
  void *v4;
  _CNDelegateAdjustingResponsePreparer *v5;

  v3 = [_CNDelegateAdjustingResponsePreparer alloc];
  -[CNAutocompleteQueryResponsePreparer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_CNAutocompleteResponsePreparerDecorator initWithResponsePreparer:delegate:](v3, "initWithResponsePreparer:delegate:", self, v4);

  return v5;
}

- (id)suppressResultsWithAddresses:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _CNFilteringResponsePreparer *v7;
  void *v8;
  id v9;
  _CNFilteringResponsePreparer *v10;
  _QWORD v12[4];
  id v13;

  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a3, "_cn_map:", CNAutocompleteResultAddressStringForHashingTransform);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [_CNFilteringResponsePreparer alloc];
  -[CNAutocompleteQueryResponsePreparer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__CNAutocompleteQueryResponsePreparer_suppressResultsWithAddresses___block_invoke;
  v12[3] = &unk_1E70DFA30;
  v13 = v6;
  v9 = v6;
  v10 = -[_CNFilteringResponsePreparer initWithResponsePreparer:delegate:filter:](v7, "initWithResponsePreparer:delegate:filter:", self, v8, v12);

  return v10;
}

uint64_t __68__CNAutocompleteQueryResponsePreparer_suppressResultsWithAddresses___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(uint64_t, void *);
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (void (**)(uint64_t, void *))CNAutocompleteResultAddressStringForHashingTransform;
  objc_msgSend(a2, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2]((uint64_t)v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6) ^ 1;
  return v7;
}

- (CNAutocompleteFetchDelegate)delegate
{
  return (CNAutocompleteFetchDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CNAutocompleteFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (CNFuture)priorityResultsFuture
{
  return self->_priorityResultsFuture;
}

- (void)setPriorityResultsFuture:(id)a3
{
  objc_storeStrong((id *)&self->_priorityResultsFuture, a3);
}

- (CNPromise)matchingPriorityResultsPromise
{
  return self->_matchingPriorityResultsPromise;
}

- (void)setMatchingPriorityResultsPromise:(id)a3
{
  objc_storeStrong((id *)&self->_matchingPriorityResultsPromise, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingPriorityResultsPromise, 0);
  objc_storeStrong((id *)&self->_priorityResultsFuture, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_handleStringClassifier, 0);
  objc_storeStrong((id *)&self->_previouslyReturnedResults, 0);
}

@end
