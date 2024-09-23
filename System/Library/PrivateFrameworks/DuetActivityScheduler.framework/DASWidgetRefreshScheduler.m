@implementation DASWidgetRefreshScheduler

void __45___DASWidgetRefreshScheduler_sharedScheduler__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedScheduler_widgetScheduler;
  sharedScheduler_widgetScheduler = v0;

}

id __48___DASWidgetRefreshScheduler_recordWidgetViews___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __48___DASWidgetRefreshScheduler_recordWidgetViews___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __48___DASWidgetRefreshScheduler_recordWidgetViews___block_invoke_2_cold_1();

  }
}

id __52___DASWidgetRefreshScheduler_recordWidgetRefreshes___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __52___DASWidgetRefreshScheduler_recordWidgetRefreshes___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __52___DASWidgetRefreshScheduler_recordWidgetRefreshes___block_invoke_2_cold_1();

  }
}

void __40___DASWidgetRefreshScheduler_setBudget___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "dailyMaxBudget"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v2, CFSTR("system-overall"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "widgetMaxBudget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v3, CFSTR("individual"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "systemAddedWidgetMaxBudget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("system-addedBySystem"));
  objc_msgSend(*(id *)(a1 + 40), "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C78], "keyPathWithKey:", CFSTR("/dasd/widgetBudget"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);

}

void __61___DASWidgetRefreshScheduler_setOverridesForWidgetBudgetIDs___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1B0DF4000, v2, OS_LOG_TYPE_DEFAULT, "Setting overrides widget refresh entries: %@", (uint8_t *)&v8, 0xCu);
  }

  v4 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
    v5 = *(_QWORD *)(a1 + 40);
  else
    v5 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C78], "keyPathWithKey:", CFSTR("/dasd/widgetOverride"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

}

void __60___DASWidgetRefreshScheduler_setSystemAddedWidgetBudgetIDs___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1B0DF4000, v2, OS_LOG_TYPE_DEFAULT, "Setting system added widget refresh entries: %@", (uint8_t *)&v8, 0xCu);
  }

  v4 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
    v5 = *(_QWORD *)(a1 + 40);
  else
    v5 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C78], "keyPathWithKey:", CFSTR("/dasd/widgetSystemAdded"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

}

void __138___DASWidgetRefreshScheduler_createRefreshActivityForWidgetBudgetID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __138___DASWidgetRefreshScheduler_createRefreshActivityForWidgetBudgetID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __138___DASWidgetRefreshScheduler_createRefreshActivityForWidgetBudgetID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_258(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __138___DASWidgetRefreshScheduler_createRefreshActivityForWidgetBudgetID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_258_cold_1();

}

void __188___DASWidgetRefreshScheduler_createRefreshActivityWithRateLimitConfigurationName_forWidgetBudgetID_withRemoteDeviceID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  __CFString *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __188___DASWidgetRefreshScheduler_createRefreshActivityWithRateLimitConfigurationName_forWidgetBudgetID_withRemoteDeviceID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_cold_1(v3, v4);

  v5 = *(void **)(a1 + 40);
  if (v5 || (v5 = *(void **)(a1 + 48)) != 0)
    v6 = v5;
  else
    v6 = &stru_1E624C4F8;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __188___DASWidgetRefreshScheduler_createRefreshActivityWithRateLimitConfigurationName_forWidgetBudgetID_withRemoteDeviceID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_270(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __138___DASWidgetRefreshScheduler_createRefreshActivityForWidgetBudgetID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_258_cold_1();

}

void __72___DASWidgetRefreshScheduler_createRefreshActivityWithWidgetParameters___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __138___DASWidgetRefreshScheduler_createRefreshActivityForWidgetBudgetID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_258_cold_1();

}

void __87___DASWidgetRefreshScheduler_createRefreshActivityWithWidgetParameters_refreshHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __188___DASWidgetRefreshScheduler_createRefreshActivityWithRateLimitConfigurationName_forWidgetBudgetID_withRemoteDeviceID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_cold_1(v3, v4);

  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "widgetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

}

void __91___DASWidgetRefreshScheduler_createRefreshActivityWithWidgetParameters_withRefreshHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __188___DASWidgetRefreshScheduler_createRefreshActivityWithRateLimitConfigurationName_forWidgetBudgetID_withRemoteDeviceID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_cold_1(v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __48___DASWidgetRefreshScheduler_recordWidgetViews___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Error in saving widget views entries: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __52___DASWidgetRefreshScheduler_recordWidgetRefreshes___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Error in saving widget refresh entries: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __138___DASWidgetRefreshScheduler_createRefreshActivityForWidgetBudgetID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B0DF4000, v0, v1, "Start handler called on Widget Refresh activity %@", v2);
  OUTLINED_FUNCTION_2();
}

void __138___DASWidgetRefreshScheduler_createRefreshActivityForWidgetBudgetID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_258_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B0DF4000, v0, v1, "Suspend handler called on Widget Refresh activity %@", v2);
  OUTLINED_FUNCTION_2();
}

void __188___DASWidgetRefreshScheduler_createRefreshActivityWithRateLimitConfigurationName_forWidgetBudgetID_withRemoteDeviceID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B0DF4000, a2, v4, "Start handler called on Widget Refresh activity %@", v5);

  OUTLINED_FUNCTION_3();
}

@end
