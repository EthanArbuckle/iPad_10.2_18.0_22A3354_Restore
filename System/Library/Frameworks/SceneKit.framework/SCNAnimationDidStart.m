@implementation SCNAnimationDidStart

uint64_t __SCNAnimationDidStart_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "animationDidStart:", *(_QWORD *)(a1 + 40));
}

@end
