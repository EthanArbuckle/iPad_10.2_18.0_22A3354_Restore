@implementation ATXHomeScreenLogWidgetEventDictionaries

- (ATXHomeScreenLogWidgetEventDictionaries)init
{
  ATXHomeScreenLogWidgetEventDictionaries *v2;
  uint64_t v3;
  NSMutableDictionary *widgetEventDictionaries;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXHomeScreenLogWidgetEventDictionaries;
  v2 = -[ATXHomeScreenLogWidgetEventDictionaries init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    widgetEventDictionaries = v2->_widgetEventDictionaries;
    v2->_widgetEventDictionaries = (NSMutableDictionary *)v3;

  }
  return v2;
}

+ (id)widgetEventDictionaryAccumulatorSplitByLocationKeys
{
  if (widgetEventDictionaryAccumulatorSplitByLocationKeys_onceToken != -1)
    dispatch_once(&widgetEventDictionaryAccumulatorSplitByLocationKeys_onceToken, &__block_literal_global_226);
  return (id)widgetEventDictionaryAccumulatorSplitByLocationKeys_array;
}

void __94__ATXHomeScreenLogWidgetEventDictionaries_widgetEventDictionaryAccumulatorSplitByLocationKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("NumberOfPinnedWidgetViewsOn");
  v2[1] = CFSTR("NumberOfPinnedWidgetPseudoTapsOn");
  v2[2] = CFSTR("NumberOfPinnedWidgetTapsOn");
  v2[3] = CFSTR("NumberOfLockUnlockSessionsWithWidgetDwellOn");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)widgetEventDictionaryAccumulatorSplitByLocationKeys_array;
  widgetEventDictionaryAccumulatorSplitByLocationKeys_array = v0;

}

- (id)_widgetEventDictionaryKeyWithWidgetId:(id)a3 widgetKind:(id)a4 widgetSize:(unint64_t)a5
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CF9220], "stringRepresentationForExtensionBundleId:kind:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@:%lu"), v6, a5);

  return v7;
}

- (void)updateWidgetLevelSummaryForHomeScreenEvent:(id)a3 lastStackEvent:(id)a4
{
  void *v5;
  id v6;
  int v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[ATXHomeScreenLogWidgetEventDictionaries _widgetEventDictionaryForHomeScreenEvent:](self, "_widgetEventDictionaryForHomeScreenEvent:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_56;
  objc_msgSend(v11, "eventTypeString");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v7 = 0;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("HomeScreenPageShown")) & 1) != 0)
  {
    v7 = 1;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("HomeScreenDisappeared")) & 1) != 0)
  {
    v7 = 2;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("StackChanged")) & 1) != 0)
  {
    v7 = 3;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WidgetTapped")) & 1) != 0)
  {
    v7 = 4;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WidgetLongLook")) & 1) != 0)
  {
    v7 = 5;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WidgetUserFeedback")) & 1) != 0)
  {
    v7 = 6;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("UserStackConfigChanged")) & 1) != 0)
  {
    v7 = 7;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("DeviceLocked")) & 1) != 0)
  {
    v7 = 8;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("DeviceUnlocked")) & 1) != 0)
  {
    v7 = 9;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("PinnedWidgetAdded")) & 1) != 0)
  {
    v7 = 10;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("PinnedWidgetDeleted")) & 1) != 0)
  {
    v7 = 11;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("SpecialPageAppeared")) & 1) != 0)
  {
    v7 = 12;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("SpecialPageDisappeared")) & 1) != 0)
  {
    v7 = 13;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("StackShown")) & 1) != 0)
  {
    v7 = 14;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("StackDisappeared")) & 1) != 0)
  {
    v7 = 15;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("StackCreated")) & 1) != 0)
  {
    v7 = 16;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("StackDeleted")) & 1) != 0)
  {
    v7 = 17;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WidgetAddedToStack")) & 1) != 0)
  {
    v7 = 18;
  }
  else
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WidgetRemovedFromStack")) & 1) != 0)
    {

      +[ATXHomeScreenLogUploaderUtilities incrementDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "incrementDictionary:forKey:", v5, CFSTR("NumberOfInstancesRemovedFromStack"));
      v7 = 19;
      goto LABEL_50;
    }
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("StackVisibilityChanged")) & 1) != 0)
    {
      v7 = 20;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("AppAdded")) & 1) != 0)
    {
      v7 = 21;
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("AppRemoved")))
    {
      v7 = 22;
    }
    else
    {
      v7 = 0;
    }
  }

LABEL_50:
  if (objc_msgSend(v11, "stackKind") == 1)
  {
    if (v7 == 14)
    {
      v8 = objc_msgSend(v11, "stackLocation");
      v9 = CFSTR("NumberOfPinnedWidgetViewsOn");
      goto LABEL_55;
    }
    if (v7 == 4)
    {
      v8 = objc_msgSend(v11, "stackLocation");
      v9 = CFSTR("NumberOfPinnedWidgetTapsOn");
LABEL_55:
      +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:withLocation:](ATXHomeScreenLogUploaderUtilities, "keyByConcatenatingAccumulatorKey:withLocation:", v9, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXHomeScreenLogUploaderUtilities incrementDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "incrementDictionary:forKey:", v5, v10);

    }
  }
