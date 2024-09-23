@implementation ATXHomeScreenLogWidgetSetupDictionaries

- (ATXHomeScreenLogWidgetSetupDictionaries)init
{
  ATXHomeScreenLogWidgetSetupDictionaries *v2;
  uint64_t v3;
  NSMutableArray *widgetSetupDictionaries;
  uint64_t v5;
  NSMutableDictionary *stackConfigDictionary;
  uint64_t v7;
  ATXInformationStore *informationStore;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ATXHomeScreenLogWidgetSetupDictionaries;
  v2 = -[ATXHomeScreenLogWidgetSetupDictionaries init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    widgetSetupDictionaries = v2->_widgetSetupDictionaries;
    v2->_widgetSetupDictionaries = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    stackConfigDictionary = v2->_stackConfigDictionary;
    v2->_stackConfigDictionary = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0CF8EC8], "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    informationStore = v2->_informationStore;
    v2->_informationStore = (ATXInformationStore *)v7;

  }
  return v2;
}

- (void)updateWidgetSetupSummaryForHomeScreenPages:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __86__ATXHomeScreenLogWidgetSetupDictionaries_updateWidgetSetupSummaryForHomeScreenPages___block_invoke;
  v4[3] = &unk_1E82E7118;
  v4[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v4);
  -[ATXHomeScreenLogWidgetSetupDictionaries _persistStackConfigStatistics](self, "_persistStackConfigStatistics");
}

void __86__ATXHomeScreenLogWidgetSetupDictionaries_updateWidgetSetupSummaryForHomeScreenPages___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  id obj;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v21 = ATXStackLocationForPageAndIndex();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v3, "stacks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v3;
  objc_msgSend(v3, "panels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v19 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v27;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(obj);
        v20 = v7;
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v7);
        v9 = ATXStackKindForStack();
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v8, "widgets");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v23;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
              objc_msgSend(*(id *)(a1 + 32), "_createNewWidgetSetupDictionaryForWidget:stackKind:stackLocation:rowCoordinate:columnCoordinate:", v15, v9, v21, objc_msgSend(v8, "coordinateRow"), objc_msgSend(v8, "coordinateColumn"));
              objc_msgSend(*(id *)(a1 + 32), "_createStackConfigStatisticsForWidget:stackKind:", v15, v9);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v12);
        }

        ++v7;
      }
      while (v20 + 1 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v19);
  }

}

- (void)_persistStackConfigStatistics
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allKeys](self->_stackConfigDictionary, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
        v9 = objc_alloc(MEMORY[0x1E0D81210]);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_stackConfigDictionary, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v9, "initWithBuilder:", v10);

        if ((-[ATXInformationStore addStackConfigStatistics:](self->_informationStore, "addStackConfigStatistics:", v11) & 1) == 0)
        {
          __atxlog_handle_timeline();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v18 = v8;
            _os_log_error_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_ERROR, "ATXHomeScreenLogWidgetSetupDictionaries: unable to persist stack config statistics for timeline (%@)", buf, 0xCu);
          }

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v5);
  }

}

- (void)_createStackConfigStatisticsForWidget:(id)a3 stackKind:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v19, "extensionBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "widgetKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "size");
  ATXStringForStackLayoutSize();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "appBundleId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@:%@:%@:%@"), v7, v8, v9, v10);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_stackConfigDictionary, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = objc_alloc(MEMORY[0x1E0D81218]);
    objc_msgSend(v19, "extensionBundleId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "widgetKind");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appBundleId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "size");
    v17 = (void *)objc_msgSend(v13, "initWithWidgetBundleId:widgetKind:containerBundleIdentifier:widgetFamily:", v14, v15, v16, CHSWidgetFamilyFromATXStackLayoutSize());

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_stackConfigDictionary, "setObject:forKeyedSubscript:", v17, v11);
  }
  switch(a4)
  {
    case 0uLL:
      -[NSMutableDictionary objectForKeyedSubscript:](self->_stackConfigDictionary, "objectForKeyedSubscript:", v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setCountOfWidgetsWithUnknownStackKind:", objc_msgSend(v18, "countOfWidgetsWithUnknownStackKind") + 1);
      goto LABEL_8;
    case 1uLL:
      -[NSMutableDictionary objectForKeyedSubscript:](self->_stackConfigDictionary, "objectForKeyedSubscript:", v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setCountOfStandaloneWidgets:", objc_msgSend(v18, "countOfStandaloneWidgets") + 1);
      goto LABEL_8;
    case 2uLL:
    case 4uLL:
    case 6uLL:
      -[NSMutableDictionary objectForKeyedSubscript:](self->_stackConfigDictionary, "objectForKeyedSubscript:", v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setCountOfSmartStacksWithWidget:", objc_msgSend(v18, "countOfSmartStacksWithWidget") + 1);
      goto LABEL_8;
    case 3uLL:
    case 5uLL:
    case 7uLL:
      -[NSMutableDictionary objectForKeyedSubscript:](self->_stackConfigDictionary, "objectForKeyedSubscript:", v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setCountOfNonSmartStacksWithWidget:", objc_msgSend(v18, "countOfNonSmartStacksWithWidget") + 1);
LABEL_8:

      break;
    default:
      break;
  }

}

- (void)_createNewWidgetSetupDictionaryForWidget:(id)a3 stackKind:(unint64_t)a4 stackLocation:(unint64_t)a5 rowCoordinate:(int64_t)a6 columnCoordinate:(int64_t)a7
{
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  int64_t v34;
  ATXHomeScreenLogWidgetSetupDictionaries *v35;

  v10 = a3;
  objc_msgSend(v10, "extensionBundleId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "widgetKind");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length") && objc_msgSend(v12, "length"))
  {
    v34 = a7;
    v13 = (void *)objc_opt_new();
    v14 = (void *)MEMORY[0x1E0CF9220];
    objc_msgSend(v10, "extensionBundleId");
    v35 = self;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "widgetKind");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringRepresentationForExtensionBundleId:kind:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("WidgetBundleIdAndKind"));

    v18 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v10, "extensionBundleId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "numberWithBool:", +[ATXHomeScreenLogUploaderUtilities isFirstPartyApp:](ATXHomeScreenLogUploaderUtilities, "isFirstPartyApp:", v19));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, CFSTR("widgetIsFirstParty"));

    objc_msgSend(v10, "size");
    ATXStringForStackLayoutSize();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, CFSTR("widgetSize"));

    ATXStringForStackKind();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, CFSTR("stackKind"));

    ATXStringForStackLocation();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v23, CFSTR("stackLocation"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v24, CFSTR("stackLocationRowCoordinate"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v34);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v25, CFSTR("stackLocationColumnCoordinate"));

    objc_msgSend(v10, "appBundleId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, CFSTR("ParentAppBundleId"));

    objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E83CD840, CFSTR("NumberOfLaunchesOfParentApp"));
    +[ATXHomeScreenLogUploaderUtilities abGroup](ATXHomeScreenLogUploaderUtilities, "abGroup");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v27, CFSTR("abGroup"));

    v28 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v10, "intent");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "numberWithInt:", v29 != 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v30, CFSTR("AcceptsIntent"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v10, "isOnboardingWidget"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v31, CFSTR("isOnboarding"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v10, "isSuggestedWidget"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v32, CFSTR("isSuggestedWidget"));

    -[NSMutableArray addObject:](v35->_widgetSetupDictionaries, "addObject:", v13);
  }
  else
  {
    __atxlog_handle_home_screen();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[ATXHomeScreenLogWidgetSetupDictionaries _createNewWidgetSetupDictionaryForWidget:stackKind:stackLocation:rowCoordinate:columnCoordinate:].cold.1((uint64_t)v11, (uint64_t)v12, v33);

  }
}

