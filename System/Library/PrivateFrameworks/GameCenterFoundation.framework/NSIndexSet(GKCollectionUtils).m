@implementation NSIndexSet(GKCollectionUtils)

- (id)_gkIndexSetByRemovingIndex:()GKCollectionUtils
{
  void *v4;

  v4 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v4, "removeIndex:", a3);
  return v4;
}

- (id)_gkIndexSetByAddingIndex:()GKCollectionUtils
{
  void *v4;

  v4 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v4, "addIndex:", a3);
  return v4;
}

@end
