@implementation _ATXCompositeLayoutWidgetSuggestionBase

- (BOOL)containsIdenticalContentOfSuggestion:(id)a3
{
  ATXSuggestionDeduplicatorProtocol *suggestionDeduplicator;
  id v5;
  void *v6;

  suggestionDeduplicator = self->_suggestionDeduplicator;
  v5 = a3;
  -[_ATXCompositeLayoutWidgetSuggestionBase _existingSuggestionsInLayout](self, "_existingSuggestionsInLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(suggestionDeduplicator) = -[ATXSuggestionDeduplicatorProtocol suggestionIsDuplicate:existingSuggestions:shouldCompareAcrossTypes:](suggestionDeduplicator, "suggestionIsDuplicate:existingSuggestions:shouldCompareAcrossTypes:", v5, v6, 1);

  return (char)suggestionDeduplicator;
}

- (BOOL)isLayoutComplete
{
  return self->_suggestionLayout != 0;
}

- (BOOL)canAddSuggestion:(id)a3
{
  return -[_ATXCompositeLayoutWidgetSuggestionBase addSuggestion:asMainSuggestion:dryRun:](self, "addSuggestion:asMainSuggestion:dryRun:", a3, 0, 1);
}

- (BOOL)addSuggestion:(id)a3 asMainSuggestion:(BOOL)a4
{
  return -[_ATXCompositeLayoutWidgetSuggestionBase addSuggestion:asMainSuggestion:dryRun:](self, "addSuggestion:asMainSuggestion:dryRun:", a3, a4, 0);
}

- (BOOL)addSuggestion:(id)a3 asMainSuggestion:(BOOL)a4 dryRun:(BOOL)a5
{
  BOOL v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSMutableDictionary *suggestionsBySuggestionLayoutTypes;
  void *v16;
  void *v17;
  unint64_t v18;
  int v19;
  NSMutableDictionary *v20;
  void *v21;
  id v22;
  int64_t layoutType;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  ATXSuggestionLayout *v31;
  ATXSuggestionLayout *suggestionLayout;
  void *v33;
  NSObject *v34;
  void *v35;
  ATXSuggestionLayout *v36;
  ATXProactiveSuggestion **p_mainSuggestionInLayout;
  char v40;
  _BOOL4 v41;
  id obj;
  id v43;
  void *v45;
  _QWORD v46[4];
  id v47;
  _ATXCompositeLayoutWidgetSuggestionBase *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  ATXSuggestionLayout *v61;
  _BYTE v62[128];
  uint64_t v63;

  v41 = a4;
  v63 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  if (-[_ATXCompositeLayoutWidgetSuggestionBase isLayoutComplete](self, "isLayoutComplete"))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D81220], "minSuggestionLayoutTypesForUILayoutType:", self->_layoutType);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0u;
    v55 = 0u;
    v56 = 0u;
    v54 = 0u;
    objc_msgSend(v43, "uiSpecification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredLayoutConfigs");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    if (v8)
    {
      v40 = 0;
      v9 = *(_QWORD *)v55;
      p_mainSuggestionInLayout = &self->_mainSuggestionInLayout;
LABEL_5:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v55 != v9)
          objc_enumerationMutation(obj);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * v10), "applicableLayoutType");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "unsignedIntegerValue");

        suggestionsBySuggestionLayoutTypes = self->_suggestionsBySuggestionLayoutTypes;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](suggestionsBySuggestionLayoutTypes, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_msgSend(v17, "count");
        v19 = v18 < v14;
        if (v18 < v14 && !a5)
        {
          if (!v17)
          {
            v17 = (void *)objc_opt_new();
            v20 = self->_suggestionsBySuggestionLayoutTypes;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v17, v21);

          }
          objc_msgSend(v17, "addObject:", v43);
          if (v41)
            objc_storeStrong((id *)p_mainSuggestionInLayout, a3);
          v19 = 2;
          v40 = 1;
        }

        if (v18 < v14)
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
          if (v8)
            goto LABEL_5;

          goto LABEL_20;
        }
      }

      if ((v19 | 2) != 2)
        goto LABEL_26;
