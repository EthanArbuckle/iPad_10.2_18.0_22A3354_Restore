@implementation FAUIInitLogging

void __FAUIInitLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FilesActionsUI", "FilesActionsUI");
  v1 = (void *)fauiLogHandle;
  fauiLogHandle = (uint64_t)v0;

}

@end
