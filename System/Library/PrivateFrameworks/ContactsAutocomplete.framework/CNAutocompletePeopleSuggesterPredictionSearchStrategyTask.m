@implementation CNAutocompletePeopleSuggesterPredictionSearchStrategyTask

NSObject *__76___CNAutocompletePeopleSuggesterPredictionSearchStrategyTask_convertResults__block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  CNAutocompleteResultValue *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  NSObject *v34;
  CNAutocompleteResultValue *v35;
  CNAutocompleteResultValue *v36;
  NSObject *v37;
  _QWORD aBlock[4];
  NSObject *v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  CNAutocompleteResultValue *v43;
  char v44;
  _QWORD v45[4];
  id v46;
  id v47;
  uint8_t buf[4];
  NSObject *v49;
  __int16 v50;
  NSObject *v51;
  __int16 v52;
  NSObject *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  -[NSObject recipients](v3, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 == 1)
  {
    -[NSObject recipients](v3, "recipients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v6 = objc_claimAutoreleasedReturnValue();

    -[NSObject displayName](v6, "displayName");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8 || !-[NSObject length](v8, "length"))
    {
      CNALoggingContextDebug();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v3;
        _os_log_impl(&dword_1B9950000, v11, OS_LOG_TYPE_DEFAULT, "Predictions: Invalid result: no display name for %@", buf, 0xCu);
      }
      v18 = 0;
      goto LABEL_31;
    }
    -[NSObject handle](v6, "handle");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && -[NSObject length](v10, "length"))
    {
      v12 = objc_msgSend((id)objc_opt_class(), "_addressTypeFromHandle:", v11);
      if (v12)
      {
        v13 = v12;
        if (!objc_msgSend(*(id *)(a1 + 40), "containsObject:", v11))
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
          v27 = objc_alloc_init(CNAutocompleteResultValue);
          -[CNAutocompleteResultValue setAddress:](v27, "setAddress:", v11);
          -[CNAutocompleteResultValue setAddressType:](v27, "setAddressType:", v13);
          objc_msgSend(*(id *)(a1 + 48), "duetResultWithDisplayName:value:contactIdentifier:", v9, v27, 0);
          v28 = objc_claimAutoreleasedReturnValue();
          -[NSObject setPsSuggestion:](v28, "setPsSuggestion:", v3);
          -[NSObject contact](v6, "contact");
          v29 = objc_claimAutoreleasedReturnValue();
          v14 = v29;
          if (v29)
          {
            -[NSObject identifier](v29, "identifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v28;
            v31 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
            v45[0] = MEMORY[0x1E0C809B0];
            v45[1] = 3221225472;
            v45[2] = __76___CNAutocompletePeopleSuggesterPredictionSearchStrategyTask_convertResults__block_invoke_69;
            v45[3] = &unk_1E70DFD80;
            v46 = v31;
            v47 = v30;
            v32 = v30;
            v33 = v31;
            -[NSObject setContactProvider:](v37, "setContactProvider:", v45);

            v28 = v37;
          }
          CNALoggingContextDebug();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v49 = v9;
            v50 = 2112;
            v51 = v11;
            v52 = 2112;
            v53 = v28;
            _os_log_impl(&dword_1B9950000, v34, OS_LOG_TYPE_DEFAULT, "Predictions: %@ <%@>: %@", buf, 0x20u);
          }

          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __76___CNAutocompletePeopleSuggesterPredictionSearchStrategyTask_convertResults__block_invoke_71;
          v41[3] = &unk_1E70DFF08;
          v44 = *(_BYTE *)(a1 + 64);
          v42 = *(id *)(a1 + 56);
          v43 = v27;
          v35 = v27;
          -[NSObject addDiagnosticLog:](v28, "addDiagnosticLog:", v41);
          v36 = v43;
          v18 = v28;

          goto LABEL_30;
        }
        CNALoggingContextDebug();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v49 = v11;
          v50 = 2112;
          v51 = v3;
          v15 = "Predictions: Duplicate identifier %@. Skipping %@.";
          v16 = v14;
          v17 = 22;
LABEL_28:
          _os_log_impl(&dword_1B9950000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
        }
LABEL_29:
        v18 = 0;
LABEL_30:

LABEL_31:
LABEL_32:

        goto LABEL_33;
      }
      CNALoggingContextDebug();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_29;
      *(_DWORD *)buf = 138412290;
      v49 = v3;
      v15 = "Predictions: Invalid result: no handle type for %@";
    }
    else
    {
      CNALoggingContextDebug();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_29;
      *(_DWORD *)buf = 138412290;
      v49 = v3;
      v15 = "Predictions: Invalid result: no handle for %@";
    }
    v16 = v14;
    v17 = 12;
    goto LABEL_28;
  }
  if (!v5)
  {
    CNALoggingContextDebug();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B9950000, v6, OS_LOG_TYPE_DEFAULT, "Predictions: No recipient included in returned _PSSuggestion", buf, 2u);
    }
    goto LABEL_24;
  }
  objc_msgSend((id)objc_opt_class(), "_identifierForGroupResultSuggestion:", v3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v6))
  {
    CNALoggingContextDebug();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v49 = v6;
      v50 = 2112;
      v51 = v3;
      _os_log_impl(&dword_1B9950000, v9, OS_LOG_TYPE_DEFAULT, "Predictions: Duplicate group identifier %@. Skipping %@.", buf, 0x16u);
    }
    v18 = 0;
    goto LABEL_32;
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "shouldIncludeGroupResults"))
  {
    v19 = objc_opt_class();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __76___CNAutocompletePeopleSuggesterPredictionSearchStrategyTask_convertResults__block_invoke_90;
    aBlock[3] = &unk_1E70DFF30;
    v20 = v3;
    v39 = v20;
    v40 = v19;
    v21 = _Block_copy(aBlock);
    v22 = *(void **)(a1 + 48);
    -[NSObject groupName](v20, "groupName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "duetResultWithDisplayName:value:contactIdentifier:", v23, 0, 0);
    v18 = objc_claimAutoreleasedReturnValue();

    -[NSObject setResultType:](v18, "setResultType:", 1);
    -[NSObject setIdentifier:](v18, "setIdentifier:", v6);
    -[NSObject setMembersProvider:](v18, "setMembersProvider:", v21);
    -[NSObject setPsSuggestion:](v18, "setPsSuggestion:", v20);
    CNALoggingContextDebug();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject groupName](v20, "groupName");
      v25 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v49 = v18;
      v50 = 2112;
      v51 = v25;
      v52 = 2112;
      v53 = v6;
      _os_log_impl(&dword_1B9950000, v24, OS_LOG_TYPE_DEFAULT, "Predictions: %@ for displayName:%@ and identifier %@", buf, 0x20u);

    }
    v9 = v39;
    goto LABEL_32;
  }
