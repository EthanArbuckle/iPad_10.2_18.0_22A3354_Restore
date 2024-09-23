@implementation EFLinearFunction

- (EFLinearFunction)initWithSlope:(double)a3 intercept:(double)a4
{
  EFLinearFunction *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EFLinearFunction;
  result = -[EFLinearFunction init](&v7, sel_init);
  if (result)
  {
    result->_slope = a3;
    result->_intercept = a4;
  }
  return result;
}

- (EFLinearFunction)initWithLineThroughPoints:(id)a3
{
  id v4;
  EFLinearFunction *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    v6 = objc_msgSend(v4, "count");
    objc_msgSend(v4, "objectAtIndexedSubscript:", v6 - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", v6 - 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "first");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;
    objc_msgSend(v8, "first");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    objc_msgSend(v7, "second");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;
    objc_msgSend(v8, "second");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v19;

    objc_msgSend(v8, "second");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v22;
    objc_msgSend(v8, "first");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    v25 = (v17 - v20) / (v11 - v14);
    v27 = v23 - v26 * v25;

    self = -[EFLinearFunction initWithSlope:intercept:](self, "initWithSlope:intercept:", v25, v27);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)evaluateX:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[EFLinearFunction slope](self, "slope");
  v6 = v5;
  -[EFLinearFunction intercept](self, "intercept");
  return v7 + v6 * a3;
}

- (double)evaluateReverse:(double)a3
{
  double v5;
  double v6;
  double v7;
  BOOL v8;
  double result;
  double v10;
  double v11;

  -[EFLinearFunction slope](self, "slope");
  v6 = v5;
  -[EFLinearFunction intercept](self, "intercept");
  if (v6 == 0.0)
  {
    v8 = v7 == a3;
    result = NAN;
    if (v8)
      return 0.0;
  }
  else
  {
    v10 = a3 - v7;
    -[EFLinearFunction slope](self, "slope");
    return v10 / v11;
  }
  return result;
}

- (double)slope
{
  return self->_slope;
}

- (void)setSlope:(double)a3
{
  self->_slope = a3;
}

- (double)intercept
{
  return self->_intercept;
}

- (void)setIntercept:(double)a3
{
  self->_intercept = a3;
}

@end
