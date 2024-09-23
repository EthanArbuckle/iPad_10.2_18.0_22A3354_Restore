@implementation HKEquivalentsUnit

- (id)dimension
{
  return +[_HKBaseDimension equivalents](_HKBaseDimension, "equivalents");
}

@end
