@implementation CNAutocompleteSearchManager

- (CNAutocompleteSearchManager)initWithAutocompleteSearchType:(unint64_t)a3
{
  id v5;
  CNAutocompleteSearchManager *v6;

  v5 = objc_alloc_init(MEMORY[0x1E0D135F8]);
  v6 = -[CNAutocompleteSearchManager initWithAutocompleteStore:searchType:](self, "initWithAutocompleteStore:searchType:", v5, a3);

  return v6;
}

- (CNAutocompleteSearchManager)initWithAutocompleteStore:(id)a3 searchType:(unint64_t)a4
{
  id v7;
  CNAutocompleteSearchManager *v8;
  CNAutocompleteSearchManager *v9;
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
  v19.super_class = (Class)CNAutocompleteSearchManager;
  v8 = -[CNAutocompleteSearchManager init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_shouldUnifyResults = 1;
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

- (CNAutocompleteSearchManager)init
{
  return -[CNAutocompleteSearchManager initWithAutocompleteSearchType:](self, "initWithAutocompleteSearchType:", 0);
}

- (void)setSearchTypes:(unint64_t)a3
{
  self->_searchTypes = a3;
}

- (void)setSearchControllerOptions:(id)a3
{
  objc_storeStrong((id *)&self->_searchControllerOptions, a3);
}

- (void)setShouldIncludeGroupResults:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *shouldIncludeGroupResultsImpl;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  shouldIncludeGroupResultsImpl = self->_shouldIncludeGroupResultsImpl;
  self->_shouldIncludeGroupResultsImpl = v4;

}

- (BOOL)shouldIncludeGroupResults
{
  NSNumber *shouldIncludeGroupResultsImpl;

  shouldIncludeGroupResultsImpl = self->_shouldIncludeGroupResultsImpl;
  return !shouldIncludeGroupResultsImpl || -[NSNumber BOOLValue](shouldIncludeGroupResultsImpl, "BOOLValue");
}

- (id)_nextTaskID
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_genNumber++);
}

- (void)didSelectRecipient:(id)a3 atIndex:(unint64_t)a4
{
  CNAutocompleteStore *autocompleteStore;
  id v6;

  autocompleteStore = self->_autocompleteStore;
  objc_msgSend(a3, "autocompleteResult");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteStore userSelectedResult:atSortedIndex:](autocompleteStore, "userSelectedResult:atSortedIndex:", v6, a4);

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
      v7[2] = __53__CNAutocompleteSearchManager_removeRecipientResult___block_invoke;
      v7[3] = &unk_1E62BFDD8;
      v8 = v4;
      -[CNAutocompleteStore ignoreResult:completionHandler:](autocompleteStore, "ignoreResult:completionHandler:", v5, v7);

    }
  }

}

