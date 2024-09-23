@implementation AXMDataRegressionModelPower

- (id)modelDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("chart.model.power"), &stru_1E6260C18, CFSTR("Accessibility"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)modelFunction
{
  return &__block_literal_global_20;
}

long double __44__AXMDataRegressionModelPower_modelFunction__block_invoke(long double a1, uint64_t a2, uint64_t a3)
{
  double v3;

  v3 = *(double *)a3;
  return v3 * pow(a1, *(long double *)(a3 + 8));
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
  double *v10;
  uint64_t v11;
  double *v12;
  double *v13;
  long double v14;
  double v15;
  long double v16;
  double v17;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  v5 = -[AXMDataRegressionModel x](self, "x");
  v6 = -[AXMDataRegressionModel y](self, "y");
  v7 = -[AXMDataRegressionModel n](self, "n");
  v8 = (double *)malloc_type_malloc(8 * v7, 0x791BAEE8uLL);
  v9 = (double *)malloc_type_malloc(8 * v7, 0xC1E095EDuLL);
  v10 = v9;
  if (v7 >= 1)
  {
    v11 = 0x100000000;
    v12 = v8;
    v13 = v9;
    do
    {
      v14 = *v5++;
      v15 = log(v14);
      if (v14 == 0.0)
        v15 = 0.0;
      *v12++ = v15;
      v16 = *v6++;
      v17 = log(v16);
      if (v16 == 0.0)
        v17 = 0.0;
      *v13++ = v17;
      v18 = v7 <= v11 >> 32;
      v11 += 0x100000000;
    }
    while (!v18);
  }
  v19 = covariance(v8, v10, v7);
  v20 = variance(v8, v7);
  v21 = variance(v10, v7);
  v22 = mean(v8, v7);
  v23 = mean(v10, v7);
  v24 = sqrt(v21) * (v19 / sqrt(v20 * v21)) / sqrt(v20);
  *a3 = exp(v23 - v24 * v22);
  a3[1] = v24;
  free(v8);
  free(v10);
}

- (id)partialDerivatives
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", &__block_literal_global_27_2);
  objc_msgSend(v2, "addObject:", &__block_literal_global_28_0);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

double __49__AXMDataRegressionModelPower_partialDerivatives__block_invoke(long double a1, uint64_t a2, uint64_t a3)
{
  return pow(a1, *(long double *)(a3 + 8));
}

long double __49__AXMDataRegressionModelPower_partialDerivatives__block_invoke_2(long double a1, uint64_t a2, uint64_t a3)
{
  double v4;
  long double v5;

  v4 = *(double *)a3;
  v5 = v4 * pow(a1, *(long double *)(a3 + 8));
  return log(a1) * v5;
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

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("y = %@ * x^%@"), v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)dataSatisfiesInitialConditions
{
  double v3;

  v3 = min(-[AXMDataRegressionModel x](self, "x"), -[AXMDataRegressionModel n](self, "n"));
  return min(-[AXMDataRegressionModel y](self, "y"), -[AXMDataRegressionModel n](self, "n")) >= 0.0 && v3 >= 0.0;
}

@end
