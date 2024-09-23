@implementation HKUILogCharting

void __HKUILogCharting_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.HealthKit", "charting");
  v1 = (void *)HKUILogCharting_category;
  HKUILogCharting_category = (uint64_t)v0;

}

@end
