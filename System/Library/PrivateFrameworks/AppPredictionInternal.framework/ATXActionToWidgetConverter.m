@implementation ATXActionToWidgetConverter

- (ATXActionToWidgetConverter)init
{
  return -[ATXActionToWidgetConverter initWithAllowsSendMessageIntentConversion:](self, "initWithAllowsSendMessageIntentConversion:", 1);
}

- (ATXActionToWidgetConverter)initWithAllowsSendMessageIntentConversion:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ATXActionToWidgetConverter *v10;

  v3 = a3;
  +[ATXIntentMetadataCache sharedInstance](ATXIntentMetadataCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF9210], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CF8DF8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v10 = -[ATXActionToWidgetConverter initWithIntentMetadataCache:widgetDescriptorCache:infoConfidenceMapper:engagementRecordManager:metadataProvider:allowsSendMessageIntentConversion:](self, "initWithIntentMetadataCache:widgetDescriptorCache:infoConfidenceMapper:engagementRecordManager:metadataProvider:allowsSendMessageIntentConversion:", v5, v6, v7, v8, v9, v3);

  return v10;
}

- (ATXActionToWidgetConverter)initWithIntentMetadataCache:(id)a3 widgetDescriptorCache:(id)a4 infoConfidenceMapper:(id)a5 engagementRecordManager:(id)a6 metadataProvider:(id)a7 allowsSendMessageIntentConversion:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  ATXActionToWidgetConverter *v18;
  ATXActionToWidgetConverter *v19;
  id v22;
  objc_super v23;

  v22 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)ATXActionToWidgetConverter;
  v18 = -[ATXActionToWidgetConverter init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_descriptorCache, a4);
    objc_storeStrong((id *)&v19->_intentMetadataCache, a3);
    objc_storeStrong((id *)&v19->_infoConfidenceMapper, a5);
    objc_storeStrong((id *)&v19->_engagementRecordManager, a6);
    objc_storeStrong((id *)&v19->_metadataProvider, a7);
    v19->_allowsSendMessageIntentConversion = a8;
  }

  return v19;
}

- (id)convertSuggestions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __int128 v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  ATXActionToWidgetConverter *v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v4;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v30;
    *(_QWORD *)&v7 = 138412546;
    v23 = v7;
    v24 = self;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v30 != v26)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v9, "atxActionExecutableObject", v23);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          -[ATXActionToWidgetConverter _infoSuggestionForAction:](self, "_infoSuggestionForAction:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = 0;
        }
        objc_msgSend(v9, "linkActionExecutableObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          -[ATXActionToWidgetConverter _infoSuggestionForLinkActionContainer:](self, "_infoSuggestionForLinkActionContainer:", v12);
          v13 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v13;
        }
        if (v11)
        {
          -[ATXActionToWidgetConverter _convertedSuggestionFromInfoSuggestion:originalSuggestion:](self, "_convertedSuggestionFromInfoSuggestion:originalSuggestion:", v11, v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v15 = v6;
            __atxlog_handle_blending();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v23;
              v34 = v9;
              v35 = 2112;
              v36 = v14;
              _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_DEFAULT, "ATXActionToWidgetConverter: Converted action suggestion: %@, to widget suggestion: %@", buf, 0x16u);
            }

            objc_msgSend(v14, "clientModelSpecification");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "clientModelId");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v5, "objectForKeyedSubscript:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v19)
            {
              v20 = (void *)objc_opt_new();
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, v18);

            }
            objc_msgSend(v5, "objectForKeyedSubscript:", v18);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v14);

            v6 = v15;
            objc_msgSend(v15, "addObject:", v14);

            self = v24;
          }

        }
        objc_msgSend(v6, "addObject:", v9);

      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v27);
  }

  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __49__ATXActionToWidgetConverter_convertSuggestions___block_invoke;
  v28[3] = &unk_1E82DB1F8;
  v28[4] = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v28);

  return v6;
}

uint64_t __49__ATXActionToWidgetConverter_convertSuggestions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "updateForClientModelCacheUpdate:clientModelId:", a3, a2);
}

