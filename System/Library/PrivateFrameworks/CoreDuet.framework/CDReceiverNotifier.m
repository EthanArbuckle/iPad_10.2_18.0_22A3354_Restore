@implementation CDReceiverNotifier

void __37___CDReceiverNotifier_sharedInstance__block_invoke()
{
  void *v0;
  _CDReceiverNotifier *v1;
  void *v2;

  v0 = (void *)MEMORY[0x193FEE914]();
  v1 = objc_alloc_init(_CDReceiverNotifier);
  v2 = (void *)sharedInstance__pasExprOnceResult_1;
  sharedInstance__pasExprOnceResult_1 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

void __27___CDReceiverNotifier_init__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleXPCNotificationEvent:", v3);

}

void __44___CDReceiverNotifier__publishXPCEvent_uid___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  _logChannel();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __44___CDReceiverNotifier__publishXPCEvent_uid___block_invoke_cold_2(a1, (uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __44___CDReceiverNotifier__publishXPCEvent_uid___block_invoke_cold_1(a1, v5, v6, v7, v8, v9, v10, v11);
  }

}

void __44___CDReceiverNotifier__publishXPCEvent_uid___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, a2, a3, "Successfully sent event to %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __44___CDReceiverNotifier__publishXPCEvent_uid___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_6_9(&dword_18DDBE000, a2, a3, "Failed to event to subscriber %@ for AppIntent: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_5();
}

@end
