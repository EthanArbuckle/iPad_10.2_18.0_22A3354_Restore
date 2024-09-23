@implementation DOCICloudQuotaInAppMessaging

+ (void)preloadICloudQuotaLibrary
{
  if (preloadICloudQuotaLibrary_onceToken != -1)
    dispatch_once(&preloadICloudQuotaLibrary_onceToken, &__block_literal_global_20);
}

void __57__DOCICloudQuotaInAppMessaging_preloadICloudQuotaLibrary__block_invoke()
{
  dispatch_time_t v0;
  NSObject *v1;

  v0 = dispatch_time(0, 100000000);
  dispatch_get_global_queue(17, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_after(v0, v1, &__block_literal_global_21);

}

void __38__DOCICloudQuotaInAppMessaging_shared__block_invoke()
{
  DOCICloudQuotaInAppMessaging *v0;
  void *v1;

  v0 = objc_alloc_init(DOCICloudQuotaInAppMessaging);
  v1 = (void *)shared_shared;
  shared_shared = (uint64_t)v0;

}

- (void)startObservingUpdates
{
  id v2;

  -[DOCICloudQuotaInAppMessaging messaging](self, "messaging");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observeUpdates");

}

- (ICQInAppMessaging)messaging
{
  return self->_messaging;
}

- (DOCICloudQuotaInAppMessaging)init
{
  DOCICloudQuotaInAppMessaging *v2;
  uint64_t v3;
  ICQInAppMessaging *messaging;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DOCICloudQuotaInAppMessaging;
  v2 = -[DOCICloudQuotaInAppMessaging init](&v6, sel_init);
  objc_msgSend(getICQInAppMessagingClass(), "shared");
  v3 = objc_claimAutoreleasedReturnValue();
  messaging = v2->_messaging;
  v2->_messaging = (ICQInAppMessaging *)v3;

  return v2;
}

- (id)fetchMessageFromNotification:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  DOCICloudQuotaInAppMessage *v6;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getICQInAppMessageKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = -[DOCICloudQuotaInAppMessage initWithICQInAppMessage:]([DOCICloudQuotaInAppMessage alloc], "initWithICQInAppMessage:", v5);
  else
    v6 = 0;

  return v6;
}

+ (DOCICloudQuotaInAppMessaging)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_2);
  return (DOCICloudQuotaInAppMessaging *)(id)shared_shared;
}

- (void)stopObservingUpdates
{
  id v2;

  -[DOCICloudQuotaInAppMessaging messaging](self, "messaging");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopObservingUpdates");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messaging, 0);
}

@end
