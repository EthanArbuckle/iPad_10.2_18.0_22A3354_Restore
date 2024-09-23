@implementation HKCodedQuantity

+ (HKCodedQuantity)codedQuantityWithValue:(id)a3 comparatorCoding:(id)a4 unitCoding:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRawValue:comparatorCoding:unitCoding:", v10, v9, v8);

  return (HKCodedQuantity *)v11;
}

+ (HKCodedQuantity)codedQuantityWithValue:(id)a3 unitCoding:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRawValue:comparatorCoding:unitCoding:", v7, 0, v6);

  return (HKCodedQuantity *)v8;
}

- (HKCodedQuantity)init
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

- (HKCodedQuantity)initWithRawValue:(id)a3 comparatorCoding:(id)a4 unitCoding:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKCodedQuantity *v12;
  uint64_t v13;
  NSString *rawValue;
  uint64_t v15;
  HKMedicalCoding *comparatorCoding;
  uint64_t v17;
  HKMedicalCoding *unitCoding;
  void *v20;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCodedQuantity.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rawValue"));

  }
  v21.receiver = self;
  v21.super_class = (Class)HKCodedQuantity;
  v12 = -[HKCodedQuantity init](&v21, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    rawValue = v12->_rawValue;
    v12->_rawValue = (NSString *)v13;

    v15 = objc_msgSend(v10, "copy");
    comparatorCoding = v12->_comparatorCoding;
    v12->_comparatorCoding = (HKMedicalCoding *)v15;

    v17 = objc_msgSend(v11, "copy");
    unitCoding = v12->_unitCoding;
    v12->_unitCoding = (HKMedicalCoding *)v17;

  }
  return v12;
}

- (double)doubleValue
{
  void *v2;
  double v3;
  double v4;

  -[HKCodedQuantity rawValue](self, "rawValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (NSString)localizedValue
{
  void *v3;
  void *v4;
  void *v5;

  -[HKCodedQuantity numberValue](self, "numberValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "_numberFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromNumber:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HKCodedQuantity rawValue](self, "rawValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v5;
}

- (NSNumber)numberValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[HKCodedQuantity rawValue](self, "rawValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "JSONObjectWithData:options:error:", v4, 4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = v5;
  else
    v6 = 0;

  return (NSNumber *)v6;
}

+ (id)_numberFormatter
{
  if (_numberFormatter_onceToken != -1)
    dispatch_once(&_numberFormatter_onceToken, &__block_literal_global_4);
  return (id)_numberFormatter_numberFormatter;
}

uint64_t __35__HKCodedQuantity__numberFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)_numberFormatter_numberFormatter;
  _numberFormatter_numberFormatter = (uint64_t)v0;

  objc_msgSend((id)_numberFormatter_numberFormatter, "setMaximumSignificantDigits:", 8);
  return objc_msgSend((id)_numberFormatter_numberFormatter, "setRoundingMode:", 6);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodedQuantity rawValue](self, "rawValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodedQuantity comparatorCoding](self, "comparatorCoding");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodedQuantity unitCoding](self, "unitCoding");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p value = %@, comparatorCoding = %@, unitCoding = %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)quantityRepresentationWithUCUMConverter:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  HKMedicalCoding *unitCoding;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HKMedicalCoding *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!self->_comparatorCoding)
  {
    unitCoding = self->_unitCoding;
    if (!unitCoding)
    {
      +[HKUnit _nullUnit](HKUnit, "_nullUnit");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKCodedQuantity doubleValue](self, "doubleValue");
      +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v23);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_23;
    }
    -[HKMedicalCoding displayString](unitCoding, "displayString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicalCoding code](self->_unitCoding, "code");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[HKMedicalCoding codingSystem](self->_unitCoding, "codingSystem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKMedicalCodingSystem UCUMSystem](HKMedicalCodingSystem, "UCUMSystem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (v13)
      {
        if (v6)
        {
          -[HKMedicalCoding code](self->_unitCoding, "code");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "hkUnitNameForUCUMUnitCode:", v14);
          v15 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v15;
          if (v15)
            goto LABEL_20;
          _HKInitializeLogging();
          v16 = (void *)HKLogHealthRecords;
          if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_INFO))
          {
            v17 = self->_unitCoding;
            v18 = v16;
            -[HKMedicalCoding code](v17, "code");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v28 = v19;
            _os_log_impl(&dword_19A0E6000, v18, OS_LOG_TYPE_INFO, "Got a UCUM unit code the UCUM converter doesn't know: \"%{public}@\", buf, 0xCu);

          }
          -[HKMedicalCoding displayString](self->_unitCoding, "displayString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v20)
          {
            v22 = v20;
          }
          else
          {
            -[HKMedicalCoding code](self->_unitCoding, "code");
            v22 = (id)objc_claimAutoreleasedReturnValue();
          }
          v9 = v22;

        }
        else
        {
          _HKInitializeLogging();
          v24 = HKLogHealthRecords;
          if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19A0E6000, v24, OS_LOG_TYPE_INFO, "Got a UCUM unit code but you didn't provide a UCUM code converter. Will prefer unitCoding.displayString to unitCoding.code.", buf, 2u);
          }
          if (v9)
            goto LABEL_20;
          -[HKMedicalCoding code](self->_unitCoding, "code");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    if (!v9)
    {
      v7 = 0;
      goto LABEL_22;
    }
LABEL_20:
    +[HKUnit unitFromString:](HKUnit, "unitFromString:", v9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCodedQuantity doubleValue](self, "doubleValue");
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v25);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Unable to create HKQuantity from a coded quantity that has a comparator: %@"), self);
  v7 = 0;
