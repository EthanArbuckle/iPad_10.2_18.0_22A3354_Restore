@implementation ZN12XTubeManager25getCurrentSSLMethodForKeyEPK22HTTPConnectionCacheKeyPK17CoreSchedulingSet

const void *___ZN12XTubeManager25getCurrentSSLMethodForKeyEPK22HTTPConnectionCacheKeyPK17CoreSchedulingSet_block_invoke(uint64_t a1, uint64_t a2)
{
  const void *v4;
  uint64_t v5;
  const void *result;
  uint64_t v7;
  BOOL v8;

  v4 = *(const void **)(a1 + 40);
  v5 = *(_QWORD *)(a2 + 32);
  if (!v5)
    goto LABEL_4;
  if (!v4)
    goto LABEL_9;
  result = CFDictionaryGetValue(*(CFDictionaryRef *)(v5 + 128), v4);
  if (!result)
  {
LABEL_4:
    v7 = *(_QWORD *)(a2 + 40);
    if (v7)
      v8 = v4 == 0;
    else
      v8 = 1;
    if (!v8)
    {
      result = CFDictionaryGetValue(*(CFDictionaryRef *)(v7 + 128), v4);
      goto LABEL_10;
    }
LABEL_9:
    result = 0;
  }
LABEL_10:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
