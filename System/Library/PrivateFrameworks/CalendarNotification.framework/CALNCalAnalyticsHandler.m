@implementation CALNCalAnalyticsHandler

+ (CALNCalAnalyticsHandler)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__CALNCalAnalyticsHandler_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, block);
  return (CALNCalAnalyticsHandler *)(id)sharedInstance_handler;
}

void __41__CALNCalAnalyticsHandler_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_handler;
  sharedInstance_handler = (uint64_t)v1;

}

- (void)recordPostedNotification:(id)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("notificationType");
  objc_msgSend(a3, "sourceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CalAnalyticsSendEvent();

}

- (void)recordNotificationResponse:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("notificationType");
  v3 = a3;
  objc_msgSend(v3, "notificationRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("actionIdentifier");
  v9[0] = v5;
  objc_msgSend(v3, "actionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CalAnalyticsSendEvent();

}

@end
