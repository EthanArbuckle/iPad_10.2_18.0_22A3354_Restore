@implementation _INPBVolumeValue

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
  if (a3 < 0x1D)
    return *(&off_1E2293EA8 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsUnit:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_VOLUME_UNIT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MEGALITER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KILOLITER")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LITER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DECILITER")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CENTILITER")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MILLILITER")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUBIC_KILOMETER")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUBIC_DECIMETER")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUBIC_MILLIMETER")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUBIC_INCH")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUBIC_FEET")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUBIC_YARD")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUBIC_MILE")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACRE_FOEET")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUSHEL")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TEASPOON")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TABLESPOON")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLUID_OUNCE")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUP")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PINT")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QUART")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GALLON")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IMPERIAL_TEASPOON")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IMPERIAL_QUART")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IMPERIAL_GALLON")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("METRIC_CUP")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUBIC_CENTIMETER")) & 1) != 0)
  {
    v4 = 27;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CUBIC_METER")))
  {
    v4 = 28;
  }
  else
  {
    v4 = 0;
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
  return _INPBVolumeValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_INPBVolumeValue hasMagnitude](self, "hasMagnitude"))
    PBDataWriterWriteDoubleField();
  if (-[_INPBVolumeValue hasUnit](self, "hasUnit"))
    PBDataWriterWriteInt32Field();
  -[_INPBVolumeValue valueMetadata](self, "valueMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4)
  {
    -[_INPBVolumeValue valueMetadata](self, "valueMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }

}

- (_INPBVolumeValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBVolumeValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBVolumeValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBVolumeValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBVolumeValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBVolumeValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBVolumeValue *v5;
  id v6;

  v5 = -[_INPBVolumeValue init](+[_INPBVolumeValue allocWithZone:](_INPBVolumeValue, "allocWithZone:"), "init");
  if (-[_INPBVolumeValue hasMagnitude](self, "hasMagnitude"))
  {
    -[_INPBVolumeValue magnitude](self, "magnitude");
    -[_INPBVolumeValue setMagnitude:](v5, "setMagnitude:");
  }
  if (-[_INPBVolumeValue hasUnit](self, "hasUnit"))
    -[_INPBVolumeValue setUnit:](v5, "setUnit:", -[_INPBVolumeValue unit](self, "unit"));
  v6 = -[_INPBValueMetadata copyWithZone:](self->_valueMetadata, "copyWithZone:", a3);
  -[_INPBVolumeValue setValueMetadata:](v5, "setValueMetadata:", v6);

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
    v5 = -[_INPBVolumeValue hasMagnitude](self, "hasMagnitude");
    if (v5 == objc_msgSend(v4, "hasMagnitude"))
    {
      if (!-[_INPBVolumeValue hasMagnitude](self, "hasMagnitude")
        || !objc_msgSend(v4, "hasMagnitude")
        || (magnitude = self->_magnitude, objc_msgSend(v4, "magnitude"), magnitude == v7))
      {
        v8 = -[_INPBVolumeValue hasUnit](self, "hasUnit");
        if (v8 == objc_msgSend(v4, "hasUnit"))
        {
          if (!-[_INPBVolumeValue hasUnit](self, "hasUnit")
            || !objc_msgSend(v4, "hasUnit")
            || (unit = self->_unit, unit == objc_msgSend(v4, "unit")))
          {
            -[_INPBVolumeValue valueMetadata](self, "valueMetadata");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "valueMetadata");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v11;
            if ((v10 == 0) != (v11 != 0))
            {
              -[_INPBVolumeValue valueMetadata](self, "valueMetadata");
              v13 = objc_claimAutoreleasedReturnValue();
              if (!v13)
              {

LABEL_18:
                v18 = 1;
                goto LABEL_16;
              }
              v14 = (void *)v13;
              -[_INPBVolumeValue valueMetadata](self, "valueMetadata");
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

  if (-[_INPBVolumeValue hasMagnitude](self, "hasMagnitude"))
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
  if (-[_INPBVolumeValue hasUnit](self, "hasUnit"))
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
  if (-[_INPBVolumeValue hasMagnitude](self, "hasMagnitude"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[_INPBVolumeValue magnitude](self, "magnitude");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("magnitude"));

  }
  if (-[_INPBVolumeValue hasUnit](self, "hasUnit"))
  {
    v6 = -[_INPBVolumeValue unit](self, "unit");
    if (v6 >= 0x1D)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = *(&off_1E2293EA8 + v6);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("unit"));

  }
  -[_INPBVolumeValue valueMetadata](self, "valueMetadata");
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
