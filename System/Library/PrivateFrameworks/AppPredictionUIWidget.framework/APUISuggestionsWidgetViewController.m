@implementation APUISuggestionsWidgetViewController

- (APUISuggestionsWidgetViewController)initWithIdentifier:(id)a3 suggestionsClient:(id)a4 layoutSize:(unint64_t)a5
{
  id v8;
  id v9;
  APUISuggestionsWidgetViewController *v10;
  APUISuggestionsWidgetViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  objc_super v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)APUISuggestionsWidgetViewController;
  v10 = -[APUIWidgetViewController initWithIdentifier:](&v21, sel_initWithIdentifier_, v8);
  v11 = v10;
  if (v10)
  {
    -[APUIWidgetViewController setSuggestionClient:](v10, "setSuggestionClient:", v9);
    v12 = (void *)objc_opt_new();
    -[APUIWidgetViewController setWidgetIdentifiable:](v11, "setWidgetIdentifiable:", v12);

    -[APUIWidgetViewController widgetIdentifiable](v11, "widgetIdentifiable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWidgetUniqueId:", v8);

    -[APUIWidgetViewController widgetIdentifiable](v11, "widgetIdentifiable");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSize:", a5);

    v15 = *MEMORY[0x24BE04288];
    -[APUIWidgetViewController widgetIdentifiable](v11, "widgetIdentifiable");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setExtensionBundleId:", v15);

    ATXSpecialWidgetKindSiriSuggestions();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUIWidgetViewController widgetIdentifiable](v11, "widgetIdentifiable");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWidgetKind:", v17);

    objc_msgSend(v9, "registerObserver:", v11);
    __atxlog_handle_home_screen();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v8;
      _os_log_impl(&dword_219979000, v19, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: APUISuggestionsWidgetViewController initWithIdentifier %@", buf, 0xCu);
    }

  }
  return v11;
}

