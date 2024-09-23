@implementation NSIndexPath(GKGridLayoutPrivate)

- (BOOL)_gkIsGlobal
{
  return objc_msgSend(a1, "length") == 1;
}

@end
