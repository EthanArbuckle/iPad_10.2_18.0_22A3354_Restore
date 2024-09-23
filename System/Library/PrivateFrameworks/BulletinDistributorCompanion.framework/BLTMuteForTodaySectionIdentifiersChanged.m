@implementation BLTMuteForTodaySectionIdentifiersChanged

uint64_t __BLTMuteForTodaySectionIdentifiersChanged_block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_loadMutedSectionIdentifiers");
  return objc_msgSend(*(id *)(a1 + 32), "_updateObservers");
}

@end
