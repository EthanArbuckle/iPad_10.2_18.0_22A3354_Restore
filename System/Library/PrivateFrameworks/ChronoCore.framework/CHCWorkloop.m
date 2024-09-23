@implementation CHCWorkloop

+ (id)serialQueueTargetingSharedWorkloop:(id)a3
{
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;

  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  +[CHCWorkloop sharedDaemonWorkloop](CHCWorkloop, "sharedDaemonWorkloop");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create_with_target_V2(v3, v4, v5);

  return v6;
}

+ (OS_dispatch_queue)sharedDaemonWorkloop
{
  if (sharedDaemonWorkloop_onceToken != -1)
    dispatch_once(&sharedDaemonWorkloop_onceToken, &__block_literal_global);
  return (OS_dispatch_queue *)(id)sharedDaemonWorkloop_workloop;
}

void __35__CHCWorkloop_sharedDaemonWorkloop__block_invoke()
{
  dispatch_workloop_t inactive;
  void *v1;

  inactive = dispatch_workloop_create_inactive("com.apple.chrono.daemon_workloop");
  v1 = (void *)sharedDaemonWorkloop_workloop;
  sharedDaemonWorkloop_workloop = (uint64_t)inactive;

  dispatch_workloop_set_autorelease_frequency((dispatch_workloop_t)sharedDaemonWorkloop_workloop, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_set_qos_class_fallback();
  dispatch_activate((dispatch_object_t)sharedDaemonWorkloop_workloop);
}

+ (id)serialQueueTargetingSharedWorkloop:(id)a3 withQoS:(unsigned int)a4
{
  const char *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;

  v5 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v6, (dispatch_qos_class_t)a4, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  +[CHCWorkloop sharedDaemonWorkloop](CHCWorkloop, "sharedDaemonWorkloop");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create_with_target_V2(v5, v7, v8);

  return v9;
}

@end
