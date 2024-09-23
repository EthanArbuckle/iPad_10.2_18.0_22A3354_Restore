@implementation ATXSuggestionPreprocessor

- (ATXSuggestionPreprocessor)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ATXSuggestionPreprocessor *v7;

  objc_msgSend(MEMORY[0x1E0CF8DF8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXNotificationsLoggingServer sharedInstance](ATXNotificationsLoggingServer, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXLockscreenBlacklist sharedInstance](ATXLockscreenBlacklist, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v7 = -[ATXSuggestionPreprocessor initWithEngagementRecordManager:notificationsLoggingServer:lockscreenBlacklist:actionToWidgetConverter:](self, "initWithEngagementRecordManager:notificationsLoggingServer:lockscreenBlacklist:actionToWidgetConverter:", v3, v4, v5, v6);

  return v7;
}

- (ATXSuggestionPreprocessor)initWithEngagementRecordManager:(id)a3 notificationsLoggingServer:(id)a4 lockscreenBlacklist:(id)a5 actionToWidgetConverter:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ATXSuggestionPreprocessor *v15;
  ATXSuggestionPreprocessor *v16;
  uint64_t v17;
  ATXBlendingLayerHyperParameters *hyperParameters;
  uint64_t v19;
  ATXSuggestionModeFilter *modeFilter;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)ATXSuggestionPreprocessor;
  v15 = -[ATXSuggestionPreprocessor init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_converter, a6);
    objc_storeStrong((id *)&v16->_notificationsLoggingServer, a4);
    objc_storeStrong((id *)&v16->_lockscreenBlacklist, a5);
    objc_storeStrong((id *)&v16->_engagementRecordManager, a3);
    objc_msgSend(MEMORY[0x1E0D80CD0], "sharedInstance");
    v17 = objc_claimAutoreleasedReturnValue();
    hyperParameters = v16->_hyperParameters;
    v16->_hyperParameters = (ATXBlendingLayerHyperParameters *)v17;

    +[ATXSuggestionModeFilter sharedInstance](ATXSuggestionModeFilter, "sharedInstance");
    v19 = objc_claimAutoreleasedReturnValue();
    modeFilter = v16->_modeFilter;
    v16->_modeFilter = (ATXSuggestionModeFilter *)v19;

    -[ATXSuggestionModeFilter registerObserver:](v16->_modeFilter, "registerObserver:", v16);
    -[ATXSuggestionModeFilter registerForModeChanges](v16->_modeFilter, "registerForModeChanges");
  }

  return v16;
}

- (id)suggestionsWithInvalidSuggestionsRemoved:(id)a3
{
  void *v4;
  void *v5;

  -[ATXSuggestionPreprocessor filterOutSuggestionsForUninstalledOrRestrictedApps:](self, "filterOutSuggestionsForUninstalledOrRestrictedApps:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSuggestionPreprocessor filterOutRecentlyEngagedSuggestions:](self, "filterOutRecentlyEngagedSuggestions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)filterOutRecentlyEngagedSuggestions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *);
  void *v17;
  ATXSuggestionPreprocessor *v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_blending();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v21 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Blending: Blending Layer is removing recently engaged suggestions. # suggestions at start: %lu", buf, 0xCu);
  }

  -[ATXEngagementRecordManager engagedExecutablesOfType:queryOptions:](self->_engagementRecordManager, "engagedExecutablesOfType:queryOptions:", 3, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXEngagementRecordManager engagedExecutablesOfType:queryOptions:](self->_engagementRecordManager, "engagedExecutablesOfType:queryOptions:", 120, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v8, "unionSet:", v7);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __65__ATXSuggestionPreprocessor_filterOutRecentlyEngagedSuggestions___block_invoke;
  v17 = &unk_1E82DE008;
  v18 = self;
  v19 = v8;
  v9 = v8;
  objc_msgSend(v4, "_pas_filteredArrayWithTest:", &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_blending();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(v10, "count", v14, v15, v16, v17, v18, v19);
    *(_DWORD *)buf = 134217984;
    v21 = v12;
    _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "Blending: Blending Layer is done removing recently engaged suggestions. # suggestions at end: %lu", buf, 0xCu);
  }

  return v10;
}

