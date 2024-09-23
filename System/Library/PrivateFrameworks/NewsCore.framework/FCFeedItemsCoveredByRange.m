@implementation FCFeedItemsCoveredByRange

uint64_t __FCFeedItemsCoveredByRange_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsOrder:", objc_msgSend(a2, "order"));
}

@end
