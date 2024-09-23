@implementation LAMKBLog

void __16___LAMKBLog_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "mkbshim");
  v1 = (void *)log_log;
  log_log = (uint64_t)v0;

}

@end
