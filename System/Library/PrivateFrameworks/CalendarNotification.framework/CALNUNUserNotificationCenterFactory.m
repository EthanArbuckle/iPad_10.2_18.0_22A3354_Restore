@implementation CALNUNUserNotificationCenterFactory

+ (CALNUNUserNotificationCenterFactory)sharedInstance
{
  if (sharedInstance_onceToken_19 != -1)
    dispatch_once(&sharedInstance_onceToken_19, &__block_literal_global_21);
  return (CALNUNUserNotificationCenterFactory *)(id)sharedInstance_sharedInstance_16;
}

void __53__CALNUNUserNotificationCenterFactory_sharedInstance__block_invoke()
{
  CALNUNUserNotificationCenterFactory *v0;
  void *v1;

  v0 = objc_alloc_init(CALNUNUserNotificationCenterFactory);
  v1 = (void *)sharedInstance_sharedInstance_16;
  sharedInstance_sharedInstance_16 = (uint64_t)v0;

}

- (id)userNotificationCenterWithBundleIdentifier:(id)a3
{
  id v3;
  CALNUNDefaultUserNotificationCenter *v4;

  v3 = a3;
  v4 = -[CALNUNDefaultUserNotificationCenter initWithBundleIdentifier:]([CALNUNDefaultUserNotificationCenter alloc], "initWithBundleIdentifier:", v3);

  return v4;
}

@end
