@implementation MKGetAppImageManagerLog

void __MKGetAppImageManagerLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapKit", "AppImageManager");
  v1 = (void *)qword_1ECE2D838;
  qword_1ECE2D838 = (uint64_t)v0;

}

@end
