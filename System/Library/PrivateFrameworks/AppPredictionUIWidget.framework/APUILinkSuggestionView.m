@implementation APUILinkSuggestionView

- (void)layoutSuggestion:(id)a3
{
  id v4;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *tapRecognizer;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;

  v4 = a3;
  if (v4)
  {
    -[APUISuggestionView setSuggestion:](self, "setSuggestion:", v4);
    -[APUISuggestionView createViewsIfNeeded](self, "createViewsIfNeeded");
    v5 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__tapRecognized_);
    tapRecognizer = self->_tapRecognizer;
    self->_tapRecognizer = v5;

    -[APUILinkSuggestionView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapRecognizer);
    objc_msgSend(v4, "executableSpecification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "executableObject");
    v8 = objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong((id *)&self->_linkAction, v8);
      -[NSObject bundleId](v8, "bundleId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uiSpecification");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "uiSpecification");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "subtitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSObject image](v8, "image");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[APUISuggestionView setLNImage:withBundleID:](self, "setLNImage:withBundleID:", v14, v9);

      -[APUISuggestionView titleLabel](self, "titleLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setText:", v11);

      -[APUISuggestionView subtitleLabel](self, "subtitleLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setText:", v13);

    }
    else
    {
      __atxlog_handle_ui();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[APUILinkSuggestionView layoutSuggestion:].cold.2();

    }
  }
  else
  {
    __atxlog_handle_ui();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[APUILinkSuggestionView layoutSuggestion:].cold.1();
  }

}

- (void)_tapRecognized:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *workflowRunnerClient;
  uint8_t v13[16];

  v4 = a3;
  if (!-[APUISuggestionView canEngageSuggestion](self, "canEngageSuggestion"))
  {
    __atxlog_handle_ui();
    workflowRunnerClient = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(workflowRunnerClient, OS_LOG_TYPE_ERROR))
      -[APUIActionSuggestionView _tapRecognized:].cold.5();
    goto LABEL_8;
  }
  -[APUISuggestionView setCanEngageSuggestion:](self, "setCanEngageSuggestion:", 0);
  if (objc_msgSend(v4, "state") == 3)
  {
    -[APUISuggestionView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUISuggestionView suggestion](self, "suggestion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view:didTapSuggestion:", self, v6);

    __atxlog_handle_ui();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_219979000, v7, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: Invoking ShortcutsRuntime for link action execution", v13, 2u);
    }

    v8 = objc_alloc(MEMORY[0x24BEC1608]);
    -[ATXLinkActionContainer action](self->_linkAction, "action");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXLinkActionContainer bundleId](self->_linkAction, "bundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithLinkAction:bundleIdentifier:resultSurface:", v9, v10, 1);

    objc_msgSend(v11, "setDelegate:", self);
    objc_msgSend(v11, "start");
    workflowRunnerClient = self->_workflowRunnerClient;
    self->_workflowRunnerClient = (WFWorkflowRunnerClient *)v11;
LABEL_8:

  }
}

- (void)workflowRunnerClient:(id)a3 didStartRunningWorkflowWithProgress:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  __atxlog_handle_ui();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134218240;
    v9 = v5;
    v10 = 2048;
    v11 = v6;
    _os_log_impl(&dword_219979000, v7, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: workflowRunnerClient: <%p> didStartRunningWorkflowWithProgress: <%p>", (uint8_t *)&v8, 0x16u);
  }

}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void (*v13)(uint64_t);
  uint64_t *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v6 = a6;
  v21 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  __atxlog_handle_ui();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v20 = v9;
    _os_log_impl(&dword_219979000, v11, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: workflowRunnerClient: <%p> didFinishRunningWorkflowWithOutput:error:cancelled:", buf, 0xCu);
  }

  if (v10 || v6)
  {
    if (v6)
    {
      __atxlog_handle_ui();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219979000, v15, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: ShortcutsRuntime was cancelled", buf, 2u);
      }

    }
    if (v10)
    {
      __atxlog_handle_ui();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[APUIActionSuggestionView workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:].cold.1();

    }
    v17 = MEMORY[0x24BDAC760];
    v13 = __98__APUILinkSuggestionView_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke_38;
    v14 = &v17;
  }
  else
  {
    __atxlog_handle_ui();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219979000, v12, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: ShortcutsRuntime completed successfully.", buf, 2u);
    }

    v18 = MEMORY[0x24BDAC760];
    v13 = __98__APUILinkSuggestionView_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke;
    v14 = &v18;
  }
  v14[1] = 3221225472;
  v14[2] = (uint64_t)v13;
  v14[3] = (uint64_t)&unk_24DB7D2B8;
  v14[4] = (uint64_t)self;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

}

void __98__APUILinkSuggestionView_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "suggestion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view:didFinishExecutingSuggestion:", v2, v3);

}

void __98__APUILinkSuggestionView_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke_38(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "suggestion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view:didFailExecutingSuggestion:", v2, v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowRunnerClient, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_linkAction, 0);
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
  OUTLINED_FUNCTION_0_0(&dword_219979000, v0, v1, "e:%ld * SuggestionsWidget: No suggestions provided to LinkSuggestionView", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)layoutSuggestion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_219979000, v0, v1, "e:%ld * SuggestionsWidget: error: suggestion is not a link action", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
