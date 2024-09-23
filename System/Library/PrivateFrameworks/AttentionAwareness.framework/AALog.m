@implementation AALog

void ___AALog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AttentionAwareness", "AttentionAwareness");
  v1 = (void *)_AALog_log;
  _AALog_log = (uint64_t)v0;

}

@end
