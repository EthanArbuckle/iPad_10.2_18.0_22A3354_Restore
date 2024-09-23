@implementation NSMutableArray(BaseBoard)

- (void)bs_safeAddObject:()BaseBoard
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

@end
