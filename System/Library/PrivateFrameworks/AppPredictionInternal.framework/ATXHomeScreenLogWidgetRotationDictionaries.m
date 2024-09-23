@implementation ATXHomeScreenLogWidgetRotationDictionaries

- (ATXHomeScreenLogWidgetRotationDictionaries)init
{
  ATXHomeScreenLogWidgetRotationDictionaries *v2;
  uint64_t v3;
  NSMutableDictionary *widgetRotationDictionaries;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXHomeScreenLogWidgetRotationDictionaries;
  v2 = -[ATXHomeScreenLogWidgetRotationDictionaries init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    widgetRotationDictionaries = v2->_widgetRotationDictionaries;
    v2->_widgetRotationDictionaries = (NSMutableDictionary *)v3;

  }
  return v2;
}

+ (id)widgetRotationDictionaryAccumulatorKeys
{
  if (widgetRotationDictionaryAccumulatorKeys_onceToken != -1)
    dispatch_once(&widgetRotationDictionaryAccumulatorKeys_onceToken, &__block_literal_global_1);
  return (id)widgetRotationDictionaryAccumulatorKeys_array;
}

void __85__ATXHomeScreenLogWidgetRotationDictionaries_widgetRotationDictionaryAccumulatorKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[17];

  v2[16] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("taps");
  v2[1] = CFSTR("pseudotaps");
  v2[2] = CFSTR("rotations");
  v2[3] = CFSTR("views");
  v2[4] = CFSTR("pseudoDismisses");
  v2[5] = CFSTR("timesAddedToStack");
  v2[6] = CFSTR("dismissOnces");
  v2[7] = CFSTR("neverShows");
  v2[8] = CFSTR("viewedRotations");
  v2[9] = CFSTR("pseudoTappedRotations");
  v2[10] = CFSTR("tappedRotations");
  v2[11] = CFSTR("numFinalOutcomeNotSeen");
  v2[12] = CFSTR("numFinalOutcomePseudoDismiss");
  v2[13] = CFSTR("numFinalOutcomePseudoTap");
  v2[14] = CFSTR("numFinalOutcomeSeen");
  v2[15] = CFSTR("numFinalOutcomeTap");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 16);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)widgetRotationDictionaryAccumulatorKeys_array;
  widgetRotationDictionaryAccumulatorKeys_array = v0;

}

