@implementation NSPointerArray(ARAdditions)

- (uint64_t)ar_compactZeroedWeakPointers
{
  objc_msgSend(a1, "addPointer:", 0);
  return objc_msgSend(a1, "compact");
}

@end
