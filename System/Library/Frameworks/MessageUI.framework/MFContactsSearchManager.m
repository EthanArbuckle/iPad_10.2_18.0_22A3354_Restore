@implementation MFContactsSearchManager

- (MFContactsSearchManager)initWithAutocompleteSearchType:(unint64_t)a3
{
  id v5;
  MFContactsSearchManager *v6;

  v5 = objc_alloc_init(MEMORY[0x1E0D135F8]);
  v6 = -[MFContactsSearchManager initWithAutocompleteStore:searchType:](self, "initWithAutocompleteStore:searchType:", v5, a3);

  return v6;
}

- (MFContactsSearchManager)initWithAutocompleteStore:(id)a3 searchType:(unint64_t)a4
{
  id v7;
  MFContactsSearchManager *v8;
  MFContactsSearchManager *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *recentsBundleIdentifier;
  NSOperationQueue *v14;
  NSOperationQueue *queue;
  NSMutableDictionary *v16;
  NSMutableDictionary *taskContextsByTaskID;
  objc_super v19;

  v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MFContactsSearchManager;
  v8 = -[MFContactsSearchManager init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_searchTypes = 31;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    recentsBundleIdentifier = v9->_recentsBundleIdentifier;
    v9->_recentsBundleIdentifier = (NSString *)v12;

    v9->_autocompleteSearchType = a4;
    objc_storeStrong((id *)&v9->_autocompleteStore, a3);
    if (!v9->_queue)
    {
      v14 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
      queue = v9->_queue;
      v9->_queue = v14;

      -[NSOperationQueue setMaxConcurrentOperationCount:](v9->_queue, "setMaxConcurrentOperationCount:", 1);
      -[NSOperationQueue setQualityOfService:](v9->_queue, "setQualityOfService:", 25);
    }
    if (!v9->_taskContextsByTaskID)
    {
      v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      taskContextsByTaskID = v9->_taskContextsByTaskID;
      v9->_taskContextsByTaskID = v16;

    }
  }

  return v9;
}

- (MFContactsSearchManager)init
{
  return -[MFContactsSearchManager initWithAutocompleteSearchType:](self, "initWithAutocompleteSearchType:", 0);
}

- (void)setSearchTypes:(unint64_t)a3
{
  self->_searchTypes = a3;
}

- (id)_nextTaskID
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_genNumber++);
}

- (void)didSelectRecipient:(id)a3 atIndex:(unint64_t)a4
{
  CNAutocompleteStore *autocompleteStore;
  id v5;

  autocompleteStore = self->_autocompleteStore;
  objc_msgSend(a3, "autocompleteResult");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteStore userSelectedResult:atSortedIndex:](autocompleteStore, "userSelectedResult:atSortedIndex:");

}

- (void)removeRecipientResult:(id)a3
{
  id v4;
  void *v5;
  CNAutocompleteStore *autocompleteStore;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (objc_msgSend(v4, "isRemovableFromSearchResults"))
  {
    objc_msgSend(v4, "autocompleteResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      autocompleteStore = self->_autocompleteStore;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __49__MFContactsSearchManager_removeRecipientResult___block_invoke;
      v7[3] = &unk_1E5A66E38;
      v8 = v4;
      -[CNAutocompleteStore ignoreResult:completionHandler:](autocompleteStore, "ignoreResult:completionHandler:", v5, v7);

    }
  }

}

void __49__MFContactsSearchManager_removeRecipientResult___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    MFLogGeneral();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1AB96A000, v6, OS_LOG_TYPE_DEFAULT, "#Warning removal of autocomplete recent %@ failed: %@", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (id)searchForText:(id)a3 withAutocompleteFetchContext:(id)a4 consumer:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSOperationQueue *queue;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *taskContextsByTaskID;
  void *v18;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MFContactsSearchManager _nextTaskID](self, "_nextTaskID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFContactsAutocompleteSearchOperation operationWithOwner:text:taskID:autocompleteStore:](MFContactsAutocompleteSearchOperation, "operationWithOwner:text:taskID:autocompleteStore:", self, v8, v11, self->_autocompleteStore);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "configureForSearchTypes:", self->_searchTypes);
    objc_msgSend(v12, "setFetchContext:", v9);
    objc_msgSend(v12, "setSimulateResults:", -[MFContactsSearchManager isSimulatedResultsEnabled](self, "isSimulatedResultsEnabled"));
    queue = self->_queue;
    v21[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue addOperations:waitUntilFinished:](queue, "addOperations:waitUntilFinished:", v14, 0);

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFContactsSearchTaskContext contextWithConsumer:text:operations:searchQueries:](MFContactsSearchTaskContext, "contextWithConsumer:text:operations:searchQueries:", v10, v8, v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      taskContextsByTaskID = self->_taskContextsByTaskID;
      objc_msgSend(v12, "taskID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](taskContextsByTaskID, "setObject:forKey:", v16, v18);

    }
  }
  objc_msgSend(v12, "taskID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)searchForText:(id)a3 consumer:(id)a4
{
  -[MFContactsSearchManager searchForText:withAutocompleteFetchContext:consumer:](self, "searchForText:withAutocompleteFetchContext:consumer:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)searchForCorecipientsWithAutocompleteFetchContext:(id)a3 consumer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSMutableArray *corecipientSearchTaskIDs;
  NSMutableArray *v11;
  NSMutableArray *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  -[MFContactsSearchManager _nextTaskID](self, "_nextTaskID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFContactsAutocompleteSearchOperation operationWithOwner:text:taskID:autocompleteStore:](MFContactsAutocompleteSearchOperation, "operationWithOwner:text:taskID:autocompleteStore:", self, 0, v8, self->_autocompleteStore);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configureForSearchTypes:", self->_searchTypes);
  objc_msgSend(v9, "setFetchContext:", v6);
  objc_msgSend(v9, "setSimulateResults:", -[MFContactsSearchManager isSimulatedResultsEnabled](self, "isSimulatedResultsEnabled"));
  corecipientSearchTaskIDs = self->_corecipientSearchTaskIDs;
  if (!corecipientSearchTaskIDs)
  {
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = self->_corecipientSearchTaskIDs;
    self->_corecipientSearchTaskIDs = v11;

    corecipientSearchTaskIDs = self->_corecipientSearchTaskIDs;
  }
  -[NSMutableArray addObject:](corecipientSearchTaskIDs, "addObject:", v8);
  -[NSOperationQueue addOperation:](self->_queue, "addOperation:", v9);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "otherAddressesAlreadyChosen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFContactsSearchTaskContext contextWithConsumer:text:operations:searchQueries:](MFContactsSearchTaskContext, "contextWithConsumer:text:operations:searchQueries:", v7, v15, v13, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    -[NSMutableDictionary setObject:forKey:](self->_taskContextsByTaskID, "setObject:forKey:", v16, v8);

  return v8;
}

- (void)_handleTaskFinished:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v6, "consumer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v6, "consumer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishedTaskWithID:", v10);

  }
  -[NSMutableDictionary removeObjectForKey:](self->_taskContextsByTaskID, "removeObjectForKey:", v10);

}

