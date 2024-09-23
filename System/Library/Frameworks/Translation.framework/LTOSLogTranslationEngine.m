@implementation LTOSLogTranslationEngine

void ___LTOSLogTranslationEngine_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Translation", "TranslationEngine");
  v1 = (void *)_LTOSLogTranslationEngine_log;
  _LTOSLogTranslationEngine_log = (uint64_t)v0;

}

@end
