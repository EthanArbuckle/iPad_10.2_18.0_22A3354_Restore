@implementation ATXModeAutomationSuggestionTester

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_53);
  return (id)sharedInstance_sharedInstance;
}

void __51__ATXModeAutomationSuggestionTester_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;

}

- (ATXModeAutomationSuggestionTester)init
{
  ATXModeAutomationSuggestionTester *v2;
  const __CFString *v3;
  uint64_t v4;
  UNUserNotificationCenter *notificationCenter;
  UNUserNotificationCenter *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  ATXActivitySuggestionClient *suggestionClient;
  objc_super v13;
  Boolean keyExistsAndHasValidFormat;

  v13.receiver = self;
  v13.super_class = (Class)ATXModeAutomationSuggestionTester;
  v2 = -[ATXModeAutomationSuggestionTester init](&v13, sel_init);
  if (v2)
  {
    v3 = (const __CFString *)*MEMORY[0x1E0D80E80];
    keyExistsAndHasValidFormat = 0;
    if (CFPreferencesGetAppBooleanValue(v3, (CFStringRef)*MEMORY[0x1E0CF9510], &keyExistsAndHasValidFormat))
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", CFSTR("com.apple.ATXDebugNotifications"));
      notificationCenter = v2->_notificationCenter;
      v2->_notificationCenter = (UNUserNotificationCenter *)v4;

      -[UNUserNotificationCenter setDelegate:](v2->_notificationCenter, "setDelegate:", v2);
      -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](v2->_notificationCenter, "setWantsNotificationResponsesDelivered");
      -[UNUserNotificationCenter requestAuthorizationWithOptions:completionHandler:](v2->_notificationCenter, "requestAuthorizationWithOptions:completionHandler:", 6, &__block_literal_global_12_2);
      v6 = v2->_notificationCenter;
      v7 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(MEMORY[0x1E0CEC720], "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("modes.automation"), MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setWithObject:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNUserNotificationCenter setNotificationCategories:](v6, "setNotificationCategories:", v9);

    }
    v10 = objc_opt_new();
    suggestionClient = v2->_suggestionClient;
    v2->_suggestionClient = (ATXActivitySuggestionClient *)v10;

    -[ATXActivitySuggestionClient registerObserver:](v2->_suggestionClient, "registerObserver:", v2);
  }
  return v2;
}

void __41__ATXModeAutomationSuggestionTester_init__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_modes();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = a2;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "ATXModeAutomationSuggestionTester: notification authorized = %d", (uint8_t *)v13, 8u);
  }

  if (v4)
  {
    __atxlog_handle_modes();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __41__ATXModeAutomationSuggestionTester_init__block_invoke_cold_1((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[ATXActivitySuggestionClient removeObserver:](self->_suggestionClient, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)ATXModeAutomationSuggestionTester;
  -[ATXModeAutomationSuggestionTester dealloc](&v3, sel_dealloc);
}

- (id)_stringForActivityType:(unint64_t)a3
{
  if (a3 > 0xF)
    return 0;
  else
    return off_1E82DE360[a3];
}

- (void)activitySuggestionClient:(id)a3 didSuggestConfiguredActivity:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v5 = (void *)objc_opt_new();
  if (v9)
  {
    objc_msgSend(v5, "setTitle:", CFSTR("Activity Inferred: Enter Configured Activity"));
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v9, "uuidString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("The configured activity (%@) was inferred"), v7);
    objc_msgSend(v5, "setBody:", v8);

  }
  else
  {
    objc_msgSend(v5, "setTitle:", CFSTR("Activity Inferred: Configured Activity Expired"));
    objc_msgSend(v5, "setBody:", CFSTR("The last activity suggestion expired"));
  }
  -[ATXModeAutomationSuggestionTester _sendNotificationWithContent:](self, "_sendNotificationWithContent:", v5);

}

- (void)activitySuggestionClient:(id)a3 didSuggestSettingUpActivity:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  v5 = (void *)objc_opt_new();
  if (v7)
  {
    objc_msgSend(v5, "setTitle:", CFSTR("Activity Inferred: Activity Set-Up Suggestion"));
    -[ATXModeAutomationSuggestionTester _stringForActivityType:](self, "_stringForActivityType:", objc_msgSend(v7, "activityType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBody:", v6);

  }
  else
  {
    objc_msgSend(v5, "setTitle:", CFSTR("Activity Inferred: Activity Set-Up Suggestion Expired"));
    objc_msgSend(v5, "setBody:", CFSTR("Set-up suggestion expired"));
  }
  -[ATXModeAutomationSuggestionTester _sendNotificationWithContent:](self, "_sendNotificationWithContent:", v5);

}

- (void)activitySuggestionClient:(id)a3 didSuggestActivity:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (!a4)
  {
    __atxlog_handle_modes();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[ATXModeAutomationSuggestionTester activitySuggestionClient:didSuggestActivity:].cold.1(v7);

    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setTitle:", CFSTR("Activity Ended"));
    objc_msgSend(v6, "previousSuggestion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "modeUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = v11;
      }
      else
      {
        objc_msgSend(v10, "activityType");
        ATXActivityTypeToString();
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v14 = v13;

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The previous activity (%@) has ended"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBody:", v15);

      -[ATXModeAutomationSuggestionTester _sendNotificationWithContent:](self, "_sendNotificationWithContent:", v8);
    }

  }
}

- (void)_sendNotificationWithContent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "body");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v10, "setCategoryIdentifier:", CFSTR("modes.automation"));
    if (self->_notificationCenter)
    {
      objc_msgSend(MEMORY[0x1E0CEC790], "triggerWithTimeInterval:repeats:", 0, 1.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0CEC740];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "requestWithIdentifier:content:trigger:", v8, v10, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_notificationCenter, "addNotificationRequest:withCompletionHandler:", v9, &__block_literal_global_68_0);
    }
  }

}

void __66__ATXModeAutomationSuggestionTester__sendNotificationWithContent___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2)
  {
    __atxlog_handle_modes();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __66__ATXModeAutomationSuggestionTester__sendNotificationWithContent___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionClient, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

void __41__ATXModeAutomationSuggestionTester_init__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXModeAutomationSuggestionTester: error while requesting notification auth - %@", a5, a6, a7, a8, 2u);
}

- (void)activitySuggestionClient:(os_log_t)log didSuggestActivity:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_DEBUG, "Displaying activity ended notification", v1, 2u);
}

void __66__ATXModeAutomationSuggestionTester__sendNotificationWithContent___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXModeAutomationSuggestionTester: error while adding notification request - %@", a5, a6, a7, a8, 2u);
}

@end
