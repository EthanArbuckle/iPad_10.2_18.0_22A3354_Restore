@implementation UTEnumerateActiveTypes

uint64_t ___UTEnumerateActiveTypes_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if ((*(_BYTE *)(a3 + 8) & 1) != 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

@end
