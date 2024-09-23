@implementation ASVInitLogging

void __ASVInitLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.assetviewer.inlinepreview", "default");
  v1 = (void *)_asvLogHandle;
  _asvLogHandle = (uint64_t)v0;

}

@end
