@implementation HKScalarUnit

- (id)dimension
{
  return +[_HKBaseDimension nullDimension](_HKBaseDimension, "nullDimension");
}

@end