- (void)didMoveToParentViewController:(id)a3
{
  NSObject *v5;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)APUISuggestionsWidgetViewController;
  -[APUISuggestionsWidgetViewController didMoveToParentViewController:](&v7, sel_didMoveToParentViewController_);
  if (!a3)
  {
    __atxlog_handle_home_screen();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: APUISuggestionsWidgetViewController didMoveToParentViewController = nil", v6, 2u);
    }

    -[APUISuggestionsWidgetViewController setShowingContextMenu:](self, "setShowingContextMenu:", 0);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  NSObject *v3;
  APUISuggestionsWidgetView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;
  _QWORD v33[4];
  uint8_t buf[4];
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v32.receiver = self;
  v32.super_class = (Class)APUISuggestionsWidgetViewController;
  -[APUISuggestionsWidgetViewController viewDidLoad](&v32, sel_viewDidLoad);
  __atxlog_handle_ui();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v35 = "-[APUISuggestionsWidgetViewController viewDidLoad]";
    _os_log_impl(&dword_219979000, v3, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s", buf, 0xCu);
  }

  v4 = objc_alloc_init(APUISuggestionsWidgetView);
  -[APUISuggestionsWidgetViewController setWidgetView:](self, "setWidgetView:", v4);

  -[APUISuggestionsWidgetViewController widgetView](self, "widgetView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[APUISuggestionsWidgetViewController widgetView](self, "widgetView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[APUISuggestionsWidgetViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[APUISuggestionsWidgetViewController widgetView](self, "widgetView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  v22 = (void *)MEMORY[0x24BDD1628];
  -[APUISuggestionsWidgetViewController widgetView](self, "widgetView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[APUISuggestionsWidgetViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v27;
  -[APUISuggestionsWidgetViewController widgetView](self, "widgetView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[APUISuggestionsWidgetViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v21;
  -[APUISuggestionsWidgetViewController widgetView](self, "widgetView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[APUISuggestionsWidgetViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v11;
  -[APUISuggestionsWidgetViewController widgetView](self, "widgetView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[APUISuggestionsWidgetViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v17);

  -[APUIWidgetViewController suggestionClient](self, "suggestionClient");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[APUISuggestionsWidgetViewController _updateLayoutAsynchronouslyWithSuggestionClient:](self, "_updateLayoutAsynchronouslyWithSuggestionClient:", v18);

}

- (void)_updateWidgetViewIfPossible
{
  NSObject *v3;
  _BOOL4 showingContextMenu;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (self->_showingContextMenu)
  {
    __atxlog_handle_ui();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      showingContextMenu = self->_showingContextMenu;
      *(_DWORD *)buf = 136446466;
      v8 = "-[APUISuggestionsWidgetViewController _updateWidgetViewIfPossible]";
      v9 = 1024;
      v10 = showingContextMenu;
      _os_log_impl(&dword_219979000, v3, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s aborted: _showingContextMenu=%{BOOL}d", buf, 0x12u);
    }

  }
  else
  {
    -[APUISuggestionsWidgetViewController widgetView](self, "widgetView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[APUIWidgetViewController layout](self, "layout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateWithSuggestionLayout:", v5);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__APUISuggestionsWidgetViewController_traitCollectionDidChange___block_invoke;
  block[3] = &unk_24DB7D2B8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __64__APUISuggestionsWidgetViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "suggestionClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_updateLayoutAsynchronouslyWithSuggestionClient:", v2);

}

- (id)_suggestionIdsInLayout:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
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

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[APUIWidgetViewController layout](self, "layout", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minSuggestionListInLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "UUIDString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v4;
}

- (void)suggestionClientDidRefreshProactiveWidgetLayouts:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __88__APUISuggestionsWidgetViewController_suggestionClientDidRefreshProactiveWidgetLayouts___block_invoke;
  v6[3] = &unk_24DB7D290;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __88__APUISuggestionsWidgetViewController_suggestionClientDidRefreshProactiveWidgetLayouts___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLayoutAsynchronouslyWithSuggestionClient:", *(_QWORD *)(a1 + 40));
}

- (void)_updateLayoutAsynchronouslyWithSuggestionClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = a3;
  -[APUIWidgetViewController suggestionIds](self, "suggestionIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  -[APUIWidgetViewController widgetIdentifiable](self, "widgetIdentifiable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __87__APUISuggestionsWidgetViewController__updateLayoutAsynchronouslyWithSuggestionClient___block_invoke;
  v10[3] = &unk_24DB7D530;
  v10[4] = self;
  v11 = v6;
  v12 = v4;
  v8 = v4;
  v9 = v6;
  objc_msgSend(v8, "layoutForSuggestionsWidget:completionHandler:", v7, v10);

}

void __87__APUISuggestionsWidgetViewController__updateLayoutAsynchronouslyWithSuggestionClient___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __87__APUISuggestionsWidgetViewController__updateLayoutAsynchronouslyWithSuggestionClient___block_invoke_2;
  v6[3] = &unk_24DB7D508;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v9 = *(id *)(a1 + 48);
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __87__APUISuggestionsWidgetViewController__updateLayoutAsynchronouslyWithSuggestionClient___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setLayout:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "layout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "verifyLayoutSizeCompatibility");
    __atxlog_handle_home_screen();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "layout");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v5 = (char *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE79B58];
      objc_msgSend(*(id *)(a1 + 32), "layout");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringFromUILayoutType:", objc_msgSend(v7, "layoutType"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "layout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "layoutScore");
      v19 = 138412802;
      v20 = v5;
      v21 = 2112;
      v22 = v8;
      v23 = 2048;
      v24 = v10;
      _os_log_impl(&dword_219979000, v3, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: _updateLayoutWithSuggestionClient layout: %@ type %@ score %f", (uint8_t *)&v19, 0x20u);

    }
  }
  else
  {
    __atxlog_handle_home_screen();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_219979000, v3, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: _updateLayoutWithSuggestionClient layout: nil", (uint8_t *)&v19, 2u);
    }
  }

  v11 = *(void **)(a1 + 32);
  objc_msgSend(v11, "layout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_suggestionIdsInLayout:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSuggestionIds:", v13);

  __atxlog_handle_ui();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "suggestionIds");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 136446466;
    v20 = "-[APUISuggestionsWidgetViewController _updateLayoutAsynchronouslyWithSuggestionClient:]_block_invoke";
    v21 = 2112;
    v22 = v15;
    _os_log_impl(&dword_219979000, v14, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s self.suggestionIds=%@", (uint8_t *)&v19, 0x16u);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "effectiveViewVisibility"))
  {
    v16 = *(void **)(a1 + 32);
    objc_msgSend(v16, "suggestionIds");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "logChangeWithNewSuggestionIds:previousSuggestionIds:suggestionClient:", v17, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
  return objc_msgSend(*(id *)(a1 + 32), "_updateWidgetViewIfPossible");
}

- (void)verifyLayoutSizeCompatibility
{
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 134217984;
  v6 = objc_msgSend(v3, "layoutType");
  OUTLINED_FUNCTION_0(&dword_219979000, a2, v4, "SuggestionsWidget: Layout type %lu is not compatible with any stack layout size", (uint8_t *)&v5);

  OUTLINED_FUNCTION_2();
}

- (void)view:(id)a3 didTapSuggestion:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  __atxlog_handle_ui();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_219979000, v6, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: didTapSuggestion invoked with suggestion: %@", (uint8_t *)&v12, 0xCu);
  }

  -[APUIWidgetViewController suggestionClient](self, "suggestionClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[APUIWidgetViewController widgetIdentifiable](self, "widgetIdentifiable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[APUIWidgetViewController layout](self, "layout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logDidTapSuggestion:widget:blendingCacheId:", v5, v8, v11);

}

- (void)view:(id)a3 didFinishExecutingSuggestion:(id)a4
{
  id v6;
  NSObject *v7;
  dispatch_time_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "setCanEngageSuggestion:", 1);
  __atxlog_handle_home_screen();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v6;
    _os_log_impl(&dword_219979000, v7, OS_LOG_TYPE_DEFAULT, "didFinishExecutingSuggestion invoked with suggestion: %@", buf, 0xCu);
  }

  v8 = dispatch_time(0, 300000000);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __73__APUISuggestionsWidgetViewController_view_didFinishExecutingSuggestion___block_invoke;
  v10[3] = &unk_24DB7D290;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_after(v8, MEMORY[0x24BDAC9B8], v10);

}

