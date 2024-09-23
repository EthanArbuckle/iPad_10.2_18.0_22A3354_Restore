@implementation NSMutableArray(CRKAdditions)

- (BOOL)crk_pluckFlag:()CRKAdditions
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "indexOfObject:");
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a1, "removeObjectAtIndex:", v2);
  return v2 != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)crk_pluckValueForNamedArgument:()CRKAdditions
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = objc_msgSend(a1, "indexOfObject:");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL || (v3 = v2, v4 = v2 + 1, v2 + 1 >= (unint64_t)objc_msgSend(a1, "count")))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "objectAtIndexedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "removeObjectsInRange:", v3, 2);
  }
  return v5;
}

@end