- (id)_infoSuggestionForLinkActionContainer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  LNMetadataProvider *metadataProvider;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  objc_class *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v24;

  v4 = a3;
  objc_msgSend(v4, "cachedAppIntent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "cachedAppIntent");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    metadataProvider = self->_metadataProvider;
    objc_msgSend(v4, "bundleId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "action");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    -[LNMetadataProvider actionForBundleIdentifier:andActionIdentifier:error:](metadataProvider, "actionForBundleIdentifier:andActionIdentifier:error:", v8, v10, &v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v24;

    if (v6 || !v11)
    {
      __atxlog_handle_blending();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[ATXActionToWidgetConverter _infoSuggestionForLinkActionContainer:].cold.1((uint64_t)v4, (uint64_t)v6, v17);
      v22 = 0;
      goto LABEL_12;
    }
    v12 = objc_alloc(MEMORY[0x1E0CBD738]);
    objc_msgSend(v4, "bundleId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "action");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v12, "initWithAppBundleIdentifier:linkAction:linkActionMetadata:", v13, v14, v11);

    objc_msgSend(v4, "setCachedAppIntent:", v6);
  }
  -[ATXActionToWidgetConverter _widgetForIntent:](self, "_widgetForIntent:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v15 = (objc_class *)MEMORY[0x1E0D81150];
    v6 = v6;
    v16 = [v15 alloc];
    objc_msgSend(v6, "launchId");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "extensionBundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "kind");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v11, "atx_layoutOptions");
    objc_msgSend(v6, "appIntentIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v16, "initWithAppBundleIdentifier:widgetBundleIdentifier:widgetKind:criterion:applicableLayouts:suggestionIdentifier:startDate:endDate:intent:metadata:relevanceScore:", v17, v18, v19, &stru_1E82FDC98, v20, v21, 0, 0, v6, 0, 0);

LABEL_12:
    goto LABEL_13;
  }
  v22 = 0;
LABEL_13:

  return v22;
}

- (id)_infoSuggestionForAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "intent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v9 = 0;
    goto LABEL_13;
  }
  if (self->_allowsSendMessageIntentConversion)
  {
    objc_msgSend(v5, "launchId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) != 0)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[ATXActionToWidgetConverter _peopleInfoSuggestionForSendMessageIntent:action:](self, "_peopleInfoSuggestionForSendMessageIntent:action:", v6, v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          goto LABEL_13;
      }
    }
    else
    {

    }
  }
  -[ATXActionToWidgetConverter _widgetForIntent:](self, "_widgetForIntent:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    createInfoSuggestion(v4, v10, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

LABEL_13:
  return v9;
}

- (id)_widgetForIntent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || -[ATXIntentMetadataCache isEligibleForWidgetsForIntent:](self->_intentMetadataCache, "isEligibleForWidgetsForIntent:", v4))
  {
    -[ATXWidgetDescriptorCache homeScreenDescriptorForIntent:](self->_descriptorCache, "homeScreenDescriptorForIntent:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_blending();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412546;
        v17 = v5;
        v18 = 2112;
        v19 = v4;
        _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "ATXActionToWidgetConverter: Found descriptor %@ for eligible intent %@", (uint8_t *)&v16, 0x16u);
      }

      v8 = v5;
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[ATXActionToWidgetConverter _widgetForIntent:].cold.1((uint64_t)v4, v7, v9, v10, v11, v12, v13, v14);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_convertedSuggestionFromInfoSuggestion:(id)a3 originalSuggestion:(id)a4
{
  ATXInfoToBlendingConfidenceMapper *infoConfidenceMapper;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;

  infoConfidenceMapper = self->_infoConfidenceMapper;
  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "scoreSpecification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConfidenceLevel:", -[ATXInfoToBlendingConfidenceMapper minInfoConfidenceLevelForBlendingConfidenceCategory:](infoConfidenceMapper, "minInfoConfidenceLevelForBlendingConfidenceCategory:", objc_msgSend(v8, "suggestedConfidenceCategory")));

  v9 = (void *)MEMORY[0x1E0D81198];
  objc_msgSend(v6, "clientModelSpecification");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientModelId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "clientModelTypeFromClientModelId:", v11);

  v13 = objc_msgSend(MEMORY[0x1E0D81198], "actionConversionTypeForClientModelType:", v12);
  v14 = (void *)MEMORY[0x1E0D81150];
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientModelSpecification");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "clientModelVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scoreSpecification");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rawScore");
  v20 = v19;
  objc_msgSend(v6, "scoreSpecification");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "proactiveSuggestionForInfoSuggestion:withClientModelId:clientModelVersion:rawScore:confidenceCategory:", v7, v15, v17, objc_msgSend(v21, "suggestedConfidenceCategory"), v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)_peopleInfoSuggestionForSendMessageIntent:(id)a3 action:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a4;
  -[ATXActionToWidgetConverter _selectPersonIntentForSendMessageIntent:](self, "_selectPersonIntentForSendMessageIntent:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[ATXWidgetDescriptorCache homeScreenDescriptorForIntent:](self->_descriptorCache, "homeScreenDescriptorForIntent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      createInfoSuggestion(v6, v8, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      __atxlog_handle_blending();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[ATXActionToWidgetConverter _peopleInfoSuggestionForSendMessageIntent:action:].cold.1((uint64_t)v7, v10, v11, v12, v13, v14, v15, v16);

      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_selectPersonIntentForSendMessageIntent:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[2];
  const __CFString *v20;
  void *v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 == 1)
  {
    objc_msgSend(v3, "recipients");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();

    -[NSObject contactIdentifier](v7, "contactIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      __atxlog_handle_blending();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "ATXActionToWidgetConverter: Not converting INSendMessageIntent: no contact identifier", buf, 2u);
      }
      v14 = 0;
      goto LABEL_12;
    }
    v9 = objc_alloc(MEMORY[0x1E0CBD738]);
    v20 = CFSTR("person");
    -[NSObject contactIdentifier](v7, "contactIdentifier", CFSTR("identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = CFSTR("displayString");
    v19[0] = v10;
    -[NSObject displayName](v7, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v9, "initWithAppBundleIdentifier:appIntentIdentifier:serializedParameters:", CFSTR("com.apple.PeopleViewService"), CFSTR("SelectPersonIntent"), v13);

    if (!v14)
    {
      __atxlog_handle_blending();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[ATXActionToWidgetConverter _selectPersonIntentForSendMessageIntent:].cold.1(v15);
LABEL_12:

    }
  }
  else
  {
    __atxlog_handle_blending();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "recipients");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      v23 = objc_msgSend(v16, "count");
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "ATXActionToWidgetConverter: Not converting INSendMessageIntent: recipient count (%lu) is not 1", buf, 0xCu);

    }
    v14 = 0;
  }

  return v14;
}

