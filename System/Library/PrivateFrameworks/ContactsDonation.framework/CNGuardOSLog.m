@implementation CNGuardOSLog

void __CNGuardOSLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "api");
  v1 = (void *)CNGuardOSLog_cn_once_object_0;
  CNGuardOSLog_cn_once_object_0 = (uint64_t)v0;

}

void __CNGuardOSLog_block_invoke_0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "api");
  v1 = (void *)CNGuardOSLog_cn_once_object_0_0;
  CNGuardOSLog_cn_once_object_0_0 = (uint64_t)v0;

}

void __CNGuardOSLog_block_invoke_1()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "api");
  v1 = (void *)CNGuardOSLog_cn_once_object_0_1;
  CNGuardOSLog_cn_once_object_0_1 = (uint64_t)v0;

}

@end
