@implementation EDRemindMeLog

void __EDRemindMeLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "RemindMe");
  v1 = (void *)EDRemindMeLog_log;
  EDRemindMeLog_log = (uint64_t)v0;

}

@end
