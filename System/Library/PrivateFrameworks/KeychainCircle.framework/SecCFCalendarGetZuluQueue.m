@implementation SecCFCalendarGetZuluQueue

dispatch_queue_t __SecCFCalendarGetZuluQueue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("ZuluCalendar", 0);
  fqueue_cf = (uint64_t)result;
  return result;
}

@end
