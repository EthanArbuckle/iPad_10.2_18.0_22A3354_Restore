@implementation SWShareableContentLogHandle

void __SWShareableContentLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SharedWithYou", "ShareableContent");
  v1 = (void *)SWShareableContentLogHandle_osLog;
  SWShareableContentLogHandle_osLog = (uint64_t)v0;

}

@end
