@implementation DNDRegisterLogging

void __DNDRegisterLogging_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;
  os_log_t v10;
  void *v11;
  os_log_t v12;
  void *v13;
  os_log_t v14;
  void *v15;
  os_log_t v16;
  void *v17;
  os_log_t v18;
  void *v19;
  os_log_t v20;
  void *v21;
  os_log_t v22;
  void *v23;
  os_log_t v24;
  void *v25;

  v0 = os_log_create("com.apple.donotdisturb", "AuxiliaryState");
  v1 = (void *)DNDLogAuxiliaryState;
  DNDLogAuxiliaryState = (uint64_t)v0;

  v2 = os_log_create("com.apple.donotdisturb", "AppConfiguration");
  v3 = (void *)DNDLogAppConfiguration;
  DNDLogAppConfiguration = (uint64_t)v2;

  v4 = os_log_create("com.apple.donotdisturb", "BehaviorResolution");
  v5 = (void *)DNDLogBehaviorResolution;
  DNDLogBehaviorResolution = (uint64_t)v4;

  v6 = os_log_create("com.apple.donotdisturb", "GlobalConfiguration");
  v7 = (void *)DNDLogGlobalConfiguration;
  DNDLogGlobalConfiguration = (uint64_t)v6;

  v8 = os_log_create("com.apple.donotdisturb", "ModeAssertion");
  v9 = (void *)DNDLogModeAssertion;
  DNDLogModeAssertion = (uint64_t)v8;

  v10 = os_log_create("com.apple.donotdisturb", "ModeConfiguration");
  v11 = (void *)DNDLogModeConfiguration;
  DNDLogModeConfiguration = (uint64_t)v10;

  v12 = os_log_create("com.apple.donotdisturb", "ModeSelection");
  v13 = (void *)DNDLogModeSelection;
  DNDLogModeSelection = (uint64_t)v12;

  v14 = os_log_create("com.apple.donotdisturb", "RemoteConnection");
  v15 = (void *)DNDLogRemoteConnection;
  DNDLogRemoteConnection = (uint64_t)v14;

  v16 = os_log_create("com.apple.donotdisturb", "Settings");
  v17 = (void *)DNDLogSettings;
  DNDLogSettings = (uint64_t)v16;

  v18 = os_log_create("com.apple.donotdisturb", "State");
  v19 = (void *)DNDLogState;
  DNDLogState = (uint64_t)v18;

  v20 = os_log_create("com.apple.donotdisturb", "DNDMeDeviceService.client");
  v21 = (void *)DNDLogMeDeviceService;
  DNDLogMeDeviceService = (uint64_t)v20;

  v22 = os_log_create("com.apple.donotdisturb", "Utilities");
  v23 = (void *)DNDLogUtilities;
  DNDLogUtilities = (uint64_t)v22;

  v24 = os_log_create("com.apple.donotdisturb", "XPCEventObserver");
  v25 = (void *)DNDLogXPCEventObserver;
  DNDLogXPCEventObserver = (uint64_t)v24;

}

@end
