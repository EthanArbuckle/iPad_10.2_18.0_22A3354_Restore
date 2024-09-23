@implementation CalculateLogForCategory

void __CalculateLogForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calculate", "Base");
  v1 = (void *)CalculateLogForCategory_logObjects_0;
  CalculateLogForCategory_logObjects_0 = (uint64_t)v0;

}

@end
