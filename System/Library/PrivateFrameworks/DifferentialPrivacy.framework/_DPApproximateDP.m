@implementation _DPApproximateDP

- (_DPApproximateDP)initWithEpsilon:(double)a3 delta:(double)a4 error:(id *)a5
{
  _DPApproximateDP *v9;
  _DPApproximateDP *v10;
  objc_super v12;

  if (+[_DPApproximateDP isValidEpsilon:error:](_DPApproximateDP, "isValidEpsilon:error:")
    && +[_DPApproximateDP isValidDelta:error:](_DPApproximateDP, "isValidDelta:error:", a5, a4))
  {
    v12.receiver = self;
    v12.super_class = (Class)_DPApproximateDP;
    v9 = -[_DPApproximateDP init](&v12, sel_init);
    if (v9)
    {
      v9->_epsilon = a3;
      v9->_delta = a4;
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)exceed:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;

  v4 = a3;
  -[_DPApproximateDP epsilon](self, "epsilon");
  v6 = v5;
  objc_msgSend(v4, "epsilon");
  if (v6 - v7 <= 0.00000001)
  {
    -[_DPApproximateDP delta](self, "delta");
    v10 = v9;
    objc_msgSend(v4, "delta");
    v8 = v10 - v11 > 1.0e-20;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (BOOL)isValidEpsilon:(double)a3 error:(id *)a4
{
  _BOOL4 v5;
  _BOOL4 v6;
  int v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = (*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 1 < 0xFFFFFFFFFFFFFLL;
  v6 = a3 < 0.0 && ((*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF;
  if (a3 >= 0.0)
    v5 = 0;
  v7 = (*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000 || v5;
  if ((v7 | v6) != 1)
    return 1;
  _DPPrivacyBudgetError(1, CFSTR("Approximate-DP epsilon must be finite, not NAN, and at least 0.0."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DPLog framework](_DPLog, "framework");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[_DPSemanticVersion initWithString:error:].cold.1((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);

  if (a4)
    *a4 = objc_retainAutorelease(v8);

  return 0;
}

+ (BOOL)isValidDelta:(double)a3 error:(id *)a4
{
  BOOL v4;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3 <= 1.0 && a3 >= 0.0;
  if (!v4)
  {
    _DPPrivacyBudgetError(1, CFSTR("Approximate-DP delta must be not NAN, at least 0.0, and at most 1.0."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DPLog framework](_DPLog, "framework");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_DPSemanticVersion initWithString:error:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    if (a4)
      *a4 = objc_retainAutorelease(v6);

  }
  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_DPApproximateDP epsilon](self, "epsilon");
  v5 = v4;
  -[_DPApproximateDP delta](self, "delta");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("(%f, %f)-ADP"), v5, v6);
}

- (double)epsilon
{
  return self->_epsilon;
}

- (double)delta
{
  return self->_delta;
}

@end
