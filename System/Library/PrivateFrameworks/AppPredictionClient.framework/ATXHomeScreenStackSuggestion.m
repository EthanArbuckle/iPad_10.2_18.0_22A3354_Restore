@implementation ATXHomeScreenStackSuggestion

- (ATXHomeScreenStackSuggestion)initWithStackIdentifier:(id)a3 layoutOfTopWidget:(id)a4 layoutOfSuggestedWidgets:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  ATXHomeScreenStackSuggestion *v19;
  ATXHomeScreenStackSuggestion *v20;
  uint64_t v21;
  ATXHomeScreenWidgetIdentifiable *topWidget;
  uint64_t v23;
  NSArray *topWidgetSuggestions;
  uint64_t v25;
  NSSet *suggestedWidgets;
  objc_super v28;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  +[ATXHomeScreenStackSuggestion _widgetAndSuggestionsFromSuggestionLayout:](ATXHomeScreenStackSuggestion, "_widgetAndSuggestionsFromSuggestionLayout:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXHomeScreenStackSuggestion _widgetsFromSuggestionLayouts:](ATXHomeScreenStackSuggestion, "_widgetsFromSuggestionLayouts:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "isNPlusOne"))
  {
    objc_msgSend(v12, "first");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      objc_msgSend(v12, "first");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v13, "containsObject:", v16);

      if ((v17 & 1) == 0)
      {
        __atxlog_handle_home_screen();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          -[ATXHomeScreenStackSuggestion initWithStackIdentifier:layoutOfTopWidget:layoutOfSuggestedWidgets:].cold.1(v12, v18);

      }
    }
  }
  v28.receiver = self;
  v28.super_class = (Class)ATXHomeScreenStackSuggestion;
  v19 = -[ATXHomeScreenStackSuggestion init](&v28, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_stackId, a3);
    objc_msgSend(v12, "first");
    v21 = objc_claimAutoreleasedReturnValue();
    topWidget = v20->_topWidget;
    v20->_topWidget = (ATXHomeScreenWidgetIdentifiable *)v21;

    objc_msgSend(v12, "second");
    v23 = objc_claimAutoreleasedReturnValue();
    topWidgetSuggestions = v20->_topWidgetSuggestions;
    v20->_topWidgetSuggestions = (NSArray *)v23;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
    v25 = objc_claimAutoreleasedReturnValue();
    suggestedWidgets = v20->_suggestedWidgets;
    v20->_suggestedWidgets = (NSSet *)v25;

    v20->_isLowConfidenceStackRotationForStaleStack = objc_msgSend(v10, "isLowConfidenceStackRotationForStaleStack");
  }

  return v20;
}

- (id)initForDebuggingWithStackIdentifier:(id)a3 topWidget:(id)a4 suggestedWidgets:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXHomeScreenStackSuggestion *v12;
  ATXHomeScreenStackSuggestion *v13;
  NSSet *v14;
  NSSet *suggestedWidgets;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ATXHomeScreenStackSuggestion;
  v12 = -[ATXHomeScreenStackSuggestion init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_stackId, a3);
    objc_storeStrong((id *)&v13->_topWidget, a4);
    if (v11)
      v14 = (NSSet *)v11;
    else
      v14 = (NSSet *)objc_opt_new();
    suggestedWidgets = v13->_suggestedWidgets;
    v13->_suggestedWidgets = v14;

  }
  return v13;
}

