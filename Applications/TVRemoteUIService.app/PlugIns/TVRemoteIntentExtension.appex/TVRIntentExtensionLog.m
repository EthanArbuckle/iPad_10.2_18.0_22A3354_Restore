@implementation TVRIntentExtensionLog

void ___TVRIntentExtensionLog_block_invoke(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.TVRemoteUIService", "IntentExtension");
  v2 = (void *)_TVRIntentExtensionLog_log;
  _TVRIntentExtensionLog_log = (uint64_t)v1;

}

@end
