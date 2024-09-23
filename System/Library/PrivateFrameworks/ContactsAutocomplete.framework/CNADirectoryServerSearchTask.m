@implementation CNADirectoryServerSearchTask

- (CNADirectoryServerSearchTask)initWithRequest:(id)a3 contactStore:(id)a4 cancelationToken:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNADirectoryServerSearchTask *v12;
  CNADirectoryServerSearchTask *v13;
  CNADirectoryServerSearchTask *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNADirectoryServerSearchTask;
  v12 = -[CNTask initWithName:](&v16, sel_initWithName_, CFSTR("com.apple.contacts.autocomplete.directory-server-search"));
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_contactStore, a4);
    objc_storeStrong((id *)&v13->_cancelationToken, a5);
    v14 = v13;
  }

  return v13;
}

- (id)run
{
  -[CNADirectoryServerSearchTask validateRequest](self, "validateRequest");
  -[CNADirectoryServerSearchTask fetchServerSearchContainers](self, "fetchServerSearchContainers");
  -[CNADirectoryServerSearchTask searchServerContainers](self, "searchServerContainers");
  -[CNADirectoryServerSearchTask convertResults](self, "convertResults");
  -[CNADirectoryServerSearchTask createReturnValue](self, "createReturnValue");
  return self->_returnValue;
}

- (void)validateRequest
{
  uint64_t v3;
  void *v4;
  CNResult *v5;
  CNResult *returnValue;

  v3 = *MEMORY[0x1E0D13848];
  -[CNAutocompleteFetchRequest searchString](self->_request, "searchString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  if ((_DWORD)v3)
  {
    objc_msgSend(MEMORY[0x1E0D13B60], "successWithValue:", MEMORY[0x1E0C9AA60]);
    v5 = (CNResult *)objc_claimAutoreleasedReturnValue();
    returnValue = self->_returnValue;
    self->_returnValue = v5;

  }
}

- (void)fetchServerSearchContainers
{
  void *v3;
  NSArray *v4;
  id v5;
  NSArray *containers;
  CNResult *v7;
  CNResult *returnValue;
  id v9;

  if ((-[CNCancelationToken isCanceled](self->_cancelationToken, "isCanceled") & 1) == 0)
  {
    -[CNADirectoryServerSearchTask contactStore](self, "contactStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    objc_msgSend(v3, "serverSearchContainersMatchingPredicate:error:", 0, &v9);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = v9;
    containers = self->_containers;
    self->_containers = v4;

    if (!self->_containers)
    {
      objc_msgSend(MEMORY[0x1E0D13B60], "failureWithError:", v5);
      v7 = (CNResult *)objc_claimAutoreleasedReturnValue();
      returnValue = self->_returnValue;
      self->_returnValue = v7;

    }
  }
}

- (void)searchServerContainers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CNCancelationToken *cancelationToken;
  id v15;
  void *v16;
  NSArray *v17;
  NSArray *daResults;
  CNResult *v19;
  CNResult *returnValue;
  NSArray *obj;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((-[CNCancelationToken isCanceled](self->_cancelationToken, "isCanceled") & 1) == 0 && !self->_returnValue)
  {
    if (-[NSArray count](self->_containers, "count"))
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D139E0]), "initWithStartingCount:", -[NSArray count](self->_containers, "count"));
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_containers, "count"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      obj = self->_containers;
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v25 != v7)
              objc_enumerationMutation(obj);
            v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            -[CNADirectoryServerSearchTask makeQueryForContainer:withLatch:andCollectConsumers:](self, "makeQueryForContainer:withLatch:andCollectConsumers:", v9, v3, v4);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "dataAccessConnection");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "accountIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "performServerContactsSearch:forAccountWithID:", v10, v13);

            cancelationToken = self->_cancelationToken;
            v22[0] = MEMORY[0x1E0C809B0];
            v22[1] = 3221225472;
            v22[2] = __54__CNADirectoryServerSearchTask_searchServerContainers__block_invoke;
            v22[3] = &unk_1E70DEE90;
            v23 = v10;
            v15 = v10;
            -[CNCancelationToken addCancelationBlock:](cancelationToken, "addCancelationBlock:", v22);

          }
          v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v6);
      }

      objc_msgSend(v3, "await");
      +[CNDASearchQueryConsumer SuccessfulResults](CNDASearchQueryConsumer, "SuccessfulResults");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_cn_flatMap:", v16);
      v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
      daResults = self->_daResults;
      self->_daResults = v17;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D13B60], "successWithValue:", MEMORY[0x1E0C9AA60]);
      v19 = (CNResult *)objc_claimAutoreleasedReturnValue();
      returnValue = self->_returnValue;
      self->_returnValue = v19;

    }
  }
}

