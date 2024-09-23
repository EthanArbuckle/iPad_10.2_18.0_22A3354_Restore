@implementation CNAutocompleteRecentContactsLibrary

+ (id)library:(id)a3 recentContactsWithRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "queryForRequest:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CNALoggingContextDebug();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412546;
    v16 = v8;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1B9950000, v9, OS_LOG_TYPE_DEFAULT, "Performing recents query: %@ against library: %@", (uint8_t *)&v15, 0x16u);
  }

  v10 = objc_alloc_init(MEMORY[0x1E0D13B20]);
  objc_msgSend(v10, "future");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addLoggingHandlersToFuture:request:", v11, v7);

  objc_msgSend(v10, "completionHandlerAdapter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performRecentsSearch:queue:completion:", v8, 0, v12);

  objc_msgSend(v10, "future");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)queryForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(a1, "domainsForFetchRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addressKindsForSearchType:", objc_msgSend(v4, "searchType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "implicitGroupThresholdForSearchType:", objc_msgSend(v4, "searchType"));
  v8 = *MEMORY[0x1E0D13848];
  objc_msgSend(v4, "searchString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  v11 = (void *)MEMORY[0x1E0D182A0];
  if (v10)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0D182A0]);
    objc_msgSend(MEMORY[0x1E0D18298], "predicateForKey:inCollection:", *MEMORY[0x1E0D18248], v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSearchPredicate:", v13);
  }
  else
  {
    objc_msgSend(v4, "searchString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fetchContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendingAddress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "searchQueryForSearchTerm:preferredKinds:sendingAddress:recentsDomain:", v13, v6, v15, &stru_1E70E0E70);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v12, "setDomains:", v5);
  objc_msgSend(v12, "setImplicitGroupThreshold:", v7);
  objc_msgSend(v12, "setComparator:", 0);

  return v12;
}

+ (void)addLoggingHandlersToFuture:(id)a3 request:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  os_signpost_id_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  os_signpost_id_t v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "triageIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13BB8], "defaultProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timestamp");
  v9 = v8;

  CNALoggingContextTriage();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v27 = v6;
    _os_log_impl(&dword_1B9950000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] CoreRecents: Will search", buf, 0xCu);
  }

  CNALoggingContextTriage();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  CNALoggingContextPerformance();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9950000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Searching CoreRecents", ", buf, 2u);
  }

  v15 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __74__CNAutocompleteRecentContactsLibrary_addLoggingHandlersToFuture_request___block_invoke;
  v22[3] = &unk_1E70DEB40;
  v24 = v12;
  v25 = v9;
  v16 = v6;
  v23 = v16;
  objc_msgSend(v5, "addSuccessBlock:", v22);
  v18[0] = v15;
  v18[1] = 3221225472;
  v18[2] = __74__CNAutocompleteRecentContactsLibrary_addLoggingHandlersToFuture_request___block_invoke_9;
  v18[3] = &unk_1E70DEB68;
  v21 = v9;
  v19 = v16;
  v20 = v12;
  v17 = v16;
  objc_msgSend(v5, "addFailureBlock:", v18);

}

void __74__CNAutocompleteRecentContactsLibrary_addLoggingHandlersToFuture_request___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  CNALoggingContextPerformance();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9950000, v5, OS_SIGNPOST_INTERVAL_END, v6, "Searching CoreRecents", ", (uint8_t *)&v22, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D13BB8], "defaultProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timestamp");
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0D13BB0], "stringForTimeInterval:", v9 - *(double *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CNALoggingContextTriage();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(void **)(a1 + 32);
    v13 = objc_msgSend(v3, "count");
    v14 = objc_msgSend(v3, "count");
    v15 = "results";
    v22 = 138544130;
    v23 = v12;
    v24 = 2048;
    if (v14 == 1)
      v15 = "result";
    v25 = v13;
    v26 = 2080;
    v27 = v15;
    v28 = 2114;
    v29 = v10;
    _os_log_impl(&dword_1B9950000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] CoreRecents: Search complete (%lu %s, %{public}@)", (uint8_t *)&v22, 0x2Au);
  }

  CNALoggingContextPerformance();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412546;
    v23 = v17;
    v24 = 2114;
    v25 = (uint64_t)v10;
    _os_log_impl(&dword_1B9950000, v16, OS_LOG_TYPE_INFO, "Time to fetch %@ recent contacts: %{public}@", (uint8_t *)&v22, 0x16u);

  }
  CNALoggingContextDebug();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_cn_take:", 200);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_cn_map:", &__block_literal_global);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412546;
    v23 = v19;
    v24 = 2112;
    v25 = (uint64_t)v21;
    _os_log_impl(&dword_1B9950000, v18, OS_LOG_TYPE_DEFAULT, "CoreRecents results (first 200 out of %@): %@", (uint8_t *)&v22, 0x16u);

  }
}

