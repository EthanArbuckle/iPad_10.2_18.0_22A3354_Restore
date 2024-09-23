@implementation CNAutocompleteLocalGroupsFetcher

- (id)autocompleteResultsForProperties:(id)a3 fetchResults:(id)a4 resultFactory:(id)a5 contactStore:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __109__CNAutocompleteLocalGroupsFetcher_autocompleteResultsForProperties_fetchResults_resultFactory_contactStore___block_invoke;
  v17[3] = &unk_1E70DF470;
  v18 = v10;
  v19 = v9;
  v20 = v11;
  v12 = v11;
  v13 = v9;
  v14 = v10;
  objc_msgSend(a4, "_cn_compactMap:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __109__CNAutocompleteLocalGroupsFetcher_autocompleteResultsForProperties_fetchResults_resultFactory_contactStore___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = a1[4];
  objc_msgSend(v6, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localGroupResultWithDisplayName:groupIdentifier:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __109__CNAutocompleteLocalGroupsFetcher_autocompleteResultsForProperties_fetchResults_resultFactory_contactStore___block_invoke_2;
  v13[3] = &unk_1E70DF448;
  v14 = v6;
  v15 = a1[5];
  v16 = a1[6];
  v17 = a1[4];
  v11 = v6;
  objc_msgSend(v10, "setMembersProvider:", v13);

  return v10;
}

id __109__CNAutocompleteLocalGroupsFetcher_autocompleteResultsForProperties_fetchResults_resultFactory_contactStore___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  CNAutocompleteLocalContactsFetcher *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateForContactsInGroupWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(CNAutocompleteLocalContactsFetcher);
  CNALoggingContextDebug();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(void **)(a1 + 32);
    v13 = 138412290;
    v14 = v9;
    _os_log_impl(&dword_1B9950000, v8, OS_LOG_TYPE_DEFAULT, "About to fetch members for group: %@", (uint8_t *)&v13, 0xCu);
  }

  -[CNAutocompleteLocalContactsFetcher autocompleteResultsForProperties:contactPredicate:contactStore:resultFactory:error:](v7, "autocompleteResultsForProperties:contactPredicate:contactStore:resultFactory:error:", *(_QWORD *)(a1 + 40), v6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CNALoggingContextDebug();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v10;
    _os_log_impl(&dword_1B9950000, v11, OS_LOG_TYPE_DEFAULT, "Did get members: %@", (uint8_t *)&v13, 0xCu);
  }

  return v10;
}

- (id)resultsForSearchString:(id)a3 terms:(id)a4 properties:(id)a5 contactStore:(id)a6 error:(id *)a7
{
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v9 = (void *)MEMORY[0x1E0C97318];
  v10 = a6;
  objc_msgSend(v9, "predicateForGroupsWithNameMatching:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "groupsMatchingPredicate:error:", v11, a7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)queryNameForLogging
{
  return CFSTR("Local Groups");
}

@end
