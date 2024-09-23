@implementation BRHandoffDidReceiveApplicationContinuity

uint64_t __BRHandoffDidReceiveApplicationContinuity_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBoolResult:error:", 1, a2);
}

@end
