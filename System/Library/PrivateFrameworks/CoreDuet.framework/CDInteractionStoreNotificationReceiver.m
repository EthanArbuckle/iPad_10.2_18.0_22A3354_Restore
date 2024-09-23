@implementation CDInteractionStoreNotificationReceiver

void __47___CDInteractionStoreNotificationReceiver_init__block_invoke(uint64_t a1, int token)
{
  NSObject *WeakRetained;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t state64;

  state64 = 0;
  if (notify_get_state(token, &state64))
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      __47___CDInteractionStoreNotificationReceiver_init__block_invoke_cold_1(WeakRetained, v4, v5, v6, v7, v8, v9, v10);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    -[NSObject postPackedMechanisms:](WeakRetained, "postPackedMechanisms:", state64);
  }

}

void __47___CDInteractionStoreNotificationReceiver_init__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, a1, a3, "Failed to get state for internal store notifications.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
