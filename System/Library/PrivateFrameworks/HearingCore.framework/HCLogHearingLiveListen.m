@implementation HCLogHearingLiveListen

void __HCLogHearingLiveListen_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Hearing", "HCHearingLiveListen");
  v1 = (void *)HCLogHearingLiveListen___logObj;
  HCLogHearingLiveListen___logObj = (uint64_t)v0;

}

@end
