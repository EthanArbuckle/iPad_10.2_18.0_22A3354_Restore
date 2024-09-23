@implementation CFDictionaryApplyFunction

uint64_t __CFDictionaryApplyFunction_block_invoke(uint64_t a1, uint64_t a2)
{
  (*(void (**)(_QWORD, _QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16), *(_QWORD *)(a1 + 40));
  return 1;
}

@end
