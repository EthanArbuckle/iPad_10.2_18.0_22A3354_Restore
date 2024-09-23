@implementation AXMDataRegressionModelLinear

- (id)modelDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("chart.model.linear"), &stru_1E6260C18, CFSTR("Accessibility"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)fitDataWithModelParams:(double *)a3 finalParams:(double *)a4
{
  double *v6;
  double *v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double *v15;
  double v16;
  uint64_t v17;
  double *v18;
  double v19;
  BOOL v20;
  double v21;

  v6 = -[AXMDataRegressionModel x](self, "x", a3);
  v7 = -[AXMDataRegressionModel y](self, "y");
  v8 = -[AXMDataRegressionModel n](self, "n");
  v9 = covariance(v6, v7, v8);
  v10 = variance(v6, v8);
  v11 = variance(v7, v8);
  v12 = mean(v6, v8);
  v13 = mean(v7, v8);
  v14 = sqrt(v11) * (v9 / sqrt(v10 * v11)) / sqrt(v10);
  *a4 = v14;
  a4[1] = v13 - v14 * v12;
  v15 = (double *)malloc_type_malloc(8 * v8, 0x8D65132DuLL);
  -[AXMDataRegressionModel getResidualsVector:result:](self, "getResidualsVector:result:", a4, v15);
  if (v8 < 1)
  {
    v21 = 0.0;
  }
  else
  {
    v16 = 0.0;
    v17 = 0x100000000;
    v18 = v15;
    do
    {
      v19 = *v18++;
      v16 = v16 + v19 * v19;
      v20 = v8 <= v17 >> 32;
      v17 += 0x100000000;
    }
    while (!v20);
    v21 = v16 * 0.5;
  }
  self->super._error = v21;
  -[AXMDataRegressionModel computeScore](self, "computeScore");
  self->_rSquared = rsquared(v6, v7, v8);
  memcpy(self->super._bestFitParameters, a4, 8 * -[AXMDataRegressionModelLinear modelParameterCount](self, "modelParameterCount"));
  free(v15);
  return v21;
}

- (id)modelFunction
{
  return &__block_literal_global_30;
}

double __45__AXMDataRegressionModelLinear_modelFunction__block_invoke(double a1, uint64_t a2, double *a3)
{
  return a3[1] + *a3 * a1;
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
  objc_msgSend(v2, "addObject:", &__block_literal_global_27_4);
  objc_msgSend(v2, "addObject:", &__block_literal_global_28_2);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

double __50__AXMDataRegressionModelLinear_partialDerivatives__block_invoke_2()
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

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("y = %@x + %@"), v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (double)rSquared
{
  return self->_rSquared;
}

@end
