@implementation NSUnitEnergy(HKUnit)

- (HKUnit)hk_equivalentBaseUnit
{
  return +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("J"));
}

- (id)hk_equivalentUnitWithConstant:()HKUnit coefficient:
{
  const __CFString *v3;
  void *v4;

  if (fabs(a1) < 2.22044605e-16
    && ((v3 = CFSTR("kcal"),
         (objc_msgSend(MEMORY[0x1E0CB3A50], "hk_equalCoefficient:forUnit:", CFSTR("kcal"), a2) & 1) != 0)
     || (v3 = CFSTR("cal"),
         objc_msgSend(MEMORY[0x1E0CB3A50], "hk_equalCoefficient:forUnit:", CFSTR("cal"), a2))))
  {
    +[HKUnit unitFromString:](HKUnit, "unitFromString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
