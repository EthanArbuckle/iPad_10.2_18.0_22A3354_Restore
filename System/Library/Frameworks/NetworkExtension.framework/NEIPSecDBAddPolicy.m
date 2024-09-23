@implementation NEIPSecDBAddPolicy

_OWORD *__NEIPSecDBAddPolicy_block_invoke(_QWORD *a1)
{
  const __CFDictionary *v2;
  uint64_t v3;
  int v4;
  int v5;
  CFMutableDictionaryRef MutableCopy;
  CFMutableDictionaryRef v7;
  _OWORD *result;

  v3 = a1[6];
  v2 = (const __CFDictionary *)a1[7];
  v4 = *(_DWORD *)(v3 + 76);
  if ((v4 + 1) > 1)
    v5 = v4 + 1;
  else
    v5 = 1;
  *(_DWORD *)(v3 + 76) = v5;
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v4;
  MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v2);
  if (MutableCopy)
  {
    v7 = MutableCopy;
    NEAddValueToIntKeyedDictionary(*(__CFDictionary **)(a1[6] + 88), *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24), MutableCopy);
    CFRelease(v7);
  }
  result = NEIPSecDBCreateQueuedRequest(a1[6], 14, *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

@end
