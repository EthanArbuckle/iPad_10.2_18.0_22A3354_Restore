@implementation APUIAppSuggestionView

- (void)layoutSuggestion:(id)a3
{
  id v4;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *tapRecognizer;
  NSObject *v7;
  UITapGestureRecognizer *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  int v21;
  UITapGestureRecognizer *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[APUISuggestionView setSuggestion:](self, "setSuggestion:", v4);
    -[APUISuggestionView createViewsIfNeeded](self, "createViewsIfNeeded");
    v5 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__tapRecognized_);
    tapRecognizer = self->_tapRecognizer;
    self->_tapRecognizer = v5;

    -[APUIAppSuggestionView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapRecognizer);
    __atxlog_handle_ui();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_tapRecognizer;
      v21 = 138412290;
      v22 = v8;
      _os_log_impl(&dword_219979000, v7, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: APUIAppSuggestionView: added gesture recognizer: %@", (uint8_t *)&v21, 0xCu);
    }

    objc_msgSend(v4, "executableSpecification");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "executableClassString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "isEqualToString:", v12);

    if (v13)
    {
      v14 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(v4, "executableSpecification");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "executable");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v14, "initWithData:encoding:", v16, 4);

      objc_msgSend(v4, "uiSpecification");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "reason");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[APUIAppSuggestionView _setAppWithBundleId:reason:](self, "_setAppWithBundleId:reason:", v17, v19);
    }
    else
    {
      __atxlog_handle_ui();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[APUIAppSuggestionView layoutSuggestion:].cold.2();
    }

    -[APUISuggestionView installReasonLabelIfNecessary](self, "installReasonLabelIfNecessary");
  }
  else
  {
    __atxlog_handle_ui();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[APUIAppSuggestionView layoutSuggestion:].cold.1();

  }
}

- (void)_setAppWithBundleId:(id)a3 reason:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_appBundleId, a3);
  -[APUISuggestionView appImageView](self, "appImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[APUIAppIconDataSource iconForBundleIdentifier:shouldApplyMask:](APUIAppIconDataSource, "iconForBundleIdentifier:shouldApplyMask:", v7, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v10);

  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Open %@"), &stru_24DB7DD40, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE04100], "localizedNameForBundle:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringWithFormat:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[APUISuggestionView titleLabel](self, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v15);

  if (!objc_msgSend(v8, "length"))
  {
    __atxlog_handle_ui();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[APUIAppSuggestionView _setAppWithBundleId:reason:].cold.1((uint64_t)v7, (uint64_t)v8, v17);

  }
  -[APUISuggestionView subtitleLabel](self, "subtitleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v8);

}

- (void)_tapRecognized:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSString *appBundleId;
  void *v8;
  NSString *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[APUISuggestionView canEngageSuggestion](self, "canEngageSuggestion"))
  {
    -[APUISuggestionView setCanEngageSuggestion:](self, "setCanEngageSuggestion:", 0);
    if (objc_msgSend(v4, "state") == 3)
    {
      -[APUISuggestionView suggestion](self, "suggestion");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      __atxlog_handle_ui();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        appBundleId = self->_appBundleId;
        *(_DWORD *)buf = 138412290;
        v14 = (uint64_t)appBundleId;
        _os_log_impl(&dword_219979000, v6, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: APUIAppSuggestionView: gesture recognizer ended; attempting to launch app: %@...",
          buf,
          0xCu);
      }

      -[APUISuggestionView delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view:didTapSuggestion:", self, v5);

      v9 = self->_appBundleId;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __40__APUIAppSuggestionView__tapRecognized___block_invoke;
      v11[3] = &unk_24DB7DB60;
      v11[4] = self;
      v12 = v5;
      v10 = v5;
      +[APUIAppIconDataSource openApplication:completion:](APUIAppIconDataSource, "openApplication:completion:", v9, v11);

    }
    else
    {
      __atxlog_handle_ui();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v14 = objc_msgSend(v4, "state");
        _os_log_impl(&dword_219979000, v10, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: APUIAppSuggestionView: gesture recognizer state: %ld", buf, 0xCu);
      }
    }
  }
  else
  {
    __atxlog_handle_ui();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[APUIAppSuggestionView _tapRecognized:].cold.1();
  }

}

void __40__APUIAppSuggestionView__tapRecognized___block_invoke(uint64_t a1, int a2)
{
  void (*v2)(uint64_t);
  uint64_t *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (a2)
  {
    v6 = MEMORY[0x24BDAC760];
    v2 = __40__APUIAppSuggestionView__tapRecognized___block_invoke_2;
    v3 = &v6;
  }
  else
  {
    v5 = MEMORY[0x24BDAC760];
    v2 = __40__APUIAppSuggestionView__tapRecognized___block_invoke_3;
    v3 = &v5;
  }
  v3[1] = 3221225472;
  v3[2] = (uint64_t)v2;
  v3[3] = (uint64_t)&unk_24DB7D290;
  v4 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v3[5] = (uint64_t)v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);

}

void __40__APUIAppSuggestionView__tapRecognized___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view:didFinishExecutingSuggestion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __40__APUIAppSuggestionView__tapRecognized___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view:didFailExecutingSuggestion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (void)layoutSuggestion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_219979000, v0, v1, "e:%ld * SuggestionsWidget: APUIAppSuggestionView: No suggestions provided", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)layoutSuggestion:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_0();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_219979000, v1, OS_LOG_TYPE_ERROR, "e:%ld * SuggestionsWidget: APUIAppSuggestionView: suggestion executable is not a string: %@", v2, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)_setAppWithBundleId:(os_log_t)log reason:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136446722;
  v4 = "-[APUIAppSuggestionView _setAppWithBundleId:reason:]";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_fault_impl(&dword_219979000, log, OS_LOG_TYPE_FAULT, "e:fault SuggestionsWidget: %{public}s:%@ reason:%@", (uint8_t *)&v3, 0x20u);
}

- (void)_tapRecognized:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_219979000, v0, v1, "e:%ld * SuggestionsWidget: APUIAppSuggestionView: tried to tap a suggestion before the last execution ended", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
