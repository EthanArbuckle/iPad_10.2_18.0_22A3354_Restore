@implementation MRLogCategoryDiscoveryUpdates

void __MRLogCategoryDiscoveryUpdates_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.amp.mediaremote.verbose", "Discovery");
  v1 = (void *)MRLogCategoryDiscoveryUpdates_log;
  MRLogCategoryDiscoveryUpdates_log = (uint64_t)v0;

}

@end
