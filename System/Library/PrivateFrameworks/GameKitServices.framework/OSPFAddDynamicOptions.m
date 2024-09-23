@implementation OSPFAddDynamicOptions

uint64_t __OSPFAddDynamicOptions_block_invoke(uint64_t result, _QWORD *a2, int a3)
{
  uint64_t v3;

  if (a3 >= 1)
  {
    v3 = a3;
    do
    {
      if (*a2)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
      ++a2;
      --v3;
    }
    while (v3);
  }
  return result;
}

@end
