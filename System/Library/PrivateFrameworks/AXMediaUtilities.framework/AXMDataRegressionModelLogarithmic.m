@implementation AXMDataRegressionModelLogarithmic

- (id)modelDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("chart.model.logarithmic"), &stru_1E6260C18, CFSTR("Accessibility"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)modelFunction
{
  return &__block_literal_global_35;
}

long double __50__AXMDataRegressionModelLogarithmic_modelFunction__block_invoke(long double a1, uint64_t a2, double *a3)
{
  double v3;
  double v4;

  v3 = *a3;
  v4 = a3[1];
  return v4 + v3 * log(a1);
}

- (int)modelParameterCount
{
  return 2;
}

- (void)getInitialParams:(double *)a3
{
  *(_OWORD *)a3 = xmmword_1B0EFFF10;
}

- (id)partialDerivatives
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", &__block_literal_global_27_5);
  objc_msgSend(v2, "addObject:", &__block_literal_global_28_3);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

double __55__AXMDataRegressionModelLogarithmic_partialDerivatives__block_invoke_2()
{
  return 1.0;
}

- (id)modelFunctionStringForParameters:(double *)a3 significantFigures:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v6, "setUsesSignificantDigits:", 1);
  objc_msgSend(v6, "setMaximumSignificantDigits:", a4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromNumber:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[1]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromNumber:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("y = %@ * ln(x) + %@"), v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
