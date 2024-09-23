@implementation APUIActionSuggestionView

- (void)layoutSuggestion:(id)a3
{
  id v4;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *tapRecognizer;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  _QWORD block[4];
  NSObject *v20;
  id v21;
  APUIActionSuggestionView *v22;
  uint8_t buf[4];
  NSObject *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[APUISuggestionView setSuggestion:](self, "setSuggestion:", v4);
    -[APUISuggestionView createViewsIfNeeded](self, "createViewsIfNeeded");
    v5 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__tapRecognized_);
    tapRecognizer = self->_tapRecognizer;
    self->_tapRecognizer = v5;

    -[APUIActionSuggestionView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapRecognizer);
    objc_msgSend(v4, "executableSpecification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "executableObject");
    v8 = objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      objc_storeStrong((id *)&self->_atxAction, v8);
      -[NSObject bundleId](v9, "bundleId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject userActivityWebpageURL](v9, "userActivityWebpageURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ATXBundleIdReplacementForBundleIdWithWebpageURLHint();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSObject intent](v9, "intent");
      v13 = objc_claimAutoreleasedReturnValue();
      -[NSObject keyImage](v13, "keyImage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      __atxlog_handle_ui();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v24 = v13;
        v25 = 2112;
        v26 = v14;
        _os_log_impl(&dword_219979000, v15, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: image with intent: %@ inImage = intent.keyImage = %@", buf, 0x16u);
      }

      -[APUISuggestionView setINImage:withBundleID:](self, "setINImage:withBundleID:", v14, v12);
      dispatch_get_global_queue(25, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __45__APUIActionSuggestionView_layoutSuggestion___block_invoke;
      block[3] = &unk_24DB7D3D0;
      v20 = v9;
      v21 = v12;
      v22 = self;
      v17 = v12;
      v18 = v9;
      dispatch_async(v16, block);

    }
    else
    {
      __atxlog_handle_ui();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[APUIActionSuggestionView layoutSuggestion:].cold.2();
    }

    -[APUISuggestionView installReasonLabelIfNecessary](self, "installReasonLabelIfNecessary");
  }
  else
  {
    __atxlog_handle_ui();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[APUIActionSuggestionView layoutSuggestion:].cold.1();
  }

}

void __45__APUIActionSuggestionView_layoutSuggestion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "actionTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(*(id *)(a1 + 32), "isHeuristic"))
    goto LABEL_6;
  objc_msgSend(*(id *)(a1 + 32), "actionSubtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {

LABEL_6:
    objc_msgSend(MEMORY[0x24BE04100], "localizedNameForBundle:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!v3)
    goto LABEL_6;
LABEL_7:
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__APUIActionSuggestionView_layoutSuggestion___block_invoke_2;
  block[3] = &unk_24DB7D3D0;
  block[4] = *(_QWORD *)(a1 + 48);
  v7 = v2;
  v8 = v3;
  v4 = v3;
  v5 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __45__APUIActionSuggestionView_layoutSuggestion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "subtitleLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", *(_QWORD *)(a1 + 48));

}

- (void)_tapRecognized:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ATXAction **p_atxAction;
  void *v8;
  char isKindOfClass;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  WFSuggestionsWorkflowRunnerClient *v21;
  WFSuggestionsWorkflowRunnerClient *workflowRunnerClient;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  WFSuggestionsWorkflowRunnerClient *v27;
  void *v28;
  NSObject *v29;
  uint8_t v30[16];

  v4 = a3;
  if (!-[APUISuggestionView canEngageSuggestion](self, "canEngageSuggestion"))
  {
    __atxlog_handle_ui();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[APUIActionSuggestionView _tapRecognized:].cold.5();
    goto LABEL_29;
  }
  -[APUISuggestionView setCanEngageSuggestion:](self, "setCanEngageSuggestion:", 0);
  if (objc_msgSend(v4, "state") == 3)
  {
    -[APUISuggestionView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUISuggestionView suggestion](self, "suggestion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view:didTapSuggestion:", self, v6);

    p_atxAction = &self->_atxAction;
    if (!-[ATXAction actionType](self->_atxAction, "actionType"))
    {
      -[ATXAction intent](*p_atxAction, "intent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[ATXAction intent](*p_atxAction, "intent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "linkAction");
        v11 = objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v12 = 0;
LABEL_13:
          __atxlog_handle_ui();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v30 = 0;
            _os_log_impl(&dword_219979000, v17, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: invoking ShortcutsRuntime for action execution", v30, 2u);
          }

          v18 = objc_alloc(MEMORY[0x24BEC1608]);
          v19 = v18;
          if (v11)
          {
            -[ATXAction bundleId](*p_atxAction, "bundleId");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (WFSuggestionsWorkflowRunnerClient *)objc_msgSend(v19, "initWithLinkAction:bundleIdentifier:resultSurface:", v11, v20, 1);
            workflowRunnerClient = self->_workflowRunnerClient;
            self->_workflowRunnerClient = v21;

          }
          else
          {
            v27 = (WFSuggestionsWorkflowRunnerClient *)objc_msgSend(v18, "initWithINShortcut:executionContext:", v12, 3);
            v20 = self->_workflowRunnerClient;
            self->_workflowRunnerClient = v27;
          }

          -[WFSuggestionsWorkflowRunnerClient setDelegate:](self->_workflowRunnerClient, "setDelegate:", self);
          -[WFSuggestionsWorkflowRunnerClient start](self->_workflowRunnerClient, "start");

          goto LABEL_29;
        }
        __atxlog_handle_ui();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
          -[APUIActionSuggestionView _tapRecognized:].cold.1(v29);

LABEL_28:
        -[APUISuggestionView delegate](self, "delegate");
        v11 = objc_claimAutoreleasedReturnValue();
        -[APUISuggestionView suggestion](self, "suggestion");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject view:didFailExecutingSuggestion:](v11, "view:didFailExecutingSuggestion:", self, v28);

