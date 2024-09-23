@implementation CNAutocompleteSuggestionsSearch

+ (unint64_t)charactersThreshold
{
  void *v2;
  unint64_t v3;
  char v5;

  v5 = 0;
  objc_msgSend(MEMORY[0x1E0D13BE8], "standardPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:keyExists:", CFSTR("CNSuggestionsCharactersThresholdInAutocomplete"), &v5);

  if (v5)
    return v3;
  else
    return 1;
}

- (CNAutocompleteSuggestionsSearch)init
{
  id v3;
  void *v4;
  CNAutocompleteSuggestionsSearch *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C972A0]);
  objc_msgSend(v3, "setIncludeSuggestedContacts:", 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97298]), "initWithConfiguration:", v3);
  v5 = -[CNAutocompleteSuggestionsSearch initWithContactStore:](self, "initWithContactStore:", v4);

  return v5;
}

- (CNAutocompleteSuggestionsSearch)initWithContactStore:(id)a3
{
  id v5;
  CNAutocompleteSuggestionsSearch *v6;
  CNAutocompleteSuggestionsSearch *v7;
  CNAutocompleteSuggestionsSearch *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNAutocompleteSuggestionsSearch;
  v6 = -[CNAutocompleteSuggestionsSearch init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contactStore, a3);
    v8 = v7;
  }

  return v7;
}

- (id)executeRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "schedulerProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backgroundScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__CNAutocompleteSuggestionsSearch_executeRequest_completionHandler___block_invoke;
  v15[3] = &unk_1E70DF530;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "performCancelableBlock:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __68__CNAutocompleteSuggestionsSearch_executeRequest_completionHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend((id)objc_opt_class(), "charactersThreshold");
  objc_msgSend(a1[5], "searchString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6 >= v4)
  {
    objc_msgSend(a1[4], "keysToFetchForRequest:", a1[5]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = a1[4];
    v11 = a1[5];
    v20 = 0;
    objc_msgSend(v10, "suggestedContactsWithRequest:keysToFetch:error:", v11, v9, &v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v20;
    if (v12)
    {
      objc_msgSend(a1[4], "convertContacts:request:", v12, a1[5]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __68__CNAutocompleteSuggestionsSearch_executeRequest_completionHandler___block_invoke_4;
      v17[3] = &unk_1E70DF5A0;
      v15 = a1[6];
      v18 = v14;
      v19 = v15;
      v16 = v14;
      objc_msgSend(v3, "performBlock:", v17);

    }
    else
    {
      (*((void (**)(void))a1[6] + 2))();
    }

  }
  else
  {
    CNALoggingContextDebug();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[5];
      *(_DWORD *)buf = 134218240;
      v22 = v8;
      v23 = 2048;
      v24 = v4;
      _os_log_impl(&dword_1B9950000, v7, OS_LOG_TYPE_DEFAULT, "Skipping request %p against suggestion because search string is smaller than %lu chars", buf, 0x16u);
    }

    (*((void (**)(void))a1[6] + 2))();
  }

}

uint64_t __68__CNAutocompleteSuggestionsSearch_executeRequest_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (id)keysToFetchForRequest:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = (void *)MEMORY[0x1E0C97218];
  v5 = a3;
  objc_msgSend(v4, "descriptorForRequiredKeysForStyle:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "searchableProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObjectsFromArray:", v8);
  +[CNAutocompleteNameComponents contactKeys](CNAutocompleteNameComponents, "contactKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v9);

  return v7;
}

- (id)suggestedContactsWithRequest:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  NSObject *v42;
  void *v43;
  int v45;
  id v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  CNALoggingContextTriage();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "triageIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 138543362;
    v46 = v11;
    _os_log_impl(&dword_1B9950000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] CoreSuggestions: Will search", (uint8_t *)&v45, 0xCu);

  }
  CNALoggingContextDebug();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v45 = 134217984;
    v46 = v8;
    _os_log_impl(&dword_1B9950000, v12, OS_LOG_TYPE_DEFAULT, "Executing request %p against suggested contacts", (uint8_t *)&v45, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D13BB8], "defaultProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timestamp");
  v15 = v14;

  CNALoggingContextTriage();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_signpost_id_generate(v16);

  CNALoggingContextPerformance();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    LOWORD(v45) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9950000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "Searching CoreSuggestions", ", (uint8_t *)&v45, 2u);
  }

  v20 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(v8, "searchString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "predicateForContactsMatchingName:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAutocompleteSuggestionsSearch contactStore](self, "contactStore");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "unifiedContactsMatchingPredicate:keysToFetch:error:", v22, v9, a5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  CNALoggingContextPerformance();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    LOWORD(v45) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9950000, v26, OS_SIGNPOST_INTERVAL_END, v17, "Searching CoreSuggestions", ", (uint8_t *)&v45, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D13BB8], "defaultProvider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "timestamp");
  v29 = v28;

  objc_msgSend(MEMORY[0x1E0D13BB0], "stringForTimeInterval:", v29 - v15);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    CNALoggingContextPerformance();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v24, "count"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 138412546;
      v46 = v32;
      v47 = 2112;
      v48 = (uint64_t)v30;
      _os_log_impl(&dword_1B9950000, v31, OS_LOG_TYPE_INFO, "Time to fetch %@ suggested contacts: %@", (uint8_t *)&v45, 0x16u);

    }
    CNALoggingContextDebug();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v24, "count"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_cn_take:", 200);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 138412547;
      v46 = v34;
      v47 = 2113;
      v48 = (uint64_t)v35;
      _os_log_impl(&dword_1B9950000, v33, OS_LOG_TYPE_DEFAULT, "Suggestions results (first 200 out of %@): %{private}@", (uint8_t *)&v45, 0x16u);

    }
    CNALoggingContextTriage();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "triageIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v24, "count");
      v45 = 138543874;
      v46 = v37;
      v47 = 2048;
      v48 = v38;
      v49 = 2114;
      v50 = v30;
      _os_log_impl(&dword_1B9950000, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@] CoreSuggestions: Search complete (%ld result(s), %{public}@)", (uint8_t *)&v45, 0x20u);

    }
    v39 = v24;
  }
  else
  {
    if (a5)
      v40 = *a5;
    else
      v40 = 0;
    v41 = v40;
    CNALoggingContextTriage();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "triageIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 138543874;
      v46 = v43;
      v47 = 2114;
      v48 = (uint64_t)v30;
      v49 = 2114;
      v50 = v41;
      _os_log_impl(&dword_1B9950000, v42, OS_LOG_TYPE_DEFAULT, "[%{public}@] CoreSuggestions: Search failed (%{public}@): %{public}@", (uint8_t *)&v45, 0x20u);

    }
  }

  return v24;
}

