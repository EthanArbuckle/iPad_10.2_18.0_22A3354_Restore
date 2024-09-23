@implementation SKAnalyticsManager

+ (void)sendEvent:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v3 = a3;
  if (objc_msgSend(v3, "canCreatePayload"))
  {
    objc_msgSend(v3, "eventName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v3;
    AnalyticsSendEventLazy();

  }
  else
  {
    if (SKLogHandleForCategory_onceToken_0 != -1)
      dispatch_once(&SKLogHandleForCategory_onceToken_0, &__block_literal_global_12);
    v5 = SKLogHandleForCategory_logHandles_1_0;
    if (os_log_type_enabled((os_log_t)SKLogHandleForCategory_logHandles_1_0, OS_LOG_TYPE_ERROR))
      +[SKAnalyticsManager sendEvent:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }

}

uint64_t __32__SKAnalyticsManager_sendEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "createPayload");
}

+ (void)sendEventLazyWithName:(id)a3 buildEvent:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  AnalyticsSendEventLazy();

}

id __55__SKAnalyticsManager_sendEventLazyWithName_buildEvent___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "canCreatePayload"))
  {
    objc_msgSend(v1, "createPayload");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (SKLogHandleForCategory_onceToken_0 != -1)
      dispatch_once(&SKLogHandleForCategory_onceToken_0, &__block_literal_global_12);
    v3 = SKLogHandleForCategory_logHandles_1_0;
    if (os_log_type_enabled((os_log_t)SKLogHandleForCategory_logHandles_1_0, OS_LOG_TYPE_ERROR))
      +[SKAnalyticsManager sendEvent:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    v2 = 0;
  }

  return v2;
}

+ (void)sendEvent:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1ABFBE000, a1, a3, "Error sending CoreAnalytics event, invalid event provided", a5, a6, a7, a8, 0);
}

@end
