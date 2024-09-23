@implementation IRSetupLogging

void __IRSetupLogging_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;

  v0 = os_log_create("com.apple.intelligentrouting", "general");
  v1 = (void *)IRLogObject;
  IRLogObject = (uint64_t)v0;

  v2 = os_log_create("com.apple.intelligentrouting", "qe");
  v3 = (void *)IRLogObjectQE;
  IRLogObjectQE = (uint64_t)v2;

  v4 = os_log_create("com.apple.intelligentrouting", "LongTerm");
  v5 = (void *)IRLogObjectLongTerm;
  IRLogObjectLongTerm = (uint64_t)v4;

}

@end
