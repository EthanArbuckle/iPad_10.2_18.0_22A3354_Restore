@implementation PresentJunkAlertControllerForCalendar

uint64_t __PresentJunkAlertControllerForCalendar_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsJunk:", 1);
}

@end
