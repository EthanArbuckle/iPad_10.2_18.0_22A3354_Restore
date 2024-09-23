@implementation HKQuantityFixedAxisScalingRule

- (void)_convertQuantityRanges
{
  HKValueRange *v3;
  HKValueRange *defaultAxisBounds;
  HKQuantity *minimumQuantity;
  void *v6;
  NSNumber *v7;
  NSNumber *minimumValue;
  HKQuantity *maximumQuantity;
  void *v10;
  NSNumber *v11;
  NSNumber *maximumValue;
  id v13;
  NSDictionary *quantityBoundsOverrides;
  NSDictionary *v15;
  NSDictionary *axisBoundsOverrides;
  NSDictionary *v17;
  NSDictionary *v18;
  _QWORD v19[5];
  NSDictionary *v20;

  -[HKQuantityFixedAxisScalingRule _numberRangeFromQuantityRangeForUnit:quantityRange:](self, "_numberRangeFromQuantityRangeForUnit:quantityRange:", self->_unit, self->_defaultQuantityBounds);
  v3 = (HKValueRange *)objc_claimAutoreleasedReturnValue();
  defaultAxisBounds = self->super._defaultAxisBounds;
  self->super._defaultAxisBounds = v3;

  minimumQuantity = self->_minimumQuantity;
  if (minimumQuantity)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[HKQuantity doubleValueForUnit:](minimumQuantity, "doubleValueForUnit:", self->_unit);
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    minimumValue = self->super._minimumValue;
    self->super._minimumValue = v7;

  }
  maximumQuantity = self->_maximumQuantity;
  if (maximumQuantity)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[HKQuantity doubleValueForUnit:](maximumQuantity, "doubleValueForUnit:", self->_unit);
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    maximumValue = self->super._maximumValue;
    self->super._maximumValue = v11;

  }
  if (self->_quantityBoundsOverrides)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    quantityBoundsOverrides = self->_quantityBoundsOverrides;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __56__HKQuantityFixedAxisScalingRule__convertQuantityRanges__block_invoke;
    v19[3] = &unk_1E9C45558;
    v19[4] = self;
    v15 = (NSDictionary *)v13;
    v20 = v15;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](quantityBoundsOverrides, "enumerateKeysAndObjectsUsingBlock:", v19);
    axisBoundsOverrides = self->super._axisBoundsOverrides;
    self->super._axisBoundsOverrides = v15;
    v18 = v15;

  }
  else
  {
    v17 = self->super._axisBoundsOverrides;
    self->super._axisBoundsOverrides = 0;

  }
}

- (id)_numberRangeFromQuantityRangeForUnit:(id)a3 quantityRange:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;

  if (a4)
  {
    v5 = a4;
    v6 = a3;
    objc_msgSend(v5, "minValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "maxValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "doubleValueForUnit:", v6);
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "doubleValueForUnit:", v6);
    v13 = v12;

    objc_msgSend(v11, "numberWithDouble:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v10, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

+ (id)ruleWithDefaultAxisBounds:(id)a3 axisBoundsOverrides:(id)a4 minimumValue:(id)a5 maximumValue:(id)a6 noDataAxisBounds:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = objc_alloc_init((Class)objc_opt_class());
  v17 = (void *)v16[6];
  v16[6] = v11;
  v18 = v11;

  v19 = (void *)v16[7];
  v16[7] = v12;
  v20 = v12;

  v21 = (void *)v16[8];
  v16[8] = v13;
  v22 = v13;

  v23 = (void *)v16[9];
  v16[9] = v14;

  objc_msgSend(v16, "setNoDataAxisBounds:", v15);
  return v16;
}

- (void)setNoDataAxisBounds:(id)a3
{
  objc_storeStrong((id *)&self->_noDataAxisBounds, a3);
}

- (void)setUnit:(id)a3
{
  objc_storeStrong((id *)&self->_unit, a3);
  -[HKQuantityFixedAxisScalingRule _convertQuantityRanges](self, "_convertQuantityRanges");
}

+ (id)ruleWithDefaultAxisBounds:(id)a3 axisBoundsOverrides:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "ruleWithDefaultAxisBounds:axisBoundsOverrides:minimumValue:maximumValue:noDataAxisBounds:", v6, v5, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)ruleWithDefaultAxisBounds:(id)a3 axisBoundsOverrides:(id)a4 minimumValue:(id)a5 maximumValue:(id)a6
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
  objc_msgSend((id)objc_opt_class(), "ruleWithDefaultAxisBounds:axisBoundsOverrides:minimumValue:maximumValue:noDataAxisBounds:", v12, v11, v10, v9, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)ruleWithDefaultAxisBounds:(id)a3 noDataAxisBounds:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)objc_opt_class());
  v8 = (void *)v7[6];
  v7[6] = v5;

  objc_msgSend(v7, "setNoDataAxisBounds:", v6);
  return v7;
}

- (BOOL)isCompatibleWithQuantityType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  void *v11;

  v4 = a3;
  -[HKValueRange minValue](self->_defaultQuantityBounds, "minValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_unit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[HKValueRange maxValue](self->_defaultQuantityBounds, "maxValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_unit");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  if ((objc_msgSend(v4, "isCompatibleWithUnit:", v8) & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v4, "_unitForChangeInCanonicalUnit");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "_isCompatibleWithUnit:", v8);

  }
  return v10;
}

void __56__HKQuantityFixedAxisScalingRule__convertQuantityRanges__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = *(_QWORD **)(a1 + 32);
  v6 = v5[11];
  v7 = a2;
  objc_msgSend(v5, "_numberRangeFromQuantityRangeForUnit:quantityRange:", v6, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v7);

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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@ (%@ -> %@) Overrides: %@, No Data: %@>"), v5, self->_defaultQuantityBounds, self->_minimumQuantity, self->_maximumQuantity, self->_quantityBoundsOverrides, self->_noDataAxisBounds);
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
  objc_storeStrong((id *)&self->_maximumQuantity, 0);
  objc_storeStrong((id *)&self->_minimumQuantity, 0);
  objc_storeStrong((id *)&self->_quantityBoundsOverrides, 0);
  objc_storeStrong((id *)&self->_defaultQuantityBounds, 0);
}

@end
