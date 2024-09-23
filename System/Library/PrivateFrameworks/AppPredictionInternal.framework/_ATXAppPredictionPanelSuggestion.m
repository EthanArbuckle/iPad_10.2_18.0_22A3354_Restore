@implementation _ATXAppPredictionPanelSuggestion

- (_ATXAppPredictionPanelSuggestion)initWithAppPredictionPanel:(id)a3 containingStack:(id)a4 suggestionDeduplicator:(id)a5 hyperParameters:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  _ATXAppPredictionPanelSuggestion *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *suggestionsBySuggestionLayoutTypes;
  _ATXAppPredictionPanelSuggestion *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  objc_super v37;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v11, "extensionBundleId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CF89A8]);

  if ((v16 & 1) == 0)
  {
    __atxlog_handle_blending();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[_ATXAppPredictionPanelSuggestion initWithAppPredictionPanel:containingStack:suggestionDeduplicator:hyperParameters:].cold.2(v21, v22, v23, v24, v25, v26, v27, v28);
    goto LABEL_10;
  }
  v37.receiver = self;
  v37.super_class = (Class)_ATXAppPredictionPanelSuggestion;
  v17 = -[_ATXAppPredictionPanelSuggestion init](&v37, sel_init);
  self = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->super._stack, v12);
    objc_storeStrong((id *)&self->super._widget, a3);
    objc_storeStrong((id *)&self->super._suggestionDeduplicator, a5);
    objc_storeStrong((id *)&self->super._hyperParameters, a6);
    if (-[ATXHomeScreenWidgetIdentifiable size](self->super._widget, "size") == 1)
    {
      self->super._layoutType = 0;
      v18 = (NSMutableDictionary *)objc_opt_new();
      suggestionsBySuggestionLayoutTypes = self->super._suggestionsBySuggestionLayoutTypes;
      self->super._suggestionsBySuggestionLayoutTypes = v18;

      goto LABEL_5;
    }
    __atxlog_handle_blending();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[_ATXAppPredictionPanelSuggestion initWithAppPredictionPanel:containingStack:suggestionDeduplicator:hyperParameters:].cold.1(v21, v29, v30, v31, v32, v33, v34, v35);
LABEL_10:

    v20 = 0;
    goto LABEL_11;
  }
LABEL_5:
  self = self;
  v20 = self;
LABEL_11:

  return v20;
}

- (_ATXAppPredictionPanelSuggestion)initWithAppPredictionPanel:(id)a3 containingStack:(id)a4 suggestionLayout:(id)a5 suggestionDeduplicator:(id)a6 hyperParameters:(id)a7
{
  id v13;
  _ATXAppPredictionPanelSuggestion *v14;
  _ATXAppPredictionPanelSuggestion *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v13 = a5;
  v14 = -[_ATXAppPredictionPanelSuggestion initWithAppPredictionPanel:containingStack:suggestionDeduplicator:hyperParameters:](self, "initWithAppPredictionPanel:containingStack:suggestionDeduplicator:hyperParameters:", a3, a4, a6, a7);
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
    -[_ATXAppPredictionPanelSuggestion initWithAppPredictionPanel:containingStack:suggestionLayout:suggestionDeduplicator:hyperParameters:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

  v15 = 0;
LABEL_8:

  return v15;
}

- (id)initForPreviewWithHyperParameters:(id)a3
{
  id v5;
  _ATXAppPredictionPanelSuggestion *v6;
  uint64_t v7;
  ATXHomeScreenWidgetIdentifiable *widget;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *suggestionsBySuggestionLayoutTypes;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_ATXAppPredictionPanelSuggestion;
  v6 = -[_ATXAppPredictionPanelSuggestion init](&v14, sel_init);
  if (v6)
  {
    v7 = objc_opt_new();
    widget = v6->super._widget;
    v6->super._widget = (ATXHomeScreenWidgetIdentifiable *)v7;

    v9 = *MEMORY[0x1E0CF89A8];
    -[ATXHomeScreenWidgetIdentifiable setAppBundleId:](v6->super._widget, "setAppBundleId:", *MEMORY[0x1E0CF89A8]);
    -[ATXHomeScreenWidgetIdentifiable setExtensionBundleId:](v6->super._widget, "setExtensionBundleId:", v9);
    ATXSpecialWidgetKindAppPredictions();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHomeScreenWidgetIdentifiable setWidgetKind:](v6->super._widget, "setWidgetKind:", v10);

    -[ATXHomeScreenWidgetIdentifiable setSize:](v6->super._widget, "setSize:", 1);
    -[ATXHomeScreenWidgetIdentifiable setWidgetUniqueId:](v6->super._widget, "setWidgetUniqueId:", *MEMORY[0x1E0CF9390]);
    objc_storeStrong((id *)&v6->super._hyperParameters, a3);
    v6->super._layoutType = 0;
    v11 = objc_opt_new();
    suggestionsBySuggestionLayoutTypes = v6->super._suggestionsBySuggestionLayoutTypes;
    v6->super._suggestionsBySuggestionLayoutTypes = (NSMutableDictionary *)v11;

  }
  return v6;
}

- (BOOL)containsIdenticalContentOfSuggestion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  ATXSuggestionDeduplicatorProtocol *suggestionDeduplicator;
  void *v8;
  char v9;

  v4 = a3;
  objc_msgSend(v4, "executableSpecification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "executableType");

  if (v6 == 1)
  {
    suggestionDeduplicator = self->super._suggestionDeduplicator;
    -[_ATXCompositeLayoutWidgetSuggestionBase _existingSuggestionsInLayout](self, "_existingSuggestionsInLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ATXSuggestionDeduplicatorProtocol suggestionIsDuplicate:existingSuggestions:shouldCompareAcrossTypes:](suggestionDeduplicator, "suggestionIsDuplicate:existingSuggestions:shouldCompareAcrossTypes:", v4, v8, 0);

  }
  else
  {
    v9 = 0;
  }

  return v9;
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
    || !-[ATXBlendingLayerHyperParameters isSuggestionEligibleForAppPredictionPanel:](self->super._hyperParameters, "isSuggestionEligibleForAppPredictionPanel:", v8))
  {
    v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_ATXAppPredictionPanelSuggestion;
    v9 = -[_ATXCompositeLayoutWidgetSuggestionBase addSuggestion:asMainSuggestion:dryRun:](&v11, sel_addSuggestion_asMainSuggestion_dryRun_, v8, v6, v5);
  }

  return v9;
}

- (void)initWithAppPredictionPanel:(uint64_t)a3 containingStack:(uint64_t)a4 suggestionDeduplicator:(uint64_t)a5 hyperParameters:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, a1, a3, "%s: Incompatible stack size.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithAppPredictionPanel:(uint64_t)a3 containingStack:(uint64_t)a4 suggestionDeduplicator:(uint64_t)a5 hyperParameters:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, a1, a3, "%s: Widget is not an AppPredictionPanel.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithAppPredictionPanel:(uint64_t)a3 containingStack:(uint64_t)a4 suggestionLayout:(uint64_t)a5 suggestionDeduplicator:(uint64_t)a6 hyperParameters:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, a1, a3, "%s: SuggestionLayout is incompatible with stack size.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
