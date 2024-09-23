@implementation LiveSpeechLogCommon

void __LiveSpeechLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "LiveSpeechCommon");
  v1 = (void *)LiveSpeechLogCommon___logObj;
  LiveSpeechLogCommon___logObj = (uint64_t)v0;

}

@end
