@implementation NSUnitTemperature(HKUnit)

- (HKUnit)hk_equivalentBaseUnit
{
  return +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("K"));
}

- (id)hk_equivalentUnitWithConstant:()HKUnit coefficient:
{
  const __CFString *v4;
  void *v5;

  if (objc_msgSend(MEMORY[0x1E0CB3A50], "hk_equalConstant:forUnit:", CFSTR("degC"))
    && (v4 = CFSTR("degC"),
        (objc_msgSend(MEMORY[0x1E0CB3A50], "hk_equalCoefficient:forUnit:", CFSTR("degC"), a2) & 1) != 0)
    || objc_msgSend(MEMORY[0x1E0CB3A50], "hk_equalConstant:forUnit:", CFSTR("degF"), a1)
    && (v4 = CFSTR("degF"),
        objc_msgSend(MEMORY[0x1E0CB3A50], "hk_equalCoefficient:forUnit:", CFSTR("degF"), a2)))
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
