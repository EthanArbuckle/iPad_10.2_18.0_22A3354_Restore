@implementation _ATXSuggestionsWidgetSuggestion

- (_ATXSuggestionsWidgetSuggestion)initWithSuggestionsWidget:(id)a3 containingStack:(id)a4 suggestionDeduplicator:(id)a5 hyperParameters:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  _ATXSuggestionsWidgetSuggestion *v17;
  ATXHomeScreenWidgetIdentifiable **p_widget;
  int64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _ATXSuggestionsWidgetSuggestion *v28;
  NSMutableDictionary *v29;
  NSMutableDictionary *suggestionsBySuggestionLayoutTypes;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  objc_super v39;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v11, "extensionBundleId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CF9480]);

  if ((v16 & 1) != 0)
  {
    v39.receiver = self;
    v39.super_class = (Class)_ATXSuggestionsWidgetSuggestion;
    v17 = -[_ATXSuggestionsWidgetSuggestion init](&v39, sel_init);
    self = v17;
    if (!v17)
    {
LABEL_13:
      self = self;
      v28 = self;
      goto LABEL_14;
    }
    objc_storeWeak((id *)&v17->super._stack, v12);
    p_widget = &self->super._widget;
    objc_storeStrong((id *)&self->super._widget, a3);
    objc_storeStrong((id *)&self->super._suggestionDeduplicator, a5);
    objc_storeStrong((id *)&self->super._hyperParameters, a6);
    if (!-[ATXHomeScreenWidgetIdentifiable size](self->super._widget, "size"))
    {
      v19 = 5;
      goto LABEL_12;
    }
    if (-[ATXHomeScreenWidgetIdentifiable size](*p_widget, "size") == 1)
    {
      v19 = 9;
LABEL_12:
      self->super._layoutType = v19;
      v29 = (NSMutableDictionary *)objc_opt_new();
      suggestionsBySuggestionLayoutTypes = self->super._suggestionsBySuggestionLayoutTypes;
      self->super._suggestionsBySuggestionLayoutTypes = v29;

      goto LABEL_13;
    }
    if (-[ATXHomeScreenWidgetIdentifiable size](*p_widget, "size") == 2)
    {
      v19 = 11;
      goto LABEL_12;
    }
    __atxlog_handle_blending();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[_ATXSuggestionsWidgetSuggestion initWithSuggestionsWidget:containingStack:suggestionDeduplicator:hyperParameters:].cold.1(v20, v32, v33, v34, v35, v36, v37, v38);
  }
  else
  {
    __atxlog_handle_blending();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[_ATXSuggestionsWidgetSuggestion initWithSuggestionsWidget:containingStack:suggestionDeduplicator:hyperParameters:].cold.2(v20, v21, v22, v23, v24, v25, v26, v27);
  }

  v28 = 0;
LABEL_14:

  return v28;
}

