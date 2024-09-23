@implementation DNDSWorkloop

+ (id)sharedDaemonWorkloop
{
  if (sharedDaemonWorkloop_onceToken != -1)
    dispatch_once(&sharedDaemonWorkloop_onceToken, &__block_literal_global_14);
  return (id)sharedDaemonWorkloop_workloop;
}

void __36__DNDSWorkloop_sharedDaemonWorkloop__block_invoke()
{
  dispatch_workloop_t inactive;
  void *v1;

  inactive = dispatch_workloop_create_inactive("com.apple.donotdisturb.daemon_workloop");
  v1 = (void *)sharedDaemonWorkloop_workloop;
  sharedDaemonWorkloop_workloop = (uint64_t)inactive;

  dispatch_workloop_set_autorelease_frequency((dispatch_workloop_t)sharedDaemonWorkloop_workloop, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_set_qos_class_fallback();
  dispatch_activate((dispatch_object_t)sharedDaemonWorkloop_workloop);
}

+ (id)serialQueueTargetingSharedWorkloop:(id)a3
{
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;

  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  +[DNDSWorkloop sharedDaemonWorkloop](DNDSWorkloop, "sharedDaemonWorkloop");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create_with_target_V2(v3, v4, v5);

  return v6;
}

@end
