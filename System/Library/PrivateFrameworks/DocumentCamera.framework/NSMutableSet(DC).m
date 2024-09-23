@implementation NSMutableSet(DC)

- (void)dc_addNonNilObject:()DC
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

- (void)dc_removeNonNilObject:()DC
{
  if (a3)
    return (void *)objc_msgSend(a1, "removeObject:");
  return a1;
}

@end
