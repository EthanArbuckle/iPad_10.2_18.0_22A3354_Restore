@implementation HKTemperatureUnit

- (id)dimension
{
  return +[_HKBaseDimension temperature](_HKBaseDimension, "temperature");
}

@end
