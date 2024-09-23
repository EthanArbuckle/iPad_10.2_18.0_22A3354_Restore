@implementation EKSharedGregorianCalendarLock

void ___EKSharedGregorianCalendarLock_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.calendar.foundation.sharedcalendarlock", 0);
  v1 = (void *)_EKSharedGregorianCalendarLock_sharedGregorianCalendarLock;
  _EKSharedGregorianCalendarLock_sharedGregorianCalendarLock = (uint64_t)v0;

}

@end