void __73__APUISuggestionsWidgetViewController_view_didFinishExecutingSuggestion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "suggestionClient");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "widgetIdentifiable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didFinishExecutingTappedSuggestion:fromWidget:", v2, v3);

}

- (void)view:(id)a3 didFailExecutingSuggestion:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(a3, "setCanEngageSuggestion:", 1);
  __atxlog_handle_home_screen();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_219979000, v6, OS_LOG_TYPE_DEFAULT, "didFailExecutingSuggestion invoked with suggestion: %@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)setShowingContextMenu:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  _BOOL4 v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  __atxlog_handle_home_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[ATXProactiveSuggestion uiSpecification](self->_selectedSuggestion, "uiSpecification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v12 = v3;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: setShowingContextMenu %{BOOL}u _selectedSuggestion: %@", buf, 0x12u);

  }
  if (self->_showingContextMenu != v3)
  {
    self->_showingContextMenu = v3;
    -[APUIWidgetViewController suggestionClient](self, "suggestionClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIsUserInteractingWithProactiveWidget:", self->_showingContextMenu);

    if (v3)
    {
      if (-[APUISuggestionsWidgetViewController _canDismissSelectedSuggestion](self, "_canDismissSelectedSuggestion"))
      {
        v10[0] = MEMORY[0x24BDAC760];
        v10[1] = 3221225472;
        v10[2] = __61__APUISuggestionsWidgetViewController_setShowingContextMenu___block_invoke;
        v10[3] = &unk_24DB7D2B8;
        v10[4] = self;
        objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 2, v10, 0, 0.0, 0.1);
      }
    }
    else
    {
      -[APUISuggestionsWidgetViewController widgetView](self, "widgetView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "highlightSuggestion:", 0);

      -[APUISuggestionsWidgetViewController _updateWidgetViewIfPossible](self, "_updateWidgetViewIfPossible");
    }
  }
}

