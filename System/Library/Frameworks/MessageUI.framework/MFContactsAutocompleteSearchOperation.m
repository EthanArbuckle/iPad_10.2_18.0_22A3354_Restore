@implementation MFContactsAutocompleteSearchOperation

+ (id)operationWithOwner:(id)a3 text:(id)a4 taskID:(id)a5 autocompleteStore:(id)a6
{
  id v10;
  void *v11;
  objc_super v13;

  v10 = a6;
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___MFContactsAutocompleteSearchOperation;
  objc_msgSendSuper2(&v13, sel_operationWithOwner_text_taskID_, a3, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAutocompleteStore:", v10);

  return v11;
}

- (MFContactsAutocompleteSearchOperation)init
{
  MFContactsAutocompleteSearchOperation *v2;
  EFCancelationToken *v3;
  EFCancelationToken *fetchRequestToken;
  uint64_t v5;
  EFPromise *fetchRequestPromise;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MFContactsAutocompleteSearchOperation;
  v2 = -[MFContactsAutocompleteSearchOperation init](&v8, sel_init);
  if (v2)
  {
    v3 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E0D1EE90]);
    fetchRequestToken = v2->_fetchRequestToken;
    v2->_fetchRequestToken = v3;

    objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v5 = objc_claimAutoreleasedReturnValue();
    fetchRequestPromise = v2->_fetchRequestPromise;
    v2->_fetchRequestPromise = (EFPromise *)v5;

    -[EFCancelationToken addCancelable:](v2->_fetchRequestToken, "addCancelable:", v2->_fetchRequestPromise);
  }
  return v2;
}

- (void)cancel
{
  objc_super v3;

  -[EFCancelationToken cancel](self->_fetchRequestToken, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)MFContactsAutocompleteSearchOperation;
  -[MFContactsAutocompleteSearchOperation cancel](&v3, sel_cancel);
}

- (void)configureForSearchTypes:(unint64_t)a3
{
  -[MFContactsAutocompleteSearchOperation setIncludeContacts:](self, "setIncludeContacts:", (a3 >> 1) & 1);
  -[MFContactsAutocompleteSearchOperation setIncludeRecents:](self, "setIncludeRecents:", (a3 & 5) != 0);
  -[MFContactsAutocompleteSearchOperation setIncludeServers:](self, "setIncludeServers:", (a3 >> 3) & 1);
  -[MFContactsAutocompleteSearchOperation setIncludeSuggestions:](self, "setIncludeSuggestions:", (a3 >> 4) & 1);
}

