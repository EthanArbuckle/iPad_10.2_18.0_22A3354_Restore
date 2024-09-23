@implementation APUISuggestionsWidgetView

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)APUISuggestionsWidgetView;
  -[APUISuggestionsWidgetView layoutSubviews](&v3, sel_layoutSubviews);
  -[APUISuggestionsWidgetView _setupStackViewIfNecessary](self, "_setupStackViewIfNecessary");
}

- (void)_setupStackViewIfNecessary
{
  void *v3;
  id v4;
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
  _QWORD v28[5];

  v28[4] = *MEMORY[0x24BDAC8D0];
  -[APUISuggestionsWidgetView stackView](self, "stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDF6DD0]);
    -[APUISuggestionsWidgetView setStackView:](self, "setStackView:", v4);

    -[APUISuggestionsWidgetView stackView](self, "stackView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAxis:", 0);

    -[APUISuggestionsWidgetView stackView](self, "stackView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDistribution:", 1);

    -[APUISuggestionsWidgetView stackView](self, "stackView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[APUISuggestionsWidgetView stackView](self, "stackView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSpacing:", 0.0);

    -[APUISuggestionsWidgetView stackView](self, "stackView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUISuggestionsWidgetView addSubview:](self, "addSubview:", v9);

    v20 = (void *)MEMORY[0x24BDD1628];
    -[APUISuggestionsWidgetView stackView](self, "stackView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUISuggestionsWidgetView leadingAnchor](self, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v24;
    -[APUISuggestionsWidgetView trailingAnchor](self, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUISuggestionsWidgetView stackView](self, "stackView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v10;
    -[APUISuggestionsWidgetView stackView](self, "stackView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUISuggestionsWidgetView topAnchor](self, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v14;
    -[APUISuggestionsWidgetView bottomAnchor](self, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUISuggestionsWidgetView stackView](self, "stackView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activateConstraints:", v19);

  }
}

- (void)updateWithSuggestionLayout:(id)a3
{
  ATXSuggestionLayout *v5;
  ATXSuggestionLayout *v6;
  NSObject *v7;
  ATXSuggestionLayout *suggestionLayout;
  APUISuggestionsWidgetView *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  ATXSuggestionLayout *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = (ATXSuggestionLayout *)a3;
  v6 = v5;
  if (v5)
  {
    if (self->_suggestionLayout != v5
      || objc_msgSend((id)objc_opt_class(), "_shouldDisplayRecentDonationsOrUpcomingMediaForTesting"))
    {
      objc_storeStrong((id *)&self->_suggestionLayout, a3);
      __atxlog_handle_home_screen();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        suggestionLayout = self->_suggestionLayout;
        v11 = 136315394;
        v12 = "-[APUISuggestionsWidgetView updateWithSuggestionLayout:]";
        v13 = 2112;
        v14 = suggestionLayout;
        _os_log_impl(&dword_219979000, v7, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %s:  _suggestionLayout:%@", (uint8_t *)&v11, 0x16u);
      }

      switch(-[ATXSuggestionLayout layoutType](v6, "layoutType"))
      {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 6:
        case 7:
        case 8:
        case 10:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
          -[APUISuggestionsWidgetView _layoutNotSupported:](self, "_layoutNotSupported:", -[ATXSuggestionLayout layoutType](v6, "layoutType"));
          break;
        case 5:
          -[APUISuggestionsWidgetView _layoutOne2x2](self, "_layoutOne2x2");
          break;
        case 9:
          v9 = self;
          v10 = 2;
          goto LABEL_13;
        case 11:
          v9 = self;
          v10 = 4;
LABEL_13:
          -[APUISuggestionsWidgetView _layout1x4WithRowCount:](v9, "_layout1x4WithRowCount:", v10);
          break;
        default:
          break;
      }
    }
  }
  else
  {
    -[APUISuggestionsWidgetView _displayNoSuggestions](self, "_displayNoSuggestions");
  }

}

- (void)_layoutNotSupported:(int64_t)a3
{
  NSObject *v5;
  NSObject *v6;

  __atxlog_handle_home_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[APUISuggestionsWidgetView _layoutNotSupported:].cold.2(a3);

  __atxlog_handle_ui();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    -[APUISuggestionsWidgetView _layoutNotSupported:].cold.1(a3, v6);

  -[APUISuggestionsWidgetView _displayNoSuggestions](self, "_displayNoSuggestions");
}

- (void)_clearStackView
{
  NSMutableArray *v3;
  NSMutableArray *containerViews;
  UIStackView *stackView;

  v3 = (NSMutableArray *)objc_opt_new();
  containerViews = self->_containerViews;
  self->_containerViews = v3;

  -[UIStackView removeFromSuperview](self->_stackView, "removeFromSuperview");
  stackView = self->_stackView;
  self->_stackView = 0;

  -[APUISuggestionsWidgetView _setupStackViewIfNecessary](self, "_setupStackViewIfNecessary");
}

- (void)_displayNoSuggestions
{
  NSObject *v3;
  id v4;
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
  uint8_t buf[16];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  __atxlog_handle_home_screen();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219979000, v3, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: no suggestions to display!", buf, 2u);
  }

  -[APUISuggestionsWidgetView _clearStackView](self, "_clearStackView");
  v4 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("No Suggestions Available"), &stru_24DB7DD40, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v6);

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v7);

  objc_msgSend(v4, "setNumberOfLines:", 0);
  objc_msgSend(v4, "setTextAlignment:", 1);
  -[APUISuggestionsWidgetView stackView](self, "stackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v4);

  v18 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v4, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v9, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  -[UIStackView trailingAnchor](self->_stackView, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v12, 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v13;
  -[UIStackView centerYAnchor](self->_stackView, "centerYAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerYAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 0.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v17);

}

- (void)_layout1x4WithRowCount:(unint64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  __atxlog_handle_ui();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v11 = "-[APUISuggestionsWidgetView _layout1x4WithRowCount:]";
    v12 = 2048;
    v13 = a3;
    _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s:%lu", buf, 0x16u);
  }

  self->_platterSize = 2;
  v6 = objc_msgSend((id)objc_opt_class(), "_shouldDisplayRecentDonationsOrUpcomingMediaForTesting");
  if ((_DWORD)v6)
  {
    __atxlog_handle_home_screen();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[APUISuggestionsWidgetView _layout1x4WithRowCount:]";
      _os_log_impl(&dword_219979000, v7, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %s: displayRecentDonations developer switch on. Getting recent donations asynchronously", buf, 0xCu);
    }

    v8 = 0;
  }
  else
  {
    -[ATXSuggestionLayout oneByFourSuggestions](self->_suggestionLayout, "oneByFourSuggestions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__APUISuggestionsWidgetView__layout1x4WithRowCount___block_invoke;
  v9[3] = &unk_24DB7DB88;
  v9[4] = self;
  v9[5] = a3;
  -[APUISuggestionsWidgetView _checkOrLoadSuggestions:inDeveloperMode:rowCount:completion:](self, "_checkOrLoadSuggestions:inDeveloperMode:rowCount:completion:", v8, v6, a3, v9);

}

void __52__APUISuggestionsWidgetView__layout1x4WithRowCount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_clearStackView");
  objc_msgSend(*(id *)(a1 + 32), "stackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAxis:", 1);

  objc_msgSend(*(id *)(a1 + 32), "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlignment:", 1);

  if (objc_msgSend(v3, "count") == *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "logLayoutSuggestions:", v3);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(a1 + 32), "_addFullWidthWidgetContainerViewWithSuggestion:withTopSeparator:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++), v9 & 1, (_QWORD)v13);
          v9 = 1;
        }
        while (v8 != v11);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    __atxlog_handle_home_screen();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __52__APUISuggestionsWidgetView__layout1x4WithRowCount___block_invoke_cold_1((uint64_t *)(a1 + 40), v3, v12);

    objc_msgSend(*(id *)(a1 + 32), "_displayNoSuggestions");
  }

}

- (void)addSeparatorViewToView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
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
  _QWORD v23[5];

  v23[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDF6950], "separatorColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  objc_msgSend(v4, "addSubview:", v5);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = 1.0 / v8;

  v19 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v5, "heightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToConstant:", v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v21;
  objc_msgSend(v5, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[APUISuggestionsWidgetView leadingAnchor](self, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v10, 16.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v11;
  objc_msgSend(v5, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[APUISuggestionsWidgetView trailingAnchor](self, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v14;
  objc_msgSend(v5, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v18);

}

- (void)_layoutOne2x2
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  __atxlog_handle_ui();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v9 = "-[APUISuggestionsWidgetView _layoutOne2x2]";
    _os_log_impl(&dword_219979000, v3, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s", buf, 0xCu);
  }

  self->_platterSize = 1;
  v4 = objc_msgSend((id)objc_opt_class(), "_shouldDisplayRecentDonationsOrUpcomingMediaForTesting");
  if ((_DWORD)v4)
  {
    __atxlog_handle_home_screen();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[APUISuggestionsWidgetView _layoutOne2x2]";
      _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %s: displayRecentDonations developer switch on. Getting recent donations asynchronously", buf, 0xCu);
    }

    v6 = 0;
  }
  else
  {
    -[ATXSuggestionLayout twoByTwoSuggestions](self->_suggestionLayout, "twoByTwoSuggestions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__APUISuggestionsWidgetView__layoutOne2x2__block_invoke;
  v7[3] = &unk_24DB7DBB0;
  v7[4] = self;
  -[APUISuggestionsWidgetView _checkOrLoadSuggestions:inDeveloperMode:rowCount:completion:](self, "_checkOrLoadSuggestions:inDeveloperMode:rowCount:completion:", v6, v4, 1, v7);

}

void __42__APUISuggestionsWidgetView__layoutOne2x2__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_clearStackView");
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
    {
      v6 = *(void **)(a1 + 32);
      v12[0] = v4;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logLayoutSuggestions:", v7);

      v8 = *(void **)(a1 + 32);
      objc_msgSend(v8, "stackView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v8, "_addWidgetContainerViewWithSuggestion:toVerticalStackView:", v5, v9);

    }
  }
  else
  {
    __atxlog_handle_home_screen();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __42__APUISuggestionsWidgetView__layoutOne2x2__block_invoke_cold_1(v3);

    objc_msgSend(*(id *)(a1 + 32), "_displayNoSuggestions");
  }

}

- (void)_checkOrLoadSuggestions:(id)a3 inDeveloperMode:(BOOL)a4 rowCount:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  APUISuggestionsWidgetView *v17;
  id v18;
  unint64_t v19;
  BOOL v20;

  v10 = a3;
  v11 = a6;
  dispatch_get_global_queue(25, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__APUISuggestionsWidgetView__checkOrLoadSuggestions_inDeveloperMode_rowCount_completion___block_invoke;
  block[3] = &unk_24DB7DC00;
  v20 = a4;
  v16 = v10;
  v17 = self;
  v18 = v11;
  v19 = a5;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, block);

}

void __89__APUISuggestionsWidgetView__checkOrLoadSuggestions_inDeveloperMode_rowCount_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = *(id *)(a1 + 32);
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend((id)objc_opt_class(), "_developerModeSuggestions:", *(_QWORD *)(a1 + 56));
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v3;
  }
  objc_msgSend(*(id *)(a1 + 40), "_validSuggestionsWithSuggestions:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __89__APUISuggestionsWidgetView__checkOrLoadSuggestions_inDeveloperMode_rowCount_completion___block_invoke_2;
  v7[3] = &unk_24DB7DBD8;
  v5 = *(id *)(a1 + 48);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __89__APUISuggestionsWidgetView__checkOrLoadSuggestions_inDeveloperMode_rowCount_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)_validSuggestionsWithSuggestions:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  __atxlog_handle_home_screen();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[APUISuggestionsWidgetView _validSuggestionsWithSuggestions:]";
    v26 = 2048;
    v27 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_219979000, v6, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %s:  validating %lu  suggestions", buf, 0x16u);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v20;
    *(_QWORD *)&v9 = 136315394;
    v18 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v13, "isValidForSuggestionsWidget", v18, (_QWORD)v19)
          && -[APUISuggestionsWidgetView _hasBundleInstalledAndNotRestrictedForSuggestion:](self, "_hasBundleInstalledAndNotRestrictedForSuggestion:", v13))
        {
          objc_msgSend(v5, "addObject:", v13);
        }
        else
        {
          __atxlog_handle_home_screen();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            v25 = "-[APUISuggestionsWidgetView _validSuggestionsWithSuggestions:]";
            v26 = 2112;
            v27 = (uint64_t)v13;
            _os_log_error_impl(&dword_219979000, v14, OS_LOG_TYPE_ERROR, "%s:  invalid suggestion: %@", buf, 0x16u);
          }

        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  __atxlog_handle_home_screen();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 136315394;
    v25 = "-[APUISuggestionsWidgetView _validSuggestionsWithSuggestions:]";
    v26 = 2048;
    v27 = v16;
    _os_log_impl(&dword_219979000, v15, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %s:  %lu valid suggestions", buf, 0x16u);
  }

  return v5;
}

