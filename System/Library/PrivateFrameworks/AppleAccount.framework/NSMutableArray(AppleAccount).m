@implementation NSMutableArray(AppleAccount)

- (id)aa_removeFirstObject
{
  void *v2;

  if (objc_msgSend(a1, "count"))
  {
    objc_msgSend(a1, "objectAtIndex:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "removeObjectAtIndex:", 0);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)aa_removeLastObject
{
  void *v2;

  objc_msgSend(a1, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "removeLastObject");
  return v2;
}

@end
