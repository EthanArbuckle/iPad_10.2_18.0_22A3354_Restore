@implementation ATXUserEducationSuggestionCustomizeFocusServer

- (ATXUserEducationSuggestionCustomizeFocusServer)initWithConnector:(id)a3
{
  id v5;
  ATXUserEducationSuggestionCustomizeFocusServer *v6;
  NSObject *v7;
  uint64_t v8;
  ATXDNDModeConfigurationClient *modeConfigurationClient;
  void *v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ATXUserEducationSuggestionCustomizeFocusServer;
  v6 = -[ATXUserEducationSuggestionBaseServer init](&v12, sel_init);
  if (v6)
  {
    __atxlog_handle_context_user_education_suggestions();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[ATXUserEducationSuggestionCustomizeFocusServer initWithConnector:]";
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "%s: starting server", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CF8D60], "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    modeConfigurationClient = v6->_modeConfigurationClient;
    v6->_modeConfigurationClient = (ATXDNDModeConfigurationClient *)v8;

    objc_storeStrong((id *)&v6->_connector, a3);
    +[ATXUserEducationSuggestionModeChangeNotifier sharedInstance](ATXUserEducationSuggestionModeChangeNotifier, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerObserver:", v6);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[ATXUserEducationSuggestionModeChangeNotifier sharedInstance](ATXUserEducationSuggestionModeChangeNotifier, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ATXUserEducationSuggestionCustomizeFocusServer;
  -[ATXUserEducationSuggestionCustomizeFocusServer dealloc](&v4, sel_dealloc);
}

- (void)processModeChangeEvent:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__ATXUserEducationSuggestionCustomizeFocusServer_processModeChangeEvent___block_invoke;
  v6[3] = &unk_1E82DACB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ATXUserEducationSuggestionBaseServer performBlockOnInternalSerialQueue:](self, "performBlockOnInternalSerialQueue:", v6);

}

uint64_t __73__ATXUserEducationSuggestionCustomizeFocusServer_processModeChangeEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processModeChangeEvent:", *(_QWORD *)(a1 + 40));
}

- (void)_processModeChangeEvent:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  char v7;
  NSObject *v8;
  _BOOL4 v9;
  int v10;
  int v11;
  NSObject *v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  BOOL v21;
  dispatch_semaphore_t v22;
  void *v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  uint64_t v32;
  _QWORD v33[4];
  NSObject *v34;
  id v35;
  _BYTE *v36;
  uint8_t v37[4];
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  _BYTE buf[24];
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "atx_dndModeSemanticType");
  DNDModeSemanticTypeToString();
  v6 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(MEMORY[0x1E0CF91B0], "suggestionsAreSupportedForModeSemanticType:", v5);
  __atxlog_handle_context_user_education_suggestions();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if ((v7 & 1) != 0)
  {
    if (v9)
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v4;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "%s: processing new userFocusComputedModeEvent: %{public}@", buf, 0x16u);
    }

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF91B0]), "initWithModeSemanticType:", v5);
    v10 = -[NSObject suggestionWasAlreadyShown](v8, "suggestionWasAlreadyShown");
    v11 = -[NSObject suggestionWasAlreadyDismissed](v8, "suggestionWasAlreadyDismissed");
    if ((objc_msgSend(v4, "starting") & 1) != 0)
    {
      if (v10)
      {
        __atxlog_handle_context_user_education_suggestions();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:]";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v6;
          _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "%s: Not showing user education suggestion because it was already shown in mode: %@", buf, 0x16u);
        }
LABEL_33:

        goto LABEL_54;
      }
      if (objc_msgSend(v4, "updateSource") != 1)
      {
        __atxlog_handle_context_user_education_suggestions();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:]";
          _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "%s: Not showing user education suggestion because mode update source wasn't local.", buf, 0xCu);
        }
        goto LABEL_33;
      }
      v14 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v4, "mode");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithUUIDString:", v15);

      if (!v16)
      {
        __atxlog_handle_context_user_education_suggestions();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:].cold.1();
        goto LABEL_53;
      }
      -[ATXDNDModeConfigurationClient modeConfigurationForDNDModeWithUUID:useCache:](self->_modeConfigurationClient, "modeConfigurationForDNDModeWithUUID:useCache:", v16, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        -[NSObject configuration](v17, "configuration");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "applicationConfigurationType") == 2)
        {
          -[NSObject configuration](v18, "configuration");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "senderConfigurationType") == 2;

          if (v21)
          {
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            v44 = __Block_byref_object_copy__56;
            v45 = __Block_byref_object_dispose__56;
            v46 = 0;
            v22 = dispatch_semaphore_create(0);
            getPRSServiceClass();
            v23 = (void *)objc_opt_new();
            v33[0] = MEMORY[0x1E0C809B0];
            v33[1] = 3221225472;
            v33[2] = __74__ATXUserEducationSuggestionCustomizeFocusServer__processModeChangeEvent___block_invoke;
            v33[3] = &unk_1E82E4868;
            v24 = v22;
            v34 = v24;
            v25 = v23;
            v35 = v25;
            v36 = buf;
            objc_msgSend(v25, "fetchActiveConfiguration:", v33);
            if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v24, 5.0) == 1)
            {
              __atxlog_handle_context_user_education_suggestions();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                -[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:].cold.3();
              goto LABEL_51;
            }
            if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
            {
              if ((objc_msgSend(v16, "isEqual:") & 1) != 0)
              {
                -[ATXUserEducationSuggestionCustomizeFocusServer sendSuggestion:eventType:](self, "sendSuggestion:eventType:", v8, 0);
LABEL_52:

                _Block_object_dispose(buf, 8);
                goto LABEL_53;
              }
              __atxlog_handle_context_user_education_suggestions();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                v32 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
                *(_DWORD *)v37 = 136315650;
                v38 = "-[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:]";
                v39 = 2112;
                v40 = v16;
                v41 = 2112;
                v42 = v32;
                v29 = "%s: Not showing user education suggestion because current mode: %@ is not equal to the poster's linked mode: %@.";
                v30 = v26;
                v31 = 32;
                goto LABEL_50;
              }
            }
            else
            {
              __atxlog_handle_context_user_education_suggestions();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v37 = 136315138;
                v38 = "-[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:]";
                v29 = "%s: Not showing user education suggestion because current poster is not linked to a mode.";
                v30 = v26;
                v31 = 12;
LABEL_50:
                _os_log_impl(&dword_1C9A3B000, v30, OS_LOG_TYPE_DEFAULT, v29, v37, v31);
              }
            }
