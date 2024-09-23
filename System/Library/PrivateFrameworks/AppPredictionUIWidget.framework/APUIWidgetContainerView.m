@implementation APUIWidgetContainerView

- (void)_createStackViewIfNeeded
{
  UIStackView *v3;
  UIStackView *stackView;
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
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  if (!self->_stackView)
  {
    v3 = (UIStackView *)objc_alloc_init(MEMORY[0x24BDF6DD0]);
    stackView = self->_stackView;
    self->_stackView = v3;

    -[UIStackView setDistribution:](self->_stackView, "setDistribution:", 0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[APUIWidgetContainerView addSubview:](self, "addSubview:", self->_stackView);
    v15 = (void *)MEMORY[0x24BDD1628];
    -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUIWidgetContainerView leadingAnchor](self, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v16;
    -[UIStackView topAnchor](self->_stackView, "topAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUIWidgetContainerView topAnchor](self, "topAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintEqualToAnchor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v7;
    -[APUIWidgetContainerView trailingAnchor](self, "trailingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView trailingAnchor](self->_stackView, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v10;
    -[APUIWidgetContainerView bottomAnchor](self, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView bottomAnchor](self->_stackView, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activateConstraints:", v14);

  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)APUIWidgetContainerView;
  -[APUIWidgetContainerView touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
  -[APUIWidgetContainerView setViewPressed:](self, "setViewPressed:", 1);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)APUIWidgetContainerView;
  -[APUIWidgetContainerView touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  -[APUIWidgetContainerView setViewPressed:](self, "setViewPressed:", 0);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)APUIWidgetContainerView;
  -[APUIWidgetContainerView touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  -[APUIWidgetContainerView setViewPressed:](self, "setViewPressed:", 0);
}

- (void)setViewPressed:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BA8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUIWidgetContainerView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFilters:", v6);

    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.6, 1.0);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v4, "setValue:forKey:", objc_msgSend(v7, "CGColor"), CFSTR("inputColor"));

    -[APUIWidgetContainerView setSuggestionViewLabelsAlpha:](self, "setSuggestionViewLabelsAlpha:", 0.5);
  }
  else
  {
    -[APUIWidgetContainerView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFilters:", 0);

    -[APUIWidgetContainerView setSuggestionViewLabelsAlpha:](self, "setSuggestionViewLabelsAlpha:", 1.0);
  }
}

- (void)setSuggestionViewLabelsAlpha:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[APUISuggestionView labels](self->_suggestionView, "labels", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setAlpha:", a3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)setSuggestion:(id)a3 inView:(id)a4
{
  ATXProactiveSuggestion *v6;
  APUISuggestionView *v7;
  ATXProactiveSuggestion *suggestion;
  APUISuggestionView *suggestionView;
  APUISuggestionView *v10;
  void *v11;
  ATXProactiveSuggestion *v12;

  v6 = (ATXProactiveSuggestion *)a3;
  v7 = (APUISuggestionView *)a4;
  suggestion = self->_suggestion;
  self->_suggestion = v6;
  v12 = v6;

  suggestionView = self->_suggestionView;
  self->_suggestionView = v7;
  v10 = v7;

  -[APUIWidgetContainerView _createStackViewIfNeeded](self, "_createStackViewIfNeeded");
  -[APUIWidgetContainerView delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[APUISuggestionView setDelegate:](v10, "setDelegate:", v11);

  -[APUISuggestionView setPlatterSize:](v10, "setPlatterSize:", -[APUIWidgetContainerView platterSize](self, "platterSize"));
  -[APUISuggestionView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[APUISuggestionView setCanEngageSuggestion:](v10, "setCanEngageSuggestion:", 1);
  -[APUISuggestionView layoutSuggestion:](v10, "layoutSuggestion:", v12);
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", v10);

}

- (void)_setAppClipSuggestion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  __atxlog_handle_ui();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136446466;
    v10 = "-[APUIWidgetContainerView _setAppClipSuggestion:]";
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s:%@", (uint8_t *)&v9, 0x16u);

  }
  v8 = (void *)objc_opt_new();
  -[APUIWidgetContainerView setSuggestion:inView:](self, "setSuggestion:inView:", v4, v8);

}

- (void)_setAppSuggestion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  __atxlog_handle_ui();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136446466;
    v10 = "-[APUIWidgetContainerView _setAppSuggestion:]";
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s:%@", (uint8_t *)&v9, 0x16u);

  }
  v8 = (void *)objc_opt_new();
  -[APUIWidgetContainerView setSuggestion:inView:](self, "setSuggestion:inView:", v4, v8);

}

- (void)_setActionSuggestion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  APUIActionSuggestionView *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  __atxlog_handle_ui();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136446466;
    v10 = "-[APUIWidgetContainerView _setActionSuggestion:]";
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s:%@", (uint8_t *)&v9, 0x16u);

  }
  v8 = objc_alloc_init(APUIActionSuggestionView);
  -[APUIWidgetContainerView setSuggestion:inView:](self, "setSuggestion:inView:", v4, v8);

}

