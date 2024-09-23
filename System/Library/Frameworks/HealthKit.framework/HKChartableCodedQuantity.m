@implementation HKChartableCodedQuantity

- (HKChartableCodedQuantity)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKChartableCodedQuantity)initWithCodings:(id)a3 quantity:(id)a4 rangeLow:(id)a5 rangeHigh:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HKChartableCodedQuantity *v14;
  uint64_t v15;
  NSArray *codings;
  uint64_t v17;
  HKQuantity *quantity;
  uint64_t v19;
  NSNumber *rangeLow;
  uint64_t v21;
  NSNumber *rangeHigh;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HKChartableCodedQuantity;
  v14 = -[HKChartableCodedQuantity init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    codings = v14->_codings;
    v14->_codings = (NSArray *)v15;

    v17 = objc_msgSend(v11, "copy");
    quantity = v14->_quantity;
    v14->_quantity = (HKQuantity *)v17;

    v19 = objc_msgSend(v12, "copy");
    rangeLow = v14->_rangeLow;
    v14->_rangeLow = (NSNumber *)v19;

    v21 = objc_msgSend(v13, "copy");
    rangeHigh = v14->_rangeHigh;
    v14->_rangeHigh = (NSNumber *)v21;

  }
  return v14;
}

+ (id)chartableCodedQuantityWithCodings:(id)a3 originalCodedQuantity:(id)a4 originalRangeLowCodedQuantity:(id)a5 originalRangeHighCodedQuantity:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  int v21;
  _QWORD *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  int v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_msgSend(a1, "converter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "quantityRepresentationWithUCUMConverter:error:", v16, a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v36 = v12;
    if (v14)
    {
      objc_msgSend(v17, "_unit");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
      objc_msgSend(a1, "_valueFromCodedQuantity:inUnit:error:", v14, v18, &v38);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v38;

      if (v19)
      {
        v21 = 0;
      }
      else
      {
        _HKInitializeLogging();
        v23 = HKLogHealthRecords;
        v21 = 1;
        if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v40 = v20;
          _os_log_impl(&dword_19A0E6000, v23, OS_LOG_TYPE_INFO, "Unable to get reference range low as quantity, ignoring: %{public}@", buf, 0xCu);
        }
        v19 = 0;
      }
    }
    else
    {
      v19 = 0;
      v20 = 0;
      v21 = 1;
    }

    if (v15)
    {
      objc_msgSend(v17, "_unit");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      objc_msgSend(a1, "_valueFromCodedQuantity:inUnit:error:", v15, v24, &v37);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v37;

      if (v25)
      {
        v27 = 0;
      }
      else
      {
        _HKInitializeLogging();
        v28 = HKLogHealthRecords;
        v27 = 1;
        if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v40 = v26;
          _os_log_impl(&dword_19A0E6000, v28, OS_LOG_TYPE_INFO, "Unable to get reference range high as quantity: %{public}@", buf, 0xCu);
        }
        v25 = 0;
      }
    }
    else
    {
      v25 = 0;
      v26 = 0;
      v27 = 1;
    }
    v22 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithCodings:quantity:rangeLow:rangeHigh:", v36, v17, v19, v25);
    v29 = objc_msgSend(v13, "copy");
    v30 = (void *)v22[5];
    v22[5] = v29;

    if (v21)
    {
      v31 = (void *)v22[6];
      v22[6] = 0;
    }
    else
    {
      v32 = objc_msgSend(v14, "copy");
      v31 = (void *)v22[6];
      v22[6] = v32;
    }

    v12 = v36;
    if (v27)
    {
      v33 = (void *)v22[7];
      v22[7] = 0;
    }
    else
    {
      v34 = objc_msgSend(v15, "copy");
      v33 = (void *)v22[7];
      v22[7] = v34;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)_valueFromCodedQuantity:(id)a3 inUnit:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a1, "converter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "quantityRepresentationWithUCUMConverter:error:", v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_5;
  if ((objc_msgSend(v11, "isCompatibleWithUnit:", v8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("value %@ is not compatible with unit %@"), v11, v8);
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v11, "doubleValueForUnit:", v8);
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v13;
}

- (id)chartableCodedQuantityInUnit:(id)a3 error:(id *)a4
{
  return -[HKChartableCodedQuantity chartableCodedQuantityInUnit:adoptUnitIfNullUnit:error:](self, "chartableCodedQuantityInUnit:adoptUnitIfNullUnit:error:", a3, 0, a4);
}

