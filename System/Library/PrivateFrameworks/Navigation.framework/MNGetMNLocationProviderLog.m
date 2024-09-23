@implementation MNGetMNLocationProviderLog

void __MNGetMNLocationProviderLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "MNLocationProvider");
  v1 = (void *)MNGetMNLocationProviderLog_log;
  MNGetMNLocationProviderLog_log = (uint64_t)v0;

}

@end
