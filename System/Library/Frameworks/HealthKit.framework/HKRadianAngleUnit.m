@implementation HKRadianAngleUnit

- (id)dimension
{
  return +[_HKBaseDimension angle](_HKBaseDimension, "angle");
}

@end
