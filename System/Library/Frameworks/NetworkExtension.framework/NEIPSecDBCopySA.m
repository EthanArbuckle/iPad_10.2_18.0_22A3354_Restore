@implementation NEIPSecDBCopySA

const __CFDictionary *__NEIPSecDBCopySA_block_invoke(uint64_t a1)
{
  const __CFDictionary *result;
  const void *v3;

  result = *(const __CFDictionary **)(*(_QWORD *)(a1 + 48) + 80);
  if (result)
  {
    v3 = NEGetValueFromIntKeyedDictionary(result, *(_DWORD *)(a1 + 56));
    if (v3)
      v3 = CFRetain(v3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
    result = (const __CFDictionary *)NEIPSecDBCreateQueuedRequest(*(_QWORD *)(a1 + 48), 5, *(_DWORD *)(a1 + 56));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

@end