- (void)_handleContactsAutocompleteSearchFinished:(id)a3 taskID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->_taskContextsByTaskID, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray containsObject:](self->_corecipientSearchTaskIDs, "containsObject:", v6))
  {
    if (objc_msgSend(v7, "consumerRespondsToCallbacks"))
    {
      objc_msgSend(v7, "consumer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "finishedSearchingForCorecipients");

    }
    -[NSMutableArray removeObject:](self->_corecipientSearchTaskIDs, "removeObject:", v6);
  }
  else if (objc_msgSend(v7, "consumerRespondsToCallbacks"))
  {
    objc_msgSend(v7, "consumer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishedSearchingForAutocompleteResults");

  }
  objc_msgSend(v7, "operations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v11);

  if (objc_msgSend(v7, "done"))
    -[MFContactsSearchManager _handleTaskFinished:context:](self, "_handleTaskFinished:context:", v6, v7);

}

- (void)_handleContactsAutocompleteSearch:(id)a3 returnedResults:(id)a4 taskID:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a5;
  -[NSMutableDictionary objectForKey:](self->_taskContextsByTaskID, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray containsObject:](self->_corecipientSearchTaskIDs, "containsObject:", v7))
  {
    if (objc_msgSend(v8, "consumerRespondsToCallbacks"))
    {
      objc_msgSend(v8, "consumer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "consumeCorecipientSearchResults:taskID:", v10, v7);
LABEL_6:

    }
  }
  else if (objc_msgSend(v8, "consumerRespondsToCallbacks"))
  {
    objc_msgSend(v8, "consumer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "consumeAutocompleteSearchResults:taskID:", v10, v7);
    goto LABEL_6;
  }

}

- (void)cancelTaskWithID:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_taskContextsByTaskID, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "operations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeObjectsPerformSelector:", sel_cancel);

  -[NSMutableDictionary removeObjectForKey:](self->_taskContextsByTaskID, "removeObjectForKey:", v6);
}

- (void)dealloc
{
  int contactSearchAccountChangedToken;
  objc_super v4;

  contactSearchAccountChangedToken = self->_contactSearchAccountChangedToken;
  if (contactSearchAccountChangedToken)
    notify_cancel(contactSearchAccountChangedToken);
  v4.receiver = self;
  v4.super_class = (Class)MFContactsSearchManager;
  -[MFContactsSearchManager dealloc](&v4, sel_dealloc);
}

- (NSString)recentsBundleIdentifier
{
  return self->_recentsBundleIdentifier;
}

- (void)setRecentsBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)searchAccountIDs
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSearchAccountIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)sendingAddress
{
  return self->_sendingAddress;
}

- (void)setSendingAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (unint64_t)implicitGroupCreationThreshold
{
  return self->_implicitGroupCreationThreshold;
}

- (void)setImplicitGroupCreationThreshold:(unint64_t)a3
{
  self->_implicitGroupCreationThreshold = a3;
}

- (BOOL)includeUpcomingEventMembers
{
  return self->_includeUpcomingEventMembers;
}

- (void)setIncludeUpcomingEventMembers:(BOOL)a3
{
  self->_includeUpcomingEventMembers = a3;
}

- (unint64_t)autocompleteSearchType
{
  return self->_autocompleteSearchType;
}

- (void)setAutocompleteSearchType:(unint64_t)a3
{
  self->_autocompleteSearchType = a3;
}

- (NSString)sendingAccountIdentifier
{
  return self->_sendingAccountIdentifier;
}

- (void)setSendingAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)isSimulatedResultsEnabled
{
  return self->_simulatedResultsEnabled;
}

- (void)setSimulatedResultsEnabled:(BOOL)a3
{
  self->_simulatedResultsEnabled = a3;
}

- (NSArray)searchAccounts
{
  return self->_searchAccounts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendingAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_recentsBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sendingAddress, 0);
  objc_storeStrong((id *)&self->_corecipientSearchTaskIDs, 0);
  objc_storeStrong((id *)&self->_searchAccounts, 0);
  objc_storeStrong((id *)&self->_explicitSearchAccountIDs, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_autocompleteStore, 0);
  objc_storeStrong((id *)&self->_taskContextsByTaskID, 0);
}

@end
