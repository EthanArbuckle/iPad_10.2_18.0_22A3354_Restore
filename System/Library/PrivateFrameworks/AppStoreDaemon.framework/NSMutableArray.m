@implementation NSMutableArray

- (id)asd_pop
{
  void *v2;

  if (a1)
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