void __61__APUISuggestionsWidgetViewController_setShowingContextMenu___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "widgetView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highlightSuggestion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1016));

}

- (void)willShowContextMenuAtLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  ATXProactiveSuggestion *v6;
  ATXProactiveSuggestion *selectedSuggestion;
  NSObject *v8;
  void *v9;
  ATXProactiveSuggestion *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  ATXProactiveSuggestion *v16;
  uint64_t v17;
  CGPoint v18;

  y = a3.y;
  x = a3.x;
  v17 = *MEMORY[0x24BDAC8D0];
  -[APUISuggestionsWidgetView suggestionAtLocation:](self->_widgetView, "suggestionAtLocation:");
  v6 = (ATXProactiveSuggestion *)objc_claimAutoreleasedReturnValue();
  selectedSuggestion = self->_selectedSuggestion;
  self->_selectedSuggestion = v6;

  __atxlog_handle_ui();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v18.x = x;
    v18.y = y;
    NSStringFromCGPoint(v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_selectedSuggestion;
    v11 = 136446722;
    v12 = "-[APUISuggestionsWidgetViewController willShowContextMenuAtLocation:]";
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_219979000, v8, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s location=%@ _selectedSuggestion=%@", (uint8_t *)&v11, 0x20u);

  }
}

- (NSArray)applicationShortcutItems
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (-[APUISuggestionsWidgetViewController _canDismissSelectedSuggestion](self, "_canDismissSelectedSuggestion"))
  {
    +[APUIAppIconGridView createDismissSuggestionApplicationShortcutItemWithType:localizedName:](APUIAppIconGridView, "createDismissSuggestionApplicationShortcutItemWithType:localizedName:", CFSTR("com.apple.AppPredictionUIWidget.application-shortcut-item.dismiss-suggestion"), &stru_24DB7DD40);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBD1A8], "arrayByAddingObject:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }
  if (-[APUISuggestionsWidgetViewController _canSaveSelectedSuggestion](self, "_canSaveSelectedSuggestion"))
  {
    +[APUIAppIconGridView createDismissSuggestionApplicationShortcutItemWithType:localizedName:](APUIAppIconGridView, "createDismissSuggestionApplicationShortcutItemWithType:localizedName:", CFSTR("com.apple.AppPredictionUIWidget.application-shortcut-item.save-suggestion"), &stru_24DB7DD40);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayByAddingObject:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return (NSArray *)v4;
}

