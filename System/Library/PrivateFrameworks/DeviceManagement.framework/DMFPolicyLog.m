@implementation DMFPolicyLog

void __DMFPolicyLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.dmd", "Policy");
  v1 = (void *)DMFPolicyLog_log;
  DMFPolicyLog_log = (uint64_t)v0;

}

@end
