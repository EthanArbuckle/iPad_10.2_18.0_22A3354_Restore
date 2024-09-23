@implementation AXLogInvertColorsLoadBundles

void __AXLogInvertColorsLoadBundles_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXInvertColorsLoadBundles");
  v1 = (void *)AXLogInvertColorsLoadBundles___logObj;
  AXLogInvertColorsLoadBundles___logObj = (uint64_t)v0;

}

@end