- (BOOL)_canDismissSelectedSuggestion
{
  void *v3;
  ATXProactiveSuggestion *selectedSuggestion;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[APUIWidgetViewController suggestionClient](self, "suggestionClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  selectedSuggestion = self->_selectedSuggestion;
  -[APUIWidgetViewController layout](self, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(selectedSuggestion) = objc_msgSend(v3, "isSuggestionReplacementAvailableForSuggestion:inLayout:", selectedSuggestion, v5);

  if ((selectedSuggestion & 1) == 0)
  {
    __atxlog_handle_ui();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136446210;
      v12 = "-[APUISuggestionsWidgetViewController _canDismissSelectedSuggestion]";
      v9 = "SuggestionsWidget: %{public}s No replacement available for _selectedSuggestion";
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  -[ATXProactiveSuggestion executableSpecification](self->_selectedSuggestion, "executableSpecification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "executableType");

  if (v7 == 5)
  {
    __atxlog_handle_ui();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136446210;
      v12 = "-[APUISuggestionsWidgetViewController _canDismissSelectedSuggestion]";
      v9 = "SuggestionsWidget: %{public}s _selectedSuggestion is App Clip";
LABEL_7:
      _os_log_impl(&dword_219979000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return 1;
}

- (BOOL)_canSaveSelectedSuggestion
{
  NSObject *v2;
  const char *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (!self->_selectedSuggestion)
  {
    __atxlog_handle_ui();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136446210;
      v6 = "-[APUISuggestionsWidgetViewController _canSaveSelectedSuggestion]";
      v3 = "SuggestionsWidget: %{public}s NO: _selectedSuggestion is null";
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  if (objc_msgSend((id)objc_opt_class(), "_isSuggestionShortcut:", self->_selectedSuggestion))
  {
    __atxlog_handle_ui();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136446210;
      v6 = "-[APUISuggestionsWidgetViewController _canSaveSelectedSuggestion]";
      v3 = "SuggestionsWidget: %{public}s NO: _selectedSuggestion is already shortcut";
LABEL_7:
      _os_log_impl(&dword_219979000, v2, OS_LOG_TYPE_DEFAULT, v3, (uint8_t *)&v5, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return 1;
}

- (void)didSelectApplicationShortcutItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ATXProactiveSuggestion *v7;
  ATXProactiveSuggestion *selectedSuggestion;
  NSObject *v9;
  ATXProactiveSuggestion *v10;
  NSObject *v11;
  void *v12;
  ATXProactiveSuggestion *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  int v23;
  const char *v24;
  __int16 v25;
  ATXProactiveSuggestion *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_selectedSuggestion)
    goto LABEL_5;
  -[APUIWidgetViewController layout](self, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minSuggestionListInLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "firstObject");
    v7 = (ATXProactiveSuggestion *)objc_claimAutoreleasedReturnValue();
    selectedSuggestion = self->_selectedSuggestion;
    self->_selectedSuggestion = v7;

  }
  if (self->_selectedSuggestion)
  {
LABEL_5:
    __atxlog_handle_ui();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_selectedSuggestion;
      v23 = 136446466;
      v24 = "-[APUISuggestionsWidgetViewController didSelectApplicationShortcutItem:]";
      v25 = 2112;
      v26 = v10;
      _os_log_impl(&dword_219979000, v9, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s _selectedSuggestion=%@", (uint8_t *)&v23, 0x16u);
    }

    objc_msgSend(v4, "type");
    v11 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isEqualToString:](v11, "isEqualToString:", CFSTR("com.apple.AppPredictionUIWidget.application-shortcut-item.dismiss-suggestion")))
    {
      -[APUIWidgetViewController suggestionClient](self, "suggestionClient");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = self->_selectedSuggestion;
      -[APUIWidgetViewController widgetIdentifiable](self, "widgetIdentifiable");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[APUIWidgetViewController layout](self, "layout");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logContextMenuDismissOnceForSuggestion:widget:blendingCacheId:", v13, v14, v17);

LABEL_14:
      goto LABEL_20;
    }
    if (-[NSObject isEqualToString:](v11, "isEqualToString:", CFSTR("com.apple.AppPredictionUIWidget.application-shortcut-item.save-suggestion")))
    {
      __atxlog_handle_ui();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 136446210;
        v24 = "-[APUISuggestionsWidgetViewController didSelectApplicationShortcutItem:]";
        _os_log_impl(&dword_219979000, v18, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s saving it", (uint8_t *)&v23, 0xCu);
      }

      objc_msgSend((id)objc_opt_class(), "_shortcutWithSuggestion:", self->_selectedSuggestion);
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v12 = (void *)v19;
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA4E8]), "initWithShortcut:", v19);
        objc_msgSend(v20, "setDelegate:", self);
        objc_msgSend(v20, "setModalPresentationStyle:", -2);
        -[APUISuggestionsWidgetViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v20, 1, 0);

        goto LABEL_14;
      }
    }
    __atxlog_handle_ui();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[APUISuggestionsWidgetViewController didSelectApplicationShortcutItem:].cold.2((uint64_t)v11, v21, v22);

  }
  else
  {
    __atxlog_handle_ui();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[APUISuggestionsWidgetViewController didSelectApplicationShortcutItem:].cold.1(self, v11);
  }
LABEL_20:

}

