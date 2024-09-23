@implementation _INPBNumericSettingValue

- (void)setUnit:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_unit = a3;
  }
}

- (BOOL)hasUnit
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasUnit:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)unitAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
  {
    v3 = CFSTR("PERCENTAGE");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsUnit:(id)a3
{
  objc_msgSend(a3, "isEqualToString:", CFSTR("PERCENTAGE"));
  return 1;
}

- (void)setValue:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_value = a3;
}

- (BOOL)hasValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBNumericSettingValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_INPBNumericSettingValue hasUnit](self, "hasUnit"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBNumericSettingValue hasValue](self, "hasValue"))
    PBDataWriterWriteDoubleField();

}

- (_INPBNumericSettingValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBNumericSettingValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBNumericSettingValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBNumericSettingValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBNumericSettingValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBNumericSettingValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBNumericSettingValue *v4;

  v4 = -[_INPBNumericSettingValue init](+[_INPBNumericSettingValue allocWithZone:](_INPBNumericSettingValue, "allocWithZone:", a3), "init");
  if (-[_INPBNumericSettingValue hasUnit](self, "hasUnit"))
    -[_INPBNumericSettingValue setUnit:](v4, "setUnit:", -[_INPBNumericSettingValue unit](self, "unit"));
  if (-[_INPBNumericSettingValue hasValue](self, "hasValue"))
  {
    -[_INPBNumericSettingValue value](self, "value");
    -[_INPBNumericSettingValue setValue:](v4, "setValue:");
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int unit;
  int v7;
  BOOL v8;
  double value;
  double v11;

  v4 = a3;
  v8 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[_INPBNumericSettingValue hasUnit](self, "hasUnit");
    if (v5 == objc_msgSend(v4, "hasUnit"))
    {
      if (!-[_INPBNumericSettingValue hasUnit](self, "hasUnit")
        || !objc_msgSend(v4, "hasUnit")
        || (unit = self->_unit, unit == objc_msgSend(v4, "unit")))
      {
        v7 = -[_INPBNumericSettingValue hasValue](self, "hasValue");
        if (v7 == objc_msgSend(v4, "hasValue"))
        {
          if (!-[_INPBNumericSettingValue hasValue](self, "hasValue")
            || !objc_msgSend(v4, "hasValue")
            || (value = self->_value, objc_msgSend(v4, "value"), value == v11))
          {
            v8 = 1;
          }
        }
      }
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  double value;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;

  if (-[_INPBNumericSettingValue hasUnit](self, "hasUnit"))
    v3 = 2654435761 * self->_unit;
  else
    v3 = 0;
  if (-[_INPBNumericSettingValue hasValue](self, "hasValue"))
  {
    value = self->_value;
    v5 = -value;
    if (value >= 0.0)
      v5 = self->_value;
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
  return v8 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBNumericSettingValue hasUnit](self, "hasUnit"))
  {
    v4 = -[_INPBNumericSettingValue unit](self, "unit");
    if ((_DWORD)v4 == 1)
    {
      v5 = CFSTR("PERCENTAGE");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("unit"));

  }
  if (-[_INPBNumericSettingValue hasValue](self, "hasValue"))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[_INPBNumericSettingValue value](self, "value");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("value"));

  }
  return v3;
}

- (int)unit
{
  return self->_unit;
}

- (double)value
{
  return self->_value;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
