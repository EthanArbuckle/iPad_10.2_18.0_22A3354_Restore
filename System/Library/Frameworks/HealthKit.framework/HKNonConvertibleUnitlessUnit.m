@implementation HKNonConvertibleUnitlessUnit

- (id)dimension
{
  return +[_HKBaseDimension unitLess](_HKBaseDimension, "unitLess");
}

@end
