@implementation PresentJunkAlertDialogForEvent

uint64_t __PresentJunkAlertDialogForEvent_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsJunk:shouldSave:", 1, 1);
}

@end
