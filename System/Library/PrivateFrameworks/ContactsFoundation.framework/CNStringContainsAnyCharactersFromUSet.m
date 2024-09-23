@implementation CNStringContainsAnyCharactersFromUSet

BOOL __CNStringContainsAnyCharactersFromUSet_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  _BOOL8 result;

  result = 0;
  if (a2)
  {
    if (a3)
      return (int)MEMORY[0x1940049C8](*(_QWORD *)(a1 + 32)) < a3;
  }
  return result;
}

@end
