@implementation CopyCurrentScopePlist

void __CopyCurrentScopePlist_block_invoke(uint64_t a1)
{
  const __CFArray *v1;
  _QWORD context[5];
  CFRange v3;

  v1 = (const __CFArray *)sLogSettings;
  context[0] = MEMORY[0x24BDAC760];
  context[1] = 0x40000000;
  context[2] = __CopyCurrentScopePlist_block_invoke_2;
  context[3] = &__block_descriptor_tmp_11;
  context[4] = *(_QWORD *)(a1 + 32);
  v3.length = CFArrayGetCount((CFArrayRef)sLogSettings);
  v3.location = 0;
  CFArrayApplyFunction(v1, v3, (CFArrayApplierFunction)apply_block_1, context);
}

void __CopyCurrentScopePlist_block_invoke_2(uint64_t a1, CFTypeRef cf)
{
  CFTypeID v4;
  CFMutableArrayRef v5;
  CFTypeID v6;
  CFMutableDictionaryRef Mutable;
  _QWORD context[5];

  if (!cf)
    goto LABEL_8;
  v4 = CFGetTypeID(cf);
  if (v4 != CFSetGetTypeID())
  {
    v6 = CFGetTypeID(cf);
    if (v6 == CFDictionaryGetTypeID())
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      context[0] = MEMORY[0x24BDAC760];
      context[1] = 0x40000000;
      context[2] = __CopyCurrentScopePlist_block_invoke_3;
      context[3] = &__block_descriptor_tmp_10;
      context[4] = Mutable;
      CFDictionaryApplyFunction((CFDictionaryRef)cf, (CFDictionaryApplierFunction)apply_block_2, context);
      CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), Mutable);
      return;
    }
LABEL_8:
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), (const void *)*MEMORY[0x24BDBD430]);
    return;
  }
  v5 = CFSetOfCFObjectsCopyValues((const __CFSet *)cf);
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), v5);
  if (v5)
    CFRelease(v5);
}

void __CopyCurrentScopePlist_block_invoke_3(uint64_t a1, const void *a2, CFTypeRef cf)
{
  CFTypeID v6;
  CFMutableArrayRef v7;

  if (cf)
  {
    v6 = CFGetTypeID(cf);
    if (v6 == CFSetGetTypeID())
    {
      v7 = CFSetOfCFObjectsCopyValues((const __CFSet *)cf);
      CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 32), a2, v7);
      if (v7)
        CFRelease(v7);
    }
  }
}

@end
