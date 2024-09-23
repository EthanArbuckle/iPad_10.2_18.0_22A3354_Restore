@implementation NSXPCSerializationCreateObjectInDictionaryForASCIIKey

uint64_t ___NSXPCSerializationCreateObjectInDictionaryForASCIIKey_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  size_t __n;
  unint64_t v8;
  void *__s1[2];

  __s1[1] = *(void **)MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a2 + 8) != 112)
    return 1;
  __s1[0] = 0;
  __n = 0;
  if (!_getASCIIStringAtMarker(*(_QWORD **)(a1 + 40), __s1, *(_QWORD *)a2, (uint64_t *)&__n, &v8))
    return 1;
  if (__n != *(_QWORD *)(a1 + 48))
    return 1;
  result = memcmp(__s1[0], *(const void **)(a1 + 56), __n);
  if ((_DWORD)result)
    return 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  v6 = *(_QWORD *)(a1 + 64);
  *(_QWORD *)v6 = 0;
  *(_DWORD *)(v6 + 8) = 255;
  *(_QWORD *)v6 = *(_QWORD *)a3;
  *(_DWORD *)(v6 + 8) = *(_DWORD *)(a3 + 8);
  return result;
}

@end
