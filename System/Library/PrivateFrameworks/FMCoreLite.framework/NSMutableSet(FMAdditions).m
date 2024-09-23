@implementation NSMutableSet(FMAdditions)

- (void)fm_safeAddObject:()FMAdditions
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

@end
