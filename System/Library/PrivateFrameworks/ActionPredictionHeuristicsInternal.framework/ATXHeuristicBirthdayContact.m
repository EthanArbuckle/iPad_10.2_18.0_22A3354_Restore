@implementation ATXHeuristicBirthdayContact

- (id)permanentRefreshTriggers
{
  ATXInformationHeuristicRefreshNotitifcationTrigger *v2;
  ATXInformationHeuristicRefreshNotitifcationTrigger *v3;
  void *v4;
  void *v5;

  v2 = [ATXInformationHeuristicRefreshNotitifcationTrigger alloc];
  v3 = -[ATXInformationHeuristicRefreshNotitifcationTrigger initWithNotification:type:](v2, "initWithNotification:type:", *MEMORY[0x1E0CA9F88], 0);
  v4 = (void *)MEMORY[0x1CAA46CBC]();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v3, 0);
  objc_autoreleasePoolPop(v4);

  return v5;
}

- (id)heuristicResultWithEnvironment:(id)a3
{
  id v3;
  ATXBirthdaysDataSource *v4;
  void *v5;
  ATXBirthdaysDataSource *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  ATXContextHeuristicResult *v32;
  ATXBirthdaysDataSource *v34;
  void *v35;
  void *v36;
  id obj;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[6];
  _QWORD v52[5];
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  _BYTE v60[128];
  uint8_t v61[128];
  uint8_t buf[4];
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [ATXBirthdaysDataSource alloc];
  v35 = v3;
  objc_msgSend(v3, "heuristicDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXBirthdaysDataSource initWithDevice:](v4, "initWithDevice:", v5);

  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__3;
  v58 = __Block_byref_object_dispose__3;
  v59 = 0;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = __Block_byref_object_copy__3;
  v52[4] = __Block_byref_object_dispose__3;
  v53 = 0;
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __62__ATXHeuristicBirthdayContact_heuristicResultWithEnvironment___block_invoke;
  v51[3] = &unk_1E82C47B8;
  v51[4] = &v54;
  v51[5] = v52;
  -[ATXBirthdaysDataSource birthdaysWithCallback:](v6, "birthdaysWithCallback:", v51);
  __atxlog_handle_context_heuristic();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend((id)v55[5], "count");
    *(_DWORD *)buf = 134217984;
    v63 = v8;
    _os_log_impl(&dword_1C99DF000, v7, OS_LOG_TYPE_DEFAULT, "ATXHeuristicBirthdayContact: heuristicResultWithEnvironment %lu birthdays", buf, 0xCu);
  }
  v34 = v6;

  v36 = (void *)objc_opt_new();
  v40 = (void *)objc_opt_new();
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = (id)v55[5];
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
  if (v9)
  {
    v39 = *(_QWORD *)v48;
    do
    {
      v41 = v9;
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v48 != v39)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("birthdayContact"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("EKEvent"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("emailAddresses"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "obj");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v13, "obj");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("fullName"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "firstObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("identifier"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "startDate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "endDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXHeuristicBirthdayContact _spotlightActionWithName:email:identifier:startDate:endDate:subtitle:](self, "_spotlightActionWithName:email:identifier:startDate:endDate:subtitle:", v17, v18, v19, v20, v21, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
            objc_msgSend(v36, "addObject:", v22);

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("CONTEXT_TITLE_BIRTHDAYS"), &stru_1E82C5A18, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v36, "count") == 1)
  {
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("CONTEXT_TITLE_BIRTHDAY"), &stru_1E82C5A18, 0);
    v25 = objc_claimAutoreleasedReturnValue();

    v24 = (void *)v25;
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v26 = v36;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v44 != v28)
          objc_enumerationMutation(v26);
        +[ATXContextHeuristicSuggestionProducer suggestionWithSpotlightAction:predictionReasons:localizedReason:score:dateInterval:](ATXContextHeuristicSuggestionProducer, "suggestionWithSpotlightAction:predictionReasons:localizedReason:score:dateInterval:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j), 0x20000000, v24, 0, 40.0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addObject:", v30);

      }
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
    }
    while (v27);
  }

  v31 = (void *)objc_opt_new();
  v32 = -[ATXContextHeuristicResult initWithSuggestions:additionalRefreshTriggers:]([ATXContextHeuristicResult alloc], "initWithSuggestions:additionalRefreshTriggers:", v40, v31);

  _Block_object_dispose(v52, 8);
  _Block_object_dispose(&v54, 8);

  return v32;
}

void __62__ATXHeuristicBirthdayContact_heuristicResultWithEnvironment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)_spotlightActionWithName:(id)a3 email:(id)a4 identifier:(id)a5 startDate:(id)a6 endDate:(id)a7 subtitle:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  __atxlog_handle_context_heuristic();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138740995;
    v25 = v13;
    v26 = 2117;
    v27 = v14;
    v28 = 2112;
    v29 = v15;
    v30 = 2117;
    v31 = v16;
    v32 = 2117;
    v33 = v17;
    _os_log_impl(&dword_1C99DF000, v19, OS_LOG_TYPE_DEFAULT, "ATXHeuristicBirthdayContact: _spotlightActionWithName name %{sensitive}@, email %{sensitive}@, identifier %@, startDate %{sensitive}@, endDate %{sensitive}@", (uint8_t *)&v24, 0x34u);
  }

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8C28]), "initWithStartDate:endDate:lockScreenEligible:predicate:", v16, v17, 0, 0);
  if (!v13 || !v15)
  {
    if (v13 && v14)
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9108]), "initWithContactName:contactEmail:subtitle:criteria:", v13, v14, v18, v20);
      if (v21)
        goto LABEL_14;
      __atxlog_handle_context_heuristic();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_1C99DF000, v22, OS_LOG_TYPE_DEFAULT, "Updated api to create participant using email not available", (uint8_t *)&v24, 2u);
      }
    }
    else
    {
      __atxlog_handle_context_heuristic();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[ATXHeuristicBirthdayContact _spotlightActionWithName:email:identifier:startDate:endDate:subtitle:].cold.1(v22);
    }

    v21 = 0;
    goto LABEL_14;
  }
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9108]), "initWithContactName:contactIdentifier:subtitle:criteria:", v13, v15, v18, v20);
LABEL_14:

  return v21;
}

- (void)_spotlightActionWithName:(os_log_t)log email:identifier:startDate:endDate:subtitle:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C99DF000, log, OS_LOG_TYPE_ERROR, "participant not found", v1, 2u);
}

@end
