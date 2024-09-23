@implementation CHSLogChronoServices

void __CHSLogChronoServices_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.chrono", "ChronoServices");
  v1 = (void *)CHSLogChronoServices___logObj;
  CHSLogChronoServices___logObj = (uint64_t)v0;

}

@end
