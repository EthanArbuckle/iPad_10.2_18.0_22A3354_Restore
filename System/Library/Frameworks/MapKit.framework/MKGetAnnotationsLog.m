@implementation MKGetAnnotationsLog

void __MKGetAnnotationsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapKit", "Annotations");
  v1 = (void *)MKGetAnnotationsLog_log;
  MKGetAnnotationsLog_log = (uint64_t)v0;

}

@end
