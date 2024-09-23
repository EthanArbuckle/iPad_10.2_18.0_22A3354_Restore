@implementation AXLogIDS

void __AXLogIDS_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXIDS");
  v1 = (void *)AXLogIDS___logObj;
  AXLogIDS___logObj = (uint64_t)v0;

}

@end