- (BOOL)_hasBundleInstalledAndNotRestrictedForSuggestion:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  uint64_t v22;
  char v24;

  v3 = a3;
  objc_msgSend(v3, "executableSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "executableType");

  objc_msgSend(v3, "executableSpecification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == 1)
  {
    objc_msgSend(v6, "executableClassString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqualToString:", v10);

    if (v11)
    {
      v12 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(v3, "executableSpecification");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "executable");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v12, "initWithData:encoding:", v14, 4);

      if ((objc_msgSend(MEMORY[0x24BE04100], "isInstalledAndNotRestrictedForBundle:", v15) & 1) == 0)
        goto LABEL_14;
LABEL_11:
      v20 = 1;
      goto LABEL_17;
    }
  }
  else
  {
    v16 = objc_msgSend(v6, "executableType");

    if (v16 != 2)
    {
      v15 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v3, "executableSpecification");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "executableObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v18, "bundleId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      ATXBundleIdReplacementForBundleId();
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        if (objc_msgSend(MEMORY[0x24BE04100], "isInstalledAndNotRestrictedForBundle:", v15))
        {

        }
        else
        {
          v24 = objc_msgSend(MEMORY[0x24BE04100], "isAppClipWebClipBundleId:", v15);

          if ((v24 & 1) == 0)
            goto LABEL_14;
        }
        goto LABEL_11;
      }
    }

  }
  v15 = 0;
