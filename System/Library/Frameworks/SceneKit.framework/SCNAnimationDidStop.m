@implementation SCNAnimationDidStop

uint64_t __SCNAnimationDidStop_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "animationDidStop:finished:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

@end
