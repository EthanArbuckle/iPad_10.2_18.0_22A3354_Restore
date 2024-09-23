@implementation NSUnitElectricResistance(HKUnit)

- (HKUnit)hk_equivalentBaseUnit
{
  return +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("1/S"));
}

@end
