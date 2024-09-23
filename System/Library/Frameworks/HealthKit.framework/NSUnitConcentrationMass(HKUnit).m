@implementation NSUnitConcentrationMass(HKUnit)

- (HKUnit)hk_equivalentBaseUnit
{
  return +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("g/L"));
}

@end
