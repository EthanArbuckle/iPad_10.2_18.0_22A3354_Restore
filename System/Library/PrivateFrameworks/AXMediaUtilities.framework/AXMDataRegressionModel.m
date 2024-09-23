@implementation AXMDataRegressionModel

- (AXMDataRegressionModel)initWithXValues:(double *)a3 yValues:(double *)a4 count:(int)a5
{
  AXMDataRegressionModel *v8;
  AXMDataRegressionModel *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AXMDataRegressionModel;
  v8 = -[AXMDataRegressionModel init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_n = a5;
    v8->_x = (double *)malloc_type_malloc(8 * a5, 0x100004000313F17uLL);
    v9->_y = (double *)malloc_type_malloc(8 * v9->_n, 0x100004000313F17uLL);
    v9->_bestFitParameters = (double *)malloc_type_malloc(8 * -[AXMDataRegressionModel modelParameterCount](v9, "modelParameterCount"), 0x100004000313F17uLL);
    memcpy(v9->_x, a3, 8 * v9->_n);
    memcpy(v9->_y, a4, 8 * v9->_n);
    v9->_error = 1.79769313e308;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_bestFitParameters);
  free(self->_x);
  free(self->_y);
  v3.receiver = self;
  v3.super_class = (Class)AXMDataRegressionModel;
  -[AXMDataRegressionModel dealloc](&v3, sel_dealloc);
}

- (NSString)modelDescription
{
  return 0;
}

