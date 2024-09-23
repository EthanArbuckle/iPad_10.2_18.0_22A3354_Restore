@implementation BKUILoggingFacility

void ___BKUILoggingFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.biometrickitui", "log");
  v1 = (void *)_BKUILoggingFacility_oslog;
  _BKUILoggingFacility_oslog = (uint64_t)v0;

}

@end
