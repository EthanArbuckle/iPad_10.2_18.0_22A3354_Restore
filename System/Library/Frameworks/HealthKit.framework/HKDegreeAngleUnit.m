@implementation HKDegreeAngleUnit

- (id)dimension
{
  return +[_HKBaseDimension angle](_HKBaseDimension, "angle");
}

@end
