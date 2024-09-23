@implementation CullInside

uint64_t ____CullInside_block_invoke(uint64_t a1, uint64_t a2)
{
  return __CullInside(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

@end
