@implementation MRLogCategoryDiscovery

void __MRLogCategoryDiscovery_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.amp.mediaremote", "Discovery");
  v1 = (void *)MRLogCategoryDiscovery__log;
  MRLogCategoryDiscovery__log = (uint64_t)v0;

}

@end
