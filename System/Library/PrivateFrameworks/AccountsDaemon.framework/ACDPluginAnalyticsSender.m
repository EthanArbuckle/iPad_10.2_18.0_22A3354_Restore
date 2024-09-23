@implementation ACDPluginAnalyticsSender

+ (double)_timeSinceLastTTROffered
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;

  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistentDomainForName:", CFSTR("com.apple.accounts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("com.apple.accounts.ttr.lastOffered"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "persistentDomainForName:", CFSTR("com.apple.accounts"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("com.apple.accounts.ttr.lastOffered"));
    v9 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v9;
  }
  objc_msgSend(v2, "timeIntervalSinceNow");
  v11 = -v10;

  return v11;
}

+ (BOOL)accountsTTREnabled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentDomainForName:", CFSTR("com.apple.accounts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.accounts.ttr.enabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentDomainForName:", CFSTR("com.apple.accounts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.accounts.ttr.enabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

+ (void)openTapToRadarWithAlertTitle:(id)a3 alertDescription:(id)a4 TTRTitle:(id)a5 TTRDescription:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  NSObject *v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((ACIsInternal() & 1) != 0)
  {
    if ((objc_msgSend(a1, "accountsTTREnabled") & 1) != 0)
    {
      objc_msgSend(a1, "_timeSinceLastTTROffered");
      if (v14 >= 604800.0)
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.accounts"));
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("com.apple.accounts.ttr.lastOffered"));

        _ACLogSystem();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          +[ACDPluginAnalyticsSender openTapToRadarWithAlertTitle:alertDescription:TTRTitle:TTRDescription:].cold.2();

        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3221225472;
        v19[2] = __98__ACDPluginAnalyticsSender_openTapToRadarWithAlertTitle_alertDescription_TTRTitle_TTRDescription___block_invoke;
        v19[3] = &unk_24C7E30A8;
        v22 = a1;
        v20 = v12;
        v21 = v13;
        +[ACDUserNotification showUserNotificationWithTitle:message:cancelButtonTitle:otherButtonTitle:level:withCompletionBlock:](ACDUserNotification, "showUserNotificationWithTitle:message:cancelButtonTitle:otherButtonTitle:level:withCompletionBlock:", v10, v11, CFSTR("Cancel"), CFSTR("Open Tap-To-Radar"), 2, v19);

        v15 = v20;
      }
      else
      {
        _ACLogSystem();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          +[ACDPluginAnalyticsSender openTapToRadarWithAlertTitle:alertDescription:TTRTitle:TTRDescription:].cold.1();
      }
    }
    else
    {
      _ACLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[ACDPluginAnalyticsSender openTapToRadarWithAlertTitle:alertDescription:TTRTitle:TTRDescription:].cold.3();
    }
  }
  else
  {
    _ACLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[ACDPluginAnalyticsSender openTapToRadarWithAlertTitle:alertDescription:TTRTitle:TTRDescription:].cold.4();
  }

}

void __98__ACDPluginAnalyticsSender_openTapToRadarWithAlertTitle_alertDescription_TTRTitle_TTRDescription___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  _BOOL4 v6;

  _ACLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (a3)
  {
    if (v6)
      __98__ACDPluginAnalyticsSender_openTapToRadarWithAlertTitle_alertDescription_TTRTitle_TTRDescription___block_invoke_cold_2();

  }
  else
  {
    if (v6)
      __98__ACDPluginAnalyticsSender_openTapToRadarWithAlertTitle_alertDescription_TTRTitle_TTRDescription___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 48), "_selected_PostTapToRadar:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
}

+ (void)_selected_PostTapToRadar:(id)a3 description:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[8];

  v20[7] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if ((ACIsInternal() & 1) != 0)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDD1808]);
    -[NSObject setScheme:](v7, "setScheme:", CFSTR("tap-to-radar"));
    -[NSObject setHost:](v7, "setHost:", CFSTR("new"));
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("BundleID"), CFSTR("com.apple.accounts"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v5;
    v20[0] = v8;
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Title"), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v9;
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Description"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v10;
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Classification"), CFSTR("Crash/Hang/Data Loss"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[3] = v11;
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentName"), CFSTR("Accounts"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[4] = v12;
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentVersion"), CFSTR("iOS"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[5] = v13;
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentID"), CFSTR("990749"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[6] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setQueryItems:](v7, "setQueryItems:", v15);

    -[NSObject URL](v7, "URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject URL](v7, "URL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "openURL:configuration:completionHandler:", v18, 0, &__block_literal_global_7);

    }
    v5 = v19;
  }
  else
  {
    _ACLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[ACDPluginAnalyticsSender _selected_PostTapToRadar:description:].cold.1();
  }

}

+ (void)openTapToRadarWithAlertTitle:alertDescription:TTRTitle:TTRDescription:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_20D8CB000, v0, v1, "@\"Open Tap-To-Radar offered in the last week\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)openTapToRadarWithAlertTitle:alertDescription:TTRTitle:TTRDescription:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "@\"Offering to open Tap-To-Radar\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)openTapToRadarWithAlertTitle:alertDescription:TTRTitle:TTRDescription:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_20D8CB000, v0, v1, "@\"Open Tap-To-Radar disabled\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)openTapToRadarWithAlertTitle:alertDescription:TTRTitle:TTRDescription:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_20D8CB000, v0, v1, "@\"Open Tap-To-Radar called on external build\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __98__ACDPluginAnalyticsSender_openTapToRadarWithAlertTitle_alertDescription_TTRTitle_TTRDescription___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "@\"Opening Tap-To-Radar\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __98__ACDPluginAnalyticsSender_openTapToRadarWithAlertTitle_alertDescription_TTRTitle_TTRDescription___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "@\"Canceled open Tap-To-Radar\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)_selected_PostTapToRadar:description:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_20D8CB000, v0, v1, "@\"_selected_PostTapToRadar Tap-To-Radar called on external build\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
