@implementation NSMutableArray(CUArrayExtensions)

- (id)popFirstObject
{
  void *v2;

  objc_msgSend(a1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(a1, "removeObjectAtIndex:", 0);
  return v2;
}

@end
