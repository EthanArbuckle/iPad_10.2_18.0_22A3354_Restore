@implementation EKAutocompleter

- (EKAutocompleter)initWithDelegate:(id)a3
{
  id v4;
  EKAutocompleter *v5;
  NSMutableArray *v6;
  NSMutableArray *contactResults;
  NSMutableArray *v8;
  NSMutableArray *directorySearchResults;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *directorySearchQueue;
  void *v13;
  objc_class *v14;
  uint64_t v15;
  CNAutocompleteStore *autocompleteStore;
  objc_super v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EKAutocompleter;
  v5 = -[EKAutocompleter init](&v18, sel_init);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    contactResults = v5->_contactResults;
    v5->_contactResults = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    directorySearchResults = v5->_directorySearchResults;
    v5->_directorySearchResults = v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("directorySearchQueue", v10);
    directorySearchQueue = v5->_directorySearchQueue;
    v5->_directorySearchQueue = (OS_dispatch_queue *)v11;

    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v13 = (void *)getCNAutocompleteStoreClass_softClass;
    v23 = getCNAutocompleteStoreClass_softClass;
    if (!getCNAutocompleteStoreClass_softClass)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __getCNAutocompleteStoreClass_block_invoke;
      v19[3] = &unk_1E4784C68;
      v19[4] = &v20;
      __getCNAutocompleteStoreClass_block_invoke((uint64_t)v19);
      v13 = (void *)v21[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v20, 8);
    v15 = objc_msgSend([v14 alloc], "initWithDelegate:", v5);
    autocompleteStore = v5->_autocompleteStore;
    v5->_autocompleteStore = (CNAutocompleteStore *)v15;

    if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE6A1E88))
    {
      -[EKAutocompleter setDelegate:](v5, "setDelegate:", v4);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v4, "autcompleterSetCNAutocompleteStore:", v5->_autocompleteStore);
    }
  }

  return v5;
}

- (id)searchFor:(id)a3 onSource:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    -[EKAutocompleter searchFor:onSource:withContext:].cold.2((uint64_t)v8, v11, v12);
  v13 = objc_msgSend(v8, "length");
  if (!v10 && !v13)
  {
    -[EKAutocompleter cancelSearch](self, "cancelSearch");
    -[EKAutocompleter clearLastResults](self, "clearLastResults");
    -[EKAutocompleter delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "autcompleterUpdated:", self);

    v15 = 0;
    goto LABEL_27;
  }
  -[EKAutocompleter prefix](self, "prefix");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "isEqualToString:", v8) & 1) != 0)
  {
    -[EKAutocompleter source](self, "source");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqual:", v9);

    if (v18)
    {
      v19 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
        -[EKAutocompleter searchFor:onSource:withContext:].cold.1((uint64_t)v8, v19, self);
      -[EKAutocompleter allResults](self, "allResults");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
  }
  else
  {

  }
  -[EKAutocompleter setPrefix:](self, "setPrefix:", v8);
  -[EKAutocompleter setSource:](self, "setSource:", v9);
  -[EKAutocompleter cancelSearch](self, "cancelSearch");
  -[EKAutocompleter clearLastResults](self, "clearLastResults");
  v30 = 0;
  v31 = &v30;
  v32 = 0x2050000000;
  v20 = (void *)getCNAutocompleteFetchRequestClass_softClass;
  v33 = getCNAutocompleteFetchRequestClass_softClass;
  if (!getCNAutocompleteFetchRequestClass_softClass)
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __getCNAutocompleteFetchRequestClass_block_invoke;
    v29[3] = &unk_1E4784C68;
    v29[4] = &v30;
    __getCNAutocompleteFetchRequestClass_block_invoke((uint64_t)v29);
    v20 = (void *)v31[3];
  }
  v21 = objc_retainAutorelease(v20);
  _Block_object_dispose(&v30, 8);
  objc_msgSend(v21, "request");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSearchString:", v8);
  objc_msgSend(v22, "setSearchType:", 3);
  if (-[EKAutocompleter findPeople](self, "findPeople"))
    v23 = -[EKAutocompleter excludeLocal](self, "excludeLocal") ^ 1;
  else
    v23 = 0;
  objc_msgSend(v22, "setIncludeContacts:", v23);
  if (-[EKAutocompleter findSuggestions](self, "findSuggestions"))
    v24 = -[EKAutocompleter excludeLocal](self, "excludeLocal") ^ 1;
  else
    v24 = 0;
  objc_msgSend(v22, "setIncludeSuggestions:", v24);
  if (-[EKAutocompleter findRecents](self, "findRecents"))
    v25 = -[EKAutocompleter excludeLocal](self, "excludeLocal") ^ 1;
  else
    v25 = 0;
  objc_msgSend(v22, "setIncludeRecents:", v25);
  objc_msgSend(v22, "setIncludeDirectoryServers:", -[EKAutocompleter useACDirectorySearch](self, "useACDirectorySearch"));
  objc_msgSend(v22, "setFetchContext:", v10);
  objc_msgSend(v22, "setShouldIncludeGroupResults:", -[EKAutocompleter findGroups](self, "findGroups"));
  objc_msgSend(v22, "setIncludeCalendarServers:", 0);
  -[EKAutocompleter setAutocompleteRunning:](self, "setAutocompleteRunning:", 1);
  -[EKAutocompleter autocompleteStore](self, "autocompleteStore");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "scheduleFetchRequest:", v22);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAutocompleter setAutocompletionSearchRequest:](self, "setAutocompletionSearchRequest:", v27);

  if (-[EKAutocompleter isRunning](self, "isRunning"))
  {
    v15 = 0;
  }
  else
  {
    -[EKAutocompleter allResults](self, "allResults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_27:
  return v15;
}

- (void)clearLastResults
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A2318000, log, OS_LOG_TYPE_DEBUG, "[EKAutocomplete] Clear Results", v1, 2u);
}

