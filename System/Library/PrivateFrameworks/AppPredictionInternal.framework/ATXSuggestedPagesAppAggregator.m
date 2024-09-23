@implementation ATXSuggestedPagesAppAggregator

- (ATXSuggestedPagesAppAggregator)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ATXSuggestedPagesAppAggregator *v11;
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v13[0] = v3;
  v13[1] = v4;
  v13[2] = v5;
  v13[3] = v6;
  v13[4] = v7;
  v13[5] = v8;
  v13[6] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ATXSuggestedPagesAppAggregator initWithSources:](self, "initWithSources:", v10);

  return v11;
}

- (ATXSuggestedPagesAppAggregator)initWithSources:(id)a3
{
  id v4;
  ATXSuggestedPagesAppAggregator *v5;
  uint64_t v6;
  NSArray *sources;
  uint64_t v8;
  ATXSuggestedPagesTunableConstants *suggestedPagesTunableConstants;
  ATXSuggestedPagesAppAggregator *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ATXSuggestedPagesAppAggregator;
  v5 = -[ATXSuggestedPagesAppAggregator init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    sources = v5->_sources;
    v5->_sources = (NSArray *)v6;

    v8 = objc_opt_new();
    suggestedPagesTunableConstants = v5->_suggestedPagesTunableConstants;
    v5->_suggestedPagesTunableConstants = (ATXSuggestedPagesTunableConstants *)v8;

    v10 = v5;
  }

  return v5;
}

- (id)provideAppsForSuggestedPageType:(int64_t)a3 candidateApps:(id)a4 environment:(id)a5
{
  id v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  ATXSuggestedPagesAppAggregator *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  ATXSuggestedPagesAppAggregator *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v33 = a4;
  v8 = a5;
  v9 = (void *)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v32 = self;
  v10 = self->_sources;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v39;
    v14 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v39 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "provideAppsForSuggestedPageType:environment:", a3, v8, v32);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v16)
          v18 = (void *)v16;
        else
          v18 = v14;
        v19 = v18;

        objc_msgSend(v9, "addObjectsFromArray:", v19);
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v33, "count"))
  {
    objc_msgSend(v9, "intersectSet:", v33);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v20 = v33;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v35 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "setPredictionSource:", CFSTR("User"), v32);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v22);
    }

    objc_msgSend(v9, "unionSet:", v20);
  }
  v25 = v32;
  -[ATXSuggestedPagesAppAggregator _validateApps:pageType:](v32, "_validateApps:pageType:", v9, a3, v32);
  objc_msgSend(v8, "appLaunchCounts");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSuggestedPagesAppAggregator _validateApps:withAppLaunchCounts:](v25, "_validateApps:withAppLaunchCounts:", v9, v26);

  objc_msgSend(v9, "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSuggestedPagesAppAggregator _sortedAppsOnFirstHomeScreenPage](v25, "_sortedAppsOnFirstHomeScreenPage");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appLaunchCounts");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSuggestedPagesAppAggregator _sortedApps:sortedFirstPageApps:appLaunchCounts:](v25, "_sortedApps:sortedFirstPageApps:appLaunchCounts:", v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (void)_validateApps:(id)a3 pageType:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  -[ATXSuggestedPagesAppAggregator _dockedApps](self, "_dockedApps");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXSuggestedPagesUtils semanticTypeForSuggestedPageType:](ATXSuggestedPagesUtils, "semanticTypeForSuggestedPageType:", a4);
  v8 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v8;
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(MEMORY[0x1E0CF8D60], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "iOSAppDenyListForMode:", objc_msgSend(v9, "integerValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v11);
    else
      v38 = 0;

  }
  else
  {
    v38 = 0;
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v41;
    v37 = (const __CFString *)*MEMORY[0x1E0C9B260];
    v36 = (const __CFString *)*MEMORY[0x1E0C9B230];
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v41 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x1E0CF8CE8];
        objc_msgSend(v17, "bundleId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v18) = objc_msgSend(v18, "isInstalledAndNotRestrictedForBundle:", v19);

        if ((v18 & 1) == 0)
        {
          __atxlog_handle_modes();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v17;
            v23 = v22;
            v24 = "ATXSuggestedPagesAppAggregator: app (%@) is not installed or restricted";
            goto LABEL_18;
          }
          goto LABEL_19;
        }
        v20 = (void *)MEMORY[0x1E0CF8CE8];
        objc_msgSend(v17, "bundleId");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v20) = objc_msgSend(v20, "isHiddenFromSpringBoardWithBundleId:", v21);

        if ((_DWORD)v20)
        {
          __atxlog_handle_modes();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v17;
            v23 = v22;
            v24 = "ATXSuggestedPagesAppAggregator: app (%@) is hidden from SpringBoard";
            goto LABEL_18;
          }
          goto LABEL_19;
        }
        objc_msgSend(v17, "bundleId");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v39, "containsObject:", v25);

        if (v26)
        {
          __atxlog_handle_modes();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v17;
            v23 = v22;
            v24 = "ATXSuggestedPagesAppAggregator: app (%@) is already in the Dock";
            goto LABEL_18;
          }
          goto LABEL_19;
        }
        objc_msgSend(v17, "bundleId");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v38, "containsObject:", v27);

        if (v28)
        {
          __atxlog_handle_modes();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v17;
            v23 = v22;
            v24 = "ATXSuggestedPagesAppAggregator: app (%@) is on silence list in Focus settings";
            goto LABEL_18;
          }
          goto LABEL_19;
        }
        objc_msgSend(v17, "bundleId");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)CFPreferencesCopyValue(CFSTR("SBSearchSuggestAppDisabled"), CFSTR("com.apple.spotlightui"), v37, v36);
        v31 = objc_msgSend(v30, "containsObject:", v29);

        if (v31)
        {
          __atxlog_handle_modes();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v17;
            v23 = v22;
            v24 = "ATXSuggestedPagesAppAggregator: app (%@) is turned off in Siri settings";
            goto LABEL_18;
          }
          goto LABEL_19;
        }
        v32 = (void *)MEMORY[0x1E0CF8CE8];
        objc_msgSend(v17, "bundleId");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v32) = objc_msgSend(v32, "isInternalAppForBundleId:", v33);

        if ((_DWORD)v32)
        {
          __atxlog_handle_modes();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v17;
            v23 = v22;
            v24 = "ATXSuggestedPagesAppAggregator: app (%@) is an internal app";
LABEL_18:
            _os_log_impl(&dword_1C9A3B000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);
          }
