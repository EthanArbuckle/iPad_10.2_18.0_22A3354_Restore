@implementation AXLogEscape

void __AXLogEscape_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXEscape");
  v1 = (void *)AXLogEscape___logObj;
  AXLogEscape___logObj = (uint64_t)v0;

}

@end