- (void)updateTotalUnlockSessions:(unint64_t)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_widgetSetupDictionaries;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3, (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("NumberOfLockUnlockSessions"));

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)updateWidgetLevelParentAppLaunches:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_widgetSetupDictionaries;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ParentAppBundleId"), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("NumberOfLaunchesOfParentApp"));

          }
        }

      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)sendToCoreAnalytics
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[ATXHomeScreenLogWidgetSetupDictionaries _finalizeWidgetSetupDictionaries](self, "_finalizeWidgetSetupDictionaries");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_widgetSetupDictionaries;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        __atxlog_handle_home_screen();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("WidgetBundleIdAndKind"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v16 = v10;
          v17 = 2112;
          v18 = v8;
          _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_INFO, "ATXHomeScreenLogUploader: Widget Setup dictionary for %@: %@", buf, 0x16u);

        }
        AnalyticsSendEvent();
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
    }
    while (v5);
  }

}

- (void)_finalizeWidgetSetupDictionaries
{
  -[ATXHomeScreenLogWidgetSetupDictionaries _removeAuxiliaryFieldsFromWidgetSetupDictionaries](self, "_removeAuxiliaryFieldsFromWidgetSetupDictionaries");
  -[ATXHomeScreenLogWidgetSetupDictionaries _copyAllowedWidgetBundleIds](self, "_copyAllowedWidgetBundleIds");
}

- (void)_copyAllowedWidgetBundleIds
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_widgetSetupDictionaries;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1E0CF9220];
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("WidgetBundleIdAndKind"), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "widgetBundleIdForWidgetPersonalityStringRepresentation:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v3, "logUploadAllowedForWidgetBundleId:", v12))
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("WidgetBundleIdAndKind"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("AllowedWidgetBundleIdAndKind"));

        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (void)_removeAuxiliaryFieldsFromWidgetSetupDictionaries
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_widgetSetupDictionaries;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "removeObjectForKey:", CFSTR("ParentAppBundleId"), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)dryRunResult
{
  void *v3;
  NSMutableArray *widgetSetupDictionaries;
  id v5;
  _QWORD v7[4];
  id v8;

  -[ATXHomeScreenLogWidgetSetupDictionaries _finalizeWidgetSetupDictionaries](self, "_finalizeWidgetSetupDictionaries");
  v3 = (void *)objc_opt_new();
  widgetSetupDictionaries = self->_widgetSetupDictionaries;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__ATXHomeScreenLogWidgetSetupDictionaries_dryRunResult__block_invoke;
  v7[3] = &unk_1E82E7140;
  v5 = v3;
  v8 = v5;
  -[NSMutableArray enumerateObjectsUsingBlock:](widgetSetupDictionaries, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

void __55__ATXHomeScreenLogWidgetSetupDictionaries_dryRunResult__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(void **)(a1 + 32);
  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a2;
  v7 = [v5 alloc];
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("WidgetBundleIdAndKind"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("stackLocation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("Widget Setup Dictionary (%lu) for %@, location:%@"), a3, v10, v8);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_informationStore, 0);
  objc_storeStrong((id *)&self->_stackConfigDictionary, 0);
  objc_storeStrong((id *)&self->_widgetSetupDictionaries, 0);
}

- (void)_createNewWidgetSetupDictionaryForWidget:(os_log_t)log stackKind:stackLocation:rowCoordinate:columnCoordinate:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "ATXHomeScreenLogUploader: unable to get widget setup dictionary because missing widgetId (%@) or kind (%@)", (uint8_t *)&v3, 0x16u);
}

@end