void __35__EKAutocompleter_clearLastResults__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "directorySearchResults");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

- (void)cancelSearch
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "prefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_0_0(&dword_1A2318000, v3, v5, "[EKAutocomplete] Cancel search for %@", (uint8_t *)&v6);

}

- (BOOL)isRunning
{
  void *v4;
  char v5;

  if (-[EKAutocompleter autocompleteRunning](self, "autocompleteRunning"))
    return 1;
  -[EKAutocompleter directorySearchOperation](self, "directorySearchOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isExecuting");

  return v5;
}

- (id)allResults
{
  void *v3;
  void *v4;

  -[EKAutocompleter contactResults](self, "contactResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAutocompleter removeIgnoredAddressesFromResults:](self, "removeIgnoredAddressesFromResults:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)cnResults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E10];
  -[EKAutocompleter contactResults](self, "contactResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedSetWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[EKAutocompleter contactResults](self, "contactResults", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "address");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[EKAutocompleter addressesToIgnore](self, "addressesToIgnore");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "containsObject:", v14);

          if (v16)
            objc_msgSend(v5, "removeObject:", v12);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  objc_msgSend(v5, "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)setIgnoredParticipants:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "emailAddress", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "URL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "absoluteString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v14, "hasMailto"))
        {
          v15 = 0;
          if (!v12)
            goto LABEL_11;
LABEL_10:
          objc_msgSend(v5, "addObject:", v12);
          goto LABEL_11;
        }
        objc_msgSend(v14, "stringRemovingMailto");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          goto LABEL_10;
LABEL_11:
        if (v15)
          objc_msgSend(v5, "addObject:", v15);
        if (v14)
          objc_msgSend(v5, "addObject:", v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAutocompleter setIgnoredAddresses:](self, "setIgnoredAddresses:", v16);

}

- (void)setIgnoredAddresses:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  EKAutocompleter *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _QWORD v34[3];

  v34[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
    v5 = v4;
  else
    v5 = (id)MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v22 = self;
    objc_msgSend(MEMORY[0x1E0D0C298], "defaultProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = *MEMORY[0x1E0C966A8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v4;
    objc_msgSend(v7, "unifiedContactsForHandleStrings:keysToFetch:", v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          objc_msgSend(v15, "emailAddresses");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v25;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v25 != v19)
                  objc_enumerationMutation(v16);
                objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "value");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "addObject:", v21);

              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v18);
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v12);
    }

    self = v22;
    v4 = v23;
  }
  -[EKAutocompleter setAddressesToIgnore:](self, "setAddressesToIgnore:", v6);

}

- (id)removeIgnoredAddressesFromResults:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[5];

  v4 = a3;
  -[EKAutocompleter addressesToIgnore](self, "addressesToIgnore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__EKAutocompleter_removeIgnoredAddressesFromResults___block_invoke;
    v10[3] = &unk_1E47854D8;
    v10[4] = self;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filteredArrayUsingPredicate:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v4;
  }

  return v8;
}

uint64_t __53__EKAutocompleter_removeIgnoredAddressesFromResults___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "addressesToIgnore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "containsObject:", v6) ^ 1;

  return v7;
}

- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4
{
  id v6;
  id v7;
  EKAutocompleter *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  EKAutocompleter *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  BOOL v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = v7;
  -[EKAutocompleter autocompletionSearchRequest](self, "autocompletionSearchRequest");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v6)
  {
    v30 = v6;
    v11 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      v12 = v11;
      -[EKAutocompleter prefix](self, "prefix");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v40 = v13;
      v41 = 2112;
      v42 = v9;
      _os_log_impl(&dword_1A2318000, v12, OS_LOG_TYPE_INFO, ":: :: CNAutocomplete Update %@ with %@", buf, 0x16u);

    }
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v29 = v9;
    obj = v9;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v33)
    {
      v32 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v35 != v32)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v15, "value");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "address");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = objc_msgSend(v15, "resultType");
          v19 = objc_msgSend(v15, "resultType");
          -[EKAutocompleter addressesToIgnore](v8, "addressesToIgnore");
          v20 = v8;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "value");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "address");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v21, "containsObject:", v23);

          v8 = v20;
          v26 = v19 != 3 && v18 != 1 && v17 == 0;
          if (!v26 && (v24 & 1) == 0)
          {
            -[EKAutocompleter contactResults](v20, "contactResults");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "addObject:", v15);

          }
        }
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v33);
    }

    v9 = v29;
    v6 = v30;
  }
  -[EKAutocompleter delegate](v8, "delegate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "autcompleterUpdated:", v8);

}

- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    -[EKAutocompleter prefix](self, "prefix");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v8;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1A2318000, v7, OS_LOG_TYPE_INFO, ":: :: CNAutocomplete Failed %@ with error %@", (uint8_t *)&v9, 0x16u);

  }
  -[EKAutocompleter setAutocompleteRunning:](self, "setAutocompleteRunning:", 0);

}

- (void)autocompleteFetchDidFinish:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    -[EKAutocompleter prefix](self, "prefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1A2318000, v5, OS_LOG_TYPE_INFO, ":: :: CNAutocomplete Finished %@", buf, 0xCu);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__EKAutocompleter_autocompleteFetchDidFinish___block_invoke;
  block[3] = &unk_1E4785078;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __46__EKAutocompleter_autocompleteFetchDidFinish___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setAutocompleteRunning:", 0);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autcompleterUpdated:", *(_QWORD *)(a1 + 32));

}

- (void)autocompleteFetchDidBeginNetworkActivity:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    -[EKAutocompleter prefix](self, "prefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v7;
    _os_log_impl(&dword_1A2318000, v6, OS_LOG_TYPE_INFO, ":: :: CNAutocomplete Began network activity for %@", buf, 0xCu);

  }
  -[EKAutocompleter delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__EKAutocompleter_autocompleteFetchDidBeginNetworkActivity___block_invoke;
    block[3] = &unk_1E4785078;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

void __60__EKAutocompleter_autocompleteFetchDidBeginNetworkActivity___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autcompleterDidBeginNetworkActivity:", *(_QWORD *)(a1 + 32));

}

- (void)autocompleteFetchDidEndNetworkActivity:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    -[EKAutocompleter prefix](self, "prefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v7;
    _os_log_impl(&dword_1A2318000, v6, OS_LOG_TYPE_INFO, ":: :: CNAutocomplete finished network activity for %@", buf, 0xCu);

  }
  -[EKAutocompleter delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__EKAutocompleter_autocompleteFetchDidEndNetworkActivity___block_invoke;
    block[3] = &unk_1E4785078;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

void __58__EKAutocompleter_autocompleteFetchDidEndNetworkActivity___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autcompleterDidFinishNetworkActivity:", *(_QWORD *)(a1 + 32));

}

