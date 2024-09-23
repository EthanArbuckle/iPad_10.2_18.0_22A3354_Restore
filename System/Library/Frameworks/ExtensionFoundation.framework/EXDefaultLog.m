@implementation EXDefaultLog

void ___EXDefaultLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.extensionkit", "default");
  v1 = (void *)_EXDefaultLog_log;
  _EXDefaultLog_log = (uint64_t)v0;

}

@end
