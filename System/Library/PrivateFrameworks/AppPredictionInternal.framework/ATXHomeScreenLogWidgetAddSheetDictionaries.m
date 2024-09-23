@implementation ATXHomeScreenLogWidgetAddSheetDictionaries

- (ATXHomeScreenLogWidgetAddSheetDictionaries)init
{
  ATXHomeScreenLogWidgetAddSheetDictionaries *v2;
  uint64_t v3;
  NSMutableDictionary *widgetAddSheetDictionaries;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXHomeScreenLogWidgetAddSheetDictionaries;
  v2 = -[ATXHomeScreenLogWidgetAddSheetDictionaries init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    widgetAddSheetDictionaries = v2->_widgetAddSheetDictionaries;
    v2->_widgetAddSheetDictionaries = (NSMutableDictionary *)v3;

  }
  return v2;
}

+ (id)rankKeysSplitBySize
{
  if (rankKeysSplitBySize__pasOnceToken6 != -1)
    dispatch_once(&rankKeysSplitBySize__pasOnceToken6, &__block_literal_global_155);
  return (id)rankKeysSplitBySize__pasExprOnceResult;
}

void __65__ATXHomeScreenLogWidgetAddSheetDictionaries_rankKeysSplitBySize__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v3[0] = CFSTR("RankInGallery");
  v3[1] = CFSTR("RankInStack");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)rankKeysSplitBySize__pasExprOnceResult;
  rankKeysSplitBySize__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

- (id)_createNewWidgetAddSheetDictionaryForBundleId:(id)a3 kind:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v18 = v6;
  objc_msgSend(MEMORY[0x1E0CF9220], "stringRepresentationForExtensionBundleId:kind:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("WidgetBundleIdAndKind"));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend((id)objc_opt_class(), "rankKeysSplitBySize");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = 0;
        v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        do
        {
          +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:withSize:](ATXHomeScreenLogUploaderUtilities, "keyByConcatenatingAccumulatorKey:withSize:", v15, v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E83CD6A8, v16);

          ++v14;
        }
        while (v14 != 3);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  return v7;
}

- (void)updateWidgetAddSheetSummaryForSuggestions:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          -[ATXHomeScreenLogWidgetAddSheetDictionaries _widgetAddSheetDictionaryForStack](self, "_widgetAddSheetDictionaryForStack");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "suggestedSize");

          -[ATXHomeScreenLogWidgetAddSheetDictionaries _updateWidgetAddSheetDictionariesWithDictionary:suggestedSize:inStack:rank:](self, "_updateWidgetAddSheetDictionariesWithDictionary:suggestedSize:inStack:rank:", v11, v12, 0, v6 + v8 + 1);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[ATXHomeScreenLogWidgetAddSheetDictionaries _updateWidgetAddSheetDictionariesForDescriptor:inStack:rank:](self, "_updateWidgetAddSheetDictionariesForDescriptor:inStack:rank:", v9, 0, v6 + v8 + 1);
        }
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v6 += v8;
    }
    while (v5);
  }

}

- (void)updateWidgetAddSheetSummaryForDefaultStack:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "smallDefaultStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenLogWidgetAddSheetDictionaries _updateWidgetAddSheetDictionariesForStack:suggestedSize:](self, "_updateWidgetAddSheetDictionariesForStack:suggestedSize:", v5, 0);

  objc_msgSend(v4, "mediumDefaultStack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenLogWidgetAddSheetDictionaries _updateWidgetAddSheetDictionariesForStack:suggestedSize:](self, "_updateWidgetAddSheetDictionariesForStack:suggestedSize:", v6, 1);

  objc_msgSend(v4, "largeDefaultStack");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[ATXHomeScreenLogWidgetAddSheetDictionaries _updateWidgetAddSheetDictionariesForStack:suggestedSize:](self, "_updateWidgetAddSheetDictionariesForStack:suggestedSize:", v7, 2);
}

- (void)_updateWidgetAddSheetDictionariesForStack:(id)a3 suggestedSize:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++);
        -[ATXHomeScreenLogWidgetAddSheetDictionaries _updateWidgetAddSheetDictionariesForDescriptor:inStack:rank:](self, "_updateWidgetAddSheetDictionariesForDescriptor:inStack:rank:", v11, 1, v10 + v8);
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v8 += v10;
    }
    while (v7);
  }

}

