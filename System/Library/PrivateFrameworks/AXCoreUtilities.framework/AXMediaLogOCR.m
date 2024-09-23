@implementation AXMediaLogOCR

void __AXMediaLogOCR_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXMediaOCR");
  v1 = (void *)AXMediaLogOCR___logObj;
  AXMediaLogOCR___logObj = (uint64_t)v0;

}

@end
