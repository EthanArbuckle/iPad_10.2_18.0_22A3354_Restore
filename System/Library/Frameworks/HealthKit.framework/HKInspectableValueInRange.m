@implementation HKInspectableValueInRange

- (id)_initValueInRangeWithLow:(id)a3 high:(id)a4 currentValue:(id)a5 unit:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HKInspectableValueInRange *v15;
  HKInspectableValueInRange *v16;
  uint64_t v17;
  NSString *unitString;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HKInspectableValueInRange;
  v15 = -[HKInspectableValueInRange init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_lowValue, a3);
    objc_storeStrong((id *)&v16->_highValue, a4);
    objc_storeStrong((id *)&v16->_currentValue, a5);
    v17 = objc_msgSend(v14, "copy");
    unitString = v16->_unitString;
    v16->_unitString = (NSString *)v17;

    -[HKInspectableValueInRange _assertValidRange](v16, "_assertValidRange");
  }

  return v16;
}

+ (id)valueInRangeWithLow:(id)a3 high:(id)a4 currentValue:(id)a5 unit:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKInspectableValueInRange.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("currentValue != nil"));

  }
  v15 = -[HKInspectableValueInRange _initValueInRangeWithLow:high:currentValue:unit:]([HKInspectableValueInRange alloc], "_initValueInRangeWithLow:high:currentValue:unit:", v11, v12, v13, v14);

  return v15;
}

- (void)_assertValidRange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  HKInspectableValue *lowValue;
  HKInspectableValue *highValue;

  -[HKInspectableValueInRange lowValue](self, "lowValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[HKInspectableValueInRange highValue](self, "highValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      return;
  }
  -[HKInspectableValueInRange lowValue](self, "lowValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HKInspectableValueInRange lowValue](self, "lowValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "valueType") == 0;

  }
  else
  {
    v7 = 0;
  }

  -[HKInspectableValueInRange highValue](self, "highValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[HKInspectableValueInRange highValue](self, "highValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "valueType");

    if (v10)
      v11 = v7;
    else
      v11 = 1;

    if ((v11 & 1) != 0)
      goto LABEL_12;
  }
  else
  {

    if (v7)
    {
LABEL_12:
      lowValue = self->_lowValue;
      self->_lowValue = 0;

      highValue = self->_highValue;
      self->_highValue = 0;

    }
  }
}

- (NSNumber)lowValueNumberRepresentation
{
  return (NSNumber *)-[HKInspectableValueInRange _numberForValue:](self, "_numberForValue:", self->_lowValue);
}

- (NSNumber)highValueNumberRepresentation
{
  return (NSNumber *)-[HKInspectableValueInRange _numberForValue:](self, "_numberForValue:", self->_highValue);
}

