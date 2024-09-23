@implementation C3DAnimationManagerRemoveBinding

BOOL __C3DAnimationManagerRemoveBinding_block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 8) == *(_QWORD *)(a1 + 32)
      && C3DModelTargetGetTargetAddress(*(_QWORD *)(a2 + 24)) == *(_QWORD *)(a1 + 40);
}

@end
