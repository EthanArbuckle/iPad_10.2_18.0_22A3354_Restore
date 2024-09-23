@implementation MRLogCategoryDiscoveryOversize

void __MRLogCategoryDiscoveryOversize_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.amp.mediaremote", "DiscoveryOversize");
  v1 = (void *)MRLogCategoryDiscoveryOversize__log;
  MRLogCategoryDiscoveryOversize__log = (uint64_t)v0;

}

@end