LABEL_14:
  __atxlog_handle_home_screen();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    -[APUISuggestionsWidgetView _hasBundleInstalledAndNotRestrictedForSuggestion:].cold.1((uint64_t)v15, v21, v22);

  v20 = 0;
LABEL_17:

  return v20;
}

- (void)logLayoutSuggestions:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[4];
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  __atxlog_handle_home_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[APUISuggestionsWidgetView logLayoutSuggestions:].cold.3(v3, v4);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        __atxlog_handle_home_screen();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[APUISuggestionsWidgetView logLayoutSuggestions:].cold.2(v17, v10, &v18, v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v7);
  }

  __atxlog_handle_home_screen();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[APUISuggestionsWidgetView logLayoutSuggestions:].cold.1(v12);

}

- (void)_addFullWidthWidgetContainerViewWithSuggestion:(id)a3 withTopSeparator:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
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
  id v18;
  _QWORD v19[3];

  v4 = a4;
  v19[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[APUISuggestionsWidgetView stackView](self, "stackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[APUISuggestionsWidgetView _addWidgetContainerViewWithSuggestion:toVerticalStackView:](self, "_addWidgetContainerViewWithSuggestion:toVerticalStackView:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[APUISuggestionsWidgetView addSeparatorViewToView:](self, "addSeparatorViewToView:", v8);
  objc_msgSend(v8, "leadingAnchor", MEMORY[0x24BDD1628]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[APUISuggestionsWidgetView stackView](self, "stackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  -[APUISuggestionsWidgetView stackView](self, "stackView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v17);

}

- (id)_addWidgetContainerViewWithSuggestion:(id)a3 toVerticalStackView:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  __atxlog_handle_ui();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136446466;
    v12 = "-[APUISuggestionsWidgetView _addWidgetContainerViewWithSuggestion:toVerticalStackView:]";
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_219979000, v8, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s:%@", (uint8_t *)&v11, 0x16u);
  }

  -[APUISuggestionsWidgetView _createWidgetContainerViewWithSuggestion:](self, "_createWidgetContainerViewWithSuggestion:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addArrangedSubview:", v9);

  return v9;
}

