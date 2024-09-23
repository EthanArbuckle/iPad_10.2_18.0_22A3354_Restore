@implementation PNCopyFullyQualifiedNumberForCountry

CFStringRef ___PNCopyFullyQualifiedNumberForCountry_block_invoke(uint64_t a1, const __CFString *a2)
{
  const __CFString *v3;
  CFStringRef v5;
  char *v6;
  const __CFString *v7;
  const __CFString *v8;
  char *cStr[2];
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v3 = *(const __CFString **)(a1 + 32);
  if (!v3)
    return 0;
  v5 = 0;
  if (a2 && *(_QWORD *)(a1 + 40))
  {
    v12 = 0u;
    v13 = 0u;
    *(_OWORD *)cStr = 0u;
    v11 = 0u;
    v6 = _PNCopyNormalized(v3);
    if (_PNDecomposeForCountry(v6, *(const __CFString **)(a1 + 40), (uint64_t)cStr, 1))
    {
      v7 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], cStr[0], 0x8000100u);
      v8 = _PNCopyCountryCodeForInternationalCode(v7);
      if (CFStringCompare(a2, v8, 1uLL))
        v5 = 0;
      else
        v5 = _PNCopyAreaCodeForCountry(*(const __CFString **)(a1 + 32), a2);
      CFRelease(v7);
      CFRelease(v8);
    }
    else
    {
      v5 = 0;
    }
    free(v6);
  }
  return v5;
}

@end
