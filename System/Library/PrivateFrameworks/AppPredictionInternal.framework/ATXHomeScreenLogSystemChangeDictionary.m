@implementation ATXHomeScreenLogSystemChangeDictionary

- (ATXHomeScreenLogSystemChangeDictionary)init
{
  ATXHomeScreenLogSystemChangeDictionary *v2;
  ATXHomeScreenLogSystemChangeDictionary *v3;
  uint64_t v4;
  NSMutableDictionary *systemChangeDictionary;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXHomeScreenLogSystemChangeDictionary;
  v2 = -[ATXHomeScreenLogSystemChangeDictionary init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[ATXHomeScreenLogSystemChangeDictionary _createNewSystemChangeDictionary](v2, "_createNewSystemChangeDictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    systemChangeDictionary = v3->_systemChangeDictionary;
    v3->_systemChangeDictionary = (NSMutableDictionary *)v4;

  }
  return v3;
}

+ (id)systemChangeDictionaryAccumulatorKeys
{
  if (systemChangeDictionaryAccumulatorKeys_onceToken != -1)
    dispatch_once(&systemChangeDictionaryAccumulatorKeys_onceToken, &__block_literal_global_91);
  return (id)systemChangeDictionaryAccumulatorKeys_array;
}

void __79__ATXHomeScreenLogSystemChangeDictionary_systemChangeDictionaryAccumulatorKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[16];

  v2[15] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("DefaultStacksCreated");
  v2[1] = CFSTR("ManualStacksCreated");
  v2[2] = CFSTR("StacksRemoved");
  v2[3] = CFSTR("WidgetsAddedViaAppList");
  v2[4] = CFSTR("WidgetsAddedViaGallery");
  v2[5] = CFSTR("WidgetsRemoved");
  v2[6] = CFSTR("WidgetsAddedToStackInGallerySuggestions");
  v2[7] = CFSTR("WidgetsAddedToStackNotInGallerySuggestions");
  v2[8] = CFSTR("WidgetsRemovedFromStack");
  v2[9] = CFSTR("WidgetsRemovedFromHomeScreen");
  v2[10] = CFSTR("WidgetsOnHomeScreen");
  v2[11] = CFSTR("SuggestedWidgetsRemovedFromStack");
  v2[12] = CFSTR("SuggestedWidgetsFrom3PAppsRemovedFromStack");
  v2[13] = CFSTR("SuggestedWidgetsDismissed");
  v2[14] = CFSTR("SuggestedWidgetsFrom3PAppsDismissed");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 15);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)systemChangeDictionaryAccumulatorKeys_array;
  systemChangeDictionaryAccumulatorKeys_array = v0;

}

- (id)_createNewSystemChangeDictionary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXHomeScreenLogSystemChangeDictionary _fetchHasHadWidgetsOnHomeScreenUserDefault](self, "_fetchHasHadWidgetsOnHomeScreenUserDefault"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("HasHadWidgetsOnHomeScreen"));

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend((id)objc_opt_class(), "systemChangeDictionaryAccumulatorKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E83CC8F8, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v3;
}

- (void)updateSystemChangeSummaryForHomeScreenPages:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id obj;
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
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v27;
    v7 = *MEMORY[0x1E0CF9338];
    v18 = *MEMORY[0x1E0CF9338];
    v19 = *(_QWORD *)v27;
    do
    {
      v8 = 0;
      v20 = v5;
      do
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v8);
        if (objc_msgSend(v9, "pageIndex", v18, v19) != v7)
        {
          v24 = 0u;
          v25 = 0u;
          v22 = 0u;
          v23 = 0u;
          objc_msgSend(v9, "stacks");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "panels");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v23;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v23 != v15)
                  objc_enumerationMutation(v12);
                objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "widgets");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                +[ATXHomeScreenLogUploaderUtilities add:toDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "add:toDictionary:forKey:", objc_msgSend(v17, "count"), self->_systemChangeDictionary, CFSTR("WidgetsOnHomeScreen"));

              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            }
            while (v14);
          }

          v7 = v18;
          v6 = v19;
          v5 = v20;
        }
        ++v8;
      }
      while (v8 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v5);
  }

}

- (BOOL)_fetchHasHadWidgetsOnHomeScreenUserDefault
{
  id v2;
  void *v3;
  char v4;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  v4 = objc_msgSend(v3, "BOOLForKey:", *MEMORY[0x1E0CF9530]);

  return v4;
}

