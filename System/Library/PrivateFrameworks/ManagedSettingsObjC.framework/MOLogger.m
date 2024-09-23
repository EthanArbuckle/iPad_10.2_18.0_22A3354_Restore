@implementation MOLogger

+ (OS_os_log)subscription
{
  if (subscription_onceToken != -1)
    dispatch_once(&subscription_onceToken, &__block_literal_global_8);
  return (OS_os_log *)(id)subscription_log;
}

+ (OS_os_log)store
{
  if (store_onceToken != -1)
    dispatch_once(&store_onceToken, &__block_literal_global_6);
  return (OS_os_log *)(id)store_log;
}

void __24__MOLogger_subscription__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ManagedSettingsObjC", "subscription");
  v1 = (void *)subscription_log;
  subscription_log = (uint64_t)v0;

}

void __17__MOLogger_store__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ManagedSettingsObjC", "store");
  v1 = (void *)store_log;
  store_log = (uint64_t)v0;

}

+ (OS_os_log)effective
{
  if (effective_onceToken != -1)
    dispatch_once(&effective_onceToken, &__block_literal_global_0);
  return (OS_os_log *)(id)effective_log;
}

void __21__MOLogger_effective__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ManagedSettingsObjC", "effective");
  v1 = (void *)effective_log;
  effective_log = (uint64_t)v0;

}

+ (OS_os_log)blame
{
  if (blame_onceToken != -1)
    dispatch_once(&blame_onceToken, &__block_literal_global_2);
  return (OS_os_log *)(id)blame_log;
}

void __17__MOLogger_blame__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ManagedSettingsObjC", "blame");
  v1 = (void *)blame_log;
  blame_log = (uint64_t)v0;

}

+ (OS_os_log)sandboxing
{
  if (sandboxing_onceToken != -1)
    dispatch_once(&sandboxing_onceToken, &__block_literal_global_4);
  return (OS_os_log *)(id)sandboxing_log;
}

void __22__MOLogger_sandboxing__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ManagedSettingsObjC", "sandboxing");
  v1 = (void *)sandboxing_log;
  sandboxing_log = (uint64_t)v0;

}

+ (OS_os_log)xpc
{
  if (xpc_onceToken != -1)
    dispatch_once(&xpc_onceToken, &__block_literal_global_10);
  return (OS_os_log *)(id)xpc_log;
}

void __15__MOLogger_xpc__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ManagedSettingsObjC", "xpc");
  v1 = (void *)xpc_log;
  xpc_log = (uint64_t)v0;

}

@end
