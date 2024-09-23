@implementation EMLogCategoryMessageLoading

void __EMLogCategoryMessageLoading_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "MessageLoading");
  v1 = (void *)EMLogCategoryMessageLoading_os_log;
  EMLogCategoryMessageLoading_os_log = (uint64_t)v0;

}

@end