- (void)_updateWidgetAddSheetDictionariesForDescriptor:(id)a3 inStack:(BOOL)a4 rank:(unint64_t)a5
{
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  id v10;

  v6 = a4;
  v8 = a3;
  -[ATXHomeScreenLogWidgetAddSheetDictionaries _widgetAddSheetDictionaryForDescriptor:](self, "_widgetAddSheetDictionaryForDescriptor:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "suggestedSize");

  -[ATXHomeScreenLogWidgetAddSheetDictionaries _updateWidgetAddSheetDictionariesWithDictionary:suggestedSize:inStack:rank:](self, "_updateWidgetAddSheetDictionariesWithDictionary:suggestedSize:inStack:rank:", v10, v9, v6, a5);
}

- (void)_updateWidgetAddSheetDictionariesWithDictionary:(id)a3 suggestedSize:(unint64_t)a4 inStack:(BOOL)a5 rank:(unint64_t)a6
{
  _BOOL4 v7;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v7 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  __atxlog_handle_home_screen();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("WidgetBundleIdAndKind"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ATXCAStringForStackLayoutSize();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138413058;
    v17 = v11;
    v18 = 2114;
    v19 = v12;
    v20 = 2048;
    v21 = a6;
    v22 = 1024;
    v23 = v7;
    _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenLogUploader: suggested: %@ of size %{public}@ in pos %lu in stack? %d", (uint8_t *)&v16, 0x26u);

  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v14 = CFSTR("RankInStack");
    else
      v14 = CFSTR("RankInGallery");
    +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:withSize:](ATXHomeScreenLogUploaderUtilities, "keyByConcatenatingAccumulatorKey:withSize:", v14, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, v15);

  }
}

- (id)_widgetAddSheetDictionaryForDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "extensionBundleIdForMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXHomeScreenLogWidgetAddSheetDictionaries _widgetAddSheetDictionaryForWidgetId:widgetKind:](self, "_widgetAddSheetDictionaryForWidgetId:widgetKind:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_widgetAddSheetDictionaryForStack
{
  return -[ATXHomeScreenLogWidgetAddSheetDictionaries _widgetAddSheetDictionaryForWidgetId:widgetKind:](self, "_widgetAddSheetDictionaryForWidgetId:widgetKind:", CFSTR("stack"), CFSTR("stack"));
}

- (id)_widgetAddSheetDictionaryForWidgetId:(id)a3 widgetKind:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length") && objc_msgSend(v7, "length"))
  {
    -[ATXHomeScreenLogWidgetAddSheetDictionaries widgetAddSheetDictionaryKeyWithWidgetId:widgetKind:](self, "widgetAddSheetDictionaryKeyWithWidgetId:widgetKind:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_widgetAddSheetDictionaries, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      -[ATXHomeScreenLogWidgetAddSheetDictionaries _createNewWidgetAddSheetDictionaryForBundleId:kind:](self, "_createNewWidgetAddSheetDictionaryForBundleId:kind:", v6, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_widgetAddSheetDictionaries, "setObject:forKeyedSubscript:", v10, v8);

    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_widgetAddSheetDictionaries, "objectForKeyedSubscript:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __atxlog_handle_home_screen();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXHomeScreenLogWidgetAddSheetDictionaries _widgetAddSheetDictionaryForWidgetId:widgetKind:].cold.1((uint64_t)v6, (uint64_t)v7, v12);

    v11 = 0;
  }

  return v11;
}

- (id)widgetAddSheetDictionaryKeyWithWidgetId:(id)a3 widgetKind:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CF9220], "stringRepresentationForExtensionBundleId:kind:", a3, a4);
}

- (id)dryRunResult
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_widgetAddSheetDictionaries;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_widgetAddSheetDictionaries, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Widget Add Sheet Dictionary For %@"), v9);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v11);

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)sendToCoreAnalytics
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_widgetAddSheetDictionaries;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_widgetAddSheetDictionaries, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        AnalyticsSendEvent();

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetAddSheetDictionaries, 0);
}

- (void)_widgetAddSheetDictionaryForWidgetId:(os_log_t)log widgetKind:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "ATXHomeScreenLogUploader: unable to get widget add sheet dictionary because missing widgetId (%@) or kind (%@)", (uint8_t *)&v3, 0x16u);
}

@end
