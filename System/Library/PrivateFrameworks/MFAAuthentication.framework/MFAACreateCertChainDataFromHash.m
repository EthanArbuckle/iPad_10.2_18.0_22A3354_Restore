@implementation MFAACreateCertChainDataFromHash

const __CFArray *__MFAACreateCertChainDataFromHash_block_invoke(uint64_t a1)
{
  const __CFArray *result;
  const __CFArray *v3;

  result = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 64), *(const void **)(a1 + 48));
  if (result)
  {
    v3 = result;
    result = (const __CFArray *)CFArrayGetCount(result);
    if (result == (const __CFArray *)2)
    {
      result = (const __CFArray *)CFArrayGetValueAtIndex(v3, 1);
      if (result)
      {
        result = (const __CFArray *)CFRetain(result);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
      }
    }
  }
  return result;
}

@end
