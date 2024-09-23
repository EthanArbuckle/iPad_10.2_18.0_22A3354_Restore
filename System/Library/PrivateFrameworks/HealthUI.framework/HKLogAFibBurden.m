@implementation HKLogAFibBurden

void __HKLogAFibBurden_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Health.AFibBurden", "charting");
  v1 = (void *)HKLogAFibBurden_aFibBurdenCategory;
  HKLogAFibBurden_aFibBurdenCategory = (uint64_t)v0;

}

@end
