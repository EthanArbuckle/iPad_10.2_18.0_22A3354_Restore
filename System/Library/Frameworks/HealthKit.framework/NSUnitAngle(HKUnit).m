@implementation NSUnitAngle(HKUnit)

- (HKUnit)hk_equivalentBaseUnit
{
  return +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("rad"));
}

- (id)hk_equivalentUnitWithConstant:()HKUnit coefficient:
{
  const __CFString *v4;
  void *v5;

  if (objc_msgSend(MEMORY[0x1E0CB3A50], "hk_equalConstant:forUnit:", CFSTR("deg"))
    && (v4 = CFSTR("deg"), (objc_msgSend(MEMORY[0x1E0CB3A50], "hk_equalCoefficient:forUnit:", CFSTR("deg"), a2) & 1) != 0)
    || objc_msgSend(MEMORY[0x1E0CB3A50], "hk_equalConstant:forUnit:", CFSTR("rad"), a1)
    && (v4 = CFSTR("rad"),
        objc_msgSend(MEMORY[0x1E0CB3A50], "hk_equalCoefficient:forUnit:", CFSTR("rad"), a2)))
  {
    +[HKUnit unitFromString:](HKUnit, "unitFromString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
