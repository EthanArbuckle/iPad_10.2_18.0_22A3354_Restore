@implementation _CSContactSearch

+ (OS_dispatch_queue)targetQueue
{
  if (targetQueue_onceToken != -1)
    dispatch_once(&targetQueue_onceToken, &__block_literal_global_18);
  return (OS_dispatch_queue *)(id)targetQueue_targetQueue;
}

- (_CSContactSearch)initWithQuery:(id)a3 queryID:(unint64_t)a4 autocompleteEnabled:(BOOL)a5
{
  id v9;
  _CSContactSearch *v10;
  _CSContactSearch *v11;
  uint64_t v12;
  NSMutableArray *accumulatedContacts;
  id v14;
  const char *v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  objc_super v21;

  v9 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_CSContactSearch;
  v10 = -[_CSContactSearch init](&v21, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_query, a3);
    v11->_queryID = a4;
    v11->_autocompleteEnabled = a5;
    v11->_includeRecents = 1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    accumulatedContacts = v11->_accumulatedContacts;
    v11->_accumulatedContacts = (NSMutableArray *)v12;

    v14 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.corespotlight.contactSearch.%ld.%p"), a4, v11));
    v15 = (const char *)objc_msgSend(v14, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    +[_CSContactSearch targetQueue](_CSContactSearch, "targetQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create_with_target_V2(v15, v16, v17);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v18;

  }
  return v11;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_13(&dword_18C42F000, a1, a3, "[ContactSearch] Canceling auto complete request due to deallocation", a5, a6, a7, a8, 0);
}

- (void)start
{
  _CSContactSearch *v3;
  id completionHandler;
  NSObject *v5;
  qos_class_t v6;
  NSObject *queue;
  dispatch_block_t v8;
  _CSContactSearch *v9;
  NSObject *v10;
  void *v11;
  _QWORD block[5];
  uint8_t buf[16];

  self->_startTime = mach_absolute_time();
  v3 = self;
  objc_sync_enter(v3);
  completionHandler = v3->_completionHandler;
  objc_sync_exit(v3);

  if (completionHandler)
  {
    -[_CSContactSearch query](v3, "query");
    v5 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject length](v5, "length"))
    {
      v6 = qos_class_self();
      queue = v3->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __25___CSContactSearch_start__block_invoke;
      block[3] = &unk_1E2401238;
      block[4] = v3;
      v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v6, 0, block);
      dispatch_async(queue, v8);

    }
    else
    {
      logForCSLogCategoryDefault();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18C42F000, v10, OS_LOG_TYPE_INFO, "[ContactSearch] Ignoring attempt to start a contact search with an empty query", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespotlight.contactSearch"), -1, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CSContactSearch handleCompletionWithContacts:error:](v3, "handleCompletionWithContacts:error:", 0, v11);

    }
  }
  else
  {
    v9 = v3;
    objc_sync_enter(v9);
    v9->_finished = 1;
    objc_sync_exit(v9);

    logForCSLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C42F000, v5, OS_LOG_TYPE_INFO, "[ContactSearch] Ignoring attempt to start a contact search with no completionHandler set", buf, 2u);
    }
  }

}

- (void)cancel
{
  OUTLINED_FUNCTION_13(&dword_18C42F000, a1, a3, "[ContactSearch] Canceling auto complete request", a5, a6, a7, a8, 0);
}

+ (id)contactStore
{
  if (contactStore_onceToken != -1)
    dispatch_once(&contactStore_onceToken, &__block_literal_global_78);
  return (id)contactStore_store;
}

+ (id)autocompleteStore
{
  if (autocompleteStore_onceToken != -1)
    dispatch_once(&autocompleteStore_onceToken, &__block_literal_global_80);
  return (id)autocompleteStore_store;
}

- (void)startAutocompleteContactsSearch
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[CSAutocompleteContactsWrapper CNAutocompleteStoreClass](CSAutocompleteContactsWrapper, "CNAutocompleteStoreClass");
  if (!objc_opt_class())
  {
    logForCSLogCategoryDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_18C42F000, v3, OS_LOG_TYPE_INFO, "[ContactSearch] AutocompleteContacts unavailable.", (uint8_t *)&v12, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespotlight.contactSearch"), -3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CSContactSearch handleCompletionWithContacts:error:](self, "handleCompletionWithContacts:error:", 0, v4);

  }
  -[objc_class request](+[CSAutocompleteContactsWrapper CNAutocompleteFetchRequestClass](CSAutocompleteContactsWrapper, "CNAutocompleteFetchRequestClass"), "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CSContactSearch query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSearchString:", v6);

  objc_msgSend(v5, "setSearchType:", 0);
  objc_msgSend(v5, "setIncludeContacts:", 1);
  objc_msgSend(v5, "setIncludeRecents:", -[_CSContactSearch includeRecents](self, "includeRecents"));
  objc_msgSend(v5, "setIncludeSuggestions:", 0);
  objc_msgSend(v5, "setIncludeDirectoryServers:", 0);
  objc_msgSend(v5, "setIncludePredictions:", 0);
  objc_msgSend(v5, "setIncludeCalendarServers:", 0);
  objc_msgSend(v5, "setIncludeStewie:", 0);
  objc_msgSend(v5, "setIncludeLocalExtensions:", 0);
  logForCSLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    -[_CSContactSearch query](self, "query");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CSRedactString(v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v9;
    _os_log_impl(&dword_18C42F000, v7, OS_LOG_TYPE_INFO, "[ContactSearch] Fetching auto complete contacts for %@", (uint8_t *)&v12, 0xCu);

  }
  objc_msgSend((id)objc_opt_class(), "autocompleteStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "executeFetchRequest:delegate:", v5, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CSContactSearch setAutocompleteRequest:](self, "setAutocompleteRequest:", v11);
}

