@implementation MKGetAppleMediaServicesServerLog

void __MKGetAppleMediaServicesServerLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapKit", "AppleMediaServicesServer");
  v1 = (void *)qword_1ECE2D868;
  qword_1ECE2D868 = (uint64_t)v0;

}

@end
