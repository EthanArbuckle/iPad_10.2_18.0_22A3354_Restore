@implementation ATXBlendingCaptureRateTracker

+ (void)logAppDirectoryCaptureWithTracker:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", 35);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConsumerSubType:", v5);

  objc_msgSend(v4, "setCaptured:", 1);
  objc_msgSend(v4, "setCaptureType:", 1);
  objc_msgSend(MEMORY[0x1E0D811A8], "stringForExecutableType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExecutableType:", v6);

  objc_msgSend(v3, "trackScalarForMessage:", v4);
  __atxlog_handle_metrics();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[ATXBlendingCaptureRateTracker logAppDirectoryCaptureWithTracker:].cold.1();

}

+ (void)logAppDirectoryDiversionWithCaptureType:(int)a3 tracker:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", 35);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConsumerSubType:", v7);

  objc_msgSend(v6, "setCaptured:", 0);
  objc_msgSend(v6, "setCaptureType:", v4);
  objc_msgSend(MEMORY[0x1E0D811A8], "stringForExecutableType:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExecutableType:", v8);

  objc_msgSend(v5, "trackScalarForMessage:", v6);
  __atxlog_handle_metrics();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    +[ATXBlendingCaptureRateTracker logAppDirectoryDiversionWithCaptureType:tracker:].cold.1();

}

+ (void)logHomeScreenCaptureWithTracker:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", 34);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConsumerSubType:", v5);

  objc_msgSend(v4, "setCaptured:", 1);
  objc_msgSend(v4, "setCaptureType:", 1);
  objc_msgSend(MEMORY[0x1E0D811A8], "stringForExecutableType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExecutableType:", v6);

  objc_msgSend(v3, "trackScalarForMessage:", v4);
  __atxlog_handle_metrics();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[ATXBlendingCaptureRateTracker logHomeScreenCaptureWithTracker:].cold.1();

}

+ (void)logHomeScreenDiversionWithCaptureType:(int)a3 tracker:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", 34);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConsumerSubType:", v7);

  objc_msgSend(v6, "setCaptured:", 0);
  objc_msgSend(v6, "setCaptureType:", v4);
  objc_msgSend(MEMORY[0x1E0D811A8], "stringForExecutableType:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExecutableType:", v8);

  objc_msgSend(v5, "trackScalarForMessage:", v6);
  __atxlog_handle_metrics();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    +[ATXBlendingCaptureRateTracker logHomeScreenDiversionWithCaptureType:tracker:].cold.1();

}

+ (void)logSpotlightAppCaptureWithTracker:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", 9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConsumerSubType:", v5);

  objc_msgSend(v4, "setCaptured:", 1);
  objc_msgSend(v4, "setCaptureType:", 1);
  objc_msgSend(MEMORY[0x1E0D811A8], "stringForExecutableType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExecutableType:", v6);

  objc_msgSend(v3, "trackScalarForMessage:", v4);
  __atxlog_handle_metrics();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[ATXBlendingCaptureRateTracker logSpotlightAppCaptureWithTracker:].cold.1();

}

+ (void)logSpotlightAppDiversionWithCaptureType:(int)a3 tracker:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", 9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConsumerSubType:", v7);

  objc_msgSend(v6, "setCaptured:", 0);
  objc_msgSend(v6, "setCaptureType:", v4);
  objc_msgSend(MEMORY[0x1E0D811A8], "stringForExecutableType:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExecutableType:", v8);

  objc_msgSend(v5, "trackScalarForMessage:", v6);
  __atxlog_handle_metrics();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    +[ATXBlendingCaptureRateTracker logSpotlightAppDiversionWithCaptureType:tracker:].cold.1();

}

+ (void)logSpotlightActionCaptureWithTracker:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", 21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConsumerSubType:", v5);

  objc_msgSend(v4, "setCaptured:", 1);
  objc_msgSend(v4, "setCaptureType:", 1);
  objc_msgSend(MEMORY[0x1E0D811A8], "stringForExecutableType:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExecutableType:", v6);

  objc_msgSend(v3, "trackScalarForMessage:", v4);
  __atxlog_handle_metrics();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[ATXBlendingCaptureRateTracker logSpotlightActionCaptureWithTracker:].cold.1();

}

+ (void)logSpotlightActionDiversionWithCaptureType:(int)a3 tracker:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", 21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConsumerSubType:", v7);

  objc_msgSend(v6, "setCaptured:", 0);
  objc_msgSend(v6, "setCaptureType:", v4);
  objc_msgSend(MEMORY[0x1E0D811A8], "stringForExecutableType:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExecutableType:", v8);

  objc_msgSend(v5, "trackScalarForMessage:", v6);
  __atxlog_handle_metrics();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    +[ATXBlendingCaptureRateTracker logSpotlightActionDiversionWithCaptureType:tracker:].cold.1();

}

