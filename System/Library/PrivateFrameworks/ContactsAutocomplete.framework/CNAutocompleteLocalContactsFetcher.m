@implementation CNAutocompleteLocalContactsFetcher

- (id)autocompleteResultsForProperties:(id)a3 fetchResults:(id)a4 resultFactory:(id)a5 contactStore:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  id (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  id v26;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  objc_msgSend(a4, "_cn_filter:", &__block_literal_global_9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteLocalContactsFetcher transformWithProperties:factory:](self, "transformWithProperties:factory:", v12, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __111__CNAutocompleteLocalContactsFetcher_autocompleteResultsForProperties_fetchResults_resultFactory_contactStore___block_invoke;
  v24 = &unk_1E70DF260;
  v25 = v10;
  v26 = v14;
  v15 = v10;
  v16 = v14;
  objc_msgSend(v13, "_cn_map:", &v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_cn_filter:", *MEMORY[0x1E0D13830], v21, v22, v23, v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_cn_flatten");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id __111__CNAutocompleteLocalContactsFetcher_autocompleteResultsForProperties_fetchResults_resultFactory_contactStore___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __111__CNAutocompleteLocalContactsFetcher_autocompleteResultsForProperties_fetchResults_resultFactory_contactStore___block_invoke_2;
  v8[3] = &unk_1E70DF238;
  v9 = v3;
  v10 = *(id *)(a1 + 32);
  v5 = v3;
  v6 = (id)objc_msgSend(v4, "_cn_map:", v8);

  return v4;
}

id __111__CNAutocompleteLocalContactsFetcher_autocompleteResultsForProperties_fetchResults_resultFactory_contactStore___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id location;

  v3 = a2;
  objc_initWeak(&location, v3);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __111__CNAutocompleteLocalContactsFetcher_autocompleteResultsForProperties_fetchResults_resultFactory_contactStore___block_invoke_3;
  v5[3] = &unk_1E70DF210;
  objc_copyWeak(&v8, &location);
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v3, "setContactProvider:", v5);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v3;
}

id __111__CNAutocompleteLocalContactsFetcher_autocompleteResultsForProperties_fetchResults_resultFactory_contactStore___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  CNALoggingContextDebug();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v8 = *(_QWORD *)(a1 + 32);
    v14 = 138412546;
    v15 = WeakRetained;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_1B9950000, v6, OS_LOG_TYPE_DEFAULT, "About to fetch full contact for autocomplete result: %@ contact: %@", (uint8_t *)&v14, 0x16u);

  }
  v9 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unifiedContactWithIdentifier:keysToFetch:error:", v10, v5, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  CNALoggingContextDebug();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v11;
    _os_log_impl(&dword_1B9950000, v12, OS_LOG_TYPE_DEFAULT, "Got full contact: %@", (uint8_t *)&v14, 0xCu);
  }

  return v11;
}

- (id)transformWithProperties:(id)a3 factory:(id)a4
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
  v5 = a3;
  +[CNAutocompleteLocalContactResultTransformBuilder localContactBuilderWithResultFactory:](CNAutocompleteLocalContactResultTransformBuilder, "localContactBuilderWithResultFactory:", a4);
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

- (id)autocompleteResultsForProperties:(id)a3 contactPredicate:(id)a4 contactStore:(id)a5 resultFactory:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  -[CNAutocompleteLocalContactsFetcher contactsForPredicate:properties:contactStore:error:](self, "contactsForPredicate:properties:contactStore:error:", a4, v12, v13, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[CNAutocompleteLocalContactsFetcher autocompleteResultsForProperties:fetchResults:resultFactory:contactStore:](self, "autocompleteResultsForProperties:fetchResults:resultFactory:contactStore:", v12, v15, v14, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CNALoggingContextDebug();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      if (a7)
        v18 = *a7;
      else
        v18 = 0;
      v20 = 138412290;
      v21 = v18;
      _os_log_impl(&dword_1B9950000, v17, OS_LOG_TYPE_DEFAULT, "Got nil contacts from Contacts, error: %@", (uint8_t *)&v20, 0xCu);
    }

    v16 = 0;
  }

  return v16;
}

