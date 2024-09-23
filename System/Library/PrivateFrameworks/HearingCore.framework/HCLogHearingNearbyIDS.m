@implementation HCLogHearingNearbyIDS

void __HCLogHearingNearbyIDS_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Hearing", "HCHearingNearbyIDS");
  v1 = (void *)HCLogHearingNearbyIDS___logObj;
  HCLogHearingNearbyIDS___logObj = (uint64_t)v0;

}

@end
