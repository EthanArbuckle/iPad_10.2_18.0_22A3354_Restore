@implementation HKQuantity

- (double)doubleValueForUnit:(HKUnit *)unit
{
  HKUnit *v4;
  double v5;
  double v6;

  v4 = unit;
  if (!v4)
  {
    +[HKUnit _nullUnit](HKUnit, "_nullUnit");
    v4 = (HKUnit *)objc_claimAutoreleasedReturnValue();
  }
  -[HKUnit _valueByConvertingValue:toUnit:](self->_unit, "_valueByConvertingValue:toUnit:", v4, self->_value);
  v6 = v5;

  return v6;
}

+ (HKQuantity)quantityWithUnit:(HKUnit *)unit doubleValue:(double)value
{
  HKUnit *v6;
  void *v7;

  v6 = unit;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithUnit:doubleValue:", v6, value);

  return (HKQuantity *)v7;
}

- (id)_initWithUnit:(id)a3 doubleValue:(double)a4
{
  id v6;
  HKQuantity *v7;
  double *v8;
  objc_super v10;

  v6 = a3;
  if (!v6)
  {
    +[HKUnit _nullUnit](HKUnit, "_nullUnit");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10.receiver = self;
  v10.super_class = (Class)HKQuantity;
  v7 = -[HKQuantity init](&v10, sel_init);
  v8 = (double *)v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_unit, v6);
    v8[2] = a4;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  double value;
  id v5;

  value = self->_value;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("ValueKey"), value);
  objc_msgSend(v5, "encodeObject:forKey:", self->_unit, CFSTR("UnitKey"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unit, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_isZero
{
  return fabs(self->_value) < 2.22044605e-16;
}

- (BOOL)isCompatibleWithUnit:(HKUnit *)unit
{
  return -[HKUnit _isCompatibleWithUnit:](self->_unit, "_isCompatibleWithUnit:", unit);
}

- (HKUnit)_unit
{
  return self->_unit;
}

- (NSComparisonResult)compare:(HKQuantity *)quantity
{
  HKQuantity *v4;
  char isKindOfClass;
  _QWORD *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  NSComparisonResult v22;

  v4 = quantity;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = (_QWORD *)MEMORY[0x1E0C99778];
  if ((isKindOfClass & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Quantity %@ is of incorrect class"), v4);
  -[HKQuantity _unit](v4, "_unit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity _unit](self, "_unit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "_isCompatibleWithUnit:", v8);

  if ((v9 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v6, CFSTR("Quantity %@ has incompatible unit"), v4);
  -[HKQuantity _unit](self, "_unit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](self, "doubleValueForUnit:", v10);
  v12 = v11;

  -[HKQuantity _unit](self, "_unit");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](v4, "doubleValueForUnit:", v13);
  v15 = v14;

  v16 = HKCompareDoubles(v12, v15);
  if (v16)
  {
    -[HKQuantity _unit](v4, "_unit");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantity doubleValueForUnit:](self, "doubleValueForUnit:", v17);
    v19 = v18;
    -[HKQuantity doubleValueForUnit:](v4, "doubleValueForUnit:", v17);
    v21 = HKCompareDoubles(v19, v20);

  }
  else
  {
    v21 = 0;
  }
  if (v21 == v16)
    v22 = v16;
  else
    v22 = NSOrderedSame;

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  HKQuantity *v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;

  v4 = (HKQuantity *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    v8 = (objc_opt_isKindOfClass() & 1) != 0
      && (-[HKQuantity _unit](v4, "_unit"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          -[HKQuantity _unit](self, "_unit"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v5, "_isCompatibleWithUnit:", v6),
          v6,
          v5,
          v7)
      && -[HKQuantity compare:](self, "compare:", v4) == NSOrderedSame;
  }

  return v8;
}

- (id)description
{
  uint64_t v3;

  -[HKQuantity _valueScaledForDisplay](self, "_valueScaledForDisplay");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%g %@"), v3, self->_unit);
}

- (HKQuantity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  HKQuantity *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UnitKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ValueKey"));
  v7 = v6;

  v8 = -[HKQuantity _initWithUnit:doubleValue:](self, "_initWithUnit:doubleValue:", v5, v7);
  return v8;
}

- (HKQuantity)init
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

- (unint64_t)hash
{
  return 0;
}

- (id)_quantityByAddingQuantity:(id)a3
{
  double v4;

  objc_msgSend(a3, "doubleValueForUnit:", self->_unit);
  return +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", self->_unit, v4 + self->_value);
}

- (id)_foundationMeasurement
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HKUnit _foundationUnit](self->_unit, "_foundationUnit");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3758]), "initWithDoubleValue:unit:", v3, self->_value);
  }
  else
  {
    +[HKUnit _foundationBaseUnits](HKUnit, "_foundationBaseUnits");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v7 = *(_QWORD *)v13;
LABEL_5:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v6);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        if (-[HKQuantity isCompatibleWithUnit:](self, "isCompatibleWithUnit:", v9, (_QWORD)v12))
          break;
        if (v4 == (void *)++v8)
        {
          v4 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v4)
            goto LABEL_5;
          goto LABEL_14;
        }
      }
      objc_msgSend(v9, "_foundationUnit");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
        goto LABEL_14;
      v10 = objc_alloc(MEMORY[0x1E0CB3758]);
      -[HKQuantity doubleValueForUnit:](self, "doubleValueForUnit:", v9);
      v5 = (void *)objc_msgSend(v10, "initWithDoubleValue:unit:", v4);
    }
    else
    {
LABEL_14:
      v5 = 0;
    }

  }
  return v5;
}

