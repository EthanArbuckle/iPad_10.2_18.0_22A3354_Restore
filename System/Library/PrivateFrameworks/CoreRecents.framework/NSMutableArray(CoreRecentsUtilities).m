@implementation NSMutableArray(CoreRecentsUtilities)

- (void)cr_addNonNilObject:()CoreRecentsUtilities
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

- (unint64_t)cr_removeObjectsStartingAtIndex:()CoreRecentsUtilities
{
  unint64_t result;

  result = objc_msgSend(a1, "count");
  if (result > a3)
    return objc_msgSend(a1, "removeObjectsInRange:", a3, result - a3);
  return result;
}

- (uint64_t)cr_insertObject:()CoreRecentsUtilities usingComparator:
{
  if (a4)
    return objc_msgSend(a1, "insertObject:atIndex:", a3, objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", a3, 0, objc_msgSend(a1, "count"), 1024, a4));
  else
    return objc_msgSend(a1, "addObject:", a3);
}

- (uint64_t)cr_addObject:()CoreRecentsUtilities orPlaceholder:
{
  if (!a3)
    a3 = a4;
  return objc_msgSend(a1, "addObject:", a3);
}

@end
