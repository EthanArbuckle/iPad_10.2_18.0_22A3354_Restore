@implementation ACHLogXPC

void __ACHLogXPC_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ActivityAchievements", "xpc");
  v1 = (void *)ACHLogXPC_category;
  ACHLogXPC_category = (uint64_t)v0;

}

@end