LABEL_20:
      if ((v40 & 1) == 0)
        goto LABEL_28;
      v50 = 0;
      v51 = &v50;
      v52 = 0x2020000000;
      v53 = 1;
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __81___ATXCompositeLayoutWidgetSuggestionBase_addSuggestion_asMainSuggestion_dryRun___block_invoke;
      v46[3] = &unk_1E82DD450;
      v47 = v45;
      v48 = self;
      v49 = &v50;
      objc_msgSend(v47, "enumerateKeysAndObjectsUsingBlock:", v46);
      if (*((_BYTE *)v51 + 24))
      {
        v22 = objc_alloc(MEMORY[0x1E0D81220]);
        layoutType = self->_layoutType;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_suggestionsBySuggestionLayoutTypes, "objectForKeyedSubscript:", &unk_1E83CBF38);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_suggestionsBySuggestionLayoutTypes, "objectForKeyedSubscript:", &unk_1E83CBF50);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_suggestionsBySuggestionLayoutTypes, "objectForKeyedSubscript:", &unk_1E83CBF68);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_suggestionsBySuggestionLayoutTypes, "objectForKeyedSubscript:", &unk_1E83CBF80);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_suggestionsBySuggestionLayoutTypes, "objectForKeyedSubscript:", &unk_1E83CBF98);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_suggestionsBySuggestionLayoutTypes, "objectForKeyedSubscript:", &unk_1E83CBFB0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_suggestionsBySuggestionLayoutTypes, "objectForKeyedSubscript:", &unk_1E83CBFC8);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (ATXSuggestionLayout *)objc_msgSend(v22, "initWithLayoutType:oneByOneSuggestions:oneByTwoSuggestions:twoByTwoSuggestions:oneByFourSuggestions:twoByFourSuggestions:fourByFourSuggestions:fourByEightSuggestions:", layoutType, v24, v25, v26, v27, v28, v29, v30);
        suggestionLayout = self->_suggestionLayout;
        self->_suggestionLayout = v31;

        -[ATXSuggestionLayout setIsValidForSuggestionsWidget:](self->_suggestionLayout, "setIsValidForSuggestionsWidget:", 1);
        -[ATXProactiveSuggestion uuid](*p_mainSuggestionInLayout, "uuid");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXSuggestionLayout setUuidOfHighestConfidenceSuggestion:](self->_suggestionLayout, "setUuidOfHighestConfidenceSuggestion:", v33);

        __atxlog_handle_blending();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          -[ATXHomeScreenWidgetIdentifiable widgetUniqueId](self->_widget, "widgetUniqueId");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = self->_suggestionLayout;
          *(_DWORD *)buf = 138412546;
          v59 = v35;
          v60 = 2112;
          v61 = v36;
          _os_log_impl(&dword_1C9A3B000, v34, OS_LOG_TYPE_DEFAULT, "Layout for widget %@ is complete: %@", buf, 0x16u);

        }
      }

      _Block_object_dispose(&v50, 8);
LABEL_26:
      v6 = 1;
    }
    else
    {

LABEL_28:
      v6 = 0;
    }

  }
  return v6;
}

- (id)_existingSuggestionsInLayout
{
  ATXSuggestionLayout *suggestionLayout;
  void *v5;
  NSMutableDictionary *suggestionsBySuggestionLayoutTypes;
  id v7;
  _QWORD v8[4];
  id v9;

  suggestionLayout = self->_suggestionLayout;
  if (suggestionLayout)
  {
    -[ATXSuggestionLayout minSuggestionListInLayout](suggestionLayout, "minSuggestionListInLayout");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)objc_opt_new();
    suggestionsBySuggestionLayoutTypes = self->_suggestionsBySuggestionLayoutTypes;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __71___ATXCompositeLayoutWidgetSuggestionBase__existingSuggestionsInLayout__block_invoke;
    v8[3] = &unk_1E82DD478;
    v7 = v5;
    v9 = v7;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](suggestionsBySuggestionLayoutTypes, "enumerateKeysAndObjectsUsingBlock:", v8);

    return v7;
  }
}

- (_ATXHomeScreenStackState)stack
{
  return (_ATXHomeScreenStackState *)objc_loadWeakRetained((id *)&self->_stack);
}

- (ATXHomeScreenWidgetIdentifiable)widget
{
  return self->_widget;
}

- (ATXSuggestionLayout)suggestionLayout
{
  return self->_suggestionLayout;
}

- (ATXProactiveSuggestion)mainSuggestionInLayout
{
  return self->_mainSuggestionInLayout;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (ATXSuggestionDeduplicatorProtocol)suggestionDeduplicator
{
  return self->_suggestionDeduplicator;
}

- (ATXBlendingLayerHyperParameters)hyperParameters
{
  return self->_hyperParameters;
}

- (NSMutableDictionary)suggestionsBySuggestionLayoutTypes
{
  return self->_suggestionsBySuggestionLayoutTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsBySuggestionLayoutTypes, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_suggestionDeduplicator, 0);
  objc_storeStrong((id *)&self->_mainSuggestionInLayout, 0);
  objc_storeStrong((id *)&self->_suggestionLayout, 0);
  objc_storeStrong((id *)&self->_widget, 0);
  objc_destroyWeak((id *)&self->_stack);
}

@end
