@implementation HKTiterUnit

- (id)dimension
{
  return +[_HKBaseDimension titer](_HKBaseDimension, "titer");
}

@end
