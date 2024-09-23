@implementation DisplayGetProperty

const void *__DisplayGetProperty_block_invoke(uint64_t a1)
{
  const void *result;

  result = CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 192), *(const void **)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
