@implementation _ATXAppLaunchLocationGuardedData

- (void)dealloc
{
  objc_super v3;

  if (self->waitForUnlockNotificationToken)
    objc_msgSend(MEMORY[0x1E0D81590], "unregisterForLockStateChangeNotifications:");
  v3.receiver = self;
  v3.super_class = (Class)_ATXAppLaunchLocationGuardedData;
  -[_ATXAppLaunchLocationGuardedData dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->totalIntentLaunchCountMap, 0);
  objc_storeStrong((id *)&self->totalLaunchCountMap, 0);
  objc_storeStrong((id *)&self->appForAllIntentsLaunchCountMap, 0);
  objc_storeStrong((id *)&self->intentLaunchCountMap, 0);
  objc_storeStrong((id *)&self->appIntentLaunchCountMap, 0);
  objc_storeStrong((id *)&self->appLaunchCountMap, 0);
  objc_storeStrong(&self->waitForUnlockNotificationToken, 0);
}

@end