uint64_t __65__ATXSuggestionPreprocessor_filterOutRecentlyEngagedSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "hasEngagedWithSuggestion:engagedExecutables:", v3, *(_QWORD *)(a1 + 40));
  if (v4)
  {
    __atxlog_handle_blending();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Blending: Blending layer has filtered out recently engaged suggestion: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  return v4 ^ 1u;
}

- (id)filterOutSuggestionsForUninstalledOrRestrictedApps:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
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
  id v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_blending();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v33 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Blending: Blending Layer is removing suggestions for unsupported apps. # suggestions at start: %lu", buf, 0xCu);
  }

  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = (void *)CFPreferencesCopyValue(CFSTR("SBSearchSuggestAppDisabled"), CFSTR("com.apple.spotlightui"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_opt_new();
  v10 = v9;

  v11 = (void *)objc_msgSend(v6, "initWithArray:", v10);
  objc_msgSend(MEMORY[0x1E0CF8CD8], "hiddenOrLockedBundleIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0C99E60]);
  +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allInstalledAppsKnownToSpringBoard");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithArray:", v15);

  +[ATXDigitalHealthBlacklist sharedInstance](ATXDigitalHealthBlacklist, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "blacklistedBundleIds");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __80__ATXSuggestionPreprocessor_filterOutSuggestionsForUninstalledOrRestrictedApps___block_invoke;
  v27[3] = &unk_1E82E4728;
  v27[4] = self;
  v28 = v18;
  v29 = v11;
  v30 = v12;
  v31 = v16;
  v19 = v16;
  v20 = v12;
  v21 = v11;
  v22 = v18;
  objc_msgSend(v4, "_pas_filteredArrayWithTest:", v27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_blending();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = objc_msgSend(v23, "count");
    *(_DWORD *)buf = 134217984;
    v33 = v25;
    _os_log_impl(&dword_1C9A3B000, v24, OS_LOG_TYPE_DEFAULT, "Blending: Blending Layer is done removing suggestions for unsupported apps. # suggestions at end: %lu", buf, 0xCu);
  }

  return v23;
}

uint64_t __80__ATXSuggestionPreprocessor_filterOutSuggestionsForUninstalledOrRestrictedApps___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v8;
  const char *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "bundleIdAssociatedWithSuggestion:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ATXBundleIdReplacementForBundleId();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || (ATXBundleIdIsFakeContainerBundleId() & 1) != 0)
    goto LABEL_3;
  if (objc_msgSend(MEMORY[0x1E0CF8CE8], "isAppClipWebClipBundleId:", v5))
  {
    v6 = objc_msgSend(MEMORY[0x1E0CF8CE8], "isWebClipInstalledWithBundleId:", v5);
    goto LABEL_4;
  }
  if ((objc_msgSend(MEMORY[0x1E0CF8CE8], "isSwiftPlaygroundsBundle:", v5) & 1) != 0)
  {
LABEL_19:
    v6 = 0;
    goto LABEL_4;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v5))
  {
    __atxlog_handle_blending();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v5;
      v9 = "Removed suggestion for %@ because it is blocked by ScreenTime";
LABEL_17:
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0xCu);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "shouldFilterOutSuggestion:withBundleId:fromAppsThatCannotBeSuggested:fromAppsWhoseContentsCannotBeSuggested:", v3, v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56)))
  {
    __atxlog_handle_blending();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v5;
      v9 = "Removed suggestion for %@ because it is locked or hidden by user preference";
      goto LABEL_17;
    }
LABEL_18:

    goto LABEL_19;
  }
  if ((objc_msgSend(*(id *)(a1 + 64), "containsObject:", v5) & 1) == 0)
  {
    __atxlog_handle_blending();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v5;
      v9 = "Removed suggestion for %@ because app is no longer installed.";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
LABEL_3:
  v6 = 1;
LABEL_4:

  return v6;
}

