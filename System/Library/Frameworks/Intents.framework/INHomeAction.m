@implementation INHomeAction

- (INHomeAction)initWithType:(int64_t)a3 BOOLValue:(BOOL)a4
{
  INHomeAction *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)INHomeAction;
  result = -[INHomeAction init](&v7, sel_init);
  if (result)
  {
    result->_BOOLValue = a4;
    result->_type = a3;
    result->_valueType = 1;
  }
  return result;
}

- (INHomeAction)initWithType:(int64_t)a3 doubleValue:(double)a4
{
  INHomeAction *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)INHomeAction;
  result = -[INHomeAction init](&v7, sel_init);
  if (result)
  {
    result->_doubleValue = a4;
    result->_type = a3;
    result->_valueType = 2;
  }
  return result;
}

- (INHomeAction)initWithType:(int64_t)a3 integerValue:(int64_t)a4
{
  INHomeAction *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)INHomeAction;
  result = -[INHomeAction init](&v7, sel_init);
  if (result)
  {
    result->_integerValue = a4;
    result->_type = a3;
    result->_valueType = 4;
  }
  return result;
}

- (INHomeAction)initWithType:(int64_t)a3 stringValue:(id)a4
{
  id v6;
  INHomeAction *v7;
  uint64_t v8;
  NSString *stringValue;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INHomeAction;
  v7 = -[INHomeAction init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    stringValue = v7->_stringValue;
    v7->_stringValue = (NSString *)v8;

    v7->_type = a3;
    v7->_valueType = 3;
  }

  return v7;
}

- (INHomeAction)initWithType:(int64_t)a3 valueType:(int64_t)a4 BOOLValue:(BOOL)a5 doubleValue:(double)a6 integerValue:(int64_t)a7 stringValue:(id)a8
{
  id v14;
  INHomeAction *v15;
  INHomeAction *v16;
  uint64_t v17;
  NSString *stringValue;
  objc_super v20;

  v14 = a8;
  v20.receiver = self;
  v20.super_class = (Class)INHomeAction;
  v15 = -[INHomeAction init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_type = a3;
    v15->_valueType = a4;
    v15->_BOOLValue = a5;
    v15->_doubleValue = a6;
    v15->_integerValue = a7;
    v17 = objc_msgSend(v14, "copy");
    stringValue = v16->_stringValue;
    v16->_stringValue = (NSString *)v17;

  }
  return v16;
}

- (unint64_t)hash
{
  unint64_t doubleValue;
  int64_t v3;

  doubleValue = (unint64_t)self->_doubleValue;
  v3 = self->_valueType ^ self->_type ^ self->_BOOLValue ^ self->_integerValue;
  return v3 ^ -[NSString hash](self->_stringValue, "hash") ^ doubleValue;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  NSString *stringValue;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = v5;
    v8 = 0;
    if (self->_type == v5[2]
      && self->_valueType == v5[3]
      && self->_BOOLValue == *((unsigned __int8 *)v5 + 8)
      && self->_doubleValue == *((double *)v5 + 4)
      && self->_integerValue == v5[5])
    {
      stringValue = self->_stringValue;
      if (stringValue == (NSString *)v6[6] || -[NSString isEqual:](stringValue, "isEqual:"))
        v8 = 1;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (INHomeAction)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  INHomeAction *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("valueType"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("BOOLValue"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("doubleValue"));
  v9 = v8;
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("integerValue"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stringValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[INHomeAction initWithType:valueType:BOOLValue:doubleValue:integerValue:stringValue:](self, "initWithType:valueType:BOOLValue:doubleValue:integerValue:stringValue:", v5, v6, v7, v10, v11, v9);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_valueType, CFSTR("valueType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_BOOLValue, CFSTR("BOOLValue"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("doubleValue"), self->_doubleValue);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("integerValue"), (double)self->_integerValue);
  objc_msgSend(v5, "encodeObject:forKey:", self->_stringValue, CFSTR("stringValue"));

}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)valueType
{
  return self->_valueType;
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
