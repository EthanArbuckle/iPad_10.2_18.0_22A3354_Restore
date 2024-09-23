@implementation HKPressureUnit

- (id)dimension
{
  return +[_HKBaseDimension pressure](_HKBaseDimension, "pressure");
}

@end