- (void)updateSystemChangeSummaryForHomeScreenEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSMutableDictionary *systemChangeDictionary;
  const __CFString *v9;
  void *v10;
  int v11;
  NSMutableDictionary *v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "eventTypeString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Unknown")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeScreenPageShown")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeScreenDisappeared")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("StackChanged")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("WidgetTapped")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("WidgetLongLook")) & 1) != 0)
  {
    goto LABEL_13;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("WidgetUserFeedback")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("UserStackConfigChanged")) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", CFSTR("DeviceLocked")) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", CFSTR("DeviceUnlocked")) & 1) != 0)
    {
      goto LABEL_13;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("PinnedWidgetAdded")) & 1) != 0)
    {

      objc_msgSend(v20, "metadata");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "isSuggestionInAddWidgetSheet");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "BOOLValue");

      systemChangeDictionary = self->_systemChangeDictionary;
      if (v7)
        v9 = CFSTR("WidgetsAddedViaGallery");
      else
        v9 = CFSTR("WidgetsAddedViaAppList");
      goto LABEL_23;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("PinnedWidgetDeleted")) & 1) != 0)
    {

      objc_msgSend(v20, "metadata");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXHomeScreenLogUploaderUtilities incrementDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "incrementDictionary:forKey:", self->_systemChangeDictionary, CFSTR("WidgetsRemoved"));
LABEL_20:
      objc_msgSend(v20, "stackLocation");
      if (!ATXStackLocationIsHomeScreen())
        goto LABEL_14;
      systemChangeDictionary = self->_systemChangeDictionary;
      v9 = CFSTR("WidgetsRemovedFromHomeScreen");
LABEL_23:
      +[ATXHomeScreenLogUploaderUtilities incrementDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "incrementDictionary:forKey:", systemChangeDictionary, v9);
      goto LABEL_14;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("SpecialPageAppeared")) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", CFSTR("SpecialPageDisappeared")) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", CFSTR("StackShown")) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", CFSTR("StackDisappeared")) & 1) != 0)
    {
LABEL_13:

      objc_msgSend(v20, "metadata");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("StackCreated")) & 1) != 0)
    {

      objc_msgSend(v20, "metadata");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "isSuggestionInAddWidgetSheet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "BOOLValue");

      v12 = self->_systemChangeDictionary;
      if (v11)
      {
        +[ATXHomeScreenLogUploaderUtilities incrementDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "incrementDictionary:forKey:", v12, CFSTR("DefaultStacksCreated"));
        objc_msgSend(v5, "widgetsInStack");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");
        v15 = self->_systemChangeDictionary;
        v16 = CFSTR("WidgetsAddedToStackInGallerySuggestions");
      }
      else
      {
        +[ATXHomeScreenLogUploaderUtilities incrementDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "incrementDictionary:forKey:", v12, CFSTR("ManualStacksCreated"));
        objc_msgSend(v5, "widgetsInStack");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");
        v15 = self->_systemChangeDictionary;
        v16 = CFSTR("WidgetsAddedToStackNotInGallerySuggestions");
      }
    }
    else
    {
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("StackDeleted")) & 1) == 0)
      {
        if ((objc_msgSend(v4, "isEqualToString:", CFSTR("WidgetAddedToStack")) & 1) != 0)
        {

          objc_msgSend(v20, "metadata");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "isSuggestionInAddWidgetSheet");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "BOOLValue");

          systemChangeDictionary = self->_systemChangeDictionary;
          if (v19)
            v9 = CFSTR("WidgetsAddedToStackInGallerySuggestions");
          else
            v9 = CFSTR("WidgetsAddedToStackNotInGallerySuggestions");
          goto LABEL_23;
        }
        if ((objc_msgSend(v4, "isEqualToString:", CFSTR("WidgetRemovedFromStack")) & 1) == 0)
        {
          if ((objc_msgSend(v4, "isEqualToString:", CFSTR("StackVisibilityChanged")) & 1) == 0
            && (objc_msgSend(v4, "isEqualToString:", CFSTR("AppAdded")) & 1) == 0)
          {
            objc_msgSend(v4, "isEqualToString:", CFSTR("AppRemoved"));
          }
          goto LABEL_13;
        }

        objc_msgSend(v20, "metadata");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXHomeScreenLogUploaderUtilities incrementDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "incrementDictionary:forKey:", self->_systemChangeDictionary, CFSTR("WidgetsRemovedFromStack"));
        -[ATXHomeScreenLogSystemChangeDictionary _logSuggestedWidgetDismissalWithEvent:](self, "_logSuggestedWidgetDismissalWithEvent:", v20);
        goto LABEL_20;
      }

      objc_msgSend(v20, "metadata");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXHomeScreenLogUploaderUtilities incrementDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "incrementDictionary:forKey:", self->_systemChangeDictionary, CFSTR("StacksRemoved"));
      objc_msgSend(v5, "widgetsInStack");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXHomeScreenLogUploaderUtilities add:toDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "add:toDictionary:forKey:", objc_msgSend(v17, "count"), self->_systemChangeDictionary, CFSTR("WidgetsRemovedFromStack"));

      objc_msgSend(v20, "stackLocation");
      if (!ATXStackLocationIsHomeScreen())
        goto LABEL_14;
      objc_msgSend(v5, "widgetsInStack");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");
      v15 = self->_systemChangeDictionary;
      v16 = CFSTR("WidgetsRemovedFromHomeScreen");
    }
    +[ATXHomeScreenLogUploaderUtilities add:toDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "add:toDictionary:forKey:", v14, v15, v16);

    goto LABEL_14;
  }

  objc_msgSend(v20, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ATXHomeScreenLogSystemChangeDictionary _suggestedWidgetWasExplicitlyDismissedWithEvent:](self, "_suggestedWidgetWasExplicitlyDismissedWithEvent:", v20))
  {
    -[ATXHomeScreenLogSystemChangeDictionary _logSuggestedWidgetExplicitDismissalWithEvent:](self, "_logSuggestedWidgetExplicitDismissalWithEvent:", v20);
    -[ATXHomeScreenLogSystemChangeDictionary _logSuggestedWidgetDismissalWithEvent:](self, "_logSuggestedWidgetDismissalWithEvent:", v20);
  }
