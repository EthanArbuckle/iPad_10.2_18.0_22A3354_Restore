@implementation MSNLog

void __MSNLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MediaSafetyNet", "state");
  v1 = (void *)MSNLog_log;
  MSNLog_log = (uint64_t)v0;

}

@end
