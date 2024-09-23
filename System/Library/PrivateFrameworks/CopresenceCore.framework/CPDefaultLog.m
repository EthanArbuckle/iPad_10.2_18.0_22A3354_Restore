@implementation CPDefaultLog

void __CPDefaultLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(CPLoggingSubsystem, "Default");
  v1 = (void *)CPDefaultLog_CPDefaultLog;
  CPDefaultLog_CPDefaultLog = (uint64_t)v0;

}

@end