- (void)main
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  EFCancelationToken *fetchRequestToken;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id obj;
  id obja;
  id objb;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id location;
  _QWORD v43[4];
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (-[MFContactsAutocompleteSearchOperation simulateResults](self, "simulateResults"))
  {
    -[MFContactsAutocompleteSearchOperation _simulatedRecipientResults](self, "_simulatedRecipientResults");
    obj = (id)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteFetchContext otherAddressesAlreadyChosen](self->_fetchContext, "otherAddressesAlreadyChosen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(obj, "count"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      obja = obj;
      v6 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v46 != v7)
              objc_enumerationMutation(obja);
            v9 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            objc_msgSend(v9, "uncommentedAddress");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNAutocompleteFetchContext otherAddressesAlreadyChosen](self->_fetchContext, "otherAddressesAlreadyChosen");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "containsObject:", v10);

            if ((v12 & 1) == 0)
              objc_msgSend(v5, "addObject:", v9);

          }
          v6 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        }
        while (v6);
      }

    }
    else
    {
      v5 = obj;
    }
    objc_msgSend(MEMORY[0x1E0D1F070], "__mui_nextRunLoopMainThreadScheduler");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    -[MFContactsSearchOperation owner](self, "owner");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "ef_onScheduler:", v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFContactsSearchOperation taskID](self, "taskID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_handleContactsAutocompleteSearch:returnedResults:taskID:", self, v5, v33);

    -[MFContactsSearchOperation owner](self, "owner");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "ef_onScheduler:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFContactsSearchOperation taskID](self, "taskID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_handleContactsAutocompleteSearchFinished:taskID:", self, v34);

    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0D135B8], "request");
  objb = (id)objc_claimAutoreleasedReturnValue();
  -[MFContactsSearchOperation text](self, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(objb, "setSearchString:", v13);

  -[MFContactsSearchOperation owner](self, "owner");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(objb, "setSearchType:", objc_msgSend(v14, "autocompleteSearchType"));

  objc_msgSend(objb, "setIncludeContacts:", self->_includeContacts);
  objc_msgSend(objb, "setIncludeRecents:", self->_includeRecents);
  objc_msgSend(objb, "setIncludeSuggestions:", self->_includeSuggestions);
  objc_msgSend(objb, "setIncludeDirectoryServers:", self->_includeServers);
  -[CNAutocompleteFetchContext sendingAddress](self->_fetchContext, "sendingAddress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    -[MFContactsSearchOperation owner](self, "owner");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sendingAddress");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteFetchContext setSendingAddress:](self->_fetchContext, "setSendingAddress:", v17);

  }
  -[CNAutocompleteFetchContext sendingAddressAccountIdentifier](self->_fetchContext, "sendingAddressAccountIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    -[MFContactsSearchOperation owner](self, "owner");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sendingAccountIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteFetchContext setSendingAddressAccountIdentifier:](self->_fetchContext, "setSendingAddressAccountIdentifier:", v20);

  }
  objc_msgSend(objb, "setFetchContext:", self->_fetchContext);
  if ((-[MFContactsAutocompleteSearchOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[MFContactsSearchOperation taskID](self, "taskID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFContactsAutocompleteSearchOperation autocompleteStore](self, "autocompleteStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "scheduleFetchRequest:delegate:", objb, self);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    fetchRequestToken = self->_fetchRequestToken;
    v25 = MEMORY[0x1E0C809B0];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __45__MFContactsAutocompleteSearchOperation_main__block_invoke;
    v43[3] = &unk_1E5A65480;
    v26 = v23;
    v44 = v26;
    -[EFCancelationToken addCancelationBlock:](fetchRequestToken, "addCancelationBlock:", v43);
    -[EFPromise future](self->_fetchRequestPromise, "future");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v25;
    v39[1] = 3221225472;
    v39[2] = __45__MFContactsAutocompleteSearchOperation_main__block_invoke_2;
    v39[3] = &unk_1E5A66E10;
    objc_copyWeak(&v41, &location);
    v29 = v21;
    v40 = v29;
    objc_msgSend(v27, "onScheduler:addSuccessBlock:", v28, v39);

    v38 = 0;
    objc_msgSend(v27, "result:", &v38);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);

    v30 = v44;
    v5 = objb;
LABEL_22:

    goto LABEL_23;
  }
  v5 = objb;
LABEL_23:

}

uint64_t __45__MFContactsAutocompleteSearchOperation_main__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

void __45__MFContactsAutocompleteSearchOperation_main__block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "owner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_handleContactsAutocompleteSearchFinished:taskID:", WeakRetained, *(_QWORD *)(a1 + 32));

}

- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4
{
  -[EFPromise finishWithError:](self->_fetchRequestPromise, "finishWithError:", a4);
}

- (id)_simulatedRecipientResults
{
  void *v3;
  MFComposeRecipientOriginContext *v4;
  void *v5;
  MFComposeRecipientOriginContext *v6;
  id v7;
  void (**v8)(void *, const __CFString *);
  id v9;
  _QWORD v11[4];
  MFComposeRecipientOriginContext *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MFComposeRecipientOriginContext);
  -[MFContactsSearchOperation text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeRecipientOriginContext setSearchTerm:](v4, "setSearchTerm:", v5);

  -[MFComposeRecipientOriginContext setResultType:](v4, "setResultType:", 16);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__MFContactsAutocompleteSearchOperation__simulatedRecipientResults__block_invoke;
  v11[3] = &unk_1E5A66D08;
  v6 = v4;
  v12 = v6;
  v7 = v3;
  v13 = v7;
  v8 = (void (**)(void *, const __CFString *))_Block_copy(v11);
  v8[2](v8, CFSTR("Rachel Green <rachel@centralp3rk.com>"));
  v8[2](v8, CFSTR("Phoebe Buffay <phoebe@centralp3rk.com>"));
  v8[2](v8, CFSTR("Ross Geller <ross@centralp3rk.com>"));
  v8[2](v8, CFSTR("Monica Geller <monica@centralp3rk.com>"));
  v9 = v7;

  return v9;
}

