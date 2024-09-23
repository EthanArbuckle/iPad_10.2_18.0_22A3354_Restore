@implementation ABLogger

void __ABLogger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ActionButtonSelector", "General");
  v1 = (void *)ABLogger_logger;
  ABLogger_logger = (uint64_t)v0;

}

@end
