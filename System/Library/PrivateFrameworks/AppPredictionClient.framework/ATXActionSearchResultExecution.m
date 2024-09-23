@implementation ATXActionSearchResultExecution

- (void)executeShortcut
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "e:%ld * searchExec: Attempted to run shortcut from indexed search result, but VCInteractionDonation was nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[8];
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D22DA8];
  v9[0] = *MEMORY[0x1E0D22D88];
  v9[1] = v2;
  v10[0] = MEMORY[0x1E0C9AAB0];
  v10[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_ui();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "searchExec: launching UAUserActivityProxy...", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "userActivityProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_33;
  v6[3] = &unk_1E4D5A428;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v5, "launchActivityWithOptions:completionHandler:", v3, v6);

}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_33(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if ((a2 & 1) == 0)
  {
    v9 = v5 == 0;
    goto LABEL_7;
  }
  __atxlog_handle_ui();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "bundleId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v8;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "searchExec: successfully launched UAUserActivityProxy for bundleId: %@", (uint8_t *)&v14, 0xCu);

  }
  if (v6)
  {
    v9 = 0;
LABEL_7:
    __atxlog_handle_ui();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_33_cold_2(a1, v10);

    if (!v9)
    {
      __atxlog_handle_ui();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_33_cold_1(v6);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "userActivityProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_opt_self();

}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_40(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2;
  block[3] = &unk_1E4D57FE0;
  v10 = v6;
  v11 = v5;
  v12 = *(_QWORD *)(a1 + 32);
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2(uint64_t a1)
{
  uint64_t *v1;
  NSObject *v2;
  uint64_t v3;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v1 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    __atxlog_handle_ui();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_cold_3(v1, v2, v3);
  }
  else
  {
    v5 = *(void **)(a1 + 40);
    if (v5)
    {
      objc_msgSend(v5, "shortcut");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      __atxlog_handle_ui();
      v7 = objc_claimAutoreleasedReturnValue();
      v2 = v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_DEFAULT, "searchExec: fetched voiceShortcut SUCCESS. Continuing...", v9, 2u);
        }

        v8 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 40), "shortcut");
        v2 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_spawnShortcutExecutionWithShortcut:executionContext:", v2, 5);
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_cold_2();
      }
    }
    else
    {
      __atxlog_handle_ui();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
        __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_cold_1();
    }
  }

}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  __int128 v7;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_53;
  block[3] = &unk_1E4D5A478;
  v6 = v3;
  v7 = *(_OWORD *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_53(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_ui();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v17 = v3;
    _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_INFO, "searchExec: fetchDataAndUpdateIntentFromIdentifier attributeValues: %@", buf, 0xCu);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
    v4 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __atxlog_handle_ui();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_53_cold_6((uint64_t)v4, v5);
      goto LABEL_27;
    }
    v5 = v4;
    if (!-[NSObject count](v5, "count"))
    {
      __atxlog_handle_ui();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_53_cold_2();
      goto LABEL_26;
    }
    -[NSObject objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __atxlog_handle_ui();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_53_cold_5((uint64_t)v6, v7);

    }
    v8 = (void *)MEMORY[0x1A85A4F90]();
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v15;
    objc_autoreleasePoolPop(v8);
    if (v10 || !v9)
    {
      __atxlog_handle_ui();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_53_cold_4();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBDBE8]), "initWithIntent:", v9);
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v13 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v11;

        objc_msgSend(*(id *)(a1 + 40), "_spawnShortcutExecutionWithShortcut:executionContext:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 5);
LABEL_25:

LABEL_26:
LABEL_27:

        goto LABEL_28;
      }
      __atxlog_handle_ui();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_53_cold_3();
    }

    goto LABEL_25;
  }
  __atxlog_handle_ui();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_53_cold_1();
LABEL_28:

}