+ (id)getModelForX:(double *)a3 y:(double *)a4 n:(int)a5
{
  uint64_t v5;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  double *v26;
  double *v27;
  uint64_t v28;
  id v29;
  id v30;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _QWORD v38[7];

  v5 = *(_QWORD *)&a5;
  v38[5] = *MEMORY[0x1E0C80C00];
  v8 = (void *)getModelForX_y_n__modelClasses;
  if (!getModelForX_y_n__modelClasses)
  {
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    v38[2] = objc_opt_class();
    v38[3] = objc_opt_class();
    v38[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 5);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)getModelForX_y_n__modelClasses;
    getModelForX_y_n__modelClasses = v9;

    v8 = (void *)getModelForX_y_n__modelClasses;
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(obj);
        v16 = (void *)objc_msgSend(objc_alloc(*(Class *)(*((_QWORD *)&v33 + 1) + 8 * i)), "initWithXValues:yValues:count:", a3, a4, v5);
        v17 = malloc_type_malloc(8 * (int)objc_msgSend(v16, "modelParameterCount"), 0x100004000313F17uLL);
        v18 = malloc_type_malloc(8 * (int)objc_msgSend(v16, "modelParameterCount"), 0x100004000313F17uLL);
        objc_msgSend(v16, "getInitialParams:", v17);
        objc_msgSend(v16, "fitDataWithModelParams:finalParams:", v17, v18);
        if ((objc_msgSend(v16, "isDisqualified") & 1) == 0)
        {
          if (!v13 || (objc_msgSend(v16, "score"), v20 = v19, objc_msgSend(v13, "score"), v20 < v21))
          {
            v22 = v16;
            v23 = v13;
            v24 = v12;
            v25 = v14;
            v26 = a3;
            v27 = a4;
            v28 = v5;
            v29 = v22;

            v30 = v29;
            v5 = v28;
            a4 = v27;
            a3 = v26;
            v14 = v25;
            v12 = v24;
            v13 = v30;
          }
        }
        free(v17);
        free(v18);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (double)confidence
{
  double result;

  result = 1.0 - self->_score;
  if (result < 0.0)
    return 0.0;
  return result;
}

- (double)fitDataWithModelParams:(double *)a3 finalParams:(double *)a4
{
  int v7;
  double v8;
  size_t v9;
  double *v10;
  double *v11;
  void *v12;
  double *v13;
  double *v14;
  uint64_t n;
  double v16;
  double *v17;
  double v18;
  double v19;
  int v20;
  uint64_t v21;
  double *v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v31;
  void *v32;
  void *v33;
  double *v34;
  void *v35;
  void *v36;
  uint64_t __n;
  void *v38;
  void *v39;
  void *v40;
  double *v41;
  double *v42;
  double *v43;
  double *__C;
  double *v45;
  double *v46;
  double *v47;
  double __B[2];

  if (-[AXMDataRegressionModel dataSatisfiesInitialConditions](self, "dataSatisfiesInitialConditions"))
  {
    v34 = a4;
    v7 = -[AXMDataRegressionModel modelParameterCount](self, "modelParameterCount");
    __B[0] = 1.0;
    v46 = (double *)malloc_type_malloc(8 * self->_n * v7, 0x100004000313F17uLL);
    v47 = (double *)malloc_type_malloc(8 * self->_n * v7, 0x100004000313F17uLL);
    v8 = (double)v7 * (double)v7;
    v9 = vcvtd_n_u64_f64(v8, 3uLL);
    v10 = (double *)malloc_type_malloc(v9, 0x2864E889uLL);
    v45 = (double *)malloc_type_malloc(v9, 0x9E50E3DDuLL);
    __C = (double *)malloc_type_malloc(v9, 0x7DDD9EADuLL);
    v33 = malloc_type_malloc(v9, 0x2BEA48D2uLL);
    v32 = malloc_type_malloc(8 * self->_n * v7, 0x100004000313F17uLL);
    v43 = (double *)malloc_type_malloc(8 * v7 * self->_n, 0x84E3ADDEuLL);
    v31 = malloc_type_malloc(v9, 0x7D016862uLL);
    v42 = (double *)malloc_type_malloc(v9, 0xD8EDABDFuLL);
    v11 = (double *)malloc_type_malloc(v9, 0xF915A36CuLL);
    v12 = malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
    v13 = (double *)malloc_type_malloc(8 * self->_n, 0x100004000313F17uLL);
    v36 = malloc_type_malloc(8 * self->_n, 0x100004000313F17uLL);
    v40 = malloc_type_malloc(4 * self->_n, 0x100004052888210uLL);
    v39 = malloc_type_malloc(8 * self->_n, 0x100004000313F17uLL);
    v38 = malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
    v35 = malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
    v14 = (double *)malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
    __n = 8 * v7;
    memcpy(v12, a3, __n);
    -[AXMDataRegressionModel getResidualsVector:result:](self, "getResidualsVector:result:", v12, v13);
    n = self->_n;
    if ((int)n < 1)
    {
      v19 = 0.0;
    }
    else
    {
      v16 = 0.0;
      v17 = v13;
      do
      {
        v18 = *v17++;
        v16 = v16 + v18 * v18;
        --n;
      }
      while (n);
      v19 = v16 * 0.5;
    }
    v41 = v13;
    v20 = 0;
    while (1)
    {
      -[AXMDataRegressionModel getJacobianForParameters:gradient:result:](self, "getJacobianForParameters:gradient:result:", v12, v38, v46);
      vDSP_mtransD(v46, 1, v47, 1, v7, self->_n);
      vDSP_mmulD(v47, 1, v46, 1, v10, 1, v7, v7, self->_n);
      -[AXMDataRegressionModel getDiagonal:size:result:](self, "getDiagonal:size:result:", v10, v7, v45);
      vDSP_vsmulD(v45, 1, __B, __C, 1, (unint64_t)v8);
      vDSP_vaddD(v10, 1, __C, 1, v42, 1, (unint64_t)v8);
      -[AXMDataRegressionModel getMatrixInverse:size:pivot:tmp:result:](self, "getMatrixInverse:size:pivot:tmp:result:", v42, v7, v40, v39, v11);
      if (v8 > 0.0)
      {
        v21 = 0;
        do
        {
          v11[v21] = -v11[v21];
          ++v21;
        }
        while (v8 > (double)(int)v21);
      }
      vDSP_mmulD(v11, 1, v47, 1, v43, 1, v7, self->_n, v7);
      v22 = v41;
      vDSP_mmulD(v43, 1, v41, 1, v14, 1, v7, 1uLL, self->_n);
      -[AXMDataRegressionModel magnitude:size:](self, "magnitude:size:", v14, v7);
      v24 = v23;
      vDSP_vaddD((const double *)v12, 1, v14, 1, (double *)v12, 1, v7);
      -[AXMDataRegressionModel getResidualsVector:result:](self, "getResidualsVector:result:", v12, v41);
      v25 = self->_n;
      v26 = 0.0;
      if ((int)v25 >= 1)
      {
        do
        {
          v27 = *v22++;
          v26 = v26 + v27 * v27;
          --v25;
        }
        while (v25);
      }
      v28 = sqrt(v24);
      if (v28 > 0.05 || (v29 = v26 * 0.5, v26 * 0.5 >= v19))
      {
        if (v28 > 0.05)
          __B[0] = __B[0] * 10.0;
      }
      else
      {
        vDSP_vaddD((const double *)v12, 1, v14, 1, (double *)v12, 1, v7);
        __B[0] = __B[0] / 10.0;
        v19 = v29;
      }
      if (v28 <= 0.05 && v28 < 0.0000001)
        break;
      self->_error = v19;
      -[AXMDataRegressionModel computeScore](self, "computeScore");
      if (++v20 == 15000)
      {
        v20 = 15000;
        break;
      }
    }
    -[AXMDataRegressionModel disqualifyModelIfNecessary](self, "disqualifyModelIfNecessary");
    memcpy(v34, v12, __n);
    memcpy(self->_bestFitParameters, v12, __n);
    free(v46);
    free(v47);
    free(v10);
    free(v45);
    free(__C);
    free(v33);
    free(v32);
    free(v43);
    free(v31);
    free(v42);
    free(v11);
    free(v12);
    free(v41);
    free(v36);
    free(v40);
    free(v39);
    free(v38);
    free(v35);
    free(v14);
    self->_iterations = v20;
  }
  else
  {
    self->_error = 1.79769313e308;
    -[AXMDataRegressionModel computeScore](self, "computeScore");
    return self->_error;
  }
  return v19;
}

- (void)printMatrix:(double *)a3 rows:(int)a4 cols:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  double *v10;
  uint64_t v11;
  id v12;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendFormat:", CFSTR("\n%d x %d\n"), v6, v5);
  if ((int)v6 >= 1)
  {
    v8 = 0;
    do
    {
      v9 = v5;
      v10 = a3;
      if ((int)v5 >= 1)
      {
        do
        {
          v11 = *(_QWORD *)v10++;
          objc_msgSend(v12, "appendFormat:", CFSTR("\t%.6f"), v11);
          --v9;
        }
        while (v9);
      }
      objc_msgSend(v12, "appendString:", CFSTR("\n"));
      ++v8;
      a3 += v6;
    }
    while (v8 != v6);
  }
  NSLog(CFSTR("%@"), v12);

}

