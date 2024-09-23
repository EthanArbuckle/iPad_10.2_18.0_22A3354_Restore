@implementation KmlSignpostLogger

void __KmlSignpostLogger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.sesd.kml", "SignpostLogging");
  v1 = (void *)KmlSignpostLogger__signpostLogger;
  KmlSignpostLogger__signpostLogger = (uint64_t)v0;

}

@end
