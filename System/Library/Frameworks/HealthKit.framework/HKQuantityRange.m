@implementation HKQuantityRange

- (HKQuantityRange)initWithMinimum:(id)a3 maximum:(id)a4 isMinimumInclusive:(BOOL)a5 isMaximumInclusive:(BOOL)a6
{
  id v12;
  id v13;
  HKQuantityRange *v14;
  void *v16;
  objc_super v17;

  v12 = a3;
  v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HKQuantityRange;
  v14 = -[HKQuantityRange init](&v17, sel_init);
  if (v14)
  {
    if (objc_msgSend(v13, "hk_isLessThanQuantity:", v12))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("HKQuantityRange.m"), 26, CFSTR("Quantity range maximum must be >= minimum"));

    }
    objc_storeStrong((id *)&v14->_minimum, a3);
    objc_storeStrong((id *)&v14->_maximum, a4);
    v14->_isMinimumInclusive = a5;
    v14->_isMaximumInclusive = a6;
  }

  return v14;
}

+ (id)inclusiveRangeWithMinimum:(id)a3 maximum:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMinimum:maximum:isMinimumInclusive:isMaximumInclusive:", v7, v6, 1, 1);

  return v8;
}

+ (id)exclusiveRangeWithMinimum:(id)a3 maximum:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMinimum:maximum:isMinimumInclusive:isMaximumInclusive:", v7, v6, 0, 0);

  return v8;
}

- (BOOL)containsQuantity:(id)a3
{
  id v4;
  void *v5;
  HKQuantity *minimum;
  int v7;
  HKQuantity *maximum;

  v4 = a3;
  v5 = v4;
  minimum = self->_minimum;
  if (self->_isMinimumInclusive)
  {
    if ((objc_msgSend(v4, "hk_isLessThanQuantity:", minimum) & 1) != 0)
    {
LABEL_3:
      LOBYTE(v7) = 0;
      goto LABEL_8;
    }
  }
  else if (!objc_msgSend(v4, "hk_isGreaterThanQuantity:", minimum))
  {
    goto LABEL_3;
  }
  maximum = self->_maximum;
  if (self->_isMaximumInclusive)
    v7 = objc_msgSend(v5, "hk_isGreaterThanQuantity:", maximum) ^ 1;
  else
    LOBYTE(v7) = objc_msgSend(v5, "hk_isLessThanQuantity:", maximum);
LABEL_8:

  return v7;
}

- (BOOL)intersectsRange:(id)a3
{
  id v4;
  HKQuantity *minimum;
  void *v6;
  uint64_t v7;
  char v8;
  HKQuantity *maximum;
  void *v10;
  uint64_t v11;
  BOOL v12;

  v4 = a3;
  minimum = self->_minimum;
  objc_msgSend(v4, "maximum");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKQuantity compare:](minimum, "compare:", v6);

  if (v7 == 1)
    goto LABEL_10;
  if (v7)
  {
    maximum = self->_maximum;
    objc_msgSend(v4, "minimum");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HKQuantity compare:](maximum, "compare:", v10);

    if (v11 != -1)
    {
      if (v11)
      {
        v12 = 1;
        goto LABEL_11;
      }
      if (self->_isMaximumInclusive)
      {
        v8 = objc_msgSend(v4, "isMinimumInclusive");
        goto LABEL_9;
      }
    }
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  if (!self->_isMinimumInclusive)
    goto LABEL_10;
  v8 = objc_msgSend(v4, "isMaximumInclusive");
LABEL_9:
  v12 = v8;
LABEL_11:

  return v12;
}

+ (BOOL)areRangesDisjoint:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_68);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    {
      v7 = 1;
      while (1)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "intersectsRange:", v6))
          break;

        ++v7;
        v6 = v8;
        if (v7 >= objc_msgSend(v5, "count"))
        {
          v4 = 1;
          v6 = v8;
          goto LABEL_10;
        }
      }

      v4 = 0;
    }
    else
    {
      v4 = 1;
    }
LABEL_10:

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

