@implementation FigTransformUtilityGenerateReplacementImageBufferAsync

CFTypeRef __FigTransformUtilityGenerateReplacementImageBufferAsync_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  _DWORD *v3;
  int v4;
  CFTypeRef result;
  const __CFAllocator *v6;
  void *values;

  v2 = a1[11];
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = *(_QWORD *)(v2 + 40);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(v2 + 48);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(v2 + 56);
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_QWORD *)(v2 + 64);
  v4 = *(_DWORD *)(v2 + 32);
  v3 = (_DWORD *)(v2 + 32);
  *(_DWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = v4;
  *(_DWORD *)(*(_QWORD *)(a1[9] + 8) + 24) = v3[1];
  result = (CFTypeRef)*((_QWORD *)v3 + 7);
  if (!result)
  {
    if (!*v3)
    {
      result = 0;
      goto LABEL_3;
    }
    v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, v3);
    *(_QWORD *)(a1[11] + 88) = CFDictionaryCreate(v6, MEMORY[0x1E0D3A330], (const void **)&values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFRelease(values);
    result = *(CFTypeRef *)(a1[11] + 88);
    if (!result)
      goto LABEL_3;
  }
  result = CFRetain(result);
LABEL_3:
  *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 24) = result;
  return result;
}

@end
