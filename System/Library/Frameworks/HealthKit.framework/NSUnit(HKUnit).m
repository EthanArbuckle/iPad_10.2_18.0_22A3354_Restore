@implementation NSUnit(HKUnit)

+ (double)hk_conversionCoefficient:()HKUnit
{
  uint64_t v3;
  id v4;
  void *v5;
  double v6;
  double v7;

  v3 = hk_conversionCoefficient__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&hk_conversionCoefficient__onceToken, &__block_literal_global_8);
  objc_msgSend((id)hk_conversionCoefficient__coefficients, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

+ (double)hk_conversionConstant:()HKUnit
{
  uint64_t v3;
  id v4;
  void *v5;
  double v6;
  double v7;

  v3 = hk_conversionConstant__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&hk_conversionConstant__onceToken, &__block_literal_global_65);
  objc_msgSend((id)hk_conversionConstant__constants, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

+ (unint64_t)hk_isSIUnit:()HKUnit
{
  id v3;
  int v4;
  uint64_t v6;

  v3 = a3;
  if (objc_msgSend(v3, "length") == 1)
  {
    v4 = objc_msgSend(v3, "characterAtIndex:", 0);

    if ((v4 - 74) >= 0x2A)
      return 0;
    else
      return (0x20820000207uLL >> (v4 - 74)) & 1;
  }
  else
  {
    v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("Pa"));

    return v6;
  }
}

+ (id)hk_prefixForCoefficient:()HKUnit
{
  void *v2;
  void *v3;
  void *v4;

  if (hk_prefixForCoefficient__onceToken != -1)
    dispatch_once(&hk_prefixForCoefficient__onceToken, &__block_literal_global_68);
  v2 = (void *)hk_prefixForCoefficient__prefixes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)hk_equalCoefficient:()HKUnit forUnit:
{
  double v2;

  objc_msgSend(MEMORY[0x1E0CB3A50], "hk_conversionCoefficient:");
  return vabdd_f64(v2, a1) < 2.22044605e-16;
}

+ (BOOL)hk_equalConstant:()HKUnit forUnit:
{
  double v2;

  objc_msgSend(MEMORY[0x1E0CB3A50], "hk_conversionConstant:");
  return vabdd_f64(v2, a1) < 2.22044605e-16;
}

- (id)hk_equivalentUnit
{
  id v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = a1;
    objc_msgSend(v2, "converter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v2, "converter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "constant");
      v7 = v6;
      objc_msgSend(v5, "coefficient");
      objc_msgSend(v2, "hk_equivalentUnitWithConstant:coefficient:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (uint64_t)hk_equivalentBaseUnit
{
  return 0;
}

- (uint64_t)hk_equivalentUnitWithConstant:()HKUnit coefficient:
{
  return 0;
}

- (id)hk_equivalentQuantityWithValue:()HKUnit
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;

  objc_msgSend(a1, "hk_equivalentUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = a1;
      objc_msgSend(v6, "converter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v8 = 0.0;
      v9 = 0.0;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v7;
        objc_msgSend(v10, "constant");
        v8 = v11;
        objc_msgSend(v10, "coefficient");
        v9 = v12;

      }
      objc_msgSend(v6, "hk_convertQuantityWithValue:constant:coefficient:", a2, v8, v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)hk_convertQuantityWithValue:()HKUnit constant:coefficient:
{
  void *v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  objc_msgSend(a1, "hk_equivalentBaseUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "unitString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(MEMORY[0x1E0CB3A50], "hk_isSIUnit:", v9);
    v11 = fabs(a3) >= 2.22044605e-16 || v10 == 0;
    if (v11
      || (objc_msgSend(MEMORY[0x1E0CB3A50], "hk_prefixForCoefficient:", a4),
          (v12 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v8, a3 + a2 * a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = (void *)v12;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v12, v9);
      v14 = objc_claimAutoreleasedReturnValue();

      +[HKUnit unitFromString:](HKUnit, "unitFromString:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v15, a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)v14;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end
