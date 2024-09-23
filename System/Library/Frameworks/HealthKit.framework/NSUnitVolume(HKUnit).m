@implementation NSUnitVolume(HKUnit)

- (HKUnit)hk_equivalentBaseUnit
{
  return +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("L"));
}

- (id)hk_equivalentUnitWithConstant:()HKUnit coefficient:
{
  const __CFString *v3;
  void *v4;

  if (fabs(a1) < 2.22044605e-16
    && ((v3 = CFSTR("fl_oz_us"),
         (objc_msgSend(MEMORY[0x1E0CB3A50], "hk_equalCoefficient:forUnit:", CFSTR("fl_oz_us"), a2) & 1) != 0)
     || (v3 = CFSTR("fl_oz_imp"),
         (objc_msgSend(MEMORY[0x1E0CB3A50], "hk_equalCoefficient:forUnit:", CFSTR("fl_oz_imp"), a2) & 1) != 0)
     || (v3 = CFSTR("pt_us"),
         (objc_msgSend(MEMORY[0x1E0CB3A50], "hk_equalCoefficient:forUnit:", CFSTR("pt_us"), a2) & 1) != 0)
     || (v3 = CFSTR("pt_imp"),
         (objc_msgSend(MEMORY[0x1E0CB3A50], "hk_equalCoefficient:forUnit:", CFSTR("pt_imp"), a2) & 1) != 0)
     || (v3 = CFSTR("cup_us"),
         (objc_msgSend(MEMORY[0x1E0CB3A50], "hk_equalCoefficient:forUnit:", CFSTR("cup_us"), a2) & 1) != 0)
     || (v3 = CFSTR("cup_imp"),
         objc_msgSend(MEMORY[0x1E0CB3A50], "hk_equalCoefficient:forUnit:", CFSTR("cup_imp"), a2))))
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
