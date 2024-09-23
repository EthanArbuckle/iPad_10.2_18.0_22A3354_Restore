@implementation HKElectricPotentialDifferenceUnit

- (id)dimension
{
  return +[_HKBaseDimension electricPotentialDifference](_HKBaseDimension, "electricPotentialDifference");
}

@end