void __54__CNADirectoryServerSearchTask_searchServerContainers__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataAccessConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelServerContactsSearch:", *(_QWORD *)(a1 + 32));

}

- (id)makeQueryForContainer:(id)a3 withLatch:(id)a4 andCollectConsumers:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  CNDASearchQueryConsumer *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "externalIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "externalModificationTag");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[CNDASearchQueryConsumer initWithLatch:]([CNDASearchQueryConsumer alloc], "initWithLatch:", v9);
  objc_msgSend(v8, "addObject:", v13);

  v14 = (void *)MEMORY[0x1E0D1C3F0];
  -[CNAutocompleteFetchRequest searchString](self->_request, "searchString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contactsSearchQueryWithSearchString:searchBase:searchScope:consumer:", v15, v11, v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setTimeLimit:", 30);
  objc_msgSend(v16, "setIncludePhotos:", 0);
  objc_msgSend(v16, "setCalendarInitiated:", -[CNAutocompleteFetchRequest searchType](self->_request, "searchType") == 3);

  return v16;
}

- (void)convertResults
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *daResults;
  void *v7;
  NSArray *v8;
  NSArray *results;
  id v10;

  if ((-[CNCancelationToken isCanceled](self->_cancelationToken, "isCanceled") & 1) == 0 && !self->_returnValue)
  {
    -[CNAutocompleteFetchRequest priorityDomainForSorting](self->_request, "priorityDomainForSorting");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteFetchRequest fetchContext](self->_request, "fetchContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendingAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNAutocompleteResultFactory factoryWithPriorityDomain:sendingAddress:](CNAutocompleteResultFactory, "factoryWithPriorityDomain:sendingAddress:", v3, v5);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    daResults = self->_daResults;
    +[CNADASearchResultConverter resultTransformForRequest:factory:](CNADASearchResultConverter, "resultTransformForRequest:factory:", self->_request, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray _cn_flatMap:](daResults, "_cn_flatMap:", v7);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    results = self->_results;
    self->_results = v8;

  }
}

- (void)createReturnValue
{
  void *v3;
  CNResult *v4;
  CNResult *returnValue;
  CNResult *v6;
  CNResult *v7;
  void *v8;

  if (-[CNCancelationToken isCanceled](self->_cancelationToken, "isCanceled"))
  {
    v3 = (void *)MEMORY[0x1E0D13B60];
    objc_msgSend(MEMORY[0x1E0D13A50], "userCanceledError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "failureWithError:", v8);
    v4 = (CNResult *)objc_claimAutoreleasedReturnValue();
    returnValue = self->_returnValue;
    self->_returnValue = v4;

  }
  else if (!self->_returnValue)
  {
    objc_msgSend(MEMORY[0x1E0D13B60], "successWithValue:", self->_results);
    v6 = (CNResult *)objc_claimAutoreleasedReturnValue();
    v7 = self->_returnValue;
    self->_returnValue = v6;

  }
}

- (CNAutocompleteFetchRequest)request
{
  return self->_request;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (CNCancelationToken)cancelationToken
{
  return self->_cancelationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_daResults, 0);
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_returnValue, 0);
}

@end
