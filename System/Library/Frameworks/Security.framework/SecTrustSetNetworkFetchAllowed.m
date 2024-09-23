@implementation SecTrustSetNetworkFetchAllowed

uint64_t __SecTrustSetNetworkFetchAllowed_block_invoke(uint64_t a1)
{
  __CFArray *v2;
  uint64_t v3;
  const __CFArray *v4;
  uint64_t result;
  CFTypeID v6;
  CFIndex v7;
  const void *v8;
  CFDictionaryRef *ValueAtIndex;
  CFDictionaryRef *v10;
  __CFDictionary *MutableCopy;
  __CFDictionary *v12;
  CFDictionaryRef v13;

  v2 = SecTrustCopyOptionsFromPolicies(*(const __CFArray **)(*(_QWORD *)(a1 + 48) + 32));
  if (v2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    CFRelease(v2);
  }
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(const __CFArray **)(v3 + 32);
  if (*(_BYTE *)(a1 + 56))
  {
    result = SecTrustRemoveOptionInPolicies(*(const void **)(v3 + 32), CFSTR("NoNetworkAccess"));
  }
  else if (v4 && (v6 = CFGetTypeID(*(CFTypeRef *)(v3 + 32)), v6 == CFArrayGetTypeID()))
  {
    v7 = 0;
    v8 = (const void *)*MEMORY[0x1E0C9AE50];
    while (1)
    {
      if (CFArrayGetCount(v4) <= v7)
      {
        result = 0;
        goto LABEL_15;
      }
      ValueAtIndex = (CFDictionaryRef *)CFArrayGetValueAtIndex(v4, v7);
      if (!ValueAtIndex)
        goto LABEL_16;
      v10 = ValueAtIndex;
      MutableCopy = CFDictionaryCreateMutableCopy(0, 0, ValueAtIndex[4]);
      if (!MutableCopy)
        break;
      v12 = MutableCopy;
      CFDictionarySetValue(MutableCopy, CFSTR("NoNetworkAccess"), v8);
      v13 = v10[4];
      if (v13)
      {
        v10[4] = 0;
        CFRelease(v13);
      }
      v10[4] = v12;
      ++v7;
    }
    result = 4294967188;
  }
  else
  {
LABEL_16:
    result = 4294941020;
  }
LABEL_15:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
