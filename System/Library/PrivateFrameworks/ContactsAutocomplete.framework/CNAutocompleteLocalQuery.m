@implementation CNAutocompleteLocalQuery

+ (id)peopleQuery
{
  CNAutocompleteLocalContactsFetcher *v3;
  void *v4;

  v3 = objc_alloc_init(CNAutocompleteLocalContactsFetcher);
  objc_msgSend(a1, "queryWithDelegate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)groupsQuery
{
  CNAutocompleteLocalGroupsFetcher *v3;
  void *v4;

  v3 = objc_alloc_init(CNAutocompleteLocalGroupsFetcher);
  objc_msgSend(a1, "queryWithDelegate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)queryWithDelegate:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = (void *)v5[4];
  v5[4] = v4;

  return v5;
}

- (id)run
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  -[CNAutocompleteLocalQuery request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __31__CNAutocompleteLocalQuery_run__block_invoke;
  v9[3] = &unk_1E70DF1E8;
  v9[4] = self;
  objc_msgSend(v4, "_cn_flatMap:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAutocompleteLocalQuery makeResultFactory](self, "makeResultFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteLocalQuery autocompleteResultsForFetchResults:resultFactory:](self, "autocompleteResultsForFetchResults:resultFactory:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __31__CNAutocompleteLocalQuery_run__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchResultsForString:", a2);
}

- (id)fetchResultsForString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  void *v11;
  CNAutocompleteLocalQueryDelegate *v12;
  CNAutocompleteLocalQueryDelegate *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  CNAutocompleteLocalQueryDelegate *delegate;
  CNContactStore *contactStore;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  CNAutocompleteLocalQueryDelegate *v29;
  CNAutocompleteLocalQueryDelegate *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  NSObject *v34;
  CNAutocompleteLocalQueryDelegate *v35;
  unint64_t v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  CNAutocompleteLocalQueryDelegate *v45;
  CNAutocompleteLocalQueryDelegate *v46;
  CNAutocompleteLocalQueryDelegate *v47;
  CNContactStore *v48;
  CNAutocompleteLocalQueryDelegate *v50;
  id v51;
  id v52;
  uint8_t buf[4];
  CNAutocompleteLocalQueryDelegate *v54;
  __int16 v55;
  CNAutocompleteLocalQueryDelegate *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "_cn_tokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteLocalQuery searchableProperties](self, "searchableProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13BB8], "defaultProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timestamp");
  v9 = v8;

  CNALoggingContextTriage();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[CNAutocompleteFetchRequest triageIdentifier](self->_request, "triageIdentifier");
    v11 = v6;
    v12 = (CNAutocompleteLocalQueryDelegate *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteLocalQueryDelegate queryNameForLogging](self->_delegate, "queryNameForLogging");
    v13 = (CNAutocompleteLocalQueryDelegate *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v54 = v12;
    v55 = 2114;
    v56 = v13;
    _os_log_impl(&dword_1B9950000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@: Will search", buf, 0x16u);

    v6 = v11;
  }

  CNALoggingContextTriage();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_generate(v14);

  CNALoggingContextPerformance();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9950000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "Searching Contacts", ", buf, 2u);
  }

  delegate = self->_delegate;
  contactStore = self->_contactStore;
  v52 = 0;
  -[CNAutocompleteLocalQueryDelegate resultsForSearchString:terms:properties:contactStore:error:](delegate, "resultsForSearchString:terms:properties:contactStore:error:", v4, v5, v6, contactStore, &v52);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v52;
  CNALoggingContextPerformance();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9950000, v22, OS_SIGNPOST_INTERVAL_END, v15, "Searching Contacts", ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D13BB8], "defaultProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "timestamp");
  v25 = v24;

  objc_msgSend(MEMORY[0x1E0D13BB0], "stringForTimeInterval:", v25 - v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  CNALoggingContextTriage();
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
  if (v20)
  {
    if (v28)
    {
      -[CNAutocompleteFetchRequest triageIdentifier](self->_request, "triageIdentifier");
      v29 = (CNAutocompleteLocalQueryDelegate *)objc_claimAutoreleasedReturnValue();
      -[CNAutocompleteLocalQueryDelegate queryNameForLogging](self->_delegate, "queryNameForLogging");
      v30 = (CNAutocompleteLocalQueryDelegate *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v20, "count");
      v32 = objc_msgSend(v20, "count");
      *(_DWORD *)buf = 138544386;
      v33 = "results";
      v54 = v29;
      v55 = 2114;
      if (v32 == 1)
        v33 = "result";
      v56 = v30;
      v57 = 2048;
      v58 = v31;
      v59 = 2080;
      v60 = (uint64_t)v33;
      v61 = 2114;
      v62 = v26;
      _os_log_impl(&dword_1B9950000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@: Search complete (%lu %s, %{public}@)", buf, 0x34u);

    }
    CNALoggingContextDebug();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      -[CNAutocompleteLocalQueryDelegate queryNameForLogging](self->_delegate, "queryNameForLogging");
      v35 = (CNAutocompleteLocalQueryDelegate *)objc_claimAutoreleasedReturnValue();
      v50 = self->_delegate;
      v36 = objc_msgSend(v20, "count");
      v37 = v26;
      v38 = v4;
      v39 = v6;
      v40 = v5;
      if (v36 >= 0xC8)
        v41 = 200;
      else
        v41 = v36;
      v42 = objc_msgSend(v20, "count");
      objc_msgSend(v20, "_cn_take:", 200);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544387;
      v54 = v35;
      v55 = 2112;
      v56 = v50;
      v57 = 2048;
      v58 = v41;
      v5 = v40;
      v6 = v39;
      v4 = v38;
      v26 = v37;
      v59 = 2048;
      v60 = v42;
      v61 = 2113;
      v62 = v43;
      _os_log_impl(&dword_1B9950000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ results with delegate %@ (first %lu out of %lu): %{private}@", buf, 0x34u);

    }
    v44 = v51;
  }
  else
  {
    v44 = v51;
    if (v28)
    {
      -[CNAutocompleteFetchRequest triageIdentifier](self->_request, "triageIdentifier");
      v45 = (CNAutocompleteLocalQueryDelegate *)objc_claimAutoreleasedReturnValue();
      -[CNAutocompleteLocalQueryDelegate queryNameForLogging](self->_delegate, "queryNameForLogging");
      v46 = (CNAutocompleteLocalQueryDelegate *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v54 = v45;
      v55 = 2114;
      v56 = v46;
      v57 = 2114;
      v58 = (uint64_t)v26;
      v59 = 2112;
      v60 = (uint64_t)v51;
      _os_log_impl(&dword_1B9950000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@: Search failed (%{public}@): %@", buf, 0x2Au);

    }
    CNALoggingContextDebug();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v47 = self->_delegate;
      v48 = self->_contactStore;
      *(_DWORD *)buf = 138413314;
      v54 = v47;
      v55 = 2112;
      v56 = (CNAutocompleteLocalQueryDelegate *)v4;
      v57 = 2112;
      v58 = (uint64_t)v5;
      v59 = 2112;
      v60 = (uint64_t)v48;
      v61 = 2112;
      v62 = v51;
      _os_log_impl(&dword_1B9950000, v34, OS_LOG_TYPE_DEFAULT, "Got nil results when asking: %@ for: %@, terms: %@, contactStore: %@, error: %@", buf, 0x34u);
    }
  }

  return v20;
}

- (id)makeResultFactory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CNAutocompleteFetchRequest priorityDomainForSorting](self->_request, "priorityDomainForSorting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteFetchRequest fetchContext](self->_request, "fetchContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendingAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAutocompleteResultFactory factoryWithPriorityDomain:sendingAddress:](CNAutocompleteResultFactory, "factoryWithPriorityDomain:sendingAddress:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)autocompleteResultsForFetchResults:(id)a3 resultFactory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[CNAutocompleteLocalQuery searchableProperties](self, "searchableProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteLocalQueryDelegate autocompleteResultsForProperties:fetchResults:resultFactory:contactStore:](self->_delegate, "autocompleteResultsForProperties:fetchResults:resultFactory:contactStore:", v8, v7, v6, self->_contactFetcherStore);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)searchableProperties
{
  return -[CNAutocompleteFetchRequest searchableProperties](self->_request, "searchableProperties");
}

- (void)cancel
{
  NSObject *v3;
  int v4;
  CNAutocompleteLocalQuery *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  CNALoggingContextDebug();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_1B9950000, v3, OS_LOG_TYPE_DEFAULT, "Cancel: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (CNAutocompleteFetchRequest)request
{
  return (CNAutocompleteFetchRequest *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (CNContactStore)contactStore
{
  return (CNContactStore *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContactStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CNContactStore)contactFetcherStore
{
  return (CNContactStore *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContactFetcherStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_contactFetcherStore, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
