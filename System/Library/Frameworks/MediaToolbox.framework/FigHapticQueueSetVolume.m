@implementation FigHapticQueueSetVolume

uint64_t __FigHapticQueueSetVolume_block_invoke(uint64_t a1, uint64_t a2)
{
  return FigHapticPlayerSetVolumeNow(a2, *(float *)(*(_QWORD *)(a1 + 32) + 56));
}

@end
