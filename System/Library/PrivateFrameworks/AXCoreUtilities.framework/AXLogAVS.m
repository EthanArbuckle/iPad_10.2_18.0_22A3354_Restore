@implementation AXLogAVS

void __AXLogAVS_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXAVS");
  v1 = (void *)AXLogAVS___logObj;
  AXLogAVS___logObj = (uint64_t)v0;

}

@end