+ (id)bundleIdAssociatedWithSuggestion:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v20;

  v3 = a3;
  objc_msgSend(v3, "executableSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "executableType");

  objc_msgSend(v3, "executableSpecification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 != 1)
  {
    v10 = objc_msgSend(v6, "executableType");

    if (v10 == 2)
    {
      objc_msgSend(v3, "atxActionExecutableObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "executableSpecification");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "executableType");

      if (v14 == 3)
      {
        objc_msgSend(v3, "atxInfoSuggestionExecutableObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appBundleIdentifier");
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      objc_msgSend(v3, "executableSpecification");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "executableType");

      objc_msgSend(v3, "executableSpecification");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v16 == 6)
      {
        objc_msgSend(v17, "executableObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_3;
        objc_msgSend(v8, "bundleID");
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v9 = (void *)v12;
        goto LABEL_13;
      }
      v20 = objc_msgSend(v17, "executableType");

      if (v20 != 10)
      {
        v8 = 0;
        goto LABEL_14;
      }
      objc_msgSend(v3, "linkActionExecutableObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v11;
    objc_msgSend(v11, "bundleId");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  objc_msgSend(v6, "executableObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_3:
    v9 = 0;
LABEL_13:

    v8 = v9;
  }
LABEL_14:

  return v8;
}

+ (id)contactIdsAssociatedWithSuggestion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;

  v4 = a3;
  objc_msgSend(v4, "executableSpecification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "executableType");

  if (v6 == 2)
  {
    objc_msgSend(v4, "atxActionExecutableObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "intent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    objc_msgSend(v7, "intent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v10, "recipients");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = &__block_literal_global_119;
LABEL_10:
      objc_msgSend(v12, "_pas_mappedArrayWithTransform:", v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v20);
      goto LABEL_14;
    }
    objc_opt_class();
    v19 = objc_opt_isKindOfClass();

    if ((v19 & 1) != 0)
    {
      objc_msgSend(v7, "intent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "contacts");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = &__block_literal_global_25;
      goto LABEL_10;
    }
LABEL_12:
    v18 = 0;
LABEL_15:

    goto LABEL_16;
  }
  objc_msgSend(v4, "executableSpecification");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "executableType");

  if (v16 == 3)
  {
    objc_msgSend(v4, "atxInfoSuggestionExecutableObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "widgetBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.PeopleViewService.PeopleWidget-iOS")))
    {
      v18 = 0;
      goto LABEL_14;
    }
    objc_msgSend(v7, "intent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v7, "intent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "contactIdsAssociatedWithContactsWidgetIntent:", v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

      goto LABEL_15;
    }
    goto LABEL_12;
  }
  v18 = 0;
LABEL_16:

  return v18;
}

uint64_t __64__ATXSuggestionPreprocessor_contactIdsAssociatedWithSuggestion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contactIdentifier");
}

uint64_t __64__ATXSuggestionPreprocessor_contactIdsAssociatedWithSuggestion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contactIdentifier");
}

+ (id)contactIdsAssociatedWithContactsWidgetIntent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "atx_nonNilParametersByName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("person"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v9);

    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("people"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = v6;
    v23 = v3;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v15);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v17 = v16;
            objc_msgSend(v17, "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              objc_msgSend(v17, "identifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "addObject:", v19);

            }
          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v13);
    }

    v6 = v22;
    v3 = v23;
  }
  v20 = (void *)objc_msgSend(v4, "copy", v22, v23, (_QWORD)v24);

  return v20;
}

- (BOOL)shouldFilterOutSuggestion:(id)a3 withBundleId:(id)a4 fromAppsThatCannotBeSuggested:(id)a5 fromAppsWhoseContentsCannotBeSuggested:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  uint64_t v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v9, "executableSpecification");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "executableType");

  if (v14 == 1)
  {
    v15 = v11;
    goto LABEL_10;
  }
  objc_msgSend(v9, "executableSpecification");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "executableType") != 3)
  {
    objc_msgSend(v9, "executableSpecification");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "executableType") != 2)
    {
      objc_msgSend(v9, "executableSpecification");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "executableType") != 6)
      {
        objc_msgSend(v9, "executableSpecification");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "executableType");

        if (v21 != 10)
          goto LABEL_13;
        goto LABEL_9;
      }

    }
  }

LABEL_9:
  v15 = v12;
LABEL_10:
  if ((objc_msgSend(v15, "containsObject:", v10) & 1) == 0)
  {
LABEL_13:
    v19 = 0;
    goto LABEL_14;
  }
  v19 = 1;
LABEL_14:

  return v19;
}