- (void)_spawnShortcutExecutionWithShortcut:(id)a3 executionContext:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  v6 = a3;
  __atxlog_handle_ui();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "searchExec: invoking ShortcutsRuntime for execution", v13, 2u);
  }

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7DA8]), "initWithINShortcut:executionContext:", v6, a4);
  -[ATXActionSearchResultExecution setWorkflowRunnerClient:](self, "setWorkflowRunnerClient:", v8);

  -[ATXActionSearchResultExecution runViewSource](self, "runViewSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXActionSearchResultExecution workflowRunnerClient](self, "workflowRunnerClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRunViewSource:", v9);

  -[ATXActionSearchResultExecution workflowRunnerClient](self, "workflowRunnerClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", self);

  -[ATXActionSearchResultExecution workflowRunnerClient](self, "workflowRunnerClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "start");

}

- (BOOL)_shouldTellDelegateToClearActionOnDismissal:(int64_t)a3
{
  void *v4;
  char isKindOfClass;

  -[ATXActionSearchResultExecution searchResult](self, "searchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("displayRecentDonations"), CFSTR("com.apple.duetexpertd"), 0))
    return 0;
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)_delegateDoesRespond
{
  void *v2;
  char v3;

  -[ATXActionSearchResultExecution delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
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

  v12 = *MEMORY[0x1E0C80C00];
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
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "searchExec: workflowRunnerClient: <%p> didStartRunningWorkflowWithProgress: <%p>", (uint8_t *)&v8, 0x16u);
  }

}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL8 v18;
  void *v19;
  int v20;
  id v21;
  uint64_t v22;

  v6 = a6;
  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  __atxlog_handle_ui();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 134217984;
    v21 = v9;
    _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "searchExec: workflowRunnerClient: <%p> didFinishRunningWorkflowWithOutput:error:cancelled:", (uint8_t *)&v20, 0xCu);
  }

  v12 = -[ATXActionSearchResultExecution _delegateDoesRespond](self, "_delegateDoesRespond");
  __atxlog_handle_ui();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 || v6)
  {
    if (v10)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ATXActionSearchResultExecution workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:].cold.2();

      __atxlog_handle_ui();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[ATXActionSearchResultExecution workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:].cold.1(v10);
      v15 = 1;
      v16 = 2;
    }
    else if (v6)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1A49EF000, v14, OS_LOG_TYPE_DEFAULT, "searchExec: workflowRunnerClient:didFinishRunningWithError: CANCELLED", (uint8_t *)&v20, 2u);
      }
      v15 = 1;
      v16 = 5;
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[ATXActionSearchResultExecution workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:].cold.3();
      v16 = 0;
      v15 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1A49EF000, v14, OS_LOG_TYPE_DEFAULT, "searchExec: workflowRunnerClient:didFinishRunningWithError: SUCCEEDED", (uint8_t *)&v20, 2u);
    }
    v15 = 3;
    v16 = 1;
  }

  if (v12)
  {
    __atxlog_handle_ui();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1A49EF000, v17, OS_LOG_TYPE_INFO, "searchExec: calling delegate for ATXActionSearchResultExecution", (uint8_t *)&v20, 2u);
    }

    v18 = -[ATXActionSearchResultExecution _shouldTellDelegateToClearActionOnDismissal:](self, "_shouldTellDelegateToClearActionOnDismissal:", v15);
    -[ATXActionSearchResultExecution delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "actionSearchResultExecution:didDismissRemoteAlertWithReason:actionCompleted:withResult:shouldClearAction:", self, v15, 1, v16, v18);

  }
}

- (SFSearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
  objc_storeStrong((id *)&self->_searchResult, a3);
}

- (ATXActionSearchResultExecutionDelegate)delegate
{
  return (ATXActionSearchResultExecutionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFWorkflowRunViewSource)runViewSource
{
  return self->_runViewSource;
}

- (void)setRunViewSource:(id)a3
{
  objc_storeStrong((id *)&self->_runViewSource, a3);
}

- (WFSuggestionsWorkflowRunnerClient)workflowRunnerClient
{
  return self->_workflowRunnerClient;
}

- (void)setWorkflowRunnerClient:(id)a3
{
  objc_storeStrong((id *)&self->_workflowRunnerClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowRunnerClient, 0);
  objc_storeStrong((id *)&self->_runViewSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchResult, 0);
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_33_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_6_1(&dword_1A49EF000, v2, v3, "e:%ld * %ld * %s : %@ -- %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_11();
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_33_cold_2(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1(&dword_1A49EF000, a2, v4, "e:%ld * searchExec: failed to launch UAUserActivityProxy for bundleId: %@", v5);

  OUTLINED_FUNCTION_3();
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "e:fault searchExec: voiceShortcut was nil but there was no error!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "e:%ld * searchExec: voiceShortcut.shortcut is nil! This is unexpected!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_cold_3(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 134218242;
  v5 = 5516;
  v6 = 2112;
  v7 = v3;
  OUTLINED_FUNCTION_1(&dword_1A49EF000, a2, a3, "e:%ld * searchExec: VoiceShortcutClient fetch error: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_53_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "e:%ld * searchExec: attributeValues has length 0, this is unexpected!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_53_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "e:%ld * searchExec: attribute values returned 0 results!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_53_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "e:fault searchExec: unexpected intent type!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_53_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1(&dword_1A49EF000, v0, v1, "e:%ld * searchExec: Could not unarchive intent: %@", v2);
  OUTLINED_FUNCTION_2();
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_53_cold_5(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1(&dword_1A49EF000, a2, v5, "e:%ld * searchExec: data is unexpected type! - %@", v6);

  OUTLINED_FUNCTION_3();
}

void __49__ATXActionSearchResultExecution_executeShortcut__block_invoke_2_53_cold_6(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1(&dword_1A49EF000, a2, v5, "e:%ld * searchExec: fetched attributes is unexpected type! - %@", v6);

  OUTLINED_FUNCTION_3();
}

- (void)workflowRunnerClient:(void *)a1 didFinishRunningWorkflowWithOutput:error:cancelled:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_6_1(&dword_1A49EF000, v2, v3, "e:%ld * %ld * %s : %@ -- %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_11();
}

- (void)workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "e:%ld * searchExec: workflowRunnerClient:didFinishRunningWithError:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "e:fault searchExec: workflowRunnerClient:didFinishRunningWithError: UNEXPECTED CODE PATH REACHED", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
