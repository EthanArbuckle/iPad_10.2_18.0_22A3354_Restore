@implementation HIDDisplayLog

void __HIDDisplayLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(" com.apple.iohid ", "HIDDisplay");
  v1 = (void *)HIDDisplayLog_log;
  HIDDisplayLog_log = (uint64_t)v0;

}

@end
