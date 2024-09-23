@implementation CFDictionaryApply

BOOL __CFDictionaryApply_block_invoke(uint64_t a1)
{
  char v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return v2 == 0;
}

@end
