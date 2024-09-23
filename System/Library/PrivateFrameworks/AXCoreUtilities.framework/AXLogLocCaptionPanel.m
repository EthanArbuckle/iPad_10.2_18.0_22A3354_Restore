@implementation AXLogLocCaptionPanel

void __AXLogLocCaptionPanel_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXLocCaptionPanel");
  v1 = (void *)AXLogLocCaptionPanel___logObj;
  AXLogLocCaptionPanel___logObj = (uint64_t)v0;

}

@end
