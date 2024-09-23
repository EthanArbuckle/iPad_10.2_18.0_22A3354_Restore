@implementation SingularHoseIsLocal

uint64_t __audioHoseManagerBuffered_SingularHoseIsLocal_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a3 + 8);
  return result;
}

@end
