@implementation HKPowerUnit

- (id)dimension
{
  return +[_HKBaseDimension power](_HKBaseDimension, "power");
}

@end
