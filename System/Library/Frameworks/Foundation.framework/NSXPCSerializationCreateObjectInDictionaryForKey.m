@implementation NSXPCSerializationCreateObjectInDictionaryForKey

uint64_t ___NSXPCSerializationCreateObjectInDictionaryForKey_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6;
  const void *v7;
  const __CFString *v8;
  uint64_t result;
  uint64_t v10;
  size_t __n;
  unint64_t v12;
  void *__s1[2];

  __s1[1] = *(void **)MEMORY[0x1E0C80C00];
  v6 = *(_DWORD *)(a2 + 8);
  if (v6 == 96)
  {
    v8 = _NSXPCSerializationStringForObject(*(_QWORD **)(a1 + 48), (char **)a2);
    if (v8 && objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v8))
      goto LABEL_10;
  }
  else if (v6 == 112)
  {
    __s1[0] = 0;
    __n = 0;
    if (_getASCIIStringAtMarker(*(_QWORD **)(a1 + 48), __s1, *(_QWORD *)a2, (uint64_t *)&__n, &v12))
    {
      v7 = *(const void **)(a1 + 56);
      if (v7)
      {
        if (__n == *(_QWORD *)(a1 + 64) && !memcmp(__s1[0], v7, __n))
          goto LABEL_10;
      }
      else if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", _NSXPCSerializationStringForObject(*(_QWORD **)(a1 + 48), (char **)a2)) & 1) != 0)
      {
LABEL_10:
        result = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        v10 = *(_QWORD *)(a1 + 72);
        *(_QWORD *)v10 = 0;
        *(_DWORD *)(v10 + 8) = 255;
        *(_QWORD *)v10 = *(_QWORD *)a3;
        *(_DWORD *)(v10 + 8) = *(_DWORD *)(a3 + 8);
        return result;
      }
    }
  }
  return 1;
}

@end