+ (id)filterContactsBasedOnUserQueryString:(id)a3 contacts:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (+[_CSContactSearch doesContactMatchTerm:contact:](_CSContactSearch, "doesContactMatchTerm:contact:", v5, v13, (_QWORD)v16))
        {
          objc_msgSend(v7, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_msgSend(v7, "copy");
  return v14;
}

+ (BOOL)doesContactMatchTerm:(id)a3 contact:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "localizedStandardRangeOfString:", v5);

  if (v8)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v6, "emailAddresses", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v9);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "localizedStandardRangeOfString:", v5))
          {
            LOBYTE(v10) = 1;
            goto LABEL_12;
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (void)startContactsSearch
{
  qos_class_t v3;
  NSObject *queue;
  dispatch_block_t v5;
  _QWORD block[5];

  v3 = qos_class_self();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39___CSContactSearch_startContactsSearch__block_invoke;
  block[3] = &unk_1E2401238;
  block[4] = self;
  v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v3, 0, block);
  dispatch_async(queue, v5);

}

- (id)contactsMatchingQuery:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[_CSContactSearch contactStore](_CSContactSearch, "contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class descriptorForRequiredKeysForStyle:](+[CSContactsWrapper CNContactFormatterClass](CSContactsWrapper, "CNContactFormatterClass"), "descriptorForRequiredKeysForStyle:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v7;
  +[CSContactsWrapper CNContactNicknameKey](CSContactsWrapper, "CNContactNicknameKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v8;
  +[CSContactsWrapper sharedInstance](CSContactsWrapper, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "CNContactEmailAddressesKeyString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(+[CSContactsWrapper CNContactFetchRequestClass](CSContactsWrapper, "CNContactFetchRequestClass")), "initWithKeysToFetch:", v11);
  -[objc_class predicateForContactsMatchingName:](+[CSContactsWrapper CNContactClass](CSContactsWrapper, "CNContactClass"), "predicateForContactsMatchingName:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPredicate:", v13);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v6;
  objc_sync_enter(v15);
  v22 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __48___CSContactSearch_contactsMatchingQuery_error___block_invoke;
  v20[3] = &unk_1E2404C28;
  v16 = v14;
  v21 = v16;
  objc_msgSend(v15, "enumerateContactsWithFetchRequest:error:usingBlock:", v12, &v22, v20);
  v17 = v22;

  objc_sync_exit(v15);
  if (v17)
  {
    v18 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v17);
  }
  else
  {
    v18 = v16;
  }

  return v18;
}

- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4
{
  id v6;
  unint64_t startTime;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  uint64_t i;
  void *v13;
  id v14;
  _CSContactSearchResult *v15;
  void *v16;
  _BOOL4 v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _CSContactSearchResult *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSMutableArray *v31;
  _CSContactSearch *v32;
  id v33;
  void *v34;
  char v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  void *v43;
  uint8_t v44[128];
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  double v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v6 = a4;
  v32 = self;
  startTime = self->_startTime;
  v8 = mach_absolute_time();
  if (CSNanosecondsSinceAbsoluteTime_onceToken != -1)
    dispatch_once(&CSNanosecondsSinceAbsoluteTime_onceToken, &__block_literal_global_210);
  v9 = CSNanosecondsSinceAbsoluteTime_sTimebaseInfo;
  v10 = *(unsigned int *)algn_1EE03A764;
  logForCSLogCategoryDefault();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v46 = objc_msgSend(v6, "count");
    v47 = 2048;
    v48 = (float)((v8 - startTime) * v9 / v10) / 1000000.0;
    _os_log_impl(&dword_18C42F000, v11, OS_LOG_TYPE_INFO, "[ContactSearch] Received %ld auto complete contacts after %.1fms", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v6;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v38)
  {
    v37 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v40 != v37)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        if (!objc_msgSend(v13, "resultType"))
        {
          objc_msgSend(v13, "value");
          v14 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "address");
          v15 = (_CSContactSearchResult *)objc_claimAutoreleasedReturnValue();
          if (-[_CSContactSearchResult length](v15, "length"))
          {
            objc_msgSend(v13, "value");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "addressType") == 1;

            if (!v17)
              continue;
            v35 = objc_msgSend(v13, "sourceType");
            v18 = objc_msgSend(v13, "sourceType");
            objc_msgSend(v13, "nameComponents");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              v14 = objc_alloc_init(MEMORY[0x1E0CB3850]);
              objc_msgSend(v13, "nameComponents");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "firstName");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "setGivenName:", v21);

              objc_msgSend(v13, "nameComponents");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "lastName");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "setFamilyName:", v23);

            }
            else
            {
              v14 = 0;
            }
            v24 = [_CSContactSearchResult alloc];
            objc_msgSend(v13, "displayName");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "value");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "address");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = v27;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "identifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "recentsIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = -[_CSContactSearchResult initWithDisplayName:nameComponents:emailAddresses:contactIdentifier:recentsIdentifier:sourceType:](v24, "initWithDisplayName:nameComponents:emailAddresses:contactIdentifier:recentsIdentifier:sourceType:", v25, v14, v28, v29, v30, v18 & 1 | (unint64_t)(v35 & 2));

            objc_msgSend(v34, "addObject:", v15);
          }

        }
      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v38);
  }

  if (objc_msgSend(v34, "count"))
  {
    v31 = v32->_accumulatedContacts;
    objc_sync_enter(v31);
    -[NSMutableArray addObjectsFromArray:](v32->_accumulatedContacts, "addObjectsFromArray:", v34);
    objc_sync_exit(v31);

  }
}

