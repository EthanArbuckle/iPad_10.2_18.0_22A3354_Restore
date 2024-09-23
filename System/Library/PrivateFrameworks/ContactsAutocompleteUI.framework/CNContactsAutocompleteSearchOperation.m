@implementation CNContactsAutocompleteSearchOperation

+ (id)operationWithOwner:(id)a3 text:(id)a4 taskID:(id)a5 autocompleteStore:(id)a6
{
  id v9;
  void *v10;
  objc_super v12;

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___CNContactsAutocompleteSearchOperation;
  v9 = a6;
  objc_msgSendSuper2(&v12, sel_operationWithOwner_text_taskID_, a3, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAutocompleteStore:", v9, v12.receiver, v12.super_class);

  return v10;
}

- (CNContactsAutocompleteSearchOperation)init
{
  CNContactsAutocompleteSearchOperation *v2;
  id v3;
  void *v4;
  uint64_t v5;
  CNPromise *fetchRequestPromise;
  void *v7;
  uint64_t v8;
  CNCancelationToken *fetchRequestToken;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CNContactsAutocompleteSearchOperation;
  v2 = -[CNContactsAutocompleteSearchOperation init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D13B20]);
    objc_msgSend(MEMORY[0x1E0D13B70], "defaultProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithSchedulerProvider:", v4);
    fetchRequestPromise = v2->_fetchRequestPromise;
    v2->_fetchRequestPromise = (CNPromise *)v5;

    objc_initWeak(&location, v2);
    v7 = (void *)MEMORY[0x1E0D139B8];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __45__CNContactsAutocompleteSearchOperation_init__block_invoke;
    v11[3] = &unk_1E62BFD38;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v7, "tokenWithCancelationBlock:", v11);
    v8 = objc_claimAutoreleasedReturnValue();
    fetchRequestToken = v2->_fetchRequestToken;
    v2->_fetchRequestToken = (CNCancelationToken *)v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __45__CNContactsAutocompleteSearchOperation_init__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  char v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "fetchRequestPromise");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "future");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCancelled");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "fetchRequestPromise");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "future");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancel");

  }
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  -[CNContactsAutocompleteSearchOperation fetchRequestToken](self, "fetchRequestToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)CNContactsAutocompleteSearchOperation;
  -[CNContactsAutocompleteSearchOperation cancel](&v4, sel_cancel);
}

- (void)configureForSearchTypes:(unint64_t)a3
{
  -[CNContactsAutocompleteSearchOperation setIncludeContacts:](self, "setIncludeContacts:", (a3 >> 1) & 1);
  -[CNContactsAutocompleteSearchOperation setIncludeRecents:](self, "setIncludeRecents:", (a3 & 5) != 0);
  -[CNContactsAutocompleteSearchOperation setIncludeStewie:](self, "setIncludeStewie:", (a3 >> 5) & 1);
  -[CNContactsAutocompleteSearchOperation setIncludeServers:](self, "setIncludeServers:", (a3 >> 3) & 1);
  -[CNContactsAutocompleteSearchOperation setIncludeSuggestions:](self, "setIncludeSuggestions:", (a3 >> 4) & 1);
}

- (void)main
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_2_1(&dword_1B10FF000, v1, (uint64_t)v1, "CNAutocompleteFetch Error for task %@: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __45__CNContactsAutocompleteSearchOperation_main__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "owner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "taskID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_handleContactsAutocompleteSearch:returnedResults:taskID:", v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 32), "owner");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "taskID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_handleContactsAutocompleteSearchFinished:taskID:", v6, v7);

}

uint64_t __45__CNContactsAutocompleteSearchOperation_main__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  contactsSearchManagerLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __45__CNContactsAutocompleteSearchOperation_main__block_invoke_2_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  return objc_msgSend(*(id *)(a1 + 40), "cancel");
}

