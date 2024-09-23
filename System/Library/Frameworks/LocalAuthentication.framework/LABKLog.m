@implementation LABKLog

void __15___LABKLog_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "bkshim");
  v1 = (void *)log_log_0;
  log_log_0 = (uint64_t)v0;

}

@end
