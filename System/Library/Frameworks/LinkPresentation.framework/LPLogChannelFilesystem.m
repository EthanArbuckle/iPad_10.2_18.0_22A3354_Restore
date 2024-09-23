@implementation LPLogChannelFilesystem

void __LPLogChannelFilesystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LinkPresentation", "Filesystem");
  v1 = (void *)LPLogChannelFilesystem_log;
  LPLogChannelFilesystem_log = (uint64_t)v0;

}

@end
