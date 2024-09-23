@implementation HPSLoggingFacility

void ___HPSLoggingFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.HPSettings", "log");
  v1 = (void *)_HPSLoggingFacility_oslog;
  _HPSLoggingFacility_oslog = (uint64_t)v0;

}

@end
