@implementation C3DCFDictionaryApplyBlockBySortingStringKeys

uint64_t __C3DCFDictionaryApplyBlockBySortingStringKeys_block_invoke(uint64_t a1, int a2, void *key)
{
  CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), key);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
