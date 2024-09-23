@implementation AXRuntimeLogElementFetcher

void __AXRuntimeLogElementFetcher_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXRuntimeElementFetcher");
  v1 = (void *)AXRuntimeLogElementFetcher___logObj;
  AXRuntimeLogElementFetcher___logObj = (uint64_t)v0;

}

@end
