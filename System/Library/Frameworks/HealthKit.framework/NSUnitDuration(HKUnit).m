@implementation NSUnitDuration(HKUnit)

- (HKUnit)hk_equivalentBaseUnit
{
  return +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("s"));
}

- (id)hk_equivalentUnitWithConstant:()HKUnit coefficient:
{
  const __CFString *v3;
  void *v4;

  if (fabs(a1) < 2.22044605e-16
    && ((v3 = CFSTR("min"),
         (objc_msgSend(MEMORY[0x1E0CB3A50], "hk_equalCoefficient:forUnit:", CFSTR("min"), a2) & 1) != 0)
     || (v3 = CFSTR("hr"), (objc_msgSend(MEMORY[0x1E0CB3A50], "hk_equalCoefficient:forUnit:", CFSTR("hr"), a2) & 1) != 0)
     || (v3 = CFSTR("d"), objc_msgSend(MEMORY[0x1E0CB3A50], "hk_equalCoefficient:forUnit:", CFSTR("d"), a2))))
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
