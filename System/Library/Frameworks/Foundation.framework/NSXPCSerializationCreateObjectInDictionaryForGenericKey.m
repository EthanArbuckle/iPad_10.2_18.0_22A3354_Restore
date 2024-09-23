@implementation NSXPCSerializationCreateObjectInDictionaryForGenericKey

uint64_t ___NSXPCSerializationCreateObjectInDictionaryForGenericKey_block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  if (*(_DWORD *)(a2 + 8) == 224)
  {
    v4 = *(_QWORD *)(a1[4] + 8);
    v5 = *(_QWORD *)(v4 + 24);
    if (a1[6] == v5)
    {
      result = 0;
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
      v7 = a1[7];
      *(_QWORD *)v7 = 0;
      *(_DWORD *)(v7 + 8) = 255;
      *(_QWORD *)v7 = *(_QWORD *)a3;
      *(_DWORD *)(v7 + 8) = *(_DWORD *)(a3 + 8);
      return result;
    }
    *(_QWORD *)(v4 + 24) = v5 + 1;
  }
  return 1;
}

@end
