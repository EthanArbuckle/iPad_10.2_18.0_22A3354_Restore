@implementation NSSet(Intersection)

- (id)intersectSet:()Intersection
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "intersectSet:", v4);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithSet:", v5);
  return v6;
}

@end
