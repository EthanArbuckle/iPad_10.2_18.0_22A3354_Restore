@implementation LSEnumerateViableBundlesOfClass

uint64_t ___LSEnumerateViableBundlesOfClass_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = result;
  v4 = *(_DWORD *)(result + 48);
  if (!v4 || *(_DWORD *)(a3 + 168) == v4)
  {
    v5 = *(_QWORD *)(a3 + 172);
    result = _LSContainerGet();
    if ((v5 & 0x1000000040) == 0)
      return (*(uint64_t (**)(void))(*(_QWORD *)(v3 + 32) + 16))();
  }
  return result;
}

@end
