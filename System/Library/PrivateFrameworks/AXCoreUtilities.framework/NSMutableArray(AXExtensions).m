@implementation NSMutableArray(AXExtensions)

- (void)axSafelyAddObject:()AXExtensions
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

- (void)axSafelyAddObjectsFromArray:()AXExtensions
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  v7 = 0;
  __UIAccessibilitySafeClass(CFSTR("NSArray"), v4, 1, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    abort();
  v6 = v5;

  if (v6)
    objc_msgSend(a1, "addObjectsFromArray:", v4);

}

@end
