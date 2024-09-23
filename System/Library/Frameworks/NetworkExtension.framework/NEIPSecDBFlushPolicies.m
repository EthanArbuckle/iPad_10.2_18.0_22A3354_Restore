@implementation NEIPSecDBFlushPolicies

_OWORD *__NEIPSecDBFlushPolicies_block_invoke(_OWORD *result)
{
  const __CFDictionary *v1;
  _OWORD *v2;

  v1 = *(const __CFDictionary **)(*((_QWORD *)result + 6) + 88);
  if (v1)
  {
    v2 = result;
    *(_QWORD *)(*(_QWORD *)(*((_QWORD *)result + 4) + 8) + 24) = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v1);
    result = NEIPSecDBCreateQueuedRequest(*((_QWORD *)v2 + 6), 19, 0);
    *(_QWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 5) + 8) + 24) = result;
  }
  return result;
}

@end
