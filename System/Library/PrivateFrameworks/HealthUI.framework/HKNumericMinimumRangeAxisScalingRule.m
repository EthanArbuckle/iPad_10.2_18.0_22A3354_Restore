@implementation HKNumericMinimumRangeAxisScalingRule

+ (id)ruleWithDefaultYAxisRange:(double)a3 minimumValue:(id)a4 maximumValue:(id)a5 axisRangeOverrides:(id)a6 noDataAxisBounds:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  double *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = (double *)objc_alloc_init((Class)objc_opt_class());
  v15[1] = a3;
  v16 = (void *)*((_QWORD *)v15 + 2);
  *((_QWORD *)v15 + 2) = v13;
  v17 = v13;

  v18 = (void *)*((_QWORD *)v15 + 5);
  *((_QWORD *)v15 + 5) = v11;
  v19 = v11;

  v20 = (void *)*((_QWORD *)v15 + 6);
  *((_QWORD *)v15 + 6) = v12;
  v21 = v12;

  objc_msgSend(v15, "setNoDataAxisBounds:", v14);
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v19, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setAxisBounds:", v22);
  return v15;
}

- (void)setNoDataAxisBounds:(id)a3
{
  objc_storeStrong((id *)&self->_noDataAxisBounds, a3);
}

+ (id)ruleWithDefaultYAxisRange:(double)a3 axisRangeOverrides:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "ruleWithDefaultYAxisRange:minimumValue:maximumValue:axisRangeOverrides:noDataAxisBounds:", 0, 0, v5, 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)ruleWithDefaultYAxisRange:(double)a3 minimumValue:(id)a4 maximumValue:(id)a5 axisRangeOverrides:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  objc_msgSend((id)objc_opt_class(), "ruleWithDefaultYAxisRange:minimumValue:maximumValue:axisRangeOverrides:noDataAxisBounds:", v11, v10, v9, 0, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %lf (%@ -> %@) Overrides: %@, No Data: %@>"), v5, *(_QWORD *)&self->super._defaultYAxisRange, self->_minimumValue, self->_maximumValue, self->super._axisRangeOverrides, self->_noDataAxisBounds);
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
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
}

@end
