@implementation ATXSuggestedPagesGenerator

- (ATXSuggestedPagesGenerator)init
{
  void *v3;
  void *v4;
  void *v5;
  ATXSuggestedPagesGenerator *v6;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CF9210], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXSuggestedPagesGenerator initWithWidgetAggregator:appAggregator:descriptorCache:](self, "initWithWidgetAggregator:appAggregator:descriptorCache:", v3, v4, v5);

  return v6;
}

- (ATXSuggestedPagesGenerator)initWithWidgetAggregator:(id)a3 appAggregator:(id)a4 descriptorCache:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXSuggestedPagesGenerator *v12;
  ATXSuggestedPagesGenerator *v13;
  uint64_t v14;
  ATXSuggestedPagesTunableConstants *tunableConstants;
  id v16;
  uint64_t v17;
  NSDictionary *appLaunchCounts;
  id v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v29;
  objc_super v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)ATXSuggestedPagesGenerator;
  v12 = -[ATXSuggestedPagesGenerator init](&v30, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_widgetAggregator, a3);
    objc_storeStrong((id *)&v13->_appAggregator, a4);
    objc_storeStrong((id *)&v13->_descriptorCache, a5);
    v14 = objc_opt_new();
    tunableConstants = v13->_tunableConstants;
    v13->_tunableConstants = (ATXSuggestedPagesTunableConstants *)v14;

    v16 = objc_alloc_init(MEMORY[0x1E0CF8CB8]);
    objc_msgSend(v16, "rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps");
    v17 = objc_claimAutoreleasedReturnValue();
    appLaunchCounts = v13->_appLaunchCounts;
    v13->_appLaunchCounts = (NSDictionary *)v17;

    v19 = objc_alloc_init(MEMORY[0x1E0CF8E58]);
    v29 = 0;
    objc_msgSend(v19, "loadHomeScreenPageConfigurationsIncludingHidden:error:", 0, &v29);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v29;
    objc_msgSend(v20, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      __atxlog_handle_modes();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[ATXSuggestedPagesGenerator initWithWidgetAggregator:appAggregator:descriptorCache:].cold.1((uint64_t)v21, v23);

    }
    v24 = objc_msgSend(v22, "maxPortraitRows");
    v25 = 6;
    if (v24)
      v25 = v24;
    v13->_cachedHomeScreenRows = v25;
    v26 = objc_msgSend(v22, "maxPortraitColumns");
    v27 = 4;
    if (v26)
      v27 = v26;
    v13->_cachedHomeScreenColumns = v27;

  }
  return v13;
}

