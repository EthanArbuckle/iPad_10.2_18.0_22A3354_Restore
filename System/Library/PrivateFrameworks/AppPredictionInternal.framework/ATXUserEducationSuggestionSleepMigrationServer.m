@implementation ATXUserEducationSuggestionSleepMigrationServer

- (ATXUserEducationSuggestionSleepMigrationServer)initWithConnector:(id)a3
{
  id v5;
  ATXUserEducationSuggestionSleepMigrationServer *v6;
  NSObject *v7;
  ATXHomeScreenConfigCache *v8;
  ATXHomeScreenConfigCache *homeScreenConfigCache;
  ATXInstalledSuggestedPagesTracker *v10;
  ATXInstalledSuggestedPagesTracker *installedSuggestedPagesTracker;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ATXUserEducationSuggestionSleepMigrationServer;
  v6 = -[ATXUserEducationSuggestionBaseServer init](&v14, sel_init);
  if (v6)
  {
    __atxlog_handle_context_user_education_suggestions();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[ATXUserEducationSuggestionSleepMigrationServer initWithConnector:]";
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "%s: starting server", buf, 0xCu);
    }

    v8 = (ATXHomeScreenConfigCache *)objc_alloc_init(MEMORY[0x1E0CF8E58]);
    homeScreenConfigCache = v6->_homeScreenConfigCache;
    v6->_homeScreenConfigCache = v8;

    v10 = (ATXInstalledSuggestedPagesTracker *)objc_alloc_init(MEMORY[0x1E0CF8ED0]);
    installedSuggestedPagesTracker = v6->_installedSuggestedPagesTracker;
    v6->_installedSuggestedPagesTracker = v10;

    objc_storeStrong((id *)&v6->_connector, a3);
    +[ATXUserEducationSuggestionModeChangeNotifier sharedInstance](ATXUserEducationSuggestionModeChangeNotifier, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerObserver:", v6);

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
  v4.super_class = (Class)ATXUserEducationSuggestionSleepMigrationServer;
  -[ATXUserEducationSuggestionSleepMigrationServer dealloc](&v4, sel_dealloc);
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
  v6[2] = __73__ATXUserEducationSuggestionSleepMigrationServer_processModeChangeEvent___block_invoke;
  v6[3] = &unk_1E82DACB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ATXUserEducationSuggestionBaseServer performBlockOnInternalSerialQueue:](self, "performBlockOnInternalSerialQueue:", v6);

}

uint64_t __73__ATXUserEducationSuggestionSleepMigrationServer_processModeChangeEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processModeChangeEvent:", *(_QWORD *)(a1 + 40));
}

- (void)_processModeChangeEvent:(id)a3
{
  NSObject *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  int v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  ATXHomeScreenConfigCache *homeScreenConfigCache;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  ATXInstalledSuggestedPagesTracker *installedSuggestedPagesTracker;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  NSObject *v34;
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  NSObject *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NSObject semanticType](v4, "semanticType");
  __atxlog_handle_context_user_education_suggestions();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 == 3)
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[ATXUserEducationSuggestionSleepMigrationServer _processModeChangeEvent:]";
      v38 = 2114;
      v39 = v4;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "%s: processing new userFocusComputedModeEvent: %{public}@", buf, 0x16u);
    }

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF91D0]), "initWithRandomUUID");
    v8 = -[NSObject suggestionWasAlreadyShown](v6, "suggestionWasAlreadyShown");
    v9 = -[NSObject suggestionWasAlreadyDismissed](v6, "suggestionWasAlreadyDismissed");
    if ((-[NSObject starting](v4, "starting") & 1) != 0)
    {
      if (v8)
      {
        __atxlog_handle_context_user_education_suggestions();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v37 = "-[ATXUserEducationSuggestionSleepMigrationServer _processModeChangeEvent:]";
          v11 = "%s: Not showing user education suggestion because it was already shown";
LABEL_28:
          v12 = v10;
          v13 = 12;
          goto LABEL_29;
        }
        goto LABEL_30;
      }
      ATXSleepSuggestedHomePageWasCreatedDuringMigration();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        if ((objc_msgSend(v14, "BOOLValue") & 1) != 0)
        {

          v16 = objc_alloc(MEMORY[0x1E0CB3A28]);
          -[NSObject mode](v4, "mode");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v16, "initWithUUIDString:", v17);

          if (!v15)
          {
            __atxlog_handle_context_user_education_suggestions();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              -[ATXUserEducationSuggestionSleepMigrationServer _processModeChangeEvent:].cold.2();
            goto LABEL_49;
          }
          homeScreenConfigCache = self->_homeScreenConfigCache;
          v35 = 0;
          -[ATXHomeScreenConfigCache loadHomeScreenPageConfigurationsIncludingHidden:error:](homeScreenConfigCache, "loadHomeScreenPageConfigurationsIncludingHidden:error:", 1, &v35);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v35;
          v21 = v20;
          if (!v19 || v20)
          {
            __atxlog_handle_context_user_education_suggestions();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              -[ATXUserEducationSuggestionSleepMigrationServer _processModeChangeEvent:].cold.3();
            goto LABEL_48;
          }
          v22 = (void *)objc_opt_new();
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __74__ATXUserEducationSuggestionSleepMigrationServer__processModeChangeEvent___block_invoke;
          v32[3] = &unk_1E82E9090;
          v33 = v15;
          v23 = v22;
          v34 = v23;
          objc_msgSend(v19, "enumerateObjectsUsingBlock:", v32);
          if ((unint64_t)-[NSObject count](v23, "count") >= 2)
          {
            __atxlog_handle_context_user_education_suggestions();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v37 = "-[ATXUserEducationSuggestionSleepMigrationServer _processModeChangeEvent:]";
              _os_log_impl(&dword_1C9A3B000, v24, OS_LOG_TYPE_DEFAULT, "%s: Not showing suggestion because there's more than 1 home page associated with sleep. This would be an indication that the user has customized their sleep pages, therefore doesn't qualify for the discovery platter.", buf, 0xCu);
            }
            goto LABEL_47;
          }
          -[NSObject firstObject](v23, "firstObject");
          v24 = objc_claimAutoreleasedReturnValue();
          -[NSObject uniqueIdentifier](v24, "uniqueIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v27, "length"))
          {
            installedSuggestedPagesTracker = self->_installedSuggestedPagesTracker;
            -[NSObject uniqueIdentifier](v24, "uniqueIdentifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = -[ATXInstalledSuggestedPagesTracker suggestedPageTypeWithIdentifier:](installedSuggestedPagesTracker, "suggestedPageTypeWithIdentifier:", v28);

            if (v31 == 4)
            {
              -[ATXUserEducationSuggestionSleepMigrationServer sendSuggestion:withEventType:](self, "sendSuggestion:withEventType:", v6, 0);
LABEL_47:

LABEL_48:
LABEL_49:

              goto LABEL_50;
            }
          }
          else
          {

          }
          __atxlog_handle_context_user_education_suggestions();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v37 = "-[ATXUserEducationSuggestionSleepMigrationServer _processModeChangeEvent:]";
            _os_log_impl(&dword_1C9A3B000, v29, OS_LOG_TYPE_DEFAULT, "%s: Not showing suggestion because there aren't any installed suggested pages for sleep", buf, 0xCu);
          }

          goto LABEL_47;
        }
        __atxlog_handle_context_user_education_suggestions();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v37 = "-[ATXUserEducationSuggestionSleepMigrationServer _processModeChangeEvent:]";
          _os_log_impl(&dword_1C9A3B000, v26, OS_LOG_TYPE_DEFAULT, "%s: Not showing user education suggestion because a suggested page was not created as part of the sleep migration flow, or the sleep migration didn't happen.", buf, 0xCu);
        }
      }
      else
      {
        __atxlog_handle_context_user_education_suggestions();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[ATXUserEducationSuggestionSleepMigrationServer _processModeChangeEvent:].cold.1(v26);
      }

