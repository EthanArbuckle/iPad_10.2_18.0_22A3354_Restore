@implementation NSMutableSet(AXExtensions)

- (void)axSafelyAddObjectsFromArray:()AXExtensions
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObjectsFromArray:");
  return a1;
}

- (void)axSafelyAddObject:()AXExtensions
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

@end
