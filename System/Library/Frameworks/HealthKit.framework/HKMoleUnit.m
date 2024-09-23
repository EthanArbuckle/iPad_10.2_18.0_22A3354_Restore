@implementation HKMoleUnit

- (id)dimension
{
  return +[_HKBaseDimension nonConvertibleMole](_HKBaseDimension, "nonConvertibleMole");
}

@end
