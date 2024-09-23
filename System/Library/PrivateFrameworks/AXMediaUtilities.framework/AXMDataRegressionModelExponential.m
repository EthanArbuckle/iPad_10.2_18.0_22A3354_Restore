@implementation AXMDataRegressionModelExponential

- (id)modelDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("chart.model.exponential"), &stru_1E6260C18, CFSTR("Accessibility"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)modelFunction
{
  return &__block_literal_global_2;
}

long double __50__AXMDataRegressionModelExponential_modelFunction__block_invoke(double a1, uint64_t a2, double *a3)
{
  double v3;

  v3 = *a3;
  return v3 * exp(a3[1] * a1);
}

- (int)modelParameterCount
{
  return 2;
}

- (void)getInitialParams:(double *)a3
{
  double *v5;
  double *v6;
  int v7;
  double *v8;
  double *v9;
  uint64_t v10;
  double *v11;
  long double v12;
  double v13;
  BOOL v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v5 = -[AXMDataRegressionModel x](self, "x");
  v6 = -[AXMDataRegressionModel y](self, "y");
  v7 = -[AXMDataRegressionModel n](self, "n");
  v8 = (double *)malloc_type_malloc(8 * v7, 0xF467C1A6uLL);
  v9 = v8;
  if (v7 >= 1)
  {
    v10 = 0x100000000;
    v11 = v8;
    do
    {
      v12 = *v6++;
      v13 = log(v12);
      if (v12 == 0.0)
        v13 = 0.0;
      *v11++ = v13;
      v14 = v7 <= v10 >> 32;
      v10 += 0x100000000;
    }
    while (!v14);
  }
  v15 = covariance(v5, v9, v7);
  v16 = variance(v5, v7);
  v17 = variance(v9, v7);
  v18 = mean(v5, v7);
  v19 = mean(v9, v7);
  v20 = sqrt(v17) * (v15 / sqrt(v16 * v17)) / sqrt(v16);
  *a3 = exp(v19 - v20 * v18);
  a3[1] = v20;
  free(v9);
}

- (id)partialDerivatives
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", &__block_literal_global_27_0);
  objc_msgSend(v2, "addObject:", &__block_literal_global_28);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

double __55__AXMDataRegressionModelExponential_partialDerivatives__block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  return exp(*(double *)(a3 + 8) * a1);
}

long double __55__AXMDataRegressionModelExponential_partialDerivatives__block_invoke_2(double a1, uint64_t a2, double *a3)
{
  double v3;

  v3 = *a3 * a1;
  return v3 * exp(a3[1] * a1);
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

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("y = %@ * e^(%@x)"), v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)dataSatisfiesInitialConditions
{
  return min(-[AXMDataRegressionModel y](self, "y"), -[AXMDataRegressionModel n](self, "n")) > 0.0;
}

@end
