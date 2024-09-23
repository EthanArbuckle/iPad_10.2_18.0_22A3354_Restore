@implementation VSSubscriptionService

- (VSSubscriptionService)init
{
  void *v3;
  VSSubscriptionService *v4;
  id v5;
  void *v6;
  VSSubscriptionRegistry *v7;
  VSSubscriptionService *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1D8236758](self, a2);
  v10.receiver = self;
  v10.super_class = (Class)VSSubscriptionService;
  v4 = -[VSServiceListener init](&v10, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v5, "addObject:", CFSTR("com.apple.smoot.subscriptionservice"));
    objc_msgSend(v5, "addObject:", CFSTR("com.apple.private.subscriptionservice.internal"));
    objc_msgSend(v5, "addObject:", CFSTR("com.apple.developer.video-subscription-registration"));
    objc_msgSend(v5, "addObject:", CFSTR("com.apple.private.subscriptionservice.all-sources.read-only"));
    objc_msgSend(v5, "addObject:", CFSTR("com.apple.private.subscriptionservice.web-sources.read-write"));
    -[VSServiceListener setEntitlementNames:](v4, "setEntitlementNames:", v5);
    VSSubscriptionServiceInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSServiceListener setExportedInterface:](v4, "setExportedInterface:", v6);

    v7 = objc_alloc_init(VSSubscriptionRegistry);
    -[VSServiceListener setExportedObject:](v4, "setExportedObject:", v7);

  }
  v8 = v4;
  objc_autoreleasePoolPop(v3);

  return v8;
}

@end
