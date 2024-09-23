@implementation HKUserDomainConceptBasicProperty

- (HKUserDomainConceptBasicProperty)init
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

- (HKUserDomainConceptBasicProperty)initWithType:(int64_t)a3 version:(int64_t)a4 timestamp:(double)a5 deleted:(BOOL)a6
{
  void *v7;
  uint64_t v8;
  void *v9;

  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "raise:format:", v8, CFSTR("The -%@ method is not available on %@"), v9, objc_opt_class());

  return 0;
}

- (HKUserDomainConceptBasicProperty)initWithType:(int64_t)a3 version:(int64_t)a4 timestamp:(double)a5 valueType:(int64_t)a6 value:(id)a7
{
  id v13;
  HKUserDomainConceptBasicProperty *v14;
  uint64_t v15;
  NSCopying *value;
  void *v18;
  void *v19;
  objc_super v20;

  v13 = a7;
  if ((HKIsValidUserDomainConceptPropertyValueType(a6, v13) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HKStringFromUserDomainConceptPropertyValueType(a6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKUserDomainConceptBasicProperty.m"), 36, CFSTR("/'%@/' is not a valid type for class /'%@/'"), v19, objc_opt_class());

  }
  v20.receiver = self;
  v20.super_class = (Class)HKUserDomainConceptBasicProperty;
  v14 = -[HKUserDomainConceptProperty initWithType:version:timestamp:deleted:](&v20, sel_initWithType_version_timestamp_deleted_, a3, a4, a6 == 0, a5);
  if (v14)
  {
    v15 = objc_msgSend(v13, "copyWithZone:", 0);
    value = v14->_value;
    v14->_value = (NSCopying *)v15;

    v14->_valueType = a6;
  }

  return v14;
}

- (HKUserDomainConceptBasicProperty)initWithType:(int64_t)a3 version:(int64_t)a4 value:(id)a5
{
  id v8;
  uint64_t v9;
  HKUserDomainConceptBasicProperty *v10;

  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = 5;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = 6;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = 7;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v9 = 0;
          else
            v9 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
    }
  }
  v10 = -[HKUserDomainConceptBasicProperty initWithType:version:timestamp:valueType:value:](self, "initWithType:version:timestamp:valueType:value:", a3, a4, v9, v8, CFAbsoluteTimeGetCurrent());

  return v10;
}

- (HKUserDomainConceptBasicProperty)initWithType:(int64_t)a3 version:(int64_t)a4 integerValue:(int64_t)a5
{
  double Current;
  void *v10;
  HKUserDomainConceptBasicProperty *v11;

  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HKUserDomainConceptBasicProperty initWithType:version:timestamp:valueType:value:](self, "initWithType:version:timestamp:valueType:value:", a3, a4, 3, v10, Current);

  return v11;
}

- (HKUserDomainConceptBasicProperty)initWithType:(int64_t)a3 version:(int64_t)a4 doubleValue:(double)a5
{
  double Current;
  void *v10;
  HKUserDomainConceptBasicProperty *v11;

  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HKUserDomainConceptBasicProperty initWithType:version:timestamp:valueType:value:](self, "initWithType:version:timestamp:valueType:value:", a3, a4, 2, v10, Current);

  return v11;
}

- (HKUserDomainConceptBasicProperty)initWithType:(int64_t)a3 version:(int64_t)a4 BOOLValue:(BOOL)a5
{
  _BOOL8 v5;
  double Current;
  void *v10;
  HKUserDomainConceptBasicProperty *v11;

  v5 = a5;
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HKUserDomainConceptBasicProperty initWithType:version:timestamp:valueType:value:](self, "initWithType:version:timestamp:valueType:value:", a3, a4, 4, v10, Current);

  return v11;
}

+ (id)nullPropertyWithType:(int64_t)a3 version:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithType:version:value:", a3, a4, v7);

  return v8;
}

- (id)valueDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  HKStringFromUserDomainConceptPropertyValueType(self->_valueType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUserDomainConceptBasicProperty _valueDescription](self, "_valueDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("'%@' %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKUserDomainConceptBasicProperty;
  v3 = -[HKUserDomainConceptProperty hash](&v5, sel_hash);
  return -[NSCopying hash](self->_value, "hash") ^ v3 ^ self->_valueType;
}