- (BOOL)isTopWidgetSuggestionsWidget
{
  void *v2;
  void *v3;
  char v4;

  -[ATXHomeScreenStackSuggestion topWidget](self, "topWidget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionBundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CF9480]);

  return v4;
}

- (ATXInfoSuggestion)topWidgetInfoSuggestion
{
  void *v2;
  void *v3;
  void *v4;

  -[ATXHomeScreenStackSuggestion topWidgetProactiveSuggestion](self, "topWidgetProactiveSuggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executableSpecification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executableObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (ATXInfoSuggestion *)v4;
}

- (ATXProactiveSuggestion)topWidgetProactiveSuggestion
{
  void *v3;

  if (-[ATXHomeScreenStackSuggestion isTopWidgetSuggestionsWidget](self, "isTopWidgetSuggestionsWidget"))
  {
    v3 = 0;
  }
  else
  {
    -[NSArray firstObject](self->_topWidgetSuggestions, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (ATXProactiveSuggestion *)v3;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  -[ATXHomeScreenStackSuggestion dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptionWithLocale:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dictionaryRepresentation
{
  ATXHomeScreenWidgetIdentifiable *topWidget;
  __CFString *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  topWidget = self->_topWidget;
  v9[0] = self->_stackId;
  v8[0] = CFSTR("stackId");
  v8[1] = CFSTR("topWidget");
  if (topWidget)
  {
    -[ATXHomeScreenWidgetIdentifiable dictionaryRepresentation](topWidget, "dictionaryRepresentation");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("nil");
  }
  v9[1] = v4;
  v8[2] = CFSTR("suggestedWidgets");
  -[NSSet description](self->_suggestedWidgets, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (topWidget)
  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = -[NSString hash](self->_stackId, "hash");
  v4 = -[ATXHomeScreenWidgetIdentifiable hash](self->_topWidget, "hash") - v3 + 32 * v3;
  v5 = -[NSSet hash](self->_suggestedWidgets, "hash") - v4 + 32 * v4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_topWidgetSuggestions;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "executableSpecification", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "executableIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v12, "hash") - v5 + 32 * v5;

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  ATXHomeScreenStackSuggestion *v4;
  id *v5;
  NSString *stackId;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  char v11;
  NSUInteger v12;
  NSArray *topWidgetSuggestions;
  id *v14;
  ATXHomeScreenWidgetIdentifiable *v15;
  ATXHomeScreenWidgetIdentifiable *v16;
  ATXHomeScreenWidgetIdentifiable *v17;
  BOOL v18;
  NSSet *v19;
  NSSet *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, uint64_t, _BYTE *);
  void *v25;
  id *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v4 = (ATXHomeScreenStackSuggestion *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      stackId = self->_stackId;
      v7 = (NSString *)v5[3];
      if (stackId == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = stackId;
        v10 = -[NSString isEqual:](v9, "isEqual:", v8);

        if ((v10 & 1) == 0)
          goto LABEL_14;
      }
      v12 = -[NSArray count](self->_topWidgetSuggestions, "count");
      if (v12 != objc_msgSend(v5[1], "count"))
      {
LABEL_14:
        v11 = 0;
LABEL_21:

        goto LABEL_22;
      }
      v28 = 0;
      v29 = &v28;
      v30 = 0x2020000000;
      v31 = 1;
      topWidgetSuggestions = self->_topWidgetSuggestions;
      v22 = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = __40__ATXHomeScreenStackSuggestion_isEqual___block_invoke;
      v25 = &unk_1E4D5A0E0;
      v14 = v5;
      v26 = v14;
      v27 = &v28;
      -[NSArray enumerateObjectsUsingBlock:](topWidgetSuggestions, "enumerateObjectsUsingBlock:", &v22);
      if (!*((_BYTE *)v29 + 24))
        goto LABEL_13;
      v15 = self->_topWidget;
      v16 = (ATXHomeScreenWidgetIdentifiable *)v14[4];
      if (v15 == v16)
      {

      }
      else
      {
        v17 = v16;
        v18 = -[ATXHomeScreenWidgetIdentifiable isEqual:](v15, "isEqual:", v16, v22, v23, v24, v25);

        if (!v18)
        {
LABEL_13:
          v11 = 0;
LABEL_20:

          _Block_object_dispose(&v28, 8);
          goto LABEL_21;
        }
      }
      v19 = self->_suggestedWidgets;
      v20 = (NSSet *)v14[5];
      if (v19 == v20)
        v11 = 1;
      else
        v11 = -[NSSet isEqual:](v19, "isEqual:", v20);

      goto LABEL_20;
    }
    v11 = 0;
  }
LABEL_22:

  return v11;
}

void __40__ATXHomeScreenStackSuggestion_isEqual___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v8 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executableSpecification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "executableIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "executableSpecification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "executableIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqualToString:", v12);

  if ((v13 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

+ (id)stackSuggestionsFromCachedSuggestions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "cachedTopOfStackLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __70__ATXHomeScreenStackSuggestion_stackSuggestionsFromCachedSuggestions___block_invoke;
  v18[3] = &unk_1E4D5C130;
  v21 = a1;
  v19 = v4;
  v8 = v5;
  v20 = v8;
  v9 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v18);

  objc_msgSend(v9, "cachedSuggestedWidgetsLayouts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __70__ATXHomeScreenStackSuggestion_stackSuggestionsFromCachedSuggestions___block_invoke_2;
  v15[3] = &unk_1E4D5C158;
  v11 = v8;
  v16 = v11;
  v17 = a1;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v15);

  v12 = v16;
  v13 = v11;

  return v13;
}

void __70__ATXHomeScreenStackSuggestion_stackSuggestionsFromCachedSuggestions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = *(objc_class **)(a1 + 48);
  v6 = a3;
  v7 = [v5 alloc];
  objc_msgSend(*(id *)(a1 + 32), "cachedSuggestedWidgetsLayouts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithStackIdentifier:layoutOfTopWidget:layoutOfSuggestedWidgets:", v11, v6, v9);

  if (v10)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v11);

}

void __70__ATXHomeScreenStackSuggestion_stackSuggestionsFromCachedSuggestions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithStackIdentifier:layoutOfTopWidget:layoutOfSuggestedWidgets:", v8, 0, v5);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);

  }
}

