@implementation AFSuggestionGenerationManagerOSLogFacility

void __AFSuggestionGenerationManagerOSLogFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AutoFillCore", "ProactiveQuickType");
  v1 = (void *)AFSuggestionGenerationManagerOSLogFacility_logFacility;
  AFSuggestionGenerationManagerOSLogFacility_logFacility = (uint64_t)v0;

}

@end
