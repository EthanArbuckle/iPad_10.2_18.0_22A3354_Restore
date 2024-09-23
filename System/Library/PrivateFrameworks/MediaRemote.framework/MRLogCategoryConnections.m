@implementation MRLogCategoryConnections

void __MRLogCategoryConnections_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.amp.mediaremote", "Connections");
  v1 = (void *)MRLogCategoryConnections__log;
  MRLogCategoryConnections__log = (uint64_t)v0;

}

@end
