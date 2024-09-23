@implementation FigHapticQueueSetActiveChannelIndex

uint64_t __FigHapticQueueSetActiveChannelIndex_block_invoke(uint64_t a1, uint64_t a2)
{
  return FigHapticPlayerSetActiveChannelIndexNow(a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
}

@end