+ (id)widgetFromSuggestionLayout:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_widgetAndSuggestionsFromSuggestionLayout:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_widgetAndSuggestionsFromSuggestionLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "isValidForSuggestionsWidget"))
    {
      v6 = (void *)objc_opt_new();
      v7 = *MEMORY[0x1E0CF9480];
      objc_msgSend(v6, "setAppBundleId:", *MEMORY[0x1E0CF9480]);
      objc_msgSend(v6, "setExtensionBundleId:", v7);
      ATXSpecialWidgetKindSiriSuggestions();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setWidgetKind:", v8);

      objc_msgSend(v5, "minSuggestionListInLayout");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "_widgetProactiveSuggestionFromLayout:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D81150], "infoSuggestionFromProactiveSuggestion:", v6);
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        __atxlog_handle_home_screen();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          +[ATXHomeScreenStackSuggestion _widgetAndSuggestionsFromSuggestionLayout:].cold.1(v9, v20, v21, v22, v23, v24, v25, v26);
        v10 = 0;
        goto LABEL_8;
      }
      v12 = (void *)v11;
      v13 = (void *)objc_opt_new();
      objc_msgSend(v12, "appBundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAppBundleId:", v14);

      objc_msgSend(v12, "widgetBundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setExtensionBundleId:", v15);

      objc_msgSend(v12, "widgetKind");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setWidgetKind:", v16);

      objc_msgSend(v12, "intent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setIntent:", v17);

      v27[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = v13;
    }
    objc_msgSend(v5, "widgetUniqueId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWidgetUniqueId:", v18);

    objc_msgSend(v6, "setSize:", objc_msgSend(a1, "_stackLayoutSizeFromUILayoutType:", objc_msgSend(v5, "layoutType")));
    objc_msgSend(v6, "setSuggestedWidget:", objc_msgSend(v5, "isNPlusOne"));
    objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

    goto LABEL_9;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

