@implementation NSUnitArea(HKUnit)

- (HKUnit)hk_equivalentBaseUnit
{
  return +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("m^2"));
}

@end
