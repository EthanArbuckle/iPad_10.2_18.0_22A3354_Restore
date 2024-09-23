@implementation MSNPeriodicLog

void __MSNPeriodicLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MediaSafetyNet", "periodic");
  v1 = (void *)MSNPeriodicLog_log;
  MSNPeriodicLog_log = (uint64_t)v0;

}

@end