LABEL_29:
        goto LABEL_30;
      }
    }
    if (-[ATXAction actionType](*p_atxAction, "actionType") && -[ATXAction actionType](*p_atxAction, "actionType") != 2)
    {
      if (-[ATXAction actionType](*p_atxAction, "actionType") == 1)
      {
        v23 = objc_alloc(MEMORY[0x24BDDA168]);
        -[ATXAction userActivity](*p_atxAction, "userActivity");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXAction bundleId](*p_atxAction, "bundleId");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v23, "initWithUserActivity:bundleIdentifier:", v24, v25);

        if (v12)
          goto LABEL_12;
        __atxlog_handle_ui();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
          -[APUIActionSuggestionView _tapRecognized:].cold.3((id *)&self->_atxAction, v26);
      }
      else
      {
        __atxlog_handle_ui();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
          -[APUIActionSuggestionView _tapRecognized:].cold.4((id *)&self->_atxAction);
      }
    }
    else
    {
      -[ATXAction bundleId](*p_atxAction, "bundleId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXAction intent](*p_atxAction, "intent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_setLaunchId:", v13);

      v15 = objc_alloc(MEMORY[0x24BDDA168]);
      -[ATXAction intent](*p_atxAction, "intent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v15, "initWithIntent:", v16);

      if (v12)
      {
LABEL_12:
        v11 = 0;
        goto LABEL_13;
      }
      __atxlog_handle_ui();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        -[APUIActionSuggestionView _tapRecognized:].cold.2((id *)&self->_atxAction);
    }

    goto LABEL_28;
  }
LABEL_30:

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
    v13 = __100__APUIActionSuggestionView_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke_41;
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
    v13 = __100__APUIActionSuggestionView_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke;
    v14 = &v18;
  }
  v14[1] = 3221225472;
  v14[2] = (uint64_t)v13;
  v14[3] = (uint64_t)&unk_24DB7D2B8;
  v14[4] = (uint64_t)self;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

}

void __100__APUIActionSuggestionView_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke(uint64_t a1)
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

void __100__APUIActionSuggestionView_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke_41(uint64_t a1)
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
  objc_storeStrong((id *)&self->_atxAction, 0);
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
  OUTLINED_FUNCTION_0_0(&dword_219979000, v0, v1, "e:%ld * SuggestionsWidget: No suggestions provided to ActionSuggestionView", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0_0(&dword_219979000, v0, v1, "e:%ld * SuggestionsWidget: error: suggestion is not an action", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_tapRecognized:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_219979000, log, OS_LOG_TYPE_FAULT, "e:fault SuggestionsWidget: Unable to obtain Link action from INAppIntent", v1, 2u);
}

- (void)_tapRecognized:(id *)a1 .cold.2(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*a1, "intent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_219979000, v2, v3, "e:fault SuggestionsWidget: init method returned nil: INShortcut initWithIntent:%@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_tapRecognized:(id *)a1 .cold.3(id *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "userActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_fault_impl(&dword_219979000, a2, OS_LOG_TYPE_FAULT, "e:fault SuggestionsWidget: init method returned nil: INShortcut initWithUserActivity:%@ bundleIdentifier:%@", (uint8_t *)&v6, 0x16u);

}

- (void)_tapRecognized:(id *)a1 .cold.4(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(*a1, "actionType");
  OUTLINED_FUNCTION_2_0(&dword_219979000, v1, v2, "e:fault SuggestionsWidget: tried to handle unknown action type in widget: %ld", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_2();
}

- (void)_tapRecognized:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_219979000, v0, v1, "e:%ld * SuggestionsWidget: tried to tap a suggestion before the last execution ended", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:.cold.1()
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
  _os_log_error_impl(&dword_219979000, v1, OS_LOG_TYPE_ERROR, "e:%ld * SuggestionsWidget: ShortcutsRuntime had an error: %@", v2, 0x16u);
  OUTLINED_FUNCTION_3();
}

@end