+ (id)_widgetProactiveSuggestionFromLayout:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v3 = a3;
  if (objc_msgSend(v3, "layoutType") == 5)
  {
    objc_msgSend(v3, "twoByTwoSuggestions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "layoutType") == 3)
  {
    objc_msgSend(v3, "twoByFourSuggestions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "layoutType") == 10)
  {
    objc_msgSend(v3, "fourByFourSuggestions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v3, "layoutType") != 16)
      goto LABEL_14;
    objc_msgSend(v3, "fourByEightSuggestions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  objc_msgSend(v4, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_14:
    __atxlog_handle_home_screen();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[ATXHomeScreenStackSuggestion _widgetProactiveSuggestionFromLayout:].cold.1(v6, v17, v18, v19, v20, v21, v22, v23);
    goto LABEL_16;
  }
  -[NSObject executableSpecification](v6, "executableSpecification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "executableType");

  if (v8 != 3)
  {
    __atxlog_handle_home_screen();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[ATXHomeScreenStackSuggestion _widgetProactiveSuggestionFromLayout:].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);

LABEL_16:
    v6 = 0;
  }

  return v6;
}

+ (id)_widgetsFromSuggestionLayouts:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_opt_new();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
          v12 = (void *)MEMORY[0x1A85A4F90](v7);
          objc_msgSend(a1, "_widgetAndSuggestionsFromSuggestionLayout:", v11, (_QWORD)v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "first");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v13, "first");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v15);

          }
          objc_autoreleasePoolPop(v12);
          ++v10;
        }
        while (v8 != v10);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        v8 = v7;
      }
      while (v7);
    }

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

+ (unint64_t)_stackLayoutSizeFromUILayoutType:(int64_t)a3
{
  NSObject *v5;
  uint64_t v6;

  if (a3 == 3)
    return 1;
  if (a3 != 5)
  {
    if (a3 == 9)
      return 1;
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0xA)
      return 2;
    if (a3 == 16)
      return 4;
    __atxlog_handle_home_screen();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      +[ATXHomeScreenStackSuggestion _stackLayoutSizeFromUILayoutType:].cold.1(a3, v5, v6);

  }
  return 0;
}

- (NSString)stackId
{
  return self->_stackId;
}

- (ATXHomeScreenWidgetIdentifiable)topWidget
{
  return self->_topWidget;
}

- (NSSet)suggestedWidgets
{
  return self->_suggestedWidgets;
}

- (BOOL)isLowConfidenceStackRotationForStaleStack
{
  return self->_isLowConfidenceStackRotationForStaleStack;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedWidgets, 0);
  objc_storeStrong((id *)&self->_topWidget, 0);
  objc_storeStrong((id *)&self->_stackId, 0);
  objc_storeStrong((id *)&self->_topWidgetSuggestions, 0);
}

- (void)initWithStackIdentifier:(void *)a1 layoutOfTopWidget:(NSObject *)a2 layoutOfSuggestedWidgets:.cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "compactDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "first");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "widgetUniqueId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = v5;
  v11 = 2114;
  v12 = v7;
  OUTLINED_FUNCTION_3_7(&dword_1A49EF000, a2, v8, "ATXHomeScreenStackSuggestion: TopWidget %@ (uniqueID %{public}@) is a suggested widget but it does not exist in the suggestedWidgets list. Aborting init.", (uint8_t *)&v9);

}

+ (void)_widgetAndSuggestionsFromSuggestionLayout:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, a1, a3, "ATXHomeScreenStackSuggestion: Unable to get ATXInfoSuggestion from ATXSuggestionLayout", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_widgetProactiveSuggestionFromLayout:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, a1, a3, "ATXHomeScreenStackSuggestion: No ATXProactiveSuggestion of expected layout type found when converting ATXSuggestionLayout to ATXHomeScreenStackSuggestion", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_widgetProactiveSuggestionFromLayout:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, a1, a3, "ATXHomeScreenStackSuggestion: Unexpected executable type found when converting ATXSuggestionLayout to ATXHomeScreenStackSuggestion", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_stackLayoutSizeFromUILayoutType:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136315394;
  v4 = "+[ATXHomeScreenStackSuggestion _stackLayoutSizeFromUILayoutType:]";
  v5 = 2048;
  v6 = a1;
  OUTLINED_FUNCTION_3_7(&dword_1A49EF000, a2, a3, "%s: Could not convert ATXUILayoutType %lu to ATXStackLayoutSize", (uint8_t *)&v3);
}

@end