+ (id)_shortcutWithSuggestion:(id)a3
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  id v10;
  void *v11;
  void *v12;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_actionWithSuggestion:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_ui();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136446466;
    v15 = "+[APUISuggestionsWidgetViewController _shortcutWithSuggestion:]";
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_219979000, v4, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s atxAction=%@", (uint8_t *)&v14, 0x16u);
  }

  if (objc_msgSend(v3, "actionType") && objc_msgSend(v3, "actionType") != 2)
  {
    if (objc_msgSend(v3, "actionType") == 1)
    {
      v10 = objc_alloc(MEMORY[0x24BDDA168]);
      objc_msgSend(v3, "userActivity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bundleId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v10, "initWithUserActivity:bundleIdentifier:", v11, v12);

      __atxlog_handle_ui();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      v14 = 136446466;
      v15 = "+[APUISuggestionsWidgetViewController _shortcutWithSuggestion:]";
      v16 = 2112;
      v17 = v7;
      v9 = "SuggestionsWidget: %{public}s ATXActionTypeNSUserActivity shortcut=%@";
      goto LABEL_7;
    }
    __atxlog_handle_ui();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136446466;
      v15 = "+[APUISuggestionsWidgetViewController _shortcutWithSuggestion:]";
      v16 = 2112;
      v17 = 0;
      _os_log_impl(&dword_219979000, v8, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s action type not handled shortcut=%@", (uint8_t *)&v14, 0x16u);
    }
    v7 = 0;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x24BDDA168]);
    objc_msgSend(v3, "intent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithIntent:", v6);

    __atxlog_handle_ui();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136446466;
      v15 = "+[APUISuggestionsWidgetViewController _shortcutWithSuggestion:]";
      v16 = 2112;
      v17 = v7;
      v9 = "SuggestionsWidget: %{public}s ATXActionTypeIntent or ATXActionTypeOFA shortcut=%@";
LABEL_7:
      _os_log_impl(&dword_219979000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, 0x16u);
    }
  }
LABEL_14:

  return v7;
}

+ (BOOL)_isSuggestionShortcut:(id)a3
{
  void *v3;
  void *v4;
  char isKindOfClass;

  objc_msgSend(a1, "_actionWithSuggestion:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (id)_actionWithSuggestion:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "executableSpecification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executableObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (void)addVoiceShortcutViewController:(id)a3 didFinishWithVoiceShortcut:(id)a4 error:(id)a5
{
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
  __atxlog_handle_ui();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446466;
    v9 = "-[APUISuggestionsWidgetViewController addVoiceShortcutViewController:didFinishWithVoiceShortcut:error:]";
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_219979000, v7, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s didFinishWithVoiceShortcut=%@", (uint8_t *)&v8, 0x16u);
  }

}

- (void)addVoiceShortcutViewControllerDidCancel:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
  __atxlog_handle_ui();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446210;
    v5 = "-[APUISuggestionsWidgetViewController addVoiceShortcutViewControllerDidCancel:]";
    _os_log_impl(&dword_219979000, v3, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s addVoiceShortcutViewControllerDidCancel", (uint8_t *)&v4, 0xCu);
  }

}

- (BOOL)isShowingContextMenu
{
  return self->_showingContextMenu;
}

- (APUISuggestionsWidgetView)widgetView
{
  return self->_widgetView;
}

- (void)setWidgetView:(id)a3
{
  objc_storeStrong((id *)&self->_widgetView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetView, 0);
  objc_storeStrong((id *)&self->_selectedSuggestion, 0);
}

- (void)didSelectApplicationShortcutItem:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 134218242;
  v5 = 5517;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_219979000, a2, OS_LOG_TYPE_ERROR, "e:%ld * SuggestionsWidget: No selected suggestion found in layout %@", (uint8_t *)&v4, 0x16u);

  OUTLINED_FUNCTION_2();
}

- (void)didSelectApplicationShortcutItem:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_219979000, a2, a3, "e:fault SuggestionsWidget: didSelectApplicationShortcutItem: %@ is not valid for Suggestions Widget", (uint8_t *)&v3);
}

@end
