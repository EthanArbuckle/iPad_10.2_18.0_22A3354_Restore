@implementation TVRUIServiceAppLog

void ___TVRUIServiceAppLog_block_invoke(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.TVRemoteUIService", "App");
  v2 = (void *)_TVRUIServiceAppLog_log;
  _TVRUIServiceAppLog_log = (uint64_t)v1;

}

@end
