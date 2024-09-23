@implementation _INPBTemperatureValue

- (void)setMagnitude:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_magnitude = a3;
}

- (BOOL)hasMagnitude
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasMagnitude:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setUnit:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFD;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 2;
    self->_unit = a3;
  }
}

- (BOOL)hasUnit
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasUnit:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)unitAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return *(&off_1E228BA08 + (a3 - 1));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsUnit:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CELSIUS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAHRENHEIT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("KELVIN")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setValueMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_valueMetadata, a3);
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBTemperatureValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_INPBTemperatureValue hasMagnitude](self, "hasMagnitude"))
    PBDataWriterWriteDoubleField();
  if (-[_INPBTemperatureValue hasUnit](self, "hasUnit"))
    PBDataWriterWriteInt32Field();
  -[_INPBTemperatureValue valueMetadata](self, "valueMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4)
  {
    -[_INPBTemperatureValue valueMetadata](self, "valueMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }

}

- (_INPBTemperatureValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBTemperatureValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBTemperatureValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBTemperatureValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBTemperatureValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBTemperatureValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBTemperatureValue *v5;
  id v6;

  v5 = -[_INPBTemperatureValue init](+[_INPBTemperatureValue allocWithZone:](_INPBTemperatureValue, "allocWithZone:"), "init");
  if (-[_INPBTemperatureValue hasMagnitude](self, "hasMagnitude"))
  {
    -[_INPBTemperatureValue magnitude](self, "magnitude");
    -[_INPBTemperatureValue setMagnitude:](v5, "setMagnitude:");
  }
  if (-[_INPBTemperatureValue hasUnit](self, "hasUnit"))
    -[_INPBTemperatureValue setUnit:](v5, "setUnit:", -[_INPBTemperatureValue unit](self, "unit"));
  v6 = -[_INPBValueMetadata copyWithZone:](self->_valueMetadata, "copyWithZone:", a3);
  -[_INPBTemperatureValue setValueMetadata:](v5, "setValueMetadata:", v6);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  double magnitude;
  double v7;
  int v8;
  int unit;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[_INPBTemperatureValue hasMagnitude](self, "hasMagnitude");
    if (v5 == objc_msgSend(v4, "hasMagnitude"))
    {
      if (!-[_INPBTemperatureValue hasMagnitude](self, "hasMagnitude")
        || !objc_msgSend(v4, "hasMagnitude")
        || (magnitude = self->_magnitude, objc_msgSend(v4, "magnitude"), magnitude == v7))
      {
        v8 = -[_INPBTemperatureValue hasUnit](self, "hasUnit");
        if (v8 == objc_msgSend(v4, "hasUnit"))
        {
          if (!-[_INPBTemperatureValue hasUnit](self, "hasUnit")
            || !objc_msgSend(v4, "hasUnit")
            || (unit = self->_unit, unit == objc_msgSend(v4, "unit")))
          {
            -[_INPBTemperatureValue valueMetadata](self, "valueMetadata");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "valueMetadata");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v11;
            if ((v10 == 0) != (v11 != 0))
            {
              -[_INPBTemperatureValue valueMetadata](self, "valueMetadata");
              v13 = objc_claimAutoreleasedReturnValue();
              if (!v13)
              {

LABEL_18:
                v18 = 1;
                goto LABEL_16;
              }
              v14 = (void *)v13;
              -[_INPBTemperatureValue valueMetadata](self, "valueMetadata");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "valueMetadata");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v15, "isEqual:", v16);

              if ((v17 & 1) != 0)
                goto LABEL_18;
            }
            else
            {

            }
          }
        }
      }
    }
  }
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  double magnitude;
  double v4;
  long double v5;
  double v6;
  unint64_t v7;
  uint64_t v8;

  if (-[_INPBTemperatureValue hasMagnitude](self, "hasMagnitude"))
  {
    magnitude = self->_magnitude;
    v4 = -magnitude;
    if (magnitude >= 0.0)
      v4 = self->_magnitude;
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
  if (-[_INPBTemperatureValue hasUnit](self, "hasUnit"))
    v8 = 2654435761 * self->_unit;
  else
    v8 = 0;
  return v8 ^ v7 ^ -[_INPBValueMetadata hash](self->_valueMetadata, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBTemperatureValue hasMagnitude](self, "hasMagnitude"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[_INPBTemperatureValue magnitude](self, "magnitude");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("magnitude"));

  }
  if (-[_INPBTemperatureValue hasUnit](self, "hasUnit"))
  {
    v6 = -[_INPBTemperatureValue unit](self, "unit");
    if ((v6 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = *(&off_1E228BA08 + (v6 - 1));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("unit"));

  }
  -[_INPBTemperatureValue valueMetadata](self, "valueMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("valueMetadata"));

  return v3;
}

- (double)magnitude
{
  return self->_magnitude;
}

- (int)unit
{
  return self->_unit;
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