- (double)magnitude:(double *)a3 size:(int)a4
{
  uint64_t v4;
  double result;
  double v6;

  if (a4 < 1)
    return 0.0;
  v4 = a4;
  result = 0.0;
  do
  {
    v6 = *a3++;
    result = result + v6 * v6;
    --v4;
  }
  while (v4);
  return result;
}

- (void)getIdentityMatrixWithSize:(int)a3 scalar:(double)a4 result:(double *)a5
{
  uint64_t v5;
  uint64_t v6;
  double v7;

  if (a3)
  {
    v5 = 0;
    LODWORD(v6) = a3 * a3;
    if ((a3 * a3) <= 1)
      v6 = 1;
    else
      v6 = v6;
    do
    {
      if ((int)v5 / a3 == (int)v5 % a3)
        v7 = a4;
      else
        v7 = 0.0;
      a5[v5++] = v7;
    }
    while (v6 != v5);
  }
}

- (void)getResidualsVector:(double *)a3 result:(double *)a4
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  double (**v10)(id, double *, _QWORD, double);

  -[AXMDataRegressionModel modelFunction](self, "modelFunction");
  v10 = (double (**)(id, double *, _QWORD, double))objc_claimAutoreleasedReturnValue();
  v7 = -[AXMDataRegressionModel modelParameterCount](self, "modelParameterCount");
  if (self->_n >= 1)
  {
    v8 = 0;
    v9 = v7;
    do
    {
      a4[v8] = v10[2](v10, a3, v9, self->_x[v8]) - self->_y[v8];
      ++v8;
    }
    while (v8 < self->_n);
  }

}

