@implementation _INPBHomeAttributeValue

- (void)setBooleanValue:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_BOOLeanValue = a3;
}

- (BOOL)hasBooleanValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasBooleanValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setDoubleValue:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_doubleValue = a3;
}

- (BOOL)hasDoubleValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setIntegerValue:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_integerValue = a3;
}

- (BOOL)hasIntegerValue
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIntegerValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)setLimitValue:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xF7;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 8;
    self->_limitValue = a3;
  }
}

- (BOOL)hasLimitValue
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasLimitValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (id)limitValueAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("MIN");
  if (a3 == 2)
  {
    v3 = CFSTR("MAX");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsLimitValue:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MIN")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAX")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setRangeValue:(id)a3
{
  objc_storeStrong((id *)&self->_rangeValue, a3);
}

- (BOOL)hasRangeValue
{
  return self->_rangeValue != 0;
}

- (void)setStringValue:(id)a3
{
  NSString *v4;
  NSString *stringValue;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  stringValue = self->_stringValue;
  self->_stringValue = v4;

}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (void)setUnit:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xEF;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 0x10;
    self->_unit = a3;
  }
}

- (BOOL)hasUnit
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasUnit:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (id)unitAsString:(int)a3
{
  if ((a3 - 1) < 5)
    return off_1E228B658[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsUnit:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERCENT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAHRENHEIT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CELSIUS")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LUX")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SECONDS")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setValueType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xDF;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 0x20;
    self->_valueType = a3;
  }
}