void __53__CNAutocompleteSearchManager_removeRecipientResult___block_invoke(uint64_t a1, char a2, void *a3)
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
    contactsSearchManagerLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1B10FF000, v6, OS_LOG_TYPE_INFO, "removal of autocomplete recent %@ failed: %@", (uint8_t *)&v8, 0x16u);
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
  NSObject *v13;
  NSObject *v14;
  void *v15;
  os_signpost_id_t v16;
  CNAutocompleteSearchControllerOptions *searchControllerOptions;
  NSOperationQueue *queue;
  void *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *taskContextsByTaskID;
  void *v23;
  void *v24;
  uint8_t v26[16];
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CNAutocompleteSearchManager _nextTaskID](self, "_nextTaskID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactsAutocompleteSearchOperation operationWithOwner:text:taskID:autocompleteStore:](CNContactsAutocompleteSearchOperation, "operationWithOwner:text:taskID:autocompleteStore:", self, v8, v11, self->_autocompleteStore);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    contactsSearchManagerLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[CNAutocompleteSearchManager searchForText:withAutocompleteFetchContext:consumer:].cold.1((uint64_t)v8, v12, v13);

    contactsSearchManagerLog();
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "taskID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "unsignedIntegerValue");

    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)v26 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B10FF000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "autocompleteTextSearch", "autocompleteSearch started", v26, 2u);
    }

    objc_msgSend(v12, "setShouldUnifyResults:", -[CNAutocompleteSearchManager shouldUnifyResults](self, "shouldUnifyResults"));
    objc_msgSend(v12, "setShouldIncludeGroupResults:", self->_shouldIncludeGroupResultsImpl);
    searchControllerOptions = self->_searchControllerOptions;
    if (searchControllerOptions)
      objc_msgSend(v12, "setAddressableGroupResultStyle:", -[CNAutocompleteSearchControllerOptions addressableGroupResultStyle](searchControllerOptions, "addressableGroupResultStyle"));
    objc_msgSend(v12, "configureForSearchTypes:", self->_searchTypes);
    objc_msgSend(v12, "setFetchContext:", v9);
    objc_msgSend(v12, "setSimulateResults:", -[CNAutocompleteSearchManager isSimulatedResultsEnabled](self, "isSimulatedResultsEnabled"));
    queue = self->_queue;
    v27[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue addOperations:waitUntilFinished:](queue, "addOperations:waitUntilFinished:", v19, 0);

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNAutocompleteContactsSearchTaskContext contextWithConsumer:text:operations:searchQueries:](CNAutocompleteContactsSearchTaskContext, "contextWithConsumer:text:operations:searchQueries:", v10, v8, v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      taskContextsByTaskID = self->_taskContextsByTaskID;
      objc_msgSend(v12, "taskID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](taskContextsByTaskID, "setObject:forKey:", v21, v23);

    }
  }
  objc_msgSend(v12, "taskID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)searchForText:(id)a3 consumer:(id)a4
{
  return -[CNAutocompleteSearchManager searchForText:withAutocompleteFetchContext:consumer:](self, "searchForText:withAutocompleteFetchContext:consumer:", a3, 0, a4);
}

- (id)searchForCorecipientsWithAutocompleteFetchContext:(id)a3 consumer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  os_signpost_id_t v12;
  CNAutocompleteSearchControllerOptions *searchControllerOptions;
  NSMutableArray *corecipientSearchTaskIDs;
  NSMutableArray *v15;
  NSMutableArray *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t v22[16];

  v6 = a3;
  v7 = a4;
  -[CNAutocompleteSearchManager _nextTaskID](self, "_nextTaskID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactsAutocompleteSearchOperation operationWithOwner:text:taskID:autocompleteStore:](CNContactsAutocompleteSearchOperation, "operationWithOwner:text:taskID:autocompleteStore:", self, 0, v8, self->_autocompleteStore);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  contactsSearchManagerLog();
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "taskID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v22 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B10FF000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "autocompleteCorecipientsSearch", "autocompleteSearch (corecipients) started", v22, 2u);
  }

  objc_msgSend(v9, "setShouldIncludeGroupResults:", self->_shouldIncludeGroupResultsImpl);
  objc_msgSend(v9, "configureForSearchTypes:", self->_searchTypes);
  objc_msgSend(v9, "setFetchContext:", v6);
  objc_msgSend(v9, "setSimulateResults:", -[CNAutocompleteSearchManager isSimulatedResultsEnabled](self, "isSimulatedResultsEnabled"));
  searchControllerOptions = self->_searchControllerOptions;
  if (searchControllerOptions)
    objc_msgSend(v9, "setAddressableGroupResultStyle:", -[CNAutocompleteSearchControllerOptions addressableGroupResultStyle](searchControllerOptions, "addressableGroupResultStyle"));
  corecipientSearchTaskIDs = self->_corecipientSearchTaskIDs;
  if (!corecipientSearchTaskIDs)
  {
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = self->_corecipientSearchTaskIDs;
    self->_corecipientSearchTaskIDs = v15;

    corecipientSearchTaskIDs = self->_corecipientSearchTaskIDs;
  }
  -[NSMutableArray addObject:](corecipientSearchTaskIDs, "addObject:", v8);
  -[NSOperationQueue addOperation:](self->_queue, "addOperation:", v9);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "otherAddressesAlreadyChosen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "componentsJoinedByString:", CFSTR(", "));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAutocompleteContactsSearchTaskContext contextWithConsumer:text:operations:searchQueries:](CNAutocompleteContactsSearchTaskContext, "contextWithConsumer:text:operations:searchQueries:", v7, v19, v17, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    -[NSMutableDictionary setObject:forKey:](self->_taskContextsByTaskID, "setObject:forKey:", v20, v8);

  return v8;
}