- (void)getGradientForX:(double)a3 parameterValues:(double *)a4 result:(double *)a5
{
  int v9;
  unint64_t v10;
  double (**v11)(_QWORD, _QWORD, _QWORD, double);
  id v12;

  v9 = -[AXMDataRegressionModel modelParameterCount](self, "modelParameterCount");
  -[AXMDataRegressionModel partialDerivatives](self, "partialDerivatives");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    v10 = 0;
    do
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", v10);
      v11 = (double (**)(_QWORD, _QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
      a5[v10] = ((double (**)(_QWORD, double *, _QWORD, double))v11)[2](v11, a4, v9, a3);

      ++v10;
    }
    while (v10 < objc_msgSend(v12, "count"));
  }

}

- (void)getJacobianForParameters:(double *)a3 gradient:(double *)a4 result:(double *)a5
{
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double *v15;
  double *v16;
  uint64_t v17;

  v9 = -[AXMDataRegressionModel modelParameterCount](self, "modelParameterCount");
  if (self->_n >= 1)
  {
    v10 = v9;
    v11 = 0;
    v12 = 8 * v9;
    v13 = v9;
    do
    {
      -[AXMDataRegressionModel getGradientForX:parameterValues:result:](self, "getGradientForX:parameterValues:result:", a3, a4, self->_x[v11]);
      v14 = v13;
      v15 = a4;
      v16 = a5;
      if (v10 >= 1)
      {
        do
        {
          v17 = *(_QWORD *)v15++;
          *(_QWORD *)v16++ = v17;
          --v14;
        }
        while (v14);
      }
      ++v11;
      a5 = (double *)((char *)a5 + v12);
    }
    while (v11 < self->_n);
  }
}

- (int)getMatrixInverse:(double *)a3 size:(int)a4 pivot:(int *)a5 tmp:(double *)a6 result:(double *)a7
{
  memcpy(a7, a3, 8 * a4 * (uint64_t)a4);
  dgetrf_NEWLAPACK();
  dgetri_NEWLAPACK();
  return 0;
}

- (void)getDiagonal:(double *)a3 size:(int)a4 result:(double *)a5
{
  uint64_t i;
  uint64_t j;
  double v7;

  if (a4 >= 1)
  {
    for (i = 0; i != a4; ++i)
    {
      for (j = 0; j != a4; a5[j++] = v7)
      {
        v7 = 0.0;
        if (i == j)
          v7 = a3[i + i * a4];
      }
      a5 += a4;
    }
  }
}

- (void)computeScore
{
  uint64_t n;
  double *y;
  double v4;
  double *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  n = self->_n;
  if ((int)n < 1)
  {
    v11 = 0.0;
  }
  else
  {
    y = self->_y;
    v4 = 0.0;
    v5 = y;
    v6 = self->_n;
    do
    {
      v7 = *v5++;
      v4 = v4 + v7;
      --v6;
    }
    while (v6);
    v8 = v4 / (double)(int)n;
    v9 = 0.0;
    do
    {
      v10 = *y++;
      v9 = v9 + (v10 - v8) * (v10 - v8);
      --n;
    }
    while (n);
    v11 = v9 * 0.5;
  }
  self->_score = self->_error / v11;
}

