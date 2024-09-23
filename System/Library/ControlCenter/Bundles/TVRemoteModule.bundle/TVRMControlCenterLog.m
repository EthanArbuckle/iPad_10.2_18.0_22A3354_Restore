@implementation TVRMControlCenterLog

void ___TVRMControlCenterLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TVRemoteModule", "ControlCenter");
  v1 = (void *)_TVRMControlCenterLog_log;
  _TVRMControlCenterLog_log = (uint64_t)v0;

}

@end
