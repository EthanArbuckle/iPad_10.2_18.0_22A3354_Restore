@implementation CFBundleCopyFilteredLocalizedStringsForAllLocalizations

void ___CFBundleCopyFilteredLocalizedStringsForAllLocalizations_block_invoke(uint64_t a1, void *a2)
{
  const __CFArray *v3;
  CFDictionaryRef v4;
  CFIndex Count;
  CFMutableDictionaryRef Mutable;
  void *v7;
  _QWORD v8[6];
  void *values[2];

  values[1] = *(void **)MEMORY[0x1E0C80C00];
  values[0] = a2;
  v3 = CFArrayCreate(0, (const void **)values, 1, &kCFTypeArrayCallBacks);
  v4 = _copyStringTable(*(_QWORD *)(a1 + 32), *(__CFString **)(a1 + 40), *(CFTypeRef *)(a1 + 48), v3, 0, 0);
  CFRelease(v3);
  Count = CFSetGetCount(*(CFSetRef *)(a1 + 48));
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, Count, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v7 = *(void **)(a1 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___CFBundleCopyFilteredLocalizedStringsForAllLocalizations_block_invoke_2;
  v8[3] = &__block_descriptor_48_e13_v24__0r_v8_16l;
  v8[4] = v4;
  v8[5] = Mutable;
  CFSetApply(v7, (uint64_t)v8);
  if (CFDictionaryGetCount(Mutable) >= 1)
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 56), values[0], Mutable);
  CFRelease(v4);
  CFRelease(Mutable);
}

void ___CFBundleCopyFilteredLocalizedStringsForAllLocalizations_block_invoke_2(uint64_t a1, const void *a2)
{
  const void *Value;

  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), a2);
  if (Value)
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), a2, Value);
}

@end
