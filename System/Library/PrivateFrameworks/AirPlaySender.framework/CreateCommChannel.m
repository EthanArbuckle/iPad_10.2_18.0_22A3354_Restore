@implementation CreateCommChannel

uint64_t __carEndpoint_CreateCommChannel_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, void (*)(uint64_t, const void *, const void *, const void *), uint64_t);
  int v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  int v8;
  uint64_t result;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = carEndpoint_createCommChannelInternal(*(const void **)(a1 + 56), *(__CFDictionary **)(a1 + 64), (CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24), *(CFTypeRef **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)+ 24));
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    return APSLogErrorAt();
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v3 = *(_QWORD *)(a1 + 72);
  v4 = *(uint64_t (**)(uint64_t, void (*)(uint64_t, const void *, const void *, const void *), uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
  v5 = v4 ? v4(v2, carEndpoint_handleRemoteControlSessionEvent, v3) : -12782;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    return APSLogErrorAt();
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v7 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
  v8 = v7 ? v7(v6) : -12782;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
  result = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if ((_DWORD)result)
    return APSLogErrorAt();
  return result;
}

@end
