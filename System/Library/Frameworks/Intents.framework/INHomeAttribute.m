@implementation INHomeAttribute

- (INHomeAttribute)initWithType:(int64_t)a3 BOOLValue:(BOOL)a4
{
  INHomeAttribute *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)INHomeAttribute;
  result = -[INHomeAttribute init](&v7, sel_init);
  if (result)
  {
    result->_BOOLValue = a4;
    result->_type = a3;
    result->_valueType = 1;
  }
  return result;
}

- (INHomeAttribute)initWithType:(int64_t)a3 doubleValue:(double)a4
{
  INHomeAttribute *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)INHomeAttribute;
  result = -[INHomeAttribute init](&v7, sel_init);
  if (result)
  {
    result->_doubleValue = a4;
    result->_type = a3;
    result->_valueType = 2;
  }
  return result;
}

- (INHomeAttribute)initWithType:(int64_t)a3 stringValue:(id)a4
{
  id v6;
  INHomeAttribute *v7;
  uint64_t v8;
  NSString *stringValue;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INHomeAttribute;
  v7 = -[INHomeAttribute init](&v11, sel_init);
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

- (INHomeAttribute)initWithType:(int64_t)a3 valueType:(int64_t)a4 BOOLValue:(BOOL)a5 doubleValue:(double)a6 stringValue:(id)a7
{
  id v12;
  INHomeAttribute *v13;
  INHomeAttribute *v14;
  uint64_t v15;
  NSString *stringValue;
  objc_super v18;

  v12 = a7;
  v18.receiver = self;
  v18.super_class = (Class)INHomeAttribute;
  v13 = -[INHomeAttribute init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_type = a3;
    v13->_valueType = a4;
    v13->_BOOLValue = a5;
    v13->_doubleValue = a6;
    v15 = objc_msgSend(v12, "copy");
    stringValue = v14->_stringValue;
    v14->_stringValue = (NSString *)v15;

  }
  return v14;
}

- (unint64_t)hash
{
  int64_t v2;
  unint64_t doubleValue;

  v2 = self->_valueType ^ self->_type ^ self->_BOOLValue;
  doubleValue = (unint64_t)self->_doubleValue;
  return v2 ^ -[NSString hash](self->_stringValue, "hash") ^ doubleValue;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  BOOL v7;
  NSString *stringValue;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = v5;
    v7 = 0;
    if (self->_type == v5[2]
      && self->_valueType == v5[3]
      && self->_BOOLValue == *((unsigned __int8 *)v5 + 8)
      && self->_doubleValue == *((double *)v5 + 4))
    {
      stringValue = self->_stringValue;
      if (stringValue == (NSString *)v6[5] || -[NSString isEqual:](stringValue, "isEqual:"))
        v7 = 1;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (INHomeAttribute)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  INHomeAttribute *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("valueType"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("BOOLValue"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("doubleValue"));
  v9 = v8;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stringValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[INHomeAttribute initWithType:valueType:BOOLValue:doubleValue:stringValue:](self, "initWithType:valueType:BOOLValue:doubleValue:stringValue:", v5, v6, v7, v10, v9);
  return v11;
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
