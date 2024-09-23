@implementation ACHLogDefault

void __ACHLogDefault_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ActivityAchievements", "default");
  v1 = (void *)ACHLogDefault_category;
  ACHLogDefault_category = (uint64_t)v0;

}

@end