void __67__MFContactsAutocompleteSearchOperation__simulatedRecipientResults__block_invoke(uint64_t a1, void *a2)
{
  MFComposeRecipient *v3;
  id v4;

  v4 = a2;
  v3 = -[MFComposeRecipient initWithContact:address:kind:]([MFComposeRecipient alloc], "initWithContact:address:kind:", 0, v4, 0);
  -[MFComposeRecipient setOriginContext:](v3, "setOriginContext:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  MFContactsAutocompleteSearchOperation *v10;
  char v11;
  char v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  MFComposeRecipientOriginContext *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id obj;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v25 = a4;
  if ((-[MFContactsAutocompleteSearchOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v25, "count"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = v25;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v29 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          +[MFComposeRecipient composeRecipientWithAutocompleteResult:](MFComposeRecipient, "composeRecipientWithAutocompleteResult:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v10 = self;
            v11 = objc_msgSend(v8, "sourceType");
            v12 = objc_msgSend(v8, "sourceType");
            v13 = objc_msgSend(v8, "sourceType");
            v14 = objc_msgSend(v8, "sourceType");
            v15 = objc_msgSend(v8, "sourceType");
            v16 = v11 & 2 | (unint64_t)(v12 & 1);
            if ((v13 & 0x48) != 0)
              v16 |= 8uLL;
            v17 = v16 & 0xFFFFFFFFFFFFFFEFLL | (16 * ((v14 >> 2) & 1));
            if (v15)
              v18 = v17;
            else
              v18 = v17 | 2;
            v19 = objc_alloc_init(MFComposeRecipientOriginContext);
            self = v10;
            -[MFContactsSearchOperation text](v10, "text");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[MFComposeRecipientOriginContext setSearchTerm:](v19, "setSearchTerm:", v20);

            -[MFComposeRecipientOriginContext setResultType:](v19, "setResultType:", v18);
            objc_msgSend(v9, "setOriginContext:", v19);
            objc_msgSend(v27, "addObject:", v9);

          }
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v5);
    }

    -[MFContactsSearchOperation owner](self, "owner");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1F070], "__mui_nextRunLoopMainThreadScheduler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "ef_onScheduler:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFContactsSearchOperation taskID](self, "taskID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_handleContactsAutocompleteSearch:returnedResults:taskID:", self, v27, v24);

  }
}

- (void)autocompleteFetchDidFinish:(id)a3
{
  EFPromise *fetchRequestPromise;
  id v4;

  fetchRequestPromise = self->_fetchRequestPromise;
  objc_msgSend(MEMORY[0x1E0C99E38], "null", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EFPromise finishWithResult:](fetchRequestPromise, "finishWithResult:");

}

- (BOOL)includeContacts
{
  return self->_includeContacts;
}

- (void)setIncludeContacts:(BOOL)a3
{
  self->_includeContacts = a3;
}

- (BOOL)includeRecents
{
  return self->_includeRecents;
}

- (void)setIncludeRecents:(BOOL)a3
{
  self->_includeRecents = a3;
}

- (BOOL)includeSuggestions
{
  return self->_includeSuggestions;
}

- (void)setIncludeSuggestions:(BOOL)a3
{
  self->_includeSuggestions = a3;
}

- (BOOL)includeServers
{
  return self->_includeServers;
}

- (void)setIncludeServers:(BOOL)a3
{
  self->_includeServers = a3;
}

- (BOOL)simulateResults
{
  return self->_simulateResults;
}

- (void)setSimulateResults:(BOOL)a3
{
  self->_simulateResults = a3;
}

- (CNAutocompleteFetchContext)fetchContext
{
  return self->_fetchContext;
}

- (void)setFetchContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (CNAutocompleteStore)autocompleteStore
{
  return self->_autocompleteStore;
}

- (void)setAutocompleteStore:(id)a3
{
  objc_storeStrong((id *)&self->_autocompleteStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autocompleteStore, 0);
  objc_storeStrong((id *)&self->_fetchContext, 0);
  objc_storeStrong((id *)&self->_fetchRequestPromise, 0);
  objc_storeStrong((id *)&self->_fetchRequestToken, 0);
}

@end