+ (BOOL)isWidgetIntent:(id)a3 validConversionFromActionIntent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  Class v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  Class v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  Class v26;
  id v27;
  void *v28;
  id v29;
  void *v30;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "launchId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.PeopleViewService")) & 1) == 0)
  {

    goto LABEL_8;
  }
  objc_msgSend(v6, "launchId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.MobileSMS"));

  if (!v9)
  {
LABEL_8:
    v13 = objc_msgSend(v5, "atx_isEqualToIntent:", v6);
    goto LABEL_30;
  }
  v10 = NSClassFromString(CFSTR("INSendMessageIntent"));
  v11 = v6;
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v14 = v12;

  objc_msgSend(v14, "recipients");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16 == 1)
  {
    objc_msgSend(v14, "recipients");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contactIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = NSClassFromString(CFSTR("INAppIntent"));
      v21 = v5;
      if (v20)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v22 = v21;
        else
          v22 = 0;
      }
      else
      {
        v22 = 0;
      }
      v23 = v22;

      if (v23)
      {
        objc_msgSend(v23, "serializedParameters");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("person"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = NSClassFromString(CFSTR("NSDictionary"));
        v27 = v25;
        if (v26)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v28 = v27;
          else
            v28 = 0;
        }
        else
        {
          v28 = 0;
        }
        v29 = v28;

        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("identifier"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v19, "isEqualToString:", v30);
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

LABEL_30:
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenPages, 0);
  objc_storeStrong((id *)&self->_metadataProvider, 0);
  objc_storeStrong((id *)&self->_homeScreenConfigCache, 0);
  objc_storeStrong((id *)&self->_engagementRecordManager, 0);
  objc_storeStrong((id *)&self->_infoConfidenceMapper, 0);
  objc_storeStrong((id *)&self->_intentMetadataCache, 0);
  objc_storeStrong((id *)&self->_descriptorCache, 0);
}

- (void)_infoSuggestionForLinkActionContainer:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "ATXActionToWidgetConverter: error fetching metadata for link action (%@): %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_widgetForIntent:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXActionToWidgetConverter: Unable to find descriptor for eligible intent %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_peopleInfoSuggestionForSendMessageIntent:(uint64_t)a3 action:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXActionToWidgetConverter: Unable to find People widget descriptor for select person intent: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_selectPersonIntentForSendMessageIntent:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "ATXActionToWidgetConverter: could not create contacts SelectPersonIntent app intent", v1, 2u);
}

@end
