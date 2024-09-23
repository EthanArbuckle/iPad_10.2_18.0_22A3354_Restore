@implementation NotificationCenter

- (NotificationCenter)init
{
  NotificationCenter *v2;
  uint64_t v3;
  UNUserNotificationCenter *userNotificationCenter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NotificationCenter;
  v2 = -[NotificationCenter init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDF88B8]), "initWithBundleIdentifier:", CFSTR("com.apple.coreaudio.adam.hae"));
    userNotificationCenter = v2->_userNotificationCenter;
    v2->_userNotificationCenter = (UNUserNotificationCenter *)v3;

    -[UNUserNotificationCenter setDelegate:](v2->_userNotificationCenter, "setDelegate:", v2);
    -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](v2->_userNotificationCenter, "setWantsNotificationResponsesDelivered");
    v2->_hasHaptics = MGGetBoolAnswer();
  }
  return v2;
}

- (void)sendNotificationWithExposureLevel:(double)a3 duration:(double)a4 eventType:(unsigned int)a5 volumeLoweringAction:(unsigned int)a6
{
  void *v8;
  NSString *v9;
  NSString *body;
  const __CFString *v11;
  NSString *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSString *v22;
  NSString *title;
  void *v24;
  NSString *v25;
  NSString *v26;
  void *v27;
  NSString *v28;
  NSString *v29;
  void *v30;
  UNUserNotificationCenter *userNotificationCenter;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint8_t v39[16];

  if (a5 == 2003133803)
  {
    HAENLocalizationUtilityGetBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MessageShortlookWeekly"), &stru_24D19FC68, 0);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    body = self->_body;
    self->_body = v12;
    v11 = CFSTR("hae.weekly.ios");
    goto LABEL_5;
  }
  if (a5 == 1818850917)
  {
    HAENLocalizationUtilityGetBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MessageShortlookLoud"), &stru_24D19FC68, 0);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    body = self->_body;
    self->_body = v9;
    v11 = CFSTR("hae.loud.ios");
LABEL_5:

    v13 = +[NotificationCenter _healthAppHidden](NotificationCenter, "_healthAppHidden");
    v14 = (void *)MEMORY[0x24BDF8820];
    HAENLocalizationUtilityGetBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ButtonLearnMoreInHealth"), &stru_24D19FC68, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "actionWithIdentifier:title:options:", CFSTR("HAEActionLearnMoreInHealth"), v16, 1);
    v17 = objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v19 = v18;
    if (v13)
    {
      HAENotificationsLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v39 = 0;
        _os_log_impl(&dword_2144B3000, v20, OS_LOG_TYPE_DEFAULT, "Health app is hidden...", v39, 2u);
      }

    }
    else
    {
      objc_msgSend(v18, "addObject:", v17);
    }
    HAENLocalizationUtilityGetBundle();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("NotificationTitleIOS"), &stru_24D19FC68, 0);
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    title = self->_title;
    self->_title = v22;

    if (a6 != 1986817143)
    {
      HAENLocalizationUtilityGetBundle();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("NotificationTitleRecommendation"), &stru_24D19FC68, 0);
      v25 = (NSString *)objc_claimAutoreleasedReturnValue();
      v26 = self->_title;
      self->_title = v25;

      HAENLocalizationUtilityGetBundle();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("MessageRecommendation"), &stru_24D19FC68, 0);
      v28 = (NSString *)objc_claimAutoreleasedReturnValue();
      v29 = self->_body;
      self->_body = v28;

    }
    objc_msgSend(MEMORY[0x24BDF8838], "categoryWithIdentifier:actions:intentIdentifiers:options:", v11, v19, MEMORY[0x24BDBD1A8], 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    userNotificationCenter = self->_userNotificationCenter;
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNUserNotificationCenter setNotificationCategories:](userNotificationCenter, "setNotificationCategories:", v32);

    v33 = objc_alloc_init(MEMORY[0x24BDF8800]);
    objc_msgSend(v33, "setTitle:", self->_title);
    objc_msgSend(v33, "setSubtitle:", self->_subtitle);
    objc_msgSend(v33, "setBody:", self->_body);
    objc_msgSend(MEMORY[0x24BDF8810], "soundWithAlertType:", 16);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setAlertTopic:", *MEMORY[0x24BEB8D98]);
    objc_msgSend(v34, "setToneIdentifier:", *MEMORY[0x24BEB8DD0]);
    objc_msgSend(v33, "setSound:", v34);
    objc_msgSend(v33, "setCategoryIdentifier:", v11);
    objc_msgSend(v33, "setThreadIdentifier:", CFSTR("com.apple.coreaudio.hae.notification"));
    objc_msgSend(v33, "setShouldBackgroundDefaultAction:", 1);
    v35 = (void *)MEMORY[0x24BDF8858];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "UUIDString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "requestWithIdentifier:content:trigger:destinations:", v37, v33, 0, 15);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_userNotificationCenter, "addNotificationRequest:withCompletionHandler:", v38, &__block_literal_global_2);
    goto LABEL_15;
  }
  HAENotificationsLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[NotificationCenter sendNotificationWithExposureLevel:duration:eventType:volumeLoweringAction:].cold.1(v17);
