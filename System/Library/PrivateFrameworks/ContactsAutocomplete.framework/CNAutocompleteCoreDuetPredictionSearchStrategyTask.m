@implementation CNAutocompleteCoreDuetPredictionSearchStrategyTask

id __69___CNAutocompleteCoreDuetPredictionSearchStrategyTask_convertResults__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  NSObject *v29;
  id v30;
  _QWORD aBlock[4];
  NSObject *v32;
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  NSObject *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "length"))
  {
    CNALoggingContextDebug();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "Predictions: Invalid result: no display name";
      goto LABEL_12;
    }
LABEL_13:
    v14 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v3, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        objc_msgSend(v3, "identifier"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "length"),
        v8,
        v7,
        !v9))
  {
    CNALoggingContextDebug();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "Predictions: Invalid result: no identifier";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v3, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v10, "containsObject:", v11);

  if ((_DWORD)v10)
  {
    CNALoggingContextDebug();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "Predictions: Identifier already in use";
LABEL_12:
      _os_log_impl(&dword_1B9950000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  v16 = *(id *)(*(_QWORD *)(a1 + 40) + 32);
  v17 = *MEMORY[0x1E0D13848];
  objc_msgSend(v3, "personId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = (*(uint64_t (**)(uint64_t, void *))(v17 + 16))(v17, v18);

  v19 = MEMORY[0x1E0C809B0];
  if ((v17 & 1) != 0)
    goto LABEL_16;
  v21 = objc_msgSend(v3, "personIdType");
  if (v21 == 1)
  {
    v28[0] = v19;
    v28[1] = 3221225472;
    v28[2] = __69___CNAutocompleteCoreDuetPredictionSearchStrategyTask_convertResults__block_invoke_77;
    v28[3] = &unk_1E70DFD80;
    v29 = v3;
    v30 = v16;
    v20 = _Block_copy(v28);

    v12 = 0;
    v22 = v29;
LABEL_25:

    goto LABEL_26;
  }
  if (v21 != 2)
  {
    if (v21 == 3)
    {
      objc_msgSend(v3, "personId");
      v12 = objc_claimAutoreleasedReturnValue();
      aBlock[0] = v19;
      aBlock[1] = 3221225472;
      aBlock[2] = __69___CNAutocompleteCoreDuetPredictionSearchStrategyTask_convertResults__block_invoke_75;
      aBlock[3] = &unk_1E70DFD80;
      v32 = v16;
      v33 = v3;
      v20 = _Block_copy(aBlock);

      v22 = v32;
    }
    else
    {
      CNALoggingContextDebug();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v35 = objc_msgSend(v3, "personIdType");
        _os_log_impl(&dword_1B9950000, v22, OS_LOG_TYPE_DEFAULT, "No identifier for personIdType: %lu", buf, 0xCu);
      }
      v12 = 0;
      v20 = 0;
    }
    goto LABEL_25;
  }
LABEL_16:
  v12 = 0;
  v20 = 0;
LABEL_26:
  objc_msgSend(*(id *)(a1 + 40), "resultValueForCDContact:", v3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "duetResultWithDisplayName:value:contactIdentifier:", v5, v23, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CNALoggingContextDebug();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v35 = (uint64_t)v14;
    v36 = 2112;
    v37 = v5;
    v38 = 2112;
    v39 = v12;
    _os_log_impl(&dword_1B9950000, v24, OS_LOG_TYPE_DEFAULT, "Created result: %@ for displayName:%@, identifier:%@", buf, 0x20u);
  }

  objc_msgSend(v14, "setContactProvider:", v20);
  v26[0] = v19;
  v26[1] = 3221225472;
  v26[2] = __69___CNAutocompleteCoreDuetPredictionSearchStrategyTask_convertResults__block_invoke_79;
  v26[3] = &unk_1E70DF920;
  v27 = v23;
  v25 = v23;
  objc_msgSend(v14, "addDiagnosticLog:", v26);

LABEL_14:
  return v14;
}

id __69___CNAutocompleteCoreDuetPredictionSearchStrategyTask_convertResults__block_invoke_75(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "personId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v4, "unifiedContactWithIdentifier:keysToFetch:error:", v7, v6, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v12;
  CNALoggingContextDebug();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_1B9950000, v10, OS_LOG_TYPE_DEFAULT, "Did fetch full contact: %@, err: %@", buf, 0x16u);
  }

  if (a3)
    *a3 = objc_retainAutorelease(v9);

  return v8;
}

id __69___CNAutocompleteCoreDuetPredictionSearchStrategyTask_convertResults__block_invoke_77(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "personId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  objc_msgSend(MEMORY[0x1E0C97200], "predicateForLegacyIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CNALoggingContextDebug();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v9;
    _os_log_impl(&dword_1B9950000, v10, OS_LOG_TYPE_DEFAULT, "Fetching full contact from AB legacy ID with predicate %@", buf, 0xCu);
  }

  v11 = *(void **)(a1 + 40);
  v19 = 0;
  objc_msgSend(v11, "unifiedContactsMatchingPredicate:keysToFetch:error:", v9, v6, &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v19;
  if (v12)
  {
    if (objc_msgSend(v12, "count") != 1)
    {
      CNALoggingContextDebug();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B9950000, v14, OS_LOG_TYPE_DEFAULT, "Expecting one contact, will take the last one", buf, 2u);
      }

    }
    CNALoggingContextDebug();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v12;
      _os_log_impl(&dword_1B9950000, v15, OS_LOG_TYPE_DEFAULT, "Got contacts: %@", buf, 0xCu);
    }

    objc_msgSend(v12, "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CNALoggingContextDebug();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v13;
      _os_log_impl(&dword_1B9950000, v17, OS_LOG_TYPE_DEFAULT, "Error fetching: %@", buf, 0xCu);
    }

    v16 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v13);
  }

  return v16;
}

id __69___CNAutocompleteCoreDuetPredictionSearchStrategyTask_convertResults__block_invoke_79(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", CFSTR("=== Important Instructions for Collecting Duet Logs ===\n"));
  objc_msgSend(v2, "appendString:", CFSTR("This result includes predictive information contributed by CoreDuet. To collect information on why this result was predicted:\n\n"));
  objc_msgSend(v2, "appendString:", CFSTR("1. Run the following command on the machine that has the issue:\n\n"));
  objc_msgSend(*(id *)(a1 + 32), "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("cdinteracttool query -predicate \"sender.identifier == '%@' OR (ANY recipients.identifier == '%@')\"\n\n"), v3, v4);

  objc_msgSend(v2, "appendString:", CFSTR("2. Review the output of this command, checking for any privacy concerns.\n\n"));
  objc_msgSend(v2, "appendString:", CFSTR("3. If there are no privacy concerns with the output, attach it to a radar filed against CoreDuet | PeopleSuggester (rdar://new/problem/component=CoreDuet&version=PeopleSuggester).\n"));
  objc_msgSend(v2, "appendString:", CFSTR("=======================================================\n"));
  return v2;
}

@end
