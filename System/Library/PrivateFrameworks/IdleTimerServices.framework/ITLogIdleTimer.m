@implementation ITLogIdleTimer

void __ITLogIdleTimer_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)ITLoggingSubsystem, "IdleTimer");
  v1 = (void *)ITLogIdleTimer___logObj;
  ITLogIdleTimer___logObj = (uint64_t)v0;

}

@end