- (void)_setLinkSuggestion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  APUILinkSuggestionView *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  __atxlog_handle_ui();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136446466;
    v10 = "-[APUIWidgetContainerView _setLinkSuggestion:]";
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s:%@", (uint8_t *)&v9, 0x16u);

  }
  v8 = objc_alloc_init(APUILinkSuggestionView);
  -[APUIWidgetContainerView setSuggestion:inView:](self, "setSuggestion:inView:", v4, v8);

}

- (void)_displayNoSuggestionsWithSuggestion:(id)a3
{
  id v4;
  NSObject *v5;
  ATXProactiveSuggestion *suggestion;

  v4 = a3;
  __atxlog_handle_ui();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[APUIWidgetContainerView _displayNoSuggestionsWithSuggestion:].cold.1((uint64_t)v4, v5);

  suggestion = self->_suggestion;
  self->_suggestion = 0;

  -[APUIWidgetContainerView _createStackViewIfNeeded](self, "_createStackViewIfNeeded");
}

- (void)displaySuggestion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  APUIWidgetContainerView *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[APUIWidgetContainerView setSuggestion:](self, "setSuggestion:", v4);
  if (!v4)
  {
    v11 = self;
    v12 = 0;
LABEL_7:
    -[APUIWidgetContainerView _displayNoSuggestionsWithSuggestion:](v11, "_displayNoSuggestionsWithSuggestion:", v12);
    goto LABEL_14;
  }
  __atxlog_handle_ui();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executableSpecification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 136446722;
    v20 = "-[APUIWidgetContainerView displaySuggestion:]";
    v21 = 2112;
    v22 = v7;
    v23 = 2048;
    v24 = objc_msgSend(v8, "executableType");
    _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: %{public}s:%@ executableSpecification: %ld", (uint8_t *)&v19, 0x20u);

  }
  objc_msgSend(v4, "executableSpecification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "executableType");

  if (v10 != 5)
  {
    objc_msgSend(v4, "executableSpecification");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "executableType");

    if (v14 == 1)
    {
      -[APUIWidgetContainerView _setAppSuggestion:](self, "_setAppSuggestion:", v4);
      goto LABEL_14;
    }
    objc_msgSend(v4, "executableSpecification");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "executableType");

    if (v16 == 2)
    {
      -[APUIWidgetContainerView _setActionSuggestion:](self, "_setActionSuggestion:", v4);
      goto LABEL_14;
    }
    objc_msgSend(v4, "executableSpecification");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "executableType");

    v11 = self;
    v12 = v4;
    if (v18 == 10)
    {
      -[APUIWidgetContainerView _setLinkSuggestion:](self, "_setLinkSuggestion:", v4);
      goto LABEL_14;
    }
    goto LABEL_7;
  }
  -[APUIWidgetContainerView _setAppClipSuggestion:](self, "_setAppClipSuggestion:", v4);
LABEL_14:

}

- (APUISuggestionsWidgetView)suggestionsWidgetView
{
  return self->_suggestionsWidgetView;
}

- (APUISuggestionsWidgetViewDelegate)delegate
{
  return (APUISuggestionsWidgetViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)platterSize
{
  return self->_platterSize;
}

- (void)setPlatterSize:(unint64_t)a3
{
  self->_platterSize = a3;
}

- (ATXProactiveSuggestion)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_suggestion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_suggestionsWidgetView, 0);
  objc_storeStrong((id *)&self->_suggestionView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

- (void)_displayNoSuggestionsWithSuggestion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 134218242;
  v3 = 5517;
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_219979000, a2, OS_LOG_TYPE_ERROR, "e:%ld * SuggestionsWidget: could not display suggestion: %@", (uint8_t *)&v2, 0x16u);
}

@end
