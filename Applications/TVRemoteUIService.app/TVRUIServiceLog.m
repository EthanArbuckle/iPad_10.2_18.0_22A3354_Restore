@implementation TVRUIServiceLog

void ___TVRUIServiceLog_block_invoke(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.TVRemoteUIService", "RemoteAlert");
  v2 = (void *)_TVRUIServiceLog_log;
  _TVRUIServiceLog_log = (uint64_t)v1;

}

@end
