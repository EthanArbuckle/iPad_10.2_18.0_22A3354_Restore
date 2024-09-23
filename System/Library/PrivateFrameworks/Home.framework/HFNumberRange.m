@implementation HFNumberRange

- (NSNumber)midValue
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  NSNumber *v9;

  if (-[HFNumberRange type](self, "type") == 1)
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    -[HFNumberRange maxValue](self, "maxValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValue");
    v6 = v5;
    -[HFNumberRange minValue](self, "minValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(v3, "numberWithDouble:", (v6 + v8) * 0.5);
    v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = self->_midValue;
  }
  return v9;
}

- (NSNumber)minValue
{
  NSNumber *v3;

  if (-[HFNumberRange type](self, "type") == 1)
  {
    v3 = self->_minValue;
  }
  else
  {
    -[HFNumberRange midValue](self, "midValue");
    v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSNumber)maxValue
{
  NSNumber *v3;

  if (-[HFNumberRange type](self, "type") == 1)
  {
    v3 = self->_maxValue;
  }
  else
  {
    -[HFNumberRange midValue](self, "midValue");
    v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minValue, 0);
  objc_storeStrong((id *)&self->_midValue, 0);
  objc_storeStrong((id *)&self->_maxValue, 0);
}

+ (id)valueWithValue:(id)a3
{
  id v3;
  HFNumberRange *v4;

  v3 = a3;
  v4 = -[HFNumberRange initWithType:]([HFNumberRange alloc], "initWithType:", 0);
  -[HFNumberRange setMidValue:](v4, "setMidValue:", v3);

  return v4;
}

- (void)setMidValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

+ (HFNumberRange)rangeWithMaxValue:(id)a3 minValue:(id)a4
{
  id v5;
  id v6;
  HFNumberRange *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HFNumberRange initWithType:]([HFNumberRange alloc], "initWithType:", 1);
  -[HFNumberRange setMaxValue:](v7, "setMaxValue:", v6);

  -[HFNumberRange setMinValue:](v7, "setMinValue:", v5);
  return v7;
}

- (HFNumberRange)initWithType:(unint64_t)a3
{
  HFNumberRange *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HFNumberRange;
  result = -[HFNumberRange init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (void)setMinValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setMaxValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

+ (HFNumberRange)rangeWithFloatRange:(id)a3
{
  double var0;
  void *v4;
  void *v5;
  void *v6;

  var0 = a3.var0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3.var1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", var0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFNumberRange rangeWithMaxValue:minValue:](HFNumberRange, "rangeWithMaxValue:minValue:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFNumberRange *)v6;
}

- (HFNumberRange)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithType_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFNumberRange.m"), 43, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFNumberRange init]",
    v5);

  return 0;
}

- (NSNumber)spanValue
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[HFNumberRange maxValue](self, "maxValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;
  -[HFNumberRange minValue](self, "minValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v3, "numberWithDouble:", v6 - v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v9;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)floatRangeValue
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[HFNumberRange minValue](self, "minValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;
  -[HFNumberRange maxValue](self, "maxValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  v9 = v5;
  v10 = v8;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (id)percentageValueForValue:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  if (!a3)
    return 0;
  v4 = a3;
  -[HFNumberRange minValue](self, "minValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  -[HFNumberRange maxValue](self, "maxValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "doubleValue");
  v13 = v12;

  objc_msgSend(v11, "numberWithDouble:", (v13 - v7) / (v10 - v7));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)mapValue:(id)a3 fromRange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;

  if (!a3)
    return 0;
  v6 = a4;
  v7 = a3;
  -[HFNumberRange minValue](self, "minValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  -[HFNumberRange maxValue](self, "maxValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  objc_msgSend(v6, "percentageValueForValue:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10 + v16 * (v13 - v10));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)unionRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[HFNumberRange maxValue](self, "maxValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maxValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_largerNumber:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFNumberRange minValue](self, "minValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "na_smallerNumber:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFNumberRange rangeWithMaxValue:minValue:](HFNumberRange, "rangeWithMaxValue:minValue:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)intersectRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[HFNumberRange maxValue](self, "maxValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maxValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_smallerNumber:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFNumberRange minValue](self, "minValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "na_largerNumber:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFNumberRange rangeWithMaxValue:minValue:](HFNumberRange, "rangeWithMaxValue:minValue:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_246 != -1)
    dispatch_once(&_MergedGlobals_246, &__block_literal_global_9_5);
  return (NAIdentity *)(id)qword_1ED379030;
}

void __28__HFNumberRange_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_14_3);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_15_2);
  v3 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_16_0);
  v4 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_17_2);
  objc_msgSend(v0, "build");
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = (void *)qword_1ED379030;
  qword_1ED379030 = v5;

}

uint64_t __28__HFNumberRange_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "type"));
}

uint64_t __28__HFNumberRange_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "minValue");
}

uint64_t __28__HFNumberRange_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "maxValue");
}

uint64_t __28__HFNumberRange_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "midValue");
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
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[HFNumberRange type](self, "type");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  if (v3 == 1)
  {
    -[HFNumberRange minValue](self, "minValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFNumberRange maxValue](self, "maxValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@:%p (%@-%@)>"), v5, self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HFNumberRange midValue](self, "midValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@:%p (%@)>"), v5, self, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v8;
}

@end
