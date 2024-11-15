@implementation CFBundleReadDirectory

uint64_t ___CFBundleReadDirectory_block_invoke(uint64_t a1, const __CFString *a2, const void *a3)
{
  uint64_t v6;
  unsigned int v7;
  const void *Value;
  __CFDictionary *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  CFIndex Length;
  CFIndex v16;
  const __CFString *v17;
  const __CFString *v18;
  int v19;
  int v20;
  int v22;
  void *key;
  CFTypeRef v24;
  CFTypeRef cf[2];
  CFRange v26;
  CFRange v27;
  CFRange v28;
  CFRange v29;
  CFRange v30;
  CFRange v31;

  cf[1] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  v24 = 0;
  cf[0] = 0;
  key = 0;
  v22 = 0;
  if (*(_BYTE *)(a1 + 88))
    v6 = 1;
  else
    v6 = 2;
  _CFBundleSplitFileName(a2, (__CFString **)&key, (CFStringRef *)&v24, (CFStringRef *)cf, *(const __CFString **)(a1 + 32), *(const __CFString **)(a1 + 40), v6, &v22);
  if (!*(_BYTE *)(a1 + 89))
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 48), a3);
  if (cf[0])
    _CFBundleAddValueForType((void *)cf[0], *(__CFDictionary **)(a1 + 56), *(CFDictionaryRef *)(a1 + 64), a3, *(__CFDictionary **)(a1 + 72), *(unsigned __int8 *)(a1 + 90));
  if (v24)
    _CFBundleAddValueForType((void *)v24, *(__CFDictionary **)(a1 + 56), *(CFDictionaryRef *)(a1 + 64), a3, *(__CFDictionary **)(a1 + 72), *(unsigned __int8 *)(a1 + 90));
  v7 = v22 & 0xFFFFFFFB;
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 56), a2);
  if (v7 == 1)
  {
    if (Value)
      goto LABEL_40;
    v9 = *(__CFDictionary **)(a1 + 56);
    v10 = (void *)a2;
    goto LABEL_39;
  }
  if (!Value)
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 56), a2, a3);
  if (!key)
    goto LABEL_40;
  v11 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 56), key);
  if (!v11)
    goto LABEL_38;
  v12 = v11;
  v13 = *(const __CFString **)(a1 + 80);
  if (!v13)
    goto LABEL_21;
  if (!CFStringHasPrefix(v11, v13))
    goto LABEL_40;
  v14 = *(const __CFString **)(a1 + 80);
  if (v14)
  {
    Length = CFStringGetLength(v14);
    v16 = CFStringGetLength(v12) - Length;
  }
  else
  {
LABEL_21:
    v16 = CFStringGetLength(v12);
    Length = 0;
  }
  v18 = *(const __CFString **)(a1 + 32);
  v17 = *(const __CFString **)(a1 + 40);
  v28.location = Length;
  v28.length = v16;
  if (!CFStringFindWithOptions(v12, CFSTR("~"), v28, 0, 0))
    goto LABEL_27;
  if (CFStringGetLength(v18) == 1
    || (v29.location = Length, v29.length = v16, !CFStringFindWithOptions(v12, v18, v29, 0, 0)))
  {
    v26.location = Length;
    v26.length = v16;
    if (_CFBundleSupportedProductName(v12, v26))
      goto LABEL_40;
LABEL_27:
    v19 = 3;
    v20 = 1;
    goto LABEL_28;
  }
  v19 = 4;
  v20 = 2;
LABEL_28:
  v30.location = Length;
  v30.length = v16;
  if (!CFStringFindWithOptions(v12, CFSTR("-"), v30, 0, 0))
  {
    v19 = v20;
    goto LABEL_33;
  }
  v31.location = Length;
  v31.length = v16;
  if (CFStringFindWithOptions(v12, v17, v31, 0, 0)
    || (v27.location = Length, v27.length = v16, v19 = v20, !_CFBundleSupportedPlatformName(v12, v27)))
  {
LABEL_33:
    if (v19 != 3)
    {
      if (v19 == 2)
      {
        if (v22 != 4)
          goto LABEL_40;
      }
      else if (v19 != 1)
      {
        goto LABEL_40;
      }
    }
LABEL_38:
    v9 = *(__CFDictionary **)(a1 + 56);
    v10 = key;
LABEL_39:
    CFDictionarySetValue(v9, v10, a3);
  }
LABEL_40:
  if (cf[0])
    CFRelease(cf[0]);
  if (v24)
    CFRelease(v24);
  if (key)
    CFRelease(key);
  return 1;
}

@end
