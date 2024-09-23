@implementation HKIlluminanceUnit

- (id)dimension
{
  return +[_HKBaseDimension illuminance](_HKBaseDimension, "illuminance");
}

@end
