@implementation SIDirectoryStoreIterate

BOOL ___SIDirectoryStoreIterate_block_invoke(uint64_t a1, int a2)
{
  _BOOL8 result;
  uint64_t v4;
  char v5;

  result = 0;
  v5 = 0;
  if (a2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      (*(void (**)(uint64_t))(v4 + 16))(v4);
      return v5 != 0;
    }
  }
  return result;
}

@end