uint64_t __37__HKQuantityRange_areRangesDisjoint___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "minimum");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minimum");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (BOOL)isEqualToQuantityRange:(id)a3 withAccuracy:(id)a4
{
  _QWORD *v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  v8 = -[HKQuantity isEqualToQuantity:withAccuracy:](self->_minimum, "isEqualToQuantity:withAccuracy:", v6[2], v7)
    && -[HKQuantity isEqualToQuantity:withAccuracy:](self->_maximum, "isEqualToQuantity:withAccuracy:", v6[3], v7)
    && self->_isMinimumInclusive == *((unsigned __int8 *)v6 + 8)
    && self->_isMaximumInclusive == *((unsigned __int8 *)v6 + 9);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  HKQuantityRange *v4;
  HKQuantityRange *v5;
  HKQuantity *minimum;
  void *v7;
  HKQuantity *maximum;
  void *v9;
  _BOOL4 isMinimumInclusive;
  _BOOL4 isMaximumInclusive;
  BOOL v12;

  v4 = (HKQuantityRange *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (-[HKQuantityRange isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    minimum = self->_minimum;
    -[HKQuantityRange minimum](v5, "minimum");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HKQuantity isEqual:](minimum, "isEqual:", v7))
    {
      maximum = self->_maximum;
      -[HKQuantityRange maximum](v5, "maximum");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[HKQuantity isEqual:](maximum, "isEqual:", v9)
        && (isMinimumInclusive = self->_isMinimumInclusive,
            isMinimumInclusive == -[HKQuantityRange isMinimumInclusive](v5, "isMinimumInclusive")))
      {
        isMaximumInclusive = self->_isMaximumInclusive;
        v12 = isMaximumInclusive == -[HKQuantityRange isMaximumInclusive](v5, "isMaximumInclusive");
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HKQuantityRange initWithMinimum:maximum:isMinimumInclusive:isMaximumInclusive:]([HKQuantityRange alloc], "initWithMinimum:maximum:isMinimumInclusive:isMaximumInclusive:", self->_minimum, self->_maximum, self->_isMinimumInclusive, self->_isMaximumInclusive);
}

- (id)description
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("[");
  if (!self->_isMinimumInclusive)
    v2 = CFSTR("(");
  if (self->_isMaximumInclusive)
    v3 = CFSTR("]");
  else
    v3 = CFSTR(")");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@, %@%@"), v2, self->_minimum, self->_maximum, v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKQuantityRange)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  HKQuantityRange *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minimum"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maximum"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isMinimumInclusive"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isMaximumInclusive"));

  v9 = -[HKQuantityRange initWithMinimum:maximum:isMinimumInclusive:isMaximumInclusive:](self, "initWithMinimum:maximum:isMinimumInclusive:isMaximumInclusive:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  HKQuantity *minimum;
  id v5;

  minimum = self->_minimum;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", minimum, CFSTR("minimum"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maximum, CFSTR("maximum"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isMinimumInclusive, CFSTR("isMinimumInclusive"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isMaximumInclusive, CFSTR("isMaximumInclusive"));

}

- (HKQuantity)minimum
{
  return self->_minimum;
}

- (void)setMinimum:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HKQuantity)maximum
{
  return self->_maximum;
}

- (void)setMaximum:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isMinimumInclusive
{
  return self->_isMinimumInclusive;
}

- (void)setIsMinimumInclusive:(BOOL)a3
{
  self->_isMinimumInclusive = a3;
}

- (BOOL)isMaximumInclusive
{
  return self->_isMaximumInclusive;
}

- (void)setIsMaximumInclusive:(BOOL)a3
{
  self->_isMaximumInclusive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximum, 0);
  objc_storeStrong((id *)&self->_minimum, 0);
}

