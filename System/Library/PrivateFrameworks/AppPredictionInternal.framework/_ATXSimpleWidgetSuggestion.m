@implementation _ATXSimpleWidgetSuggestion

- (_ATXSimpleWidgetSuggestion)initWithWidget:(id)a3 suggestion:(id)a4 stack:(id)a5 suggestionDeduplicator:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _ATXSimpleWidgetSuggestion *v15;
  _ATXSimpleWidgetSuggestion *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_ATXSimpleWidgetSuggestion;
  v15 = -[_ATXSimpleWidgetSuggestion init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_stack, v13);
    objc_storeStrong((id *)&v16->_widget, a3);
    objc_storeStrong((id *)&v16->_suggestionDeduplicator, a6);
    if (v12)
      -[_ATXSimpleWidgetSuggestion _setSuggestion:](v16, "_setSuggestion:", v12);
  }

  return v16;
}

- (_ATXSimpleWidgetSuggestion)initWithSuggestion:(id)a3 stack:(id)a4 suggestionDeduplicator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _ATXSimpleWidgetSuggestion *v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!+[_ATXSimpleWidgetSuggestion _isSuggestion:compatibleWithStack:](_ATXSimpleWidgetSuggestion, "_isSuggestion:compatibleWithStack:", v8, v9))goto LABEL_6;
  objc_msgSend(v9, "widgetForSuggestion:considerSuggestedWidgets:", v8, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0D81150], "infoSuggestionFromProactiveSuggestion:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      v11 = (void *)objc_opt_new();
      objc_msgSend(v13, "appBundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAppBundleId:", v14);

      objc_msgSend(v13, "widgetBundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setExtensionBundleId:", v15);

      objc_msgSend(v13, "widgetKind");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWidgetKind:", v16);

      objc_msgSend(v9, "config");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSize:", objc_msgSend(v17, "stackLayoutSize"));

      objc_msgSend(v13, "intent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setIntent:", v18);

      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUIDString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWidgetUniqueId:", v20);

      objc_msgSend(v11, "setSuggestedWidget:", 1);
      goto LABEL_5;
    }
LABEL_6:
    v21 = 0;
    goto LABEL_7;
  }
LABEL_5:
  self = -[_ATXSimpleWidgetSuggestion initWithWidget:suggestion:stack:suggestionDeduplicator:](self, "initWithWidget:suggestion:stack:suggestionDeduplicator:", v11, v8, v9, v10);

  v21 = self;
LABEL_7:

  return v21;
}

- (BOOL)containsIdenticalContentOfSuggestion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char v7;

  v4 = a3;
  objc_msgSend(v4, "executableSpecification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "executableType");

  if (v6 == 1)
    v7 = 0;
  else
    v7 = -[ATXSuggestionDeduplicatorProtocol isWidget:showingIdenticalContentOfSuggestion:](self->_suggestionDeduplicator, "isWidget:showingIdenticalContentOfSuggestion:", self->_widget, v4);

  return v7;
}

- (void)_setSuggestion:(id)a3
{
  id v5;
  id WeakRetained;
  _BOOL4 v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  ATXSuggestionLayout *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  ATXSuggestionLayout *suggestionLayout;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_stack);
  v7 = +[_ATXSimpleWidgetSuggestion _isSuggestion:compatibleWithStack:](_ATXSimpleWidgetSuggestion, "_isSuggestion:compatibleWithStack:", v5, WeakRetained);

  if (v7)
  {
    objc_storeStrong((id *)&self->_suggestion, a3);
    objc_storeStrong((id *)&self->_mainSuggestionInLayout, a3);
    switch(-[ATXHomeScreenWidgetIdentifiable size](self->_widget, "size"))
    {
      case 0:
        v8 = objc_alloc(MEMORY[0x1E0D81220]);
        v31[0] = v5;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0;
        v27 = 0;
        v10 = v8;
        v11 = 5;
        v12 = v9;
        goto LABEL_10;
      case 1:
        v13 = objc_alloc(MEMORY[0x1E0D81220]);
        v30 = v5;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (ATXSuggestionLayout *)objc_msgSend(v13, "initWithLayoutType:oneByOneSuggestions:oneByTwoSuggestions:twoByTwoSuggestions:oneByFourSuggestions:twoByFourSuggestions:fourByFourSuggestions:fourByEightSuggestions:", 3, 0, 0, 0, 0, v9, 0, 0);
        goto LABEL_11;
      case 2:
        v15 = objc_alloc(MEMORY[0x1E0D81220]);
        v29 = v5;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v9;
        v27 = 0;
        v10 = v15;
        v11 = 10;
        goto LABEL_9;
      case 3:
        __atxlog_handle_blending();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          -[_ATXSimpleWidgetSuggestion _setSuggestion:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
        goto LABEL_13;
      case 4:
        v24 = objc_alloc(MEMORY[0x1E0D81220]);
        v28 = v5;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0;
        v27 = v9;
        v10 = v24;
        v11 = 16;
LABEL_9:
        v12 = 0;
LABEL_10:
        v14 = (ATXSuggestionLayout *)objc_msgSend(v10, "initWithLayoutType:oneByOneSuggestions:oneByTwoSuggestions:twoByTwoSuggestions:oneByFourSuggestions:twoByFourSuggestions:fourByFourSuggestions:fourByEightSuggestions:", v11, 0, 0, v12, 0, 0, v26, v27);
LABEL_11:
        suggestionLayout = self->_suggestionLayout;
        self->_suggestionLayout = v14;

        break;
      default:
        break;
    }
    -[ATXProactiveSuggestion uuid](self->_mainSuggestionInLayout, "uuid");
    v16 = objc_claimAutoreleasedReturnValue();
    -[ATXSuggestionLayout setUuidOfHighestConfidenceSuggestion:](self->_suggestionLayout, "setUuidOfHighestConfidenceSuggestion:", v16);
LABEL_13:

  }
}

+ (BOOL)_isSuggestion:(id)a3 compatibleWithStack:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  NSObject *v10;
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
  uint64_t v24;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "executableSpecification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "executableType");

  if (v8 != 3)
  {
    __atxlog_handle_blending();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      +[_ATXSimpleWidgetSuggestion _isSuggestion:compatibleWithStack:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);
    goto LABEL_8;
  }
  if ((objc_msgSend(v6, "sizeIsCompatibleWithWidgetSuggestion:", v5) & 1) == 0)
  {
    __atxlog_handle_blending();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      +[_ATXSimpleWidgetSuggestion _isSuggestion:compatibleWithStack:].cold.1(v10, v18, v19, v20, v21, v22, v23, v24);
LABEL_8:

    v9 = 0;
    goto LABEL_9;
  }
  v9 = 1;
LABEL_9:

  return v9;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainSuggestionInLayout, 0);
  objc_storeStrong((id *)&self->_suggestionLayout, 0);
  objc_storeStrong((id *)&self->_widget, 0);
  objc_destroyWeak((id *)&self->_stack);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_suggestionDeduplicator, 0);
}

- (void)_setSuggestion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, a1, a3, "Attempt to initialize _ATXWidgetSuggestion with size 6x4, which is not supported.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

+ (void)_isSuggestion:(uint64_t)a3 compatibleWithStack:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, a1, a3, "Attempt to use ATXProactiveSuggestion of incompatible size for _ATXSimpleWidgetSuggestion.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

+ (void)_isSuggestion:(uint64_t)a3 compatibleWithStack:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, a1, a3, "Attempt to use ATXProactiveSuggestion of non-widget executable type for _ATXSimpleWidgetSuggestion.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
