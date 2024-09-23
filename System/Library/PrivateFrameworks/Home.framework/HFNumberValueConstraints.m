@implementation HFNumberValueConstraints

- (id)normalizedValueForValue:(id)a3
{
  void *v4;
  void *v5;

  -[HFNumberValueConstraints roundedValueForValue:](self, "roundedValueForValue:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFNumberValueConstraints boundedValueForValue:](self, "boundedValueForValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)roundedValueForValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[HFNumberValueConstraints stepValue](self, "stepValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HFNumberValueConstraints stepValue](self, "stepValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFNumberValueConstraints minValue](self, "minValue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (void *)v7;
    else
      v9 = &unk_1EA7CD270;
    objc_msgSend(v4, "na_valueRoundedToNearestStepValue:relativeToBaseValue:", v6, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v4;
  }

  return v10;
}

- (NSNumber)stepValue
{
  return self->_stepValue;
}

- (HFNumberValueConstraints)initWithMinValue:(id)a3 maxValue:(id)a4 stepValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  HFNumberValueConstraints *v11;
  id v12;
  void *v13;
  NSNumber *v14;
  NSNumber *minValue;
  id v16;
  void *v17;
  NSNumber *v18;
  NSNumber *maxValue;
  id v20;
  void *v21;
  NSNumber *v22;
  NSNumber *stepValue;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)HFNumberValueConstraints;
  v11 = -[HFNumberValueConstraints init](&v25, sel_init);
  if (v11)
  {
    objc_opt_class();
    v12 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    minValue = v11->_minValue;
    v11->_minValue = v14;

    objc_opt_class();
    v16 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v17;

    maxValue = v11->_maxValue;
    v11->_maxValue = v18;

    objc_opt_class();
    v20 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v22 = v21;

    stepValue = v11->_stepValue;
    v11->_stepValue = v22;

  }
  return v11;
}

- (id)boundedValueForValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  -[HFNumberValueConstraints minValue](self, "minValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v4;
  if (v5)
  {
    -[HFNumberValueConstraints minValue](self, "minValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_largerNumber:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[HFNumberValueConstraints maxValue](self, "maxValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HFNumberValueConstraints maxValue](self, "maxValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_smallerNumber:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }

  return v6;
}

- (NSNumber)minValue
{
  return self->_minValue;
}

- (NSNumber)maxValue
{
  return self->_maxValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_maxValue, 0);
  objc_storeStrong((id *)&self->_minValue, 0);
}

- (HFNumberValueConstraints)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithMinValue_maxValue_stepValue_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFNumberValueConstraints.m"), 17, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFNumberValueConstraints init]",
    v5);

  return 0;
}

- (HFNumberValueConstraints)initWithValidRange:(id)a3 stepValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HFNumberValueConstraints *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "minValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "maxValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HFNumberValueConstraints initWithMinValue:maxValue:stepValue:](self, "initWithMinValue:maxValue:stepValue:", v8, v9, v6);
  return v10;
}

- (HFNumberRange)validRange
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HFNumberValueConstraints minValue](self, "minValue");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[HFNumberValueConstraints maxValue](self, "maxValue"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    -[HFNumberValueConstraints maxValue](self, "maxValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFNumberValueConstraints minValue](self, "minValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFNumberRange rangeWithMaxValue:minValue:](HFNumberRange, "rangeWithMaxValue:minValue:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return (HFNumberRange *)v8;
}

- (id)normalizedRangeForRange:(id)a3
{
  void *v3;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = objc_msgSend(v5, "type");
  if (!v6)
  {
    objc_msgSend(v5, "midValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFNumberValueConstraints normalizedValueForValue:](self, "normalizedValueForValue:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFNumberRange valueWithValue:](HFNumberRange, "valueWithValue:", v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (v6 == 1)
  {
    objc_msgSend(v5, "maxValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFNumberValueConstraints normalizedValueForValue:](self, "normalizedValueForValue:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "minValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFNumberValueConstraints normalizedValueForValue:](self, "normalizedValueForValue:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFNumberRange rangeWithMaxValue:minValue:](HFNumberRange, "rangeWithMaxValue:minValue:", v8, v10);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
  }

  return v3;
}

- (id)percentageConstraints
{
  void *v3;
  void *v4;
  void *v5;

  -[HFNumberValueConstraints validRange](self, "validRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HFNumberValueConstraints validRange](self, "validRange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFNumberValueConstraints percentageConstraintsWithinRange:](self, "percentageConstraintsWithinRange:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)percentageConstraintsWithinRange:(id)a3
{
  id v4;
  HFNumberValueConstraints *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HFNumberValueConstraints *v12;

  v4 = a3;
  if (v4)
  {
    v5 = [HFNumberValueConstraints alloc];
    -[HFNumberValueConstraints minValue](self, "minValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFNumberValueConstraints _normalizeRangeValue:withinRange:](self, "_normalizeRangeValue:withinRange:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFNumberValueConstraints maxValue](self, "maxValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFNumberValueConstraints _normalizeRangeValue:withinRange:](self, "_normalizeRangeValue:withinRange:", v8, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFNumberValueConstraints stepValue](self, "stepValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFNumberValueConstraints _normalizeStepValue:withinRange:](self, "_normalizeStepValue:withinRange:", v10, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HFNumberValueConstraints initWithMinValue:maxValue:stepValue:](v5, "initWithMinValue:maxValue:stepValue:", v7, v9, v11);

  }
  else
  {
    NSLog(CFSTR("Cannot create percentage constraints without a provided range!"));
    v12 = 0;
  }

  return v12;
}

- (id)_normalizeStepValue:(id)a3 withinRange:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = v5;
  if (v5 && a4)
  {
    objc_msgSend(a4, "spanValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFNumberRange rangeWithMaxValue:minValue:](HFNumberRange, "rangeWithMaxValue:minValue:", v7, &unk_1EA7CD270);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "percentageValueForValue:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v5;
  }

  return v9;
}

- (id)_normalizeRangeValue:(id)a3 withinRange:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = v5;
  if (v5 && a4)
  {
    objc_msgSend(a4, "percentageValueForValue:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_311 != -1)
    dispatch_once(&_MergedGlobals_311, &__block_literal_global_13_15);
  return (NAIdentity *)(id)qword_1ED379CD0;
}

void __39__HFNumberValueConstraints_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_18_6);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_19_14);
  v3 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_20_8);
  objc_msgSend(v0, "build");
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)qword_1ED379CD0;
  qword_1ED379CD0 = v4;

}

uint64_t __39__HFNumberValueConstraints_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "minValue");
}

uint64_t __39__HFNumberValueConstraints_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "maxValue");
}

uint64_t __39__HFNumberValueConstraints_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stepValue");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFNumberValueConstraints minValue](self, "minValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v4, CFSTR("min"), 1);

  -[HFNumberValueConstraints maxValue](self, "maxValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v6, CFSTR("max"), 1);

  -[HFNumberValueConstraints stepValue](self, "stepValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v8, CFSTR("step"), 1);

  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

@end
