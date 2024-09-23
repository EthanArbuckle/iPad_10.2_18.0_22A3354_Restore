@implementation HKAxisLabelDimensionInteger

- (double)niceStepSizeLargerThan:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if (a3 == 0.0)
  {
    v5 = 0.0;
  }
  else
  {
    v4 = floor(log10(fabs(a3)));
    if (v4 >= 0.0)
      v5 = v4;
    else
      v5 = 0.0;
  }
  v6 = __exp10(v5);
  v7 = a3 / v6;
  v8 = 5.0;
  if (v7 >= 5.0)
  {
    v8 = 1.0;
    v6 = __exp10(v5 + 1.0);
  }
  else if (v7 < 2.0)
  {
    if (v7 >= 1.0)
      v8 = 2.0;
    else
      v8 = 1.0;
  }
  return v8 * v6;
}

- (id)formatterForLabelStepSize:(double)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKAxisLabelDimensionInteger;
  -[HKAxisLabelDimensionScalar formatterForLabelStepSize:](&v5, sel_formatterForLabelStepSize_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMinimumFractionDigits:", 0);
  objc_msgSend(v3, "setMaximumFractionDigits:", 0);
  return v3;
}

@end
