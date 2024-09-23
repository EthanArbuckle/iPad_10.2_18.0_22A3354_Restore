@implementation HKConductanceUnit

- (id)dimension
{
  return +[_HKBaseDimension conductance](_HKBaseDimension, "conductance");
}

@end
