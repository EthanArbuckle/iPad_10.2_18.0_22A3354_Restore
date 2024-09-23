@implementation MRRLoggerForCategory

void __MRRLoggerForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;

  v0 = os_log_create("com.apple.siri.marrs.mrr", "General");
  v1 = (void *)MRRLoggerForCategory::logObjects[0];
  MRRLoggerForCategory::logObjects[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.siri.marrs.mrr", "MD");
  v3 = (void *)qword_1EF786220;
  qword_1EF786220 = (uint64_t)v2;

  v4 = os_log_create("com.apple.siri.marrs.mrr", "MR");
  v5 = (void *)qword_1EF786228;
  qword_1EF786228 = (uint64_t)v4;

  v6 = os_log_create("com.apple.siri.marrs.mrr", "SIGNPOSTS");
  v7 = (void *)qword_1EF786230;
  qword_1EF786230 = (uint64_t)v6;

}

@end
