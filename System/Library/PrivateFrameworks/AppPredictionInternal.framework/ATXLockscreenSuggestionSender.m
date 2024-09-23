@implementation ATXLockscreenSuggestionSender

- (ATXLockscreenSuggestionSender)init
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  ATXLockscreenSuggestionSender *v7;

  +[ATXLockscreenBlacklist sharedInstance](ATXLockscreenBlacklist, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXActionNotificationServer sharedInstance](ATXActionNotificationServer, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v6 = (void *)objc_msgSend(v5, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  v7 = -[ATXLockscreenSuggestionSender initWithLockscreenBlacklist:actionNotificationServer:userDefaults:](self, "initWithLockscreenBlacklist:actionNotificationServer:userDefaults:", v3, v4, v6);

  return v7;
}

- (ATXLockscreenSuggestionSender)initWithLockscreenBlacklist:(id)a3 actionNotificationServer:(id)a4 userDefaults:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXLockscreenSuggestionSender *v12;
  ATXLockscreenSuggestionSender *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXLockscreenSuggestionSender;
  v12 = -[ATXLockscreenSuggestionSender init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_lockscreenBlacklist, a3);
    objc_storeStrong((id *)&v13->_actionNotificationServer, a4);
    objc_storeStrong((id *)&v13->_userDefaults, a5);
  }

  return v13;
}

- (void)blendingLayerDidUpdateLockscreenUICache:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  const __CFString *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  id v20;
  int v21;
  id v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  id v26;
  char v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  NSObject *v31;
  objc_class *v32;
  void *v33;
  ATXActionNotificationServer *actionNotificationServer;
  int v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_blending();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 138412546;
    v36 = v7;
    v37 = 2112;
    v38 = v4;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%@ - received new ui cache: %@", (uint8_t *)&v35, 0x16u);

  }
  objc_msgSend(v4, "allSuggestionsInLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "executableSpecification");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "executableIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXLockscreenSuggestionSender _cachedExecutableIdentifier](self, "_cachedExecutableIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXLockscreenSuggestionSender _updateCachedExecutableIdentifierWithSuggestion:](self, "_updateCachedExecutableIdentifierWithSuggestion:", v9);
  if (!-[ATXLockscreenBlacklist isPredictionGloballyDisabled](self->_lockscreenBlacklist, "isPredictionGloballyDisabled"))
  {
    LOBYTE(v35) = 0;
    v16 = (const __CFString *)*MEMORY[0x1E0CF9510];
    if (CFPreferencesGetAppBooleanValue(CFSTR("displayDonationsOnLockscreen"), (CFStringRef)*MEMORY[0x1E0CF9510], (Boolean *)&v35)|| (LOBYTE(v35) = 0, CFPreferencesGetAppBooleanValue(CFSTR("displayLastDonationOnCoverSheet"), v16, (Boolean *)&v35)))
    {
      __atxlog_handle_blending();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138412290;
        v36 = v19;
        _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "%@ - not forwarding predictions to lockscreen because demo or developer switch was on", (uint8_t *)&v35, 0xCu);

      }
LABEL_11:

      goto LABEL_12;
    }
    if (v12)
    {
      v20 = v11;
      if (v20)
      {
        v21 = objc_msgSend(v12, "isEqualToString:", v20);

        if (v21)
        {
          v22 = v12;
          goto LABEL_20;
        }
      }
      __atxlog_handle_blending();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138412290;
        v36 = v25;
        _os_log_impl(&dword_1C9A3B000, v23, OS_LOG_TYPE_INFO, "%@ - revoke needed for old lock screen predictions", (uint8_t *)&v35, 0xCu);

      }
      -[ATXActionNotificationServer removeAllActionPredictionNotificationsAndTrackEvent:recordFeedback:](self->_actionNotificationServer, "removeAllActionPredictionNotificationsAndTrackEvent:recordFeedback:", 1, 1);
      v26 = v12;
      if (v20)
      {
LABEL_20:
        v27 = objc_msgSend(v20, "isEqualToString:", v12);

        if ((v27 & 1) != 0)
          goto LABEL_12;
        goto LABEL_25;
      }
    }
    else
    {
      __atxlog_handle_blending();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138412290;
        v36 = v30;
        _os_log_impl(&dword_1C9A3B000, v28, OS_LOG_TYPE_INFO, "%@ - revoking, although no old lock screen predictions detected", (uint8_t *)&v35, 0xCu);

      }
      -[ATXActionNotificationServer removeAllActionPredictionNotificationsAndTrackEvent:recordFeedback:](self->_actionNotificationServer, "removeAllActionPredictionNotificationsAndTrackEvent:recordFeedback:", 0, 0);
      if (v11)
      {
LABEL_25:
        __atxlog_handle_blending();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = 138412290;
          v36 = v33;
          _os_log_impl(&dword_1C9A3B000, v31, OS_LOG_TYPE_INFO, "%@ - post needed for new lock screen predictions", (uint8_t *)&v35, 0xCu);

        }
        actionNotificationServer = self->_actionNotificationServer;
        objc_msgSend(v4, "uuid");
        v17 = objc_claimAutoreleasedReturnValue();
        -[ATXActionNotificationServer postNotificationForProactiveSuggestion:blendingCacheUpdateUUID:](actionNotificationServer, "postNotificationForProactiveSuggestion:blendingCacheUpdateUUID:", v9, v17);
        goto LABEL_11;
      }
    }

    goto LABEL_12;
  }
  __atxlog_handle_blending();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 138412290;
    v36 = v15;
    _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "%@ - not forwarding predictions to lockscreen because predictions are globally disabled", (uint8_t *)&v35, 0xCu);

  }
  -[ATXActionNotificationServer removeAllActionPredictionNotificationsAndTrackEvent:recordFeedback:](self->_actionNotificationServer, "removeAllActionPredictionNotificationsAndTrackEvent:recordFeedback:", 0, 0);
LABEL_12:

}

- (id)_cachedExecutableIdentifier
{
  return -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("lockscreen_prediction"));
}

- (void)_updateCachedExecutableIdentifierWithSuggestion:(id)a3
{
  NSUserDefaults *userDefaults;
  void *v4;
  id v5;

  userDefaults = self->_userDefaults;
  objc_msgSend(a3, "executableSpecification");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executableIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults setObject:forKey:](userDefaults, "setObject:forKey:", v4, CFSTR("lockscreen_prediction"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_actionNotificationServer, 0);
  objc_storeStrong((id *)&self->_lockscreenBlacklist, 0);
}

@end
