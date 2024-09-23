@implementation HKQuantityMinimumRangeAxisScalingRule

+ (id)ruleWithDefaultYAxisRange:(id)a3 minimumValue:(id)a4 maximumValue:(id)a5 axisRangeOverrides:(id)a6 noDataAxisBounds:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;

  v25 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v16 + 5, a3);
  objc_storeStrong(v16 + 9, a6);
  objc_storeStrong(v16 + 6, a4);
  objc_storeStrong(v16 + 7, a5);
  if (!v12)
  {
    v19 = 0;
    if (v13)
      goto LABEL_3;
LABEL_5:
    v22 = 0;
    goto LABEL_6;
  }
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v12, "_unit");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValueForUnit:", v18);
  objc_msgSend(v17, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_5;
LABEL_3:
  v20 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v13, "_unit");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValueForUnit:", v21);
  objc_msgSend(v20, "numberWithDouble:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v19, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAxisBounds:", v23);

  objc_msgSend(v16, "setNoDataAxisBounds:", v15);
  return v16;
}

- (void)setNoDataAxisBounds:(id)a3
{
  objc_storeStrong((id *)&self->_noDataAxisBounds, a3);
}

+ (id)ruleWithDefaultYAxisRange:(id)a3 axisRangeOverrides:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "ruleWithDefaultYAxisRange:minimumValue:maximumValue:axisRangeOverrides:noDataAxisBounds:", v6, 0, 0, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)ruleWithDefaultYAxisRange:(id)a3 minimumValue:(id)a4 maximumValue:(id)a5 axisRangeOverrides:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "ruleWithDefaultYAxisRange:minimumValue:maximumValue:axisRangeOverrides:noDataAxisBounds:", v12, v11, v10, v9, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)ruleWithDefaultYAxisRange:(id)a3 anchorValue:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)objc_opt_class());
  v8 = (void *)v7[5];
  v7[5] = v5;
  v9 = v5;

  v10 = (void *)v7[8];
  v7[8] = v6;

  objc_msgSend(v7, "setAxisBounds:", 0);
  return v7;
}

- (void)setUnit:(id)a3
{
  objc_storeStrong((id *)&self->_unit, a3);
  -[HKQuantityMinimumRangeAxisScalingRule _convertQuantities](self, "_convertQuantities");
}

- (BOOL)isCompatibleWithQuantityType:(id)a3
{
  HKQuantity *defaultYAxisRangeQuantity;
  id v4;
  void *v5;
  char v6;

  defaultYAxisRangeQuantity = self->_defaultYAxisRangeQuantity;
  v4 = a3;
  -[HKQuantity _unit](defaultYAxisRangeQuantity, "_unit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isCompatibleWithUnit:", v5);

  return v6;
}

- (void)_convertQuantities
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  NSDictionary *axisRangeQuantityOverrides;
  NSDictionary *v12;
  NSDictionary *axisRangeOverrides;
  NSDictionary *v14;
  HKQuantity *minimumQuantity;
  void *v16;
  HKQuantity *maximumQuantity;
  void *v18;
  void *v19;
  void *v20;
  HKQuantity *anchorQuantity;
  void *v22;
  NSNumber *v23;
  NSNumber *anchorValue;
  id v25;
  _QWORD v26[4];
  NSDictionary *v27;
  HKQuantityMinimumRangeAxisScalingRule *v28;

  -[HKQuantity doubleValueForUnit:](self->_defaultYAxisRangeQuantity, "doubleValueForUnit:", self->_unit);
  v4 = v3;
  v5 = (void *)MEMORY[0x1E0CB6A28];
  -[HKQuantity _unit](self->_defaultYAxisRangeQuantity, "_unit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantityWithUnit:doubleValue:", v6, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", self->_unit);
  v9 = v8;

  self->super._defaultYAxisRange = v4 - v9;
  if (self->_axisRangeQuantityOverrides)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    axisRangeQuantityOverrides = self->_axisRangeQuantityOverrides;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __59__HKQuantityMinimumRangeAxisScalingRule__convertQuantities__block_invoke;
    v26[3] = &unk_1E9C45580;
    v12 = (NSDictionary *)v10;
    v27 = v12;
    v28 = self;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](axisRangeQuantityOverrides, "enumerateKeysAndObjectsUsingBlock:", v26);
    axisRangeOverrides = self->super._axisRangeOverrides;
    self->super._axisRangeOverrides = v12;
    v14 = v12;

  }
  else
  {
    v14 = self->super._axisRangeOverrides;
    self->super._axisRangeOverrides = 0;
  }

  minimumQuantity = self->_minimumQuantity;
  if (minimumQuantity)
  {
    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[HKQuantity doubleValueForUnit:](minimumQuantity, "doubleValueForUnit:", self->_unit);
    objc_msgSend(v16, "numberWithDouble:");
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }
  maximumQuantity = self->_maximumQuantity;
  if (maximumQuantity)
  {
    v18 = (void *)MEMORY[0x1E0CB37E8];
    -[HKQuantity doubleValueForUnit:](maximumQuantity, "doubleValueForUnit:", self->_unit);
    objc_msgSend(v18, "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v25, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAbstractMinimumRangeScalingRule setAxisBounds:](self, "setAxisBounds:", v20);

  anchorQuantity = self->_anchorQuantity;
  if (anchorQuantity)
  {
    v22 = (void *)MEMORY[0x1E0CB37E8];
    -[HKQuantity doubleValueForUnit:](anchorQuantity, "doubleValueForUnit:", self->_unit);
    objc_msgSend(v22, "numberWithDouble:");
    v23 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    anchorValue = self->super._anchorValue;
    self->super._anchorValue = v23;

  }
}

void __59__HKQuantityMinimumRangeAxisScalingRule__convertQuantities__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88);
  v7 = a2;
  objc_msgSend(a3, "doubleValueForUnit:", v6);
  objc_msgSend(v5, "numberWithDouble:");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

}

- (id)noDataStartingRange
{
  HKValueRange *noDataAxisBounds;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  noDataAxisBounds = self->_noDataAxisBounds;
  if (noDataAxisBounds)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[HKValueRange minValue](noDataAxisBounds, "minValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValueForUnit:", self->_unit);
    objc_msgSend(v4, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[HKValueRange maxValue](self->_noDataAxisBounds, "maxValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValueForUnit:", self->_unit);
    objc_msgSend(v7, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@ (%@ -> %@) Overrides: %@, No Data: %@>"), v5, self->_defaultYAxisRangeQuantity, self->_minimumQuantity, self->_maximumQuantity, self->_axisRangeQuantityOverrides, self->_noDataAxisBounds);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HKValueRange)noDataAxisBounds
{
  return self->_noDataAxisBounds;
}

- (HKUnit)unit
{
  return self->_unit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_noDataAxisBounds, 0);
  objc_storeStrong((id *)&self->_axisRangeQuantityOverrides, 0);
  objc_storeStrong((id *)&self->_anchorQuantity, 0);
  objc_storeStrong((id *)&self->_maximumQuantity, 0);
  objc_storeStrong((id *)&self->_minimumQuantity, 0);
  objc_storeStrong((id *)&self->_defaultYAxisRangeQuantity, 0);
}

@end
