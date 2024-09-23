@implementation CSFSoftLinking

+ (void)registerForLoggedOutPushNotifications
{
  id v2;

  v2 = objc_alloc_init((Class)getINDaemonConnectionClass());
  objc_msgSend(v2, "registerDeviceForLoggedOutiCloudNotificationsWithReason:completion:", 8, &__block_literal_global_3);

}

void __55__CSFSoftLinking_registerForLoggedOutPushNotifications__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const __CFString *v13;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    _CSFGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __55__CSFSoftLinking_registerForLoggedOutPushNotifications__block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  }
  _CSFGetLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("NO");
    if (a2)
      v13 = CFSTR("YES");
    v14 = 138412290;
    v15 = v13;
    _os_log_impl(&dword_1A5B4D000, v12, OS_LOG_TYPE_DEFAULT, "Registering for logged out push was successful? %@", (uint8_t *)&v14, 0xCu);
  }

}

+ (void)unregisterForLoggedOutPushNotifications
{
  id v2;

  v2 = objc_alloc_init((Class)getINDaemonConnectionClass());
  objc_msgSend(v2, "unregisterDeviceFromLoggedOutiCloudNotificationsWithCompletion:", &__block_literal_global_4);

}

void __57__CSFSoftLinking_unregisterForLoggedOutPushNotifications__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const __CFString *v13;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    _CSFGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __57__CSFSoftLinking_unregisterForLoggedOutPushNotifications__block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  }
  _CSFGetLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("NO");
    if (a2)
      v13 = CFSTR("YES");
    v14 = 138412290;
    v15 = v13;
    _os_log_impl(&dword_1A5B4D000, v12, OS_LOG_TYPE_DEFAULT, "Unregistering for logged out push was successful? %@", (uint8_t *)&v14, 0xCu);
  }

}

void __55__CSFSoftLinking_registerForLoggedOutPushNotifications__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A5B4D000, a2, a3, "Error while registering for logged out push notifications: %@", a5, a6, a7, a8, 2u);
}

void __57__CSFSoftLinking_unregisterForLoggedOutPushNotifications__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A5B4D000, a2, a3, "Error while unregistering for logged out push notifications: %@", a5, a6, a7, a8, 2u);
}

@end
