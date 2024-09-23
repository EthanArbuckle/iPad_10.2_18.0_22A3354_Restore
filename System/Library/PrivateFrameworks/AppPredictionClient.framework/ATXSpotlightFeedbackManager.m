@implementation ATXSpotlightFeedbackManager

- (ATXSpotlightFeedbackManager)init
{
  void *v3;
  ATXSpotlightFeedbackManager *v4;

  +[ATXEngagementRecordManager sharedInstance](ATXEngagementRecordManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXSpotlightFeedbackManager initWithEngagementRecordManager:](self, "initWithEngagementRecordManager:", v3);

  return v4;
}

- (ATXSpotlightFeedbackManager)initWithEngagementRecordManager:(id)a3
{
  id v5;
  ATXSpotlightFeedbackManager *v6;
  ATXSpotlightFeedbackManager *v7;
  uint64_t v8;
  NSString *clientModelId;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXSpotlightFeedbackManager;
  v6 = -[ATXSpotlightFeedbackManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_engagementRecordManager, a3);
    objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 44);
    v8 = objc_claimAutoreleasedReturnValue();
    clientModelId = v7->_clientModelId;
    v7->_clientModelId = (NSString *)v8;

  }
  return v7;
}

- (void)addHiddenActionExecutableIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_zkw_hide();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXSpotlightFeedbackManager: addHiddenActionExecutableIdentifier: %@", (uint8_t *)&v6, 0xCu);
  }

  -[ATXEngagementRecordManager addEngagedExecutable:clientModelId:engagementRecordType:](self->_engagementRecordManager, "addEngagedExecutable:clientModelId:engagementRecordType:", v4, self->_clientModelId, 128);
}

- (void)addHiddenContextIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_zkw_hide();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXSpotlightFeedbackManager: addHiddenContext: %@", (uint8_t *)&v6, 0xCu);
  }

  -[ATXEngagementRecordManager addEngagedExecutable:clientModelId:engagementRecordType:](self->_engagementRecordManager, "addEngagedExecutable:clientModelId:engagementRecordType:", v4, self->_clientModelId, 256);
}

- (void)addHiddenAutoShortcutIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_zkw_hide();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXSpotlightFeedbackManager: addHiddenAutoShortcut: %@", (uint8_t *)&v6, 0xCu);
  }

  -[ATXEngagementRecordManager addEngagedExecutable:clientModelId:engagementRecordType:](self->_engagementRecordManager, "addEngagedExecutable:clientModelId:engagementRecordType:", v4, self->_clientModelId, 512);
}

- (void)addHiddenAppSuggestionBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_zkw_hide();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXSpotlightFeedbackManager: addHiddenAppSuggestion: %@", (uint8_t *)&v7, 0xCu);

  }
  -[ATXEngagementRecordManager addHiddenSuggestion:duration:engagementRecordType:](self->_engagementRecordManager, "addHiddenSuggestion:duration:engagementRecordType:", v4, 120, 86400.0);
  -[ATXSpotlightFeedbackManager _toggleSiriSearchSettingsOffForAppSuggestion:](self, "_toggleSiriSearchSettingsOffForAppSuggestion:", v4);

}

- (void)clearHiddenSuggestions
{
  NSObject *v3;
  ATXEngagementRecordManager *engagementRecordManager;
  int v5;
  ATXEngagementRecordManager *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[ATXEngagementRecordManager removeAllEngagementsOfRecordType:](self->_engagementRecordManager, "removeAllEngagementsOfRecordType:", 896);
  __atxlog_handle_zkw_hide();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    engagementRecordManager = self->_engagementRecordManager;
    v5 = 138412290;
    v6 = engagementRecordManager;
    _os_log_impl(&dword_1A49EF000, v3, OS_LOG_TYPE_DEFAULT, "ATXSpotlightFeedbackManager: clearHiddenSuggestions for cache: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (BOOL)hasBeenHiddenSuggestion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  int v10;
  void *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "executableSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executableIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[ATXSpotlightHidingUIController normalizedIdentifier:](ATXSpotlightHidingUIController, "normalizedIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ATXEngagementRecordManager hasEngagedWithExecutable:engagementRecordType:](self->_engagementRecordManager, "hasEngagedWithExecutable:engagementRecordType:", v6, 128);
  __atxlog_handle_zkw_hide();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 1024;
    v13 = v7;
    _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "ATXSpotlightFeedbackManager: hasBeenHiddenSuggestion:%@ ---> %{BOOL}d", (uint8_t *)&v10, 0x12u);
  }

  return v7;
}