void __45__CNContactsAutocompleteSearchOperation_main__block_invoke_81(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0D13B70], "defaultProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainThreadScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__CNContactsAutocompleteSearchOperation_main__block_invoke_2_82;
  v6[3] = &unk_1E62BF0D0;
  v6[4] = WeakRetained;
  v7 = *(id *)(a1 + 32);
  v5 = (id)objc_msgSend(v4, "afterDelay:performBlock:", v6, 0.0);

}

void __45__CNContactsAutocompleteSearchOperation_main__block_invoke_2_82(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "owner");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_handleContactsAutocompleteSearchFinished:taskID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (BOOL)autocompleteFetch:(id)a3 shouldExpectSupplementalResultsForRequest:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  _QWORD v14[4];
  id v15;

  v7 = a4;
  v8 = a5;
  -[CNAutocompleteSearchOperation owner](self, "owner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v7, "searchString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __119__CNContactsAutocompleteSearchOperation_autocompleteFetch_shouldExpectSupplementalResultsForRequest_completionHandler___block_invoke;
    v14[3] = &unk_1E62BF9D0;
    v15 = v8;
    v12 = objc_msgSend(v10, "getSupplementalGroupsForSearchQuery:completionHandler:", v11, v14);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __119__CNContactsAutocompleteSearchOperation_autocompleteFetch_shouldExpectSupplementalResultsForRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v17;
  id obj;
  void *v19;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v17 = a3;
  v19 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1E0D135D8];
        objc_msgSend(v9, "title");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __119__CNContactsAutocompleteSearchOperation_autocompleteFetch_shouldExpectSupplementalResultsForRequest_completionHandler___block_invoke_2;
        v20[3] = &unk_1E62BFD88;
        v20[4] = v9;
        objc_msgSend(v10, "messagesResultWithAddress:displayName:nameComponents:resultType:addressType:identifier:contactProvider:groupMembersProvider:userInfo:", 0, v11, 0, 1, 0, v12, 0, v20, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v19, "addObject:", v13);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

  v14 = *(_QWORD *)(a1 + 32);
  v15 = (void *)objc_msgSend(v19, "copy");
  (*(void (**)(uint64_t, void *, id))(v14 + 16))(v14, v15, v17);

}

id __119__CNContactsAutocompleteSearchOperation_autocompleteFetch_shouldExpectSupplementalResultsForRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
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
  id obj;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "groupMembers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v24 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v6, "nameComponents");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
        {
          v9 = (void *)MEMORY[0x1E0D135C8];
          objc_msgSend(v7, "givenName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "familyName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "nickname");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "nameSuffix");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "nameComponentsWithFirstName:lastName:nickname:nameSuffix:", v10, v11, v12, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v8, 2, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v6, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 0;
        }
        v16 = (void *)MEMORY[0x1E0D135D8];
        objc_msgSend(v6, "address");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "messagesResultWithAddress:displayName:nameComponents:resultType:addressType:identifier:contactProvider:groupMembersProvider:userInfo:", v17, v15, v14, 0, objc_msgSend(v6, "addressType"), 0, 0, 0, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
          objc_msgSend(v22, "addObject:", v18);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v3);
  }

  v19 = (void *)objc_msgSend(v22, "copy");
  return v19;
}

- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4
{
  -[CNPromise finishWithError:](self->_fetchRequestPromise, "finishWithError:", a4);
}

