@implementation FAFamilyPeopleSuggesterSuggester

- (int64_t)proactiveModel
{
  return 2;
}

- (id)getFamilyRecommendationsWithContext:(id *)a3 error:(id *)a4
{
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  FARecommendedFamilyMember *v26;
  unint64_t Nanoseconds;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  unint64_t v33;
  uint64_t v34;
  os_signpost_id_t v35;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  _FASignpostLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = _FASignpostCreate(v4);
  v34 = v6;

  _FASignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v33 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAEBA000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PeopleSuggesterFetchRecommendation", ", buf, 2u);
  }

  _FASignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[FAFamilyPeopleSuggesterSuggester getFamilyRecommendationsWithContext:error:].cold.2(v5, v9);

  _FALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAEBA000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to get Family suggestions from PeopleSuggester", buf, 2u);
  }
  v35 = v5;

  objc_msgSend(MEMORY[0x1E0D709A8], "suggesterWithDaemon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0D70998]);
  +[FAPeopleDiscoveryService sharedInstance](FAPeopleDiscoveryService, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "getNearbyPeople");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setSeedContactIdentifiers:", v15);
  objc_msgSend(v11, "familyRecommendationSuggestionsWithPredictionContext:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _FALogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v16;
    _os_log_impl(&dword_1CAEBA000, v17, OS_LOG_TYPE_DEFAULT, "Loaded family PeopleSuggester suggestions. %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v19 = v16;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v39 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "recipients", v33, v34);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "firstObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          v26 = -[FARecommendedFamilyMember initWithPeopleSuggesterRecommendation:]([FARecommendedFamilyMember alloc], "initWithPeopleSuggesterRecommendation:", v25);
          objc_msgSend(v18, "addObject:", v26);

        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v21);
  }

  Nanoseconds = _FASignpostGetNanoseconds(v35, v34);
  _FASignpostLogSystem();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v33 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAEBA000, v29, OS_SIGNPOST_INTERVAL_END, v35, "PeopleSuggesterFetchRecommendation", ", buf, 2u);
  }

  _FASignpostLogSystem();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    -[FAFamilyPeopleSuggesterSuggester getFamilyRecommendationsWithContext:error:].cold.1(v35, v30, (double)Nanoseconds / 1000000000.0);

  if (a3)
    *a3 = -[FAFamilySuggesterFeedbackContext initWithPredictionContext:suggestions:]([FAFamilySuggesterFeedbackContext alloc], "initWithPredictionContext:suggestions:", v12, v19);
  if (a4)
    *a4 = 0;
  v31 = (void *)objc_msgSend(v18, "copy", v33);

  return v31;
}

- (void)getFamilyRecommendationsWithContext:(double)a3 error:.cold.1(uint64_t a1, NSObject *a2, double a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a3;
  _os_log_debug_impl(&dword_1CAEBA000, a2, OS_LOG_TYPE_DEBUG, "END [%lld] %fs:PeopleSuggesterFetchRecommendation ", (uint8_t *)&v3, 0x16u);
}

- (void)getFamilyRecommendationsWithContext:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_1CAEBA000, a2, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: PeopleSuggesterFetchRecommendation ", (uint8_t *)&v2, 0xCu);
}

@end
