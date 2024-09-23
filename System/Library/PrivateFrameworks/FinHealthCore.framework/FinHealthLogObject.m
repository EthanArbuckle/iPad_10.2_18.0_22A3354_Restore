@implementation FinHealthLogObject

void __FinHealthLogObject_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;

  v0 = os_log_create("com.apple.FinHealth", (const char *)objc_msgSend(CFSTR("FinHealthClient"), "UTF8String"));
  v1 = (void *)FinHealthLogObject_logObjects[0];
  FinHealthLogObject_logObjects[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.FinHealth", (const char *)objc_msgSend(CFSTR("FinHealthServer"), "UTF8String"));
  v3 = (void *)qword_2542F93C0;
  qword_2542F93C0 = (uint64_t)v2;

  v4 = os_log_create("com.apple.FinHealth", (const char *)objc_msgSend(CFSTR("FinHealthSQL"), "UTF8String"));
  v5 = (void *)qword_2542F93C8;
  qword_2542F93C8 = (uint64_t)v4;

  v6 = os_log_create("com.apple.FinHealth", (const char *)objc_msgSend(CFSTR("FinHealthCore"), "UTF8String"));
  v7 = (void *)qword_2542F93D0;
  qword_2542F93D0 = (uint64_t)v6;

}

@end
