@implementation HandleCookiesChangedNotification

uint64_t __HandleCookiesChangedNotification_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clearCookiePropertyCache");
}

@end