- (id)autocompleteResultsFromDirectoryRecords:(id)a3 withType:(int64_t)a4
{
  id v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v24;
  id obj;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[6];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  Class (*v37)(uint64_t);
  void *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  __CFString *v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v4;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v46, 16);
  if (v29)
  {
    v28 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v32 != v28)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v7, "preferredAddress");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringRemovingMailto");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v10 = v9;
        }
        else
        {
          objc_msgSend(v7, "preferredAddress");
          v10 = (id)objc_claimAutoreleasedReturnValue();
          if (!v10)
          {
            objc_msgSend(v7, "displayName");
            v10 = (id)objc_claimAutoreleasedReturnValue();
            if (!v10)
              goto LABEL_23;
          }
        }
        if ((objc_msgSend(v5, "containsObject:", v10) & 1) == 0)
        {
          objc_msgSend(v5, "addObject:", v10);
          if (a4)
          {
            v11 = 0;
          }
          else
          {
            v40 = 0;
            v41 = &v40;
            v42 = 0x2050000000;
            v12 = (void *)getCNAutocompleteNameComponentsClass_softClass;
            v43 = getCNAutocompleteNameComponentsClass_softClass;
            if (!getCNAutocompleteNameComponentsClass_softClass)
            {
              v35 = MEMORY[0x1E0C809B0];
              v36 = 3221225472;
              v37 = __getCNAutocompleteNameComponentsClass_block_invoke;
              v38 = &unk_1E4784C68;
              v39 = &v40;
              __getCNAutocompleteNameComponentsClass_block_invoke((uint64_t)&v35);
              v12 = (void *)v41[3];
            }
            v13 = objc_retainAutorelease(v12);
            _Block_object_dispose(&v40, 8);
            objc_msgSend(v7, "firstName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "lastName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "nameComponentsWithFirstName:lastName:nickname:nameSuffix:", v14, v15, 0, 0);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v7, "principalPath");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v44 = EKDirectoryRecordPrincipalPathKey;
            objc_msgSend(v7, "principalPath");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = v17;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __68__EKAutocompleter_autocompleteResultsFromDirectoryRecords_withType___block_invoke;
          v30[3] = &unk_1E4785528;
          v30[4] = self;
          v30[5] = v7;
          v18 = (void *)MEMORY[0x1A85849D4](v30);
          v40 = 0;
          v41 = &v40;
          v42 = 0x2050000000;
          v19 = (void *)getCNAutocompleteResultClass_softClass;
          v43 = getCNAutocompleteResultClass_softClass;
          if (!getCNAutocompleteResultClass_softClass)
          {
            v35 = MEMORY[0x1E0C809B0];
            v36 = 3221225472;
            v37 = __getCNAutocompleteResultClass_block_invoke;
            v38 = &unk_1E4784C68;
            v39 = &v40;
            __getCNAutocompleteResultClass_block_invoke((uint64_t)&v35);
            v19 = (void *)v41[3];
          }
          v20 = objc_retainAutorelease(v19);
          _Block_object_dispose(&v40, 8);
          objc_msgSend(v7, "displayName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "calDAVResultWithAddress:displayName:nameComponents:resultType:groupMembersProvider:userInfo:", v9, v21, v11, a4, v18, v16);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
            objc_msgSend(v24, "addObject:", v22);

        }
LABEL_23:

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v46, 16);
    }
    while (v29);
  }

  objc_msgSend(v24, "sortUsingComparator:", &__block_literal_global_13);
  return v24;
}

id __68__EKAutocompleter_autocompleteResultsFromDirectoryRecords_withType___block_invoke(uint64_t a1, _QWORD *a2)
{
  dispatch_semaphore_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  EKGroupExpansionOperation *v8;
  void *v9;
  EKGroupExpansionOperation *v10;
  dispatch_time_t v11;
  intptr_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  NSObject *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v4 = dispatch_semaphore_create(0);
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__2;
  v37 = __Block_byref_object_dispose__2;
  v38 = (id)objc_opt_new();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__2;
  v27 = __Block_byref_object_dispose__2;
  v28 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __68__EKAutocompleter_autocompleteResultsFromDirectoryRecords_withType___block_invoke_61;
  v18[3] = &unk_1E4785500;
  v21 = &v23;
  v22 = &v33;
  v5 = *(_QWORD *)(a1 + 32);
  v20 = &v29;
  v18[4] = v5;
  v6 = v4;
  v19 = v6;
  v7 = (void *)MEMORY[0x1A85849D4](v18);
  v8 = [EKGroupExpansionOperation alloc];
  objc_msgSend(*(id *)(a1 + 32), "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[EKGroupExpansionOperation initWithSource:group:completionBlock:](v8, "initWithSource:group:completionBlock:", v9, *(_QWORD *)(a1 + 40), v7);

  -[EKGroupExpansionOperation start](v10, "start");
  v11 = dispatch_time(0, 30000000000);
  v12 = dispatch_semaphore_wait(v6, v11);
  v30[3] = v12;
  if (v12 || v24[5])
  {
    if (a2)
    {
      v13 = (void *)v24[5];
      if (v13)
      {
        v14 = objc_retainAutorelease(v13);
      }
      else
      {
        v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v14 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D1C3B8], 7, 0);
      }
      *a2 = v14;
    }
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v16 = (void *)objc_msgSend((id)v34[5], "copy");
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v16;
}

