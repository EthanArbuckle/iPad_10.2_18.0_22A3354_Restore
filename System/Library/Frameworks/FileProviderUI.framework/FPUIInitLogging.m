@implementation FPUIInitLogging

void __FPUIInitLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FileProviderUI", "FileProviderUI");
  v1 = (void *)fpuiLogHandle;
  fpuiLogHandle = (uint64_t)v0;

}

@end
