@implementation AXMDataRegressionModelSine

- (id)modelDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("chart.model.sinusoidal"), &stru_1E6260C18, CFSTR("Accessibility"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)modelFunction
{
  return &__block_literal_global_25;
}

long double __43__AXMDataRegressionModelSine_modelFunction__block_invoke(double a1, uint64_t a2, double *a3)
{
  double v3;
  double v4;

  v3 = *a3;
  v4 = a3[3];
  return v4 + v3 * sin(a3[2] + a3[1] * a1);
}

- (int)modelParameterCount
{
  return 4;
}

- (void)disqualifyModelIfNecessary
{
  double v2;
  double v4;
  double v5;

  v2 = self->super._bestFitParameters[1];
  if (v2 > 0.0)
  {
    v4 = 6.28318531 / v2;
    v5 = max(self->super._x, self->super._n);
    -[AXMDataRegressionModel setIsDisqualified:](self, "setIsDisqualified:", v5 - min(self->super._x, self->super._n) < v4 * 0.666666667);
  }
}

- (void)getInitialParams:(double *)a3
{
  double v5;
  double v6;
  uint64_t v7;

  v5 = min(self->super._y, self->super._n);
  v6 = max(self->super._y, self->super._n) - v5;
  *a3 = v6 / 1.5;
  -[AXMDataRegressionModelSine estimatedRadianFrequency](self, "estimatedRadianFrequency");
  *((_QWORD *)a3 + 1) = v7;
  a3[2] = 0.0;
  a3[3] = v5 + v6 * 0.5;
}

- (id)partialDerivatives
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", &__block_literal_global_27_3);
  objc_msgSend(v2, "addObject:", &__block_literal_global_28_1);
  objc_msgSend(v2, "addObject:", &__block_literal_global_29_0);
  objc_msgSend(v2, "addObject:", &__block_literal_global_30);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

double __48__AXMDataRegressionModelSine_partialDerivatives__block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  return sin(*(double *)(a3 + 16) + *(double *)(a3 + 8) * a1);
}

long double __48__AXMDataRegressionModelSine_partialDerivatives__block_invoke_2(double a1, uint64_t a2, double *a3)
{
  double v3;

  v3 = *a3 * a1;
  return v3 * cos(a3[2] + a3[1] * a1);
}

long double __48__AXMDataRegressionModelSine_partialDerivatives__block_invoke_3(double a1, uint64_t a2, double *a3)
{
  double v3;

  v3 = *a3;
  return v3 * cos(a3[2] + a3[1] * a1);
}

double __48__AXMDataRegressionModelSine_partialDerivatives__block_invoke_4()
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;

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

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[2]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromNumber:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[3]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromNumber:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("y = %@ * sin(%@x + %@) + %@"), v8, v10, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (double)estimatedRadianFrequency
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t n;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int v16;
  int v17;
  uint64_t v18;
  double *v19;
  int v20;
  double v21;
  _BOOL4 v22;
  int v23;
  unsigned __int8 v24;
  int v25;
  double v26;
  _BOOL4 v27;
  int v28;
  unsigned __int8 v29;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v3 = -[AXMDataRegressionModel sortDataPoints](self, "sortDataPoints");
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v32 - v5;
  if (v4 >= 25)
    v7 = 5;
  else
    v7 = (v4 / 5);
  -[AXMDataRegressionModel getSMA:lookback:](self, "getSMA:lookback:", (char *)v32 - v5, v7);
  n = self->super._n;
  if ((int)n < 1)
  {
    LODWORD(v10) = 0;
    LODWORD(v11) = 0;
    v15 = -INFINITY;
  }
  else
  {
    v9 = 0;
    LODWORD(v10) = 0;
    LODWORD(v11) = 0;
    v12 = -1.79769313e308;
    v13 = 1.79769313e308;
    do
    {
      v14 = *(double *)&v6[8 * v9];
      if (v14 < v13)
      {
        LODWORD(v11) = v9;
        v13 = *(double *)&v6[8 * v9];
      }
      if (v14 > v12)
      {
        LODWORD(v10) = v9;
        v12 = *(double *)&v6[8 * v9];
      }
      ++v9;
    }
    while (n != v9);
    v15 = v13 + (v12 - v13) * 0.5;
    if ((int)v11 < (int)v10)
    {
      v16 = 0;
      v17 = 0;
      v18 = (int)v11;
      v19 = (double *)&v6[8 * (int)v11];
      v20 = v10 - v11 + 1;
      do
      {
        v21 = *v19++;
        v22 = v21 > v15;
        v23 = v17 + (v22 & (v16 ^ 1));
        v24 = v22 | v16;
        v17 = v23 + ((v21 < v15) & v24);
        v16 = (v21 >= v15) & v24;
        --v20;
      }
      while (v20);
      v10 = (int)v10;
      return 6.28318531 / (vabdd_f64(self->super._x[v10], self->super._x[v18]) / ((double)v17 * 0.5));
    }
  }
  v25 = 0;
  v17 = 0;
  v18 = (int)v11;
  v10 = (int)v10;
  v11 = (int)v11;
  do
  {
    v26 = *(double *)&v6[8 * v11];
    v27 = v26 > v15;
    v28 = v17 + (v27 & (v25 ^ 1));
    v29 = v27 | v25;
    v17 = v28 + ((v26 < v15) & v29);
    v25 = (v26 >= v15) & v29;
  }
  while (v11-- > (int)v10);
  return 6.28318531 / (vabdd_f64(self->super._x[v10], self->super._x[v18]) / ((double)v17 * 0.5));
}

@end