- (void)updateWithRotationSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  objc_msgSend(v4, "startingStackChangeEvent");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_sourceKeyForWidgetRotationForRotationSession:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "widgetBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "widgetKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v17, "widgetSize");
  objc_msgSend(v17, "stackLocation");
  ATXCAStringForStackLocation();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "isNPlusOneRotation");
  LOBYTE(v16) = objc_msgSend(v4, "isFirstNPlusOneRotation");
  -[ATXHomeScreenLogWidgetRotationDictionaries _widgetRotationDictionaryForWidgetBundleId:kind:size:source:location:isNPlusOne:isFirstRotationToNPlusOne:](self, "_widgetRotationDictionaryForWidgetBundleId:kind:size:source:location:isNPlusOne:isFirstRotationToNPlusOne:", v6, v7, v8, v5, v9, v10, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[ATXHomeScreenLogUploaderUtilities incrementDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "incrementDictionary:forKey:", v11, CFSTR("rotations"));
  +[ATXHomeScreenLogEngagementKeyTracker keyTrackerForStackEngagementStatus:](ATXHomeScreenLogEngagementKeyTracker, "keyTrackerForStackEngagementStatus:", objc_msgSend(v4, "engagementStatus"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rotationFinalOutcomeKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXHomeScreenLogUploaderUtilities incrementDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "incrementDictionary:forKey:", v11, v13);

  +[ATXHomeScreenLogUploaderUtilities countsForRotationEngagementStatusHistory:](ATXHomeScreenLogUploaderUtilities, "countsForRotationEngagementStatusHistory:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72__ATXHomeScreenLogWidgetRotationDictionaries_updateWithRotationSession___block_invoke;
  v18[3] = &unk_1E82DA858;
  v19 = v11;
  v15 = v11;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v18);

}

void __72__ATXHomeScreenLogWidgetRotationDictionaries_updateWithRotationSession___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v5 = a3;
  v6 = objc_msgSend(a2, "unsignedIntValue");
  v7 = objc_msgSend(v5, "unsignedIntValue");

  +[ATXHomeScreenLogEngagementKeyTracker keyTrackerForStackEngagementStatus:](ATXHomeScreenLogEngagementKeyTracker, "keyTrackerForStackEngagementStatus:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v13 = v8;
    objc_msgSend(v8, "rotationBooleanKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXHomeScreenLogUploaderUtilities incrementDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "incrementDictionary:forKey:", v9, v10);

    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v13, "rotationAggregationKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXHomeScreenLogUploaderUtilities add:toDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "add:toDictionary:forKey:", v7, v11, v12);

    v8 = v13;
  }

}

- (id)_widgetRotationDictionaryForWidgetBundleId:(id)a3 kind:(id)a4 size:(unint64_t)a5 source:(id)a6 location:(id)a7 isNPlusOne:(BOOL)a8 isFirstRotationToNPlusOne:(BOOL)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v25;
  uint64_t v26;

  v9 = a8;
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  if (objc_msgSend(v15, "length") && objc_msgSend(v16, "length"))
  {
    LOBYTE(v25) = a9;
    -[ATXHomeScreenLogWidgetRotationDictionaries _widgetRotationDictionaryKeyWithWidgetId:widgetKind:widgetSize:source:location:isNPlusOne:isFirstRotationToNPlusOne:](self, "_widgetRotationDictionaryKeyWithWidgetId:widgetKind:widgetSize:source:location:isNPlusOne:isFirstRotationToNPlusOne:", v15, v16, a5, v17, v18, v9, v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_widgetRotationDictionaries, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      LOBYTE(v26) = a9;
      -[ATXHomeScreenLogWidgetRotationDictionaries _createNewWidgetRotationDictionaryForBundleId:kind:size:source:location:isNPlusOne:isFirstRotationToNPlusOne:](self, "_createNewWidgetRotationDictionaryForBundleId:kind:size:source:location:isNPlusOne:isFirstRotationToNPlusOne:", v15, v16, a5, v17, v18, v9, v26);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_widgetRotationDictionaries, "setObject:forKeyedSubscript:", v21, v19);

    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_widgetRotationDictionaries, "objectForKeyedSubscript:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __atxlog_handle_home_screen();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[ATXHomeScreenLogWidgetRotationDictionaries _widgetRotationDictionaryForWidgetBundleId:kind:size:source:location:isNPlusOne:isFirstRotationToNPlusOne:].cold.1((uint64_t)v15, (uint64_t)v16, v23);

    v22 = 0;
  }

  return v22;
}

- (id)_widgetRotationDictionaryKeyWithWidgetId:(id)a3 widgetKind:(id)a4 widgetSize:(unint64_t)a5 source:(id)a6 location:(id)a7 isNPlusOne:(BOOL)a8 isFirstRotationToNPlusOne:(BOOL)a9
{
  _BOOL4 v9;
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v9 = a8;
  v14 = (objc_class *)MEMORY[0x1E0CB3940];
  v15 = a7;
  v16 = a6;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_msgSend([v14 alloc], "initWithFormat:", CFSTR("%@:%@:%lu:%@:%@:%d:%d"), v18, v17, a5, v16, v15, v9, a9);

  return v19;
}