- (BOOL)hasValueType
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasValueType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (id)valueTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E228B680[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsValueType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BOOLEAN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DOUBLE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STRING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTEGER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIMIT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RANGE")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBHomeAttributeValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_INPBHomeAttributeValue hasBooleanValue](self, "hasBooleanValue"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBHomeAttributeValue hasDoubleValue](self, "hasDoubleValue"))
    PBDataWriterWriteDoubleField();
  if (-[_INPBHomeAttributeValue hasIntegerValue](self, "hasIntegerValue"))
    PBDataWriterWriteInt64Field();
  if (-[_INPBHomeAttributeValue hasLimitValue](self, "hasLimitValue"))
    PBDataWriterWriteInt32Field();
  -[_INPBHomeAttributeValue rangeValue](self, "rangeValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBHomeAttributeValue rangeValue](self, "rangeValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBHomeAttributeValue stringValue](self, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  if (-[_INPBHomeAttributeValue hasUnit](self, "hasUnit"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBHomeAttributeValue hasValueType](self, "hasValueType"))
    PBDataWriterWriteInt32Field();

}

- (_INPBHomeAttributeValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBHomeAttributeValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBHomeAttributeValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBHomeAttributeValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBHomeAttributeValue initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBHomeAttributeValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBHomeAttributeValue *v5;
  id v6;
  void *v7;

  v5 = -[_INPBHomeAttributeValue init](+[_INPBHomeAttributeValue allocWithZone:](_INPBHomeAttributeValue, "allocWithZone:"), "init");
  if (-[_INPBHomeAttributeValue hasBooleanValue](self, "hasBooleanValue"))
    -[_INPBHomeAttributeValue setBooleanValue:](v5, "setBooleanValue:", -[_INPBHomeAttributeValue BOOLeanValue](self, "BOOLeanValue"));
  if (-[_INPBHomeAttributeValue hasDoubleValue](self, "hasDoubleValue"))
  {
    -[_INPBHomeAttributeValue doubleValue](self, "doubleValue");
    -[_INPBHomeAttributeValue setDoubleValue:](v5, "setDoubleValue:");
  }
  if (-[_INPBHomeAttributeValue hasIntegerValue](self, "hasIntegerValue"))
    -[_INPBHomeAttributeValue setIntegerValue:](v5, "setIntegerValue:", -[_INPBHomeAttributeValue integerValue](self, "integerValue"));
  if (-[_INPBHomeAttributeValue hasLimitValue](self, "hasLimitValue"))
    -[_INPBHomeAttributeValue setLimitValue:](v5, "setLimitValue:", -[_INPBHomeAttributeValue limitValue](self, "limitValue"));
  v6 = -[_INPBHomeAttributeRange copyWithZone:](self->_rangeValue, "copyWithZone:", a3);
  -[_INPBHomeAttributeValue setRangeValue:](v5, "setRangeValue:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_stringValue, "copyWithZone:", a3);
  -[_INPBHomeAttributeValue setStringValue:](v5, "setStringValue:", v7);

  if (-[_INPBHomeAttributeValue hasUnit](self, "hasUnit"))
    -[_INPBHomeAttributeValue setUnit:](v5, "setUnit:", -[_INPBHomeAttributeValue unit](self, "unit"));
  if (-[_INPBHomeAttributeValue hasValueType](self, "hasValueType"))
    -[_INPBHomeAttributeValue setValueType:](v5, "setValueType:", -[_INPBHomeAttributeValue valueType](self, "valueType"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int BOOLeanValue;
  int v7;
  double doubleValue;
  double v9;
  int v10;
  int64_t integerValue;
  int v12;
  int limitValue;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  BOOL v26;
  int v28;
  int unit;
  int v30;
  int valueType;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  v5 = -[_INPBHomeAttributeValue hasBooleanValue](self, "hasBooleanValue");
  if (v5 != objc_msgSend(v4, "hasBooleanValue"))
    goto LABEL_28;
  if (-[_INPBHomeAttributeValue hasBooleanValue](self, "hasBooleanValue"))
  {
    if (objc_msgSend(v4, "hasBooleanValue"))
    {
      BOOLeanValue = self->_BOOLeanValue;
      if (BOOLeanValue != objc_msgSend(v4, "BOOLeanValue"))
        goto LABEL_28;
    }
  }
  v7 = -[_INPBHomeAttributeValue hasDoubleValue](self, "hasDoubleValue");
  if (v7 != objc_msgSend(v4, "hasDoubleValue"))
    goto LABEL_28;
  if (-[_INPBHomeAttributeValue hasDoubleValue](self, "hasDoubleValue"))
  {
    if (objc_msgSend(v4, "hasDoubleValue"))
    {
      doubleValue = self->_doubleValue;
      objc_msgSend(v4, "doubleValue");
      if (doubleValue != v9)
        goto LABEL_28;
    }
  }
  v10 = -[_INPBHomeAttributeValue hasIntegerValue](self, "hasIntegerValue");
  if (v10 != objc_msgSend(v4, "hasIntegerValue"))
    goto LABEL_28;
  if (-[_INPBHomeAttributeValue hasIntegerValue](self, "hasIntegerValue"))
  {
    if (objc_msgSend(v4, "hasIntegerValue"))
    {
      integerValue = self->_integerValue;
      if (integerValue != objc_msgSend(v4, "integerValue"))
        goto LABEL_28;
    }
  }
  v12 = -[_INPBHomeAttributeValue hasLimitValue](self, "hasLimitValue");
  if (v12 != objc_msgSend(v4, "hasLimitValue"))
    goto LABEL_28;
  if (-[_INPBHomeAttributeValue hasLimitValue](self, "hasLimitValue"))
  {
    if (objc_msgSend(v4, "hasLimitValue"))
    {
      limitValue = self->_limitValue;
      if (limitValue != objc_msgSend(v4, "limitValue"))
        goto LABEL_28;
    }
  }
  -[_INPBHomeAttributeValue rangeValue](self, "rangeValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rangeValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14 == 0) == (v15 != 0))
    goto LABEL_27;
  -[_INPBHomeAttributeValue rangeValue](self, "rangeValue");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[_INPBHomeAttributeValue rangeValue](self, "rangeValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rangeValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if (!v20)
      goto LABEL_28;
  }
  else
  {

  }
  -[_INPBHomeAttributeValue stringValue](self, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14 == 0) == (v15 != 0))
  {
LABEL_27:

    goto LABEL_28;
  }
  -[_INPBHomeAttributeValue stringValue](self, "stringValue");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    -[_INPBHomeAttributeValue stringValue](self, "stringValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if (!v25)
      goto LABEL_28;
  }
  else
  {

  }
  v28 = -[_INPBHomeAttributeValue hasUnit](self, "hasUnit");
  if (v28 == objc_msgSend(v4, "hasUnit"))
  {
    if (!-[_INPBHomeAttributeValue hasUnit](self, "hasUnit")
      || !objc_msgSend(v4, "hasUnit")
      || (unit = self->_unit, unit == objc_msgSend(v4, "unit")))
    {
      v30 = -[_INPBHomeAttributeValue hasValueType](self, "hasValueType");
      if (v30 == objc_msgSend(v4, "hasValueType"))
      {
        if (!-[_INPBHomeAttributeValue hasValueType](self, "hasValueType")
          || !objc_msgSend(v4, "hasValueType")
          || (valueType = self->_valueType, valueType == objc_msgSend(v4, "valueType")))
        {
          v26 = 1;
          goto LABEL_29;
        }
      }
    }
  }
LABEL_28:
  v26 = 0;
LABEL_29:

  return v26;
}

- (unint64_t)hash
{
  uint64_t v3;
  double doubleValue;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;

  if (-[_INPBHomeAttributeValue hasBooleanValue](self, "hasBooleanValue"))
    v3 = 2654435761 * self->_BOOLeanValue;
  else
    v3 = 0;
  if (-[_INPBHomeAttributeValue hasDoubleValue](self, "hasDoubleValue"))
  {
    doubleValue = self->_doubleValue;
    v5 = -doubleValue;
    if (doubleValue >= 0.0)
      v5 = self->_doubleValue;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v8 += (unint64_t)v7;
    }
    else
    {
      v8 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v8 = 0;
  }
  if (-[_INPBHomeAttributeValue hasIntegerValue](self, "hasIntegerValue"))
    v9 = 2654435761 * self->_integerValue;
  else
    v9 = 0;
  if (-[_INPBHomeAttributeValue hasLimitValue](self, "hasLimitValue"))
    v10 = 2654435761 * self->_limitValue;
  else
    v10 = 0;
  v11 = -[_INPBHomeAttributeRange hash](self->_rangeValue, "hash");
  v12 = -[NSString hash](self->_stringValue, "hash");
  if (-[_INPBHomeAttributeValue hasUnit](self, "hasUnit"))
    v13 = 2654435761 * self->_unit;
  else
    v13 = 0;
  if (-[_INPBHomeAttributeValue hasValueType](self, "hasValueType"))
    v14 = 2654435761 * self->_valueType;
  else
    v14 = 0;
  return v8 ^ v3 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  uint64_t v16;
  __CFString *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBHomeAttributeValue hasBooleanValue](self, "hasBooleanValue"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBHomeAttributeValue BOOLeanValue](self, "BOOLeanValue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("BOOLeanValue"));

  }
  if (-[_INPBHomeAttributeValue hasDoubleValue](self, "hasDoubleValue"))
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[_INPBHomeAttributeValue doubleValue](self, "doubleValue");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("doubleValue"));

  }
  if (-[_INPBHomeAttributeValue hasIntegerValue](self, "hasIntegerValue"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[_INPBHomeAttributeValue integerValue](self, "integerValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("integerValue"));

  }
  if (-[_INPBHomeAttributeValue hasLimitValue](self, "hasLimitValue"))
  {
    v8 = -[_INPBHomeAttributeValue limitValue](self, "limitValue");
    if ((_DWORD)v8 == 1)
    {
      v9 = CFSTR("MIN");
    }
    else if ((_DWORD)v8 == 2)
    {
      v9 = CFSTR("MAX");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("limitValue"));

  }
  -[_INPBHomeAttributeValue rangeValue](self, "rangeValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("rangeValue"));

  if (self->_stringValue)
  {
    -[_INPBHomeAttributeValue stringValue](self, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("stringValue"));

  }
  if (-[_INPBHomeAttributeValue hasUnit](self, "hasUnit"))
  {
    v14 = -[_INPBHomeAttributeValue unit](self, "unit");
    if ((v14 - 1) >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E228B658[(v14 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("unit"));

  }
  if (-[_INPBHomeAttributeValue hasValueType](self, "hasValueType"))
  {
    v16 = -[_INPBHomeAttributeValue valueType](self, "valueType");
    if (v16 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v16);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E228B680[v16];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("valueType"));

  }
  return v3;
}

- (BOOL)BOOLeanValue
{
  return self->_BOOLeanValue;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (int)limitValue
{
  return self->_limitValue;
}

- (_INPBHomeAttributeRange)rangeValue
{
  return self->_rangeValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (int)unit
{
  return self->_unit;
}

- (int)valueType
{
  return self->_valueType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_rangeValue, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
