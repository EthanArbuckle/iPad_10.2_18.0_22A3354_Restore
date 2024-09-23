@implementation AXMediaLogResults

void __AXMediaLogResults_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXMediaResults");
  v1 = (void *)AXMediaLogResults___logObj;
  AXMediaLogResults___logObj = (uint64_t)v0;

}

@end
