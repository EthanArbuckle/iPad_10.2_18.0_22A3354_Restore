@implementation NSEnumerator(MPFastForward)

- (id)nextObjectIdenticalTo:()MPFastForward
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = 0;
  do
  {
    v6 = v5;
    objc_msgSend(a1, "nextObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  while (v5 && v5 != v4);

  return v5;
}

@end
