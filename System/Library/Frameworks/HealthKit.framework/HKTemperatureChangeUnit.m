@implementation HKTemperatureChangeUnit

- (id)dimension
{
  return +[_HKBaseDimension changeInTemperature](_HKBaseDimension, "changeInTemperature");
}

@end