- (id)chartableCodedQuantityInUnit:(id)a3 adoptUnitIfNullUnit:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  int v10;
  _QWORD *v11;
  HKQuantity *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;

  v6 = a4;
  v8 = a3;
  -[HKQuantity _unit](self->_quantity, "_unit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", v8);

  if (!v10)
  {
    v12 = self->_quantity;
    v13 = v12;
    if (v6
      && (-[HKQuantity _unit](v12, "_unit"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "isNull"),
          v14,
          v15))
    {
      objc_msgSend(v13, "_value");
      +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v8);
      v16 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v16;
    }
    else if ((objc_msgSend(v13, "isCompatibleWithUnit:", v8) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("Cannot convert %@ to unit %@"), self, v8);
      v11 = 0;
LABEL_26:

      goto LABEL_27;
    }
    objc_msgSend(v13, "doubleValueForUnit:", v8);
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_rangeLow)
    {
      objc_msgSend(v13, "_unit");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSNumber doubleValue](self->_rangeLow, "doubleValue");
      +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = 0;
    }
    if (self->_rangeHigh)
    {
      objc_msgSend(v13, "_unit");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSNumber doubleValue](self->_rangeHigh, "doubleValue");
      +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = 0;
    }
    if (v19)
    {
      v22 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v19, "doubleValueForUnit:", v8);
      objc_msgSend(v22, "numberWithDouble:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
LABEL_16:
        v24 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v21, "doubleValueForUnit:", v8);
        objc_msgSend(v24, "numberWithDouble:");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
        v11 = (_QWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCodings:quantity:rangeLow:rangeHigh:", self->_codings, v17, v23, v25);
        v26 = -[HKCodedQuantity copy](self->_originalCodedQuantity, "copy");
        v27 = (void *)v11[5];
        v11[5] = v26;

        if (v23)
        {
          v28 = -[HKCodedQuantity copy](self->_originalRangeLowCodedQuantity, "copy");
          v29 = (void *)v11[6];
          v11[6] = v28;
        }
        else
        {
          v29 = (void *)v11[6];
          v11[6] = 0;
        }

        if (v25)
        {
          v30 = -[HKCodedQuantity copy](self->_originalRangeHighCodedQuantity, "copy");
          v31 = (void *)v11[7];
          v11[7] = v30;
        }
        else
        {
          v31 = (void *)v11[7];
          v11[7] = 0;
        }

        goto LABEL_26;
      }
    }
    else
    {
      v23 = 0;
      if (v21)
        goto LABEL_16;
    }
    v25 = 0;
    goto LABEL_19;
  }
  v11 = (_QWORD *)-[HKChartableCodedQuantity copy](self, "copy");
LABEL_27:

  return v11;
}

- (BOOL)isCompatibleWithUnit:(id)a3
{
  return -[HKQuantity isCompatibleWithUnit:](self->_quantity, "isCompatibleWithUnit:", a3);
}

- (BOOL)hasRange
{
  return self->_rangeLow || self->_rangeHigh != 0;
}

- (BOOL)isInRange
{
  double v3;
  double v4;
  NSNumber *rangeLow;
  double v6;
  NSNumber *rangeHigh;
  double v8;
  BOOL result;

  -[HKChartableCodedQuantity doubleValue](self, "doubleValue");
  v4 = v3;
  rangeLow = self->_rangeLow;
  result = 0;
  if (!rangeLow || (-[NSNumber doubleValue](rangeLow, "doubleValue"), v6 <= v4))
  {
    rangeHigh = self->_rangeHigh;
    if (!rangeHigh)
      return 1;
    -[NSNumber doubleValue](rangeHigh, "doubleValue");
    if (v8 >= v4)
      return 1;
  }
  return result;
}

- (double)doubleValue
{
  HKQuantity *quantity;
  void *v3;
  double v4;
  double v5;

  quantity = self->_quantity;
  -[HKQuantity _unit](quantity, "_unit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](quantity, "doubleValueForUnit:", v3);
  v5 = v4;

  return v5;
}

- (double)doubleValueForUnit:(id)a3
{
  double result;

  -[HKQuantity doubleValueForUnit:](self->_quantity, "doubleValueForUnit:", a3);
  return result;
}

+ (id)converter
{
  if (converter_onceToken_0 != -1)
    dispatch_once(&converter_onceToken_0, &__block_literal_global_60);
  return (id)converter_converter_0;
}

void __37__HKChartableCodedQuantity_converter__block_invoke()
{
  HKUCUMUnitDisplayConverter *v0;
  void *v1;

  v0 = objc_alloc_init(HKUCUMUnitDisplayConverter);
  v1 = (void *)converter_converter_0;
  converter_converter_0 = (uint64_t)v0;

}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSNumber *rangeHigh;
  void *v6;
  void *v7;
  __int128 v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v9 = *(_OWORD *)&self->_quantity;
  rangeHigh = self->_rangeHigh;
  -[NSArray componentsJoinedByString:](self->_codings, "componentsJoinedByString:", CFSTR("; "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> quantity: %@, low: %@, high: %@, codings: %@"), v4, self, v9, rangeHigh, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)codings
{
  return self->_codings;
}

- (HKQuantity)quantity
{
  return self->_quantity;
}

- (NSNumber)rangeLow
{
  return self->_rangeLow;
}

- (NSNumber)rangeHigh
{
  return self->_rangeHigh;
}

- (HKCodedQuantity)originalCodedQuantity
{
  return self->_originalCodedQuantity;
}

- (void)setOriginalCodedQuantity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (HKCodedQuantity)originalRangeLowCodedQuantity
{
  return self->_originalRangeLowCodedQuantity;
}

- (void)setOriginalRangeLowCodedQuantity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (HKCodedQuantity)originalRangeHighCodedQuantity
{
  return self->_originalRangeHighCodedQuantity;
}

- (void)setOriginalRangeHighCodedQuantity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalRangeHighCodedQuantity, 0);
  objc_storeStrong((id *)&self->_originalRangeLowCodedQuantity, 0);
  objc_storeStrong((id *)&self->_originalCodedQuantity, 0);
  objc_storeStrong((id *)&self->_rangeHigh, 0);
  objc_storeStrong((id *)&self->_rangeLow, 0);
  objc_storeStrong((id *)&self->_quantity, 0);
  objc_storeStrong((id *)&self->_codings, 0);
}

@end