LABEL_15:

}

void __96__NotificationCenter_sendNotificationWithExposureLevel_duration_eventType_volumeLoweringAction___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  HAENotificationsLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __96__NotificationCenter_sendNotificationWithExposureLevel_duration_eventType_volumeLoweringAction___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2144B3000, v4, OS_LOG_TYPE_DEFAULT, "HAE live exposure notification sent", v5, 2u);
  }

}

- (void)handleNotificationAction:(id)a3
{
  __CFString *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const __CFString *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v3 = (__CFString *)a3;
  v4 = *MEMORY[0x24BE38310];
  v19[0] = *MEMORY[0x24BE38320];
  v19[1] = v4;
  v20[0] = MEMORY[0x24BDBD1C8];
  v20[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString isEqualToString:](v3, "isEqualToString:", *MEMORY[0x24BDF8A60]))
  {
    HAENotificationsLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v3;
      _os_log_impl(&dword_2144B3000, v6, OS_LOG_TYPE_DEFAULT, "HAE Notification Action: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=Sounds&path=HEADPHONE_LEVEL_LIMIT_SETTING"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v7, "openSensitiveURL:withOptions:error:", v8, v5, &v16);
    v9 = v16;

    if (v9)
    {
      HAENotificationsLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[NotificationCenter handleNotificationAction:].cold.1();
LABEL_13:

    }
  }
  else
  {
    v11 = -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("HAEActionLearnMoreInHealth"));
    HAENotificationsLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412290;
        v18 = CFSTR("HAEActionLearnMoreInHealth");
        _os_log_impl(&dword_2144B3000, v9, OS_LOG_TYPE_DEFAULT, "HAE Notification Action: %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("x-apple-Health://HearingAppPlugin.healthplugin/SafeHeadphoneListening"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      objc_msgSend(v13, "openSensitiveURL:withOptions:error:", v14, v5, &v15);
      v9 = v15;

      if (v9)
      {
        HAENotificationsLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[NotificationCenter handleNotificationAction:].cold.2();
        goto LABEL_13;
      }
    }
    else if (v12)
    {
      *(_DWORD *)buf = 138412290;
      v18 = v3;
      _os_log_impl(&dword_2144B3000, v9, OS_LOG_TYPE_DEFAULT, "Unknown HAE Notification Action: %@", buf, 0xCu);
    }
  }

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  objc_msgSend(v7, "notification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "content");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "categoryIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "hasPrefix:", CFSTR("hae.")))
  {
    objc_msgSend(v7, "actionIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NotificationCenter handleNotificationAction:](self, "handleNotificationAction:", v13);

    if (!v8)
      goto LABEL_8;
    goto LABEL_7;
  }
  HAENotificationsLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[NotificationCenter userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:].cold.1();

  if (v8)
LABEL_7:
    v8[2](v8);
LABEL_8:

}

+ (BOOL)_healthAppHidden
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  char v9;
  char v10;
  char v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDD41A0], "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAppleWatch");

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "restrictedAppBundleIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BDD4610];
    v7 = objc_msgSend(v5, "containsObject:", *MEMORY[0x24BDD4610]);
    objc_msgSend(v4, "parentalControlsBlacklistedAppBundleIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v6);
    if (objc_msgSend(v4, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63950]) == 2)
      v10 = 1;
    else
      v10 = v7;
    v11 = v10 | v9;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:placeholder:", *MEMORY[0x24BDD4610], 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v12;
    if (!v12)
    {
      v11 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v12, "appState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v5, "isRestricted");
  }

LABEL_10:
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
}

- (void)sendNotificationWithExposureLevel:(os_log_t)log duration:eventType:volumeLoweringAction:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2144B3000, log, OS_LOG_TYPE_ERROR, "Unknown event type", v1, 2u);
}

void __96__NotificationCenter_sendNotificationWithExposureLevel_duration_eventType_volumeLoweringAction___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2144B3000, v0, v1, "HAE live exposure notification error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleNotificationAction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2144B3000, v0, v1, "Failed to open settings because %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleNotificationAction:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2144B3000, v0, v1, "Failed to open health app because %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2144B3000, v0, v1, "Unknown HAE Notification Category Identifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