- (BOOL)isEqual:(id)a3
{
  HKUserDomainConceptBasicProperty *v4;
  HKUserDomainConceptBasicProperty *v5;
  NSCopying *value;
  NSCopying *v7;
  void *v8;
  NSCopying *v9;
  void *v10;
  BOOL v11;
  objc_super v13;

  v4 = (HKUserDomainConceptBasicProperty *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v13.receiver = self;
      v13.super_class = (Class)HKUserDomainConceptBasicProperty;
      if (-[HKUserDomainConceptProperty isEqual:](&v13, sel_isEqual_, v5))
      {
        value = self->_value;
        -[HKUserDomainConceptBasicProperty value](v5, "value");
        v7 = (NSCopying *)objc_claimAutoreleasedReturnValue();
        if (value == v7)
        {
          v11 = self->_valueType == v5->_valueType;
        }
        else
        {
          -[HKUserDomainConceptBasicProperty value](v5, "value");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            v9 = self->_value;
            -[HKUserDomainConceptBasicProperty value](v5, "value");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[NSCopying isEqual:](v9, "isEqual:", v10))
              v11 = self->_valueType == v5->_valueType;
            else
              v11 = 0;

          }
          else
          {
            v11 = 0;
          }

        }
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKUserDomainConceptBasicProperty;
  v4 = a3;
  -[HKUserDomainConceptProperty encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_value, CFSTR("value"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_valueType, CFSTR("valueType"));

}

- (HKUserDomainConceptBasicProperty)initWithCoder:(id)a3
{
  id v4;
  HKUserDomainConceptBasicProperty *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSCopying *value;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKUserDomainConceptBasicProperty;
  v5 = -[HKUserDomainConceptProperty initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("value"));
    v13 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSCopying *)v13;

    v5->_valueType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("valueType"));
  }

  return v5;
}

- (NSString)stringValue
{
  void *v2;
  id v3;
  void *v4;
  NSString *v5;

  -[HKUserDomainConceptBasicProperty value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (NSNumber)numberValue
{
  void *v2;
  id v3;
  void *v4;
  NSNumber *v5;

  -[HKUserDomainConceptBasicProperty value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (NSDate)dateValue
{
  void *v2;
  id v3;
  void *v4;
  NSDate *v5;

  -[HKUserDomainConceptBasicProperty value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (NSUUID)UUIDValue
{
  void *v2;
  id v3;
  void *v4;
  NSUUID *v5;

  -[HKUserDomainConceptBasicProperty value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (NSData)dataValue
{
  void *v2;
  id v3;
  void *v4;
  NSData *v5;

  -[HKUserDomainConceptBasicProperty value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)_valueDescription
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  switch(self->_valueType)
  {
    case 0:
      -[HKUserDomainConceptBasicProperty value](self, "value");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "description");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 1:
      -[HKUserDomainConceptBasicProperty stringValue](self, "stringValue");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v2, "length");
      if (v4 >= 0x50)
        v5 = 80;
      else
        v5 = v4;
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%lu '"), objc_msgSend(v2, "length"));
      objc_msgSend(v2, "substringToIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendString:", v7);

      if (v5 < objc_msgSend(v2, "length"))
        objc_msgSend(v6, "appendString:", CFSTR("..."));
      objc_msgSend(v6, "appendString:", CFSTR("'"));
      goto LABEL_18;
    case 2:
      v8 = (void *)MEMORY[0x1E0CB3940];
      -[HKUserDomainConceptBasicProperty numberValue](self, "numberValue");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "doubleValue");
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%f"), v9);
      goto LABEL_13;
    case 3:
      v10 = (void *)MEMORY[0x1E0CB3940];
      -[HKUserDomainConceptBasicProperty numberValue](self, "numberValue");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v2, "longLongValue"));
      goto LABEL_13;
    case 4:
      -[HKUserDomainConceptBasicProperty numberValue](self, "numberValue");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      HKStringFromBool(objc_msgSend(v2, "BOOLValue"));
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 5:
      -[HKUserDomainConceptBasicProperty dateValue](self, "dateValue");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      HKDiagnosticStringFromDate(v2);
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 6:
      -[HKUserDomainConceptBasicProperty UUIDValue](self, "UUIDValue");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "UUIDString");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 7:
      v11 = (void *)MEMORY[0x1E0CB3940];
      -[HKUserDomainConceptBasicProperty dataValue](self, "dataValue");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("(%lu bytes)"), objc_msgSend(v2, "length"));
LABEL_13:
      v3 = objc_claimAutoreleasedReturnValue();
LABEL_17:
      v6 = (void *)v3;
LABEL_18:

      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

- (NSCopying)value
{
  return self->_value;
}

- (int64_t)valueType
{
  return self->_valueType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
