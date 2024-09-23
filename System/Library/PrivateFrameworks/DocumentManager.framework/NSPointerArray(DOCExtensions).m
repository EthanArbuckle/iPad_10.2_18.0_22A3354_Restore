@implementation NSPointerArray(DOCExtensions)

- (BOOL)doc_containsPointer:()DOCExtensions
{
  return objc_msgSend(a1, "doc_indexOfPointer:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)doc_indexOfPointer:()DOCExtensions
{
  uint64_t v5;

  if (!objc_msgSend(a1, "count"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = 0;
  while (objc_msgSend(a1, "pointerAtIndex:", v5) != a3)
  {
    if (++v5 >= (unint64_t)objc_msgSend(a1, "count"))
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

@end
