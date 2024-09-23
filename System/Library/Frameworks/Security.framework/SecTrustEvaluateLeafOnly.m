@implementation SecTrustEvaluateLeafOnly

const void *__SecTrustEvaluateLeafOnly_block_invoke(_QWORD *a1)
{
  const void *result;
  const void *v3;
  uint64_t v4;
  uint64_t v5;

  result = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1[6] + 16), 0);
  v3 = result;
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v3;
  v4 = a1[6];
  v5 = *(_QWORD *)(v4 + 32);
  if (v5)
    result = CFRetain(*(CFTypeRef *)(v4 + 32));
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v5;
  return result;
}

void __SecTrustEvaluateLeafOnly_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t v4;
  CFMutableArrayRef MutableCopy;
  uint64_t v6;
  const void *v7;
  __CFDictionary *Mutable;
  __CFDictionary *v9;
  const void *v10;
  const void *v11;
  uint64_t v12;
  const void *v13;

  v2 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)(v2 + 112) = *(_DWORD *)(a1 + 120);
  v3 = *(const void **)(v2 + 88);
  if (v3)
  {
    *(_QWORD *)(v2 + 88) = 0;
    CFRelease(v3);
  }
  v4 = *(_QWORD *)(a1 + 64);
  if (v4)
    CFRetain(*(CFTypeRef *)(a1 + 64));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = v4;
  MutableCopy = CFArrayCreateMutableCopy(0, 1, *(CFArrayRef *)(*(_QWORD *)(a1 + 32) + 16));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(const void **)(v6 + 72);
  if (v7)
  {
    *(_QWORD *)(v6 + 72) = 0;
    CFRelease(v7);
    v6 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(v6 + 72) = MutableCopy;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v9 = Mutable;
  v10 = *(const void **)(a1 + 104);
  if (v10)
    CFDictionarySetValue(Mutable, CFSTR("TrustResultNotBefore"), v10);
  v11 = *(const void **)(a1 + 112);
  if (v11)
    CFDictionarySetValue(v9, CFSTR("TrustResultNotAfter"), v11);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(const void **)(v12 + 96);
  if (v13)
  {
    *(_QWORD *)(v12 + 96) = 0;
    CFRelease(v13);
    v12 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(v12 + 96) = v9;
}

@end
