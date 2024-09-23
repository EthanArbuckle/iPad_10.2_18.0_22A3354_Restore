@implementation ZN2NL8Resource19createAssetResourceEPK10

const __CFString *___ZN2NL8Resource19createAssetResourceEPK10__CFLocalePK10__CFStringS6__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  const __CFString *result;
  const __CFString *v6;
  unsigned int *v8;
  unsigned int v9;

  result = *(const __CFString **)(a2 + 32);
  if (result)
  {
    v6 = *(const __CFString **)(a1 + 40);
    if (v6)
    {
      result = (const __CFString *)CFStringFind(result, v6, 0).location;
      if (result != (const __CFString *)-1)
      {
        v8 = (unsigned int *)(a2 + 8);
        do
          v9 = __ldxr(v8);
        while (__stxr(v9 + 1, v8));
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
        *a3 = 1;
      }
    }
  }
  return result;
}

@end