LABEL_50:
      goto LABEL_51;
    }
    if (((v8 ^ 1 | v9) & 1) != 0)
    {
      if ((v8 & 1) == 0)
      {
        __atxlog_handle_context_user_education_suggestions();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v37 = "-[ATXUserEducationSuggestionSleepMigrationServer _processModeChangeEvent:]";
          v11 = "%s: Not dismissing suggestion because it hasn't been shown yet.";
          goto LABEL_28;
        }
        goto LABEL_30;
      }
      if (v9)
      {
        __atxlog_handle_context_user_education_suggestions();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v37 = "-[ATXUserEducationSuggestionSleepMigrationServer _processModeChangeEvent:]";
          v11 = "%s: Not dismissing suggestion because it has already been dismissed.";
          goto LABEL_28;
        }
LABEL_30:

      }
    }
    else
    {
      __atxlog_handle_context_user_education_suggestions();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v37 = "-[ATXUserEducationSuggestionSleepMigrationServer _processModeChangeEvent:]";
        _os_log_impl(&dword_1C9A3B000, v25, OS_LOG_TYPE_DEFAULT, "%s: Dismissing suggestion because we're exiting Sleep mode and its been shown but not yet dismissed", buf, 0xCu);
      }

      -[ATXUserEducationSuggestionSleepMigrationServer sendSuggestion:withEventType:](self, "sendSuggestion:withEventType:", v6, 1);
    }
  }
  else if (v7)
  {
    -[NSObject atx_dndModeSemanticType](v4, "atx_dndModeSemanticType");
    DNDModeSemanticTypeToString();
    v10 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v37 = "-[ATXUserEducationSuggestionSleepMigrationServer _processModeChangeEvent:]";
    v38 = 2114;
    v39 = v10;
    v11 = "%s: Not processing mode change event because mode: %{public}@ is not Sleep";
    v12 = v6;
    v13 = 22;
LABEL_29:
    _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
    goto LABEL_30;
  }
LABEL_51:

}

void __74__ATXUserEducationSuggestionSleepMigrationServer__processModeChangeEvent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "associatedModeUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

- (void)sendSuggestion:(id)a3 withEventType:(unint64_t)a4
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
    v11 = "-[ATXUserEducationSuggestionSleepMigrationServer sendSuggestion:withEventType:]";
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
  objc_storeStrong((id *)&self->_homeScreenConfigCache, 0);
  objc_storeStrong((id *)&self->_installedSuggestedPagesTracker, 0);
  objc_storeStrong((id *)&self->_connector, 0);
}

- (void)_processModeChangeEvent:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[ATXUserEducationSuggestionSleepMigrationServer _processModeChangeEvent:]";
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "%s: Not showing user education suggestion because there was an error while trying to determine whether a suggested page was created during sleep migration.", (uint8_t *)&v1, 0xCu);
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
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, v0, v1, "%s: Not showing suggestion. Unable to get mode uuid from event %{public}@", v2, v3, v4, v5, 2u);
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
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, v0, v1, "%s: Not showing suggestion because was unable to get configured home screen pages. Error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
