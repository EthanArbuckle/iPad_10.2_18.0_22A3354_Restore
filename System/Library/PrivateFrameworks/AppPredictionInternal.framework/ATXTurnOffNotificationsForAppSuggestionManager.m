@implementation ATXTurnOffNotificationsForAppSuggestionManager

- (ATXTurnOffNotificationsForAppSuggestionManager)init
{
  void *v3;
  ATXTurnOffNotificationsForAppSuggestionManager *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXTurnOffNotificationsForAppSuggestionManager initWithDataStore:](self, "initWithDataStore:", v3);

  return v4;
}

- (ATXTurnOffNotificationsForAppSuggestionManager)initWithDataStore:(id)a3
{
  id v5;
  ATXTurnOffNotificationsForAppSuggestionManager *v6;
  ATXTurnOffNotificationsForAppSuggestionManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXTurnOffNotificationsForAppSuggestionManager;
  v6 = -[ATXTurnOffNotificationsForAppSuggestionManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataStore, a3);

  return v7;
}

- (id)activeSuggestions
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v4 = (void *)objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v4, "doubleForKey:", *MEMORY[0x1E0CF9550]);
  v6 = v5;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v5);
  -[ATXNotificationAndSuggestionDatastore allNotificationsFromBundleId:sinceTimestamp:](self->_dataStore, "allNotificationsFromBundleId:sinceTimestamp:", CFSTR("com.apple.tips"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") > 3)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject second](v9, "second");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", &unk_1E83CC7C0);

    if (v12)
    {
      __atxlog_handle_notification_management();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v23 = "-[ATXTurnOffNotificationsForAppSuggestionManager activeSuggestions]";
        v24 = 2048;
        v25 = 4;
        v26 = 2112;
        v27 = CFSTR("com.apple.tips");
        _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "%s: The %ldth notification from %@ is not active so not sending a suggestion", buf, 0x20u);
      }
    }
    else
    {
      -[NSObject second](v9, "second");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqual:", &unk_1E83CC7D8);

      if ((v15 & 1) != 0)
      {
        v16 = objc_alloc(MEMORY[0x1E0CF8F90]);
        v17 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject first](v9, "first");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v16, "initTurnOffNotificationsForAppSuggestionWithUUID:bundleID:timestamp:triggerNotificationUUID:", v17, CFSTR("com.apple.tips"), v18, v19);

        v21 = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

        goto LABEL_14;
      }
      __atxlog_handle_notification_management();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[ATXTurnOffNotificationsForAppSuggestionManager activeSuggestions].cold.1(v9, v13);
    }
    v10 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_13;
  }
  __atxlog_handle_notification_management();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v23 = "-[ATXTurnOffNotificationsForAppSuggestionManager activeSuggestions]";
    v24 = 2048;
    v25 = objc_msgSend(v8, "count");
    v26 = 2112;
    v27 = CFSTR("com.apple.tips");
    v28 = 2112;
    v29 = v7;
    v30 = 2048;
    v31 = 4;
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "%s: There were only %ld notifications from %@ since the last upgrade on %@. We only send the suggestion on the %ldth notification, so not sending one.", buf, 0x34u);
  }
  v10 = (void *)MEMORY[0x1E0C9AA60];
LABEL_14:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStore, 0);
}

- (void)activeSuggestions
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "second");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136315394;
  v5 = "-[ATXTurnOffNotificationsForAppSuggestionManager activeSuggestions]";
  v6 = 2112;
  v7 = v3;
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "%s: Unexpected value for isActive. Expecting either 0 (NO) or 1 (YES). Instead got %@", (uint8_t *)&v4, 0x16u);

}

@end