- (BOOL)hasBeenHiddenEntityWithIdentifier:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  int v8;
  id v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = -[ATXEngagementRecordManager hasEngagedWithExecutable:engagementRecordType:](self->_engagementRecordManager, "hasEngagedWithExecutable:engagementRecordType:", v4, 128);
    __atxlog_handle_zkw_hide();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412546;
      v9 = v4;
      v10 = 1024;
      v11 = v5;
      _os_log_impl(&dword_1A49EF000, v6, OS_LOG_TYPE_DEFAULT, "ATXSpotlightFeedbackManager: hasBeenHiddenEntityWithIdentifier:%@ ---> %{BOOL}d", (uint8_t *)&v8, 0x12u);
    }
  }
  else
  {
    __atxlog_handle_zkw_hide();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1A49EF000, v6, OS_LOG_TYPE_DEFAULT, "ATXSpotlightFeedbackManager: hasBeenHiddenEntityWithIdentifier NIL ---> NO", (uint8_t *)&v8, 2u);
    }
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)contextHasBeenHiddenForSuggestion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uiSpecification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSpotlightFeedbackManager combineReasons:](self, "combineReasons:", objc_msgSend(v5, "predictionReasons"));

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v6 = v4;
  ATXSuggestionPredictionReasonEnumerateReasonCodes();
  __atxlog_handle_zkw_hide();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "uiSpecification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *((unsigned __int8 *)v14 + 24);
    *(_DWORD *)buf = 138412546;
    v18 = v9;
    v19 = 1024;
    v20 = v10;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "ATXSpotlightFeedbackManager: contextHasBeenHiddenForSuggestion %@:no context --->  %{BOOL}d", buf, 0x12u);

  }
  v11 = *((_BYTE *)v14 + 24) != 0;

  _Block_object_dispose(&v13, 8);
  return v11;
}

void __65__ATXSpotlightFeedbackManager_contextHasBeenHiddenForSuggestion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  stringForATXSuggestionPredictionReasonCode();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v3 + 24))
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "contextHasBeenHiddenForContextIdentifier:", v2);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  }
  *(_BYTE *)(v3 + 24) = v4;
  __atxlog_handle_zkw_hide();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "uiSpecification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v9 = 138412802;
    v10 = v7;
    v11 = 2112;
    v12 = v2;
    v13 = 1024;
    v14 = v8;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXSpotlightFeedbackManager: contextHasBeenHiddenForSuggestion %@:%@ ---> %{BOOL}d", (uint8_t *)&v9, 0x1Cu);

  }
}

- (BOOL)contextHasBeenHiddenForContextIdentifier:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a3)
    return -[ATXEngagementRecordManager hasEngagedWithExecutable:engagementRecordType:](self->_engagementRecordManager, "hasEngagedWithExecutable:engagementRecordType:", a3, 256);
  __atxlog_handle_zkw_hide();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[ATXSpotlightFeedbackManager contextHasBeenHiddenForContextIdentifier:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  return 0;
}

