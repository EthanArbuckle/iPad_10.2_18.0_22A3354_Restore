@implementation NSMutableArray(AAAFoundation)

- (id)aaf_removeFirstObject
{
  void *v2;

  if (objc_msgSend(a1, "count"))
  {
    objc_msgSend(a1, "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "removeObjectAtIndex:", 0);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)aaf_removeLastObject
{
  void *v2;

  if (objc_msgSend(a1, "count"))
  {
    objc_msgSend(a1, "lastObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "removeLastObject");
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end
