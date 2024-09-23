@implementation ATXUserAppPreferenceDataSource

- (ATXUserAppPreferenceDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXUserAppPreferenceDataSource *v6;
  ATXUserAppPreferenceDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXUserAppPreferenceDataSource;
  v6 = -[ATXUserAppPreferenceDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (BOOL)parametersExistInValidCombinationsForParameters:(id)a3 andValidCombinations:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v5);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v6, "allKeys", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "isEqualToSet:", v7) & 1) != 0)
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

- (BOOL)appSupportsParameterCombination:(id)a3 forIntent:(id)a4 forBundleId:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(MEMORY[0x1E0CF8CE8], "isSystemAppForBundleId:", v10))
  {
    objc_msgSend(v9, "_parameterCombinations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ATXUserAppPreferenceDataSource parametersExistInValidCombinationsForParameters:andValidCombinations:](self, "parametersExistInValidCombinationsForParameters:andValidCombinations:", v8, v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CF8CE8], "schemaWithoutFallbackForBundle:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v9, "_className");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_parameterCombinationsForClassName:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[ATXUserAppPreferenceDataSource parametersExistInValidCombinationsForParameters:andValidCombinations:](self, "parametersExistInValidCombinationsForParameters:andValidCombinations:", v8, v14);

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (void)preferredAppForIntentName:(id)a3 andParameterCombination:(id)a4 callback:(id)a5
{
  -[ATXUserAppPreferenceDataSource preferredAppForIntentName:andParameterCombination:skipAppSchemaCheck:callback:](self, "preferredAppForIntentName:andParameterCombination:skipAppSchemaCheck:callback:", a3, a4, 0, a5);
}

- (void)preferredAppForIntentName:(id)a3 andParameterCombination:(id)a4 skipAppSchemaCheck:(BOOL)a5 callback:(id)a6
{
  NSString *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  Class v15;
  void *v16;
  dispatch_semaphore_t v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _QWORD v40[4];
  NSObject *v41;
  id v42;
  ATXUserAppPreferenceDataSource *v43;
  id v44;
  id v45;
  _BYTE *v46;
  BOOL v47;
  _BYTE buf[24];
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v10 = (NSString *)a3;
  v11 = a4;
  v12 = a6;
  __atxlog_handle_heuristic();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_1C99DF000, v13, OS_LOG_TYPE_INFO, "Looking for preferred app to handle %@ with parameter combination %@", buf, 0x16u);
  }

  v14 = (void *)objc_opt_new();
  v15 = NSClassFromString(v10);
  if (v15 && (-[objc_class isSubclassOfClass:](v15, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    v16 = (void *)objc_opt_new();
    v17 = dispatch_semaphore_create(0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v49 = __Block_byref_object_copy_;
    v50 = __Block_byref_object_dispose_;
    v51 = 0;
    +[ATXIntentToAppBundleIdCache sharedInstance](ATXIntentToAppBundleIdCache, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __112__ATXUserAppPreferenceDataSource_preferredAppForIntentName_andParameterCombination_skipAppSchemaCheck_callback___block_invoke;
    v40[3] = &unk_1E82C4448;
    v46 = buf;
    v19 = v17;
    v41 = v19;
    v47 = a5;
    v20 = v14;
    v42 = v20;
    v43 = self;
    v44 = v11;
    v21 = v16;
    v45 = v21;
    objc_msgSend(v18, "fetchBundleIdsForIntent:completionHandler:", v21, v40);

    if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v19, 1.0) == 1
      || !objc_msgSend(v20, "count"))
    {
      (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    }
    else if (objc_msgSend(v20, "count") == 1)
    {
      objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, _QWORD))v12 + 2))(v12, v22, 0);

    }
    else
    {
      v34 = 0;
      v35 = &v34;
      v36 = 0x3032000000;
      v37 = __Block_byref_object_copy_;
      v38 = __Block_byref_object_dispose_;
      v39 = 0;
      BiomeLibrary();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "App");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "Intent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, 0, 0, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __112__ATXUserAppPreferenceDataSource_preferredAppForIntentName_andParameterCombination_skipAppSchemaCheck_callback___block_invoke_16;
      v31[3] = &unk_1E82C44B0;
      v26 = v20;
      v32 = v26;
      v33 = &v34;
      v27 = (id)objc_msgSend(v25, "sinkWithCompletion:shouldContinue:", &__block_literal_global, v31);

      v28 = (void *)v35[5];
      v29 = v28;
      if (!v28)
      {
        objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      (*((void (**)(id, void *, _QWORD))v12 + 2))(v12, v29, 0);
      if (!v28)

      _Block_object_dispose(&v34, 8);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);
  }

}

void __112__ATXUserAppPreferenceDataSource_preferredAppForIntentName_andParameterCombination_skipAppSchemaCheck_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int CanLearnFromApp;
  int v15;
  NSObject *v16;
  _BOOL4 v17;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a3);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    goto LABEL_22;
  }
  v19 = v6;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
  if (!v8)
    goto LABEL_20;
  v9 = v8;
  v10 = *(_QWORD *)v21;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v21 != v10)
        objc_enumerationMutation(v5);
      v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11);
      v26 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      CanLearnFromApp = ATXHeuristicCanLearnFromApp(v13);

      if (CanLearnFromApp)
      {
        if (*(_BYTE *)(a1 + 80))
          goto LABEL_13;
        v15 = objc_msgSend(*(id *)(a1 + 48), "appSupportsParameterCombination:forIntent:forBundleId:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v12);
        __atxlog_handle_heuristic();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
        if (v15)
        {
          if (v17)
          {
            *(_DWORD *)buf = 138412290;
            v25 = v12;
            _os_log_impl(&dword_1C99DF000, v16, OS_LOG_TYPE_INFO, "Bundle ID %@ supports intent, adding it to candidate for user app preference.", buf, 0xCu);
          }

LABEL_13:
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
          goto LABEL_14;
        }
        if (v17)
        {
          *(_DWORD *)buf = 138412290;
          v25 = v12;
          _os_log_impl(&dword_1C99DF000, v16, OS_LOG_TYPE_INFO, "Bundle ID %@ supports intent, but it does not support the specific parameter combination we want to predict.", buf, 0xCu);
        }

      }
LABEL_14:
      ++v11;
    }
    while (v9 != v11);
    v18 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    v9 = v18;
  }
  while (v18);
LABEL_20:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v7 = v19;
LABEL_22:

}

void __112__ATXUserAppPreferenceDataSource_preferredAppForIntentName_andParameterCombination_skipAppSchemaCheck_callback___block_invoke_14(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_heuristic();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __112__ATXUserAppPreferenceDataSource_preferredAppForIntentName_andParameterCombination_skipAppSchemaCheck_callback___block_invoke_14_cold_1(v2, v4);

  }
}

uint64_t __112__ATXUserAppPreferenceDataSource_preferredAppForIntentName_andParameterCombination_skipAppSchemaCheck_callback___block_invoke_16(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
    v5 = 0;
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

void __112__ATXUserAppPreferenceDataSource_preferredAppForIntentName_andParameterCombination_skipAppSchemaCheck_callback___block_invoke_14_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1C99DF000, a2, OS_LOG_TYPE_ERROR, "Could not scan intent stream to determine most recently donated intent: %@", (uint8_t *)&v4, 0xCu);

}

@end