- (id)_createWidgetContainerViewWithSuggestion:(id)a3
{
  id v4;
  APUIWidgetContainerView *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(APUIWidgetContainerView);
  -[APUISuggestionsWidgetView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[APUIWidgetContainerView setDelegate:](v5, "setDelegate:", v6);

  -[APUIWidgetContainerView setPlatterSize:](v5, "setPlatterSize:", self->_platterSize);
  -[APUIWidgetContainerView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[APUIWidgetContainerView displaySuggestion:](v5, "displaySuggestion:", v4);

  -[NSMutableArray addObject:](self->_containerViews, "addObject:", v5);
  return v5;
}

- (void)highlightSuggestion:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint8_t v28[128];
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  __atxlog_handle_ui();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v30 = "-[APUISuggestionsWidgetView highlightSuggestion:]";
    _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s", buf, 0xCu);
  }

  if (v4)
  {
    v25 = 0uLL;
    v26 = 0uLL;
    v23 = 0uLL;
    v24 = 0uLL;
    v6 = self->_containerViews;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v11, "suggestion");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v4, "isEqual:", v12);

          if (v13)
            v14 = 1.0;
          else
            v14 = 0.3;
          objc_msgSend(v11, "setAlpha:", v14);
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v8);
    }
  }
  else
  {
    v21 = 0uLL;
    v22 = 0uLL;
    v19 = 0uLL;
    v20 = 0uLL;
    v6 = self->_containerViews;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "setAlpha:", 1.0, (_QWORD)v19);
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v16);
    }
  }

}

