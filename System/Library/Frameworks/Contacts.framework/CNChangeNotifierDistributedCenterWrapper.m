@implementation CNChangeNotifierDistributedCenterWrapper

- (void)addObserver:(id)a3 notification:(id)a4
{
  __CFString *v5;
  __CFNotificationCenter *DistributedCenter;
  id observer;

  v5 = (__CFString *)a4;
  observer = a3;
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterAddObserver(DistributedCenter, observer, (CFNotificationCallback)CNChangesNotifierCFNotificationCenterCallback, v5, 0, CFNotificationSuspensionBehaviorCoalesce);

}

- (void)removeObserver:(id)a3 notification:(id)a4
{
  __CFString *v5;
  __CFNotificationCenter *DistributedCenter;
  id observer;

  v5 = (__CFString *)a4;
  observer = a3;
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterRemoveObserver(DistributedCenter, observer, v5, 0);

}

- (void)postNotification:(id)a3
{
  __CFNotificationCenter *DistributedCenter;
  __CFString *name;

  name = (__CFString *)a3;
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterPostNotification(DistributedCenter, name, 0, 0, 0);

}

@end
