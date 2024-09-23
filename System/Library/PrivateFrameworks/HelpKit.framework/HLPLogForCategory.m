@implementation HLPLogForCategory

void __HLPLogForCategory_block_invoke()
{
  const char *v0;
  os_log_t v1;
  void *v2;
  os_log_t v3;
  void *v4;
  os_log_t v5;
  void *v6;

  v0 = (const char *)objc_msgSend(CFSTR("com.apple.helpkit"), "UTF8String");
  v1 = os_log_create(v0, "App");
  v2 = (void *)HLPLogForCategory_logObjects[0];
  HLPLogForCategory_logObjects[0] = (uint64_t)v1;

  v3 = os_log_create(v0, "Data");
  v4 = (void *)qword_254DC0E60;
  qword_254DC0E60 = (uint64_t)v3;

  v5 = os_log_create(v0, "Caching");
  v6 = (void *)qword_254DC0E68;
  qword_254DC0E68 = (uint64_t)v5;

}

@end