- (id)_simulatedRecipientResults
{
  void *v3;
  CNComposeRecipientOriginContext *v4;
  void *v5;
  id v6;
  CNComposeRecipientOriginContext *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;
  _QWORD v11[4];
  CNComposeRecipientOriginContext *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(CNComposeRecipientOriginContext);
  -[CNAutocompleteSearchOperation text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientOriginContext setSearchTerm:](v4, "setSearchTerm:", v5);

  -[CNComposeRecipientOriginContext setResultType:](v4, "setResultType:", 16);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__CNContactsAutocompleteSearchOperation__simulatedRecipientResults__block_invoke;
  v11[3] = &unk_1E62BFDB0;
  v12 = v4;
  v6 = v3;
  v13 = v6;
  v7 = v4;
  v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5E16810](v11);
  ((void (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("Dan Keen <dkeen@apple.com>"));
  ((void (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("Allan Shortlidge <tshortli@apple.com>"));
  ((void (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("Michael A La Mode <malamode@apple.com>"));
  ((void (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("James Magahern <jmagahern@apple.com>"));
  v9 = v6;

  return v9;
}

void __67__CNContactsAutocompleteSearchOperation__simulatedRecipientResults__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CNComposeRecipient *v4;

  v3 = a2;
  v4 = -[CNComposeRecipient initWithContact:address:kind:]([CNComposeRecipient alloc], "initWithContact:address:kind:", 0, v3, 0);

  -[CNComposeRecipient setOriginContext:](v4, "setOriginContext:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

}

- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  CNComposeRecipientGroup *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id obj;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[5];
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint8_t v63[4];
  uint64_t v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if ((-[CNContactsAutocompleteSearchOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v42 = (void *)objc_opt_new();
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v38 = v5;
    obj = v5;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    if (!v6)
      goto LABEL_41;
    v7 = v6;
    v8 = *(_QWORD *)v58;
    v39 = *(_QWORD *)v58;
    while (1)
    {
      v9 = 0;
      v40 = v7;
      do
      {
        if (*(_QWORD *)v58 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v9);
        if (objc_msgSend(v10, "resultType") == 1)
        {
          v56 = 0;
          objc_msgSend(v10, "members:", &v56);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v56;
          if (v12)
          {
            contactsSearchManagerLog();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              -[CNContactsAutocompleteSearchOperation autocompleteFetch:didReceiveResults:].cold.1(v63, v12, &v64, v13);

          }
          v43 = v12;
          v44 = v11;
          v45 = v10;
          if (v11)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = 0u;
            v53 = 0u;
            v54 = 0u;
            v55 = 0u;
            v15 = v11;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v53;
              do
              {
                for (i = 0; i != v17; ++i)
                {
                  if (*(_QWORD *)v53 != v18)
                    objc_enumerationMutation(v15);
                  v20 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
                  +[CNComposeRecipient composeRecipientWithAutocompleteResult:](CNComposeRecipient, "composeRecipientWithAutocompleteResult:", v20);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v21)
                  {
                    -[CNContactsAutocompleteSearchOperation originContextForResult:](self, "originContextForResult:", v20);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v21, "setOriginContext:", v22);

                    objc_msgSend(v14, "addObject:", v21);
                  }

                }
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
              }
              while (v17);
            }

            v10 = v45;
          }
          else
          {
            v14 = 0;
          }
          -[CNContactsAutocompleteSearchOperation unifyRecipientsIfNeccesary:](self, "unifyRecipientsIfNeccesary:", v14);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "displayName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v26 = v24;
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v49;
            while (2)
            {
              for (j = 0; j != v28; ++j)
              {
                if (*(_QWORD *)v49 != v29)
                  objc_enumerationMutation(v26);
                objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * j), "compositeName");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = objc_msgSend(v25, "isEqualToString:", v31);

                if (v32)
                {

                  v25 = 0;
                  goto LABEL_36;
                }
              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
              if (v28)
                continue;
              break;
            }
LABEL_36:
            v10 = v45;
          }

          v23 = -[CNComposeRecipientGroup initWithChildren:displayString:]([CNComposeRecipientGroup alloc], "initWithChildren:displayString:", v26, v25);
          -[CNComposeRecipient setAutocompleteResult:](v23, "setAutocompleteResult:", v10);

          v8 = v39;
          v7 = v40;
          if (v23)
          {
LABEL_38:
            -[CNContactsAutocompleteSearchOperation originContextForResult:](self, "originContextForResult:", v10);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNComposeRecipient setOriginContext:](v23, "setOriginContext:", v33);

            objc_msgSend(v42, "addObject:", v23);
          }
        }
        else
        {
          +[CNComposeRecipient composeRecipientWithAutocompleteResult:](CNComposeRecipient, "composeRecipientWithAutocompleteResult:", v10);
          v23 = (CNComposeRecipientGroup *)objc_claimAutoreleasedReturnValue();
          if (v23)
            goto LABEL_38;
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
      if (!v7)
      {
LABEL_41:

        objc_msgSend(MEMORY[0x1E0D13B70], "defaultProvider");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "mainThreadScheduler");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __77__CNContactsAutocompleteSearchOperation_autocompleteFetch_didReceiveResults___block_invoke;
        v46[3] = &unk_1E62BF0D0;
        v46[4] = self;
        v47 = v42;
        v36 = v42;
        v37 = (id)objc_msgSend(v35, "afterDelay:performBlock:", v46, 0.0);

        v5 = v38;
        break;
      }
    }
  }

}

void __77__CNContactsAutocompleteSearchOperation_autocompleteFetch_didReceiveResults___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "owner");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "unifyRecipientsIfNeccesary:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "taskID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_handleContactsAutocompleteSearch:returnedResults:taskID:", v2, v3, v4);

}

