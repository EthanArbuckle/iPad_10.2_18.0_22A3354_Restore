@implementation ACHLogAwardScheduling

void __ACHLogAwardScheduling_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ActivityAchievements", "award_scheduling");
  v1 = (void *)ACHLogAwardScheduling_category;
  ACHLogAwardScheduling_category = (uint64_t)v0;

}

@end
