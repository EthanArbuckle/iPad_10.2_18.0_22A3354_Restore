@implementation ACLogCache

void ___ACLogCache_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.accounts", "cache");
  v1 = (void *)_ACLogCache_log;
  _ACLogCache_log = (uint64_t)v0;

}

@end