- (id)convertContacts:(id)a3 request:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  CNAutocompleteResultTokenMatcher *v10;
  void *v11;
  CNAutocompleteResultTokenMatcher *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  -[CNAutocompleteSuggestionsSearch resultTransformWithRequest:](self, "resultTransformWithRequest:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_cn_flatMap:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [CNAutocompleteResultTokenMatcher alloc];
  objc_msgSend(v6, "searchString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[CNAutocompleteResultTokenMatcher initWithSearchString:](v10, "initWithSearchString:", v11);
  -[CNAutocompleteResultTokenMatcher filterAdapter](v12, "filterAdapter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_cn_filter:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)resultTransformWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CNContactStore *v11;
  CNContactStore *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  CNContactStore *v19;
  id v20;

  v4 = a3;
  objc_msgSend(v4, "priorityDomainForSorting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendingAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAutocompleteResultFactory factoryWithPriorityDomain:sendingAddress:](CNAutocompleteResultFactory, "factoryWithPriorityDomain:sendingAddress:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "searchableProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSuggestionsSearch resultTransformWithFactory:properties:](self, "resultTransformWithFactory:properties:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = self->_contactStore;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __62__CNAutocompleteSuggestionsSearch_resultTransformWithRequest___block_invoke;
  v17[3] = &unk_1E70E0490;
  v17[4] = self;
  v18 = v4;
  v19 = v11;
  v20 = v10;
  v12 = v11;
  v13 = v4;
  v14 = v10;
  v15 = (void *)objc_msgSend(v17, "copy");

  return v15;
}

id __62__CNAutocompleteSuggestionsSearch_resultTransformWithRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id obj;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v30;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v8);
        v25[0] = v7;
        v25[1] = 3221225472;
        v25[2] = __62__CNAutocompleteSuggestionsSearch_resultTransformWithRequest___block_invoke_2;
        v25[3] = &unk_1E70E0440;
        v10 = v3;
        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(void **)(a1 + 40);
        v26 = v10;
        v27 = v11;
        v28 = v12;
        objc_msgSend(v9, "setContactProvider:", v25);
        v23[0] = v7;
        v23[1] = 3221225472;
        v23[2] = __62__CNAutocompleteSuggestionsSearch_resultTransformWithRequest___block_invoke_17;
        v23[3] = &unk_1E70DF920;
        v13 = v10;
        v24 = v13;
        objc_msgSend(v9, "addDiagnosticLog:", v23);
        v20[0] = v7;
        v20[1] = 3221225472;
        v20[2] = __62__CNAutocompleteSuggestionsSearch_resultTransformWithRequest___block_invoke_2_21;
        v20[3] = &unk_1E70E0468;
        v21 = *(id *)(a1 + 48);
        v14 = v13;
        v22 = v14;
        objc_msgSend(v9, "addDiagnosticLog:", v20);
        v17[0] = v7;
        v17[1] = 3221225472;
        v17[2] = __62__CNAutocompleteSuggestionsSearch_resultTransformWithRequest___block_invoke_3_35;
        v17[3] = &unk_1E70DF618;
        v18 = v14;
        v19 = *(id *)(a1 + 48);
        objc_msgSend(v9, "setIgnoreResultBlock:", v17);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v5);
  }

  return obj;
}

