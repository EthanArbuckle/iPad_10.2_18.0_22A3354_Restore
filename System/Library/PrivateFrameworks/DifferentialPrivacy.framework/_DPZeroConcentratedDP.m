@implementation _DPZeroConcentratedDP

- (_DPZeroConcentratedDP)initWithRho:(double)a3 error:(id *)a4
{
  _DPZeroConcentratedDP *v5;
  _BOOL4 v7;
  _BOOL4 v8;
  int v9;
  void *v10;
  NSObject *v11;
  _DPZeroConcentratedDP *v12;
  _DPZeroConcentratedDP *v13;
  objc_super v15;

  v5 = self;
  v7 = (*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 1 < 0xFFFFFFFFFFFFFLL;
  v8 = a3 < 0.0 && ((*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF;
  if (a3 >= 0.0)
    v7 = 0;
  v9 = (*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000 || v7;
  if ((v9 | v8) == 1)
  {
    _DPPrivacyBudgetError(1, CFSTR("Zero Concentrated-DP rho must be finite, and not NAN, and at least 0."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DPLog framework](_DPLog, "framework");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[_DPDediscoError logAndStoreInError:].cold.1((uint64_t)v10, v11);

    if (a4)
      *a4 = objc_retainAutorelease(v10);

    v12 = 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)_DPZeroConcentratedDP;
    v13 = -[_DPZeroConcentratedDP init](&v15, sel_init);
    if (v13)
      v13->_rho = a3;
    v5 = v13;
    v12 = v5;
  }

  return v12;
}

- (id)approximateDPForEpsilon:(double)a3 error:(id *)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _DPApproximateDP *v20;
  double v22;

  if (+[_DPApproximateDP isValidEpsilon:error:](_DPApproximateDP, "isValidEpsilon:error:"))
  {
    -[_DPZeroConcentratedDP rho](self, "rho");
    v7 = 0.0;
    if (v8 != 0.0)
    {
      -[_DPZeroConcentratedDP rho](self, "rho");
      v10 = (a3 + 1.0) / (v9 + v9) + 2.0;
      v22 = a3;
      v11 = -a3;
      v12 = 1.01;
      v13 = 1000;
      do
      {
        v14 = v12 + (v10 - v12) * 0.5;
        -[_DPZeroConcentratedDP rho](self, "rho");
        v16 = v11 + (v14 * 2.0 + -1.0) * v15;
        v17 = log1p(-1.0 / v14);
        if (v16 + v17 >= 0.0)
          v10 = v12 + (v10 - v12) * 0.5;
        else
          v12 = v12 + (v10 - v12) * 0.5;
        --v13;
      }
      while (v13);
      -[_DPZeroConcentratedDP rho](self, "rho");
      v19 = exp(v14 * v17 + (v14 + -1.0) * (v11 + v14 * v18)) / (v14 + -1.0);
      if (v19 <= 1.0)
        v7 = v19;
      else
        v7 = 1.0;
      a3 = v22;
    }
    v20 = -[_DPApproximateDP initWithEpsilon:delta:error:]([_DPApproximateDP alloc], "initWithEpsilon:delta:error:", a4, a3, v7);
  }
  else
  {
    v20 = 0;
  }
  return v20;
}

- (double)rho
{
  return self->_rho;
}

@end