- (id)originContextForResult:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CNComposeRecipientOriginContext *v11;
  void *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "sourceType") & 2;
  v6 = v5 & 0xFFFFFFFFFFFFFFFELL | objc_msgSend(v4, "sourceType") & 1;
  if ((objc_msgSend(v4, "sourceType") & 0x48) != 0)
    v7 = v6 | 8;
  else
    v7 = v6;
  v8 = v7 & 0xFFFFFFFFFFFFFFEFLL | (16 * (((unint64_t)objc_msgSend(v4, "sourceType") >> 2) & 1));
  v9 = objc_msgSend(v4, "sourceType");

  if (v9)
    v10 = v8;
  else
    v10 = v8 | 2;
  v11 = objc_alloc_init(CNComposeRecipientOriginContext);
  -[CNAutocompleteSearchOperation text](self, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientOriginContext setSearchTerm:](v11, "setSearchTerm:", v12);

  -[CNComposeRecipientOriginContext setResultType:](v11, "setResultType:", v10);
  return v11;
}

- (id)unifyRecipientsIfNeccesary:(id)a3
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
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  CNUnifiedComposeRecipient *v31;
  id v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  void *v43;
  _BYTE v44[128];
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CNContactsAutocompleteSearchOperation shouldUnifyResults](self, "shouldUnifyResults"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v33 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v40 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          -[CNContactsAutocompleteSearchOperation unifyingIdentifierForRecipient:](self, "unifyingIdentifierForRecipient:", v11, v33);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v11, "isGroup") & 1) == 0 && v12)
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13;
            if (v13)
            {
              objc_msgSend(v13, "arrayByAddingObject:", v11);
            }
            else
            {
              v45 = v11;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
            }
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v12);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      }
      while (v8);
    }

    v16 = (id)objc_opt_new();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v6;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v36 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
          if ((objc_msgSend(v21, "isGroup", v33) & 1) != 0)
          {
            objc_msgSend(v16, "addObject:", v21);
          }
          else
          {
            -[CNContactsAutocompleteSearchOperation unifyingIdentifierForRecipient:](self, "unifyingIdentifierForRecipient:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "objectForKeyedSubscript:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v23;
            if (v23)
            {
              v25 = v23;
            }
            else
            {
              v43 = v21;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
              v25 = (id)objc_claimAutoreleasedReturnValue();
            }
            v26 = v25;

            objc_msgSend(v26, "firstObject");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21 == v27)
            {
              -[CNAutocompleteSearchOperation owner](self, "owner");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v28, "autocompleteSearchType");

              if (v29)
                objc_msgSend(v26, "firstObject");
              else
                -[CNContactsAutocompleteSearchOperation defaultChildForUnifiedEmailRecipients:](self, "defaultChildForUnifiedEmailRecipients:", v26);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = -[CNUnifiedComposeRecipient initWithChildren:defaultChild:]([CNUnifiedComposeRecipient alloc], "initWithChildren:defaultChild:", v26, v30);
              objc_msgSend(v16, "addObject:", v31);

            }
          }
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      }
      while (v18);
    }

    v4 = v33;
  }
  else
  {
    v16 = v4;
  }

  return v16;
}