- (id)modelFunction
{
  void *v2;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Subclasses must override %@"), v2);

  return 0;
}

- (int)modelParameterCount
{
  void *v2;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Subclasses must override %@"), v2);

  return 0;
}

- (void)getInitialParams:(double *)a3
{
  int v4;

  v4 = -[AXMDataRegressionModel modelParameterCount](self, "modelParameterCount");
  if (v4 >= 1)
    memset_pattern16(a3, &xmmword_1B0EFFF40, 8 * v4);
}

- (NSArray)partialDerivatives
{
  void *v2;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Subclasses must override %@"), v2);

  return 0;
}

- (id)modelFunctionStringForParameters:(double *)a3 significantFigures:(int)a4
{
  void *v4;

  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Subclasses must override %@"), v4);

  return 0;
}

- (BOOL)dataSatisfiesInitialConditions
{
  return self->_n > 0;
}

- (void)sortDataPoints
{
  uint64_t v3;
  AXMPoint *v4;
  uint64_t v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_n >= 1)
  {
    v3 = 0;
    do
    {
      v4 = objc_alloc_init(AXMPoint);
      -[AXMPoint setX:](v4, "setX:", self->_x[v3]);
      -[AXMPoint setY:](v4, "setY:", self->_y[v3]);
      objc_msgSend(v10, "addObject:", v4);

      ++v3;
    }
    while (v3 < self->_n);
  }
  objc_msgSend(v10, "sortUsingComparator:", &__block_literal_global_32);
  if (self->_n >= 1)
  {
    v5 = 0;
    do
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "x");
      self->_x[v5] = v7;

      objc_msgSend(v10, "objectAtIndexedSubscript:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "y");
      self->_y[v5] = v9;

      ++v5;
    }
    while (v5 < self->_n);
  }

}

uint64_t __40__AXMDataRegressionModel_sortDataPoints__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "x");
  v7 = v6;
  objc_msgSend(v5, "x");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "x");
    v11 = v10;
    objc_msgSend(v5, "x");
    v9 = v11 > v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (void)getSMA:(double *)a3 lookback:(int)a4
{
  uint64_t n;
  uint64_t i;
  int v6;
  double v7;
  int v8;

  n = self->_n;
  if ((int)n >= 1)
  {
    for (i = 0; i != n; ++i)
    {
      if (a4 < 1)
      {
        v7 = 0.0;
LABEL_9:
        v8 = a4;
      }
      else
      {
        v6 = 0;
        v7 = 0.0;
        while ((int)i + v6 >= 0)
        {
          v7 = v7 + self->_y[(i + v6--)];
          if ((int)i + v6 <= (int)i - a4)
            goto LABEL_9;
        }
        v8 = -v6;
      }
      a3[i] = v7 / (double)v8;
    }
  }
}

- (double)roundNumber:(double)a3 withSignificantFigures:(unint64_t)a4
{
  long double v5;
  double v6;
  double v7;
  double v8;
  double result;

  v5 = fabs(a3);
  v6 = floor(log10(v5)) - (double)a4 + 1.0;
  v7 = round(v5 * __exp10(-v6));
  v8 = __exp10(v6) * v7;
  result = -v8;
  if (a3 >= 0.0)
    return v8;
  return result;
}

- (double)x
{
  return self->_x;
}

- (double)y
{
  return self->_y;
}

- (double)bestFitParameters
{
  return self->_bestFitParameters;
}

- (int)n
{
  return self->_n;
}

- (double)error
{
  return self->_error;
}

- (double)score
{
  return self->_score;
}

- (BOOL)isDisqualified
{
  return self->_isDisqualified;
}

- (void)setIsDisqualified:(BOOL)a3
{
  self->_isDisqualified = a3;
}

- (int)iterations
{
  return self->_iterations;
}

@end
