@implementation C3DCameraSetWantsHDR

uint64_t __C3DCameraSetWantsHDR_block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 312) = *(_BYTE *)(*(_QWORD *)(result + 32) + 312) & 0xFD | (2 * *(_BYTE *)(result + 40));
  return result;
}

@end