+ (void)logAppDirectoryCaptureWithTracker:.cold.1()
{
  void *v0;
  void *v1;
  Class v2;
  id v3;
  char v5;
  char v6;
  uint64_t v7;
  __CFString *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t v18;

  OUTLINED_FUNCTION_5_3();
  NSStringFromClass(v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_4(), "consumerSubType");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_4_2();
  if (!(!v6 & v5))
    __asm { BR              X10 }
  OUTLINED_FUNCTION_6_3();
  if (!(!v6 & v5))
    __asm { BR              X10 }
  switch((_DWORD)v7)
  {
    case 1:
      v9 = CFSTR("Captured");
      break;
    case 0xBB9:
      v9 = CFSTR("SpotlightDiverted_ActionExecutedFromSearch");
      break;
    case 0x7D0:
      v9 = CFSTR("SpotlightDiverted_AppLaunchedFromShortcutExecution");
      break;
    case 0x7D1:
      v9 = CFSTR("SpotlightDiverted_AppLaunchedFromSearch");
      break;
    case 0x7D2:
      v9 = CFSTR("SpotlightDiverted_AppLaunchedFromSearchMatchingPredictedApp");
      break;
    case 0xBB8:
      v9 = CFSTR("SpotlightDiverted_ActionDonatedAfterSpotlightAppLaunch");
      break;
    case 0x3E8:
      v9 = CFSTR("Diverted");
      break;
    default:
      v16 = v7;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1_11(&dword_1A49EF000, v10, v11, "LOGGED: %@ - ATXMPBBlendingCaptureRateTracker with consumerSubType: %@ captureType: %@", v12, v13, v14, v15, v16, v17, v18);

  OUTLINED_FUNCTION_11();
}

+ (void)logAppDirectoryDiversionWithCaptureType:tracker:.cold.1()
{
  void *v0;
  void *v1;
  Class v2;
  id v3;
  char v5;
  char v6;
  uint64_t v7;
  __CFString *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t v18;

  OUTLINED_FUNCTION_5_3();
  NSStringFromClass(v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_4(), "consumerSubType");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_4_2();
  if (!(!v6 & v5))
    __asm { BR              X10 }
  OUTLINED_FUNCTION_6_3();
  if (!(!v6 & v5))
    __asm { BR              X10 }
  switch((_DWORD)v7)
  {
    case 1:
      v9 = CFSTR("Captured");
      break;
    case 0xBB9:
      v9 = CFSTR("SpotlightDiverted_ActionExecutedFromSearch");
      break;
    case 0x7D0:
      v9 = CFSTR("SpotlightDiverted_AppLaunchedFromShortcutExecution");
      break;
    case 0x7D1:
      v9 = CFSTR("SpotlightDiverted_AppLaunchedFromSearch");
      break;
    case 0x7D2:
      v9 = CFSTR("SpotlightDiverted_AppLaunchedFromSearchMatchingPredictedApp");
      break;
    case 0xBB8:
      v9 = CFSTR("SpotlightDiverted_ActionDonatedAfterSpotlightAppLaunch");
      break;
    case 0x3E8:
      v9 = CFSTR("Diverted");
      break;
    default:
      v16 = v7;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1_11(&dword_1A49EF000, v10, v11, "LOGGED: %@ - ATXMPBBlendingCaptureRateTracker with consumerSubType: %@ captureType: %@", v12, v13, v14, v15, v16, v17, v18);

  OUTLINED_FUNCTION_11();
}

+ (void)logHomeScreenCaptureWithTracker:.cold.1()
{
  void *v0;
  void *v1;
  Class v2;
  id v3;
  char v5;
  char v6;
  uint64_t v7;
  __CFString *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t v18;

  OUTLINED_FUNCTION_5_3();
  NSStringFromClass(v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_4(), "consumerSubType");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_4_2();
  if (!(!v6 & v5))
    __asm { BR              X10 }
  OUTLINED_FUNCTION_6_3();
  if (!(!v6 & v5))
    __asm { BR              X10 }
  switch((_DWORD)v7)
  {
    case 1:
      v9 = CFSTR("Captured");
      break;
    case 0xBB9:
      v9 = CFSTR("SpotlightDiverted_ActionExecutedFromSearch");
      break;
    case 0x7D0:
      v9 = CFSTR("SpotlightDiverted_AppLaunchedFromShortcutExecution");
      break;
    case 0x7D1:
      v9 = CFSTR("SpotlightDiverted_AppLaunchedFromSearch");
      break;
    case 0x7D2:
      v9 = CFSTR("SpotlightDiverted_AppLaunchedFromSearchMatchingPredictedApp");
      break;
    case 0xBB8:
      v9 = CFSTR("SpotlightDiverted_ActionDonatedAfterSpotlightAppLaunch");
      break;
    case 0x3E8:
      v9 = CFSTR("Diverted");
      break;
    default:
      v16 = v7;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1_11(&dword_1A49EF000, v10, v11, "LOGGED: %@ - ATXMPBBlendingCaptureRateTracker with consumerSubType: %@ captureType: %@", v12, v13, v14, v15, v16, v17, v18);

  OUTLINED_FUNCTION_11();
}

+ (void)logHomeScreenDiversionWithCaptureType:tracker:.cold.1()
{
  void *v0;
  void *v1;
  Class v2;
  id v3;
  char v5;
  char v6;
  uint64_t v7;
  __CFString *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t v18;

  OUTLINED_FUNCTION_5_3();
  NSStringFromClass(v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_4(), "consumerSubType");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_4_2();
  if (!(!v6 & v5))
    __asm { BR              X10 }
  OUTLINED_FUNCTION_6_3();
  if (!(!v6 & v5))
    __asm { BR              X10 }
  switch((_DWORD)v7)
  {
    case 1:
      v9 = CFSTR("Captured");
      break;
    case 0xBB9:
      v9 = CFSTR("SpotlightDiverted_ActionExecutedFromSearch");
      break;
    case 0x7D0:
      v9 = CFSTR("SpotlightDiverted_AppLaunchedFromShortcutExecution");
      break;
    case 0x7D1:
      v9 = CFSTR("SpotlightDiverted_AppLaunchedFromSearch");
      break;
    case 0x7D2:
      v9 = CFSTR("SpotlightDiverted_AppLaunchedFromSearchMatchingPredictedApp");
      break;
    case 0xBB8:
      v9 = CFSTR("SpotlightDiverted_ActionDonatedAfterSpotlightAppLaunch");
      break;
    case 0x3E8:
      v9 = CFSTR("Diverted");
      break;
    default:
      v16 = v7;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1_11(&dword_1A49EF000, v10, v11, "LOGGED: %@ - ATXMPBBlendingCaptureRateTracker with consumerSubType: %@ captureType: %@", v12, v13, v14, v15, v16, v17, v18);

  OUTLINED_FUNCTION_11();
}

+ (void)logSpotlightAppCaptureWithTracker:.cold.1()
{
  void *v0;
  void *v1;
  Class v2;
  id v3;
  char v5;
  char v6;
  uint64_t v7;
  __CFString *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t v18;

  OUTLINED_FUNCTION_5_3();
  NSStringFromClass(v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_4(), "consumerSubType");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_4_2();
  if (!(!v6 & v5))
    __asm { BR              X10 }
  OUTLINED_FUNCTION_6_3();
  if (!(!v6 & v5))
    __asm { BR              X10 }
  switch((_DWORD)v7)
  {
    case 1:
      v9 = CFSTR("Captured");
      break;
    case 0xBB9:
      v9 = CFSTR("SpotlightDiverted_ActionExecutedFromSearch");
      break;
    case 0x7D0:
      v9 = CFSTR("SpotlightDiverted_AppLaunchedFromShortcutExecution");
      break;
    case 0x7D1:
      v9 = CFSTR("SpotlightDiverted_AppLaunchedFromSearch");
      break;
    case 0x7D2:
      v9 = CFSTR("SpotlightDiverted_AppLaunchedFromSearchMatchingPredictedApp");
      break;
    case 0xBB8:
      v9 = CFSTR("SpotlightDiverted_ActionDonatedAfterSpotlightAppLaunch");
      break;
    case 0x3E8:
      v9 = CFSTR("Diverted");
      break;
    default:
      v16 = v7;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1_11(&dword_1A49EF000, v10, v11, "LOGGED: %@ - ATXMPBBlendingCaptureRateTracker with consumerSubType: %@ captureType: %@", v12, v13, v14, v15, v16, v17, v18);

  OUTLINED_FUNCTION_11();
}

+ (void)logSpotlightAppDiversionWithCaptureType:tracker:.cold.1()
{
  void *v0;
  void *v1;
  Class v2;
  id v3;
  char v5;
  char v6;
  uint64_t v7;
  __CFString *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t v18;

  OUTLINED_FUNCTION_5_3();
  NSStringFromClass(v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_4(), "consumerSubType");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_4_2();
  if (!(!v6 & v5))
    __asm { BR              X10 }
  OUTLINED_FUNCTION_6_3();
  if (!(!v6 & v5))
    __asm { BR              X10 }
  switch((_DWORD)v7)
  {
    case 1:
      v9 = CFSTR("Captured");
      break;
    case 0xBB9:
      v9 = CFSTR("SpotlightDiverted_ActionExecutedFromSearch");
      break;
    case 0x7D0:
      v9 = CFSTR("SpotlightDiverted_AppLaunchedFromShortcutExecution");
      break;
    case 0x7D1:
      v9 = CFSTR("SpotlightDiverted_AppLaunchedFromSearch");
      break;
    case 0x7D2:
      v9 = CFSTR("SpotlightDiverted_AppLaunchedFromSearchMatchingPredictedApp");
      break;
    case 0xBB8:
      v9 = CFSTR("SpotlightDiverted_ActionDonatedAfterSpotlightAppLaunch");
      break;
    case 0x3E8:
      v9 = CFSTR("Diverted");
      break;
    default:
      v16 = v7;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1_11(&dword_1A49EF000, v10, v11, "LOGGED: %@ - ATXMPBBlendingCaptureRateTracker with consumerSubType: %@ captureType: %@", v12, v13, v14, v15, v16, v17, v18);

  OUTLINED_FUNCTION_11();
}

+ (void)logSpotlightActionCaptureWithTracker:.cold.1()
{
  void *v0;
  void *v1;
  Class v2;
  id v3;
  char v5;
  char v6;
  uint64_t v7;
  __CFString *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t v18;

  OUTLINED_FUNCTION_5_3();
  NSStringFromClass(v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_4(), "consumerSubType");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_4_2();
  if (!(!v6 & v5))
    __asm { BR              X10 }
  OUTLINED_FUNCTION_6_3();
  if (!(!v6 & v5))
    __asm { BR              X10 }
  switch((_DWORD)v7)
  {
    case 1:
      v9 = CFSTR("Captured");
      break;
    case 0xBB9:
      v9 = CFSTR("SpotlightDiverted_ActionExecutedFromSearch");
      break;
    case 0x7D0:
      v9 = CFSTR("SpotlightDiverted_AppLaunchedFromShortcutExecution");
      break;
    case 0x7D1:
      v9 = CFSTR("SpotlightDiverted_AppLaunchedFromSearch");
      break;
    case 0x7D2:
      v9 = CFSTR("SpotlightDiverted_AppLaunchedFromSearchMatchingPredictedApp");
      break;
    case 0xBB8:
      v9 = CFSTR("SpotlightDiverted_ActionDonatedAfterSpotlightAppLaunch");
      break;
    case 0x3E8:
      v9 = CFSTR("Diverted");
      break;
    default:
      v16 = v7;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1_11(&dword_1A49EF000, v10, v11, "LOGGED: %@ - ATXMPBBlendingCaptureRateTracker with consumerSubType: %@ captureType: %@", v12, v13, v14, v15, v16, v17, v18);

  OUTLINED_FUNCTION_11();
}

+ (void)logSpotlightActionDiversionWithCaptureType:tracker:.cold.1()
{
  void *v0;
  void *v1;
  Class v2;
  id v3;
  char v5;
  char v6;
  uint64_t v7;
  __CFString *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t v18;

  OUTLINED_FUNCTION_5_3();
  NSStringFromClass(v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_4(), "consumerSubType");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_4_2();
  if (!(!v6 & v5))
    __asm { BR              X10 }
  OUTLINED_FUNCTION_6_3();
  if (!(!v6 & v5))
    __asm { BR              X10 }
  switch((_DWORD)v7)
  {
    case 1:
      v9 = CFSTR("Captured");
      break;
    case 0xBB9:
      v9 = CFSTR("SpotlightDiverted_ActionExecutedFromSearch");
      break;
    case 0x7D0:
      v9 = CFSTR("SpotlightDiverted_AppLaunchedFromShortcutExecution");
      break;
    case 0x7D1:
      v9 = CFSTR("SpotlightDiverted_AppLaunchedFromSearch");
      break;
    case 0x7D2:
      v9 = CFSTR("SpotlightDiverted_AppLaunchedFromSearchMatchingPredictedApp");
      break;
    case 0xBB8:
      v9 = CFSTR("SpotlightDiverted_ActionDonatedAfterSpotlightAppLaunch");
      break;
    case 0x3E8:
      v9 = CFSTR("Diverted");
      break;
    default:
      v16 = v7;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1_11(&dword_1A49EF000, v10, v11, "LOGGED: %@ - ATXMPBBlendingCaptureRateTracker with consumerSubType: %@ captureType: %@", v12, v13, v14, v15, v16, v17, v18);

  OUTLINED_FUNCTION_11();
}

@end
