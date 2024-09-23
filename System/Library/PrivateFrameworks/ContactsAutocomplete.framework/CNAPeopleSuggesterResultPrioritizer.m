@implementation CNAPeopleSuggesterResultPrioritizer

void __46___CNAPeopleSuggesterResultPrioritizer_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.autocomplete", "ranking");
  v1 = (void *)os_log_cn_once_object_1;
  os_log_cn_once_object_1 = (uint64_t)v0;

}

id __115___CNAPeopleSuggesterResultPrioritizer_applyPriorityOrderToResults_fetchRequest_andCompletePriorityResultsPromise___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __115___CNAPeopleSuggesterResultPrioritizer_applyPriorityOrderToResults_fetchRequest_andCompletePriorityResultsPromise___block_invoke_12(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(get_PSSuggesterClass_1());
  v3 = objc_alloc_init(get_PSPredictionContextClass());
  objc_msgSend(v3, "setBundleID:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setAccountIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setSearchPrefix:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "os_log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = 138477827;
    v11 = v4;
    _os_log_impl(&dword_1B9950000, v5, OS_LOG_TYPE_INFO, "Suggestion ranking input: %{private}@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 56), "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rankedAutocompleteSuggestionsFromContext:candidates:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "os_log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 138477827;
    v11 = v7;
    _os_log_impl(&dword_1B9950000, v8, OS_LOG_TYPE_INFO, "Suggestion ranking output: %{private}@", (uint8_t *)&v10, 0xCu);
  }

  return v7;
}

uint64_t __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  uint64_t v23;
  NSObject *v24;
  _QWORD v25[4];
  NSObject *v26;
  _QWORD v27[4];
  NSObject *v28;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "resultIdentifierIsValidMessagesChatGuid:", v3))
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_cold_1();
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = *(void **)(a1 + 40);
      v9 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_18;
      v27[3] = &unk_1E70DEEB8;
      v10 = v3;
      v28 = v10;
      if (objc_msgSend(v8, "_cn_any:", v27))
      {
        objc_msgSend((id)objc_opt_class(), "os_log");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_cold_3();
        v5 = 1;
      }
      else
      {
        v12 = *(void **)(a1 + 40);
        v25[0] = v9;
        v25[1] = 3221225472;
        v25[2] = __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_20;
        v25[3] = &unk_1E70DEEB8;
        v13 = v10;
        v26 = v13;
        if (objc_msgSend(v12, "_cn_any:", v25))
        {
          objc_msgSend((id)objc_opt_class(), "os_log");
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_cold_4();

          v5 = 1;
        }
        else
        {
          v19 = v9;
          v20 = 3221225472;
          v21 = __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_21;
          v22 = &unk_1E70DFCC8;
          v15 = *(void **)(a1 + 40);
          v23 = *(_QWORD *)(a1 + 32);
          v24 = v13;
          v5 = objc_msgSend(v15, "_cn_any:", &v19);
          objc_msgSend((id)objc_opt_class(), "os_log", v19, v20, v21, v22, v23);
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
          if ((_DWORD)v5)
          {
            if (v17)
              __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_cold_5();
          }
          else if (v17)
          {
            __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_cold_6();
          }

        }
        v11 = v26;
      }

      v4 = v28;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "os_log");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_cold_2();
      v5 = 0;
    }
  }

  return v5;
}

uint64_t __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_18(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_cn_hasPrefix:", v3);

  return v5;
}

uint64_t __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_20(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_cn_hasPrefix:", v3);

  return v6;
}

uint64_t __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_21(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "nameComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "resultMatchesPrefix:inNameComponentsOfResult:", v4, v5);

  return v6;
}

uint64_t __63___CNAPeopleSuggesterResultPrioritizer_partitionStewieResults___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __72___CNAPeopleSuggesterResultPrioritizer_bundleIdentifierOfCurrentProcess__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "makeBundleIdentifierOfCurrentProcess");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)bundleIdentifierOfCurrentProcess_cn_once_object_20;
  bundleIdentifierOfCurrentProcess_cn_once_object_20 = v1;

}

void __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1B9950000, v0, v1, "Result will be ranked (group chat): %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1B9950000, v0, v1, "Result will NOT be ranked (no address): %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1B9950000, v0, v1, "Result will be ranked (display name prefix match): %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1B9950000, v0, v1, "Result will be ranked (address prefix match): %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1B9950000, v0, v1, "Result will be ranked (inner prefix match): %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __84___CNAPeopleSuggesterResultPrioritizer_partitionCandidatesForRanking_givenPrefixes___block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1B9950000, v0, v1, "Result will NOT be ranked (default): %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
