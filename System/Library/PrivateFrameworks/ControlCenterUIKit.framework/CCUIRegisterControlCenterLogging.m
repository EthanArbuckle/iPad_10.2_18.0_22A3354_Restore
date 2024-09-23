@implementation CCUIRegisterControlCenterLogging

void __CCUIRegisterControlCenterLogging_block_invoke()
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

  v0 = os_log_create("com.apple.ControlCenter", "AnimationRunner");
  v1 = (void *)CCUILogAnimationRunner;
  CCUILogAnimationRunner = (uint64_t)v0;

  v2 = os_log_create("com.apple.ControlCenter", "ModuleInstance");
  v3 = (void *)CCUILogModuleInstance;
  CCUILogModuleInstance = (uint64_t)v2;

  v4 = os_log_create("com.apple.ControlCenter", "UserInterface");
  v5 = (void *)CCUILogUserInterface;
  CCUILogUserInterface = (uint64_t)v4;

  v6 = os_log_create("com.apple.ControlCenter", "IconLookup");
  v7 = (void *)CCUILogIconLookup;
  CCUILogIconLookup = (uint64_t)v6;

  v8 = os_log_create("com.apple.ControlCenter", "XcodeSupport");
  v9 = (void *)CCUILogXcodeSupport;
  CCUILogXcodeSupport = (uint64_t)v8;

}

@end