- (BOOL)autoShortcutHasBeenHiddenForIdentifier:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v15;
  id v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = -[ATXEngagementRecordManager hasEngagedWithExecutable:engagementRecordType:](self->_engagementRecordManager, "hasEngagedWithExecutable:engagementRecordType:", v4, 512);
    __atxlog_handle_zkw_hide();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v4;
      v17 = 1024;
      v18 = v5;
      _os_log_impl(&dword_1A49EF000, v6, OS_LOG_TYPE_DEFAULT, "ATXSpotlightFeedbackManager: autoShortcutHasBeenHiddenForIdentifier %@ --->  %{BOOL}d", (uint8_t *)&v15, 0x12u);
    }
  }
  else
  {
    __atxlog_handle_zkw_hide();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[ATXSpotlightFeedbackManager autoShortcutHasBeenHiddenForIdentifier:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (unint64_t)combineReasons:(unint64_t)a3
{
  unint64_t v3;

  v3 = 0x3000000000;
  if ((a3 & 0x3000000000) == 0)
    v3 = a3;
  if ((a3 & 0x380000000) != 0)
    v3 = 0x380000000;
  if ((a3 & 0x700000) != 0)
    return 7340032;
  else
    return v3;
}

- (void)_toggleSiriSearchSettingsOffForAppSuggestion:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v18;
  int v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "executableSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "executableType");

  objc_msgSend(v3, "executableSpecification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executableObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == 1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = v7;
    v9 = objc_alloc(MEMORY[0x1E0C99E20]);
    v10 = (const __CFString *)*MEMORY[0x1E0C9B260];
    v11 = (const __CFString *)*MEMORY[0x1E0C9B230];
    v12 = (void *)CFPreferencesCopyValue(CFSTR("SBSearchSuggestAppDisabled"), CFSTR("com.apple.spotlightui"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    v13 = v12;
    if (v12)
      v14 = v12;
    else
      v14 = (id)objc_opt_new();
    v15 = v14;

    v16 = (void *)objc_msgSend(v9, "initWithArray:", v15);
    objc_msgSend(v16, "addObject:", v8);
    CFPreferencesSetAppValue(CFSTR("SBSearchSuggestAppDisabled"), (CFPropertyListRef)objc_msgSend(v16, "allObjects"), CFSTR("com.apple.spotlightui"));
    CFPreferencesSynchronize(CFSTR("com.apple.spotlightui"), v10, v11);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.spotlightui.prefschanged"), 0, 0, 1u);

    __atxlog_handle_home_screen();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v8;
      _os_log_impl(&dword_1A49EF000, v18, OS_LOG_TYPE_DEFAULT, "toggled siri & search settings for spotlight OFF for app prediction: %@", (uint8_t *)&v19, 0xCu);
    }

  }
  else
  {
    __atxlog_handle_home_screen();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ATXSpotlightFeedbackManager _toggleSiriSearchSettingsOffForAppSuggestion:].cold.1(v3, (uint64_t)v7, v8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientModelId, 0);
  objc_storeStrong((id *)&self->_engagementRecordManager, 0);
}

- (void)contextHasBeenHiddenForContextIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, a1, a3, "ATXSpotlightFeedbackManager contextHasBeenHiddenForContextIdentifier:NIL hidden=NO", a5, a6, a7, a8, 0);
}

- (void)autoShortcutHasBeenHiddenForIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, a1, a3, "ATXSpotlightFeedbackManager autoShortcutHasBeenHiddenForIdentifier:NIL hidden=NO", a5, a6, a7, a8, 0);
}

- (void)_toggleSiriSearchSettingsOffForAppSuggestion:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D811A8];
  objc_msgSend(a1, "executableSpecification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForExecutableType:", objc_msgSend(v5, "executableType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 136315650;
  v10 = "-[ATXSpotlightFeedbackManager _toggleSiriSearchSettingsOffForAppSuggestion:]";
  v11 = 2114;
  v12 = v6;
  v13 = 2114;
  v14 = v8;
  _os_log_error_impl(&dword_1A49EF000, a3, OS_LOG_TYPE_ERROR, "%s: attempted to toggle siri & search settings off for non-app executable type: %{public}@ class: %{public}@", (uint8_t *)&v9, 0x20u);

}

@end