- (id)generateSuggestedPagesForPageType:(int64_t)a3 layoutOptions:(id)a4
{
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  ATXSuggestedPagesAppAggregator *appAggregator;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  NSSet *v25;
  NSSet *suggestedApps;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  unint64_t cachedHomeScreenRows;
  unint64_t cachedHomeScreenColumns;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  unint64_t v47;
  NSSet *v48;
  NSObject *v49;
  NSObject *v50;
  id v51;
  uint64_t v52;
  os_signpost_id_t spid;
  void *v55;
  unint64_t v56;
  id v57;
  void *v58;
  void *v59;
  id obja;
  id obj;
  void *v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _QWORD v69[11];
  uint8_t buf[4];
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v57 = a4;
  __atxlog_handle_modes();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  __atxlog_handle_modes();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  spid = v7;
  v56 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    NSStringFromATXSuggestedPageType();
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446210;
    v71 = objc_msgSend(v10, "UTF8String");
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v9, OS_SIGNPOST_INTERVAL_BEGIN, spid, "generateSuggestedHomeScreenPage", "Type=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", buf, 0xCu);

  }
  v62 = (void *)objc_opt_new();
  v69[0] = v62;
  obja = (id)objc_opt_new();
  v69[1] = obja;
  v58 = (void *)objc_opt_new();
  v69[2] = v58;
  v11 = (void *)objc_opt_new();
  v69[3] = v11;
  v12 = (void *)objc_opt_new();
  v69[4] = v12;
  v13 = (void *)objc_opt_new();
  v69[5] = v13;
  v14 = (void *)objc_opt_new();
  v69[6] = v14;
  v15 = (void *)objc_opt_new();
  v69[7] = v15;
  v16 = (void *)objc_opt_new();
  v69[8] = v16;
  v17 = (void *)objc_opt_new();
  v69[9] = v17;
  v18 = (void *)objc_opt_new();
  v69[10] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 11);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_opt_new();
  appAggregator = self->_appAggregator;
  objc_msgSend(v57, "candidateApps");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSuggestedPagesAppAggregator provideAppsForSuggestedPageType:candidateApps:environment:](appAggregator, "provideAppsForSuggestedPageType:candidateApps:environment:", a3, v21, self);
  v22 = objc_claimAutoreleasedReturnValue();

  v23 = objc_alloc(MEMORY[0x1E0C99E60]);
  v59 = (void *)v22;
  if (v22)
    v24 = v22;
  else
    v24 = MEMORY[0x1E0C9AA60];
  v25 = (NSSet *)objc_msgSend(v23, "initWithArray:", v24);
  suggestedApps = self->_suggestedApps;
  self->_suggestedApps = v25;

  -[ATXSuggestedPagesWidgetAggregator provideWidgetsForPageType:environment:](self->_widgetAggregator, "provideWidgetsForPageType:environment:", a3, self);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSuggestedPagesGenerator _validatedWidgets:bundleIdsToLaunches:](self, "_validatedWidgets:bundleIdsToLaunches:", v27, self->_appLaunchCounts);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v55;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v65 != v30)
          objc_enumerationMutation(obj);
        v32 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        v33 = objc_alloc_init(MEMORY[0x1E0CF8E78]);
        objc_msgSend(v33, "setSuggestedPageType:", a3);
        objc_msgSend(v33, "setPageIndex:", objc_msgSend(v19, "count"));
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "UUIDString");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setUniqueIdentifier:", v35);

        cachedHomeScreenRows = self->_cachedHomeScreenRows;
        cachedHomeScreenColumns = self->_cachedHomeScreenColumns;
        v38 = -[ATXSuggestedPagesGenerator _suggestStacksFromPool:forPage:type:layout:numberOfColumns:](self, "_suggestStacksFromPool:forPage:type:layout:numberOfColumns:", v63, v33, a3, v32, cachedHomeScreenColumns);
        if (v38 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v39 = cachedHomeScreenColumns * cachedHomeScreenRows - v38;
          v40 = objc_msgSend(v32, "maxAppRowsForPageType:", a3);
          if (v40)
            v41 = self->_cachedHomeScreenColumns * v40 >= v39 ? v39 : self->_cachedHomeScreenColumns * v40;
          else
            v41 = v39;
          v42 = -[ATXSuggestedPagesGenerator _suggestAppsFromPool:forPage:type:numberOfAppsNecessary:](self, "_suggestAppsFromPool:forPage:type:numberOfAppsNecessary:", v59, v33, a3, v41);
          v43 = -[ATXSuggestedPagesGenerator _suggestShortcutsFromPool:forPage:type:numberOfShortcutsNecessary:](self, "_suggestShortcutsFromPool:forPage:type:numberOfShortcutsNecessary:", MEMORY[0x1E0C9AA60], v33, a3, v39 - v42)+ v42;
          if (v43 >= objc_msgSend(v32, "minNecessaryLeafIconsForPageType:", a3))
          {
            objc_msgSend(v33, "leafIcons");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v44, "count"))
            {

            }
            else
            {
              objc_msgSend(v33, "stacks");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = objc_msgSend(v45, "count");

              if (!v46)
                goto LABEL_23;
            }
            objc_msgSend(v19, "addObject:", v33);
          }
        }
