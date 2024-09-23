@implementation GSEventsIdleTimerLog

os_log_t __GSEventsIdleTimerLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("GraphicsServices", "IdleTimer");
  GSEventsIdleTimerLog_logTag = (uint64_t)result;
  return result;
}

@end
