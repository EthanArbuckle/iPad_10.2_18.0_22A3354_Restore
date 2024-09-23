@implementation HKMassUnit

- (id)dimension
{
  return +[_HKBaseDimension mass](_HKBaseDimension, "mass");
}

@end