id __62__CNAutocompleteSuggestionsSearch_resultTransformWithRequest___block_invoke_2(id *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(a1[4], "areKeysAvailable:", v5))
  {
    v6 = a1[4];
  }
  else
  {
    objc_msgSend(a1[5], "suggestedContactsWithRequest:keysToFetch:error:", a1[6], v5, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __62__CNAutocompleteSuggestionsSearch_resultTransformWithRequest___block_invoke_3;
    v13[3] = &unk_1E70E0418;
    v14 = a1[4];
    objc_msgSend(v7, "_cn_firstObjectPassingTest:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      CNALoggingContextTriage();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a1[6], "triageIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v16 = v11;
        _os_log_impl(&dword_1B9950000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] CNAutocompleteSuggestionsSearch: Contact provider failed to refetch contact, returning internally fetched contact.", buf, 0xCu);

      }
      v9 = a1[4];
    }
    v6 = v9;

  }
  return v6;
}

uint64_t __62__CNAutocompleteSuggestionsSearch_resultTransformWithRequest___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqualToString:", v5);
  return v6;
}

id __62__CNAutocompleteSuggestionsSearch_resultTransformWithRequest___block_invoke_17(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "suggestionRecordId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("Suggestion record id: %lld"), objc_msgSend(v2, "numericValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __62__CNAutocompleteSuggestionsSearch_resultTransformWithRequest___block_invoke_2_21(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "originForSuggestion:error:", *(_QWORD *)(a1 + 40), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Title: %@\n"), v4);

  objc_msgSend(v2, "fromPerson");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("From: %@\n"), v5);

  objc_msgSend(v2, "to");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("To: %@\n"), v6);

  objc_msgSend(v2, "cc");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("CC: %@\n"), v7);

  objc_msgSend(v2, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Date: %@\n"), v8);

  objc_msgSend(v2, "contextSnippet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Context:\n=====\n%@\n====="), v9);

  return v3;
}

uint64_t __62__CNAutocompleteSuggestionsSearch_resultTransformWithRequest___block_invoke_3_35(uint64_t a1, _QWORD *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C973F0]);
  objc_msgSend(v4, "rejectSuggestion:", *(_QWORD *)(a1 + 32));
  v5 = *(void **)(a1 + 40);
  v11 = 0;
  v6 = objc_msgSend(v5, "executeSaveRequest:error:", v4, &v11);
  v7 = v11;
  if ((v6 & 1) == 0)
  {
    CNALoggingContextDebug();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1B9950000, v8, OS_LOG_TYPE_DEFAULT, "Can't ignore suggestion: %@, with error: %@", buf, 0x16u);
    }

    if (a2)
      *a2 = objc_retainAutorelease(v7);
  }

  return v6;
}

- (id)resultTransformWithFactory:(id)a3 properties:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[CNAutocompleteLocalContactResultTransformBuilder suggestedContactBuilderWithResultFactory:](CNAutocompleteLocalContactResultTransformBuilder, "suggestedContactBuilderWithResultFactory:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "addTransformForProperty:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++), (_QWORD)v14);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