- (id)suggestionsByPreprocessingRankedSuggestions:(id)a3 forConsumerSubType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  _QWORD v37[5];
  id v38;
  id v39;
  _QWORD v40[5];
  char v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[5];
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v4 = a4;
  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  __atxlog_handle_blending();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v6, "count");
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v46 = v8;
    v47 = 2114;
    v48 = v9;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "Blending: Preprocessing %lu suggestions for consumer subtype: %{public}@", buf, 0x16u);

  }
  v10 = (void *)objc_msgSend(v6, "mutableCopy");
  if ((int)v4 <= 30)
  {
    if ((_DWORD)v4 == 9 || (_DWORD)v4 == 21)
    {
      -[ATXEngagementRecordManager engagedExecutablesOfType:queryOptions:](self->_engagementRecordManager, "engagedExecutablesOfType:queryOptions:", 32, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __92__ATXSuggestionPreprocessor_suggestionsByPreprocessingRankedSuggestions_forConsumerSubType___block_invoke_38;
      v42[3] = &unk_1E82DE008;
      v42[4] = self;
      v43 = v22;
      v23 = v22;
      objc_msgSend(v10, "_pas_filteredArrayWithTest:", v42);
      v24 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v24;
    }
    else if ((_DWORD)v4 == 22)
    {
      -[ATXNotificationsLoggingServer getLockscreenBundleIds](self->_notificationsLoggingServer, "getLockscreenBundleIds");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
        v19 = v17;
      else
        v19 = (id)objc_opt_new();
      v26 = v19;

      -[ATXLockscreenBlacklist blacklist](self->_lockscreenBlacklist, "blacklist");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v27)
        v29 = v27;
      else
        v29 = (id)objc_opt_new();
      v30 = v29;

      if (-[ATXLockscreenBlacklist isPredictionGloballyDisabled](self->_lockscreenBlacklist, "isPredictionGloballyDisabled"))
      {

        __atxlog_handle_blending();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C9A3B000, v31, OS_LOG_TYPE_DEFAULT, "Blending: Filtering out all suggestions for lockscreen because lockscreen predictions are globally disabled", buf, 2u);
        }

        v10 = (void *)MEMORY[0x1E0C9AA60];
      }
      else
      {
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __92__ATXSuggestionPreprocessor_suggestionsByPreprocessingRankedSuggestions_forConsumerSubType___block_invoke_42;
        v37[3] = &unk_1E82E47D8;
        v37[4] = self;
        v38 = v26;
        v39 = v30;
        objc_msgSend(v10, "_pas_filteredArrayWithTest:", v37);
        v32 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v32;
      }

    }
  }
  else
  {
    if ((int)v4 <= 40)
    {
      if ((_DWORD)v4 != 31)
      {
        if ((_DWORD)v4 != 34)
          goto LABEL_37;
        __atxlog_handle_blending();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "Blending: Preprocessing suggestions for Home Screen.", buf, 2u);
        }

        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __92__ATXSuggestionPreprocessor_suggestionsByPreprocessingRankedSuggestions_forConsumerSubType___block_invoke;
        v44[3] = &unk_1E82DE058;
        v44[4] = self;
        objc_msgSend(v10, "_pas_filteredArrayWithTest:", v44);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        __atxlog_handle_blending();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = objc_msgSend(v10, "count");
          *(_DWORD *)buf = 134217984;
          v46 = v14;
          _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "ATXActionToWidgetConverter: Converting valid action suggestions to widget suggestions for %lu suggestions.", buf, 0xCu);
        }

        -[ATXActionToWidgetConverter convertSuggestions:](self->_converter, "convertSuggestions:", v12);
        v15 = objc_claimAutoreleasedReturnValue();

        __atxlog_handle_blending();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_DEFAULT, "ATXActionToWidgetConverter: Finished converting valid action suggestions to widget suggestions.", buf, 2u);
        }

        goto LABEL_26;
      }
      -[ATXSuggestionPreprocessor preprocessedSuggestionsForAppSwitcherConsumer:](self, "preprocessedSuggestionsForAppSwitcherConsumer:", v10);
      v25 = objc_claimAutoreleasedReturnValue();
LABEL_25:
      v15 = v25;

