@implementation AudioComponentValidateWithResults

uint64_t __AudioComponentValidateWithResults_block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;

  if (a2 != 3)
  {
    v2 = *(_QWORD *)(a1 + 40);
    *(_BYTE *)(v2 + 128) = 1;
    *(_DWORD *)(v2 + 132) = a2;
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
