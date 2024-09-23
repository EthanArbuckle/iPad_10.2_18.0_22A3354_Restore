@implementation LPLogChannelImage

void __LPLogChannelImage_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LinkPresentation", "Image");
  v1 = (void *)LPLogChannelImage_log;
  LPLogChannelImage_log = (uint64_t)v0;

}

@end
