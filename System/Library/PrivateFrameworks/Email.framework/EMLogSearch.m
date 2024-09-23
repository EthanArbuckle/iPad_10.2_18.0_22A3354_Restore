@implementation EMLogSearch

void __EMLogSearch_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "Search");
  v1 = (void *)EMLogSearch_os_log;
  EMLogSearch_os_log = (uint64_t)v0;

}

@end
