@implementation _INPBDoubleValue

- (void)setValue:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_value = a3;
}

- (BOOL)hasValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
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
  return _INPBDoubleValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_INPBDoubleValue hasValue](self, "hasValue"))
    PBDataWriterWriteDoubleField();
  -[_INPBDoubleValue valueMetadata](self, "valueMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4)
  {
    -[_INPBDoubleValue valueMetadata](self, "valueMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }

}

- (_INPBDoubleValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBDoubleValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBDoubleValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBDoubleValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBDoubleValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBDoubleValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBDoubleValue *v5;
  id v6;

  v5 = -[_INPBDoubleValue init](+[_INPBDoubleValue allocWithZone:](_INPBDoubleValue, "allocWithZone:"), "init");
  if (-[_INPBDoubleValue hasValue](self, "hasValue"))
  {
    -[_INPBDoubleValue value](self, "value");
    -[_INPBDoubleValue setValue:](v5, "setValue:");
  }
  v6 = -[_INPBValueMetadata copyWithZone:](self->_valueMetadata, "copyWithZone:", a3);
  -[_INPBDoubleValue setValueMetadata:](v5, "setValueMetadata:", v6);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  double value;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[_INPBDoubleValue hasValue](self, "hasValue");
    if (v5 == objc_msgSend(v4, "hasValue"))
    {
      if (!-[_INPBDoubleValue hasValue](self, "hasValue")
        || !objc_msgSend(v4, "hasValue")
        || (value = self->_value, objc_msgSend(v4, "value"), value == v7))
      {
        -[_INPBDoubleValue valueMetadata](self, "valueMetadata");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "valueMetadata");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if ((v8 == 0) != (v9 != 0))
        {
          -[_INPBDoubleValue valueMetadata](self, "valueMetadata");
          v11 = objc_claimAutoreleasedReturnValue();
          if (!v11)
          {

LABEL_14:
            v16 = 1;
            goto LABEL_12;
          }
          v12 = (void *)v11;
          -[_INPBDoubleValue valueMetadata](self, "valueMetadata");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "valueMetadata");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isEqual:", v14);

          if ((v15 & 1) != 0)
            goto LABEL_14;
        }
        else
        {

        }
      }
    }
  }
  v16 = 0;
LABEL_12:

  return v16;
}

- (unint64_t)hash
{
  double value;
  double v4;
  long double v5;
  double v6;
  unint64_t v7;

  if (-[_INPBDoubleValue hasValue](self, "hasValue"))
  {
    value = self->_value;
    v4 = -value;
    if (value >= 0.0)
      v4 = self->_value;
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
  return -[_INPBValueMetadata hash](self->_valueMetadata, "hash") ^ v7;
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
  if (-[_INPBDoubleValue hasValue](self, "hasValue"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[_INPBDoubleValue value](self, "value");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("value"));

  }
  -[_INPBDoubleValue valueMetadata](self, "valueMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("valueMetadata"));

  return v3;
}

- (double)value
{
  return self->_value;
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