LABEL_26:
      v10 = (void *)v15;
      goto LABEL_37;
    }
    if ((_DWORD)v4 == 41)
    {
      -[ATXSuggestionPreprocessor preprocessedSuggestionsForMediaControlsConsumer:](self, "preprocessedSuggestionsForMediaControlsConsumer:", v10);
      v25 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
    if ((_DWORD)v4 == 42)
    {
      v20 = (void *)objc_opt_new();
      objc_msgSend(v20, "convertSuggestions:", v10);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __92__ATXSuggestionPreprocessor_suggestionsByPreprocessingRankedSuggestions_forConsumerSubType___block_invoke_2;
      v40[3] = &unk_1E82E47B0;
      v40[4] = self;
      v41 = 42;
      objc_msgSend(v21, "_pas_filteredArrayWithTest:", v40);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_37:
  __atxlog_handle_blending();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = objc_msgSend(v10, "count");
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v46 = v34;
    v47 = 2114;
    v48 = v35;
    _os_log_impl(&dword_1C9A3B000, v33, OS_LOG_TYPE_DEFAULT, "Blending: Finished preprocessing. Left with %lu suggestions for consumer subtype: %{public}@", buf, 0x16u);

  }
  return v10;
}

uint64_t __92__ATXSuggestionPreprocessor_suggestionsByPreprocessingRankedSuggestions_forConsumerSubType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint8_t v11[16];

  v3 = a2;
  objc_msgSend(v3, "executableSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "executableType") != 1)
    goto LABEL_8;
  objc_msgSend(v3, "scoreSpecification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "suggestedConfidenceCategory") <= 2)
  {

LABEL_8:
    goto LABEL_9;
  }
  objc_msgSend(v3, "bundleIdExecutableObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mobilesafari"));

  if (!v7)
  {
LABEL_9:
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "uiSupportsSuggestion:consumerSubType:", v3, 34) & 1) != 0
      || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "uiSupportsSuggestion:consumerSubType:", v3, 37) & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "uiSupportsSuggestion:consumerSubType:", v3, 36);
    }
    goto LABEL_13;
  }
  __atxlog_handle_blending();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "Blending: Disallowing medium or high confidence Safari app prediction on Home Screen", v11, 2u);
  }

  v9 = 0;
LABEL_13:

  return v9;
}

uint64_t __92__ATXSuggestionPreprocessor_suggestionsByPreprocessingRankedSuggestions_forConsumerSubType___block_invoke_38(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "hasEngagedWithSuggestion:engagedExecutables:", a2, *(_QWORD *)(a1 + 40)) ^ 1;
}

uint64_t __92__ATXSuggestionPreprocessor_suggestionsByPreprocessingRankedSuggestions_forConsumerSubType___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;

  v3 = a2;
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "uiSupportsSuggestion:consumerSubType:", v3, 42))goto LABEL_8;
  objc_msgSend(v3, "executableSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executableClassString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
  {
    objc_msgSend(v3, "executableSpecification");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "executableObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "bundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.facetime"));

    if ((v12 & 1) == 0)
    {
      __atxlog_handle_blending();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __92__ATXSuggestionPreprocessor_suggestionsByPreprocessingRankedSuggestions_forConsumerSubType___block_invoke_2_cold_1(a1, (uint64_t)v3, v13);

    }
  }
  else
  {
LABEL_8:
    v12 = 0;
  }

  return v12;
}

uint64_t __92__ATXSuggestionPreprocessor_suggestionsByPreprocessingRankedSuggestions_forConsumerSubType___block_invoke_42(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  char v9;
  _BOOL4 v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "uiSupportsSuggestion:consumerSubType:", v3, 22))
  {
    objc_msgSend(v3, "atxActionExecutableObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      __atxlog_handle_blending();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __92__ATXSuggestionPreprocessor_suggestionsByPreprocessingRankedSuggestions_forConsumerSubType___block_invoke_42_cold_1((uint64_t)v3, v6);
      goto LABEL_19;
    }
    if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v5))
    {
      __atxlog_handle_blending();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v3;
        v7 = "Blending: Filtering out lockscreen suggestion because a notification from that app is already on the lockscreen: %@";
LABEL_18:
        _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v12, 0xCu);
      }
    }
    else if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v5))
    {
      __atxlog_handle_blending();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v3;
        v7 = "Blending: Filtering out lockscreen suggestion because the app is in the lockscreen blacklist: %@";
        goto LABEL_18;
      }
    }
    else
    {
      v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "currentModeConfigurationAllowsSuggestion:", v3);
      __atxlog_handle_blending();
      v6 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if ((v9 & 1) != 0)
      {
        if (v10)
        {
          v12 = 138412290;
          v13 = v3;
          _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "Blending: Preprocessing allowing suggestion on lockscreen: %@", (uint8_t *)&v12, 0xCu);
        }
        v8 = 1;
        goto LABEL_20;
      }
      if (v10)
      {
        v12 = 138412290;
        v13 = v3;
        v7 = "Blending: Filtering out lockscreen suggestion because the app is not allowed in the current mode: %@";
        goto LABEL_18;
      }
    }
