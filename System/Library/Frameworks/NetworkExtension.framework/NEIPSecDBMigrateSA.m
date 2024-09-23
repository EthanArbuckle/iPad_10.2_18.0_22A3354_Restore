@implementation NEIPSecDBMigrateSA

const void *__NEIPSecDBMigrateSA_block_invoke(uint64_t a1)
{
  const void *result;

  result = NEGetValueFromIntKeyedDictionary(*(const __CFDictionary **)(*(_QWORD *)(a1 + 40) + 80), *(_DWORD *)(a1 + 48));
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

_OWORD *__NEIPSecDBMigrateSA_block_invoke_85(uint64_t a1)
{
  _OWORD *result;

  result = NEIPSecDBCreateQueuedRequest(*(_QWORD *)(a1 + 40), 26, *(_DWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
