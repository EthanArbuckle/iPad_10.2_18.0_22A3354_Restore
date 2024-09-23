@implementation INHomeAttributeValue

- (INHomeAttributeValue)initWithBoolValue:(BOOL)a3
{
  INHomeAttributeValue *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INHomeAttributeValue;
  result = -[INHomeAttributeValue init](&v5, sel_init);
  if (result)
  {
    result->_BOOLValue = a3;
    result->_type = 1;
  }
  return result;
}

- (INHomeAttributeValue)initWithDoubleValue:(double)a3 unit:(int64_t)a4
{
  INHomeAttributeValue *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)INHomeAttributeValue;
  result = -[INHomeAttributeValue init](&v7, sel_init);
  if (result)
  {
    result->_doubleValue = a3;
    result->_type = 2;
    result->_unit = a4;
  }
  return result;
}

- (INHomeAttributeValue)initWithIntegerValue:(int64_t)a3 unit:(int64_t)a4
{
  INHomeAttributeValue *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)INHomeAttributeValue;
  result = -[INHomeAttributeValue init](&v7, sel_init);
  if (result)
  {
    result->_integerValue = a3;
    result->_type = 4;
    result->_unit = a4;
  }
  return result;
}

- (INHomeAttributeValue)initWithStringValue:(id)a3 unit:(int64_t)a4
{
  id v6;
  INHomeAttributeValue *v7;
  uint64_t v8;
  NSString *stringValue;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INHomeAttributeValue;
  v7 = -[INHomeAttributeValue init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    stringValue = v7->_stringValue;
    v7->_stringValue = (NSString *)v8;

    v7->_type = 3;
    v7->_unit = a4;
  }

  return v7;
}

- (INHomeAttributeValue)initWithLimitValue:(int64_t)a3
{
  INHomeAttributeValue *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INHomeAttributeValue;
  result = -[INHomeAttributeValue init](&v5, sel_init);
  if (result)
  {
    result->_limitValue = a3;
    result->_type = 5;
  }
  return result;
}

- (INHomeAttributeValue)initWithRangeValue:(id)a3
{
  id v5;
  INHomeAttributeValue *v6;
  INHomeAttributeValue *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INHomeAttributeValue;
  v6 = -[INHomeAttributeValue init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rangeValue, a3);
    v7->_type = 6;
  }

  return v7;
}

- (INHomeAttributeValue)initWithType:(int64_t)a3 BOOLValue:(BOOL)a4 doubleValue:(double)a5 integerValue:(int64_t)a6 stringValue:(id)a7 limitValue:(int64_t)a8 unit:(int64_t)a9 rangeValue:(id)a10
{
  id v17;
  id v18;
  INHomeAttributeValue *v19;
  INHomeAttributeValue *v20;
  uint64_t v21;
  NSString *stringValue;
  objc_super v24;

  v17 = a7;
  v18 = a10;
  v24.receiver = self;
  v24.super_class = (Class)INHomeAttributeValue;
  v19 = -[INHomeAttributeValue init](&v24, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_type = a3;
    v19->_BOOLValue = a4;
    v19->_doubleValue = a5;
    v19->_integerValue = a6;
    v21 = objc_msgSend(v17, "copy");
    stringValue = v20->_stringValue;
    v20->_stringValue = (NSString *)v21;

    v20->_limitValue = a8;
    v20->_unit = a9;
    objc_storeStrong((id *)&v20->_rangeValue, a10);
  }

  return v20;
}

- (unint64_t)hash
{
  unint64_t doubleValue;
  int64_t v3;

  doubleValue = (unint64_t)self->_doubleValue;
  v3 = self->_type ^ self->_BOOLValue ^ self->_integerValue;
  return v3 ^ -[NSString hash](self->_stringValue, "hash") ^ self->_limitValue ^ self->_unit ^ doubleValue;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  NSString *stringValue;
  INHomeAttributeRange *rangeValue;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = v5;
    v9 = 0;
    if (self->_type == v5[2]
      && self->_BOOLValue == *((unsigned __int8 *)v5 + 8)
      && self->_doubleValue == *((double *)v5 + 3)
      && self->_integerValue == v5[4])
    {
      stringValue = self->_stringValue;
      if ((stringValue == (NSString *)v6[5] || -[NSString isEqual:](stringValue, "isEqual:"))
        && self->_limitValue == v6[6]
        && self->_unit == v6[7])
      {
        rangeValue = self->_rangeValue;
        if (rangeValue == (INHomeAttributeRange *)v6[8] || -[INHomeAttributeRange isEqual:](rangeValue, "isEqual:"))
          v9 = 1;
      }
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (INHomeAttributeValue)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  INHomeAttributeValue *v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("BOOLValue"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("doubleValue"));
  v8 = v7;
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("integerValue"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stringValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("limitValue"));
  v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("unit"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rangeValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[INHomeAttributeValue initWithType:BOOLValue:doubleValue:integerValue:stringValue:limitValue:unit:rangeValue:](self, "initWithType:BOOLValue:doubleValue:integerValue:stringValue:limitValue:unit:rangeValue:", v5, v6, v9, v10, v11, v12, v8, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_BOOLValue, CFSTR("BOOLValue"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("doubleValue"), self->_doubleValue);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("integerValue"), (double)self->_integerValue);
  objc_msgSend(v5, "encodeObject:forKey:", self->_stringValue, CFSTR("stringValue"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_limitValue, CFSTR("limitValue"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_unit, CFSTR("unit"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rangeValue, CFSTR("rangeValue"));

}

- (int64_t)type
{
  return self->_type;
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

- (int64_t)limitValue
{
  return self->_limitValue;
}

- (int64_t)unit
{
  return self->_unit;
}

- (INHomeAttributeRange)rangeValue
{
  return self->_rangeValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rangeValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
