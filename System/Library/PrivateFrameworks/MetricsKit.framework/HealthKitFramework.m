@implementation HealthKitFramework

void *__HealthKitFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/HealthKit.framework/HealthKit", 1);
  HealthKitFramework_sHandle = (uint64_t)result;
  return result;
}

@end
