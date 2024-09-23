@implementation HKEnergyUnit

- (id)dimension
{
  return +[_HKBaseDimension energy](_HKBaseDimension, "energy");
}

@end
