@implementation NSMutableArray(AXQueue)

- (uint64_t)ax_enqueueObject:()AXQueue
{
  return objc_msgSend(a1, "insertObject:atIndex:", a3, 0);
}

- (id)ax_dequeueObject
{
  void *v2;

  objc_msgSend(a1, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "removeLastObject");
  return v2;
}

- (uint64_t)ax_lastEnqueuedObject
{
  return objc_msgSend(a1, "objectAtIndex:", 0);
}

@end
