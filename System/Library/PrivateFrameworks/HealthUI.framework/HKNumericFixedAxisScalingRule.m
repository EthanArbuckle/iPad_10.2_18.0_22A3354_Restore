@implementation HKNumericFixedAxisScalingRule

+ (id)ruleWithDefaultAxisBounds:(id)a3 axisBoundsOverrides:(id)a4 noDataAxisBounds:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  id v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init((Class)objc_opt_class());
  v11 = (void *)v10[1];
  v10[1] = v7;
  v12 = v7;

  v13 = (void *)v10[2];
  v10[2] = v8;

  objc_msgSend(v10, "setNoDataAxisBounds:", v9);
  return v10;
}

- (void)setNoDataAxisBounds:(id)a3
{
  objc_storeStrong((id *)&self->_noDataAxisBounds, a3);
}

+ (id)ruleWithDefaultAxisBounds:(id)a3 axisBoundsOverrides:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "ruleWithDefaultAxisBounds:axisBoundsOverrides:noDataAxisBounds:", v6, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)noDataStartingRange
{
  return self->_noDataAxisBounds;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@ (%@ -> %@) Overrides: %@, No Data: %@>"), v5, self->super._defaultAxisBounds, self->super._minimumValue, self->super._maximumValue, self->super._axisBoundsOverrides, self->_noDataAxisBounds);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HKValueRange)noDataAxisBounds
{
  return self->_noDataAxisBounds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noDataAxisBounds, 0);
}

@end
