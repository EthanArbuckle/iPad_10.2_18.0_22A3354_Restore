@implementation MNGetErrorsLog

void __MNGetErrorsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "Errors");
  v1 = (void *)MNGetErrorsLog_log;
  MNGetErrorsLog_log = (uint64_t)v0;

}

@end
