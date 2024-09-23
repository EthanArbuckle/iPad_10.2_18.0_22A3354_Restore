@implementation EMLogCompose

void __EMLogCompose_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "Compose");
  v1 = (void *)EMLogCompose_os_log;
  EMLogCompose_os_log = (uint64_t)v0;

}

@end
