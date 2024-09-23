@implementation NSUnitMass(HKUnit)

- (HKUnit)hk_equivalentBaseUnit
{
  return +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("kg"));
}

- (id)hk_equivalentUnitWithConstant:()HKUnit coefficient:
{
  const __CFString *v3;
  void *v4;

  if (fabs(a1) < 2.22044605e-16
    && ((v3 = CFSTR("oz"), (objc_msgSend(MEMORY[0x1E0CB3A50], "hk_equalCoefficient:forUnit:", CFSTR("oz"), a2) & 1) != 0)
     || (v3 = CFSTR("lb"), (objc_msgSend(MEMORY[0x1E0CB3A50], "hk_equalCoefficient:forUnit:", CFSTR("lb"), a2) & 1) != 0)
     || (v3 = CFSTR("st"),
         objc_msgSend(MEMORY[0x1E0CB3A50], "hk_equalCoefficient:forUnit:", CFSTR("st"), a2))))
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