- (void)_handleTaskFinished:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  contactsSearchManagerLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CNAutocompleteSearchManager _handleTaskFinished:context:].cold.1();

  objc_msgSend(v7, "consumer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    objc_msgSend(v7, "consumer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "finishedTaskWithID:", v6);

  }
  -[NSMutableDictionary removeObjectForKey:](self->_taskContextsByTaskID, "removeObjectForKey:", v6);

}

- (void)_handleContactsAutocompleteSearchFinished:(id)a3 taskID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  os_signpost_id_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  contactsSearchManagerLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CNAutocompleteSearchManager _handleTaskFinished:context:].cold.1();

  -[NSMutableDictionary objectForKey:](self->_taskContextsByTaskID, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NSMutableArray containsObject:](self->_corecipientSearchTaskIDs, "containsObject:", v6);
  contactsSearchManagerLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "unsignedIntegerValue");
  v13 = v12;
  if (v10)
  {
    if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B10FF000, v11, OS_SIGNPOST_INTERVAL_END, v13, "autocompleteCorecipientsSearch", "autocompleteSearchFinished (corecipients)", buf, 2u);
    }

    if (objc_msgSend(v9, "consumerRespondsToCallbacks"))
    {
      objc_msgSend(v9, "consumer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "finishedSearchingForCorecipients");

    }
    -[NSMutableArray removeObject:](self->_corecipientSearchTaskIDs, "removeObject:", v6);
  }
  else
  {
    if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)v17 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B10FF000, v11, OS_SIGNPOST_INTERVAL_END, v13, "autocompleteTextSearch", "autocompleteSearchFinished", v17, 2u);
    }

    if (objc_msgSend(v9, "consumerRespondsToCallbacks"))
    {
      objc_msgSend(v9, "consumer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "finishedSearchingForAutocompleteResults");

    }
  }
  objc_msgSend(v9, "operations");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObject:", v7);

  if (objc_msgSend(v9, "done"))
    -[CNAutocompleteSearchManager _handleTaskFinished:context:](self, "_handleTaskFinished:context:", v6, v9);

}

- (void)_handleContactsAutocompleteSearch:(id)a3 returnedResults:(id)a4 taskID:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  os_signpost_id_t v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  contactsSearchManagerLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[CNAutocompleteSearchManager _handleContactsAutocompleteSearch:returnedResults:taskID:].cold.1((uint64_t)v8, v7, v9);

  contactsSearchManagerLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "unsignedIntegerValue");
  if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v12 = v11;
    if (os_signpost_enabled(v10))
    {
      v17 = 134217984;
      v18 = objc_msgSend(v7, "count");
      _os_signpost_emit_with_name_impl(&dword_1B10FF000, v10, OS_SIGNPOST_EVENT, v12, "autocompleteSearchReturnedResults", "found %ld autocomplete results", (uint8_t *)&v17, 0xCu);
    }
  }

  -[NSMutableDictionary objectForKey:](self->_taskContextsByTaskID, "objectForKey:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[NSMutableArray containsObject:](self->_corecipientSearchTaskIDs, "containsObject:", v8);
  v15 = objc_msgSend(v13, "consumerRespondsToCallbacks");
  if (v14)
  {
    if (v15)
    {
      objc_msgSend(v13, "consumer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "consumeCorecipientSearchResults:taskID:", v7, v8);
LABEL_11:

    }
  }
  else if (v15)
  {
    objc_msgSend(v13, "consumer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "consumeAutocompleteSearchResults:taskID:", v7, v8);
    goto LABEL_11;
  }

}

- (void)cancelTaskWithID:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  os_signpost_id_t v9;
  const char *v10;
  const char *v11;
  uint8_t *v12;
  void *v13;
  void *v14;
  __int16 v15;
  __int16 v16;

  v4 = a3;
  contactsSearchManagerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CNAutocompleteSearchManager cancelTaskWithID:].cold.1();

  v6 = -[NSMutableArray containsObject:](self->_corecipientSearchTaskIDs, "containsObject:", v4);
  contactsSearchManagerLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "unsignedIntegerValue");
  v9 = v8;
  if (v6)
  {
    if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      v16 = 0;
      v10 = "autocompleteCorecipientsSearch";
      v11 = "autocompleteSearch (corecipients) was cancelled";
      v12 = (uint8_t *)&v16;
LABEL_10:
      _os_signpost_emit_with_name_impl(&dword_1B10FF000, v7, OS_SIGNPOST_INTERVAL_END, v9, v10, v11, v12, 2u);
    }
  }
  else if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v15 = 0;
    v10 = "autocompleteTextSearch";
    v11 = "autocompleteSearch was cancelled";
    v12 = (uint8_t *)&v15;
    goto LABEL_10;
  }

  -[NSMutableDictionary objectForKey:](self->_taskContextsByTaskID, "objectForKey:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "operations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "makeObjectsPerformSelector:", sel_cancel);

  -[NSMutableDictionary removeObjectForKey:](self->_taskContextsByTaskID, "removeObjectForKey:", v4);
}

