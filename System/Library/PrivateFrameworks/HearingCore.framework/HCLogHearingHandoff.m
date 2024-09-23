@implementation HCLogHearingHandoff

void __HCLogHearingHandoff_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Hearing", "HCHearingHandoff");
  v1 = (void *)HCLogHearingHandoff___logObj;
  HCLogHearingHandoff___logObj = (uint64_t)v0;

}

@end