+ (id)ATTDLevel2HypoglycemicRangeWithUnit:(id)a3
{
  id v4;
  void *v5;
  int v6;
  HKQuantityRange *v7;
  void *v8;
  double v9;
  void *v10;
  int v11;
  void *v12;
  HKQuantityRange *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v4 = a3;
  +[HKUnit _milligramsPerDeciliterUnit](HKUnit, "_milligramsPerDeciliterUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v7 = [HKQuantityRange alloc];
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 54.0;
  }
  else
  {
    +[HKUnit _millimolesBloodGlucosePerLiterUnit](HKUnit, "_millimolesBloodGlucosePerLiterUnit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "isEqual:", v10);

    if (!v11)
    {
      v14 = (void *)MEMORY[0x1E0C99DA0];
      v15 = *MEMORY[0x1E0C99778];
      objc_msgSend(v4, "unitString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "raise:format:", v15, CFSTR("Unsupported unit for standard glucose range: %@"), v16);

      +[HKUnit _milligramsPerDeciliterUnit](HKUnit, "_milligramsPerDeciliterUnit");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "ATTDLevel2HypoglycemicRangeWithUnit:", v8);
      v13 = (HKQuantityRange *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v7 = [HKQuantityRange alloc];
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 3.0;
  }
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HKQuantityRange initWithMinimum:maximum:isMinimumInclusive:isMaximumInclusive:](v7, "initWithMinimum:maximum:isMinimumInclusive:isMaximumInclusive:", v8, v12, 1, 0);

LABEL_7:
  return v13;
}

+ (id)ATTDLevel1HypoglycemicRangeWithUnit:(id)a3
{
  id v4;
  void *v5;
  int v6;
  HKQuantityRange *v7;
  void *v8;
  double v9;
  void *v10;
  int v11;
  void *v12;
  HKQuantityRange *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v4 = a3;
  +[HKUnit _milligramsPerDeciliterUnit](HKUnit, "_milligramsPerDeciliterUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v7 = [HKQuantityRange alloc];
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, 54.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 70.0;
  }
  else
  {
    +[HKUnit _millimolesBloodGlucosePerLiterUnit](HKUnit, "_millimolesBloodGlucosePerLiterUnit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "isEqual:", v10);

    if (!v11)
    {
      v14 = (void *)MEMORY[0x1E0C99DA0];
      v15 = *MEMORY[0x1E0C99778];
      objc_msgSend(v4, "unitString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "raise:format:", v15, CFSTR("Unsupported unit for standard glucose range: %@"), v16);

      +[HKUnit _milligramsPerDeciliterUnit](HKUnit, "_milligramsPerDeciliterUnit");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "ATTDLevel1HypoglycemicRangeWithUnit:", v8);
      v13 = (HKQuantityRange *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v7 = [HKQuantityRange alloc];
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, 3.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 3.9;
  }
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HKQuantityRange initWithMinimum:maximum:isMinimumInclusive:isMaximumInclusive:](v7, "initWithMinimum:maximum:isMinimumInclusive:isMaximumInclusive:", v8, v12, 1, 0);

LABEL_7:
  return v13;
}

+ (id)ATTDEuglycemicRangeWithUnit:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v4 = a3;
  +[HKUnit _milligramsPerDeciliterUnit](HKUnit, "_milligramsPerDeciliterUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, 70.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 180.0;
  }
  else
  {
    +[HKUnit _millimolesBloodGlucosePerLiterUnit](HKUnit, "_millimolesBloodGlucosePerLiterUnit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "isEqual:", v9);

    if (!v10)
    {
      v13 = (void *)MEMORY[0x1E0C99DA0];
      v14 = *MEMORY[0x1E0C99778];
      objc_msgSend(v4, "unitString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "raise:format:", v14, CFSTR("Unsupported unit for standard glucose range: %@"), v15);

      +[HKUnit _milligramsPerDeciliterUnit](HKUnit, "_milligramsPerDeciliterUnit");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "ATTDEuglycemicRangeWithUnit:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, 3.9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 10.0;
  }
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKQuantityRange inclusiveRangeWithMinimum:maximum:](HKQuantityRange, "inclusiveRangeWithMinimum:maximum:", v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v12;
}

+ (id)ATTDHyperglycemicRangeWithUnit:(id)a3
{
  id v4;
  void *v5;
  int v6;
  HKQuantityRange *v7;
  double v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  HKQuantityRange *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v4 = a3;
  +[HKUnit _milligramsPerDeciliterUnit](HKUnit, "_milligramsPerDeciliterUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v7 = [HKQuantityRange alloc];
    v8 = 180.0;
  }
  else
  {
    +[HKUnit _millimolesBloodGlucosePerLiterUnit](HKUnit, "_millimolesBloodGlucosePerLiterUnit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "isEqual:", v9);

    if (!v10)
    {
      v14 = (void *)MEMORY[0x1E0C99DA0];
      v15 = *MEMORY[0x1E0C99778];
      objc_msgSend(v4, "unitString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "raise:format:", v15, CFSTR("Unsupported unit for standard glucose range: %@"), v16);

      +[HKUnit _milligramsPerDeciliterUnit](HKUnit, "_milligramsPerDeciliterUnit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "ATTDHyperglycemicRangeWithUnit:", v11);
      v13 = (HKQuantityRange *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v7 = [HKQuantityRange alloc];
    v8 = 10.0;
  }
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, 1.79769313e308);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HKQuantityRange initWithMinimum:maximum:isMinimumInclusive:isMaximumInclusive:](v7, "initWithMinimum:maximum:isMinimumInclusive:isMaximumInclusive:", v11, v12, 0, 1);

LABEL_7:
  return v13;
}

+ (id)ATTDGlycemicRangesWithUnit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "ATTDLevel2HypoglycemicRangeWithUnit:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(a1, "ATTDLevel1HypoglycemicRangeWithUnit:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(a1, "ATTDEuglycemicRangeWithUnit:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(a1, "ATTDHyperglycemicRangeWithUnit:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
