@implementation HFStaticNonBlockingItemProvider

+ (BOOL)prefersNonBlockingReloads
{
  return 1;
}

@end
