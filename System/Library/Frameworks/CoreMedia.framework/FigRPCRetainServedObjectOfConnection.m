@implementation FigRPCRetainServedObjectOfConnection

const void *__FigRPCRetainServedObjectOfConnection_block_invoke(uint64_t a1)
{
  const void *result;

  if (CFDictionaryContainsValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 64), *(const void **)(a1 + 48)))
  {
    result = *(const void **)(*(_QWORD *)(a1 + 48) + 24);
    if (result)
      result = CFRetain(result);
    **(_QWORD **)(a1 + 56) = result;
  }
  else
  {
    result = (const void *)FigSignalErrorAt(4294955051, 0, 0, 0, 0, 0, 0);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (_DWORD)result;
  }
  return result;
}

@end