LABEL_19:

          objc_msgSend(v7, "addObject:", v17);
        }
        ++v16;
      }
      while (v14 != v16);
      v34 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      v14 = v34;
    }
    while (v34);
  }

  if (objc_msgSend(v7, "count"))
    objc_msgSend(v12, "minusSet:", v7);

}

- (void)_validateApps:(id)a3 withAppLaunchCounts:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  __int128 v26;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];
  const __CFString *v36;
  _QWORD v37[3];

  v37[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v27 = (void *)objc_opt_new();
  v36 = CFSTR("com.apple.Preferences");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8C88]), "initWithRawLaunchCount:uniqueDaysLaunched:", 15, 10);
  v37[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v30;
    *(_QWORD *)&v11 = 138412290;
    v26 = v11;
    obj = v9;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v15, "bundleId", v26);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
          v19 = v17;
        else
          v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8C88]), "initWithRawLaunchCount:uniqueDaysLaunched:", 0, 0);
        v20 = v19;

        objc_msgSend(v6, "objectForKeyedSubscript:", v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
          v23 = v21;
        else
          v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8C88]), "initWithRawLaunchCount:uniqueDaysLaunched:", 0, 0);
        v24 = v23;

        if ((objc_msgSend(v24, "isGreaterThanOrEqualToData:", v20) & 1) == 0)
        {
          __atxlog_handle_modes();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v26;
            v34 = v15;
            _os_log_impl(&dword_1C9A3B000, v25, OS_LOG_TYPE_DEFAULT, "ATXSuggestedPagesAppAggregator: app (%@) does not meet launch count threshold", buf, 0xCu);
          }

          objc_msgSend(v27, "addObject:", v15);
        }

      }
      v9 = obj;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v27, "count"))
    objc_msgSend(v9, "minusSet:", v27);

}

- (id)_dockedApps
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;

  v2 = (void *)MEMORY[0x1CAA48B6C](self, a2);
  v3 = objc_alloc_init(MEMORY[0x1E0CF8E58]);
  v14 = 0;
  objc_msgSend(v3, "loadDockAppListWithError:", &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;
  if (v5)
  {
    __atxlog_handle_modes();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ATXSuggestedPagesAppAggregator _dockedApps].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  objc_autoreleasePoolPop(v2);
  return v4;
}

