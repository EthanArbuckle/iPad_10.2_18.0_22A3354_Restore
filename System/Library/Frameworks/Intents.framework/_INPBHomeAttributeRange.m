@implementation _INPBHomeAttributeRange

- (void)setLowerValue:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_lowerValue = a3;
}

- (BOOL)hasLowerValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasLowerValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setUpperValue:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_upperValue = a3;
}

- (BOOL)hasUpperValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasUpperValue:(BOOL)a3
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
  return _INPBHomeAttributeRangeReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_INPBHomeAttributeRange hasLowerValue](self, "hasLowerValue"))
    PBDataWriterWriteDoubleField();
  if (-[_INPBHomeAttributeRange hasUpperValue](self, "hasUpperValue"))
    PBDataWriterWriteDoubleField();

}

- (_INPBHomeAttributeRange)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBHomeAttributeRange *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBHomeAttributeRange *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBHomeAttributeRange *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBHomeAttributeRange initWithData:](self, "initWithData:", v6);

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
  -[_INPBHomeAttributeRange data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBHomeAttributeRange *v4;

  v4 = -[_INPBHomeAttributeRange init](+[_INPBHomeAttributeRange allocWithZone:](_INPBHomeAttributeRange, "allocWithZone:", a3), "init");
  if (-[_INPBHomeAttributeRange hasLowerValue](self, "hasLowerValue"))
  {
    -[_INPBHomeAttributeRange lowerValue](self, "lowerValue");
    -[_INPBHomeAttributeRange setLowerValue:](v4, "setLowerValue:");
  }
  if (-[_INPBHomeAttributeRange hasUpperValue](self, "hasUpperValue"))
  {
    -[_INPBHomeAttributeRange upperValue](self, "upperValue");
    -[_INPBHomeAttributeRange setUpperValue:](v4, "setUpperValue:");
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  double lowerValue;
  double v7;
  int v8;
  BOOL v9;
  double upperValue;
  double v12;

  v4 = a3;
  v9 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[_INPBHomeAttributeRange hasLowerValue](self, "hasLowerValue");
    if (v5 == objc_msgSend(v4, "hasLowerValue"))
    {
      if (!-[_INPBHomeAttributeRange hasLowerValue](self, "hasLowerValue")
        || !objc_msgSend(v4, "hasLowerValue")
        || (lowerValue = self->_lowerValue, objc_msgSend(v4, "lowerValue"), lowerValue == v7))
      {
        v8 = -[_INPBHomeAttributeRange hasUpperValue](self, "hasUpperValue");
        if (v8 == objc_msgSend(v4, "hasUpperValue"))
        {
          if (!-[_INPBHomeAttributeRange hasUpperValue](self, "hasUpperValue")
            || !objc_msgSend(v4, "hasUpperValue")
            || (upperValue = self->_upperValue, objc_msgSend(v4, "upperValue"), upperValue == v12))
          {
            v9 = 1;
          }
        }
      }
    }
  }

  return v9;
}

- (unint64_t)hash
{
  double lowerValue;
  double v4;
  long double v5;
  double v6;
  unint64_t v7;
  double upperValue;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;

  if (-[_INPBHomeAttributeRange hasLowerValue](self, "hasLowerValue"))
  {
    lowerValue = self->_lowerValue;
    v4 = -lowerValue;
    if (lowerValue >= 0.0)
      v4 = self->_lowerValue;
    v5 = floor(v4 + 0.5);
    v6 = (v4 - v5) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
    if (v6 >= 0.0)
    {
      if (v6 > 0.0)
        v7 += (unint64_t)v6;
    }
    else
    {
      v7 -= (unint64_t)fabs(v6);
    }
  }
  else
  {
    v7 = 0;
  }
  if (-[_INPBHomeAttributeRange hasUpperValue](self, "hasUpperValue"))
  {
    upperValue = self->_upperValue;
    v9 = -upperValue;
    if (upperValue >= 0.0)
      v9 = self->_upperValue;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v12 += (unint64_t)v11;
    }
    else
    {
      v12 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    v12 = 0;
  }
  return v12 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBHomeAttributeRange hasLowerValue](self, "hasLowerValue"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[_INPBHomeAttributeRange lowerValue](self, "lowerValue");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("lowerValue"));

  }
  if (-[_INPBHomeAttributeRange hasUpperValue](self, "hasUpperValue"))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[_INPBHomeAttributeRange upperValue](self, "upperValue");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("upperValue"));

  }
  return v3;
}

- (double)lowerValue
{
  return self->_lowerValue;
}

- (double)upperValue
{
  return self->_upperValue;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
