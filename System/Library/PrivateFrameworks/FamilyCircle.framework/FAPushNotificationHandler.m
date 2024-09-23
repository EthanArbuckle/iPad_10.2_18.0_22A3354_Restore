@implementation FAPushNotificationHandler

+ (id)sharedHandler
{
  if (sharedHandler_onceToken != -1)
    dispatch_once(&sharedHandler_onceToken, &__block_literal_global_3);
  return (id)sharedHandler_handler;
}

void __42__FAPushNotificationHandler_sharedHandler__block_invoke()
{
  FAPushNotificationHandler *v0;
  void *v1;

  v0 = objc_alloc_init(FAPushNotificationHandler);
  v1 = (void *)sharedHandler_handler;
  sharedHandler_handler = (uint64_t)v0;

}

- (void)didReceivePushNotificationWithPayload:(id)a3
{
  id v3;
  NSObject *v4;
  FAHandleFamilyEventPushNotificationRequest *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _FALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1CAEBA000, v4, OS_LOG_TYPE_DEFAULT, "FAPushNotificationHandler: Received payload %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = -[FAHandleFamilyEventPushNotificationRequest initWithPayload:]([FAHandleFamilyEventPushNotificationRequest alloc], "initWithPayload:", v3);
  -[FAHandleFamilyEventPushNotificationRequest startRequestWithCompletionHandler:](v5, "startRequestWithCompletionHandler:", &__block_literal_global_14);

}

void __67__FAPushNotificationHandler_didReceivePushNotificationWithPayload___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    _FALogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_1CAEBA000, v3, OS_LOG_TYPE_DEFAULT, "FAPushNotificationHandler: Error handling push notification - %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

@end
