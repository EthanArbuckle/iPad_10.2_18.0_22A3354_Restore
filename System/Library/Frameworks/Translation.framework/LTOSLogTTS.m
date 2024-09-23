@implementation LTOSLogTTS

void ___LTOSLogTTS_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Translation", "TTS");
  v1 = (void *)_LTOSLogTTS_log;
  _LTOSLogTTS_log = (uint64_t)v0;

}

@end
