@implementation PresentJunkAlertDialogForCalendar

uint64_t __PresentJunkAlertDialogForCalendar_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsJunk:", 1);
}

@end
