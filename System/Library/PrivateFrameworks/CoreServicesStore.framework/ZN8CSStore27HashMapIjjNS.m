@implementation ZN8CSStore27HashMapIjjNS

void *___ZN8CSStore27HashMapIjjNS_10Dictionary10_FunctionsELy0EE14WriteBreakdownERKNS_5StoreEPKS3_hPh_block_invoke(uint64_t a1, unsigned int a2, size_t __len, int a4, int a5)
{
  int v5;

  if (a4)
    v5 = 64;
  else
    v5 = -128;
  return memset((void *)(*(_QWORD *)(a1 + 32) + a2), (v5 | a5 ^ 1) & 0xFFFFFFC1 | (2 * (*(_BYTE *)(a1 + 40) & 0x1F)), __len);
}

void *___ZN8CSStore27HashMapIjjNS_20_IdentifierFunctionsELy1EE14WriteBreakdownERKNS_5StoreEPKS2_hPh_block_invoke(uint64_t a1, unsigned int a2, size_t __len, int a4, int a5)
{
  int v5;

  if (a4)
    v5 = 64;
  else
    v5 = -128;
  return memset((void *)(*(_QWORD *)(a1 + 32) + a2), (v5 | a5 ^ 1) & 0xFFFFFFC1 | (2 * (*(_BYTE *)(a1 + 40) & 0x1F)), __len);
}

@end