- (BOOL)hk_isLessThanQuantity:(id)a3
{
  return -[HKQuantity compare:](self, "compare:", a3) == NSOrderedAscending;
}

- (BOOL)hk_isGreaterThanQuantity:(id)a3
{
  return -[HKQuantity compare:](self, "compare:", a3) == NSOrderedDescending;
}

- (BOOL)isEqualToQuantity:(id)a3 withAccuracy:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  BOOL v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "_unit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity _unit](self, "_unit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "_isCompatibleWithUnit:", v9);

  if ((v10 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Quantity %@ has incompatible unit"), v6);
  -[HKQuantity _unit](self, "_unit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](self, "doubleValueForUnit:", v11);
  v13 = v12;

  -[HKQuantity _unit](self, "_unit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", v14);
  v16 = v15;

  -[HKQuantity _unit](self, "_unit");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", v17);
  v19 = v18;

  v20 = HKCompareDoublesWithAccuracy(v13, v16, v19) == 0;
  return v20;
}

- (double)_valueScaledForDisplay
{
  HKUnit *unit;
  void *v4;
  double v5;

  unit = self->_unit;
  +[HKUnit percentUnit](HKUnit, "percentUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HKUnit isEqual:](unit, "isEqual:", v4))
    v5 = 100.0;
  else
    v5 = 1.0;

  return v5 * self->_value;
}

- (double)_baselineRelativeDoubleValueForUnit:(id)a3
{
  id v4;
  double value;
  double v6;
  double v7;

  v4 = a3;
  value = self->_value;
  v6 = 1.79769313e308;
  if (value != 1.79769313e308)
  {
    v6 = -1.79769313e308;
    if (value != -1.79769313e308)
    {
      -[HKQuantity doubleValueForUnit:](self, "doubleValueForUnit:", v4);
      v6 = v7;
    }
  }

  return v6;
}

- (double)_value
{
  return self->_value;
}

+ (id)_quantityWithBeatsPerMinute:(double)a3
{
  void *v4;
  void *v5;

  +[HKUnit _countPerMinuteUnit](HKUnit, "_countPerMinuteUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)_beatsPerMinute
{
  void *v3;
  double v4;
  double v5;

  +[HKUnit _countPerMinuteUnit](HKUnit, "_countPerMinuteUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](self, "doubleValueForUnit:", v3);
  v5 = v4;

  return v5;
}

- (id)asJSONObjectForUnit:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v5, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("unit"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[HKQuantity doubleValueForUnit:](self, "doubleValueForUnit:", v5);
  v10 = v9;

  objc_msgSend(v8, "numberWithDouble:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("quantity"));

  return v6;
}

- (id)asJSONObject
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[HKQuantity _unit](self, "_unit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("unit"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[HKQuantity _unit](self, "_unit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](self, "doubleValueForUnit:", v7);
  objc_msgSend(v6, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("quantity"));

  return v3;
}

+ (id)hk_quantityWithSeconds:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;

  if (a3)
  {
    v3 = a3;
    +[HKUnit secondUnit](HKUnit, "secondUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValue");
    v6 = v5;

    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)hk_quantityWithMinutes:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;

  if (a3)
  {
    v3 = a3;
    +[HKUnit minuteUnit](HKUnit, "minuteUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValue");
    v6 = v5;

    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)hk_secondsNumber
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  +[HKUnit secondUnit](HKUnit, "secondUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](self, "doubleValueForUnit:", v4);
  objc_msgSend(v3, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hk_minutesNumber
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](self, "doubleValueForUnit:", v4);
  objc_msgSend(v3, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
