@implementation ACHLogWorkouts

void __ACHLogWorkouts_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ActivityAchievements", "workouts");
  v1 = (void *)ACHLogWorkouts_category;
  ACHLogWorkouts_category = (uint64_t)v0;

}

@end
