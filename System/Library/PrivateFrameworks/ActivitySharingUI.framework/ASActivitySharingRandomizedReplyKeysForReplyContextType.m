@implementation ASActivitySharingRandomizedReplyKeysForReplyContextType

uint64_t __ASActivitySharingRandomizedReplyKeysForReplyContextType_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

@end
