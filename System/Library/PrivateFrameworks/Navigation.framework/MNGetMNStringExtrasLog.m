@implementation MNGetMNStringExtrasLog

void __MNGetMNStringExtrasLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "MNStringExtras");
  v1 = (void *)MNGetMNStringExtrasLog_log;
  MNGetMNStringExtrasLog_log = (uint64_t)v0;

}

@end
