@implementation CNChangeNotifierDarwinWrapper

- (void)addObserver:(id)a3 notification:(id)a4
{
  __CFString *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  id observer;

  v5 = (__CFString *)a4;
  observer = a3;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, observer, (CFNotificationCallback)CNChangesNotifierCFNotificationCenterCallback, v5, 0, CFNotificationSuspensionBehaviorCoalesce);

}

- (void)removeObserver:(id)a3 notification:(id)a4
{
  __CFString *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  id observer;

  v5 = (__CFString *)a4;
  observer = a3;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, observer, v5, 0);

}

- (void)postNotification:(id)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *name;

  name = (__CFString *)a3;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, name, 0, 0, 0);

}

@end
