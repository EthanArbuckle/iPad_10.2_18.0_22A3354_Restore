@implementation ZN2NL20AssetResourceManager25createAssetResourceOfTypeEPK10

const __CFString *___ZN2NL20AssetResourceManager25createAssetResourceOfTypeEPK10__CFLocalePK10__CFStringS6_j_block_invoke(uint64_t a1, uint64_t *a2, _BYTE *a3)
{
  const __CFString *result;
  const __CFString *v6;

  result = *(const __CFString **)(*a2 + 16);
  if (result)
  {
    v6 = *(const __CFString **)(a1 + 40);
    if (v6)
    {
      result = (const __CFString *)CFStringFind(result, v6, 0).location;
      if (result != (const __CFString *)-1)
      {
        result = (const __CFString *)std::shared_ptr<NL::ParseIntent>::operator=[abi:ne180100]((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
        *a3 = 1;
      }
    }
  }
  return result;
}

@end