- (id)suggestionAtLocation:(CGPoint)a3
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[APUISuggestionsWidgetView hitTest:withEvent:](self, "hitTest:withEvent:", 0, a3.x, a3.y);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "apuiFindInnermostSuperviewOfClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_home_screen();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "uiSpecification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v8;
    _os_log_impl(&dword_219979000, v6, OS_LOG_TYPE_DEFAULT, "suggestionAtLocation %@", (uint8_t *)&v10, 0xCu);

  }
  return v5;
}

+ (BOOL)_shouldDisplayRecentDonationsOrUpcomingMediaForTesting
{
  return CFPreferencesGetAppBooleanValue(CFSTR("displayRecentDonations"), CFSTR("com.apple.duetexpertd"), 0)
      || CFPreferencesGetAppBooleanValue(CFSTR("displayUpcomingMedia"), CFSTR("com.apple.duetexpertd"), 0) != 0;
}

+ (id)_developerModeSuggestions:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BE040D0], "actionResponseForDeveloperMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proactiveSuggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (objc_msgSend(v6, "count") >= a3)
  {
    objc_msgSend(v6, "subarrayWithRange:", 0, a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v6, "count"))
    {
      v7 = objc_msgSend(v6, "count");
      v8 = a3 - v7;
      if (a3 > v7)
      {
        do
        {
          objc_msgSend(v6, "lastObject");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v9);

          --v8;
        }
        while (v8);
      }
    }
    v10 = v6;
  }
  v11 = v10;

  return v11;
}

- (APUISuggestionsWidgetViewDelegate)delegate
{
  return (APUISuggestionsWidgetViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_containerViews, 0);
  objc_storeStrong((id *)&self->_suggestionLayout, 0);
}

- (void)_layoutNotSupported:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE79B58], "stringFromUILayoutType:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_219979000, a2, OS_LOG_TYPE_FAULT, "e:fault SuggestionsWidget: layout %@ not supported", v4, 0xCu);

  OUTLINED_FUNCTION_2();
}

- (void)_layoutNotSupported:(uint64_t)a1 .cold.2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BE79B58], "stringFromUILayoutType:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_219979000, v2, v3, "SuggestionsWidget: layout %{public}@ not supported", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __52__APUISuggestionsWidgetView__layout1x4WithRowCount___block_invoke_cold_1(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *a1;
  v6 = 134218240;
  v7 = v4;
  v8 = 2048;
  v9 = objc_msgSend(a2, "count");
  OUTLINED_FUNCTION_1_1(&dword_219979000, a3, v5, "SuggestionsWidget: need %lu valid suggestions for _layoutTwo1x4. Got %lu", (uint8_t *)&v6);
  OUTLINED_FUNCTION_2();
}

void __42__APUISuggestionsWidgetView__layoutOne2x2__block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_219979000, v1, v2, "Need 1 suggestion for _layoutOne2x2. Got %lu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

- (void)_hasBundleInstalledAndNotRestrictedForSuggestion:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = "-[APUISuggestionsWidgetView _hasBundleInstalledAndNotRestrictedForSuggestion:]";
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_1_1(&dword_219979000, a2, a3, "%s:  bundle id %@ is not installed or is restricted", (uint8_t *)&v3);
}

- (void)logLayoutSuggestions:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_219979000, log, OS_LOG_TYPE_DEBUG, "SuggestionsWidget: ]", v1, 2u);
}

- (void)logLayoutSuggestions:(_QWORD *)a3 .cold.2(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;
  void *v8;

  objc_msgSend(a2, "executableSpecification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "executableDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v8;
  _os_log_debug_impl(&dword_219979000, a4, OS_LOG_TYPE_DEBUG, "SuggestionsWidget: suggestion executable:%@", a1, 0xCu);

}

- (void)logLayoutSuggestions:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_219979000, a2, OS_LOG_TYPE_DEBUG, "SuggestionsWidget:  %lu suggestions[", v3, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
