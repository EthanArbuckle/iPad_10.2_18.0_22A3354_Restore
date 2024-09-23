@implementation HKNonConvertibleIUUnit

- (id)dimension
{
  return +[_HKBaseDimension nonConvertibleIU](_HKBaseDimension, "nonConvertibleIU");
}

@end