void __74__CNAutocompleteRecentContactsLibrary_addLoggingHandlersToFuture_request___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  CNALoggingContextPerformance();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9950000, v5, OS_SIGNPOST_INTERVAL_END, v6, "Searching CoreRecents", ", (uint8_t *)&v15, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D13BB8], "defaultProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timestamp");
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0D13BB0], "stringForTimeInterval:", v9 - *(double *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CNALoggingContextTriage();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(void **)(a1 + 32);
    v15 = 138543874;
    v16 = v12;
    v17 = 2114;
    v18 = v10;
    v19 = 2114;
    v20 = v3;
    _os_log_impl(&dword_1B9950000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] CoreRecents: Search failed (%{public}@): %{public}@", (uint8_t *)&v15, 0x20u);
  }

  CNALoggingContextPerformance();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v15 = 138543362;
    v16 = v10;
    _os_log_impl(&dword_1B9950000, v13, OS_LOG_TYPE_INFO, "Failure fetching recent contacts after %{public}@", (uint8_t *)&v15, 0xCu);
  }

  CNALoggingContextDebug();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v3;
    _os_log_impl(&dword_1B9950000, v14, OS_LOG_TYPE_DEFAULT, "Failed to fetch recent contacts: %@", (uint8_t *)&v15, 0xCu);
  }

}

+ (id)domainsForFetchRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(v4, "fetchContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(v4, "fetchContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "bundleIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

  }
  else
  {
    v11 = objc_msgSend(v4, "searchType");

    objc_msgSend(a1, "domainsForSearchType:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

+ (id)domainsForSearchType:(unint64_t)a3
{
  void *v4;
  uint64_t *v5;
  NSObject *v6;
  id result;
  int v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0uLL:
      v13[0] = *MEMORY[0x1E0D18268];
      v4 = (void *)MEMORY[0x1E0C99D20];
      v5 = v13;
      goto LABEL_9;
    case 1uLL:
    case 4uLL:
    case 5uLL:
      v12 = *MEMORY[0x1E0D18278];
      v4 = (void *)MEMORY[0x1E0C99D20];
      v5 = &v12;
      goto LABEL_9;
    case 2uLL:
      v11 = *MEMORY[0x1E0D18260];
      v4 = (void *)MEMORY[0x1E0C99D20];
      v5 = &v11;
      goto LABEL_9;
    case 3uLL:
      v10 = *MEMORY[0x1E0D18258];
      v4 = (void *)MEMORY[0x1E0C99D20];
      v5 = &v10;
LABEL_9:
      objc_msgSend(v4, "arrayWithObjects:count:", v5, 1);
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      CNALoggingContextDebug();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 134217984;
        v9 = a3;
        _os_log_impl(&dword_1B9950000, v6, OS_LOG_TYPE_DEFAULT, "No domain for searchType: %lu ", (uint8_t *)&v8, 0xCu);
      }

      result = 0;
      break;
  }
  return result;
}

+ (id)addressKindsForSearchType:(unint64_t)a3
{
  uint64_t v3;
  void *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3 - 4 < 2)
    goto LABEL_4;
  if (a3 == 2)
  {
    v7 = *MEMORY[0x1E0D18228];
    v12 = *MEMORY[0x1E0D18208];
    v13 = v7;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = &v12;
LABEL_7:
    v6 = 2;
    goto LABEL_8;
  }
  if (a3 != 1)
  {
    v8 = *MEMORY[0x1E0D18210];
    v10 = *MEMORY[0x1E0D18208];
    v11 = v8;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = &v10;
    goto LABEL_7;
  }
LABEL_4:
  v3 = *MEMORY[0x1E0D18228];
  v14 = *MEMORY[0x1E0D18208];
  v15 = v3;
  v16 = *MEMORY[0x1E0D18210];
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = &v14;
  v6 = 3;
LABEL_8:
  objc_msgSend(v4, "arrayWithObjects:count:", v5, v6, v10, v11, v12, v13, v14, v15, v16, v17);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (unint64_t)implicitGroupThresholdForSearchType:(unint64_t)a3
{
  if (a3 > 5)
    return 0;
  else
    return qword_1B999B840[a3];
}

@end
