@implementation KmlLogger

void __KmlLogger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.sesd.kml", "GeneralLogging");
  v1 = (void *)KmlLogger__logger;
  KmlLogger__logger = (uint64_t)v0;

}

@end
