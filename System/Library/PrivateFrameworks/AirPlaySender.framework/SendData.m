@implementation SendData

uint64_t __carEndpoint_SendData_block_invoke(uint64_t a1)
{
  const __CFDictionary *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, void (*)(uint64_t, uint64_t, uint64_t), uint64_t);
  int v7;
  uint64_t result;
  uint64_t v9;
  int v10;

  v2 = *(const __CFDictionary **)(*(_QWORD *)(a1 + 56) + 440);
  if (v2)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFDictionaryGetValue(v2, *(const void **)(a1 + 64));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    result = APSLogErrorAt();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = -16725;
LABEL_12:
    *(_DWORD *)(v9 + 24) = v10;
    return result;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = malloc_type_calloc(1uLL, 0x28uLL, 0x10E0040139F2759uLL);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    result = APSLogErrorAt();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = -16721;
    goto LABEL_12;
  }
  **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = CFRetain(*(CFTypeRef *)(a1 + 72));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) + 8) = CFRetain(*(CFTypeRef *)(a1 + 64));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) + 16) = *(_QWORD *)(a1 + 80);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) + 24) = *(_QWORD *)(a1 + 88);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = *(_QWORD *)(a1 + 96);
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v6 = *(uint64_t (**)(uint64_t, uint64_t, void (*)(uint64_t, uint64_t, uint64_t), uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (v6)
    v7 = v6(v3, v4, carEndpoint_rcsSendMessageCompletion, v5);
  else
    v7 = -12782;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;
  result = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if ((_DWORD)result)
    return APSLogErrorAt();
  return result;
}

@end