void __68__EKAutocompleter_autocompleteResultsFromDirectoryRecords_withType___block_invoke_61(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a2;
  v5 = a3;
  v6 = v5;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if (v5)
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v8 = v5;
      v9 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v8;
    }
    else
    {
      v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v11 = *(void **)(a1 + 32);
      objc_msgSend(v21, "locations");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "autocompleteResultsFromDirectoryRecords:withType:", v12, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObjectsFromArray:", v13);

      v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v15 = *(void **)(a1 + 32);
      objc_msgSend(v21, "resources");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "autocompleteResultsFromDirectoryRecords:withType:", v16, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObjectsFromArray:", v17);

      v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v19 = *(void **)(a1 + 32);
      objc_msgSend(v21, "people");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "autocompleteResultsFromDirectoryRecords:withType:", v9, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObjectsFromArray:", v20);

    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }

}

uint64_t __68__EKAutocompleter_autocompleteResultsFromDirectoryRecords_withType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (BOOL)directorySearchWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  EKDirectorySearchOperation *v15;
  EKDirectorySearchOperation *v16;
  void *v17;
  void *v18;
  BOOL v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id from;
  id location;
  _QWORD block[5];

  v4 = a3;
  -[EKAutocompleter source](self, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "sourceType") == 2 || objc_msgSend(v5, "sourceType") == 3 || objc_msgSend(v5, "sourceType") == 1)
  {
    -[EKAutocompleter directorySearchOperation](self, "directorySearchOperation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancel");

    -[EKAutocompleter directorySearchQueue](self, "directorySearchQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__EKAutocompleter_directorySearchWithCompletion___block_invoke;
    block[3] = &unk_1E4785078;
    block[4] = self;
    dispatch_sync(v7, block);

    v9 = (void *)objc_opt_new();
    -[EKAutocompleter prefix](self, "prefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsSeparatedByCharactersInSet:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v12);
    objc_msgSend(v9, "setTerms:", v13);

    objc_msgSend(v9, "setFindUsers:", -[EKAutocompleter findPeople](self, "findPeople"));
    objc_msgSend(v9, "setFindGroups:", -[EKAutocompleter findGroups](self, "findGroups"));
    objc_msgSend(v9, "setFindLocations:", -[EKAutocompleter findRooms](self, "findRooms"));
    objc_msgSend(v9, "setFindResources:", -[EKAutocompleter findResources](self, "findResources"));
    objc_initWeak(&location, self);
    -[EKAutocompleter directorySearchOperation](self, "directorySearchOperation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&from, v14);

    v15 = [EKDirectorySearchOperation alloc];
    v25[0] = v8;
    v25[1] = 3221225472;
    v25[2] = __49__EKAutocompleter_directorySearchWithCompletion___block_invoke_2;
    v25[3] = &unk_1E4785570;
    objc_copyWeak(&v26, &location);
    v16 = -[EKDirectorySearchOperation initWithSource:query:resultsBlock:](v15, "initWithSource:query:resultsBlock:", v5, v9, v25);
    -[EKAutocompleter setDirectorySearchOperation:](self, "setDirectorySearchOperation:", v16);

    v21[0] = v8;
    v21[1] = 3221225472;
    v21[2] = __49__EKAutocompleter_directorySearchWithCompletion___block_invoke_4;
    v21[3] = &unk_1E47855C0;
    objc_copyWeak(&v23, &location);
    v22 = v4;
    objc_copyWeak(&v24, &from);
    -[EKAutocompleter directorySearchOperation](self, "directorySearchOperation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCompletionBlock:", v21);

    -[EKAutocompleter directorySearchOperation](self, "directorySearchOperation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "start");

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

    v19 = 1;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

void __49__EKAutocompleter_directorySearchWithCompletion___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "directorySearchResults");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

void __49__EKAutocompleter_directorySearchWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v3, "locations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "autocompleteResultsFromDirectoryRecords:withType:", v6, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

    objc_msgSend(v3, "resources");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "autocompleteResultsFromDirectoryRecords:withType:", v8, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v9);

    objc_msgSend(v3, "people");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "autocompleteResultsFromDirectoryRecords:withType:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v11);

    objc_msgSend(v3, "groups");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "autocompleteResultsFromDirectoryRecords:withType:", v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v13);

    objc_msgSend(WeakRetained, "directorySearchQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __49__EKAutocompleter_directorySearchWithCompletion___block_invoke_3;
    v16[3] = &unk_1E47853B0;
    v17 = WeakRetained;
    v18 = v5;
    v15 = v5;
    dispatch_async(v14, v16);

  }
}

void __49__EKAutocompleter_directorySearchWithCompletion___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "directorySearchResults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));

}

