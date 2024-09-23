@implementation HKInspectableValue

+ (id)indexableKeyPathsWithPrefix:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString **v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[HKCodedValueCollection indexableKeyPathsWithPrefix:](HKCodedValueCollection, "indexableKeyPathsWithPrefix:", CFSTR("codedValueCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v14 = CFSTR("medicalCodings");
    v15 = CFSTR("dataAbsentReasonCodings");
    v16 = v5;
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = &v14;
    v8 = 3;
  }
  else
  {
    v12 = CFSTR("medicalCodings");
    v13 = CFSTR("dataAbsentReasonCodings");
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = &v12;
    v8 = 2;
  }
  objc_msgSend(v6, "arrayWithObjects:count:", v7, v8, v12, v13, v14, v15, v16, v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKConceptIndexUtilities keyPaths:prefix:](HKConceptIndexUtilities, "keyPaths:prefix:", v9, v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (HKInspectableValue)init
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

+ (HKInspectableValue)inspectableValueWithValueType:(int64_t)a3 value:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithValueType:value:", a3, v6);

  return (HKInspectableValue *)v7;
}

+ (HKInspectableValue)inspectableValueWithString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithValueType:value:", 0, v4);

  return (HKInspectableValue *)v5;
}

+ (HKInspectableValue)inspectableValueWithCodedQuantity:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithValueType:value:", 6, v4);

  return (HKInspectableValue *)v5;
}

+ (HKInspectableValue)inspectableValueWithRatio:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithValueType:value:", 1, v4);

  return (HKInspectableValue *)v5;
}

+ (HKInspectableValue)inspectableValueWithMedicalDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithValueType:value:", 2, v4);

  return (HKInspectableValue *)v5;
}

+ (HKInspectableValue)inspectableValueWithMedicalDateInterval:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithValueType:value:", 3, v4);

  return (HKInspectableValue *)v5;
}

+ (HKInspectableValue)inspectableValueWithDateComponents:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithValueType:value:", 4, v4);

  return (HKInspectableValue *)v5;
}

+ (HKInspectableValue)inspectableValueWithInteger:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithValueType:value:", 10, v4);

  return (HKInspectableValue *)v5;
}

+ (HKInspectableValue)inspectableValueWithBoolean:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithValueType:value:", 11, v4);

  return (HKInspectableValue *)v5;
}

+ (HKInspectableValue)inspectableValueWithNull
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__HKInspectableValue_inspectableValueWithNull__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (inspectableValueWithNull_onceToken != -1)
    dispatch_once(&inspectableValueWithNull_onceToken, block);
  return (HKInspectableValue *)(id)inspectableValueWithNull__null;
}

void __46__HKInspectableValue_inspectableValueWithNull__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "_initWithValueType:value:", 5, v4);
  v3 = (void *)inspectableValueWithNull__null;
  inspectableValueWithNull__null = v2;

}

+ (HKInspectableValue)inspectableValueWithMedicalCodings:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithValueType:value:", 7, v4);

  return (HKInspectableValue *)v5;
}

+ (HKInspectableValue)inspectableValueWithCodedValueCollection:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithValueType:value:", 8, v4);

  return (HKInspectableValue *)v5;
}

+ (HKInspectableValue)inspectableValueWithDataAbsentReasonCodings:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithValueType:value:", 9, v4);

  return (HKInspectableValue *)v5;
}

- (id)_initWithValueType:(int64_t)a3 value:(id)a4
{
  id v6;
  HKInspectableValue *v7;
  HKInspectableValue *v8;
  uint64_t v9;
  NSObject *value;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKInspectableValue;
  v7 = -[HKInspectableValue init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_valueType = a3;
    v9 = objc_msgSend(v6, "copy");
    value = v8->_value;
    v8->_value = v9;

    -[HKInspectableValue _assertValueType](v8, "_assertValueType");
  }

  return v8;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%li: %@"), self->_valueType, self->_value);
}