LABEL_23:

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
    }
    while (v29);
  }

  v47 = objc_msgSend(v19, "count");
  if (v47 > -[ATXSuggestedPagesTunableConstants maxSuggestedPages](self->_tunableConstants, "maxSuggestedPages"))
    objc_msgSend(v19, "removeObjectsInRange:", -[ATXSuggestedPagesTunableConstants maxSuggestedPages](self->_tunableConstants, "maxSuggestedPages") - 1, objc_msgSend(v19, "count")- -[ATXSuggestedPagesTunableConstants maxSuggestedPages](self->_tunableConstants, "maxSuggestedPages"));
  v48 = self->_suggestedApps;
  self->_suggestedApps = 0;

  __atxlog_handle_modes();
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = v49;
  if (v56 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
  {
    NSStringFromATXSuggestedPageType();
    v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v52 = objc_msgSend(v51, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v71 = v52;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v50, OS_SIGNPOST_INTERVAL_END, spid, "generateSuggestedHomeScreenPage", "Type=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", buf, 0xCu);

  }
  return v19;
}

- (unint64_t)_suggestStacksFromPool:(id)a3 forPage:(id)a4 type:(int64_t)a5 layout:(id)a6 numberOfColumns:(unint64_t)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t i;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a6;
  objc_msgSend(v13, "makeStacksFromWidgets:pageType:environment:", a3, a5, self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v13, "layOutStacks:numberOfColumns:forPageType:", v14, a7, a5);
    objc_msgSend(v12, "setStacks:", v14);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v15);
          v18 += objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "numberOfLeafIconSpots", (_QWORD)v22);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v17);
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v18;
}

- (unint64_t)_suggestShortcutsFromPool:(id)a3 forPage:(id)a4 type:(int64_t)a5 numberOfShortcutsNecessary:(unint64_t)a6
{
  id v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (a6)
  {
    v12 = objc_msgSend(v10, "count");
    if (v12 >= a6)
      v13 = a6;
    else
      v13 = v12;
    objc_msgSend(v10, "subarrayWithRange:", 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leafIcons");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");
    v17 = v16;
    if (v16)
      v18 = v16;
    else
      v18 = (id)objc_opt_new();
    v20 = v18;

    v21 = objc_msgSend(v14, "count");
    if (v21 == objc_msgSend(v10, "count"))
    {
      objc_msgSend(v20, "addObjectsFromArray:", v14);
    }
    else
    {
      v22 = objc_msgSend(v14, "count");
      if (v22 >= objc_msgSend(v10, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXSuggestedPagesGenerator.m"), 203, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("shortcutsThatFit.count < shortcuts.count"));

      }
      objc_msgSend(v14, "subarrayWithRange:", 0, objc_msgSend(v14, "count") - 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObjectsFromArray:", v23);
      objc_msgSend(v10, "subarrayWithRange:", objc_msgSend(v23, "count"), objc_msgSend(v10, "count") - objc_msgSend(v23, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("SHORTCUTS_FOLDER_TITLE"), &stru_1E82FDC98, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E70]), "initWithContents:", v24);
      v28 = objc_alloc(MEMORY[0x1E0CF8E68]);
      v33[0] = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v28, "initWithFolderPages:name:", v29, v26);

      objc_msgSend(v20, "addObject:", v30);
    }
    objc_msgSend(v11, "setLeafIcons:", v20);
    v19 = objc_msgSend(v14, "count");

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (unint64_t)_suggestAppsFromPool:(id)a3 forPage:(id)a4 type:(int64_t)a5 numberOfAppsNecessary:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v19;

  v10 = a4;
  v11 = a3;
  objc_msgSend(v10, "leafIcons");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXSuggestedPagesGenerator.m"), 223, CFSTR("Leaf icons should be nil by now"));

  }
  objc_msgSend(v10, "setCandidateApps:", v11);
  v13 = objc_msgSend(v11, "count");
  if (v13 >= a6)
    v14 = a6;
  else
    v14 = v13;
  objc_msgSend(v11, "subarrayWithRange:", 0, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setLeafIcons:", v15);
  objc_msgSend(v10, "leafIcons");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "count");
  return v17;
}