- (void)dealloc
{
  int contactSearchAccountChangedToken;
  objc_super v4;

  contactSearchAccountChangedToken = self->_contactSearchAccountChangedToken;
  if (contactSearchAccountChangedToken)
    notify_cancel(contactSearchAccountChangedToken);
  v4.receiver = self;
  v4.super_class = (Class)CNAutocompleteSearchManager;
  -[CNAutocompleteSearchManager dealloc](&v4, sel_dealloc);
}

- (NSString)recentsBundleIdentifier
{
  return self->_recentsBundleIdentifier;
}

- (void)setRecentsBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)searchAccountIDs
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSearchAccountIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)sendingAddress
{
  return self->_sendingAddress;
}

- (void)setSendingAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (CNAutocompleteUIFetchDelegate)fetchDelegate
{
  return (CNAutocompleteUIFetchDelegate *)objc_loadWeakRetained((id *)&self->_fetchDelegate);
}

- (void)setFetchDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_fetchDelegate, a3);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)shouldUnifyResults
{
  return self->_shouldUnifyResults;
}

- (void)setShouldUnifyResults:(BOOL)a3
{
  self->_shouldUnifyResults = a3;
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
  objc_destroyWeak((id *)&self->_fetchDelegate);
  objc_storeStrong((id *)&self->_recentsBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sendingAddress, 0);
  objc_storeStrong((id *)&self->_corecipientSearchTaskIDs, 0);
  objc_storeStrong((id *)&self->_shouldIncludeGroupResultsImpl, 0);
  objc_storeStrong((id *)&self->_searchAccounts, 0);
  objc_storeStrong((id *)&self->_explicitSearchAccountIDs, 0);
  objc_storeStrong((id *)&self->_searchControllerOptions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_autocompleteStore, 0);
  objc_storeStrong((id *)&self->_taskContextsByTaskID, 0);
}

- (void)searchForText:(uint64_t)a1 withAutocompleteFetchContext:(void *)a2 consumer:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "taskID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_2_1(&dword_1B10FF000, a3, v6, "Beginning CNContactsAutocompleteSearchOperation for \"%@\" (task %@)", (uint8_t *)&v7);

}

- (void)_handleTaskFinished:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B10FF000, v0, v1, "task %@ finished", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_handleContactsAutocompleteSearch:(uint64_t)a1 returnedResults:(void *)a2 taskID:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 138412546;
  v6 = a1;
  v7 = 2048;
  v8 = objc_msgSend(a2, "count");
  OUTLINED_FUNCTION_2_1(&dword_1B10FF000, a3, v4, "task %@: found %ld autocomplete results", (uint8_t *)&v5);
}

- (void)cancelTaskWithID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B10FF000, v0, v1, "task %@ cancelled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