- (id)_createNewWidgetRotationDictionaryForBundleId:(id)a3 kind:(id)a4 size:(unint64_t)a5 source:(id)a6 location:(id)a7 isNPlusOne:(BOOL)a8 isFirstRotationToNPlusOne:(BOOL)a9
{
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v9 = a8;
  v33 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v17 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CF9220], "stringRepresentationForExtensionBundleId:kind:", v13, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("WidgetBundleIdAndKind"));

  ATXStringForStackLayoutSize();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("widgetSize"));

  objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, CFSTR("source"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("location"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, CFSTR("isNPlusOne"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, CFSTR("IsFirstRotationToNPlusOne"));

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend((id)objc_opt_class(), "widgetRotationDictionaryAccumulatorKeys", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v29;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v29 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(v17, "setObject:forKeyedSubscript:", &unk_1E83CB278, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v26++));
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v24);
  }

  return v17;
}

+ (id)_sourceKeyForWidgetRotationForRotationSession:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (+[ATXHomeScreenLogUploaderUtilities isRotationSessionDueToProactive:](ATXHomeScreenLogUploaderUtilities, "isRotationSessionDueToProactive:", v3))
  {
    v4 = (void *)objc_opt_class();
    objc_msgSend(v3, "systemSuggestSuggestionLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_suggestionReasonToWidgetRotationDictionariesSourceKey:", +[ATXHomeScreenLogUploaderUtilities suggestionReasonForSuggestionLayout:](ATXHomeScreenLogUploaderUtilities, "suggestionReasonForSuggestionLayout:", v5));
  }
  else
  {
    objc_msgSend(v3, "startingStackChangeEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "_sourceKeyOfNonProactiveWidgetRotationForReason:", v5);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_sourceKeyOfNonProactiveWidgetRotationForReason:(id)a3
{
  id v3;
  void *v4;
  char v5;
  const __CFString *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  char v14;

  v3 = a3;
  NSStringForATXHomeScreenStackChangeReason();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    NSStringForATXHomeScreenStackChangeReason();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "isEqualToString:", v7);

    if ((v8 & 1) != 0)
    {
      v6 = CFSTR("NonProactiveSystemFallback");
      goto LABEL_12;
    }
    NSStringForATXHomeScreenStackChangeReason();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToString:", v9) & 1) == 0)
    {
      NSStringForATXHomeScreenStackChangeReason();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v3, "isEqualToString:", v10) & 1) == 0)
      {
        NSStringForATXHomeScreenStackChangeReason();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqualToString:", v11))
        {
          NSStringForATXHomeScreenStackChangeReason();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v3, "isEqualToString:", v13);

          if ((v14 & 1) == 0)
          {
            v6 = CFSTR("NonProactiveOther");
            goto LABEL_12;
          }
          goto LABEL_11;
        }

      }
    }

LABEL_11:
    v6 = CFSTR("NonProactiveNonProactiveStackEdited");
    goto LABEL_12;
  }
  v6 = CFSTR("NonProactiveUserScroll");
LABEL_12:

  return (id)v6;
}

+ (id)_suggestionReasonToWidgetRotationDictionariesSourceKey:(int)a3
{
  if ((a3 - 1) > 7)
    return CFSTR("ProactiveStalenessRotation");
  else
    return off_1E82DA878[a3 - 1];
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
  v3 = self->_widgetRotationDictionaries;
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
        -[NSMutableDictionary objectForKeyedSubscript:](self->_widgetRotationDictionaries, "objectForKeyedSubscript:", v9, v12, (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        __atxlog_handle_home_screen();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v12;
          v18 = v9;
          v19 = 2112;
          v20 = v10;
          _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_INFO, "ATXHomeScreenLogUploader: Widget rotation dictionary for %@: %@", buf, 0x16u);
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
  v4 = self->_widgetRotationDictionaries;
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
        -[NSMutableDictionary objectForKeyedSubscript:](self->_widgetRotationDictionaries, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Widget Rotation Dictionary For %@"), v9);
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
  objc_storeStrong((id *)&self->_widgetRotationDictionaries, 0);
}

- (void)_widgetRotationDictionaryForWidgetBundleId:(os_log_t)log kind:size:source:location:isNPlusOne:isFirstRotationToNPlusOne:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "ATXHomeScreenLogUploader: unable to get widget rotation dictionary because missing widgetId (%@) or kind (%@)", (uint8_t *)&v3, 0x16u);
}

@end
