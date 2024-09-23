@implementation CHSLogClientSnapshots

void __CHSLogClientSnapshots_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.chrono", "ClientSnapshots");
  v1 = (void *)CHSLogClientSnapshots___logObj;
  CHSLogClientSnapshots___logObj = (uint64_t)v0;

}

@end
