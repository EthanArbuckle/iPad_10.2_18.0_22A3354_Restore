@implementation HKAxisLabelDimensionScalar

- (double)niceStepSizeLargerThan:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  if (a3 == 0.0)
    v4 = 0.0;
  else
    v4 = floor(log10(fabs(a3)));
  v5 = __exp10(v4);
  v6 = a3 / v5;
  v7 = 5.0;
  if (v6 >= 5.0)
  {
    v7 = 1.0;
    v5 = __exp10(v4 + 1.0);
  }
  else if (v6 < 2.5)
  {
    if (v6 >= 2.0)
      v7 = 2.5;
    else
      v7 = 2.0;
  }
  return v7 * v5;
}

- (double)ticksPerStepSize:(double)a3
{
  double v4;
  double v5;
  double result;

  if (a3 == 0.0)
    v4 = 0.0;
  else
    v4 = floor(log10(fabs(a3)));
  v5 = a3 / __exp10(v4);
  result = 5.0;
  if (fabs(v5 + -5.0) >= 0.00000001 && fabs(v5 + -2.5) > 0.00000001)
    return 4.0;
  return result;
}

- (id)formatterForLabelStepSize:(double)a3
{
  int64_t v3;
  id v4;

  v3 = +[HKAxisLabelDimensionScalar _fractionDigitsForStep:](HKAxisLabelDimensionScalar, "_fractionDigitsForStep:", a3);
  v4 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v4, "setNumberStyle:", 1);
  objc_msgSend(v4, "setUsesGroupingSeparator:", 1);
  objc_msgSend(v4, "setMinimumFractionDigits:", v3);
  objc_msgSend(v4, "setMaximumFractionDigits:", v3);
  return v4;
}

- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a4;
  objc_msgSend(v5, "stringFromNumber:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromNumber:", &unk_1E9CED558);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", v7))
  {
    objc_msgSend(v5, "stringFromNumber:", &unk_1E9CED568);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }

  return v6;
}

- (id)endingLabelsFactorOverride
{
  return 0;
}

+ (int64_t)_fractionDigitsForStep:(double)a3
{
  int64_t v3;
  double v5;
  double v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;

  if (a3 == 0.0)
    return 0;
  v5 = fabs(a3);
  if (v5 >= 1.0)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v8, "setNumberStyle:", 1);
    v3 = 0;
    while (1)
    {
      objc_msgSend(v8, "setMinimumFractionDigits:", v3);
      objc_msgSend(v8, "setMaximumFractionDigits:", v3);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringFromNumber:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "numberFromString:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (!v11)
        break;
      objc_msgSend(v11, "doubleValue");
      if (vabdd_f64(a3, v13) < 1.0e-10)
        break;
      ++v3;

      if (v3 == 15)
        goto LABEL_11;
    }

LABEL_11:
  }
  else
  {
    v7 = floor(log10(v5));
    return objc_msgSend(a1, "_fractionDigitsForStep:", v5 / __exp10(v7)) + (uint64_t)rint(-v7);
  }
  return v3;
}

@end
