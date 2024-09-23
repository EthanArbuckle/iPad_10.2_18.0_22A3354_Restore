@implementation Logger

void __Logger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.InternationalSupport", "IPWatchLocaleController");
  v1 = (void *)Logger___migrationLogger;
  Logger___migrationLogger = (uint64_t)v0;

}

@end
