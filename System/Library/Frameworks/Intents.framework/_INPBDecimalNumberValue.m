@implementation _INPBDecimalNumberValue

- (void)setExponent:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_exponent = a3;
}

- (BOOL)hasExponent
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasExponent:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setIsNegative:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isNegative = a3;
}

- (BOOL)hasIsNegative
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsNegative:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setMantissa:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_mantissa = a3;
}

- (BOOL)hasMantissa
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasMantissa:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
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
  return _INPBDecimalNumberValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_INPBDecimalNumberValue hasExponent](self, "hasExponent"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBDecimalNumberValue hasIsNegative](self, "hasIsNegative"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBDecimalNumberValue hasMantissa](self, "hasMantissa"))
    PBDataWriterWriteUint64Field();
  -[_INPBDecimalNumberValue valueMetadata](self, "valueMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4)
  {
    -[_INPBDecimalNumberValue valueMetadata](self, "valueMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }

}

- (_INPBDecimalNumberValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBDecimalNumberValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBDecimalNumberValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBDecimalNumberValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBDecimalNumberValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBDecimalNumberValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBDecimalNumberValue *v5;
  id v6;

  v5 = -[_INPBDecimalNumberValue init](+[_INPBDecimalNumberValue allocWithZone:](_INPBDecimalNumberValue, "allocWithZone:"), "init");
  if (-[_INPBDecimalNumberValue hasExponent](self, "hasExponent"))
    -[_INPBDecimalNumberValue setExponent:](v5, "setExponent:", -[_INPBDecimalNumberValue exponent](self, "exponent"));
  if (-[_INPBDecimalNumberValue hasIsNegative](self, "hasIsNegative"))
    -[_INPBDecimalNumberValue setIsNegative:](v5, "setIsNegative:", -[_INPBDecimalNumberValue isNegative](self, "isNegative"));
  if (-[_INPBDecimalNumberValue hasMantissa](self, "hasMantissa"))
    -[_INPBDecimalNumberValue setMantissa:](v5, "setMantissa:", -[_INPBDecimalNumberValue mantissa](self, "mantissa"));
  v6 = -[_INPBValueMetadata copyWithZone:](self->_valueMetadata, "copyWithZone:", a3);
  -[_INPBDecimalNumberValue setValueMetadata:](v5, "setValueMetadata:", v6);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int exponent;
  int v7;
  int isNegative;
  int v9;
  unint64_t mantissa;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[_INPBDecimalNumberValue hasExponent](self, "hasExponent");
    if (v5 == objc_msgSend(v4, "hasExponent"))
    {
      if (!-[_INPBDecimalNumberValue hasExponent](self, "hasExponent")
        || !objc_msgSend(v4, "hasExponent")
        || (exponent = self->_exponent, exponent == objc_msgSend(v4, "exponent")))
      {
        v7 = -[_INPBDecimalNumberValue hasIsNegative](self, "hasIsNegative");
        if (v7 == objc_msgSend(v4, "hasIsNegative"))
        {
          if (!-[_INPBDecimalNumberValue hasIsNegative](self, "hasIsNegative")
            || !objc_msgSend(v4, "hasIsNegative")
            || (isNegative = self->_isNegative, isNegative == objc_msgSend(v4, "isNegative")))
          {
            v9 = -[_INPBDecimalNumberValue hasMantissa](self, "hasMantissa");
            if (v9 == objc_msgSend(v4, "hasMantissa"))
            {
              if (!-[_INPBDecimalNumberValue hasMantissa](self, "hasMantissa")
                || !objc_msgSend(v4, "hasMantissa")
                || (mantissa = self->_mantissa, mantissa == objc_msgSend(v4, "mantissa")))
              {
                -[_INPBDecimalNumberValue valueMetadata](self, "valueMetadata");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "valueMetadata");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = v12;
                if ((v11 == 0) != (v12 != 0))
                {
                  -[_INPBDecimalNumberValue valueMetadata](self, "valueMetadata");
                  v14 = objc_claimAutoreleasedReturnValue();
                  if (!v14)
                  {

LABEL_22:
                    v19 = 1;
                    goto LABEL_20;
                  }
                  v15 = (void *)v14;
                  -[_INPBDecimalNumberValue valueMetadata](self, "valueMetadata");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "valueMetadata");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v18 = objc_msgSend(v16, "isEqual:", v17);

                  if ((v18 & 1) != 0)
                    goto LABEL_22;
                }
                else
                {

                }
              }
            }
          }
        }
      }
    }
  }
  v19 = 0;
LABEL_20:

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  if (-[_INPBDecimalNumberValue hasExponent](self, "hasExponent"))
    v3 = 2654435761 * self->_exponent;
  else
    v3 = 0;
  if (-[_INPBDecimalNumberValue hasIsNegative](self, "hasIsNegative"))
    v4 = 2654435761 * self->_isNegative;
  else
    v4 = 0;
  if (-[_INPBDecimalNumberValue hasMantissa](self, "hasMantissa"))
    v5 = 2654435761u * self->_mantissa;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[_INPBValueMetadata hash](self->_valueMetadata, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBDecimalNumberValue hasExponent](self, "hasExponent"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_INPBDecimalNumberValue exponent](self, "exponent"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("exponent"));

  }
  if (-[_INPBDecimalNumberValue hasIsNegative](self, "hasIsNegative"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBDecimalNumberValue isNegative](self, "isNegative"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("is_negative"));

  }
  if (-[_INPBDecimalNumberValue hasMantissa](self, "hasMantissa"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_INPBDecimalNumberValue mantissa](self, "mantissa"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("mantissa"));

  }
  -[_INPBDecimalNumberValue valueMetadata](self, "valueMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("valueMetadata"));

  return v3;
}

- (int)exponent
{
  return self->_exponent;
}

- (BOOL)isNegative
{
  return self->_isNegative;
}

- (unint64_t)mantissa
{
  return self->_mantissa;
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