- (NSObject)value
{
  return self->_value;
}

- (NSString)stringValue
{
  void *v3;

  if (-[HKInspectableValue valueType](self, "valueType"))
  {
    v3 = 0;
  }
  else
  {
    -[HKInspectableValue value](self, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (HKCodedQuantity)codedQuantityValue
{
  void *v3;

  if (-[HKInspectableValue valueType](self, "valueType") == 6)
  {
    -[HKInspectableValue value](self, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (HKCodedQuantity *)v3;
}

- (HKRatioValue)ratioValue
{
  void *v3;

  if (-[HKInspectableValue valueType](self, "valueType") == 1)
  {
    -[HKInspectableValue value](self, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (HKRatioValue *)v3;
}

- (HKMedicalDate)medicalDateValue
{
  void *v3;

  if (-[HKInspectableValue valueType](self, "valueType") == 2)
  {
    -[HKInspectableValue value](self, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (HKMedicalDate *)v3;
}

- (HKMedicalDateInterval)medicalDateIntervalValue
{
  void *v3;

  if (-[HKInspectableValue valueType](self, "valueType") == 3)
  {
    -[HKInspectableValue value](self, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (HKMedicalDateInterval *)v3;
}

- (NSDateComponents)dateComponentsValue
{
  void *v3;

  if (-[HKInspectableValue valueType](self, "valueType") == 4)
  {
    -[HKInspectableValue value](self, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSDateComponents *)v3;
}

- (NSArray)medicalCodings
{
  void *v3;

  if (-[HKInspectableValue valueType](self, "valueType") == 7)
  {
    -[HKInspectableValue value](self, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSArray *)v3;
}

- (HKCodedValueCollection)codedValueCollection
{
  void *v3;

  if (-[HKInspectableValue valueType](self, "valueType") == 8)
  {
    -[HKInspectableValue value](self, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (HKCodedValueCollection *)v3;
}

- (NSArray)dataAbsentReasonCodings
{
  void *v3;

  if (-[HKInspectableValue valueType](self, "valueType") == 9)
  {
    -[HKInspectableValue value](self, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSArray *)v3;
}

- (NSNumber)inspectableIntegerValue
{
  void *v3;

  if (-[HKInspectableValue valueType](self, "valueType") == 10)
  {
    -[HKInspectableValue value](self, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSNumber *)v3;
}

- (NSNumber)BOOLeanValue
{
  void *v3;

  if (-[HKInspectableValue valueType](self, "valueType") == 11)
  {
    -[HKInspectableValue value](self, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSNumber *)v3;
}

- (NSDate)dateValueForUTC
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HKInspectableValue medicalDateValue](self, "medicalDateValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    -[HKInspectableValue medicalDateIntervalValue](self, "medicalDateIntervalValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "startDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "endDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
LABEL_8:

        goto LABEL_9;
      }
      objc_msgSend(v6, "endDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    objc_msgSend(v8, "dateForUTC");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  objc_msgSend(v3, "dateForUTC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return (NSDate *)v5;
}

- (void)_setOntologyConcept:(id)a3
{
  id v5;
  HKConcept *v6;
  HKConcept *ontologyConcept;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKInspectableValue.m"), 330, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ontologyConcept"));

    v5 = 0;
  }
  v6 = (HKConcept *)objc_msgSend(v5, "copy");
  ontologyConcept = self->_ontologyConcept;
  self->_ontologyConcept = v6;

}

- (void)_setDataAbsentReason:(id)a3
{
  id v5;
  HKConcept *v6;
  HKConcept *dataAbsentReason;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKInspectableValue.m"), 335, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataAbsentReason"));

    v5 = 0;
  }
  v6 = (HKConcept *)objc_msgSend(v5, "copy");
  dataAbsentReason = self->_dataAbsentReason;
  self->_dataAbsentReason = v6;

}

- (HKUCUMUnitDisplayConverter)converter
{
  if (converter_onceToken != -1)
    dispatch_once(&converter_onceToken, &__block_literal_global_45);
  return (HKUCUMUnitDisplayConverter *)(id)converter_converter;
}

void __31__HKInspectableValue_converter__block_invoke()
{
  HKUCUMUnitDisplayConverter *v0;
  void *v1;

  v0 = objc_alloc_init(HKUCUMUnitDisplayConverter);
  v1 = (void *)converter_converter;
  converter_converter = (uint64_t)v0;

}

- (NSString)unitString
{
  int64_t v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  NSString *v17;

  v3 = -[HKInspectableValue valueType](self, "valueType");
  if (v3 == 1)
  {
    -[HKInspectableValue ratioValue](self, "ratioValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "unitCoding");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "code");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v5 = v8;
    }
    else
    {
      objc_msgSend(v4, "unitCoding");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "displayString");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_14;
  }
  if (v3 == 6)
  {
    -[HKInspectableValue codedQuantityValue](self, "codedQuantityValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unitCoding");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "code");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (v11)
    {
      v12 = v11;
    }
    else
    {
      objc_msgSend(v4, "displayString");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v5 = v12;
LABEL_14:

    goto LABEL_15;
  }
  if (v3 != 8)
  {
    v5 = 0;
    goto LABEL_16;
  }
  -[HKInspectableValue codedValueCollection](self, "codedValueCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInspectableValue _unitStringForCodedValueCollection:](self, "_unitStringForCodedValueCollection:", v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_15:

LABEL_16:
  if (-[__CFString length](v5, "length"))
  {
    -[HKInspectableValue converter](self, "converter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "synonymForUCUMUnitString:", v5);
    v15 = objc_claimAutoreleasedReturnValue();

    v5 = (__CFString *)v15;
  }
  if (v5)
    v16 = v5;
  else
    v16 = &stru_1E37FD4C0;
  v17 = v16;

  return v17;
}

- (HKConcept)ontologyConcept
{
  HKConcept *ontologyConcept;
  void *v4;
  void *v5;
  void *v6;

  if (-[HKInspectableValue valueType](self, "valueType") == 7)
  {
    ontologyConcept = self->_ontologyConcept;
    -[HKInspectableValue medicalCodings](self, "medicalCodings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKMedicalCodingCollection collectionWithCodings:](HKMedicalCodingCollection, "collectionWithCodings:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HKSafeConcept(ontologyConcept, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (HKConcept *)v6;
}

- (HKConcept)dataAbsentReason
{
  HKConcept *dataAbsentReason;
  void *v4;
  void *v5;
  void *v6;

  if (-[HKInspectableValue valueType](self, "valueType") == 9)
  {
    dataAbsentReason = self->_dataAbsentReason;
    -[HKInspectableValue dataAbsentReasonCodings](self, "dataAbsentReasonCodings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKMedicalCodingCollection collectionWithCodings:](HKMedicalCodingCollection, "collectionWithCodings:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HKSafeConcept(dataAbsentReason, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (HKConcept *)v6;
}

- (BOOL)isEqual:(id)a3
{
  HKInspectableValue *v4;
  HKInspectableValue *v5;
  int64_t valueType;
  NSObject *value;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  BOOL v14;

  v4 = (HKInspectableValue *)a3;
  if (v4 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      valueType = self->_valueType;
      if (valueType == -[HKInspectableValue valueType](v5, "valueType"))
      {
        value = self->_value;
        -[HKInspectableValue value](v5, "value");
        v8 = objc_claimAutoreleasedReturnValue();
        if (value == v8)
        {

          goto LABEL_11;
        }
        v9 = (void *)v8;
        -[HKInspectableValue value](v5, "value");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          v12 = self->_value;
          -[HKInspectableValue value](v5, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v12) = -[NSObject isEqual:](v12, "isEqual:", v13);

          if ((v12 & 1) == 0)
            goto LABEL_13;
LABEL_11:
          v14 = 1;
LABEL_14:

          goto LABEL_15;
        }

      }
LABEL_13:
      v14 = 0;
      goto LABEL_14;
    }
    v14 = 0;
  }
LABEL_15:

  return v14;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[HKInspectableValue valueType](self, "valueType");
  -[HKInspectableValue value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (void)_assertValueClass:(Class)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKInconsistentValueTypeException"), CFSTR("Inconsistent value type found in inspectable value, have: %@, expect: %@"), objc_opt_class(), a3);
}

- (void)_assertValueType
{
  if (self->_valueType <= 0xBuLL)
    -[HKInspectableValue _assertValueClass:](self, "_assertValueClass:", objc_opt_class());
}

- (id)_unitStringForCodedValueCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "codedValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unitString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "codedValues", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "unitString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v13) = objc_msgSend(v14, "isEqualToString:", v7);
        if (!(_DWORD)v13)
        {

          v15 = &stru_1E37FD4C0;
          goto LABEL_11;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }

  v15 = v7;
LABEL_11:

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKInspectableValue)initWithCoder:(id)a3
{
  id v4;
  HKInspectableValue *v5;
  uint64_t v6;
  HKInspectableValue *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  NSObject *value;
  HKInspectableValue *v13;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  objc_super v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HKInspectableValue;
  v5 = -[HKInspectableValue init](&v19, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ValueTypeKey"));
    v5->_valueType = v6;
    switch(v6)
    {
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
      case 6:
      case 8:
      case 10:
      case 11:
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ValueKey"));
        v11 = objc_claimAutoreleasedReturnValue();
        value = v5->_value;
        v5->_value = v11;

        goto LABEL_6;
      case 5:
        +[HKInspectableValue inspectableValueWithNull](HKInspectableValue, "inspectableValueWithNull");
        v7 = (HKInspectableValue *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 7:
        v8 = (void *)MEMORY[0x1E0C99E60];
        v21[0] = objc_opt_class();
        v21[1] = objc_opt_class();
        v9 = (void *)MEMORY[0x1E0C99D20];
        v10 = v21;
        goto LABEL_13;
      case 9:
        v8 = (void *)MEMORY[0x1E0C99E60];
        v20[0] = objc_opt_class();
        v20[1] = objc_opt_class();
        v9 = (void *)MEMORY[0x1E0C99D20];
        v10 = v20;
LABEL_13:
        objc_msgSend(v9, "arrayWithObjects:count:", v10, 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setWithArray:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("ValueKey"));
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v5->_value;
        v5->_value = v17;

LABEL_6:
        if (v5->_value)
          goto LABEL_7;
        v13 = 0;
        goto LABEL_10;
      default:
LABEL_7:
        -[HKInspectableValue _assertValueType](v5, "_assertValueType");
        break;
    }
  }
  v7 = v5;
LABEL_9:
  v13 = v7;
LABEL_10:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t valueType;
  id v5;

  valueType = self->_valueType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", valueType, CFSTR("ValueTypeKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("ValueKey"));

}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void **v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[HKConceptIndexUtilities firstComponentForKeyPath:error:](HKConceptIndexUtilities, "firstComponentForKeyPath:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    goto LABEL_15;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("dataAbsentReasonCodings")))
  {
    -[HKInspectableValue dataAbsentReasonCodings](self, "dataAbsentReasonCodings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[HKInspectableValue dataAbsentReasonCodings](self, "dataAbsentReasonCodings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKMedicalCodingCollection collectionWithCodings:](HKMedicalCodingCollection, "collectionWithCodings:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v12;
      v13 = (void *)MEMORY[0x1E0C99D20];
      v14 = (void **)v22;
LABEL_8:
      objc_msgSend(v13, "arrayWithObjects:count:", v14, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
    goto LABEL_13;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("medicalCodings")))
  {
    -[HKInspectableValue medicalCodings](self, "medicalCodings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[HKInspectableValue medicalCodings](self, "medicalCodings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKMedicalCodingCollection collectionWithCodings:](HKMedicalCodingCollection, "collectionWithCodings:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v12;
      v13 = (void *)MEMORY[0x1E0C99D20];
      v14 = &v21;
      goto LABEL_8;
    }
LABEL_13:
    v16 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_16;
  }
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("codedValueCollection")))
  {
    +[HKConceptIndexUtilities assignError:forInvalidKeyPath:inClass:](HKConceptIndexUtilities, "assignError:forInvalidKeyPath:inClass:", a4, v6, objc_opt_class());
LABEL_15:
    v16 = 0;
    goto LABEL_16;
  }
  -[HKInspectableValue codedValueCollection](self, "codedValueCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
    goto LABEL_13;
  +[HKConceptIndexUtilities keyPathRemovingFirstComponentFromKeyPath:error:](HKConceptIndexUtilities, "keyPathRemovingFirstComponentFromKeyPath:error:", v6, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[HKInspectableValue codedValueCollection](self, "codedValueCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "codingsForKeyPath:error:", v18, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

LABEL_16:
  return v16;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  HKConcept *v17;
  HKConcept *dataAbsentReason;
  uint64_t v19;
  void *v20;
  _BOOL4 v21;
  HKConcept *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;

  v8 = a3;
  v9 = a4;
  +[HKConceptIndexUtilities firstComponentForKeyPath:error:](HKConceptIndexUtilities, "firstComponentForKeyPath:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_14;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("dataAbsentReasonCodings")))
  {
    v12 = objc_msgSend(v8, "count");
    -[HKInspectableValue dataAbsentReasonCodings](self, "dataAbsentReasonCodings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = HKIndexableObjectCheckCardinalityForIndexRestore(v12, v13 != 0, (uint64_t)v9, (uint64_t)a5);

    if (v14)
    {
      objc_msgSend(v8, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "object");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (HKConcept *)objc_msgSend(v16, "copy");
      dataAbsentReason = self->_dataAbsentReason;
      self->_dataAbsentReason = v17;
LABEL_8:

      v23 = 1;
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("medicalCodings")))
  {
    v19 = objc_msgSend(v8, "count");
    -[HKInspectableValue medicalCodings](self, "medicalCodings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = HKIndexableObjectCheckCardinalityForIndexRestore(v19, v20 != 0, (uint64_t)v9, (uint64_t)a5);

    if (v21)
    {
      objc_msgSend(v8, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "object");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (HKConcept *)objc_msgSend(v16, "copy");
      dataAbsentReason = self->_ontologyConcept;
      self->_ontologyConcept = v22;
      goto LABEL_8;
    }
LABEL_14:
    v23 = 0;
    goto LABEL_15;
  }
  if (!objc_msgSend(v11, "isEqualToString:", CFSTR("codedValueCollection")))
  {
    +[HKConceptIndexUtilities assignError:forInvalidKeyPath:inClass:](HKConceptIndexUtilities, "assignError:forInvalidKeyPath:inClass:", a5, v9, objc_opt_class());
    goto LABEL_14;
  }
  +[HKConceptIndexUtilities keyPathRemovingFirstComponentFromKeyPath:error:](HKConceptIndexUtilities, "keyPathRemovingFirstComponentFromKeyPath:error:", v9, a5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[HKInspectableValue codedValueCollection](self, "codedValueCollection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[HKInspectableValue codedValueCollection](self, "codedValueCollection");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v26, "applyConcepts:forKeyPath:error:", v8, v24, a5);

    }
    else
    {
      v23 = HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 0, (uint64_t)v9, (uint64_t)a5);
    }
  }
  else
  {
    v23 = 0;
  }

LABEL_15:
  return v23;
}

- (int64_t)valueType
{
  return self->_valueType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataAbsentReason, 0);
  objc_storeStrong((id *)&self->_ontologyConcept, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
