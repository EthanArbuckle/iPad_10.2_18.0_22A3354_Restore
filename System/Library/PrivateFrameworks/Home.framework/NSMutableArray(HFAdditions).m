@implementation NSMutableArray(HFAdditions)

- (uint64_t)hf_insertObject:()HFAdditions intoSortedArrayWithOptions:comparator:
{
  id v8;
  id v9;
  uint64_t v10;

  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, objc_msgSend(a1, "count"), a4, v9);

  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a1, "insertObject:atIndex:", v8, v10);

  return v10;
}

@end
