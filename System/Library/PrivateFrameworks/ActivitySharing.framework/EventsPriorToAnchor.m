@implementation EventsPriorToAnchor

BOOL ___EventsPriorToAnchor_block_invoke(uint64_t a1, void *a2)
{
  return *(_QWORD *)(a1 + 32) > (uint64_t)objc_msgSend(a2, "anchor");
}

@end
