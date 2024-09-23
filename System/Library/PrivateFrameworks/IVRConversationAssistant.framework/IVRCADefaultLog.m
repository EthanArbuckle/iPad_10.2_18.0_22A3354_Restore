@implementation IVRCADefaultLog

void __IVRCADefaultLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ivrconversationassistant", "IVRCADefaultLog");
  v1 = (void *)IVRCADefaultLog_defaultLogger;
  IVRCADefaultLog_defaultLogger = (uint64_t)v0;

}

@end