LABEL_24:
  v18 = 0;
LABEL_33:

  return v18;
}

uint64_t __76___CNAutocompletePeopleSuggesterPredictionSearchStrategyTask_convertResults__block_invoke_69(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "unifiedContactWithIdentifier:keysToFetch:error:", *(_QWORD *)(a1 + 40), a2, a3);
}

id __76___CNAutocompletePeopleSuggesterPredictionSearchStrategyTask_convertResults__block_invoke_71(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", CFSTR("=== Important Instructions for Collecting Duet Logs ===\n"));
  objc_msgSend(v2, "appendString:", CFSTR("This result includes predictive information contributed by CoreDuet. To collect information on why this result was predicted:\n\n"));
  objc_msgSend(v2, "appendString:", CFSTR("1. Run the following command on the machine that has the issue:\n\n"));
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v2, "appendFormat:", CFSTR("pstool zkw_suggestion -b %@\n\n"), *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "address");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "address");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendFormat:", CFSTR("cdinteracttool query -predicate \"sender.identifier == '%@' OR (ANY recipients.identifier == '%@')\"\n\n"), v3, v4);

  }
  objc_msgSend(v2, "appendString:", CFSTR("2. Review the output of this command, checking for any privacy concerns.\n\n"));
  objc_msgSend(v2, "appendString:", CFSTR("3. If there are no privacy concerns with the output, attach it to a radar filed against CoreDuet | PeopleSuggester (rdar://new/problem/component=CoreDuet&version=PeopleSuggester).\n"));
  objc_msgSend(v2, "appendString:", CFSTR("=======================================================\n"));
  return v2;
}

id __76___CNAutocompletePeopleSuggesterPredictionSearchStrategyTask_convertResults__block_invoke_90(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v8, "displayName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(a1 + 40);
        objc_msgSend(v8, "handle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "_addressTypeFromHandle:", v11);

        if (v12)
        {
          objc_msgSend(v8, "handle");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[CNAutocompleteResult messagesResultWithAddress:displayName:nameComponents:resultType:addressType:identifier:contactProvider:groupMembersProvider:userInfo:](CNAutocompleteResult, "messagesResultWithAddress:displayName:nameComponents:resultType:addressType:identifier:contactProvider:groupMembersProvider:userInfo:", v13, v9, 0, 0, v12, 0, 0, 0, 0);
          v14 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v2, "addObject:", v14);
        }
        else
        {
          CNALoggingContextDebug();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v8, "handle");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v22 = v15;
            _os_log_impl(&dword_1B9950000, v14, OS_LOG_TYPE_DEFAULT, "Predictions: Unknown addressType for groupMember handle: %@", buf, 0xCu);

          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v5);
  }

  return v2;
}

uint64_t __133___CNAutocompletePeopleSuggesterPredictionSearchStrategyTask__fallbackIdentifierByAssemblingDistinctValuesFromGroupResultSuggestion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handle");
}

@end
