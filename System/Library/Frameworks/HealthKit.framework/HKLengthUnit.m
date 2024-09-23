@implementation HKLengthUnit

- (id)dimension
{
  return +[_HKBaseDimension length](_HKBaseDimension, "length");
}

@end