LABEL_14:

}

- (BOOL)_suggestedWidgetWasExplicitlyDismissedWithEvent:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "reason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringForATXHomeScreenWidgetExplicitFeedback();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 == v4;

  return v5;
}

- (void)_logSuggestedWidgetExplicitDismissalWithEvent:(id)a3
{
  void *v4;
  BOOL v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "isSuggestedWidget"))
  {
    +[ATXHomeScreenLogUploaderUtilities incrementDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "incrementDictionary:forKey:", self->_systemChangeDictionary, CFSTR("SuggestedWidgetsDismissed"));
    objc_msgSend(v6, "appBundleId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[ATXHomeScreenLogUploaderUtilities isFirstPartyApp:](ATXHomeScreenLogUploaderUtilities, "isFirstPartyApp:", v4);

    if (!v5)
      +[ATXHomeScreenLogUploaderUtilities incrementDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "incrementDictionary:forKey:", self->_systemChangeDictionary, CFSTR("SuggestedWidgetsFrom3PAppsDismissed"));
  }

}

- (void)_logSuggestedWidgetDismissalWithEvent:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  BOOL v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "isSuggestedWidget"))
  {
    +[ATXHomeScreenLogUploaderUtilities incrementDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "incrementDictionary:forKey:", self->_systemChangeDictionary, CFSTR("SuggestedWidgetsRemovedFromStack"));
    objc_msgSend(v8, "appBundleId");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      objc_msgSend(v8, "appBundleId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = +[ATXHomeScreenLogUploaderUtilities isFirstPartyApp:](ATXHomeScreenLogUploaderUtilities, "isFirstPartyApp:", v6);

      if (!v7)
        +[ATXHomeScreenLogUploaderUtilities incrementDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "incrementDictionary:forKey:", self->_systemChangeDictionary, CFSTR("SuggestedWidgetsFrom3PAppsRemovedFromStack"));
    }
  }

}

- (void)sendToCoreAnalytics
{
  NSObject *v3;
  NSMutableDictionary *systemChangeDictionary;
  int v5;
  NSMutableDictionary *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_home_screen();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    systemChangeDictionary = self->_systemChangeDictionary;
    v5 = 138412290;
    v6 = systemChangeDictionary;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_INFO, "ATXHomeScreenLogUploader: System change dictionary: %@", (uint8_t *)&v5, 0xCu);
  }

  AnalyticsSendEvent();
}

- (id)dryRunResult
{
  NSMutableDictionary *systemChangeDictionary;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  systemChangeDictionary = self->_systemChangeDictionary;
  v4 = CFSTR("System Change Dictionary");
  v5[0] = systemChangeDictionary;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemChangeDictionary, 0);
}

@end
