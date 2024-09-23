@implementation _ARSessionMetricsDefaultReporter

- (void)postDarwinNotification:(id)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *name;

  name = (__CFString *)a3;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, name, 0, 0, 1u);

}

- (void)sendEvent:(id)a3 dictionary:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if (!+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.session.disableSessionMetricsReporting")))AnalyticsSendEventLazy();

}

@end
