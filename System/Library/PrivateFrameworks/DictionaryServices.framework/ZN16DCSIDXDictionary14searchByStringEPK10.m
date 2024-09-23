@implementation ZN16DCSIDXDictionary14searchByStringEPK10

const __CFArray *___ZN16DCSIDXDictionary14searchByStringEPK10__CFStringll_block_invoke(uint64_t a1, const __CFString *a2, unint64_t a3, uint64_t a4, BOOL *a5)
{
  __CFArray *v8;
  const __CFArray *v9;
  uint64_t v10;
  CFIndex v11;
  DCSRecord *v12;
  CFIndex Length;
  const __CFString *v14;

  v8 = DCSIDXDictionary::searchByString_internal(*(DCSIDXDictionary **)(a1 + 32), a2, a3, a4);
  v9 = v8;
  if (a5)
  {
    *a5 = v8 != 0;
    if (v8)
    {
      v10 = *(_QWORD *)(a1 + 40);
      if ((unint64_t)(v10 - 1) <= 1)
      {
        if (v10 == 1)
          v11 = 0;
        else
          v11 = CFArrayGetCount(v8) - 1;
        v12 = (DCSRecord *)*((_QWORD *)CFArrayGetValueAtIndex(v9, v11) + 2);
        Length = CFStringGetLength(a2);
        v14 = DCSRecord::keyString(v12);
        if (Length != CFStringGetLength(v14))
          *a5 = 0;
      }
    }
  }
  return v9;
}

@end
