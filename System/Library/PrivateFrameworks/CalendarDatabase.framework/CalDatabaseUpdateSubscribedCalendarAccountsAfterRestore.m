@implementation CalDatabaseUpdateSubscribedCalendarAccountsAfterRestore

uint64_t __CalDatabaseUpdateSubscribedCalendarAccountsAfterRestore_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAccountProperty:forKey:", a3, a2);
}

@end