- (id)_currentValueDoubleRepresentation
{
  void *v3;
  void *v4;

  -[HKInspectableValueInRange currentValue](self, "currentValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInspectableValueInRange _numberForValueCollection:](self, "_numberForValueCollection:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)currentValueRelation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  int64_t v15;
  void *v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  char v23;
  _BOOL4 v24;
  double v25;
  void *v27;

  -[HKInspectableValueInRange lowValue](self, "lowValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[HKInspectableValueInRange highValue](self, "highValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      return 3;
  }
  -[HKInspectableValueInRange _currentValueDoubleRepresentation](self, "_currentValueDoubleRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v9 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v5, "doubleValue");
  v8 = v7;
  -[HKInspectableValueInRange lowValue](self, "lowValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0.0;
  if (!v9)
    goto LABEL_13;
  -[HKInspectableValueInRange lowValue](self, "lowValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKInspectableValue inspectableValueWithNull](HKInspectableValue, "inspectableValueWithNull");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if ((v13 & 1) != 0)
  {
    v9 = 0;
    goto LABEL_13;
  }
  -[HKInspectableValueInRange lowValueNumberRepresentation](self, "lowValueNumberRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;
  if (!v16)
  {
LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v16, "doubleValue");
  v10 = v17;
LABEL_13:
  -[HKInspectableValueInRange highValue](self, "highValue");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
    goto LABEL_15;
  v19 = (void *)v18;
  -[HKInspectableValueInRange highValue](self, "highValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKInspectableValue inspectableValueWithNull](HKInspectableValue, "inspectableValueWithNull");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqual:", v21);

  if ((v22 & 1) != 0)
  {
LABEL_15:
    v23 = 0;
    v14 = 0;
    v24 = v9 != 0;
    v25 = 0.0;
    goto LABEL_16;
  }
  -[HKInspectableValueInRange highValueNumberRepresentation](self, "highValueNumberRepresentation");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v27;
  if (v27)
  {
    objc_msgSend(v27, "doubleValue");
    v24 = v9 != 0;
    v23 = 1;
    if (!v9 || v25 - v10 > 2.22044605e-16)
    {
LABEL_16:
      if (v24 && v8 < v10)
      {
        v15 = 1;
      }
      else if ((v23 & (v8 > v25)) != 0)
      {
        v15 = 2;
      }
      else
      {
        v15 = 0;
      }
      goto LABEL_22;
    }
  }
LABEL_10:
  v15 = 4;
LABEL_22:

  return v15;
}

- (BOOL)hasRenderableContent
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  HKInspectableValue *lowValue;
  _BOOL4 v9;
  HKInspectableValue *highValue;
  _BOOL4 v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;

  -[HKInspectableValueInRange currentValue](self, "currentValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "collectionType"))
  {
    v4 = 0;
  }
  else
  {
    -[HKInspectableValueInRange currentValue](self, "currentValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inspectableValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "valueType");

    if (!v7)
      return 0;
    lowValue = self->_lowValue;
    v9 = !lowValue || -[HKInspectableValue valueType](lowValue, "valueType") == 5;
    highValue = self->_highValue;
    v11 = !highValue || -[HKInspectableValue valueType](highValue, "valueType") == 5;
    if (v9 && v11)
      return 0;
    if (v9 || v11)
      return 1;
    -[HKInspectableValueInRange _numberForValue:](self, "_numberForValue:", self->_highValue);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    -[HKInspectableValueInRange _numberForValue:](self, "_numberForValue:", self->_lowValue);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;

    if (v14 - v17 > 2.22044605e-16)
      return 1;
    -[HKInspectableValueInRange highValue](self, "highValue", v14 - v17);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 == 0;
  }

  return v4;
}

- (id)_numberForValueCollection:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "collectionType");
  if ((unint64_t)(v5 - 2) < 2)
  {
    objc_msgSend(v4, "inspectableValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInspectableValueInRange _numberForValue:](self, "_numberForValue:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v5 == 1)
    {
      objc_msgSend(v4, "min");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v5)
      {
        v9 = 0;
        goto LABEL_10;
      }
      objc_msgSend(v4, "inspectableValue");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v6;
    -[HKInspectableValueInRange _numberForValue:](self, "_numberForValue:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  return v9;
}

- (id)_numberForValue:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "valueType");
  if ((unint64_t)(v4 - 5) < 2)
  {
    objc_msgSend(v3, "codedQuantityValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4 == 10)
    {
      objc_msgSend(v3, "inspectableIntegerValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (v4 != 1)
    {
      v7 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v3, "ratioValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_9:

  return v7;
}

- (void)_setUnitString:(id)a3
{
  objc_storeStrong((id *)&self->_unitString, a3);
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> %@, unit: %@, low: %@, high: %@"), v5, self, self->_currentValue, self->_unitString, self->_lowValue, self->_highValue);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKInspectableValueInRange)initWithCoder:(id)a3
{
  id v4;
  HKInspectableValueInRange *v5;
  uint64_t v6;
  HKInspectableValue *lowValue;
  uint64_t v8;
  HKInspectableValue *highValue;
  uint64_t v10;
  HKInspectableValueCollection *currentValue;
  uint64_t v12;
  NSString *unitString;
  HKInspectableValueInRange *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKInspectableValueInRange;
  v5 = -[HKInspectableValueInRange init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LowValueKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    lowValue = v5->_lowValue;
    v5->_lowValue = (HKInspectableValue *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HighValueKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    highValue = v5->_highValue;
    v5->_highValue = (HKInspectableValue *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CurrentValueKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    currentValue = v5->_currentValue;
    v5->_currentValue = (HKInspectableValueCollection *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UnitStringKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    unitString = v5->_unitString;
    v5->_unitString = (NSString *)v12;

    if (!v5->_currentValue)
    {
      v14 = 0;
      goto LABEL_6;
    }
    -[HKInspectableValueInRange _assertValidRange](v5, "_assertValidRange");
  }
  v14 = v5;
LABEL_6:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  HKInspectableValue *lowValue;
  id v5;

  lowValue = self->_lowValue;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", lowValue, CFSTR("LowValueKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_highValue, CFSTR("HighValueKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentValue, CFSTR("CurrentValueKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_unitString, CFSTR("UnitStringKey"));

}

- (HKInspectableValue)lowValue
{
  return self->_lowValue;
}

- (HKInspectableValue)highValue
{
  return self->_highValue;
}

- (HKInspectableValueCollection)currentValue
{
  return self->_currentValue;
}

- (NSString)unitString
{
  return self->_unitString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitString, 0);
  objc_storeStrong((id *)&self->_currentValue, 0);
  objc_storeStrong((id *)&self->_highValue, 0);
  objc_storeStrong((id *)&self->_lowValue, 0);
}

@end
