@implementation BAGLog

+ (OS_os_log)resourceVending
{
  if (resourceVending_onceToken != -1)
    dispatch_once(&resourceVending_onceToken, &__block_literal_global_0);
  return (OS_os_log *)(id)resourceVending___log;
}

void __25__BAGLog_resourceVending__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "BagKitResourceVending");
  v1 = (void *)resourceVending___log;
  resourceVending___log = (uint64_t)v0;

}

@end
