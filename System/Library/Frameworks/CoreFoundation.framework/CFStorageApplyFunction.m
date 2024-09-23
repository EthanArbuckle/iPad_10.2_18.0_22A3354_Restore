@implementation CFStorageApplyFunction

uint64_t __CFStorageApplyFunction_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;

  if (a4)
  {
    v4 = a4;
    v6 = result;
    do
    {
      --v4;
      result = (*(uint64_t (**)(uint64_t, _QWORD))(v6 + 32))(a2, *(_QWORD *)(v6 + 40));
      a2 += *(_QWORD *)(v6 + 48);
    }
    while (v4);
  }
  return result;
}

@end
