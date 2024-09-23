@implementation FigHapticPlayerSetIsMuted

uint64_t __FigHapticPlayerSetIsMuted_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setIsMuted:", *(unsigned __int8 *)(a1 + 40));
}

@end
