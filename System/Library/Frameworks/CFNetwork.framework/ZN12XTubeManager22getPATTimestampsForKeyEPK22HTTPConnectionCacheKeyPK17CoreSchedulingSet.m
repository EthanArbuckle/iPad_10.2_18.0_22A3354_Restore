@implementation ZN12XTubeManager22getPATTimestampsForKeyEPK22HTTPConnectionCacheKeyPK17CoreSchedulingSet

_QWORD *___ZN12XTubeManager22getPATTimestampsForKeyEPK22HTTPConnectionCacheKeyPK17CoreSchedulingSet_block_invoke(_QWORD *result, uint64_t a2)
{
  _QWORD *v3;
  const void *v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v3 = result;
  v4 = (const void *)result[5];
  v5 = *(_QWORD *)(a2 + 32);
  if (v5)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6 || (result = CFDictionaryGetValue(*(CFDictionaryRef *)(v5 + 112), v4)) == 0)
    v7 = 0;
  else
    v7 = result[3];
  *(_QWORD *)(*(_QWORD *)(v3[4] + 8) + 40) = v7;
  return result;
}

@end