LABEL_51:

            goto LABEL_52;
          }
        }
        else
        {

        }
        __atxlog_handle_context_user_education_suggestions();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:]";
          _os_log_impl(&dword_1C9A3B000, v28, OS_LOG_TYPE_DEFAULT, "%s: Not showing user education suggestion because current mode is not toothless.", buf, 0xCu);
        }
      }
      else
      {
        __atxlog_handle_context_user_education_suggestions();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:].cold.2();
      }

LABEL_53:
      goto LABEL_54;
    }
    if (((v10 ^ 1 | v11) & 1) != 0)
    {
      if ((v10 & 1) == 0)
      {
        __atxlog_handle_context_user_education_suggestions();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:]";
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v6;
          _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "%s: Not dismissing suggestion for mode %{public}@ because it hasn't been shown yet.", buf, 0x16u);
        }
        goto LABEL_33;
      }
      if (v11)
      {
        __atxlog_handle_context_user_education_suggestions();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:]";
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v6;
          _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "%s: Not dismissing suggestion for mode %{public}@ because it has already been dismissed.", buf, 0x16u);
        }
        goto LABEL_33;
      }
    }
    else
    {
      __atxlog_handle_context_user_education_suggestions();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:]";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2114;
        v44 = v6;
        _os_log_impl(&dword_1C9A3B000, v27, OS_LOG_TYPE_DEFAULT, "%s: Dismissing suggestion for mode %{public}@ because we're exiting %{public}@ mode and its been shown but not yet dismissed", buf, 0x20u);
      }

      -[ATXUserEducationSuggestionCustomizeFocusServer sendSuggestion:eventType:](self, "sendSuggestion:eventType:", v8, 1);
    }
  }
  else if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CF91B0], "supportedModeSemanticTypeStrings");
    v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    v44 = v13;
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "%s: Not processing mode change event because mode: %{public}@ is not in the supported modes: %{public}@", buf, 0x20u);

  }
LABEL_54:

}

void __74__ATXUserEducationSuggestionCustomizeFocusServer__processModeChangeEvent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __74__ATXUserEducationSuggestionCustomizeFocusServer__processModeChangeEvent___block_invoke_13;
    v8[3] = &unk_1E82E4840;
    v6 = *(void **)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v6, "fetchFocusUUIDForConfiguration:completion:", a2, v8);

  }
  else
  {
    __atxlog_handle_context_user_education_suggestions();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[ATXUserEducationSuggestionCustomizeFocusServer _processModeChangeEvent:]_block_invoke";
      v13 = 2114;
      v14 = v5;
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to fetch poster configuration. Error: %{public}@", buf, 0x16u);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

}

void __74__ATXUserEducationSuggestionCustomizeFocusServer__processModeChangeEvent___block_invoke_13(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)sendSuggestion:(id)a3 eventType:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF91B8]), "initWithUserEducationSuggestion:userEducationSuggestionEventType:", v6, a4);
  __atxlog_handle_context_user_education_suggestions();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[ATXUserEducationSuggestionCustomizeFocusServer sendSuggestion:eventType:]";
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "%s: Sending suggestion: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  -[ATXUserEducationSuggestionConnector remoteObjectProxy](self->_connector, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didReceiveUserEducationSuggestionEvent:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeConfigurationClient, 0);
  objc_storeStrong((id *)&self->_connector, 0);
}

- (void)_processModeChangeEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, v0, v1, "%s: Not showing suggestion. Unable to get mode uuid from event %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_processModeChangeEvent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, v0, v1, "%s: unable to get mode configuration for current mode uuid: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_processModeChangeEvent:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, v0, v1, "%s: Timed out querying for focus mode UUID associated with the current mode: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