- (id)_sortedAppsOnFirstHomeScreenPage
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  NSObject *v18;
  id v19;

  v2 = (void *)MEMORY[0x1CAA48B6C](self, a2);
  v3 = objc_alloc_init(MEMORY[0x1E0CF8E58]);
  v19 = 0;
  objc_msgSend(v3, "loadHomeScreenPageConfigurationsWithError:", &v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v19;
  if (v5)
  {
    __atxlog_handle_modes();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ATXSuggestedPagesAppAggregator _sortedAppsOnFirstHomeScreenPage].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    v13 = MEMORY[0x1E0C9AA60];
  }
  else
  {
    v14 = (void *)objc_opt_new();
    objc_msgSend(v4, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __66__ATXSuggestedPagesAppAggregator__sortedAppsOnFirstHomeScreenPage__block_invoke;
    v17[3] = &unk_1E82DC0C8;
    v13 = v14;
    v18 = v13;
    objc_msgSend(v15, "enumerateAppsConsideringFolders:block:", 0, v17);

    v6 = v18;
  }

  objc_autoreleasePoolPop(v2);
  return v13;
}

void __66__ATXSuggestedPagesAppAggregator__sortedAppsOnFirstHomeScreenPage__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "bundleId");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)_sortedApps:(id)a3 sortedFirstPageApps:(id)a4 appLaunchCounts:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  ATXSuggestedPagesAppAggregator *v22;
  id v23;
  _QWORD v24[5];
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "_pas_filteredArrayWithTest:", &__block_literal_global_19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (objc_msgSend(v9, "count")
    && (v13 = (double)v12 / (double)(unint64_t)objc_msgSend(v9, "count"),
        -[ATXSuggestedPagesTunableConstants maxRatioOfAppleAppsForFirstPageSorting](self->_suggestedPagesTunableConstants, "maxRatioOfAppleAppsForFirstPageSorting"), v13 <= v14))
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __82__ATXSuggestedPagesAppAggregator__sortedApps_sortedFirstPageApps_appLaunchCounts___block_invoke_3;
    v20[3] = &unk_1E82DC158;
    v21 = v9;
    v22 = self;
    v23 = v10;
    v18 = v10;
    objc_msgSend(v8, "sortedArrayUsingComparator:", v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v21;
  }
  else
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __82__ATXSuggestedPagesAppAggregator__sortedApps_sortedFirstPageApps_appLaunchCounts___block_invoke_2;
    v24[3] = &unk_1E82DC130;
    v24[4] = self;
    v25 = v10;
    v15 = v10;
    objc_msgSend(v8, "sortedArrayUsingComparator:", v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v25;
  }

  return v16;
}

BOOL __82__ATXSuggestedPagesAppAggregator__sortedApps_sortedFirstPageApps_appLaunchCounts___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "rangeOfString:options:", CFSTR("com.apple."), 9) != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __82__ATXSuggestedPagesAppAggregator__sortedApps_sortedFirstPageApps_appLaunchCounts___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sortApp1:app2:appLaunchCounts:", a2, a3, *(_QWORD *)(a1 + 40));
}

uint64_t __82__ATXSuggestedPagesAppAggregator__sortedApps_sortedFirstPageApps_appLaunchCounts___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "bundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "indexOfObject:", v8);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v6, "bundleId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "indexOfObject:", v11);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL || v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = v9 == 0x7FFFFFFFFFFFFFFFLL;
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      v17 = 1;
    else
      v17 = -1;
    if (v14 && v12 == 0x7FFFFFFFFFFFFFFFLL)
      v17 = objc_msgSend(*(id *)(a1 + 40), "_sortApp1:app2:appLaunchCounts:", v5, v6, *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "compare:", v16);

  }
  return v17;
}

- (int64_t)_sortApp1:(id)a3 app2:(id)a4 appLaunchCounts:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  double v19;
  void *v20;
  void *v21;
  int64_t v22;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "bundleId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (double)(unint64_t)objc_msgSend(v11, "rawLaunchCount");

  objc_msgSend(v8, "bundleId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (double)(unint64_t)objc_msgSend(v14, "rawLaunchCount");
  objc_msgSend(v9, "predictionSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v13) = objc_msgSend(v16, "isEqualToString:", CFSTR("Mode Entity"));
  if ((_DWORD)v13)
    v12 = v12 / 10.0;
  objc_msgSend(v8, "predictionSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("Mode Entity"));
  v19 = v15 / 10.0;
  if (!v18)
    v19 = v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "compare:", v21);

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedPagesTunableConstants, 0);
  objc_storeStrong((id *)&self->_sources, 0);
}

- (void)_dockedApps
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXSuggestedPagesAppAggregator: could not fetch Dock apps: %@", a5, a6, a7, a8, 2u);
}

- (void)_sortedAppsOnFirstHomeScreenPage
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXSuggestedPagesAppAggregator: could not load home screen configuration: %@", a5, a6, a7, a8, 2u);
}

@end