void __49__EKAutocompleter_directorySearchWithCompletion___block_invoke_4(id *a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "directorySearchQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__EKAutocompleter_directorySearchWithCompletion___block_invoke_5;
    block[3] = &unk_1E4785598;
    v7 = a1[4];
    v6 = v3;
    objc_copyWeak(&v8, a1 + 6);
    dispatch_async(v4, block);

    objc_destroyWeak(&v8);
  }

}

void __49__EKAutocompleter_directorySearchWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "directorySearchResults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);

}

- (BOOL)autocompleteFetch:(id)a3 shouldExpectSupplementalResultsForRequest:(id)a4 completionHandler:(id)a5
{
  return -[EKAutocompleter directorySearchWithCompletion:](self, "directorySearchWithCompletion:", a5, a4);
}

- (BOOL)findRooms
{
  return self->_findRooms;
}

- (void)setFindRooms:(BOOL)a3
{
  self->_findRooms = a3;
}

- (BOOL)findPeople
{
  return self->_findPeople;
}

- (void)setFindPeople:(BOOL)a3
{
  self->_findPeople = a3;
}

- (BOOL)findSuggestions
{
  return self->_findSuggestions;
}

- (void)setFindSuggestions:(BOOL)a3
{
  self->_findSuggestions = a3;
}

- (BOOL)findResources
{
  return self->_findResources;
}

- (void)setFindResources:(BOOL)a3
{
  self->_findResources = a3;
}

- (BOOL)findGroups
{
  return self->_findGroups;
}

- (void)setFindGroups:(BOOL)a3
{
  self->_findGroups = a3;
}

- (BOOL)findRecents
{
  return self->_findRecents;
}

- (void)setFindRecents:(BOOL)a3
{
  self->_findRecents = a3;
}

- (BOOL)useACDirectorySearch
{
  return self->_useACDirectorySearch;
}

- (void)setUseACDirectorySearch:(BOOL)a3
{
  self->_useACDirectorySearch = a3;
}

- (BOOL)excludeLocal
{
  return self->_excludeLocal;
}

- (void)setExcludeLocal:(BOOL)a3
{
  self->_excludeLocal = a3;
}

- (EKAutocompleterDelegate)delegate
{
  return (EKAutocompleterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)prefix
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPrefix:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (EKSource)source
{
  return (EKSource *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSSet)addressesToIgnore
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAddressesToIgnore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableArray)contactResults
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setContactResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (CNCancelable)autocompletionSearchRequest
{
  return (CNCancelable *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAutocompletionSearchRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)autocompleteRunning
{
  return self->_autocompleteRunning;
}

- (void)setAutocompleteRunning:(BOOL)a3
{
  self->_autocompleteRunning = a3;
}

- (CNAutocompleteStore)autocompleteStore
{
  return (CNAutocompleteStore *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAutocompleteStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (EKDirectorySearchOperation)directorySearchOperation
{
  return (EKDirectorySearchOperation *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDirectorySearchOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (OS_dispatch_queue)directorySearchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDirectorySearchQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSMutableArray)directorySearchResults
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDirectorySearchResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directorySearchResults, 0);
  objc_storeStrong((id *)&self->_directorySearchQueue, 0);
  objc_storeStrong((id *)&self->_directorySearchOperation, 0);
  objc_storeStrong((id *)&self->_autocompleteStore, 0);
  objc_storeStrong((id *)&self->_autocompletionSearchRequest, 0);
  objc_storeStrong((id *)&self->_contactResults, 0);
  objc_storeStrong((id *)&self->_addressesToIgnore, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)searchFor:(uint64_t)a1 onSource:(void *)a2 withContext:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "allResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2048;
  v10 = objc_msgSend(v6, "count");
  _os_log_debug_impl(&dword_1A2318000, v5, OS_LOG_TYPE_DEBUG, "[EKAutocomplete] Same search (\"%@\"), ret %lu results.", (uint8_t *)&v7, 0x16u);

}

- (void)searchFor:(uint64_t)a1 onSource:(NSObject *)a2 withContext:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_1A2318000, a2, a3, "[EKAutocomplete] Search for %@ invoked", (uint8_t *)&v3);
}

@end
