@implementation MNGetMNServerSessionStateInfoLog

void __MNGetMNServerSessionStateInfoLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "MNServerSessionStateInfo");
  v1 = (void *)MNGetMNServerSessionStateInfoLog_log;
  MNGetMNServerSessionStateInfoLog_log = (uint64_t)v0;

}

@end
