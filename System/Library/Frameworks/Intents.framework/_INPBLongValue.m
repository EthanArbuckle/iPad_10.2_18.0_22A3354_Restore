@implementation _INPBLongValue

- (void)setValue:(int64_t)a3
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
  return _INPBLongValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_INPBLongValue hasValue](self, "hasValue"))
    PBDataWriterWriteInt64Field();
  -[_INPBLongValue valueMetadata](self, "valueMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4)
  {
    -[_INPBLongValue valueMetadata](self, "valueMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }

}

- (_INPBLongValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBLongValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBLongValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBLongValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBLongValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBLongValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBLongValue *v5;
  id v6;

  v5 = -[_INPBLongValue init](+[_INPBLongValue allocWithZone:](_INPBLongValue, "allocWithZone:"), "init");
  if (-[_INPBLongValue hasValue](self, "hasValue"))
    -[_INPBLongValue setValue:](v5, "setValue:", -[_INPBLongValue value](self, "value"));
  v6 = -[_INPBValueMetadata copyWithZone:](self->_valueMetadata, "copyWithZone:", a3);
  -[_INPBLongValue setValueMetadata:](v5, "setValueMetadata:", v6);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int64_t value;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[_INPBLongValue hasValue](self, "hasValue");
    if (v5 == objc_msgSend(v4, "hasValue"))
    {
      if (!-[_INPBLongValue hasValue](self, "hasValue")
        || !objc_msgSend(v4, "hasValue")
        || (value = self->_value, value == objc_msgSend(v4, "value")))
      {
        -[_INPBLongValue valueMetadata](self, "valueMetadata");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "valueMetadata");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          -[_INPBLongValue valueMetadata](self, "valueMetadata");
          v10 = objc_claimAutoreleasedReturnValue();
          if (!v10)
          {

LABEL_14:
            v15 = 1;
            goto LABEL_12;
          }
          v11 = (void *)v10;
          -[_INPBLongValue valueMetadata](self, "valueMetadata");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "valueMetadata");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if ((v14 & 1) != 0)
            goto LABEL_14;
        }
        else
        {

        }
      }
    }
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;

  if (-[_INPBLongValue hasValue](self, "hasValue"))
    v3 = 2654435761 * self->_value;
  else
    v3 = 0;
  return -[_INPBValueMetadata hash](self->_valueMetadata, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBLongValue hasValue](self, "hasValue"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[_INPBLongValue value](self, "value"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("value"));

  }
  -[_INPBLongValue valueMetadata](self, "valueMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("valueMetadata"));

  return v3;
}

- (int64_t)value
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
