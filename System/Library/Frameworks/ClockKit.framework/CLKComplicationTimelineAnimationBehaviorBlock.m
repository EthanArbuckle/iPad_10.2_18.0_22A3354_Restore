@implementation CLKComplicationTimelineAnimationBehaviorBlock

uint64_t __CLKComplicationTimelineAnimationBehaviorBlock_block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "markCalled");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
