@implementation CopyProperty

void *__endpoint_CopyProperty_block_invoke(uint64_t a1)
{
  const __CFDictionary *v2;
  void *result;
  const void *Empty;

  v2 = *(const __CFDictionary **)(*(_QWORD *)(a1 + 32) + 64);
  if (v2)
  {
    result = CFDictionaryCreateCopy(*(CFAllocatorRef *)(a1 + 48), v2);
  }
  else
  {
    Empty = (const void *)CFDictionaryGetEmpty();
    result = (void *)CFRetain(Empty);
  }
  **(_QWORD **)(a1 + 40) = result;
  return result;
}

@end
