@implementation NPSLoggingFrameworkObjectInit

void __NPSLoggingFrameworkObjectInit_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.NanoPreferencesSync", "Framework");
  v1 = (void *)nps_framework_log;
  nps_framework_log = (uint64_t)v0;

}

@end
