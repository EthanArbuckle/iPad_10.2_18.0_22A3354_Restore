@implementation SecItemUpdate

uint64_t __SecItemUpdate_block_invoke(uint64_t a1, uint64_t a2)
{
  return SecItemUpdateWithError(*(const __CFDictionary **)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

@end