- (id)defaultChildForUnifiedEmailRecipients:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNAutocompleteSearchOperation owner](self, "owner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "autocompleteSearchType");

  if (v6 || (unint64_t)objc_msgSend(v4, "count") <= 1)
  {
    objc_msgSend(v4, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v31 = v4;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v14, "address");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

          objc_msgSend(v14, "address");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
          {
            objc_msgSend(v14, "address");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v18);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v11);
    }

    -[CNContactsAutocompleteSearchOperation fetchContext](self, "fetchContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sendingAddress");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      v22 = v20;
    }
    else
    {
      -[CNContactsAutocompleteSearchOperation fetchContext](self, "fetchContext");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "otherAddressesAlreadyChosen");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "firstObject");
      v22 = (id)objc_claimAutoreleasedReturnValue();

    }
    v4 = v31;
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))()
      && (v27 = objc_msgSend(MEMORY[0x1E0D1E450], "rangeOfAddressDomainFromAddress:", v22), v27 != 0x7FFFFFFFFFFFFFFFLL))
    {
      objc_msgSend(v22, "substringWithRange:", v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C97348], "bestGuessEmailAddressForAddresses:sendingAddressDomain:alreadyDuetRanked:", v7, v29, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v30);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      objc_msgSend(v9, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v23;
}

- (id)unifyingIdentifierForRecipient:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "autocompleteResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)autocompleteFetchDidFinish:(id)a3
{
  CNPromise *fetchRequestPromise;
  id v4;

  fetchRequestPromise = self->_fetchRequestPromise;
  objc_msgSend(MEMORY[0x1E0C99E38], "null", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNPromise finishWithResult:](fetchRequestPromise, "finishWithResult:", v4);

}

- (CNCancelationToken)fetchRequestToken
{
  return self->_fetchRequestToken;
}

- (void)setFetchRequestToken:(id)a3
{
  objc_storeStrong((id *)&self->_fetchRequestToken, a3);
}

- (CNPromise)fetchRequestPromise
{
  return self->_fetchRequestPromise;
}

- (void)setFetchRequestPromise:(id)a3
{
  objc_storeStrong((id *)&self->_fetchRequestPromise, a3);
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

- (BOOL)includeStewie
{
  return self->_includeStewie;
}

- (void)setIncludeStewie:(BOOL)a3
{
  self->_includeStewie = a3;
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

- (NSNumber)shouldIncludeGroupResults
{
  return self->_shouldIncludeGroupResults;
}

- (void)setShouldIncludeGroupResults:(id)a3
{
  objc_storeStrong((id *)&self->_shouldIncludeGroupResults, a3);
}

- (BOOL)shouldUnifyResults
{
  return self->_shouldUnifyResults;
}

- (void)setShouldUnifyResults:(BOOL)a3
{
  self->_shouldUnifyResults = a3;
}

- (int64_t)addressableGroupResultStyle
{
  return self->_addressableGroupResultStyle;
}

- (void)setAddressableGroupResultStyle:(int64_t)a3
{
  self->_addressableGroupResultStyle = a3;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
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
  objc_storeStrong((id *)&self->_shouldIncludeGroupResults, 0);
  objc_storeStrong((id *)&self->_fetchRequestPromise, 0);
  objc_storeStrong((id *)&self->_fetchRequestToken, 0);
}

void __45__CNContactsAutocompleteSearchOperation_main__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B10FF000, a2, a3, "canceling CNAutocompleteFetch for task %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)autocompleteFetch:(_QWORD *)a3 didReceiveResults:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "ef_publicDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl(&dword_1B10FF000, a4, OS_LOG_TYPE_ERROR, "Error fetching members for contact of type CNAutocompleteResultTypeGroup: %{public}@", a1, 0xCu);

}

@end
