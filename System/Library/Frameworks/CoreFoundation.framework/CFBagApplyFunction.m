@implementation CFBagApplyFunction

uint64_t __CFBagApplyFunction_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t i;

  for (i = *(_QWORD *)(a2 + 24); i; --i)
    (*(void (**)(_QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a2 + 16), *(_QWORD *)(a1 + 40));
  return 1;
}

@end