LABEL_23:

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKCodedQuantity)initWithCoder:(id)a3
{
  id v4;
  HKCodedQuantity *v5;
  uint64_t v6;
  NSString *rawValue;
  uint64_t v8;
  HKMedicalCoding *comparatorCoding;
  uint64_t v10;
  HKMedicalCoding *unitCoding;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKCodedQuantity;
  v5 = -[HKCodedQuantity init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Value"));
    v6 = objc_claimAutoreleasedReturnValue();
    rawValue = v5->_rawValue;
    v5->_rawValue = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ComparatorCoding"));
    v8 = objc_claimAutoreleasedReturnValue();
    comparatorCoding = v5->_comparatorCoding;
    v5->_comparatorCoding = (HKMedicalCoding *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UnitCoding"));
    v10 = objc_claimAutoreleasedReturnValue();
    unitCoding = v5->_unitCoding;
    v5->_unitCoding = (HKMedicalCoding *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *rawValue;
  id v5;

  rawValue = self->_rawValue;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", rawValue, CFSTR("Value"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_comparatorCoding, CFSTR("ComparatorCoding"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_unitCoding, CFSTR("UnitCoding"));

}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_rawValue, "hash");
  v4 = -[HKMedicalCoding hash](self->_comparatorCoding, "hash") ^ v3;
  return v4 ^ -[HKMedicalCoding hash](self->_unitCoding, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HKCodedQuantity *v4;
  HKCodedQuantity *v5;
  NSString *rawValue;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSString *v11;
  void *v12;
  BOOL v13;
  HKMedicalCoding *comparatorCoding;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  HKMedicalCoding *v18;
  void *v19;
  HKMedicalCoding *unitCoding;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  HKMedicalCoding *v24;
  void *v25;

  v4 = (HKCodedQuantity *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      rawValue = self->_rawValue;
      -[HKCodedQuantity rawValue](v5, "rawValue");
      v7 = objc_claimAutoreleasedReturnValue();
      if (rawValue == (NSString *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[HKCodedQuantity rawValue](v5, "rawValue");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_19;
        v10 = (void *)v9;
        v11 = self->_rawValue;
        -[HKCodedQuantity rawValue](v5, "rawValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v11) = -[NSString isEqualToString:](v11, "isEqualToString:", v12);

        if (!(_DWORD)v11)
          goto LABEL_20;
      }
      comparatorCoding = self->_comparatorCoding;
      -[HKCodedQuantity comparatorCoding](v5, "comparatorCoding");
      v15 = objc_claimAutoreleasedReturnValue();
      if (comparatorCoding == (HKMedicalCoding *)v15)
      {

      }
      else
      {
        v8 = (void *)v15;
        -[HKCodedQuantity comparatorCoding](v5, "comparatorCoding");
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
          goto LABEL_19;
        v17 = (void *)v16;
        v18 = self->_comparatorCoding;
        -[HKCodedQuantity comparatorCoding](v5, "comparatorCoding");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v18) = -[HKMedicalCoding isEqual:](v18, "isEqual:", v19);

        if (!(_DWORD)v18)
          goto LABEL_20;
      }
      unitCoding = self->_unitCoding;
      -[HKCodedQuantity unitCoding](v5, "unitCoding");
      v21 = objc_claimAutoreleasedReturnValue();
      if (unitCoding == (HKMedicalCoding *)v21)
      {

LABEL_24:
        v13 = 1;
        goto LABEL_21;
      }
      v8 = (void *)v21;
      -[HKCodedQuantity unitCoding](v5, "unitCoding");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = (void *)v22;
        v24 = self->_unitCoding;
        -[HKCodedQuantity unitCoding](v5, "unitCoding");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v24) = -[HKMedicalCoding isEqual:](v24, "isEqual:", v25);

        if ((v24 & 1) != 0)
          goto LABEL_24;
LABEL_20:
        v13 = 0;
LABEL_21:

        goto LABEL_22;
      }
LABEL_19:

      goto LABEL_20;
    }
    v13 = 0;
  }
LABEL_22:

  return v13;
}

- (NSString)rawValue
{
  return self->_rawValue;
}

- (HKMedicalCoding)comparatorCoding
{
  return self->_comparatorCoding;
}

- (HKMedicalCoding)unitCoding
{
  return self->_unitCoding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitCoding, 0);
  objc_storeStrong((id *)&self->_comparatorCoding, 0);
  objc_storeStrong((id *)&self->_rawValue, 0);
}

@end