- (id)queryNameForLogging
{
  return CFSTR("Local Contacts");
}

- (id)contactsForPredicate:(id)a3 properties:(id)a4 contactStore:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a5;
  v11 = a3;
  -[CNAutocompleteLocalContactsFetcher keysToFetchForProperties:](self, "keysToFetchForProperties:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unifiedContactsMatchingPredicate:keysToFetch:error:", v11, v12, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)keysToFetchForProperties:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0C99E20];
  v4 = (void *)MEMORY[0x1E0C97218];
  v5 = a3;
  objc_msgSend(v4, "descriptorForRequiredKeysForStyle:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObjectsFromArray:", v5);
  +[CNAutocompleteNameComponents contactKeys](CNAutocompleteNameComponents, "contactKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v8);

  objc_msgSend(v7, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)resultsForSearchString:(id)a3 terms:(id)a4 properties:(id)a5 contactStore:(id)a6 error:(id *)a7
{
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  _QWORD v38[13];

  v38[11] = *MEMORY[0x1E0C80C00];
  v11 = (objc_class *)MEMORY[0x1E0C97210];
  v12 = a6;
  v13 = a5;
  v14 = a3;
  v15 = [v11 alloc];
  -[CNAutocompleteLocalContactsFetcher keysToFetchForProperties:](self, "keysToFetchForProperties:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithKeysToFetch:", v16);

  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingFullTextSearch:containerIdentifiers:groupIdentifiers:", v14, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setPredicate:", v18);
  objc_msgSend(v17, "setUnifyResults:", 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x1E0C96780];
  v38[0] = *MEMORY[0x1E0C966D0];
  v38[1] = v20;
  v21 = *MEMORY[0x1E0C967D8];
  v38[2] = *MEMORY[0x1E0C966C0];
  v38[3] = v21;
  v22 = *MEMORY[0x1E0C967D0];
  v38[4] = *MEMORY[0x1E0C967E0];
  v38[5] = v22;
  v23 = *MEMORY[0x1E0C967B8];
  v38[6] = *MEMORY[0x1E0C967A0];
  v38[7] = v23;
  v24 = *MEMORY[0x1E0C96790];
  v38[8] = *MEMORY[0x1E0C96820];
  v38[9] = v24;
  v38[10] = *MEMORY[0x1E0C96798];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 11);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "setByAddingObjectsFromArray:", v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_alloc_init(MEMORY[0x1E0D13BD8]);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __97__CNAutocompleteLocalContactsFetcher_resultsForSearchString_terms_properties_contactStore_error___block_invoke;
  v34[3] = &unk_1E70DF2A8;
  v34[4] = self;
  v35 = v27;
  v36 = v28;
  v29 = v19;
  v37 = v29;
  v30 = v28;
  v31 = v27;
  LODWORD(v26) = objc_msgSend(v12, "enumerateContactsAndMatchInfoWithFetchRequest:error:usingBlock:", v17, a7, v34);

  v32 = 0;
  if ((_DWORD)v26)
    v32 = (void *)objc_msgSend(v29, "copy");

  return v32;
}

void __97__CNAutocompleteLocalContactsFetcher_resultsForSearchString_terms_properties_contactStore_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "doesMatchInfo:matchProperties:", a3, *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 48), "lock");
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v5);
    objc_msgSend(*(id *)(a1 + 48), "unlock");
  }

}

- (BOOL)doesMatchInfo:(id)a3 matchProperties:(id)a4
{
  id v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "matchedNameProperty");
  objc_msgSend(v6, "matchedProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__CNAutocompleteLocalContactsFetcher_doesMatchInfo_matchProperties___block_invoke;
  v13[3] = &unk_1E70DEEB8;
  v14 = v5;
  v10 = v5;
  v11 = v7 | objc_msgSend(v9, "_cn_any:", v13);

  return v11;
}

uint64_t __68__CNAutocompleteLocalContactsFetcher_doesMatchInfo_matchProperties___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

@end
