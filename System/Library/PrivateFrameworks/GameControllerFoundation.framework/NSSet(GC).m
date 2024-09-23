@implementation NSSet(GC)

- (id)gc_setByRemovingObject:()GC
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v4, "removeObject:", a3);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (id)gc_setByRemovingObjectsFromSet:()GC
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v4, "minusSet:", a3);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

@end
