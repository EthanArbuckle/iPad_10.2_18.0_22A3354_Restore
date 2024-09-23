@implementation NSSet(CPAccNavParam)

- (id)cp_setByRemovingObject:()CPAccNavParam
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "removeObject:", v4);

  return v5;
}

@end
