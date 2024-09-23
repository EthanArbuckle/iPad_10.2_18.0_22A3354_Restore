@implementation CADLogInitIfNeeded

void __CADLogInitIfNeeded_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;

  v0 = os_log_create("com.apple.calendar.daemon", "Daemon");
  v1 = (void *)CADLogHandle;
  CADLogHandle = (uint64_t)v0;

  v2 = os_log_create("com.apple.calendar.daemon", "ManagedConfiguration");
  v3 = (void *)CADMCLogHandle;
  CADMCLogHandle = (uint64_t)v2;

  v4 = os_log_create("com.apple.calendar.daemon", "Notification");
  v5 = (void *)CADNotificationLogHandle;
  CADNotificationLogHandle = (uint64_t)v4;

  v6 = os_log_create("com.apple.calendar.daemon", "Predicates");
  v7 = (void *)CADPredicateSignpostsHandle;
  CADPredicateSignpostsHandle = (uint64_t)v6;

  v8 = os_log_create("com.apple.calendar.daemon", "Spotlight");
  v9 = (void *)CADSpotlightHandle;
  CADSpotlightHandle = (uint64_t)v8;

}

@end
