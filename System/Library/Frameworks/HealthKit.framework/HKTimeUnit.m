@implementation HKTimeUnit

- (id)dimension
{
  return +[_HKBaseDimension time](_HKBaseDimension, "time");
}

@end
