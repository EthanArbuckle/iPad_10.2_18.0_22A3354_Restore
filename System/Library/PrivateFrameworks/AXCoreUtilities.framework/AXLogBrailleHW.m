@implementation AXLogBrailleHW

void __AXLogBrailleHW_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXBrailleHW");
  v1 = (void *)AXLogBrailleHW___logObj;
  AXLogBrailleHW___logObj = (uint64_t)v0;

}

@end
