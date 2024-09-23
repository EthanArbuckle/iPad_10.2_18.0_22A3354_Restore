@implementation EXSignpostLog

void ___EXSignpostLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.extensionkit", "signpost");
  v1 = (void *)_EXSignpostLog_log;
  _EXSignpostLog_log = (uint64_t)v0;

}

@end