- (id)_validatedWidgets:(id)a3 bundleIdsToLaunches:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v18 = CFSTR("com.apple.Fitness");
  v7 = (objc_class *)MEMORY[0x1E0CF8C88];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithRawLaunchCount:uniqueDaysLaunched:", 0, 0);
  v19[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__ATXSuggestedPagesGenerator__validatedWidgets_bundleIdsToLaunches___block_invoke;
  v15[3] = &unk_1E82E1680;
  v15[4] = self;
  v16 = v10;
  v17 = v6;
  v11 = v6;
  v12 = v10;
  objc_msgSend(v8, "_pas_filteredArrayWithTest:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __68__ATXSuggestedPagesGenerator__validatedWidgets_bundleIdsToLaunches___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "appBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
    goto LABEL_6;
  if ((ATXBundleIdIsFakeContainerBundleId() & 1) == 0)
  {
    if (!objc_msgSend(MEMORY[0x1E0CF8CE8], "isInstalledAndNotRestrictedForBundle:", v4)
      || (objc_msgSend(MEMORY[0x1E0CF8CD8], "bundleIdIsLockedOrHiddenByUserPreference:", v4) & 1) != 0)
    {
LABEL_6:
      v5 = 0;
      goto LABEL_7;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "homeScreenDescriptorForWidget:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7
      && (objc_msgSend(v7, "disfavoredFamiliesForLocation:", 0),
          objc_msgSend(v3, "size"),
          CHSWidgetFamilyFromATXStackLayoutSize(),
          CHSWidgetFamilyMaskContainsFamily()))
    {
      __atxlog_handle_modes();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138412290;
        v19 = v4;
        _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "ATXSuggestedPagesGenerator: not allowing widget for %@ because it is disfavored for home screen", (uint8_t *)&v18, 0xCu);
      }
      v5 = 0;
    }
    else
    {
      if (!objc_msgSend(v3, "requiresAppLaunch"))
      {
        v5 = 1;
LABEL_27:

        goto LABEL_7;
      }
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
        v12 = v10;
      else
        v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF8C88]), "initWithRawLaunchCount:uniqueDaysLaunched:", 1, 0);
      v9 = v12;

      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
        v15 = v13;
      else
        v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8C88]), "initWithRawLaunchCount:uniqueDaysLaunched:", 0, 0);
      v16 = v15;

      v5 = objc_msgSend(v16, "isGreaterThanOrEqualToData:", v9);
      if ((v5 & 1) == 0)
      {
        __atxlog_handle_modes();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 138412802;
          v19 = v4;
          v20 = 2114;
          v21 = v16;
          v22 = 2114;
          v23 = v9;
          _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "ATXSuggestedPagesGenerator: not allowing widget for %@ because %{public}@ is not greater than or equal to: %{public}@", (uint8_t *)&v18, 0x20u);
        }

      }
    }

    goto LABEL_27;
  }
  v5 = 1;
LABEL_7:

  return v5;
}

- (NSDictionary)appLaunchCounts
{
  return self->_appLaunchCounts;
}

- (NSSet)suggestedApps
{
  return self->_suggestedApps;
}

- (ATXSuggestedPagesTunableConstants)tunableConstants
{
  return self->_tunableConstants;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tunableConstants, 0);
  objc_storeStrong((id *)&self->_suggestedApps, 0);
  objc_storeStrong((id *)&self->_appLaunchCounts, 0);
  objc_storeStrong((id *)&self->_descriptorCache, 0);
  objc_storeStrong((id *)&self->_appAggregator, 0);
  objc_storeStrong((id *)&self->_widgetAggregator, 0);
}

- (void)initWithWidgetAggregator:(uint64_t)a1 appAggregator:(NSObject *)a2 descriptorCache:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "Could not load Home Screen config to find layout info: %@", (uint8_t *)&v2, 0xCu);
}

@end
