@implementation CFBundleGetMostAppropriateLocTableDeviceAndPlatformSpecificVariants

CFTypeRef ___CFBundleGetMostAppropriateLocTableDeviceAndPlatformSpecificVariants_block_invoke(uint64_t a1, const __CFString *a2)
{
  const __CFString *ProductNameSuffix;
  const __CFString *PlatformNameSuffix;
  const __CFNumber *Value;
  CFTypeRef result;
  char v8;
  const void *v9;
  const void *v10;
  char valuePtr;
  unsigned int v12;
  CFTypeRef cf[2];

  cf[1] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  cf[0] = 0;
  v12 = 0;
  ProductNameSuffix = (const __CFString *)_CFBundleGetProductNameSuffix();
  PlatformNameSuffix = _CFBundleGetPlatformNameSuffix();
  _CFBundleSplitFileName(a2, (__CFString **)cf, 0, 0, ProductNameSuffix, PlatformNameSuffix, 2, (int *)&v12);
  if (cf[0])
    CFRelease(cf[0]);
  valuePtr = 0;
  Value = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), a2);
  result = (CFTypeRef)CFNumberGetValue(Value, kCFNumberSInt8Type, &valuePtr);
  v8 = valuePtr;
  if ((valuePtr & 1) != 0 && v12 > *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v9 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (v9)
      CFRelease(v9);
    result = CFRetain(a2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v12;
    v8 = valuePtr;
  }
  if ((v8 & 2) != 0 && v12 > *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v10 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    if (v10)
      CFRelease(v10);
    result = CFRetain(a2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v12;
  }
  return result;
}

@end
