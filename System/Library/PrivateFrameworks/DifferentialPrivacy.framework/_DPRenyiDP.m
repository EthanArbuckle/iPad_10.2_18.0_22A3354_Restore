@implementation _DPRenyiDP

- (_DPRenyiDP)initWithAlpha:(double)a3 tau:(double)a4 error:(id *)a5
{
  double v9;
  void *v10;
  NSObject *v11;
  _DPRenyiDP *v12;
  _DPRenyiDP *v13;
  objc_super v15;

  if (!+[_DPRenyiDP isValidAlpha:error:](_DPRenyiDP, "isValidAlpha:error:"))
  {
LABEL_9:
    v12 = 0;
    goto LABEL_13;
  }
  v9 = fabs(a4);
  if (v9 >= INFINITY && v9 <= INFINITY)
  {
    _DPPrivacyBudgetError(1, CFSTR("Renyi-DP tau must be finite, and not NAN."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DPLog framework](_DPLog, "framework");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:].cold.2();

    if (a5)
      *a5 = objc_retainAutorelease(v10);

    goto LABEL_9;
  }
  v15.receiver = self;
  v15.super_class = (Class)_DPRenyiDP;
  v13 = -[_DPRenyiDP init](&v15, sel_init);
  if (v13)
  {
    v13->_alpha = a3;
    v13->_tau = a4;
  }
  self = v13;
  v12 = self;
LABEL_13:

  return v12;
}

- (id)approximateDPForDelta:(double)a3 error:(id *)a4
{
  _DPApproximateDP *v7;
  NSObject *v8;
  _DPApproximateDP *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  long double v16;
  long double v17;
  long double v18;
  double v19;
  _DPApproximateDP *v20;
  void *v21;
  NSObject *v22;

  if (+[_DPApproximateDP isValidDelta:error:](_DPApproximateDP, "isValidDelta:error:"))
  {
    if (a3 == 0.0)
    {
      _DPPrivacyBudgetError(1, CFSTR("Approximate-DP delta cannot be 0 when converting Renyi-DP to approximate-DP."));
      v7 = (_DPApproximateDP *)objc_claimAutoreleasedReturnValue();
      +[_DPLog framework](_DPLog, "framework");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:].cold.2();

      if (a4)
      {
        v7 = objc_retainAutorelease(v7);
        v9 = 0;
        *a4 = v7;
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      -[_DPRenyiDP tau](self, "tau");
      v11 = v10;
      v12 = log(1.0 / a3);
      -[_DPRenyiDP alpha](self, "alpha");
      v14 = v13 + -1.0;
      -[_DPRenyiDP alpha](self, "alpha");
      v16 = v12 + v14 * log(-1.0 / v15 + 1.0);
      -[_DPRenyiDP alpha](self, "alpha");
      v18 = v16 - log(v17);
      -[_DPRenyiDP alpha](self, "alpha");
      v20 = -[_DPApproximateDP initWithEpsilon:delta:error:]([_DPApproximateDP alloc], "initWithEpsilon:delta:error:", a4, (double)(v11 + v18 / (v19 + -1.0)), a3);
      v7 = v20;
      if (v20)
      {
        v7 = v20;
        v9 = v7;
      }
      else
      {
        _DPPrivacyBudgetError(3, CFSTR("Failed to convert Renyi-DP to approximate-DP. The converted epsilon is not a valid value."));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[_DPLog framework](_DPLog, "framework");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:].cold.2();

        if (a4)
          *a4 = objc_retainAutorelease(v21);

        v9 = 0;
      }
    }

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (BOOL)isValidAlpha:(double)a3 error:(id *)a4
{
  double v4;
  void *v7;
  NSObject *v8;

  v4 = fabs(a3);
  if (a3 > 1.0 && v4 != INFINITY)
    return 1;
  _DPPrivacyBudgetError(1, CFSTR("Renyi-DP alpha must be finite, not NAN, and greater than 1.0."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DPLog framework](_DPLog, "framework");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:].cold.2();

  if (a4)
    *a4 = objc_retainAutorelease(v7);

  return 0;
}

+ (id)defaultAlphas
{
  if (defaultAlphas_onceToken != -1)
    dispatch_once(&defaultAlphas_onceToken, &__block_literal_global_10);
  return (id)kDefaultAlphas;
}

- (double)alpha
{
  return self->_alpha;
}

- (double)tau
{
  return self->_tau;
}

@end