- (_ATXSuggestionsWidgetSuggestion)initWithSuggestionsWidget:(id)a3 containingStack:(id)a4 suggestionLayout:(id)a5 suggestionDeduplicator:(id)a6 hyperParameters:(id)a7
{
  id v13;
  _ATXSuggestionsWidgetSuggestion *v14;
  _ATXSuggestionsWidgetSuggestion *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v13 = a5;
  v14 = -[_ATXSuggestionsWidgetSuggestion initWithSuggestionsWidget:containingStack:suggestionDeduplicator:hyperParameters:](self, "initWithSuggestionsWidget:containingStack:suggestionDeduplicator:hyperParameters:", a3, a4, a6, a7);
  if (!v14)
    goto LABEL_4;
  if (objc_msgSend(v13, "layoutType") == v14->super._layoutType)
  {
    objc_storeStrong((id *)&v14->super._suggestionLayout, a5);
LABEL_4:
    v15 = v14;
    goto LABEL_8;
  }
  __atxlog_handle_blending();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    -[_ATXSuggestionsWidgetSuggestion initWithSuggestionsWidget:containingStack:suggestionLayout:suggestionDeduplicator:hyperParameters:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

  v15 = 0;
LABEL_8:

  return v15;
}

- (id)initForPreviewOfSize:(unint64_t)a3 hyperParameters:(id)a4
{
  id v7;
  _ATXSuggestionsWidgetSuggestion *v8;
  _ATXSuggestionsWidgetSuggestion *v9;
  uint64_t v10;
  ATXHomeScreenWidgetIdentifiable *widget;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableDictionary *suggestionsBySuggestionLayoutTypes;
  _ATXSuggestionsWidgetSuggestion *v18;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v28;

  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)_ATXSuggestionsWidgetSuggestion;
  v8 = -[_ATXSuggestionsWidgetSuggestion init](&v28, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_9;
  objc_storeStrong((id *)&v8->super._hyperParameters, a4);
  v10 = objc_opt_new();
  widget = v9->super._widget;
  v9->super._widget = (ATXHomeScreenWidgetIdentifiable *)v10;

  v12 = *MEMORY[0x1E0CF9480];
  -[ATXHomeScreenWidgetIdentifiable setAppBundleId:](v9->super._widget, "setAppBundleId:", *MEMORY[0x1E0CF9480]);
  -[ATXHomeScreenWidgetIdentifiable setExtensionBundleId:](v9->super._widget, "setExtensionBundleId:", v12);
  ATXSpecialWidgetKindSiriSuggestions();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenWidgetIdentifiable setWidgetKind:](v9->super._widget, "setWidgetKind:", v13);

  -[ATXHomeScreenWidgetIdentifiable setSize:](v9->super._widget, "setSize:", a3);
  if (!-[ATXHomeScreenWidgetIdentifiable size](v9->super._widget, "size"))
  {
    v14 = (_QWORD *)MEMORY[0x1E0CF9488];
    v15 = 5;
    goto LABEL_8;
  }
  if (-[ATXHomeScreenWidgetIdentifiable size](v9->super._widget, "size") == 1)
  {
    v14 = (_QWORD *)MEMORY[0x1E0CF9490];
    v15 = 9;
LABEL_8:
    -[ATXHomeScreenWidgetIdentifiable setWidgetUniqueId:](v9->super._widget, "setWidgetUniqueId:", *v14);
    v9->super._layoutType = v15;
    v16 = objc_opt_new();
    suggestionsBySuggestionLayoutTypes = v9->super._suggestionsBySuggestionLayoutTypes;
    v9->super._suggestionsBySuggestionLayoutTypes = (NSMutableDictionary *)v16;

LABEL_9:
    v18 = v9;
    goto LABEL_10;
  }
  if (-[ATXHomeScreenWidgetIdentifiable size](v9->super._widget, "size") == 2)
  {
    v14 = (_QWORD *)MEMORY[0x1E0CF9498];
    v15 = 11;
    goto LABEL_8;
  }
  __atxlog_handle_blending();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    -[_ATXSuggestionsWidgetSuggestion initForPreviewOfSize:hyperParameters:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);

  v18 = 0;
LABEL_10:

  return v18;
}

- (BOOL)containsIdenticalContentOfSuggestion:(id)a3
{
  ATXSuggestionDeduplicatorProtocol *suggestionDeduplicator;
  id v5;
  void *v6;

  suggestionDeduplicator = self->super._suggestionDeduplicator;
  v5 = a3;
  -[_ATXCompositeLayoutWidgetSuggestionBase _existingSuggestionsInLayout](self, "_existingSuggestionsInLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(suggestionDeduplicator) = -[ATXSuggestionDeduplicatorProtocol suggestionIsDuplicate:existingSuggestions:shouldCompareAcrossTypes:](suggestionDeduplicator, "suggestionIsDuplicate:existingSuggestions:shouldCompareAcrossTypes:", v5, v6, 1);

  return (char)suggestionDeduplicator;
}

- (BOOL)addSuggestion:(id)a3 asMainSuggestion:(BOOL)a4 dryRun:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  BOOL v9;
  objc_super v11;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (-[_ATXCompositeLayoutWidgetSuggestionBase isLayoutComplete](self, "isLayoutComplete")
    || !-[ATXBlendingLayerHyperParameters isSuggestionEligibleForSuggestionsWidget:](self->super._hyperParameters, "isSuggestionEligibleForSuggestionsWidget:", v8))
  {
    v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_ATXSuggestionsWidgetSuggestion;
    v9 = -[_ATXCompositeLayoutWidgetSuggestionBase addSuggestion:asMainSuggestion:dryRun:](&v11, sel_addSuggestion_asMainSuggestion_dryRun_, v8, v6, v5);
  }

  return v9;
}

- (void)initWithSuggestionsWidget:(uint64_t)a3 containingStack:(uint64_t)a4 suggestionDeduplicator:(uint64_t)a5 hyperParameters:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, a1, a3, "%s: Incompatible stack size.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithSuggestionsWidget:(uint64_t)a3 containingStack:(uint64_t)a4 suggestionDeduplicator:(uint64_t)a5 hyperParameters:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, a1, a3, "%s: Widget is not a SuggestionsWidget.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithSuggestionsWidget:(uint64_t)a3 containingStack:(uint64_t)a4 suggestionLayout:(uint64_t)a5 suggestionDeduplicator:(uint64_t)a6 hyperParameters:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, a1, a3, "%s: SuggestionLayout is incompatible with stack size.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initForPreviewOfSize:(uint64_t)a3 hyperParameters:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, a1, a3, "%s: Incompatible stack size.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
