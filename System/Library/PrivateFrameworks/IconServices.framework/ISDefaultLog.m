@implementation ISDefaultLog

void ___ISDefaultLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iconservices", "default");
  v1 = (void *)_ISDefaultLog_log;
  _ISDefaultLog_log = (uint64_t)v0;

}

@end
