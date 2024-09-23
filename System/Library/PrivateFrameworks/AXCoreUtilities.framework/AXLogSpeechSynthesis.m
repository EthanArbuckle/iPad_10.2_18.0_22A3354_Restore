@implementation AXLogSpeechSynthesis

void __AXLogSpeechSynthesis_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXSpeechSynthesis");
  v1 = (void *)AXLogSpeechSynthesis___logObj;
  AXLogSpeechSynthesis___logObj = (uint64_t)v0;

}

@end
