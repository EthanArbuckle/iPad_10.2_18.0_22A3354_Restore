@implementation FigHapticQueueSetIsMuted

uint64_t __FigHapticQueueSetIsMuted_block_invoke(uint64_t a1, uint64_t a2)
{
  FigHapticPlayerSetIsMuted(a2, *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) != 0);
  return 0;
}

@end
