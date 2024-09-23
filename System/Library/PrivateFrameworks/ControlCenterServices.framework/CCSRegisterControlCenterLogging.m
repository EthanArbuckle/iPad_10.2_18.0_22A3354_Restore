@implementation CCSRegisterControlCenterLogging

void __CCSRegisterControlCenterLogging_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create("com.apple.ControlCenter", "ModuleSettings");
  v1 = (void *)CCSLogModuleSettings;
  CCSLogModuleSettings = (uint64_t)v0;

  v2 = os_log_create("com.apple.ControlCenter", "RemoteService");
  v3 = (void *)CCSLogRemoteService;
  CCSLogRemoteService = (uint64_t)v2;

}

@end
