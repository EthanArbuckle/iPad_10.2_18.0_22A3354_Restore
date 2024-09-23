@implementation SGDelimitedStringsDeserializeSet

uint64_t __SGDelimitedStringsDeserializeSet_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