- (void)autocompleteFetchDidFinish:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *v5;

  v4 = self->_accumulatedContacts;
  objc_sync_enter(v4);
  v5 = self->_accumulatedContacts;
  objc_sync_exit(v4);

  -[_CSContactSearch handleCompletionWithContacts:error:](self, "handleCompletionWithContacts:error:", v5, 0);
}

- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4
{
  -[_CSContactSearch handleCompletionWithContacts:error:](self, "handleCompletionWithContacts:error:", 0, a4);
}

- (void)handleCompletionWithContacts:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  _CSContactSearch *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  unint64_t startTime;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  float v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[_CSContactSearch completionHandler](v8, "completionHandler");
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[_CSContactSearch setCompletionHandler:](v8, "setCompletionHandler:", 0);
  if (v8->_finished)
  {
    objc_sync_exit(v8);

  }
  else
  {
    v8->_finished = 1;
    objc_sync_exit(v8);

    if (v9)
    {
      startTime = v8->_startTime;
      v11 = mach_absolute_time();
      if (CSNanosecondsSinceAbsoluteTime_onceToken != -1)
        dispatch_once(&CSNanosecondsSinceAbsoluteTime_onceToken, &__block_literal_global_210);
      v13 = CSNanosecondsSinceAbsoluteTime_sTimebaseInfo;
      v12 = *(unsigned int *)algn_1EE03A764;
      logForCSLogCategoryDefault();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = (float)((v11 - startTime) * v13 / v12) / 1000000.0;
      if (v7)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[_CSContactSearch handleCompletionWithContacts:error:].cold.1((uint64_t)v7, v15, v16);

        ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, 0, v7);
      }
      else
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v17 = 134218240;
          v18 = objc_msgSend(v6, "count");
          v19 = 2048;
          v20 = v16;
          _os_log_impl(&dword_18C42F000, v15, OS_LOG_TYPE_INFO, "[ContactSearch] Finished fetching %ld contacts in %.1fms", (uint8_t *)&v17, 0x16u);
        }

        ((void (**)(_QWORD, id, _QWORD))v9)[2](v9, v6, 0);
      }
    }
  }

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)finished
{
  return self->_finished;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)query
{
  return self->_query;
}

- (unint64_t)queryID
{
  return self->_queryID;
}

- (BOOL)autocompleteEnabled
{
  return self->_autocompleteEnabled;
}

- (BOOL)includeRecents
{
  return self->_includeRecents;
}

- (CNCancelable)autocompleteRequest
{
  return self->_autocompleteRequest;
}

- (void)setAutocompleteRequest:(id)a3
{
  objc_storeStrong((id *)&self->_autocompleteRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autocompleteRequest, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_accumulatedContacts, 0);
}

- (void)handleCompletionWithContacts:(float)a3 error:.cold.1(uint64_t a1, NSObject *a2, float a3)
{
  int v3;
  double v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a3;
  v5 = 2112;
  v6 = a1;
  _os_log_error_impl(&dword_18C42F000, a2, OS_LOG_TYPE_ERROR, "[ContactSearch] Failed to fetch contacts in %.1fms: %@", (uint8_t *)&v3, 0x16u);
}

@end
