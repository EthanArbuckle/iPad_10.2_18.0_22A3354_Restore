@implementation CopyPeakNonVolatileList

CFArrayRef __CopyPeakNonVolatileList_block_invoke(uint64_t a1, const __CFArray *a2)
{
  CFArrayRef result;

  result = __CFArray::createCopy((CFArrayRef)CI::gPeakNonVolatileList, a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
