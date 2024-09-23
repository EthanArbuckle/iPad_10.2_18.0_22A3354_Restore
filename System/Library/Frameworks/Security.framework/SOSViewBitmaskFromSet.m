@implementation SOSViewBitmaskFromSet

unint64_t __SOSViewBitmaskFromSet_block_invoke(uint64_t a1, const void *a2)
{
  unint64_t result;

  result = (unint64_t)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= result;
  return result;
}

@end