LABEL_19:
    v8 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v8 = 0;
LABEL_21:

  return v8;
}

- (id)preprocessedSuggestionsForMediaControlsConsumer:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_filteredArrayWithTest:", &__block_literal_global_43_3);
}

uint64_t __77__ATXSuggestionPreprocessor_preprocessedSuggestionsForMediaControlsConsumer___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;

  v2 = a2;
  objc_msgSend(v2, "executableSpecification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "executableType");

  if (v4 == 2)
  {
    objc_msgSend(v2, "executableSpecification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "executableObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "intent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)preprocessedSuggestionsForAppSwitcherConsumer:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__ATXSuggestionPreprocessor_preprocessedSuggestionsForAppSwitcherConsumer___block_invoke;
  v4[3] = &unk_1E82DE058;
  v4[4] = self;
  objc_msgSend(a3, "_pas_filteredArrayWithTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __75__ATXSuggestionPreprocessor_preprocessedSuggestionsForAppSwitcherConsumer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "executableSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executableObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "uiSpecification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "predictionReasons");

  v8 = 0;
  if (v7 && v7 != 1024 && v7 != 0x20000)
  {
    objc_msgSend(v3, "scoreSpecification");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "suggestedConfidenceCategory");

    if (v10 > 3)
    {
      v8 = 1;
    }
    else if ((v7 & 0x54) != 0)
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "_bundleSupportsINPlayMediaIntentForBundleId:fromUnitTest:", v5, 0);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)_bundleSupportsINPlayMediaIntentForBundleId:(id)a3 fromUnitTest:(BOOL)a4
{
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  NSObject *v12;
  const char *v13;
  BOOL v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CF8CE8], "appInfoForBundle:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "supportedActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v7);

  if ((v9 & 1) != 0)
  {
    if (a4
      || (objc_msgSend(v5, "actionsRestrictedWhileLocked"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "containsObject:", v7),
          v10,
          !v11))
    {
      v14 = 1;
      goto LABEL_11;
    }
    __atxlog_handle_pmm();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v7;
      v13 = "Prediction does not support %@ handling while device is locked.";
LABEL_8:
      _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    __atxlog_handle_pmm();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v7;
      v13 = "Prediction does not support %@.";
      goto LABEL_8;
    }
  }

  v14 = 0;
LABEL_11:

  return v14;
}

- (void)configurationDidChangeForFilter:(id)a3
{
  objc_msgSend(MEMORY[0x1E0D81198], "refreshBlendingLayerWithReason:", CFSTR("Updated configuration in mode filter"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeFilter, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_lockscreenBlacklist, 0);
  objc_storeStrong((id *)&self->_notificationsLoggingServer, 0);
  objc_storeStrong((id *)&self->_engagementRecordManager, 0);
  objc_storeStrong((id *)&self->_converter, 0);
}

void __92__ATXSuggestionPreprocessor_suggestionsByPreprocessingRankedSuggestions_forConsumerSubType___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", *(unsigned __int8 *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_DEBUG, "Suppressing people suggestion for %@ because the bundleId isn't FaceTime. Suggestion: %@", (uint8_t *)&v6, 0x16u);

}

void __92__ATXSuggestionPreprocessor_suggestionsByPreprocessingRankedSuggestions_forConsumerSubType___block_invoke_42_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "Blending: Filtering out lockscreen suggestion because unable to get actionBundleId: %@", (uint8_t *)&v2, 0xCu);
}

@end
