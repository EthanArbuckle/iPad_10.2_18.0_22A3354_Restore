@implementation ZL6gssAddP22

_DWORD *___ZL6gssAddP22_NLGraphStructureStackjll_block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  _DWORD *result;

  v3 = *(_QWORD *)(a1 + 32);
  if ((a2 & 0x80000000) == 0 && *(_DWORD *)v3 > a2)
  {
    v4 = *(_QWORD *)(v3 + 8);
    if (v4)
    {
      *(_BYTE *)(v4 + 28 * a2) |= 0x10u;
      v3 = *(_QWORD *)(a1 + 32);
    }
  }
  v5 = *(unsigned __int16 *)(v3 + 56);
  v6 = *(unsigned __int16 *)(v3 + 58);
  if (v5 + 1 >= v6)
  {
    *(_WORD *)(v3 + 58) = 2 * v6;
    result = malloc_type_realloc(*(void **)(v3 + 64), 8 * (v6 & 0x7FFF), 0x100004052888210uLL);
    *(_QWORD *)(v3 + 64) = result;
    v5 = *(unsigned __int16 *)(v3 + 56);
  }
  else
  {
    result = *(_DWORD **)(v3 + 64);
  }
  *(_WORD *)(v3 + 56) = v5 + 1;
  result[v5] = a2;
  return result;
}

@end
