@implementation NSMapTable(CATAdditions)

- (BOOL)cat_containsKey:()CATAdditions
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

@end