LABEL_56:

}

- (id)_widgetEventDictionaryForATXHomeScreenWidgetIdentifiable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "extensionBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "size");

  -[ATXHomeScreenLogWidgetEventDictionaries _widgetEventDictionaryForWidgetId:widgetKind:widgetSize:](self, "_widgetEventDictionaryForWidgetId:widgetKind:widgetSize:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_widgetEventDictionaryForHomeScreenEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "widgetBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "widgetSize");

  -[ATXHomeScreenLogWidgetEventDictionaries _widgetEventDictionaryForWidgetId:widgetKind:widgetSize:](self, "_widgetEventDictionaryForWidgetId:widgetKind:widgetSize:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_widgetEventDictionaryForWidgetId:(id)a3 widgetKind:(id)a4 widgetSize:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length") && objc_msgSend(v9, "length"))
  {
    -[ATXHomeScreenLogWidgetEventDictionaries _widgetEventDictionaryKeyWithWidgetId:widgetKind:widgetSize:](self, "_widgetEventDictionaryKeyWithWidgetId:widgetKind:widgetSize:", v8, v9, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_widgetEventDictionaries, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      -[ATXHomeScreenLogWidgetEventDictionaries _createNewWidgetEventDictionaryForBundleId:kind:size:](self, "_createNewWidgetEventDictionaryForBundleId:kind:size:", v8, v9, a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_widgetEventDictionaries, "setObject:forKeyedSubscript:", v12, v10);

    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_widgetEventDictionaries, "objectForKeyedSubscript:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __atxlog_handle_home_screen();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ATXHomeScreenLogWidgetEventDictionaries _widgetEventDictionaryForWidgetId:widgetKind:widgetSize:].cold.1((uint64_t)v8, (uint64_t)v9, v14);

    v13 = 0;
  }

  return v13;
}

- (id)_createNewWidgetEventDictionaryForBundleId:(id)a3 kind:(id)a4 size:(unint64_t)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v20 = v7;
  objc_msgSend(MEMORY[0x1E0CF9220], "stringRepresentationForExtensionBundleId:kind:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("WidgetBundleIdAndKind"));

  ATXStringForStackLayoutSize();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("widgetSize"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E83CE0E0, CFSTR("NumberOfInstancesRemovedFromStack"));
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend((id)objc_opt_class(), "widgetEventDictionaryAccumulatorSplitByLocationKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = 0;
        v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        do
        {
          +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:withLocation:](ATXHomeScreenLogUploaderUtilities, "keyByConcatenatingAccumulatorKey:withLocation:", v17, v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E83CE0E0, v18);

          ++v16;
        }
        while (v16 != 6);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  return v8;
}

- (void)updateWidgetLevelSummaryForWidgetPseudoTapWithStackShownEvent:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "stackKind") == 1)
  {
    -[ATXHomeScreenLogWidgetEventDictionaries _widgetEventDictionaryForHomeScreenEvent:](self, "_widgetEventDictionaryForHomeScreenEvent:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:withLocation:](ATXHomeScreenLogUploaderUtilities, "keyByConcatenatingAccumulatorKey:withLocation:", CFSTR("NumberOfPinnedWidgetPseudoTapsOn"), objc_msgSend(v6, "stackLocation"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXHomeScreenLogUploaderUtilities incrementDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "incrementDictionary:forKey:", v4, v5);

    }
  }

}

- (void)updateUnlockSessionsWithWidgetDwell:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[ATXHomeScreenLogWidgetEventDictionaries _widgetEventDictionaryForHomeScreenEvent:](self, "_widgetEventDictionaryForHomeScreenEvent:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:withLocation:](ATXHomeScreenLogUploaderUtilities, "keyByConcatenatingAccumulatorKey:withLocation:", CFSTR("NumberOfLockUnlockSessionsWithWidgetDwellOn"), objc_msgSend(v9, "stackLocation"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[ATXHomeScreenLogUploaderUtilities incrementDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "incrementDictionary:forKey:", v10, v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)sendToCoreAnalytics
{
  NSMutableDictionary *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = self->_widgetEventDictionaries;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v14;
    *(_QWORD *)&v5 = 138412546;
    v12 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_widgetEventDictionaries, "objectForKeyedSubscript:", v9, v12, (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        __atxlog_handle_home_screen();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v12;
          v18 = v9;
          v19 = 2112;
          v20 = v10;
          _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_INFO, "ATXHomeScreenLogUploader: Widget level dictionary for %@: %@", buf, 0x16u);
        }

        AnalyticsSendEvent();
      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v6);
  }

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
  v4 = self->_widgetEventDictionaries;
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
        -[NSMutableDictionary objectForKeyedSubscript:](self->_widgetEventDictionaries, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Widget Level Dictionary For %@"), v9);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v11);

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetEventDictionaries, 0);
}

- (void)_widgetEventDictionaryForWidgetId:(uint64_t)a1 widgetKind:(uint64_t)a2 widgetSize:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "ATXHomeScreenLogUploader: unable to get widget event dictionary because missing widgetId (%@) or kind (%@)", (uint8_t *)&v3, 0x16u);
}

@end
